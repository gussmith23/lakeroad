#lang racket

(require "lattice-ecp5.rkt"
         rosette
         "programs-to-synthesize.rkt"
         "circt-comb-operators.rkt"
         rosette/solver/smt/boolector)

(current-solver (boolector))

(current-solver (boolector))

(define-symbolic cin (bitvector 1))
(define-symbolic lut-memory-a (bitvector 16))
(define-symbolic lut-memory-b (bitvector 16))
(define-symbolic lut-memory-c (bitvector 16))
(define-symbolic lut-memory-d (bitvector 16))
(define-symbolic lut-memory-e (bitvector 16))
(define-symbolic lut-memory-f (bitvector 16))
(define-symbolic lut-memory-g (bitvector 16))
(define-symbolic lut-memory-h (bitvector 16))

(define-symbolic logical-input-0 (bitvector 8))
(define-symbolic logical-input-1 (bitvector 8))
(define-symbolic logical-input-2 (bitvector 8))
(define-symbolic logical-input-3 (bitvector 8))

(define out
  (apply interpret-lattice-ecp5-pfu
         (lattice-ecp5-pfu (lattice-ecp5-lut4 lut-memory-a)
                           (lattice-ecp5-lut4 lut-memory-b)
                           (lattice-ecp5-lut4 lut-memory-c)
                           (lattice-ecp5-lut4 lut-memory-d)
                           (lattice-ecp5-lut4 lut-memory-e)
                           (lattice-ecp5-lut4 lut-memory-f)
                           (lattice-ecp5-lut4 lut-memory-g)
                           (lattice-ecp5-lut4 lut-memory-h))
         ; cin
         (lattice-ecp5-logical-to-physical-inputs logical-input-0
                                                  logical-input-1
                                                  logical-input-2
                                                  logical-input-3)))

(define logical-inputs
  (list logical-input-0
        logical-input-1
        logical-input-2
        logical-input-3))

; The following is copied verbatim (modulo some formatting) from
; ultrascale-tests.rkt
(define (helper f arity)
  (if (equal? arity 6) (error "arity 6 not supported yet") '())
  (match-let
   ([soln
     ; TODO(@gussmith23) Time synthesis. For some reason, time-apply doesn't mix
     ; well with synthesize.  And time just prints to stdout, which is not ideal
     ; (but we could deal with it if necessary).
     (synthesize
      #:forall logical-inputs
      #:guarantee
      (begin

        ; TODO: Make a github issue
        ; Assume unused inputs are zero. We can set them to whatever we want,
        ; but it's important that we tell the solver that they're unused and
        ; unimportant, and setting them to a constant value is the way to this.
        ;
        ; When these aren't set, synthesis takes about 10-20x longer (20mins vs
        ; 1.5mins). In this case, we synthesize a LUT that is correct for inputs
        ; 0 and 1 regardless of the settings of the other inputs. I'm not sure
        ; if that's useful. I also wonder if there's a faster way to get the
        ; same result. E.g. either:

        ; 1. assume 2-5 are all 0 and then manually edit the resulting LUT and
        ;    duplicate the "correct" parts of the LUT memory into the rest of
        ;    the LUT memory, OR,

        ; 2. a more graceful solution, `assume` some predicates that basically
        ;    say that 2-5 "don't matter" and that the outputs for a given 0 and
        ;    1 should be the same for any 2-5.
        (for ([logical-input (list-tail logical-inputs arity)])
          (assume (bvzero? logical-input)))

        ; Assert that the output of the PFU implements the requested function f.
        (assert (bveq (apply f (take logical-inputs arity)) out))))])
   ; Print the output. Unwrap the model if there is one, so that all of the
   ; values print.
   ;(println f)
   ;(if (sat? soln) (pretty-print (model soln)) (println soln))
   ;(displayln "")
   soln))

(module+ test
  (require rackunit)

  ; Test synthesis of various functions on UltraScale+.
  ; If any test starts failing, it's presumably because our UltraScale+ model changed. The question
  ; is, was the change correct?
  ; If a check-true test fails, then the model became less flexible.
  ; If a check-false test fails, then the model became more flexible.
  ; It's up to you to determine whether the change was correct!

  ; Simple test: identify function.
  (check-true (sat? (helper (lambda (a) a) 1)))

  ; CIRCT Comb dialect.
  (check-false (sat? (helper circt-comb-add 2)))
  (check-true (sat? (helper circt-comb-and 2)))
  (check-false (sat? (helper circt-comb-divs 2)))
  (check-false (sat? (helper circt-comb-divu 2)))
  (check-false (sat? (helper (lambda (a b) (zero-extend (circt-comb-icmp a b) (bitvector 8))) 2)))
  (check-false (sat? (helper circt-comb-mods 2)))
  (check-false (sat? (helper circt-comb-mul 2)))
  (check-false (sat? (helper circt-comb-mux 3)))
  (check-true (sat? (helper circt-comb-or 2)))
  (check-false (sat? (helper (lambda (a) (zero-extend (circt-comb-parity a) (bitvector 8))) 1)))
  (check-false (sat? (helper circt-comb-shl 2)))
  (check-false (sat? (helper circt-comb-shrs 2)))
  (check-false (sat? (helper circt-comb-shru 2)))
  (check-false (sat? (helper circt-comb-sub 2)))
  (check-true (sat? (helper circt-comb-xor 2)))

  ; Bithack examples.
  (check-false (sat? (helper floor-avg 2)))
  (check-true (sat? (helper bithack3 2)))
  (check-false (sat? (helper bithack2 2)))
  (check-true (sat? (helper bithack1 2)))
  (check-false (sat? (helper ceil-avg 2)))
  (check-false (sat? (helper bvadd 2)))
  (check-false (sat? (helper cycle 4))))