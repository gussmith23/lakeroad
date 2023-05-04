#lang rosette/safe

(module+ test
  (require rackunit
           rosette/solver/smt/boolector
           "verilator.rkt"
           rosette
           "programs-to-synthesize.rkt"
           "circt-comb-operators.rkt"
           "synthesize.rkt"
           "utils.rkt"
           "generated/lattice-ecp5-lut4.rkt"
           "generated/lattice-ecp5-ccu2c.rkt"
           "architecture-description.rkt")

  (current-solver (boolector))

  (define to-simulate-list (list))

  ;;; Test synthesis of bv-expr, and add result to list.
  ;;; Expect a timeout when this is a bvmul w/ bitwidth > 10
  (define (synthesize test-name
                      bv-expr
                      #:display-impl? [display-impl? #f]
                      #:expect-timeout? [expect-timeout? #f]
                      #:max-time [max-time #f])
    (test-case test-name
      (begin
        (displayln bv-expr)
        (define with-vc-result
          (with-vc (with-terms
                    (synthesize-any
                     (lattice-ecp5-architecture-description)
                     bv-expr
                     #:module-semantics
                     (list (cons (cons "LUT4" "../f4pga-arch-defs/ecp5/primitives/slice/LUT4.v")
                                 lattice-ecp5-lut4)
                           (cons (cons "CCU2C" "../f4pga-arch-defs/ecp5/primitives/slice/CCU2C.v")
                                 lattice-ecp5-ccu2c))))))

        (when (failed? with-vc-result)
          (raise (result-value with-vc-result)))
        (check-false (failed? with-vc-result))

        (define lakeroad-expr (result-value with-vc-result))

        (when display-impl?
          (printf "Implementation: ~a\n" (pretty-format lakeroad-expr)))

        (if expect-timeout?
            ;;; TODO(@gussmith23): Standardize what the synthesis functions return when they fail.
            (check-equal? lakeroad-expr #f)
            (check-not-equal? lakeroad-expr #f))

        ;;; Add the result to the list of things to simulate, when the result is expected to be valid.
        (when (not expect-timeout?)
          (set! to-simulate-list (cons (to-simulate lakeroad-expr bv-expr) to-simulate-list))))))

  (for ([sz (list 1 2 3 4 5 6 7 8 16 32 64)])
    ;;; Setup: Make symbolic terms.
    (after (gc-terms!)
           (define-symbolic l0 l1 (bitvector sz))
           (define-symbolic l2 (bitvector 1))
           (check-equal? (bvlen l0) sz)
           (check-equal? (bvlen l1) sz)
           (check-equal? (bvlen l2) 1)
           (displayln (format "testing (bitvector ~a)" sz))
           ;;; To get these working, we need to add support for ltop-constant in the bitwise sketch.
           ;;; (synthesize (format "~a bit constant 1" sz) (bv 1 sz))
           ;;; (synthesize (format "~a bit constant (Non-sign bits set to high)" sz)
           ;;;             (bv (sub1 (arithmetic-shift 1 (sub1 sz))) sz))
           ;;; (synthesize (format "~a bit constant (LSBs set to high)" sz)
           ;;;             (bv (sub1 (arithmetic-shift 1 (quotient sz 2))) sz))
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
           ;;; Don't attempt multiplication synthesis for anything larger than 8.
           (when (<= sz 8)
             (synthesize (format "~a bit *" sz) (bvmul l0 l1)))
           (synthesize (format "~a bit bithack1" sz) (bithack1 l0 l1))
           (synthesize (format "~a bit bithack2" sz) (bithack2 l0 l1))
           (synthesize (format "~a bit bithack3" sz) (bithack3 l0 l1))
           (synthesize (format "~a bit identity" sz) l0)
           (synthesize (format "~a bit *0" sz) (bvmul l0 (bv 0 sz)))
           (synthesize (format "~a bit *1" sz) (bvmul l0 (bv 1 sz)))
           (synthesize (format "~a bit *2" sz) (bvmul l0 (bv 2 sz)))
           (synthesize (format "~a bit <<0" sz) (circt-comb-shl l0 (bv 0 sz)))
           (synthesize (format "~a bit <<1" sz) (circt-comb-shl l0 (bv 1 sz)))
           (displayln "")
           ;;; Cleanup: Clear symbolic state.
           (begin
             (clear-vc!)
             (clear-terms!)
             (collect-garbage))))

  (when (not (getenv "VERILATOR_INCLUDE_DIR"))
    (raise "VERILATOR_INCLUDE_DIR not set"))
  (define include-dir (build-path (get-lakeroad-directory) "f4pga-arch-defs/ecp5/primitives/slice"))
  (test-true "simulate all synthesized designs with Verilator"
             (simulate-with-verilator #:include-dirs (list include-dir)
                                      #:extra-verilator-args "-Wno-UNUSED -Wno-UNOPT"
                                      to-simulate-list
                                      (getenv "VERILATOR_INCLUDE_DIR"))))
