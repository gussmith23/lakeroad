#lang racket

(require rosette)

(provide ultrascale-clb)

; The output of a LUT is simply the `output-width`-length bitvector at the entry pointed to by
; `inputs-a`, when interpreted as an integer.
(define
  (lut output-width memory inputs)
  (let* ((i (bitvector->natural inputs))
         (low (* output-width i))
         (high (+ (- output-width 1) low)))
    (extract high low memory)))

(module+ test
  (require rackunit)
  (check-equal? (lut 2 (bv #b0110 4) (bv 0 1)) (bv #b10 2))
  (check-equal? (lut 2 (bv #b0110 4) (bv 1 1)) (bv #b01 2)))

; We define O5 as the 1th output and O6 as the 0th.
(define (O5 outputs) (extract 1 1 outputs))
(define (O6 outputs) (extract 0 0 outputs))

; Carry signals CO0..CO7 (aka MUXCY; carry output) in fig 2-4. Note that, to implement a mux with
; "if", the "then" and "else" clauses are in reverse order from the usual mux input order!
(define (carry-co s di prev-muxcy) (if (bitvector->bool s) prev-muxcy di))
; Carry signals O0..O7 (aka sum value) in Fig 2-4.
(define (carry-o s prev-muxcy) (bvxor s prev-muxcy))
; Wrapper to make things easier.
; Returns (carry0, muxcy)
(define (carry-layer outputs prev-muxcy)
  (list (carry-o (O6 outputs) prev-muxcy)
        (carry-co (O6 outputs) (O5 outputs) prev-muxcy)))

(define ultrascale-input-width 6)
(define ultrascale-output-width 2)

; Returns the physical outputs of the CLB.
(define
  (ultrascale-clb
   cin
   lut-memory-a
   lut-memory-b
   lut-memory-c
   lut-memory-d
   lut-memory-e
   lut-memory-f
   lut-memory-g
   lut-memory-h
   lut-input-a
   lut-input-b
   lut-input-c
   lut-input-d
   lut-input-e
   lut-input-f
   lut-input-g
   lut-input-h)
  (match-let*
      ([a-out (lut ultrascale-output-width lut-memory-a lut-input-a)]
       [b-out (lut ultrascale-output-width lut-memory-b lut-input-b)]
       [c-out (lut ultrascale-output-width lut-memory-c lut-input-c)]
       [d-out (lut ultrascale-output-width lut-memory-d lut-input-d)]
       [e-out (lut ultrascale-output-width lut-memory-e lut-input-e)]
       [f-out (lut ultrascale-output-width lut-memory-f lut-input-f)]
       [g-out (lut ultrascale-output-width lut-memory-g lut-input-g)]
       [h-out (lut ultrascale-output-width lut-memory-h lut-input-h)]
       [(list carry-o0 carry-co0) (carry-layer a-out cin)]
       [(list carry-o1 carry-co1) (carry-layer b-out carry-co0)]
       [(list carry-o2 carry-co2) (carry-layer c-out carry-co1)]
       [(list carry-o3 carry-co3) (carry-layer d-out carry-co2)]
       [(list carry-o4 carry-co4) (carry-layer e-out carry-co3)]
       [(list carry-o5 carry-co5) (carry-layer f-out carry-co4)]
       [(list carry-o6 carry-co6) (carry-layer g-out carry-co5)]
       [(list carry-o7 carry-co7) (carry-layer h-out carry-co6)])
    (concat
     carry-o7
     carry-o6
     carry-o5
     carry-o4
     carry-o3
     carry-o2
     carry-o1
     carry-o0)))
