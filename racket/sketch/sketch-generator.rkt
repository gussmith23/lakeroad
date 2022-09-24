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

; Recursively visit a sketch template and replace all primitive-interfaces with values
; provided by the arch-config
(define (generate-sketch sketch-template arch-config)

  (define (replacer expr)
    (match expr
      [(? primitive-interface? template) (implement-primitive-interface arch-config template)]
      [(logical-to-physical-mapping f inputs) (logical-to-physical-mapping f (replacer inputs))]
      [(physical-to-logical-mapping f inputs) (physical-to-logical-mapping f (replacer inputs))]
      [(lr:first xs) (lr:first (replacer xs))]
      [(lr:append xs) (lr:append (replacer xs))]
      [(lr:take xs n) (lr:take (replacer xs) (replacer n))]
      [(lr:drop xs n) (lr:drop (replacer xs) (replacer n))]
      [(lr:list-ref xs n) (lr:list-ref (replacer xs) (replacer n))]
      [(lr:map f xs) (lr:map f (replacer xs))]
      [(lr:zero-extend v bv) (lr:zero-extend (replacer v) (replacer bv))]
      [(lr:dup-extend v bv) (lr:dup-extend (replacer v) (replacer bv))]
      [(lr:extract h l v) (lr:extract (replacer h) (replacer l) (replacer v))]
      [(lr:concat xs) (lr:concat (replacer xs))]

      [(? int?) expr]
      [(? bv?) expr]
      [(? list?) (map replacer expr)]))
  (replacer sketch-template))

(define (bitwise-sketch-generator arch-config logical-inputs)
  (let* ([bitwidth (apply max (map bvlen logical-inputs))]
         [lut-width (length logical-inputs)]
         [logical-inputs (map (lambda (v)
                                (choose* (lr:zero-extend v (bitvector bitwidth))
                                         (lr:dup-extend v (bitvector bitwidth))))
                              logical-inputs)]
         [physical-inputs (logical-to-physical-mapping (choose* '(bitwise) '(bitwise-reverse))
                                                       logical-inputs)]

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
