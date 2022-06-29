#lang errortrace racket

(require rosette
         rosette/solver/smt/boolector
         rosette/lib/synthax
         json
         racket/pretty
         "interpreter.rkt"
         "lattice-ecp5.rkt"
         "programs-to-synthesize.rkt"
         "circt-comb-operators.rkt"
         "comp-json.rkt"
         "utils.rkt")

(current-solver (boolector))

(define luts (make-n-symbolics 8 (bitvector 16)))
(define logical-inputs (make-n-symbolics 4 (bitvector 8)))
(define lut-inputs (apply lattice-ecp5-logical-to-physical-inputs logical-inputs))
(define out (interpret `(lattice-ecp5-pfu ,@luts ,lut-inputs)))

(define (helper f arity)
  (define soln
    (synthesize #:forall logical-inputs
                #:guarantee (begin
                              (assert (bveq (apply f (take logical-inputs arity))
                                            (apply concat (reverse out)))))))
  soln)

(module+ test
  (require rackunit)

  ; Test synthesis of various functions on UltraScale+.
  ; If any test starts failing, it's presumably because our UltraScale+ model changed. The question
  ; is, was the change correct?
  ; If a check-true test fails, then the model became less flexible.
  ; If a check-false test fails, then the model became more flexible.
  ; It's up to you to determine whether the change was correct!

  (displayln "Testing Synthesis of Identity Function")
  (check-true (sat? (helper identity 1)))

  (displayln "Testing Synthesis of CIRCT Comb Dialect Functions")
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

  (displayln "Testing Synthesis of Bithack Examples")
  ; ; Bithack examples.
  (check-false (sat? (helper floor-avg 2)))
  (check-true (sat? (helper bithack3 2)))
  (check-false (sat? (helper bithack2 2)))
  (check-true (sat? (helper bithack1 2)))
  (check-false (sat? (helper ceil-avg 2)))
  (check-false (sat? (helper bvadd 2)))
  (check-false (sat? (helper cycle 4))))
