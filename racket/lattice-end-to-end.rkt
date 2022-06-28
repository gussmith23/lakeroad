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
(define includes (for/list ([mod (list "LUT4.v" "PFUMX.v")]) (format "~a/~a" includes-dir mod)) )

(define (end-to-end-test bv-expr)
  (simulate-expr (synthesize-lakeroad-ecp5-impl bv-expr) #:includes includes))

(module+ test
  (require rackunit)

  ;;; TODO for now these need to be named l0..l5. Make this more flexible.
  (define-symbolic l0 l1 (bitvector 8))

  (check-true (end-to-end-test (bvand l0 l1)))
  ; (check-true (end-to-end-test (bvxor l0 l1)))
  ; (check-true (end-to-end-test (bvor l0 l1)))
  ; (check-true (end-to-end-test (bvadd l0 l1)))
  ; (check-true (end-to-end-test (bvsub l0 l1)))
  ; (check-true (end-to-end-test (bithack1 l0 l1)))
  ; (check-true (end-to-end-test (bithack2 l0 l1)))
  ; (check-true (end-to-end-test (bithack3 l0 l1)))
  ; (check-true (end-to-end-test l0))
  ; (check-true (end-to-end-test (bvmul l0 (bv 0 8))))
  ; (check-true (end-to-end-test (bvmul l0 (bv 1 8))))
  ; (check-true (end-to-end-test (bvmul l0 (bv 2 8))))
  ; (check-true (end-to-end-test (circt-comb-shl l0 (bv 0 8))))
  ; (check-true (end-to-end-test (circt-comb-shl l0 (bv 1 8))))
  )