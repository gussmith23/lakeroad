#lang errortrace racket

;;; "Wide" tests for Xilinx UltraScale+, i.e. synthesizing instructions wider than 8 bits (and thus
;;; needing to go on multiple CLBs.)

(module+ test

  (require "compile-to-json.rkt"
           "interpreter.rkt"
           rackunit
           rosette
           rosette/lib/synthax
           rosette/solver/smt/boolector)

  (current-solver (boolector))

  (define-symbolic a b (bitvector 16))

  ;;; Form the list of logical inputs, and pad up to make sure there are 6.
  (define logical-inputs (list a b (bv #xffff 16) (bv #xffff 16) (bv #xffff 16) (bv #xffff 16)))

  (define lakeroad-expr
    (let* ([logical-inputs-clb-0 (map (lambda (v) (extract 7 0 v)) logical-inputs)]
           [logical-inputs-clb-1 (map (lambda (v) (extract 15 8 v)) logical-inputs)]
           [make-clb (lambda (logical-inputs)
                       `(first (physical-to-logical-mapping
                                (bitwise)
                                (take (ultrascale-plus-clb
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
                                       (logical-to-physical-mapping (bitwise) ,logical-inputs))
                                      8))))]
           [clb0 (make-clb logical-inputs-clb-0)]
           [clb1 (make-clb logical-inputs-clb-1)])
      `(concat ,clb1 ,clb0)))

  ;;; We can do a bitwise function like and, at the moment...
  (check-true (sat? (synthesize #:forall (list a b)
                                #:guarantee (assert (bveq (bvand a b) (interpret lakeroad-expr))))))
  ;;; But we can't do add, which requires the carry chain.
  (check-false (sat? (synthesize #:forall (list a b)
                                 #:guarantee (assert (bveq (bvadd a b) (interpret lakeroad-expr)))))))
