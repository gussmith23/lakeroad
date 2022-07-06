#lang errortrace racket

(require "compile-to-json.rkt"
         "verilator.rkt"
         json
         rosette
         rosette/lib/synthax
         "interpreter.rkt"
         "programs-to-synthesize.rkt"
         "circt-comb-operators.rkt"
         "utils.rkt"
         "synthesize.rkt")

(define includes-dir (build-path (getenv "LAKEROAD_DIR") "verilator_xilinx"))
(define includes
  (for/list ([mod (list "CARRY8.v" "LUT6_2.v" "LUT2.v" "LUT1.v")])
    (format "~a/~a" includes-dir mod)))
(define (end-to-end-test bv-expr)
  (simulate-expr (synthesize-xilinx-ultrascale-plus-impl bv-expr) bv-expr #:includes includes))

(module+ test
  (require rackunit
           rosette/solver/smt/boolector)

  (current-solver (boolector))

  (test-begin (define-symbolic l0 l1 (bitvector 1))
              (check-true (end-to-end-test (bool->bitvector (bveq l0 l1)))))

  (test-begin (define-symbolic l0 l1 (bitvector 2))
              (check-true (end-to-end-test (bool->bitvector (bveq l0 l1)))))

  (test-begin (define-symbolic l0 l1 (bitvector 3))
              (check-true (end-to-end-test (bool->bitvector (bveq l0 l1)))))

  (test-begin (define-symbolic l0 l1 (bitvector 4))
              (check-true (end-to-end-test (bool->bitvector (bveq l0 l1)))))

  (test-begin (define-symbolic l0 l1 (bitvector 5))
              (check-true (end-to-end-test (bool->bitvector (bveq l0 l1)))))

  (test-begin (define-symbolic l0 l1 (bitvector 6))
              (check-true (end-to-end-test (bool->bitvector (bveq l0 l1)))))

  (test-begin (define-symbolic l0 l1 (bitvector 7))
              (check-true (end-to-end-test (bool->bitvector (bveq l0 l1)))))

  ;;; TODO for now these need to be named l0..l5. Make this more flexible.
  (test-begin (define-symbolic l0 l1 (bitvector 8))
              (check-true (end-to-end-test (bool->bitvector (bvult l0 l1))))
              (check-true (end-to-end-test (bool->bitvector (bvule l0 l1))))
              (check-true (end-to-end-test (bool->bitvector (bvugt l0 l1))))
              (check-true (end-to-end-test (bool->bitvector (bvuge l0 l1))))
              (check-true (end-to-end-test (bool->bitvector (bveq l0 l1))))
              (check-true (end-to-end-test (bool->bitvector (not (bveq l0 l1)))))
              (check-true (end-to-end-test (bvand l0 l1)))
              (check-true (end-to-end-test (bvxor l0 l1)))
              (check-true (end-to-end-test (bvor l0 l1)))
              (check-true (end-to-end-test (bvadd l0 l1)))
              (check-true (end-to-end-test (bvsub l0 l1)))
              (check-true (end-to-end-test (bithack1 l0 l1)))
              (check-true (end-to-end-test (bithack2 l0 l1)))
              (check-true (end-to-end-test (bithack3 l0 l1)))
              (check-true (end-to-end-test l0))
              (check-true (end-to-end-test (bvmul l0 (bv 0 8))))
              (check-true (end-to-end-test (bvmul l0 (bv 1 8))))
              (check-true (end-to-end-test (bvmul l0 (bv 2 8))))
              (check-true (end-to-end-test (circt-comb-shl l0 (bv 0 8))))
              (check-true (end-to-end-test (circt-comb-shl l0 (bv 1 8)))))

  ;;; TODO for now these need to be named l0..l5. Make this more flexible.
  (test-begin (define-symbolic l0 l1 (bitvector 16))
              (check-true (end-to-end-test (bool->bitvector (bvult l0 l1))))
              (check-true (end-to-end-test (bool->bitvector (bvule l0 l1))))
              (check-true (end-to-end-test (bool->bitvector (bvugt l0 l1))))
              (check-true (end-to-end-test (bool->bitvector (bvuge l0 l1))))
              (check-true (end-to-end-test (bool->bitvector (bveq l0 l1))))
              (check-true (end-to-end-test (bool->bitvector (not (bveq l0 l1)))))
              (check-true (end-to-end-test (bvand l0 l1)))
              (check-true (end-to-end-test (bvxor l0 l1)))
              (check-true (end-to-end-test (bvor l0 l1)))
              (check-true (end-to-end-test (bvadd l0 l1)))
              (check-true (end-to-end-test (bvsub l0 l1)))
              (check-true (end-to-end-test (bithack1 l0 l1)))
              (check-true (end-to-end-test (bithack2 l0 l1)))
              (check-true (end-to-end-test (bithack3 l0 l1)))
              (check-true (end-to-end-test l0))
              (check-true (end-to-end-test (bvmul l0 (bv 0 16))))
              (check-true (end-to-end-test (bvmul l0 (bv 1 16))))
              (check-true (end-to-end-test (bvmul l0 (bv 2 16))))
              (check-true (end-to-end-test (circt-comb-shl l0 (bv 0 16))))
              (check-true (end-to-end-test (circt-comb-shl l0 (bv 1 16)))))

  (test-begin (define-symbolic l0 l1 (bitvector 32))
              (check-true (end-to-end-test (bool->bitvector (bveq l0 l1))))))
