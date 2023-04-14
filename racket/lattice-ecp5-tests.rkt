#lang racket

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
         "utils.rkt"
         "logical-to-physical.rkt"
         "signal.rkt"
         (prefix-in lr: "language.rkt"))

(current-solver (boolector))

(define (helper f arity #:bitwidth [bitwidth 8] #:primitive [primitive 'pfu])
  (define logical-inputs
    (lr:list (map lr:bv
                  (append (map bv->signal (make-n-symbolics arity (bitvector bitwidth)))
                          (map bv->signal (make-list (- 4 arity) (bv -1 bitwidth)))))))
  (define bv-expr (apply f (map signal-value (take (interpret logical-inputs) arity))))
  (define lakeroad-expr
    (lr:list-ref (physical-to-logical-mapping
                  (ptol-bitwise)
                  (match primitive
                    ['pfu (make-lattice-pfu-expr logical-inputs)]
                    ['ccu2c (make-lattice-ccu2c-expr #:inputs logical-inputs)]
                    ['ripple-pfu (make-lattice-ripple-pfu-expr #:inputs logical-inputs)]))
                 (lr:integer 0)))
  (define interpretted (signal-value (interpret lakeroad-expr)))
  ; Carries will return an extra leading bit, so we need to extract the sum
  ; signal and discard the carry
  (define extracted
    (match primitive
      ['pfu interpretted]
      ['ccu2c (extract (- bitwidth 1) 0 interpretted)]
      ['ripple-pfu (extract (- bitwidth 1) 0 interpretted)]))
  (define soln
    (synthesize #:forall logical-inputs
                #:guarantee (begin
                              (assert (bveq bv-expr extracted)))))
  soln)

(module+ test
  (require rackunit)

  ; Test synthesis of various functions on UltraScale+.
  ; If any test starts failing, it's presumably because our UltraScale+ model changed. The question
  ; is, was the change correct?
  ; If a check-true test fails, then the model became less flexible.
  ; If a check-false test fails, then the model became more flexible.
  ; It's up to you to determine whether the change was correct!

  (define (curry-carry INIT0 INIT1 INJECT1_0 INJECT1_1)
    (lambda (CIN inputs)
      (interpret (lr:list-ref (physical-to-logical-mapping
                               (ptol-bitwise)
                               (make-lattice-ccu2c-expr
                                #:CIN CIN
                                #:inputs (logical-to-physical-mapping (ltop-bitwise) inputs)
                                #:INIT0 INIT0
                                #:INIT1 INIT1
                                #:INJECT1_0 INJECT1_0
                                #:INJECT1_1 INJECT1_1))
                              (lr:integer 0)))))
  ;; Test an adder above, on inputs `inputs` against
  ;; outputs ; #:S0 #:S1 and cout #:COUT. Optionally specify a carry in with #:CIN
  ;; (defaults to 0)
  (define (test-carry #:A A
                      #:B B
                      #:C [C (bv->signal (bv 3 2))]
                      #:D [D (bv->signal (bv 3 2))]
                      #:CIN [cin (bv->signal (bv 0 1))]
                      #:S0 s0
                      #:S1 s1
                      #:COUT cout
                      #:INIT0 [INIT0 (bv->signal (bv #x6868 16))]
                      #:INIT1 [INIT1 (bv->signal (bv #x6868 16))]
                      #:INJECT1_0 [INJECT1_0 (bv->signal (bv 0 1))]
                      #:INJECT1_1 [INJECT1_1 (bv->signal (bv 0 1))])
    (let* (
      [carry (curry-carry INIT0 INIT1 INJECT1_0 INJECT1_1)]
           [inputs (lr:list (list (lr:bv A) (lr:bv B) (lr:bv C) (lr:bv D)))]
           [result (carry cin inputs)]
           [bits (bitvector->bits (signal-value result))]
           [S0 (first bits)]
           [S1 (second bits)]
           [COUT (third bits)])
      (check-true (bveq S0 (signal-value s0)) (format "Actual S0 ~a != ~a" S0 s0))
      (check-true (bveq S1 (signal-value s1)) (format "Actual S1 ~a != ~a" S1 s1))
      (check-true (bveq COUT (signal-value cout)) (format "Actual COUT ~a != ~a" COUT cout))))

  (test-carry #:A (bv->signal (bv 1 2)) #:B (bv->signal (bv 1 2)) #:S0 (bv->signal (bv 0 1)) #:S1 (bv->signal (bv 1 1)) #:COUT (bv->signal (bv 0 1)))

  (test-carry #:A (bv->signal (bv 1 2)) #:B (bv->signal (bv 1 2)) #:CIN (bv->signal (bv 1 1)) #:S0 (bv->signal (bv 1 1)) #:S1 (bv->signal (bv 1 1)) #:COUT (bv->signal (bv 0 1)))

  (test-carry #:A (bv->signal (bv 0 2)) #:B (bv->signal (bv 1 2)) #:CIN (bv->signal (bv 1 1)) #:S0 (bv->signal (bv 0 1)) #:S1 (bv->signal (bv 1 1)) #:COUT (bv->signal (bv 0 1)))

  (test-carry #:A (bv->signal (bv 1 2)) #:B (bv->signal (bv 0 2)) #:CIN (bv->signal (bv 1 1)) #:S0 (bv->signal (bv 0 1)) #:S1 (bv->signal (bv 1 1)) #:COUT (bv->signal (bv 0 1)))

  (test-carry #:A (bv->signal (bv 0 2)) #:B (bv->signal (bv 0 2)) #:CIN (bv->signal (bv 1 1)) #:S0 (bv->signal (bv 1 1)) #:S1 (bv->signal (bv 0 1)) #:COUT (bv->signal (bv 0 1)))

  ; (check-true (sat? (helper circt-comb-add 2 #:primitive 'ccu2c #:bitwidth 2)))

  (displayln "Testing Synthesis of Identity Function")
  (check-true (sat? (helper identity 1)))

  (displayln "Testing Synthesis of CIRCT Comb Dialect Functions")
  ; CIRCT Comb dialect.
  (check-true (sat? (helper circt-comb-add 2 #:primitive 'ripple-pfu #:bitwidth 8)))
  (check-true (sat? (helper circt-comb-and 2)))
  (check-false (sat? (helper circt-comb-divu 2)))
  (check-false (sat? (helper (lambda (a b) (zero-extend (circt-comb-icmp a b) (bitvector 8))) 2)))
  (check-false (sat? (helper circt-comb-mods 2)))
  (check-false (sat? (helper circt-comb-mul 2)))
  (check-false (sat? (helper circt-comb-mux 3)))
  (check-true (sat? (helper circt-comb-or 2)))
  (check-false (sat? (helper (lambda (a) (zero-extend (circt-comb-parity a) (bitvector 8))) 1)))
  (check-false (sat? (helper circt-comb-shl 2 #:primitive 'ripple-pfu #:bitwidth 8)))
  (check-false (sat? (helper circt-comb-shrs 2 #:primitive 'ripple-pfu #:bitwidth 8)))
  (check-false (sat? (helper circt-comb-shru 2 #:primitive 'ripple-pfu #:bitwidth 8)))
  (check-true (sat? (helper circt-comb-sub 2 #:primitive 'ripple-pfu #:bitwidth 8)))
  (check-true (sat? (helper circt-comb-sub 2 #:primitive 'ripple-pfu #:bitwidth 8)))
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
