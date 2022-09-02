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

  (verify-lakeroad-expression
   "Xilinx UltraScale+ CARRY8 CO output"
   (begin
     (define-symbolic cin (bitvector 1))
     (define-symbolic di (bitvector 8))
     (define-symbolic s (bitvector 8)))
   (lr:list-ref (xilinx-ultrascale-plus-carry8 (bv 0 1) cin (bv 0 1) di s) 0)
   (list-ref (carry8-semantics cin di s) 0)
   add-to-simulate)

  (verify-lakeroad-expression
   "Xilinx UltraScale+ CARRY8 O output"
   (begin
     (define-symbolic cin (bitvector 1))
     (define-symbolic di (bitvector 8))
     (define-symbolic s (bitvector 8)))
   (lr:list-ref (xilinx-ultrascale-plus-carry8 (bv 0 1) cin (bv 0 1) di s) 1)
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
   (xilinx-ultrascale-plus-lut6 i0 i1 i2 i3 i4 i5 lut-init)
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
        (add-to-simulate (to-simulate (xilinx-ultrascale-plus-lut6 i0 i1 i2 i3 i4 i5 lut-init0)
                                      (lut lut-init0 (concat i5 i4 i3 i2 i1 i0))))
        (add-to-simulate (to-simulate (xilinx-ultrascale-plus-lut6 i0 i1 i2 i3 i4 i5 lut-init1)
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
   (lr:concat (xilinx-ultrascale-plus-lut6-2 i0 i1 i2 i3 i4 i5 (concat lut-init-o6 lut-init-o5)))
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
  (test-true
   "normal return"
   (normal? (with-vc (with-terms
                      (begin
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
                            (lr:concat
                             (xilinx-ultrascale-plus-lut6-2 i0 i1 i2 i3 i4 i5 (concat lut0 lut1)))
                            (concat (lut lut1 (concat i4 i3 i2 i1 i0))
                                    (if (bvzero? i5)
                                        (lut lut1 (concat i4 i3 i2 i1 i0))
                                        (lut lut0 (concat i4 i3 i2 i1 i0)))))))

                        (add-test lut-init-0 lut-init-1)
                        (add-test lut-init-1 lut-init-2)
                        (add-test lut-init-2 lut-init-0))))))

  ;;; TODO(@gussmith23): Finish DSP verificaiton and testing.
  ;;; (verify-lakeroad-expression "Xilinx UltraScale+ DSP48E2 P output, 0 cycle multiplication"
  ;;;                             (begin)
  ;;;                             (ultrascale-plus-dsp48e2 A
  ;;;                                                      ACASCREG
  ;;;                                                      ACIN
  ;;;                                                      ADREG
  ;;;                                                      ALUMODE
  ;;;                                                      ALUMODEREG
  ;;;                                                      AMULTSEL
  ;;;                                                      AREG
  ;;;                                                      AUTORESET_PATDET
  ;;;                                                      AUTORESET_PRIORITY
  ;;;                                                      A_INPUT
  ;;;                                                      B
  ;;;                                                      BCASCREG
  ;;;                                                      BCIN
  ;;;                                                      BMULTSEL
  ;;;                                                      BREG
  ;;;                                                      B_INPUT
  ;;;                                                      C
  ;;;                                                      CARRYCASCIN
  ;;;                                                      CARRYIN
  ;;;                                                      CARRYINREG
  ;;;                                                      CARRYINSEL
  ;;;                                                      CARRYINSELREG
  ;;;                                                      CEA1
  ;;;                                                      CEA2
  ;;;                                                      CEAD
  ;;;                                                      CEALUMODE
  ;;;                                                      CEB1
  ;;;                                                      CEB2
  ;;;                                                      CEC
  ;;;                                                      CECARRYIN
  ;;;                                                      CECTRL
  ;;;                                                      CED
  ;;;                                                      CEINMODE
  ;;;                                                      CEM
  ;;;                                                      CEP
  ;;;                                                      CLK
  ;;;                                                      CREG
  ;;;                                                      D
  ;;;                                                      DREG
  ;;;                                                      INMODE
  ;;;                                                      INMODEREG
  ;;;                                                      IS_ALUMODE_INVERTED
  ;;;                                                      IS_CARRYIN_INVERTED
  ;;;                                                      IS_CLK_INVERTED
  ;;;                                                      IS_INMODE_INVERTED
  ;;;                                                      IS_OPMODE_INVERTED
  ;;;                                                      IS_RSTALLCARRYIN_INVERTED
  ;;;                                                      IS_RSTALUMODE_INVERTED
  ;;;                                                      IS_RSTA_INVERTED
  ;;;                                                      IS_RSTB_INVERTED
  ;;;                                                      IS_RSTCTRL_INVERTED
  ;;;                                                      IS_RSTC_INVERTED
  ;;;                                                      IS_RSTD_INVERTED
  ;;;                                                      IS_RSTINMODE_INVERTED
  ;;;                                                      IS_RSTM_INVERTED
  ;;;                                                      IS_RSTP_INVERTED
  ;;;                                                      MASK
  ;;;                                                      MREG
  ;;;                                                      MULTSIGNIN
  ;;;                                                      OPMODE
  ;;;                                                      OPMODEREG
  ;;;                                                      PATTERN
  ;;;                                                      PCIN
  ;;;                                                      PREADDINSEL
  ;;;                                                      PREG
  ;;;                                                      RND
  ;;;                                                      RSTA
  ;;;                                                      RSTALLCARRYIN
  ;;;                                                      RSTALUMODE
  ;;;                                                      RSTB
  ;;;                                                      RSTC
  ;;;                                                      RSTCTRL
  ;;;                                                      RSTD
  ;;;                                                      RSTINMODE
  ;;;                                                      RSTM
  ;;;                                                      RSTP
  ;;;                                                      SEL_MASK
  ;;;                                                      SEL_PATTERN
  ;;;                                                      USE_MULT
  ;;;                                                      USE_PATTERN_DETECT
  ;;;                                                      USE_SIMD
  ;;;                                                      USE_WIDEXOR
  ;;;                                                      XORSIMD
  ;;;                                                      unnamed-input-331
  ;;;                                                      unnamed-input-488
  ;;;                                                      unnamed-input-750
  ;;;                                                      unnamed-input-806
  ;;;                                                      unnamed-input-850))

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
