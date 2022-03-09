#lang racket

(require rosette)

(provide lattice-slice)

; lut operator
(define (lut output-width memory inputs)
  (let* ([i (bitvector->natural inputs)] [low (* output-width i)] [high (+ (- output-width 1) low)])
    (extract high low memory)))
; mux operator
(define (mux cond op_a op_b)
  (if (cond) op_a op_b))
; Returns the physical outputs of the lattice slice

;; output order: F0, F1, OFX0, OFX1
(define (lattice-slice lut-mem-0
                       lut-mem-1
                       lut-input-0
                       lut-input-1
                       M0
                       M1
                       FXA
                       FXB
                       )
  (match-let* ([F0 (lut 1 lut-mem-0 lut-input-0)]
               [F1 (lut 1 lut-mem-1 lut-input-1)]
               [OFX0 (mux M0 F1 F0)]
               [OFX1 (mux M1 FXA FXB)])
    (concat F0 F1 OFX0 OFX1))
  )