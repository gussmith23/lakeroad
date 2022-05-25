;;; Interpreter for the Lakeroad FPGA modeling DSL.
#lang errortrace racket

(provide interpret)

(require "logical-to-physical.rkt")

(define (interpret expr)
  (match expr
    [`(logical-to-physical-inputs ,_ ...) (interpret-logical-to-physical-inputs expr)]))

(module+ test
  (require rackunit
           rosette)

  (check-equal? (interpret `(logical-to-physical-inputs ,(lambda (x) x) ,(list (bv 1 1) (bv 0 1))))
                (list (bv 1 1) (bv 0 1))))
