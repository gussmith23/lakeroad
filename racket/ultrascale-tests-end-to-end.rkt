#lang errortrace racket

(require "compile-to-json.rkt"
         "verilator.rkt"
         json
         rosette
         rosette/lib/synthax
         "interpreter.rkt"
         "programs-to-synthesize.rkt"
         "circt-comb-operators.rkt"
         "utils.rkt")

(define (end-to-end-test bv-expr)
  (when (> (length (symbolics bv-expr)) 6)
    (error "Only 6 inputs supported"))

  ;;; Form the list of logical inputs, and pad up to make sure there are 6.
  (define logical-inputs
    (append (symbolics bv-expr) (make-list (- 6 (length (symbolics bv-expr))) (bv #xff 8))))

  (define lakeroad-expr
    `(first (physical-to-logical-mapping
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
                                  (logical-to-physical-mapping (bitwise) ,logical-inputs)))))

  (define soln
    ; TODO(@gussmith23) Time synthesis. For some reason, time-apply doesn't mix well with synthesize.
    ; And time just prints to stdout, which is not ideal (but we could deal with it if necessary).
    (synthesize #:forall logical-inputs
                #:guarantee (begin
                              (assert (bveq bv-expr (interpret lakeroad-expr))))))

  (when (not (sat? soln))
    (error "expected sat soln"))

  (simulate-expr (evaluate lakeroad-expr soln) bv-expr))

(module+ test
  (require rackunit)

  ;;; TODO for now these need to be named l0..l5. Make this more flexible.
  (define-symbolic l0 l1 (bitvector 8))

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
