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
(define (lut nbits architecture logical-inputs lutmems outwidth)
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
                                     `(lut ,architecture ,lutmem (list-ref ,physical-inputs ,i)))])
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

  (define (test-lut-template bvexpr #:num-lutmems [num-lutmems 1])

    ;;; Maximum number of input and output bitwidths = the number of bits we need to support.
    (define nbits (apply max (bvlen bvexpr) (map bvlen (symbolics bvexpr))))
    (define lutmems
      (for/list ([i num-lutmems])
        (define-symbolic* lutmem (bitvector (expt 2 (length (symbolics bvexpr)))))
        lutmem))

    (define lakeroad-expr (lut nbits 'generic (symbolics bvexpr) lutmems (bvlen bvexpr)))

    (define soln
      (synthesize #:forall (symbolics bvexpr)
                  #:guarantee (assert (bveq (interpret lakeroad-expr) bvexpr))))

    (sat? soln))

  (define-symbolic a b (bitvector 8))

  (test-true "8-bit identity" (test-lut-template a))
  (test-true "8-bit and" (test-lut-template (bvand a b))))
