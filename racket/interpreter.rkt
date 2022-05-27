;;; Interpreter for the Lakeroad FPGA modeling DSL.
#lang errortrace racket

(provide interpret)

(require "logical-to-physical.rkt")

(define (interpret expr)
  (match expr
    [`(logical-to-physical-inputs ,_ ...) (interpret-logical-to-physical-inputs interpret expr)]
    [`(physical-to-logical-mapping ,_ ...) (interpret-physical-to-logical-mapping interpret expr)]
    ;;; Everything else gets returned as-is. This means that calling (interpret) on Racket expressions
    ;;; gives back Racket expressions, meaning we can use Racket expressions in our DSL.
    ;;; It would be better if we could have a way that would catch invalid syntax...
    [other other]))

(module+ test
  (require rackunit
           rosette)

  ;;; Interpreting Racket expressions should give back Racket expressions.
  (check-equal? (interpret 1) 1)
  (check-equal? (interpret (list 1 2 3)) (list 1 2 3))
  (check-equal? (interpret 'test) 'test)

  (check-equal? (interpret `(physical-to-logical-mapping bitwise ,(list (bv #b1 1) (bv #b0 1))))
                (list (bv #b01 2)))

  (check-equal? (interpret `(logical-to-physical-inputs ,(lambda (x) x) ,(list (bv 1 1) (bv 0 1))))
                (list (bv 1 1) (bv 0 1))))
