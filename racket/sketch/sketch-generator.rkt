#lang rosette/safe
(require "../language.rkt"
         "../logical-to-physical.rkt"
         "../utils.rkt")

(struct lr:primitive (name inputs outputs) #:transparent)

(define lr:lut4 (lr:primitive "LUT4" '(I0 I1 I2 I3) '(O)))
(define lr:mux21 (lr:primitive "MUX21" '(D0 D1 S) '(O)))

; This is a _sketch template_: this has generic primitives that will be replaced
; during sketch generation.
;
; In this particular instance, the only generic primitives are lr:lut4s (one for
; each output bit)
(define (bitwise-example-sketch-template logical-inputs)
  (let* ([bitwidth (apply max (map bvlen logical-inputs))]
         [lut-width (length logical-inputs)]
         [logical-inputs (map (lambda (v)
                                (choose* (lr:zero-extend v (bitvector bitwidth))
                                         (lr:dup-extend v (bitvector bitwidth)))))]
         [physical-inputs (logical-to-physical-mapping (choose* '(bitwise) '(bitwise-reverse))
                                                       logical-inputs)]
         [physical-outputs (for/list ([i bitwidth])
                             lr:lut4)]
         [lr-expr (lr:extract (sub1 bitwidth)
                              0
                              (lr:first (physical-to-logical-mapping
                                         (choose* '(bitwise) '(bitwise-reverse))
                                         physical-outputs)))])

    (when (not (concrete? bitwidth))
      (error "Input bitwidths must be statically known."))
    lr-expr))
