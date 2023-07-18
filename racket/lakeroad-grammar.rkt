#lang racket

(provide apply-lakeroad-grammar)

(require rosette
         rosette/lib/synthax
         "sketches.rkt"
         (prefix-in lr: "language.rkt")
         "utils.rkt"
         "architecture-description.rkt"
         "signal.rkt")

;;; Grammar that mixes multiple sketches.
(define-grammar
 (lakeroad-grammar architecture-description logical-inputs num-logical-inputs bitwidth)
 [expr (choose (input) (bitwise) (bitwise-with-carry))]
 [input
  (match num-logical-inputs
    [1 (choose (lr:list-ref logical-inputs (lr:integer 0)))]
    [2
     (choose (lr:list-ref logical-inputs (lr:integer 0)) (lr:list-ref logical-inputs (lr:integer 1)))]
    [3
     (choose (lr:list-ref logical-inputs (lr:integer 0))
             (lr:list-ref logical-inputs (lr:integer 1))
             (lr:list-ref logical-inputs (lr:integer 2)))]
    [4
     (choose (lr:list-ref logical-inputs (lr:integer 0))
             (lr:list-ref logical-inputs (lr:integer 1))
             (lr:list-ref logical-inputs (lr:integer 2))
             (lr:list-ref logical-inputs (lr:integer 3)))]
    [5
     (choose (lr:list-ref logical-inputs (lr:integer 0))
             (lr:list-ref logical-inputs (lr:integer 1))
             (lr:list-ref logical-inputs (lr:integer 2))
             (lr:list-ref logical-inputs (lr:integer 3))
             (lr:list-ref logical-inputs (lr:integer 4)))]
    [_ (error "Not implemented")])]
 [bitwise
  (first (bitwise-sketch-generator architecture-description
                                   (make-sketch-inputs #:data (list (cons (input) bitwidth)
                                                                    (cons (expr) bitwidth))
                                                       #:output-width bitwidth)))]
 [bitwise-with-carry
  (first (bitwise-with-carry-sketch-generator architecture-description
                                              (make-sketch-inputs #:data (list (cons (input) bitwidth)
                                                                               (cons (expr) bitwidth))
                                                                  #:output-width bitwidth)))]
 [comparison
  (first (comparison-sketch-generator architecture-description
                                      (make-sketch-inputs #:data (list (cons (input) bitwidth)
                                                                       (cons (expr) bitwidth))
                                                          #:output-width bitwidth)))])

(define (apply-lakeroad-grammar architecture-description bv-expr #:depth [depth 0])
  (lakeroad-grammar architecture-description
                    (lr:list (map lr:bv (map bv->signal (symbolics bv-expr))))
                    (length (symbolics bv-expr))
                    (apply max (bvlen bv-expr) (map bvlen (symbolics bv-expr)))
                    #:depth depth))

(module+ test
  (require rackunit
           "verilator.rkt"
           "synthesize.rkt"
           "interpreter.rkt"
           "generated/lattice-ecp5-lut4.rkt"
           "generated/lattice-ecp5-ccu2c.rkt")

  (define-syntax-rule (grammar-test #:name name
                                    #:defines defines
                                    ...
                                    #:bv-expr bv-expr
                                    #:depth depth
                                    #:architecture-description architecture-description
                                    #:module-semantics module-semantics
                                    #:include-dirs include-dirs
                                    #:extra-verilator-args extra-verilator-args)
    (test-case name
      (with-terms
       (begin
         defines ...

         (define sketch (apply-lakeroad-grammar architecture-description bv-expr #:depth 3))

         (define result
           (with-vc (with-terms (synthesize #:forall (symbolics bv-expr)
                                            #:guarantee
                                            (assert (bveq bv-expr
                                                          (signal-value
                                                           (interpret sketch
                                                                      #:module-semantics
                                                                      module-semantics))))))))

         (check-true (normal? result))
         (define soln (result-value result))
         (check-true (sat? soln))

         (define lr-expr
           (evaluate
            sketch
            ;;; Complete the solution: fill in any symbolic values that *aren't* the logical inputs.
            (complete-solution soln
                               (set->list (set-subtract (list->set (symbolics sketch))
                                                        (list->set (symbolics bv-expr)))))))

         (when (not (getenv "VERILATOR_INCLUDE_DIR"))
           (raise "VERILATOR_INCLUDE_DIR not set"))
         (check-true (simulate-with-verilator #:include-dirs include-dirs
                                              #:extra-verilator-args extra-verilator-args
                                              (list (to-simulate lr-expr bv-expr))
                                              (getenv "VERILATOR_INCLUDE_DIR")))))))

  (grammar-test
   #:name "add"
   #:defines (define-symbolic a b (bitvector 8))
   #:bv-expr (bvadd a b)
   #:depth 2
   #:architecture-description (lattice-ecp5-architecture-description)
   #:module-semantics
   (list (cons (cons "LUT4" "../f4pga-arch-defs/ecp5/primitives/slice/LUT4.v") lattice-ecp5-lut4)
         (cons (cons "CCU2C" "../f4pga-arch-defs/ecp5/primitives/slice/CCU2C.v") lattice-ecp5-ccu2c))
   #:include-dirs (list (build-path (get-lakeroad-directory) "f4pga-arch-defs/ecp5/primitives/slice"))
   #:extra-verilator-args "-Wno-UNUSED"))
