#lang racket

(require rosette)

(provide ultrascale-clb
         ultrascale-logical-to-physical-inputs)

; The output of a LUT is simply the `output-width`-length bitvector at the entry pointed to by
; `inputs-a`, when interpreted as an integer.
; It's probably worth putting this somewhere more generally usable.
(define (lut output-width memory inputs)
  (let* ([i (bitvector->natural inputs)] [low (* output-width i)] [high (+ (- output-width 1) low)])
    (extract high low memory)))

(module+ test
  (require rackunit)
  (check-equal? (lut 2 (bv #b0110 4) (bv 0 1)) (bv #b10 2))
  (check-equal? (lut 2 (bv #b0110 4) (bv 1 1)) (bv #b01 2)))

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
  (let* ([lut5-0 (lut 1 (extract 63 32 memory) (extract 4 0 inputs))]
         [lut5-1 (lut 1 (extract 31 0 memory) (extract 4 0 inputs))]
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
    [a-mux-out
     (list-ref (list (first a-out) (second a-out) carry-o0) (bitvector->natural mux-selector-a))]
    [b-mux-out
     (list-ref (list (first b-out) (second b-out) carry-o1) (bitvector->natural mux-selector-b))]
    [c-mux-out
     (list-ref (list (first c-out) (second c-out) carry-o2) (bitvector->natural mux-selector-c))]
    [d-mux-out
     (list-ref (list (first d-out) (second d-out) carry-o3) (bitvector->natural mux-selector-d))]
    [e-mux-out
     (list-ref (list (first e-out) (second e-out) carry-o4) (bitvector->natural mux-selector-e))]
    [f-mux-out
     (list-ref (list (first f-out) (second f-out) carry-o5) (bitvector->natural mux-selector-f))]
    [g-mux-out
     (list-ref (list (first g-out) (second g-out) carry-o6) (bitvector->natural mux-selector-g))]
    [h-mux-out
     (list-ref (list (first h-out) (second h-out) carry-o7) (bitvector->natural mux-selector-h))])
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
