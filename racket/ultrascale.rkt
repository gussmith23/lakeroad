#lang racket

(require rosette)

(provide ultrascale-clb
         ultrascale-logical-to-physical-inputs)

; The output of a LUT is simply the bit at the entry pointed to by
; `inputs-a`, when interpreted as an integer.
; It's probably worth putting this somewhere more generally usable.
; LUTs must return only one bit. TODO: figure out how to return multiple bits while still using
; theory of bitvectors only. The old solution used theory of integers to index into the bitvector.
(define (lut memory inputs)
  (let* ([inputs (zero-extend inputs (bitvector (length (bitvector->bits memory))))])
    (bit 0 (bvlshr memory inputs))))

(module+ test
  (require rackunit)
  (check-equal? (lut (bv #b0110 4) (bv 0 1)) (bv #b0 1))
  (check-equal? (lut (bv #b0110 4) (bv 1 1)) (bv #b1 1))
  (check-equal? (lut (bv #b0110 4) (bv 2 2)) (bv #b1 1))
  (check-equal? (lut (bv #b0110 4) (bv 3 2)) (bv #b0 1)))

; LUT6_2 primitive described on page 37 of
; https://www.xilinx.com/support/documentation/user_guides/ug574-ultrascale-clb.pdf
;
; memory is expected to be in the format specified in the guide: a 64-bit bitvector. The bit ordering
; is the same; the most significant 32 bits controlk the O6 LUT5, while the lower 32 bits control the
; O5 LUT5.
;
; inputs is a 6-bit bitvector, corresponding to I0 (LSB) through I5 (MSB) in figure 3-1.
;
; Returns the O5 and O6 signals.
(define (ultrascale-lut6-2 memory inputs)
  (let* ([lut5-0 (lut (extract 63 32 memory) (extract 4 0 inputs))]
         [lut5-1 (lut (extract 31 0 memory) (extract 4 0 inputs))]
         [O6 (if (bitvector->bool (bit 5 inputs)) lut5-0 lut5-1)]
         [O5 lut5-1])
    (list O5 O6)))

; Carry signals CO0..CO7 (aka MUXCY; carry output) in fig 2-4. Note that, to implement a mux with
; "if", the "then" and "else" clauses are in reverse order from the usual mux input order!
(define (carry-co s di prev-muxcy)
  (if (bitvector->bool s) prev-muxcy di))
; Carry signals O0..O7 (aka sum value) in Fig 2-4.
(define (carry-o s prev-muxcy)
  (bvxor s prev-muxcy))
; Wrapper to make things easier.
; Returns (carry0, muxcy)
(define (carry-layer outputs prev-muxcy)
  (match-let ([(list O5 O6) outputs]) (list (carry-o O6 prev-muxcy) (carry-co O6 O5 prev-muxcy))))

(define ultrascale-input-width 6)
(define ultrascale-output-width 2)

; Returns the physical outputs of the CLB.
; TODO(@gussmith23) Rename to ultrascale-plus-clb.
(define (ultrascale-clb cin
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
                        lut-input-a
                        lut-input-b
                        lut-input-c
                        lut-input-d
                        lut-input-e
                        lut-input-f
                        lut-input-g
                        lut-input-h)

  (match-let*
   ([a-out (ultrascale-lut6-2 lut-memory-a lut-input-a)]
    [b-out (ultrascale-lut6-2 lut-memory-b lut-input-b)]
    [c-out (ultrascale-lut6-2 lut-memory-c lut-input-c)]
    [d-out (ultrascale-lut6-2 lut-memory-d lut-input-d)]
    [e-out (ultrascale-lut6-2 lut-memory-e lut-input-e)]
    [f-out (ultrascale-lut6-2 lut-memory-f lut-input-f)]
    [g-out (ultrascale-lut6-2 lut-memory-g lut-input-g)]
    [h-out (ultrascale-lut6-2 lut-memory-h lut-input-h)]
    [(list carry-o0 carry-co0) (carry-layer a-out cin)]
    [(list carry-o1 carry-co1) (carry-layer b-out carry-co0)]
    [(list carry-o2 carry-co2) (carry-layer c-out carry-co1)]
    [(list carry-o3 carry-co3) (carry-layer d-out carry-co2)]
    [(list carry-o4 carry-co4) (carry-layer e-out carry-co3)]
    [(list carry-o5 carry-co5) (carry-layer f-out carry-co4)]
    [(list carry-o6 carry-co6) (carry-layer g-out carry-co5)]
    [(list carry-o7 carry-co7) (carry-layer h-out carry-co6)]
    [mux-helper
     (lambda (out carry selector)
       (assert (not (bveq selector (bv 3 2))))
       (if (bveq selector (bv 0 2))
           (first out)
           (if (bveq selector (bv 1 2))
               (second out)
               (if (bveq selector (bv 2 2)) carry (error "shouldn't hit this")))))]
    [a-mux-out (mux-helper a-out carry-o0 mux-selector-a)]
    [b-mux-out (mux-helper b-out carry-o1 mux-selector-b)]
    [c-mux-out (mux-helper c-out carry-o2 mux-selector-c)]
    [d-mux-out (mux-helper d-out carry-o3 mux-selector-d)]
    [e-mux-out (mux-helper e-out carry-o4 mux-selector-e)]
    [f-mux-out (mux-helper f-out carry-o5 mux-selector-f)]
    [g-mux-out (mux-helper g-out carry-o6 mux-selector-g)]
    [h-mux-out (mux-helper h-out carry-o7 mux-selector-h)])
   (concat h-mux-out g-mux-out f-mux-out e-mux-out d-mux-out c-mux-out b-mux-out a-mux-out)))

; A simple logical-to-physical inputs function, in which the first (least significant) bit of each
; logical input is mapped to LUT A (logical input 0 in the least significant place), the second bit is
; mapped to LUT B, etc.
(define (ultrascale-logical-to-physical-inputs logical-input-0
                                               logical-input-1
                                               logical-input-2
                                               logical-input-3
                                               logical-input-4
                                               logical-input-5)
  (let ([helper (lambda (idx)
                  (concat (extract idx idx logical-input-0)
                          (extract idx idx logical-input-1)
                          (extract idx idx logical-input-2)
                          (extract idx idx logical-input-3)
                          (extract idx idx logical-input-4)
                          (extract idx idx logical-input-5)))])
    (list (helper 0) (helper 1) (helper 2) (helper 3) (helper 4) (helper 5) (helper 6) (helper 7))))

; A helper function which first creates symbolic variables for all of the programmable state of the
; LUT, and then calls the CLB function with the provided inputs.
(define (ultrascale-plus-clb-helper physical-inputs)

  ; The programmable state of the CLB.
  (define-symbolic* cin (bitvector 1))
  (define-symbolic* lut-memory-a (bitvector 64))
  (define-symbolic* lut-memory-b (bitvector 64))
  (define-symbolic* lut-memory-c (bitvector 64))
  (define-symbolic* lut-memory-d (bitvector 64))
  (define-symbolic* lut-memory-e (bitvector 64))
  (define-symbolic* lut-memory-f (bitvector 64))
  (define-symbolic* lut-memory-g (bitvector 64))
  (define-symbolic* lut-memory-h (bitvector 64))
  (define-symbolic* mux-selector-a (bitvector 2))
  (define-symbolic* mux-selector-b (bitvector 2))
  (define-symbolic* mux-selector-c (bitvector 2))
  (define-symbolic* mux-selector-d (bitvector 2))
  (define-symbolic* mux-selector-e (bitvector 2))
  (define-symbolic* mux-selector-f (bitvector 2))
  (define-symbolic* mux-selector-g (bitvector 2))
  (define-symbolic* mux-selector-h (bitvector 2))
  (assert (not (bveq mux-selector-a (bv 3 2))))
  (assert (not (bveq mux-selector-b (bv 3 2))))
  (assert (not (bveq mux-selector-c (bv 3 2))))
  (assert (not (bveq mux-selector-d (bv 3 2))))
  (assert (not (bveq mux-selector-e (bv 3 2))))
  (assert (not (bveq mux-selector-f (bv 3 2))))
  (assert (not (bveq mux-selector-g (bv 3 2))))
  (assert (not (bveq mux-selector-h (bv 3 2))))

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
         physical-inputs))

; Compile a Rosette model to Verilog.
(define (compile-to-verilog model)
  "TODO")

(module+ test
  (require rackunit
           rosette/solver/smt/boolector)

  (current-solver (boolector))

  (define-symbolic logical-input-0 (bitvector 8))
  (define-symbolic logical-input-1 (bitvector 8))
  (define-symbolic logical-input-2 (bitvector 8))
  (define-symbolic logical-input-3 (bitvector 8))
  (define-symbolic logical-input-4 (bitvector 8))
  (define-symbolic logical-input-5 (bitvector 8))
  (define logical-inputs
    (list logical-input-0
          logical-input-1
          logical-input-2
          logical-input-3
          logical-input-4
          logical-input-5))

  (define out
    (ultrascale-plus-clb-helper (apply ultrascale-logical-to-physical-inputs logical-inputs)))

  (define solution
    (synthesize #:forall logical-inputs
                #:guarantee (begin
                              (for ([v (list-tail logical-inputs 2)])
                                (assume (bvzero? v)))
                              (assert (bveq out (bvadd logical-input-0 logical-input-1))))))
  (check-true (sat? solution))

  (define (run-add a b)
    (let ([expr (evaluate out
                          (sat (hash logical-input-0
                                     a
                                     logical-input-1
                                     b
                                     logical-input-2
                                     (bv 0 8)
                                     logical-input-3
                                     (bv 0 8)
                                     logical-input-4
                                     (bv 0 8)
                                     logical-input-5
                                     (bv 0 8))))])
      (evaluate expr (complete-solution solution (symbolics expr)))))
  (check-equal? (run-add (bv 0 8) (bv 0 8)) (bv 0 8))
  (check-equal? (run-add (bv 1 8) (bv 7 8)) (bv 8 8))
  (check-equal? (run-add (bv 10 8) (bv 230 8)) (bv 240 8))
  (check-equal? (run-add (bv 30 8) (bv 3 8)) (bv 33 8))

  (check-equal? "TODO(@gussmith23): insert correct verilog" (compile-to-verilog (model solution))))
