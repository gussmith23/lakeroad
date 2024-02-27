#lang rosette

(require rackunit rosette
         "gator-interpreter.rkt")

(provide gator-synthesize)

;;; spec-expr is spec
;;; impl-expr is sketch with holes
;;; both of these are written in gator
(define (gator-synthesize spec-expr impl-expr inputs)
  (define-symbolic t (integer?))
  (define soln
    (synthesize #:forall (cons t inputs)
                #:guarantee (begin
                              (assert (bveq (gator-interpret spec-expr 0 t)
                                            (gator-interpret impl-expr 0 t))))))
  soln)
