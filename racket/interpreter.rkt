;;; Interpreter for the Lakeroad FPGA modeling DSL.
#lang errortrace racket

(provide interpret)

(require "logical-to-physical.rkt"
         "ultrascale.rkt"
         "lattice-ecp5.rkt"
         "sofa.rkt"
         rosette)

(define (interpret expr)
  (for/all
   ([expr expr])
   (match expr
     ;;; Lakeroad language.
     [`(logical-to-physical-mapping ,_ ...) (interpret-logical-to-physical-mapping interpret expr)]
     [`(physical-to-logical-mapping ,_ ...) (interpret-physical-to-logical-mapping interpret expr)]
     [`(ultrascale-plus-clb ,_ ...) (interpret-ultrascale-plus interpret expr)]
     [`(ultrascale-plus-lut6-2 ,_ ...) (interpret-ultrascale-plus interpret expr)]
     [`(ultrascale-plus-lut2 ,_ ...) (interpret-ultrascale-plus interpret expr)]
     [`(ultrascale-plus-lut1 ,_ ...) (interpret-ultrascale-plus interpret expr)]
     [`(lattice-ecp5-pfu ,_ ...) (interpret-lattice-ecp5 interpret expr)]
     [`(lattice-ecp5-ccu2c ,_ ...) (interpret-lattice-ecp5 interpret expr)]
     [`(lattice-ecp5-ripple-pfu ,_ ...) (interpret-lattice-ecp5 interpret expr)]
     [`(sofa-lut4 ,_ ...) (interpret-sofa interpret expr)]

     ;;; Racket functions lifted to our language.
     [`(append ,lsts ...) (apply append (interpret lsts))]
     [`(take ,l ,n) (take (interpret l) n)]
     [`(drop ,l ,n) (drop (interpret l) n)]
     [`(list-ref ,l ,n) (list-ref (interpret l) n)]
     [`(first ,l) (first (interpret l))]
     [`(second ,l) (second (interpret l))]
     [`(third ,l) (third (interpret l))]
     [`(fourth ,l) (fourth (interpret l))]
     [`(fifth ,l) (fifth (interpret l))]
     [`(sixth ,l) (sixth (interpret l))]

     ;;; Rosette functions lifted to our language.
     [`(zero-extend ,v ,bv) (zero-extend (interpret v) bv)]
     [`(extract ,high ,low ,v) (extract high low (interpret v))]
     [`(concat ,v0 ,v1) (concat (interpret v0) (interpret v1))]

     ;;; Datatypes.
     [(? bv? v) v]
     ;;; This needs to be near the end, as nearly everything's a list!
     ;;; Maybe make this tighter somehow? If it's a list of specific types?
     [(? list? v) (map interpret v)])))

(module+ test
  (require rackunit
           rosette)

  (check-equal? (interpret `(physical-to-logical-mapping (bitwise) ,(list (bv #b1 1) (bv #b0 1))))
                (list (bv #b01 2)))

  (check-equal? (interpret `(logical-to-physical-mapping (bitwise) ,(list (bv 1 1) (bv 0 1))))
                (list (bv #b01 2)))

  (check-equal?
   (interpret `(ultrascale-plus-clb
                ,(bv 0 1)
                ,(bv 0 64)
                ,(bv 0 64)
                ,(bv 0 64)
                ,(bv 0 64)
                ,(bv 0 64)
                ,(bv 0 64)
                ,(bv 0 64)
                ,(bv 0 64)
                ,(bv 0 2)
                ,(bv 0 2)
                ,(bv 0 2)
                ,(bv 0 2)
                ,(bv 0 2)
                ,(bv 0 2)
                ,(bv 0 2)
                ,(bv 0 2)
                (,(bv 0 6) ,(bv 0 6) ,(bv 0 6) ,(bv 0 6) ,(bv 0 6) ,(bv 0 6) ,(bv 0 6) ,(bv 0 6))))
   (list (bv 0 1) (bv 0 1) (bv 0 1) (bv 0 1) (bv 0 1) (bv 0 1) (bv 0 1) (bv 0 1) (bv 0 1))))
