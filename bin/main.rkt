#!/usr/bin/env racket
#lang racket/base

(require rosette
         "../racket/synthesize.rkt"
         "../racket/compile-to-json.rkt"
         "../racket/circt-comb-operators.rkt"
         "../racket/sketches.rkt"
         "../racket/architecture-description.rkt"
         json
         "../racket/generated/lattice-ecp5-lut4.rkt"
         "../racket/generated/lattice-ecp5-ccu2c.rkt"
         "../racket/xilinx-ultrascale-plus-lut2.rkt"
         "../racket/generated/xilinx-ultrascale-plus-lut6.rkt"
         "../racket/generated/xilinx-ultrascale-plus-carry8.rkt"
         "../racket/generated/xilinx-ultrascale-plus-dsp48e2.rkt"
         "../racket/generated/sofa-frac-lut4.rkt"
         "../racket/generated/lattice-ecp5-mult18x18d.rkt"
         "../racket/generated/lattice-ecp5-alu24b.rkt"
         rosette/solver/smt/boolector
         "../racket/signal.rkt"
         racket/hash
         "../racket/btor.rkt")

(define-namespace-anchor anc)

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
(define output-port
  (make-parameter (current-output-port) (lambda (v) (open-output-file v #:exists 'replace))))
(define template-timeout
  (make-parameter #f (lambda (to) (if (equal? "0" to) #f (string->number to)))))
(define template (make-parameter #f identity))
(define verilog-module-filepath (make-parameter #f))
(define top-module-name (make-parameter #f))
(define verilog-module-out-signal (make-parameter #f))
(define initiation-interval (make-parameter #f))
(define clock-name (make-parameter #f))
;;; inputs is an association list mapping input name to an integer bitwidth.
(define inputs (make-parameter '()))

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
  (output-port v)]
 ["--template"
  v
  "Specifies which template to synthesize with. When not set, the synthesis procedure will run"
  " through all relevant templates for the architecture until one works."
  (template v)]
 ["--timeout" timeout "Timeout in seconds for each template" (template-timeout timeout)]
 ["--verilog-module-filepath"
  v
  "File containing the Verilog module to synthesize against."
  " Can be specified as an alternative to --instruction. If this is specified, you must also"
  " provide the flags --top-module-name and --verilog-module-out-signal."
  (verilog-module-filepath v)]
 ["--top-module-name"
  v
  "Top module name if --verilog-module-filepath is specified."
  (top-module-name v)]
 ["--verilog-module-out-signal"
  v
  "Name of the output signal of the module written out by Lakeroad. This argument also indicates"
  " the output signal name of the Verilog module specified by --verilog-module-filepath."
  " TODO(@gussmith23): There should be two separate arguments for this."
  (verilog-module-out-signal v)]
 ["--initiation-interval"
  v
  "Initiation interval of the module to be compiled. This will also be the initiation interval of the"
  " resulting synthesized Verilog module, though this need not be the case in general."
  (initiation-interval (string->number v))]
 ["--clock-name"
  v
  "Name of the clock signal of both modules. Currently assumes they're the same, but this need not be"
  " the case."
  (clock-name v)]
 #:once-any
 #:multi
 [("--instruction")
  v
  "The instruction to synthesize, written in Rosette bitvector semantics. Use (var <name> <bw>) to"
  " indicate a variable. For example, an 8-bit AND is (bvand (var a 8) (var b 8))."
  (instruction v)]
 [("--module-name") v "Name given to the module produced." (module-name v)]
 [("--input-signal")
  v
  "Name of an input signal to the module in the format `<name>:<bw` e.g. `a:8` This flag can be"
  " specified multiple times. This currently only needs to be specified for sequential synthesis."
  ;;; Parse --input arg: split <name>:<bw> into name and bw, construct Rosette symbolic input.
  (let* ([splits (string-split v ":")] [name (first splits)] [bw (string->number (second splits))])
    (when (not (equal? 2 (length splits)))
      (error (format "Invalid input signal specification: ~a" v)))
    (when (assoc name (inputs))
      (error "Signal " name " already present; did you duplicate an --input?"))
    (inputs (cons (cons name bw) (inputs))))])

;;; Parse instruction.
;;;
;;; This function will introduce new symbolic constants. Make sure you have good (vc) hygeine when
;;; calling this function (e.g. by wrapping its invocation with (with-vc)).
;;;
;;; expr The instruction to parse, e.g. '(bvadd (var a 8) (var b 8)).
(define (parse-instruction expr)

  (define (helper expr)
    (match expr
      [`(bitvector->bits ,a) (bitvector->bits (helper a))]
      [`(apply bvxor ,a) (apply bvxor (helper a))]
      [`(bvlshr ,a ,b) (bvlshr (helper a) (helper b))]
      [`(bvashr ,a ,b) (bvashr (helper a) (helper b))]
      [`(bvshl ,a ,b) (bvshl (helper a) (helper b))]
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

;;; The bitvector expression we're trying to synthesize.
(define bv-expr
  (cond
    [(instruction) (parse-instruction (read (open-input-string (instruction))))]
    [(verilog-module-filepath)
     (when (not (verilog-module-out-signal))
       (error "Must set --verilog-module-out-signal."))
     (when (not (top-module-name))
       (error "Must set --top-module-name."))
     (define btor
       (with-output-to-string
        (thunk
         (system
          (format
           "yosys -q -p 'read_verilog ~a; hierarchy -simcheck -top ~a; prep; proc; flatten; clk2fflogic; write_btor;'"
           (verilog-module-filepath)
           (top-module-name))))))

     (define ns (namespace-anchor->namespace anc))
     (define f (eval (first (btor->racket btor)) ns))
     (signal-value (assoc-ref (f) (string->symbol (verilog-module-out-signal))))]))

(when (boolean? bv-expr)
  (error
   (format
    "Expected a bitvector expression but found a boolean ~a: consider wrapping in (bool->bitvector ...)"
    bv-expr)))
(when (not (bv? bv-expr))
  (error (format "Expected a bitvector expression but found ~a" bv-expr)))
(define sketch-generator
  (match (template)
    ["dsp" single-dsp-sketch-generator]
    ["bitwise" bitwise-sketch-generator]
    ["carry" carry-sketch-generator]
    ["bitwise-with-carry" bitwise-with-carry-sketch-generator]
    ["shallow-comparison" shallow-comparison-sketch-generator]
    ["comparison" comparison-sketch-generator]
    ["multiplication" multiplication-sketch-generator]
    ["shift" shift-sketch-generator]
    ;;; TODO(@gussmith23) Clean up these hacks.
    ["xilinx-ultrascale-plus-dsp48e2"
     (when (not (equal? "xilinx-ultrascale-plus" (architecture)))
       (error "DSP48E2 template only supported for xilinx-ultrascale-plus architecture."))

     ;;; Return a faux sketch generator---a lambda that ignores the inputs and runs our old-style
     ;;; synthesis function.
     (lambda (architecture-description logical-inputs num-logical-inputs bitwidth)
       ;;; Note: wrap in list to mock the return value of sketch generators.
       (list (synthesize-xilinx-ultrascale-plus-dsp bv-expr)))]
    ["xilinx-ultrascale-plus-dsp48e2-2-dsps"
     (when (not (equal? "xilinx-ultrascale-plus" (architecture)))
       (error "DSP48E2 template only supported for xilinx-ultrascale-plus architecture."))

     ;;; Return a faux sketch generator---a lambda that ignores the inputs and runs our old-style
     ;;; synthesis function.
     (lambda (architecture-description logical-inputs num-logical-inputs bitwidth)
       ;;; Note: wrap in list to mock the return value of sketch generators.
       (list (synthesize-xilinx-ultrascale-plus-2-dsps bv-expr)))]
    ["xilinx-ultrascale-plus-dsp48e2-xor"
     (when (not (equal? "xilinx-ultrascale-plus" (architecture)))
       (error "DSP48E2 template only supported for xilinx-ultrascale-plus architecture."))

     ;;; Return a faux sketch generator---a lambda that ignores the inputs and runs our old-style
     ;;; synthesis function.
     (lambda (architecture-description logical-inputs num-logical-inputs bitwidth)
       ;;; Note: wrap in list to mock the return value of sketch generators.
       (list (synthesize-xilinx-ultrascale-plus-dsp-xor bv-expr)))]
    ["lattice-ecp5-dsp"
     (when (not (equal? "lattice-ecp5" (architecture)))
       (error "lattice-ecp5-dsp template only supported for lattice-ecp5 architecture."))

     ;;; Return a faux sketch generator---a lambda that ignores the inputs and runs our old-style
     ;;; synthesis function.
     (lambda (architecture-description logical-inputs num-logical-inputs bitwidth)
       ;;; Note: wrap in list to mock the return value of sketch generators.
       (list (synthesize-lattice-ecp5-dsp bv-expr)))]
    [else (error "Missing or invalid template.")]))

(define architecture-description
  (match (architecture)
    ["xilinx-ultrascale-plus" (xilinx-ultrascale-plus-architecture-description)]
    ["lattice-ecp5" (lattice-ecp5-architecture-description)]
    ["sofa" (sofa-architecture-description)]
    [other
     (error (format "Invalid architecture given (value: ~a). Did you specify --architecture?"
                    other))]))

(define module-semantics
  (match (architecture)
    ["xilinx-ultrascale-plus"
     (list (cons (cons "LUT2" "../verilator_xilinx/LUT2.v") xilinx-ultrascale-plus-lut2)
           (cons (cons "LUT6" "../verilator_xilinx/LUT6.v") xilinx-ultrascale-plus-lut6)
           (cons (cons "CARRY8" "../verilator_xilinx/CARRY8.v") xilinx-ultrascale-plus-carry8)
           (cons (cons "DSP48E2" "../verilator_unisims/DSP48E2.v") xilinx-ultrascale-plus-dsp48e2))]
    ["lattice-ecp5"
     (list (cons (cons "LUT4" "../f4pga-arch-defs/ecp5/primitives/slice/LUT4.v") lattice-ecp5-lut4)
           (cons (cons "CCU2C" "../f4pga-arch-defs/ecp5/primitives/slice/CCU2C.v") lattice-ecp5-ccu2c)
           (cons (cons "MULT18X18D" "") lattice-ecp5-mult18x18d)
           (cons (cons "ALU24B" "") lattice-ecp5-alu24b))]
    ["sofa"
     (list (cons (cons "frac_lut4" "../modules_for_importing/SOFA/frac_lut4.v") sofa-frac-lut4))]
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
   (define json-source
     (lakeroad->jsexpr lakeroad-expr
                       #:module-name (module-name)
                       #:output-signal-name (verilog-module-out-signal)))
   (display-to-file (jsexpr->string json-source) (json-filepath) #:exists 'replace)

   (match (out-format)
     ["verilog"
      (display (with-output-to-string
                (lambda ()
                  (when (not (system (format "yosys -q -p 'read_json ~a; write_verilog'"
                                             (json-filepath))))
                    (error "Yosys failed."))))
               (output-port))]

     [_ (error "Invalid output format.")])])
