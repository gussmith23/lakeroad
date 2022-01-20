#lang racket

(require
  "ultrascale.rkt"
  rosette
  rackunit)

; A simple logical-to-physical inputs function, in which the first (least significant) bit of each
; logical input is mapped to LUT A (logical input 0 in the least significant place), the second bit is
; mapped to LUT B, etc.
(define (logical-to-physical-inputs
         logical-input-0
         logical-input-1
         logical-input-2
         logical-input-3
         logical-input-4
         logical-input-5)
  (let
      ([helper
        (lambda (idx)
          (concat
           (extract idx idx logical-input-0)
           (extract idx idx logical-input-1)
           (extract idx idx logical-input-2)
           (extract idx idx logical-input-3)
           (extract idx idx logical-input-4)
           (extract idx idx logical-input-5)
           )
          )])
    (list
     (helper 0)
     (helper 1)
     (helper 2)
     (helper 3)
     (helper 4)
     (helper 5)
     (helper 6)
     (helper 7))))


(define (generate-inputs input-width)
  (define-symbolic* inputs (bitvector input-width))
  inputs)

; A LUT's memory contains an `output-width`-sized entry for each of the possible `2^input-width`
; entries.
(define (generate-memory input-width output-width)
  (define-symbolic* memory (bitvector (* output-width (expt 2 input-width))))
  memory)

(define-symbolic* cin (bitvector 1))
(define-symbolic* lut-memory-a (bitvector 128))
(define-symbolic* lut-memory-b (bitvector 128))
(define-symbolic* lut-memory-c (bitvector 128))
(define-symbolic* lut-memory-d (bitvector 128))
(define-symbolic* lut-memory-e (bitvector 128))
(define-symbolic* lut-memory-f (bitvector 128))
(define-symbolic* lut-memory-g (bitvector 128))
(define-symbolic* lut-memory-h (bitvector 128))

(define-symbolic* logical-input-0 (bitvector 8))
(define-symbolic* logical-input-1 (bitvector 8))
(define-symbolic* logical-input-2 (bitvector 8))
(define-symbolic* logical-input-3 (bitvector 8))
(define-symbolic* logical-input-4 (bitvector 8))
(define-symbolic* logical-input-5 (bitvector 8))

(define out
  (apply
   ultrascale-clb
   cin
   lut-memory-a
   lut-memory-b
   lut-memory-c
   lut-memory-d
   lut-memory-e
   lut-memory-f
   lut-memory-g
   lut-memory-h
   (logical-to-physical-inputs
    logical-input-0
    logical-input-1
    logical-input-2
    logical-input-3
    logical-input-4
    logical-input-5)))

(define m3
  (time
   (synthesize
    #:forall (list
              logical-input-0
              logical-input-1
              logical-input-2
              logical-input-3
              logical-input-4
              logical-input-5
              )
    #:guarantee
    (assert (bveq (bvadd logical-input-0 logical-input-1) out)))))
(print "m3")
(print m3)