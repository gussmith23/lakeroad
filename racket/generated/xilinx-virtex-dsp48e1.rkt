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
      #:name
      (name ""))
    (let* ((merged-input-state-hash (list))
           (init-hash
            (append
             (list
              (cons
               (string->symbol (string-append name "state885"))
               (bv 0 (bitvector 1))))
             (append
              (list
               (cons
                (string->symbol (string-append name "state859"))
                (bv 0 (bitvector 1))))
              (append
               (list
                (cons
                 (string->symbol (string-append name "state857"))
                 (bv 0 (bitvector 48))))
               (append
                (list
                 (cons
                  (string->symbol (string-append name "state855"))
                  (bv 0 (bitvector 48))))
                (append
                 (list
                  (cons
                   (string->symbol (string-append name "state807"))
                   (bv 0 (bitvector 1))))
                 (append
                  (list
                   (cons
                    (string->symbol (string-append name "state801"))
                    (bv 0 (bitvector 1))))
                  (append
                   (list
                    (cons
                     (string->symbol (string-append name "state797"))
                     (bv 0 (bitvector 1))))
                   (append
                    (list
                     (cons
                      (string->symbol (string-append name "state787"))
                      (bv 0 (bitvector 1))))
                    (append
                     (list
                      (cons
                       (string->symbol (string-append name "state741"))
                       (bv 0 (bitvector 4))))
                     (append
                      (list
                       (cons
                        (string->symbol (string-append name "state739"))
                        (bv 0 (bitvector 4))))
                      (append
                       (list
                        (cons
                         (string->symbol (string-append name "state690"))
                         (bv 0 (bitvector 1))))
                       (append
                        (list
                         (cons
                          (string->symbol (string-append name "state669"))
                          (bv 0 (bitvector 1))))
                        (append
                         (list
                          (cons
                           (string->symbol (string-append name "state667"))
                           (bv 0 (bitvector 1))))
                         (append
                          (list
                           (cons
                            (string->symbol (string-append name "state659"))
                            (bv 0 (bitvector 1))))
                          (append
                           (list
                            (cons
                             (string->symbol (string-append name "state607"))
                             (bv 0 (bitvector 1))))
                           (append
                            (list
                             (cons
                              (string->symbol (string-append name "state605"))
                              (bv 0 (bitvector 4))))
                            (append
                             (list
                              (cons
                               (string->symbol (string-append name "state597"))
                               (bv 0 (bitvector 4))))
                             (append
                              (list
                               (cons
                                (string->symbol
                                 (string-append name "state481"))
                                (bv 0 (bitvector 48))))
                              (append
                               (list
                                (cons
                                 (string->symbol
                                  (string-append name "state405"))
                                 (bv 0 (bitvector 48))))
                               (append
                                (list
                                 (cons
                                  (string->symbol
                                   (string-append name "state390"))
                                  (bv 0 (bitvector 1))))
                                (append
                                 (list
                                  (cons
                                   (string->symbol
                                    (string-append name "state388"))
                                   (bv 0 (bitvector 7))))
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
                                      (string-append name "state351"))
                                     (bv 0 (bitvector 1))))
                                   (append
                                    (list
                                     (cons
                                      (string->symbol
                                       (string-append name "state349"))
                                      (bv 0 (bitvector 3))))
                                    (append
                                     (list
                                      (cons
                                       (string->symbol
                                        (string-append name "state342"))
                                       (bv 0 (bitvector 3))))
                                     (append
                                      (list
                                       (cons
                                        (string->symbol
                                         (string-append name "state334"))
                                        (bv 0 (bitvector 43))))
                                      (append
                                       (list
                                        (cons
                                         (string->symbol
                                          (string-append name "state197"))
                                         (bv 0 (bitvector 25))))
                                       (append
                                        (list
                                         (cons
                                          (string->symbol
                                           (string-append name "state180"))
                                          (bv 0 (bitvector 25))))
                                        (append
                                         (list
                                          (cons
                                           (string->symbol
                                            (string-append name "state165"))
                                           (bv 0 (bitvector 5))))
                                         (append
                                          (list
                                           (cons
                                            (string->symbol
                                             (string-append name "state151"))
                                            (bv 0 (bitvector 1))))
                                          (append
                                           (list
                                            (cons
                                             (string->symbol
                                              (string-append name "state149"))
                                             (bv 0 (bitvector 1))))
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
                                                (string-append
                                                 name
                                                 "state127"))
                                               (bv 0 (bitvector 18))))
                                             (append
                                              (list
                                               (cons
                                                (string->symbol
                                                 (string-append
                                                  name
                                                  "state111"))
                                                (bv 0 (bitvector 30))))
                                              (append
                                               (list
                                                (cons
                                                 (string->symbol
                                                  (string-append
                                                   name
                                                   "state92"))
                                                 (bv 1 (bitvector 1))))
                                               (append
                                                (list
                                                 (cons
                                                  (string->symbol
                                                   (string-append
                                                    name
                                                    "state89"))
                                                  (bv 0 (bitvector 30))))
                                                (list))))))))))))))))))))))))))))))))))))))
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
           (btor148 (bv->signal (bv 0 (bitvector 1))))
           (btor149
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state149")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state149"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state149")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state149")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor151
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state151")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state151"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state151")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state151")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor153
            (if (bitvector->bool (signal-value btor97)) btor151 btor149))
           (btor154
            (bv->signal
             (sign-extend (signal-value btor99) (bitvector 32))
             btor99))
           (btor155
            (signal
             (bool->bitvector
              (bveq (signal-value btor62) (signal-value btor154)))
             (list)))
           (btor156
            (if (bitvector->bool (signal-value btor155)) btor153 btor148))
           (btor157 (bitvector 13))
           (btor158 (bv->signal (bv 0 (bitvector 48))))
           (btor159 (bitvector 43))
           (btor160
            (signal
             (extract 24 0 (signal-value btor109))
             (signal-state btor109)))
           (btor161
            (signal
             (extract 24 0 (signal-value btor113))
             (signal-state btor113)))
           (btor162
            (signal
             (bvxor (signal-value btor47) (signal-value btor52))
             (list)))
           (btor163
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state163")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state163"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state163")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state163")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 5))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor164 (bv->signal (bv 0 (bitvector 5))))
           (btor165
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state165")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state165"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state165")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state165")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 5))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor167
            (if (bitvector->bool (signal-value btor97)) btor165 btor163))
           (btor168
            (bv->signal
             (sign-extend (signal-value btor99) (bitvector 32))
             btor99))
           (btor169
            (signal
             (bool->bitvector
              (bveq (signal-value btor48) (signal-value btor168)))
             (list)))
           (btor170
            (if (bitvector->bool (signal-value btor169)) btor167 btor162))
           (btor171
            (signal
             (apply bvor (bitvector->bits (signal-value btor48)))
             (signal-state btor48)))
           (btor172 (signal (bvnot (signal-value btor171)) (list)))
           (btor173
            (if (bitvector->bool (signal-value btor172)) btor162 btor170))
           (btor174
            (signal
             (extract 0 0 (signal-value btor173))
             (signal-state btor173)))
           (btor175
            (if (bitvector->bool (signal-value btor174)) btor161 btor160))
           (btor176 (bv->signal (bv 0 (bitvector 25))))
           (btor177
            (signal
             (extract 1 1 (signal-value btor173))
             (signal-state btor173)))
           (btor178
            (if (bitvector->bool (signal-value btor177)) btor176 btor175))
           (btor179
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state179")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state179"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state179")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state179")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 25))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor180
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state180")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state180"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state180")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state180")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 25))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor182
            (if (bitvector->bool (signal-value btor97)) btor180 btor179))
           (btor183
            (bv->signal
             (sign-extend (signal-value btor99) (bitvector 32))
             btor99))
           (btor184
            (signal
             (bool->bitvector
              (bveq (signal-value btor46) (signal-value btor183)))
             (list)))
           (btor185
            (if (bitvector->bool (signal-value btor184)) btor182 btor45))
           (btor186
            (signal
             (apply bvor (bitvector->bits (signal-value btor46)))
             (signal-state btor46)))
           (btor187 (signal (bvnot (signal-value btor186)) (list)))
           (btor188
            (if (bitvector->bool (signal-value btor187)) btor45 btor185))
           (btor189
            (signal
             (extract 2 2 (signal-value btor173))
             (signal-state btor173)))
           (btor190
            (if (bitvector->bool (signal-value btor189)) btor188 btor176))
           (btor191
            (signal
             (bvadd (signal-value btor178) (signal-value btor190))
             (list)))
           (btor192 (signal (bvneg (signal-value btor178)) (list)))
           (btor193
            (signal
             (bvadd (signal-value btor192) (signal-value btor190))
             (list)))
           (btor194
            (signal
             (extract 3 3 (signal-value btor173))
             (signal-state btor173)))
           (btor195
            (if (bitvector->bool (signal-value btor194)) btor193 btor191))
           (btor196
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state196")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state196"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state196")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state196")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 25))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor197
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state197")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state197"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state197")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state197")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 25))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor199
            (if (bitvector->bool (signal-value btor97)) btor197 btor196))
           (btor200
            (bv->signal
             (sign-extend (signal-value btor99) (bitvector 32))
             btor99))
           (btor201
            (signal
             (bool->bitvector
              (bveq (signal-value btor6) (signal-value btor200)))
             (list)))
           (btor202
            (if (bitvector->bool (signal-value btor201)) btor199 btor195))
           (btor203
            (signal
             (apply bvor (bitvector->bits (signal-value btor6)))
             (signal-state btor6)))
           (btor204 (signal (bvnot (signal-value btor203)) (list)))
           (btor205
            (if (bitvector->bool (signal-value btor204)) btor195 btor202))
           (btor206 (bv->signal (bv 9 (bitvector 4))))
           (btor207
            (bv->signal
             (zero-extend (signal-value btor206) (bitvector 5))
             btor206))
           (btor208
            (signal
             (bool->bitvector
              (bveq (signal-value btor75) (signal-value btor207)))
             (list)))
           (btor209
            (if (bitvector->bool (signal-value btor208)) btor205 btor178))
           (btor210
            (signal
             (extract 24 24 (signal-value btor209))
             (signal-state btor209)))
           (btor211 (bitvector 26))
           (btor212
            (signal
             (concat (signal-value btor210) (signal-value btor209))
             (list)))
           (btor213
            (signal
             (extract 24 24 (signal-value btor209))
             (signal-state btor209)))
           (btor214 (bitvector 27))
           (btor215
            (signal
             (concat (signal-value btor213) (signal-value btor212))
             (list)))
           (btor216
            (signal
             (extract 24 24 (signal-value btor209))
             (signal-state btor209)))
           (btor217 (bitvector 28))
           (btor218
            (signal
             (concat (signal-value btor216) (signal-value btor215))
             (list)))
           (btor219
            (signal
             (extract 24 24 (signal-value btor209))
             (signal-state btor209)))
           (btor220 (bitvector 29))
           (btor221
            (signal
             (concat (signal-value btor219) (signal-value btor218))
             (list)))
           (btor222
            (signal
             (extract 24 24 (signal-value btor209))
             (signal-state btor209)))
           (btor223
            (signal
             (concat (signal-value btor222) (signal-value btor221))
             (list)))
           (btor224
            (signal
             (extract 24 24 (signal-value btor209))
             (signal-state btor209)))
           (btor225 (bitvector 31))
           (btor226
            (signal
             (concat (signal-value btor224) (signal-value btor223))
             (list)))
           (btor227
            (signal
             (extract 24 24 (signal-value btor209))
             (signal-state btor209)))
           (btor228
            (signal
             (concat (signal-value btor227) (signal-value btor226))
             (list)))
           (btor229
            (signal
             (extract 24 24 (signal-value btor209))
             (signal-state btor209)))
           (btor230 (bitvector 33))
           (btor231
            (signal
             (concat (signal-value btor229) (signal-value btor228))
             (list)))
           (btor232
            (signal
             (extract 24 24 (signal-value btor209))
             (signal-state btor209)))
           (btor233 (bitvector 34))
           (btor234
            (signal
             (concat (signal-value btor232) (signal-value btor231))
             (list)))
           (btor235
            (signal
             (extract 24 24 (signal-value btor209))
             (signal-state btor209)))
           (btor236 (bitvector 35))
           (btor237
            (signal
             (concat (signal-value btor235) (signal-value btor234))
             (list)))
           (btor238
            (signal
             (extract 24 24 (signal-value btor209))
             (signal-state btor209)))
           (btor239 (bitvector 36))
           (btor240
            (signal
             (concat (signal-value btor238) (signal-value btor237))
             (list)))
           (btor241
            (signal
             (extract 24 24 (signal-value btor209))
             (signal-state btor209)))
           (btor242 (bitvector 37))
           (btor243
            (signal
             (concat (signal-value btor241) (signal-value btor240))
             (list)))
           (btor244
            (signal
             (extract 24 24 (signal-value btor209))
             (signal-state btor209)))
           (btor245 (bitvector 38))
           (btor246
            (signal
             (concat (signal-value btor244) (signal-value btor243))
             (list)))
           (btor247
            (signal
             (extract 24 24 (signal-value btor209))
             (signal-state btor209)))
           (btor248 (bitvector 39))
           (btor249
            (signal
             (concat (signal-value btor247) (signal-value btor246))
             (list)))
           (btor250
            (signal
             (extract 24 24 (signal-value btor209))
             (signal-state btor209)))
           (btor251 (bitvector 40))
           (btor252
            (signal
             (concat (signal-value btor250) (signal-value btor249))
             (list)))
           (btor253
            (signal
             (extract 24 24 (signal-value btor209))
             (signal-state btor209)))
           (btor254 (bitvector 41))
           (btor255
            (signal
             (concat (signal-value btor253) (signal-value btor252))
             (list)))
           (btor256
            (signal
             (extract 24 24 (signal-value btor209))
             (signal-state btor209)))
           (btor257 (bitvector 42))
           (btor258
            (signal
             (concat (signal-value btor256) (signal-value btor255))
             (list)))
           (btor259
            (signal
             (extract 24 24 (signal-value btor209))
             (signal-state btor209)))
           (btor260
            (signal
             (concat (signal-value btor259) (signal-value btor258))
             (list)))
           (btor261
            (signal
             (extract 4 4 (signal-value btor173))
             (signal-state btor173)))
           (btor262
            (if (bitvector->bool (signal-value btor261)) btor142 btor138))
           (btor263
            (signal
             (extract 17 17 (signal-value btor262))
             (signal-state btor262)))
           (btor264 (bitvector 19))
           (btor265
            (signal
             (concat (signal-value btor263) (signal-value btor262))
             (list)))
           (btor266
            (signal
             (extract 17 17 (signal-value btor262))
             (signal-state btor262)))
           (btor267 (bitvector 20))
           (btor268
            (signal
             (concat (signal-value btor266) (signal-value btor265))
             (list)))
           (btor269
            (signal
             (extract 17 17 (signal-value btor262))
             (signal-state btor262)))
           (btor270 (bitvector 21))
           (btor271
            (signal
             (concat (signal-value btor269) (signal-value btor268))
             (list)))
           (btor272
            (signal
             (extract 17 17 (signal-value btor262))
             (signal-state btor262)))
           (btor273 (bitvector 22))
           (btor274
            (signal
             (concat (signal-value btor272) (signal-value btor271))
             (list)))
           (btor275
            (signal
             (extract 17 17 (signal-value btor262))
             (signal-state btor262)))
           (btor276 (bitvector 23))
           (btor277
            (signal
             (concat (signal-value btor275) (signal-value btor274))
             (list)))
           (btor278
            (signal
             (extract 17 17 (signal-value btor262))
             (signal-state btor262)))
           (btor279 (bitvector 24))
           (btor280
            (signal
             (concat (signal-value btor278) (signal-value btor277))
             (list)))
           (btor281
            (signal
             (extract 17 17 (signal-value btor262))
             (signal-state btor262)))
           (btor282
            (signal
             (concat (signal-value btor281) (signal-value btor280))
             (list)))
           (btor283
            (signal
             (extract 17 17 (signal-value btor262))
             (signal-state btor262)))
           (btor284
            (signal
             (concat (signal-value btor283) (signal-value btor282))
             (list)))
           (btor285
            (signal
             (extract 17 17 (signal-value btor262))
             (signal-state btor262)))
           (btor286
            (signal
             (concat (signal-value btor285) (signal-value btor284))
             (list)))
           (btor287
            (signal
             (extract 17 17 (signal-value btor262))
             (signal-state btor262)))
           (btor288
            (signal
             (concat (signal-value btor287) (signal-value btor286))
             (list)))
           (btor289
            (signal
             (extract 17 17 (signal-value btor262))
             (signal-state btor262)))
           (btor290
            (signal
             (concat (signal-value btor289) (signal-value btor288))
             (list)))
           (btor291
            (signal
             (extract 17 17 (signal-value btor262))
             (signal-state btor262)))
           (btor292
            (signal
             (concat (signal-value btor291) (signal-value btor290))
             (list)))
           (btor293
            (signal
             (extract 17 17 (signal-value btor262))
             (signal-state btor262)))
           (btor294
            (signal
             (concat (signal-value btor293) (signal-value btor292))
             (list)))
           (btor295
            (signal
             (extract 17 17 (signal-value btor262))
             (signal-state btor262)))
           (btor296
            (signal
             (concat (signal-value btor295) (signal-value btor294))
             (list)))
           (btor297
            (signal
             (extract 17 17 (signal-value btor262))
             (signal-state btor262)))
           (btor298
            (signal
             (concat (signal-value btor297) (signal-value btor296))
             (list)))
           (btor299
            (signal
             (extract 17 17 (signal-value btor262))
             (signal-state btor262)))
           (btor300
            (signal
             (concat (signal-value btor299) (signal-value btor298))
             (list)))
           (btor301
            (signal
             (extract 17 17 (signal-value btor262))
             (signal-state btor262)))
           (btor302
            (signal
             (concat (signal-value btor301) (signal-value btor300))
             (list)))
           (btor303
            (signal
             (extract 17 17 (signal-value btor262))
             (signal-state btor262)))
           (btor304
            (signal
             (concat (signal-value btor303) (signal-value btor302))
             (list)))
           (btor305
            (signal
             (extract 17 17 (signal-value btor262))
             (signal-state btor262)))
           (btor306
            (signal
             (concat (signal-value btor305) (signal-value btor304))
             (list)))
           (btor307
            (signal
             (extract 17 17 (signal-value btor262))
             (signal-state btor262)))
           (btor308
            (signal
             (concat (signal-value btor307) (signal-value btor306))
             (list)))
           (btor309
            (signal
             (extract 17 17 (signal-value btor262))
             (signal-state btor262)))
           (btor310
            (signal
             (concat (signal-value btor309) (signal-value btor308))
             (list)))
           (btor311
            (signal
             (extract 17 17 (signal-value btor262))
             (signal-state btor262)))
           (btor312
            (signal
             (concat (signal-value btor311) (signal-value btor310))
             (list)))
           (btor313
            (signal
             (extract 17 17 (signal-value btor262))
             (signal-state btor262)))
           (btor314
            (signal
             (concat (signal-value btor313) (signal-value btor312))
             (list)))
           (btor315
            (signal
             (extract 17 17 (signal-value btor262))
             (signal-state btor262)))
           (btor316
            (signal
             (concat (signal-value btor315) (signal-value btor314))
             (list)))
           (btor317
            (signal
             (extract 17 17 (signal-value btor262))
             (signal-state btor262)))
           (btor318
            (signal
             (concat (signal-value btor317) (signal-value btor316))
             (list)))
           (btor319
            (signal
             (bvmul (signal-value btor260) (signal-value btor318))
             (list)))
           (btor320 (bv->signal (bv 0 (bitvector 43))))
           (btor321 (bv->signal (bv 2 (bitvector 2))))
           (btor322
            (bv->signal
             (zero-extend (signal-value btor321) (bitvector 3))
             btor321))
           (btor323
            (signal
             (bool->bitvector
              (bveq (signal-value btor27) (signal-value btor322)))
             (list)))
           (btor324
            (if (bitvector->bool (signal-value btor323)) btor320 btor319))
           (btor325 (bv->signal (bv 11 (bitvector 4))))
           (btor326
            (bv->signal
             (zero-extend (signal-value btor325) (bitvector 5))
             btor325))
           (btor327
            (signal
             (bool->bitvector
              (bveq (signal-value btor76) (signal-value btor326)))
             (list)))
           (btor328 (bv->signal (bv 7 (bitvector 3))))
           (btor329
            (bv->signal
             (zero-extend (signal-value btor328) (bitvector 5))
             btor328))
           (btor330
            (signal
             (bool->bitvector
              ((compose1 not bveq)
               (signal-value btor78)
               (signal-value btor329)))
             (list)))
           (btor331
            (signal
             (bvor (signal-value btor327) (signal-value btor330))
             (list)))
           (btor332
            (if (bitvector->bool (signal-value btor331)) btor320 btor324))
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
                          (bv 0 43))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor334
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state334")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state334"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state334")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state334")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 43))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor336
            (if (bitvector->bool (signal-value btor97)) btor334 btor333))
           (btor337
            (bv->signal
             (sign-extend (signal-value btor99) (bitvector 32))
             btor99))
           (btor338
            (signal
             (bool->bitvector
              (bveq (signal-value btor56) (signal-value btor337)))
             (list)))
           (btor339
            (if (bitvector->bool (signal-value btor338)) btor336 btor332))
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
           (btor341 (bv->signal (bv 0 (bitvector 3))))
           (btor342
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state342")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state342"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state342")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state342")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 3))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor344
            (if (bitvector->bool (signal-value btor97)) btor342 btor340))
           (btor345
            (signal
             (apply bvor (bitvector->bits (signal-value btor28)))
             (signal-state btor28)))
           (btor346 (signal (bvnot (signal-value btor345)) (list)))
           (btor347
            (if (bitvector->bool (signal-value btor346)) btor27 btor344))
           (btor348
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state348")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state348"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state348")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state348")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 3))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor349
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state349")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state349"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state349")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state349")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 3))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor351
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state351")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state351"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state351")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state351")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor353
            (if (bitvector->bool (signal-value btor351)) btor349 btor348))
           (btor354 (signal (bvnot (signal-value btor346)) (list)))
           (btor355
            (bv->signal
             (sign-extend (signal-value btor99) (bitvector 32))
             btor99))
           (btor356
            (signal
             (bool->bitvector
              (bveq (signal-value btor28) (signal-value btor355)))
             (list)))
           (btor357 (signal (bvnot (signal-value btor356)) (list)))
           (btor358
            (signal
             (bvand (signal-value btor354) (signal-value btor357))
             (list)))
           (btor359
            (signal
             (bvand (signal-value btor354) (signal-value btor358))
             (list)))
           (btor360
            (if (bitvector->bool (signal-value btor359)) btor353 btor347))
           (btor361
            (bv->signal
             (zero-extend (signal-value btor321) (bitvector 3))
             btor321))
           (btor362
            (signal
             (bool->bitvector
              (bveq (signal-value btor360) (signal-value btor361)))
             (list)))
           (btor363
            (if (bitvector->bool (signal-value btor362)) btor320 btor339))
           (btor364
            (signal
             (extract 42 42 (signal-value btor363))
             (signal-state btor363)))
           (btor365 (bitvector 44))
           (btor366
            (signal
             (concat (signal-value btor364) (signal-value btor363))
             (list)))
           (btor367
            (signal
             (extract 42 42 (signal-value btor363))
             (signal-state btor363)))
           (btor368 (bitvector 45))
           (btor369
            (signal
             (concat (signal-value btor367) (signal-value btor366))
             (list)))
           (btor370
            (signal
             (extract 42 42 (signal-value btor363))
             (signal-state btor363)))
           (btor371 (bitvector 46))
           (btor372
            (signal
             (concat (signal-value btor370) (signal-value btor369))
             (list)))
           (btor373
            (signal
             (extract 42 42 (signal-value btor363))
             (signal-state btor363)))
           (btor374 (bitvector 47))
           (btor375
            (signal
             (concat (signal-value btor373) (signal-value btor372))
             (list)))
           (btor376
            (signal
             (extract 42 42 (signal-value btor363))
             (signal-state btor363)))
           (btor377
            (signal
             (concat (signal-value btor376) (signal-value btor375))
             (list)))
           (btor378
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state378")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state378"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state378")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state378")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 7))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor379 (bv->signal (bv 0 (bitvector 7))))
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
            (if (bitvector->bool (signal-value btor97)) btor380 btor378))
           (btor383
            (signal
             (bvxor (signal-value btor58) (signal-value btor54))
             (list)))
           (btor384
            (signal
             (apply bvor (bitvector->bits (signal-value btor59)))
             (signal-state btor59)))
           (btor385 (signal (bvnot (signal-value btor384)) (list)))
           (btor386
            (if (bitvector->bool (signal-value btor385)) btor383 btor382))
           (btor387
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state387")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state387"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state387")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state387")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 7))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor388
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state388")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state388"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state388")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state388")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 7))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor390
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state390")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state390"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state390")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state390")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor392
            (if (bitvector->bool (signal-value btor390)) btor388 btor387))
           (btor393 (signal (bvnot (signal-value btor385)) (list)))
           (btor394
            (bv->signal
             (sign-extend (signal-value btor99) (bitvector 32))
             btor99))
           (btor395
            (signal
             (bool->bitvector
              (bveq (signal-value btor59) (signal-value btor394)))
             (list)))
           (btor396 (signal (bvnot (signal-value btor395)) (list)))
           (btor397
            (signal
             (bvand (signal-value btor393) (signal-value btor396))
             (list)))
           (btor398
            (signal
             (bvand (signal-value btor393) (signal-value btor397))
             (list)))
           (btor399
            (if (bitvector->bool (signal-value btor398)) btor392 btor386))
           (btor400
            (signal
             (extract 1 0 (signal-value btor399))
             (signal-state btor399)))
           (btor401
            (bv->signal
             (zero-extend (signal-value btor83) (bitvector 2))
             btor83))
           (btor402
            (signal
             (bool->bitvector
              (bveq (signal-value btor400) (signal-value btor401)))
             (list)))
           (btor403
            (if (bitvector->bool (signal-value btor402)) btor377 btor158))
           (btor404
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state404")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state404"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state404")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state404")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 48))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor405
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state405")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state405"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state405")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state405")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 48))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor407
            (if (bitvector->bool (signal-value btor97)) btor405 btor404))
           (btor408
            (signal
             (concat (signal-value btor109) (signal-value btor138))
             (list)))
           (btor409 (bv->signal (bv 3 (bitvector 2))))
           (btor410
            (signal
             (bool->bitvector
              (bveq (signal-value btor400) (signal-value btor409)))
             (list)))
           (btor411
            (if (bitvector->bool (signal-value btor410)) btor408 btor407))
           (btor412
            (signal
             (bool->bitvector
              (bveq (signal-value btor400) (signal-value btor321)))
             (list)))
           (btor413
            (signal
             (bvor (signal-value btor412) (signal-value btor410))
             (list)))
           (btor414
            (if (bitvector->bool (signal-value btor413)) btor411 btor403))
           (btor415 (bv->signal (bv 281474976710655 (bitvector 48))))
           (btor416
            (signal
             (concat (signal-value btor57) (signal-value btor57))
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
           (btor420 (bitvector 6))
           (btor421
            (signal
             (concat (signal-value btor57) (signal-value btor419))
             (list)))
           (btor422
            (signal
             (concat (signal-value btor57) (signal-value btor421))
             (list)))
           (btor423 (bitvector 8))
           (btor424
            (signal
             (concat (signal-value btor57) (signal-value btor422))
             (list)))
           (btor425 (bitvector 9))
           (btor426
            (signal
             (concat (signal-value btor57) (signal-value btor424))
             (list)))
           (btor427 (bitvector 10))
           (btor428
            (signal
             (concat (signal-value btor57) (signal-value btor426))
             (list)))
           (btor429 (bitvector 11))
           (btor430
            (signal
             (concat (signal-value btor57) (signal-value btor428))
             (list)))
           (btor431 (bitvector 12))
           (btor432
            (signal
             (concat (signal-value btor57) (signal-value btor430))
             (list)))
           (btor433
            (signal
             (concat (signal-value btor57) (signal-value btor432))
             (list)))
           (btor434 (bitvector 14))
           (btor435
            (signal
             (concat (signal-value btor57) (signal-value btor433))
             (list)))
           (btor436 (bitvector 15))
           (btor437
            (signal
             (concat (signal-value btor57) (signal-value btor435))
             (list)))
           (btor438 (bitvector 16))
           (btor439
            (signal
             (concat (signal-value btor57) (signal-value btor437))
             (list)))
           (btor440 (bitvector 17))
           (btor441
            (signal
             (concat (signal-value btor57) (signal-value btor439))
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
             (concat (signal-value btor57) (signal-value btor464))
             (list)))
           (btor466
            (signal
             (concat (signal-value btor57) (signal-value btor465))
             (list)))
           (btor467
            (signal
             (concat (signal-value btor57) (signal-value btor466))
             (list)))
           (btor468
            (signal
             (concat (signal-value btor57) (signal-value btor467))
             (list)))
           (btor469
            (signal
             (concat (signal-value btor57) (signal-value btor468))
             (list)))
           (btor470
            (signal
             (concat (signal-value btor57) (signal-value btor469))
             (list)))
           (btor471
            (signal
             (concat (signal-value btor57) (signal-value btor470))
             (list)))
           (btor472
            (signal
             (concat (signal-value btor57) (signal-value btor471))
             (list)))
           (btor473
            (signal
             (extract 6 4 (signal-value btor399))
             (signal-state btor399)))
           (btor474 (bv->signal (bv 4 (bitvector 3))))
           (btor475
            (signal
             (bool->bitvector
              (bveq (signal-value btor473) (signal-value btor474)))
             (list)))
           (btor476
            (if (bitvector->bool (signal-value btor475)) btor472 btor415))
           (btor477
            (signal
             (extract 3 2 (signal-value btor399))
             (signal-state btor399)))
           (btor478
            (signal
             (bool->bitvector
              (bveq (signal-value btor477) (signal-value btor321)))
             (list)))
           (btor479
            (if (bitvector->bool (signal-value btor478)) btor476 btor158))
           (btor480
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state480")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state480"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state480")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state480")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 48))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor481
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state481")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state481"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state481")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state481")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 48))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor483
            (if (bitvector->bool (signal-value btor97)) btor481 btor480))
           (btor484
            (bv->signal
             (sign-extend (signal-value btor99) (bitvector 32))
             btor99))
           (btor485
            (signal
             (bool->bitvector
              (bveq (signal-value btor43) (signal-value btor484)))
             (list)))
           (btor486
            (if (bitvector->bool (signal-value btor485)) btor483 btor21))
           (btor487
            (signal
             (apply bvor (bitvector->bits (signal-value btor43)))
             (signal-state btor43)))
           (btor488 (signal (bvnot (signal-value btor487)) (list)))
           (btor489
            (if (bitvector->bool (signal-value btor488)) btor21 btor486))
           (btor490
            (signal
             (bool->bitvector
              (bveq (signal-value btor477) (signal-value btor409)))
             (list)))
           (btor491
            (if (bitvector->bool (signal-value btor490)) btor489 btor479))
           (btor492
            (signal
             (bvand (signal-value btor414) (signal-value btor491))
             (list)))
           (btor493
            (bv->signal
             (zero-extend (signal-value btor83) (bitvector 3))
             btor83))
           (btor494
            (signal
             (bool->bitvector
              (bveq (signal-value btor473) (signal-value btor493)))
             (list)))
           (btor495
            (if (bitvector->bool (signal-value btor494)) btor61 btor158))
           (btor496
            (bv->signal
             (zero-extend (signal-value btor409) (bitvector 3))
             btor409))
           (btor497
            (signal
             (bool->bitvector
              (bveq (signal-value btor473) (signal-value btor496)))
             (list)))
           (btor498
            (if (bitvector->bool (signal-value btor497)) btor489 btor495))
           (btor499
            (signal
             (extract 47 17 (signal-value btor61))
             (signal-state btor61)))
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
           (btor526
            (signal
             (extract 47 47 (signal-value btor61))
             (signal-state btor61)))
           (btor527
            (signal
             (concat (signal-value btor526) (signal-value btor525))
             (list)))
           (btor528
            (signal
             (extract 47 47 (signal-value btor61))
             (signal-state btor61)))
           (btor529
            (signal
             (concat (signal-value btor528) (signal-value btor527))
             (list)))
           (btor530
            (signal
             (extract 47 47 (signal-value btor61))
             (signal-state btor61)))
           (btor531
            (signal
             (concat (signal-value btor530) (signal-value btor529))
             (list)))
           (btor532
            (signal
             (extract 47 47 (signal-value btor61))
             (signal-state btor61)))
           (btor533
            (signal
             (concat (signal-value btor532) (signal-value btor531))
             (list)))
           (btor534 (bv->signal (bv 5 (bitvector 3))))
           (btor535
            (signal
             (bool->bitvector
              (bveq (signal-value btor473) (signal-value btor534)))
             (list)))
           (btor536
            (if (bitvector->bool (signal-value btor535)) btor533 btor407))
           (btor537
            (signal
             (extract 47 17 (signal-value btor407))
             (signal-state btor407)))
           (btor538
            (signal
             (extract 47 47 (signal-value btor407))
             (signal-state btor407)))
           (btor539
            (signal
             (concat (signal-value btor538) (signal-value btor537))
             (list)))
           (btor540
            (signal
             (extract 47 47 (signal-value btor407))
             (signal-state btor407)))
           (btor541
            (signal
             (concat (signal-value btor540) (signal-value btor539))
             (list)))
           (btor542
            (signal
             (extract 47 47 (signal-value btor407))
             (signal-state btor407)))
           (btor543
            (signal
             (concat (signal-value btor542) (signal-value btor541))
             (list)))
           (btor544
            (signal
             (extract 47 47 (signal-value btor407))
             (signal-state btor407)))
           (btor545
            (signal
             (concat (signal-value btor544) (signal-value btor543))
             (list)))
           (btor546
            (signal
             (extract 47 47 (signal-value btor407))
             (signal-state btor407)))
           (btor547
            (signal
             (concat (signal-value btor546) (signal-value btor545))
             (list)))
           (btor548
            (signal
             (extract 47 47 (signal-value btor407))
             (signal-state btor407)))
           (btor549
            (signal
             (concat (signal-value btor548) (signal-value btor547))
             (list)))
           (btor550
            (signal
             (extract 47 47 (signal-value btor407))
             (signal-state btor407)))
           (btor551
            (signal
             (concat (signal-value btor550) (signal-value btor549))
             (list)))
           (btor552
            (signal
             (extract 47 47 (signal-value btor407))
             (signal-state btor407)))
           (btor553
            (signal
             (concat (signal-value btor552) (signal-value btor551))
             (list)))
           (btor554
            (signal
             (extract 47 47 (signal-value btor407))
             (signal-state btor407)))
           (btor555
            (signal
             (concat (signal-value btor554) (signal-value btor553))
             (list)))
           (btor556
            (signal
             (extract 47 47 (signal-value btor407))
             (signal-state btor407)))
           (btor557
            (signal
             (concat (signal-value btor556) (signal-value btor555))
             (list)))
           (btor558
            (signal
             (extract 47 47 (signal-value btor407))
             (signal-state btor407)))
           (btor559
            (signal
             (concat (signal-value btor558) (signal-value btor557))
             (list)))
           (btor560
            (signal
             (extract 47 47 (signal-value btor407))
             (signal-state btor407)))
           (btor561
            (signal
             (concat (signal-value btor560) (signal-value btor559))
             (list)))
           (btor562
            (signal
             (extract 47 47 (signal-value btor407))
             (signal-state btor407)))
           (btor563
            (signal
             (concat (signal-value btor562) (signal-value btor561))
             (list)))
           (btor564
            (signal
             (extract 47 47 (signal-value btor407))
             (signal-state btor407)))
           (btor565
            (signal
             (concat (signal-value btor564) (signal-value btor563))
             (list)))
           (btor566
            (signal
             (extract 47 47 (signal-value btor407))
             (signal-state btor407)))
           (btor567
            (signal
             (concat (signal-value btor566) (signal-value btor565))
             (list)))
           (btor568
            (signal
             (extract 47 47 (signal-value btor407))
             (signal-state btor407)))
           (btor569
            (signal
             (concat (signal-value btor568) (signal-value btor567))
             (list)))
           (btor570
            (signal
             (extract 47 47 (signal-value btor407))
             (signal-state btor407)))
           (btor571
            (signal
             (concat (signal-value btor570) (signal-value btor569))
             (list)))
           (btor572
            (signal
             (bool->bitvector
              (bveq (signal-value btor473) (signal-value btor328)))
             (list)))
           (btor573 (bv->signal (bv 6 (bitvector 3))))
           (btor574
            (signal
             (bool->bitvector
              (bveq (signal-value btor473) (signal-value btor573)))
             (list)))
           (btor575
            (signal
             (concat (signal-value btor574) (signal-value btor572))
             (list)))
           (btor576
            (signal
             (apply bvor (bitvector->bits (signal-value btor575)))
             (signal-state btor575)))
           (btor577
            (if (bitvector->bool (signal-value btor576)) btor571 btor536))
           (btor578
            (bv->signal
             (zero-extend (signal-value btor321) (bitvector 3))
             btor321))
           (btor579
            (signal
             (bool->bitvector
              (bveq (signal-value btor473) (signal-value btor578)))
             (list)))
           (btor580
            (signal
             (concat (signal-value btor572) (signal-value btor475))
             (list)))
           (btor581
            (signal
             (concat (signal-value btor574) (signal-value btor580))
             (list)))
           (btor582
            (signal
             (concat (signal-value btor535) (signal-value btor581))
             (list)))
           (btor583
            (signal
             (concat (signal-value btor579) (signal-value btor582))
             (list)))
           (btor584
            (signal
             (apply bvor (bitvector->bits (signal-value btor583)))
             (signal-state btor583)))
           (btor585
            (if (bitvector->bool (signal-value btor584)) btor577 btor498))
           (btor586
            (signal
             (bvand (signal-value btor585) (signal-value btor491))
             (list)))
           (btor587
            (signal
             (bvor (signal-value btor492) (signal-value btor586))
             (list)))
           (btor588
            (signal
             (bvand (signal-value btor414) (signal-value btor585))
             (list)))
           (btor589
            (signal
             (bvor (signal-value btor587) (signal-value btor588))
             (list)))
           (btor590 (signal (bvnot (signal-value btor585)) (list)))
           (btor591
            (signal
             (bvand (signal-value btor590) (signal-value btor491))
             (list)))
           (btor592
            (signal
             (bvor (signal-value btor492) (signal-value btor591))
             (list)))
           (btor593
            (signal
             (bvand (signal-value btor414) (signal-value btor590))
             (list)))
           (btor594
            (signal
             (bvor (signal-value btor592) (signal-value btor593))
             (list)))
           (btor595
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state595")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state595"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state595")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state595")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 4))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor596 (bv->signal (bv 0 (bitvector 4))))
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
            (if (bitvector->bool (signal-value btor97)) btor597 btor595))
           (btor600
            (signal (bvxor (signal-value btor8) (signal-value btor49)) (list)))
           (btor601
            (signal
             (apply bvor (bitvector->bits (signal-value btor9)))
             (signal-state btor9)))
           (btor602 (signal (bvnot (signal-value btor601)) (list)))
           (btor603
            (if (bitvector->bool (signal-value btor602)) btor600 btor599))
           (btor604
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state604")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state604"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state604")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state604")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 4))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor605
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state605")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state605"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state605")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state605")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 4))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor607
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state607")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state607"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state607")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state607")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor609
            (if (bitvector->bool (signal-value btor607)) btor605 btor604))
           (btor610 (signal (bvnot (signal-value btor602)) (list)))
           (btor611
            (bv->signal
             (sign-extend (signal-value btor99) (bitvector 32))
             btor99))
           (btor612
            (signal
             (bool->bitvector
              (bveq (signal-value btor9) (signal-value btor611)))
             (list)))
           (btor613 (signal (bvnot (signal-value btor612)) (list)))
           (btor614
            (signal
             (bvand (signal-value btor610) (signal-value btor613))
             (list)))
           (btor615
            (signal
             (bvand (signal-value btor610) (signal-value btor614))
             (list)))
           (btor616
            (if (bitvector->bool (signal-value btor615)) btor609 btor603))
           (btor617
            (signal
             (extract 0 0 (signal-value btor616))
             (signal-state btor616)))
           (btor618
            (if (bitvector->bool (signal-value btor617)) btor594 btor589))
           (btor619
            (signal
             (extract 2 2 (signal-value btor616))
             (signal-state btor616)))
           (btor620
            (if (bitvector->bool (signal-value btor619)) btor158 btor618))
           (btor621
            (signal
             (extract 35 35 (signal-value btor620))
             (signal-state btor620)))
           (btor622 (bv->signal (bv 13 (bitvector 4))))
           (btor623
            (bv->signal
             (zero-extend (signal-value btor622) (bitvector 5))
             btor622))
           (btor624
            (signal
             (bool->bitvector
              (bveq (signal-value btor78) (signal-value btor623)))
             (list)))
           (btor625
            (if (bitvector->bool (signal-value btor624)) btor148 btor621))
           (btor626
            (signal
             (extract 47 36 (signal-value btor620))
             (signal-state btor620)))
           (btor627
            (signal
             (concat (signal-value btor626) (signal-value btor625))
             (list)))
           (btor628
            (signal
             (bvxor (signal-value btor585) (signal-value btor414))
             (list)))
           (btor629
            (signal
             (bvxor (signal-value btor628) (signal-value btor491))
             (list)))
           (btor630
            (signal
             (bvxor (signal-value btor590) (signal-value btor414))
             (list)))
           (btor631
            (signal
             (bvxor (signal-value btor630) (signal-value btor491))
             (list)))
           (btor632
            (if (bitvector->bool (signal-value btor617)) btor631 btor629))
           (btor633
            (signal
             (extract 3 3 (signal-value btor616))
             (signal-state btor616)))
           (btor634
            (if (bitvector->bool (signal-value btor633)) btor618 btor632))
           (btor635
            (signal
             (extract 47 36 (signal-value btor634))
             (signal-state btor634)))
           (btor636
            (bv->signal
             (zero-extend (signal-value btor635) (bitvector 13))
             btor635))
           (btor637
            (signal
             (bvadd (signal-value btor627) (signal-value btor636))
             (list)))
           (btor638
            (signal
             (extract 23 23 (signal-value btor620))
             (signal-state btor620)))
           (btor639 (bv->signal (bv 12 (bitvector 4))))
           (btor640
            (bv->signal
             (zero-extend (signal-value btor639) (bitvector 5))
             btor639))
           (btor641
            (signal
             (bool->bitvector
              (bveq (signal-value btor78) (signal-value btor640)))
             (list)))
           (btor642
            (signal
             (bvor (signal-value btor641) (signal-value btor624))
             (list)))
           (btor643
            (if (bitvector->bool (signal-value btor642)) btor148 btor638))
           (btor644
            (signal
             (extract 34 24 (signal-value btor620))
             (signal-state btor620)))
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
             (extract 35 24 (signal-value btor634))
             (signal-state btor634)))
           (btor648
            (bv->signal
             (zero-extend (signal-value btor647) (bitvector 13))
             btor647))
           (btor649
            (signal
             (bvadd (signal-value btor646) (signal-value btor648))
             (list)))
           (btor650
            (signal
             (extract 11 11 (signal-value btor620))
             (signal-state btor620)))
           (btor651
            (if (bitvector->bool (signal-value btor624)) btor148 btor650))
           (btor652
            (signal
             (extract 22 12 (signal-value btor620))
             (signal-state btor620)))
           (btor653
            (signal
             (concat (signal-value btor652) (signal-value btor651))
             (list)))
           (btor654
            (bv->signal
             (zero-extend (signal-value btor653) (bitvector 13))
             btor653))
           (btor655
            (signal
             (extract 23 12 (signal-value btor634))
             (signal-state btor634)))
           (btor656
            (bv->signal
             (zero-extend (signal-value btor655) (bitvector 13))
             btor655))
           (btor657
            (signal
             (bvadd (signal-value btor654) (signal-value btor656))
             (list)))
           (btor658
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state658")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state658"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state658")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state658")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor659
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state659")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state659"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state659")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state659")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor661
            (if (bitvector->bool (signal-value btor97)) btor659 btor658))
           (btor662
            (signal
             (bvxor (signal-value btor24) (signal-value btor50))
             (list)))
           (btor663
            (signal
             (apply bvor (bitvector->bits (signal-value btor25)))
             (signal-state btor25)))
           (btor664 (signal (bvnot (signal-value btor663)) (list)))
           (btor665
            (if (bitvector->bool (signal-value btor664)) btor662 btor661))
           (btor666
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state666")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state666"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state666")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state666")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor667
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state667")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state667"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state667")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state667")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor669
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state669")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state669"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state669")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state669")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor671
            (if (bitvector->bool (signal-value btor669)) btor667 btor666))
           (btor672 (signal (bvnot (signal-value btor664)) (list)))
           (btor673
            (bv->signal
             (sign-extend (signal-value btor99) (bitvector 32))
             btor99))
           (btor674
            (signal
             (bool->bitvector
              (bveq (signal-value btor25) (signal-value btor673)))
             (list)))
           (btor675 (signal (bvnot (signal-value btor674)) (list)))
           (btor676
            (signal
             (bvand (signal-value btor672) (signal-value btor675))
             (list)))
           (btor677
            (signal
             (bvand (signal-value btor672) (signal-value btor676))
             (list)))
           (btor678
            (if (bitvector->bool (signal-value btor677)) btor671 btor665))
           (btor679
            (signal
             (extract 47 47 (signal-value btor61))
             (signal-state btor61)))
           (btor680 (signal (bvnot (signal-value btor679)) (list)))
           (btor681
            (bv->signal
             (zero-extend (signal-value btor83) (bitvector 3))
             btor83))
           (btor682
            (signal
             (bool->bitvector
              (bveq (signal-value btor360) (signal-value btor681)))
             (list)))
           (btor683
            (if (bitvector->bool (signal-value btor682)) btor680 btor678))
           (btor684
            (bv->signal
             (zero-extend (signal-value btor409) (bitvector 3))
             btor409))
           (btor685
            (signal
             (bool->bitvector
              (bveq (signal-value btor360) (signal-value btor684)))
             (list)))
           (btor686
            (if (bitvector->bool (signal-value btor685)) btor679 btor23))
           (btor687
            (signal
             (bvor (signal-value btor362) (signal-value btor685))
             (list)))
           (btor688
            (if (bitvector->bool (signal-value btor687)) btor686 btor683))
           (btor689
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state689")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state689"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state689")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state689")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor690
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state690")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state690"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state690")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state690")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor692
            (if (bitvector->bool (signal-value btor97)) btor690 btor689))
           (btor693
            (signal
             (extract 24 24 (signal-value btor209))
             (signal-state btor209)))
           (btor694
            (signal
             (extract 17 17 (signal-value btor262))
             (signal-state btor262)))
           (btor695
            (signal
             ((lambda (a b) (bvnot (bvxor a b)))
              (signal-value btor693)
              (signal-value btor694))
             (list)))
           (btor696
            (signal
             (apply bvor (bitvector->bits (signal-value btor56)))
             (signal-state btor56)))
           (btor697 (signal (bvnot (signal-value btor696)) (list)))
           (btor698
            (if (bitvector->bool (signal-value btor697)) btor695 btor692))
           (btor699
            (signal
             (bool->bitvector
              (bveq (signal-value btor360) (signal-value btor573)))
             (list)))
           (btor700
            (if (bitvector->bool (signal-value btor699)) btor698 btor153))
           (btor701
            (signal
             (extract 47 47 (signal-value btor407))
             (signal-state btor407)))
           (btor702 (signal (bvnot (signal-value btor701)) (list)))
           (btor703
            (signal
             (bool->bitvector
              (bveq (signal-value btor360) (signal-value btor328)))
             (list)))
           (btor704
            (signal
             (bool->bitvector
              (bveq (signal-value btor360) (signal-value btor534)))
             (list)))
           (btor705
            (signal
             (concat (signal-value btor704) (signal-value btor703))
             (list)))
           (btor706
            (signal
             (apply bvor (bitvector->bits (signal-value btor705)))
             (signal-state btor705)))
           (btor707
            (if (bitvector->bool (signal-value btor706)) btor702 btor700))
           (btor708
            (signal
             (bool->bitvector
              (bveq (signal-value btor360) (signal-value btor474)))
             (list)))
           (btor709
            (signal
             (concat (signal-value btor699) (signal-value btor703))
             (list)))
           (btor710
            (signal
             (concat (signal-value btor704) (signal-value btor709))
             (list)))
           (btor711
            (signal
             (concat (signal-value btor708) (signal-value btor710))
             (list)))
           (btor712
            (signal
             (apply bvor (bitvector->bits (signal-value btor711)))
             (signal-state btor711)))
           (btor713
            (if (bitvector->bool (signal-value btor712)) btor707 btor688))
           (btor714
            (signal
             (bvor (signal-value btor633) (signal-value btor619))
             (list)))
           (btor715
            (if (bitvector->bool (signal-value btor714)) btor148 btor713))
           (btor716
            (signal
             (extract 10 0 (signal-value btor620))
             (signal-state btor620)))
           (btor717
            (signal
             (concat (signal-value btor716) (signal-value btor715))
             (list)))
           (btor718
            (bv->signal
             (zero-extend (signal-value btor717) (bitvector 13))
             btor717))
           (btor719
            (signal
             (extract 11 0 (signal-value btor634))
             (signal-state btor634)))
           (btor720
            (bv->signal
             (zero-extend (signal-value btor719) (bitvector 13))
             btor719))
           (btor721
            (signal
             (bvadd (signal-value btor718) (signal-value btor720))
             (list)))
           (btor722
            (signal
             (extract 12 12 (signal-value btor721))
             (signal-state btor721)))
           (btor723
            (if (bitvector->bool (signal-value btor624)) btor148 btor722))
           (btor724
            (bv->signal
             (zero-extend (signal-value btor723) (bitvector 13))
             btor723))
           (btor725
            (signal
             (bvadd (signal-value btor657) (signal-value btor724))
             (list)))
           (btor726
            (signal
             (extract 12 12 (signal-value btor725))
             (signal-state btor725)))
           (btor727
            (if (bitvector->bool (signal-value btor642)) btor148 btor726))
           (btor728
            (bv->signal
             (zero-extend (signal-value btor727) (bitvector 13))
             btor727))
           (btor729
            (signal
             (bvadd (signal-value btor649) (signal-value btor728))
             (list)))
           (btor730
            (signal
             (extract 12 12 (signal-value btor729))
             (signal-state btor729)))
           (btor731
            (if (bitvector->bool (signal-value btor624)) btor148 btor730))
           (btor732
            (bv->signal
             (zero-extend (signal-value btor731) (bitvector 13))
             btor731))
           (btor733
            (signal
             (bvadd (signal-value btor637) (signal-value btor732))
             (list)))
           (btor734
            (signal
             (extract 12 12 (signal-value btor733))
             (signal-state btor733)))
           (btor735
            (signal
             (apply bvor (bitvector->bits (signal-value btor62)))
             (signal-state btor62)))
           (btor736 (signal (bvnot (signal-value btor735)) (list)))
           (btor737
            (if (bitvector->bool (signal-value btor736)) btor734 btor156))
           (btor739
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state739")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state739"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state739")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state739")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 4))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor741
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state741")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state741"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state741")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state741")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 4))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor743
            (if (bitvector->bool (signal-value btor97)) btor741 btor739))
           (btor744
            (if (bitvector->bool (signal-value btor155)) btor743 btor596))
           (btor745
            (signal
             (bvadd (signal-value btor650) (signal-value btor722))
             (list)))
           (btor746 (signal (bvnot (signal-value btor745)) (list)))
           (btor747
            (signal
             (extract 1 1 (signal-value btor616))
             (signal-state btor616)))
           (btor748
            (signal
             (bvand (signal-value btor617) (signal-value btor747))
             (list)))
           (btor749
            (if (bitvector->bool (signal-value btor748)) btor746 btor745))
           (btor750
            (if (bitvector->bool (signal-value btor624)) btor749 btor148))
           (btor751
            (signal
             (extract 3 0 (signal-value btor399))
             (signal-state btor399)))
           (btor752
            (bv->signal
             (zero-extend (signal-value btor534) (bitvector 4))
             btor534))
           (btor753
            (signal
             (bool->bitvector
              (bveq (signal-value btor751) (signal-value btor752)))
             (list)))
           (btor754
            (signal
             (extract 3 2 (signal-value btor616))
             (signal-state btor616)))
           (btor755
            (signal
             (apply bvor (bitvector->bits (signal-value btor754)))
             (signal-state btor754)))
           (btor756
            (signal
             (bvor (signal-value btor753) (signal-value btor755))
             (list)))
           (btor757
            (if (bitvector->bool (signal-value btor756)) btor148 btor750))
           (btor758
            (signal
             (bvadd (signal-value btor638) (signal-value btor726))
             (list)))
           (btor759 (signal (bvnot (signal-value btor758)) (list)))
           (btor760
            (if (bitvector->bool (signal-value btor748)) btor759 btor758))
           (btor761
            (if (bitvector->bool (signal-value btor642)) btor760 btor148))
           (btor762
            (if (bitvector->bool (signal-value btor756)) btor148 btor761))
           (btor763
            (signal
             (bvadd (signal-value btor621) (signal-value btor730))
             (list)))
           (btor764 (signal (bvnot (signal-value btor763)) (list)))
           (btor765
            (if (bitvector->bool (signal-value btor748)) btor764 btor763))
           (btor766
            (if (bitvector->bool (signal-value btor624)) btor765 btor148))
           (btor767
            (if (bitvector->bool (signal-value btor756)) btor148 btor766))
           (btor768 (signal (bvnot (signal-value btor734)) (list)))
           (btor769
            (if (bitvector->bool (signal-value btor748)) btor768 btor734))
           (btor770
            (if (bitvector->bool (signal-value btor756)) btor148 btor769))
           (btor771
            (signal
             (concat (signal-value btor762) (signal-value btor757))
             (list)))
           (btor772
            (signal
             (concat (signal-value btor767) (signal-value btor771))
             (list)))
           (btor773
            (signal
             (concat (signal-value btor770) (signal-value btor772))
             (list)))
           (btor774
            (if (bitvector->bool (signal-value btor736)) btor773 btor744))
           (btor775
            (signal
             (extract 0 0 (signal-value btor774))
             (signal-state btor774)))
           (btor776
            (if (bitvector->bool (signal-value btor624)) btor775 btor148))
           (btor777
            (signal
             (extract 1 1 (signal-value btor774))
             (signal-state btor774)))
           (btor778
            (if (bitvector->bool (signal-value btor642)) btor777 btor148))
           (btor779
            (signal
             (extract 2 2 (signal-value btor774))
             (signal-state btor774)))
           (btor780
            (if (bitvector->bool (signal-value btor624)) btor779 btor148))
           (btor781
            (signal
             (concat (signal-value btor778) (signal-value btor776))
             (list)))
           (btor782
            (signal
             (concat (signal-value btor780) (signal-value btor781))
             (list)))
           (btor783
            (signal
             (extract 3 3 (signal-value btor774))
             (signal-state btor774)))
           (btor784
            (signal
             (concat (signal-value btor783) (signal-value btor782))
             (list)))
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
           (btor787
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state787")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state787"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state787")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state787")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor789
            (if (bitvector->bool (signal-value btor97)) btor787 btor786))
           (btor790
            (if (bitvector->bool (signal-value btor155)) btor789 btor148))
           (btor791
            (signal
             (extract 42 42 (signal-value btor363))
             (signal-state btor363)))
           (btor792
            (signal
             (bool->bitvector
              (bveq (signal-value btor473) (signal-value btor474)))
             (list)))
           (btor793
            (if (bitvector->bool (signal-value btor792)) btor57 btor791))
           (btor794
            (if (bitvector->bool (signal-value btor736)) btor793 btor790))
           (btor796
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state796")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state796"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state796")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state796")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor797
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state797")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state797"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state797")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state797")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor799
            (if (bitvector->bool (signal-value btor97)) btor797 btor796))
           (btor800
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state800")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state800"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state800")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state800")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor801
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state801")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state801"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state801")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state801")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor803
            (if (bitvector->bool (signal-value btor97)) btor801 btor800))
           (btor804 (signal (bvnot (signal-value btor803)) (list)))
           (btor805
            (signal
             (bvand (signal-value btor799) (signal-value btor804))
             (list)))
           (btor806
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state806")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state806"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state806")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state806")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor807
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state807")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state807"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state807")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state807")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor809
            (if (bitvector->bool (signal-value btor97)) btor807 btor806))
           (btor810 (signal (bvnot (signal-value btor809)) (list)))
           (btor811
            (signal
             (bvand (signal-value btor805) (signal-value btor810))
             (list)))
           (btor812 (bv->signal (bv 10 (bitvector 4))))
           (btor813
            (bv->signal
             (zero-extend (signal-value btor812) (bitvector 5))
             btor812))
           (btor814
            (signal
             (bool->bitvector
              (bveq (signal-value btor77) (signal-value btor813)))
             (list)))
           (btor815
            (signal
             (bvor (signal-value btor814) (signal-value btor155))
             (list)))
           (btor816
            (if (bitvector->bool (signal-value btor815)) btor811 btor148))
           (btor818
            (if (bitvector->bool (signal-value btor155)) btor407 btor158))
           (btor819
            (signal
             (extract 11 0 (signal-value btor721))
             (signal-state btor721)))
           (btor820
            (signal
             (extract 11 0 (signal-value btor725))
             (signal-state btor725)))
           (btor821
            (signal
             (concat (signal-value btor820) (signal-value btor819))
             (list)))
           (btor822
            (signal
             (extract 11 0 (signal-value btor729))
             (signal-state btor729)))
           (btor823
            (signal
             (concat (signal-value btor822) (signal-value btor821))
             (list)))
           (btor824
            (signal
             (extract 11 0 (signal-value btor733))
             (signal-state btor733)))
           (btor825
            (signal
             (concat (signal-value btor824) (signal-value btor823))
             (list)))
           (btor826 (signal (bvnot (signal-value btor825)) (list)))
           (btor827
            (if (bitvector->bool (signal-value btor747)) btor826 btor825))
           (btor828
            (if (bitvector->bool (signal-value btor736)) btor827 btor818))
           (btor830
            (bv->signal
             (zero-extend (signal-value btor409) (bitvector 5))
             btor409))
           (btor831
            (signal
             (bool->bitvector
              (bveq (signal-value btor74) (signal-value btor830)))
             (list)))
           (btor832
            (if (bitvector->bool (signal-value btor831)) btor60 btor489))
           (btor833
            (signal
             (bvxor (signal-value btor832) (signal-value btor827))
             (list)))
           (btor834 (bv->signal (bv 14 (bitvector 4))))
           (btor835
            (bv->signal
             (zero-extend (signal-value btor834) (bitvector 5))
             btor834))
           (btor836
            (signal
             (bool->bitvector
              (bveq (signal-value btor73) (signal-value btor835)))
             (list)))
           (btor837
            (if (bitvector->bool (signal-value btor836)) btor489 btor55))
           (btor838
            (signal
             (extract 46 0 (signal-value btor489))
             (signal-state btor489)))
           (btor839 (signal (bvnot (signal-value btor838)) (list)))
           (btor840
            (signal
             (concat (signal-value btor839) (signal-value btor148))
             (list)))
           (btor841 (bv->signal (bv 0 (bitvector 2))))
           (btor842
            (signal
             (extract 45 0 (signal-value btor839))
             (signal-state btor839)))
           (btor843
            (signal
             (concat (signal-value btor842) (signal-value btor841))
             (list)))
           (btor844 (bv->signal (bv 16 (bitvector 5))))
           (btor845
            (signal
             (bool->bitvector
              (bveq (signal-value btor73) (signal-value btor844)))
             (list)))
           (btor846
            (if (bitvector->bool (signal-value btor845)) btor843 btor840))
           (btor847 (bv->signal (bv 15 (bitvector 4))))
           (btor848
            (bv->signal
             (zero-extend (signal-value btor847) (bitvector 5))
             btor847))
           (btor849
            (signal
             (bool->bitvector
              (bveq (signal-value btor73) (signal-value btor848)))
             (list)))
           (btor850
            (signal
             (bvor (signal-value btor849) (signal-value btor845))
             (list)))
           (btor851
            (if (bitvector->bool (signal-value btor850)) btor846 btor837))
           (btor852
            (bv->signal
             (zero-extend (signal-value btor573) (bitvector 5))
             btor573))
           (btor853
            (signal
             (bool->bitvector
              (bveq (signal-value btor77) (signal-value btor852)))
             (list)))
           (btor854
            (if (bitvector->bool (signal-value btor853)) btor415 btor851))
           (btor855
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state855")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state855"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state855")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state855")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 48))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor857
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state857")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state857"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state857")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state857")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 48))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor859
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state859")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state859"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state859")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state859")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor861
            (if (bitvector->bool (signal-value btor859)) btor857 btor855))
           (btor862 (signal (bvnot (signal-value btor853)) (list)))
           (btor863
            (bv->signal
             (zero-extend (signal-value btor321) (bitvector 5))
             btor321))
           (btor864
            (signal
             (bool->bitvector
              (bveq (signal-value btor73) (signal-value btor863)))
             (list)))
           (btor865 (signal (bvnot (signal-value btor864)) (list)))
           (btor866 (signal (bvnot (signal-value btor836)) (list)))
           (btor867 (signal (bvnot (signal-value btor849)) (list)))
           (btor868 (signal (bvnot (signal-value btor845)) (list)))
           (btor869
            (signal
             (bvand (signal-value btor867) (signal-value btor868))
             (list)))
           (btor870
            (signal
             (bvand (signal-value btor866) (signal-value btor869))
             (list)))
           (btor871
            (signal
             (bvand (signal-value btor865) (signal-value btor870))
             (list)))
           (btor872
            (signal
             (bvand (signal-value btor862) (signal-value btor871))
             (list)))
           (btor873
            (if (bitvector->bool (signal-value btor872)) btor861 btor854))
           (btor874
            (signal
             (bvor (signal-value btor833) (signal-value btor873))
             (list)))
           (btor875
            (signal
             (apply bvand (bitvector->bits (signal-value btor874)))
             (signal-state btor874)))
           (btor876
            (if (bitvector->bool (signal-value btor155)) btor809 btor875))
           (btor878 (signal (bvnot (signal-value btor833)) (list)))
           (btor879
            (signal
             (bvor (signal-value btor878) (signal-value btor873))
             (list)))
           (btor880
            (signal
             (apply bvand (bitvector->bits (signal-value btor879)))
             (signal-state btor879)))
           (btor881
            (if (bitvector->bool (signal-value btor155)) btor803 btor880))
           (btor884
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state884")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state884"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state884")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state884")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor885
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state885")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state885"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state885")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state885")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor887
            (if (bitvector->bool (signal-value btor97)) btor885 btor884))
           (btor888
            (signal
             (bvand (signal-value btor887) (signal-value btor804))
             (list)))
           (btor889
            (signal
             (bvand (signal-value btor888) (signal-value btor810))
             (list)))
           (btor890
            (if (bitvector->bool (signal-value btor815)) btor889 btor148))
           (btor892
            (bv->signal
             (zero-extend (signal-value btor723) (bitvector 1))
             btor723))
           (btor893
            (bv->signal
             (zero-extend (signal-value btor727) (bitvector 1))
             btor727))
           (btor894
            (bv->signal
             (zero-extend (signal-value btor731) (bitvector 1))
             btor731))
           (btor895
            (bv->signal
             (zero-extend (signal-value btor49) (bitvector 4))
             btor49))
           (btor896
            (bv->signal
             (zero-extend (signal-value btor50) (bitvector 1))
             btor50))
           (btor897
            (bv->signal
             (zero-extend (signal-value btor51) (bitvector 1))
             btor51))
           (btor898
            (bv->signal
             (zero-extend (signal-value btor52) (bitvector 5))
             btor52))
           (btor899
            (bv->signal
             (zero-extend (signal-value btor54) (bitvector 7))
             btor54))
           (btor900
            (bv->signal
             (zero-extend (signal-value btor2) (bitvector 30))
             btor2))
           (btor901
            (bv->signal
             (zero-extend (signal-value btor2) (bitvector 30))
             btor2))
           (btor902
            (bv->signal
             (zero-extend (signal-value btor86) (bitvector 30))
             btor86))
           (btor903
            (bv->signal
             (zero-extend (signal-value btor178) (bitvector 25))
             btor178))
           (btor904
            (bv->signal
             (zero-extend (signal-value btor5) (bitvector 30))
             btor5))
           (btor905
            (bv->signal
             (zero-extend (signal-value btor5) (bitvector 30))
             btor5))
           (btor906
            (bv->signal
             (zero-extend (signal-value btor195) (bitvector 25))
             btor195))
           (btor907
            (bv->signal
             (zero-extend (signal-value btor209) (bitvector 25))
             btor209))
           (btor908
            (bv->signal
             (zero-extend (signal-value btor827) (bitvector 48))
             btor827))
           (btor909
            (bv->signal
             (zero-extend (signal-value btor8) (bitvector 4))
             btor8))
           (btor910
            (bv->signal
             (zero-extend (signal-value btor600) (bitvector 4))
             btor600))
           (btor911
            (bv->signal
             (zero-extend (signal-value btor15) (bitvector 18))
             btor15))
           (btor912
            (bv->signal
             (zero-extend (signal-value btor15) (bitvector 18))
             btor15))
           (btor913
            (bv->signal
             (zero-extend (signal-value btor262) (bitvector 18))
             btor262))
           (btor914
            (bv->signal
             (zero-extend (signal-value btor124) (bitvector 18))
             btor124))
           (btor915
            (bv->signal
             (zero-extend (signal-value btor17) (bitvector 18))
             btor17))
           (btor916
            (bv->signal
             (zero-extend (signal-value btor17) (bitvector 18))
             btor17))
           (btor917
            (bv->signal
             (zero-extend (signal-value btor21) (bitvector 48))
             btor21))
           (btor918
            (bv->signal
             (zero-extend (signal-value btor21) (bitvector 48))
             btor21))
           (btor919
            (bv->signal
             (zero-extend (signal-value btor23) (bitvector 1))
             btor23))
           (btor920
            (bv->signal
             (zero-extend (signal-value btor23) (bitvector 1))
             btor23))
           (btor921
            (bv->signal
             (zero-extend (signal-value btor734) (bitvector 1))
             btor734))
           (btor922
            (bv->signal
             (zero-extend (signal-value btor737) (bitvector 1))
             btor737))
           (btor923
            (bv->signal
             (zero-extend (signal-value btor153) (bitvector 1))
             btor153))
           (btor924
            (bv->signal
             (zero-extend (signal-value btor24) (bitvector 1))
             btor24))
           (btor925
            (bv->signal
             (zero-extend (signal-value btor662) (bitvector 1))
             btor662))
           (btor926
            (bv->signal
             (zero-extend (signal-value btor27) (bitvector 3))
             btor27))
           (btor927
            (bv->signal
             (zero-extend (signal-value btor27) (bitvector 3))
             btor27))
           (btor928
            (bv->signal
             (zero-extend (signal-value btor773) (bitvector 4))
             btor773))
           (btor929
            (signal
             (concat (signal-value btor760) (signal-value btor749))
             (list)))
           (btor930
            (signal
             (concat (signal-value btor765) (signal-value btor929))
             (list)))
           (btor931
            (signal
             (concat (signal-value btor769) (signal-value btor930))
             (list)))
           (btor932
            (bv->signal
             (zero-extend (signal-value btor931) (bitvector 4))
             btor931))
           (btor933
            (bv->signal
             (zero-extend (signal-value btor774) (bitvector 4))
             btor774))
           (btor934
            (bv->signal
             (zero-extend (signal-value btor743) (bitvector 4))
             btor743))
           (btor935
            (bv->signal
             (zero-extend (signal-value btor784) (bitvector 4))
             btor784))
           (btor936
            (bv->signal
             (zero-extend (signal-value btor29) (bitvector 1))
             btor29))
           (btor937
            (bv->signal
             (zero-extend (signal-value btor29) (bitvector 1))
             btor29))
           (btor938
            (bv->signal
             (zero-extend (signal-value btor30) (bitvector 1))
             btor30))
           (btor939
            (bv->signal
             (zero-extend (signal-value btor30) (bitvector 1))
             btor30))
           (btor940
            (bv->signal
             (zero-extend (signal-value btor31) (bitvector 1))
             btor31))
           (btor941
            (bv->signal
             (zero-extend (signal-value btor31) (bitvector 1))
             btor31))
           (btor942
            (bv->signal
             (zero-extend (signal-value btor32) (bitvector 1))
             btor32))
           (btor943
            (bv->signal
             (zero-extend (signal-value btor32) (bitvector 1))
             btor32))
           (btor944
            (bv->signal
             (zero-extend (signal-value btor33) (bitvector 1))
             btor33))
           (btor945
            (bv->signal
             (zero-extend (signal-value btor33) (bitvector 1))
             btor33))
           (btor946
            (bv->signal
             (zero-extend (signal-value btor34) (bitvector 1))
             btor34))
           (btor947
            (bv->signal
             (zero-extend (signal-value btor34) (bitvector 1))
             btor34))
           (btor948
            (bv->signal
             (zero-extend (signal-value btor35) (bitvector 1))
             btor35))
           (btor949
            (bv->signal
             (zero-extend (signal-value btor35) (bitvector 1))
             btor35))
           (btor950
            (bv->signal
             (zero-extend (signal-value btor36) (bitvector 1))
             btor36))
           (btor951
            (bv->signal
             (zero-extend (signal-value btor36) (bitvector 1))
             btor36))
           (btor952
            (bv->signal
             (zero-extend (signal-value btor37) (bitvector 1))
             btor37))
           (btor953
            (bv->signal
             (zero-extend (signal-value btor37) (bitvector 1))
             btor37))
           (btor954
            (bv->signal
             (zero-extend (signal-value btor38) (bitvector 1))
             btor38))
           (btor955
            (bv->signal
             (zero-extend (signal-value btor38) (bitvector 1))
             btor38))
           (btor956
            (bv->signal
             (zero-extend (signal-value btor39) (bitvector 1))
             btor39))
           (btor957
            (bv->signal
             (zero-extend (signal-value btor39) (bitvector 1))
             btor39))
           (btor958
            (bv->signal
             (zero-extend (signal-value btor40) (bitvector 1))
             btor40))
           (btor959
            (bv->signal
             (zero-extend (signal-value btor40) (bitvector 1))
             btor40))
           (btor960
            (bv->signal
             (zero-extend (signal-value btor41) (bitvector 1))
             btor41))
           (btor961
            (bv->signal
             (zero-extend (signal-value btor41) (bitvector 1))
             btor41))
           (btor962
            (bv->signal
             (zero-extend (signal-value btor42) (bitvector 1))
             btor42))
           (btor963
            (bv->signal
             (zero-extend (signal-value btor91) (bitvector 1))
             btor91))
           (btor964
            (bv->signal
             (zero-extend (signal-value btor618) (bitvector 48))
             btor618))
           (btor965
            (bv->signal
             (zero-extend (signal-value btor651) (bitvector 1))
             btor651))
           (btor966
            (bv->signal
             (zero-extend (signal-value btor643) (bitvector 1))
             btor643))
           (btor967
            (bv->signal
             (zero-extend (signal-value btor625) (bitvector 1))
             btor625))
           (btor968
            (bv->signal
             (zero-extend (signal-value btor620) (bitvector 48))
             btor620))
           (btor969
            (bv->signal
             (zero-extend (signal-value btor745) (bitvector 1))
             btor745))
           (btor970
            (bv->signal
             (zero-extend (signal-value btor758) (bitvector 1))
             btor758))
           (btor971
            (bv->signal
             (zero-extend (signal-value btor763) (bitvector 1))
             btor763))
           (btor972
            (bv->signal
             (zero-extend (signal-value btor734) (bitvector 1))
             btor734))
           (btor973
            (bv->signal
             (zero-extend (signal-value btor45) (bitvector 25))
             btor45))
           (btor974
            (bv->signal
             (zero-extend (signal-value btor45) (bitvector 25))
             btor45))
           (btor975
            (bv->signal
             (zero-extend (signal-value btor47) (bitvector 5))
             btor47))
           (btor976
            (bv->signal
             (zero-extend (signal-value btor162) (bitvector 5))
             btor162))
           (btor977
            (bv->signal
             (zero-extend (signal-value btor332) (bitvector 43))
             btor332))
           (btor978
            (bv->signal
             (zero-extend (signal-value btor57) (bitvector 1))
             btor57))
           (btor979
            (bv->signal
             (zero-extend (signal-value btor57) (bitvector 1))
             btor57))
           (btor980
            (bv->signal
             (zero-extend (signal-value btor794) (bitvector 1))
             btor794))
           (btor981
            (bv->signal
             (zero-extend (signal-value btor793) (bitvector 1))
             btor793))
           (btor982
            (bv->signal
             (zero-extend (signal-value btor58) (bitvector 7))
             btor58))
           (btor983
            (bv->signal
             (zero-extend (signal-value btor383) (bitvector 7))
             btor383))
           (btor984
            (bv->signal
             (zero-extend (signal-value btor816) (bitvector 1))
             btor816))
           (btor985
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 48))
             btor61))
           (btor986
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 48))
             btor61))
           (btor987
            (bv->signal
             (zero-extend (signal-value btor880) (bitvector 1))
             btor880))
           (btor988
            (bv->signal
             (zero-extend (signal-value btor881) (bitvector 1))
             btor881))
           (btor989
            (bv->signal
             (zero-extend (signal-value btor803) (bitvector 1))
             btor803))
           (btor990
            (bv->signal
             (zero-extend (signal-value btor799) (bitvector 1))
             btor799))
           (btor991
            (bv->signal
             (zero-extend (signal-value btor875) (bitvector 1))
             btor875))
           (btor992
            (bv->signal
             (zero-extend (signal-value btor876) (bitvector 1))
             btor876))
           (btor993
            (bv->signal
             (zero-extend (signal-value btor809) (bitvector 1))
             btor809))
           (btor994
            (bv->signal
             (zero-extend (signal-value btor887) (bitvector 1))
             btor887))
           (btor995
            (bv->signal
             (zero-extend (signal-value btor148) (bitvector 1))
             btor148))
           (btor996
            (bv->signal
             (zero-extend (signal-value btor109) (bitvector 30))
             btor109))
           (btor997
            (bv->signal
             (zero-extend (signal-value btor113) (bitvector 30))
             btor113))
           (btor998
            (bv->signal
             (zero-extend (signal-value btor98) (bitvector 30))
             btor98))
           (btor999
            (bv->signal
             (zero-extend (signal-value btor117) (bitvector 30))
             btor117))
           (btor1000
            (bv->signal
             (zero-extend (signal-value btor205) (bitvector 25))
             btor205))
           (btor1001
            (bv->signal
             (zero-extend (signal-value btor199) (bitvector 25))
             btor199))
           (btor1002
            (bv->signal
             (zero-extend (signal-value btor616) (bitvector 4))
             btor616))
           (btor1003
            (bv->signal
             (zero-extend (signal-value btor599) (bitvector 4))
             btor599))
           (btor1004
            (bv->signal
             (zero-extend (signal-value btor138) (bitvector 18))
             btor138))
           (btor1005
            (bv->signal
             (zero-extend (signal-value btor142) (bitvector 18))
             btor142))
           (btor1006
            (bv->signal
             (zero-extend (signal-value btor129) (bitvector 18))
             btor129))
           (btor1007
            (bv->signal
             (zero-extend (signal-value btor146) (bitvector 18))
             btor146))
           (btor1008
            (bv->signal
             (zero-extend (signal-value btor489) (bitvector 48))
             btor489))
           (btor1009
            (bv->signal
             (zero-extend (signal-value btor483) (bitvector 48))
             btor483))
           (btor1010
            (bv->signal
             (zero-extend (signal-value btor715) (bitvector 1))
             btor715))
           (btor1011
            (bv->signal
             (zero-extend (signal-value btor678) (bitvector 1))
             btor678))
           (btor1012
            (bv->signal
             (zero-extend (signal-value btor698) (bitvector 1))
             btor698))
           (btor1013
            (bv->signal
             (zero-extend (signal-value btor713) (bitvector 1))
             btor713))
           (btor1014
            (bv->signal
             (zero-extend (signal-value btor661) (bitvector 1))
             btor661))
           (btor1015
            (bv->signal
             (zero-extend (signal-value btor692) (bitvector 1))
             btor692))
           (btor1016
            (bv->signal
             (zero-extend (signal-value btor360) (bitvector 3))
             btor360))
           (btor1017
            (bv->signal
             (zero-extend (signal-value btor344) (bitvector 3))
             btor344))
           (btor1018
            (bv->signal
             (zero-extend (signal-value btor188) (bitvector 25))
             btor188))
           (btor1019
            (bv->signal
             (zero-extend (signal-value btor182) (bitvector 25))
             btor182))
           (btor1020
            (bv->signal
             (zero-extend (signal-value btor173) (bitvector 5))
             btor173))
           (btor1021
            (bv->signal
             (zero-extend (signal-value btor167) (bitvector 5))
             btor167))
           (btor1022
            (bv->signal
             (zero-extend (signal-value btor363) (bitvector 43))
             btor363))
           (btor1023
            (bv->signal
             (zero-extend (signal-value btor336) (bitvector 43))
             btor336))
           (btor1024
            (bv->signal
             (zero-extend (signal-value btor789) (bitvector 1))
             btor789))
           (btor1025
            (bv->signal
             (zero-extend (signal-value btor399) (bitvector 7))
             btor399))
           (btor1026
            (bv->signal
             (zero-extend (signal-value btor382) (bitvector 7))
             btor382))
           (btor1027
            (bv->signal
             (zero-extend (signal-value btor828) (bitvector 48))
             btor828))
           (btor1028
            (bv->signal
             (zero-extend (signal-value btor407) (bitvector 48))
             btor407))
           (btor1029
            (bv->signal
             (zero-extend (signal-value btor414) (bitvector 48))
             btor414))
           (btor1030
            (bv->signal
             (zero-extend (signal-value btor491) (bitvector 48))
             btor491))
           (btor1031
            (bv->signal
             (zero-extend (signal-value btor585) (bitvector 48))
             btor585))
           (btor1032
            (bv->signal
             (zero-extend (signal-value btor63) (bitvector 1))
             btor63))
           (btor1033
            (bv->signal
             (zero-extend (signal-value btor63) (bitvector 1))
             btor63))
           (btor1034
            (bv->signal
             (zero-extend (signal-value btor64) (bitvector 1))
             btor64))
           (btor1035
            (bv->signal
             (zero-extend (signal-value btor64) (bitvector 1))
             btor64))
           (btor1036
            (bv->signal
             (zero-extend (signal-value btor65) (bitvector 1))
             btor65))
           (btor1037
            (bv->signal
             (zero-extend (signal-value btor65) (bitvector 1))
             btor65))
           (btor1038
            (bv->signal
             (zero-extend (signal-value btor66) (bitvector 1))
             btor66))
           (btor1039
            (bv->signal
             (zero-extend (signal-value btor66) (bitvector 1))
             btor66))
           (btor1040
            (bv->signal
             (zero-extend (signal-value btor67) (bitvector 1))
             btor67))
           (btor1041
            (bv->signal
             (zero-extend (signal-value btor67) (bitvector 1))
             btor67))
           (btor1042
            (bv->signal
             (zero-extend (signal-value btor68) (bitvector 1))
             btor68))
           (btor1043
            (bv->signal
             (zero-extend (signal-value btor68) (bitvector 1))
             btor68))
           (btor1044
            (bv->signal
             (zero-extend (signal-value btor69) (bitvector 1))
             btor69))
           (btor1045
            (bv->signal
             (zero-extend (signal-value btor69) (bitvector 1))
             btor69))
           (btor1046
            (bv->signal
             (zero-extend (signal-value btor70) (bitvector 1))
             btor70))
           (btor1047
            (bv->signal
             (zero-extend (signal-value btor70) (bitvector 1))
             btor70))
           (btor1048
            (bv->signal
             (zero-extend (signal-value btor71) (bitvector 1))
             btor71))
           (btor1049
            (bv->signal
             (zero-extend (signal-value btor71) (bitvector 1))
             btor71))
           (btor1050
            (bv->signal
             (zero-extend (signal-value btor72) (bitvector 1))
             btor72))
           (btor1051
            (bv->signal
             (zero-extend (signal-value btor72) (bitvector 1))
             btor72))
           (btor1052
            (bv->signal
             (zero-extend (signal-value btor632) (bitvector 48))
             btor632))
           (btor1053
            (bv->signal
             (zero-extend (signal-value btor721) (bitvector 13))
             btor721))
           (btor1054
            (bv->signal
             (zero-extend (signal-value btor725) (bitvector 13))
             btor725))
           (btor1055
            (bv->signal
             (zero-extend (signal-value btor729) (bitvector 13))
             btor729))
           (btor1056
            (bv->signal
             (zero-extend (signal-value btor733) (bitvector 13))
             btor733))
           (btor1057
            (bv->signal
             (zero-extend (signal-value btor634) (bitvector 48))
             btor634))
           (btor1058 (bv->signal (bv 17 (bitvector 5))))
           (btor1059
            (signal
             (bool->bitvector
              (bveq (signal-value btor12) (signal-value btor1058)))
             (list)))
           (btor1060
            (signal
             (bvand (signal-value btor1059) (signal-value btor803))
             (list)))
           (btor1061 (bv->signal (bv 18 (bitvector 5))))
           (btor1062
            (signal
             (bool->bitvector
              (bveq (signal-value btor12) (signal-value btor1061)))
             (list)))
           (btor1063
            (signal
             (bvand (signal-value btor799) (signal-value btor804))
             (list)))
           (btor1064
            (signal
             (bvand (signal-value btor1062) (signal-value btor1063))
             (list)))
           (btor1065
            (signal
             (bvor (signal-value btor1060) (signal-value btor1064))
             (list)))
           (btor1066
            (bv->signal
             (zero-extend (signal-value btor1065) (bitvector 1))
             btor1065))
           (btor1067
            (bv->signal
             (zero-extend (signal-value btor873) (bitvector 48))
             btor873))
           (btor1068
            (bv->signal
             (zero-extend (signal-value btor832) (bitvector 48))
             btor832))
           (btor1069
            (bv->signal
             (zero-extend (signal-value btor890) (bitvector 1))
             btor890))
           (btor1070
            (bv->signal
             (zero-extend (signal-value btor476) (bitvector 48))
             btor476))
           (btor1072
            (if (bitvector->bool (signal-value btor30)) btor113 btor98))
           (btor1073
            (if (bitvector->bool (signal-value btor63)) btor88 btor1072))
           (btor1074
            (if (bitvector->bool (signal-value btor104)) btor1073 btor98))
           (btor1075
            (if (bitvector->bool (signal-value btor30)) btor86 btor98))
           (btor1076
            (if (bitvector->bool (signal-value btor63)) btor88 btor1075))
           (btor1077
            (if (bitvector->bool (signal-value btor101)) btor1076 btor1074))
           (btor1081
            (if (bitvector->bool (signal-value btor29)) btor86 btor113))
           (btor1082
            (if (bitvector->bool (signal-value btor63)) btor88 btor1081))
           (btor1083
            (if (bitvector->bool (signal-value btor104)) btor1082 btor113))
           (btor1084
            (if (bitvector->bool (signal-value btor101)) btor1082 btor1083))
           (btor1087
            (if (bitvector->bool (signal-value btor34)) btor142 btor129))
           (btor1088
            (if (bitvector->bool (signal-value btor66)) btor126 btor1087))
           (btor1089
            (if (bitvector->bool (signal-value btor133)) btor1088 btor129))
           (btor1090
            (if (bitvector->bool (signal-value btor34)) btor124 btor129))
           (btor1091
            (if (bitvector->bool (signal-value btor66)) btor126 btor1090))
           (btor1092
            (if (bitvector->bool (signal-value btor131)) btor1091 btor1089))
           (btor1095
            (if (bitvector->bool (signal-value btor33)) btor124 btor142))
           (btor1096
            (if (bitvector->bool (signal-value btor66)) btor126 btor1095))
           (btor1097
            (if (bitvector->bool (signal-value btor133)) btor1096 btor142))
           (btor1098
            (if (bitvector->bool (signal-value btor131)) btor1096 btor1097))
           (btor1101
            (if (bitvector->bool (signal-value btor41)) btor734 btor153))
           (btor1102
            (signal
             (bvor (signal-value btor72) (signal-value btor1065))
             (list)))
           (btor1103
            (if (bitvector->bool (signal-value btor1102)) btor148 btor1101))
           (btor1106
            (if (bitvector->bool (signal-value btor39)) btor162 btor167))
           (btor1107
            (if (bitvector->bool (signal-value btor70)) btor164 btor1106))
           (btor1110
            (if (bitvector->bool (signal-value btor38)) btor45 btor182))
           (btor1111
            (if (bitvector->bool (signal-value btor69)) btor176 btor1110))
           (btor1114
            (if (bitvector->bool (signal-value btor31)) btor195 btor199))
           (btor1115
            (if (bitvector->bool (signal-value btor69)) btor176 btor1114))
           (btor1118
            (if (bitvector->bool (signal-value btor40)) btor332 btor336))
           (btor1119
            (if (bitvector->bool (signal-value btor71)) btor320 btor1118))
           (btor1122
            (if (bitvector->bool (signal-value btor37)) btor27 btor344))
           (btor1123
            (if (bitvector->bool (signal-value btor68)) btor341 btor1122))
           (btor1127 (signal (bvnot (signal-value btor359)) (list)))
           (btor1130
            (if (bitvector->bool (signal-value btor37)) btor383 btor382))
           (btor1131
            (if (bitvector->bool (signal-value btor68)) btor379 btor1130))
           (btor1135 (signal (bvnot (signal-value btor398)) (list)))
           (btor1138
            (if (bitvector->bool (signal-value btor41)) btor827 btor407))
           (btor1139
            (if (bitvector->bool (signal-value btor1102)) btor158 btor1138))
           (btor1142
            (if (bitvector->bool (signal-value btor35)) btor21 btor483))
           (btor1143
            (if (bitvector->bool (signal-value btor67)) btor158 btor1142))
           (btor1146
            (if (bitvector->bool (signal-value btor32)) btor600 btor599))
           (btor1147
            (if (bitvector->bool (signal-value btor65)) btor596 btor1146))
           (btor1151 (signal (bvnot (signal-value btor615)) (list)))
           (btor1154
            (if (bitvector->bool (signal-value btor36)) btor662 btor661))
           (btor1155
            (if (bitvector->bool (signal-value btor64)) btor148 btor1154))
           (btor1159 (signal (bvnot (signal-value btor677)) (list)))
           (btor1162
            (if (bitvector->bool (signal-value btor40)) btor695 btor692))
           (btor1163
            (if (bitvector->bool (signal-value btor64)) btor148 btor1162))
           (btor1166
            (if (bitvector->bool (signal-value btor41)) btor773 btor743))
           (btor1167
            (if (bitvector->bool (signal-value btor1102)) btor596 btor1166))
           (btor1170
            (if (bitvector->bool (signal-value btor41)) btor793 btor789))
           (btor1171
            (if (bitvector->bool (signal-value btor1102)) btor148 btor1170))
           (btor1174
            (if (bitvector->bool (signal-value btor41)) btor803 btor799))
           (btor1175
            (if (bitvector->bool (signal-value btor1102)) btor148 btor1174))
           (btor1178
            (if (bitvector->bool (signal-value btor41)) btor880 btor803))
           (btor1179
            (if (bitvector->bool (signal-value btor1102)) btor148 btor1178))
           (btor1182
            (if (bitvector->bool (signal-value btor41)) btor875 btor809))
           (btor1183
            (if (bitvector->bool (signal-value btor1102)) btor148 btor1182))
           (btor1187 (signal (bvnot (signal-value btor872)) (list)))
           (btor1190
            (if (bitvector->bool (signal-value btor41)) btor809 btor887))
           (btor1191
            (if (bitvector->bool (signal-value btor1102)) btor148 btor1190))
           (output-state
            (remove-duplicates
             (append
              (append
               (list
                (cons
                 (string->symbol (string-append name "state885"))
                 (cons
                  (signal-value btor1191)
                  (if (assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state885")))
                    (add1
                     (cdr
                      (assoc-ref
                       merged-input-state-hash
                       (string->symbol (string-append name "state885")))))
                    0))))
               (append
                (list
                 (cons
                  (string->symbol (string-append name "state884"))
                  (cons
                   (signal-value btor887)
                   (if (assoc-has-key?
                        merged-input-state-hash
                        (string->symbol (string-append name "state884")))
                     (add1
                      (cdr
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state884")))))
                     0))))
                (append
                 (list
                  (cons
                   (string->symbol (string-append name "state859"))
                   (cons
                    (signal-value btor1187)
                    (if (assoc-has-key?
                         merged-input-state-hash
                         (string->symbol (string-append name "state859")))
                      (add1
                       (cdr
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state859")))))
                      0))))
                 (append
                  (list
                   (cons
                    (string->symbol (string-append name "state857"))
                    (cons
                     (signal-value btor854)
                     (if (assoc-has-key?
                          merged-input-state-hash
                          (string->symbol (string-append name "state857")))
                       (add1
                        (cdr
                         (assoc-ref
                          merged-input-state-hash
                          (string->symbol (string-append name "state857")))))
                       0))))
                  (append
                   (list
                    (cons
                     (string->symbol (string-append name "state855"))
                     (cons
                      (signal-value btor873)
                      (if (assoc-has-key?
                           merged-input-state-hash
                           (string->symbol (string-append name "state855")))
                        (add1
                         (cdr
                          (assoc-ref
                           merged-input-state-hash
                           (string->symbol (string-append name "state855")))))
                        0))))
                   (append
                    (list
                     (cons
                      (string->symbol (string-append name "state807"))
                      (cons
                       (signal-value btor1183)
                       (if (assoc-has-key?
                            merged-input-state-hash
                            (string->symbol (string-append name "state807")))
                         (add1
                          (cdr
                           (assoc-ref
                            merged-input-state-hash
                            (string->symbol (string-append name "state807")))))
                         0))))
                    (append
                     (list
                      (cons
                       (string->symbol (string-append name "state806"))
                       (cons
                        (signal-value btor809)
                        (if (assoc-has-key?
                             merged-input-state-hash
                             (string->symbol (string-append name "state806")))
                          (add1
                           (cdr
                            (assoc-ref
                             merged-input-state-hash
                             (string->symbol
                              (string-append name "state806")))))
                          0))))
                     (append
                      (list
                       (cons
                        (string->symbol (string-append name "state801"))
                        (cons
                         (signal-value btor1179)
                         (if (assoc-has-key?
                              merged-input-state-hash
                              (string->symbol (string-append name "state801")))
                           (add1
                            (cdr
                             (assoc-ref
                              merged-input-state-hash
                              (string->symbol
                               (string-append name "state801")))))
                           0))))
                      (append
                       (list
                        (cons
                         (string->symbol (string-append name "state800"))
                         (cons
                          (signal-value btor803)
                          (if (assoc-has-key?
                               merged-input-state-hash
                               (string->symbol
                                (string-append name "state800")))
                            (add1
                             (cdr
                              (assoc-ref
                               merged-input-state-hash
                               (string->symbol
                                (string-append name "state800")))))
                            0))))
                       (append
                        (list
                         (cons
                          (string->symbol (string-append name "state797"))
                          (cons
                           (signal-value btor1175)
                           (if (assoc-has-key?
                                merged-input-state-hash
                                (string->symbol
                                 (string-append name "state797")))
                             (add1
                              (cdr
                               (assoc-ref
                                merged-input-state-hash
                                (string->symbol
                                 (string-append name "state797")))))
                             0))))
                        (append
                         (list
                          (cons
                           (string->symbol (string-append name "state796"))
                           (cons
                            (signal-value btor799)
                            (if (assoc-has-key?
                                 merged-input-state-hash
                                 (string->symbol
                                  (string-append name "state796")))
                              (add1
                               (cdr
                                (assoc-ref
                                 merged-input-state-hash
                                 (string->symbol
                                  (string-append name "state796")))))
                              0))))
                         (append
                          (list
                           (cons
                            (string->symbol (string-append name "state787"))
                            (cons
                             (signal-value btor1171)
                             (if (assoc-has-key?
                                  merged-input-state-hash
                                  (string->symbol
                                   (string-append name "state787")))
                               (add1
                                (cdr
                                 (assoc-ref
                                  merged-input-state-hash
                                  (string->symbol
                                   (string-append name "state787")))))
                               0))))
                          (append
                           (list
                            (cons
                             (string->symbol (string-append name "state786"))
                             (cons
                              (signal-value btor789)
                              (if (assoc-has-key?
                                   merged-input-state-hash
                                   (string->symbol
                                    (string-append name "state786")))
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
                              (string->symbol (string-append name "state741"))
                              (cons
                               (signal-value btor1167)
                               (if (assoc-has-key?
                                    merged-input-state-hash
                                    (string->symbol
                                     (string-append name "state741")))
                                 (add1
                                  (cdr
                                   (assoc-ref
                                    merged-input-state-hash
                                    (string->symbol
                                     (string-append name "state741")))))
                                 0))))
                            (append
                             (list
                              (cons
                               (string->symbol (string-append name "state739"))
                               (cons
                                (signal-value btor743)
                                (if (assoc-has-key?
                                     merged-input-state-hash
                                     (string->symbol
                                      (string-append name "state739")))
                                  (add1
                                   (cdr
                                    (assoc-ref
                                     merged-input-state-hash
                                     (string->symbol
                                      (string-append name "state739")))))
                                  0))))
                             (append
                              (list
                               (cons
                                (string->symbol
                                 (string-append name "state690"))
                                (cons
                                 (signal-value btor1163)
                                 (if (assoc-has-key?
                                      merged-input-state-hash
                                      (string->symbol
                                       (string-append name "state690")))
                                   (add1
                                    (cdr
                                     (assoc-ref
                                      merged-input-state-hash
                                      (string->symbol
                                       (string-append name "state690")))))
                                   0))))
                              (append
                               (list
                                (cons
                                 (string->symbol
                                  (string-append name "state689"))
                                 (cons
                                  (signal-value btor692)
                                  (if (assoc-has-key?
                                       merged-input-state-hash
                                       (string->symbol
                                        (string-append name "state689")))
                                    (add1
                                     (cdr
                                      (assoc-ref
                                       merged-input-state-hash
                                       (string->symbol
                                        (string-append name "state689")))))
                                    0))))
                               (append
                                (list
                                 (cons
                                  (string->symbol
                                   (string-append name "state669"))
                                  (cons
                                   (signal-value btor1159)
                                   (if (assoc-has-key?
                                        merged-input-state-hash
                                        (string->symbol
                                         (string-append name "state669")))
                                     (add1
                                      (cdr
                                       (assoc-ref
                                        merged-input-state-hash
                                        (string->symbol
                                         (string-append name "state669")))))
                                     0))))
                                (append
                                 (list
                                  (cons
                                   (string->symbol
                                    (string-append name "state667"))
                                   (cons
                                    (signal-value btor665)
                                    (if (assoc-has-key?
                                         merged-input-state-hash
                                         (string->symbol
                                          (string-append name "state667")))
                                      (add1
                                       (cdr
                                        (assoc-ref
                                         merged-input-state-hash
                                         (string->symbol
                                          (string-append name "state667")))))
                                      0))))
                                 (append
                                  (list
                                   (cons
                                    (string->symbol
                                     (string-append name "state666"))
                                    (cons
                                     (signal-value btor678)
                                     (if (assoc-has-key?
                                          merged-input-state-hash
                                          (string->symbol
                                           (string-append name "state666")))
                                       (add1
                                        (cdr
                                         (assoc-ref
                                          merged-input-state-hash
                                          (string->symbol
                                           (string-append name "state666")))))
                                       0))))
                                  (append
                                   (list
                                    (cons
                                     (string->symbol
                                      (string-append name "state659"))
                                     (cons
                                      (signal-value btor1155)
                                      (if (assoc-has-key?
                                           merged-input-state-hash
                                           (string->symbol
                                            (string-append name "state659")))
                                        (add1
                                         (cdr
                                          (assoc-ref
                                           merged-input-state-hash
                                           (string->symbol
                                            (string-append name "state659")))))
                                        0))))
                                   (append
                                    (list
                                     (cons
                                      (string->symbol
                                       (string-append name "state658"))
                                      (cons
                                       (signal-value btor661)
                                       (if (assoc-has-key?
                                            merged-input-state-hash
                                            (string->symbol
                                             (string-append name "state658")))
                                         (add1
                                          (cdr
                                           (assoc-ref
                                            merged-input-state-hash
                                            (string->symbol
                                             (string-append
                                              name
                                              "state658")))))
                                         0))))
                                    (append
                                     (list
                                      (cons
                                       (string->symbol
                                        (string-append name "state607"))
                                       (cons
                                        (signal-value btor1151)
                                        (if (assoc-has-key?
                                             merged-input-state-hash
                                             (string->symbol
                                              (string-append name "state607")))
                                          (add1
                                           (cdr
                                            (assoc-ref
                                             merged-input-state-hash
                                             (string->symbol
                                              (string-append
                                               name
                                               "state607")))))
                                          0))))
                                     (append
                                      (list
                                       (cons
                                        (string->symbol
                                         (string-append name "state605"))
                                        (cons
                                         (signal-value btor603)
                                         (if (assoc-has-key?
                                              merged-input-state-hash
                                              (string->symbol
                                               (string-append
                                                name
                                                "state605")))
                                           (add1
                                            (cdr
                                             (assoc-ref
                                              merged-input-state-hash
                                              (string->symbol
                                               (string-append
                                                name
                                                "state605")))))
                                           0))))
                                      (append
                                       (list
                                        (cons
                                         (string->symbol
                                          (string-append name "state604"))
                                         (cons
                                          (signal-value btor616)
                                          (if (assoc-has-key?
                                               merged-input-state-hash
                                               (string->symbol
                                                (string-append
                                                 name
                                                 "state604")))
                                            (add1
                                             (cdr
                                              (assoc-ref
                                               merged-input-state-hash
                                               (string->symbol
                                                (string-append
                                                 name
                                                 "state604")))))
                                            0))))
                                       (append
                                        (list
                                         (cons
                                          (string->symbol
                                           (string-append name "state597"))
                                          (cons
                                           (signal-value btor1147)
                                           (if (assoc-has-key?
                                                merged-input-state-hash
                                                (string->symbol
                                                 (string-append
                                                  name
                                                  "state597")))
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
                                            (string-append name "state595"))
                                           (cons
                                            (signal-value btor599)
                                            (if (assoc-has-key?
                                                 merged-input-state-hash
                                                 (string->symbol
                                                  (string-append
                                                   name
                                                   "state595")))
                                              (add1
                                               (cdr
                                                (assoc-ref
                                                 merged-input-state-hash
                                                 (string->symbol
                                                  (string-append
                                                   name
                                                   "state595")))))
                                              0))))
                                         (append
                                          (list
                                           (cons
                                            (string->symbol
                                             (string-append name "state481"))
                                            (cons
                                             (signal-value btor1143)
                                             (if (assoc-has-key?
                                                  merged-input-state-hash
                                                  (string->symbol
                                                   (string-append
                                                    name
                                                    "state481")))
                                               (add1
                                                (cdr
                                                 (assoc-ref
                                                  merged-input-state-hash
                                                  (string->symbol
                                                   (string-append
                                                    name
                                                    "state481")))))
                                               0))))
                                          (append
                                           (list
                                            (cons
                                             (string->symbol
                                              (string-append name "state480"))
                                             (cons
                                              (signal-value btor483)
                                              (if (assoc-has-key?
                                                   merged-input-state-hash
                                                   (string->symbol
                                                    (string-append
                                                     name
                                                     "state480")))
                                                (add1
                                                 (cdr
                                                  (assoc-ref
                                                   merged-input-state-hash
                                                   (string->symbol
                                                    (string-append
                                                     name
                                                     "state480")))))
                                                0))))
                                           (append
                                            (list
                                             (cons
                                              (string->symbol
                                               (string-append name "state405"))
                                              (cons
                                               (signal-value btor1139)
                                               (if (assoc-has-key?
                                                    merged-input-state-hash
                                                    (string->symbol
                                                     (string-append
                                                      name
                                                      "state405")))
                                                 (add1
                                                  (cdr
                                                   (assoc-ref
                                                    merged-input-state-hash
                                                    (string->symbol
                                                     (string-append
                                                      name
                                                      "state405")))))
                                                 0))))
                                            (append
                                             (list
                                              (cons
                                               (string->symbol
                                                (string-append
                                                 name
                                                 "state404"))
                                               (cons
                                                (signal-value btor407)
                                                (if (assoc-has-key?
                                                     merged-input-state-hash
                                                     (string->symbol
                                                      (string-append
                                                       name
                                                       "state404")))
                                                  (add1
                                                   (cdr
                                                    (assoc-ref
                                                     merged-input-state-hash
                                                     (string->symbol
                                                      (string-append
                                                       name
                                                       "state404")))))
                                                  0))))
                                             (append
                                              (list
                                               (cons
                                                (string->symbol
                                                 (string-append
                                                  name
                                                  "state390"))
                                                (cons
                                                 (signal-value btor1135)
                                                 (if (assoc-has-key?
                                                      merged-input-state-hash
                                                      (string->symbol
                                                       (string-append
                                                        name
                                                        "state390")))
                                                   (add1
                                                    (cdr
                                                     (assoc-ref
                                                      merged-input-state-hash
                                                      (string->symbol
                                                       (string-append
                                                        name
                                                        "state390")))))
                                                   0))))
                                              (append
                                               (list
                                                (cons
                                                 (string->symbol
                                                  (string-append
                                                   name
                                                   "state388"))
                                                 (cons
                                                  (signal-value btor386)
                                                  (if (assoc-has-key?
                                                       merged-input-state-hash
                                                       (string->symbol
                                                        (string-append
                                                         name
                                                         "state388")))
                                                    (add1
                                                     (cdr
                                                      (assoc-ref
                                                       merged-input-state-hash
                                                       (string->symbol
                                                        (string-append
                                                         name
                                                         "state388")))))
                                                    0))))
                                               (append
                                                (list
                                                 (cons
                                                  (string->symbol
                                                   (string-append
                                                    name
                                                    "state387"))
                                                  (cons
                                                   (signal-value btor399)
                                                   (if (assoc-has-key?
                                                        merged-input-state-hash
                                                        (string->symbol
                                                         (string-append
                                                          name
                                                          "state387")))
                                                     (add1
                                                      (cdr
                                                       (assoc-ref
                                                        merged-input-state-hash
                                                        (string->symbol
                                                         (string-append
                                                          name
                                                          "state387")))))
                                                     0))))
                                                (append
                                                 (list
                                                  (cons
                                                   (string->symbol
                                                    (string-append
                                                     name
                                                     "state380"))
                                                   (cons
                                                    (signal-value btor1131)
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
                                                      "state378"))
                                                    (cons
                                                     (signal-value btor382)
                                                     (if (assoc-has-key?
                                                          merged-input-state-hash
                                                          (string->symbol
                                                           (string-append
                                                            name
                                                            "state378")))
                                                       (add1
                                                        (cdr
                                                         (assoc-ref
                                                          merged-input-state-hash
                                                          (string->symbol
                                                           (string-append
                                                            name
                                                            "state378")))))
                                                       0))))
                                                  (append
                                                   (list
                                                    (cons
                                                     (string->symbol
                                                      (string-append
                                                       name
                                                       "state351"))
                                                     (cons
                                                      (signal-value btor1127)
                                                      (if (assoc-has-key?
                                                           merged-input-state-hash
                                                           (string->symbol
                                                            (string-append
                                                             name
                                                             "state351")))
                                                        (add1
                                                         (cdr
                                                          (assoc-ref
                                                           merged-input-state-hash
                                                           (string->symbol
                                                            (string-append
                                                             name
                                                             "state351")))))
                                                        0))))
                                                   (append
                                                    (list
                                                     (cons
                                                      (string->symbol
                                                       (string-append
                                                        name
                                                        "state349"))
                                                      (cons
                                                       (signal-value btor347)
                                                       (if (assoc-has-key?
                                                            merged-input-state-hash
                                                            (string->symbol
                                                             (string-append
                                                              name
                                                              "state349")))
                                                         (add1
                                                          (cdr
                                                           (assoc-ref
                                                            merged-input-state-hash
                                                            (string->symbol
                                                             (string-append
                                                              name
                                                              "state349")))))
                                                         0))))
                                                    (append
                                                     (list
                                                      (cons
                                                       (string->symbol
                                                        (string-append
                                                         name
                                                         "state348"))
                                                       (cons
                                                        (signal-value btor360)
                                                        (if (assoc-has-key?
                                                             merged-input-state-hash
                                                             (string->symbol
                                                              (string-append
                                                               name
                                                               "state348")))
                                                          (add1
                                                           (cdr
                                                            (assoc-ref
                                                             merged-input-state-hash
                                                             (string->symbol
                                                              (string-append
                                                               name
                                                               "state348")))))
                                                          0))))
                                                     (append
                                                      (list
                                                       (cons
                                                        (string->symbol
                                                         (string-append
                                                          name
                                                          "state342"))
                                                        (cons
                                                         (signal-value
                                                          btor1123)
                                                         (if (assoc-has-key?
                                                              merged-input-state-hash
                                                              (string->symbol
                                                               (string-append
                                                                name
                                                                "state342")))
                                                           (add1
                                                            (cdr
                                                             (assoc-ref
                                                              merged-input-state-hash
                                                              (string->symbol
                                                               (string-append
                                                                name
                                                                "state342")))))
                                                           0))))
                                                      (append
                                                       (list
                                                        (cons
                                                         (string->symbol
                                                          (string-append
                                                           name
                                                           "state340"))
                                                         (cons
                                                          (signal-value
                                                           btor344)
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
                                                            "state334"))
                                                          (cons
                                                           (signal-value
                                                            btor1119)
                                                           (if (assoc-has-key?
                                                                merged-input-state-hash
                                                                (string->symbol
                                                                 (string-append
                                                                  name
                                                                  "state334")))
                                                             (add1
                                                              (cdr
                                                               (assoc-ref
                                                                merged-input-state-hash
                                                                (string->symbol
                                                                 (string-append
                                                                  name
                                                                  "state334")))))
                                                             0))))
                                                        (append
                                                         (list
                                                          (cons
                                                           (string->symbol
                                                            (string-append
                                                             name
                                                             "state333"))
                                                           (cons
                                                            (signal-value
                                                             btor336)
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
                                                              "state197"))
                                                            (cons
                                                             (signal-value
                                                              btor1115)
                                                             (if (assoc-has-key?
                                                                  merged-input-state-hash
                                                                  (string->symbol
                                                                   (string-append
                                                                    name
                                                                    "state197")))
                                                               (add1
                                                                (cdr
                                                                 (assoc-ref
                                                                  merged-input-state-hash
                                                                  (string->symbol
                                                                   (string-append
                                                                    name
                                                                    "state197")))))
                                                               0))))
                                                          (append
                                                           (list
                                                            (cons
                                                             (string->symbol
                                                              (string-append
                                                               name
                                                               "state196"))
                                                             (cons
                                                              (signal-value
                                                               btor199)
                                                              (if (assoc-has-key?
                                                                   merged-input-state-hash
                                                                   (string->symbol
                                                                    (string-append
                                                                     name
                                                                     "state196")))
                                                                (add1
                                                                 (cdr
                                                                  (assoc-ref
                                                                   merged-input-state-hash
                                                                   (string->symbol
                                                                    (string-append
                                                                     name
                                                                     "state196")))))
                                                                0))))
                                                           (append
                                                            (list
                                                             (cons
                                                              (string->symbol
                                                               (string-append
                                                                name
                                                                "state180"))
                                                              (cons
                                                               (signal-value
                                                                btor1111)
                                                               (if (assoc-has-key?
                                                                    merged-input-state-hash
                                                                    (string->symbol
                                                                     (string-append
                                                                      name
                                                                      "state180")))
                                                                 (add1
                                                                  (cdr
                                                                   (assoc-ref
                                                                    merged-input-state-hash
                                                                    (string->symbol
                                                                     (string-append
                                                                      name
                                                                      "state180")))))
                                                                 0))))
                                                            (append
                                                             (list
                                                              (cons
                                                               (string->symbol
                                                                (string-append
                                                                 name
                                                                 "state179"))
                                                               (cons
                                                                (signal-value
                                                                 btor182)
                                                                (if (assoc-has-key?
                                                                     merged-input-state-hash
                                                                     (string->symbol
                                                                      (string-append
                                                                       name
                                                                       "state179")))
                                                                  (add1
                                                                   (cdr
                                                                    (assoc-ref
                                                                     merged-input-state-hash
                                                                     (string->symbol
                                                                      (string-append
                                                                       name
                                                                       "state179")))))
                                                                  0))))
                                                             (append
                                                              (list
                                                               (cons
                                                                (string->symbol
                                                                 (string-append
                                                                  name
                                                                  "state165"))
                                                                (cons
                                                                 (signal-value
                                                                  btor1107)
                                                                 (if (assoc-has-key?
                                                                      merged-input-state-hash
                                                                      (string->symbol
                                                                       (string-append
                                                                        name
                                                                        "state165")))
                                                                   (add1
                                                                    (cdr
                                                                     (assoc-ref
                                                                      merged-input-state-hash
                                                                      (string->symbol
                                                                       (string-append
                                                                        name
                                                                        "state165")))))
                                                                   0))))
                                                              (append
                                                               (list
                                                                (cons
                                                                 (string->symbol
                                                                  (string-append
                                                                   name
                                                                   "state163"))
                                                                 (cons
                                                                  (signal-value
                                                                   btor167)
                                                                  (if (assoc-has-key?
                                                                       merged-input-state-hash
                                                                       (string->symbol
                                                                        (string-append
                                                                         name
                                                                         "state163")))
                                                                    (add1
                                                                     (cdr
                                                                      (assoc-ref
                                                                       merged-input-state-hash
                                                                       (string->symbol
                                                                        (string-append
                                                                         name
                                                                         "state163")))))
                                                                    0))))
                                                               (append
                                                                (list
                                                                 (cons
                                                                  (string->symbol
                                                                   (string-append
                                                                    name
                                                                    "state151"))
                                                                  (cons
                                                                   (signal-value
                                                                    btor1103)
                                                                   (if (assoc-has-key?
                                                                        merged-input-state-hash
                                                                        (string->symbol
                                                                         (string-append
                                                                          name
                                                                          "state151")))
                                                                     (add1
                                                                      (cdr
                                                                       (assoc-ref
                                                                        merged-input-state-hash
                                                                        (string->symbol
                                                                         (string-append
                                                                          name
                                                                          "state151")))))
                                                                     0))))
                                                                (append
                                                                 (list
                                                                  (cons
                                                                   (string->symbol
                                                                    (string-append
                                                                     name
                                                                     "state149"))
                                                                   (cons
                                                                    (signal-value
                                                                     btor153)
                                                                    (if (assoc-has-key?
                                                                         merged-input-state-hash
                                                                         (string->symbol
                                                                          (string-append
                                                                           name
                                                                           "state149")))
                                                                      (add1
                                                                       (cdr
                                                                        (assoc-ref
                                                                         merged-input-state-hash
                                                                         (string->symbol
                                                                          (string-append
                                                                           name
                                                                           "state149")))))
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
                                                                      btor1098)
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
                                                                        btor1092)
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
                                                                          btor1084)
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
                                                                             btor1077)
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
                                                                          (list)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
              merged-input-state-hash)
             equal?
             #:key
             car)))
      (list
       (cons 'PCOUT (signal (signal-value btor828) output-state))
       (cons 'PATTERNBDETECT (signal (signal-value btor876) output-state))
       (cons 'CARRYCASCOUT (signal (signal-value btor737) output-state))
       (cons 'P (signal (signal-value btor828) output-state))
       (cons 'CARRYOUT (signal (signal-value btor784) output-state))
       (cons 'UNDERFLOW (signal (signal-value btor890) output-state))
       (cons 'BCOUT (signal (signal-value btor146) output-state))
       (cons 'MULTSIGNOUT (signal (signal-value btor794) output-state))
       (cons 'OVERFLOW (signal (signal-value btor816) output-state))
       (cons 'ACOUT (signal (signal-value btor117) output-state))
       (cons 'PATTERNDETECT (signal (signal-value btor881) output-state))))))

