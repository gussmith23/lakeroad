#lang racket

(require "ultrascale.rkt"
         rosette
         "programs-to-synthesize.rkt"
         "circt-comb-operators.rkt")

(define-symbolic cin (bitvector 1))
(define-symbolic lut-memory-a (bitvector 64))
(define-symbolic lut-memory-b (bitvector 64))
(define-symbolic lut-memory-c (bitvector 64))
(define-symbolic lut-memory-d (bitvector 64))
(define-symbolic lut-memory-e (bitvector 64))
(define-symbolic lut-memory-f (bitvector 64))
(define-symbolic lut-memory-g (bitvector 64))
(define-symbolic lut-memory-h (bitvector 64))

(define-symbolic mux-selector-a (bitvector 2))
(define-symbolic mux-selector-b (bitvector 2))
(define-symbolic mux-selector-c (bitvector 2))
(define-symbolic mux-selector-d (bitvector 2))
(define-symbolic mux-selector-e (bitvector 2))
(define-symbolic mux-selector-f (bitvector 2))
(define-symbolic mux-selector-g (bitvector 2))
(define-symbolic mux-selector-h (bitvector 2))
(assert (< (bitvector->natural mux-selector-a) 3))
(assert (< (bitvector->natural mux-selector-b) 3))
(assert (< (bitvector->natural mux-selector-c) 3))
(assert (< (bitvector->natural mux-selector-d) 3))
(assert (< (bitvector->natural mux-selector-e) 3))
(assert (< (bitvector->natural mux-selector-f) 3))
(assert (< (bitvector->natural mux-selector-g) 3))
(assert (< (bitvector->natural mux-selector-h) 3))

(define-symbolic logical-input-0 (bitvector 8))
(define-symbolic logical-input-1 (bitvector 8))
(define-symbolic logical-input-2 (bitvector 8))
(define-symbolic logical-input-3 (bitvector 8))
(define-symbolic logical-input-4 (bitvector 8))
(define-symbolic logical-input-5 (bitvector 8))

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
         mux-selector-a
         mux-selector-b
         mux-selector-c
         mux-selector-d
         mux-selector-e
         mux-selector-f
         mux-selector-g
         mux-selector-h
         (ultrascale-logical-to-physical-inputs logical-input-0
                                                logical-input-1
                                                logical-input-2
                                                logical-input-3
                                                logical-input-4
                                                logical-input-5)))

(define logical-inputs
  (list logical-input-0
        logical-input-1
        logical-input-2
        logical-input-3
        logical-input-4
        logical-input-5))

(define (helper f arity)
  (println f)
  (define soln
    (time
     (synthesize
      #:forall logical-inputs
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
        (for ([logical-input (list-tail logical-inputs arity)])
          (assume (bvzero? logical-input)))

        ; Assert that the output of the CLB implements the requested function f.
        (assert (bveq (apply f (take logical-inputs arity)) out))))))

  ; Print the output. Unwrap the model if there is one, so that all of the values print.
  (if (sat? soln) (pretty-print (model soln)) (println soln))
  (displayln ""))

; Simple test: identify function.
(helper (lambda (a) a) 1)

; CIRCT Comb dialect.
(helper circt-comb-add 2)
(helper circt-comb-and 2)
(helper circt-comb-divs 2)
(helper circt-comb-divu 2)
(helper (lambda (a b) (zero-extend (circt-comb-icmp a b) (bitvector 8))) 2)
(helper circt-comb-mods 2)
(helper circt-comb-mul 2)
(helper circt-comb-mux 3)
(helper circt-comb-or 2)
(helper (lambda (a) (zero-extend (circt-comb-parity a) (bitvector 8))) 1)
(helper circt-comb-shl 2)
(helper circt-comb-shrs 2)
(helper circt-comb-shru 2)
(helper circt-comb-sub 2)
(helper circt-comb-xor 2)

; Bithack examples.
(helper floor-avg 2)
(helper bithack3 2)
(helper bithack2 2)
(helper bithack1 2)
(helper ceil-avg 2)
(helper bvadd 2)
(helper cycle 4)
