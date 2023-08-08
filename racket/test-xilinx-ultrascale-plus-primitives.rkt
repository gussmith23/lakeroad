#lang racket/base
;;; Test the correctness of the Xilinx UltraScale+ hardware primitives in Lakeroad.
;;;
;;; That is, we have Lakeroad expressions for various UltraScale+ primitives. In this file, we test
;;; whether their interpreted semantics (as defined by the interpreter) and their Verilog semantics
;;; (as defined by the compiler) are correct.

(module test racket/base
  (require rosette
           "ultrascale.rkt"
           "verilator.rkt"
           (prefix-in lr: "language.rkt")
           rosette/solver/smt/boolector
           "testing.rkt"
           "signal.rkt"
           rackunit
           "lut.rkt")

  (current-solver (boolector))

  ;;; Lakeroad/bitvector expressions to simulate and compare against each other.
  (define to-simulate-list (list))
  (define (add-to-simulate v)
    (set! to-simulate-list (cons v to-simulate-list)))

  ;;; Semantics of CARRY8. Duplicated from the generic carry semantics in interpreter.rkt. Might want
  ;;; to put somewhere more accessible, like in a file with the generic lut semantics.
  (define (carry8-semantics cin di s)
    (let* (;;; Returns the carry out bit at each stage.
           [calc-couts (λ (di s cins) (cons (if (bvzero? s) di (first cins)) cins))]
           [couts-list (foldl calc-couts (list cin) (bitvector->bits di) (bitvector->bits s))]
           [cins (apply concat (drop couts-list 1))])
      (list (apply concat (take couts-list 8)) (bvxor cins s))))

  (verify-lakeroad-expression
   "Xilinx UltraScale+ CARRY8 CO output"
   (begin
     (define-symbolic cin (bitvector 1))
     (define-symbolic di (bitvector 8))
     (define-symbolic s (bitvector 8)))
   (lr:list-ref (xilinx-ultrascale-plus-carry8 (lr:bv (bv->signal (bv 0 1)))
                                               (lr:bv (bv->signal cin))
                                               (lr:bv (bv->signal (bv 0 1)))
                                               (lr:bv (bv->signal di))
                                               (lr:bv (bv->signal s)))
                (lr:integer 0))
   (list-ref (carry8-semantics cin di s) 0)
   add-to-simulate)

  (verify-lakeroad-expression
   "Xilinx UltraScale+ CARRY8 O output"
   (begin
     (define-symbolic cin (bitvector 1))
     (define-symbolic di (bitvector 8))
     (define-symbolic s (bitvector 8)))
   (lr:list-ref (xilinx-ultrascale-plus-carry8 (lr:bv (bv->signal (bv 0 1)))
                                               (lr:bv (bv->signal cin))
                                               (lr:bv (bv->signal (bv 0 1)))
                                               (lr:bv (bv->signal di))
                                               (lr:bv (bv->signal s)))
                (lr:integer 1))
   (list-ref (carry8-semantics cin di s) 1)
   add-to-simulate)

  (verify-lakeroad-expression
   "Xilinx UltraScale+ LUT6"
   ;;; Set up symbolic variables.
   (begin
     (define-symbolic i0 (bitvector 1))
     (define-symbolic i1 (bitvector 1))
     (define-symbolic i2 (bitvector 1))
     (define-symbolic i3 (bitvector 1))
     (define-symbolic i4 (bitvector 1))
     (define-symbolic i5 (bitvector 1))
     (define-symbolic lut-init (bitvector 64)))
   ;;; Expression to test.
   (xilinx-ultrascale-plus-lut6 (lr:bv (bv->signal i0))
                                (lr:bv (bv->signal i1))
                                (lr:bv (bv->signal i2))
                                (lr:bv (bv->signal i3))
                                (lr:bv (bv->signal i4))
                                (lr:bv (bv->signal i5))
                                (lr:bv (bv->signal lut-init)))
   ;;; Expression to verify against. The above expression should have the same semantics as the below
   ;;; expression.
   (lut lut-init (concat i5 i4 i3 i2 i1 i0))
   ;;; We don't have `verify-lakeroad-expression` add this to the list of things to simulate, as
   ;;; compiliation to Verilog through Yosys requires `lut-init` to be concrete. Thus, we simulate
   ;;; below with some concrete `lut-init` values.
   ;;;
   ;;; add-to-simulate
   )

  ;;; Add some simulation tasks for LUT6 using concrete lut-init values.
  (test-true
   "normal return"
   (normal?
    (with-vc
     (with-terms
      (begin
        (define-symbolic i0 (bitvector 1))
        (define-symbolic i1 (bitvector 1))
        (define-symbolic i2 (bitvector 1))
        (define-symbolic i3 (bitvector 1))
        (define-symbolic i4 (bitvector 1))
        (define-symbolic i5 (bitvector 1))
        (define lut-init0 (bv #xdeadbeefdeadbeef 64))
        (define lut-init1 (bv #x2324252610710810 64))
        (add-to-simulate (to-simulate (xilinx-ultrascale-plus-lut6 (lr:bv (bv->signal i0))
                                                                   (lr:bv (bv->signal i1))
                                                                   (lr:bv (bv->signal i2))
                                                                   (lr:bv (bv->signal i3))
                                                                   (lr:bv (bv->signal i4))
                                                                   (lr:bv (bv->signal i5))
                                                                   (lr:bv (bv->signal lut-init0)))
                                      (lut lut-init0 (concat i5 i4 i3 i2 i1 i0))))
        (add-to-simulate (to-simulate (xilinx-ultrascale-plus-lut6 (lr:bv (bv->signal i0))
                                                                   (lr:bv (bv->signal i1))
                                                                   (lr:bv (bv->signal i2))
                                                                   (lr:bv (bv->signal i3))
                                                                   (lr:bv (bv->signal i4))
                                                                   (lr:bv (bv->signal i5))
                                                                   (lr:bv (bv->signal lut-init1)))
                                      (lut lut-init1 (concat i5 i4 i3 i2 i1 i0)))))))))

  (verify-lakeroad-expression
   "Xilinx UltraScale+ LUT6_2"
   (begin
     (define-symbolic i0 (bitvector 1))
     (define-symbolic i1 (bitvector 1))
     (define-symbolic i2 (bitvector 1))
     (define-symbolic i3 (bitvector 1))
     (define-symbolic i4 (bitvector 1))
     (define-symbolic i5 (bitvector 1))
     (define-symbolic lut-init-o5 (bitvector 32))
     (define-symbolic lut-init-o6 (bitvector 32)))
   (lr:concat (xilinx-ultrascale-plus-lut6-2 (lr:bv (bv->signal i0))
                                             (lr:bv (bv->signal i1))
                                             (lr:bv (bv->signal i2))
                                             (lr:bv (bv->signal i3))
                                             (lr:bv (bv->signal i4))
                                             (lr:bv (bv->signal i5))
                                             (lr:bv (bv->signal (concat lut-init-o6 lut-init-o5)))))
   (concat (lut lut-init-o5 (concat i4 i3 i2 i1 i0))
           (if (bvzero? i5)
               (lut lut-init-o5 (concat i4 i3 i2 i1 i0))
               (lut lut-init-o6 (concat i4 i3 i2 i1 i0))))
   ;;; We don't have `verify-lakeroad-expression` add this to the list of things to simulate, as
   ;;; compiliation to Verilog through Yosys requires `lut-init` to be concrete. Thus, we simulate
   ;;; below with some concrete `lut-init` values.
   ;;;
   ;;; add-to-simulate
   )

  ;;; Add some simulation tasks for LUT6_2 using concrete lut-init values.
  (test-true "normal return"
             (normal? (with-vc (with-terms (begin
                                             (define-symbolic i0 (bitvector 1))
                                             (define-symbolic i1 (bitvector 1))
                                             (define-symbolic i2 (bitvector 1))
                                             (define-symbolic i3 (bitvector 1))
                                             (define-symbolic i4 (bitvector 1))
                                             (define-symbolic i5 (bitvector 1))
                                             (define lut-init-0 (bv #xdeadbeef 32))
                                             (define lut-init-1 (bv #x23242526 32))
                                             (define lut-init-2 (bv #x10710810 32))

                                             (define (add-test lut0 lut1)
                                               (add-to-simulate
                                                (to-simulate
                                                 (lr:concat (xilinx-ultrascale-plus-lut6-2
                                                             (lr:bv (bv->signal i0))
                                                             (lr:bv (bv->signal i1))
                                                             (lr:bv (bv->signal i2))
                                                             (lr:bv (bv->signal i3))
                                                             (lr:bv (bv->signal i4))
                                                             (lr:bv (bv->signal i5))
                                                             (lr:bv (bv->signal (concat lut0 lut1)))))
                                                 (concat (lut lut1 (concat i4 i3 i2 i1 i0))
                                                         (if (bvzero? i5)
                                                             (lut lut1 (concat i4 i3 i2 i1 i0))
                                                             (lut lut0 (concat i4 i3 i2 i1 i0)))))))

                                             (add-test lut-init-0 lut-init-1)
                                             (add-test lut-init-1 lut-init-2)
                                             (add-test lut-init-2 lut-init-0))))))

  ;;; This one's 4 bits because 16 bits takes too long in simulation. 4 variables, each one getting
  ;;; 256 random values --> 2^32 sample points. Far too many!
  ;;;
  ;;; TODO(@gussmith23): give more control over how many points are sampled in random simulation.
  (verify-lakeroad-expression
   "Xilinx UltraScale+ DSP48E2 P output, 0 cycle 4bit mul-add-mul"
   (begin
     (define-symbolic a b c d (bitvector 4)))
   ;;; Expression taken from the DSP48E2 end-to-end synthesis test.
   (lr:extract (lr:integer 3)
               (lr:integer 0)
               (lr:list-ref (ultrascale-plus-dsp48e2
                             (lr:zero-extend (lr:bv (bv->signal b)) (lr:bitvector (bitvector 30)))
                             (lr:bv (bv->signal (bv #x00000000 32)))
                             (lr:bv (bv->signal (bv #b000000000000000000000000000000 30)))
                             (lr:bv (bv->signal (bv #x00000000 32)))
                             (lr:bv (bv->signal (bv #x0 4)))
                             (lr:bv (bv->signal (bv #x00000000 32)))
                             (lr:bv (bv->signal (bv #b00010 5)))
                             (lr:bv (bv->signal (bv #x00000000 32)))
                             (lr:bv (bv->signal (bv #b00100 5)))
                             (lr:bv (bv->signal (bv #b10000 5)))
                             (lr:bv (bv->signal (bv #b00111 5)))
                             (lr:zero-extend (lr:bv (bv->signal c)) (lr:bitvector (bitvector 18)))
                             (lr:bv (bv->signal (bv #x00000000 32)))
                             (lr:bv (bv->signal (bv #b000000000000000000 18)))
                             (lr:bv (bv->signal (bv #b00001 5)))
                             (lr:bv (bv->signal (bv #x00000000 32)))
                             (lr:bv (bv->signal (bv #b00111 5)))
                             (lr:zero-extend (lr:bv (bv->signal d)) (lr:bitvector (bitvector 48)))
                             (lr:bv (bv->signal (bv #b0 1)))
                             (lr:bv (bv->signal (bv #b0 1)))
                             (lr:bv (bv->signal (bv #x00000000 32)))
                             (lr:bv (bv->signal (bv #b000 3)))
                             (lr:bv (bv->signal (bv #x00000000 32)))
                             (lr:bv (bv->signal (bv #b1 1)))
                             (lr:bv (bv->signal (bv #b1 1)))
                             (lr:bv (bv->signal (bv #b1 1)))
                             (lr:bv (bv->signal (bv #b1 1)))
                             (lr:bv (bv->signal (bv #b1 1)))
                             (lr:bv (bv->signal (bv #b1 1)))
                             (lr:bv (bv->signal (bv #b1 1)))
                             (lr:bv (bv->signal (bv #b1 1)))
                             (lr:bv (bv->signal (bv #b1 1)))
                             (lr:bv (bv->signal (bv #b1 1)))
                             (lr:bv (bv->signal (bv #b1 1)))
                             (lr:bv (bv->signal (bv #b1 1)))
                             (lr:bv (bv->signal (bv #b1 1)))
                             (lr:bv (bv->signal (bv #b0 1)))
                             (lr:bv (bv->signal (bv #x00000000 32)))
                             (lr:zero-extend (lr:bv (bv->signal a)) (lr:bitvector (bitvector 27)))
                             (lr:bv (bv->signal (bv #x00000000 32)))
                             (lr:bv (bv->signal (bv #b00100 5)))
                             (lr:bv (bv->signal (bv #x00000000 32)))
                             (lr:bv (bv->signal (bv #x0 4)))
                             (lr:bv (bv->signal (bv #b0 1)))
                             (lr:bv (bv->signal (bv #b0 1)))
                             (lr:bv (bv->signal (bv #b00000 5)))
                             (lr:bv (bv->signal (bv #b000000000 9)))
                             (lr:bv (bv->signal (bv #b0 1)))
                             (lr:bv (bv->signal (bv #b0 1)))
                             (lr:bv (bv->signal (bv #b0 1)))
                             (lr:bv (bv->signal (bv #b0 1)))
                             (lr:bv (bv->signal (bv #b0 1)))
                             (lr:bv (bv->signal (bv #b0 1)))
                             (lr:bv (bv->signal (bv #b0 1)))
                             (lr:bv (bv->signal (bv #b0 1)))
                             (lr:bv (bv->signal (bv #b0 1)))
                             (lr:bv (bv->signal (bv #b0 1)))
                             (lr:bv (bv->signal (bv #x000000000000 48)))
                             (lr:bv (bv->signal (bv #x00000000 32)))
                             (lr:bv (bv->signal (bv #b0 1)))
                             (lr:bv (bv->signal (bv #b100110101 9)))
                             (lr:bv (bv->signal (bv #x00000000 32)))
                             (lr:bv (bv->signal (bv #x000000000000 48)))
                             (lr:bv (bv->signal (bv #x000000000000 48)))
                             (lr:bv (bv->signal (bv #b00000 5)))
                             (lr:bv (bv->signal (bv #x00000000 32)))
                             (lr:bv (bv->signal (bv #x000000010000 48)))
                             (lr:bv (bv->signal (bv #b0 1)))
                             (lr:bv (bv->signal (bv #b0 1)))
                             (lr:bv (bv->signal (bv #b0 1)))
                             (lr:bv (bv->signal (bv #b0 1)))
                             (lr:bv (bv->signal (bv #b0 1)))
                             (lr:bv (bv->signal (bv #b0 1)))
                             (lr:bv (bv->signal (bv #b0 1)))
                             (lr:bv (bv->signal (bv #b0 1)))
                             (lr:bv (bv->signal (bv #b0 1)))
                             (lr:bv (bv->signal (bv #b0 1)))
                             (lr:bv (bv->signal (bv #b10001 5)))
                             (lr:bv (bv->signal (bv #b10001 5)))
                             (lr:bv (bv->signal (bv #b10010 5)))
                             (lr:bv (bv->signal (bv #b10101 5)))
                             (lr:bv (bv->signal (bv #b01100 5)))
                             (lr:bv (bv->signal (bv #b11000 5)))
                             (lr:bv (bv->signal (bv #b11010 5)))
                             (lr:bv (bv->signal (bv #x000000000000 48)))
                             (lr:bv (bv->signal (bv #x000000000000 48)))
                             (lr:bv (bv->signal (bv #x000000000000 48)))
                             (lr:bv (bv->signal (bv #x000000000000 48)))
                             (lr:bv (bv->signal (bv #b0 1))))
                            (lr:integer 0)))
   (bvadd (bvmul (bvadd a b) c) d)
   add-to-simulate)

  (verify-lakeroad-expression
   "Xilinx UltraScale+ DSP48E2 P output, 0 cycle 16x16 sub"
   (begin
     (define-symbolic a b (bitvector 16)))
   ;;; Expression taken from the DSP48E2 end-to-end synthesis test.
   (lr:extract (lr:integer 15)
               (lr:integer 0)
               (lr:list-ref (ultrascale-plus-dsp48e2
                             (lr:zero-extend (lr:bv (bv->signal a)) (lr:bitvector (bitvector 30)))
                             (lr:bv (bv->signal (bv #x00000000 32)))
                             (lr:bv (bv->signal (bv #b000000000000000000000000000000 30)))
                             (lr:bv (bv->signal (bv #x00000000 32)))
                             (lr:bv (bv->signal (bv #x3 4)))
                             (lr:bv (bv->signal (bv #x00000000 32)))
                             (lr:bv (bv->signal (bv #b00010 5)))
                             (lr:bv (bv->signal (bv #x00000000 32)))
                             (lr:bv (bv->signal (bv #b00101 5)))
                             (lr:bv (bv->signal (bv #b10000 5)))
                             (lr:bv (bv->signal (bv #b00111 5)))
                             (lr:zero-extend (lr:bv (bv->signal b)) (lr:bitvector (bitvector 18)))
                             (lr:bv (bv->signal (bv #x00000000 32)))
                             (lr:bv (bv->signal (bv #b000000000000000000 18)))
                             (lr:bv (bv->signal (bv #b00001 5)))
                             (lr:bv (bv->signal (bv #x00000000 32)))
                             (lr:bv (bv->signal (bv #b00111 5)))
                             (lr:zero-extend (lr:bv (bv->signal a)) (lr:bitvector (bitvector 48)))
                             (lr:bv (bv->signal (bv #b0 1)))
                             (lr:bv (bv->signal (bv #b0 1)))
                             (lr:bv (bv->signal (bv #x00000000 32)))
                             (lr:bv (bv->signal (bv #b000 3)))
                             (lr:bv (bv->signal (bv #x00000000 32)))
                             (lr:bv (bv->signal (bv #b1 1)))
                             (lr:bv (bv->signal (bv #b1 1)))
                             (lr:bv (bv->signal (bv #b1 1)))
                             (lr:bv (bv->signal (bv #b1 1)))
                             (lr:bv (bv->signal (bv #b1 1)))
                             (lr:bv (bv->signal (bv #b1 1)))
                             (lr:bv (bv->signal (bv #b1 1)))
                             (lr:bv (bv->signal (bv #b1 1)))
                             (lr:bv (bv->signal (bv #b1 1)))
                             (lr:bv (bv->signal (bv #b1 1)))
                             (lr:bv (bv->signal (bv #b1 1)))
                             (lr:bv (bv->signal (bv #b1 1)))
                             (lr:bv (bv->signal (bv #b1 1)))
                             (lr:bv (bv->signal (bv #b0 1)))
                             (lr:bv (bv->signal (bv #x00000000 32)))
                             (lr:zero-extend (lr:bv (bv->signal a)) (lr:bitvector (bitvector 27)))
                             (lr:bv (bv->signal (bv #x00000000 32)))
                             (lr:bv (bv->signal (bv #b01000 5)))
                             (lr:bv (bv->signal (bv #x00000000 32)))
                             (lr:bv (bv->signal (bv #x0 4)))
                             (lr:bv (bv->signal (bv #b0 1)))
                             (lr:bv (bv->signal (bv #b0 1)))
                             (lr:bv (bv->signal (bv #b00000 5)))
                             (lr:bv (bv->signal (bv #b000000000 9)))
                             (lr:bv (bv->signal (bv #b0 1)))
                             (lr:bv (bv->signal (bv #b0 1)))
                             (lr:bv (bv->signal (bv #b0 1)))
                             (lr:bv (bv->signal (bv #b0 1)))
                             (lr:bv (bv->signal (bv #b0 1)))
                             (lr:bv (bv->signal (bv #b0 1)))
                             (lr:bv (bv->signal (bv #b0 1)))
                             (lr:bv (bv->signal (bv #b0 1)))
                             (lr:bv (bv->signal (bv #b0 1)))
                             (lr:bv (bv->signal (bv #b0 1)))
                             (lr:bv (bv->signal (bv #x000000000000 48)))
                             (lr:bv (bv->signal (bv #x00000000 32)))
                             (lr:bv (bv->signal (bv #b0 1)))
                             (lr:bv (bv->signal (bv #b010110111 9)))
                             (lr:bv (bv->signal (bv #x00000000 32)))
                             (lr:bv (bv->signal (bv #x000000000000 48)))
                             (lr:bv (bv->signal (bv #x000000000000 48)))
                             (lr:bv (bv->signal (bv #b00000 5)))
                             (lr:bv (bv->signal (bv #x00000000 32)))
                             (lr:bv (bv->signal (bv #x000800800715 48)))
                             (lr:bv (bv->signal (bv #b0 1)))
                             (lr:bv (bv->signal (bv #b0 1)))
                             (lr:bv (bv->signal (bv #b0 1)))
                             (lr:bv (bv->signal (bv #b0 1)))
                             (lr:bv (bv->signal (bv #b0 1)))
                             (lr:bv (bv->signal (bv #b0 1)))
                             (lr:bv (bv->signal (bv #b0 1)))
                             (lr:bv (bv->signal (bv #b0 1)))
                             (lr:bv (bv->signal (bv #b0 1)))
                             (lr:bv (bv->signal (bv #b0 1)))
                             (lr:bv (bv->signal (bv #b10111 5)))
                             (lr:bv (bv->signal (bv #b10001 5)))
                             (lr:bv (bv->signal (bv #b10010 5)))
                             (lr:bv (bv->signal (bv #b10101 5)))
                             (lr:bv (bv->signal (bv #b11001 5)))
                             (lr:bv (bv->signal (bv #b01101 5)))
                             (lr:bv (bv->signal (bv #b01110 5)))
                             (lr:bv (bv->signal (bv #x000000000000 48)))
                             (lr:bv (bv->signal (bv #x000000000000 48)))
                             (lr:bv (bv->signal (bv #x000000000000 48)))
                             (lr:bv (bv->signal (bv #x000000000000 48)))
                             (lr:bv (bv->signal (bv #b0 1))))
                            (lr:integer 0)))
   (bvsub a b)
   add-to-simulate)

  (verify-lakeroad-expression
   "Xilinx UltraScale+ DSP48E2 P output, 0 cycle 16x16 multiplication"
   (begin
     (define-symbolic a b (bitvector 16)))
   ;;; Expression taken from the DSP48E2 end-to-end synthesis test.
   (lr:extract (lr:integer 15)
               (lr:integer 0)
               (lr:list-ref
                (ultrascale-plus-dsp48e2
                 (lr:bv (bv->signal (bv #b000000000000000000000000000001 30)))
                 (lr:bv (bv->signal (bv #x00000000 32)))
                 (lr:bv (bv->signal (bv #b000000000000000000000000000000 30)))
                 (lr:bv (bv->signal (bv #x00000000 32)))
                 (lr:bv (bv->signal (bv #xd 4)))
                 (lr:bv (bv->signal (bv #x00000000 32)))
                 (lr:bv (bv->signal (bv #b00010 5)))
                 (lr:bv (bv->signal (bv #x00000000 32)))
                 (lr:bv (bv->signal (bv #b00101 5)))
                 (lr:bv (bv->signal (bv #b10000 5)))
                 (lr:bv (bv->signal (bv #b00111 5)))
                 (lr:zero-extend (lr:bv (bv->signal a)) (lr:bitvector (bitvector 18)))
                 (lr:bv (bv->signal (bv #x00000000 32)))
                 (lr:bv (bv->signal (bv #b000000000000000000 18)))
                 (lr:bv (bv->signal (bv #b00001 5)))
                 (lr:bv (bv->signal (bv #x00000000 32)))
                 (lr:bv (bv->signal (bv #b00111 5)))
                 (lr:zero-extend (lr:bv (bv->signal b)) (lr:bitvector (bitvector 48)))
                 (lr:bv (bv->signal (bv #b0 1)))
                 (lr:bv (bv->signal (bv #b0 1)))
                 (lr:bv (bv->signal (bv #x00000000 32)))
                 (lr:bv (bv->signal (bv #b000 3)))
                 (lr:bv (bv->signal (bv #x00000000 32)))
                 (lr:bv (bv->signal (bv #b1 1)))
                 (lr:bv (bv->signal (bv #b1 1)))
                 (lr:bv (bv->signal (bv #b1 1)))
                 (lr:bv (bv->signal (bv #b1 1)))
                 (lr:bv (bv->signal (bv #b1 1)))
                 (lr:bv (bv->signal (bv #b1 1)))
                 (lr:bv (bv->signal (bv #b1 1)))
                 (lr:bv (bv->signal (bv #b1 1)))
                 (lr:bv (bv->signal (bv #b1 1)))
                 (lr:bv (bv->signal (bv #b1 1)))
                 (lr:bv (bv->signal (bv #b1 1)))
                 (lr:bv (bv->signal (bv #b1 1)))
                 (lr:bv (bv->signal (bv #b1 1)))
                 (lr:bv (bv->signal (bv #b0 1)))
                 (lr:bv (bv->signal (bv #x00000000 32)))
                 ;;; b probably doesn't have to be used twice; just a strange artifact of synthesis.
                 (lr:zero-extend (lr:bv (bv->signal b)) (lr:bitvector (bitvector 27)))
                 (lr:bv (bv->signal (bv #x00000000 32)))
                 (lr:bv (bv->signal (bv #b00101 5)))
                 (lr:bv (bv->signal (bv #x00000000 32)))
                 (lr:bv (bv->signal (bv #x0 4)))
                 (lr:bv (bv->signal (bv #b0 1)))
                 (lr:bv (bv->signal (bv #b0 1)))
                 (lr:bv (bv->signal (bv #b00000 5)))
                 (lr:bv (bv->signal (bv #b000000000 9)))
                 (lr:bv (bv->signal (bv #b0 1)))
                 (lr:bv (bv->signal (bv #b0 1)))
                 (lr:bv (bv->signal (bv #b0 1)))
                 (lr:bv (bv->signal (bv #b0 1)))
                 (lr:bv (bv->signal (bv #b0 1)))
                 (lr:bv (bv->signal (bv #b0 1)))
                 (lr:bv (bv->signal (bv #b0 1)))
                 (lr:bv (bv->signal (bv #b0 1)))
                 (lr:bv (bv->signal (bv #b0 1)))
                 (lr:bv (bv->signal (bv #b0 1)))
                 (lr:bv (bv->signal (bv #x000000000000 48)))
                 (lr:bv (bv->signal (bv #x00000000 32)))
                 (lr:bv (bv->signal (bv #b0 1)))
                 (lr:bv (bv->signal (bv #b101010101 9)))
                 (lr:bv (bv->signal (bv #x00000000 32)))
                 (lr:bv (bv->signal (bv #x000000000000 48)))
                 (lr:bv (bv->signal (bv #x000000000000 48)))
                 (lr:bv (bv->signal (bv #b00000 5)))
                 (lr:bv (bv->signal (bv #x00000000 32)))
                 (lr:bv (bv->signal (bv #x0fffffff0000 48)))
                 (lr:bv (bv->signal (bv #b0 1)))
                 (lr:bv (bv->signal (bv #b0 1)))
                 (lr:bv (bv->signal (bv #b0 1)))
                 (lr:bv (bv->signal (bv #b0 1)))
                 (lr:bv (bv->signal (bv #b0 1)))
                 (lr:bv (bv->signal (bv #b0 1)))
                 (lr:bv (bv->signal (bv #b0 1)))
                 (lr:bv (bv->signal (bv #b0 1)))
                 (lr:bv (bv->signal (bv #b0 1)))
                 (lr:bv (bv->signal (bv #b0 1)))
                 (lr:bv (bv->signal (bv #b10111 5)))
                 (lr:bv (bv->signal (bv #b10001 5)))
                 (lr:bv (bv->signal (bv #b10010 5)))
                 (lr:bv (bv->signal (bv #b10101 5)))
                 (lr:bv (bv->signal (bv #b01100 5)))
                 (lr:bv (bv->signal (bv #b01101 5)))
                 (lr:bv (bv->signal (bv #b01110 5)))
                 (lr:bv (bv->signal (bv #x000000000000 48)))
                 (lr:bv (bv->signal (bv #x000000000000 48)))
                 (lr:bv (bv->signal (bv #x000000000000 48)))
                 (lr:bv (bv->signal (bv #x000000000000 48)))
                 (lr:bv (bv->signal (bv #b0 1))))
                (lr:integer 0)))
   (bvmul a b)
   add-to-simulate)

  (when (not (getenv "VERILATOR_INCLUDE_DIR"))
    (raise "VERILATOR_INCLUDE_DIR not set"))
  (when (not (getenv "LAKEROAD_DIR"))
    (raise "LAKEROAD_DIR not set"))
  (define include-dir (build-path (getenv "LAKEROAD_DIR") "verilator_xilinx"))
  (test-true "simulate all synthesized designs with Verilator"
             (simulate-with-verilator
              #:include-dirs (list (build-path (getenv "LAKEROAD_DIR") "verilator-unisims")
                                   (build-path (getenv "LAKEROAD_DIR") "verilator_xilinx"))
              #:extra-verilator-args
              "-Wno-BLKSEQ -Wno-UNUSED -Wno-LATCH -Wno-ASSIGNDLY -DXIL_XECLIB -Wno-TIMESCALEMOD -Wno-PINMISSING"
              to-simulate-list
              (getenv "VERILATOR_INCLUDE_DIR"))))
