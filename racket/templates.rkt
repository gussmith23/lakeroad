#lang errortrace racket/base

(provide lut)

(require rosette
         rosette/lib/angelic
         "utils.rkt"
         "interpreter.rkt")

;;; Simple LUT template which supports
;;; - Arbitrary number of inputs.
;;; - Inputs of arbitrary bitwidths.
;;; - A single output of arbitrary bitwidth.
;;; - Inputs being fed into a single column of LUTs
;;; - Inputs being mapped into luts (and outputs mapped out of luts) via bitwise or bitwise-reverse
;;;   patterns.
;;; - Inputs being zero-extended or duplicate-extended (in which the LSB is replicated to all bits).
(define (lut nbits lut-fn logical-inputs lutmems outwidth)
  (let* (;;; Max bitwidth, between all inputs and the output.
         [max-bw (apply max outwidth (map bvlen logical-inputs))]
         ;;; Form the list of logical inputs.
         ;;; Zero-extend them so they're all the same size.
         [logical-inputs
          (map (lambda (v)
                 (choose* `(zero-extend ,v ,(bitvector max-bw))
                          `(dup-extend this-is-a-hack-for-dup-extend ,v ,(bitvector max-bw))))
               logical-inputs)]
         [lutmem (match lutmems
                   [(list lm0) (choose* lm0)])]
         [lakeroad-expr
          (let* ([physical-inputs `(logical-to-physical-mapping
                                    ,(choose* '(bitwise) '(bitwise-reverse))
                                    ,logical-inputs)]
                 [physical-outputs (for/list ([i max-bw])
                                     `(,lut-fn ,lutmem (list-ref ,physical-inputs ,i)))])
            `(extract ,(sub1 outwidth)
                      0
                      (first (physical-to-logical-mapping ,(choose* '(bitwise) '(bitwise-reverse))
                                                          ,physical-outputs))))])

    (when (not (concrete? max-bw))
      (error "Input bitwidths must be statically known."))

    lakeroad-expr))

(module+ test
  (require rackunit
           "interpreter.rkt"
           rosette/solver/smt/boolector)
  (current-solver (boolector))

  (define (test-lut-template bvexpr lut-fn lutmem-width #:num-lutmems [num-lutmems 1])

    ;;; Maximum number of input and output bitwidths = the number of bits we need to support.
    (define nbits (apply max (bvlen bvexpr) (map bvlen (symbolics bvexpr))))
    (define lutmems
      (for/list ([i num-lutmems])
        (define-symbolic* lutmem (bitvector lutmem-width))
        lutmem))

    (define lakeroad-expr (lut nbits lut-fn (symbolics bvexpr) lutmems (bvlen bvexpr)))

    (define soln
      (synthesize #:forall (symbolics bvexpr)
                  #:guarantee (assert (bveq (interpret lakeroad-expr) bvexpr))))
    (when (sat? soln)
      (pretty-display (evaluate lakeroad-expr soln)))

    (sat? soln))

  (define-symbolic a b (bitvector 8))

  (test-true "8-bit UltraScale+ identity" (test-lut-template a 'ultrascale-plus-lut2 4))
  (test-true "8-bit UltraScale+ and" (test-lut-template (bvand a b) 'ultrascale-plus-lut2 4))
  (test-true "8-bit Lattice and" (test-lut-template (bvand a b) 'sofa-lut2 4)))
