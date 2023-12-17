#lang rosette/safe

(module+ test
  (require rackunit
           rosette/solver/smt/boolector
           rosette
           "programs-to-synthesize.rkt"
           "circt-comb-operators.rkt"
           "utils.rkt"
           "synthesize.rkt"
           "architecture-description.rkt"
           "xilinx-ultrascale-plus-lut2.rkt"
           "generated/xilinx-ultrascale-plus-lut6.rkt"
           "generated/xilinx-ultrascale-plus-carry8.rkt")

  (current-solver (boolector))

  ;;; Test synthesis of bv-expr, and add result to list.
  (define (synthesize test-name bv-expr)
    (test-case test-name
      (begin
        (define with-vc-result
          (with-vc (with-terms
                    (synthesize-any
                     (xilinx-ultrascale-plus-architecture-description)
                     bv-expr
                     #:module-semantics
                     (list (cons (cons "LUT2" "../verilog/simulation/xilinx-ultrascale-plus/LUT2.v")
                                 xilinx-ultrascale-plus-lut2)
                           (cons (cons "LUT6" "../verilog/simulation/xilinx-ultrascale-plus/LUT6.v")
                                 xilinx-ultrascale-plus-lut6)
                           (cons (cons "CARRY8"
                                       "../verilog/simulation/xilinx-ultrascale-plus/CARRY8.v")
                                 xilinx-ultrascale-plus-carry8))))))
        (when (failed? with-vc-result)
          (raise (result-value with-vc-result)))
        (check-false (failed? with-vc-result))

        (define lakeroad-expr (result-value with-vc-result))

        (check-not-equal? lakeroad-expr #f))))

  ;;; TODO for now these need to be named l0..l5. Make this more flexible.
  (for ([sz (list 1 2 3 4 5 6 7 8 16 32 64)])
    ;;; Setup: Make symbolic terms.
    (after (gc-terms!)
           (define-symbolic l0 l1 (bitvector sz))
           (define-symbolic l2 (bitvector 1))
           (check-equal? (bvlen l0) sz)
           (check-equal? (bvlen l1) sz)
           (check-equal? (bvlen l2) 1)
           (log-info (format "Synthesizing UltraScale+ ~a bit ops" sz))
           (synthesize (format "~a bit mux" sz) (circt-comb-mux l2 l0 l1))
           (synthesize (format "~a bit <" sz) (bool->bitvector (bvult l0 l1)))
           (synthesize (format "~a bit <=" sz) (bool->bitvector (bvule l0 l1)))
           (synthesize (format "~a bit >" sz) (bool->bitvector (bvugt l0 l1)))
           (synthesize (format "~a bit >=" sz) (bool->bitvector (bvuge l0 l1)))
           (synthesize (format "~a bit ==" sz) (bool->bitvector (bveq l0 l1)))
           (synthesize (format "~a bit !=" sz) (bool->bitvector (not (bveq l0 l1))))
           (synthesize (format "~a bit &" sz) (bvand l0 l1))
           (synthesize (format "~a bit xor" sz) (bvxor l0 l1))
           (synthesize (format "~a bit |" sz) (bvor l0 l1))
           (synthesize (format "~a bit not" sz) (bvnot l0))
           (synthesize (format "~a bit +" sz) (bvadd l0 l1))
           (synthesize (format "~a bit -" sz) (bvsub l0 l1))
           (synthesize (format "~a bit bithack1" sz) (bithack1 l0 l1))
           ;;; Disabling after big refactor to use sketch generators. We didn't build a sketch
           ;;; generator that implements this.
           ;;;(synthesize (format "~a bit bithack2" sz) (bithack2 l0 l1))
           (synthesize (format "~a bit bithack3" sz) (bithack3 l0 l1))
           (synthesize (format "~a bit identity" sz) l0)
           (synthesize (format "~a bit *0" sz) (bvmul l0 (bv 0 sz)))
           (synthesize (format "~a bit *1" sz) (bvmul l0 (bv 1 sz)))
           (synthesize (format "~a bit *2" sz) (bvmul l0 (bv 2 sz)))
           (synthesize (format "~a bit <<0" sz) (circt-comb-shl l0 (bv 0 sz)))
           (synthesize (format "~a bit <<1" sz) (circt-comb-shl l0 (bv 1 sz)))
           ;;; Cleanup: Clear symbolic state.
           (begin
             (clear-vc!)
             (clear-terms!)
             (collect-garbage)))))
