#lang racket

(require "ultrascale.rkt"
         rosette
         "programs-to-synthesize.rkt"
         "circt-comb-operators.rkt"
         rosette/solver/smt/boolector)

(current-solver (boolector))

(define-symbolic cin (bitvector 1))
(define-symbolic lut-memory-a (bitvector 64))
(define-symbolic lut-memory-b (bitvector 64))
(define-symbolic lut-memory-c (bitvector 64))
(define-symbolic lut-memory-d (bitvector 64))
(define-symbolic lut-memory-e (bitvector 64))
(define-symbolic lut-memory-f (bitvector 64))
(define-symbolic lut-memory-g (bitvector 64))
(define-symbolic lut-memory-h (bitvector 64))

(define-symbolic mux-selector-a (bitvector 2))
(define-symbolic mux-selector-b (bitvector 2))
(define-symbolic mux-selector-c (bitvector 2))
(define-symbolic mux-selector-d (bitvector 2))
(define-symbolic mux-selector-e (bitvector 2))
(define-symbolic mux-selector-f (bitvector 2))
(define-symbolic mux-selector-g (bitvector 2))
(define-symbolic mux-selector-h (bitvector 2))

(define-symbolic logical-input-0 (bitvector 8))
(define-symbolic logical-input-1 (bitvector 8))
(define-symbolic logical-input-2 (bitvector 8))
(define-symbolic logical-input-3 (bitvector 8))
(define-symbolic logical-input-4 (bitvector 8))
(define-symbolic logical-input-5 (bitvector 8))

(define-symbolic mask (bitvector 48))

(define out
  (apply ultrascale-clb
         cin
         lut-memory-a
         lut-memory-b
         lut-memory-c
         lut-memory-d
         lut-memory-e
         lut-memory-f
         lut-memory-g
         lut-memory-h
         mux-selector-a
         mux-selector-b
         mux-selector-c
         mux-selector-d
         mux-selector-e
         mux-selector-f
         mux-selector-g
         mux-selector-h
         (ultrascale-logical-to-physical-inputs-with-mask mask
                                                          (list logical-input-0
                                                                logical-input-1
                                                                logical-input-2
                                                                logical-input-3
                                                                logical-input-4
                                                                logical-input-5))))

(define logical-inputs
  (list logical-input-0
        logical-input-1
        logical-input-2
        logical-input-3
        logical-input-4
        logical-input-5))

(define (helper f arity)
  (if (equal? arity 6) (error "arity 6 not supported yet") '())
  (match-let
   ([soln
     ; TODO(@gussmith23) Time synthesis. For some reason, time-apply doesn't mix well with synthesize.
     ; And time just prints to stdout, which is not ideal (but we could deal with it if necessary).
     (synthesize
      #:forall logical-inputs
      #:guarantee
      (begin

        ; Assume unused inputs are zero. We can set them to whatever we want, but it's important that
        ; we tell the solver that they're unused and unimportant, and setting them to a constant value
        ; is the way to this.
        ; When these aren't set, synthesis takes about 10-20x longer (20mins vs 1.5mins). In this case,
        ; we synthesize a LUT that is correct for inputs 0 and 1 regardless of the settings of the
        ; other inputs. I'm not sure if that's useful. I also wonder if there's a faster way to get
        ; the same result. E.g. either 1. assume 2-5 are all 0 and then manually edit the resulting LUT
        ; and duplicate the "correct" parts of the LUT memory into the rest of the LUT memory, OR, 2.,
        ; a more graceful solution, `assume` some predicates that basically say that 2-5 "don't matter"
        ; and that the outputs for a given 0 and 1 should be the same for any 2-5.
        (for ([logical-input (list-tail logical-inputs arity)])
          (assume (bvzero? logical-input)))

        ; Assert that the output of the CLB implements the requested function f.
        (assert (bveq (apply f (take logical-inputs arity)) out))))])
   ; Print the output. Unwrap the model if there is one, so that all of the values print.
   ;;;  (println f)
   ;;;  (if (sat? soln) (pretty-print (model soln)) (println soln))
   ;;;  (displayln "")
   soln))

; Even in files that are just full of tests, I still stick the tests in a submodule. This is mainly to
; allow for opening the file in an interpreter without running all the tests. To run tests, run
; `raco test <filename>`.
(module+ test
  (require rackunit)

  ; Test synthesis of various functions on UltraScale+.
  ; If any test starts failing, it's presumably because our UltraScale+ model changed. The question
  ; is, was the change correct?
  ; If a check-true test fails, then the model became less flexible.
  ; If a check-false test fails, then the model became more flexible.
  ; It's up to you to determine whether the change was correct!

  ; Simple test: identify function.
  (check-true (sat? (helper (lambda (a) a) 1)))

  ; CIRCT Comb dialect.
  (check-true (sat? (helper circt-comb-add 2)))
  (check-true (sat? (helper circt-comb-and 2)))
  (check-false (sat? (helper circt-comb-divs 2)))
  (check-false (sat? (helper circt-comb-divu 2)))
  (check-false (sat? (helper (lambda (a b) (zero-extend (circt-comb-icmp a b) (bitvector 8))) 2)))
  (check-false (sat? (helper circt-comb-mods 2)))
  (check-false (sat? (helper circt-comb-mul 2)))
  (check-true (sat? (helper circt-comb-mux 3)))
  (check-true (sat? (helper circt-comb-or 2)))
  (check-false (sat? (helper (lambda (a) (zero-extend (circt-comb-parity a) (bitvector 8))) 1)))
  (check-false (sat? (helper circt-comb-shl 2)))
  (check-false (sat? (helper circt-comb-shrs 2)))
  (check-false (sat? (helper circt-comb-shru 2)))
  (check-true (sat? (helper circt-comb-sub 2)))
  (check-true (sat? (helper circt-comb-xor 2)))

  ; Bithack examples.
  (check-false (sat? (helper floor-avg 2)))
  (check-true (sat? (helper bithack3 2)))
  (check-true (sat? (helper bithack2 2)))
  (check-true (sat? (helper bithack1 2)))
  (check-false (sat? (helper ceil-avg 2)))
  (check-true (sat? (helper bvadd 2)))
  (check-false (sat? (helper cycle 4))))

(define (end-to-end-test f arity c-operator)
  (if (not (equal? arity 2)) (error "only arity 2 supported right now") '())

  (define verilator-make-dir (make-temporary-file "rkttmp~a" 'directory))
  ;(displayln verilator-make-dir)

  (define soln
    ; TODO(@gussmith23) Time synthesis. For some reason, time-apply doesn't mix well with synthesize.
    ; And time just prints to stdout, which is not ideal (but we could deal with it if necessary).
    (synthesize
     #:forall logical-inputs
     #:guarantee
     (begin

       (assert (not (bveq mux-selector-a (bv 3 2))))
       (assert (not (bveq mux-selector-b (bv 3 2))))
       (assert (not (bveq mux-selector-c (bv 3 2))))
       (assert (not (bveq mux-selector-d (bv 3 2))))
       (assert (not (bveq mux-selector-e (bv 3 2))))
       (assert (not (bveq mux-selector-f (bv 3 2))))
       (assert (not (bveq mux-selector-g (bv 3 2))))
       (assert (not (bveq mux-selector-h (bv 3 2))))

       ; Mask not yet fully implemented. (current impl is buggy; I think we need the carry chain.)
       (assert (bvzero? mask))

       ; Assume unused inputs are zero. We can set them to whatever we want, but it's important that
       ; we tell the solver that they're unused and unimportant, and setting them to a constant value
       ; is the way to this.
       ; When these aren't set, synthesis takes about 10-20x longer (20mins vs 1.5mins). In this case,
       ; we synthesize a LUT that is correct for inputs 0 and 1 regardless of the settings of the
       ; other inputs. I'm not sure if that's useful. I also wonder if there's a faster way to get
       ; the same result. E.g. either 1. assume 2-5 are all 0 and then manually edit the resulting LUT
       ; and duplicate the "correct" parts of the LUT memory into the rest of the LUT memory, OR, 2.,
       ; a more graceful solution, `assume` some predicates that basically say that 2-5 "don't matter"
       ; and that the outputs for a given 0 and 1 should be the same for any 2-5.
       (for ([logical-input (list-tail logical-inputs arity)])
         (assume (bvzero? logical-input)))

       ; Assert that the output of the CLB implements the requested function f.
       (assert (bveq (apply f (take logical-inputs arity)) out)))))

  (define verilog-source
    (compile-clb-to-verilog "example"
                            (model soln)
                            cin
                            lut-memory-a
                            lut-memory-b
                            lut-memory-c
                            lut-memory-d
                            lut-memory-e
                            lut-memory-f
                            lut-memory-g
                            lut-memory-h
                            mux-selector-a
                            mux-selector-b
                            mux-selector-c
                            mux-selector-d
                            mux-selector-e
                            mux-selector-f
                            mux-selector-g
                            mux-selector-h
                            mask))
  (define verilog-file (make-temporary-file "rkttmp~a.v"))
  (call-with-output-file verilog-file (lambda (out) (display verilog-source out)) #:exists 'update)
  ;(displayln verilog-file)
  (define verilated-type-name
    (format "V~a" (path-replace-extension (file-name-from-path verilog-file) "")))

  (define testbench-source
    (format
     #<<here-string-delimiter
#include "~a"
#include "verilated.h"

int run(~a *top, int a, int b)
{
  top->input_a = ((a & (1 << 0)) >> 0) | (((b & (1 << 0)) >> 0) << 1);
  top->input_b = ((a & (1 << 1)) >> 1) | (((b & (1 << 1)) >> 1) << 1);
  top->input_c = ((a & (1 << 2)) >> 2) | (((b & (1 << 2)) >> 2) << 1);
  top->input_d = ((a & (1 << 3)) >> 3) | (((b & (1 << 3)) >> 3) << 1);
  top->input_e = ((a & (1 << 4)) >> 4) | (((b & (1 << 4)) >> 4) << 1);
  top->input_f = ((a & (1 << 5)) >> 5) | (((b & (1 << 5)) >> 5) << 1);
  top->input_g = ((a & (1 << 6)) >> 6) | (((b & (1 << 6)) >> 6) << 1);
  top->input_h = ((a & (1 << 7)) >> 7) | (((b & (1 << 7)) >> 7) << 1);
  top->eval();
  return top->out;
}

int main(int argc, char **argv, char **env)
{
  VerilatedContext *contextp = new VerilatedContext;
  contextp->commandArgs(argc, argv);
  ~a *top = new ~a{contextp};

  for (int a = 0; a <= 255; a++)
  {
    for (int b = 0; b <= 255; b++)
    {
      int out = run(top, a, b);
      //printf("%d & %d == %d, should equal %d\n", a, b, out, a & b);
      //printf("input_a= %d, input_b= %d\n", top->input_a, top->input_b);
      assert(out == (a ~a b));
    }
  }

  delete top;
  delete contextp;
  return 0;
}

here-string-delimiter
     ;
     (path-replace-extension (build-path verilator-make-dir verilated-type-name) ".h")
     verilated-type-name
     verilated-type-name
     verilated-type-name
     c-operator))

  (define testbench-file (make-temporary-file "rkttmp~a.cc"))
  (call-with-output-file testbench-file
                         (lambda (out) (display testbench-source out))
                         #:exists 'update)
  ;(displayln testbench-file)

  (if (not (getenv "LAKEROAD_DIR")) (error "LAKEROAD_DIR must be set to base dir of Lakeroad") '())
  (define verilator-unisims-dir (build-path (getenv "LAKEROAD_DIR") "verilator-unisims"))
  (displayln verilator-unisims-dir)

  ; TODO(@gussmith23) hardcoded dir
  (if (not
       (system
        (format
         "verilator -Wall -Wno-TIMESCALEMOD -Wno-UNUSED -Wno-DECLFILENAME -Wno-PINMISSING --Mdir ~a --cc ~a -I ~a/LUT6_2.v --build --exe ~a"
         verilator-make-dir
         verilog-file
         verilator-unisims-dir
         testbench-file)))
      (error "Verilator failed")
      '())

  (system* (build-path verilator-make-dir verilated-type-name)))

(module+ test
  (require rackunit)
  (check-true (end-to-end-test bvand 2 "&"))
  (check-true (end-to-end-test bvxor 2 "^"))
  (check-true (end-to-end-test bvor 2 "|")))
