#lang racket

(require "ultrascale.rkt"
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
  (apply ultrascale-clb
         cin
         lut-memory-a
         lut-memory-b
         lut-memory-c
         lut-memory-d
         lut-memory-e
         lut-memory-f
         lut-memory-g
         lut-memory-h
         (ultrascale-logical-to-physical-inputs logical-input-0
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
     #:forall (list logical-input-0
                    logical-input-1
                    logical-input-2
                    logical-input-3
                    logical-input-4
                    logical-input-5)
     #:guarantee
     (begin
       ; Assume unused inputs are zero. We can set them to whatever we want, but it's important that
       ; we tell the solver that they're unused and unimportant, and setting them to a constant value
       ; is the way to this.
       ; When these aren't set, synthesis takes about 10-20x longer (20mins vs 1.5mins). In this case,
       ; we synthesize a LUT that is correct for inputs 0 and 1 regardless of the settings of the
       ; other inputs. I'm not sure if that's useful. I also wonder if there's a faster way to get
       ; the same result. E.g. either 1. assume 2-5 are all 0 and then manually edit the resulting LUT
       ; and duplicate the "correct" parts of the LUT memory into the rest of the LUT memory, OR, 2.,
       ; a more graceful solution, `assume` some predicates that basically say that 2-5 "don't matter"
       ; and that the outputs for a given 0 and 1 should be the same for any 2-5.
       (assume (bvzero? logical-input-2))
       (assume (bvzero? logical-input-3))
       (assume (bvzero? logical-input-4))
       (assume (bvzero? logical-input-5))
       (assert (bveq (f logical-input-0 logical-input-1) out)))))))
; Helper for 2 input functions. We could extend this.
(define (helper4 f)
  (println f)
  (println (time (synthesize
                  #:forall (list logical-input-0
                                 logical-input-1
                                 logical-input-2
                                 logical-input-3
                                 logical-input-4
                                 logical-input-5)
                  #:guarantee
                  (begin
                    (assume (bvzero? logical-input-4))
                    (assume (bvzero? logical-input-5))
                    (assert (bveq (f logical-input-0 logical-input-1 logical-input-2 logical-input-3)
                                  out)))))))

(helper floor-avg)
(helper bithack3)
(helper bithack2)
(helper bithack1)
(helper ceil-avg)
(helper bvadd)
(helper4 cycle)
