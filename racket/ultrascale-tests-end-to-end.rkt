#lang rosette/safe

(module+ test
  (require rackunit
           rosette/solver/smt/boolector
           "verilator.rkt"
           rosette
           "programs-to-synthesize.rkt"
           "circt-comb-operators.rkt"
           "utils.rkt"
           "synthesize.rkt")

  (current-solver (boolector))

  (define to-simulate-list (list))

  ;;; Test synthesis of bv-expr, and add result to list.
  (define (synthesize test-name bv-expr)
    (test-case
     test-name
     (begin
       (define with-vc-result (with-vc (with-terms (synthesize-xilinx-ultrascale-plus-impl bv-expr))))
       (check-false (failed? with-vc-result))
       ;;; (when (failed? with-vc-result)
       ;;;   (raise (result-value with-vc-result)))

       (define lakeroad-expr (result-value with-vc-result))

       ;;; TODO(@gussmith23): Standardize what the synthesis functions return when they fail.
       (check-not-equal? lakeroad-expr 'unsynthesizable)
       (check-not-equal? lakeroad-expr #f)

       (set! to-simulate-list (cons (to-simulate lakeroad-expr bv-expr) to-simulate-list)))))

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
           (synthesize (format "~a bit bithack2" sz) (bithack2 l0 l1))
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
             (collect-garbage))))

  (define include-dir (build-path (getenv "LAKEROAD_DIR") "verilator_xilinx"))
  (test-true
   "simulate all synthesized designs with Verilator"
   (simulate-with-verilator
    #:include-dirs (list (build-path (getenv "LAKEROAD_DIR") "verilator_xilinx")
                         (build-path (getenv "LAKEROAD_DIR") "verilator-unisims"))
    #:extra-verilator-args "-Wno-LATCH -Wno-ASSIGNDLY -DXIL_XECLIB -Wno-TIMESCALEMOD -Wno-PINMISSING"
    #:extra-cc-args "-DVL_TIME_STAMP64 -DVL_NO_LEGACY"
    to-simulate-list)))
