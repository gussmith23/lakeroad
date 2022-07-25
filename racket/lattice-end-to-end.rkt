#lang errortrace errortrace racket

(require "compile-to-json.rkt"
         "verilator.rkt"
         json
         rosette
         rosette/lib/synthax
         "interpreter.rkt"
         "programs-to-synthesize.rkt"
         "lattice-ecp5.rkt"
         "circt-comb-operators.rkt"
         "synthesize.rkt"
         "utils.rkt")

(define includes-dir (build-path (getenv "LAKEROAD_DIR") "f4pga-arch-defs/ecp5/primitives/slice"))
(define includes
  (for/list ([mod (list "LUT4.v" "PFUMX.v" "CCU2C.v" "LUT2.v")])
    (format "~a/~a" includes-dir mod)))

(define (end-to-end-test bv-expr)
  (displayln bv-expr)
  (define with-vc-result (with-vc (with-terms (synthesize-lattice-ecp5-impl bv-expr))))
  (when (failed? with-vc-result)
    (raise (result-value with-vc-result)))
  (define lakeroad-expr (result-value with-vc-result))

  (simulate-expr
   lakeroad-expr
   bv-expr
   #:includes includes))

(module+ test
  (require rackunit
           rosette/solver/smt/boolector)

  (current-solver (boolector))

  (for ([sz (list 1 2 3 4 5 6 7 8 16 32 64)])
    ;;; Setup: Make symbolic terms.
    (after (gc-terms!)
           (define-symbolic l0 l1 (bitvector sz))
           (define-symbolic l2 (bitvector 1))
           (check-equal? (bvlen l0) sz)
           (check-equal? (bvlen l1) sz)
           (check-equal? (bvlen l2) 1)
           (displayln (format "testing (bitvector ~a)" sz))
           (test-true (format "~a bit mux" sz) (end-to-end-test (circt-comb-mux l2 l0 l1)))
           (test-true (format "~a bit <" sz) (end-to-end-test (bool->bitvector (bvult l0 l1))))
           (test-true (format "~a bit <=" sz) (end-to-end-test (bool->bitvector (bvule l0 l1))))
           (test-true (format "~a bit >" sz) (end-to-end-test (bool->bitvector (bvugt l0 l1))))
           (test-true (format "~a bit >=" sz) (end-to-end-test (bool->bitvector (bvuge l0 l1))))
           (test-true (format "~a bit ==" sz) (end-to-end-test (bool->bitvector (bveq l0 l1))))
           (test-true (format "~a bit !=" sz) (end-to-end-test (bool->bitvector (not (bveq l0 l1)))))
           (test-true (format "~a bit &" sz) (end-to-end-test (bvand l0 l1)))
           (test-true (format "~a bit xor" sz) (end-to-end-test (bvxor l0 l1)))
           (test-true (format "~a bit |" sz) (end-to-end-test (bvor l0 l1)))
           (test-true (format "~a bit not" sz) (end-to-end-test (bvnot l0)))
           (test-true (format "~a bit +" sz) (end-to-end-test (bvadd l0 l1)))
           (test-true (format "~a bit -" sz) (end-to-end-test (bvsub l0 l1)))
           (test-true (format "~a bit bithack1" sz) (end-to-end-test (bithack1 l0 l1)))
           (test-true (format "~a bit bithack2" sz) (end-to-end-test (bithack2 l0 l1)))
           (test-true (format "~a bit bithack3" sz) (end-to-end-test (bithack3 l0 l1)))
           (test-true (format "~a bit identity" sz) (end-to-end-test l0))
           (test-true (format "~a bit *0" sz) (end-to-end-test (bvmul l0 (bv 0 sz))))
           (test-true (format "~a bit *1" sz) (end-to-end-test (bvmul l0 (bv 1 sz))))
           (test-true (format "~a bit *2" sz) (end-to-end-test (bvmul l0 (bv 2 sz))))
           ; (test-true (format "~a bit <<0" sz) (end-to-end-test (circt-comb-shl l0 (bv 0 sz))))
           ; (test-true (format "~a bit <<1" sz) (end-to-end-test (circt-comb-shl l0 (bv 1 sz))))
           (displayln "")
           ;;; Cleanup: Clear symbolic state.
           (begin
             (clear-vc!)
             (clear-terms!)
             (collect-garbage)))))