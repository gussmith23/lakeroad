#lang racket/base
(provide xilinx-7-series-dsp48e1)
(require "../signal.rkt")
(require rosette)
(define xilinx-7-series-dsp48e1
  (λ (#:A
      (A (bv->signal (constant 'A (bitvector 30))))
      #:ACASCREG
      (ACASCREG (bv->signal (constant 'ACASCREG (bitvector 32))))
      #:ACIN
      (ACIN (bv->signal (constant 'ACIN (bitvector 30))))
      #:ADREG
      (ADREG (bv->signal (constant 'ADREG (bitvector 32))))
      #:ALUMODE
      (ALUMODE (bv->signal (constant 'ALUMODE (bitvector 4))))
      #:ALUMODEREG
      (ALUMODEREG (bv->signal (constant 'ALUMODEREG (bitvector 32))))
      #:AREG
      (AREG (bv->signal (constant 'AREG (bitvector 32))))
      #:AUTORESET_PATDET
      (AUTORESET_PATDET
       (bv->signal (constant 'AUTORESET_PATDET (bitvector 5))))
      #:A_INPUT
      (A_INPUT (bv->signal (constant 'A_INPUT (bitvector 5))))
      #:B
      (B (bv->signal (constant 'B (bitvector 18))))
      #:BCASCREG
      (BCASCREG (bv->signal (constant 'BCASCREG (bitvector 32))))
      #:BCIN
      (BCIN (bv->signal (constant 'BCIN (bitvector 18))))
      #:BREG
      (BREG (bv->signal (constant 'BREG (bitvector 32))))
      #:B_INPUT
      (B_INPUT (bv->signal (constant 'B_INPUT (bitvector 5))))
      #:C
      (C (bv->signal (constant 'C (bitvector 48))))
      #:CARRYCASCIN
      (CARRYCASCIN (bv->signal (constant 'CARRYCASCIN (bitvector 1))))
      #:CARRYIN
      (CARRYIN (bv->signal (constant 'CARRYIN (bitvector 1))))
      #:CARRYINREG
      (CARRYINREG (bv->signal (constant 'CARRYINREG (bitvector 32))))
      #:CARRYINSEL
      (CARRYINSEL (bv->signal (constant 'CARRYINSEL (bitvector 3))))
      #:CARRYINSELREG
      (CARRYINSELREG (bv->signal (constant 'CARRYINSELREG (bitvector 32))))
      #:CEA1
      (CEA1 (bv->signal (constant 'CEA1 (bitvector 1))))
      #:CEA2
      (CEA2 (bv->signal (constant 'CEA2 (bitvector 1))))
      #:CEAD
      (CEAD (bv->signal (constant 'CEAD (bitvector 1))))
      #:CEALUMODE
      (CEALUMODE (bv->signal (constant 'CEALUMODE (bitvector 1))))
      #:CEB1
      (CEB1 (bv->signal (constant 'CEB1 (bitvector 1))))
      #:CEB2
      (CEB2 (bv->signal (constant 'CEB2 (bitvector 1))))
      #:CEC
      (CEC (bv->signal (constant 'CEC (bitvector 1))))
      #:CECARRYIN
      (CECARRYIN (bv->signal (constant 'CECARRYIN (bitvector 1))))
      #:CECTRL
      (CECTRL (bv->signal (constant 'CECTRL (bitvector 1))))
      #:CED
      (CED (bv->signal (constant 'CED (bitvector 1))))
      #:CEINMODE
      (CEINMODE (bv->signal (constant 'CEINMODE (bitvector 1))))
      #:CEM
      (CEM (bv->signal (constant 'CEM (bitvector 1))))
      #:CEP
      (CEP (bv->signal (constant 'CEP (bitvector 1))))
      #:CLK
      (CLK (bv->signal (constant 'CLK (bitvector 1))))
      #:CREG
      (CREG (bv->signal (constant 'CREG (bitvector 32))))
      #:D
      (D (bv->signal (constant 'D (bitvector 25))))
      #:DREG
      (DREG (bv->signal (constant 'DREG (bitvector 32))))
      #:INMODE
      (INMODE (bv->signal (constant 'INMODE (bitvector 5))))
      #:INMODEREG
      (INMODEREG (bv->signal (constant 'INMODEREG (bitvector 32))))
      #:IS_ALUMODE_INVERTED
      (IS_ALUMODE_INVERTED
       (bv->signal (constant 'IS_ALUMODE_INVERTED (bitvector 4))))
      #:IS_CARRYIN_INVERTED
      (IS_CARRYIN_INVERTED
       (bv->signal (constant 'IS_CARRYIN_INVERTED (bitvector 1))))
      #:IS_CLK_INVERTED
      (IS_CLK_INVERTED (bv->signal (constant 'IS_CLK_INVERTED (bitvector 1))))
      #:IS_INMODE_INVERTED
      (IS_INMODE_INVERTED
       (bv->signal (constant 'IS_INMODE_INVERTED (bitvector 5))))
      #:IS_OPMODE_INVERTED
      (IS_OPMODE_INVERTED
       (bv->signal (constant 'IS_OPMODE_INVERTED (bitvector 7))))
      #:MASK
      (MASK (bv->signal (constant 'MASK (bitvector 48))))
      #:MREG
      (MREG (bv->signal (constant 'MREG (bitvector 32))))
      #:MULTSIGNIN
      (MULTSIGNIN (bv->signal (constant 'MULTSIGNIN (bitvector 1))))
      #:OPMODE
      (OPMODE (bv->signal (constant 'OPMODE (bitvector 7))))
      #:OPMODEREG
      (OPMODEREG (bv->signal (constant 'OPMODEREG (bitvector 32))))
      #:PATTERN
      (PATTERN (bv->signal (constant 'PATTERN (bitvector 48))))
      #:PCIN
      (PCIN (bv->signal (constant 'PCIN (bitvector 48))))
      #:PREG
      (PREG (bv->signal (constant 'PREG (bitvector 32))))
      #:RSTA
      (RSTA (bv->signal (constant 'RSTA (bitvector 1))))
      #:RSTALLCARRYIN
      (RSTALLCARRYIN (bv->signal (constant 'RSTALLCARRYIN (bitvector 1))))
      #:RSTALUMODE
      (RSTALUMODE (bv->signal (constant 'RSTALUMODE (bitvector 1))))
      #:RSTB
      (RSTB (bv->signal (constant 'RSTB (bitvector 1))))
      #:RSTC
      (RSTC (bv->signal (constant 'RSTC (bitvector 1))))
      #:RSTCTRL
      (RSTCTRL (bv->signal (constant 'RSTCTRL (bitvector 1))))
      #:RSTD
      (RSTD (bv->signal (constant 'RSTD (bitvector 1))))
      #:RSTINMODE
      (RSTINMODE (bv->signal (constant 'RSTINMODE (bitvector 1))))
      #:RSTM
      (RSTM (bv->signal (constant 'RSTM (bitvector 1))))
      #:RSTP
      (RSTP (bv->signal (constant 'RSTP (bitvector 1))))
      #:SEL_MASK
      (SEL_MASK (bv->signal (constant 'SEL_MASK (bitvector 5))))
      #:SEL_PATTERN
      (SEL_PATTERN (bv->signal (constant 'SEL_PATTERN (bitvector 5))))
      #:USE_DPORT
      (USE_DPORT (bv->signal (constant 'USE_DPORT (bitvector 5))))
      #:USE_MULT
      (USE_MULT (bv->signal (constant 'USE_MULT (bitvector 5))))
      #:USE_PATTERN_DETECT
      (USE_PATTERN_DETECT
       (bv->signal (constant 'USE_PATTERN_DETECT (bitvector 5))))
      #:USE_SIMD
      (USE_SIMD (bv->signal (constant 'USE_SIMD (bitvector 5))))
      #:name
      (name ""))
    (let* ((merged-input-state-hash (list))
           (init-hash
            (append
             (list
              (cons
               (string->symbol (string-append name "state828"))
               (bv 0 (bitvector 1))))
             (append
              (list
               (cons
                (string->symbol (string-append name "state766"))
                (bv 0 (bitvector 1))))
              (append
               (list
                (cons
                 (string->symbol (string-append name "state760"))
                 (bv 0 (bitvector 1))))
               (append
                (list
                 (cons
                  (string->symbol (string-append name "state756"))
                  (bv 0 (bitvector 1))))
                (append
                 (list
                  (cons
                   (string->symbol (string-append name "state749"))
                   (bv 0 (bitvector 1))))
                 (append
                  (list
                   (cons
                    (string->symbol (string-append name "state729"))
                    (bv 0 (bitvector 4))))
                  (append
                   (list
                    (cons
                     (string->symbol (string-append name "state727"))
                     (bv 0 (bitvector 4))))
                   (append
                    (list
                     (cons
                      (string->symbol (string-append name "state651"))
                      (bv 0 (bitvector 1))))
                    (append
                     (list
                      (cons
                       (string->symbol (string-append name "state643"))
                       (bv 0 (bitvector 1))))
                     (append
                      (list
                       (cons
                        (string->symbol (string-append name "state641"))
                        (bv 0 (bitvector 1))))
                      (append
                       (list
                        (cons
                         (string->symbol (string-append name "state622"))
                         (bv 0 (bitvector 1))))
                       (append
                        (list
                         (cons
                          (string->symbol (string-append name "state569"))
                          (bv 0 (bitvector 4))))
                        (append
                         (list
                          (cons
                           (string->symbol (string-append name "state452"))
                           (bv 0 (bitvector 48))))
                         (append
                          (list
                           (cons
                            (string->symbol (string-append name "state376"))
                            (bv 0 (bitvector 48))))
                          (append
                           (list
                            (cons
                             (string->symbol (string-append name "state362"))
                             (bv 0 (bitvector 7))))
                           (append
                            (list
                             (cons
                              (string->symbol (string-append name "state333"))
                              (bv 0 (bitvector 3))))
                            (append
                             (list
                              (cons
                               (string->symbol (string-append name "state325"))
                               (bv 0 (bitvector 43))))
                             (append
                              (list
                               (cons
                                (string->symbol
                                 (string-append name "state188"))
                                (bv 0 (bitvector 25))))
                              (append
                               (list
                                (cons
                                 (string->symbol
                                  (string-append name "state171"))
                                 (bv 0 (bitvector 25))))
                               (append
                                (list
                                 (cons
                                  (string->symbol
                                   (string-append name "state156"))
                                  (bv 0 (bitvector 5))))
                                (append
                                 (list
                                  (cons
                                   (string->symbol
                                    (string-append name "state140"))
                                   (bv 0 (bitvector 18))))
                                 (append
                                  (list
                                   (cons
                                    (string->symbol
                                     (string-append name "state127"))
                                    (bv 0 (bitvector 18))))
                                  (append
                                   (list
                                    (cons
                                     (string->symbol
                                      (string-append name "state111"))
                                     (bv 0 (bitvector 30))))
                                   (append
                                    (list
                                     (cons
                                      (string->symbol
                                       (string-append name "state92"))
                                      (bv 1 (bitvector 1))))
                                    (append
                                     (list
                                      (cons
                                       (string->symbol
                                        (string-append name "state89"))
                                       (bv 0 (bitvector 30))))
                                     (list)))))))))))))))))))))))))))
           (btor1 (bitvector 30))
           (btor2 A)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state A)))
           (btor3 (bitvector 32))
           (btor4 ACASCREG)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state ACASCREG)))
           (btor5 ACIN)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state ACIN)))
           (btor6 ADREG)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state ADREG)))
           (btor7 (bitvector 4))
           (btor8 ALUMODE)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state ALUMODE)))
           (btor9 ALUMODEREG)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state ALUMODEREG)))
           (btor10 AREG)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state AREG)))
           (btor11 (bitvector 5))
           (btor12 AUTORESET_PATDET)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state AUTORESET_PATDET)))
           (btor13 A_INPUT)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state A_INPUT)))
           (btor14 (bitvector 18))
           (btor15 B)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state B)))
           (btor16 BCASCREG)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state BCASCREG)))
           (btor17 BCIN)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state BCIN)))
           (btor18 BREG)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state BREG)))
           (btor19 B_INPUT)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state B_INPUT)))
           (btor20 (bitvector 48))
           (btor21 C)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state C)))
           (btor22 (bitvector 1))
           (btor23 CARRYCASCIN)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CARRYCASCIN)))
           (btor24 CARRYIN)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CARRYIN)))
           (btor25 CARRYINREG)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CARRYINREG)))
           (btor26 (bitvector 3))
           (btor27 CARRYINSEL)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CARRYINSEL)))
           (btor28 CARRYINSELREG)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state CARRYINSELREG)))
           (btor29 CEA1)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CEA1)))
           (btor30 CEA2)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CEA2)))
           (btor31 CEAD)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CEAD)))
           (btor32 CEALUMODE)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CEALUMODE)))
           (btor33 CEB1)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CEB1)))
           (btor34 CEB2)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CEB2)))
           (btor35 CEC)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CEC)))
           (btor36 CECARRYIN)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CECARRYIN)))
           (btor37 CECTRL)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CECTRL)))
           (btor38 CED)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CED)))
           (btor39 CEINMODE)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CEINMODE)))
           (btor40 CEM)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CEM)))
           (btor41 CEP)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CEP)))
           (btor42 CLK)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CLK)))
           (btor43 CREG)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CREG)))
           (btor44 (bitvector 25))
           (btor45 D)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state D)))
           (btor46 DREG)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state DREG)))
           (btor47 INMODE)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state INMODE)))
           (btor48 INMODEREG)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state INMODEREG)))
           (btor49 IS_ALUMODE_INVERTED)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state IS_ALUMODE_INVERTED)))
           (btor50 IS_CARRYIN_INVERTED)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state IS_CARRYIN_INVERTED)))
           (btor51 IS_CLK_INVERTED)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state IS_CLK_INVERTED)))
           (btor52 IS_INMODE_INVERTED)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state IS_INMODE_INVERTED)))
           (btor53 (bitvector 7))
           (btor54 IS_OPMODE_INVERTED)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state IS_OPMODE_INVERTED)))
           (btor55 MASK)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MASK)))
           (btor56 MREG)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MREG)))
           (btor57 MULTSIGNIN)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MULTSIGNIN)))
           (btor58 OPMODE)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state OPMODE)))
           (btor59 OPMODEREG)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state OPMODEREG)))
           (btor60 PATTERN)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state PATTERN)))
           (btor61 PCIN)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state PCIN)))
           (btor62 PREG)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state PREG)))
           (btor63 RSTA)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state RSTA)))
           (btor64 RSTALLCARRYIN)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state RSTALLCARRYIN)))
           (btor65 RSTALUMODE)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state RSTALUMODE)))
           (btor66 RSTB)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state RSTB)))
           (btor67 RSTC)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state RSTC)))
           (btor68 RSTCTRL)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state RSTCTRL)))
           (btor69 RSTD)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state RSTD)))
           (btor70 RSTINMODE)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state RSTINMODE)))
           (btor71 RSTM)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state RSTM)))
           (btor72 RSTP)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state RSTP)))
           (btor73 SEL_MASK)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SEL_MASK)))
           (btor74 SEL_PATTERN)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SEL_PATTERN)))
           (btor75 USE_DPORT)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state USE_DPORT)))
           (btor76 USE_MULT)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state USE_MULT)))
           (btor77 USE_PATTERN_DETECT)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state USE_PATTERN_DETECT)))
           (btor78 USE_SIMD)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state USE_SIMD)))
           (btor79 (bv->signal (bv 8 (bitvector 4))))
           (btor80
            (bv->signal
             (zero-extend (signal-value btor79) (bitvector 5))
             btor79))
           (btor81
            (signal
             (bool->bitvector
              (bveq (signal-value btor13) (signal-value btor80)))
             (list)))
           (btor82 (if (bitvector->bool (signal-value btor81)) btor5 btor2))
           (btor83 (bv->signal (bv 1 (bitvector 1))))
           (btor84
            (bv->signal
             (zero-extend (signal-value btor83) (bitvector 5))
             btor83))
           (btor85
            (signal
             (bool->bitvector
              (bveq (signal-value btor13) (signal-value btor84)))
             (list)))
           (btor86 (if (bitvector->bool (signal-value btor85)) btor2 btor82))
           (btor87
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state87")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state87"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state87")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state87")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 30))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor88 (bv->signal (bv 0 (bitvector 30))))
           (btor89
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state89")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state89"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state89")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state89")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 30))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor91
            (signal
             (bvxor (signal-value btor42) (signal-value btor51))
             (list)))
           (btor92
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state92")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state92"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state92")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state92")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor94 (bitvector 2))
           (btor95
            (signal
             (concat (signal-value btor92) (signal-value btor91))
             (list)))
           (btor96
            (bv->signal
             (zero-extend (signal-value btor83) (bitvector 2))
             btor83))
           (btor97
            (signal
             (bool->bitvector
              (bveq (signal-value btor95) (signal-value btor96)))
             (list)))
           (btor98 (if (bitvector->bool (signal-value btor97)) btor89 btor87))
           (btor99 (bv->signal (bv 1 (bitvector 2))))
           (btor100
            (bv->signal
             (sign-extend (signal-value btor99) (bitvector 32))
             btor99))
           (btor101
            (signal
             (bool->bitvector
              (bveq (signal-value btor10) (signal-value btor100)))
             (list)))
           (btor102 (bv->signal (bv 2 (bitvector 3))))
           (btor103
            (bv->signal
             (sign-extend (signal-value btor102) (bitvector 32))
             btor102))
           (btor104
            (signal
             (bool->bitvector
              (bveq (signal-value btor10) (signal-value btor103)))
             (list)))
           (btor105
            (signal
             (bvor (signal-value btor101) (signal-value btor104))
             (list)))
           (btor106
            (if (bitvector->bool (signal-value btor105)) btor98 btor86))
           (btor107
            (signal
             (apply bvor (bitvector->bits (signal-value btor10)))
             (signal-state btor10)))
           (btor108 (signal (bvnot (signal-value btor107)) (list)))
           (btor109
            (if (bitvector->bool (signal-value btor108)) btor86 btor106))
           (btor110
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state110")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state110"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state110")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state110")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 30))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor111
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state111")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state111"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state111")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state111")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 30))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor113
            (if (bitvector->bool (signal-value btor97)) btor111 btor110))
           (btor114
            (if (bitvector->bool (signal-value btor104)) btor113 btor109))
           (btor115
            (bv->signal
             (sign-extend (signal-value btor99) (bitvector 32))
             btor99))
           (btor116
            (signal
             (bool->bitvector
              (bveq (signal-value btor4) (signal-value btor115)))
             (list)))
           (btor117
            (if (bitvector->bool (signal-value btor116)) btor114 btor109))
           (btor119
            (bv->signal
             (zero-extend (signal-value btor79) (bitvector 5))
             btor79))
           (btor120
            (signal
             (bool->bitvector
              (bveq (signal-value btor19) (signal-value btor119)))
             (list)))
           (btor121
            (if (bitvector->bool (signal-value btor120)) btor17 btor15))
           (btor122
            (bv->signal
             (zero-extend (signal-value btor83) (bitvector 5))
             btor83))
           (btor123
            (signal
             (bool->bitvector
              (bveq (signal-value btor19) (signal-value btor122)))
             (list)))
           (btor124
            (if (bitvector->bool (signal-value btor123)) btor15 btor121))
           (btor125
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state125")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state125"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state125")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state125")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor126 (bv->signal (bv 0 (bitvector 18))))
           (btor127
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state127")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state127"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state127")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state127")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor129
            (if (bitvector->bool (signal-value btor97)) btor127 btor125))
           (btor130
            (bv->signal
             (sign-extend (signal-value btor99) (bitvector 32))
             btor99))
           (btor131
            (signal
             (bool->bitvector
              (bveq (signal-value btor18) (signal-value btor130)))
             (list)))
           (btor132
            (bv->signal
             (sign-extend (signal-value btor102) (bitvector 32))
             btor102))
           (btor133
            (signal
             (bool->bitvector
              (bveq (signal-value btor18) (signal-value btor132)))
             (list)))
           (btor134
            (signal
             (bvor (signal-value btor131) (signal-value btor133))
             (list)))
           (btor135
            (if (bitvector->bool (signal-value btor134)) btor129 btor124))
           (btor136
            (signal
             (apply bvor (bitvector->bits (signal-value btor18)))
             (signal-state btor18)))
           (btor137 (signal (bvnot (signal-value btor136)) (list)))
           (btor138
            (if (bitvector->bool (signal-value btor137)) btor124 btor135))
           (btor139
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state139")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state139"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state139")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state139")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor140
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state140")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state140"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state140")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state140")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor142
            (if (bitvector->bool (signal-value btor97)) btor140 btor139))
           (btor143
            (if (bitvector->bool (signal-value btor133)) btor142 btor138))
           (btor144
            (bv->signal
             (sign-extend (signal-value btor99) (bitvector 32))
             btor99))
           (btor145
            (signal
             (bool->bitvector
              (bveq (signal-value btor16) (signal-value btor144)))
             (list)))
           (btor146
            (if (bitvector->bool (signal-value btor145)) btor143 btor138))
           (btor148 (bitvector 13))
           (btor149 (bv->signal (bv 0 (bitvector 48))))
           (btor150 (bitvector 43))
           (btor151
            (signal
             (extract 24 0 (signal-value btor109))
             (signal-state btor109)))
           (btor152
            (signal
             (extract 24 0 (signal-value btor113))
             (signal-state btor113)))
           (btor153
            (signal
             (bvxor (signal-value btor47) (signal-value btor52))
             (list)))
           (btor154
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state154")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state154"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state154")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state154")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 5))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor155 (bv->signal (bv 0 (bitvector 5))))
           (btor156
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state156")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state156"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state156")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state156")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 5))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor158
            (if (bitvector->bool (signal-value btor97)) btor156 btor154))
           (btor159
            (bv->signal
             (sign-extend (signal-value btor99) (bitvector 32))
             btor99))
           (btor160
            (signal
             (bool->bitvector
              (bveq (signal-value btor48) (signal-value btor159)))
             (list)))
           (btor161
            (if (bitvector->bool (signal-value btor160)) btor158 btor153))
           (btor162
            (signal
             (apply bvor (bitvector->bits (signal-value btor48)))
             (signal-state btor48)))
           (btor163 (signal (bvnot (signal-value btor162)) (list)))
           (btor164
            (if (bitvector->bool (signal-value btor163)) btor153 btor161))
           (btor165
            (signal
             (extract 0 0 (signal-value btor164))
             (signal-state btor164)))
           (btor166
            (if (bitvector->bool (signal-value btor165)) btor152 btor151))
           (btor167 (bv->signal (bv 0 (bitvector 25))))
           (btor168
            (signal
             (extract 1 1 (signal-value btor164))
             (signal-state btor164)))
           (btor169
            (if (bitvector->bool (signal-value btor168)) btor167 btor166))
           (btor170
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state170")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state170"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state170")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state170")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 25))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor171
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state171")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state171"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state171")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state171")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 25))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor173
            (if (bitvector->bool (signal-value btor97)) btor171 btor170))
           (btor174
            (bv->signal
             (sign-extend (signal-value btor99) (bitvector 32))
             btor99))
           (btor175
            (signal
             (bool->bitvector
              (bveq (signal-value btor46) (signal-value btor174)))
             (list)))
           (btor176
            (if (bitvector->bool (signal-value btor175)) btor173 btor45))
           (btor177
            (signal
             (apply bvor (bitvector->bits (signal-value btor46)))
             (signal-state btor46)))
           (btor178 (signal (bvnot (signal-value btor177)) (list)))
           (btor179
            (if (bitvector->bool (signal-value btor178)) btor45 btor176))
           (btor180
            (signal
             (extract 2 2 (signal-value btor164))
             (signal-state btor164)))
           (btor181
            (if (bitvector->bool (signal-value btor180)) btor179 btor167))
           (btor182
            (signal
             (bvadd (signal-value btor169) (signal-value btor181))
             (list)))
           (btor183 (signal (bvneg (signal-value btor169)) (list)))
           (btor184
            (signal
             (bvadd (signal-value btor183) (signal-value btor181))
             (list)))
           (btor185
            (signal
             (extract 3 3 (signal-value btor164))
             (signal-state btor164)))
           (btor186
            (if (bitvector->bool (signal-value btor185)) btor184 btor182))
           (btor187
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state187")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state187"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state187")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state187")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 25))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor188
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state188")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state188"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state188")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state188")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 25))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor190
            (if (bitvector->bool (signal-value btor97)) btor188 btor187))
           (btor191
            (bv->signal
             (sign-extend (signal-value btor99) (bitvector 32))
             btor99))
           (btor192
            (signal
             (bool->bitvector
              (bveq (signal-value btor6) (signal-value btor191)))
             (list)))
           (btor193
            (if (bitvector->bool (signal-value btor192)) btor190 btor186))
           (btor194
            (signal
             (apply bvor (bitvector->bits (signal-value btor6)))
             (signal-state btor6)))
           (btor195 (signal (bvnot (signal-value btor194)) (list)))
           (btor196
            (if (bitvector->bool (signal-value btor195)) btor186 btor193))
           (btor197 (bv->signal (bv 9 (bitvector 4))))
           (btor198
            (bv->signal
             (zero-extend (signal-value btor197) (bitvector 5))
             btor197))
           (btor199
            (signal
             (bool->bitvector
              (bveq (signal-value btor75) (signal-value btor198)))
             (list)))
           (btor200
            (if (bitvector->bool (signal-value btor199)) btor196 btor169))
           (btor201
            (signal
             (extract 24 24 (signal-value btor200))
             (signal-state btor200)))
           (btor202 (bitvector 26))
           (btor203
            (signal
             (concat (signal-value btor201) (signal-value btor200))
             (list)))
           (btor204
            (signal
             (extract 24 24 (signal-value btor200))
             (signal-state btor200)))
           (btor205 (bitvector 27))
           (btor206
            (signal
             (concat (signal-value btor204) (signal-value btor203))
             (list)))
           (btor207
            (signal
             (extract 24 24 (signal-value btor200))
             (signal-state btor200)))
           (btor208 (bitvector 28))
           (btor209
            (signal
             (concat (signal-value btor207) (signal-value btor206))
             (list)))
           (btor210
            (signal
             (extract 24 24 (signal-value btor200))
             (signal-state btor200)))
           (btor211 (bitvector 29))
           (btor212
            (signal
             (concat (signal-value btor210) (signal-value btor209))
             (list)))
           (btor213
            (signal
             (extract 24 24 (signal-value btor200))
             (signal-state btor200)))
           (btor214
            (signal
             (concat (signal-value btor213) (signal-value btor212))
             (list)))
           (btor215
            (signal
             (extract 24 24 (signal-value btor200))
             (signal-state btor200)))
           (btor216 (bitvector 31))
           (btor217
            (signal
             (concat (signal-value btor215) (signal-value btor214))
             (list)))
           (btor218
            (signal
             (extract 24 24 (signal-value btor200))
             (signal-state btor200)))
           (btor219
            (signal
             (concat (signal-value btor218) (signal-value btor217))
             (list)))
           (btor220
            (signal
             (extract 24 24 (signal-value btor200))
             (signal-state btor200)))
           (btor221 (bitvector 33))
           (btor222
            (signal
             (concat (signal-value btor220) (signal-value btor219))
             (list)))
           (btor223
            (signal
             (extract 24 24 (signal-value btor200))
             (signal-state btor200)))
           (btor224 (bitvector 34))
           (btor225
            (signal
             (concat (signal-value btor223) (signal-value btor222))
             (list)))
           (btor226
            (signal
             (extract 24 24 (signal-value btor200))
             (signal-state btor200)))
           (btor227 (bitvector 35))
           (btor228
            (signal
             (concat (signal-value btor226) (signal-value btor225))
             (list)))
           (btor229
            (signal
             (extract 24 24 (signal-value btor200))
             (signal-state btor200)))
           (btor230 (bitvector 36))
           (btor231
            (signal
             (concat (signal-value btor229) (signal-value btor228))
             (list)))
           (btor232
            (signal
             (extract 24 24 (signal-value btor200))
             (signal-state btor200)))
           (btor233 (bitvector 37))
           (btor234
            (signal
             (concat (signal-value btor232) (signal-value btor231))
             (list)))
           (btor235
            (signal
             (extract 24 24 (signal-value btor200))
             (signal-state btor200)))
           (btor236 (bitvector 38))
           (btor237
            (signal
             (concat (signal-value btor235) (signal-value btor234))
             (list)))
           (btor238
            (signal
             (extract 24 24 (signal-value btor200))
             (signal-state btor200)))
           (btor239 (bitvector 39))
           (btor240
            (signal
             (concat (signal-value btor238) (signal-value btor237))
             (list)))
           (btor241
            (signal
             (extract 24 24 (signal-value btor200))
             (signal-state btor200)))
           (btor242 (bitvector 40))
           (btor243
            (signal
             (concat (signal-value btor241) (signal-value btor240))
             (list)))
           (btor244
            (signal
             (extract 24 24 (signal-value btor200))
             (signal-state btor200)))
           (btor245 (bitvector 41))
           (btor246
            (signal
             (concat (signal-value btor244) (signal-value btor243))
             (list)))
           (btor247
            (signal
             (extract 24 24 (signal-value btor200))
             (signal-state btor200)))
           (btor248 (bitvector 42))
           (btor249
            (signal
             (concat (signal-value btor247) (signal-value btor246))
             (list)))
           (btor250
            (signal
             (extract 24 24 (signal-value btor200))
             (signal-state btor200)))
           (btor251
            (signal
             (concat (signal-value btor250) (signal-value btor249))
             (list)))
           (btor252
            (signal
             (extract 4 4 (signal-value btor164))
             (signal-state btor164)))
           (btor253
            (if (bitvector->bool (signal-value btor252)) btor142 btor138))
           (btor254
            (signal
             (extract 17 17 (signal-value btor253))
             (signal-state btor253)))
           (btor255 (bitvector 19))
           (btor256
            (signal
             (concat (signal-value btor254) (signal-value btor253))
             (list)))
           (btor257
            (signal
             (extract 17 17 (signal-value btor253))
             (signal-state btor253)))
           (btor258 (bitvector 20))
           (btor259
            (signal
             (concat (signal-value btor257) (signal-value btor256))
             (list)))
           (btor260
            (signal
             (extract 17 17 (signal-value btor253))
             (signal-state btor253)))
           (btor261 (bitvector 21))
           (btor262
            (signal
             (concat (signal-value btor260) (signal-value btor259))
             (list)))
           (btor263
            (signal
             (extract 17 17 (signal-value btor253))
             (signal-state btor253)))
           (btor264 (bitvector 22))
           (btor265
            (signal
             (concat (signal-value btor263) (signal-value btor262))
             (list)))
           (btor266
            (signal
             (extract 17 17 (signal-value btor253))
             (signal-state btor253)))
           (btor267 (bitvector 23))
           (btor268
            (signal
             (concat (signal-value btor266) (signal-value btor265))
             (list)))
           (btor269
            (signal
             (extract 17 17 (signal-value btor253))
             (signal-state btor253)))
           (btor270 (bitvector 24))
           (btor271
            (signal
             (concat (signal-value btor269) (signal-value btor268))
             (list)))
           (btor272
            (signal
             (extract 17 17 (signal-value btor253))
             (signal-state btor253)))
           (btor273
            (signal
             (concat (signal-value btor272) (signal-value btor271))
             (list)))
           (btor274
            (signal
             (extract 17 17 (signal-value btor253))
             (signal-state btor253)))
           (btor275
            (signal
             (concat (signal-value btor274) (signal-value btor273))
             (list)))
           (btor276
            (signal
             (extract 17 17 (signal-value btor253))
             (signal-state btor253)))
           (btor277
            (signal
             (concat (signal-value btor276) (signal-value btor275))
             (list)))
           (btor278
            (signal
             (extract 17 17 (signal-value btor253))
             (signal-state btor253)))
           (btor279
            (signal
             (concat (signal-value btor278) (signal-value btor277))
             (list)))
           (btor280
            (signal
             (extract 17 17 (signal-value btor253))
             (signal-state btor253)))
           (btor281
            (signal
             (concat (signal-value btor280) (signal-value btor279))
             (list)))
           (btor282
            (signal
             (extract 17 17 (signal-value btor253))
             (signal-state btor253)))
           (btor283
            (signal
             (concat (signal-value btor282) (signal-value btor281))
             (list)))
           (btor284
            (signal
             (extract 17 17 (signal-value btor253))
             (signal-state btor253)))
           (btor285
            (signal
             (concat (signal-value btor284) (signal-value btor283))
             (list)))
           (btor286
            (signal
             (extract 17 17 (signal-value btor253))
             (signal-state btor253)))
           (btor287
            (signal
             (concat (signal-value btor286) (signal-value btor285))
             (list)))
           (btor288
            (signal
             (extract 17 17 (signal-value btor253))
             (signal-state btor253)))
           (btor289
            (signal
             (concat (signal-value btor288) (signal-value btor287))
             (list)))
           (btor290
            (signal
             (extract 17 17 (signal-value btor253))
             (signal-state btor253)))
           (btor291
            (signal
             (concat (signal-value btor290) (signal-value btor289))
             (list)))
           (btor292
            (signal
             (extract 17 17 (signal-value btor253))
             (signal-state btor253)))
           (btor293
            (signal
             (concat (signal-value btor292) (signal-value btor291))
             (list)))
           (btor294
            (signal
             (extract 17 17 (signal-value btor253))
             (signal-state btor253)))
           (btor295
            (signal
             (concat (signal-value btor294) (signal-value btor293))
             (list)))
           (btor296
            (signal
             (extract 17 17 (signal-value btor253))
             (signal-state btor253)))
           (btor297
            (signal
             (concat (signal-value btor296) (signal-value btor295))
             (list)))
           (btor298
            (signal
             (extract 17 17 (signal-value btor253))
             (signal-state btor253)))
           (btor299
            (signal
             (concat (signal-value btor298) (signal-value btor297))
             (list)))
           (btor300
            (signal
             (extract 17 17 (signal-value btor253))
             (signal-state btor253)))
           (btor301
            (signal
             (concat (signal-value btor300) (signal-value btor299))
             (list)))
           (btor302
            (signal
             (extract 17 17 (signal-value btor253))
             (signal-state btor253)))
           (btor303
            (signal
             (concat (signal-value btor302) (signal-value btor301))
             (list)))
           (btor304
            (signal
             (extract 17 17 (signal-value btor253))
             (signal-state btor253)))
           (btor305
            (signal
             (concat (signal-value btor304) (signal-value btor303))
             (list)))
           (btor306
            (signal
             (extract 17 17 (signal-value btor253))
             (signal-state btor253)))
           (btor307
            (signal
             (concat (signal-value btor306) (signal-value btor305))
             (list)))
           (btor308
            (signal
             (extract 17 17 (signal-value btor253))
             (signal-state btor253)))
           (btor309
            (signal
             (concat (signal-value btor308) (signal-value btor307))
             (list)))
           (btor310
            (signal
             (bvmul (signal-value btor251) (signal-value btor309))
             (list)))
           (btor311 (bv->signal (bv 0 (bitvector 43))))
           (btor312 (bv->signal (bv 2 (bitvector 2))))
           (btor313
            (bv->signal
             (zero-extend (signal-value btor312) (bitvector 3))
             btor312))
           (btor314
            (signal
             (bool->bitvector
              (bveq (signal-value btor27) (signal-value btor313)))
             (list)))
           (btor315
            (if (bitvector->bool (signal-value btor314)) btor311 btor310))
           (btor316 (bv->signal (bv 11 (bitvector 4))))
           (btor317
            (bv->signal
             (zero-extend (signal-value btor316) (bitvector 5))
             btor316))
           (btor318
            (signal
             (bool->bitvector
              (bveq (signal-value btor76) (signal-value btor317)))
             (list)))
           (btor319 (bv->signal (bv 7 (bitvector 3))))
           (btor320
            (bv->signal
             (zero-extend (signal-value btor319) (bitvector 5))
             btor319))
           (btor321
            (signal
             (bool->bitvector
              ((compose1 not bveq)
               (signal-value btor78)
               (signal-value btor320)))
             (list)))
           (btor322
            (signal
             (bvor (signal-value btor318) (signal-value btor321))
             (list)))
           (btor323
            (if (bitvector->bool (signal-value btor322)) btor311 btor315))
           (btor324
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state324")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state324"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state324")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state324")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 43))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor325
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state325")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state325"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state325")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state325")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 43))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor327
            (if (bitvector->bool (signal-value btor97)) btor325 btor324))
           (btor328
            (bv->signal
             (sign-extend (signal-value btor99) (bitvector 32))
             btor99))
           (btor329
            (signal
             (bool->bitvector
              (bveq (signal-value btor56) (signal-value btor328)))
             (list)))
           (btor330
            (if (bitvector->bool (signal-value btor329)) btor327 btor323))
           (btor331
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state331")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state331"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state331")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state331")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 3))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor332 (bv->signal (bv 0 (bitvector 3))))
           (btor333
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state333")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state333"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state333")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state333")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 3))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor335
            (if (bitvector->bool (signal-value btor97)) btor333 btor331))
           (btor336
            (bv->signal
             (sign-extend (signal-value btor99) (bitvector 32))
             btor99))
           (btor337
            (signal
             (bool->bitvector
              (bveq (signal-value btor28) (signal-value btor336)))
             (list)))
           (btor338
            (if (bitvector->bool (signal-value btor337)) btor335 btor27))
           (btor339
            (signal
             (apply bvor (bitvector->bits (signal-value btor28)))
             (signal-state btor28)))
           (btor340 (signal (bvnot (signal-value btor339)) (list)))
           (btor341
            (if (bitvector->bool (signal-value btor340)) btor27 btor338))
           (btor342
            (bv->signal
             (zero-extend (signal-value btor312) (bitvector 3))
             btor312))
           (btor343
            (signal
             (bool->bitvector
              (bveq (signal-value btor341) (signal-value btor342)))
             (list)))
           (btor344
            (if (bitvector->bool (signal-value btor343)) btor311 btor330))
           (btor345
            (signal
             (extract 42 42 (signal-value btor344))
             (signal-state btor344)))
           (btor346 (bitvector 44))
           (btor347
            (signal
             (concat (signal-value btor345) (signal-value btor344))
             (list)))
           (btor348
            (signal
             (extract 42 42 (signal-value btor344))
             (signal-state btor344)))
           (btor349 (bitvector 45))
           (btor350
            (signal
             (concat (signal-value btor348) (signal-value btor347))
             (list)))
           (btor351
            (signal
             (extract 42 42 (signal-value btor344))
             (signal-state btor344)))
           (btor352 (bitvector 46))
           (btor353
            (signal
             (concat (signal-value btor351) (signal-value btor350))
             (list)))
           (btor354
            (signal
             (extract 42 42 (signal-value btor344))
             (signal-state btor344)))
           (btor355 (bitvector 47))
           (btor356
            (signal
             (concat (signal-value btor354) (signal-value btor353))
             (list)))
           (btor357
            (signal
             (extract 42 42 (signal-value btor344))
             (signal-state btor344)))
           (btor358
            (signal
             (concat (signal-value btor357) (signal-value btor356))
             (list)))
           (btor359
            (signal
             (bvxor (signal-value btor58) (signal-value btor54))
             (list)))
           (btor360
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state360")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state360"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state360")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state360")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 7))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor361 (bv->signal (bv 0 (bitvector 7))))
           (btor362
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state362")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state362"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state362")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state362")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 7))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor364
            (if (bitvector->bool (signal-value btor97)) btor362 btor360))
           (btor365
            (bv->signal
             (sign-extend (signal-value btor99) (bitvector 32))
             btor99))
           (btor366
            (signal
             (bool->bitvector
              (bveq (signal-value btor59) (signal-value btor365)))
             (list)))
           (btor367
            (if (bitvector->bool (signal-value btor366)) btor364 btor359))
           (btor368
            (signal
             (apply bvor (bitvector->bits (signal-value btor59)))
             (signal-state btor59)))
           (btor369 (signal (bvnot (signal-value btor368)) (list)))
           (btor370
            (if (bitvector->bool (signal-value btor369)) btor359 btor367))
           (btor371
            (signal
             (extract 1 0 (signal-value btor370))
             (signal-state btor370)))
           (btor372
            (bv->signal
             (zero-extend (signal-value btor83) (bitvector 2))
             btor83))
           (btor373
            (signal
             (bool->bitvector
              (bveq (signal-value btor371) (signal-value btor372)))
             (list)))
           (btor374
            (if (bitvector->bool (signal-value btor373)) btor358 btor149))
           (btor375
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state375")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state375"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state375")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state375")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 48))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor376
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state376")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state376"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state376")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state376")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 48))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor378
            (if (bitvector->bool (signal-value btor97)) btor376 btor375))
           (btor379
            (signal
             (concat (signal-value btor109) (signal-value btor138))
             (list)))
           (btor380 (bv->signal (bv 3 (bitvector 2))))
           (btor381
            (signal
             (bool->bitvector
              (bveq (signal-value btor371) (signal-value btor380)))
             (list)))
           (btor382
            (if (bitvector->bool (signal-value btor381)) btor379 btor378))
           (btor383
            (signal
             (bool->bitvector
              (bveq (signal-value btor371) (signal-value btor312)))
             (list)))
           (btor384
            (signal
             (bvor (signal-value btor383) (signal-value btor381))
             (list)))
           (btor385
            (if (bitvector->bool (signal-value btor384)) btor382 btor374))
           (btor386 (bv->signal (bv 281474976710655 (bitvector 48))))
           (btor387
            (signal
             (concat (signal-value btor57) (signal-value btor57))
             (list)))
           (btor388
            (signal
             (concat (signal-value btor57) (signal-value btor387))
             (list)))
           (btor389
            (signal
             (concat (signal-value btor57) (signal-value btor388))
             (list)))
           (btor390
            (signal
             (concat (signal-value btor57) (signal-value btor389))
             (list)))
           (btor391 (bitvector 6))
           (btor392
            (signal
             (concat (signal-value btor57) (signal-value btor390))
             (list)))
           (btor393
            (signal
             (concat (signal-value btor57) (signal-value btor392))
             (list)))
           (btor394 (bitvector 8))
           (btor395
            (signal
             (concat (signal-value btor57) (signal-value btor393))
             (list)))
           (btor396 (bitvector 9))
           (btor397
            (signal
             (concat (signal-value btor57) (signal-value btor395))
             (list)))
           (btor398 (bitvector 10))
           (btor399
            (signal
             (concat (signal-value btor57) (signal-value btor397))
             (list)))
           (btor400 (bitvector 11))
           (btor401
            (signal
             (concat (signal-value btor57) (signal-value btor399))
             (list)))
           (btor402 (bitvector 12))
           (btor403
            (signal
             (concat (signal-value btor57) (signal-value btor401))
             (list)))
           (btor404
            (signal
             (concat (signal-value btor57) (signal-value btor403))
             (list)))
           (btor405 (bitvector 14))
           (btor406
            (signal
             (concat (signal-value btor57) (signal-value btor404))
             (list)))
           (btor407 (bitvector 15))
           (btor408
            (signal
             (concat (signal-value btor57) (signal-value btor406))
             (list)))
           (btor409 (bitvector 16))
           (btor410
            (signal
             (concat (signal-value btor57) (signal-value btor408))
             (list)))
           (btor411 (bitvector 17))
           (btor412
            (signal
             (concat (signal-value btor57) (signal-value btor410))
             (list)))
           (btor413
            (signal
             (concat (signal-value btor57) (signal-value btor412))
             (list)))
           (btor414
            (signal
             (concat (signal-value btor57) (signal-value btor413))
             (list)))
           (btor415
            (signal
             (concat (signal-value btor57) (signal-value btor414))
             (list)))
           (btor416
            (signal
             (concat (signal-value btor57) (signal-value btor415))
             (list)))
           (btor417
            (signal
             (concat (signal-value btor57) (signal-value btor416))
             (list)))
           (btor418
            (signal
             (concat (signal-value btor57) (signal-value btor417))
             (list)))
           (btor419
            (signal
             (concat (signal-value btor57) (signal-value btor418))
             (list)))
           (btor420
            (signal
             (concat (signal-value btor57) (signal-value btor419))
             (list)))
           (btor421
            (signal
             (concat (signal-value btor57) (signal-value btor420))
             (list)))
           (btor422
            (signal
             (concat (signal-value btor57) (signal-value btor421))
             (list)))
           (btor423
            (signal
             (concat (signal-value btor57) (signal-value btor422))
             (list)))
           (btor424
            (signal
             (concat (signal-value btor57) (signal-value btor423))
             (list)))
           (btor425
            (signal
             (concat (signal-value btor57) (signal-value btor424))
             (list)))
           (btor426
            (signal
             (concat (signal-value btor57) (signal-value btor425))
             (list)))
           (btor427
            (signal
             (concat (signal-value btor57) (signal-value btor426))
             (list)))
           (btor428
            (signal
             (concat (signal-value btor57) (signal-value btor427))
             (list)))
           (btor429
            (signal
             (concat (signal-value btor57) (signal-value btor428))
             (list)))
           (btor430
            (signal
             (concat (signal-value btor57) (signal-value btor429))
             (list)))
           (btor431
            (signal
             (concat (signal-value btor57) (signal-value btor430))
             (list)))
           (btor432
            (signal
             (concat (signal-value btor57) (signal-value btor431))
             (list)))
           (btor433
            (signal
             (concat (signal-value btor57) (signal-value btor432))
             (list)))
           (btor434
            (signal
             (concat (signal-value btor57) (signal-value btor433))
             (list)))
           (btor435
            (signal
             (concat (signal-value btor57) (signal-value btor434))
             (list)))
           (btor436
            (signal
             (concat (signal-value btor57) (signal-value btor435))
             (list)))
           (btor437
            (signal
             (concat (signal-value btor57) (signal-value btor436))
             (list)))
           (btor438
            (signal
             (concat (signal-value btor57) (signal-value btor437))
             (list)))
           (btor439
            (signal
             (concat (signal-value btor57) (signal-value btor438))
             (list)))
           (btor440
            (signal
             (concat (signal-value btor57) (signal-value btor439))
             (list)))
           (btor441
            (signal
             (concat (signal-value btor57) (signal-value btor440))
             (list)))
           (btor442
            (signal
             (concat (signal-value btor57) (signal-value btor441))
             (list)))
           (btor443
            (signal
             (concat (signal-value btor57) (signal-value btor442))
             (list)))
           (btor444
            (signal
             (extract 6 4 (signal-value btor370))
             (signal-state btor370)))
           (btor445 (bv->signal (bv 4 (bitvector 3))))
           (btor446
            (signal
             (bool->bitvector
              (bveq (signal-value btor444) (signal-value btor445)))
             (list)))
           (btor447
            (if (bitvector->bool (signal-value btor446)) btor443 btor386))
           (btor448
            (signal
             (extract 3 2 (signal-value btor370))
             (signal-state btor370)))
           (btor449
            (signal
             (bool->bitvector
              (bveq (signal-value btor448) (signal-value btor312)))
             (list)))
           (btor450
            (if (bitvector->bool (signal-value btor449)) btor447 btor149))
           (btor451
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state451")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state451"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state451")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state451")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 48))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor452
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state452")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state452"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state452")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state452")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 48))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor454
            (if (bitvector->bool (signal-value btor97)) btor452 btor451))
           (btor455
            (bv->signal
             (sign-extend (signal-value btor99) (bitvector 32))
             btor99))
           (btor456
            (signal
             (bool->bitvector
              (bveq (signal-value btor43) (signal-value btor455)))
             (list)))
           (btor457
            (if (bitvector->bool (signal-value btor456)) btor454 btor21))
           (btor458
            (signal
             (apply bvor (bitvector->bits (signal-value btor43)))
             (signal-state btor43)))
           (btor459 (signal (bvnot (signal-value btor458)) (list)))
           (btor460
            (if (bitvector->bool (signal-value btor459)) btor21 btor457))
           (btor461
            (signal
             (bool->bitvector
              (bveq (signal-value btor448) (signal-value btor380)))
             (list)))
           (btor462
            (if (bitvector->bool (signal-value btor461)) btor460 btor450))
           (btor463
            (signal
             (bvand (signal-value btor385) (signal-value btor462))
             (list)))
           (btor464
            (bv->signal
             (zero-extend (signal-value btor83) (bitvector 3))
             btor83))
           (btor465
            (signal
             (bool->bitvector
              (bveq (signal-value btor444) (signal-value btor464)))
             (list)))
           (btor466
            (if (bitvector->bool (signal-value btor465)) btor61 btor149))
           (btor467
            (bv->signal
             (zero-extend (signal-value btor380) (bitvector 3))
             btor380))
           (btor468
            (signal
             (bool->bitvector
              (bveq (signal-value btor444) (signal-value btor467)))
             (list)))
           (btor469
            (if (bitvector->bool (signal-value btor468)) btor460 btor466))
           (btor470
            (signal
             (extract 47 17 (signal-value btor61))
             (signal-state btor61)))
           (btor471
            (signal
             (extract 47 47 (signal-value btor61))
             (signal-state btor61)))
           (btor472
            (signal
             (concat (signal-value btor471) (signal-value btor470))
             (list)))
           (btor473
            (signal
             (extract 47 47 (signal-value btor61))
             (signal-state btor61)))
           (btor474
            (signal
             (concat (signal-value btor473) (signal-value btor472))
             (list)))
           (btor475
            (signal
             (extract 47 47 (signal-value btor61))
             (signal-state btor61)))
           (btor476
            (signal
             (concat (signal-value btor475) (signal-value btor474))
             (list)))
           (btor477
            (signal
             (extract 47 47 (signal-value btor61))
             (signal-state btor61)))
           (btor478
            (signal
             (concat (signal-value btor477) (signal-value btor476))
             (list)))
           (btor479
            (signal
             (extract 47 47 (signal-value btor61))
             (signal-state btor61)))
           (btor480
            (signal
             (concat (signal-value btor479) (signal-value btor478))
             (list)))
           (btor481
            (signal
             (extract 47 47 (signal-value btor61))
             (signal-state btor61)))
           (btor482
            (signal
             (concat (signal-value btor481) (signal-value btor480))
             (list)))
           (btor483
            (signal
             (extract 47 47 (signal-value btor61))
             (signal-state btor61)))
           (btor484
            (signal
             (concat (signal-value btor483) (signal-value btor482))
             (list)))
           (btor485
            (signal
             (extract 47 47 (signal-value btor61))
             (signal-state btor61)))
           (btor486
            (signal
             (concat (signal-value btor485) (signal-value btor484))
             (list)))
           (btor487
            (signal
             (extract 47 47 (signal-value btor61))
             (signal-state btor61)))
           (btor488
            (signal
             (concat (signal-value btor487) (signal-value btor486))
             (list)))
           (btor489
            (signal
             (extract 47 47 (signal-value btor61))
             (signal-state btor61)))
           (btor490
            (signal
             (concat (signal-value btor489) (signal-value btor488))
             (list)))
           (btor491
            (signal
             (extract 47 47 (signal-value btor61))
             (signal-state btor61)))
           (btor492
            (signal
             (concat (signal-value btor491) (signal-value btor490))
             (list)))
           (btor493
            (signal
             (extract 47 47 (signal-value btor61))
             (signal-state btor61)))
           (btor494
            (signal
             (concat (signal-value btor493) (signal-value btor492))
             (list)))
           (btor495
            (signal
             (extract 47 47 (signal-value btor61))
             (signal-state btor61)))
           (btor496
            (signal
             (concat (signal-value btor495) (signal-value btor494))
             (list)))
           (btor497
            (signal
             (extract 47 47 (signal-value btor61))
             (signal-state btor61)))
           (btor498
            (signal
             (concat (signal-value btor497) (signal-value btor496))
             (list)))
           (btor499
            (signal
             (extract 47 47 (signal-value btor61))
             (signal-state btor61)))
           (btor500
            (signal
             (concat (signal-value btor499) (signal-value btor498))
             (list)))
           (btor501
            (signal
             (extract 47 47 (signal-value btor61))
             (signal-state btor61)))
           (btor502
            (signal
             (concat (signal-value btor501) (signal-value btor500))
             (list)))
           (btor503
            (signal
             (extract 47 47 (signal-value btor61))
             (signal-state btor61)))
           (btor504
            (signal
             (concat (signal-value btor503) (signal-value btor502))
             (list)))
           (btor505 (bv->signal (bv 5 (bitvector 3))))
           (btor506
            (signal
             (bool->bitvector
              (bveq (signal-value btor444) (signal-value btor505)))
             (list)))
           (btor507
            (if (bitvector->bool (signal-value btor506)) btor504 btor378))
           (btor508
            (signal
             (extract 47 17 (signal-value btor378))
             (signal-state btor378)))
           (btor509
            (signal
             (extract 47 47 (signal-value btor378))
             (signal-state btor378)))
           (btor510
            (signal
             (concat (signal-value btor509) (signal-value btor508))
             (list)))
           (btor511
            (signal
             (extract 47 47 (signal-value btor378))
             (signal-state btor378)))
           (btor512
            (signal
             (concat (signal-value btor511) (signal-value btor510))
             (list)))
           (btor513
            (signal
             (extract 47 47 (signal-value btor378))
             (signal-state btor378)))
           (btor514
            (signal
             (concat (signal-value btor513) (signal-value btor512))
             (list)))
           (btor515
            (signal
             (extract 47 47 (signal-value btor378))
             (signal-state btor378)))
           (btor516
            (signal
             (concat (signal-value btor515) (signal-value btor514))
             (list)))
           (btor517
            (signal
             (extract 47 47 (signal-value btor378))
             (signal-state btor378)))
           (btor518
            (signal
             (concat (signal-value btor517) (signal-value btor516))
             (list)))
           (btor519
            (signal
             (extract 47 47 (signal-value btor378))
             (signal-state btor378)))
           (btor520
            (signal
             (concat (signal-value btor519) (signal-value btor518))
             (list)))
           (btor521
            (signal
             (extract 47 47 (signal-value btor378))
             (signal-state btor378)))
           (btor522
            (signal
             (concat (signal-value btor521) (signal-value btor520))
             (list)))
           (btor523
            (signal
             (extract 47 47 (signal-value btor378))
             (signal-state btor378)))
           (btor524
            (signal
             (concat (signal-value btor523) (signal-value btor522))
             (list)))
           (btor525
            (signal
             (extract 47 47 (signal-value btor378))
             (signal-state btor378)))
           (btor526
            (signal
             (concat (signal-value btor525) (signal-value btor524))
             (list)))
           (btor527
            (signal
             (extract 47 47 (signal-value btor378))
             (signal-state btor378)))
           (btor528
            (signal
             (concat (signal-value btor527) (signal-value btor526))
             (list)))
           (btor529
            (signal
             (extract 47 47 (signal-value btor378))
             (signal-state btor378)))
           (btor530
            (signal
             (concat (signal-value btor529) (signal-value btor528))
             (list)))
           (btor531
            (signal
             (extract 47 47 (signal-value btor378))
             (signal-state btor378)))
           (btor532
            (signal
             (concat (signal-value btor531) (signal-value btor530))
             (list)))
           (btor533
            (signal
             (extract 47 47 (signal-value btor378))
             (signal-state btor378)))
           (btor534
            (signal
             (concat (signal-value btor533) (signal-value btor532))
             (list)))
           (btor535
            (signal
             (extract 47 47 (signal-value btor378))
             (signal-state btor378)))
           (btor536
            (signal
             (concat (signal-value btor535) (signal-value btor534))
             (list)))
           (btor537
            (signal
             (extract 47 47 (signal-value btor378))
             (signal-state btor378)))
           (btor538
            (signal
             (concat (signal-value btor537) (signal-value btor536))
             (list)))
           (btor539
            (signal
             (extract 47 47 (signal-value btor378))
             (signal-state btor378)))
           (btor540
            (signal
             (concat (signal-value btor539) (signal-value btor538))
             (list)))
           (btor541
            (signal
             (extract 47 47 (signal-value btor378))
             (signal-state btor378)))
           (btor542
            (signal
             (concat (signal-value btor541) (signal-value btor540))
             (list)))
           (btor543
            (signal
             (bool->bitvector
              (bveq (signal-value btor444) (signal-value btor319)))
             (list)))
           (btor544 (bv->signal (bv 6 (bitvector 3))))
           (btor545
            (signal
             (bool->bitvector
              (bveq (signal-value btor444) (signal-value btor544)))
             (list)))
           (btor546
            (signal
             (concat (signal-value btor545) (signal-value btor543))
             (list)))
           (btor547
            (signal
             (apply bvor (bitvector->bits (signal-value btor546)))
             (signal-state btor546)))
           (btor548
            (if (bitvector->bool (signal-value btor547)) btor542 btor507))
           (btor549
            (bv->signal
             (zero-extend (signal-value btor312) (bitvector 3))
             btor312))
           (btor550
            (signal
             (bool->bitvector
              (bveq (signal-value btor444) (signal-value btor549)))
             (list)))
           (btor551
            (signal
             (concat (signal-value btor543) (signal-value btor446))
             (list)))
           (btor552
            (signal
             (concat (signal-value btor545) (signal-value btor551))
             (list)))
           (btor553
            (signal
             (concat (signal-value btor506) (signal-value btor552))
             (list)))
           (btor554
            (signal
             (concat (signal-value btor550) (signal-value btor553))
             (list)))
           (btor555
            (signal
             (apply bvor (bitvector->bits (signal-value btor554)))
             (signal-state btor554)))
           (btor556
            (if (bitvector->bool (signal-value btor555)) btor548 btor469))
           (btor557
            (signal
             (bvand (signal-value btor556) (signal-value btor462))
             (list)))
           (btor558
            (signal
             (bvor (signal-value btor463) (signal-value btor557))
             (list)))
           (btor559
            (signal
             (bvand (signal-value btor385) (signal-value btor556))
             (list)))
           (btor560
            (signal
             (bvor (signal-value btor558) (signal-value btor559))
             (list)))
           (btor561 (signal (bvnot (signal-value btor556)) (list)))
           (btor562
            (signal
             (bvand (signal-value btor561) (signal-value btor462))
             (list)))
           (btor563
            (signal
             (bvor (signal-value btor463) (signal-value btor562))
             (list)))
           (btor564
            (signal
             (bvand (signal-value btor385) (signal-value btor561))
             (list)))
           (btor565
            (signal
             (bvor (signal-value btor563) (signal-value btor564))
             (list)))
           (btor566
            (signal (bvxor (signal-value btor8) (signal-value btor49)) (list)))
           (btor567
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state567")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state567"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state567")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state567")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 4))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor568 (bv->signal (bv 0 (bitvector 4))))
           (btor569
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state569")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state569"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state569")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state569")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 4))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor571
            (if (bitvector->bool (signal-value btor97)) btor569 btor567))
           (btor572
            (bv->signal
             (sign-extend (signal-value btor99) (bitvector 32))
             btor99))
           (btor573
            (signal
             (bool->bitvector
              (bveq (signal-value btor9) (signal-value btor572)))
             (list)))
           (btor574
            (if (bitvector->bool (signal-value btor573)) btor571 btor566))
           (btor575
            (signal
             (apply bvor (bitvector->bits (signal-value btor9)))
             (signal-state btor9)))
           (btor576 (signal (bvnot (signal-value btor575)) (list)))
           (btor577
            (if (bitvector->bool (signal-value btor576)) btor566 btor574))
           (btor578
            (signal
             (extract 0 0 (signal-value btor577))
             (signal-state btor577)))
           (btor579
            (if (bitvector->bool (signal-value btor578)) btor565 btor560))
           (btor580
            (signal
             (extract 2 2 (signal-value btor577))
             (signal-state btor577)))
           (btor581
            (if (bitvector->bool (signal-value btor580)) btor149 btor579))
           (btor582
            (signal
             (extract 35 35 (signal-value btor581))
             (signal-state btor581)))
           (btor583 (bv->signal (bv 0 (bitvector 1))))
           (btor584 (bv->signal (bv 13 (bitvector 4))))
           (btor585
            (bv->signal
             (zero-extend (signal-value btor584) (bitvector 5))
             btor584))
           (btor586
            (signal
             (bool->bitvector
              (bveq (signal-value btor78) (signal-value btor585)))
             (list)))
           (btor587
            (if (bitvector->bool (signal-value btor586)) btor583 btor582))
           (btor588
            (signal
             (extract 47 36 (signal-value btor581))
             (signal-state btor581)))
           (btor589
            (signal
             (concat (signal-value btor588) (signal-value btor587))
             (list)))
           (btor590
            (signal
             (bvxor (signal-value btor556) (signal-value btor385))
             (list)))
           (btor591
            (signal
             (bvxor (signal-value btor590) (signal-value btor462))
             (list)))
           (btor592
            (signal
             (bvxor (signal-value btor561) (signal-value btor385))
             (list)))
           (btor593
            (signal
             (bvxor (signal-value btor592) (signal-value btor462))
             (list)))
           (btor594
            (if (bitvector->bool (signal-value btor578)) btor593 btor591))
           (btor595
            (signal
             (extract 3 3 (signal-value btor577))
             (signal-state btor577)))
           (btor596
            (if (bitvector->bool (signal-value btor595)) btor579 btor594))
           (btor597
            (signal
             (extract 47 36 (signal-value btor596))
             (signal-state btor596)))
           (btor598
            (bv->signal
             (zero-extend (signal-value btor597) (bitvector 13))
             btor597))
           (btor599
            (signal
             (bvadd (signal-value btor589) (signal-value btor598))
             (list)))
           (btor600
            (signal
             (extract 23 23 (signal-value btor581))
             (signal-state btor581)))
           (btor601 (bv->signal (bv 12 (bitvector 4))))
           (btor602
            (bv->signal
             (zero-extend (signal-value btor601) (bitvector 5))
             btor601))
           (btor603
            (signal
             (bool->bitvector
              (bveq (signal-value btor78) (signal-value btor602)))
             (list)))
           (btor604
            (signal
             (bvor (signal-value btor603) (signal-value btor586))
             (list)))
           (btor605
            (if (bitvector->bool (signal-value btor604)) btor583 btor600))
           (btor606
            (signal
             (extract 34 24 (signal-value btor581))
             (signal-state btor581)))
           (btor607
            (signal
             (concat (signal-value btor606) (signal-value btor605))
             (list)))
           (btor608
            (bv->signal
             (zero-extend (signal-value btor607) (bitvector 13))
             btor607))
           (btor609
            (signal
             (extract 35 24 (signal-value btor596))
             (signal-state btor596)))
           (btor610
            (bv->signal
             (zero-extend (signal-value btor609) (bitvector 13))
             btor609))
           (btor611
            (signal
             (bvadd (signal-value btor608) (signal-value btor610))
             (list)))
           (btor612
            (signal
             (extract 11 11 (signal-value btor581))
             (signal-state btor581)))
           (btor613
            (if (bitvector->bool (signal-value btor586)) btor583 btor612))
           (btor614
            (signal
             (extract 22 12 (signal-value btor581))
             (signal-state btor581)))
           (btor615
            (signal
             (concat (signal-value btor614) (signal-value btor613))
             (list)))
           (btor616
            (bv->signal
             (zero-extend (signal-value btor615) (bitvector 13))
             btor615))
           (btor617
            (signal
             (extract 23 12 (signal-value btor596))
             (signal-state btor596)))
           (btor618
            (bv->signal
             (zero-extend (signal-value btor617) (bitvector 13))
             btor617))
           (btor619
            (signal
             (bvadd (signal-value btor616) (signal-value btor618))
             (list)))
           (btor620
            (signal
             (bvxor (signal-value btor24) (signal-value btor50))
             (list)))
           (btor621
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state621")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state621"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state621")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state621")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor622
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state622")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state622"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state622")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state622")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor624
            (if (bitvector->bool (signal-value btor97)) btor622 btor621))
           (btor625
            (bv->signal
             (sign-extend (signal-value btor99) (bitvector 32))
             btor99))
           (btor626
            (signal
             (bool->bitvector
              (bveq (signal-value btor25) (signal-value btor625)))
             (list)))
           (btor627
            (if (bitvector->bool (signal-value btor626)) btor624 btor620))
           (btor628
            (signal
             (apply bvor (bitvector->bits (signal-value btor25)))
             (signal-state btor25)))
           (btor629 (signal (bvnot (signal-value btor628)) (list)))
           (btor630
            (if (bitvector->bool (signal-value btor629)) btor620 btor627))
           (btor631
            (signal
             (extract 47 47 (signal-value btor61))
             (signal-state btor61)))
           (btor632 (signal (bvnot (signal-value btor631)) (list)))
           (btor633
            (bv->signal
             (zero-extend (signal-value btor83) (bitvector 3))
             btor83))
           (btor634
            (signal
             (bool->bitvector
              (bveq (signal-value btor341) (signal-value btor633)))
             (list)))
           (btor635
            (if (bitvector->bool (signal-value btor634)) btor632 btor630))
           (btor636
            (bv->signal
             (zero-extend (signal-value btor380) (bitvector 3))
             btor380))
           (btor637
            (signal
             (bool->bitvector
              (bveq (signal-value btor341) (signal-value btor636)))
             (list)))
           (btor638
            (if (bitvector->bool (signal-value btor637)) btor631 btor23))
           (btor639
            (signal
             (bvor (signal-value btor343) (signal-value btor637))
             (list)))
           (btor640
            (if (bitvector->bool (signal-value btor639)) btor638 btor635))
           (btor641
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state641")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state641"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state641")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state641")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor643
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state643")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state643"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state643")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state643")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor645
            (if (bitvector->bool (signal-value btor97)) btor643 btor641))
           (btor646
            (signal
             (extract 47 47 (signal-value btor378))
             (signal-state btor378)))
           (btor647 (signal (bvnot (signal-value btor646)) (list)))
           (btor648
            (signal
             (bool->bitvector
              (bveq (signal-value btor341) (signal-value btor505)))
             (list)))
           (btor649
            (if (bitvector->bool (signal-value btor648)) btor647 btor645))
           (btor650
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state650")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state650"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state650")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state650")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor651
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state651")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state651"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state651")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state651")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor653
            (if (bitvector->bool (signal-value btor97)) btor651 btor650))
           (btor654
            (signal
             (extract 24 24 (signal-value btor200))
             (signal-state btor200)))
           (btor655
            (signal
             (extract 17 17 (signal-value btor253))
             (signal-state btor253)))
           (btor656
            (signal
             ((lambda (a b) (bvnot (bvxor a b)))
              (signal-value btor654)
              (signal-value btor655))
             (list)))
           (btor657
            (signal
             (apply bvor (bitvector->bits (signal-value btor56)))
             (signal-state btor56)))
           (btor658 (signal (bvnot (signal-value btor657)) (list)))
           (btor659
            (if (bitvector->bool (signal-value btor658)) btor656 btor653))
           (btor660
            (signal
             (bool->bitvector
              (bveq (signal-value btor341) (signal-value btor319)))
             (list)))
           (btor661
            (if (bitvector->bool (signal-value btor660)) btor646 btor659))
           (btor662
            (signal
             (bool->bitvector
              (bveq (signal-value btor341) (signal-value btor544)))
             (list)))
           (btor663
            (signal
             (bvor (signal-value btor662) (signal-value btor660))
             (list)))
           (btor664
            (if (bitvector->bool (signal-value btor663)) btor661 btor649))
           (btor665
            (signal
             (bool->bitvector
              (bveq (signal-value btor341) (signal-value btor445)))
             (list)))
           (btor666
            (signal
             (concat (signal-value btor648) (signal-value btor663))
             (list)))
           (btor667
            (signal
             (concat (signal-value btor665) (signal-value btor666))
             (list)))
           (btor668
            (signal
             (apply bvor (bitvector->bits (signal-value btor667)))
             (signal-state btor667)))
           (btor669
            (if (bitvector->bool (signal-value btor668)) btor664 btor640))
           (btor670
            (signal
             (bvor (signal-value btor595) (signal-value btor580))
             (list)))
           (btor671
            (if (bitvector->bool (signal-value btor670)) btor583 btor669))
           (btor672
            (signal
             (extract 10 0 (signal-value btor581))
             (signal-state btor581)))
           (btor673
            (signal
             (concat (signal-value btor672) (signal-value btor671))
             (list)))
           (btor674
            (bv->signal
             (zero-extend (signal-value btor673) (bitvector 13))
             btor673))
           (btor675
            (signal
             (extract 11 0 (signal-value btor596))
             (signal-state btor596)))
           (btor676
            (bv->signal
             (zero-extend (signal-value btor675) (bitvector 13))
             btor675))
           (btor677
            (signal
             (bvadd (signal-value btor674) (signal-value btor676))
             (list)))
           (btor678
            (signal
             (extract 12 12 (signal-value btor677))
             (signal-state btor677)))
           (btor679
            (if (bitvector->bool (signal-value btor586)) btor583 btor678))
           (btor680
            (bv->signal
             (zero-extend (signal-value btor679) (bitvector 13))
             btor679))
           (btor681
            (signal
             (bvadd (signal-value btor619) (signal-value btor680))
             (list)))
           (btor682
            (signal
             (extract 12 12 (signal-value btor681))
             (signal-state btor681)))
           (btor683
            (if (bitvector->bool (signal-value btor604)) btor583 btor682))
           (btor684
            (bv->signal
             (zero-extend (signal-value btor683) (bitvector 13))
             btor683))
           (btor685
            (signal
             (bvadd (signal-value btor611) (signal-value btor684))
             (list)))
           (btor686
            (signal
             (extract 12 12 (signal-value btor685))
             (signal-state btor685)))
           (btor687
            (if (bitvector->bool (signal-value btor586)) btor583 btor686))
           (btor688
            (bv->signal
             (zero-extend (signal-value btor687) (bitvector 13))
             btor687))
           (btor689
            (signal
             (bvadd (signal-value btor599) (signal-value btor688))
             (list)))
           (btor690
            (signal
             (extract 12 12 (signal-value btor689))
             (signal-state btor689)))
           (btor691
            (bv->signal
             (sign-extend (signal-value btor99) (bitvector 32))
             btor99))
           (btor692
            (signal
             (bool->bitvector
              (bveq (signal-value btor62) (signal-value btor691)))
             (list)))
           (btor693
            (if (bitvector->bool (signal-value btor692)) btor645 btor690))
           (btor694
            (signal
             (apply bvor (bitvector->bits (signal-value btor62)))
             (signal-state btor62)))
           (btor695 (signal (bvnot (signal-value btor694)) (list)))
           (btor696
            (if (bitvector->bool (signal-value btor695)) btor690 btor693))
           (btor698
            (signal
             (bvadd (signal-value btor612) (signal-value btor678))
             (list)))
           (btor699 (signal (bvnot (signal-value btor698)) (list)))
           (btor700
            (signal
             (extract 1 1 (signal-value btor577))
             (signal-state btor577)))
           (btor701
            (signal
             (bvand (signal-value btor578) (signal-value btor700))
             (list)))
           (btor702
            (if (bitvector->bool (signal-value btor701)) btor699 btor698))
           (btor703
            (if (bitvector->bool (signal-value btor586)) btor702 btor583))
           (btor704
            (signal
             (extract 3 0 (signal-value btor370))
             (signal-state btor370)))
           (btor705
            (bv->signal
             (zero-extend (signal-value btor505) (bitvector 4))
             btor505))
           (btor706
            (signal
             (bool->bitvector
              (bveq (signal-value btor704) (signal-value btor705)))
             (list)))
           (btor707
            (signal
             (extract 3 2 (signal-value btor577))
             (signal-state btor577)))
           (btor708
            (signal
             (apply bvor (bitvector->bits (signal-value btor707)))
             (signal-state btor707)))
           (btor709
            (signal
             (bvor (signal-value btor706) (signal-value btor708))
             (list)))
           (btor710
            (if (bitvector->bool (signal-value btor709)) btor583 btor703))
           (btor711
            (signal
             (bvadd (signal-value btor600) (signal-value btor682))
             (list)))
           (btor712 (signal (bvnot (signal-value btor711)) (list)))
           (btor713
            (if (bitvector->bool (signal-value btor701)) btor712 btor711))
           (btor714
            (if (bitvector->bool (signal-value btor604)) btor713 btor583))
           (btor715
            (if (bitvector->bool (signal-value btor709)) btor583 btor714))
           (btor716
            (signal
             (bvadd (signal-value btor582) (signal-value btor686))
             (list)))
           (btor717 (signal (bvnot (signal-value btor716)) (list)))
           (btor718
            (if (bitvector->bool (signal-value btor701)) btor717 btor716))
           (btor719
            (if (bitvector->bool (signal-value btor586)) btor718 btor583))
           (btor720
            (if (bitvector->bool (signal-value btor709)) btor583 btor719))
           (btor721 (signal (bvnot (signal-value btor690)) (list)))
           (btor722
            (if (bitvector->bool (signal-value btor701)) btor721 btor690))
           (btor723
            (if (bitvector->bool (signal-value btor709)) btor583 btor722))
           (btor724
            (signal
             (concat (signal-value btor715) (signal-value btor710))
             (list)))
           (btor725
            (signal
             (concat (signal-value btor720) (signal-value btor724))
             (list)))
           (btor726
            (signal
             (concat (signal-value btor723) (signal-value btor725))
             (list)))
           (btor727
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state727")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state727"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state727")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state727")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 4))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor729
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state729")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state729"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state729")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state729")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 4))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor731
            (if (bitvector->bool (signal-value btor97)) btor729 btor727))
           (btor732
            (if (bitvector->bool (signal-value btor692)) btor731 btor726))
           (btor733
            (if (bitvector->bool (signal-value btor695)) btor726 btor732))
           (btor734
            (signal
             (extract 0 0 (signal-value btor733))
             (signal-state btor733)))
           (btor735
            (if (bitvector->bool (signal-value btor586)) btor734 btor583))
           (btor736
            (signal
             (extract 1 1 (signal-value btor733))
             (signal-state btor733)))
           (btor737
            (if (bitvector->bool (signal-value btor604)) btor736 btor583))
           (btor738
            (signal
             (extract 2 2 (signal-value btor733))
             (signal-state btor733)))
           (btor739
            (if (bitvector->bool (signal-value btor586)) btor738 btor583))
           (btor740
            (signal
             (concat (signal-value btor737) (signal-value btor735))
             (list)))
           (btor741
            (signal
             (concat (signal-value btor739) (signal-value btor740))
             (list)))
           (btor742
            (signal
             (extract 3 3 (signal-value btor733))
             (signal-state btor733)))
           (btor743
            (signal
             (concat (signal-value btor742) (signal-value btor741))
             (list)))
           (btor745
            (signal
             (extract 42 42 (signal-value btor344))
             (signal-state btor344)))
           (btor746
            (signal
             (bool->bitvector
              (bveq (signal-value btor444) (signal-value btor445)))
             (list)))
           (btor747
            (if (bitvector->bool (signal-value btor746)) btor57 btor745))
           (btor748
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state748")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state748"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state748")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state748")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor749
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state749")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state749"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state749")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state749")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor751
            (if (bitvector->bool (signal-value btor97)) btor749 btor748))
           (btor752
            (if (bitvector->bool (signal-value btor692)) btor751 btor747))
           (btor753
            (if (bitvector->bool (signal-value btor695)) btor747 btor752))
           (btor755
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state755")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state755"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state755")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state755")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor756
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state756")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state756"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state756")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state756")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor758
            (if (bitvector->bool (signal-value btor97)) btor756 btor755))
           (btor759
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state759")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state759"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state759")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state759")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor760
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state760")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state760"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state760")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state760")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor762
            (if (bitvector->bool (signal-value btor97)) btor760 btor759))
           (btor763 (signal (bvnot (signal-value btor762)) (list)))
           (btor764
            (signal
             (bvand (signal-value btor758) (signal-value btor763))
             (list)))
           (btor765
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state765")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state765"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state765")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state765")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor766
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state766")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state766"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state766")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state766")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor768
            (if (bitvector->bool (signal-value btor97)) btor766 btor765))
           (btor769 (signal (bvnot (signal-value btor768)) (list)))
           (btor770
            (signal
             (bvand (signal-value btor764) (signal-value btor769))
             (list)))
           (btor771 (bv->signal (bv 10 (bitvector 4))))
           (btor772
            (bv->signal
             (zero-extend (signal-value btor771) (bitvector 5))
             btor771))
           (btor773
            (signal
             (bool->bitvector
              (bveq (signal-value btor77) (signal-value btor772)))
             (list)))
           (btor774
            (signal
             (bvor (signal-value btor773) (signal-value btor692))
             (list)))
           (btor775
            (if (bitvector->bool (signal-value btor774)) btor770 btor583))
           (btor777
            (signal
             (extract 11 0 (signal-value btor677))
             (signal-state btor677)))
           (btor778
            (signal
             (extract 11 0 (signal-value btor681))
             (signal-state btor681)))
           (btor779
            (signal
             (concat (signal-value btor778) (signal-value btor777))
             (list)))
           (btor780
            (signal
             (extract 11 0 (signal-value btor685))
             (signal-state btor685)))
           (btor781
            (signal
             (concat (signal-value btor780) (signal-value btor779))
             (list)))
           (btor782
            (signal
             (extract 11 0 (signal-value btor689))
             (signal-state btor689)))
           (btor783
            (signal
             (concat (signal-value btor782) (signal-value btor781))
             (list)))
           (btor784 (signal (bvnot (signal-value btor783)) (list)))
           (btor785
            (if (bitvector->bool (signal-value btor700)) btor784 btor783))
           (btor786
            (if (bitvector->bool (signal-value btor692)) btor378 btor785))
           (btor787
            (if (bitvector->bool (signal-value btor695)) btor785 btor786))
           (btor789
            (bv->signal
             (zero-extend (signal-value btor380) (bitvector 5))
             btor380))
           (btor790
            (signal
             (bool->bitvector
              (bveq (signal-value btor74) (signal-value btor789)))
             (list)))
           (btor791
            (if (bitvector->bool (signal-value btor790)) btor60 btor460))
           (btor792
            (signal
             (bvxor (signal-value btor791) (signal-value btor785))
             (list)))
           (btor793
            (bv->signal
             (zero-extend (signal-value btor312) (bitvector 5))
             btor312))
           (btor794
            (signal
             (bool->bitvector
              (bveq (signal-value btor73) (signal-value btor793)))
             (list)))
           (btor795
            (if (bitvector->bool (signal-value btor794)) btor55 btor386))
           (btor796 (bv->signal (bv 14 (bitvector 4))))
           (btor797
            (bv->signal
             (zero-extend (signal-value btor796) (bitvector 5))
             btor796))
           (btor798
            (signal
             (bool->bitvector
              (bveq (signal-value btor73) (signal-value btor797)))
             (list)))
           (btor799
            (if (bitvector->bool (signal-value btor798)) btor460 btor795))
           (btor800
            (signal
             (extract 46 0 (signal-value btor460))
             (signal-state btor460)))
           (btor801 (signal (bvnot (signal-value btor800)) (list)))
           (btor802
            (signal
             (concat (signal-value btor801) (signal-value btor583))
             (list)))
           (btor803 (bv->signal (bv 0 (bitvector 2))))
           (btor804
            (signal
             (extract 45 0 (signal-value btor801))
             (signal-state btor801)))
           (btor805
            (signal
             (concat (signal-value btor804) (signal-value btor803))
             (list)))
           (btor806 (bv->signal (bv 16 (bitvector 5))))
           (btor807
            (signal
             (bool->bitvector
              (bveq (signal-value btor73) (signal-value btor806)))
             (list)))
           (btor808
            (if (bitvector->bool (signal-value btor807)) btor805 btor802))
           (btor809 (bv->signal (bv 15 (bitvector 4))))
           (btor810
            (bv->signal
             (zero-extend (signal-value btor809) (bitvector 5))
             btor809))
           (btor811
            (signal
             (bool->bitvector
              (bveq (signal-value btor73) (signal-value btor810)))
             (list)))
           (btor812
            (signal
             (bvor (signal-value btor811) (signal-value btor807))
             (list)))
           (btor813
            (if (bitvector->bool (signal-value btor812)) btor808 btor799))
           (btor814
            (bv->signal
             (zero-extend (signal-value btor544) (bitvector 5))
             btor544))
           (btor815
            (signal
             (bool->bitvector
              (bveq (signal-value btor77) (signal-value btor814)))
             (list)))
           (btor816
            (if (bitvector->bool (signal-value btor815)) btor386 btor813))
           (btor817
            (signal
             (bvor (signal-value btor792) (signal-value btor816))
             (list)))
           (btor818
            (signal
             (apply bvand (bitvector->bits (signal-value btor817)))
             (signal-state btor817)))
           (btor819
            (if (bitvector->bool (signal-value btor692)) btor768 btor818))
           (btor821 (signal (bvnot (signal-value btor792)) (list)))
           (btor822
            (signal
             (bvor (signal-value btor821) (signal-value btor816))
             (list)))
           (btor823
            (signal
             (apply bvand (bitvector->bits (signal-value btor822)))
             (signal-state btor822)))
           (btor824
            (if (bitvector->bool (signal-value btor692)) btor762 btor823))
           (btor827
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state827")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state827"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state827")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state827")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor828
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state828")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state828"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state828")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state828")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor830
            (if (bitvector->bool (signal-value btor97)) btor828 btor827))
           (btor831
            (signal
             (bvand (signal-value btor830) (signal-value btor763))
             (list)))
           (btor832
            (signal
             (bvand (signal-value btor831) (signal-value btor769))
             (list)))
           (btor833
            (if (bitvector->bool (signal-value btor774)) btor832 btor583))
           (btor835
            (bv->signal
             (zero-extend (signal-value btor679) (bitvector 1))
             btor679))
           (btor836
            (bv->signal
             (zero-extend (signal-value btor683) (bitvector 1))
             btor683))
           (btor837
            (bv->signal
             (zero-extend (signal-value btor687) (bitvector 1))
             btor687))
           (btor838
            (bv->signal
             (zero-extend (signal-value btor49) (bitvector 4))
             btor49))
           (btor839
            (bv->signal
             (zero-extend (signal-value btor50) (bitvector 1))
             btor50))
           (btor840
            (bv->signal
             (zero-extend (signal-value btor51) (bitvector 1))
             btor51))
           (btor841
            (bv->signal
             (zero-extend (signal-value btor52) (bitvector 5))
             btor52))
           (btor842
            (bv->signal
             (zero-extend (signal-value btor54) (bitvector 7))
             btor54))
           (btor843
            (bv->signal
             (zero-extend (signal-value btor2) (bitvector 30))
             btor2))
           (btor844
            (bv->signal
             (zero-extend (signal-value btor2) (bitvector 30))
             btor2))
           (btor845
            (bv->signal
             (zero-extend (signal-value btor86) (bitvector 30))
             btor86))
           (btor846
            (bv->signal
             (zero-extend (signal-value btor169) (bitvector 25))
             btor169))
           (btor847
            (bv->signal
             (zero-extend (signal-value btor5) (bitvector 30))
             btor5))
           (btor848
            (bv->signal
             (zero-extend (signal-value btor5) (bitvector 30))
             btor5))
           (btor849
            (bv->signal
             (zero-extend (signal-value btor186) (bitvector 25))
             btor186))
           (btor850
            (bv->signal
             (zero-extend (signal-value btor200) (bitvector 25))
             btor200))
           (btor851
            (bv->signal
             (zero-extend (signal-value btor785) (bitvector 48))
             btor785))
           (btor852
            (bv->signal
             (zero-extend (signal-value btor8) (bitvector 4))
             btor8))
           (btor853
            (bv->signal
             (zero-extend (signal-value btor566) (bitvector 4))
             btor566))
           (btor854
            (bv->signal
             (zero-extend (signal-value btor15) (bitvector 18))
             btor15))
           (btor855
            (bv->signal
             (zero-extend (signal-value btor15) (bitvector 18))
             btor15))
           (btor856
            (bv->signal
             (zero-extend (signal-value btor253) (bitvector 18))
             btor253))
           (btor857
            (bv->signal
             (zero-extend (signal-value btor124) (bitvector 18))
             btor124))
           (btor858
            (bv->signal
             (zero-extend (signal-value btor17) (bitvector 18))
             btor17))
           (btor859
            (bv->signal
             (zero-extend (signal-value btor17) (bitvector 18))
             btor17))
           (btor860
            (bv->signal
             (zero-extend (signal-value btor21) (bitvector 48))
             btor21))
           (btor861
            (bv->signal
             (zero-extend (signal-value btor21) (bitvector 48))
             btor21))
           (btor862
            (bv->signal
             (zero-extend (signal-value btor23) (bitvector 1))
             btor23))
           (btor863
            (bv->signal
             (zero-extend (signal-value btor23) (bitvector 1))
             btor23))
           (btor864
            (bv->signal
             (zero-extend (signal-value btor690) (bitvector 1))
             btor690))
           (btor865
            (bv->signal
             (zero-extend (signal-value btor696) (bitvector 1))
             btor696))
           (btor866
            (bv->signal
             (zero-extend (signal-value btor645) (bitvector 1))
             btor645))
           (btor867
            (bv->signal
             (zero-extend (signal-value btor24) (bitvector 1))
             btor24))
           (btor868
            (bv->signal
             (zero-extend (signal-value btor620) (bitvector 1))
             btor620))
           (btor869
            (bv->signal
             (zero-extend (signal-value btor27) (bitvector 3))
             btor27))
           (btor870
            (bv->signal
             (zero-extend (signal-value btor27) (bitvector 3))
             btor27))
           (btor871
            (bv->signal
             (zero-extend (signal-value btor726) (bitvector 4))
             btor726))
           (btor872
            (signal
             (concat (signal-value btor713) (signal-value btor702))
             (list)))
           (btor873
            (signal
             (concat (signal-value btor718) (signal-value btor872))
             (list)))
           (btor874
            (signal
             (concat (signal-value btor722) (signal-value btor873))
             (list)))
           (btor875
            (bv->signal
             (zero-extend (signal-value btor874) (bitvector 4))
             btor874))
           (btor876
            (bv->signal
             (zero-extend (signal-value btor733) (bitvector 4))
             btor733))
           (btor877
            (bv->signal
             (zero-extend (signal-value btor731) (bitvector 4))
             btor731))
           (btor878
            (bv->signal
             (zero-extend (signal-value btor743) (bitvector 4))
             btor743))
           (btor879
            (bv->signal
             (zero-extend (signal-value btor29) (bitvector 1))
             btor29))
           (btor880
            (bv->signal
             (zero-extend (signal-value btor29) (bitvector 1))
             btor29))
           (btor881
            (bv->signal
             (zero-extend (signal-value btor30) (bitvector 1))
             btor30))
           (btor882
            (bv->signal
             (zero-extend (signal-value btor30) (bitvector 1))
             btor30))
           (btor883
            (bv->signal
             (zero-extend (signal-value btor31) (bitvector 1))
             btor31))
           (btor884
            (bv->signal
             (zero-extend (signal-value btor31) (bitvector 1))
             btor31))
           (btor885
            (bv->signal
             (zero-extend (signal-value btor32) (bitvector 1))
             btor32))
           (btor886
            (bv->signal
             (zero-extend (signal-value btor32) (bitvector 1))
             btor32))
           (btor887
            (bv->signal
             (zero-extend (signal-value btor33) (bitvector 1))
             btor33))
           (btor888
            (bv->signal
             (zero-extend (signal-value btor33) (bitvector 1))
             btor33))
           (btor889
            (bv->signal
             (zero-extend (signal-value btor34) (bitvector 1))
             btor34))
           (btor890
            (bv->signal
             (zero-extend (signal-value btor34) (bitvector 1))
             btor34))
           (btor891
            (bv->signal
             (zero-extend (signal-value btor35) (bitvector 1))
             btor35))
           (btor892
            (bv->signal
             (zero-extend (signal-value btor35) (bitvector 1))
             btor35))
           (btor893
            (bv->signal
             (zero-extend (signal-value btor36) (bitvector 1))
             btor36))
           (btor894
            (bv->signal
             (zero-extend (signal-value btor36) (bitvector 1))
             btor36))
           (btor895
            (bv->signal
             (zero-extend (signal-value btor37) (bitvector 1))
             btor37))
           (btor896
            (bv->signal
             (zero-extend (signal-value btor37) (bitvector 1))
             btor37))
           (btor897
            (bv->signal
             (zero-extend (signal-value btor38) (bitvector 1))
             btor38))
           (btor898
            (bv->signal
             (zero-extend (signal-value btor38) (bitvector 1))
             btor38))
           (btor899
            (bv->signal
             (zero-extend (signal-value btor39) (bitvector 1))
             btor39))
           (btor900
            (bv->signal
             (zero-extend (signal-value btor39) (bitvector 1))
             btor39))
           (btor901
            (bv->signal
             (zero-extend (signal-value btor40) (bitvector 1))
             btor40))
           (btor902
            (bv->signal
             (zero-extend (signal-value btor40) (bitvector 1))
             btor40))
           (btor903
            (bv->signal
             (zero-extend (signal-value btor41) (bitvector 1))
             btor41))
           (btor904
            (bv->signal
             (zero-extend (signal-value btor41) (bitvector 1))
             btor41))
           (btor905
            (bv->signal
             (zero-extend (signal-value btor42) (bitvector 1))
             btor42))
           (btor906
            (bv->signal
             (zero-extend (signal-value btor91) (bitvector 1))
             btor91))
           (btor907
            (bv->signal
             (zero-extend (signal-value btor579) (bitvector 48))
             btor579))
           (btor908
            (bv->signal
             (zero-extend (signal-value btor613) (bitvector 1))
             btor613))
           (btor909
            (bv->signal
             (zero-extend (signal-value btor605) (bitvector 1))
             btor605))
           (btor910
            (bv->signal
             (zero-extend (signal-value btor587) (bitvector 1))
             btor587))
           (btor911
            (bv->signal
             (zero-extend (signal-value btor581) (bitvector 48))
             btor581))
           (btor912
            (bv->signal
             (zero-extend (signal-value btor698) (bitvector 1))
             btor698))
           (btor913
            (bv->signal
             (zero-extend (signal-value btor711) (bitvector 1))
             btor711))
           (btor914
            (bv->signal
             (zero-extend (signal-value btor716) (bitvector 1))
             btor716))
           (btor915
            (bv->signal
             (zero-extend (signal-value btor690) (bitvector 1))
             btor690))
           (btor916
            (bv->signal
             (zero-extend (signal-value btor45) (bitvector 25))
             btor45))
           (btor917
            (bv->signal
             (zero-extend (signal-value btor45) (bitvector 25))
             btor45))
           (btor918
            (bv->signal
             (zero-extend (signal-value btor47) (bitvector 5))
             btor47))
           (btor919
            (bv->signal
             (zero-extend (signal-value btor153) (bitvector 5))
             btor153))
           (btor920
            (bv->signal
             (zero-extend (signal-value btor323) (bitvector 43))
             btor323))
           (btor921
            (bv->signal
             (zero-extend (signal-value btor57) (bitvector 1))
             btor57))
           (btor922
            (bv->signal
             (zero-extend (signal-value btor57) (bitvector 1))
             btor57))
           (btor923
            (bv->signal
             (zero-extend (signal-value btor753) (bitvector 1))
             btor753))
           (btor924
            (bv->signal
             (zero-extend (signal-value btor747) (bitvector 1))
             btor747))
           (btor925
            (bv->signal
             (zero-extend (signal-value btor58) (bitvector 7))
             btor58))
           (btor926
            (bv->signal
             (zero-extend (signal-value btor359) (bitvector 7))
             btor359))
           (btor927
            (bv->signal
             (zero-extend (signal-value btor775) (bitvector 1))
             btor775))
           (btor928
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 48))
             btor61))
           (btor929
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 48))
             btor61))
           (btor930
            (bv->signal
             (zero-extend (signal-value btor823) (bitvector 1))
             btor823))
           (btor931
            (bv->signal
             (zero-extend (signal-value btor824) (bitvector 1))
             btor824))
           (btor932
            (bv->signal
             (zero-extend (signal-value btor762) (bitvector 1))
             btor762))
           (btor933
            (bv->signal
             (zero-extend (signal-value btor758) (bitvector 1))
             btor758))
           (btor934
            (bv->signal
             (zero-extend (signal-value btor818) (bitvector 1))
             btor818))
           (btor935
            (bv->signal
             (zero-extend (signal-value btor819) (bitvector 1))
             btor819))
           (btor936
            (bv->signal
             (zero-extend (signal-value btor768) (bitvector 1))
             btor768))
           (btor937
            (bv->signal
             (zero-extend (signal-value btor830) (bitvector 1))
             btor830))
           (btor938
            (bv->signal
             (zero-extend (signal-value btor583) (bitvector 1))
             btor583))
           (btor939
            (bv->signal
             (zero-extend (signal-value btor109) (bitvector 30))
             btor109))
           (btor940
            (bv->signal
             (zero-extend (signal-value btor113) (bitvector 30))
             btor113))
           (btor941
            (bv->signal
             (zero-extend (signal-value btor98) (bitvector 30))
             btor98))
           (btor942
            (bv->signal
             (zero-extend (signal-value btor117) (bitvector 30))
             btor117))
           (btor943
            (bv->signal
             (zero-extend (signal-value btor196) (bitvector 25))
             btor196))
           (btor944
            (bv->signal
             (zero-extend (signal-value btor190) (bitvector 25))
             btor190))
           (btor945
            (bv->signal
             (zero-extend (signal-value btor577) (bitvector 4))
             btor577))
           (btor946
            (bv->signal
             (zero-extend (signal-value btor571) (bitvector 4))
             btor571))
           (btor947
            (bv->signal
             (zero-extend (signal-value btor138) (bitvector 18))
             btor138))
           (btor948
            (bv->signal
             (zero-extend (signal-value btor142) (bitvector 18))
             btor142))
           (btor949
            (bv->signal
             (zero-extend (signal-value btor129) (bitvector 18))
             btor129))
           (btor950
            (bv->signal
             (zero-extend (signal-value btor146) (bitvector 18))
             btor146))
           (btor951
            (bv->signal
             (zero-extend (signal-value btor460) (bitvector 48))
             btor460))
           (btor952
            (bv->signal
             (zero-extend (signal-value btor454) (bitvector 48))
             btor454))
           (btor953
            (bv->signal
             (zero-extend (signal-value btor671) (bitvector 1))
             btor671))
           (btor954
            (bv->signal
             (zero-extend (signal-value btor630) (bitvector 1))
             btor630))
           (btor955
            (bv->signal
             (zero-extend (signal-value btor659) (bitvector 1))
             btor659))
           (btor956
            (bv->signal
             (zero-extend (signal-value btor669) (bitvector 1))
             btor669))
           (btor957
            (bv->signal
             (zero-extend (signal-value btor624) (bitvector 1))
             btor624))
           (btor958
            (bv->signal
             (zero-extend (signal-value btor653) (bitvector 1))
             btor653))
           (btor959
            (bv->signal
             (zero-extend (signal-value btor341) (bitvector 3))
             btor341))
           (btor960
            (bv->signal
             (zero-extend (signal-value btor335) (bitvector 3))
             btor335))
           (btor961
            (bv->signal
             (zero-extend (signal-value btor179) (bitvector 25))
             btor179))
           (btor962
            (bv->signal
             (zero-extend (signal-value btor173) (bitvector 25))
             btor173))
           (btor963
            (bv->signal
             (zero-extend (signal-value btor164) (bitvector 5))
             btor164))
           (btor964
            (bv->signal
             (zero-extend (signal-value btor158) (bitvector 5))
             btor158))
           (btor965
            (bv->signal
             (zero-extend (signal-value btor344) (bitvector 43))
             btor344))
           (btor966
            (bv->signal
             (zero-extend (signal-value btor327) (bitvector 43))
             btor327))
           (btor967
            (bv->signal
             (zero-extend (signal-value btor751) (bitvector 1))
             btor751))
           (btor968
            (bv->signal
             (zero-extend (signal-value btor370) (bitvector 7))
             btor370))
           (btor969
            (bv->signal
             (zero-extend (signal-value btor364) (bitvector 7))
             btor364))
           (btor970
            (bv->signal
             (zero-extend (signal-value btor787) (bitvector 48))
             btor787))
           (btor971
            (bv->signal
             (zero-extend (signal-value btor378) (bitvector 48))
             btor378))
           (btor972
            (bv->signal
             (zero-extend (signal-value btor385) (bitvector 48))
             btor385))
           (btor973
            (bv->signal
             (zero-extend (signal-value btor462) (bitvector 48))
             btor462))
           (btor974
            (bv->signal
             (zero-extend (signal-value btor556) (bitvector 48))
             btor556))
           (btor975
            (bv->signal
             (zero-extend (signal-value btor63) (bitvector 1))
             btor63))
           (btor976
            (bv->signal
             (zero-extend (signal-value btor63) (bitvector 1))
             btor63))
           (btor977
            (bv->signal
             (zero-extend (signal-value btor64) (bitvector 1))
             btor64))
           (btor978
            (bv->signal
             (zero-extend (signal-value btor64) (bitvector 1))
             btor64))
           (btor979
            (bv->signal
             (zero-extend (signal-value btor65) (bitvector 1))
             btor65))
           (btor980
            (bv->signal
             (zero-extend (signal-value btor65) (bitvector 1))
             btor65))
           (btor981
            (bv->signal
             (zero-extend (signal-value btor66) (bitvector 1))
             btor66))
           (btor982
            (bv->signal
             (zero-extend (signal-value btor66) (bitvector 1))
             btor66))
           (btor983
            (bv->signal
             (zero-extend (signal-value btor67) (bitvector 1))
             btor67))
           (btor984
            (bv->signal
             (zero-extend (signal-value btor67) (bitvector 1))
             btor67))
           (btor985
            (bv->signal
             (zero-extend (signal-value btor68) (bitvector 1))
             btor68))
           (btor986
            (bv->signal
             (zero-extend (signal-value btor68) (bitvector 1))
             btor68))
           (btor987
            (bv->signal
             (zero-extend (signal-value btor69) (bitvector 1))
             btor69))
           (btor988
            (bv->signal
             (zero-extend (signal-value btor69) (bitvector 1))
             btor69))
           (btor989
            (bv->signal
             (zero-extend (signal-value btor70) (bitvector 1))
             btor70))
           (btor990
            (bv->signal
             (zero-extend (signal-value btor70) (bitvector 1))
             btor70))
           (btor991
            (bv->signal
             (zero-extend (signal-value btor71) (bitvector 1))
             btor71))
           (btor992
            (bv->signal
             (zero-extend (signal-value btor71) (bitvector 1))
             btor71))
           (btor993
            (bv->signal
             (zero-extend (signal-value btor72) (bitvector 1))
             btor72))
           (btor994
            (bv->signal
             (zero-extend (signal-value btor72) (bitvector 1))
             btor72))
           (btor995
            (bv->signal
             (zero-extend (signal-value btor594) (bitvector 48))
             btor594))
           (btor996
            (bv->signal
             (zero-extend (signal-value btor677) (bitvector 13))
             btor677))
           (btor997
            (bv->signal
             (zero-extend (signal-value btor681) (bitvector 13))
             btor681))
           (btor998
            (bv->signal
             (zero-extend (signal-value btor685) (bitvector 13))
             btor685))
           (btor999
            (bv->signal
             (zero-extend (signal-value btor689) (bitvector 13))
             btor689))
           (btor1000
            (bv->signal
             (zero-extend (signal-value btor596) (bitvector 48))
             btor596))
           (btor1001 (bv->signal (bv 17 (bitvector 5))))
           (btor1002
            (signal
             (bool->bitvector
              (bveq (signal-value btor12) (signal-value btor1001)))
             (list)))
           (btor1003
            (signal
             (bvand (signal-value btor1002) (signal-value btor762))
             (list)))
           (btor1004 (bv->signal (bv 18 (bitvector 5))))
           (btor1005
            (signal
             (bool->bitvector
              (bveq (signal-value btor12) (signal-value btor1004)))
             (list)))
           (btor1006
            (signal
             (bvand (signal-value btor758) (signal-value btor763))
             (list)))
           (btor1007
            (signal
             (bvand (signal-value btor1005) (signal-value btor1006))
             (list)))
           (btor1008
            (signal
             (bvor (signal-value btor1003) (signal-value btor1007))
             (list)))
           (btor1009
            (bv->signal
             (zero-extend (signal-value btor1008) (bitvector 1))
             btor1008))
           (btor1010
            (bv->signal
             (zero-extend (signal-value btor816) (bitvector 48))
             btor816))
           (btor1011
            (bv->signal
             (zero-extend (signal-value btor791) (bitvector 48))
             btor791))
           (btor1012
            (bv->signal
             (zero-extend (signal-value btor833) (bitvector 1))
             btor833))
           (btor1013
            (bv->signal
             (zero-extend (signal-value btor447) (bitvector 48))
             btor447))
           (btor1015
            (if (bitvector->bool (signal-value btor30)) btor113 btor98))
           (btor1016
            (if (bitvector->bool (signal-value btor63)) btor88 btor1015))
           (btor1017
            (if (bitvector->bool (signal-value btor104)) btor1016 btor98))
           (btor1018
            (if (bitvector->bool (signal-value btor30)) btor86 btor98))
           (btor1019
            (if (bitvector->bool (signal-value btor63)) btor88 btor1018))
           (btor1020
            (if (bitvector->bool (signal-value btor101)) btor1019 btor1017))
           (btor1024
            (if (bitvector->bool (signal-value btor29)) btor86 btor113))
           (btor1025
            (if (bitvector->bool (signal-value btor63)) btor88 btor1024))
           (btor1026
            (if (bitvector->bool (signal-value btor104)) btor1025 btor113))
           (btor1027
            (if (bitvector->bool (signal-value btor101)) btor1025 btor1026))
           (btor1030
            (if (bitvector->bool (signal-value btor34)) btor142 btor129))
           (btor1031
            (if (bitvector->bool (signal-value btor66)) btor126 btor1030))
           (btor1032
            (if (bitvector->bool (signal-value btor133)) btor1031 btor129))
           (btor1033
            (if (bitvector->bool (signal-value btor34)) btor124 btor129))
           (btor1034
            (if (bitvector->bool (signal-value btor66)) btor126 btor1033))
           (btor1035
            (if (bitvector->bool (signal-value btor131)) btor1034 btor1032))
           (btor1038
            (if (bitvector->bool (signal-value btor33)) btor124 btor142))
           (btor1039
            (if (bitvector->bool (signal-value btor66)) btor126 btor1038))
           (btor1040
            (if (bitvector->bool (signal-value btor133)) btor1039 btor142))
           (btor1041
            (if (bitvector->bool (signal-value btor131)) btor1039 btor1040))
           (btor1044
            (if (bitvector->bool (signal-value btor39)) btor153 btor158))
           (btor1045
            (if (bitvector->bool (signal-value btor70)) btor155 btor1044))
           (btor1048
            (if (bitvector->bool (signal-value btor38)) btor45 btor173))
           (btor1049
            (if (bitvector->bool (signal-value btor69)) btor167 btor1048))
           (btor1052
            (if (bitvector->bool (signal-value btor31)) btor186 btor190))
           (btor1053
            (if (bitvector->bool (signal-value btor69)) btor167 btor1052))
           (btor1056
            (if (bitvector->bool (signal-value btor40)) btor323 btor327))
           (btor1057
            (if (bitvector->bool (signal-value btor71)) btor311 btor1056))
           (btor1060
            (if (bitvector->bool (signal-value btor37)) btor27 btor335))
           (btor1061
            (if (bitvector->bool (signal-value btor68)) btor332 btor1060))
           (btor1064
            (if (bitvector->bool (signal-value btor37)) btor359 btor364))
           (btor1065
            (if (bitvector->bool (signal-value btor68)) btor361 btor1064))
           (btor1068
            (if (bitvector->bool (signal-value btor41)) btor785 btor378))
           (btor1069
            (signal
             (bvor (signal-value btor72) (signal-value btor1008))
             (list)))
           (btor1070
            (if (bitvector->bool (signal-value btor1069)) btor149 btor1068))
           (btor1073
            (if (bitvector->bool (signal-value btor35)) btor21 btor454))
           (btor1074
            (if (bitvector->bool (signal-value btor67)) btor149 btor1073))
           (btor1077
            (if (bitvector->bool (signal-value btor32)) btor566 btor571))
           (btor1078
            (if (bitvector->bool (signal-value btor65)) btor568 btor1077))
           (btor1081
            (if (bitvector->bool (signal-value btor36)) btor620 btor624))
           (btor1082
            (if (bitvector->bool (signal-value btor64)) btor583 btor1081))
           (btor1085
            (if (bitvector->bool (signal-value btor41)) btor690 btor645))
           (btor1086
            (if (bitvector->bool (signal-value btor1069)) btor583 btor1085))
           (btor1089
            (if (bitvector->bool (signal-value btor40)) btor656 btor653))
           (btor1090
            (if (bitvector->bool (signal-value btor64)) btor583 btor1089))
           (btor1093
            (if (bitvector->bool (signal-value btor41)) btor726 btor731))
           (btor1094
            (if (bitvector->bool (signal-value btor1069)) btor568 btor1093))
           (btor1097
            (if (bitvector->bool (signal-value btor41)) btor747 btor751))
           (btor1098
            (if (bitvector->bool (signal-value btor1069)) btor583 btor1097))
           (btor1101
            (if (bitvector->bool (signal-value btor41)) btor762 btor758))
           (btor1102
            (if (bitvector->bool (signal-value btor1069)) btor583 btor1101))
           (btor1105
            (if (bitvector->bool (signal-value btor41)) btor823 btor762))
           (btor1106
            (if (bitvector->bool (signal-value btor1069)) btor583 btor1105))
           (btor1109
            (if (bitvector->bool (signal-value btor41)) btor818 btor768))
           (btor1110
            (if (bitvector->bool (signal-value btor1069)) btor583 btor1109))
           (btor1113
            (if (bitvector->bool (signal-value btor41)) btor768 btor830))
           (btor1114
            (if (bitvector->bool (signal-value btor1069)) btor583 btor1113))
           (output-state
            (remove-duplicates
             (append
              (append
               (list
                (cons
                 (string->symbol (string-append name "state828"))
                 (cons
                  (signal-value btor1114)
                  (if (assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state828")))
                    (add1
                     (cdr
                      (assoc-ref
                       merged-input-state-hash
                       (string->symbol (string-append name "state828")))))
                    0))))
               (append
                (list
                 (cons
                  (string->symbol (string-append name "state827"))
                  (cons
                   (signal-value btor830)
                   (if (assoc-has-key?
                        merged-input-state-hash
                        (string->symbol (string-append name "state827")))
                     (add1
                      (cdr
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state827")))))
                     0))))
                (append
                 (list
                  (cons
                   (string->symbol (string-append name "state766"))
                   (cons
                    (signal-value btor1110)
                    (if (assoc-has-key?
                         merged-input-state-hash
                         (string->symbol (string-append name "state766")))
                      (add1
                       (cdr
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state766")))))
                      0))))
                 (append
                  (list
                   (cons
                    (string->symbol (string-append name "state765"))
                    (cons
                     (signal-value btor768)
                     (if (assoc-has-key?
                          merged-input-state-hash
                          (string->symbol (string-append name "state765")))
                       (add1
                        (cdr
                         (assoc-ref
                          merged-input-state-hash
                          (string->symbol (string-append name "state765")))))
                       0))))
                  (append
                   (list
                    (cons
                     (string->symbol (string-append name "state760"))
                     (cons
                      (signal-value btor1106)
                      (if (assoc-has-key?
                           merged-input-state-hash
                           (string->symbol (string-append name "state760")))
                        (add1
                         (cdr
                          (assoc-ref
                           merged-input-state-hash
                           (string->symbol (string-append name "state760")))))
                        0))))
                   (append
                    (list
                     (cons
                      (string->symbol (string-append name "state759"))
                      (cons
                       (signal-value btor762)
                       (if (assoc-has-key?
                            merged-input-state-hash
                            (string->symbol (string-append name "state759")))
                         (add1
                          (cdr
                           (assoc-ref
                            merged-input-state-hash
                            (string->symbol (string-append name "state759")))))
                         0))))
                    (append
                     (list
                      (cons
                       (string->symbol (string-append name "state756"))
                       (cons
                        (signal-value btor1102)
                        (if (assoc-has-key?
                             merged-input-state-hash
                             (string->symbol (string-append name "state756")))
                          (add1
                           (cdr
                            (assoc-ref
                             merged-input-state-hash
                             (string->symbol
                              (string-append name "state756")))))
                          0))))
                     (append
                      (list
                       (cons
                        (string->symbol (string-append name "state755"))
                        (cons
                         (signal-value btor758)
                         (if (assoc-has-key?
                              merged-input-state-hash
                              (string->symbol (string-append name "state755")))
                           (add1
                            (cdr
                             (assoc-ref
                              merged-input-state-hash
                              (string->symbol
                               (string-append name "state755")))))
                           0))))
                      (append
                       (list
                        (cons
                         (string->symbol (string-append name "state749"))
                         (cons
                          (signal-value btor1098)
                          (if (assoc-has-key?
                               merged-input-state-hash
                               (string->symbol
                                (string-append name "state749")))
                            (add1
                             (cdr
                              (assoc-ref
                               merged-input-state-hash
                               (string->symbol
                                (string-append name "state749")))))
                            0))))
                       (append
                        (list
                         (cons
                          (string->symbol (string-append name "state748"))
                          (cons
                           (signal-value btor751)
                           (if (assoc-has-key?
                                merged-input-state-hash
                                (string->symbol
                                 (string-append name "state748")))
                             (add1
                              (cdr
                               (assoc-ref
                                merged-input-state-hash
                                (string->symbol
                                 (string-append name "state748")))))
                             0))))
                        (append
                         (list
                          (cons
                           (string->symbol (string-append name "state729"))
                           (cons
                            (signal-value btor1094)
                            (if (assoc-has-key?
                                 merged-input-state-hash
                                 (string->symbol
                                  (string-append name "state729")))
                              (add1
                               (cdr
                                (assoc-ref
                                 merged-input-state-hash
                                 (string->symbol
                                  (string-append name "state729")))))
                              0))))
                         (append
                          (list
                           (cons
                            (string->symbol (string-append name "state727"))
                            (cons
                             (signal-value btor731)
                             (if (assoc-has-key?
                                  merged-input-state-hash
                                  (string->symbol
                                   (string-append name "state727")))
                               (add1
                                (cdr
                                 (assoc-ref
                                  merged-input-state-hash
                                  (string->symbol
                                   (string-append name "state727")))))
                               0))))
                          (append
                           (list
                            (cons
                             (string->symbol (string-append name "state651"))
                             (cons
                              (signal-value btor1090)
                              (if (assoc-has-key?
                                   merged-input-state-hash
                                   (string->symbol
                                    (string-append name "state651")))
                                (add1
                                 (cdr
                                  (assoc-ref
                                   merged-input-state-hash
                                   (string->symbol
                                    (string-append name "state651")))))
                                0))))
                           (append
                            (list
                             (cons
                              (string->symbol (string-append name "state650"))
                              (cons
                               (signal-value btor653)
                               (if (assoc-has-key?
                                    merged-input-state-hash
                                    (string->symbol
                                     (string-append name "state650")))
                                 (add1
                                  (cdr
                                   (assoc-ref
                                    merged-input-state-hash
                                    (string->symbol
                                     (string-append name "state650")))))
                                 0))))
                            (append
                             (list
                              (cons
                               (string->symbol (string-append name "state643"))
                               (cons
                                (signal-value btor1086)
                                (if (assoc-has-key?
                                     merged-input-state-hash
                                     (string->symbol
                                      (string-append name "state643")))
                                  (add1
                                   (cdr
                                    (assoc-ref
                                     merged-input-state-hash
                                     (string->symbol
                                      (string-append name "state643")))))
                                  0))))
                             (append
                              (list
                               (cons
                                (string->symbol
                                 (string-append name "state641"))
                                (cons
                                 (signal-value btor645)
                                 (if (assoc-has-key?
                                      merged-input-state-hash
                                      (string->symbol
                                       (string-append name "state641")))
                                   (add1
                                    (cdr
                                     (assoc-ref
                                      merged-input-state-hash
                                      (string->symbol
                                       (string-append name "state641")))))
                                   0))))
                              (append
                               (list
                                (cons
                                 (string->symbol
                                  (string-append name "state622"))
                                 (cons
                                  (signal-value btor1082)
                                  (if (assoc-has-key?
                                       merged-input-state-hash
                                       (string->symbol
                                        (string-append name "state622")))
                                    (add1
                                     (cdr
                                      (assoc-ref
                                       merged-input-state-hash
                                       (string->symbol
                                        (string-append name "state622")))))
                                    0))))
                               (append
                                (list
                                 (cons
                                  (string->symbol
                                   (string-append name "state621"))
                                  (cons
                                   (signal-value btor624)
                                   (if (assoc-has-key?
                                        merged-input-state-hash
                                        (string->symbol
                                         (string-append name "state621")))
                                     (add1
                                      (cdr
                                       (assoc-ref
                                        merged-input-state-hash
                                        (string->symbol
                                         (string-append name "state621")))))
                                     0))))
                                (append
                                 (list
                                  (cons
                                   (string->symbol
                                    (string-append name "state569"))
                                   (cons
                                    (signal-value btor1078)
                                    (if (assoc-has-key?
                                         merged-input-state-hash
                                         (string->symbol
                                          (string-append name "state569")))
                                      (add1
                                       (cdr
                                        (assoc-ref
                                         merged-input-state-hash
                                         (string->symbol
                                          (string-append name "state569")))))
                                      0))))
                                 (append
                                  (list
                                   (cons
                                    (string->symbol
                                     (string-append name "state567"))
                                    (cons
                                     (signal-value btor571)
                                     (if (assoc-has-key?
                                          merged-input-state-hash
                                          (string->symbol
                                           (string-append name "state567")))
                                       (add1
                                        (cdr
                                         (assoc-ref
                                          merged-input-state-hash
                                          (string->symbol
                                           (string-append name "state567")))))
                                       0))))
                                  (append
                                   (list
                                    (cons
                                     (string->symbol
                                      (string-append name "state452"))
                                     (cons
                                      (signal-value btor1074)
                                      (if (assoc-has-key?
                                           merged-input-state-hash
                                           (string->symbol
                                            (string-append name "state452")))
                                        (add1
                                         (cdr
                                          (assoc-ref
                                           merged-input-state-hash
                                           (string->symbol
                                            (string-append name "state452")))))
                                        0))))
                                   (append
                                    (list
                                     (cons
                                      (string->symbol
                                       (string-append name "state451"))
                                      (cons
                                       (signal-value btor454)
                                       (if (assoc-has-key?
                                            merged-input-state-hash
                                            (string->symbol
                                             (string-append name "state451")))
                                         (add1
                                          (cdr
                                           (assoc-ref
                                            merged-input-state-hash
                                            (string->symbol
                                             (string-append
                                              name
                                              "state451")))))
                                         0))))
                                    (append
                                     (list
                                      (cons
                                       (string->symbol
                                        (string-append name "state376"))
                                       (cons
                                        (signal-value btor1070)
                                        (if (assoc-has-key?
                                             merged-input-state-hash
                                             (string->symbol
                                              (string-append name "state376")))
                                          (add1
                                           (cdr
                                            (assoc-ref
                                             merged-input-state-hash
                                             (string->symbol
                                              (string-append
                                               name
                                               "state376")))))
                                          0))))
                                     (append
                                      (list
                                       (cons
                                        (string->symbol
                                         (string-append name "state375"))
                                        (cons
                                         (signal-value btor378)
                                         (if (assoc-has-key?
                                              merged-input-state-hash
                                              (string->symbol
                                               (string-append
                                                name
                                                "state375")))
                                           (add1
                                            (cdr
                                             (assoc-ref
                                              merged-input-state-hash
                                              (string->symbol
                                               (string-append
                                                name
                                                "state375")))))
                                           0))))
                                      (append
                                       (list
                                        (cons
                                         (string->symbol
                                          (string-append name "state362"))
                                         (cons
                                          (signal-value btor1065)
                                          (if (assoc-has-key?
                                               merged-input-state-hash
                                               (string->symbol
                                                (string-append
                                                 name
                                                 "state362")))
                                            (add1
                                             (cdr
                                              (assoc-ref
                                               merged-input-state-hash
                                               (string->symbol
                                                (string-append
                                                 name
                                                 "state362")))))
                                            0))))
                                       (append
                                        (list
                                         (cons
                                          (string->symbol
                                           (string-append name "state360"))
                                          (cons
                                           (signal-value btor364)
                                           (if (assoc-has-key?
                                                merged-input-state-hash
                                                (string->symbol
                                                 (string-append
                                                  name
                                                  "state360")))
                                             (add1
                                              (cdr
                                               (assoc-ref
                                                merged-input-state-hash
                                                (string->symbol
                                                 (string-append
                                                  name
                                                  "state360")))))
                                             0))))
                                        (append
                                         (list
                                          (cons
                                           (string->symbol
                                            (string-append name "state333"))
                                           (cons
                                            (signal-value btor1061)
                                            (if (assoc-has-key?
                                                 merged-input-state-hash
                                                 (string->symbol
                                                  (string-append
                                                   name
                                                   "state333")))
                                              (add1
                                               (cdr
                                                (assoc-ref
                                                 merged-input-state-hash
                                                 (string->symbol
                                                  (string-append
                                                   name
                                                   "state333")))))
                                              0))))
                                         (append
                                          (list
                                           (cons
                                            (string->symbol
                                             (string-append name "state331"))
                                            (cons
                                             (signal-value btor335)
                                             (if (assoc-has-key?
                                                  merged-input-state-hash
                                                  (string->symbol
                                                   (string-append
                                                    name
                                                    "state331")))
                                               (add1
                                                (cdr
                                                 (assoc-ref
                                                  merged-input-state-hash
                                                  (string->symbol
                                                   (string-append
                                                    name
                                                    "state331")))))
                                               0))))
                                          (append
                                           (list
                                            (cons
                                             (string->symbol
                                              (string-append name "state325"))
                                             (cons
                                              (signal-value btor1057)
                                              (if (assoc-has-key?
                                                   merged-input-state-hash
                                                   (string->symbol
                                                    (string-append
                                                     name
                                                     "state325")))
                                                (add1
                                                 (cdr
                                                  (assoc-ref
                                                   merged-input-state-hash
                                                   (string->symbol
                                                    (string-append
                                                     name
                                                     "state325")))))
                                                0))))
                                           (append
                                            (list
                                             (cons
                                              (string->symbol
                                               (string-append name "state324"))
                                              (cons
                                               (signal-value btor327)
                                               (if (assoc-has-key?
                                                    merged-input-state-hash
                                                    (string->symbol
                                                     (string-append
                                                      name
                                                      "state324")))
                                                 (add1
                                                  (cdr
                                                   (assoc-ref
                                                    merged-input-state-hash
                                                    (string->symbol
                                                     (string-append
                                                      name
                                                      "state324")))))
                                                 0))))
                                            (append
                                             (list
                                              (cons
                                               (string->symbol
                                                (string-append
                                                 name
                                                 "state188"))
                                               (cons
                                                (signal-value btor1053)
                                                (if (assoc-has-key?
                                                     merged-input-state-hash
                                                     (string->symbol
                                                      (string-append
                                                       name
                                                       "state188")))
                                                  (add1
                                                   (cdr
                                                    (assoc-ref
                                                     merged-input-state-hash
                                                     (string->symbol
                                                      (string-append
                                                       name
                                                       "state188")))))
                                                  0))))
                                             (append
                                              (list
                                               (cons
                                                (string->symbol
                                                 (string-append
                                                  name
                                                  "state187"))
                                                (cons
                                                 (signal-value btor190)
                                                 (if (assoc-has-key?
                                                      merged-input-state-hash
                                                      (string->symbol
                                                       (string-append
                                                        name
                                                        "state187")))
                                                   (add1
                                                    (cdr
                                                     (assoc-ref
                                                      merged-input-state-hash
                                                      (string->symbol
                                                       (string-append
                                                        name
                                                        "state187")))))
                                                   0))))
                                              (append
                                               (list
                                                (cons
                                                 (string->symbol
                                                  (string-append
                                                   name
                                                   "state171"))
                                                 (cons
                                                  (signal-value btor1049)
                                                  (if (assoc-has-key?
                                                       merged-input-state-hash
                                                       (string->symbol
                                                        (string-append
                                                         name
                                                         "state171")))
                                                    (add1
                                                     (cdr
                                                      (assoc-ref
                                                       merged-input-state-hash
                                                       (string->symbol
                                                        (string-append
                                                         name
                                                         "state171")))))
                                                    0))))
                                               (append
                                                (list
                                                 (cons
                                                  (string->symbol
                                                   (string-append
                                                    name
                                                    "state170"))
                                                  (cons
                                                   (signal-value btor173)
                                                   (if (assoc-has-key?
                                                        merged-input-state-hash
                                                        (string->symbol
                                                         (string-append
                                                          name
                                                          "state170")))
                                                     (add1
                                                      (cdr
                                                       (assoc-ref
                                                        merged-input-state-hash
                                                        (string->symbol
                                                         (string-append
                                                          name
                                                          "state170")))))
                                                     0))))
                                                (append
                                                 (list
                                                  (cons
                                                   (string->symbol
                                                    (string-append
                                                     name
                                                     "state156"))
                                                   (cons
                                                    (signal-value btor1045)
                                                    (if (assoc-has-key?
                                                         merged-input-state-hash
                                                         (string->symbol
                                                          (string-append
                                                           name
                                                           "state156")))
                                                      (add1
                                                       (cdr
                                                        (assoc-ref
                                                         merged-input-state-hash
                                                         (string->symbol
                                                          (string-append
                                                           name
                                                           "state156")))))
                                                      0))))
                                                 (append
                                                  (list
                                                   (cons
                                                    (string->symbol
                                                     (string-append
                                                      name
                                                      "state154"))
                                                    (cons
                                                     (signal-value btor158)
                                                     (if (assoc-has-key?
                                                          merged-input-state-hash
                                                          (string->symbol
                                                           (string-append
                                                            name
                                                            "state154")))
                                                       (add1
                                                        (cdr
                                                         (assoc-ref
                                                          merged-input-state-hash
                                                          (string->symbol
                                                           (string-append
                                                            name
                                                            "state154")))))
                                                       0))))
                                                  (append
                                                   (list
                                                    (cons
                                                     (string->symbol
                                                      (string-append
                                                       name
                                                       "state140"))
                                                     (cons
                                                      (signal-value btor1041)
                                                      (if (assoc-has-key?
                                                           merged-input-state-hash
                                                           (string->symbol
                                                            (string-append
                                                             name
                                                             "state140")))
                                                        (add1
                                                         (cdr
                                                          (assoc-ref
                                                           merged-input-state-hash
                                                           (string->symbol
                                                            (string-append
                                                             name
                                                             "state140")))))
                                                        0))))
                                                   (append
                                                    (list
                                                     (cons
                                                      (string->symbol
                                                       (string-append
                                                        name
                                                        "state139"))
                                                      (cons
                                                       (signal-value btor142)
                                                       (if (assoc-has-key?
                                                            merged-input-state-hash
                                                            (string->symbol
                                                             (string-append
                                                              name
                                                              "state139")))
                                                         (add1
                                                          (cdr
                                                           (assoc-ref
                                                            merged-input-state-hash
                                                            (string->symbol
                                                             (string-append
                                                              name
                                                              "state139")))))
                                                         0))))
                                                    (append
                                                     (list
                                                      (cons
                                                       (string->symbol
                                                        (string-append
                                                         name
                                                         "state127"))
                                                       (cons
                                                        (signal-value btor1035)
                                                        (if (assoc-has-key?
                                                             merged-input-state-hash
                                                             (string->symbol
                                                              (string-append
                                                               name
                                                               "state127")))
                                                          (add1
                                                           (cdr
                                                            (assoc-ref
                                                             merged-input-state-hash
                                                             (string->symbol
                                                              (string-append
                                                               name
                                                               "state127")))))
                                                          0))))
                                                     (append
                                                      (list
                                                       (cons
                                                        (string->symbol
                                                         (string-append
                                                          name
                                                          "state125"))
                                                        (cons
                                                         (signal-value btor129)
                                                         (if (assoc-has-key?
                                                              merged-input-state-hash
                                                              (string->symbol
                                                               (string-append
                                                                name
                                                                "state125")))
                                                           (add1
                                                            (cdr
                                                             (assoc-ref
                                                              merged-input-state-hash
                                                              (string->symbol
                                                               (string-append
                                                                name
                                                                "state125")))))
                                                           0))))
                                                      (append
                                                       (list
                                                        (cons
                                                         (string->symbol
                                                          (string-append
                                                           name
                                                           "state111"))
                                                         (cons
                                                          (signal-value
                                                           btor1027)
                                                          (if (assoc-has-key?
                                                               merged-input-state-hash
                                                               (string->symbol
                                                                (string-append
                                                                 name
                                                                 "state111")))
                                                            (add1
                                                             (cdr
                                                              (assoc-ref
                                                               merged-input-state-hash
                                                               (string->symbol
                                                                (string-append
                                                                 name
                                                                 "state111")))))
                                                            0))))
                                                       (append
                                                        (list
                                                         (cons
                                                          (string->symbol
                                                           (string-append
                                                            name
                                                            "state110"))
                                                          (cons
                                                           (signal-value
                                                            btor113)
                                                           (if (assoc-has-key?
                                                                merged-input-state-hash
                                                                (string->symbol
                                                                 (string-append
                                                                  name
                                                                  "state110")))
                                                             (add1
                                                              (cdr
                                                               (assoc-ref
                                                                merged-input-state-hash
                                                                (string->symbol
                                                                 (string-append
                                                                  name
                                                                  "state110")))))
                                                             0))))
                                                        (append
                                                         (list
                                                          (cons
                                                           (string->symbol
                                                            (string-append
                                                             name
                                                             "state92"))
                                                           (cons
                                                            (signal-value
                                                             btor91)
                                                            (if (assoc-has-key?
                                                                 merged-input-state-hash
                                                                 (string->symbol
                                                                  (string-append
                                                                   name
                                                                   "state92")))
                                                              (add1
                                                               (cdr
                                                                (assoc-ref
                                                                 merged-input-state-hash
                                                                 (string->symbol
                                                                  (string-append
                                                                   name
                                                                   "state92")))))
                                                              0))))
                                                         (append
                                                          (list
                                                           (cons
                                                            (string->symbol
                                                             (string-append
                                                              name
                                                              "state89"))
                                                            (cons
                                                             (signal-value
                                                              btor1020)
                                                             (if (assoc-has-key?
                                                                  merged-input-state-hash
                                                                  (string->symbol
                                                                   (string-append
                                                                    name
                                                                    "state89")))
                                                               (add1
                                                                (cdr
                                                                 (assoc-ref
                                                                  merged-input-state-hash
                                                                  (string->symbol
                                                                   (string-append
                                                                    name
                                                                    "state89")))))
                                                               0))))
                                                          (append
                                                           (list
                                                            (cons
                                                             (string->symbol
                                                              (string-append
                                                               name
                                                               "state87"))
                                                             (cons
                                                              (signal-value
                                                               btor98)
                                                              (if (assoc-has-key?
                                                                   merged-input-state-hash
                                                                   (string->symbol
                                                                    (string-append
                                                                     name
                                                                     "state87")))
                                                                (add1
                                                                 (cdr
                                                                  (assoc-ref
                                                                   merged-input-state-hash
                                                                   (string->symbol
                                                                    (string-append
                                                                     name
                                                                     "state87")))))
                                                                0))))
                                                           (list))))))))))))))))))))))))))))))))))))))))))))))
              merged-input-state-hash)
             equal?
             #:key
             car)))
      (list
       (cons 'PCOUT (signal (signal-value btor787) output-state))
       (cons 'PATTERNBDETECT (signal (signal-value btor819) output-state))
       (cons 'CARRYCASCOUT (signal (signal-value btor696) output-state))
       (cons 'P (signal (signal-value btor787) output-state))
       (cons 'CARRYOUT (signal (signal-value btor743) output-state))
       (cons 'UNDERFLOW (signal (signal-value btor833) output-state))
       (cons 'BCOUT (signal (signal-value btor146) output-state))
       (cons 'MULTSIGNOUT (signal (signal-value btor753) output-state))
       (cons 'OVERFLOW (signal (signal-value btor775) output-state))
       (cons 'ACOUT (signal (signal-value btor117) output-state))
       (cons 'PATTERNDETECT (signal (signal-value btor824) output-state))))))
