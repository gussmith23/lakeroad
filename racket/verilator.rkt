#lang racket

(provide simulate-expr
         to-simulate
         simulate-with-verilator)

(require json
         "compile-to-json.rkt"
         rosette
         "utils.rkt"
         "signal.rkt"
         (prefix-in lr: "language.rkt")
         racket/future)

;;; Lakeroad expression to test.
;;;
;;; Args:
;;;   lakeroad-expr: the Lakeroad expression to be compiled to Verilog and tested.
;;;   bv-expr: the ground truth expression to be tested against.
(struct to-simulate (lakeroad-expr bv-expr))

;;; Simulate Lakeroad expressions with Verilator.
;;;
;;; It's preferable to batch tests into a single Verilator testbench as possible, because Verilator
;;; compilation takes much longer than synthesis with Lakeroad or testbench runtime.
(define/contract (simulate-with-verilator to-simulate-values
                                          verilator-include-dir
                                          #:additional-files-to-build [additional-files-to-build '()]
                                          #:include-dirs [include-dirs '()]
                                          #:extra-verilator-args [extra-verilator-args ""]
                                          #:extra-cc-args [extra-cc-args ""]
                                          #:num-make-jobs [num-make-jobs (processor-count)]
                                          #:max-loop-bound [max-loop-bound 256]
                                          #:force-random-values [force-random-values #f])
  (->* ((listof to-simulate?) path-string?)
       (#:additional-files-to-build (listof path-string?)
                                    #:include-dirs (listof path-string?)
                                    #:extra-verilator-args string?
                                    #:extra-cc-args string?
                                    #:num-make-jobs integer?
                                    #:max-loop-bound integer?
                                    #:force-random-values boolean?)
       boolean?)
  (begin
    (define working-directory (make-temporary-file "rkttmp~a" 'directory))
    (log-info "Working directory: ~a" working-directory)

    ;;; Converts Lakeroad expression to a Verilog module, writes it to a .v file, and generates the
    ;;; testbench code to test the Verilog module.
    (define/contract (generate-code-for-lakeroad-expression to-simulate-value)
      (-> to-simulate? (list/c string? string? path?))
      (begin
        (match-define (to-simulate lakeroad-expr bv-expr) to-simulate-value)
        (define json-file (make-temporary-file "rkttmp~a.json" #f working-directory))
        (define verilog-file (make-temporary-file "rkttmp~a.v" #f working-directory))
        (define module-name
          (path->string (path-replace-extension (file-name-from-path verilog-file) "")))
        (display-to-file (jsexpr->string (lakeroad->jsexpr lakeroad-expr #:module-name module-name))
                         json-file
                         #:exists 'update)
        (match-let ([(list proc-stdout stdin proc-id stderr control-fn)
                     (process
                      (format "yosys -p 'read_json ~a; write_verilog ~a'" json-file verilog-file))])
          (control-fn 'wait)
          (when (not (equal? 0 (control-fn 'exit-code)))
            (error (format "Converting JSON to Verilog via Yosys failed:\nSTDOUT:\n~a\nSTDERR:\n~a"
                           (port->string proc-stdout)
                           (port->string stderr))))
          (close-input-port proc-stdout)
          (close-input-port stderr)
          (close-output-port stdin))

        ;;; The class name of the C++ class produced by Verilator after Verilating our .v file.
        (define verilated-type-name (format "V~a" module-name))

        ;;; The symbol for the variable which indicates which value of the given var we're checking
        ;;; this iteration.
        (define (idx-var var)
          (format "i~a" var))

        ;;; The symbol for the variable which holds the value that gets driven into the input of the
        ;;; module.
        (define (val-var var)
          (~a var))

        ;;; The sequence of `for (<idx-var> = 0; <idx-var> < <limit>; <idx-var>++)` statements which
        ;;; open the loop for each input we're testing over.
        (define for-loop-openings
          (for/list ([var (symbolics bv-expr)])

            ;;; The symbol for the variable which indicates which value of the given var we're checking
            ;;; this iteration. This index variable will either be used directly as input, in the case
            ;;; where we're doing exhaustive testing of all possible inputs, or won't be used at all, as
            ;;; the input will be generated randomly.
            (define idx-variable-name (idx-var var))

            ;;; The max value that the index variable should run to (exclusive). This, in combination
            ;;; with the randomness flag, controls whether exhaustive testing occurs. E.g. if randomness
            ;;; isn't forced and the max bound is 256, then every variable up to 8 bits wide will be
            ;;; exhaustively tested.
            (define limit (min max-loop-bound (expt 2 (bvlen var))))

            ;;; Open the for loop that iterates over this variable.
            (format "for (uint64_t ~a = 0; ~a < ~a; ++~a) {"
                    idx-variable-name
                    idx-variable-name
                    limit
                    idx-variable-name)))

        ;;; The sequence of variable assignments that set the module's input values in this loop
        ;;; iteration. When a variable is 8 bits wide or less, then we test all of its possible values.
        ;;; We do this by setting the input value to the index variable for this variable. The index
        ;;; variable counts from 0 to the max value; e.g. to 1 for a 1 bit number, or 255 for an 8 bit
        ;;; number. This gives us exhaustive testing on this input. In the case where the variable is
        ;;; greater than 8 bits wide, we use randomly generated values for the input. Randomness can
        ;;; also be forced by using force-random-values.
        (define value-definitions
          (for/list ([var (symbolics bv-expr)])
            (format
             "uint64_t ~a = ~a;"
             (val-var var)
             (if (|| force-random-values (> (bvlen var) 8))
                 "(((uint64_t)std::rand() & 0xff) << 56) | (((uint64_t)std::rand() & 0xff) << 48) | (((uint64_t)std::rand() & 0xff) << 40)| (((uint64_t)std::rand() & 0xff) << 32) | (std::rand() & 0xff << 24) | (std::rand() & 0xff << 16) | (std::rand() & 0xff << 8) | (std::rand() & 0xff)"
                 (idx-var var)))))

        ;;; The sequence of assignments of the values to the module inputs.
        (define module-input-assignments
          (for/list ([var (symbolics bv-expr)])
            (format "top->~a = ~a;" var (val-var var))))

        ;;; Closing the for loops.
        (define for-loop-closings (make-list (length (symbolics bv-expr)) "}"))

        (define code
          (format
           #<<here-string-delimiter
{
  // bv-expr: ~a
  ~a *top = new ~a{contextp};
  ~a
  ~a
  ~a
  top->eval();
  uint64_t out_actual = top->out0;
  // Constants are suffixed with "ULL" to be safe.
  uint64_t out_expected = ~a & ~aULL;
  if (out_actual != out_expected) printf("actual != expected: %" PRIu64 " != %" PRIu64 "\n", out_actual, out_expected);
  // Uncomment this if you want to see verbose output.
  // else printf("actual == expected: %" PRIu64 " == %" PRIu64 "\n", out_actual, out_expected);
  assert(out_actual == out_expected);
  ~a
  delete top;
}
here-string-delimiter
           ;
           bv-expr
           verilated-type-name
           verilated-type-name
           (string-join for-loop-openings "\n")
           (string-join value-definitions "\n")
           (string-join module-input-assignments "\n")
           (bvexpr->cexpr bv-expr)
           (sub1 (expt 2 (bvlen bv-expr)))
           (string-join for-loop-closings "\n")))

        (list code verilated-type-name verilog-file)))

    (define results
      (for/list ([to-simulate-value to-simulate-values])
        (generate-code-for-lakeroad-expression to-simulate-value)))
    (define verilated-type-names (map second results))
    (define verilog-files (map third results))
    (define includes
      (string-join
       (for/list ([verilog-file verilog-files])
         (format "#include \"~a\""
                 (build-path
                  working-directory
                  (format "V~a.h" (path-replace-extension (file-name-from-path verilog-file) "")))))
       "\n"))

    ;;; Make the contents of a testbench file.
    (define (make-testbench-source includes test-code)
      (format
       #<<here-string-delimiter
#include <cstdlib>
#include <inttypes.h>
~a

int main(int argc, char **argv)
{
  std::srand(23);

  VerilatedContext *contextp = new VerilatedContext;
  contextp->commandArgs(argc, argv);

  ~a

  delete contextp;
  return 0;
}
here-string-delimiter
       ;
       includes
       test-code))

    (define testbench-files
      (for/list ([test-code (map first results)])
        (define f (make-temporary-file "rkttmp_testbench_~a.cc" #f working-directory))
        (log-info "testbench file: ~a" f)
        (display-to-file (make-testbench-source includes test-code) f #:exists 'update)
        f))

    (define include-dirs-string
      (string-join (for/list ([include-dir include-dirs])
                     (format "-I~a" include-dir))))

    (define makefile-source
      (format
       #<<here-string-delimiter
# Builds Verilog .v files into a Verilated testbench.
# Environment variable arguments:
# - VERILOG_FILES: The Verilog files to Verilate. These contain the modules to test.
# - TESTBENCHES: The testbench files to build.
# - VFLAGS: Flags for Verilator.
# - CXXFLAGS: Flags for C++ compiler.
# - VERILATOR_INCLUDE_DIR: Path to Verilator's include directory.

VERILATOR = verilator
VERILATOR_INCLUDE_DIR = ~a
VERILOG_FILES = ~a
TESTBENCHES = ~a
TESTBENCH_EXECUTABLES = $(TESTBENCHES:.cc=.out)
VFLAGS = ~a ~a ~a

ifndef VERILATOR_INCLUDE_DIR
$(error VERILATOR_INCLUDE_DIR is not set)
endif

ifndef VERILOG_FILES
$(error VERILOG_FILES is not set)
endif

ifndef TESTBENCHES
$(error TESTBENCHES is not set)
endif

.PHONY: run_all

run_all: $(TESTBENCH_EXECUTABLES)

%.out: %.cc $(VERILATOR_INCLUDE_DIR)/verilated.cpp $(VERILATOR_INCLUDE_DIR)/verilated_threads.cpp $(VERILOG_FILES:.v=.vo)
  # -lstdc++ fixes build problems on Mac.
  # The + passes information about the jobserver to sub-commands. Not sure if it has any effect here.
	+$(CXX) $(CFLAGS) -I$(VERILATOR_INCLUDE_DIR) -faligned-new -lstdc++ -std=c++11 $^ -o $@ -lpthread
	$@ || (echo "Test failed: $@"; exit 1)

%.vo: %.v
  # The CFLAGS values fix issues with timing functions not being found.
  # The + passes information about the jobserver to sub-commands. Not sure if it has any effect here.
	+$(VERILATOR) --no-timing -Wall --CFLAGS "-DVL_TIME_STAMP64 -DVL_NO_LEGACY" -Mdir . --cc --build $(VFLAGS) $<
  # Copy the compiled result, which is named V<filename>__ALL.o, to <filename>.vo.
	cp $(addprefix $(dir $<)/V, $(patsubst %.v,%__ALL.o,$(notdir $<))) $@

here-string-delimiter
       ;
       verilator-include-dir
       (string-join (map path->string verilog-files) " ")
       (string-join (map path->string testbench-files) " ")
       include-dirs-string
       extra-verilator-args
       (string-join (map path->string additional-files-to-build) " ")))

    (display-to-file makefile-source (build-path working-directory "Makefile") #:exists 'error)

    (define make-invocation
      (format "make --no-builtin-rules -j ~a -C ~a run_all" num-make-jobs working-directory))

    (log-info "invoking make:\n~a" make-invocation)
    ;;; It seems like using (process) might be slow? Am I using it wrong?
    ;;;  (match-let ([(list proc-stdout stdin proc-id stderr control-fn) (process make-invocation)])
    ;;;    (control-fn 'wait)
    ;;;    (when (not (equal? 0 (control-fn 'exit-code)))
    ;;;      (error (format "Calling make command failed.\nCommand:\n~a\nSTDOUT:\n~a\nSTDERR:\n~a"
    ;;;                     make-invocation
    ;;;                     (port->string proc-stdout)
    ;;;                     (port->string stderr))))
    ;;;    (close-input-port proc-stdout)
    ;;;    (close-input-port stderr)
    ;;;    (close-output-port stdin))
    ;;;
    ;;; Throw away stdout, keep stderr. If anything is printed on stderr, we should likely be failing anyway.

    (parameterize ([current-output-port (open-output-bytes)])
      (system make-invocation))))

(module+ test

  (require rosette
           rackunit)

  (when (not (getenv "VERILATOR_INCLUDE_DIR"))
    (raise "VERILATOR_INCLUDE_DIR not set"))
  (test-case "Simple multi-design Verilator test"
    (check-true
     (normal? (with-vc (with-terms (begin
                                     (define-symbolic a b (bitvector 8))
                                     (check-true (simulate-with-verilator
                                                  (list (to-simulate (lr:bv (bv->signal a)) a)
                                                        (to-simulate (lr:bv (bv->signal b)) b))
                                                  (getenv "VERILATOR_INCLUDE_DIR")))))))))

  ;;; TODO(@gussmith23): Capture the output of this so that we don't print an assertion failure during
  ;;; testing.
  (test-case "Simple multi-design Verilator test 2"
    (check-true (normal? (with-vc (with-terms (begin
                                                (define-symbolic a b (bitvector 8))
                                                (displayln "Note: expecting an assertion failure:")
                                                (check-false
                                                 (simulate-with-verilator
                                                  (list (to-simulate (lr:bv (bv->signal a)) a)
                                                        (to-simulate (lr:bv (bv->signal b))
                                                                     (bvnot b)))
                                                  (getenv "VERILATOR_INCLUDE_DIR"))))))))))

;;; Test a Lakeroad expression using a simple testbench.
;;;
;;; The testbench simply does an exhaustive check over all inputs.
;;;
;;; lakeroad-expr: The Lakeroad expr to test.
;;;
;;; bv-expr: The expression (in Rosette's bitvector language) which the Lakeroad expression should be
;;;   tested against.
;;;
;;; Returns: The return value returned by running the compiled testbench executable.
(define (simulate-expr lakeroad-expr
                       bv-expr
                       #:includes [includes '()]
                       #:include-dirs [include-dirs '()]
                       #:extra-verilator-args [extra-verilator-args ""]
                       #:verilator-jobs [verilator-jobs 2])
  ;;; TODO anonymize.

  (define json-file (make-temporary-file "rkttmp~a.json"))
  (define verilog-file (make-temporary-file "rkttmp~a.v"))
  (log-info "~a" verilog-file)
  (display-to-file (jsexpr->string (lakeroad->jsexpr lakeroad-expr)) json-file #:exists 'update)

  (match-let ([(list proc-stdout stdin proc-id stderr control-fn)
               (process (format "yosys -p 'read_json ~a; write_verilog ~a'" json-file verilog-file))])
    (control-fn 'wait)
    (when (not (equal? 0 (control-fn 'exit-code)))
      (error (format "Converting JSON to Verilog via Yosys failed:\nSTDOUT:\n~a\nSTDERR:\n~a"
                     (port->string proc-stdout)
                     (port->string stderr))))
    (close-input-port proc-stdout)
    (close-input-port stderr)
    (close-output-port stdin))

  ;;; Input and output bitwidths. We use this to determine which testbench to use.
  (define out-bitwidth (bvlen bv-expr))
  (define max-in-bitwidth
    (if (empty? (symbolics bv-expr)) 0 (apply max (map bvlen (symbolics bv-expr)))))
  (define max-bitwidth (max out-bitwidth max-in-bitwidth))
  (define testbench-filename
    (match max-bitwidth
      [_
       #:when (<= max-bitwidth 8)
       "testbench.cc.template"]
      [_
       #:when (<= max-bitwidth 16)
       "testbench_bw16.cc.template"]
      [_
       #:when (<= max-bitwidth 32)
       "testbench_bw32.cc.template"]
      [_
       #:when (<= max-bitwidth 64)
       "testbench_bw64.cc.template"]))

  (define verilator-make-dir (make-temporary-file "rkttmp~a" 'directory))
  (define verilated-type-name
    (format "V~a" (path-replace-extension (file-name-from-path verilog-file) "")))
  (define testbench-source
    (format (file->string (build-path (get-lakeroad-directory) "racket" testbench-filename))
            (path-replace-extension (build-path verilator-make-dir verilated-type-name) ".h")
            verilated-type-name
            (if (>= (length (symbolics bv-expr)) 1)
                (format "top->~a = ((~a)&~a);"
                        (first (symbolics bv-expr))
                        (- (expt 2 (bvlen (first (symbolics bv-expr)))) 1)
                        (first (symbolics bv-expr)))
                "")
            (if (>= (length (symbolics bv-expr)) 2)
                (format "top->~a = ((~a)&~a);"
                        (second (symbolics bv-expr))
                        (- (expt 2 (bvlen (second (symbolics bv-expr)))) 1)
                        (second (symbolics bv-expr)))
                "")
            (if (>= (length (symbolics bv-expr)) 3)
                (format "top->~a = ((~a)&~a);"
                        (third (symbolics bv-expr))
                        (- (expt 2 (bvlen (third (symbolics bv-expr)))) 1)
                        (third (symbolics bv-expr)))
                "")
            (if (>= (length (symbolics bv-expr)) 4)
                (format "top->~a = ((~a)&~a);"
                        (fourth (symbolics bv-expr))
                        (- (expt 2 (bvlen (fourth (symbolics bv-expr)))) 1)
                        (fourth (symbolics bv-expr)))
                "")
            (if (>= (length (symbolics bv-expr)) 5)
                (format "top->~a = ((~a)&~a);"
                        (fifth (symbolics bv-expr))
                        (- (expt 2 (bvlen (fifth (symbolics bv-expr)))) 1)
                        (fifth (symbolics bv-expr)))
                "")
            (if (>= (length (symbolics bv-expr)) 6)
                (format "top->~a = ((~a)&~a);"
                        (sixth (symbolics bv-expr))
                        (- (expt 2 (bvlen (sixth (symbolics bv-expr)))) 1)
                        (sixth (symbolics bv-expr)))
                "")
            (if (>= (length (symbolics bv-expr)) 1)
                (min 256 (expt 2 (bvlen (first (symbolics bv-expr)))))
                "1") ; The min of 256 is arbitrary. Just don't want it to run forever.
            (if (>= (length (symbolics bv-expr)) 2)
                (min 256 (expt 2 (bvlen (second (symbolics bv-expr)))))
                "1") ; The min of 256 is arbitrary. Just don't want it to run forever.
            (if (>= (length (symbolics bv-expr)) 3)
                (min 256 (expt 2 (bvlen (third (symbolics bv-expr)))))
                "1") ; The min of 256 is arbitrary. Just don't want it to run forever.
            (if (>= (length (symbolics bv-expr)) 4)
                (min 256 (expt 2 (bvlen (fourth (symbolics bv-expr)))))
                "1") ; The min of 256 is arbitrary. Just don't want it to run forever.
            (if (>= (length (symbolics bv-expr)) 5)
                (min 256 (expt 2 (bvlen (fifth (symbolics bv-expr)))))
                "1") ; The min of 256 is arbitrary. Just don't want it to run forever.
            (if (>= (length (symbolics bv-expr)) 6)
                (min 256 (expt 2 (bvlen (sixth (symbolics bv-expr)))))
                "1") ; The min of 256 is arbitrary. Just don't want it to run forever.
            verilated-type-name
            verilated-type-name
            (bvexpr->cexpr bv-expr)
            out-bitwidth
            (bvexpr->cexpr bv-expr)))

  (define testbench-file (make-temporary-file "rkttmp~a.cc"))
  (log-info "~a" testbench-file)
  (display-to-file testbench-source testbench-file #:exists 'update)

  (define verilator-unisims-dir (build-path (get-lakeroad-directory) "verilator_xilinx"))
  (define includes-string
    (string-join (for/list ([include includes])
                   (format "~a" include))))
  (define include-dirs-string
    (string-join (for/list ([include-dir include-dirs])
                   (format "-I~a" include-dir))))

  ; TODO(@gussmith23) hardcoded dir
  (define verilator-command
    (format
     "verilator -j ~a --relative-includes -Wall -Wno-MULTITOP -Wno-TIMESCALEMOD -Wno-UNUSED -Wno-DECLFILENAME -Wno-PINMISSING -Wno-UNOPTFLAT --build --exe --cc --Mdir ~a ~a ~a ~a ~a ~a"
     verilator-jobs
     verilator-make-dir
     verilog-file
     includes-string
     testbench-file
     include-dirs-string
     extra-verilator-args))
  (log-info "~a" verilator-command)

  (match-let ([(list proc-stdout stdin proc-id stderr control-fn) (process verilator-command)])
    ;;; Wait until Verilator completes.
    (control-fn 'wait)
    ;;; Error out if it errors.
    (when (not (equal? 0 (control-fn 'exit-code)))
      (error (format "Verilator command failed:\n~a\nSTDOUT:\n~a\nSTDERR:\n~a"
                     verilator-command
                     (port->string proc-stdout)
                     (port->string stderr))))
    (close-input-port proc-stdout)
    (close-input-port stderr)
    (close-output-port stdin))

  (system* (build-path verilator-make-dir verilated-type-name)))
