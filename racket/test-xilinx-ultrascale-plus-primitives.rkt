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

  ;;; TODO(@gussmith23): Would be nice if we didn't have to test O and CO separately.
  ;;; (verify-lakeroad-expression
  ;;;  "Xilinx UltraScale+ CARRY8 CO output"
  ;;;  (define-symbolic cin (bitvector 1))
  ;;;  (define-symbolic di (bitvector 8))
  ;;;  (define-symbolic s (bitvector 8))
  ;;;  (lr:list-ref (xilinx-ultrascale-plus-carry8 (bv 0 1) cin (bv 0 1) di s) 0)
  ;;;  (list-ref (carry8-semantics cin di s) 0)
  ;;;  add-to-simulate)
  ;;; (verify-lakeroad-expression
  ;;;  "Xilinx UltraScale+ CARRY8 O output"
  ;;;  (define-symbolic cin (bitvector 1))
  ;;;  (define-symbolic di (bitvector 8))
  ;;;  (define-symbolic s (bitvector 8))
  ;;;  (lr:list-ref (xilinx-ultrascale-plus-carry8 (bv 0 1) cin (bv 0 1) di s) 1)
  ;;;  (list-ref (carry8-semantics cin di s) 1)
  ;;;  add-to-simulate)

  (verify-lakeroad-expression
   "Xilinx UltraScale+ LUT6"
   (begin
     (define-symbolic i0 (bitvector 1))
     (define-symbolic i1 (bitvector 1))
     (define-symbolic i2 (bitvector 1))
     (define-symbolic i3 (bitvector 1))
     (define-symbolic i4 (bitvector 1))
     (define-symbolic i5 (bitvector 1))
     (define-symbolic lut-init (bitvector 64)))
   (xilinx-ultrascale-plus-lut6 i0 i1 i2 i3 i4 i5 lut-init)
   (lut lut-init (concat i5 i4 i3 i2 i1 i0))
   ;;; We don't have `verify-lakeroad-expression` add this to the list of
   ;;; things to simulate, as compiliation to Verilog through Yosys
   ;;; requires `lut-init` to be concrete. Thus, we simulate below with some
   ;;; concrete `lut-init` values.
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
        (add-to-simulate (to-simulate (xilinx-ultrascale-plus-lut6 i0 i1 i2 i3 i4 i5 lut-init0)
                                      (lut lut-init0 (concat i5 i4 i3 i2 i1 i0))))
        (add-to-simulate (to-simulate (xilinx-ultrascale-plus-lut6 i0 i1 i2 i3 i4 i5 lut-init1)
                                      (lut lut-init1 (concat i5 i4 i3 i2 i1 i0)))))))))

  ;;; TODO(@gussmith23): This test is broken.
  ;;; TODO(@gussmith23): This test also needs manual simulation tasks added, just as in LUT6.
  (verify-lakeroad-expression
   "Xilinx UltraScale+ LUT6_2 O5 output"
   (begin
     (define-symbolic i0 (bitvector 1))
     (define-symbolic i1 (bitvector 1))
     (define-symbolic i2 (bitvector 1))
     (define-symbolic i3 (bitvector 1))
     (define-symbolic i4 (bitvector 1))
     (define-symbolic i5 (bitvector 1))
     (define-symbolic lut-init (bitvector 64)))
   (lr:list-ref (xilinx-ultrascale-plus-lut6-2 i0 i1 i2 i3 i4 i5 lut-init) 0)
   (bit 0 (lut lut-init (concat i5 i4 i3 i2 i1 i0) #:num-output-bits 2))
   ;;; We don't have `verify-lakeroad-expression` add this to the list of
   ;;; things to simulate, as compiliation to Verilog through Yosys
   ;;; requires `lut-init` to be concrete. Thus, we simulate below with some
   ;;; concrete `lut-init` values.
   ;;;
   ;;; add-to-simulate
   )

  ;;; TODO(@gussmith23): Test O6 output as well.

  (when (not (getenv "VERILATOR_INCLUDE_DIR"))
    (raise "VERILATOR_INCLUDE_DIR not set"))
  (when (not (getenv "LAKEROAD_DIR"))
    (raise "LAKEROAD_DIR not set"))
  (define include-dir (build-path (getenv "LAKEROAD_DIR") "verilator_xilinx"))
  (test-true "simulate all synthesized designs with Verilator"
             (simulate-with-verilator
              #:include-dirs (list (build-path (getenv "LAKEROAD_DIR") "verilator_xilinx"))
              #:extra-verilator-args
              "-Wno-UNUSED -Wno-LATCH -Wno-ASSIGNDLY -DXIL_XECLIB -Wno-TIMESCALEMOD -Wno-PINMISSING"
              to-simulate-list
              (getenv "VERILATOR_INCLUDE_DIR"))))
