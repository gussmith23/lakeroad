#lang racket/base
(provide xilinx-virtex-dsp48e1)
(require "../signal.rkt")
(require rosette)
(define xilinx-virtex-dsp48e1
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
      #:unnamed-input-650
      (unnamed-input-650
       (bv->signal (constant 'unnamed-input-650 (bitvector 1))))
      #:name
      (name ""))
    (let* ((merged-input-state-hash (list))
           (init-hash
            (append
             (list
              (cons
               (string->symbol (string-append name "state995"))
               (bv 0 (bitvector 1))))
             (append
              (list
               (cons
                (string->symbol (string-append name "state864"))
                (bv 0 (bitvector 1))))
              (append
               (list
                (cons
                 (string->symbol (string-append name "state838"))
                 (bv 0 (bitvector 1))))
               (append
                (list
                 (cons
                  (string->symbol (string-append name "state836"))
                  (bv 0 (bitvector 48))))
                (append
                 (list
                  (cons
                   (string->symbol (string-append name "state834"))
                   (bv 0 (bitvector 48))))
                 (append
                  (list
                   (cons
                    (string->symbol (string-append name "state786"))
                    (bv 0 (bitvector 1))))
                  (append
                   (list
                    (cons
                     (string->symbol (string-append name "state780"))
                     (bv 0 (bitvector 1))))
                   (append
                    (list
                     (cons
                      (string->symbol (string-append name "state776"))
                      (bv 0 (bitvector 1))))
                    (append
                     (list
                      (cons
                       (string->symbol (string-append name "state769"))
                       (bv 0 (bitvector 1))))
                     (append
                      (list
                       (cons
                        (string->symbol (string-append name "state749"))
                        (bv 0 (bitvector 4))))
                      (append
                       (list
                        (cons
                         (string->symbol (string-append name "state747"))
                         (bv 0 (bitvector 4))))
                       (append
                        (list
                         (cons
                          (string->symbol (string-append name "state671"))
                          (bv 0 (bitvector 1))))
                        (append
                         (list
                          (cons
                           (string->symbol (string-append name "state663"))
                           (bv 0 (bitvector 1))))
                         (append
                          (list
                           (cons
                            (string->symbol (string-append name "state661"))
                            (bv 0 (bitvector 1))))
                          (append
                           (list
                            (cons
                             (string->symbol (string-append name "state599"))
                             (bv 0 (bitvector 1))))
                           (append
                            (list
                             (cons
                              (string->symbol (string-append name "state597"))
                              (bv 0 (bitvector 4))))
                            (append
                             (list
                              (cons
                               (string->symbol (string-append name "state589"))
                               (bv 0 (bitvector 4))))
                             (append
                              (list
                               (cons
                                (string->symbol
                                 (string-append name "state473"))
                                (bv 0 (bitvector 48))))
                              (append
                               (list
                                (cons
                                 (string->symbol
                                  (string-append name "state397"))
                                 (bv 0 (bitvector 48))))
                               (append
                                (list
                                 (cons
                                  (string->symbol
                                   (string-append name "state382"))
                                  (bv 0 (bitvector 1))))
                                (append
                                 (list
                                  (cons
                                   (string->symbol
                                    (string-append name "state380"))
                                   (bv 0 (bitvector 7))))
                                 (append
                                  (list
                                   (cons
                                    (string->symbol
                                     (string-append name "state372"))
                                    (bv 0 (bitvector 7))))
                                  (append
                                   (list
                                    (cons
                                     (string->symbol
                                      (string-append name "state343"))
                                     (bv 0 (bitvector 1))))
                                   (append
                                    (list
                                     (cons
                                      (string->symbol
                                       (string-append name "state340"))
                                      (bv 0 (bitvector 3))))
                                    (append
                                     (list
                                      (cons
                                       (string->symbol
                                        (string-append name "state333"))
                                       (bv 0 (bitvector 3))))
                                     (append
                                      (list
                                       (cons
                                        (string->symbol
                                         (string-append name "state325"))
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
                                                 (string-append
                                                  name
                                                  "state89"))
                                                (bv 0 (bitvector 30))))
                                              (list))))))))))))))))))))))))))))))))))))
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
            (signal
             (apply bvor (bitvector->bits (signal-value btor28)))
             (signal-state btor28)))
           (btor337 (signal (bvnot (signal-value btor336)) (list)))
           (btor338
            (if (bitvector->bool (signal-value btor337)) btor27 btor335))
           (btor339
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state339")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state339"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state339")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state339")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 3))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor340
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state340")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state340"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state340")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state340")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 3))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor342 (bv->signal (bv 0 (bitvector 1))))
           (btor343
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state343")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state343"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state343")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state343")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor345
            (if (bitvector->bool (signal-value btor343)) btor340 btor339))
           (btor346 (signal (bvnot (signal-value btor337)) (list)))
           (btor347
            (bv->signal
             (sign-extend (signal-value btor99) (bitvector 32))
             btor99))
           (btor348
            (signal
             (bool->bitvector
              (bveq (signal-value btor28) (signal-value btor347)))
             (list)))
           (btor349 (signal (bvnot (signal-value btor348)) (list)))
           (btor350
            (signal
             (bvand (signal-value btor346) (signal-value btor349))
             (list)))
           (btor351
            (signal
             (bvand (signal-value btor346) (signal-value btor350))
             (list)))
           (btor352
            (if (bitvector->bool (signal-value btor351)) btor345 btor338))
           (btor353
            (bv->signal
             (zero-extend (signal-value btor312) (bitvector 3))
             btor312))
           (btor354
            (signal
             (bool->bitvector
              (bveq (signal-value btor352) (signal-value btor353)))
             (list)))
           (btor355
            (if (bitvector->bool (signal-value btor354)) btor311 btor330))
           (btor356
            (signal
             (extract 42 42 (signal-value btor355))
             (signal-state btor355)))
           (btor357 (bitvector 44))
           (btor358
            (signal
             (concat (signal-value btor356) (signal-value btor355))
             (list)))
           (btor359
            (signal
             (extract 42 42 (signal-value btor355))
             (signal-state btor355)))
           (btor360 (bitvector 45))
           (btor361
            (signal
             (concat (signal-value btor359) (signal-value btor358))
             (list)))
           (btor362
            (signal
             (extract 42 42 (signal-value btor355))
             (signal-state btor355)))
           (btor363 (bitvector 46))
           (btor364
            (signal
             (concat (signal-value btor362) (signal-value btor361))
             (list)))
           (btor365
            (signal
             (extract 42 42 (signal-value btor355))
             (signal-state btor355)))
           (btor366 (bitvector 47))
           (btor367
            (signal
             (concat (signal-value btor365) (signal-value btor364))
             (list)))
           (btor368
            (signal
             (extract 42 42 (signal-value btor355))
             (signal-state btor355)))
           (btor369
            (signal
             (concat (signal-value btor368) (signal-value btor367))
             (list)))
           (btor370
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state370")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state370"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state370")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state370")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 7))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor371 (bv->signal (bv 0 (bitvector 7))))
           (btor372
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state372")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state372"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state372")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state372")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 7))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor374
            (if (bitvector->bool (signal-value btor97)) btor372 btor370))
           (btor375
            (signal
             (bvxor (signal-value btor58) (signal-value btor54))
             (list)))
           (btor376
            (signal
             (apply bvor (bitvector->bits (signal-value btor59)))
             (signal-state btor59)))
           (btor377 (signal (bvnot (signal-value btor376)) (list)))
           (btor378
            (if (bitvector->bool (signal-value btor377)) btor375 btor374))
           (btor379
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state379")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state379"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state379")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state379")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 7))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor380
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state380")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state380"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state380")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state380")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 7))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor382
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state382")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state382"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state382")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state382")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor384
            (if (bitvector->bool (signal-value btor382)) btor380 btor379))
           (btor385 (signal (bvnot (signal-value btor377)) (list)))
           (btor386
            (bv->signal
             (sign-extend (signal-value btor99) (bitvector 32))
             btor99))
           (btor387
            (signal
             (bool->bitvector
              (bveq (signal-value btor59) (signal-value btor386)))
             (list)))
           (btor388 (signal (bvnot (signal-value btor387)) (list)))
           (btor389
            (signal
             (bvand (signal-value btor385) (signal-value btor388))
             (list)))
           (btor390
            (signal
             (bvand (signal-value btor385) (signal-value btor389))
             (list)))
           (btor391
            (if (bitvector->bool (signal-value btor390)) btor384 btor378))
           (btor392
            (signal
             (extract 1 0 (signal-value btor391))
             (signal-state btor391)))
           (btor393
            (bv->signal
             (zero-extend (signal-value btor83) (bitvector 2))
             btor83))
           (btor394
            (signal
             (bool->bitvector
              (bveq (signal-value btor392) (signal-value btor393)))
             (list)))
           (btor395
            (if (bitvector->bool (signal-value btor394)) btor369 btor149))
           (btor396
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state396")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state396"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state396")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state396")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 48))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor397
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state397")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state397"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state397")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state397")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 48))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor399
            (if (bitvector->bool (signal-value btor97)) btor397 btor396))
           (btor400
            (signal
             (concat (signal-value btor109) (signal-value btor138))
             (list)))
           (btor401 (bv->signal (bv 3 (bitvector 2))))
           (btor402
            (signal
             (bool->bitvector
              (bveq (signal-value btor392) (signal-value btor401)))
             (list)))
           (btor403
            (if (bitvector->bool (signal-value btor402)) btor400 btor399))
           (btor404
            (signal
             (bool->bitvector
              (bveq (signal-value btor392) (signal-value btor312)))
             (list)))
           (btor405
            (signal
             (bvor (signal-value btor404) (signal-value btor402))
             (list)))
           (btor406
            (if (bitvector->bool (signal-value btor405)) btor403 btor395))
           (btor407 (bv->signal (bv 281474976710655 (bitvector 48))))
           (btor408
            (signal
             (concat (signal-value btor57) (signal-value btor57))
             (list)))
           (btor409
            (signal
             (concat (signal-value btor57) (signal-value btor408))
             (list)))
           (btor410
            (signal
             (concat (signal-value btor57) (signal-value btor409))
             (list)))
           (btor411
            (signal
             (concat (signal-value btor57) (signal-value btor410))
             (list)))
           (btor412 (bitvector 6))
           (btor413
            (signal
             (concat (signal-value btor57) (signal-value btor411))
             (list)))
           (btor414
            (signal
             (concat (signal-value btor57) (signal-value btor413))
             (list)))
           (btor415 (bitvector 8))
           (btor416
            (signal
             (concat (signal-value btor57) (signal-value btor414))
             (list)))
           (btor417 (bitvector 9))
           (btor418
            (signal
             (concat (signal-value btor57) (signal-value btor416))
             (list)))
           (btor419 (bitvector 10))
           (btor420
            (signal
             (concat (signal-value btor57) (signal-value btor418))
             (list)))
           (btor421 (bitvector 11))
           (btor422
            (signal
             (concat (signal-value btor57) (signal-value btor420))
             (list)))
           (btor423 (bitvector 12))
           (btor424
            (signal
             (concat (signal-value btor57) (signal-value btor422))
             (list)))
           (btor425
            (signal
             (concat (signal-value btor57) (signal-value btor424))
             (list)))
           (btor426 (bitvector 14))
           (btor427
            (signal
             (concat (signal-value btor57) (signal-value btor425))
             (list)))
           (btor428 (bitvector 15))
           (btor429
            (signal
             (concat (signal-value btor57) (signal-value btor427))
             (list)))
           (btor430 (bitvector 16))
           (btor431
            (signal
             (concat (signal-value btor57) (signal-value btor429))
             (list)))
           (btor432 (bitvector 17))
           (btor433
            (signal
             (concat (signal-value btor57) (signal-value btor431))
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
             (concat (signal-value btor57) (signal-value btor443))
             (list)))
           (btor445
            (signal
             (concat (signal-value btor57) (signal-value btor444))
             (list)))
           (btor446
            (signal
             (concat (signal-value btor57) (signal-value btor445))
             (list)))
           (btor447
            (signal
             (concat (signal-value btor57) (signal-value btor446))
             (list)))
           (btor448
            (signal
             (concat (signal-value btor57) (signal-value btor447))
             (list)))
           (btor449
            (signal
             (concat (signal-value btor57) (signal-value btor448))
             (list)))
           (btor450
            (signal
             (concat (signal-value btor57) (signal-value btor449))
             (list)))
           (btor451
            (signal
             (concat (signal-value btor57) (signal-value btor450))
             (list)))
           (btor452
            (signal
             (concat (signal-value btor57) (signal-value btor451))
             (list)))
           (btor453
            (signal
             (concat (signal-value btor57) (signal-value btor452))
             (list)))
           (btor454
            (signal
             (concat (signal-value btor57) (signal-value btor453))
             (list)))
           (btor455
            (signal
             (concat (signal-value btor57) (signal-value btor454))
             (list)))
           (btor456
            (signal
             (concat (signal-value btor57) (signal-value btor455))
             (list)))
           (btor457
            (signal
             (concat (signal-value btor57) (signal-value btor456))
             (list)))
           (btor458
            (signal
             (concat (signal-value btor57) (signal-value btor457))
             (list)))
           (btor459
            (signal
             (concat (signal-value btor57) (signal-value btor458))
             (list)))
           (btor460
            (signal
             (concat (signal-value btor57) (signal-value btor459))
             (list)))
           (btor461
            (signal
             (concat (signal-value btor57) (signal-value btor460))
             (list)))
           (btor462
            (signal
             (concat (signal-value btor57) (signal-value btor461))
             (list)))
           (btor463
            (signal
             (concat (signal-value btor57) (signal-value btor462))
             (list)))
           (btor464
            (signal
             (concat (signal-value btor57) (signal-value btor463))
             (list)))
           (btor465
            (signal
             (extract 6 4 (signal-value btor391))
             (signal-state btor391)))
           (btor466 (bv->signal (bv 4 (bitvector 3))))
           (btor467
            (signal
             (bool->bitvector
              (bveq (signal-value btor465) (signal-value btor466)))
             (list)))
           (btor468
            (if (bitvector->bool (signal-value btor467)) btor464 btor407))
           (btor469
            (signal
             (extract 3 2 (signal-value btor391))
             (signal-state btor391)))
           (btor470
            (signal
             (bool->bitvector
              (bveq (signal-value btor469) (signal-value btor312)))
             (list)))
           (btor471
            (if (bitvector->bool (signal-value btor470)) btor468 btor149))
           (btor472
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state472")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state472"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state472")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state472")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 48))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor473
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state473")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state473"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state473")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state473")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 48))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor475
            (if (bitvector->bool (signal-value btor97)) btor473 btor472))
           (btor476
            (bv->signal
             (sign-extend (signal-value btor99) (bitvector 32))
             btor99))
           (btor477
            (signal
             (bool->bitvector
              (bveq (signal-value btor43) (signal-value btor476)))
             (list)))
           (btor478
            (if (bitvector->bool (signal-value btor477)) btor475 btor21))
           (btor479
            (signal
             (apply bvor (bitvector->bits (signal-value btor43)))
             (signal-state btor43)))
           (btor480 (signal (bvnot (signal-value btor479)) (list)))
           (btor481
            (if (bitvector->bool (signal-value btor480)) btor21 btor478))
           (btor482
            (signal
             (bool->bitvector
              (bveq (signal-value btor469) (signal-value btor401)))
             (list)))
           (btor483
            (if (bitvector->bool (signal-value btor482)) btor481 btor471))
           (btor484
            (signal
             (bvand (signal-value btor406) (signal-value btor483))
             (list)))
           (btor485
            (bv->signal
             (zero-extend (signal-value btor83) (bitvector 3))
             btor83))
           (btor486
            (signal
             (bool->bitvector
              (bveq (signal-value btor465) (signal-value btor485)))
             (list)))
           (btor487
            (if (bitvector->bool (signal-value btor486)) btor61 btor149))
           (btor488
            (bv->signal
             (zero-extend (signal-value btor401) (bitvector 3))
             btor401))
           (btor489
            (signal
             (bool->bitvector
              (bveq (signal-value btor465) (signal-value btor488)))
             (list)))
           (btor490
            (if (bitvector->bool (signal-value btor489)) btor481 btor487))
           (btor491
            (signal
             (extract 47 17 (signal-value btor61))
             (signal-state btor61)))
           (btor492
            (signal
             (extract 47 47 (signal-value btor61))
             (signal-state btor61)))
           (btor493
            (signal
             (concat (signal-value btor492) (signal-value btor491))
             (list)))
           (btor494
            (signal
             (extract 47 47 (signal-value btor61))
             (signal-state btor61)))
           (btor495
            (signal
             (concat (signal-value btor494) (signal-value btor493))
             (list)))
           (btor496
            (signal
             (extract 47 47 (signal-value btor61))
             (signal-state btor61)))
           (btor497
            (signal
             (concat (signal-value btor496) (signal-value btor495))
             (list)))
           (btor498
            (signal
             (extract 47 47 (signal-value btor61))
             (signal-state btor61)))
           (btor499
            (signal
             (concat (signal-value btor498) (signal-value btor497))
             (list)))
           (btor500
            (signal
             (extract 47 47 (signal-value btor61))
             (signal-state btor61)))
           (btor501
            (signal
             (concat (signal-value btor500) (signal-value btor499))
             (list)))
           (btor502
            (signal
             (extract 47 47 (signal-value btor61))
             (signal-state btor61)))
           (btor503
            (signal
             (concat (signal-value btor502) (signal-value btor501))
             (list)))
           (btor504
            (signal
             (extract 47 47 (signal-value btor61))
             (signal-state btor61)))
           (btor505
            (signal
             (concat (signal-value btor504) (signal-value btor503))
             (list)))
           (btor506
            (signal
             (extract 47 47 (signal-value btor61))
             (signal-state btor61)))
           (btor507
            (signal
             (concat (signal-value btor506) (signal-value btor505))
             (list)))
           (btor508
            (signal
             (extract 47 47 (signal-value btor61))
             (signal-state btor61)))
           (btor509
            (signal
             (concat (signal-value btor508) (signal-value btor507))
             (list)))
           (btor510
            (signal
             (extract 47 47 (signal-value btor61))
             (signal-state btor61)))
           (btor511
            (signal
             (concat (signal-value btor510) (signal-value btor509))
             (list)))
           (btor512
            (signal
             (extract 47 47 (signal-value btor61))
             (signal-state btor61)))
           (btor513
            (signal
             (concat (signal-value btor512) (signal-value btor511))
             (list)))
           (btor514
            (signal
             (extract 47 47 (signal-value btor61))
             (signal-state btor61)))
           (btor515
            (signal
             (concat (signal-value btor514) (signal-value btor513))
             (list)))
           (btor516
            (signal
             (extract 47 47 (signal-value btor61))
             (signal-state btor61)))
           (btor517
            (signal
             (concat (signal-value btor516) (signal-value btor515))
             (list)))
           (btor518
            (signal
             (extract 47 47 (signal-value btor61))
             (signal-state btor61)))
           (btor519
            (signal
             (concat (signal-value btor518) (signal-value btor517))
             (list)))
           (btor520
            (signal
             (extract 47 47 (signal-value btor61))
             (signal-state btor61)))
           (btor521
            (signal
             (concat (signal-value btor520) (signal-value btor519))
             (list)))
           (btor522
            (signal
             (extract 47 47 (signal-value btor61))
             (signal-state btor61)))
           (btor523
            (signal
             (concat (signal-value btor522) (signal-value btor521))
             (list)))
           (btor524
            (signal
             (extract 47 47 (signal-value btor61))
             (signal-state btor61)))
           (btor525
            (signal
             (concat (signal-value btor524) (signal-value btor523))
             (list)))
           (btor526 (bv->signal (bv 5 (bitvector 3))))
           (btor527
            (signal
             (bool->bitvector
              (bveq (signal-value btor465) (signal-value btor526)))
             (list)))
           (btor528
            (if (bitvector->bool (signal-value btor527)) btor525 btor399))
           (btor529
            (signal
             (extract 47 17 (signal-value btor399))
             (signal-state btor399)))
           (btor530
            (signal
             (extract 47 47 (signal-value btor399))
             (signal-state btor399)))
           (btor531
            (signal
             (concat (signal-value btor530) (signal-value btor529))
             (list)))
           (btor532
            (signal
             (extract 47 47 (signal-value btor399))
             (signal-state btor399)))
           (btor533
            (signal
             (concat (signal-value btor532) (signal-value btor531))
             (list)))
           (btor534
            (signal
             (extract 47 47 (signal-value btor399))
             (signal-state btor399)))
           (btor535
            (signal
             (concat (signal-value btor534) (signal-value btor533))
             (list)))
           (btor536
            (signal
             (extract 47 47 (signal-value btor399))
             (signal-state btor399)))
           (btor537
            (signal
             (concat (signal-value btor536) (signal-value btor535))
             (list)))
           (btor538
            (signal
             (extract 47 47 (signal-value btor399))
             (signal-state btor399)))
           (btor539
            (signal
             (concat (signal-value btor538) (signal-value btor537))
             (list)))
           (btor540
            (signal
             (extract 47 47 (signal-value btor399))
             (signal-state btor399)))
           (btor541
            (signal
             (concat (signal-value btor540) (signal-value btor539))
             (list)))
           (btor542
            (signal
             (extract 47 47 (signal-value btor399))
             (signal-state btor399)))
           (btor543
            (signal
             (concat (signal-value btor542) (signal-value btor541))
             (list)))
           (btor544
            (signal
             (extract 47 47 (signal-value btor399))
             (signal-state btor399)))
           (btor545
            (signal
             (concat (signal-value btor544) (signal-value btor543))
             (list)))
           (btor546
            (signal
             (extract 47 47 (signal-value btor399))
             (signal-state btor399)))
           (btor547
            (signal
             (concat (signal-value btor546) (signal-value btor545))
             (list)))
           (btor548
            (signal
             (extract 47 47 (signal-value btor399))
             (signal-state btor399)))
           (btor549
            (signal
             (concat (signal-value btor548) (signal-value btor547))
             (list)))
           (btor550
            (signal
             (extract 47 47 (signal-value btor399))
             (signal-state btor399)))
           (btor551
            (signal
             (concat (signal-value btor550) (signal-value btor549))
             (list)))
           (btor552
            (signal
             (extract 47 47 (signal-value btor399))
             (signal-state btor399)))
           (btor553
            (signal
             (concat (signal-value btor552) (signal-value btor551))
             (list)))
           (btor554
            (signal
             (extract 47 47 (signal-value btor399))
             (signal-state btor399)))
           (btor555
            (signal
             (concat (signal-value btor554) (signal-value btor553))
             (list)))
           (btor556
            (signal
             (extract 47 47 (signal-value btor399))
             (signal-state btor399)))
           (btor557
            (signal
             (concat (signal-value btor556) (signal-value btor555))
             (list)))
           (btor558
            (signal
             (extract 47 47 (signal-value btor399))
             (signal-state btor399)))
           (btor559
            (signal
             (concat (signal-value btor558) (signal-value btor557))
             (list)))
           (btor560
            (signal
             (extract 47 47 (signal-value btor399))
             (signal-state btor399)))
           (btor561
            (signal
             (concat (signal-value btor560) (signal-value btor559))
             (list)))
           (btor562
            (signal
             (extract 47 47 (signal-value btor399))
             (signal-state btor399)))
           (btor563
            (signal
             (concat (signal-value btor562) (signal-value btor561))
             (list)))
           (btor564
            (signal
             (bool->bitvector
              (bveq (signal-value btor465) (signal-value btor319)))
             (list)))
           (btor565 (bv->signal (bv 6 (bitvector 3))))
           (btor566
            (signal
             (bool->bitvector
              (bveq (signal-value btor465) (signal-value btor565)))
             (list)))
           (btor567
            (signal
             (concat (signal-value btor566) (signal-value btor564))
             (list)))
           (btor568
            (signal
             (apply bvor (bitvector->bits (signal-value btor567)))
             (signal-state btor567)))
           (btor569
            (if (bitvector->bool (signal-value btor568)) btor563 btor528))
           (btor570
            (bv->signal
             (zero-extend (signal-value btor312) (bitvector 3))
             btor312))
           (btor571
            (signal
             (bool->bitvector
              (bveq (signal-value btor465) (signal-value btor570)))
             (list)))
           (btor572
            (signal
             (concat (signal-value btor564) (signal-value btor467))
             (list)))
           (btor573
            (signal
             (concat (signal-value btor566) (signal-value btor572))
             (list)))
           (btor574
            (signal
             (concat (signal-value btor527) (signal-value btor573))
             (list)))
           (btor575
            (signal
             (concat (signal-value btor571) (signal-value btor574))
             (list)))
           (btor576
            (signal
             (apply bvor (bitvector->bits (signal-value btor575)))
             (signal-state btor575)))
           (btor577
            (if (bitvector->bool (signal-value btor576)) btor569 btor490))
           (btor578
            (signal
             (bvand (signal-value btor577) (signal-value btor483))
             (list)))
           (btor579
            (signal
             (bvor (signal-value btor484) (signal-value btor578))
             (list)))
           (btor580
            (signal
             (bvand (signal-value btor406) (signal-value btor577))
             (list)))
           (btor581
            (signal
             (bvor (signal-value btor579) (signal-value btor580))
             (list)))
           (btor582 (signal (bvnot (signal-value btor577)) (list)))
           (btor583
            (signal
             (bvand (signal-value btor582) (signal-value btor483))
             (list)))
           (btor584
            (signal
             (bvor (signal-value btor484) (signal-value btor583))
             (list)))
           (btor585
            (signal
             (bvand (signal-value btor406) (signal-value btor582))
             (list)))
           (btor586
            (signal
             (bvor (signal-value btor584) (signal-value btor585))
             (list)))
           (btor587
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state587")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state587"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state587")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state587")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 4))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor588 (bv->signal (bv 0 (bitvector 4))))
           (btor589
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state589")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state589"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state589")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state589")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 4))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor591
            (if (bitvector->bool (signal-value btor97)) btor589 btor587))
           (btor592
            (signal (bvxor (signal-value btor8) (signal-value btor49)) (list)))
           (btor593
            (signal
             (apply bvor (bitvector->bits (signal-value btor9)))
             (signal-state btor9)))
           (btor594 (signal (bvnot (signal-value btor593)) (list)))
           (btor595
            (if (bitvector->bool (signal-value btor594)) btor592 btor591))
           (btor596
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state596")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state596"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state596")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state596")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 4))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor597
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state597")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state597"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state597")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state597")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 4))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor599
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state599")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state599"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state599")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state599")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor601
            (if (bitvector->bool (signal-value btor599)) btor597 btor596))
           (btor602 (signal (bvnot (signal-value btor594)) (list)))
           (btor603
            (bv->signal
             (sign-extend (signal-value btor99) (bitvector 32))
             btor99))
           (btor604
            (signal
             (bool->bitvector
              (bveq (signal-value btor9) (signal-value btor603)))
             (list)))
           (btor605 (signal (bvnot (signal-value btor604)) (list)))
           (btor606
            (signal
             (bvand (signal-value btor602) (signal-value btor605))
             (list)))
           (btor607
            (signal
             (bvand (signal-value btor602) (signal-value btor606))
             (list)))
           (btor608
            (if (bitvector->bool (signal-value btor607)) btor601 btor595))
           (btor609
            (signal
             (extract 0 0 (signal-value btor608))
             (signal-state btor608)))
           (btor610
            (if (bitvector->bool (signal-value btor609)) btor586 btor581))
           (btor611
            (signal
             (extract 2 2 (signal-value btor608))
             (signal-state btor608)))
           (btor612
            (if (bitvector->bool (signal-value btor611)) btor149 btor610))
           (btor613
            (signal
             (extract 35 35 (signal-value btor612))
             (signal-state btor612)))
           (btor614 (bv->signal (bv 13 (bitvector 4))))
           (btor615
            (bv->signal
             (zero-extend (signal-value btor614) (bitvector 5))
             btor614))
           (btor616
            (signal
             (bool->bitvector
              (bveq (signal-value btor78) (signal-value btor615)))
             (list)))
           (btor617
            (if (bitvector->bool (signal-value btor616)) btor342 btor613))
           (btor618
            (signal
             (extract 47 36 (signal-value btor612))
             (signal-state btor612)))
           (btor619
            (signal
             (concat (signal-value btor618) (signal-value btor617))
             (list)))
           (btor620
            (signal
             (bvxor (signal-value btor577) (signal-value btor406))
             (list)))
           (btor621
            (signal
             (bvxor (signal-value btor620) (signal-value btor483))
             (list)))
           (btor622
            (signal
             (bvxor (signal-value btor582) (signal-value btor406))
             (list)))
           (btor623
            (signal
             (bvxor (signal-value btor622) (signal-value btor483))
             (list)))
           (btor624
            (if (bitvector->bool (signal-value btor609)) btor623 btor621))
           (btor625
            (signal
             (extract 3 3 (signal-value btor608))
             (signal-state btor608)))
           (btor626
            (if (bitvector->bool (signal-value btor625)) btor610 btor624))
           (btor627
            (signal
             (extract 47 36 (signal-value btor626))
             (signal-state btor626)))
           (btor628
            (bv->signal
             (zero-extend (signal-value btor627) (bitvector 13))
             btor627))
           (btor629
            (signal
             (bvadd (signal-value btor619) (signal-value btor628))
             (list)))
           (btor630
            (signal
             (extract 23 23 (signal-value btor612))
             (signal-state btor612)))
           (btor631 (bv->signal (bv 12 (bitvector 4))))
           (btor632
            (bv->signal
             (zero-extend (signal-value btor631) (bitvector 5))
             btor631))
           (btor633
            (signal
             (bool->bitvector
              (bveq (signal-value btor78) (signal-value btor632)))
             (list)))
           (btor634
            (signal
             (bvor (signal-value btor633) (signal-value btor616))
             (list)))
           (btor635
            (if (bitvector->bool (signal-value btor634)) btor342 btor630))
           (btor636
            (signal
             (extract 34 24 (signal-value btor612))
             (signal-state btor612)))
           (btor637
            (signal
             (concat (signal-value btor636) (signal-value btor635))
             (list)))
           (btor638
            (bv->signal
             (zero-extend (signal-value btor637) (bitvector 13))
             btor637))
           (btor639
            (signal
             (extract 35 24 (signal-value btor626))
             (signal-state btor626)))
           (btor640
            (bv->signal
             (zero-extend (signal-value btor639) (bitvector 13))
             btor639))
           (btor641
            (signal
             (bvadd (signal-value btor638) (signal-value btor640))
             (list)))
           (btor642
            (signal
             (extract 11 11 (signal-value btor612))
             (signal-state btor612)))
           (btor643
            (if (bitvector->bool (signal-value btor616)) btor342 btor642))
           (btor644
            (signal
             (extract 22 12 (signal-value btor612))
             (signal-state btor612)))
           (btor645
            (signal
             (concat (signal-value btor644) (signal-value btor643))
             (list)))
           (btor646
            (bv->signal
             (zero-extend (signal-value btor645) (bitvector 13))
             btor645))
           (btor647
            (signal
             (extract 23 12 (signal-value btor626))
             (signal-state btor626)))
           (btor648
            (bv->signal
             (zero-extend (signal-value btor647) (bitvector 13))
             btor647))
           (btor649
            (signal
             (bvadd (signal-value btor646) (signal-value btor648))
             (list)))
           (btor650 unnamed-input-650)
           (btor651
            (signal
             (extract 47 47 (signal-value btor61))
             (signal-state btor61)))
           (btor652 (signal (bvnot (signal-value btor651)) (list)))
           (btor653
            (bv->signal
             (zero-extend (signal-value btor83) (bitvector 3))
             btor83))
           (btor654
            (signal
             (bool->bitvector
              (bveq (signal-value btor352) (signal-value btor653)))
             (list)))
           (btor655
            (if (bitvector->bool (signal-value btor654)) btor652 btor650))
           (btor656
            (bv->signal
             (zero-extend (signal-value btor401) (bitvector 3))
             btor401))
           (btor657
            (signal
             (bool->bitvector
              (bveq (signal-value btor352) (signal-value btor656)))
             (list)))
           (btor658
            (if (bitvector->bool (signal-value btor657)) btor651 btor23))
           (btor659
            (signal
             (bvor (signal-value btor354) (signal-value btor657))
             (list)))
           (btor660
            (if (bitvector->bool (signal-value btor659)) btor658 btor655))
           (btor661
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state661")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state661"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state661")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state661")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor663
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state663")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state663"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state663")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state663")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor665
            (if (bitvector->bool (signal-value btor97)) btor663 btor661))
           (btor666
            (signal
             (extract 47 47 (signal-value btor399))
             (signal-state btor399)))
           (btor667 (signal (bvnot (signal-value btor666)) (list)))
           (btor668
            (signal
             (bool->bitvector
              (bveq (signal-value btor352) (signal-value btor526)))
             (list)))
           (btor669
            (if (bitvector->bool (signal-value btor668)) btor667 btor665))
           (btor670
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state670")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state670"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state670")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state670")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor671
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state671")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state671"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state671")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state671")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor673
            (if (bitvector->bool (signal-value btor97)) btor671 btor670))
           (btor674
            (signal
             (extract 24 24 (signal-value btor200))
             (signal-state btor200)))
           (btor675
            (signal
             (extract 17 17 (signal-value btor253))
             (signal-state btor253)))
           (btor676
            (signal
             ((lambda (a b) (bvnot (bvxor a b)))
              (signal-value btor674)
              (signal-value btor675))
             (list)))
           (btor677
            (signal
             (apply bvor (bitvector->bits (signal-value btor56)))
             (signal-state btor56)))
           (btor678 (signal (bvnot (signal-value btor677)) (list)))
           (btor679
            (if (bitvector->bool (signal-value btor678)) btor676 btor673))
           (btor680
            (signal
             (bool->bitvector
              (bveq (signal-value btor352) (signal-value btor319)))
             (list)))
           (btor681
            (if (bitvector->bool (signal-value btor680)) btor666 btor679))
           (btor682
            (signal
             (bool->bitvector
              (bveq (signal-value btor352) (signal-value btor565)))
             (list)))
           (btor683
            (signal
             (bvor (signal-value btor682) (signal-value btor680))
             (list)))
           (btor684
            (if (bitvector->bool (signal-value btor683)) btor681 btor669))
           (btor685
            (signal
             (bool->bitvector
              (bveq (signal-value btor352) (signal-value btor466)))
             (list)))
           (btor686
            (signal
             (concat (signal-value btor668) (signal-value btor683))
             (list)))
           (btor687
            (signal
             (concat (signal-value btor685) (signal-value btor686))
             (list)))
           (btor688
            (signal
             (apply bvor (bitvector->bits (signal-value btor687)))
             (signal-state btor687)))
           (btor689
            (if (bitvector->bool (signal-value btor688)) btor684 btor660))
           (btor690
            (signal
             (bvor (signal-value btor625) (signal-value btor611))
             (list)))
           (btor691
            (if (bitvector->bool (signal-value btor690)) btor342 btor689))
           (btor692
            (signal
             (extract 10 0 (signal-value btor612))
             (signal-state btor612)))
           (btor693
            (signal
             (concat (signal-value btor692) (signal-value btor691))
             (list)))
           (btor694
            (bv->signal
             (zero-extend (signal-value btor693) (bitvector 13))
             btor693))
           (btor695
            (signal
             (extract 11 0 (signal-value btor626))
             (signal-state btor626)))
           (btor696
            (bv->signal
             (zero-extend (signal-value btor695) (bitvector 13))
             btor695))
           (btor697
            (signal
             (bvadd (signal-value btor694) (signal-value btor696))
             (list)))
           (btor698
            (signal
             (extract 12 12 (signal-value btor697))
             (signal-state btor697)))
           (btor699
            (if (bitvector->bool (signal-value btor616)) btor342 btor698))
           (btor700
            (bv->signal
             (zero-extend (signal-value btor699) (bitvector 13))
             btor699))
           (btor701
            (signal
             (bvadd (signal-value btor649) (signal-value btor700))
             (list)))
           (btor702
            (signal
             (extract 12 12 (signal-value btor701))
             (signal-state btor701)))
           (btor703
            (if (bitvector->bool (signal-value btor634)) btor342 btor702))
           (btor704
            (bv->signal
             (zero-extend (signal-value btor703) (bitvector 13))
             btor703))
           (btor705
            (signal
             (bvadd (signal-value btor641) (signal-value btor704))
             (list)))
           (btor706
            (signal
             (extract 12 12 (signal-value btor705))
             (signal-state btor705)))
           (btor707
            (if (bitvector->bool (signal-value btor616)) btor342 btor706))
           (btor708
            (bv->signal
             (zero-extend (signal-value btor707) (bitvector 13))
             btor707))
           (btor709
            (signal
             (bvadd (signal-value btor629) (signal-value btor708))
             (list)))
           (btor710
            (signal
             (extract 12 12 (signal-value btor709))
             (signal-state btor709)))
           (btor711
            (bv->signal
             (sign-extend (signal-value btor99) (bitvector 32))
             btor99))
           (btor712
            (signal
             (bool->bitvector
              (bveq (signal-value btor62) (signal-value btor711)))
             (list)))
           (btor713
            (if (bitvector->bool (signal-value btor712)) btor665 btor710))
           (btor714
            (signal
             (apply bvor (bitvector->bits (signal-value btor62)))
             (signal-state btor62)))
           (btor715 (signal (bvnot (signal-value btor714)) (list)))
           (btor716
            (if (bitvector->bool (signal-value btor715)) btor710 btor713))
           (btor718
            (signal
             (bvadd (signal-value btor642) (signal-value btor698))
             (list)))
           (btor719 (signal (bvnot (signal-value btor718)) (list)))
           (btor720
            (signal
             (extract 1 1 (signal-value btor608))
             (signal-state btor608)))
           (btor721
            (signal
             (bvand (signal-value btor609) (signal-value btor720))
             (list)))
           (btor722
            (if (bitvector->bool (signal-value btor721)) btor719 btor718))
           (btor723
            (if (bitvector->bool (signal-value btor616)) btor722 btor342))
           (btor724
            (signal
             (extract 3 0 (signal-value btor391))
             (signal-state btor391)))
           (btor725
            (bv->signal
             (zero-extend (signal-value btor526) (bitvector 4))
             btor526))
           (btor726
            (signal
             (bool->bitvector
              (bveq (signal-value btor724) (signal-value btor725)))
             (list)))
           (btor727
            (signal
             (extract 3 2 (signal-value btor608))
             (signal-state btor608)))
           (btor728
            (signal
             (apply bvor (bitvector->bits (signal-value btor727)))
             (signal-state btor727)))
           (btor729
            (signal
             (bvor (signal-value btor726) (signal-value btor728))
             (list)))
           (btor730
            (if (bitvector->bool (signal-value btor729)) btor342 btor723))
           (btor731
            (signal
             (bvadd (signal-value btor630) (signal-value btor702))
             (list)))
           (btor732 (signal (bvnot (signal-value btor731)) (list)))
           (btor733
            (if (bitvector->bool (signal-value btor721)) btor732 btor731))
           (btor734
            (if (bitvector->bool (signal-value btor634)) btor733 btor342))
           (btor735
            (if (bitvector->bool (signal-value btor729)) btor342 btor734))
           (btor736
            (signal
             (bvadd (signal-value btor613) (signal-value btor706))
             (list)))
           (btor737 (signal (bvnot (signal-value btor736)) (list)))
           (btor738
            (if (bitvector->bool (signal-value btor721)) btor737 btor736))
           (btor739
            (if (bitvector->bool (signal-value btor616)) btor738 btor342))
           (btor740
            (if (bitvector->bool (signal-value btor729)) btor342 btor739))
           (btor741 (signal (bvnot (signal-value btor710)) (list)))
           (btor742
            (if (bitvector->bool (signal-value btor721)) btor741 btor710))
           (btor743
            (if (bitvector->bool (signal-value btor729)) btor342 btor742))
           (btor744
            (signal
             (concat (signal-value btor735) (signal-value btor730))
             (list)))
           (btor745
            (signal
             (concat (signal-value btor740) (signal-value btor744))
             (list)))
           (btor746
            (signal
             (concat (signal-value btor743) (signal-value btor745))
             (list)))
           (btor747
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state747")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state747"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state747")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state747")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 4))))))))
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
                          (bv 0 4))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor751
            (if (bitvector->bool (signal-value btor97)) btor749 btor747))
           (btor752
            (if (bitvector->bool (signal-value btor712)) btor751 btor746))
           (btor753
            (if (bitvector->bool (signal-value btor715)) btor746 btor752))
           (btor754
            (signal
             (extract 0 0 (signal-value btor753))
             (signal-state btor753)))
           (btor755
            (if (bitvector->bool (signal-value btor616)) btor754 btor342))
           (btor756
            (signal
             (extract 1 1 (signal-value btor753))
             (signal-state btor753)))
           (btor757
            (if (bitvector->bool (signal-value btor634)) btor756 btor342))
           (btor758
            (signal
             (extract 2 2 (signal-value btor753))
             (signal-state btor753)))
           (btor759
            (if (bitvector->bool (signal-value btor616)) btor758 btor342))
           (btor760
            (signal
             (concat (signal-value btor757) (signal-value btor755))
             (list)))
           (btor761
            (signal
             (concat (signal-value btor759) (signal-value btor760))
             (list)))
           (btor762
            (signal
             (extract 3 3 (signal-value btor753))
             (signal-state btor753)))
           (btor763
            (signal
             (concat (signal-value btor762) (signal-value btor761))
             (list)))
           (btor765
            (signal
             (extract 42 42 (signal-value btor355))
             (signal-state btor355)))
           (btor766
            (signal
             (bool->bitvector
              (bveq (signal-value btor465) (signal-value btor466)))
             (list)))
           (btor767
            (if (bitvector->bool (signal-value btor766)) btor57 btor765))
           (btor768
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state768")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state768"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state768")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state768")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor769
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state769")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state769"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state769")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state769")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor771
            (if (bitvector->bool (signal-value btor97)) btor769 btor768))
           (btor772
            (if (bitvector->bool (signal-value btor712)) btor771 btor767))
           (btor773
            (if (bitvector->bool (signal-value btor715)) btor767 btor772))
           (btor775
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state775")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state775"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state775")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state775")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor776
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state776")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state776"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state776")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state776")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor778
            (if (bitvector->bool (signal-value btor97)) btor776 btor775))
           (btor779
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state779")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state779"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state779")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state779")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor780
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state780")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state780"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state780")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state780")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor782
            (if (bitvector->bool (signal-value btor97)) btor780 btor779))
           (btor783 (signal (bvnot (signal-value btor782)) (list)))
           (btor784
            (signal
             (bvand (signal-value btor778) (signal-value btor783))
             (list)))
           (btor785
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state785")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state785"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state785")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state785")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor786
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state786")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state786"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state786")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state786")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor788
            (if (bitvector->bool (signal-value btor97)) btor786 btor785))
           (btor789 (signal (bvnot (signal-value btor788)) (list)))
           (btor790
            (signal
             (bvand (signal-value btor784) (signal-value btor789))
             (list)))
           (btor791 (bv->signal (bv 10 (bitvector 4))))
           (btor792
            (bv->signal
             (zero-extend (signal-value btor791) (bitvector 5))
             btor791))
           (btor793
            (signal
             (bool->bitvector
              (bveq (signal-value btor77) (signal-value btor792)))
             (list)))
           (btor794
            (signal
             (bvor (signal-value btor793) (signal-value btor712))
             (list)))
           (btor795
            (if (bitvector->bool (signal-value btor794)) btor790 btor342))
           (btor797
            (signal
             (extract 11 0 (signal-value btor697))
             (signal-state btor697)))
           (btor798
            (signal
             (extract 11 0 (signal-value btor701))
             (signal-state btor701)))
           (btor799
            (signal
             (concat (signal-value btor798) (signal-value btor797))
             (list)))
           (btor800
            (signal
             (extract 11 0 (signal-value btor705))
             (signal-state btor705)))
           (btor801
            (signal
             (concat (signal-value btor800) (signal-value btor799))
             (list)))
           (btor802
            (signal
             (extract 11 0 (signal-value btor709))
             (signal-state btor709)))
           (btor803
            (signal
             (concat (signal-value btor802) (signal-value btor801))
             (list)))
           (btor804 (signal (bvnot (signal-value btor803)) (list)))
           (btor805
            (if (bitvector->bool (signal-value btor720)) btor804 btor803))
           (btor806
            (if (bitvector->bool (signal-value btor712)) btor399 btor805))
           (btor807
            (if (bitvector->bool (signal-value btor715)) btor805 btor806))
           (btor809
            (bv->signal
             (zero-extend (signal-value btor401) (bitvector 5))
             btor401))
           (btor810
            (signal
             (bool->bitvector
              (bveq (signal-value btor74) (signal-value btor809)))
             (list)))
           (btor811
            (if (bitvector->bool (signal-value btor810)) btor60 btor481))
           (btor812
            (signal
             (bvxor (signal-value btor811) (signal-value btor805))
             (list)))
           (btor813 (bv->signal (bv 14 (bitvector 4))))
           (btor814
            (bv->signal
             (zero-extend (signal-value btor813) (bitvector 5))
             btor813))
           (btor815
            (signal
             (bool->bitvector
              (bveq (signal-value btor73) (signal-value btor814)))
             (list)))
           (btor816
            (if (bitvector->bool (signal-value btor815)) btor481 btor55))
           (btor817
            (signal
             (extract 46 0 (signal-value btor481))
             (signal-state btor481)))
           (btor818 (signal (bvnot (signal-value btor817)) (list)))
           (btor819
            (signal
             (concat (signal-value btor818) (signal-value btor342))
             (list)))
           (btor820 (bv->signal (bv 0 (bitvector 2))))
           (btor821
            (signal
             (extract 45 0 (signal-value btor818))
             (signal-state btor818)))
           (btor822
            (signal
             (concat (signal-value btor821) (signal-value btor820))
             (list)))
           (btor823 (bv->signal (bv 16 (bitvector 5))))
           (btor824
            (signal
             (bool->bitvector
              (bveq (signal-value btor73) (signal-value btor823)))
             (list)))
           (btor825
            (if (bitvector->bool (signal-value btor824)) btor822 btor819))
           (btor826 (bv->signal (bv 15 (bitvector 4))))
           (btor827
            (bv->signal
             (zero-extend (signal-value btor826) (bitvector 5))
             btor826))
           (btor828
            (signal
             (bool->bitvector
              (bveq (signal-value btor73) (signal-value btor827)))
             (list)))
           (btor829
            (signal
             (bvor (signal-value btor828) (signal-value btor824))
             (list)))
           (btor830
            (if (bitvector->bool (signal-value btor829)) btor825 btor816))
           (btor831
            (bv->signal
             (zero-extend (signal-value btor565) (bitvector 5))
             btor565))
           (btor832
            (signal
             (bool->bitvector
              (bveq (signal-value btor77) (signal-value btor831)))
             (list)))
           (btor833
            (if (bitvector->bool (signal-value btor832)) btor407 btor830))
           (btor834
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state834")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state834"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state834")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state834")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 48))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor836
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state836")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state836"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state836")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state836")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 48))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor838
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state838")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state838"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state838")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state838")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor840
            (if (bitvector->bool (signal-value btor838)) btor836 btor834))
           (btor841 (signal (bvnot (signal-value btor832)) (list)))
           (btor842
            (bv->signal
             (zero-extend (signal-value btor312) (bitvector 5))
             btor312))
           (btor843
            (signal
             (bool->bitvector
              (bveq (signal-value btor73) (signal-value btor842)))
             (list)))
           (btor844 (signal (bvnot (signal-value btor843)) (list)))
           (btor845 (signal (bvnot (signal-value btor815)) (list)))
           (btor846 (signal (bvnot (signal-value btor828)) (list)))
           (btor847 (signal (bvnot (signal-value btor824)) (list)))
           (btor848
            (signal
             (bvand (signal-value btor846) (signal-value btor847))
             (list)))
           (btor849
            (signal
             (bvand (signal-value btor845) (signal-value btor848))
             (list)))
           (btor850
            (signal
             (bvand (signal-value btor844) (signal-value btor849))
             (list)))
           (btor851
            (signal
             (bvand (signal-value btor841) (signal-value btor850))
             (list)))
           (btor852
            (if (bitvector->bool (signal-value btor851)) btor840 btor833))
           (btor853
            (signal
             (bvor (signal-value btor812) (signal-value btor852))
             (list)))
           (btor854
            (signal
             (apply bvand (bitvector->bits (signal-value btor853)))
             (signal-state btor853)))
           (btor855
            (if (bitvector->bool (signal-value btor712)) btor788 btor854))
           (btor857 (signal (bvnot (signal-value btor812)) (list)))
           (btor858
            (signal
             (bvor (signal-value btor857) (signal-value btor852))
             (list)))
           (btor859
            (signal
             (apply bvand (bitvector->bits (signal-value btor858)))
             (signal-state btor858)))
           (btor860
            (if (bitvector->bool (signal-value btor712)) btor782 btor859))
           (btor863
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state863")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state863"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state863")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state863")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor864
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state864")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state864"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state864")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state864")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor866
            (if (bitvector->bool (signal-value btor97)) btor864 btor863))
           (btor867
            (signal
             (bvand (signal-value btor866) (signal-value btor783))
             (list)))
           (btor868
            (signal
             (bvand (signal-value btor867) (signal-value btor789))
             (list)))
           (btor869
            (if (bitvector->bool (signal-value btor794)) btor868 btor342))
           (btor871
            (bv->signal
             (zero-extend (signal-value btor699) (bitvector 1))
             btor699))
           (btor872
            (bv->signal
             (zero-extend (signal-value btor703) (bitvector 1))
             btor703))
           (btor873
            (bv->signal
             (zero-extend (signal-value btor707) (bitvector 1))
             btor707))
           (btor874
            (bv->signal
             (zero-extend (signal-value btor49) (bitvector 4))
             btor49))
           (btor875
            (bv->signal
             (zero-extend (signal-value btor50) (bitvector 1))
             btor50))
           (btor876
            (bv->signal
             (zero-extend (signal-value btor51) (bitvector 1))
             btor51))
           (btor877
            (bv->signal
             (zero-extend (signal-value btor52) (bitvector 5))
             btor52))
           (btor878
            (bv->signal
             (zero-extend (signal-value btor54) (bitvector 7))
             btor54))
           (btor879
            (bv->signal
             (zero-extend (signal-value btor2) (bitvector 30))
             btor2))
           (btor880
            (bv->signal
             (zero-extend (signal-value btor2) (bitvector 30))
             btor2))
           (btor881
            (bv->signal
             (zero-extend (signal-value btor86) (bitvector 30))
             btor86))
           (btor882
            (bv->signal
             (zero-extend (signal-value btor169) (bitvector 25))
             btor169))
           (btor883
            (bv->signal
             (zero-extend (signal-value btor5) (bitvector 30))
             btor5))
           (btor884
            (bv->signal
             (zero-extend (signal-value btor5) (bitvector 30))
             btor5))
           (btor885
            (bv->signal
             (zero-extend (signal-value btor186) (bitvector 25))
             btor186))
           (btor886
            (bv->signal
             (zero-extend (signal-value btor200) (bitvector 25))
             btor200))
           (btor887
            (bv->signal
             (zero-extend (signal-value btor805) (bitvector 48))
             btor805))
           (btor888
            (bv->signal
             (zero-extend (signal-value btor8) (bitvector 4))
             btor8))
           (btor889
            (bv->signal
             (zero-extend (signal-value btor592) (bitvector 4))
             btor592))
           (btor890
            (bv->signal
             (zero-extend (signal-value btor15) (bitvector 18))
             btor15))
           (btor891
            (bv->signal
             (zero-extend (signal-value btor15) (bitvector 18))
             btor15))
           (btor892
            (bv->signal
             (zero-extend (signal-value btor253) (bitvector 18))
             btor253))
           (btor893
            (bv->signal
             (zero-extend (signal-value btor124) (bitvector 18))
             btor124))
           (btor894
            (bv->signal
             (zero-extend (signal-value btor17) (bitvector 18))
             btor17))
           (btor895
            (bv->signal
             (zero-extend (signal-value btor17) (bitvector 18))
             btor17))
           (btor896
            (bv->signal
             (zero-extend (signal-value btor21) (bitvector 48))
             btor21))
           (btor897
            (bv->signal
             (zero-extend (signal-value btor21) (bitvector 48))
             btor21))
           (btor898
            (bv->signal
             (zero-extend (signal-value btor23) (bitvector 1))
             btor23))
           (btor899
            (bv->signal
             (zero-extend (signal-value btor23) (bitvector 1))
             btor23))
           (btor900
            (bv->signal
             (zero-extend (signal-value btor710) (bitvector 1))
             btor710))
           (btor901
            (bv->signal
             (zero-extend (signal-value btor716) (bitvector 1))
             btor716))
           (btor902
            (bv->signal
             (zero-extend (signal-value btor665) (bitvector 1))
             btor665))
           (btor903
            (bv->signal
             (zero-extend (signal-value btor24) (bitvector 1))
             btor24))
           (btor904
            (signal
             (bvxor (signal-value btor24) (signal-value btor50))
             (list)))
           (btor905
            (bv->signal
             (zero-extend (signal-value btor904) (bitvector 1))
             btor904))
           (btor906
            (bv->signal
             (zero-extend (signal-value btor27) (bitvector 3))
             btor27))
           (btor907
            (bv->signal
             (zero-extend (signal-value btor27) (bitvector 3))
             btor27))
           (btor908
            (bv->signal
             (zero-extend (signal-value btor746) (bitvector 4))
             btor746))
           (btor909
            (signal
             (concat (signal-value btor733) (signal-value btor722))
             (list)))
           (btor910
            (signal
             (concat (signal-value btor738) (signal-value btor909))
             (list)))
           (btor911
            (signal
             (concat (signal-value btor742) (signal-value btor910))
             (list)))
           (btor912
            (bv->signal
             (zero-extend (signal-value btor911) (bitvector 4))
             btor911))
           (btor913
            (bv->signal
             (zero-extend (signal-value btor753) (bitvector 4))
             btor753))
           (btor914
            (bv->signal
             (zero-extend (signal-value btor751) (bitvector 4))
             btor751))
           (btor915
            (bv->signal
             (zero-extend (signal-value btor763) (bitvector 4))
             btor763))
           (btor916
            (bv->signal
             (zero-extend (signal-value btor29) (bitvector 1))
             btor29))
           (btor917
            (bv->signal
             (zero-extend (signal-value btor29) (bitvector 1))
             btor29))
           (btor918
            (bv->signal
             (zero-extend (signal-value btor30) (bitvector 1))
             btor30))
           (btor919
            (bv->signal
             (zero-extend (signal-value btor30) (bitvector 1))
             btor30))
           (btor920
            (bv->signal
             (zero-extend (signal-value btor31) (bitvector 1))
             btor31))
           (btor921
            (bv->signal
             (zero-extend (signal-value btor31) (bitvector 1))
             btor31))
           (btor922
            (bv->signal
             (zero-extend (signal-value btor32) (bitvector 1))
             btor32))
           (btor923
            (bv->signal
             (zero-extend (signal-value btor32) (bitvector 1))
             btor32))
           (btor924
            (bv->signal
             (zero-extend (signal-value btor33) (bitvector 1))
             btor33))
           (btor925
            (bv->signal
             (zero-extend (signal-value btor33) (bitvector 1))
             btor33))
           (btor926
            (bv->signal
             (zero-extend (signal-value btor34) (bitvector 1))
             btor34))
           (btor927
            (bv->signal
             (zero-extend (signal-value btor34) (bitvector 1))
             btor34))
           (btor928
            (bv->signal
             (zero-extend (signal-value btor35) (bitvector 1))
             btor35))
           (btor929
            (bv->signal
             (zero-extend (signal-value btor35) (bitvector 1))
             btor35))
           (btor930
            (bv->signal
             (zero-extend (signal-value btor36) (bitvector 1))
             btor36))
           (btor931
            (bv->signal
             (zero-extend (signal-value btor36) (bitvector 1))
             btor36))
           (btor932
            (bv->signal
             (zero-extend (signal-value btor37) (bitvector 1))
             btor37))
           (btor933
            (bv->signal
             (zero-extend (signal-value btor37) (bitvector 1))
             btor37))
           (btor934
            (bv->signal
             (zero-extend (signal-value btor38) (bitvector 1))
             btor38))
           (btor935
            (bv->signal
             (zero-extend (signal-value btor38) (bitvector 1))
             btor38))
           (btor936
            (bv->signal
             (zero-extend (signal-value btor39) (bitvector 1))
             btor39))
           (btor937
            (bv->signal
             (zero-extend (signal-value btor39) (bitvector 1))
             btor39))
           (btor938
            (bv->signal
             (zero-extend (signal-value btor40) (bitvector 1))
             btor40))
           (btor939
            (bv->signal
             (zero-extend (signal-value btor40) (bitvector 1))
             btor40))
           (btor940
            (bv->signal
             (zero-extend (signal-value btor41) (bitvector 1))
             btor41))
           (btor941
            (bv->signal
             (zero-extend (signal-value btor41) (bitvector 1))
             btor41))
           (btor942
            (bv->signal
             (zero-extend (signal-value btor42) (bitvector 1))
             btor42))
           (btor943
            (bv->signal
             (zero-extend (signal-value btor91) (bitvector 1))
             btor91))
           (btor944
            (bv->signal
             (zero-extend (signal-value btor610) (bitvector 48))
             btor610))
           (btor945
            (bv->signal
             (zero-extend (signal-value btor643) (bitvector 1))
             btor643))
           (btor946
            (bv->signal
             (zero-extend (signal-value btor635) (bitvector 1))
             btor635))
           (btor947
            (bv->signal
             (zero-extend (signal-value btor617) (bitvector 1))
             btor617))
           (btor948
            (bv->signal
             (zero-extend (signal-value btor612) (bitvector 48))
             btor612))
           (btor949
            (bv->signal
             (zero-extend (signal-value btor718) (bitvector 1))
             btor718))
           (btor950
            (bv->signal
             (zero-extend (signal-value btor731) (bitvector 1))
             btor731))
           (btor951
            (bv->signal
             (zero-extend (signal-value btor736) (bitvector 1))
             btor736))
           (btor952
            (bv->signal
             (zero-extend (signal-value btor710) (bitvector 1))
             btor710))
           (btor953
            (bv->signal
             (zero-extend (signal-value btor45) (bitvector 25))
             btor45))
           (btor954
            (bv->signal
             (zero-extend (signal-value btor45) (bitvector 25))
             btor45))
           (btor955
            (bv->signal
             (zero-extend (signal-value btor47) (bitvector 5))
             btor47))
           (btor956
            (bv->signal
             (zero-extend (signal-value btor153) (bitvector 5))
             btor153))
           (btor957
            (bv->signal
             (zero-extend (signal-value btor323) (bitvector 43))
             btor323))
           (btor958
            (bv->signal
             (zero-extend (signal-value btor57) (bitvector 1))
             btor57))
           (btor959
            (bv->signal
             (zero-extend (signal-value btor57) (bitvector 1))
             btor57))
           (btor960
            (bv->signal
             (zero-extend (signal-value btor773) (bitvector 1))
             btor773))
           (btor961
            (bv->signal
             (zero-extend (signal-value btor767) (bitvector 1))
             btor767))
           (btor962
            (bv->signal
             (zero-extend (signal-value btor58) (bitvector 7))
             btor58))
           (btor963
            (bv->signal
             (zero-extend (signal-value btor375) (bitvector 7))
             btor375))
           (btor964
            (bv->signal
             (zero-extend (signal-value btor795) (bitvector 1))
             btor795))
           (btor965
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 48))
             btor61))
           (btor966
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 48))
             btor61))
           (btor967
            (bv->signal
             (zero-extend (signal-value btor859) (bitvector 1))
             btor859))
           (btor968
            (bv->signal
             (zero-extend (signal-value btor860) (bitvector 1))
             btor860))
           (btor969
            (bv->signal
             (zero-extend (signal-value btor782) (bitvector 1))
             btor782))
           (btor970
            (bv->signal
             (zero-extend (signal-value btor778) (bitvector 1))
             btor778))
           (btor971
            (bv->signal
             (zero-extend (signal-value btor854) (bitvector 1))
             btor854))
           (btor972
            (bv->signal
             (zero-extend (signal-value btor855) (bitvector 1))
             btor855))
           (btor973
            (bv->signal
             (zero-extend (signal-value btor788) (bitvector 1))
             btor788))
           (btor974
            (bv->signal
             (zero-extend (signal-value btor866) (bitvector 1))
             btor866))
           (btor975
            (bv->signal
             (zero-extend (signal-value btor342) (bitvector 1))
             btor342))
           (btor976
            (bv->signal
             (zero-extend (signal-value btor109) (bitvector 30))
             btor109))
           (btor977
            (bv->signal
             (zero-extend (signal-value btor113) (bitvector 30))
             btor113))
           (btor978
            (bv->signal
             (zero-extend (signal-value btor98) (bitvector 30))
             btor98))
           (btor979
            (bv->signal
             (zero-extend (signal-value btor117) (bitvector 30))
             btor117))
           (btor980
            (bv->signal
             (zero-extend (signal-value btor196) (bitvector 25))
             btor196))
           (btor981
            (bv->signal
             (zero-extend (signal-value btor190) (bitvector 25))
             btor190))
           (btor982
            (bv->signal
             (zero-extend (signal-value btor608) (bitvector 4))
             btor608))
           (btor983
            (bv->signal
             (zero-extend (signal-value btor591) (bitvector 4))
             btor591))
           (btor984
            (bv->signal
             (zero-extend (signal-value btor138) (bitvector 18))
             btor138))
           (btor985
            (bv->signal
             (zero-extend (signal-value btor142) (bitvector 18))
             btor142))
           (btor986
            (bv->signal
             (zero-extend (signal-value btor129) (bitvector 18))
             btor129))
           (btor987
            (bv->signal
             (zero-extend (signal-value btor146) (bitvector 18))
             btor146))
           (btor988
            (bv->signal
             (zero-extend (signal-value btor481) (bitvector 48))
             btor481))
           (btor989
            (bv->signal
             (zero-extend (signal-value btor475) (bitvector 48))
             btor475))
           (btor990
            (bv->signal
             (zero-extend (signal-value btor691) (bitvector 1))
             btor691))
           (btor991
            (bv->signal
             (zero-extend (signal-value btor650) (bitvector 1))
             btor650))
           (btor992
            (bv->signal
             (zero-extend (signal-value btor679) (bitvector 1))
             btor679))
           (btor993
            (bv->signal
             (zero-extend (signal-value btor689) (bitvector 1))
             btor689))
           (btor994
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state994")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state994"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state994")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state994")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor995
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state995")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state995"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state995")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state995")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor997
            (if (bitvector->bool (signal-value btor97)) btor995 btor994))
           (btor998
            (bv->signal
             (zero-extend (signal-value btor997) (bitvector 1))
             btor997))
           (btor999
            (bv->signal
             (zero-extend (signal-value btor673) (bitvector 1))
             btor673))
           (btor1000
            (bv->signal
             (zero-extend (signal-value btor352) (bitvector 3))
             btor352))
           (btor1001
            (bv->signal
             (zero-extend (signal-value btor335) (bitvector 3))
             btor335))
           (btor1002
            (bv->signal
             (zero-extend (signal-value btor179) (bitvector 25))
             btor179))
           (btor1003
            (bv->signal
             (zero-extend (signal-value btor173) (bitvector 25))
             btor173))
           (btor1004
            (bv->signal
             (zero-extend (signal-value btor164) (bitvector 5))
             btor164))
           (btor1005
            (bv->signal
             (zero-extend (signal-value btor158) (bitvector 5))
             btor158))
           (btor1006
            (bv->signal
             (zero-extend (signal-value btor355) (bitvector 43))
             btor355))
           (btor1007
            (bv->signal
             (zero-extend (signal-value btor327) (bitvector 43))
             btor327))
           (btor1008
            (bv->signal
             (zero-extend (signal-value btor771) (bitvector 1))
             btor771))
           (btor1009
            (bv->signal
             (zero-extend (signal-value btor391) (bitvector 7))
             btor391))
           (btor1010
            (bv->signal
             (zero-extend (signal-value btor374) (bitvector 7))
             btor374))
           (btor1011
            (bv->signal
             (zero-extend (signal-value btor807) (bitvector 48))
             btor807))
           (btor1012
            (bv->signal
             (zero-extend (signal-value btor399) (bitvector 48))
             btor399))
           (btor1013
            (bv->signal
             (zero-extend (signal-value btor406) (bitvector 48))
             btor406))
           (btor1014
            (bv->signal
             (zero-extend (signal-value btor483) (bitvector 48))
             btor483))
           (btor1015
            (bv->signal
             (zero-extend (signal-value btor577) (bitvector 48))
             btor577))
           (btor1016
            (bv->signal
             (zero-extend (signal-value btor63) (bitvector 1))
             btor63))
           (btor1017
            (bv->signal
             (zero-extend (signal-value btor63) (bitvector 1))
             btor63))
           (btor1018
            (bv->signal
             (zero-extend (signal-value btor64) (bitvector 1))
             btor64))
           (btor1019
            (bv->signal
             (zero-extend (signal-value btor64) (bitvector 1))
             btor64))
           (btor1020
            (bv->signal
             (zero-extend (signal-value btor65) (bitvector 1))
             btor65))
           (btor1021
            (bv->signal
             (zero-extend (signal-value btor65) (bitvector 1))
             btor65))
           (btor1022
            (bv->signal
             (zero-extend (signal-value btor66) (bitvector 1))
             btor66))
           (btor1023
            (bv->signal
             (zero-extend (signal-value btor66) (bitvector 1))
             btor66))
           (btor1024
            (bv->signal
             (zero-extend (signal-value btor67) (bitvector 1))
             btor67))
           (btor1025
            (bv->signal
             (zero-extend (signal-value btor67) (bitvector 1))
             btor67))
           (btor1026
            (bv->signal
             (zero-extend (signal-value btor68) (bitvector 1))
             btor68))
           (btor1027
            (bv->signal
             (zero-extend (signal-value btor68) (bitvector 1))
             btor68))
           (btor1028
            (bv->signal
             (zero-extend (signal-value btor69) (bitvector 1))
             btor69))
           (btor1029
            (bv->signal
             (zero-extend (signal-value btor69) (bitvector 1))
             btor69))
           (btor1030
            (bv->signal
             (zero-extend (signal-value btor70) (bitvector 1))
             btor70))
           (btor1031
            (bv->signal
             (zero-extend (signal-value btor70) (bitvector 1))
             btor70))
           (btor1032
            (bv->signal
             (zero-extend (signal-value btor71) (bitvector 1))
             btor71))
           (btor1033
            (bv->signal
             (zero-extend (signal-value btor71) (bitvector 1))
             btor71))
           (btor1034
            (bv->signal
             (zero-extend (signal-value btor72) (bitvector 1))
             btor72))
           (btor1035
            (bv->signal
             (zero-extend (signal-value btor72) (bitvector 1))
             btor72))
           (btor1036
            (bv->signal
             (zero-extend (signal-value btor624) (bitvector 48))
             btor624))
           (btor1037
            (bv->signal
             (zero-extend (signal-value btor697) (bitvector 13))
             btor697))
           (btor1038
            (bv->signal
             (zero-extend (signal-value btor701) (bitvector 13))
             btor701))
           (btor1039
            (bv->signal
             (zero-extend (signal-value btor705) (bitvector 13))
             btor705))
           (btor1040
            (bv->signal
             (zero-extend (signal-value btor709) (bitvector 13))
             btor709))
           (btor1041
            (bv->signal
             (zero-extend (signal-value btor626) (bitvector 48))
             btor626))
           (btor1042 (bv->signal (bv 17 (bitvector 5))))
           (btor1043
            (signal
             (bool->bitvector
              (bveq (signal-value btor12) (signal-value btor1042)))
             (list)))
           (btor1044
            (signal
             (bvand (signal-value btor1043) (signal-value btor782))
             (list)))
           (btor1045 (bv->signal (bv 18 (bitvector 5))))
           (btor1046
            (signal
             (bool->bitvector
              (bveq (signal-value btor12) (signal-value btor1045)))
             (list)))
           (btor1047
            (signal
             (bvand (signal-value btor778) (signal-value btor783))
             (list)))
           (btor1048
            (signal
             (bvand (signal-value btor1046) (signal-value btor1047))
             (list)))
           (btor1049
            (signal
             (bvor (signal-value btor1044) (signal-value btor1048))
             (list)))
           (btor1050
            (bv->signal
             (zero-extend (signal-value btor1049) (bitvector 1))
             btor1049))
           (btor1051
            (bv->signal
             (zero-extend (signal-value btor852) (bitvector 48))
             btor852))
           (btor1052
            (bv->signal
             (zero-extend (signal-value btor811) (bitvector 48))
             btor811))
           (btor1053
            (bv->signal
             (zero-extend (signal-value btor869) (bitvector 1))
             btor869))
           (btor1054
            (bv->signal
             (zero-extend (signal-value btor468) (bitvector 48))
             btor468))
           (btor1056
            (if (bitvector->bool (signal-value btor30)) btor113 btor98))
           (btor1057
            (if (bitvector->bool (signal-value btor63)) btor88 btor1056))
           (btor1058
            (if (bitvector->bool (signal-value btor104)) btor1057 btor98))
           (btor1059
            (if (bitvector->bool (signal-value btor30)) btor86 btor98))
           (btor1060
            (if (bitvector->bool (signal-value btor63)) btor88 btor1059))
           (btor1061
            (if (bitvector->bool (signal-value btor101)) btor1060 btor1058))
           (btor1065
            (if (bitvector->bool (signal-value btor29)) btor86 btor113))
           (btor1066
            (if (bitvector->bool (signal-value btor63)) btor88 btor1065))
           (btor1067
            (if (bitvector->bool (signal-value btor104)) btor1066 btor113))
           (btor1068
            (if (bitvector->bool (signal-value btor101)) btor1066 btor1067))
           (btor1071
            (if (bitvector->bool (signal-value btor34)) btor142 btor129))
           (btor1072
            (if (bitvector->bool (signal-value btor66)) btor126 btor1071))
           (btor1073
            (if (bitvector->bool (signal-value btor133)) btor1072 btor129))
           (btor1074
            (if (bitvector->bool (signal-value btor34)) btor124 btor129))
           (btor1075
            (if (bitvector->bool (signal-value btor66)) btor126 btor1074))
           (btor1076
            (if (bitvector->bool (signal-value btor131)) btor1075 btor1073))
           (btor1079
            (if (bitvector->bool (signal-value btor33)) btor124 btor142))
           (btor1080
            (if (bitvector->bool (signal-value btor66)) btor126 btor1079))
           (btor1081
            (if (bitvector->bool (signal-value btor133)) btor1080 btor142))
           (btor1082
            (if (bitvector->bool (signal-value btor131)) btor1080 btor1081))
           (btor1085
            (if (bitvector->bool (signal-value btor39)) btor153 btor158))
           (btor1086
            (if (bitvector->bool (signal-value btor70)) btor155 btor1085))
           (btor1089
            (if (bitvector->bool (signal-value btor38)) btor45 btor173))
           (btor1090
            (if (bitvector->bool (signal-value btor69)) btor167 btor1089))
           (btor1093
            (if (bitvector->bool (signal-value btor31)) btor186 btor190))
           (btor1094
            (if (bitvector->bool (signal-value btor69)) btor167 btor1093))
           (btor1097
            (if (bitvector->bool (signal-value btor40)) btor323 btor327))
           (btor1098
            (if (bitvector->bool (signal-value btor71)) btor311 btor1097))
           (btor1101
            (if (bitvector->bool (signal-value btor37)) btor27 btor335))
           (btor1102
            (if (bitvector->bool (signal-value btor68)) btor332 btor1101))
           (btor1106 (signal (bvnot (signal-value btor351)) (list)))
           (btor1109
            (if (bitvector->bool (signal-value btor37)) btor375 btor374))
           (btor1110
            (if (bitvector->bool (signal-value btor68)) btor371 btor1109))
           (btor1114 (signal (bvnot (signal-value btor390)) (list)))
           (btor1117
            (if (bitvector->bool (signal-value btor41)) btor805 btor399))
           (btor1118
            (signal
             (bvor (signal-value btor72) (signal-value btor1049))
             (list)))
           (btor1119
            (if (bitvector->bool (signal-value btor1118)) btor149 btor1117))
           (btor1122
            (if (bitvector->bool (signal-value btor35)) btor21 btor475))
           (btor1123
            (if (bitvector->bool (signal-value btor67)) btor149 btor1122))
           (btor1126
            (if (bitvector->bool (signal-value btor32)) btor592 btor591))
           (btor1127
            (if (bitvector->bool (signal-value btor65)) btor588 btor1126))
           (btor1131 (signal (bvnot (signal-value btor607)) (list)))
           (btor1134
            (if (bitvector->bool (signal-value btor41)) btor710 btor665))
           (btor1135
            (if (bitvector->bool (signal-value btor1118)) btor342 btor1134))
           (btor1138
            (if (bitvector->bool (signal-value btor40)) btor676 btor673))
           (btor1139
            (if (bitvector->bool (signal-value btor64)) btor342 btor1138))
           (btor1142
            (if (bitvector->bool (signal-value btor41)) btor746 btor751))
           (btor1143
            (if (bitvector->bool (signal-value btor1118)) btor588 btor1142))
           (btor1146
            (if (bitvector->bool (signal-value btor41)) btor767 btor771))
           (btor1147
            (if (bitvector->bool (signal-value btor1118)) btor342 btor1146))
           (btor1150
            (if (bitvector->bool (signal-value btor41)) btor782 btor778))
           (btor1151
            (if (bitvector->bool (signal-value btor1118)) btor342 btor1150))
           (btor1154
            (if (bitvector->bool (signal-value btor41)) btor859 btor782))
           (btor1155
            (if (bitvector->bool (signal-value btor1118)) btor342 btor1154))
           (btor1158
            (if (bitvector->bool (signal-value btor41)) btor854 btor788))
           (btor1159
            (if (bitvector->bool (signal-value btor1118)) btor342 btor1158))
           (btor1163 (signal (bvnot (signal-value btor851)) (list)))
           (btor1166
            (if (bitvector->bool (signal-value btor41)) btor788 btor866))
           (btor1167
            (if (bitvector->bool (signal-value btor1118)) btor342 btor1166))
           (btor1170
            (if (bitvector->bool (signal-value btor36)) btor904 btor997))
           (btor1171
            (if (bitvector->bool (signal-value btor64)) btor342 btor1170))
           (output-state
            (remove-duplicates
             (append
              (append
               (list
                (cons
                 (string->symbol (string-append name "state995"))
                 (cons
                  (signal-value btor1171)
                  (if (assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state995")))
                    (add1
                     (cdr
                      (assoc-ref
                       merged-input-state-hash
                       (string->symbol (string-append name "state995")))))
                    0))))
               (append
                (list
                 (cons
                  (string->symbol (string-append name "state994"))
                  (cons
                   (signal-value btor997)
                   (if (assoc-has-key?
                        merged-input-state-hash
                        (string->symbol (string-append name "state994")))
                     (add1
                      (cdr
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state994")))))
                     0))))
                (append
                 (list
                  (cons
                   (string->symbol (string-append name "state864"))
                   (cons
                    (signal-value btor1167)
                    (if (assoc-has-key?
                         merged-input-state-hash
                         (string->symbol (string-append name "state864")))
                      (add1
                       (cdr
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state864")))))
                      0))))
                 (append
                  (list
                   (cons
                    (string->symbol (string-append name "state863"))
                    (cons
                     (signal-value btor866)
                     (if (assoc-has-key?
                          merged-input-state-hash
                          (string->symbol (string-append name "state863")))
                       (add1
                        (cdr
                         (assoc-ref
                          merged-input-state-hash
                          (string->symbol (string-append name "state863")))))
                       0))))
                  (append
                   (list
                    (cons
                     (string->symbol (string-append name "state838"))
                     (cons
                      (signal-value btor1163)
                      (if (assoc-has-key?
                           merged-input-state-hash
                           (string->symbol (string-append name "state838")))
                        (add1
                         (cdr
                          (assoc-ref
                           merged-input-state-hash
                           (string->symbol (string-append name "state838")))))
                        0))))
                   (append
                    (list
                     (cons
                      (string->symbol (string-append name "state836"))
                      (cons
                       (signal-value btor833)
                       (if (assoc-has-key?
                            merged-input-state-hash
                            (string->symbol (string-append name "state836")))
                         (add1
                          (cdr
                           (assoc-ref
                            merged-input-state-hash
                            (string->symbol (string-append name "state836")))))
                         0))))
                    (append
                     (list
                      (cons
                       (string->symbol (string-append name "state834"))
                       (cons
                        (signal-value btor852)
                        (if (assoc-has-key?
                             merged-input-state-hash
                             (string->symbol (string-append name "state834")))
                          (add1
                           (cdr
                            (assoc-ref
                             merged-input-state-hash
                             (string->symbol
                              (string-append name "state834")))))
                          0))))
                     (append
                      (list
                       (cons
                        (string->symbol (string-append name "state786"))
                        (cons
                         (signal-value btor1159)
                         (if (assoc-has-key?
                              merged-input-state-hash
                              (string->symbol (string-append name "state786")))
                           (add1
                            (cdr
                             (assoc-ref
                              merged-input-state-hash
                              (string->symbol
                               (string-append name "state786")))))
                           0))))
                      (append
                       (list
                        (cons
                         (string->symbol (string-append name "state785"))
                         (cons
                          (signal-value btor788)
                          (if (assoc-has-key?
                               merged-input-state-hash
                               (string->symbol
                                (string-append name "state785")))
                            (add1
                             (cdr
                              (assoc-ref
                               merged-input-state-hash
                               (string->symbol
                                (string-append name "state785")))))
                            0))))
                       (append
                        (list
                         (cons
                          (string->symbol (string-append name "state780"))
                          (cons
                           (signal-value btor1155)
                           (if (assoc-has-key?
                                merged-input-state-hash
                                (string->symbol
                                 (string-append name "state780")))
                             (add1
                              (cdr
                               (assoc-ref
                                merged-input-state-hash
                                (string->symbol
                                 (string-append name "state780")))))
                             0))))
                        (append
                         (list
                          (cons
                           (string->symbol (string-append name "state779"))
                           (cons
                            (signal-value btor782)
                            (if (assoc-has-key?
                                 merged-input-state-hash
                                 (string->symbol
                                  (string-append name "state779")))
                              (add1
                               (cdr
                                (assoc-ref
                                 merged-input-state-hash
                                 (string->symbol
                                  (string-append name "state779")))))
                              0))))
                         (append
                          (list
                           (cons
                            (string->symbol (string-append name "state776"))
                            (cons
                             (signal-value btor1151)
                             (if (assoc-has-key?
                                  merged-input-state-hash
                                  (string->symbol
                                   (string-append name "state776")))
                               (add1
                                (cdr
                                 (assoc-ref
                                  merged-input-state-hash
                                  (string->symbol
                                   (string-append name "state776")))))
                               0))))
                          (append
                           (list
                            (cons
                             (string->symbol (string-append name "state775"))
                             (cons
                              (signal-value btor778)
                              (if (assoc-has-key?
                                   merged-input-state-hash
                                   (string->symbol
                                    (string-append name "state775")))
                                (add1
                                 (cdr
                                  (assoc-ref
                                   merged-input-state-hash
                                   (string->symbol
                                    (string-append name "state775")))))
                                0))))
                           (append
                            (list
                             (cons
                              (string->symbol (string-append name "state769"))
                              (cons
                               (signal-value btor1147)
                               (if (assoc-has-key?
                                    merged-input-state-hash
                                    (string->symbol
                                     (string-append name "state769")))
                                 (add1
                                  (cdr
                                   (assoc-ref
                                    merged-input-state-hash
                                    (string->symbol
                                     (string-append name "state769")))))
                                 0))))
                            (append
                             (list
                              (cons
                               (string->symbol (string-append name "state768"))
                               (cons
                                (signal-value btor771)
                                (if (assoc-has-key?
                                     merged-input-state-hash
                                     (string->symbol
                                      (string-append name "state768")))
                                  (add1
                                   (cdr
                                    (assoc-ref
                                     merged-input-state-hash
                                     (string->symbol
                                      (string-append name "state768")))))
                                  0))))
                             (append
                              (list
                               (cons
                                (string->symbol
                                 (string-append name "state749"))
                                (cons
                                 (signal-value btor1143)
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
                                 (string->symbol
                                  (string-append name "state747"))
                                 (cons
                                  (signal-value btor751)
                                  (if (assoc-has-key?
                                       merged-input-state-hash
                                       (string->symbol
                                        (string-append name "state747")))
                                    (add1
                                     (cdr
                                      (assoc-ref
                                       merged-input-state-hash
                                       (string->symbol
                                        (string-append name "state747")))))
                                    0))))
                               (append
                                (list
                                 (cons
                                  (string->symbol
                                   (string-append name "state671"))
                                  (cons
                                   (signal-value btor1139)
                                   (if (assoc-has-key?
                                        merged-input-state-hash
                                        (string->symbol
                                         (string-append name "state671")))
                                     (add1
                                      (cdr
                                       (assoc-ref
                                        merged-input-state-hash
                                        (string->symbol
                                         (string-append name "state671")))))
                                     0))))
                                (append
                                 (list
                                  (cons
                                   (string->symbol
                                    (string-append name "state670"))
                                   (cons
                                    (signal-value btor673)
                                    (if (assoc-has-key?
                                         merged-input-state-hash
                                         (string->symbol
                                          (string-append name "state670")))
                                      (add1
                                       (cdr
                                        (assoc-ref
                                         merged-input-state-hash
                                         (string->symbol
                                          (string-append name "state670")))))
                                      0))))
                                 (append
                                  (list
                                   (cons
                                    (string->symbol
                                     (string-append name "state663"))
                                    (cons
                                     (signal-value btor1135)
                                     (if (assoc-has-key?
                                          merged-input-state-hash
                                          (string->symbol
                                           (string-append name "state663")))
                                       (add1
                                        (cdr
                                         (assoc-ref
                                          merged-input-state-hash
                                          (string->symbol
                                           (string-append name "state663")))))
                                       0))))
                                  (append
                                   (list
                                    (cons
                                     (string->symbol
                                      (string-append name "state661"))
                                     (cons
                                      (signal-value btor665)
                                      (if (assoc-has-key?
                                           merged-input-state-hash
                                           (string->symbol
                                            (string-append name "state661")))
                                        (add1
                                         (cdr
                                          (assoc-ref
                                           merged-input-state-hash
                                           (string->symbol
                                            (string-append name "state661")))))
                                        0))))
                                   (append
                                    (list
                                     (cons
                                      (string->symbol
                                       (string-append name "state599"))
                                      (cons
                                       (signal-value btor1131)
                                       (if (assoc-has-key?
                                            merged-input-state-hash
                                            (string->symbol
                                             (string-append name "state599")))
                                         (add1
                                          (cdr
                                           (assoc-ref
                                            merged-input-state-hash
                                            (string->symbol
                                             (string-append
                                              name
                                              "state599")))))
                                         0))))
                                    (append
                                     (list
                                      (cons
                                       (string->symbol
                                        (string-append name "state597"))
                                       (cons
                                        (signal-value btor595)
                                        (if (assoc-has-key?
                                             merged-input-state-hash
                                             (string->symbol
                                              (string-append name "state597")))
                                          (add1
                                           (cdr
                                            (assoc-ref
                                             merged-input-state-hash
                                             (string->symbol
                                              (string-append
                                               name
                                               "state597")))))
                                          0))))
                                     (append
                                      (list
                                       (cons
                                        (string->symbol
                                         (string-append name "state596"))
                                        (cons
                                         (signal-value btor608)
                                         (if (assoc-has-key?
                                              merged-input-state-hash
                                              (string->symbol
                                               (string-append
                                                name
                                                "state596")))
                                           (add1
                                            (cdr
                                             (assoc-ref
                                              merged-input-state-hash
                                              (string->symbol
                                               (string-append
                                                name
                                                "state596")))))
                                           0))))
                                      (append
                                       (list
                                        (cons
                                         (string->symbol
                                          (string-append name "state589"))
                                         (cons
                                          (signal-value btor1127)
                                          (if (assoc-has-key?
                                               merged-input-state-hash
                                               (string->symbol
                                                (string-append
                                                 name
                                                 "state589")))
                                            (add1
                                             (cdr
                                              (assoc-ref
                                               merged-input-state-hash
                                               (string->symbol
                                                (string-append
                                                 name
                                                 "state589")))))
                                            0))))
                                       (append
                                        (list
                                         (cons
                                          (string->symbol
                                           (string-append name "state587"))
                                          (cons
                                           (signal-value btor591)
                                           (if (assoc-has-key?
                                                merged-input-state-hash
                                                (string->symbol
                                                 (string-append
                                                  name
                                                  "state587")))
                                             (add1
                                              (cdr
                                               (assoc-ref
                                                merged-input-state-hash
                                                (string->symbol
                                                 (string-append
                                                  name
                                                  "state587")))))
                                             0))))
                                        (append
                                         (list
                                          (cons
                                           (string->symbol
                                            (string-append name "state473"))
                                           (cons
                                            (signal-value btor1123)
                                            (if (assoc-has-key?
                                                 merged-input-state-hash
                                                 (string->symbol
                                                  (string-append
                                                   name
                                                   "state473")))
                                              (add1
                                               (cdr
                                                (assoc-ref
                                                 merged-input-state-hash
                                                 (string->symbol
                                                  (string-append
                                                   name
                                                   "state473")))))
                                              0))))
                                         (append
                                          (list
                                           (cons
                                            (string->symbol
                                             (string-append name "state472"))
                                            (cons
                                             (signal-value btor475)
                                             (if (assoc-has-key?
                                                  merged-input-state-hash
                                                  (string->symbol
                                                   (string-append
                                                    name
                                                    "state472")))
                                               (add1
                                                (cdr
                                                 (assoc-ref
                                                  merged-input-state-hash
                                                  (string->symbol
                                                   (string-append
                                                    name
                                                    "state472")))))
                                               0))))
                                          (append
                                           (list
                                            (cons
                                             (string->symbol
                                              (string-append name "state397"))
                                             (cons
                                              (signal-value btor1119)
                                              (if (assoc-has-key?
                                                   merged-input-state-hash
                                                   (string->symbol
                                                    (string-append
                                                     name
                                                     "state397")))
                                                (add1
                                                 (cdr
                                                  (assoc-ref
                                                   merged-input-state-hash
                                                   (string->symbol
                                                    (string-append
                                                     name
                                                     "state397")))))
                                                0))))
                                           (append
                                            (list
                                             (cons
                                              (string->symbol
                                               (string-append name "state396"))
                                              (cons
                                               (signal-value btor399)
                                               (if (assoc-has-key?
                                                    merged-input-state-hash
                                                    (string->symbol
                                                     (string-append
                                                      name
                                                      "state396")))
                                                 (add1
                                                  (cdr
                                                   (assoc-ref
                                                    merged-input-state-hash
                                                    (string->symbol
                                                     (string-append
                                                      name
                                                      "state396")))))
                                                 0))))
                                            (append
                                             (list
                                              (cons
                                               (string->symbol
                                                (string-append
                                                 name
                                                 "state382"))
                                               (cons
                                                (signal-value btor1114)
                                                (if (assoc-has-key?
                                                     merged-input-state-hash
                                                     (string->symbol
                                                      (string-append
                                                       name
                                                       "state382")))
                                                  (add1
                                                   (cdr
                                                    (assoc-ref
                                                     merged-input-state-hash
                                                     (string->symbol
                                                      (string-append
                                                       name
                                                       "state382")))))
                                                  0))))
                                             (append
                                              (list
                                               (cons
                                                (string->symbol
                                                 (string-append
                                                  name
                                                  "state380"))
                                                (cons
                                                 (signal-value btor378)
                                                 (if (assoc-has-key?
                                                      merged-input-state-hash
                                                      (string->symbol
                                                       (string-append
                                                        name
                                                        "state380")))
                                                   (add1
                                                    (cdr
                                                     (assoc-ref
                                                      merged-input-state-hash
                                                      (string->symbol
                                                       (string-append
                                                        name
                                                        "state380")))))
                                                   0))))
                                              (append
                                               (list
                                                (cons
                                                 (string->symbol
                                                  (string-append
                                                   name
                                                   "state379"))
                                                 (cons
                                                  (signal-value btor391)
                                                  (if (assoc-has-key?
                                                       merged-input-state-hash
                                                       (string->symbol
                                                        (string-append
                                                         name
                                                         "state379")))
                                                    (add1
                                                     (cdr
                                                      (assoc-ref
                                                       merged-input-state-hash
                                                       (string->symbol
                                                        (string-append
                                                         name
                                                         "state379")))))
                                                    0))))
                                               (append
                                                (list
                                                 (cons
                                                  (string->symbol
                                                   (string-append
                                                    name
                                                    "state372"))
                                                  (cons
                                                   (signal-value btor1110)
                                                   (if (assoc-has-key?
                                                        merged-input-state-hash
                                                        (string->symbol
                                                         (string-append
                                                          name
                                                          "state372")))
                                                     (add1
                                                      (cdr
                                                       (assoc-ref
                                                        merged-input-state-hash
                                                        (string->symbol
                                                         (string-append
                                                          name
                                                          "state372")))))
                                                     0))))
                                                (append
                                                 (list
                                                  (cons
                                                   (string->symbol
                                                    (string-append
                                                     name
                                                     "state370"))
                                                   (cons
                                                    (signal-value btor374)
                                                    (if (assoc-has-key?
                                                         merged-input-state-hash
                                                         (string->symbol
                                                          (string-append
                                                           name
                                                           "state370")))
                                                      (add1
                                                       (cdr
                                                        (assoc-ref
                                                         merged-input-state-hash
                                                         (string->symbol
                                                          (string-append
                                                           name
                                                           "state370")))))
                                                      0))))
                                                 (append
                                                  (list
                                                   (cons
                                                    (string->symbol
                                                     (string-append
                                                      name
                                                      "state343"))
                                                    (cons
                                                     (signal-value btor1106)
                                                     (if (assoc-has-key?
                                                          merged-input-state-hash
                                                          (string->symbol
                                                           (string-append
                                                            name
                                                            "state343")))
                                                       (add1
                                                        (cdr
                                                         (assoc-ref
                                                          merged-input-state-hash
                                                          (string->symbol
                                                           (string-append
                                                            name
                                                            "state343")))))
                                                       0))))
                                                  (append
                                                   (list
                                                    (cons
                                                     (string->symbol
                                                      (string-append
                                                       name
                                                       "state340"))
                                                     (cons
                                                      (signal-value btor338)
                                                      (if (assoc-has-key?
                                                           merged-input-state-hash
                                                           (string->symbol
                                                            (string-append
                                                             name
                                                             "state340")))
                                                        (add1
                                                         (cdr
                                                          (assoc-ref
                                                           merged-input-state-hash
                                                           (string->symbol
                                                            (string-append
                                                             name
                                                             "state340")))))
                                                        0))))
                                                   (append
                                                    (list
                                                     (cons
                                                      (string->symbol
                                                       (string-append
                                                        name
                                                        "state339"))
                                                      (cons
                                                       (signal-value btor352)
                                                       (if (assoc-has-key?
                                                            merged-input-state-hash
                                                            (string->symbol
                                                             (string-append
                                                              name
                                                              "state339")))
                                                         (add1
                                                          (cdr
                                                           (assoc-ref
                                                            merged-input-state-hash
                                                            (string->symbol
                                                             (string-append
                                                              name
                                                              "state339")))))
                                                         0))))
                                                    (append
                                                     (list
                                                      (cons
                                                       (string->symbol
                                                        (string-append
                                                         name
                                                         "state333"))
                                                       (cons
                                                        (signal-value btor1102)
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
                                                         (string-append
                                                          name
                                                          "state331"))
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
                                                          (string-append
                                                           name
                                                           "state325"))
                                                         (cons
                                                          (signal-value
                                                           btor1098)
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
                                                           (string-append
                                                            name
                                                            "state324"))
                                                          (cons
                                                           (signal-value
                                                            btor327)
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
                                                            (signal-value
                                                             btor1094)
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
                                                             (signal-value
                                                              btor190)
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
                                                              (signal-value
                                                               btor1090)
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
                                                               (signal-value
                                                                btor173)
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
                                                                (signal-value
                                                                 btor1086)
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
                                                                 (signal-value
                                                                  btor158)
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
                                                                  (signal-value
                                                                   btor1082)
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
                                                                   (signal-value
                                                                    btor142)
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
                                                                    (signal-value
                                                                     btor1076)
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
                                                                     (signal-value
                                                                      btor129)
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
                                                                       btor1068)
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
                                                                          btor1061)
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
                                                                       (list))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
              merged-input-state-hash)
             equal?
             #:key
             car)))
      (list
       (cons 'PCOUT (signal (signal-value btor807) output-state))
       (cons 'PATTERNBDETECT (signal (signal-value btor855) output-state))
       (cons 'CARRYCASCOUT (signal (signal-value btor716) output-state))
       (cons 'P (signal (signal-value btor807) output-state))
       (cons 'CARRYOUT (signal (signal-value btor763) output-state))
       (cons 'UNDERFLOW (signal (signal-value btor869) output-state))
       (cons 'BCOUT (signal (signal-value btor146) output-state))
       (cons 'MULTSIGNOUT (signal (signal-value btor773) output-state))
       (cons 'OVERFLOW (signal (signal-value btor795) output-state))
       (cons 'ACOUT (signal (signal-value btor117) output-state))
       (cons 'PATTERNDETECT (signal (signal-value btor860) output-state))))))
