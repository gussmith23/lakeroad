#lang errortrace racket
(require rosette
         rosette/lib/angelic
         (prefix-in lr: "../language.rkt")
         "../logical-to-physical.rkt"
         "../utils.rkt"
         "arch-config.rkt"
         "symbolic-allocator.rkt"
         "primitive-interface.rkt"
         (submod "primitive-interface.rkt" helpers))

; Recursively visit a sketch template and replace all primitive-interfaces with values
; provided by the arch-config
(define (generate-sketch sketch-template arch-config #:symbolic-allocator [symb-alloc #f])

  ; Make a default symbolic allocator if we need to
  (define sra (if symb-alloc symballoc (symbolic-allocator)))
  
  (define (replacer expr)
    (match expr
      [(? lut? template) (arch-config-get-lut arch-config (primitive-interface-num-inputs template))]
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

; This is a _sketch template_: this has generic primitives that will be replaced
; during sketch generation.
;
; In this particular instance, the only generic primitives are lut4s (one for
; each output bit)
(define (bitwise-example-sketch-template logical-inputs)
  (let* ([bitwidth (apply max (map bvlen logical-inputs))]
         [lut-width (length logical-inputs)]
         [logical-inputs (map (lambda (v)
                                (choose* (lr:zero-extend v (bitvector bitwidth))
                                         (lr:dup-extend v (bitvector bitwidth))))
                              logical-inputs)]
         [physical-inputs (logical-to-physical-mapping (choose* '(bitwise) '(bitwise-reverse))
                                                       logical-inputs)]
         [physical-outputs (for/list ([i bitwidth])
                             (lut4-interface (lr:list-ref physical-inputs i)))]
         [lr-expr (lr:extract (sub1 bitwidth)
                              0
                              (lr:first (physical-to-logical-mapping
                                         (choose* '(bitwise) '(bitwise-reverse))
                                         physical-outputs)))])

    (when (not (concrete? bitwidth))
      (error "Input bitwidths must be statically known."))
    lr-expr))

;;;;;;;;; TESTS ;;;;;;;;
(module+ test
  (require rackunit
           (submod "arch-config.rkt" test-values))
  (check-equal? (generate-sketch (lut4-interface (list (bv 0 4))) ecp5:config) ecp5:lut4)

  (check-match (generate-sketch (bitwise-example-sketch-template (list (bv 0 2))) ecp5:config)
               (lr:extract 1 0 (lr:first (physical-to-logical-mapping _ (list ecp5:lut4 ecp5:lut4)))))

  (check-match
   (generate-sketch (bitwise-example-sketch-template
                     (list (bv 0 2) (bv 0 2) (bv 0 2) (bv 0 2) (bv 0 2)))
                    ecp5:config)
   (lr:extract 1 0 (lr:first (physical-to-logical-mapping _ (list ecp5:lut4 ecp5:lut4))))))
