#lang racket

(require
  "ultrascale.rkt"
  rosette
  "programs-to-synthesize.rkt")

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
   (ultrascale-logical-to-physical-inputs
    logical-input-0
    logical-input-1
    logical-input-2
    logical-input-3
    logical-input-4
    logical-input-5)))

(define (helper f)
  (println f)
  (println
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
     (assert (bveq (f logical-input-0 logical-input-1) out))))))

(helper floor-avg)
(helper bithack3)
(helper bithack2)
(helper bithack1)
(helper ceil-avg)
(helper bvadd)