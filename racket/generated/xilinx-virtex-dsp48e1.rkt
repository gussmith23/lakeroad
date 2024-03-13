#lang racket/base
(provide xilinx-ultrascale-plus-dsp48e1)
(require (file "/Users/vishalc/files/CS/research/lakeroad/racket/signal.rkt"))
(require rosette)
(define xilinx-ultrascale-plus-dsp48e1
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
       (bv->signal (constant 'AUTORESET_PATDET (bitvector 1))))
      #:A_INPUT
      (A_INPUT (bv->signal (constant 'A_INPUT (bitvector 1))))
      #:B
      (B (bv->signal (constant 'B (bitvector 18))))
      #:BCASCREG
      (BCASCREG (bv->signal (constant 'BCASCREG (bitvector 32))))
      #:BCIN
      (BCIN (bv->signal (constant 'BCIN (bitvector 18))))
      #:BREG
      (BREG (bv->signal (constant 'BREG (bitvector 32))))
      #:B_INPUT
      (B_INPUT (bv->signal (constant 'B_INPUT (bitvector 1))))
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
      (SEL_MASK (bv->signal (constant 'SEL_MASK (bitvector 1))))
      #:SEL_PATTERN
      (SEL_PATTERN (bv->signal (constant 'SEL_PATTERN (bitvector 1))))
      #:USE_DPORT
      (USE_DPORT (bv->signal (constant 'USE_DPORT (bitvector 1))))
      #:USE_MULT
      (USE_MULT (bv->signal (constant 'USE_MULT (bitvector 1))))
      #:USE_PATTERN_DETECT
      (USE_PATTERN_DETECT
       (bv->signal (constant 'USE_PATTERN_DETECT (bitvector 1))))
      #:USE_SIMD
      (USE_SIMD (bv->signal (constant 'USE_SIMD (bitvector 1))))
      #:unnamed-input-173
      (unnamed-input-173
       (bv->signal (constant 'unnamed-input-173 (bitvector 43))))
      #:unnamed-input-499
      (unnamed-input-499
       (bv->signal (constant 'unnamed-input-499 (bitvector 4))))
      #:unnamed-input-508
      (unnamed-input-508
       (bv->signal (constant 'unnamed-input-508 (bitvector 4))))
      #:unnamed-input-514
      (unnamed-input-514
       (bv->signal (constant 'unnamed-input-514 (bitvector 1))))
      #:unnamed-input-539
      (unnamed-input-539
       (bv->signal (constant 'unnamed-input-539 (bitvector 1))))
      #:unnamed-input-574
      (unnamed-input-574
       (bv->signal (constant 'unnamed-input-574 (bitvector 1))))
      #:unnamed-input-578
      (unnamed-input-578
       (bv->signal (constant 'unnamed-input-578 (bitvector 1))))
      #:unnamed-input-582
      (unnamed-input-582
       (bv->signal (constant 'unnamed-input-582 (bitvector 1))))
      #:unnamed-input-590
      (unnamed-input-590
       (bv->signal (constant 'unnamed-input-590 (bitvector 1))))
      #:unnamed-input-607
      (unnamed-input-607
       (bv->signal (constant 'unnamed-input-607 (bitvector 1))))
      #:unnamed-input-636
      (unnamed-input-636
       (bv->signal (constant 'unnamed-input-636 (bitvector 4))))
      #:unnamed-input-640
      (unnamed-input-640
       (bv->signal (constant 'unnamed-input-640 (bitvector 3))))
      #:unnamed-input-645
      (unnamed-input-645
       (bv->signal (constant 'unnamed-input-645 (bitvector 4))))
      #:unnamed-input-836
      (unnamed-input-836
       (bv->signal (constant 'unnamed-input-836 (bitvector 4))))
      #:name
      (name ""))
    (let* ((merged-input-state-hash (list))
           (init-hash
            (append
             (list
              (cons
               (string->symbol (string-append name "state592"))
               (bv 0 (bitvector 1))))
             (append
              (list
               (cons
                (string->symbol (string-append name "state559"))
                (bv 0 (bitvector 48))))
              (append
               (list
                (cons
                 (string->symbol (string-append name "state551"))
                 (bv 0 (bitvector 1))))
               (append
                (list
                 (cons
                  (string->symbol (string-append name "state545"))
                  (bv 0 (bitvector 1))))
                (append
                 (list
                  (cons
                   (string->symbol (string-append name "state541"))
                   (bv 0 (bitvector 1))))
                 (append
                  (list
                   (cons
                    (string->symbol (string-append name "state530"))
                    (bv 0 (bitvector 1))))
                  (append
                   (list
                    (cons
                     (string->symbol (string-append name "state504"))
                     (bv 0 (bitvector 4))))
                   (append
                    (list
                     (cons
                      (string->symbol (string-append name "state502"))
                      (bv 0 (bitvector 4))))
                    (append
                     (list
                      (cons
                       (string->symbol (string-append name "state439"))
                       (bv 0 (bitvector 5))))
                     (append
                      (list
                       (cons
                        (string->symbol (string-append name "state431"))
                        (bv 0 (bitvector 1))))
                      (append
                       (list
                        (cons
                         (string->symbol (string-append name "state417"))
                         (bv 0 (bitvector 1))))
                       (append
                        (list
                         (cons
                          (string->symbol (string-append name "state384"))
                          (bv 0 (bitvector 4))))
                        (append
                         (list
                          (cons
                           (string->symbol (string-append name "state311"))
                           (bv 0 (bitvector 48))))
                         (append
                          (list
                           (cons
                            (string->symbol (string-append name "state206"))
                            (bv 0 (bitvector 7))))
                          (append
                           (list
                            (cons
                             (string->symbol (string-append name "state176"))
                             (bv 0 (bitvector 3))))
                           (append
                            (list
                             (cons
                              (string->symbol (string-append name "state167"))
                              (bv 0 (bitvector 43))))
                            (append
                             (list
                              (cons
                               (string->symbol (string-append name "state154"))
                               (bv 1 (bitvector 1))))
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
                                    (string-append name "state120"))
                                   (bv 0 (bitvector 18))))
                                 (append
                                  (list
                                   (cons
                                    (string->symbol
                                     (string-append name "state110"))
                                    (bv 0 (bitvector 30))))
                                  (append
                                   (list
                                    (cons
                                     (string->symbol
                                      (string-append name "state84"))
                                     (bv 1 (bitvector 1))))
                                   (append
                                    (list
                                     (cons
                                      (string->symbol
                                       (string-append name "state81"))
                                      (bv 0 (bitvector 30))))
                                    (list))))))))))))))))))))))))))
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
           (btor11 (bitvector 1))
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
           (btor22 CARRYCASCIN)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CARRYCASCIN)))
           (btor23 CARRYIN)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CARRYIN)))
           (btor24 CARRYINREG)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CARRYINREG)))
           (btor25 (bitvector 3))
           (btor26 CARRYINSEL)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CARRYINSEL)))
           (btor27 CARRYINSELREG)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state CARRYINSELREG)))
           (btor28 CEA1)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CEA1)))
           (btor29 CEA2)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CEA2)))
           (btor30 CEAD)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CEAD)))
           (btor31 CEALUMODE)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CEALUMODE)))
           (btor32 CEB1)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CEB1)))
           (btor33 CEB2)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CEB2)))
           (btor34 CEC)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CEC)))
           (btor35 CECARRYIN)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CECARRYIN)))
           (btor36 CECTRL)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CECTRL)))
           (btor37 CED)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CED)))
           (btor38 CEINMODE)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CEINMODE)))
           (btor39 CEM)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CEM)))
           (btor40 CEP)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CEP)))
           (btor41 CLK)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CLK)))
           (btor42 CREG)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CREG)))
           (btor43 (bitvector 25))
           (btor44 D)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state D)))
           (btor45 DREG)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state DREG)))
           (btor46 (bitvector 5))
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
           (btor79 (bv->signal (bv 0 (bitvector 30))))
           (btor80
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state80")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state80"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state80")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state80")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 30))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor81
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state81")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state81"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state81")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state81")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 30))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor83 (bv->signal (bv 1 (bitvector 1))))
           (btor84
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state84")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state84"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state84")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state84")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor86 (bitvector 2))
           (btor87
            (signal
             (concat (signal-value btor84) (signal-value btor41))
             (list)))
           (btor88
            (bv->signal
             (zero-extend (signal-value btor83) (bitvector 2))
             btor83))
           (btor89
            (signal
             (bool->bitvector
              (bveq (signal-value btor87) (signal-value btor88)))
             (list)))
           (btor90 (if (bitvector->bool (signal-value btor89)) btor81 btor80))
           (btor91 (bv->signal (bv 1 (bitvector 2))))
           (btor92
            (bv->signal
             (sign-extend (signal-value btor91) (bitvector 32))
             btor91))
           (btor93
            (signal
             (bool->bitvector
              (bveq (signal-value btor10) (signal-value btor92)))
             (list)))
           (btor94 (bv->signal (bv 2 (bitvector 3))))
           (btor95
            (bv->signal
             (sign-extend (signal-value btor94) (bitvector 32))
             btor94))
           (btor96
            (signal
             (bool->bitvector
              (bveq (signal-value btor10) (signal-value btor95)))
             (list)))
           (btor97
            (signal (bvor (signal-value btor93) (signal-value btor96)) (list)))
           (btor98 (if (bitvector->bool (signal-value btor97)) btor90 btor79))
           (btor99 (if (bitvector->bool (signal-value btor13)) btor2 btor79))
           (btor100
            (signal
             (apply bvor (bitvector->bits (signal-value btor10)))
             (signal-state btor10)))
           (btor101 (signal (bvnot (signal-value btor100)) (list)))
           (btor102
            (if (bitvector->bool (signal-value btor101)) btor99 btor98))
           (btor103
            (signal
             (apply bvor (bitvector->bits (signal-value btor4)))
             (signal-state btor4)))
           (btor104 (signal (bvnot (signal-value btor103)) (list)))
           (btor105
            (bv->signal
             (sign-extend (signal-value btor94) (bitvector 32))
             btor94))
           (btor106
            (signal
             (bool->bitvector
              (bveq (signal-value btor4) (signal-value btor105)))
             (list)))
           (btor107
            (signal
             (bvor (signal-value btor104) (signal-value btor106))
             (list)))
           (btor108
            (if (bitvector->bool (signal-value btor107)) btor102 btor79))
           (btor109
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state109")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state109"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state109")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state109")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 30))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
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
           (btor112
            (if (bitvector->bool (signal-value btor89)) btor110 btor109))
           (btor113
            (if (bitvector->bool (signal-value btor96)) btor112 btor102))
           (btor114
            (bv->signal
             (sign-extend (signal-value btor91) (bitvector 32))
             btor91))
           (btor115
            (signal
             (bool->bitvector
              (bveq (signal-value btor4) (signal-value btor114)))
             (list)))
           (btor116
            (if (bitvector->bool (signal-value btor115)) btor113 btor108))
           (btor118 (bv->signal (bv 0 (bitvector 18))))
           (btor119
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state119")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state119"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state119")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state119")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor120
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state120")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state120"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state120")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state120")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor122
            (if (bitvector->bool (signal-value btor89)) btor120 btor119))
           (btor123
            (bv->signal
             (sign-extend (signal-value btor91) (bitvector 32))
             btor91))
           (btor124
            (signal
             (bool->bitvector
              (bveq (signal-value btor18) (signal-value btor123)))
             (list)))
           (btor125
            (bv->signal
             (sign-extend (signal-value btor94) (bitvector 32))
             btor94))
           (btor126
            (signal
             (bool->bitvector
              (bveq (signal-value btor18) (signal-value btor125)))
             (list)))
           (btor127
            (signal
             (bvor (signal-value btor124) (signal-value btor126))
             (list)))
           (btor128
            (if (bitvector->bool (signal-value btor127)) btor122 btor118))
           (btor129
            (if (bitvector->bool (signal-value btor19)) btor15 btor118))
           (btor130
            (signal
             (apply bvor (bitvector->bits (signal-value btor18)))
             (signal-state btor18)))
           (btor131 (signal (bvnot (signal-value btor130)) (list)))
           (btor132
            (if (bitvector->bool (signal-value btor131)) btor129 btor128))
           (btor133
            (signal
             (apply bvor (bitvector->bits (signal-value btor16)))
             (signal-state btor16)))
           (btor134 (signal (bvnot (signal-value btor133)) (list)))
           (btor135
            (bv->signal
             (sign-extend (signal-value btor94) (bitvector 32))
             btor94))
           (btor136
            (signal
             (bool->bitvector
              (bveq (signal-value btor16) (signal-value btor135)))
             (list)))
           (btor137
            (signal
             (bvor (signal-value btor134) (signal-value btor136))
             (list)))
           (btor138
            (if (bitvector->bool (signal-value btor137)) btor132 btor118))
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
            (if (bitvector->bool (signal-value btor89)) btor140 btor139))
           (btor143
            (if (bitvector->bool (signal-value btor126)) btor142 btor132))
           (btor144
            (bv->signal
             (sign-extend (signal-value btor91) (bitvector 32))
             btor91))
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
            (signal
             (bvxor (signal-value btor41) (signal-value btor51))
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
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor156
            (signal
             (concat (signal-value btor154) (signal-value btor153))
             (list)))
           (btor157
            (bv->signal
             (zero-extend (signal-value btor83) (bitvector 2))
             btor83))
           (btor158
            (signal
             (bool->bitvector
              (bveq (signal-value btor156) (signal-value btor157)))
             (list)))
           (btor159
            (if (bitvector->bool (signal-value btor158)) btor151 btor149))
           (btor160
            (bv->signal
             (sign-extend (signal-value btor91) (bitvector 32))
             btor91))
           (btor161
            (signal
             (bool->bitvector
              (bveq (signal-value btor62) (signal-value btor160)))
             (list)))
           (btor162
            (if (bitvector->bool (signal-value btor161)) btor159 btor148))
           (btor163 (bitvector 13))
           (btor164 (bitvector 43))
           (btor165 (bv->signal (bv 0 (bitvector 43))))
           (btor166
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state166")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state166"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state166")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state166")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 43))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor167
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state167")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state167"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state167")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state167")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 43))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor169
            (if (bitvector->bool (signal-value btor158)) btor167 btor166))
           (btor170
            (bv->signal
             (sign-extend (signal-value btor91) (bitvector 32))
             btor91))
           (btor171
            (signal
             (bool->bitvector
              (bveq (signal-value btor56) (signal-value btor170)))
             (list)))
           (btor172
            (if (bitvector->bool (signal-value btor171)) btor169 btor165))
           (btor173 unnamed-input-173)
           (btor174 (bv->signal (bv 0 (bitvector 3))))
           (btor175
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state175")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state175"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state175")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state175")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 3))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor176
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state176")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state176"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state176")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state176")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 3))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor178
            (if (bitvector->bool (signal-value btor158)) btor176 btor175))
           (btor179
            (bv->signal
             (sign-extend (signal-value btor91) (bitvector 32))
             btor91))
           (btor180
            (signal
             (bool->bitvector
              (bveq (signal-value btor27) (signal-value btor179)))
             (list)))
           (btor181
            (if (bitvector->bool (signal-value btor180)) btor178 btor174))
           (btor182
            (signal
             (apply bvor (bitvector->bits (signal-value btor27)))
             (signal-state btor27)))
           (btor183 (signal (bvnot (signal-value btor182)) (list)))
           (btor184
            (if (bitvector->bool (signal-value btor183)) btor26 btor181))
           (btor185 (bv->signal (bv 2 (bitvector 2))))
           (btor186
            (bv->signal
             (zero-extend (signal-value btor185) (bitvector 3))
             btor185))
           (btor187
            (signal
             (bool->bitvector
              (bveq (signal-value btor184) (signal-value btor186)))
             (list)))
           (btor188
            (if (bitvector->bool (signal-value btor187)) btor173 btor172))
           (btor189
            (signal
             (extract 42 42 (signal-value btor188))
             (signal-state btor188)))
           (btor190 (bitvector 44))
           (btor191
            (signal
             (concat (signal-value btor189) (signal-value btor188))
             (list)))
           (btor192
            (signal
             (extract 42 42 (signal-value btor188))
             (signal-state btor188)))
           (btor193 (bitvector 45))
           (btor194
            (signal
             (concat (signal-value btor192) (signal-value btor191))
             (list)))
           (btor195
            (signal
             (extract 42 42 (signal-value btor188))
             (signal-state btor188)))
           (btor196 (bitvector 46))
           (btor197
            (signal
             (concat (signal-value btor195) (signal-value btor194))
             (list)))
           (btor198
            (signal
             (extract 42 42 (signal-value btor188))
             (signal-state btor188)))
           (btor199 (bitvector 47))
           (btor200
            (signal
             (concat (signal-value btor198) (signal-value btor197))
             (list)))
           (btor201
            (signal
             (extract 42 42 (signal-value btor188))
             (signal-state btor188)))
           (btor202
            (signal
             (concat (signal-value btor201) (signal-value btor200))
             (list)))
           (btor203 (bv->signal (bv 0 (bitvector 48))))
           (btor204
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state204")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state204"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state204")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state204")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 7))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor205 (bv->signal (bv 0 (bitvector 7))))
           (btor206
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state206")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state206"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state206")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state206")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 7))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor208
            (if (bitvector->bool (signal-value btor158)) btor206 btor204))
           (btor209
            (signal
             (bvxor (signal-value btor58) (signal-value btor54))
             (list)))
           (btor210
            (signal
             (apply bvor (bitvector->bits (signal-value btor59)))
             (signal-state btor59)))
           (btor211 (signal (bvnot (signal-value btor210)) (list)))
           (btor212
            (if (bitvector->bool (signal-value btor211)) btor209 btor208))
           (btor213
            (signal
             (extract 1 0 (signal-value btor212))
             (signal-state btor212)))
           (btor214
            (signal
             (bool->bitvector
              (bveq (signal-value btor213) (signal-value btor185)))
             (list)))
           (btor215
            (signal
             (apply bvor (bitvector->bits (signal-value btor213)))
             (signal-state btor213)))
           (btor216 (signal (bvnot (signal-value btor215)) (list)))
           (btor217
            (signal
             (concat (signal-value btor216) (signal-value btor214))
             (list)))
           (btor218
            (signal
             (apply bvor (bitvector->bits (signal-value btor217)))
             (signal-state btor217)))
           (btor219
            (if (bitvector->bool (signal-value btor218)) btor203 btor202))
           (btor220
            (signal
             (concat (signal-value btor102) (signal-value btor132))
             (list)))
           (btor221 (bv->signal (bv 3 (bitvector 2))))
           (btor222
            (signal
             (bool->bitvector
              (bveq (signal-value btor213) (signal-value btor221)))
             (list)))
           (btor223
            (if (bitvector->bool (signal-value btor222)) btor220 btor219))
           (btor224 (bv->signal (bv 281474976710655 (bitvector 48))))
           (btor225
            (signal
             (concat (signal-value btor57) (signal-value btor57))
             (list)))
           (btor226
            (signal
             (concat (signal-value btor57) (signal-value btor225))
             (list)))
           (btor227
            (signal
             (concat (signal-value btor57) (signal-value btor226))
             (list)))
           (btor228
            (signal
             (concat (signal-value btor57) (signal-value btor227))
             (list)))
           (btor229 (bitvector 6))
           (btor230
            (signal
             (concat (signal-value btor57) (signal-value btor228))
             (list)))
           (btor231
            (signal
             (concat (signal-value btor57) (signal-value btor230))
             (list)))
           (btor232 (bitvector 8))
           (btor233
            (signal
             (concat (signal-value btor57) (signal-value btor231))
             (list)))
           (btor234 (bitvector 9))
           (btor235
            (signal
             (concat (signal-value btor57) (signal-value btor233))
             (list)))
           (btor236 (bitvector 10))
           (btor237
            (signal
             (concat (signal-value btor57) (signal-value btor235))
             (list)))
           (btor238 (bitvector 11))
           (btor239
            (signal
             (concat (signal-value btor57) (signal-value btor237))
             (list)))
           (btor240 (bitvector 12))
           (btor241
            (signal
             (concat (signal-value btor57) (signal-value btor239))
             (list)))
           (btor242
            (signal
             (concat (signal-value btor57) (signal-value btor241))
             (list)))
           (btor243 (bitvector 14))
           (btor244
            (signal
             (concat (signal-value btor57) (signal-value btor242))
             (list)))
           (btor245 (bitvector 15))
           (btor246
            (signal
             (concat (signal-value btor57) (signal-value btor244))
             (list)))
           (btor247 (bitvector 16))
           (btor248
            (signal
             (concat (signal-value btor57) (signal-value btor246))
             (list)))
           (btor249 (bitvector 17))
           (btor250
            (signal
             (concat (signal-value btor57) (signal-value btor248))
             (list)))
           (btor251
            (signal
             (concat (signal-value btor57) (signal-value btor250))
             (list)))
           (btor252 (bitvector 19))
           (btor253
            (signal
             (concat (signal-value btor57) (signal-value btor251))
             (list)))
           (btor254 (bitvector 20))
           (btor255
            (signal
             (concat (signal-value btor57) (signal-value btor253))
             (list)))
           (btor256 (bitvector 21))
           (btor257
            (signal
             (concat (signal-value btor57) (signal-value btor255))
             (list)))
           (btor258 (bitvector 22))
           (btor259
            (signal
             (concat (signal-value btor57) (signal-value btor257))
             (list)))
           (btor260 (bitvector 23))
           (btor261
            (signal
             (concat (signal-value btor57) (signal-value btor259))
             (list)))
           (btor262 (bitvector 24))
           (btor263
            (signal
             (concat (signal-value btor57) (signal-value btor261))
             (list)))
           (btor264
            (signal
             (concat (signal-value btor57) (signal-value btor263))
             (list)))
           (btor265 (bitvector 26))
           (btor266
            (signal
             (concat (signal-value btor57) (signal-value btor264))
             (list)))
           (btor267 (bitvector 27))
           (btor268
            (signal
             (concat (signal-value btor57) (signal-value btor266))
             (list)))
           (btor269 (bitvector 28))
           (btor270
            (signal
             (concat (signal-value btor57) (signal-value btor268))
             (list)))
           (btor271 (bitvector 29))
           (btor272
            (signal
             (concat (signal-value btor57) (signal-value btor270))
             (list)))
           (btor273
            (signal
             (concat (signal-value btor57) (signal-value btor272))
             (list)))
           (btor274 (bitvector 31))
           (btor275
            (signal
             (concat (signal-value btor57) (signal-value btor273))
             (list)))
           (btor276
            (signal
             (concat (signal-value btor57) (signal-value btor275))
             (list)))
           (btor277 (bitvector 33))
           (btor278
            (signal
             (concat (signal-value btor57) (signal-value btor276))
             (list)))
           (btor279 (bitvector 34))
           (btor280
            (signal
             (concat (signal-value btor57) (signal-value btor278))
             (list)))
           (btor281 (bitvector 35))
           (btor282
            (signal
             (concat (signal-value btor57) (signal-value btor280))
             (list)))
           (btor283 (bitvector 36))
           (btor284
            (signal
             (concat (signal-value btor57) (signal-value btor282))
             (list)))
           (btor285 (bitvector 37))
           (btor286
            (signal
             (concat (signal-value btor57) (signal-value btor284))
             (list)))
           (btor287 (bitvector 38))
           (btor288
            (signal
             (concat (signal-value btor57) (signal-value btor286))
             (list)))
           (btor289 (bitvector 39))
           (btor290
            (signal
             (concat (signal-value btor57) (signal-value btor288))
             (list)))
           (btor291 (bitvector 40))
           (btor292
            (signal
             (concat (signal-value btor57) (signal-value btor290))
             (list)))
           (btor293 (bitvector 41))
           (btor294
            (signal
             (concat (signal-value btor57) (signal-value btor292))
             (list)))
           (btor295 (bitvector 42))
           (btor296
            (signal
             (concat (signal-value btor57) (signal-value btor294))
             (list)))
           (btor297
            (signal
             (concat (signal-value btor57) (signal-value btor296))
             (list)))
           (btor298
            (signal
             (concat (signal-value btor57) (signal-value btor297))
             (list)))
           (btor299
            (signal
             (concat (signal-value btor57) (signal-value btor298))
             (list)))
           (btor300
            (signal
             (concat (signal-value btor57) (signal-value btor299))
             (list)))
           (btor301
            (signal
             (concat (signal-value btor57) (signal-value btor300))
             (list)))
           (btor302
            (signal
             (concat (signal-value btor57) (signal-value btor301))
             (list)))
           (btor303
            (signal
             (extract 6 4 (signal-value btor212))
             (signal-state btor212)))
           (btor304 (bv->signal (bv 4 (bitvector 3))))
           (btor305
            (signal
             (bool->bitvector
              (bveq (signal-value btor303) (signal-value btor304)))
             (list)))
           (btor306
            (if (bitvector->bool (signal-value btor305)) btor302 btor224))
           (btor307
            (signal
             (extract 3 2 (signal-value btor212))
             (signal-state btor212)))
           (btor308
            (signal
             (bool->bitvector
              (bveq (signal-value btor307) (signal-value btor185)))
             (list)))
           (btor309
            (if (bitvector->bool (signal-value btor308)) btor306 btor203))
           (btor310
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state310")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state310"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state310")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state310")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 48))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor311
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state311")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state311"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state311")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state311")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 48))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor313
            (if (bitvector->bool (signal-value btor158)) btor311 btor310))
           (btor314
            (signal
             (apply bvor (bitvector->bits (signal-value btor42)))
             (signal-state btor42)))
           (btor315 (signal (bvnot (signal-value btor314)) (list)))
           (btor316
            (if (bitvector->bool (signal-value btor315)) btor21 btor313))
           (btor317
            (signal
             (bool->bitvector
              (bveq (signal-value btor307) (signal-value btor221)))
             (list)))
           (btor318
            (if (bitvector->bool (signal-value btor317)) btor316 btor309))
           (btor319
            (signal
             (bvand (signal-value btor223) (signal-value btor318))
             (list)))
           (btor320
            (bv->signal
             (zero-extend (signal-value btor221) (bitvector 3))
             btor221))
           (btor321
            (signal
             (bool->bitvector
              (bveq (signal-value btor303) (signal-value btor320)))
             (list)))
           (btor322
            (if (bitvector->bool (signal-value btor321)) btor316 btor61))
           (btor323
            (signal
             (extract 47 17 (signal-value btor61))
             (signal-state btor61)))
           (btor324
            (signal
             (extract 47 47 (signal-value btor61))
             (signal-state btor61)))
           (btor325
            (signal
             (concat (signal-value btor324) (signal-value btor323))
             (list)))
           (btor326
            (signal
             (extract 47 47 (signal-value btor61))
             (signal-state btor61)))
           (btor327
            (signal
             (concat (signal-value btor326) (signal-value btor325))
             (list)))
           (btor328
            (signal
             (extract 47 47 (signal-value btor61))
             (signal-state btor61)))
           (btor329
            (signal
             (concat (signal-value btor328) (signal-value btor327))
             (list)))
           (btor330
            (signal
             (extract 47 47 (signal-value btor61))
             (signal-state btor61)))
           (btor331
            (signal
             (concat (signal-value btor330) (signal-value btor329))
             (list)))
           (btor332
            (signal
             (extract 47 47 (signal-value btor61))
             (signal-state btor61)))
           (btor333
            (signal
             (concat (signal-value btor332) (signal-value btor331))
             (list)))
           (btor334
            (signal
             (extract 47 47 (signal-value btor61))
             (signal-state btor61)))
           (btor335
            (signal
             (concat (signal-value btor334) (signal-value btor333))
             (list)))
           (btor336
            (signal
             (extract 47 47 (signal-value btor61))
             (signal-state btor61)))
           (btor337
            (signal
             (concat (signal-value btor336) (signal-value btor335))
             (list)))
           (btor338
            (signal
             (extract 47 47 (signal-value btor61))
             (signal-state btor61)))
           (btor339
            (signal
             (concat (signal-value btor338) (signal-value btor337))
             (list)))
           (btor340
            (signal
             (extract 47 47 (signal-value btor61))
             (signal-state btor61)))
           (btor341
            (signal
             (concat (signal-value btor340) (signal-value btor339))
             (list)))
           (btor342
            (signal
             (extract 47 47 (signal-value btor61))
             (signal-state btor61)))
           (btor343
            (signal
             (concat (signal-value btor342) (signal-value btor341))
             (list)))
           (btor344
            (signal
             (extract 47 47 (signal-value btor61))
             (signal-state btor61)))
           (btor345
            (signal
             (concat (signal-value btor344) (signal-value btor343))
             (list)))
           (btor346
            (signal
             (extract 47 47 (signal-value btor61))
             (signal-state btor61)))
           (btor347
            (signal
             (concat (signal-value btor346) (signal-value btor345))
             (list)))
           (btor348
            (signal
             (extract 47 47 (signal-value btor61))
             (signal-state btor61)))
           (btor349
            (signal
             (concat (signal-value btor348) (signal-value btor347))
             (list)))
           (btor350
            (signal
             (extract 47 47 (signal-value btor61))
             (signal-state btor61)))
           (btor351
            (signal
             (concat (signal-value btor350) (signal-value btor349))
             (list)))
           (btor352
            (signal
             (extract 47 47 (signal-value btor61))
             (signal-state btor61)))
           (btor353
            (signal
             (concat (signal-value btor352) (signal-value btor351))
             (list)))
           (btor354
            (signal
             (extract 47 47 (signal-value btor61))
             (signal-state btor61)))
           (btor355
            (signal
             (concat (signal-value btor354) (signal-value btor353))
             (list)))
           (btor356
            (signal
             (extract 47 47 (signal-value btor61))
             (signal-state btor61)))
           (btor357
            (signal
             (concat (signal-value btor356) (signal-value btor355))
             (list)))
           (btor358
            (signal
             (extract 6 5 (signal-value btor212))
             (signal-state btor212)))
           (btor359
            (signal
             (bool->bitvector
              (bveq (signal-value btor358) (signal-value btor221)))
             (list)))
           (btor360
            (bv->signal
             (zero-extend (signal-value btor185) (bitvector 3))
             btor185))
           (btor361
            (signal
             (bool->bitvector
              (bveq (signal-value btor303) (signal-value btor360)))
             (list)))
           (btor362
            (signal
             (apply bvor (bitvector->bits (signal-value btor303)))
             (signal-state btor303)))
           (btor363 (signal (bvnot (signal-value btor362)) (list)))
           (btor364
            (signal
             (concat (signal-value btor359) (signal-value btor305))
             (list)))
           (btor365
            (signal
             (concat (signal-value btor361) (signal-value btor364))
             (list)))
           (btor366
            (signal
             (concat (signal-value btor363) (signal-value btor365))
             (list)))
           (btor367
            (signal
             (apply bvor (bitvector->bits (signal-value btor366)))
             (signal-state btor366)))
           (btor368
            (if (bitvector->bool (signal-value btor367)) btor203 btor357))
           (btor369 (bv->signal (bv 5 (bitvector 3))))
           (btor370
            (signal
             (bool->bitvector
              (bveq (signal-value btor303) (signal-value btor369)))
             (list)))
           (btor371
            (signal
             (bvor (signal-value btor370) (signal-value btor367))
             (list)))
           (btor372
            (if (bitvector->bool (signal-value btor371)) btor368 btor322))
           (btor373
            (signal
             (bvand (signal-value btor372) (signal-value btor318))
             (list)))
           (btor374
            (signal
             (bvor (signal-value btor319) (signal-value btor373))
             (list)))
           (btor375
            (signal
             (bvand (signal-value btor223) (signal-value btor372))
             (list)))
           (btor376
            (signal
             (bvor (signal-value btor374) (signal-value btor375))
             (list)))
           (btor377 (signal (bvnot (signal-value btor372)) (list)))
           (btor378
            (signal
             (bvand (signal-value btor377) (signal-value btor318))
             (list)))
           (btor379
            (signal
             (bvor (signal-value btor319) (signal-value btor378))
             (list)))
           (btor380
            (signal
             (bvand (signal-value btor223) (signal-value btor377))
             (list)))
           (btor381
            (signal
             (bvor (signal-value btor379) (signal-value btor380))
             (list)))
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
                          (bv 0 4))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor383 (bv->signal (bv 0 (bitvector 4))))
           (btor384
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state384")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state384"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state384")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state384")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 4))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor386
            (if (bitvector->bool (signal-value btor158)) btor384 btor382))
           (btor387
            (signal (bvxor (signal-value btor8) (signal-value btor49)) (list)))
           (btor388
            (signal
             (apply bvor (bitvector->bits (signal-value btor9)))
             (signal-state btor9)))
           (btor389 (signal (bvnot (signal-value btor388)) (list)))
           (btor390
            (if (bitvector->bool (signal-value btor389)) btor387 btor386))
           (btor391
            (signal
             (extract 0 0 (signal-value btor390))
             (signal-state btor390)))
           (btor392
            (if (bitvector->bool (signal-value btor391)) btor381 btor376))
           (btor393
            (signal
             (extract 2 2 (signal-value btor390))
             (signal-state btor390)))
           (btor394
            (if (bitvector->bool (signal-value btor393)) btor203 btor392))
           (btor395
            (signal
             (extract 47 35 (signal-value btor394))
             (signal-state btor394)))
           (btor396
            (signal
             (bvxor (signal-value btor372) (signal-value btor223))
             (list)))
           (btor397
            (signal
             (bvxor (signal-value btor396) (signal-value btor318))
             (list)))
           (btor398
            (signal
             (bvxor (signal-value btor377) (signal-value btor223))
             (list)))
           (btor399
            (signal
             (bvxor (signal-value btor398) (signal-value btor318))
             (list)))
           (btor400
            (if (bitvector->bool (signal-value btor391)) btor399 btor397))
           (btor401
            (signal
             (extract 3 3 (signal-value btor390))
             (signal-state btor390)))
           (btor402
            (if (bitvector->bool (signal-value btor401)) btor392 btor400))
           (btor403
            (signal
             (extract 47 36 (signal-value btor402))
             (signal-state btor402)))
           (btor404
            (bv->signal
             (zero-extend (signal-value btor403) (bitvector 13))
             btor403))
           (btor405
            (signal
             (bvadd (signal-value btor395) (signal-value btor404))
             (list)))
           (btor406
            (signal
             (extract 34 23 (signal-value btor394))
             (signal-state btor394)))
           (btor407
            (bv->signal
             (zero-extend (signal-value btor406) (bitvector 13))
             btor406))
           (btor408
            (signal
             (extract 35 24 (signal-value btor402))
             (signal-state btor402)))
           (btor409
            (bv->signal
             (zero-extend (signal-value btor408) (bitvector 13))
             btor408))
           (btor410
            (signal
             (bvadd (signal-value btor407) (signal-value btor409))
             (list)))
           (btor411
            (signal
             (extract 22 11 (signal-value btor394))
             (signal-state btor394)))
           (btor412
            (bv->signal
             (zero-extend (signal-value btor411) (bitvector 13))
             btor411))
           (btor413
            (signal
             (extract 23 12 (signal-value btor402))
             (signal-state btor402)))
           (btor414
            (bv->signal
             (zero-extend (signal-value btor413) (bitvector 13))
             btor413))
           (btor415
            (signal
             (bvadd (signal-value btor412) (signal-value btor414))
             (list)))
           (btor416
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state416")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state416"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state416")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state416")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor417
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state417")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state417"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state417")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state417")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor419
            (if (bitvector->bool (signal-value btor158)) btor417 btor416))
           (btor420
            (signal
             (bvxor (signal-value btor23) (signal-value btor50))
             (list)))
           (btor421
            (signal
             (apply bvor (bitvector->bits (signal-value btor24)))
             (signal-state btor24)))
           (btor422 (signal (bvnot (signal-value btor421)) (list)))
           (btor423
            (if (bitvector->bool (signal-value btor422)) btor420 btor419))
           (btor424
            (signal
             (extract 47 47 (signal-value btor61))
             (signal-state btor61)))
           (btor425 (signal (bvnot (signal-value btor424)) (list)))
           (btor426
            (bv->signal
             (zero-extend (signal-value btor83) (bitvector 3))
             btor83))
           (btor427
            (signal
             (bool->bitvector
              (bveq (signal-value btor184) (signal-value btor426)))
             (list)))
           (btor428
            (if (bitvector->bool (signal-value btor427)) btor425 btor423))
           (btor429
            (if (bitvector->bool (signal-value btor187)) btor22 btor428))
           (btor430
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state430")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state430"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state430")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state430")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor431
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state431")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state431"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state431")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state431")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor433
            (if (bitvector->bool (signal-value btor158)) btor431 btor430))
           (btor434
            (signal
             (extract 24 0 (signal-value btor102))
             (signal-state btor102)))
           (btor435
            (signal
             (extract 24 0 (signal-value btor112))
             (signal-state btor112)))
           (btor436
            (signal
             (bvxor (signal-value btor47) (signal-value btor52))
             (list)))
           (btor437
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state437")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state437"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state437")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state437")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 5))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor438 (bv->signal (bv 0 (bitvector 5))))
           (btor439
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state439")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state439"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state439")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state439")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 5))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor441
            (if (bitvector->bool (signal-value btor158)) btor439 btor437))
           (btor442
            (bv->signal
             (sign-extend (signal-value btor91) (bitvector 32))
             btor91))
           (btor443
            (signal
             (bool->bitvector
              (bveq (signal-value btor48) (signal-value btor442)))
             (list)))
           (btor444
            (if (bitvector->bool (signal-value btor443)) btor441 btor436))
           (btor445
            (signal
             (extract 0 0 (signal-value btor444))
             (signal-state btor444)))
           (btor446
            (if (bitvector->bool (signal-value btor445)) btor435 btor434))
           (btor447 (bv->signal (bv 0 (bitvector 25))))
           (btor448
            (signal
             (extract 1 1 (signal-value btor444))
             (signal-state btor444)))
           (btor449
            (if (bitvector->bool (signal-value btor448)) btor447 btor446))
           (btor450
            (signal
             (extract 24 24 (signal-value btor449))
             (signal-state btor449)))
           (btor451
            (signal
             (extract 4 4 (signal-value btor444))
             (signal-state btor444)))
           (btor452
            (if (bitvector->bool (signal-value btor451)) btor142 btor132))
           (btor453
            (signal
             (extract 17 17 (signal-value btor452))
             (signal-state btor452)))
           (btor454
            (signal
             ((lambda (a b) (bvnot (bvxor a b)))
              (signal-value btor450)
              (signal-value btor453))
             (list)))
           (btor455
            (signal
             (apply bvor (bitvector->bits (signal-value btor56)))
             (signal-state btor56)))
           (btor456 (signal (bvnot (signal-value btor455)) (list)))
           (btor457
            (if (bitvector->bool (signal-value btor456)) btor454 btor433))
           (btor458 (bv->signal (bv 6 (bitvector 3))))
           (btor459
            (signal
             (bool->bitvector
              (bveq (signal-value btor184) (signal-value btor458)))
             (list)))
           (btor460
            (if (bitvector->bool (signal-value btor459)) btor457 btor424))
           (btor461 (bv->signal (bv 7 (bitvector 3))))
           (btor462
            (signal
             (bool->bitvector
              (bveq (signal-value btor184) (signal-value btor461)))
             (list)))
           (btor463
            (signal
             (bool->bitvector
              (bveq (signal-value btor184) (signal-value btor369)))
             (list)))
           (btor464
            (signal
             (bool->bitvector
              (bveq (signal-value btor184) (signal-value btor304)))
             (list)))
           (btor465
            (signal
             (concat (signal-value btor463) (signal-value btor462))
             (list)))
           (btor466
            (signal
             (concat (signal-value btor464) (signal-value btor465))
             (list)))
           (btor467
            (signal
             (apply bvor (bitvector->bits (signal-value btor466)))
             (signal-state btor466)))
           (btor468
            (if (bitvector->bool (signal-value btor467)) btor148 btor460))
           (btor469
            (bv->signal
             (zero-extend (signal-value btor221) (bitvector 3))
             btor221))
           (btor470
            (signal
             (bool->bitvector
              (bveq (signal-value btor184) (signal-value btor469)))
             (list)))
           (btor471
            (signal
             (concat (signal-value btor459) (signal-value btor462))
             (list)))
           (btor472
            (signal
             (concat (signal-value btor463) (signal-value btor471))
             (list)))
           (btor473
            (signal
             (concat (signal-value btor464) (signal-value btor472))
             (list)))
           (btor474
            (signal
             (concat (signal-value btor470) (signal-value btor473))
             (list)))
           (btor475
            (signal
             (apply bvor (bitvector->bits (signal-value btor474)))
             (signal-state btor474)))
           (btor476
            (if (bitvector->bool (signal-value btor475)) btor468 btor429))
           (btor477
            (signal
             (bvor (signal-value btor401) (signal-value btor393))
             (list)))
           (btor478
            (if (bitvector->bool (signal-value btor477)) btor148 btor476))
           (btor479
            (signal
             (extract 10 0 (signal-value btor394))
             (signal-state btor394)))
           (btor480
            (signal
             (concat (signal-value btor479) (signal-value btor478))
             (list)))
           (btor481
            (bv->signal
             (zero-extend (signal-value btor480) (bitvector 13))
             btor480))
           (btor482
            (signal
             (extract 11 0 (signal-value btor402))
             (signal-state btor402)))
           (btor483
            (bv->signal
             (zero-extend (signal-value btor482) (bitvector 13))
             btor482))
           (btor484
            (signal
             (bvadd (signal-value btor481) (signal-value btor483))
             (list)))
           (btor485
            (signal
             (extract 12 12 (signal-value btor484))
             (signal-state btor484)))
           (btor486
            (bv->signal
             (zero-extend (signal-value btor485) (bitvector 13))
             btor485))
           (btor487
            (signal
             (bvadd (signal-value btor415) (signal-value btor486))
             (list)))
           (btor488
            (signal
             (extract 12 12 (signal-value btor487))
             (signal-state btor487)))
           (btor489
            (bv->signal
             (zero-extend (signal-value btor488) (bitvector 13))
             btor488))
           (btor490
            (signal
             (bvadd (signal-value btor410) (signal-value btor489))
             (list)))
           (btor491
            (signal
             (extract 12 12 (signal-value btor490))
             (signal-state btor490)))
           (btor492
            (bv->signal
             (zero-extend (signal-value btor491) (bitvector 13))
             btor491))
           (btor493
            (signal
             (bvadd (signal-value btor405) (signal-value btor492))
             (list)))
           (btor494
            (signal
             (extract 12 12 (signal-value btor493))
             (signal-state btor493)))
           (btor495
            (signal
             (apply bvor (bitvector->bits (signal-value btor62)))
             (signal-state btor62)))
           (btor496 (signal (bvnot (signal-value btor495)) (list)))
           (btor497
            (if (bitvector->bool (signal-value btor496)) btor494 btor162))
           (btor499 unnamed-input-499)
           (btor500 (bv->signal (bv 7 (bitvector 4))))
           (btor501
            (signal
             (bvand (signal-value btor499) (signal-value btor500))
             (list)))
           (btor502
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state502")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state502"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state502")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state502")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 4))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor504
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state504")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state504"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state504")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state504")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 4))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor506
            (if (bitvector->bool (signal-value btor158)) btor504 btor502))
           (btor507
            (if (bitvector->bool (signal-value btor161)) btor506 btor383))
           (btor508 unnamed-input-508)
           (btor509
            (signal
             (bvand (signal-value btor508) (signal-value btor500))
             (list)))
           (btor510 (signal (bvnot (signal-value btor494)) (list)))
           (btor511
            (signal
             (extract 1 1 (signal-value btor390))
             (signal-state btor390)))
           (btor512
            (signal
             (bvand (signal-value btor391) (signal-value btor511))
             (list)))
           (btor513
            (if (bitvector->bool (signal-value btor512)) btor510 btor494))
           (btor514 unnamed-input-514)
           (btor515
            (signal
             (extract 3 0 (signal-value btor212))
             (signal-state btor212)))
           (btor516
            (bv->signal
             (zero-extend (signal-value btor369) (bitvector 4))
             btor369))
           (btor517
            (signal
             (bool->bitvector
              (bveq (signal-value btor515) (signal-value btor516)))
             (list)))
           (btor518
            (signal
             (extract 3 2 (signal-value btor390))
             (signal-state btor390)))
           (btor519
            (signal
             (apply bvor (bitvector->bits (signal-value btor518)))
             (signal-state btor518)))
           (btor520
            (signal
             (bvor (signal-value btor517) (signal-value btor519))
             (list)))
           (btor521
            (if (bitvector->bool (signal-value btor520)) btor514 btor513))
           (btor522
            (signal
             (concat (signal-value btor521) (signal-value btor174))
             (list)))
           (btor523
            (signal
             (bvor (signal-value btor509) (signal-value btor522))
             (list)))
           (btor524
            (if (bitvector->bool (signal-value btor496)) btor523 btor507))
           (btor525
            (signal
             (extract 3 3 (signal-value btor524))
             (signal-state btor524)))
           (btor526
            (signal
             (concat (signal-value btor525) (signal-value btor174))
             (list)))
           (btor527
            (signal
             (bvor (signal-value btor501) (signal-value btor526))
             (list)))
           (btor529
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state529")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state529"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state529")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state529")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor530
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state530")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state530"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state530")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state530")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor532
            (if (bitvector->bool (signal-value btor158)) btor530 btor529))
           (btor533
            (if (bitvector->bool (signal-value btor161)) btor532 btor148))
           (btor534
            (signal
             (extract 42 42 (signal-value btor188))
             (signal-state btor188)))
           (btor535
            (signal
             (bool->bitvector
              (bveq (signal-value btor303) (signal-value btor304)))
             (list)))
           (btor536
            (if (bitvector->bool (signal-value btor535)) btor57 btor534))
           (btor537
            (if (bitvector->bool (signal-value btor496)) btor536 btor533))
           (btor539 unnamed-input-539)
           (btor540
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state540")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state540"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state540")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state540")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor541
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state541")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state541"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state541")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state541")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor543
            (if (bitvector->bool (signal-value btor158)) btor541 btor540))
           (btor544
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state544")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state544"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state544")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state544")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor545
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state545")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state545"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state545")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state545")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor547
            (if (bitvector->bool (signal-value btor158)) btor545 btor544))
           (btor548 (signal (bvnot (signal-value btor547)) (list)))
           (btor549
            (signal
             (bvand (signal-value btor543) (signal-value btor548))
             (list)))
           (btor550
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state550")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state550"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state550")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state550")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor551
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state551")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state551"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state551")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state551")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor553
            (if (bitvector->bool (signal-value btor158)) btor551 btor550))
           (btor554 (signal (bvnot (signal-value btor553)) (list)))
           (btor555
            (signal
             (bvand (signal-value btor549) (signal-value btor554))
             (list)))
           (btor556
            (if (bitvector->bool (signal-value btor161)) btor555 btor539))
           (btor558
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state558")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state558"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state558")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state558")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 48))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor559
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state559")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state559"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state559")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state559")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 48))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor561
            (if (bitvector->bool (signal-value btor158)) btor559 btor558))
           (btor562
            (if (bitvector->bool (signal-value btor161)) btor561 btor203))
           (btor563
            (signal
             (extract 11 0 (signal-value btor484))
             (signal-state btor484)))
           (btor564
            (signal
             (extract 11 0 (signal-value btor487))
             (signal-state btor487)))
           (btor565
            (signal
             (concat (signal-value btor564) (signal-value btor563))
             (list)))
           (btor566
            (signal
             (extract 11 0 (signal-value btor490))
             (signal-state btor490)))
           (btor567
            (signal
             (concat (signal-value btor566) (signal-value btor565))
             (list)))
           (btor568
            (signal
             (extract 11 0 (signal-value btor493))
             (signal-state btor493)))
           (btor569
            (signal
             (concat (signal-value btor568) (signal-value btor567))
             (list)))
           (btor570 (signal (bvnot (signal-value btor569)) (list)))
           (btor571
            (if (bitvector->bool (signal-value btor511)) btor570 btor569))
           (btor572
            (if (bitvector->bool (signal-value btor496)) btor571 btor562))
           (btor574 unnamed-input-574)
           (btor575
            (signal
             (bvxor (signal-value btor316) (signal-value btor571))
             (list)))
           (btor576
            (signal
             (bvor (signal-value btor575) (signal-value btor55))
             (list)))
           (btor577
            (signal
             (apply bvand (bitvector->bits (signal-value btor576)))
             (signal-state btor576)))
           (btor578 unnamed-input-578)
           (btor579
            (if (bitvector->bool (signal-value btor578)) btor577 btor574))
           (btor580
            (if (bitvector->bool (signal-value btor161)) btor553 btor579))
           (btor582 unnamed-input-582)
           (btor583 (signal (bvnot (signal-value btor575)) (list)))
           (btor584
            (signal
             (bvor (signal-value btor583) (signal-value btor55))
             (list)))
           (btor585
            (signal
             (apply bvand (bitvector->bits (signal-value btor584)))
             (signal-state btor584)))
           (btor586
            (if (bitvector->bool (signal-value btor578)) btor585 btor582))
           (btor587
            (if (bitvector->bool (signal-value btor161)) btor547 btor586))
           (btor590 unnamed-input-590)
           (btor591
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state591")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state591"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state591")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state591")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor592
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state592")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state592"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state592")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state592")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor594
            (if (bitvector->bool (signal-value btor158)) btor592 btor591))
           (btor595
            (signal
             (bvand (signal-value btor594) (signal-value btor548))
             (list)))
           (btor596
            (signal
             (bvand (signal-value btor595) (signal-value btor554))
             (list)))
           (btor597
            (if (bitvector->bool (signal-value btor161)) btor596 btor590))
           (btor599
            (bv->signal
             (zero-extend (signal-value btor485) (bitvector 1))
             btor485))
           (btor600
            (bv->signal
             (zero-extend (signal-value btor488) (bitvector 1))
             btor488))
           (btor601
            (bv->signal
             (zero-extend (signal-value btor491) (bitvector 1))
             btor491))
           (btor602
            (bv->signal
             (zero-extend (signal-value btor49) (bitvector 4))
             btor49))
           (btor603
            (bv->signal
             (zero-extend (signal-value btor50) (bitvector 1))
             btor50))
           (btor604
            (bv->signal
             (zero-extend (signal-value btor51) (bitvector 1))
             btor51))
           (btor605
            (bv->signal
             (zero-extend (signal-value btor52) (bitvector 5))
             btor52))
           (btor606
            (bv->signal
             (zero-extend (signal-value btor54) (bitvector 7))
             btor54))
           (btor607 unnamed-input-607)
           (btor608
            (bv->signal
             (zero-extend (signal-value btor607) (bitvector 1))
             btor607))
           (btor609
            (bv->signal
             (zero-extend (signal-value btor2) (bitvector 30))
             btor2))
           (btor610
            (bv->signal
             (zero-extend (signal-value btor2) (bitvector 30))
             btor2))
           (btor611
            (bv->signal
             (zero-extend (signal-value btor99) (bitvector 30))
             btor99))
           (btor612
            (bv->signal
             (zero-extend (signal-value btor449) (bitvector 25))
             btor449))
           (btor613
            (bv->signal
             (zero-extend (signal-value btor5) (bitvector 30))
             btor5))
           (btor614
            (bv->signal
             (zero-extend (signal-value btor5) (bitvector 30))
             btor5))
           (btor615
            (bv->signal
             (zero-extend (signal-value btor449) (bitvector 25))
             btor449))
           (btor616
            (bv->signal
             (zero-extend (signal-value btor571) (bitvector 48))
             btor571))
           (btor617
            (bv->signal
             (zero-extend (signal-value btor8) (bitvector 4))
             btor8))
           (btor618
            (bv->signal
             (zero-extend (signal-value btor387) (bitvector 4))
             btor387))
           (btor619
            (bv->signal
             (zero-extend (signal-value btor15) (bitvector 18))
             btor15))
           (btor620
            (bv->signal
             (zero-extend (signal-value btor15) (bitvector 18))
             btor15))
           (btor621
            (bv->signal
             (zero-extend (signal-value btor452) (bitvector 18))
             btor452))
           (btor622
            (bv->signal
             (zero-extend (signal-value btor129) (bitvector 18))
             btor129))
           (btor623
            (bv->signal
             (zero-extend (signal-value btor17) (bitvector 18))
             btor17))
           (btor624
            (bv->signal
             (zero-extend (signal-value btor17) (bitvector 18))
             btor17))
           (btor625
            (bv->signal
             (zero-extend (signal-value btor21) (bitvector 48))
             btor21))
           (btor626
            (bv->signal
             (zero-extend (signal-value btor21) (bitvector 48))
             btor21))
           (btor627
            (bv->signal
             (zero-extend (signal-value btor22) (bitvector 1))
             btor22))
           (btor628
            (bv->signal
             (zero-extend (signal-value btor22) (bitvector 1))
             btor22))
           (btor629
            (bv->signal
             (zero-extend (signal-value btor494) (bitvector 1))
             btor494))
           (btor630
            (bv->signal
             (zero-extend (signal-value btor497) (bitvector 1))
             btor497))
           (btor631
            (bv->signal
             (zero-extend (signal-value btor159) (bitvector 1))
             btor159))
           (btor632
            (bv->signal
             (zero-extend (signal-value btor23) (bitvector 1))
             btor23))
           (btor633
            (bv->signal
             (zero-extend (signal-value btor420) (bitvector 1))
             btor420))
           (btor634
            (bv->signal
             (zero-extend (signal-value btor26) (bitvector 3))
             btor26))
           (btor635
            (bv->signal
             (zero-extend (signal-value btor26) (bitvector 3))
             btor26))
           (btor636 unnamed-input-636)
           (btor637
            (signal
             (bvand (signal-value btor636) (signal-value btor500))
             (list)))
           (btor638
            (signal
             (bvor (signal-value btor637) (signal-value btor522))
             (list)))
           (btor639
            (bv->signal
             (zero-extend (signal-value btor638) (bitvector 4))
             btor638))
           (btor640 unnamed-input-640)
           (btor641
            (signal
             (concat (signal-value btor513) (signal-value btor640))
             (list)))
           (btor642
            (bv->signal
             (zero-extend (signal-value btor641) (bitvector 4))
             btor641))
           (btor643
            (bv->signal
             (zero-extend (signal-value btor524) (bitvector 4))
             btor524))
           (btor644
            (bv->signal
             (zero-extend (signal-value btor506) (bitvector 4))
             btor506))
           (btor645 unnamed-input-645)
           (btor646
            (signal
             (bvand (signal-value btor645) (signal-value btor500))
             (list)))
           (btor647
            (signal
             (bvor (signal-value btor646) (signal-value btor526))
             (list)))
           (btor648
            (bv->signal
             (zero-extend (signal-value btor647) (bitvector 4))
             btor647))
           (btor649
            (bv->signal
             (zero-extend (signal-value btor148) (bitvector 1))
             btor148))
           (btor650
            (bv->signal
             (zero-extend (signal-value btor28) (bitvector 1))
             btor28))
           (btor651
            (bv->signal
             (zero-extend (signal-value btor28) (bitvector 1))
             btor28))
           (btor652
            (bv->signal
             (zero-extend (signal-value btor29) (bitvector 1))
             btor29))
           (btor653
            (bv->signal
             (zero-extend (signal-value btor29) (bitvector 1))
             btor29))
           (btor654
            (bv->signal
             (zero-extend (signal-value btor30) (bitvector 1))
             btor30))
           (btor655
            (bv->signal
             (zero-extend (signal-value btor30) (bitvector 1))
             btor30))
           (btor656
            (bv->signal
             (zero-extend (signal-value btor31) (bitvector 1))
             btor31))
           (btor657
            (bv->signal
             (zero-extend (signal-value btor31) (bitvector 1))
             btor31))
           (btor658
            (bv->signal
             (zero-extend (signal-value btor32) (bitvector 1))
             btor32))
           (btor659
            (bv->signal
             (zero-extend (signal-value btor32) (bitvector 1))
             btor32))
           (btor660
            (bv->signal
             (zero-extend (signal-value btor33) (bitvector 1))
             btor33))
           (btor661
            (bv->signal
             (zero-extend (signal-value btor33) (bitvector 1))
             btor33))
           (btor662
            (bv->signal
             (zero-extend (signal-value btor34) (bitvector 1))
             btor34))
           (btor663
            (bv->signal
             (zero-extend (signal-value btor34) (bitvector 1))
             btor34))
           (btor664
            (bv->signal
             (zero-extend (signal-value btor35) (bitvector 1))
             btor35))
           (btor665
            (bv->signal
             (zero-extend (signal-value btor35) (bitvector 1))
             btor35))
           (btor666
            (bv->signal
             (zero-extend (signal-value btor36) (bitvector 1))
             btor36))
           (btor667
            (bv->signal
             (zero-extend (signal-value btor36) (bitvector 1))
             btor36))
           (btor668
            (bv->signal
             (zero-extend (signal-value btor37) (bitvector 1))
             btor37))
           (btor669
            (bv->signal
             (zero-extend (signal-value btor37) (bitvector 1))
             btor37))
           (btor670
            (bv->signal
             (zero-extend (signal-value btor38) (bitvector 1))
             btor38))
           (btor671
            (bv->signal
             (zero-extend (signal-value btor38) (bitvector 1))
             btor38))
           (btor672
            (bv->signal
             (zero-extend (signal-value btor39) (bitvector 1))
             btor39))
           (btor673
            (bv->signal
             (zero-extend (signal-value btor39) (bitvector 1))
             btor39))
           (btor674
            (bv->signal
             (zero-extend (signal-value btor40) (bitvector 1))
             btor40))
           (btor675
            (bv->signal
             (zero-extend (signal-value btor40) (bitvector 1))
             btor40))
           (btor676
            (bv->signal
             (zero-extend (signal-value btor148) (bitvector 1))
             btor148))
           (btor677
            (bv->signal
             (zero-extend (signal-value btor41) (bitvector 1))
             btor41))
           (btor678
            (bv->signal
             (zero-extend (signal-value btor153) (bitvector 1))
             btor153))
           (btor679
            (bv->signal
             (zero-extend (signal-value btor392) (bitvector 48))
             btor392))
           (btor680
            (signal
             (extract 11 11 (signal-value btor394))
             (signal-state btor394)))
           (btor681
            (bv->signal
             (zero-extend (signal-value btor680) (bitvector 1))
             btor680))
           (btor682
            (signal
             (extract 23 23 (signal-value btor394))
             (signal-state btor394)))
           (btor683
            (bv->signal
             (zero-extend (signal-value btor682) (bitvector 1))
             btor682))
           (btor684
            (signal
             (extract 35 35 (signal-value btor394))
             (signal-state btor394)))
           (btor685
            (bv->signal
             (zero-extend (signal-value btor684) (bitvector 1))
             btor684))
           (btor686
            (bv->signal
             (zero-extend (signal-value btor394) (bitvector 48))
             btor394))
           (btor687
            (bv->signal
             (zero-extend (signal-value btor494) (bitvector 1))
             btor494))
           (btor688
            (bv->signal
             (zero-extend (signal-value btor44) (bitvector 25))
             btor44))
           (btor689
            (bv->signal
             (zero-extend (signal-value btor44) (bitvector 25))
             btor44))
           (btor690
            (bv->signal
             (zero-extend (signal-value btor47) (bitvector 5))
             btor47))
           (btor691
            (bv->signal
             (zero-extend (signal-value btor436) (bitvector 5))
             btor436))
           (btor692
            (bv->signal
             (zero-extend (signal-value btor165) (bitvector 43))
             btor165))
           (btor693
            (bv->signal
             (zero-extend (signal-value btor57) (bitvector 1))
             btor57))
           (btor694
            (bv->signal
             (zero-extend (signal-value btor57) (bitvector 1))
             btor57))
           (btor695
            (bv->signal
             (zero-extend (signal-value btor537) (bitvector 1))
             btor537))
           (btor696
            (bv->signal
             (zero-extend (signal-value btor536) (bitvector 1))
             btor536))
           (btor697
            (bv->signal
             (zero-extend (signal-value btor58) (bitvector 7))
             btor58))
           (btor698
            (bv->signal
             (zero-extend (signal-value btor209) (bitvector 7))
             btor209))
           (btor699
            (bv->signal
             (zero-extend (signal-value btor578) (bitvector 1))
             btor578))
           (btor700
            (bv->signal
             (zero-extend (signal-value btor556) (bitvector 1))
             btor556))
           (btor701
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 48))
             btor61))
           (btor702
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 48))
             btor61))
           (btor703
            (bv->signal
             (zero-extend (signal-value btor586) (bitvector 1))
             btor586))
           (btor704
            (bv->signal
             (zero-extend (signal-value btor587) (bitvector 1))
             btor587))
           (btor705
            (bv->signal
             (zero-extend (signal-value btor547) (bitvector 1))
             btor547))
           (btor706
            (bv->signal
             (zero-extend (signal-value btor543) (bitvector 1))
             btor543))
           (btor707
            (bv->signal
             (zero-extend (signal-value btor579) (bitvector 1))
             btor579))
           (btor708
            (bv->signal
             (zero-extend (signal-value btor580) (bitvector 1))
             btor580))
           (btor709
            (bv->signal
             (zero-extend (signal-value btor553) (bitvector 1))
             btor553))
           (btor710
            (bv->signal
             (zero-extend (signal-value btor594) (bitvector 1))
             btor594))
           (btor711
            (bv->signal
             (zero-extend (signal-value btor148) (bitvector 1))
             btor148))
           (btor712
            (bv->signal
             (zero-extend (signal-value btor102) (bitvector 30))
             btor102))
           (btor713
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 30))
             btor112))
           (btor714
            (bv->signal
             (zero-extend (signal-value btor90) (bitvector 30))
             btor90))
           (btor715
            (bv->signal
             (zero-extend (signal-value btor116) (bitvector 30))
             btor116))
           (btor716
            (bv->signal
             (zero-extend (signal-value btor390) (bitvector 4))
             btor390))
           (btor717
            (bv->signal
             (zero-extend (signal-value btor386) (bitvector 4))
             btor386))
           (btor718
            (bv->signal
             (zero-extend (signal-value btor132) (bitvector 18))
             btor132))
           (btor719
            (bv->signal
             (zero-extend (signal-value btor142) (bitvector 18))
             btor142))
           (btor720
            (bv->signal
             (zero-extend (signal-value btor122) (bitvector 18))
             btor122))
           (btor721
            (bv->signal
             (zero-extend (signal-value btor146) (bitvector 18))
             btor146))
           (btor722
            (bv->signal
             (zero-extend (signal-value btor316) (bitvector 48))
             btor316))
           (btor723
            (bv->signal
             (zero-extend (signal-value btor313) (bitvector 48))
             btor313))
           (btor724
            (bv->signal
             (zero-extend (signal-value btor478) (bitvector 1))
             btor478))
           (btor725
            (bv->signal
             (zero-extend (signal-value btor423) (bitvector 1))
             btor423))
           (btor726
            (bv->signal
             (zero-extend (signal-value btor457) (bitvector 1))
             btor457))
           (btor727
            (bv->signal
             (zero-extend (signal-value btor476) (bitvector 1))
             btor476))
           (btor728
            (bv->signal
             (zero-extend (signal-value btor419) (bitvector 1))
             btor419))
           (btor729
            (bv->signal
             (zero-extend (signal-value btor433) (bitvector 1))
             btor433))
           (btor730
            (bv->signal
             (zero-extend (signal-value btor184) (bitvector 3))
             btor184))
           (btor731
            (bv->signal
             (zero-extend (signal-value btor178) (bitvector 3))
             btor178))
           (btor732
            (bv->signal
             (zero-extend (signal-value btor444) (bitvector 5))
             btor444))
           (btor733
            (bv->signal
             (zero-extend (signal-value btor441) (bitvector 5))
             btor441))
           (btor734
            (bv->signal
             (zero-extend (signal-value btor188) (bitvector 43))
             btor188))
           (btor735
            (bv->signal
             (zero-extend (signal-value btor169) (bitvector 43))
             btor169))
           (btor736
            (bv->signal
             (zero-extend (signal-value btor532) (bitvector 1))
             btor532))
           (btor737
            (bv->signal
             (zero-extend (signal-value btor212) (bitvector 7))
             btor212))
           (btor738
            (bv->signal
             (zero-extend (signal-value btor208) (bitvector 7))
             btor208))
           (btor739
            (bv->signal
             (zero-extend (signal-value btor572) (bitvector 48))
             btor572))
           (btor740
            (bv->signal
             (zero-extend (signal-value btor561) (bitvector 48))
             btor561))
           (btor741
            (bv->signal
             (zero-extend (signal-value btor223) (bitvector 48))
             btor223))
           (btor742
            (bv->signal
             (zero-extend (signal-value btor318) (bitvector 48))
             btor318))
           (btor743
            (bv->signal
             (zero-extend (signal-value btor372) (bitvector 48))
             btor372))
           (btor744
            (bv->signal
             (zero-extend (signal-value btor63) (bitvector 1))
             btor63))
           (btor745
            (bv->signal
             (zero-extend (signal-value btor63) (bitvector 1))
             btor63))
           (btor746
            (bv->signal
             (zero-extend (signal-value btor64) (bitvector 1))
             btor64))
           (btor747
            (bv->signal
             (zero-extend (signal-value btor64) (bitvector 1))
             btor64))
           (btor748
            (bv->signal
             (zero-extend (signal-value btor65) (bitvector 1))
             btor65))
           (btor749
            (bv->signal
             (zero-extend (signal-value btor65) (bitvector 1))
             btor65))
           (btor750
            (bv->signal
             (zero-extend (signal-value btor66) (bitvector 1))
             btor66))
           (btor751
            (bv->signal
             (zero-extend (signal-value btor66) (bitvector 1))
             btor66))
           (btor752
            (bv->signal
             (zero-extend (signal-value btor67) (bitvector 1))
             btor67))
           (btor753
            (bv->signal
             (zero-extend (signal-value btor67) (bitvector 1))
             btor67))
           (btor754
            (bv->signal
             (zero-extend (signal-value btor68) (bitvector 1))
             btor68))
           (btor755
            (bv->signal
             (zero-extend (signal-value btor68) (bitvector 1))
             btor68))
           (btor756
            (bv->signal
             (zero-extend (signal-value btor69) (bitvector 1))
             btor69))
           (btor757
            (bv->signal
             (zero-extend (signal-value btor69) (bitvector 1))
             btor69))
           (btor758
            (bv->signal
             (zero-extend (signal-value btor70) (bitvector 1))
             btor70))
           (btor759
            (bv->signal
             (zero-extend (signal-value btor70) (bitvector 1))
             btor70))
           (btor760
            (bv->signal
             (zero-extend (signal-value btor71) (bitvector 1))
             btor71))
           (btor761
            (bv->signal
             (zero-extend (signal-value btor71) (bitvector 1))
             btor71))
           (btor762
            (bv->signal
             (zero-extend (signal-value btor72) (bitvector 1))
             btor72))
           (btor763
            (bv->signal
             (zero-extend (signal-value btor72) (bitvector 1))
             btor72))
           (btor764
            (bv->signal
             (zero-extend (signal-value btor400) (bitvector 48))
             btor400))
           (btor765
            (bv->signal
             (zero-extend (signal-value btor484) (bitvector 13))
             btor484))
           (btor766
            (bv->signal
             (zero-extend (signal-value btor487) (bitvector 13))
             btor487))
           (btor767
            (bv->signal
             (zero-extend (signal-value btor490) (bitvector 13))
             btor490))
           (btor768
            (bv->signal
             (zero-extend (signal-value btor493) (bitvector 13))
             btor493))
           (btor769
            (bv->signal
             (zero-extend (signal-value btor402) (bitvector 48))
             btor402))
           (btor770
            (signal
             (bool->bitvector
              (bveq (signal-value btor12) (signal-value btor607)))
             (list)))
           (btor771
            (signal
             (bvand (signal-value btor543) (signal-value btor548))
             (list)))
           (btor772
            (signal
             (bvand (signal-value btor770) (signal-value btor771))
             (list)))
           (btor773
            (bv->signal
             (zero-extend (signal-value btor772) (bitvector 1))
             btor772))
           (btor774
            (bv->signal
             (zero-extend (signal-value btor55) (bitvector 48))
             btor55))
           (btor775
            (bv->signal
             (zero-extend (signal-value btor316) (bitvector 48))
             btor316))
           (btor776
            (bv->signal
             (zero-extend (signal-value btor597) (bitvector 1))
             btor597))
           (btor777
            (bv->signal
             (zero-extend (signal-value btor306) (bitvector 48))
             btor306))
           (btor779
            (if (bitvector->bool (signal-value btor93)) btor99 btor112))
           (btor780
            (if (bitvector->bool (signal-value btor29)) btor779 btor90))
           (btor781
            (if (bitvector->bool (signal-value btor63)) btor79 btor780))
           (btor785
            (if (bitvector->bool (signal-value btor28)) btor99 btor112))
           (btor786
            (if (bitvector->bool (signal-value btor63)) btor79 btor785))
           (btor789
            (if (bitvector->bool (signal-value btor124)) btor129 btor142))
           (btor790
            (if (bitvector->bool (signal-value btor33)) btor789 btor122))
           (btor791
            (if (bitvector->bool (signal-value btor66)) btor118 btor790))
           (btor794
            (if (bitvector->bool (signal-value btor32)) btor129 btor142))
           (btor795
            (if (bitvector->bool (signal-value btor66)) btor118 btor794))
           (btor798
            (if (bitvector->bool (signal-value btor40)) btor494 btor159))
           (btor799
            (signal
             (bvor (signal-value btor72) (signal-value btor772))
             (list)))
           (btor800
            (if (bitvector->bool (signal-value btor799)) btor148 btor798))
           (btor804
            (if (bitvector->bool (signal-value btor39)) btor165 btor169))
           (btor805
            (if (bitvector->bool (signal-value btor71)) btor165 btor804))
           (btor808
            (if (bitvector->bool (signal-value btor36)) btor26 btor178))
           (btor809
            (if (bitvector->bool (signal-value btor68)) btor174 btor808))
           (btor812
            (if (bitvector->bool (signal-value btor36)) btor209 btor208))
           (btor813
            (if (bitvector->bool (signal-value btor68)) btor205 btor812))
           (btor816
            (if (bitvector->bool (signal-value btor34)) btor21 btor313))
           (btor817
            (if (bitvector->bool (signal-value btor67)) btor203 btor816))
           (btor820
            (if (bitvector->bool (signal-value btor31)) btor387 btor386))
           (btor821
            (if (bitvector->bool (signal-value btor65)) btor383 btor820))
           (btor824
            (if (bitvector->bool (signal-value btor35)) btor420 btor419))
           (btor825
            (if (bitvector->bool (signal-value btor64)) btor148 btor824))
           (btor828
            (if (bitvector->bool (signal-value btor39)) btor454 btor433))
           (btor829
            (if (bitvector->bool (signal-value btor64)) btor148 btor828))
           (btor832
            (if (bitvector->bool (signal-value btor38)) btor436 btor441))
           (btor833
            (if (bitvector->bool (signal-value btor70)) btor438 btor832))
           (btor836 unnamed-input-836)
           (btor837
            (signal
             (bvand (signal-value btor836) (signal-value btor500))
             (list)))
           (btor838
            (signal
             (bvor (signal-value btor837) (signal-value btor522))
             (list)))
           (btor839
            (if (bitvector->bool (signal-value btor40)) btor838 btor506))
           (btor840
            (if (bitvector->bool (signal-value btor799)) btor383 btor839))
           (btor843
            (if (bitvector->bool (signal-value btor40)) btor536 btor532))
           (btor844
            (if (bitvector->bool (signal-value btor799)) btor148 btor843))
           (btor847
            (if (bitvector->bool (signal-value btor40)) btor547 btor543))
           (btor848
            (if (bitvector->bool (signal-value btor799)) btor148 btor847))
           (btor851
            (if (bitvector->bool (signal-value btor40)) btor586 btor547))
           (btor852
            (if (bitvector->bool (signal-value btor799)) btor148 btor851))
           (btor855
            (if (bitvector->bool (signal-value btor40)) btor579 btor553))
           (btor856
            (if (bitvector->bool (signal-value btor799)) btor148 btor855))
           (btor859
            (if (bitvector->bool (signal-value btor40)) btor571 btor561))
           (btor860
            (if (bitvector->bool (signal-value btor799)) btor203 btor859))
           (btor863
            (if (bitvector->bool (signal-value btor40)) btor553 btor594))
           (btor864
            (if (bitvector->bool (signal-value btor799)) btor148 btor863))
           (output-state
            (remove-duplicates
             (append
              (append
               (list
                (cons
                 (string->symbol (string-append name "state592"))
                 (cons
                  (signal-value btor864)
                  (if (assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state592")))
                    (add1
                     (cdr
                      (assoc-ref
                       merged-input-state-hash
                       (string->symbol (string-append name "state592")))))
                    0))))
               (append
                (list
                 (cons
                  (string->symbol (string-append name "state591"))
                  (cons
                   (signal-value btor594)
                   (if (assoc-has-key?
                        merged-input-state-hash
                        (string->symbol (string-append name "state591")))
                     (add1
                      (cdr
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state591")))))
                     0))))
                (append
                 (list
                  (cons
                   (string->symbol (string-append name "state559"))
                   (cons
                    (signal-value btor860)
                    (if (assoc-has-key?
                         merged-input-state-hash
                         (string->symbol (string-append name "state559")))
                      (add1
                       (cdr
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state559")))))
                      0))))
                 (append
                  (list
                   (cons
                    (string->symbol (string-append name "state558"))
                    (cons
                     (signal-value btor561)
                     (if (assoc-has-key?
                          merged-input-state-hash
                          (string->symbol (string-append name "state558")))
                       (add1
                        (cdr
                         (assoc-ref
                          merged-input-state-hash
                          (string->symbol (string-append name "state558")))))
                       0))))
                  (append
                   (list
                    (cons
                     (string->symbol (string-append name "state551"))
                     (cons
                      (signal-value btor856)
                      (if (assoc-has-key?
                           merged-input-state-hash
                           (string->symbol (string-append name "state551")))
                        (add1
                         (cdr
                          (assoc-ref
                           merged-input-state-hash
                           (string->symbol (string-append name "state551")))))
                        0))))
                   (append
                    (list
                     (cons
                      (string->symbol (string-append name "state550"))
                      (cons
                       (signal-value btor553)
                       (if (assoc-has-key?
                            merged-input-state-hash
                            (string->symbol (string-append name "state550")))
                         (add1
                          (cdr
                           (assoc-ref
                            merged-input-state-hash
                            (string->symbol (string-append name "state550")))))
                         0))))
                    (append
                     (list
                      (cons
                       (string->symbol (string-append name "state545"))
                       (cons
                        (signal-value btor852)
                        (if (assoc-has-key?
                             merged-input-state-hash
                             (string->symbol (string-append name "state545")))
                          (add1
                           (cdr
                            (assoc-ref
                             merged-input-state-hash
                             (string->symbol
                              (string-append name "state545")))))
                          0))))
                     (append
                      (list
                       (cons
                        (string->symbol (string-append name "state544"))
                        (cons
                         (signal-value btor547)
                         (if (assoc-has-key?
                              merged-input-state-hash
                              (string->symbol (string-append name "state544")))
                           (add1
                            (cdr
                             (assoc-ref
                              merged-input-state-hash
                              (string->symbol
                               (string-append name "state544")))))
                           0))))
                      (append
                       (list
                        (cons
                         (string->symbol (string-append name "state541"))
                         (cons
                          (signal-value btor848)
                          (if (assoc-has-key?
                               merged-input-state-hash
                               (string->symbol
                                (string-append name "state541")))
                            (add1
                             (cdr
                              (assoc-ref
                               merged-input-state-hash
                               (string->symbol
                                (string-append name "state541")))))
                            0))))
                       (append
                        (list
                         (cons
                          (string->symbol (string-append name "state540"))
                          (cons
                           (signal-value btor543)
                           (if (assoc-has-key?
                                merged-input-state-hash
                                (string->symbol
                                 (string-append name "state540")))
                             (add1
                              (cdr
                               (assoc-ref
                                merged-input-state-hash
                                (string->symbol
                                 (string-append name "state540")))))
                             0))))
                        (append
                         (list
                          (cons
                           (string->symbol (string-append name "state530"))
                           (cons
                            (signal-value btor844)
                            (if (assoc-has-key?
                                 merged-input-state-hash
                                 (string->symbol
                                  (string-append name "state530")))
                              (add1
                               (cdr
                                (assoc-ref
                                 merged-input-state-hash
                                 (string->symbol
                                  (string-append name "state530")))))
                              0))))
                         (append
                          (list
                           (cons
                            (string->symbol (string-append name "state529"))
                            (cons
                             (signal-value btor532)
                             (if (assoc-has-key?
                                  merged-input-state-hash
                                  (string->symbol
                                   (string-append name "state529")))
                               (add1
                                (cdr
                                 (assoc-ref
                                  merged-input-state-hash
                                  (string->symbol
                                   (string-append name "state529")))))
                               0))))
                          (append
                           (list
                            (cons
                             (string->symbol (string-append name "state504"))
                             (cons
                              (signal-value btor840)
                              (if (assoc-has-key?
                                   merged-input-state-hash
                                   (string->symbol
                                    (string-append name "state504")))
                                (add1
                                 (cdr
                                  (assoc-ref
                                   merged-input-state-hash
                                   (string->symbol
                                    (string-append name "state504")))))
                                0))))
                           (append
                            (list
                             (cons
                              (string->symbol (string-append name "state502"))
                              (cons
                               (signal-value btor506)
                               (if (assoc-has-key?
                                    merged-input-state-hash
                                    (string->symbol
                                     (string-append name "state502")))
                                 (add1
                                  (cdr
                                   (assoc-ref
                                    merged-input-state-hash
                                    (string->symbol
                                     (string-append name "state502")))))
                                 0))))
                            (append
                             (list
                              (cons
                               (string->symbol (string-append name "state439"))
                               (cons
                                (signal-value btor833)
                                (if (assoc-has-key?
                                     merged-input-state-hash
                                     (string->symbol
                                      (string-append name "state439")))
                                  (add1
                                   (cdr
                                    (assoc-ref
                                     merged-input-state-hash
                                     (string->symbol
                                      (string-append name "state439")))))
                                  0))))
                             (append
                              (list
                               (cons
                                (string->symbol
                                 (string-append name "state437"))
                                (cons
                                 (signal-value btor441)
                                 (if (assoc-has-key?
                                      merged-input-state-hash
                                      (string->symbol
                                       (string-append name "state437")))
                                   (add1
                                    (cdr
                                     (assoc-ref
                                      merged-input-state-hash
                                      (string->symbol
                                       (string-append name "state437")))))
                                   0))))
                              (append
                               (list
                                (cons
                                 (string->symbol
                                  (string-append name "state431"))
                                 (cons
                                  (signal-value btor829)
                                  (if (assoc-has-key?
                                       merged-input-state-hash
                                       (string->symbol
                                        (string-append name "state431")))
                                    (add1
                                     (cdr
                                      (assoc-ref
                                       merged-input-state-hash
                                       (string->symbol
                                        (string-append name "state431")))))
                                    0))))
                               (append
                                (list
                                 (cons
                                  (string->symbol
                                   (string-append name "state430"))
                                  (cons
                                   (signal-value btor433)
                                   (if (assoc-has-key?
                                        merged-input-state-hash
                                        (string->symbol
                                         (string-append name "state430")))
                                     (add1
                                      (cdr
                                       (assoc-ref
                                        merged-input-state-hash
                                        (string->symbol
                                         (string-append name "state430")))))
                                     0))))
                                (append
                                 (list
                                  (cons
                                   (string->symbol
                                    (string-append name "state417"))
                                   (cons
                                    (signal-value btor825)
                                    (if (assoc-has-key?
                                         merged-input-state-hash
                                         (string->symbol
                                          (string-append name "state417")))
                                      (add1
                                       (cdr
                                        (assoc-ref
                                         merged-input-state-hash
                                         (string->symbol
                                          (string-append name "state417")))))
                                      0))))
                                 (append
                                  (list
                                   (cons
                                    (string->symbol
                                     (string-append name "state416"))
                                    (cons
                                     (signal-value btor419)
                                     (if (assoc-has-key?
                                          merged-input-state-hash
                                          (string->symbol
                                           (string-append name "state416")))
                                       (add1
                                        (cdr
                                         (assoc-ref
                                          merged-input-state-hash
                                          (string->symbol
                                           (string-append name "state416")))))
                                       0))))
                                  (append
                                   (list
                                    (cons
                                     (string->symbol
                                      (string-append name "state384"))
                                     (cons
                                      (signal-value btor821)
                                      (if (assoc-has-key?
                                           merged-input-state-hash
                                           (string->symbol
                                            (string-append name "state384")))
                                        (add1
                                         (cdr
                                          (assoc-ref
                                           merged-input-state-hash
                                           (string->symbol
                                            (string-append name "state384")))))
                                        0))))
                                   (append
                                    (list
                                     (cons
                                      (string->symbol
                                       (string-append name "state382"))
                                      (cons
                                       (signal-value btor386)
                                       (if (assoc-has-key?
                                            merged-input-state-hash
                                            (string->symbol
                                             (string-append name "state382")))
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
                                        (string-append name "state311"))
                                       (cons
                                        (signal-value btor817)
                                        (if (assoc-has-key?
                                             merged-input-state-hash
                                             (string->symbol
                                              (string-append name "state311")))
                                          (add1
                                           (cdr
                                            (assoc-ref
                                             merged-input-state-hash
                                             (string->symbol
                                              (string-append
                                               name
                                               "state311")))))
                                          0))))
                                     (append
                                      (list
                                       (cons
                                        (string->symbol
                                         (string-append name "state310"))
                                        (cons
                                         (signal-value btor313)
                                         (if (assoc-has-key?
                                              merged-input-state-hash
                                              (string->symbol
                                               (string-append
                                                name
                                                "state310")))
                                           (add1
                                            (cdr
                                             (assoc-ref
                                              merged-input-state-hash
                                              (string->symbol
                                               (string-append
                                                name
                                                "state310")))))
                                           0))))
                                      (append
                                       (list
                                        (cons
                                         (string->symbol
                                          (string-append name "state206"))
                                         (cons
                                          (signal-value btor813)
                                          (if (assoc-has-key?
                                               merged-input-state-hash
                                               (string->symbol
                                                (string-append
                                                 name
                                                 "state206")))
                                            (add1
                                             (cdr
                                              (assoc-ref
                                               merged-input-state-hash
                                               (string->symbol
                                                (string-append
                                                 name
                                                 "state206")))))
                                            0))))
                                       (append
                                        (list
                                         (cons
                                          (string->symbol
                                           (string-append name "state204"))
                                          (cons
                                           (signal-value btor208)
                                           (if (assoc-has-key?
                                                merged-input-state-hash
                                                (string->symbol
                                                 (string-append
                                                  name
                                                  "state204")))
                                             (add1
                                              (cdr
                                               (assoc-ref
                                                merged-input-state-hash
                                                (string->symbol
                                                 (string-append
                                                  name
                                                  "state204")))))
                                             0))))
                                        (append
                                         (list
                                          (cons
                                           (string->symbol
                                            (string-append name "state176"))
                                           (cons
                                            (signal-value btor809)
                                            (if (assoc-has-key?
                                                 merged-input-state-hash
                                                 (string->symbol
                                                  (string-append
                                                   name
                                                   "state176")))
                                              (add1
                                               (cdr
                                                (assoc-ref
                                                 merged-input-state-hash
                                                 (string->symbol
                                                  (string-append
                                                   name
                                                   "state176")))))
                                              0))))
                                         (append
                                          (list
                                           (cons
                                            (string->symbol
                                             (string-append name "state175"))
                                            (cons
                                             (signal-value btor178)
                                             (if (assoc-has-key?
                                                  merged-input-state-hash
                                                  (string->symbol
                                                   (string-append
                                                    name
                                                    "state175")))
                                               (add1
                                                (cdr
                                                 (assoc-ref
                                                  merged-input-state-hash
                                                  (string->symbol
                                                   (string-append
                                                    name
                                                    "state175")))))
                                               0))))
                                          (append
                                           (list
                                            (cons
                                             (string->symbol
                                              (string-append name "state167"))
                                             (cons
                                              (signal-value btor805)
                                              (if (assoc-has-key?
                                                   merged-input-state-hash
                                                   (string->symbol
                                                    (string-append
                                                     name
                                                     "state167")))
                                                (add1
                                                 (cdr
                                                  (assoc-ref
                                                   merged-input-state-hash
                                                   (string->symbol
                                                    (string-append
                                                     name
                                                     "state167")))))
                                                0))))
                                           (append
                                            (list
                                             (cons
                                              (string->symbol
                                               (string-append name "state166"))
                                              (cons
                                               (signal-value btor169)
                                               (if (assoc-has-key?
                                                    merged-input-state-hash
                                                    (string->symbol
                                                     (string-append
                                                      name
                                                      "state166")))
                                                 (add1
                                                  (cdr
                                                   (assoc-ref
                                                    merged-input-state-hash
                                                    (string->symbol
                                                     (string-append
                                                      name
                                                      "state166")))))
                                                 0))))
                                            (append
                                             (list
                                              (cons
                                               (string->symbol
                                                (string-append
                                                 name
                                                 "state154"))
                                               (cons
                                                (signal-value btor153)
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
                                                  "state151"))
                                                (cons
                                                 (signal-value btor800)
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
                                                  (signal-value btor159)
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
                                                   (signal-value btor795)
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
                                                      "state120"))
                                                    (cons
                                                     (signal-value btor791)
                                                     (if (assoc-has-key?
                                                          merged-input-state-hash
                                                          (string->symbol
                                                           (string-append
                                                            name
                                                            "state120")))
                                                       (add1
                                                        (cdr
                                                         (assoc-ref
                                                          merged-input-state-hash
                                                          (string->symbol
                                                           (string-append
                                                            name
                                                            "state120")))))
                                                       0))))
                                                  (append
                                                   (list
                                                    (cons
                                                     (string->symbol
                                                      (string-append
                                                       name
                                                       "state119"))
                                                     (cons
                                                      (signal-value btor122)
                                                      (if (assoc-has-key?
                                                           merged-input-state-hash
                                                           (string->symbol
                                                            (string-append
                                                             name
                                                             "state119")))
                                                        (add1
                                                         (cdr
                                                          (assoc-ref
                                                           merged-input-state-hash
                                                           (string->symbol
                                                            (string-append
                                                             name
                                                             "state119")))))
                                                        0))))
                                                   (append
                                                    (list
                                                     (cons
                                                      (string->symbol
                                                       (string-append
                                                        name
                                                        "state110"))
                                                      (cons
                                                       (signal-value btor786)
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
                                                         "state109"))
                                                       (cons
                                                        (signal-value btor112)
                                                        (if (assoc-has-key?
                                                             merged-input-state-hash
                                                             (string->symbol
                                                              (string-append
                                                               name
                                                               "state109")))
                                                          (add1
                                                           (cdr
                                                            (assoc-ref
                                                             merged-input-state-hash
                                                             (string->symbol
                                                              (string-append
                                                               name
                                                               "state109")))))
                                                          0))))
                                                     (append
                                                      (list
                                                       (cons
                                                        (string->symbol
                                                         (string-append
                                                          name
                                                          "state84"))
                                                        (cons
                                                         (signal-value btor41)
                                                         (if (assoc-has-key?
                                                              merged-input-state-hash
                                                              (string->symbol
                                                               (string-append
                                                                name
                                                                "state84")))
                                                           (add1
                                                            (cdr
                                                             (assoc-ref
                                                              merged-input-state-hash
                                                              (string->symbol
                                                               (string-append
                                                                name
                                                                "state84")))))
                                                           0))))
                                                      (append
                                                       (list
                                                        (cons
                                                         (string->symbol
                                                          (string-append
                                                           name
                                                           "state81"))
                                                         (cons
                                                          (signal-value
                                                           btor781)
                                                          (if (assoc-has-key?
                                                               merged-input-state-hash
                                                               (string->symbol
                                                                (string-append
                                                                 name
                                                                 "state81")))
                                                            (add1
                                                             (cdr
                                                              (assoc-ref
                                                               merged-input-state-hash
                                                               (string->symbol
                                                                (string-append
                                                                 name
                                                                 "state81")))))
                                                            0))))
                                                       (append
                                                        (list
                                                         (cons
                                                          (string->symbol
                                                           (string-append
                                                            name
                                                            "state80"))
                                                          (cons
                                                           (signal-value
                                                            btor90)
                                                           (if (assoc-has-key?
                                                                merged-input-state-hash
                                                                (string->symbol
                                                                 (string-append
                                                                  name
                                                                  "state80")))
                                                             (add1
                                                              (cdr
                                                               (assoc-ref
                                                                merged-input-state-hash
                                                                (string->symbol
                                                                 (string-append
                                                                  name
                                                                  "state80")))))
                                                             0))))
                                                        (list)))))))))))))))))))))))))))))))))))))))))))
              merged-input-state-hash)
             equal?
             #:key
             car)))
      (list
       (cons 'PCOUT (signal (signal-value btor572) output-state))
       (cons 'PATTERNBDETECT (signal (signal-value btor580) output-state))
       (cons 'CARRYCASCOUT (signal (signal-value btor497) output-state))
       (cons 'P (signal (signal-value btor572) output-state))
       (cons 'CARRYOUT (signal (signal-value btor527) output-state))
       (cons 'UNDERFLOW (signal (signal-value btor597) output-state))
       (cons 'BCOUT (signal (signal-value btor146) output-state))
       (cons 'MULTSIGNOUT (signal (signal-value btor537) output-state))
       (cons 'OVERFLOW (signal (signal-value btor556) output-state))
       (cons 'ACOUT (signal (signal-value btor116) output-state))
       (cons 'PATTERNDETECT (signal (signal-value btor587) output-state))))))

