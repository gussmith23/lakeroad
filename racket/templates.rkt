#lang errortrace racket/base

(provide lut)

(require rosette
         rosette/lib/synthax
         rosette/lib/angelic
         "utils.rkt"
         "interpreter.rkt"
         (prefix-in lr: "language.rkt"))

(define-grammar
 (lut-grammar nbits lut-fn logical-inputs lutmems outwidth)
 [out (lr:extract (lr:integer (sub1 outwidth)) (lr:integer 0) (logical-value))]
 [logical-value
  (lr:bv (choose (bv #xff nbits)
                 (bv #x00 nbits)
                 ;`(first ,logical-inputs)
                 ;;; these cause breakage
                 (lr:list-ref (lr:integer 0) (logical-list))
                 (lr:list-ref (lr:integer 1) (logical-list))
                 (lr:list-ref (lr:integer 2) (logical-list))))]
 [logical-list
  (lr:list (choose (map lr:bv logical-inputs)
                   (lr:legacy `(physical-to-logical-mapping
                                ,(choose '(bitwise) `(choose-one ,(bv 0 1)) '(bitwise-reverse))
                                ,(for/list ([i nbits])
                                   `(,lut-fn ,(lutmem)
                                             (list-ref (logical-to-physical-mapping
                                                        ,(choose '(bitwise) '(bitwise-reverse))
                                                        ,(logical-list))
                                                       ,i)))))))]
 [lutmem
  (lr:bv (match lutmems
           [(list i0) (choose i0)]
           [(list i0 i1) (choose i0 i1)]
           [(list i0 i1 i2) (choose i0 i1 i2)]))]
 [physical-list
  (let* ([logical-to-physical
          `(logical-to-physical-mapping ,(choose '(bitwise) '(bitwise-reverse)) ,(logical-list))]
         [lut-output (for/list ([i nbits])
                       `(,lut-fn ,(lutmem) (list-ref ,(physical-list) ,i)))])
    ; (choose logical-to-physical lut-output)
    lut-output)])

(define (lut nbits lut-fn logical-inputs lutmems outwidth #:depth depth)
  ;;; First, extend the inputs up to the same size.
  (let* ([logical-inputs (map (λ (i) (zero-extend i (bitvector nbits))) logical-inputs)])
    (lut-grammar nbits lut-fn logical-inputs lutmems outwidth #:depth depth)))

(module+ test
  (require rackunit
           "interpreter.rkt"
           rosette/solver/smt/boolector)
  (current-solver (boolector))

  (define (test-lut-template bvexpr lut-fn lutmem-width #:depth depth #:num-lutmems [num-lutmems 1])

    ;;; Maximum number of input and output bitwidths = the number of bits we need to support.
    (define nbits (apply max (bvlen bvexpr) (map bvlen (symbolics bvexpr))))
    (define lutmems
      (for/list ([i num-lutmems])
        (constant `(lutmem ,i) (bitvector lutmem-width))))

    (define lakeroad-expr (lut nbits lut-fn (symbolics bvexpr) lutmems (bvlen bvexpr) #:depth depth))

    (define soln
      (synthesize #:forall (symbolics bvexpr)
                  #:guarantee (assert (bveq (interpret-new lakeroad-expr) bvexpr))))
    (when (sat? soln)
      (pretty-display (evaluate lakeroad-expr soln)))

    (sat? soln))

  (define-symbolic a b (bitvector 8))

  (test-true "8-bit UltraScale+ identity" (test-lut-template a 'ultrascale-plus-lut2 4 #:depth 2))

  (test-true "8-bit UltraScale+ and"
             (test-lut-template (bvand a b) 'ultrascale-plus-lut2 4 #:depth 3))
  (test-true "8-bit Lattice and" (test-lut-template (bvand a b) 'sofa-lut2 4 #:depth 3)))
