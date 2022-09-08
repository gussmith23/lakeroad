#lang racket

(provide lut)

(require rosette)

;;; Generic LUT semantics.
;;;
;;; The output of a LUT is simply the bit at the entry pointed to by `inputs`, when interpreted as an
;;; integer. For now, LUTs return only one bit.
(define (lut memory inputs)
  (let* ([inputs (zero-extend inputs (bitvector (length (bitvector->bits memory))))])
    (bit 0 (bvlshr memory inputs))))
