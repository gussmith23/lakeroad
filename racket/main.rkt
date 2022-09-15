#lang rosette/safe

(require rosette
         "synthesize.rkt"
         "compile-to-json.rkt"
         "circt-comb-operators.rkt"
         json)

(define architecture
  (make-parameter ""
                  (lambda (v)
                    (match v
                      [(or "xilinx-ultrascale-plus") v]
                      [(or "lattice-ecp5") v]
                      [(or "sofa") v]
                      [other (error (format "Unsupported architecture ~a." other))]))))
(define out-format
  (make-parameter ""
                  (lambda (v)
                    (match v
                      [(or "verilog") v]
                      [other (error (format "Unsupported output format ~a." other))]))))
(define finish-when
  (make-parameter 'first-to-succeed
                  (lambda (v)
                    (case v
                      [("exhaustive") 'exhaustive]
                      [("first-to-succeed") 'first-to-succeed]
                      [else (error (format "Unsupported finish condition ~a." v))]))))

(define instructions (make-parameter '() (lambda (instr) instr)))
(define module-names (make-parameter '() (lambda (name) name)))
(define json-file-name (make-parameter (make-temporary-file "rkttmp~a.json") (lambda (name) name)))
(define template-timeout
  (make-parameter '() (lambda (to) (if (equal? "0" to) #f (string->number to)))))

(command-line
 #:program "lakeroad"
 #:once-each ["--architecture" arch "Hardware architecture to target." (architecture arch)]
 ["--out-format" fmt "Output format. Supported: 'verilog'" (out-format fmt)]
 ["--json-file" name "JSON file to output to" (json-file-name name)]
 ;;; A better API might be to to default to first-to-succeed, and toggle exhaustive with a flag?
 ["--finish-when" c "Condition to stop synthesis" (finish-when c)]
 ["--timeout" timeout "Timeout in seconds for each template" (template-timeout timeout)]
 #:once-any
 #:multi
 [("--instruction")
  instr
  "The instruction to synthesize, written in Rosette bitvector semantics. Use (var <name> <bw>) to indicate a variable. For example, an 8-bit AND is (bvand (var a 8) (var b 8))."
  (instructions (append (instructions) (list instr)))]
 [("--module-name")
  module-name
  "Name given to the module produced. Each --instruction should be paired with a --module-name."
  (module-names (append (module-names) (list module-name)))])

(when (not (equal? (length (instructions)) (length (module-names))))
  (error "There should be one --module-name per --instruction."))

;;; Parse instruction.
;;;
;;; This function will introduce new symbolic constants. Make sure you have good (vc) hygeine when
;;; calling this function (e.g. by wrapping its invocation with (with-vc)).
;;;
;;; expr The instruction to parse, e.g. '(bvadd (var a 8) (var b 8)).
(define (parse-instruction expr)

  (define (helper expr)
    (match expr
      [`(bvuge ,a ,b) (bvuge (helper a) (helper b))]
      [`(bvule ,a ,b) (bvule (helper a) (helper b))]
      [`(bvult ,a ,b) (bvult (helper a) (helper b))]
      [`(bvugt ,a ,b) (bvugt (helper a) (helper b))]
      [`(not ,a) (not (helper a))]
      [`(bveq ,a ,b) (bveq (helper a) (helper b))]
      [`(bool->bitvector ,a) (bool->bitvector (helper a))]
      [`(bvand ,a ,b) (bvand (helper a) (helper b))]
      [`(bvor ,a ,b) (bvor (helper a) (helper b))]
      [`(bvxor ,a ,b) (bvxor (helper a) (helper b))]
      [`(bvadd ,a ,b) (bvadd (helper a) (helper b))]
      [`(bvsub ,a ,b) (bvsub (helper a) (helper b))]
      [`(bvmul ,a ,b) (bvmul (helper a) (helper b))]
      [`(bvnot ,a) (bvnot (helper a))]
      [`(circt-comb-mux ,s ,a ,b) (circt-comb-mux (helper s) (helper a) (helper b))]
      [`(var ,id ,bw) (constant id (bitvector bw))]))

  (helper expr))

;;; Synthesize a Lakeroad implementation of the given instruction.
;;;
;;; Returns a Lakeroad expression.
(define (synthesize instruction architecture finish-when #:timeout [timeout #f])
  (match architecture
    ["xilinx-ultrascale-plus" (synthesize-xilinx-ultrascale-plus-impl instruction finish-when)]
    ["lattice-ecp5" (synthesize-lattice-ecp5-impl instruction finish-when #:timeout timeout)]
    ["sofa" (synthesize-sofa-impl instruction finish-when)]
    [other
     (error (format "Invalid architecture given (value: ~a). Did you specify --architecture?"
                    other))]))

(for ([instruction (instructions)] [module-name (module-names)])
  (define bv-expr (parse-instruction (read (open-input-string instruction))))
  (define all-exprs
    (match (finish-when)
      ['first-to-succeed
       (list (synthesize bv-expr (architecture) 'first-to-succeed #:timeout (template-timeout)))]
      ['exhaustive (synthesize bv-expr (architecture) 'exhaustive #:timeout (template-timeout))]))

  (for ([i (in-naturals 1)] [lakeroad-expr all-exprs])
    (cond
      [(not lakeroad-expr) (displayln (format "Warning: synthesis routine returned #f"))]

      [else
       ;;; TODO(@gussmith23): Rosette incorrectly accepts (if ... (begin (define x ...) ...) ...). If
       ;;; we switch to Racket, this code will fail. It's probably best to change this away from using
       ;;; defines.
       (define json-source
         (lakeroad->jsexpr lakeroad-expr #:module-name (format "~a_~a" module-name i)))

       (match (out-format)
         ["verilog"
          (define json-file (json-file-name))
          (define verilog-file (make-temporary-file "rkttmp~a.v"))
          (display-to-file (jsexpr->string json-source) json-file #:exists 'replace)
          (when (not (with-output-to-string
                      (lambda ()
                        (system (format "yosys -p 'read_json ~a; write_verilog ~a'"
                                        json-file
                                        verilog-file)))))
            (error "Converting JSON to Verilog via Yosys failed."))

          ;;; TODO(@gussmith23): Support returning multiple files.
          (displayln (file->string verilog-file))])])
    (displayln ""))

  ;;; Clean up the VC and un-bind the symbolic terms created for this instruction.
  (clear-vc!)
  (clear-terms! (symbolics bv-expr)))
