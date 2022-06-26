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
    (match-let*
     ([logical-inputs-clb-0 (map (lambda (v) (extract 7 0 v)) logical-inputs)]
      [logical-inputs-clb-1 (map (lambda (v) (extract 15 8 v)) logical-inputs)]
      [make-clb
       (lambda (cin logical-inputs)
         (let* ([lutmem (?? (bitvector 64))]
                [mux (?? (bitvector 2))]
                [clb `(ultrascale-plus-clb ,cin
                                           ,lutmem
                                           ,lutmem
                                           ,lutmem
                                           ,lutmem
                                           ,lutmem
                                           ,lutmem
                                           ,lutmem
                                           ,lutmem
                                           ,mux
                                           ,mux
                                           ,mux
                                           ,mux
                                           ,mux
                                           ,mux
                                           ,mux
                                           ,mux
                                           (logical-to-physical-mapping (bitwise) ,logical-inputs))])
           (list `(first (physical-to-logical-mapping (bitwise) (take ,clb 8))) `(list-ref ,clb 8))))]
      [(list logical-outputs-clb-0 cout0) (make-clb (?? (bitvector 1)) logical-inputs-clb-0)]
      [(list logical-outputs-clb-1 cout1) (make-clb cout0 logical-inputs-clb-1)])
     `(concat ,logical-outputs-clb-1 ,logical-outputs-clb-0)))

  ;;; We can do a bitwise function like and.
  (check-true (sat? (synthesize #:forall (list a b)
                                #:guarantee (assert (bveq (bvand a b) (interpret lakeroad-expr))))))
  ;;; We can also now do something that requires the carry chain, like add.
  (check-true (sat? (synthesize #:forall (list a b)
                                #:guarantee (assert (bveq (bvadd a b) (interpret lakeroad-expr)))))))
