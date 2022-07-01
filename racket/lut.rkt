#lang racket

(provide lut)

(require rosette)

; The output of a LUT is simply the bit at the entry pointed to by
; `inputs-a`, when interpreted as an integer.
; It's probably worth putting this somewhere more generally usable.
; LUTs must return only one bit. TODO: figure out how to return multiple bits while still using
; theory of bitvectors only. The old solution used theory of integers to index into the bitvector.
(define (lut memory inputs)
  (let* ([inputs (zero-extend inputs (bitvector (length (bitvector->bits memory))))])
    (bit 0 (bvlshr memory inputs))))
