#lang errortrace racket
(require rosette
         rosette/lib/angelic
         racket/pretty
         (prefix-in lr: "../language.rkt")
         "../logical-to-physical.rkt"
         "../utils.rkt"
         "arch-config.rkt"
         "primitive-interface.rkt"
         (submod "primitive-interface.rkt" helpers))

(define (bitwise-sketch-generator arch-config logical-inputs)
  (let* ([bitwidth (apply max (map bvlen logical-inputs))]
         [lut-width (length logical-inputs)]
         [logical-inputs (map (lambda (v)
                                (choose* (lr:zero-extend v (bitvector bitwidth))
                                         (lr:dup-extend v (bitvector bitwidth))))
                              logical-inputs)]
         [physical-inputs (logical-to-physical-mapping (choose* '(bitwise) '(bitwise-reverse)) logical-inputs)]
         [physical-inputs (for/list ([i bitwidth]) (lr:list-ref physical-inputs i))]

         ; This proc is fed to foldr. It produces a list of (cons lr:primitive
         ; symbolic-state) pairs, allowing symbolic state to be reused between
         ; lr:primitives. The result of this should have `(map car ...)` applied
         ; to it to discard symbolic states
         [proc (lambda (phys-input xs)
                 ; First, make the primitive-interface we want to implement
                 (let* ([prim-interface (make-primitive-interface
                                         'LUT
                                         (make-interface-signature-of-shape lut-width 1)
                                         phys-input)]
                        ; Next, grab previous symbolic state if it exists
                        [symbolic-state (match xs
                                          [(list (cons _ sym-state) _ ...) sym-state]
                                          ['() #f])]
                        ; Implement the primitive interface
                        [impl (implement-primitive-interface arch-config
                                                             prim-interface
                                                             #:symbolic-state symbolic-state)])
                   (cons impl xs)))]

         [impl-output-pairs (foldr proc '() physical-inputs)])
    (map car impl-output-pairs)))

;;;;;;;;; TESTS ;;;;;;;;
(module+ test
  (require rackunit
           (submod "arch-config.rkt" test-values))
  (with-terms (with-vc (begin
                         (define-symbolic a b c d (bitvector 1))
                         (let* ([sketch (bitwise-sketch-generator ecp5:config (list a))])
                           (pretty-print sketch))))))
