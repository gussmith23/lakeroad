;;; Interpreter for the Lakeroad FPGA modeling DSL.
#lang errortrace racket

(provide interpret
         lr-first
         lr-second
         report-memoization)

(require racket/pretty
         "logical-to-physical.rkt"
         "ultrascale.rkt"
         "lattice-ecp5.rkt"
         "sofa.rkt"
         "utils.rkt"
         "lut.rkt"
         rosette)

;;; Eventually, we should convert the entire language to being structs. (Ideally, put them in their
;;; own module and import them with a lr: prefix, rather than naming them lr-<name>.)
(struct lr-first (expr) #:transparent)
(struct lr-second (expr) #:transparent)

(define interp-memoization-hits 0)
(define interp-memoization-misses 0)
(define (report-memoization)
  (printf "Memozation Report: HITS: ~a  MISSES: ~a  HITS/MISSES: ~a\n"
          interp-memoization-hits
          interp-memoization-misses
          (/ (exact->inexact interp-memoization-hits) interp-memoization-misses)))

(define (interpret expr)
  (set! interp-memoization-hits 0)
  (set! interp-memoization-misses 0)
  (define interpreter-memo-hash (make-hasheq))
  (define (interpret-helper expr)
    (if (hash-has-key? interpreter-memo-hash expr)
        (begin
          (set! interp-memoization-hits (add1 interp-memoization-hits))
          (hash-ref interpreter-memo-hash expr))
        (begin
          (set! interp-memoization-misses (add1 interp-memoization-misses))
          (define out
            (for/all
             ([expr expr])
             (match expr
               ;;; Lakeroad language.
               [`(logical-to-physical-mapping ,_ ...)
                (interpret-logical-to-physical-mapping interpret-helper expr)]
               [`(physical-to-logical-mapping ,_ ...)
                (interpret-physical-to-logical-mapping interpret-helper expr)]
               [`(ultrascale-plus-clb ,_ ...) (interpret-ultrascale-plus interpret-helper expr)]
               [`(ultrascale-plus-lut6-2 ,_ ...) (interpret-ultrascale-plus interpret-helper expr)]
               [`(ultrascale-plus-lut3 ,_ ...) (interpret-ultrascale-plus interpret-helper expr)]
               [`(ultrascale-plus-lut2 ,_ ...) (interpret-ultrascale-plus interpret-helper expr)]
               [`(ultrascale-plus-lut1 ,_ ...) (interpret-ultrascale-plus interpret-helper expr)]
               [`(ultrascale-plus-dsp48e2 ,_ ...) (interpret-ultrascale-plus interpret-helper expr)]
               [`(lattice-ecp5-pfu ,_ ...) (interpret-lattice-ecp5 interpret-helper expr)]
               [`(lattice-ecp5-lut4 ,_ ...) (interpret-lattice-ecp5 interpret-helper expr)]
               [`(lattice-ecp5-lut5 ,_ ...) (interpret-lattice-ecp5 interpret-helper expr)]
               [`(lattice-ecp5-lut6 ,_ ...) (interpret-lattice-ecp5 interpret-helper expr)]
               [`(lattice-ecp5-lut7 ,_ ...) (interpret-lattice-ecp5 interpret-helper expr)]
               [`(lattice-ecp5-lut8 ,_ ...) (interpret-lattice-ecp5 interpret-helper expr)]
               [`(lattice-ecp5-pfumx ,_ ...) (interpret-lattice-ecp5 interpret-helper expr)]
               [`(lattice-ecp5-mux21 ,_ ...) (interpret-lattice-ecp5 interpret-helper expr)]
               [`(lattice-ecp5-l6mux21 ,_ ...) (interpret-lattice-ecp5 interpret-helper expr)]
               [`(lattice-ecp5-ccu2c ,_ ...) (interpret-lattice-ecp5 interpret-helper expr)]
               [`(lattice-ecp5-ripple-pfu ,_ ...) (interpret-lattice-ecp5 interpret-helper expr)]
               [`(sofa-lut1 ,_ ...) (interpret-sofa interpret-helper expr)]
               [`(sofa-lut2 ,_ ...) (interpret-sofa interpret-helper expr)]
               [`(sofa-lut3 ,_ ...) (interpret-sofa interpret-helper expr)]
               [`(sofa-lut4 ,_ ...) (interpret-sofa interpret-helper expr)]
               ;;; Generic hardware blocks.
               ;;;
               ;;; Returns a (bitvector 1): the result of looking up the entry specified by `inputs` in
               ;;; `lutmem`. `ins` is the number of inputs; i.e. 4 for a LUT4. The next argument is the number
               ;;; of output bits---we only support 1 for now.
               [`(lut ,ins 1 ,architecture ,lutmem ,inputs) (lut lutmem (interpret-helper inputs))]
               ;;; Returns a list of:
               ;;; - a (bitvector n): the result of the addition.
               ;;; - a (bitvector 1): the carry out.
               ;;;
               ;;; Inputs:
               ;;; - cin: the carry in.
               ;;; - di: the data input to the mux within the carry. Usually set to one of the inputs of the
               ;;;   addition, when implementing addition.
               ;;; - s: the select signal for the mux. Usually set to the partial sums of the addition (i.e. the
               ;;;   bitwise XORs of the inputs) when performing addition.
               [`(carry ,width ,architecture ,cin ,di ,s)
                (let* (;;; Returns the carry out bit at each stage.
                       [cin (interpret-helper cin)]
                       [di (interpret-helper di)]
                       [s (interpret-helper s)]
                       [calc-couts (λ (di s cins) (cons (if (bvzero? s) di (first cins)) cins))]
                       [couts-list
                        (foldl calc-couts (list cin) (bitvector->bits di) (bitvector->bits s))]
                       [cout (first couts-list)]
                       [cins (apply concat (drop couts-list 1))])
                  (list (bvxor cins s) cout))]

               ;;; Racket functions lifted to our language.
               [`(append ,lsts ...) (apply append (interpret-helper lsts))]
               [`(take ,l ,n) (take (interpret-helper l) n)]
               [`(drop ,l ,n) (drop (interpret-helper l) n)]
               [`(list-ref ,l ,n) (list-ref (interpret-helper l) n)]
               [(lr-first l) (first (interpret-helper l))]
               [`(first ,l) (first (interpret-helper l))]
               [(lr-second l) (second (interpret-helper l))]
               [`(second ,l) (second (interpret-helper l))]
               [`(third ,l) (third (interpret-helper l))]
               [`(fourth ,l) (fourth (interpret-helper l))]
               [`(fifth ,l) (fifth (interpret-helper l))]
               [`(sixth ,l) (sixth (interpret-helper l))]

               ;;; Rosette functions lifted to our language.
               [`(zero-extend ,v ,bv) (zero-extend (interpret-helper v) bv)]
               ;;; TODO: without this wacky syntax, Rosette will aggressively merge things into symbolic unions.
               ;;; E.g. (choose `(zero-extend v b) `(dup-extend v b)) becomes
               ;;; ((union zero-extend dup-extend) v b) instead of (union (zero-extend v b) (dup-extend v b)).
               ;;; The latter is a lot harder to deal with in the interpreter. How to stop this?
               [`(dup-extend this-is-a-hack-for-dup-extend ,v ,bv)
                (dup-extend (interpret-helper v) bv)]
               [`(extract ,high ,low ,v) (extract high low (interpret-helper v))]
               [`(concat ,vs ...) (apply concat (interpret-helper vs))]

               ;;; Datatypes.
               [(? bv? v) v]
               ;;; This needs to be near the end, as nearly everything's a list!
               ;;; Maybe make this tighter somehow? If it's a list of specific types?
               [(? list? v) (map interpret-helper v)])))
          (hash-set! interpreter-memo-hash expr out)
          out)))
  (interpret-helper expr))

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
