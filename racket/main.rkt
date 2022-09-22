#lang errortrace racket

(require rosette
         "synthesize.rkt"
         "compile-to-json.rkt"
         "circt-comb-operators.rkt"
         json
         racket/sandbox)

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
(define instruction (make-parameter #f identity))
(define module-name (make-parameter #f identity))
(define json-filepath (make-parameter (make-temporary-file "rkttmp~a.json") identity))
(define out-filepath (make-parameter #f identity))
(define template-timeout
  (make-parameter #f (lambda (to) (if (equal? "0" to) #f (string->number to)))))
(define template (make-parameter #f identity))

(command-line
 #:program "lakeroad"
 #:once-each ["--architecture" arch "Hardware architecture to target." (architecture arch)]
 ["--out-format" fmt "Output format. Supported: 'verilog'" (out-format fmt)]
 ["--json-filepath"
  v
  "JSON file to output to. JSON is our intermediate representation. Defaults to a temporary file; set"
  " this flag if you would like access to the JSON file."
  (json-filepath v)]
 ["--out-filepath"
  v
  "Output filepath, where the output file is in the format requested."
  (out-filepath v)]
 ["--template"
  v
  "Specifies which template to synthesize with. When not set, the synthesis procedure will run"
  " through all relevant templates for the architecture until one works."
  (template v)]
 ["--timeout" timeout "Timeout in seconds for each template" (template-timeout timeout)]
 #:once-any
 #:multi
 [("--instruction")
  v
  "The instruction to synthesize, written in Rosette bitvector semantics. Use (var <name> <bw>) to"
  " indicate a variable. For example, an 8-bit AND is (bvand (var a 8) (var b 8))."
  (instruction v)]
 [("--module-name") v "Name given to the module produced." (module-name v)])

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

;;; Synthesize a Lakeroad implementation of the given bv-expr.
;;;
;;; Returns a Lakeroad expression.
(define (synthesize bv-expr template architecture #:timeout [timeout #f])
  (let ([result
         (with-vc
          (with-terms
           (if (template)
               ;;; If the template is set, use that template explicitly.
               ;;; If it times out, return false.
               (with-handlers ([exn:fail:resource? (lambda (_) #f)])
                 (call-with-limits timeout
                                   #f
                                   (lambda () ((hash-ref (template-map) (template)) bv-expr))))

               ;;; Otherwise, use the helper functions in synthesize.rkt for the specific architecture
               ;;; to attempt multiple templates.
               (match architecture
                 ["xilinx-ultrascale-plus"
                  (synthesize-xilinx-ultrascale-plus-impl bv-expr 'first-to-succeed)]
                 ["lattice-ecp5"
                  (displayln "Hi")
                  (synthesize-lattice-ecp5-impl bv-expr 'first-to-succeed #:timeout timeout)]
                 ["sofa" (synthesize-sofa-impl bv-expr 'first-to-succeed)]
                 [other
                  (error (format
                          "Invalid architecture given (value: ~a). Did you specify --architecture?"
                          other))]))))])
    (when (failed? result)
      (error "Failed: ~a" result))
    (result-value result)))

(define bv-expr (parse-instruction (read (open-input-string (instruction)))))

(define lakeroad-expr (synthesize bv-expr template (architecture) #:timeout (template-timeout)))

(cond
  [(not lakeroad-expr) (error "Synthesis failed.")]

  [else
   (define json-source (lakeroad->jsexpr lakeroad-expr #:module-name (module-name)))
   (display-to-file (jsexpr->string json-source) (json-filepath) #:exists 'replace)

   (match (out-format)
     ["verilog"
      (when (not (with-output-to-string (lambda ()
                                          (system (format "yosys -p 'read_json ~a; write_verilog ~a'"
                                                          (json-filepath)
                                                          (out-filepath))))))
        (error "Converting JSON to Verilog via Yosys failed."))]

     [_ (error "Invalid output format.")])])
