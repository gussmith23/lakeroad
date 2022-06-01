#lang errortrace racket

(require "interpreter.rkt"
         "ultrascale.rkt"
         rosette
         "programs-to-synthesize.rkt"
         "circt-comb-operators.rkt"
         rosette/solver/smt/boolector
         rosette/lib/synthax
         "utils.rkt")

(current-solver (boolector))

(define (helper f logical-inputs)
  (when (>= (length logical-inputs) 6)
    (error "arity 6 not supported yet; >6 not possible"))

  (let* (;;; Make sure there are six logical inputs.
         ;;; Note: it's important that all unused inputs get set to HIGH. This is most important for
         ;;; the sixth input, as on Xilinx UltraScale+, the sixth input to each LUT must be held high
         ;;; to enable two distinct outputs.
         [padded-logical-inputs
          (append logical-inputs (make-list (- 6 (length logical-inputs)) (bv #xff 8)))]
         ;;; Replicate any 1-bit inputs to length 8.
         [padded-logical-inputs
          (map (lambda (v) (if (equal? 1 (bvlen v)) (apply concat (make-list 8 v)) v))
               padded-logical-inputs)]
         ;;; Make sure the logical inputs are length 8.
         [_unused (map (lambda (v)
                         (when (not (equal? 8 (bvlen v)))
                           (error "All inputs must end up with length 8")))
                       padded-logical-inputs)]
         [expr `(physical-to-logical-mapping
                 ,(choose '(bitwise) `(choose-one ,(bv 0 1)))
                 (ultrascale-plus-clb
                  ,(?? (bitvector 1))
                  ,(?? (bitvector 64))
                  ,(?? (bitvector 64))
                  ,(?? (bitvector 64))
                  ,(?? (bitvector 64))
                  ,(?? (bitvector 64))
                  ,(?? (bitvector 64))
                  ,(?? (bitvector 64))
                  ,(?? (bitvector 64))
                  ,(?? (bitvector 2))
                  ,(?? (bitvector 2))
                  ,(?? (bitvector 2))
                  ,(?? (bitvector 2))
                  ,(?? (bitvector 2))
                  ,(?? (bitvector 2))
                  ,(?? (bitvector 2))
                  ,(?? (bitvector 2))
                  (logical-to-physical-mapping (bitwise) ,padded-logical-inputs)))]

         [out (first (interpret expr))]
         ; TODO(@gussmith23) Time synthesis. For some reason, time-apply doesn't mix well with synthesize.
         ; And time just prints to stdout, which is not ideal (but we could deal with it if necessary).
         [soln (synthesize #:forall padded-logical-inputs
                           #:guarantee
                           (begin
                             ; Assert that the output of the CLB implements the requested function f.
                             (assert (bveq (apply f logical-inputs) out))))])
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

  (define-symbolic 8bit-a (bitvector 8))
  (define-symbolic 8bit-b (bitvector 8))
  (define-symbolic 8bit-c (bitvector 8))
  (define-symbolic 8bit-d (bitvector 8))
  (define-symbolic 1bit-e (bitvector 1))

  ; Simple test: identity function.
  (check-true (sat? (helper (lambda (a) a) (list 8bit-a))))

  ; CIRCT Comb dialect.
  (check-true (sat? (helper circt-comb-add (list 8bit-a 8bit-b))))
  (check-true (sat? (helper circt-comb-and (list 8bit-a 8bit-b))))
  (check-false (sat? (helper circt-comb-divs (list 8bit-a 8bit-b))))
  (check-false (sat? (helper circt-comb-divu (list 8bit-a 8bit-b))))
  (check-true (sat? (helper circt-comb-icmp (list 8bit-a 8bit-b))))
  (check-false (sat? (helper circt-comb-mods (list 8bit-a 8bit-b))))
  (check-false (sat? (helper circt-comb-mul (list 8bit-a 8bit-b))))
  (check-true (sat? (helper circt-comb-mux (list 1bit-e 8bit-a 8bit-b))))
  (check-true (sat? (helper circt-comb-or (list 8bit-a 8bit-b))))
  (check-false (sat? (helper (lambda (a) (zero-extend (circt-comb-parity a) (bitvector 8)))
                             (list 8bit-a))))
  (check-false (sat? (helper circt-comb-shl (list 8bit-a 8bit-b))))
  (check-false (sat? (helper circt-comb-shrs (list 8bit-a 8bit-b))))
  (check-false (sat? (helper circt-comb-shru (list 8bit-a 8bit-b))))
  (check-true (sat? (helper circt-comb-sub (list 8bit-a 8bit-b))))
  (check-true (sat? (helper circt-comb-xor (list 8bit-a 8bit-b))))

  ; Bithack examples.
  (check-false (sat? (helper floor-avg (list 8bit-a 8bit-b))))
  (check-true (sat? (helper bithack3 (list 8bit-a 8bit-b))))
  (check-true (sat? (helper bithack2 (list 8bit-a 8bit-b))))
  (check-true (sat? (helper bithack1 (list 8bit-a 8bit-b))))
  (check-false (sat? (helper ceil-avg (list 8bit-a 8bit-b))))
  (check-true (sat? (helper bvadd (list 8bit-a 8bit-b))))
  (check-false (sat? (helper cycle (list 8bit-a 8bit-b 8bit-c 8bit-d))))

  ;;; This test verifies that my manually-discovered implementation of icmp-equals works. This can
  ;;; be deleted if it starts acting up (as long as icmp is still synthesizing.)
  (test-begin
   (define-symbolic a (bitvector 8))
   (define-symbolic b (bitvector 8))
   (displayln
    (verify (assert (bveq (bool->bitvector (bveq a b))
                          (first (interpret
                                  `(physical-to-logical-mapping
                                    (choose-one ,(bv 0 1))
                                    (ultrascale-plus-clb
                                     ,(bv 1 1)
                                     ,(bv #x9000000000000000 64)
                                     ,(bv #x9000000000000000 64)
                                     ,(bv #x9000000000000000 64)
                                     ,(bv #x9000000000000000 64)
                                     ,(bv #x9000000000000000 64)
                                     ,(bv #x9000000000000000 64)
                                     ,(bv #x9000000000000000 64)
                                     ,(bv #x9000000000000000 64)
                                     ,(bv 3 2)
                                     ,(bv 3 2)
                                     ,(bv 3 2)
                                     ,(bv 3 2)
                                     ,(bv 3 2)
                                     ,(bv 3 2)
                                     ,(bv 3 2)
                                     ,(bv 3 2)
                                     ,(list (concat (bv #b1111 4) (bit 0 b) (bit 0 a))
                                            (concat (bv #b1111 4) (bit 1 b) (bit 1 a))
                                            (concat (bv #b1111 4) (bit 2 b) (bit 2 a))
                                            (concat (bv #b1111 4) (bit 3 b) (bit 3 a))
                                            (concat (bv #b1111 4) (bit 4 b) (bit 4 a))
                                            (concat (bv #b1111 4) (bit 5 b) (bit 5 a))
                                            (concat (bv #b1111 4) (bit 6 b) (bit 6 a))
                                            (concat (bv #b1111 4) (bit 7 b) (bit 7 a)))))))))))))

(define-symbolic logical-input-0 (bitvector 8))
(define-symbolic logical-input-1 (bitvector 8))
(define-symbolic logical-input-2 (bitvector 8))
(define-symbolic logical-input-3 (bitvector 8))
(define-symbolic logical-input-4 (bitvector 8))
(define-symbolic logical-input-5 (bitvector 8))

(define logical-inputs
  (list logical-input-0
        logical-input-1
        logical-input-2
        logical-input-3
        logical-input-4
        logical-input-5))

(define expr
  `(physical-to-logical-mapping
    (bitwise)
    (ultrascale-plus-clb ,(?? (bitvector 1))
                         ,(?? (bitvector 64))
                         ,(?? (bitvector 64))
                         ,(?? (bitvector 64))
                         ,(?? (bitvector 64))
                         ,(?? (bitvector 64))
                         ,(?? (bitvector 64))
                         ,(?? (bitvector 64))
                         ,(?? (bitvector 64))
                         ,(?? (bitvector 2))
                         ,(?? (bitvector 2))
                         ,(?? (bitvector 2))
                         ,(?? (bitvector 2))
                         ,(?? (bitvector 2))
                         ,(?? (bitvector 2))
                         ,(?? (bitvector 2))
                         ,(?? (bitvector 2))
                         (logical-to-physical-mapping
                          (bitwise-with-mask (,(?? (bitvector 6)) ,(?? (bitvector 6))
                                                                  ,(?? (bitvector 6))
                                                                  ,(?? (bitvector 6))
                                                                  ,(?? (bitvector 6))
                                                                  ,(?? (bitvector 6))
                                                                  ,(?? (bitvector 6))
                                                                  ,(?? (bitvector 6))))
                          ,logical-inputs))))

(define out (first (interpret expr)))

(define (end-to-end-test f arity c-operator)
  (if (> arity 3) (error "only arity 2 or 3 supported right now") '())

  (define verilator-make-dir (make-temporary-file "rkttmp~a" 'directory))
  ;(displayln verilator-make-dir)

  (define soln
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
       (assert (bveq (apply f (take logical-inputs arity)) out)))))

  (match-define `(physical-to-logical-mapping
                  (bitwise)
                  (ultrascale-plus-clb
                   ,cin
                   ,lut-memory-a
                   ,lut-memory-b
                   ,lut-memory-c
                   ,lut-memory-d
                   ,lut-memory-e
                   ,lut-memory-f
                   ,lut-memory-g
                   ,lut-memory-h
                   ,mux-selector-a
                   ,mux-selector-b
                   ,mux-selector-c
                   ,mux-selector-d
                   ,mux-selector-e
                   ,mux-selector-f
                   ,mux-selector-g
                   ,mux-selector-h
                   (logical-to-physical-mapping
                    (bitwise-with-mask
                     (,mask-a ,mask-b ,mask-c ,mask-d ,mask-e ,mask-f ,mask-g ,mask-h))
                    (,logical-input-0 ,logical-input-1
                                      ,logical-input-2
                                      ,logical-input-3
                                      ,logical-input-4
                                      ,logical-input-5))))
    (evaluate expr soln))

  (define verilog-source
    (compile-clb-to-verilog "example"
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
                            mask-a
                            mask-b
                            mask-c
                            mask-d
                            mask-e
                            mask-f
                            mask-g
                            mask-h))
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

int run(~a *top, uint8_t a, uint8_t b, uint8_t c)
{
  top->input_a = ((a & (1 << 0)) >> 0) | (((b & (1 << 0)) >> 0) << 1) | (((c & (1 << 0)) >> 0) << 2);
  top->input_b = ((a & (1 << 1)) >> 1) | (((b & (1 << 1)) >> 1) << 1) | (((c & (1 << 0)) >> 0) << 2);
  top->input_c = ((a & (1 << 2)) >> 2) | (((b & (1 << 2)) >> 2) << 1) | (((c & (1 << 0)) >> 0) << 2);
  top->input_d = ((a & (1 << 3)) >> 3) | (((b & (1 << 3)) >> 3) << 1) | (((c & (1 << 0)) >> 0) << 2);
  top->input_e = ((a & (1 << 4)) >> 4) | (((b & (1 << 4)) >> 4) << 1) | (((c & (1 << 0)) >> 0) << 2);
  top->input_f = ((a & (1 << 5)) >> 5) | (((b & (1 << 5)) >> 5) << 1) | (((c & (1 << 0)) >> 0) << 2);
  top->input_g = ((a & (1 << 6)) >> 6) | (((b & (1 << 6)) >> 6) << 1) | (((c & (1 << 0)) >> 0) << 2);
  top->input_h = ((a & (1 << 7)) >> 7) | (((b & (1 << 7)) >> 7) << 1) | (((c & (1 << 0)) >> 0) << 2);
  top->eval();
  return top->out;
}

int main(int argc, char **argv, char **env)
{
  int c_bound = ~a;

  VerilatedContext *contextp = new VerilatedContext;
  contextp->commandArgs(argc, argv);
  ~a *top = new ~a{contextp};

  for (int a_val = 0; a_val <= 255; a_val++)
  {
    for (int b_val = 0; b_val <= 255; b_val++)
    {
    for (int c_val = 0; c_val <= c_bound; c_val++)
    {
      uint8_t a = (uint8_t)a_val;
      uint8_t b = (uint8_t)b_val;
      uint8_t c = (uint8_t)c_val;
      uint8_t out = run(top, a, b, c);
      uint8_t expected = ~a;
      //printf("~a with a=%d b=%d c=%d == %d, should equal %d\n", a, b, c, out, expected);
      //printf("input_a= %d, input_b= %d\n", top->input_a, top->input_b);
      assert(out == expected);
    }
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
     (if (>= arity 3) "255" "0") ; c goes from 0-255 if arity >= 3; otherwise it's always 0.
     verilated-type-name
     verilated-type-name
     c-operator
     c-operator))

  (define testbench-file (make-temporary-file "rkttmp~a.cc"))
  (call-with-output-file testbench-file
                         (lambda (out) (display testbench-source out))
                         #:exists 'update)
  ;(displayln testbench-file)

  (if (not (getenv "LAKEROAD_DIR")) (error "LAKEROAD_DIR must be set to base dir of Lakeroad") '())
  (define verilator-unisims-dir (build-path (getenv "LAKEROAD_DIR") "verilator_xilinx"))
  (displayln verilator-unisims-dir)

  ; TODO(@gussmith23) hardcoded dir
  (if (not
       (system
        (format
         "verilator -Wall -Wno-TIMESCALEMOD -Wno-UNUSED -Wno-DECLFILENAME -Wno-PINMISSING --Mdir ~a --cc ~a -I ~a/CARRY8.v -I ~a/LUT6_2.v --build --exe ~a"
         verilator-make-dir
         verilog-file
         verilator-unisims-dir
         verilator-unisims-dir
         testbench-file)))
      (error "Verilator failed")
      '())

  (system* (build-path verilator-make-dir verilated-type-name)))

(module+ test
  (require rackunit)
  (check-true (end-to-end-test bvand 2 "a & b"))
  (check-true (end-to-end-test bvxor 2 "a ^ b"))
  (check-true (end-to-end-test bvor 2 "a | b"))
  (check-true (end-to-end-test bvadd 2 "a + b"))
  (check-true (end-to-end-test bvsub 2 "a - b"))
  (check-true (end-to-end-test bithack1 2 "a - (a & b)"))
  (check-true (end-to-end-test bithack2 2 "~(a - b)"))
  (check-true (end-to-end-test bithack3 2 "(a ^ b) ^ (a & b)")))

(define (end-to-end-dsp-test expected-expression-str)
  (define verilator-make-dir (make-temporary-file "rkttmp~a" 'directory))
  ;(displayln verilator-make-dir)

  (define-symbolic a (bitvector 30))
  (define-symbolic b (bitvector 18))
  (define-symbolic c (bitvector 48))
  (define-symbolic d (bitvector 48))
  (define dsp (ultrascale-plus-dsp48e2))

  ; This synthesis doesn't actually do anything right now -- it basically just verifies that our very
  ; simple DSP model implements fused multiply-add.
  (define soln
    (synthesize #:forall (list a b c d)
                #:guarantee (begin
                              (assume (bvzero? d))
                              (let ([a-ext (sign-extend a (bitvector 48))]
                                    [b-ext (sign-extend b (bitvector 48))]
                                    [c-ext (sign-extend c (bitvector 48))])
                                (assert (bveq (bvadd (bvmul a-ext b-ext) c-ext)
                                              (interpret-ultrascale-plus-dsp48e2 dsp a b c d)))))))
  (if (not (sat? soln)) (error "no model found") '())
  (displayln (model soln))

  (define dsp-source
    (compile-ultrascale-plus-dsp48e2 (ultrascale-plus-dsp48e2) "p" "clk" "a" "b" "c" "ce" "rst"))

  (define verilog-source
    (format
     #<<here-string-delimiter
module dsp(
p, clk, a, b, c, ce, rst
);
  output [47:0] p;
  wire [47:0] p;
  input clk;
  wire clk;
  input rst;
  wire rst;
  input ce;
  wire ce;
    input  [29:0] a;
    wire  [29:0] a;
    input  [17:0] b;
    wire  [17:0] b;
    input  [47:0] c;
    wire  [47:0] c;

~a

endmodule

here-string-delimiter
     ;
     dsp-source))

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

double sc_time_stamp() { return 0; }

int run(~a *top, int a, int b, int c)
{
  top->a = a;
  top->b = b;
  top->c = c;
  top->ce = 1;

  top->rst = 1;
  top->clk = 0;
  top->eval();
  top->clk = 1;
  top->eval();
  top->clk = 0;
  top->eval();
  top->clk = 1;
  top->eval();
  top->clk = 0;
  top->rst = 0;
  top->eval();
  top->clk = 1;
  top->eval();
  top->clk = 0;
  top->eval();
  top->clk = 1;
  top->eval();
  top->clk = 0;
  top->eval();
  top->clk = 1;
  top->eval();
  top->clk = 0;
  top->eval();
  top->clk = 1;
  top->eval();
  top->clk = 0;
  top->eval();

  return top->p;
}

int main(int argc, char **argv, char **env)
{
  int c_bound = ~a;

  VerilatedContext *contextp = new VerilatedContext;
  contextp->commandArgs(argc, argv);
  ~a *top = new ~a{contextp};

  for (int a_val = 0; a_val <= 255; a_val++)
  {
    for (int b_val = 0; b_val <= 255; b_val++)
    {
    for (int c_val = 0; c_val <= c_bound; c_val++)
    {
      uint8_t a = a_val;
      uint8_t b = b_val;
      uint8_t c = c_val;
      uint8_t out = run(top, a, b, c);
      uint8_t expected = ~a; //TODO what should this be?
      //printf("~a with a=%d b=%d c=%d == %d, should equal %d\n", a, b, c, out, expected);
      //printf("input_a= %d, input_b= %d\n", top->input_a, top->input_b);
      assert(out == expected);
    }
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
     (if #f "255" "0") ; c goes from 0-255 if arity >= 3; otherwise it's always 0.
     verilated-type-name
     verilated-type-name
     expected-expression-str
     expected-expression-str))

  (define testbench-file (make-temporary-file "rkttmp~a.cc"))
  (call-with-output-file testbench-file
                         (lambda (out) (display testbench-source out))
                         #:exists 'update)
  ;(displayln testbench-file)

  (if (not (getenv "LAKEROAD_DIR")) (error "LAKEROAD_DIR must be set to base dir of Lakeroad") '())
  (define verilator-unisims-dir (build-path (getenv "LAKEROAD_DIR") "verilator_xilinx"))
  (displayln verilator-unisims-dir)

  ; TODO(@gussmith23) hardcoded dir
  (if (not
       (system
        (format
         "verilator -Wno-LATCH -Wno-TIMESCALEMOD -DXIL_XECLIB -Wno-STMTDLY -Wno-COMBDLY -Wno-WIDTH -Wno-BLKANDNBLK -Wno-CASEX -Wno-UNOPTFLAT --Mdir ~a --cc ~a -I $LAKEROAD_DIR/Nitro-Parts-lib-Xilinx/DSP48E2.v --build --exe ~a"
         verilator-make-dir
         verilog-file
         testbench-file)))
      (error "Verilator failed")
      '())

  (system* (build-path verilator-make-dir verilated-type-name)))

(module+ test
  (end-to-end-dsp-test "a*b+c"))
