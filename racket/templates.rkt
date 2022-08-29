#lang errortrace racket/base

(provide lut
         lut-with-carry
         comparison)

(require rosette
         rosette/lib/angelic
         rosette/lib/synthax
         "utils.rkt"
         "interpreter.rkt"
         (prefix-in lr: "language.rkt"))

;;; TODO All of these templates could be merged into one, if we wanted!

;;; Simple LUT template which supports
;;; - Arbitrary number of inputs.
;;; - Inputs of arbitrary bitwidths.
;;; - A single output of arbitrary bitwidth.
;;; - Inputs being fed into a single column of LUTs
;;; - Inputs being mapped into luts (and outputs mapped out of luts) via bitwise or bitwise-reverse
;;;   patterns.
;;; - Inputs being zero-extended or duplicate-extended (in which the LSB is replicated to all bits).
;;;
;;; nbits is the bitwidth of the computation. Should likely be set to the max of the bitwidth of the
;;; output and all of the inputs. Most likely, the output and all inputs will have the same bitwidth.
(define (lut nbits architecture logical-inputs lutmems outwidth)
  (let* (;;; Max bitwidth, between all inputs and the output.
         [max-bw (apply max outwidth (map bvlen logical-inputs))]
         ;;; Form the list of logical inputs.
         ;;; Zero-extend them so they're all the same size.
         [logical-inputs (map (lambda (v)
                                (choose* (lr:zero-extend v (bitvector max-bw))
                                         (lr:dup-extend v (bitvector max-bw))))
                              logical-inputs)]
         [lutmem (match lutmems
                   [(list lm0) (choose* lm0)]
                   [(list lm0 lm1) (choose* lm0 lm1)])]
         [lakeroad-expr
          (let* ([physical-inputs (logical-to-physical-mapping (choose* '(bitwise) '(bitwise-reverse))
                                                               logical-inputs)]
                 [physical-outputs (for/list ([i max-bw])
                                     (lr:lut (length logical-inputs)
                                             1
                                             architecture
                                             lutmem
                                             (lr:list-ref physical-inputs i)))])
            (lr:extract (sub1 outwidth)
                        0
                        (lr:first (physical-to-logical-mapping (choose* '(bitwise) '(bitwise-reverse))
                                                               physical-outputs))))])
    (when (not (concrete? max-bw))
      (error "Input bitwidths must be statically known."))

    lakeroad-expr))

;;; The same LUT template above, but followed by a carry.
(define (lut-with-carry nbits architecture logical-inputs lutmems outwidth)
  (let* (;;; First: generate the simple LUT template.
         [lakeroad-expr-lut (lut nbits architecture logical-inputs lutmems outwidth)]

         ;;; Then, we add on top of it.
         [max-bw (apply max outwidth (map bvlen logical-inputs))]
         [logical-inputs (map (lambda (v)
                                (choose* (lr:zero-extend v (bitvector max-bw))
                                         (lr:dup-extend v (bitvector max-bw))))
                              logical-inputs)]
         [logical-input (match logical-inputs
                          [(list l0) (choose* l0)]
                          [(list l0 l1) (choose* l0 l1)])]

         [lakeroad-expr-carry
          (lr:carry nbits architecture (?? (bitvector 1)) logical-input lakeroad-expr-lut)]
         [output (choose* (lr:first lakeroad-expr-carry) (lr:list-ref lakeroad-expr-carry 1))])
    output))

;;; Comparison template: the general template is two columns of LUTs that feed into the DI and S
;;; inputs of a carry. The output is the carry out of the carry.
(define (comparison nbits architecture logical-inputs lutmems)
  (let* (;;; First: generate two of the simple LUT template.
         [lakeroad-expr-lut-0 (lut nbits architecture logical-inputs lutmems nbits)]
         [lakeroad-expr-lut-1 (lut nbits architecture logical-inputs lutmems nbits)]

         ;;; Then, we add on top of it.
         [lakeroad-expr-carry
          (lr:carry nbits architecture (?? (bitvector 1)) lakeroad-expr-lut-0 lakeroad-expr-lut-1)]
         [output (lr:list-ref lakeroad-expr-carry 1)])
    output))

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

    (interpret lakeroad-expr)
    (define soln
      (synthesize #:forall (symbolics bvexpr)
                  #:guarantee (assert (bveq (interpret lakeroad-expr) bvexpr))))

    (sat? soln))

  (define (test-lut-with-carry-template bvexpr #:num-lutmems [num-lutmems 1])

    ;;; Maximum number of input and output bitwidths = the number of bits we need to support.
    (define nbits (apply max (bvlen bvexpr) (map bvlen (symbolics bvexpr))))
    (define lutmems
      (for/list ([i num-lutmems])
        (define-symbolic* lutmem (bitvector (expt 2 (length (symbolics bvexpr)))))
        lutmem))

    (define lakeroad-expr (lut-with-carry nbits 'generic (symbolics bvexpr) lutmems (bvlen bvexpr)))

    (define soln
      (synthesize #:forall (symbolics bvexpr)
                  #:guarantee (assert (bveq (interpret lakeroad-expr) bvexpr))))

    (sat? soln))

  (define (test-comparison-template bvexpr #:num-lutmems [num-lutmems 1])

    ;;; Maximum number of input and output bitwidths = the number of bits we need to support.
    (define nbits (apply max (bvlen bvexpr) (map bvlen (symbolics bvexpr))))
    (define lutmems
      (for/list ([i num-lutmems])
        (define-symbolic* lutmem (bitvector (expt 2 (length (symbolics bvexpr)))))
        lutmem))

    (define lakeroad-expr (comparison nbits 'generic (symbolics bvexpr) lutmems))

    (define soln
      (synthesize #:forall (symbolics bvexpr)
                  #:guarantee (assert (bveq (interpret lakeroad-expr) bvexpr))))

    (sat? soln))

  (define-symbolic a b (bitvector 8))
  (define-symbolic s (bitvector 1))

  (test-true "8-bit identity" (test-lut-template a))
  (test-true "8-bit and" (test-lut-template (bvand a b)))
  (test-true "8-bit mux" (test-lut-template (if (bvzero? s) a b)))
  (test-true "8-bit add" (test-lut-with-carry-template (bvadd a b)))
  (test-true "8-bit sub" (test-lut-with-carry-template (bvsub a b)))
  (test-true "8-bit eq" (test-comparison-template (bool->bitvector (bveq a b))))
  (test-true "8-bit geq" (test-comparison-template (bool->bitvector (bvuge a b)) #:num-lutmems 2)))
