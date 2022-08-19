#lang errortrace racket

(provide simulate-expr
         to-simulate
         simulate-with-verilator)

(require json
         "compile-to-json.rkt"
         rosette
         "utils.rkt"
         "interpreter.rkt"
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
(define/contract
 (simulate-with-verilator to-simulate-values
                          verilator-include-dir
                          #:additional-files-to-build [additional-files-to-build '()]
                          #:include-dirs [include-dirs '()]
                          #:extra-verilator-args [extra-verilator-args ""]
                          #:extra-cc-args [extra-cc-args ""]
                          #:num-make-jobs [num-make-jobs (processor-count)])
 (->* ((listof to-simulate?) path-string?)
      (#:additional-files-to-build (listof path-string?)
       #:include-dirs (listof path-string?)
       #:extra-verilator-args string?
       #:extra-cc-args string?
       #:num-make-jobs integer?)
      boolean?)
 (begin
   (define working-directory (make-temporary-file "rkttmp~a" 'directory))
   (log-info "Working directory: ~a" working-directory)

   ;;; Converts Lakeroad expression to a Verilog module, writes it to a .v file, and generates the
   ;;; testbench code to test the Verilog module.
   (define/contract
    (generate-code-for-lakeroad-expression to-simulate-value)
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

          ;;; The max value that the index variable should run to (exclusive). We only do exhaustive
          ;;; testing for up to 8 bits, so we max out at 256. Thus, for anything higher than 8 bits,
          ;;; we will do random testing with 256 randomly-selected values of var. We can make this
          ;;; more configurable if we want.
          (define limit (min 256 (expt 2 (bvlen var))))

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
      ;;; greater than 8 bits wide, we use randomly generated values for the input.
      (define value-definitions
        (for/list ([var (symbolics bv-expr)])
          (format
           "uint64_t ~a = ~a;"
           (val-var var)
           (if (> (bvlen var) 8)
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
  if (out_actual != out_expected) printf("actual != expected: %llu != %llu\n", out_actual, out_expected);
  // Uncomment this if you want to see verbose output.
  // else printf("actual == expected: %llu == %llu\n", out_actual, out_expected);
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
   (define tests (string-join (map first results) "\n"))
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

   (define testbench-source
     (format
      #<<here-string-delimiter
#include <cstdlib>
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
      tests))

   (define testbench-file (make-temporary-file "rkttmp_testbench_~a.cc" #f working-directory))
   (display-to-file testbench-source testbench-file #:exists 'update)
   (log-info "testbench file: ~a" testbench-file)

   (define include-dirs-string
     (string-join (for/list ([include-dir include-dirs])
                    (format "-I~a" include-dir))))

   (define makefile-source
     #<<here-string-delimiter
# Builds Verilog .v files into a Verilated testbench.
# Environment variable arguments:
# - VERILOG_FILES: The Verilog files to Verilate. These contain the modules to test.
# - TESTBENCH: The testbench file to build.
# - VFLAGS: Flags for Verilator.
# - CXXFLAGS: Flags for C++ compiler.
# - VERILATOR_INCLUDE_DIR: Path to Verilator's include directory.

VERILATOR = verilator

ifndef VERILATOR_INCLUDE_DIR
$(error VERILATOR_INCLUDE_DIR is not set)
endif

ifndef VERILOG_FILES
$(error VERILOG_FILES is not set)
endif

ifndef TESTBENCH
$(error TESTBENCH is not set)
endif

out: $(VERILATOR_INCLUDE_DIR)/verilated.cpp $(TESTBENCH) $(VERILOG_FILES:.v=.v.o)
  # -lstdc++ and -stdlib=libc++ fix build problems on Mac.
	$(CXX) $(CFLAGS) -I$(VERILATOR_INCLUDE_DIR) -lstdc++ -stdlib=libc++ -std=c++11 -Wall -Wextra -Werror $^ -o $@

%.v.o: %.v
  # The CFLAGS values fix issues with timing functions not being found.
	$(VERILATOR) -Wall --CFLAGS "-DVL_TIME_STAMP64 -DVL_NO_LEGACY" -Mdir . --cc --build $(VFLAGS) $<
  # Copy the compiled result, which is named V<filename>__ALL.o, to <filename>.v.o.
	cp $(addprefix $(dir $<)/V, $(patsubst %.v,%__ALL.o,$(notdir $<))) $@

here-string-delimiter
     ;
     )

   (display-to-file makefile-source (build-path working-directory "Makefile") #:exists 'error)

   (define make-invocation
     (format
      #<<here-string-delimiter
VERILATOR_INCLUDE_DIR=~a \
VERILOG_FILES="~a" \
TESTBENCH=~a \
VFLAGS="~a ~a ~a" \
make --no-builtin-rules -j ~a -C ~a out
here-string-delimiter
      ;
      verilator-include-dir
      (string-join (map path->string verilog-files) " ")
      testbench-file
      include-dirs-string
      extra-verilator-args
      (string-join (map path->string additional-files-to-build) " ")
      num-make-jobs
      working-directory))

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
     (when (not (system make-invocation))
       (error "make invocation failed")))

   (log-info "running testbench")
   (system* (build-path working-directory "out"))))

(module+ test

  (require rosette
           rackunit)

  (test-case "Simple multi-design Verilator test"
             (check-true (normal? (with-vc (with-terms (begin
                                                         (define-symbolic a b (bitvector 8))
                                                         (check-true (simulate-with-verilator
                                                                      (list (to-simulate a a)
                                                                            (to-simulate b b))))))))))

  ;;; TODO(@gussmith23): Capture the output of this so that we don't print an assertion failure during
  ;;; testing.
  (test-case "Simple multi-design Verilator test 2"
             (check-true
              (normal? (with-vc (with-terms (begin
                                              (define-symbolic a b (bitvector 8))
                                              (displayln "Note: expecting an assertion failure:")
                                              (check-false (simulate-with-verilator
                                                            (list (to-simulate a a)
                                                                  (to-simulate b (bvnot b))))))))))))

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
  (when (not (getenv "LAKEROAD_DIR"))
    (error "LAKEROAD_DIR must be set to base dir of Lakeroad"))

  (define json-file (make-temporary-file "rkttmp~a.json"))
  (define verilog-file (make-temporary-file "rkttmp~a.v"))
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
    (format (file->string (build-path (getenv "LAKEROAD_DIR") "racket" testbench-filename))
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
  (display-to-file testbench-source testbench-file #:exists 'update)

  (define verilator-unisims-dir (build-path (getenv "LAKEROAD_DIR") "verilator_xilinx"))
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
