#lang rosette

(require rackunit
         rosette
         (prefix-in gator: "gator-language.rkt")
         "gator-interpreter.rkt")

(provide gator-synthesize)

;;; spec-expr is spec
;;; impl-expr is sketch with holes
;;; both of these are written in gator
(define (gator-synthesize spec-expr impl-expr inputs)
  (define-symbolic t integer?)
  (define soln
    (synthesize #:forall (list t)
                #:guarantee
                (begin
                  (assume (>= t 0))
                  (assert (bveq (gator-interpret (list (gator:bv 1 1) (gator:int 1)) '() 0 t '())
                                (gator-interpret (list (gator:bv 1 1) (gator:int 1)) '() 0 t '()))))))
  soln)

(define-symbolic t integer?)

;;; Tests
;;; a is a stream that takes a nat and returns a BV
(gator-synthesize (list (gator:bv 1 1) (gator:int 1)) (list (gator:bv 1 1) (gator:int 1)) (list))
