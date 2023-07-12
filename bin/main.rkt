#!/usr/bin/env racket
#lang racket/base

(require rosette
         (prefix-in lr: "../racket/language.rkt")
         "../racket/utils.rkt"
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
         "../racket/generated/intel-altmult-accum.rkt"
         rosette/solver/smt/boolector
         "../racket/signal.rkt"
         "../racket/btor.rkt"
         racket/sandbox)

(define-namespace-anchor anc)

(current-solver (boolector))

(define architecture
  (make-parameter ""
                  (lambda (v)
                    (match v
                      [(or "xilinx-ultrascale-plus") v]
                      [(or "lattice-ecp5") v]
                      [(or "sofa") v]
                      ["intel" v]
                      [other (error (format "Unsupported architecture ~a." other))]))))
(define out-format
  (make-parameter ""
                  (lambda (v)
                    (match v
                      [(or "verilog") v]
                      [(or "yosys-techmap") v]
                      [other (error (format "Unsupported output format ~a." other))]))))
(define instruction (make-parameter #f identity))
(define module-name (make-parameter #f identity))
(define json-filepath (make-parameter (make-temporary-file "rkttmp~a.json") identity))
(define output-port
  (make-parameter (current-output-port) (lambda (v) (open-output-file v #:exists 'replace))))
(define timeout (make-parameter #f string->number))
(define template (make-parameter #f identity))
(define verilog-module-filepath (make-parameter #f))
(define top-module-name (make-parameter #f))
(define verilog-module-out-signal (make-parameter #f))
(define verilog-module-out-bitwidth (make-parameter #f))
(define initiation-interval (make-parameter 0))
(define clock-name (make-parameter #f))
(define reset-name (make-parameter #f))
;;; inputs is an association list mapping input name to an integer bitwidth.
(define inputs (make-parameter '()))

(command-line
 #:program "lakeroad"
 #:once-each ["--architecture" arch "Hardware architecture to target." (architecture arch)]
 ["--out-format"
  fmt
  "Output format. Supported: 'verilog' for outputting to raw Verilog,"
  " 'yosys-techmap' to output to Yosys's techmapping pattern format described here:"
  " https://github.com/YosysHQ/yosys/blob/c2285b3460083afbd8f2dd21d81d7f726e8c93d2/passes/techmap/techmap.cc#L1129"
  (out-format fmt)]
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
 ["--timeout" v "Timeout in seconds for synthesis" (timeout v)]
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
  (let ([splits (string-split v ":")])
    (when (not (equal? 2 (length splits)))
      (error "Output signal must be specified as <name>:<bw>"))
    (verilog-module-out-signal (first splits))
    (verilog-module-out-bitwidth (string->number (second splits))))]
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
 ["--reset-name"
  v
  "Name of the reset signal of both modules. Currently assumes they're the same, but this need not be"
  " the case."
  (reset-name v)]
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
    (inputs (append (inputs) (list (cons name bw)))))])

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
         (when (not
                (system
                 (format
                  ;;; TODO(@gussmith23): This is a very important line -- we need to determine whether
                  ;;; clk2fflogic is the correct thing to use. See
                  ;;; https://github.com/uwsampl/lakeroad/issues/238
                  "yosys -q -p 'read_verilog -sv ~a; hierarchy -simcheck -top ~a; prep; proc; flatten; clk2fflogic; write_btor;'"
                  (verilog-module-filepath)
                  (top-module-name))))
           (error "Yosys failed.")))))

     (define ns (namespace-anchor->namespace anc))
     (define f (eval (first (btor->racket btor)) ns))
     ;;; If we're doing sequential synthesis, return the function as-is. Otherwise, the legacy code
     ;;; path expects a bvexpr, which we can get by just calling the function.
     (if (> (initiation-interval) 0)
         f
         (signal-value (assoc-ref (f) (string->symbol (verilog-module-out-signal)))))]))

(when (boolean? bv-expr)
  (error
   (format
    "Expected a bitvector expression but found a boolean ~a: consider wrapping in (bool->bitvector ...)"
    bv-expr)))
(when (not (or (bv? bv-expr) (procedure? bv-expr)))
  (error (format "Expected a bitvector expression or procedure but found ~a" bv-expr)))

(define output-bitwidth
  (cond
    [(verilog-module-out-bitwidth) (verilog-module-out-bitwidth)]
    [(bv? bv-expr) (bvlen bv-expr)]
    [else (error "Something's wrong!")]))

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
    ["intel" (intel-architecture-description)]
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
           (cons (cons "MULT18X18D" "../lakeroad-private/lattice_ecp5/MULT18X18D.v")
                 lattice-ecp5-mult18x18d)
           (cons (cons "ALU24B" "") lattice-ecp5-alu24b))]
    ["sofa"
     (list (cons (cons "frac_lut4" "../modules_for_importing/SOFA/frac_lut4.v") sofa-frac-lut4))]
    ["intel" (list (cons (cons "altmult_accum" "unused") intel-altmult-accum))]
    [other
     (error (format "Invalid architecture given (value: ~a). Did you specify --architecture?"
                    other))]))

(define sketch-inputs
  (make-sketch-inputs #:output-width output-bitwidth
                      #:data (map (λ (p) (cons (lr:var (car p) (cdr p)) (cdr p))) (inputs))
                      #:clk (if (clock-name) (cons (lr:var (clock-name) 1) 1) #f)
                      #:rst (if (reset-name) (cons (lr:var (reset-name) 1) 1) #f)))
(define sketch (first (sketch-generator architecture-description sketch-inputs)))

;;; Either a valid LR expression or #f.
(define lakeroad-expr
  (cond
    [(> (initiation-interval) 0)
     (let* ([_ "this line prevents autoformatter from messing up comments"]

            ;;; Generate the input values: an association list mapping name to value, where the value
            ;;; is a signal whose value is a symbolic bitvector.
            ;;;
            ;;; We'll use this as input to both the #:bv-sequential and #:lr-sequential args.
            [input-values
             (map (λ (p)
                    (match p
                      [(cons name bw)
                       (cons name (bv->signal (constant (list "main.rkt" name) (bitvector bw))))]))
                  (inputs))]

            ;;; The same environments, but with everything set to zero.
            [input-zeroes (map (λ (p)
                                 (match p
                                   [(cons name bw) (cons name (bv->signal (bv 0 bw)))]))
                               (inputs))]

            [input-symbolic-constants (map (compose1 signal-value cdr) input-values)]

            ;;; Environments for sequential synthesis. Each environment represents one set of input
            ;;; states. For each set of input states, we run the interpreter with the given inputs,
            ;;; get the output (including all of the internal state), and then pass that state on to
            ;;; the next iteration. See `rosette-synthesize`.
            ;;; (apply append == flatten once; Racket's `flatten` flattens too much.)
            [envs ;;; First, we tick the clock with the inputs set to their input values.
             (append (list (cons (cons (clock-name) (bv->signal (bv 0 1))) input-values)
                           (cons (cons (clock-name) (bv->signal (bv 1 1))) input-values))
                     ;;; then, we tick the clock with the inputs set to zero.
                     (apply append
                            (make-list
                             (sub1 (initiation-interval))
                             (list (cons (cons (clock-name) (bv->signal (bv 0 1))) input-zeroes)
                                   (cons (cons (clock-name) (bv->signal (bv 1 1))) input-zeroes)))))]
            ;;; If there's a reset signal, set it to 0 in all envs.
            [envs (if (reset-name)
                      (map (λ (env) (cons (cons (reset-name) (bv->signal (bv 0 1))) env)) envs)
                      envs)])

       ;;; Throw error if we're not passing all values to the bv-expr.
       ;;; TODO(@gussmith23): This check would be better elsewhere, but the use of `compose` below
       ;;; makes it not possible to use `procedure-keywords` in `rosette-synthesize` itself.
       ;;; TODO(@gussmith23): Even better would be to end the headache of using keyword arguments
       ;;; altogether.
       (match-define-values (_ keywords) (procedure-keywords bv-expr))
       ;;; Filter out unnamed inputs, which are an artifact of the Verilog-to-Racket importer.
       (define keywords-minus-unnamed
         (filter (λ (k) (not (string-prefix? (keyword->string k) "unnamed-input-"))) keywords))
       (for ([env envs])
         (when (not (equal? (length env) (length keywords-minus-unnamed)))
           ;;; TODO(@gussmith23): Figure out how to use Racket logging...
           (displayln (format "WARNING: Not passing all inputs to bv-expr, Missing ~a"
                              (set-subtract (apply set keywords-minus-unnamed)
                                            (apply set (map (compose1 string->keyword car) env))))
                      (current-error-port))))

       (call-with-limits
        (timeout)
        #f
        (thunk (rosette-synthesize
                (compose (lambda (out) (assoc-ref out (string->symbol (verilog-module-out-signal))))
                         bv-expr)
                sketch
                input-symbolic-constants
                #:bv-sequential envs
                #:lr-sequential envs
                #:module-semantics module-semantics))))]

    [else
     ;;; If initiation interval is #f, then do normal combinational synthesis.
     (call-with-limits (timeout)
                       #f
                       (thunk (synthesize-with-sketch sketch-generator
                                                      architecture-description
                                                      bv-expr
                                                      #:module-semantics module-semantics)))]))

(cond
  [(not lakeroad-expr) (error "Synthesis failed.")]

  [else
   (when (not (verilog-module-out-signal))
     (error "Verilog module out signal not specified."))
   (define json-source
     (lakeroad->jsexpr lakeroad-expr
                       #:module-name (module-name)
                       #:output-signal-name (verilog-module-out-signal)
                       #:yosys-techmap-format (equal? (out-format) "yosys-techmap")))
   (display-to-file (jsexpr->string json-source) (json-filepath) #:exists 'replace)

   (match (out-format)
     [(or "verilog" "yosys-techmap")
      (display (with-output-to-string
                (lambda ()
                  (when (not (system (format "yosys -q -p 'read_json ~a; write_verilog'"
                                             (json-filepath))))
                    (error "Yosys failed."))))
               (output-port))]

     [_ (error "Invalid output format.")])])
