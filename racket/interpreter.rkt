;;; Interpreter for the Lakeroad FPGA modeling DSL.
#lang racket

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
         (prefix-in lr: "language.rkt")
         "architecture-description.rkt"
         "signal.rkt")

(define interp-memoization-hits 0)
(define interp-memoization-misses 0)
(define (report-memoization)
  (printf "Memozation Report: HITS: ~a  MISSES: ~a  HITS/MISSES: ~a\n"
          interp-memoization-hits
          interp-memoization-misses
          (/ (exact->inexact interp-memoization-hits) interp-memoization-misses)))

;;; module-semantics: association list of functions mapping (cons module-name filepath) to a function
;;; implementing the semantics for that module.
;;;
;;; TODO(@gussmith23): This might be better as an argument to interpret, but I'm implementing this
;;; during crunch time, so this is easier.
;;;(define module-semantics (make-parameter '()))
(define (interpret expr #:module-semantics [module-semantics '()])
  (set! interp-memoization-hits 0)
  (set! interp-memoization-misses 0)
  (define interpreter-memo-hash (make-hasheq))
  (define (interpret-helper expr)
    ;;; (displayln (~a (string (expr)) #:max-width 30))
    ;;; (let-values ([(struct-type skipped) (struct-info expr)]) (displayln struct-type))
    (if (hash-has-key? interpreter-memo-hash expr)
        (begin
          (set! interp-memoization-hits (add1 interp-memoization-hits))
          (hash-ref interpreter-memo-hash expr))
        (begin
          (set! interp-memoization-misses (add1 interp-memoization-misses))
          (define out
            (destruct
             expr
             [(list l) (error "hi")]
             [(lr:symbol s) s]
             [(lr:make-immutable-hash list-expr) (interpret-helper list-expr)]
             [(lr:cons v0-expr v1-expr) (cons (interpret-helper v0-expr) (interpret-helper v1-expr))]
             [(lr:hash-remap-keys h-expr ks)
              (let* ([h (interpret-helper h-expr)]
                     [_ (when (not (list? h))
                          (error "hash-remap-keys: expected h to be assoc list, got: " h))]
                     [new-h
                      (map (λ (pair)
                             (let ([k (car pair)] [v (cdr pair)])
                               (cons
                                (cdr (or (assoc k ks)
                                         (error
                                          (format
                                           "old key ~a not found in list: ~a. original hash map: ~a"
                                           k
                                           ks
                                           h))))
                                v)))
                           h)])
                new-h)]
             [(lr:hash-ref h-expr k)
              (let* ([h (interpret-helper h-expr)]
                     [out (cdr (or (assoc k h) (error "key " k " not found")))])
                out)]
             [(lr:hw-module-instance name ports params filepath)
              (let* ([module-semantics-fn (cdr (or (assoc (cons name filepath) module-semantics)
                                                   (error "No semantics for module: "
                                                          (cons name filepath)
                                                          " in semantics association list "
                                                          module-semantics)))]
                     ;;; Filter down to just the list of input ports.
                     [ports (filter (lambda (p) (equal? 'input (module-instance-port-direction p)))
                                    ports)]

                     ;;; Generate keyword arguments.
                     [port-names (map module-instance-port-name ports)]
                     [param-names (map module-instance-parameter-name params)]
                     [all-names (append port-names param-names)]
                     [all-names-as-keywords (map string->keyword all-names)]

                     ;;; Generate values to be paired with the arguments.
                     [port-values (map module-instance-port-value ports)]
                     [param-values (map module-instance-parameter-value params)]
                     [all-values (append port-values param-values)]
                     ;;; Interpret values.
                     [all-values (map interpret-helper all-values)]
                     ;;; Wrap in signal.
                    ;;;  [all-values (map bv->signal all-values)]

                     ;;; Pair them.
                     [pairs (map cons all-names-as-keywords all-values)]

                     ;;; Sort them by keyword<.
                     [pairs (sort pairs keyword<? #:key car)]

                     ;;; Call the function.
                     [out (keyword-apply module-semantics-fn (map car pairs) (map cdr pairs) '())]

                     ;;; TODO(@gussmith23): As long as `signal`s are not integrated fully into our
                     ;;; interpreter, we have to unwrap the signal values.
                    ;;;  [out (map (λ (p) (cons (car p) (signal-value (cdr p)))) out)]
                     )
                out)]
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
             [(ultrascale-plus-lut6-2 init inputs) (interpret-ultrascale-plus interpret-helper expr)]
             [(ultrascale-plus-lut3 init inputs) (interpret-ultrascale-plus interpret-helper expr)]
             [(ultrascale-plus-lut2 init inputs) (interpret-ultrascale-plus interpret-helper expr)]
             [(ultrascale-plus-lut1 init inputs) (interpret-ultrascale-plus interpret-helper expr)]
             [(xilinx-ultrascale-plus-carry8 carry-type ci ci-top di s)
              (interpret-ultrascale-plus interpret-helper expr)]
             [(xilinx-ultrascale-plus-lut6-2 i0 i1 i2 i3 i4 i5 init)
              (interpret-ultrascale-plus interpret-helper expr)]
             [(xilinx-ultrascale-plus-lut6 i0 i1 i2 i3 i4 i5 init)
              (interpret-ultrascale-plus interpret-helper expr)]
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
             [(lattice-ecp5-lut2 INIT inputs) (interpret-lattice-ecp5 interpret-helper expr)]
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
             [(sofa-frac-lut4 in mode mode-inv sram sram-inv) (interpret-sofa interpret-helper expr)]
             ;;; Generic hardware blocks.
             ;;;
             ;;; Returns a (bitvector 1): the result of looking up the entry specified by `inputs` in
             ;;; `lutmem`. `ins` is the number of inputs; i.e. 4 for a LUT4. The next argument is the number
             ;;; of output bits---we only support 1 for now.
             [(lr:lut ins outs architecture lutmem inputs)
              (when (not (= outs 1))
                (error "Only 1-bit output LUTs are supported."))
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
             [(lr:list-ref l n)
              (for/all ([n (interpret-helper n) #:exhaustive]) (list-ref (interpret-helper l) n))]
             [(lr:map f lsts) (apply map f (interpret-helper lsts))]
             ;;; Rosette functions lifted to our language.
            ;;;  [(lr:zero-extend v bv) (zero-extend (interpret-helper v) (interpret-helper bv))]
             [(lr:zero-extend v bv) 
              (let* (
                [v (interpret-helper v)]
                [bv (interpret-helper bv)]
                [state (merge-state (list v))])
                (signal (zero-extend (signal-value v) bv) state))]
             ;;; TODO: without this wacky syntax, Rosette will aggressively merge things into symbolic unions.
             ;;; E.g. (choose `(zero-extend v b) `(dup-extend v b)) becomes
             ;;; ((union zero-extend dup-extend) v b) instead of (union (zero-extend v b) (dup-extend v b)).
             ;;; The latter is a lot harder to deal with in the interpreter. How to stop this?
             ;;; [`(dup-extend this-is-a-hack-for-dup-extend ,v ,bv)
             ;;; (dup-extend (interpret-helper v) bv)]
            ;;;  [(lr:dup-extend v bv) (dup-extend (interpret-helper v) (interpret-helper bv))]
             [(lr:dup-extend v bv) 
              (let* (
                [v (interpret-helper v)]
                [bv (interpret-helper bv)]
                [state (merge-state (list v ))])
                (signal (dup-extend (signal-value v) bv) state))]
            ;;;  [(lr:extract h l v) ;; TODO
            ;;;   (begin
            ;;;     ;;; We need these for/alls to decompose h and l in weird situations where the indices
            ;;;     ;;; are concrete but there are multiple possible values.
            ;;;     (for/all ([h (interpret-helper h) #:exhaustive])
            ;;;              (for/all ([l (interpret-helper l) #:exhaustive])

            ;;;                       (extract h l (interpret-helper v)))))]
             [(lr:extract h l v) ;; TODO
              (begin
                ;;; We need these for/alls to decompose h and l in weird situations where the indices
                ;;; are concrete but there are multiple possible values.
                (let (
                  [v (interpret-helper v)]
                )
                (for/all ([h (interpret-helper h) #:exhaustive])
                         (for/all ([l (interpret-helper l) #:exhaustive])
                                  (signal (extract h l (signal-value v)) (merge-state (list v)))))))]
            ;;;  [(lr:concat vs) (apply concat (interpret-helper vs))]
            ;;; (for ([e (lr:list-v vs)]) (let-values ([(struct-type skipped) (struct-info e)]) (displayln struct-type)))
             [(lr:concat vs)   (let*(
              [vs (interpret-helper vs)]
              [state (merge-state vs)]
              [bv-list (map signal-value vs)]
             ) 
             (signal (apply concat bv-list) state))]
             ;;; Datatypes.
             [(lr:bv v) v]
             [(lr:bitvector v) v]
             ;;; Why did we have this? Do we need it after switching to destruct?
             ;;; [(? bitvector? v) v]
             [(lr:integer v) v]
             ;;; This needs to be near the end, as nearly everything's a list!
             ;;; Maybe make this tighter somehow? If it's a list of specific types?
             [(lr:list v) (map interpret-helper v)]))
          (hash-set! interpreter-memo-hash expr out)
          out)))
  (interpret-helper expr))

(module+ test
  (require rackunit
           rosette)

  (check-equal? (map signal-value (interpret (physical-to-logical-mapping
                            (ptol-bitwise)
                            (lr:list (list (lr:bv (bv->signal (bv #b1 1))) (lr:bv (bv->signal (bv #b0 1))))))))
                (list (bv #b01 2)))

  (check-equal? (map signal-value (interpret (logical-to-physical-mapping
                            (ltop-bitwise)
                            (lr:list (list (lr:bv (bv->signal (bv 1 1))) (lr:bv (bv->signal (bv 0 1))))))))
                (list (bv #b01 2)))

  (check-equal?
   (map signal-value (interpret (ultrascale-plus-clb (lr:bv (bv->signal (bv 0 1)))
                                   (lr:bv (bv->signal (bv 0 64)))
                                   (lr:bv (bv->signal (bv 0 64)))
                                   (lr:bv (bv->signal (bv 0 64)))
                                   (lr:bv (bv->signal (bv 0 64)))
                                   (lr:bv (bv->signal (bv 0 64)))
                                   (lr:bv (bv->signal (bv 0 64)))
                                   (lr:bv (bv->signal (bv 0 64)))
                                   (lr:bv (bv->signal (bv 0 64)))
                                   (lr:bv (bv->signal (bv 0 2)))
                                   (lr:bv (bv->signal (bv 0 2)))
                                   (lr:bv (bv->signal (bv 0 2)))
                                   (lr:bv (bv->signal (bv 0 2)))
                                   (lr:bv (bv->signal (bv 0 2)))
                                   (lr:bv (bv->signal (bv 0 2)))
                                   (lr:bv (bv->signal (bv 0 2)))
                                   (lr:bv (bv->signal (bv 0 2)))
                                   (lr:list (list (lr:bv (bv->signal (bv 0 6)))
                                                  (lr:bv (bv->signal (bv 0 6)))
                                                  (lr:bv (bv->signal (bv 0 6)))
                                                  (lr:bv (bv->signal (bv 0 6)))
                                                  (lr:bv (bv->signal (bv 0 6)))
                                                  (lr:bv (bv->signal (bv 0 6)))
                                                  (lr:bv (bv->signal (bv 0 6)))
                                                  (lr:bv (bv->signal (bv 0 6))))))))
   (list (bv 0 1) (bv 0 1) (bv 0 1) (bv 0 1) (bv 0 1) (bv 0 1) (bv 0 1) (bv 0 1) (bv 0 1))))
