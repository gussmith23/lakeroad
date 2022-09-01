;;; Interpreter for the Lakeroad FPGA modeling DSL.
#lang errortrace racket

(provide interpret
         report-memoization)

(require racket/pretty
         "logical-to-physical.rkt"
         "ultrascale.rkt"
         "lattice-ecp5.rkt"
         "sofa.rkt"
         "utils.rkt"
         "lut.rkt"
         rosette
         rosette/lib/destruct
         (prefix-in lr: "language.rkt"))

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
               [(logical-to-physical-mapping f inputs)
                (interpret-logical-to-physical-mapping interpret-helper f inputs)]
               [(physical-to-logical-mapping f outputs)
                (interpret-physical-to-logical-mapping interpret-helper f outputs)]
               [(ultrascale-plus-clb cin
                                     lut-a
                                     lut-b
                                     lut-c
                                     lut-d
                                     lut-e
                                     lut-f
                                     lut-g
                                     lut-h
                                     mux-selector-a
                                     mux-selector-b
                                     mux-selector-c
                                     mux-selector-d
                                     mux-selector-e
                                     mux-selector-f
                                     mux-selector-g
                                     mux-selector-h
                                     inputs)
                (interpret-ultrascale-plus interpret-helper expr)]
               [(ultrascale-plus-lut6-2 init inputs)
                (interpret-ultrascale-plus interpret-helper expr)]
               [(ultrascale-plus-lut3 init inputs) (interpret-ultrascale-plus interpret-helper expr)]
               [(ultrascale-plus-lut2 init inputs) (interpret-ultrascale-plus interpret-helper expr)]
               [(ultrascale-plus-lut1 init inputs) (interpret-ultrascale-plus interpret-helper expr)]
               [(ultrascale-plus-dsp48e2 A
                                         ACASCREG
                                         ACIN
                                         ADREG
                                         ALUMODE
                                         ALUMODEREG
                                         AMULTSEL
                                         AREG
                                         AUTORESET_PATDET
                                         AUTORESET_PRIORITY
                                         A_INPUT
                                         B
                                         BCASCREG
                                         BCIN
                                         BMULTSEL
                                         BREG
                                         B_INPUT
                                         C
                                         CARRYCASCIN
                                         CARRYIN
                                         CARRYINREG
                                         CARRYINSEL
                                         CARRYINSELREG
                                         CEA1
                                         CEA2
                                         CEAD
                                         CEALUMODE
                                         CEB1
                                         CEB2
                                         CEC
                                         CECARRYIN
                                         CECTRL
                                         CED
                                         CEINMODE
                                         CEM
                                         CEP
                                         CLK
                                         CREG
                                         D
                                         DREG
                                         INMODE
                                         INMODEREG
                                         IS_ALUMODE_INVERTED
                                         IS_CARRYIN_INVERTED
                                         IS_CLK_INVERTED
                                         IS_INMODE_INVERTED
                                         IS_OPMODE_INVERTED
                                         IS_RSTALLCARRYIN_INVERTED
                                         IS_RSTALUMODE_INVERTED
                                         IS_RSTA_INVERTED
                                         IS_RSTB_INVERTED
                                         IS_RSTCTRL_INVERTED
                                         IS_RSTC_INVERTED
                                         IS_RSTD_INVERTED
                                         IS_RSTINMODE_INVERTED
                                         IS_RSTM_INVERTED
                                         IS_RSTP_INVERTED
                                         MASK
                                         MREG
                                         MULTSIGNIN
                                         OPMODE
                                         OPMODEREG
                                         PATTERN
                                         PCIN
                                         PREADDINSEL
                                         PREG
                                         RND
                                         RSTA
                                         RSTALLCARRYIN
                                         RSTALUMODE
                                         RSTB
                                         RSTC
                                         RSTCTRL
                                         RSTD
                                         RSTINMODE
                                         RSTM
                                         RSTP
                                         SEL_MASK
                                         SEL_PATTERN
                                         USE_MULT
                                         USE_PATTERN_DETECT
                                         USE_SIMD
                                         USE_WIDEXOR
                                         XORSIMD
                                         unnamed-input-331
                                         unnamed-input-488
                                         unnamed-input-750
                                         unnamed-input-806
                                         unnamed-input-850)
                (interpret-ultrascale-plus interpret-helper expr)]
               [(lattice-ecp5-pfu lut-a lut-b lut-c lut-d lut-e lut-f lut-g lut-h inputs)
                (interpret-lattice-ecp5 interpret-helper expr)]
               [(lattice-ecp5-lut4 INIT inputs) (interpret-lattice-ecp5 interpret-helper expr)]
               [(lattice-ecp5-lut5 INIT inputs) (interpret-lattice-ecp5 interpret-helper expr)]
               [(lattice-ecp5-lut6 INIT inputs) (interpret-lattice-ecp5 interpret-helper expr)]
               [(lattice-ecp5-lut7 INIT inputs) (interpret-lattice-ecp5 interpret-helper expr)]
               [(lattice-ecp5-lut8 INIT inputs) (interpret-lattice-ecp5 interpret-helper expr)]
               [(lattice-ecp5-pfumx ALUT BLUT CO) (interpret-lattice-ecp5 interpret-helper expr)]
               [(lattice-ecp5-mux21 D0 D1 SD) (interpret-lattice-ecp5 interpret-helper expr)]
               [(lattice-ecp5-l6mux21 D0 D1 SD) (interpret-lattice-ecp5 interpret-helper expr)]
               [(lattice-ecp5-ccu2c INIT0 INIT1 INJECT1_0 INJECT1_1 CIN inputs)
                (interpret-lattice-ecp5 interpret-helper expr)]
               [(lattice-ecp5-ripple-pfu INIT0
                                         INIT1
                                         INIT2
                                         INIT3
                                         INIT4
                                         INIT5
                                         INIT6
                                         INIT7
                                         INJECT1_0
                                         INJECT1_1
                                         INJECT1_2
                                         INJECT1_3
                                         INJECT1_4
                                         INJECT1_5
                                         INJECT1_6
                                         INJECT1_7
                                         CIN
                                         inputs)
                (interpret-lattice-ecp5 interpret-helper expr)]
               [(sofa-lut1 sram inputs) (interpret-sofa interpret-helper expr)]
               [(sofa-lut2 sram inputs) (interpret-sofa interpret-helper expr)]
               [(sofa-lut3 sram inputs) (interpret-sofa interpret-helper expr)]
               [(sofa-lut4 sram inputs) (interpret-sofa interpret-helper expr)]
               [(sofa-frac-lut4 in mode mode-inv sram sram-inv)
                (interpret-sofa interpret-helper expr)]
               ;;; Generic hardware blocks.
               ;;;
               ;;; Returns a (bitvector 1): the result of looking up the entry specified by `inputs` in
               ;;; `lutmem`. `ins` is the number of inputs; i.e. 4 for a LUT4. The next argument is the number
               ;;; of output bits---we only support 1 for now.
               [(lr:lut ins 1 architecture lutmem inputs)
                (lut (interpret-helper lutmem) (interpret-helper inputs))]
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
               [(lr:carry width architecture cin di s)
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
               [(lr:first lst) (first (interpret-helper lst))]
               [(lr:append lsts) (apply append (interpret-helper lsts))]
               [(lr:take l n) (take (interpret-helper l) (interpret-helper n))]
               [(lr:drop l n) (drop (interpret-helper l) (interpret-helper n))]
               [(lr:list-ref l n) (list-ref (interpret-helper l) (interpret-helper n))]
               [(lr:map f lsts) (apply map f (interpret-helper lsts))]

               ;;; Rosette functions lifted to our language.
               [(lr:zero-extend v bv) (zero-extend (interpret-helper v) (interpret-helper bv))]
               ;;; TODO: without this wacky syntax, Rosette will aggressively merge things into symbolic unions.
               ;;; E.g. (choose `(zero-extend v b) `(dup-extend v b)) becomes
               ;;; ((union zero-extend dup-extend) v b) instead of (union (zero-extend v b) (dup-extend v b)).
               ;;; The latter is a lot harder to deal with in the interpreter. How to stop this?
               ;;; [`(dup-extend this-is-a-hack-for-dup-extend ,v ,bv)
               ;;; (dup-extend (interpret-helper v) bv)]
               [(lr:dup-extend v bv) (dup-extend (interpret-helper v) (interpret-helper bv))]
               [(lr:extract h l v)
                (extract (interpret-helper h) (interpret-helper l) (interpret-helper v))]
               [(lr:concat vs) (apply concat (interpret-helper vs))]

               ;;; Datatypes.
               [(? bv? v) v]
               [(? bitvector? v) v]
               [(? integer? v) v]
               ;;; This needs to be near the end, as nearly everything's a list!
               ;;; Maybe make this tighter somehow? If it's a list of specific types?
               [(? list? v) (map interpret-helper v)])))
          (hash-set! interpreter-memo-hash expr out)
          out)))
  (interpret-helper expr))

(module+ test
  (require rackunit
           rosette)

  (check-equal? (interpret (physical-to-logical-mapping '(bitwise) (list (bv #b1 1) (bv #b0 1))))
                (list (bv #b01 2)))

  (check-equal? (interpret (logical-to-physical-mapping '(bitwise) (list (bv 1 1) (bv 0 1))))
                (list (bv #b01 2)))

  (check-equal?
   (interpret (ultrascale-plus-clb
               (bv 0 1)
               (bv 0 64)
               (bv 0 64)
               (bv 0 64)
               (bv 0 64)
               (bv 0 64)
               (bv 0 64)
               (bv 0 64)
               (bv 0 64)
               (bv 0 2)
               (bv 0 2)
               (bv 0 2)
               (bv 0 2)
               (bv 0 2)
               (bv 0 2)
               (bv 0 2)
               (bv 0 2)
               (list (bv 0 6) (bv 0 6) (bv 0 6) (bv 0 6) (bv 0 6) (bv 0 6) (bv 0 6) (bv 0 6))))
   (list (bv 0 1) (bv 0 1) (bv 0 1) (bv 0 1) (bv 0 1) (bv 0 1) (bv 0 1) (bv 0 1) (bv 0 1))))
