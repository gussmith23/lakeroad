#!/usr/bin/env racket
#lang racket/base

(require rosette
         "../racket/synthesize.rkt"
         "../racket/compile-to-json.rkt"
         "../racket/circt-comb-operators.rkt"
         "../racket/sketches.rkt"
         "../racket/architecture-description.rkt"
         json
         racket/sandbox
         "../racket/lattice-ecp5-lut4.rkt"
         "../racket/lattice-ecp5-ccu2c.rkt"
         "../racket/xilinx-ultrascale-plus-lut2.rkt"
         "../racket/xilinx-ultrascale-plus-lut6.rkt"
         "../racket/xilinx-ultrascale-plus-carry8.rkt"
         "../racket/sofa-frac-lut4.rkt"
         rosette/solver/smt/boolector)

(current-solver (boolector))

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

(when (not (out-filepath))
  (error "Must specify --out-filepath."))

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

(define sketch-generator
  (match (template)
    ["bitwise" bitwise-sketch-generator]
    ["bitwise-with-carry" bitwise-with-carry-sketch-generator]
    ["comparison" comparison-sketch-generator]
    ["multiplication" multiplication-sketch-generator]
    [else (error "Missing or invalid template.")]))

(define architecture-description
  (match (architecture)
    ["xilinx-ultrascale-plus"
     (list (cons (cons "LUT2" "../verilator_xilinx/LUT2.v") xilinx-ultrascale-plus-lut2)
           (cons (cons "LUT6" "../verilator_xilinx/LUT6.v") xilinx-ultrascale-plus-lut6)
           (cons (cons "CARRY8" "../verilator_xilinx/CARRY8.v") xilinx-ultrascale-plus-carry8))]
    ["lattice-ecp5" (lattice-ecp5-architecture-description)]
    ["sofa"
     (list (cons (cons "frac_lut4" "../modules_for_importing/SOFA/frac_lut4.v") sofa-frac-lut4))]
    [other
     (error (format "Invalid architecture given (value: ~a). Did you specify --architecture?"
                    other))]))

(define bv-expr (parse-instruction (read (open-input-string (instruction)))))

(define module-semantics
  (match (architecture)
    ["xilinx-ultrascale-plus" (xilinx-ultrascale-plus-architecture-description)]
    ["lattice-ecp5"
     (list (cons (cons "LUT4" "../f4pga-arch-defs/ecp5/primitives/slice/LUT4.v") lattice-ecp5-lut4)
           (cons (cons "CCU2C" "../f4pga-arch-defs/ecp5/primitives/slice/CCU2C.v")
                 lattice-ecp5-ccu2c))]
    ["sofa" (sofa-architecture-description)]
    [other
     (error (format "Invalid architecture given (value: ~a). Did you specify --architecture?"
                    other))]))

(define lakeroad-expr
  (synthesize-with-sketch sketch-generator
                          architecture-description
                          bv-expr
                          #:module-semantics module-semantics))

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
