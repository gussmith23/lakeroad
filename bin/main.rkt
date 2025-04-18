#!/usr/bin/env racket
#lang racket/base

(define-logger lakeroad)
(current-logger lakeroad-logger)

(require racket/runtime-path)
(define-runtime-path HERE ".")

(require rosette
         (prefix-in lr: "../racket/language.rkt")
         "../racket/utils.rkt"
         "../racket/synthesize.rkt"
         "../racket/compile-to-json.rkt"
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
         "../racket/generated/lattice-ecp5-mult18x18c.rkt"
         "../racket/generated/lattice-ecp5-alu24b.rkt"
         "../racket/generated/lattice-ecp5-alu54a.rkt"
         "../racket/generated/intel-altmult-accum.rkt"
         "../racket/generated/intel-cyclone10lp-mac-mult.rkt"
         "../racket/generated/intel-cyclone10lp-mac-out.rkt"
         "../racket/generated/xilinx-7-series-dsp48e1.rkt"
         rosette/solver/smt/boolector
         rosette/solver/smt/cvc5
         rosette/solver/smt/cvc4
         rosette/solver/smt/bitwuzla
         rosette/solver/smt/stp
         rosette/solver/smt/yices
         "../racket/signal.rkt"
         "../racket/btor.rkt"
         racket/sandbox)

(define-namespace-anchor anc)
(define ns (namespace-anchor->namespace anc))

(define architecture
  (make-parameter ""
                  (lambda (v)
                    (match v
                      [(or "xilinx-ultrascale-plus") v]
                      [(or "lattice-ecp5") v]
                      [(or "sofa") v]
                      ["intel" v]
                      ["intel-cyclone10lp" v]
                      ["xilinx-7-series" v]
                      [other (error (format "Unsupported architecture ~a." other))]))))
(define out-format
  (make-parameter ""
                  (lambda (v)
                    (match v
                      [(or "verilog") v]
                      [(or "yosys-techmap") v]
                      [other (error (format "Unsupported output format ~a." other))]))))
(define instruction (make-parameter #f identity))
(define module-name (make-parameter "top"))
(define json-filepath (make-parameter (make-temporary-file "rkttmp~a.json") identity))
(define output-port
  (make-parameter (current-output-port) (lambda (v) (open-output-file v #:exists 'replace))))
(define timeout (make-parameter #f string->number))
(define template (make-parameter #f identity))
(define verilog-module-filepath (make-parameter #f))
(define top-module-name (make-parameter #f))
(define verilog-module-out-signal (make-parameter #f))
(define verilog-module-out-bitwidth (make-parameter #f))
(define pipeline-depth (make-parameter 0))
(define clock-name (make-parameter #f))
(define reset-name (make-parameter #f))
;;; Arbitrary exit code choice.
(define FAILURECODE 25)
(define TIMEOUTCODE 26)
;;; inputs is an association list mapping input name to an integer bitwidth.
(define inputs (make-parameter '()))
(define solver (make-parameter "bitwuzla"))
; List of (port-name:string, width:int) pairs.
(define ports (make-parameter '()))
(define (parse-dsl expr-str)
  (define expr (read (open-input-string expr-str)))
  (define (recursive-helper expr)
    (match expr
      [`(extract ,i ,j ,expr) (lr:extract (lr:integer i) (lr:integer j) (recursive-helper expr))]
      [`(port ,(? symbol? sym) ,width)
       ; Add port to list of ports, if it's not there.
       (unless (assoc sym (ports))
         (ports (append (ports) (list (list (symbol->string sym) width)))))
       (lr:var (symbol->string sym) width)]))
  (recursive-helper expr))
; Returns a function that takes a hash table mapping port names to expressions. When called, the
; returned function will return a bitvector expression.
(define (parse-assume-dsl expr-str)
  (define expr (read (open-input-string expr-str)))
  (define (recursive-helper expr)
    (match expr
      [`(bv ,(? number? val) ,(? number? bw)) (lambda (var-map) (bv val bw))]

      ; Could definitely do the ops more cleverly. Need a way to go from a symbol 'bvule to the actual
      ; Rosette fn.
      [`(bvult ,a ,b)
       (lambda (var-map) (bvult ((recursive-helper a) var-map) ((recursive-helper b) var-map)))]
      [`(bvule ,a ,b)
       (lambda (var-map) (bvule ((recursive-helper a) var-map) ((recursive-helper b) var-map)))]
      [`(bveq ,a ,b)
       (lambda (var-map) (bveq ((recursive-helper a) var-map) ((recursive-helper b) var-map)))]

      [`(port ,(? symbol? sym) ,width) (lambda (var-map) (hash-ref var-map (symbol->string sym)))]))
  (recursive-helper expr))
(define extra-cycles (make-parameter 0))
(define solver-flags (make-parameter (make-hash)))
(define bitwuzla-path (make-parameter #f))
(define cvc5-path (make-parameter #f))
(define stp-path (make-parameter #f))
(define yices-path (make-parameter #f))
(define cvc4-path (make-parameter #f))
(define boolector-path (make-parameter #f))
(define simulate-with-verilator (make-parameter #f))
(define simulate-with-verilator-args (make-parameter '()))
(define yosys-log-filepath (make-parameter #f))
(define output-smt-path (make-parameter #f))
(define assume-fns (make-parameter '()))

(command-line
 #:program "lakeroad"
 #:once-each ["--architecture" arch "Hardware architecture to target." (architecture arch)]
 ["--solver"
  v
  "Solver to use. Supported: cvc5, bitwuzla, boolector. Defaults to bitwuzla."
  (solver v)]
 ["--yosys-log-filepath" v "Generate a Yosys log file (specify a file)." (yosys-log-filepath v)]
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
  (begin
    ; Error if file doesn't exist.
    (when (not (file-exists? v))
      (error (format "File ~a does not exist." v)))
    (verilog-module-filepath v))]
 ["--output-smt-path" v "Specify the output of the SMT solver to a directory." (output-smt-path v)]
 ["--top-module-name"
  v
  "Top module name if --verilog-module-filepath is specified."
  (top-module-name v)]
 ["--verilog-module-out-signal"
  v
  "Name of the output signal of the module written out by Lakeroad. This argument also indicates"
  " the output signal name of the Verilog module specified by --verilog-module-filepath."
  " Note that this also needs to be specified when passing via the legacy --instruction argument,"
  " but it can be set to anything."
  " TODO(@gussmith23): There should be two separate arguments for this."
  (let ([splits (string-split v ":")])
    (when (not (equal? 2 (length splits)))
      (error "Output signal must be specified as <name>:<bw>"))
    (verilog-module-out-signal (first splits))
    (verilog-module-out-bitwidth (string->number (second splits))))]
 ["--pipeline-depth"
  v
  "Initiation interval of the module to be compiled. This will also be the pipeline depth of the"
  " resulting synthesized Verilog module, though this need not be the case in general."
  (pipeline-depth (string->number v))]
 ["--extra-cycles"
  v
  "Number of extra cycles to run the module for and make assertions about. Defaults to 0. When ==0,"
  " synthesis runs the module for exactly the pipeline depth number of steps and makes a single"
  " assertion about the outputs being equal at the last time step. When >0, synthesis runs the module"
  " for pipeline depth + extra cycles number of steps and makes assertions about all of the"
  " outputs being equal at each time step greater than or equal to the pipeline depth."
  (extra-cycles (string->number v))]
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
 ["--bitwuzla-path"
  v
  "Path to the Bitwuzla binary. If not set, Rosette will assume the binary is on your PATH."
  (bitwuzla-path v)]
 ["--cvc5-path"
  v
  "Path to the cvc5 binary. If not set, Rosette will assume the binary is on your PATH."
  (cvc5-path v)]
 ["--stp-path"
  v
  "Path to the STP binary. If not set, Rosette will assume the binary is on your PATH."
  (stp-path v)]
 ["--yices-path"
  v
  "Path to the Yices2 binary. If not set, Rosette will assume the binary is on your PATH."
  (yices-path v)]
 ["--cvc4-path"
  v
  "Path to the cvc4 binary. If not set, Rosette will assume the binary is on your PATH."
  (cvc4-path v)]
 ["--boolector-path"
  v
  "Path to the boolector binary. If not set, Rosette will assume the binary is on your PATH."
  (boolector-path v)]
 ["--simulate-with-verilator"
  "If set, Lakeroad will simulate the result of synthesis to validate its correctness."
  (simulate-with-verilator #t)]
 #:multi
 [("--simulate-with-verilator-arg")
  v
  "Argument to pass through to simulate_with_verilator.py. See the documentation for available flags."
  " You can see the available flags by running `simulate_with_verilator.py --help`."
  (simulate-with-verilator-args (append (simulate-with-verilator-args) (list v)))]
 [("--solver-flag")
  v
  "Flag to pass to the solver. A string of the form <flag>=<value>. This flag can be specified"
  "multiple times."
  (match-let* ([(list key value) (string-split v "=")] [key (string->symbol key)])
    (when (hash-has-key? (solver-flags) key)
      (error (format "Flag ~a already specified." key)))
    (hash-set! (solver-flags) key value))]
 #:once-each
 [("--instruction")
  v
  "The instruction to synthesize, written in Rosette bitvector semantics. Use (var <name> <bw>) to"
  " indicate a variable. For example, an 8-bit AND is (bvand (var a 8) (var b 8))."
  (instruction v)]
 [("--module-name") v "Name given to the module produced." (module-name v)]
 #:multi
 [("--input-signal")
  v
  "Specify an input to the sketch, using a small domain-specific language. Generally, the inputs to"
  " the sketch will correspond to the input ports of the module you are trying to compile. For"
  " example, if you were compiling a multiplier module with 8-bit inputs `i0` and `i1` using the `dsp`"
  " sketch, you would plug the `i0` and `i1` input ports into the `a` and `b` inputs of"
  " the DSP sketch by specifying `--input-signal 'a:(port i0 8):8' --input-signal 'b:(port i1 8):8'`."
  (let* ([splits (string-split v ":")]
         [_ (when (not (equal? 3 (length splits)))
              (error (format "Invalid input signal specification: ~a" v)))]
         [id (first splits)]
         [expr (parse-dsl (second splits))]
         [bw (string->number (third splits))])

    (when (assoc id (inputs))
      (error "Signal " id " already present; did you duplicate an --input?"))
    (inputs (append (inputs) (list (list id expr bw)))))]
 [("--assume")
  v
  "Assumption to make about the output of the module. This is a bitvector expression in Rosette"
  " semantics. For example, if you want to assume that the input of the module is less than 8, you"
  " would specify `--assume '(bvult (port a 8) (bv 8 8))'`."
  (assume-fns (append (assume-fns) (list (parse-assume-dsl v))))])

;;; Set solver.
(match (solver)
  ["cvc5" (current-solver (cvc5 #:path (cvc5-path) #:logic 'QF_BV #:options (solver-flags)))]
  ["cvc4" (current-solver (cvc4 #:path (cvc4-path) #:logic 'QF_BV #:options (solver-flags)))]
  ["bitwuzla"
   (current-solver (bitwuzla #:path (bitwuzla-path) #:logic 'QF_BV #:options (solver-flags)))]
  ["boolector"
   (current-solver (boolector #:path (boolector-path) #:logic 'QF_BV #:options (solver-flags)))]
  ["stp" (current-solver (stp #:path (stp-path) #:logic 'QF_BV #:options (solver-flags)))]
  ["yices" (current-solver (yices #:path (yices-path) #:logic 'QF_BV #:options (solver-flags)))]
  [_ (error (format "Unknown solver: ~a" (solver)))])

;;; Parse instruction. Returns a Racket function in the format currently expected by synthesis:
;;; A function with keyword arguments, taking signal arguments and returning an association list of
;;; signals.
;;;
;;; expr The instruction to parse, e.g. '(bvadd (var a 8) (var b 8)).
(define (parse-instruction expr)
  ;;; A list to collect the args we encounter.
  (define keywords '())
  (define (helper expr)
    (match expr
      [`(bitvector->bits ,a) `(bitvector->bits ,(helper a))]
      [`(apply bvxor ,a) `(bvxor ,@(helper a))]
      [`(bvlshr ,a ,b) `(bvlshr ,(helper a) ,(helper b))]
      [`(bvashr ,a ,b) `(bvashr ,(helper a) ,(helper b))]
      [`(bvshl ,a ,b) `(bvshl ,(helper a) ,(helper b))]
      [`(bvuge ,a ,b) `(bvuge ,(helper a) ,(helper b))]
      [`(bvule ,a ,b) `(bvule ,(helper a) ,(helper b))]
      [`(bvult ,a ,b) `(bvult ,(helper a) ,(helper b))]
      [`(bvugt ,a ,b) `(bvugt ,(helper a) ,(helper b))]
      [`(not ,a) `(not ,(helper a))]
      [`(bveq ,a ,b) `(bveq ,(helper a) ,(helper b))]
      [`(bool->bitvector ,a) `(bool->bitvector ,(helper a))]
      [`(bvand ,a ,b) `(bvand ,(helper a) ,(helper b))]
      [`(bvor ,a ,b) `(bvor ,(helper a) ,(helper b))]
      [`(bvxor ,a ,b) `(bvxor ,(helper a) ,(helper b))]
      [`(bvadd ,a ,b) `(bvadd ,(helper a) ,(helper b))]
      [`(bvsub ,a ,b) `(bvsub ,(helper a) ,(helper b))]
      [`(bvmul ,a ,b) `(bvmul ,(helper a) ,(helper b))]
      [`(bvnot ,a) `(bvnot ,(helper a))]
      [`(circt-comb-mux ,s ,a ,b) `(circt-comb-mux ,(helper s) ,(helper a) ,(helper b))]
      [`(var ,id ,bw)
       (set! keywords (cons (string->keyword (symbol->string id)) keywords))
       `(signal-value ,id)]))

  (define body (helper expr))

  (define keywords-sorted (sort keywords keyword<?))
  (define out-fn
    `(lambda ,(flatten (map (lambda (kw) (list kw `,(string->symbol (keyword->string kw))))
                            keywords-sorted))
       (list (cons ',(string->symbol (verilog-module-out-signal)) (bv->signal ,body)))))
  (eval out-fn ns))

(when (output-smt-path)
  (output-smt (output-smt-path)))

;;; The bitvector expression we're trying to synthesize.
(define bv-expr
  (cond
    [(instruction) (parse-instruction (read (open-input-string (instruction))))]
    [(verilog-module-filepath)
     (when (not (verilog-module-out-signal))
       (error "Must set --verilog-module-out-signal."))
     (when (not (top-module-name))
       (error "Must set --top-module-name."))
     (when (not (parameterize ([current-output-port (open-output-nowhere)])
                  (system "yosys --version")))
       (error "Something is wrong with Yosys. Is Yosys installed and on your PATH?"))
     (log-info "Running Yosys.")
     (define btor
       (parameterize ([current-error-port (open-output-nowhere)])
         (with-output-to-string
          (thunk
           (when (not
                  (system
                   (format
                    ;;; TODO(@gussmith23): This is a very important line -- we need to determine whether
                    ;;; clk2fflogic is the correct thing to use. See
                    ;;; https://github.com/uwsampl/lakeroad/issues/238
                    "yosys ~a -p 'read_verilog -sv ~a; hierarchy -simcheck -top ~a; prep; proc; flatten; clk2fflogic; write_btor;'"
                    (if (yosys-log-filepath) (format "-ql ~a" (yosys-log-filepath)) "-q")
                    (verilog-module-filepath)
                    (top-module-name))))
             (error "Yosys failed."))))))

     (define f (eval (first (btor->racket btor)) ns))
     ;;; If we're doing sequential synthesis, return the function as-is. Otherwise, the legacy code
     ;;; path expects a bvexpr, which we can get by just calling the function.
     (if (> (pipeline-depth) 0)
         f
         ;(signal-value (assoc-ref (f) (string->symbol (verilog-module-out-signal))))
         f)]))

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
    ["experimental-two-dsp" two-dsp-sketch-generator]
    ["bitwise" bitwise-sketch-generator]
    ["carry" carry-sketch-generator]
    ["bitwise-with-carry" bitwise-with-carry-sketch-generator]
    ["shallow-comparison" shallow-comparison-sketch-generator]
    ["comparison" comparison-sketch-generator]
    ["multiplication" multiplication-sketch-generator]
    ["shift" shift-sketch-generator]
    [_ (error "Missing or invalid template.")]))

(define architecture-description
  (match (architecture)
    ["xilinx-ultrascale-plus" (xilinx-ultrascale-plus-architecture-description)]
    ["lattice-ecp5" (lattice-ecp5-architecture-description)]
    ["sofa" (sofa-architecture-description)]
    ["intel" (intel-architecture-description)]
    ["intel-cyclone10lp"
     (parse-architecture-description-file
      (build-path (get-lakeroad-directory) "architecture_descriptions" "intel_cyclone10lp.yml"))]
    ["xilinx-7-series"
     (parse-architecture-description-file
      (build-path (get-lakeroad-directory) "architecture_descriptions" "xilinx_7_series.yml"))]
    [other
     (error (format "Invalid architecture given (value: ~a). Did you specify --architecture?"
                    other))]))

(define module-semantics
  (match (architecture)
    ["xilinx-ultrascale-plus"
     (list (cons (cons "LUT2" "../verilog/simulation/xilinx-ultrascale-plus/LUT2.v")
                 xilinx-ultrascale-plus-lut2)
           (cons (cons "LUT6" "../verilog/simulation/xilinx-ultrascale-plus/LUT6.v")
                 xilinx-ultrascale-plus-lut6)
           (cons (cons "CARRY8" "../verilog/simulation/xilinx-ultrascale-plus/CARRY8.v")
                 xilinx-ultrascale-plus-carry8)
           (cons (cons "DSP48E2" "../verilog/simulation/xilinx-ultrascale-plus/DSP48E2.v")
                 xilinx-ultrascale-plus-dsp48e2))]
    ["lattice-ecp5"
     (list (cons (cons "LUT4" "../verilog/simulation/lattice-ecp5/LUT4.v") lattice-ecp5-lut4)
           (cons (cons "CCU2C" "../verilog/simulation/lattice-ecp5/CCU2C.v") lattice-ecp5-ccu2c)
           (cons (cons "MULT18X18D" "../lakeroad-private/lattice_ecp5/MULT18X18D.v")
                 lattice-ecp5-mult18x18d)
           (cons (cons "MULT18X18C" "../lakeroad-private/lattice_ecp5/MULT18X18C.v")
                 lattice-ecp5-mult18x18c)
           (cons (cons "ALU24B" "") lattice-ecp5-alu24b)
           (cons (cons "ALU54A"
                       "../lakeroad-private/lattice_ecp5/ALU54A_modified_for_racket_import.v")
                 lattice-ecp5-alu54a))]
    ["sofa"
     (list (cons (cons "frac_lut4" "../modules_for_importing/SOFA/frac_lut4.v") sofa-frac-lut4))]
    ["intel" (list (cons (cons "altmult_accum" "unused") intel-altmult-accum))]
    ["intel-cyclone10lp"
     (list (cons (cons "cyclone10lp_mac_mult" "unused") intel-cyclone10lp-mac-mult)
           (cons (cons "cyclone10lp_mac_out" "unused") intel-cyclone10lp-mac-out))]
    ["xilinx-7-series" (list (cons (cons "DSP48E1" "unused") xilinx-7-series-dsp48e1))]
    [other
     (error (format "Invalid architecture given (value: ~a). Did you specify --architecture?"
                    other))]))

(define sketch-inputs
  (make-sketch-inputs #:output-width output-bitwidth
                      #:data (map (lambda (p) (cons (first p) (cons (second p) (third p)))) (inputs))
                      #:clk (if (clock-name) (cons (lr:var (clock-name) 1) 1) #f)
                      #:rst (if (reset-name) (cons (lr:var (reset-name) 1) 1) #f)))
(define sketch (first (sketch-generator architecture-description sketch-inputs)))
(define (exit-timeout e)
  (when (exn:fail:resource? e)
    (displayln "Synthesis Timeout" (current-error-port))
    (exit TIMEOUTCODE)))
;;; Either a valid LR expression or #f.
(log-info "Attempting synthesis.")
(define lakeroad-expr
  (cond
    [(> (pipeline-depth) 0)
     (let* ([_ "this line prevents autoformatter from messing up comments"]

            ;;; Generate the input values: an association list mapping name to value, where the value
            ;;; is a signal whose value is a symbolic bitvector.
            ;;;
            ;;; We'll use this as input to both the #:bv-sequential and #:lr-sequential args.
            [input-values
             (map (λ (p)
                    (match p
                      [(list name bw)
                       (cons name (bv->signal (constant (list "main.rkt" name) (bitvector bw))))]))
                  (ports))]

            ;;; The same environments, but with symbolic values
            [make-intermediate-inputs
             (lambda (inputs iter)
               (map (λ (p)
                      (match p
                        [(list name bw)
                         (cons name (bv->signal (constant (list name "iter" iter) (bitvector bw))))]))
                    inputs))]

            ;;; Environments for sequential synthesis. Each environment represents one set of input
            ;;; states. For each set of input states, we run the interpreter with the given inputs,
            ;;; get the output (including all of the internal state), and then pass that state on to
            ;;; the next iteration. See `rosette-synthesize`.
            ;;; (apply append == flatten once; Racket's `flatten` flattens too much.)
            ;;; First, we tick the clock with the inputs set to their input values.
            [envs (append (list (cons (cons (clock-name) (bv->signal (bv 0 1))) input-values)
                                (cons (cons (clock-name) (bv->signal (bv 1 1)))
                                      (make-intermediate-inputs (ports) 0)))
                          ;;; then, we tick the clock with the inputs set to symbolic values.
                          (apply append
                                 (map (lambda (iter)
                                        (list (cons (cons (clock-name) (bv->signal (bv 0 1)))
                                                    (make-intermediate-inputs (ports) iter))
                                              (cons (cons (clock-name) (bv->signal (bv 1 1)))
                                                    (make-intermediate-inputs (ports) iter))))
                                      (range 1 (+ (pipeline-depth) (extra-cycles))))))]
            ;;; If there's a reset signal, set it to 0 in all envs.
            [envs (if (reset-name)
                      (map (λ (env) (cons (cons (reset-name) (bv->signal (bv 0 1))) env)) envs)
                      envs)]

            [assumes
             (begin
               ; To make the assumes, we map over the list of envs. For each env, we map each lambda
               ; in the (assumes) list to generate an assume. This should produce a list of lists that
               ; we then flatten.

               (flatten
                (map (λ (env)
                       ; For the env, first generate the hashmap mapping port names to their values.
                       ; Then, for each assume, generate the assume.
                       (define port-map
                         (make-hash (map (λ (p) (cons (car p) (signal-value (cdr p)))) env)))
                       (define assumes (map (lambda (assume-fn) (assume-fn port-map)) (assume-fns)))

                       assumes)
                     envs)))]

            [input-symbolic-constants (symbolics envs)])

       ;;; Throw error if we're not passing all values to the bv-expr.
       ;;; TODO(@gussmith23): This check would be better elsewhere, but the use of `compose` below
       ;;; makes it not possible to use `procedure-keywords` in `rosette-synthesize` itself.
       ;;; TODO(@gussmith23): Even better would be to end the headache of using keyword arguments
       ;;; altogether.
       (match-define-values (_ keywords) (procedure-keywords bv-expr))
       ;;; Filter out unnamed inputs, which are an artifact of the Verilog-to-Racket importer. Also
       ;;; filter out #:name.
       (define keywords-minus-unnamed
         (apply set
                (filter (λ (k)
                          (not (or (string-prefix? (keyword->string k) "unnamed-input-")
                                   (equal? (keyword->string k) "name"))))
                        keywords)))
       (for ([env envs])
         (define env-keys-set (apply set (map (compose1 string->keyword car) env)))
         (define missing-keys (set-subtract keywords-minus-unnamed env-keys-set))
         (when (not (equal? 0 (set-count missing-keys)))
           ;;; TODO(@gussmith23): Figure out how to use Racket logging...
           (displayln (format "WARNING: Not passing all inputs to bv-expr, Missing ~a" missing-keys)
                      (current-error-port))))
       (with-handlers ([exn:fail:resource? exit-timeout])
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
                  #:module-semantics module-semantics
                  #:assert-equal-on
                  (if (equal? (extra-cycles) 0)
                      #f
                      (flatten (append (make-list (- (pipeline-depth) 1) (list #f #f))
                                       (make-list (+ (extra-cycles) 1) (list #f #t)))))
                  #:assumes assumes)))))]

    ;;; Ah, the bug with combinational at least is that the symbolics are coming in in different orders e.g. (c a b).
    [else
     (define envs
       (list (append (map (λ (p)
                            (match p
                              [(list name bw)
                               (cons name
                                     (bv->signal (constant (list "main.rkt" name) (bitvector bw))))]))
                          (ports))
                     ; If there's a clock, hardcode it to 0.
                     (if (clock-name) (list (cons (clock-name) (bv->signal (bv 0 1)))) (list)))))
     (define assumes
       (begin
         ; To make the assumes, we map over the list of envs. For each env, we map each lambda
         ; in the (assumes) list to generate an assume. This should produce a list of lists that
         ; we then flatten.

         (flatten (map (λ (env)
                         ; For the env, first generate the hashmap mapping port names to their values.
                         ; Then, for each assume, generate the assume.
                         (define port-map
                           (make-hash (map (λ (p) (cons (car p) (signal-value (cdr p)))) env)))
                         (define assumes (map (lambda (assume-fn) (assume-fn port-map)) (assume-fns)))

                         assumes)
                       envs))))
     (define input-symbolic-constants (symbolics envs))
     ;;; If pipeline depth is #f, then do normal combinational synthesis.
     (with-handlers ([exn:fail:resource? exit-timeout])
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
                #:module-semantics module-semantics
                #:assumes assumes))))]))

(log-info "Synthesis complete.")

(cond
  [(not lakeroad-expr)
   (displayln "Synthesis failed" (current-error-port))
   (exit FAILURECODE)]

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
      (display
       (with-output-to-string (lambda ()
                                (when (not (system (format "yosys -q -p 'read_json ~a; write_verilog'"
                                                           (json-filepath))))
                                  (error "Yosys failed."))))
       (output-port))]

     [_ (error "Invalid output format.")])])

(when (simulate-with-verilator)
  ; Assumptions aren't currently supported here.
  (when (not (equal? (assume-fns) '()))
    ; TODO: should at least supply a way of manually simulating while constraining input sizes.
    (error "Assumptions are not currently supported with --simulate-with-verilator."))

  ; TODO(@gussmith23): shouldn't use "python3" directly here.
  (let*-values
      ([(path) (build-path HERE "simulate_with_verilator.py")]
       [(_) (log-debug "running simulate_with_verilator.py at ~a" path)]
       [(out-verilog-filepath) (make-temporary-file "rkttmp~a.v")]
       [(_) (with-output-to-file
             out-verilog-filepath
             (lambda ()
               (when (not (system (format "yosys -q -p 'read_json ~a; write_verilog'"
                                          (json-filepath))))
                 (error "Yosys failed.")))
             #:exists 'must-truncate)]
       [(args) (list "--verilog_filepath"
                     (verilog-module-filepath)
                     "--verilog_filepath"
                     out-verilog-filepath
                     "--test_module_name"
                     (module-name)
                     "--ground_truth_module_name"
                     (top-module-name)
                     "--pipeline_depth"
                     (number->string (pipeline-depth))
                     "--output_signal"
                     (format "~a:~a" (verilog-module-out-signal) (verilog-module-out-bitwidth)))]
       [(args) (append args (if (clock-name) (list "--clock_name" (clock-name)) (list)))]
       [(args) (append args
                       (flatten (map (lambda (port-pair)
                                       (list "--input_signal"
                                             (format "~a:~a" (first port-pair) (second port-pair))))
                                     (ports))))]
       [(args) (append args (simulate-with-verilator-args))]
       [(cmd) (append (list (find-executable-path "python3") path) args)]
       [(_) (log-debug "Running command: ~a" cmd)]
       [(sp out in err) (apply subprocess #f #f #f cmd)]
       [(_) (subprocess-wait sp)]
       [(return-code) (subprocess-status sp)])
    (when (not (equal? return-code 0))
      (error (format
              "simulate_with_verilator.py failed with return code ~a\n\nstderr:\n~a\n\nstdout:~a"
              return-code
              (port->string err)
              (port->string out))))))
