#lang racket
;;; Synthesis routines for the various architectures.
;;;
;;; TODO provide a top-level synthesis procedure?

(provide synthesize-xilinx-ultrascale-plus-impl)

(require "interpreter.rkt"
         "ultrascale.rkt"
         rosette
         rosette/lib/synthax
         "utils.rkt")

;;; Synthesize a Xilinx UltraScale+ Lakeroad expression for the given Rosette bitvector expression.
;;;
;;; TODO Support returning #f or something if we can't synthesize.
;;;
;;; TODO Use the grammar to generate *any* Lakeroad program. This will probably require that we also
;;; let the user specify the depth to search over and other parameters. At the very least, start by
;;; defining those as keyword args with default values.
(define (synthesize-xilinx-ultrascale-plus-impl bv-expr)
  (when (> (length (symbolics bv-expr)) 6)
    (error "Only 6 inputs supported"))

  ;;; Bitwidth of the output.
  (define out-bw (bvlen bv-expr))
  (when (not (concrete? out-bw))
    (error "Out bitwidth must be statically known."))

  ;;; Form the list of logical inputs, and pad up to make sure there are 6.
  ;;; We also zero-extend each input so that it is the correct size.
  (define logical-inputs
    (map (lambda (v) (zero-extend v (bitvector 8)))
         (append (symbolics bv-expr) (make-list (- 6 (length (symbolics bv-expr))) (bv #xff 8)))))

  (define lakeroad-expr
    `(extract ,(sub1 out-bw)
              0
              (first (physical-to-logical-mapping
                      (bitwise)
                      (ultrascale-plus-clb
                       ,(?? (bitvector 1))
                       ,(?? (bitvector 64))
                       ,(?? (bitvector 64))
                       ,(?? (bitvector 64))
                       ,(?? (bitvector 64))
                       ,(?? (bitvector 64))
                       ,(?? (bitvector 64))
                       ,(?? (bitvector 64))
                       ,(?? (bitvector 64))
                       ,(?? (bitvector 2))
                       ,(?? (bitvector 2))
                       ,(?? (bitvector 2))
                       ,(?? (bitvector 2))
                       ,(?? (bitvector 2))
                       ,(?? (bitvector 2))
                       ,(?? (bitvector 2))
                       ,(?? (bitvector 2))
                       (logical-to-physical-mapping (bitwise) ,logical-inputs))))))

  (define soln
    ; TODO(@gussmith23) Time synthesis. For some reason, time-apply doesn't mix well with synthesize.
    ; And time just prints to stdout, which is not ideal (but we could deal with it if necessary).
    (synthesize #:forall logical-inputs
                #:guarantee (begin
                              (assert (bveq bv-expr (interpret lakeroad-expr))))))

  (when (not (sat? soln))
    (error "expected sat soln"))

  (evaluate lakeroad-expr soln))
