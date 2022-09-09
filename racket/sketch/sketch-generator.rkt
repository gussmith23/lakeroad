#lang errortrace racket
(require rosette
         rosette/lib/angelic
         (prefix-in lr: "../language.rkt")
         "../logical-to-physical.rkt"
         "../utils.rkt"
         "arch-config.rkt")

(struct generic-primitive (type sig) #:transparent)
(struct generic-signature (inputs outputs) #:transparent)

(define (generic-primitive-num-inputs prim)
  (length (generic-signature-inputs (generic-primitive-sig prim))))
(define (generic-primitive-num-outputs prim)
  (length (generic-signature-outputs (generic-primitive-sig prim))))
(define (generic-primitive-type? prim type)
  (equal? (generic-primitive-type prim) type))

(define generic-lut4 (generic-primitive 'LUT (generic-signature '(I0 I1 I2 I3) '(O))))
(define generic-mux21 (generic-primitive 'MUX (generic-signature '(D0 D1 S) '(O))))

; Test if a value is a lakeroad lut primitive, and optionally test input and
; output arity
(define (generic-lut? val #:input-arity [input-arity #f] #:output-arity [output-arity #f])
  (and (generic-primitive? val)
       (eq? (generic-primitive-type val) 'LUT)
       (if input-arity (= (generic-primitive-num-inputs val) input-arity) #t)
       (if output-arity (= (generic-primitive-num-outputs val) output-arity) #t)))

(define (generic-mux? val)
  (and (generic-primitive? val) (generic-primitive-type? val 'LUT)))

; Recursively visit a sketch template and replace all generic-primitives with values
; provided by the arch-config
(define (generate-sketch sketch-template arch-config)
  (define (replacer expr)
    (match expr
      [(? generic-lut? template) (arch-config-get-lut arch-config (generic-primitive-num-inputs template))]
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
; In this particular instance, the only generic primitives are generic-lut4s (one for
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
                             generic-lut4)]
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
  (check-equal? (generate-sketch generic-lut4 ecp5:config) ecp5:lut4)

  (check-match
   (generate-sketch (bitwise-example-sketch-template (list (bv 0 2))) ecp5:config)
   (lr:extract 1 0 (lr:first (physical-to-logical-mapping _ (list ecp5:lut4 ecp5:lut4)))))

  (check-match
   (generate-sketch (bitwise-example-sketch-template (list (bv 0 2) (bv 0 2) (bv 0 2) (bv 0 2) (bv 0 2))) ecp5:config)
   (lr:extract 1 0 (lr:first (physical-to-logical-mapping _ (list ecp5:lut4 ecp5:lut4)))))
  )
