#lang racket/base
(provide xilinx-ultrascale-plus-dsp48e2)
(require "../signal.rkt")
(require rosette)
(define xilinx-ultrascale-plus-dsp48e2
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
      #:AMULTSEL
      (AMULTSEL (bv->signal (constant 'AMULTSEL (bitvector 5))))
      #:AREG
      (AREG (bv->signal (constant 'AREG (bitvector 32))))
      #:AUTORESET_PATDET
      (AUTORESET_PATDET
       (bv->signal (constant 'AUTORESET_PATDET (bitvector 5))))
      #:AUTORESET_PRIORITY
      (AUTORESET_PRIORITY
       (bv->signal (constant 'AUTORESET_PRIORITY (bitvector 5))))
      #:A_INPUT
      (A_INPUT (bv->signal (constant 'A_INPUT (bitvector 5))))
      #:B
      (B (bv->signal (constant 'B (bitvector 18))))
      #:BCASCREG
      (BCASCREG (bv->signal (constant 'BCASCREG (bitvector 32))))
      #:BCIN
      (BCIN (bv->signal (constant 'BCIN (bitvector 18))))
      #:BMULTSEL
      (BMULTSEL (bv->signal (constant 'BMULTSEL (bitvector 5))))
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
      (D (bv->signal (constant 'D (bitvector 27))))
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
       (bv->signal (constant 'IS_OPMODE_INVERTED (bitvector 9))))
      #:IS_RSTALLCARRYIN_INVERTED
      (IS_RSTALLCARRYIN_INVERTED
       (bv->signal (constant 'IS_RSTALLCARRYIN_INVERTED (bitvector 1))))
      #:IS_RSTALUMODE_INVERTED
      (IS_RSTALUMODE_INVERTED
       (bv->signal (constant 'IS_RSTALUMODE_INVERTED (bitvector 1))))
      #:IS_RSTA_INVERTED
      (IS_RSTA_INVERTED
       (bv->signal (constant 'IS_RSTA_INVERTED (bitvector 1))))
      #:IS_RSTB_INVERTED
      (IS_RSTB_INVERTED
       (bv->signal (constant 'IS_RSTB_INVERTED (bitvector 1))))
      #:IS_RSTCTRL_INVERTED
      (IS_RSTCTRL_INVERTED
       (bv->signal (constant 'IS_RSTCTRL_INVERTED (bitvector 1))))
      #:IS_RSTC_INVERTED
      (IS_RSTC_INVERTED
       (bv->signal (constant 'IS_RSTC_INVERTED (bitvector 1))))
      #:IS_RSTD_INVERTED
      (IS_RSTD_INVERTED
       (bv->signal (constant 'IS_RSTD_INVERTED (bitvector 1))))
      #:IS_RSTINMODE_INVERTED
      (IS_RSTINMODE_INVERTED
       (bv->signal (constant 'IS_RSTINMODE_INVERTED (bitvector 1))))
      #:IS_RSTM_INVERTED
      (IS_RSTM_INVERTED
       (bv->signal (constant 'IS_RSTM_INVERTED (bitvector 1))))
      #:IS_RSTP_INVERTED
      (IS_RSTP_INVERTED
       (bv->signal (constant 'IS_RSTP_INVERTED (bitvector 1))))
      #:MASK
      (MASK (bv->signal (constant 'MASK (bitvector 48))))
      #:MREG
      (MREG (bv->signal (constant 'MREG (bitvector 32))))
      #:MULTSIGNIN
      (MULTSIGNIN (bv->signal (constant 'MULTSIGNIN (bitvector 1))))
      #:OPMODE
      (OPMODE (bv->signal (constant 'OPMODE (bitvector 9))))
      #:OPMODEREG
      (OPMODEREG (bv->signal (constant 'OPMODEREG (bitvector 32))))
      #:PATTERN
      (PATTERN (bv->signal (constant 'PATTERN (bitvector 48))))
      #:PCIN
      (PCIN (bv->signal (constant 'PCIN (bitvector 48))))
      #:PREADDINSEL
      (PREADDINSEL (bv->signal (constant 'PREADDINSEL (bitvector 5))))
      #:PREG
      (PREG (bv->signal (constant 'PREG (bitvector 32))))
      #:RND
      (RND (bv->signal (constant 'RND (bitvector 48))))
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
      #:USE_MULT
      (USE_MULT (bv->signal (constant 'USE_MULT (bitvector 5))))
      #:USE_PATTERN_DETECT
      (USE_PATTERN_DETECT
       (bv->signal (constant 'USE_PATTERN_DETECT (bitvector 5))))
      #:USE_SIMD
      (USE_SIMD (bv->signal (constant 'USE_SIMD (bitvector 5))))
      #:USE_WIDEXOR
      (USE_WIDEXOR (bv->signal (constant 'USE_WIDEXOR (bitvector 5))))
      #:XORSIMD
      (XORSIMD (bv->signal (constant 'XORSIMD (bitvector 5))))
      #:name
      (name ""))
    (let* ((merged-input-state-hash (list))
           (init-hash
            (append
             (list
              (cons
               (string->symbol (string-append name "state1237"))
               (bv 0 (bitvector 8))))
             (append
              (list
               (cons
                (string->symbol (string-append name "state1169"))
                (bv 0 (bitvector 1))))
              (append
               (list
                (cons
                 (string->symbol (string-append name "state1156"))
                 (bv 0 (bitvector 1))))
               (append
                (list
                 (cons
                  (string->symbol (string-append name "state1149"))
                  (bv 0 (bitvector 1))))
                (append
                 (list
                  (cons
                   (string->symbol (string-append name "state1141"))
                   (bv 0 (bitvector 1))))
                 (append
                  (list
                   (cons
                    (string->symbol (string-append name "state987"))
                    (bv 0 (bitvector 1))))
                  (append
                   (list
                    (cons
                     (string->symbol (string-append name "state912"))
                     (bv 0 (bitvector 1))))
                   (append
                    (list
                     (cons
                      (string->symbol (string-append name "state898"))
                      (bv 0 (bitvector 4))))
                    (append
                     (list
                      (cons
                       (string->symbol (string-append name "state894"))
                       (bv 0 (bitvector 1))))
                     (append
                      (list
                       (cons
                        (string->symbol (string-append name "state876"))
                        (bv 0 (bitvector 3))))
                      (append
                       (list
                        (cons
                         (string->symbol (string-append name "state868"))
                         (bv 0 (bitvector 1))))
                       (append
                        (list
                         (cons
                          (string->symbol (string-append name "state781"))
                          (bv 0 (bitvector 45))))
                        (append
                         (list
                          (cons
                           (string->symbol (string-append name "state687"))
                           (bv 0 (bitvector 45))))
                         (append
                          (list
                           (cons
                            (string->symbol (string-append name "state519"))
                            (bv 0 (bitvector 27))))
                          (append
                           (list
                            (cons
                             (string->symbol (string-append name "state454"))
                             (bv 0 (bitvector 27))))
                           (append
                            (list
                             (cons
                              (string->symbol (string-append name "state433"))
                              (bv 0 (bitvector 5))))
                            (append
                             (list
                              (cons
                               (string->symbol (string-append name "state334"))
                               (bv 0 (bitvector 48))))
                             (append
                              (list
                               (cons
                                (string->symbol
                                 (string-append name "state324"))
                                (bv 0 (bitvector 48))))
                              (append
                               (list
                                (cons
                                 (string->symbol
                                  (string-append name "state314"))
                                 (bv 0 (bitvector 9))))
                               (append
                                (list
                                 (cons
                                  (string->symbol
                                   (string-append name "state155"))
                                  (bv 0 (bitvector 4))))
                                (append
                                 (list
                                  (cons
                                   (string->symbol
                                    (string-append name "state142"))
                                   (bv 0 (bitvector 18))))
                                 (append
                                  (list
                                   (cons
                                    (string->symbol
                                     (string-append name "state131"))
                                    (bv 0 (bitvector 18))))
                                  (append
                                   (list
                                    (cons
                                     (string->symbol
                                      (string-append name "state119"))
                                     (bv 0 (bitvector 30))))
                                   (append
                                    (list
                                     (cons
                                      (string->symbol
                                       (string-append name "state101"))
                                      (bv 1 (bitvector 1))))
                                    (append
                                     (list
                                      (cons
                                       (string->symbol
                                        (string-append name "state97"))
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
           (btor10 (bitvector 5))
           (btor11 AMULTSEL)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state AMULTSEL)))
           (btor12 AREG)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state AREG)))
           (btor13 AUTORESET_PATDET)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state AUTORESET_PATDET)))
           (btor14 AUTORESET_PRIORITY)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state AUTORESET_PRIORITY)))
           (btor15 A_INPUT)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state A_INPUT)))
           (btor16 (bitvector 18))
           (btor17 B)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state B)))
           (btor18 BCASCREG)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state BCASCREG)))
           (btor19 BCIN)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state BCIN)))
           (btor20 BMULTSEL)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state BMULTSEL)))
           (btor21 BREG)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state BREG)))
           (btor22 B_INPUT)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state B_INPUT)))
           (btor23 (bitvector 48))
           (btor24 C)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state C)))
           (btor25 (bitvector 1))
           (btor26 CARRYCASCIN)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CARRYCASCIN)))
           (btor27 CARRYIN)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CARRYIN)))
           (btor28 CARRYINREG)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CARRYINREG)))
           (btor29 (bitvector 3))
           (btor30 CARRYINSEL)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CARRYINSEL)))
           (btor31 CARRYINSELREG)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state CARRYINSELREG)))
           (btor32 CEA1)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CEA1)))
           (btor33 CEA2)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CEA2)))
           (btor34 CEAD)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CEAD)))
           (btor35 CEALUMODE)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CEALUMODE)))
           (btor36 CEB1)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CEB1)))
           (btor37 CEB2)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CEB2)))
           (btor38 CEC)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CEC)))
           (btor39 CECARRYIN)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CECARRYIN)))
           (btor40 CECTRL)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CECTRL)))
           (btor41 CED)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CED)))
           (btor42 CEINMODE)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CEINMODE)))
           (btor43 CEM)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CEM)))
           (btor44 CEP)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CEP)))
           (btor45 CLK)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CLK)))
           (btor46 CREG)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CREG)))
           (btor47 (bitvector 27))
           (btor48 D)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state D)))
           (btor49 DREG)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state DREG)))
           (btor50 INMODE)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state INMODE)))
           (btor51 INMODEREG)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state INMODEREG)))
           (btor52 IS_ALUMODE_INVERTED)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state IS_ALUMODE_INVERTED)))
           (btor53 IS_CARRYIN_INVERTED)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state IS_CARRYIN_INVERTED)))
           (btor54 IS_CLK_INVERTED)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state IS_CLK_INVERTED)))
           (btor55 IS_INMODE_INVERTED)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state IS_INMODE_INVERTED)))
           (btor56 (bitvector 9))
           (btor57 IS_OPMODE_INVERTED)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state IS_OPMODE_INVERTED)))
           (btor58 IS_RSTALLCARRYIN_INVERTED)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state IS_RSTALLCARRYIN_INVERTED)))
           (btor59 IS_RSTALUMODE_INVERTED)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state IS_RSTALUMODE_INVERTED)))
           (btor60 IS_RSTA_INVERTED)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state IS_RSTA_INVERTED)))
           (btor61 IS_RSTB_INVERTED)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state IS_RSTB_INVERTED)))
           (btor62 IS_RSTCTRL_INVERTED)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state IS_RSTCTRL_INVERTED)))
           (btor63 IS_RSTC_INVERTED)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state IS_RSTC_INVERTED)))
           (btor64 IS_RSTD_INVERTED)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state IS_RSTD_INVERTED)))
           (btor65 IS_RSTINMODE_INVERTED)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state IS_RSTINMODE_INVERTED)))
           (btor66 IS_RSTM_INVERTED)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state IS_RSTM_INVERTED)))
           (btor67 IS_RSTP_INVERTED)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state IS_RSTP_INVERTED)))
           (btor68 MASK)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MASK)))
           (btor69 MREG)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MREG)))
           (btor70 MULTSIGNIN)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MULTSIGNIN)))
           (btor71 OPMODE)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state OPMODE)))
           (btor72 OPMODEREG)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state OPMODEREG)))
           (btor73 PATTERN)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state PATTERN)))
           (btor74 PCIN)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state PCIN)))
           (btor75 PREADDINSEL)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state PREADDINSEL)))
           (btor76 PREG)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state PREG)))
           (btor77 RND)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state RND)))
           (btor78 RSTA)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state RSTA)))
           (btor79 RSTALLCARRYIN)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state RSTALLCARRYIN)))
           (btor80 RSTALUMODE)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state RSTALUMODE)))
           (btor81 RSTB)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state RSTB)))
           (btor82 RSTC)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state RSTC)))
           (btor83 RSTCTRL)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state RSTCTRL)))
           (btor84 RSTD)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state RSTD)))
           (btor85 RSTINMODE)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state RSTINMODE)))
           (btor86 RSTM)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state RSTM)))
           (btor87 RSTP)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state RSTP)))
           (btor88 SEL_MASK)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SEL_MASK)))
           (btor89 SEL_PATTERN)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SEL_PATTERN)))
           (btor90 USE_MULT)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state USE_MULT)))
           (btor91 USE_PATTERN_DETECT)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state USE_PATTERN_DETECT)))
           (btor92 USE_SIMD)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state USE_SIMD)))
           (btor93 USE_WIDEXOR)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state USE_WIDEXOR)))
           (btor94 XORSIMD)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state XORSIMD)))
           (btor95
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state95")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state95"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state95")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state95")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 30))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor96 (bv->signal (bv 0 (bitvector 30))))
           (btor97
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state97")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state97"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state97")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state97")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 30))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor99
            (signal
             (bvxor (signal-value btor45) (signal-value btor54))
             (list)))
           (btor100 (bv->signal (bv 1 (bitvector 1))))
           (btor101
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state101")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state101"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state101")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state101")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor103 (bitvector 2))
           (btor104
            (signal
             (concat (signal-value btor101) (signal-value btor99))
             (list)))
           (btor105
            (bv->signal
             (zero-extend (signal-value btor100) (bitvector 2))
             btor100))
           (btor106
            (signal
             (bool->bitvector
              (bveq (signal-value btor104) (signal-value btor105)))
             (list)))
           (btor107
            (if (bitvector->bool (signal-value btor106)) btor97 btor95))
           (btor108 (bv->signal (bv 0 (bitvector 1))))
           (btor109 (bv->signal (bv 15 (bitvector 4))))
           (btor110
            (bv->signal
             (zero-extend (signal-value btor109) (bitvector 5))
             btor109))
           (btor111
            (signal
             (bool->bitvector
              (bveq (signal-value btor15) (signal-value btor110)))
             (list)))
           (btor112
            (if (bitvector->bool (signal-value btor111)) btor100 btor108))
           (btor113 (bv->signal (bv 7 (bitvector 3))))
           (btor114
            (bv->signal
             (zero-extend (signal-value btor113) (bitvector 5))
             btor113))
           (btor115
            (signal
             (bool->bitvector
              (bveq (signal-value btor15) (signal-value btor114)))
             (list)))
           (btor116
            (if (bitvector->bool (signal-value btor115)) btor108 btor112))
           (btor117 (if (bitvector->bool (signal-value btor116)) btor5 btor2))
           (btor118
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state118")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state118"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state118")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state118")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 30))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
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
                          (bv 0 30))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor121
            (if (bitvector->bool (signal-value btor106)) btor119 btor118))
           (btor122
            (signal (extract 1 0 (signal-value btor12)) (signal-state btor12)))
           (btor123
            (signal
             (apply bvor (bitvector->bits (signal-value btor122)))
             (signal-state btor122)))
           (btor124
            (if (bitvector->bool (signal-value btor123)) btor121 btor117))
           (btor125
            (signal (extract 1 0 (signal-value btor4)) (signal-state btor4)))
           (btor126
            (signal
             (bool->bitvector
              (bveq (signal-value btor125) (signal-value btor122)))
             (list)))
           (btor127
            (if (bitvector->bool (signal-value btor126)) btor124 btor107))
           (btor129
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state129")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state129"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state129")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state129")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor130 (bv->signal (bv 0 (bitvector 18))))
           (btor131
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state131")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state131"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state131")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state131")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor133
            (if (bitvector->bool (signal-value btor106)) btor131 btor129))
           (btor134
            (bv->signal
             (zero-extend (signal-value btor109) (bitvector 5))
             btor109))
           (btor135
            (signal
             (bool->bitvector
              (bveq (signal-value btor22) (signal-value btor134)))
             (list)))
           (btor136
            (if (bitvector->bool (signal-value btor135)) btor100 btor108))
           (btor137
            (bv->signal
             (zero-extend (signal-value btor113) (bitvector 5))
             btor113))
           (btor138
            (signal
             (bool->bitvector
              (bveq (signal-value btor22) (signal-value btor137)))
             (list)))
           (btor139
            (if (bitvector->bool (signal-value btor138)) btor108 btor136))
           (btor140
            (if (bitvector->bool (signal-value btor139)) btor19 btor17))
           (btor141
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state141")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state141"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state141")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state141")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor142
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state142")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state142"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state142")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state142")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor144
            (if (bitvector->bool (signal-value btor106)) btor142 btor141))
           (btor145
            (signal (extract 1 0 (signal-value btor21)) (signal-state btor21)))
           (btor146
            (signal
             (apply bvor (bitvector->bits (signal-value btor145)))
             (signal-state btor145)))
           (btor147
            (if (bitvector->bool (signal-value btor146)) btor144 btor140))
           (btor148
            (signal (extract 1 0 (signal-value btor18)) (signal-state btor18)))
           (btor149
            (signal
             (bool->bitvector
              (bveq (signal-value btor148) (signal-value btor145)))
             (list)))
           (btor150
            (if (bitvector->bool (signal-value btor149)) btor147 btor133))
           (btor152
            (signal (bvxor (signal-value btor8) (signal-value btor52)) (list)))
           (btor153
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state153")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state153"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state153")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state153")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 4))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor154 (bv->signal (bv 0 (bitvector 4))))
           (btor155
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state155")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state155"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state155")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state155")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 4))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor157
            (if (bitvector->bool (signal-value btor106)) btor155 btor153))
           (btor158
            (signal (extract 0 0 (signal-value btor9)) (signal-state btor9)))
           (btor159
            (if (bitvector->bool (signal-value btor158)) btor157 btor152))
           (btor160
            (signal
             (extract 0 0 (signal-value btor159))
             (signal-state btor159)))
           (btor161
            (signal
             (extract 1 1 (signal-value btor159))
             (signal-state btor159)))
           (btor162
            (signal
             (bvand (signal-value btor160) (signal-value btor161))
             (list)))
           (btor163 (bitvector 14))
           (btor164 (bv->signal (bv 0 (bitvector 2))))
           (btor165 (bv->signal (bv 2 (bitvector 2))))
           (btor166 (bv->signal (bv 25 (bitvector 5))))
           (btor167
            (signal
             (bool->bitvector
              (bveq (signal-value btor92) (signal-value btor166)))
             (list)))
           (btor168
            (if (bitvector->bool (signal-value btor167)) btor165 btor164))
           (btor169 (bv->signal (bv 1 (bitvector 2))))
           (btor170 (bv->signal (bv 19 (bitvector 5))))
           (btor171
            (signal
             (bool->bitvector
              (bveq (signal-value btor92) (signal-value btor170)))
             (list)))
           (btor172
            (if (bitvector->bool (signal-value btor171)) btor169 btor168))
           (btor173 (bv->signal (bv 12 (bitvector 4))))
           (btor174
            (bv->signal
             (zero-extend (signal-value btor173) (bitvector 5))
             btor173))
           (btor175
            (signal
             (bool->bitvector
              (bveq (signal-value btor92) (signal-value btor174)))
             (list)))
           (btor176
            (if (bitvector->bool (signal-value btor175)) btor164 btor172))
           (btor177
            (bv->signal
             (zero-extend (signal-value btor100) (bitvector 2))
             btor100))
           (btor178
            (signal
             (bool->bitvector
              ((compose1 not bveq)
               (signal-value btor176)
               (signal-value btor177)))
             (list)))
           (btor179
            (signal
             (extract 0 0 (signal-value btor159))
             (signal-state btor159)))
           (btor180
            (signal
             (extract 0 0 (signal-value btor159))
             (signal-state btor159)))
           (btor181
            (signal
             (concat (signal-value btor180) (signal-value btor179))
             (list)))
           (btor182
            (signal
             (extract 0 0 (signal-value btor159))
             (signal-state btor159)))
           (btor183
            (signal
             (concat (signal-value btor182) (signal-value btor181))
             (list)))
           (btor184
            (signal
             (extract 0 0 (signal-value btor159))
             (signal-state btor159)))
           (btor185
            (signal
             (concat (signal-value btor184) (signal-value btor183))
             (list)))
           (btor186
            (signal
             (extract 0 0 (signal-value btor159))
             (signal-state btor159)))
           (btor187
            (signal
             (concat (signal-value btor186) (signal-value btor185))
             (list)))
           (btor188
            (signal
             (extract 0 0 (signal-value btor159))
             (signal-state btor159)))
           (btor189 (bitvector 6))
           (btor190
            (signal
             (concat (signal-value btor188) (signal-value btor187))
             (list)))
           (btor191
            (signal
             (extract 0 0 (signal-value btor159))
             (signal-state btor159)))
           (btor192 (bitvector 7))
           (btor193
            (signal
             (concat (signal-value btor191) (signal-value btor190))
             (list)))
           (btor194
            (signal
             (extract 0 0 (signal-value btor159))
             (signal-state btor159)))
           (btor195 (bitvector 8))
           (btor196
            (signal
             (concat (signal-value btor194) (signal-value btor193))
             (list)))
           (btor197
            (signal
             (extract 0 0 (signal-value btor159))
             (signal-state btor159)))
           (btor198
            (signal
             (concat (signal-value btor197) (signal-value btor196))
             (list)))
           (btor199
            (signal
             (extract 0 0 (signal-value btor159))
             (signal-state btor159)))
           (btor200 (bitvector 10))
           (btor201
            (signal
             (concat (signal-value btor199) (signal-value btor198))
             (list)))
           (btor202
            (signal
             (extract 0 0 (signal-value btor159))
             (signal-state btor159)))
           (btor203 (bitvector 11))
           (btor204
            (signal
             (concat (signal-value btor202) (signal-value btor201))
             (list)))
           (btor205
            (signal
             (extract 0 0 (signal-value btor159))
             (signal-state btor159)))
           (btor206 (bitvector 12))
           (btor207
            (signal
             (concat (signal-value btor205) (signal-value btor204))
             (list)))
           (btor208
            (signal
             (extract 0 0 (signal-value btor159))
             (signal-state btor159)))
           (btor209 (bitvector 13))
           (btor210
            (signal
             (concat (signal-value btor208) (signal-value btor207))
             (list)))
           (btor211
            (signal
             (extract 0 0 (signal-value btor159))
             (signal-state btor159)))
           (btor212
            (signal
             (concat (signal-value btor211) (signal-value btor210))
             (list)))
           (btor213
            (signal
             (extract 0 0 (signal-value btor159))
             (signal-state btor159)))
           (btor214 (bitvector 15))
           (btor215
            (signal
             (concat (signal-value btor213) (signal-value btor212))
             (list)))
           (btor216
            (signal
             (extract 0 0 (signal-value btor159))
             (signal-state btor159)))
           (btor217 (bitvector 16))
           (btor218
            (signal
             (concat (signal-value btor216) (signal-value btor215))
             (list)))
           (btor219
            (signal
             (extract 0 0 (signal-value btor159))
             (signal-state btor159)))
           (btor220 (bitvector 17))
           (btor221
            (signal
             (concat (signal-value btor219) (signal-value btor218))
             (list)))
           (btor222
            (signal
             (extract 0 0 (signal-value btor159))
             (signal-state btor159)))
           (btor223
            (signal
             (concat (signal-value btor222) (signal-value btor221))
             (list)))
           (btor224
            (signal
             (extract 0 0 (signal-value btor159))
             (signal-state btor159)))
           (btor225 (bitvector 19))
           (btor226
            (signal
             (concat (signal-value btor224) (signal-value btor223))
             (list)))
           (btor227
            (signal
             (extract 0 0 (signal-value btor159))
             (signal-state btor159)))
           (btor228 (bitvector 20))
           (btor229
            (signal
             (concat (signal-value btor227) (signal-value btor226))
             (list)))
           (btor230
            (signal
             (extract 0 0 (signal-value btor159))
             (signal-state btor159)))
           (btor231 (bitvector 21))
           (btor232
            (signal
             (concat (signal-value btor230) (signal-value btor229))
             (list)))
           (btor233
            (signal
             (extract 0 0 (signal-value btor159))
             (signal-state btor159)))
           (btor234 (bitvector 22))
           (btor235
            (signal
             (concat (signal-value btor233) (signal-value btor232))
             (list)))
           (btor236
            (signal
             (extract 0 0 (signal-value btor159))
             (signal-state btor159)))
           (btor237 (bitvector 23))
           (btor238
            (signal
             (concat (signal-value btor236) (signal-value btor235))
             (list)))
           (btor239
            (signal
             (extract 0 0 (signal-value btor159))
             (signal-state btor159)))
           (btor240 (bitvector 24))
           (btor241
            (signal
             (concat (signal-value btor239) (signal-value btor238))
             (list)))
           (btor242
            (signal
             (extract 0 0 (signal-value btor159))
             (signal-state btor159)))
           (btor243 (bitvector 25))
           (btor244
            (signal
             (concat (signal-value btor242) (signal-value btor241))
             (list)))
           (btor245
            (signal
             (extract 0 0 (signal-value btor159))
             (signal-state btor159)))
           (btor246 (bitvector 26))
           (btor247
            (signal
             (concat (signal-value btor245) (signal-value btor244))
             (list)))
           (btor248
            (signal
             (extract 0 0 (signal-value btor159))
             (signal-state btor159)))
           (btor249
            (signal
             (concat (signal-value btor248) (signal-value btor247))
             (list)))
           (btor250
            (signal
             (extract 0 0 (signal-value btor159))
             (signal-state btor159)))
           (btor251 (bitvector 28))
           (btor252
            (signal
             (concat (signal-value btor250) (signal-value btor249))
             (list)))
           (btor253
            (signal
             (extract 0 0 (signal-value btor159))
             (signal-state btor159)))
           (btor254 (bitvector 29))
           (btor255
            (signal
             (concat (signal-value btor253) (signal-value btor252))
             (list)))
           (btor256
            (signal
             (extract 0 0 (signal-value btor159))
             (signal-state btor159)))
           (btor257
            (signal
             (concat (signal-value btor256) (signal-value btor255))
             (list)))
           (btor258
            (signal
             (extract 0 0 (signal-value btor159))
             (signal-state btor159)))
           (btor259 (bitvector 31))
           (btor260
            (signal
             (concat (signal-value btor258) (signal-value btor257))
             (list)))
           (btor261
            (signal
             (extract 0 0 (signal-value btor159))
             (signal-state btor159)))
           (btor262
            (signal
             (concat (signal-value btor261) (signal-value btor260))
             (list)))
           (btor263
            (signal
             (extract 0 0 (signal-value btor159))
             (signal-state btor159)))
           (btor264 (bitvector 33))
           (btor265
            (signal
             (concat (signal-value btor263) (signal-value btor262))
             (list)))
           (btor266
            (signal
             (extract 0 0 (signal-value btor159))
             (signal-state btor159)))
           (btor267 (bitvector 34))
           (btor268
            (signal
             (concat (signal-value btor266) (signal-value btor265))
             (list)))
           (btor269
            (signal
             (extract 0 0 (signal-value btor159))
             (signal-state btor159)))
           (btor270 (bitvector 35))
           (btor271
            (signal
             (concat (signal-value btor269) (signal-value btor268))
             (list)))
           (btor272
            (signal
             (extract 0 0 (signal-value btor159))
             (signal-state btor159)))
           (btor273 (bitvector 36))
           (btor274
            (signal
             (concat (signal-value btor272) (signal-value btor271))
             (list)))
           (btor275
            (signal
             (extract 0 0 (signal-value btor159))
             (signal-state btor159)))
           (btor276 (bitvector 37))
           (btor277
            (signal
             (concat (signal-value btor275) (signal-value btor274))
             (list)))
           (btor278
            (signal
             (extract 0 0 (signal-value btor159))
             (signal-state btor159)))
           (btor279 (bitvector 38))
           (btor280
            (signal
             (concat (signal-value btor278) (signal-value btor277))
             (list)))
           (btor281
            (signal
             (extract 0 0 (signal-value btor159))
             (signal-state btor159)))
           (btor282 (bitvector 39))
           (btor283
            (signal
             (concat (signal-value btor281) (signal-value btor280))
             (list)))
           (btor284
            (signal
             (extract 0 0 (signal-value btor159))
             (signal-state btor159)))
           (btor285 (bitvector 40))
           (btor286
            (signal
             (concat (signal-value btor284) (signal-value btor283))
             (list)))
           (btor287
            (signal
             (extract 0 0 (signal-value btor159))
             (signal-state btor159)))
           (btor288 (bitvector 41))
           (btor289
            (signal
             (concat (signal-value btor287) (signal-value btor286))
             (list)))
           (btor290
            (signal
             (extract 0 0 (signal-value btor159))
             (signal-state btor159)))
           (btor291 (bitvector 42))
           (btor292
            (signal
             (concat (signal-value btor290) (signal-value btor289))
             (list)))
           (btor293
            (signal
             (extract 0 0 (signal-value btor159))
             (signal-state btor159)))
           (btor294 (bitvector 43))
           (btor295
            (signal
             (concat (signal-value btor293) (signal-value btor292))
             (list)))
           (btor296
            (signal
             (extract 0 0 (signal-value btor159))
             (signal-state btor159)))
           (btor297 (bitvector 44))
           (btor298
            (signal
             (concat (signal-value btor296) (signal-value btor295))
             (list)))
           (btor299
            (signal
             (extract 0 0 (signal-value btor159))
             (signal-state btor159)))
           (btor300 (bitvector 45))
           (btor301
            (signal
             (concat (signal-value btor299) (signal-value btor298))
             (list)))
           (btor302
            (signal
             (extract 0 0 (signal-value btor159))
             (signal-state btor159)))
           (btor303 (bitvector 46))
           (btor304
            (signal
             (concat (signal-value btor302) (signal-value btor301))
             (list)))
           (btor305
            (signal
             (extract 0 0 (signal-value btor159))
             (signal-state btor159)))
           (btor306 (bitvector 47))
           (btor307
            (signal
             (concat (signal-value btor305) (signal-value btor304))
             (list)))
           (btor308
            (signal
             (extract 0 0 (signal-value btor159))
             (signal-state btor159)))
           (btor309
            (signal
             (concat (signal-value btor308) (signal-value btor307))
             (list)))
           (btor310 (bv->signal (bv 0 (bitvector 48))))
           (btor311
            (signal
             (bvxor (signal-value btor71) (signal-value btor57))
             (list)))
           (btor312
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state312")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state312"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state312")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state312")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 9))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor313 (bv->signal (bv 0 (bitvector 9))))
           (btor314
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state314")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state314"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state314")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state314")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 9))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor316
            (if (bitvector->bool (signal-value btor106)) btor314 btor312))
           (btor317
            (signal (extract 0 0 (signal-value btor72)) (signal-state btor72)))
           (btor318
            (if (bitvector->bool (signal-value btor317)) btor316 btor311))
           (btor319
            (signal
             (extract 6 4 (signal-value btor318))
             (signal-state btor318)))
           (btor320
            (bv->signal
             (zero-extend (signal-value btor100) (bitvector 3))
             btor100))
           (btor321
            (signal
             (bool->bitvector
              (bveq (signal-value btor319) (signal-value btor320)))
             (list)))
           (btor322
            (if (bitvector->bool (signal-value btor321)) btor74 btor310))
           (btor323
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state323")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state323"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state323")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state323")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 48))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
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
                          (bv 0 48))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor326
            (if (bitvector->bool (signal-value btor106)) btor324 btor323))
           (btor327
            (signal (extract 0 0 (signal-value btor46)) (signal-state btor46)))
           (btor328
            (if (bitvector->bool (signal-value btor327)) btor326 btor24))
           (btor329 (bv->signal (bv 3 (bitvector 2))))
           (btor330
            (bv->signal
             (zero-extend (signal-value btor329) (bitvector 3))
             btor329))
           (btor331
            (signal
             (bool->bitvector
              (bveq (signal-value btor319) (signal-value btor330)))
             (list)))
           (btor332
            (if (bitvector->bool (signal-value btor331)) btor328 btor322))
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
                          (bv 0 48))))))))
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
                          (bv 0 48))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor336
            (if (bitvector->bool (signal-value btor106)) btor334 btor333))
           (btor337
            (signal
             (extract 47 17 (signal-value btor74))
             (signal-state btor74)))
           (btor338
            (signal
             (extract 47 47 (signal-value btor74))
             (signal-state btor74)))
           (btor339
            (signal
             (concat (signal-value btor338) (signal-value btor337))
             (list)))
           (btor340
            (signal
             (extract 47 47 (signal-value btor74))
             (signal-state btor74)))
           (btor341
            (signal
             (concat (signal-value btor340) (signal-value btor339))
             (list)))
           (btor342
            (signal
             (extract 47 47 (signal-value btor74))
             (signal-state btor74)))
           (btor343
            (signal
             (concat (signal-value btor342) (signal-value btor341))
             (list)))
           (btor344
            (signal
             (extract 47 47 (signal-value btor74))
             (signal-state btor74)))
           (btor345
            (signal
             (concat (signal-value btor344) (signal-value btor343))
             (list)))
           (btor346
            (signal
             (extract 47 47 (signal-value btor74))
             (signal-state btor74)))
           (btor347
            (signal
             (concat (signal-value btor346) (signal-value btor345))
             (list)))
           (btor348
            (signal
             (extract 47 47 (signal-value btor74))
             (signal-state btor74)))
           (btor349
            (signal
             (concat (signal-value btor348) (signal-value btor347))
             (list)))
           (btor350
            (signal
             (extract 47 47 (signal-value btor74))
             (signal-state btor74)))
           (btor351
            (signal
             (concat (signal-value btor350) (signal-value btor349))
             (list)))
           (btor352
            (signal
             (extract 47 47 (signal-value btor74))
             (signal-state btor74)))
           (btor353
            (signal
             (concat (signal-value btor352) (signal-value btor351))
             (list)))
           (btor354
            (signal
             (extract 47 47 (signal-value btor74))
             (signal-state btor74)))
           (btor355
            (signal
             (concat (signal-value btor354) (signal-value btor353))
             (list)))
           (btor356
            (signal
             (extract 47 47 (signal-value btor74))
             (signal-state btor74)))
           (btor357
            (signal
             (concat (signal-value btor356) (signal-value btor355))
             (list)))
           (btor358
            (signal
             (extract 47 47 (signal-value btor74))
             (signal-state btor74)))
           (btor359
            (signal
             (concat (signal-value btor358) (signal-value btor357))
             (list)))
           (btor360
            (signal
             (extract 47 47 (signal-value btor74))
             (signal-state btor74)))
           (btor361
            (signal
             (concat (signal-value btor360) (signal-value btor359))
             (list)))
           (btor362
            (signal
             (extract 47 47 (signal-value btor74))
             (signal-state btor74)))
           (btor363
            (signal
             (concat (signal-value btor362) (signal-value btor361))
             (list)))
           (btor364
            (signal
             (extract 47 47 (signal-value btor74))
             (signal-state btor74)))
           (btor365
            (signal
             (concat (signal-value btor364) (signal-value btor363))
             (list)))
           (btor366
            (signal
             (extract 47 47 (signal-value btor74))
             (signal-state btor74)))
           (btor367
            (signal
             (concat (signal-value btor366) (signal-value btor365))
             (list)))
           (btor368
            (signal
             (extract 47 47 (signal-value btor74))
             (signal-state btor74)))
           (btor369
            (signal
             (concat (signal-value btor368) (signal-value btor367))
             (list)))
           (btor370
            (signal
             (extract 47 47 (signal-value btor74))
             (signal-state btor74)))
           (btor371
            (signal
             (concat (signal-value btor370) (signal-value btor369))
             (list)))
           (btor372 (bv->signal (bv 5 (bitvector 3))))
           (btor373
            (signal
             (bool->bitvector
              (bveq (signal-value btor319) (signal-value btor372)))
             (list)))
           (btor374
            (if (bitvector->bool (signal-value btor373)) btor371 btor336))
           (btor375
            (signal
             (extract 47 17 (signal-value btor336))
             (signal-state btor336)))
           (btor376
            (signal
             (extract 47 47 (signal-value btor336))
             (signal-state btor336)))
           (btor377
            (signal
             (concat (signal-value btor376) (signal-value btor375))
             (list)))
           (btor378
            (signal
             (extract 47 47 (signal-value btor336))
             (signal-state btor336)))
           (btor379
            (signal
             (concat (signal-value btor378) (signal-value btor377))
             (list)))
           (btor380
            (signal
             (extract 47 47 (signal-value btor336))
             (signal-state btor336)))
           (btor381
            (signal
             (concat (signal-value btor380) (signal-value btor379))
             (list)))
           (btor382
            (signal
             (extract 47 47 (signal-value btor336))
             (signal-state btor336)))
           (btor383
            (signal
             (concat (signal-value btor382) (signal-value btor381))
             (list)))
           (btor384
            (signal
             (extract 47 47 (signal-value btor336))
             (signal-state btor336)))
           (btor385
            (signal
             (concat (signal-value btor384) (signal-value btor383))
             (list)))
           (btor386
            (signal
             (extract 47 47 (signal-value btor336))
             (signal-state btor336)))
           (btor387
            (signal
             (concat (signal-value btor386) (signal-value btor385))
             (list)))
           (btor388
            (signal
             (extract 47 47 (signal-value btor336))
             (signal-state btor336)))
           (btor389
            (signal
             (concat (signal-value btor388) (signal-value btor387))
             (list)))
           (btor390
            (signal
             (extract 47 47 (signal-value btor336))
             (signal-state btor336)))
           (btor391
            (signal
             (concat (signal-value btor390) (signal-value btor389))
             (list)))
           (btor392
            (signal
             (extract 47 47 (signal-value btor336))
             (signal-state btor336)))
           (btor393
            (signal
             (concat (signal-value btor392) (signal-value btor391))
             (list)))
           (btor394
            (signal
             (extract 47 47 (signal-value btor336))
             (signal-state btor336)))
           (btor395
            (signal
             (concat (signal-value btor394) (signal-value btor393))
             (list)))
           (btor396
            (signal
             (extract 47 47 (signal-value btor336))
             (signal-state btor336)))
           (btor397
            (signal
             (concat (signal-value btor396) (signal-value btor395))
             (list)))
           (btor398
            (signal
             (extract 47 47 (signal-value btor336))
             (signal-state btor336)))
           (btor399
            (signal
             (concat (signal-value btor398) (signal-value btor397))
             (list)))
           (btor400
            (signal
             (extract 47 47 (signal-value btor336))
             (signal-state btor336)))
           (btor401
            (signal
             (concat (signal-value btor400) (signal-value btor399))
             (list)))
           (btor402
            (signal
             (extract 47 47 (signal-value btor336))
             (signal-state btor336)))
           (btor403
            (signal
             (concat (signal-value btor402) (signal-value btor401))
             (list)))
           (btor404
            (signal
             (extract 47 47 (signal-value btor336))
             (signal-state btor336)))
           (btor405
            (signal
             (concat (signal-value btor404) (signal-value btor403))
             (list)))
           (btor406
            (signal
             (extract 47 47 (signal-value btor336))
             (signal-state btor336)))
           (btor407
            (signal
             (concat (signal-value btor406) (signal-value btor405))
             (list)))
           (btor408
            (signal
             (extract 47 47 (signal-value btor336))
             (signal-state btor336)))
           (btor409
            (signal
             (concat (signal-value btor408) (signal-value btor407))
             (list)))
           (btor410
            (signal
             (extract 6 5 (signal-value btor318))
             (signal-state btor318)))
           (btor411
            (signal
             (bool->bitvector
              (bveq (signal-value btor410) (signal-value btor329)))
             (list)))
           (btor412
            (if (bitvector->bool (signal-value btor411)) btor409 btor374))
           (btor413 (bv->signal (bv 4 (bitvector 3))))
           (btor414
            (signal
             (bool->bitvector
              (bveq (signal-value btor319) (signal-value btor413)))
             (list)))
           (btor415
            (bv->signal
             (zero-extend (signal-value btor165) (bitvector 3))
             btor165))
           (btor416
            (signal
             (bool->bitvector
              (bveq (signal-value btor319) (signal-value btor415)))
             (list)))
           (btor417
            (signal
             (concat (signal-value btor411) (signal-value btor414))
             (list)))
           (btor418
            (signal
             (concat (signal-value btor373) (signal-value btor417))
             (list)))
           (btor419
            (signal
             (concat (signal-value btor416) (signal-value btor418))
             (list)))
           (btor420
            (signal
             (apply bvor (bitvector->bits (signal-value btor419)))
             (signal-state btor419)))
           (btor421
            (if (bitvector->bool (signal-value btor420)) btor412 btor332))
           (btor422
            (signal
             (bvxor (signal-value btor309) (signal-value btor421))
             (list)))
           (btor423
            (signal
             (concat (signal-value btor70) (signal-value btor108))
             (list)))
           (btor424
            (if (bitvector->bool (signal-value btor414)) btor423 btor164))
           (btor425 (bv->signal (bv 0 (bitvector 46))))
           (btor426
            (signal
             (concat (signal-value btor425) (signal-value btor424))
             (list)))
           (btor427 (bv->signal (bv 17592186044416 (bitvector 45))))
           (btor428
            (signal
             (extract 26 0 (signal-value btor124))
             (signal-state btor124)))
           (btor429
            (signal
             (extract 26 0 (signal-value btor107))
             (signal-state btor107)))
           (btor430
            (signal
             (bvxor (signal-value btor50) (signal-value btor55))
             (list)))
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
                          (bv 0 5))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor432 (bv->signal (bv 0 (bitvector 5))))
           (btor433
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state433")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state433"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state433")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state433")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 5))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor435
            (if (bitvector->bool (signal-value btor106)) btor433 btor431))
           (btor436
            (signal (extract 0 0 (signal-value btor51)) (signal-state btor51)))
           (btor437
            (if (bitvector->bool (signal-value btor436)) btor435 btor430))
           (btor438
            (signal
             (extract 0 0 (signal-value btor437))
             (signal-state btor437)))
           (btor439
            (if (bitvector->bool (signal-value btor438)) btor429 btor428))
           (btor440 (bv->signal (bv 0 (bitvector 27))))
           (btor441
            (bv->signal
             (zero-extend (signal-value btor100) (bitvector 5))
             btor100))
           (btor442
            (signal
             (bool->bitvector
              (bveq (signal-value btor75) (signal-value btor441)))
             (list)))
           (btor443
            (if (bitvector->bool (signal-value btor442)) btor100 btor108))
           (btor444 (bv->signal (bv 0 (bitvector 3))))
           (btor445
            (signal
             (concat (signal-value btor444) (signal-value btor75))
             (list)))
           (btor446
            (signal
             (apply bvor (bitvector->bits (signal-value btor445)))
             (signal-state btor445)))
           (btor447 (signal (bvnot (signal-value btor446)) (list)))
           (btor448
            (if (bitvector->bool (signal-value btor447)) btor108 btor443))
           (btor449 (signal (bvnot (signal-value btor448)) (list)))
           (btor450
            (signal
             (extract 1 1 (signal-value btor437))
             (signal-state btor437)))
           (btor451
            (signal
             (bvand (signal-value btor449) (signal-value btor450))
             (list)))
           (btor452
            (if (bitvector->bool (signal-value btor451)) btor440 btor439))
           (btor453
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state453")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state453"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state453")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state453")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 27))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor454
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state454")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state454"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state454")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state454")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 27))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor456
            (if (bitvector->bool (signal-value btor106)) btor454 btor453))
           (btor457
            (signal (extract 0 0 (signal-value btor49)) (signal-state btor49)))
           (btor458
            (bv->signal
             (zero-extend (signal-value btor165) (bitvector 5))
             btor165))
           (btor459
            (signal
             (bool->bitvector
              (bveq (signal-value btor11) (signal-value btor458)))
             (list)))
           (btor460
            (if (bitvector->bool (signal-value btor459)) btor100 btor108))
           (btor461 (bv->signal (bv 0 (bitvector 11))))
           (btor462
            (signal
             (concat (signal-value btor461) (signal-value btor11))
             (list)))
           (btor463
            (signal
             (apply bvor (bitvector->bits (signal-value btor462)))
             (signal-state btor462)))
           (btor464 (signal (bvnot (signal-value btor463)) (list)))
           (btor465
            (if (bitvector->bool (signal-value btor464)) btor108 btor460))
           (btor466 (signal (bvnot (signal-value btor465)) (list)))
           (btor467
            (bv->signal
             (zero-extend (signal-value btor165) (bitvector 5))
             btor165))
           (btor468
            (signal
             (bool->bitvector
              (bveq (signal-value btor20) (signal-value btor467)))
             (list)))
           (btor469
            (if (bitvector->bool (signal-value btor468)) btor100 btor108))
           (btor470
            (bv->signal
             (zero-extend (signal-value btor100) (bitvector 5))
             btor100))
           (btor471
            (signal
             (bool->bitvector
              (bveq (signal-value btor20) (signal-value btor470)))
             (list)))
           (btor472
            (if (bitvector->bool (signal-value btor471)) btor108 btor469))
           (btor473 (signal (bvnot (signal-value btor472)) (list)))
           (btor474
            (signal
             (bvand (signal-value btor466) (signal-value btor473))
             (list)))
           (btor475 (bv->signal (bv 20 (bitvector 5))))
           (btor476
            (signal
             (bool->bitvector
              (bveq (signal-value btor90) (signal-value btor475)))
             (list)))
           (btor477
            (if (bitvector->bool (signal-value btor476)) btor165 btor164))
           (btor478 (bv->signal (bv 18 (bitvector 5))))
           (btor479
            (signal
             (bool->bitvector
              (bveq (signal-value btor90) (signal-value btor478)))
             (list)))
           (btor480
            (if (bitvector->bool (signal-value btor479)) btor169 btor477))
           (btor481 (bv->signal (bv 10 (bitvector 4))))
           (btor482
            (bv->signal
             (zero-extend (signal-value btor481) (bitvector 5))
             btor481))
           (btor483
            (signal
             (bool->bitvector
              (bveq (signal-value btor90) (signal-value btor482)))
             (list)))
           (btor484
            (if (bitvector->bool (signal-value btor483)) btor164 btor480))
           (btor485
            (signal
             (bool->bitvector
              (bveq (signal-value btor484) (signal-value btor165)))
             (list)))
           (btor486
            (signal
             (bvor (signal-value btor474) (signal-value btor485))
             (list)))
           (btor487
            (if (bitvector->bool (signal-value btor486)) btor108 btor457))
           (btor488
            (if (bitvector->bool (signal-value btor487)) btor456 btor48))
           (btor489
            (signal
             (extract 2 2 (signal-value btor437))
             (signal-state btor437)))
           (btor490
            (if (bitvector->bool (signal-value btor489)) btor488 btor440))
           (btor491
            (signal
             (extract 4 4 (signal-value btor437))
             (signal-state btor437)))
           (btor492
            (if (bitvector->bool (signal-value btor491)) btor133 btor147))
           (btor493
            (signal
             (bvand (signal-value btor448) (signal-value btor450))
             (list)))
           (btor494
            (if (bitvector->bool (signal-value btor493)) btor130 btor492))
           (btor495
            (signal
             (extract 17 17 (signal-value btor494))
             (signal-state btor494)))
           (btor496
            (signal
             (concat (signal-value btor495) (signal-value btor494))
             (list)))
           (btor497
            (signal
             (extract 17 17 (signal-value btor494))
             (signal-state btor494)))
           (btor498
            (signal
             (concat (signal-value btor497) (signal-value btor496))
             (list)))
           (btor499
            (signal
             (extract 17 17 (signal-value btor494))
             (signal-state btor494)))
           (btor500
            (signal
             (concat (signal-value btor499) (signal-value btor498))
             (list)))
           (btor501
            (signal
             (extract 17 17 (signal-value btor494))
             (signal-state btor494)))
           (btor502
            (signal
             (concat (signal-value btor501) (signal-value btor500))
             (list)))
           (btor503
            (signal
             (extract 17 17 (signal-value btor494))
             (signal-state btor494)))
           (btor504
            (signal
             (concat (signal-value btor503) (signal-value btor502))
             (list)))
           (btor505
            (signal
             (extract 17 17 (signal-value btor494))
             (signal-state btor494)))
           (btor506
            (signal
             (concat (signal-value btor505) (signal-value btor504))
             (list)))
           (btor507
            (signal
             (extract 17 17 (signal-value btor494))
             (signal-state btor494)))
           (btor508
            (signal
             (concat (signal-value btor507) (signal-value btor506))
             (list)))
           (btor509
            (signal
             (extract 17 17 (signal-value btor494))
             (signal-state btor494)))
           (btor510
            (signal
             (concat (signal-value btor509) (signal-value btor508))
             (list)))
           (btor511
            (signal
             (extract 17 17 (signal-value btor494))
             (signal-state btor494)))
           (btor512
            (signal
             (concat (signal-value btor511) (signal-value btor510))
             (list)))
           (btor513
            (if (bitvector->bool (signal-value btor448)) btor512 btor452))
           (btor514
            (signal
             (bvadd (signal-value btor490) (signal-value btor513))
             (list)))
           (btor515
            (signal
             (bvsub (signal-value btor490) (signal-value btor513))
             (list)))
           (btor516
            (signal
             (extract 3 3 (signal-value btor437))
             (signal-state btor437)))
           (btor517
            (if (bitvector->bool (signal-value btor516)) btor515 btor514))
           (btor518
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state518")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state518"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state518")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state518")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 27))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor519
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state519")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state519"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state519")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state519")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 27))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor521
            (if (bitvector->bool (signal-value btor106)) btor519 btor518))
           (btor522
            (signal (extract 0 0 (signal-value btor6)) (signal-state btor6)))
           (btor523
            (if (bitvector->bool (signal-value btor486)) btor108 btor522))
           (btor524
            (if (bitvector->bool (signal-value btor523)) btor521 btor517))
           (btor525
            (if (bitvector->bool (signal-value btor465)) btor524 btor452))
           (btor526
            (signal
             (extract 26 26 (signal-value btor525))
             (signal-state btor525)))
           (btor527
            (signal
             (concat (signal-value btor526) (signal-value btor525))
             (list)))
           (btor528
            (signal
             (extract 26 26 (signal-value btor525))
             (signal-state btor525)))
           (btor529
            (signal
             (concat (signal-value btor528) (signal-value btor527))
             (list)))
           (btor530
            (signal
             (extract 26 26 (signal-value btor525))
             (signal-state btor525)))
           (btor531
            (signal
             (concat (signal-value btor530) (signal-value btor529))
             (list)))
           (btor532
            (signal
             (extract 26 26 (signal-value btor525))
             (signal-state btor525)))
           (btor533
            (signal
             (concat (signal-value btor532) (signal-value btor531))
             (list)))
           (btor534
            (signal
             (extract 26 26 (signal-value btor525))
             (signal-state btor525)))
           (btor535
            (signal
             (concat (signal-value btor534) (signal-value btor533))
             (list)))
           (btor536
            (signal
             (extract 26 26 (signal-value btor525))
             (signal-state btor525)))
           (btor537
            (signal
             (concat (signal-value btor536) (signal-value btor535))
             (list)))
           (btor538
            (signal
             (extract 26 26 (signal-value btor525))
             (signal-state btor525)))
           (btor539
            (signal
             (concat (signal-value btor538) (signal-value btor537))
             (list)))
           (btor540
            (signal
             (extract 26 26 (signal-value btor525))
             (signal-state btor525)))
           (btor541
            (signal
             (concat (signal-value btor540) (signal-value btor539))
             (list)))
           (btor542
            (signal
             (extract 26 26 (signal-value btor525))
             (signal-state btor525)))
           (btor543
            (signal
             (concat (signal-value btor542) (signal-value btor541))
             (list)))
           (btor544
            (signal
             (extract 26 26 (signal-value btor525))
             (signal-state btor525)))
           (btor545
            (signal
             (concat (signal-value btor544) (signal-value btor543))
             (list)))
           (btor546
            (signal
             (extract 26 26 (signal-value btor525))
             (signal-state btor525)))
           (btor547
            (signal
             (concat (signal-value btor546) (signal-value btor545))
             (list)))
           (btor548
            (signal
             (extract 26 26 (signal-value btor525))
             (signal-state btor525)))
           (btor549
            (signal
             (concat (signal-value btor548) (signal-value btor547))
             (list)))
           (btor550
            (signal
             (extract 26 26 (signal-value btor525))
             (signal-state btor525)))
           (btor551
            (signal
             (concat (signal-value btor550) (signal-value btor549))
             (list)))
           (btor552
            (signal
             (extract 26 26 (signal-value btor525))
             (signal-state btor525)))
           (btor553
            (signal
             (concat (signal-value btor552) (signal-value btor551))
             (list)))
           (btor554
            (signal
             (extract 26 26 (signal-value btor525))
             (signal-state btor525)))
           (btor555
            (signal
             (concat (signal-value btor554) (signal-value btor553))
             (list)))
           (btor556
            (signal
             (extract 26 26 (signal-value btor525))
             (signal-state btor525)))
           (btor557
            (signal
             (concat (signal-value btor556) (signal-value btor555))
             (list)))
           (btor558
            (signal
             (extract 26 26 (signal-value btor525))
             (signal-state btor525)))
           (btor559
            (signal
             (concat (signal-value btor558) (signal-value btor557))
             (list)))
           (btor560
            (signal
             (extract 26 26 (signal-value btor525))
             (signal-state btor525)))
           (btor561
            (signal
             (concat (signal-value btor560) (signal-value btor559))
             (list)))
           (btor562
            (signal
             (extract 17 0 (signal-value btor524))
             (signal-state btor524)))
           (btor563
            (if (bitvector->bool (signal-value btor472)) btor562 btor494))
           (btor564
            (signal
             (extract 17 17 (signal-value btor563))
             (signal-state btor563)))
           (btor565
            (signal
             (concat (signal-value btor564) (signal-value btor563))
             (list)))
           (btor566
            (signal
             (extract 17 17 (signal-value btor563))
             (signal-state btor563)))
           (btor567
            (signal
             (concat (signal-value btor566) (signal-value btor565))
             (list)))
           (btor568
            (signal
             (extract 17 17 (signal-value btor563))
             (signal-state btor563)))
           (btor569
            (signal
             (concat (signal-value btor568) (signal-value btor567))
             (list)))
           (btor570
            (signal
             (extract 17 17 (signal-value btor563))
             (signal-state btor563)))
           (btor571
            (signal
             (concat (signal-value btor570) (signal-value btor569))
             (list)))
           (btor572
            (signal
             (extract 17 17 (signal-value btor563))
             (signal-state btor563)))
           (btor573
            (signal
             (concat (signal-value btor572) (signal-value btor571))
             (list)))
           (btor574
            (signal
             (extract 17 17 (signal-value btor563))
             (signal-state btor563)))
           (btor575
            (signal
             (concat (signal-value btor574) (signal-value btor573))
             (list)))
           (btor576
            (signal
             (extract 17 17 (signal-value btor563))
             (signal-state btor563)))
           (btor577
            (signal
             (concat (signal-value btor576) (signal-value btor575))
             (list)))
           (btor578
            (signal
             (extract 17 17 (signal-value btor563))
             (signal-state btor563)))
           (btor579
            (signal
             (concat (signal-value btor578) (signal-value btor577))
             (list)))
           (btor580
            (signal
             (extract 17 17 (signal-value btor563))
             (signal-state btor563)))
           (btor581
            (signal
             (concat (signal-value btor580) (signal-value btor579))
             (list)))
           (btor582
            (signal
             (extract 17 17 (signal-value btor563))
             (signal-state btor563)))
           (btor583
            (signal
             (concat (signal-value btor582) (signal-value btor581))
             (list)))
           (btor584
            (signal
             (extract 17 17 (signal-value btor563))
             (signal-state btor563)))
           (btor585
            (signal
             (concat (signal-value btor584) (signal-value btor583))
             (list)))
           (btor586
            (signal
             (extract 17 17 (signal-value btor563))
             (signal-state btor563)))
           (btor587
            (signal
             (concat (signal-value btor586) (signal-value btor585))
             (list)))
           (btor588
            (signal
             (extract 17 17 (signal-value btor563))
             (signal-state btor563)))
           (btor589
            (signal
             (concat (signal-value btor588) (signal-value btor587))
             (list)))
           (btor590
            (signal
             (extract 17 17 (signal-value btor563))
             (signal-state btor563)))
           (btor591
            (signal
             (concat (signal-value btor590) (signal-value btor589))
             (list)))
           (btor592
            (signal
             (extract 17 17 (signal-value btor563))
             (signal-state btor563)))
           (btor593
            (signal
             (concat (signal-value btor592) (signal-value btor591))
             (list)))
           (btor594
            (signal
             (extract 17 17 (signal-value btor563))
             (signal-state btor563)))
           (btor595
            (signal
             (concat (signal-value btor594) (signal-value btor593))
             (list)))
           (btor596
            (signal
             (extract 17 17 (signal-value btor563))
             (signal-state btor563)))
           (btor597
            (signal
             (concat (signal-value btor596) (signal-value btor595))
             (list)))
           (btor598
            (signal
             (extract 17 17 (signal-value btor563))
             (signal-state btor563)))
           (btor599
            (signal
             (concat (signal-value btor598) (signal-value btor597))
             (list)))
           (btor600
            (signal
             (extract 17 17 (signal-value btor563))
             (signal-state btor563)))
           (btor601
            (signal
             (concat (signal-value btor600) (signal-value btor599))
             (list)))
           (btor602
            (signal
             (extract 17 17 (signal-value btor563))
             (signal-state btor563)))
           (btor603
            (signal
             (concat (signal-value btor602) (signal-value btor601))
             (list)))
           (btor604
            (signal
             (extract 17 17 (signal-value btor563))
             (signal-state btor563)))
           (btor605
            (signal
             (concat (signal-value btor604) (signal-value btor603))
             (list)))
           (btor606
            (signal
             (extract 17 17 (signal-value btor563))
             (signal-state btor563)))
           (btor607
            (signal
             (concat (signal-value btor606) (signal-value btor605))
             (list)))
           (btor608
            (signal
             (extract 17 17 (signal-value btor563))
             (signal-state btor563)))
           (btor609
            (signal
             (concat (signal-value btor608) (signal-value btor607))
             (list)))
           (btor610
            (signal
             (extract 17 17 (signal-value btor563))
             (signal-state btor563)))
           (btor611
            (signal
             (concat (signal-value btor610) (signal-value btor609))
             (list)))
           (btor612
            (signal
             (extract 17 17 (signal-value btor563))
             (signal-state btor563)))
           (btor613
            (signal
             (concat (signal-value btor612) (signal-value btor611))
             (list)))
           (btor614
            (signal
             (extract 17 17 (signal-value btor563))
             (signal-state btor563)))
           (btor615
            (signal
             (concat (signal-value btor614) (signal-value btor613))
             (list)))
           (btor616
            (signal
             (extract 17 17 (signal-value btor563))
             (signal-state btor563)))
           (btor617
            (signal
             (concat (signal-value btor616) (signal-value btor615))
             (list)))
           (btor618
            (signal
             (bvmul (signal-value btor561) (signal-value btor617))
             (list)))
           (btor619 (bv->signal (bv 0 (bitvector 45))))
           (btor620
            (if (bitvector->bool (signal-value btor485)) btor619 btor618))
           (btor621
            (signal
             (extract 0 0 (signal-value btor620))
             (signal-state btor620)))
           (btor622
            (signal
             (concat (signal-value btor108) (signal-value btor621))
             (list)))
           (btor623
            (signal
             (extract 2 2 (signal-value btor620))
             (signal-state btor620)))
           (btor624
            (signal
             (concat (signal-value btor623) (signal-value btor622))
             (list)))
           (btor625
            (signal
             (concat (signal-value btor108) (signal-value btor624))
             (list)))
           (btor626
            (signal
             (extract 4 4 (signal-value btor620))
             (signal-state btor620)))
           (btor627
            (signal
             (concat (signal-value btor626) (signal-value btor625))
             (list)))
           (btor628
            (signal
             (concat (signal-value btor108) (signal-value btor627))
             (list)))
           (btor629
            (signal
             (extract 6 6 (signal-value btor620))
             (signal-state btor620)))
           (btor630
            (signal
             (concat (signal-value btor629) (signal-value btor628))
             (list)))
           (btor631
            (signal
             (concat (signal-value btor108) (signal-value btor630))
             (list)))
           (btor632
            (signal
             (extract 8 8 (signal-value btor620))
             (signal-state btor620)))
           (btor633
            (signal
             (concat (signal-value btor632) (signal-value btor631))
             (list)))
           (btor634
            (signal
             (concat (signal-value btor108) (signal-value btor633))
             (list)))
           (btor635
            (signal
             (extract 10 10 (signal-value btor620))
             (signal-state btor620)))
           (btor636
            (signal
             (concat (signal-value btor635) (signal-value btor634))
             (list)))
           (btor637
            (signal
             (concat (signal-value btor108) (signal-value btor636))
             (list)))
           (btor638
            (signal
             (extract 12 12 (signal-value btor620))
             (signal-state btor620)))
           (btor639
            (signal
             (concat (signal-value btor638) (signal-value btor637))
             (list)))
           (btor640
            (signal
             (concat (signal-value btor108) (signal-value btor639))
             (list)))
           (btor641
            (signal
             (extract 14 14 (signal-value btor620))
             (signal-state btor620)))
           (btor642
            (signal
             (concat (signal-value btor641) (signal-value btor640))
             (list)))
           (btor643
            (signal
             (concat (signal-value btor108) (signal-value btor642))
             (list)))
           (btor644
            (signal
             (extract 16 16 (signal-value btor620))
             (signal-state btor620)))
           (btor645
            (signal
             (concat (signal-value btor644) (signal-value btor643))
             (list)))
           (btor646
            (signal
             (concat (signal-value btor108) (signal-value btor645))
             (list)))
           (btor647
            (signal
             (extract 18 18 (signal-value btor620))
             (signal-state btor620)))
           (btor648
            (signal
             (concat (signal-value btor647) (signal-value btor646))
             (list)))
           (btor649
            (signal
             (concat (signal-value btor108) (signal-value btor648))
             (list)))
           (btor650
            (signal
             (extract 20 20 (signal-value btor620))
             (signal-state btor620)))
           (btor651
            (signal
             (concat (signal-value btor650) (signal-value btor649))
             (list)))
           (btor652
            (signal
             (concat (signal-value btor108) (signal-value btor651))
             (list)))
           (btor653
            (signal
             (extract 22 22 (signal-value btor620))
             (signal-state btor620)))
           (btor654
            (signal
             (concat (signal-value btor653) (signal-value btor652))
             (list)))
           (btor655
            (signal
             (concat (signal-value btor108) (signal-value btor654))
             (list)))
           (btor656
            (signal
             (extract 24 24 (signal-value btor620))
             (signal-state btor620)))
           (btor657
            (signal
             (concat (signal-value btor656) (signal-value btor655))
             (list)))
           (btor658
            (signal
             (concat (signal-value btor108) (signal-value btor657))
             (list)))
           (btor659
            (signal
             (extract 26 26 (signal-value btor620))
             (signal-state btor620)))
           (btor660
            (signal
             (concat (signal-value btor659) (signal-value btor658))
             (list)))
           (btor661
            (signal
             (concat (signal-value btor108) (signal-value btor660))
             (list)))
           (btor662
            (signal
             (extract 28 28 (signal-value btor620))
             (signal-state btor620)))
           (btor663
            (signal
             (concat (signal-value btor662) (signal-value btor661))
             (list)))
           (btor664
            (signal
             (concat (signal-value btor108) (signal-value btor663))
             (list)))
           (btor665
            (signal
             (extract 30 30 (signal-value btor620))
             (signal-state btor620)))
           (btor666
            (signal
             (concat (signal-value btor665) (signal-value btor664))
             (list)))
           (btor667
            (signal
             (concat (signal-value btor108) (signal-value btor666))
             (list)))
           (btor668
            (signal
             (extract 32 32 (signal-value btor620))
             (signal-state btor620)))
           (btor669
            (signal
             (concat (signal-value btor668) (signal-value btor667))
             (list)))
           (btor670
            (signal
             (concat (signal-value btor108) (signal-value btor669))
             (list)))
           (btor671
            (signal
             (extract 34 34 (signal-value btor620))
             (signal-state btor620)))
           (btor672
            (signal
             (concat (signal-value btor671) (signal-value btor670))
             (list)))
           (btor673
            (signal
             (concat (signal-value btor108) (signal-value btor672))
             (list)))
           (btor674
            (signal
             (extract 36 36 (signal-value btor620))
             (signal-state btor620)))
           (btor675
            (signal
             (concat (signal-value btor674) (signal-value btor673))
             (list)))
           (btor676
            (signal
             (concat (signal-value btor108) (signal-value btor675))
             (list)))
           (btor677
            (signal
             (extract 38 38 (signal-value btor620))
             (signal-state btor620)))
           (btor678
            (signal
             (concat (signal-value btor677) (signal-value btor676))
             (list)))
           (btor679
            (signal
             (concat (signal-value btor108) (signal-value btor678))
             (list)))
           (btor680
            (signal
             (extract 40 40 (signal-value btor620))
             (signal-state btor620)))
           (btor681
            (signal
             (concat (signal-value btor680) (signal-value btor679))
             (list)))
           (btor682
            (signal
             (concat (signal-value btor108) (signal-value btor681))
             (list)))
           (btor683
            (signal
             (extract 42 42 (signal-value btor620))
             (signal-state btor620)))
           (btor684
            (signal
             (concat (signal-value btor683) (signal-value btor682))
             (list)))
           (btor685
            (signal
             (concat (signal-value btor165) (signal-value btor684))
             (list)))
           (btor686
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state686")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state686"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state686")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state686")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 45))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor687
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state687")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state687"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state687")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state687")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 45))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor689
            (if (bitvector->bool (signal-value btor106)) btor687 btor686))
           (btor690
            (signal (extract 0 0 (signal-value btor69)) (signal-state btor69)))
           (btor691
            (if (bitvector->bool (signal-value btor690)) btor689 btor685))
           (btor692
            (signal
             (apply bvor (bitvector->bits (signal-value btor176)))
             (signal-state btor176)))
           (btor693 (signal (bvnot (signal-value btor692)) (list)))
           (btor694
            (if (bitvector->bool (signal-value btor693)) btor691 btor427))
           (btor695
            (signal
             (extract 44 44 (signal-value btor694))
             (signal-state btor694)))
           (btor696
            (signal
             (concat (signal-value btor695) (signal-value btor694))
             (list)))
           (btor697
            (signal
             (extract 44 44 (signal-value btor694))
             (signal-state btor694)))
           (btor698
            (signal
             (concat (signal-value btor697) (signal-value btor696))
             (list)))
           (btor699
            (signal
             (extract 44 44 (signal-value btor694))
             (signal-state btor694)))
           (btor700
            (signal
             (concat (signal-value btor699) (signal-value btor698))
             (list)))
           (btor701
            (signal
             (extract 1 0 (signal-value btor318))
             (signal-state btor318)))
           (btor702
            (bv->signal
             (zero-extend (signal-value btor100) (bitvector 2))
             btor100))
           (btor703
            (signal
             (bool->bitvector
              (bveq (signal-value btor701) (signal-value btor702)))
             (list)))
           (btor704
            (if (bitvector->bool (signal-value btor703)) btor700 btor426))
           (btor705
            (signal
             (concat (signal-value btor124) (signal-value btor147))
             (list)))
           (btor706
            (signal
             (bool->bitvector
              (bveq (signal-value btor701) (signal-value btor329)))
             (list)))
           (btor707
            (if (bitvector->bool (signal-value btor706)) btor705 btor336))
           (btor708
            (signal
             (bool->bitvector
              (bveq (signal-value btor701) (signal-value btor165)))
             (list)))
           (btor709
            (signal
             (bvor (signal-value btor708) (signal-value btor706))
             (list)))
           (btor710
            (if (bitvector->bool (signal-value btor709)) btor707 btor704))
           (btor711
            (signal
             (bvxor (signal-value btor422) (signal-value btor710))
             (list)))
           (btor712
            (signal
             (extract 44 44 (signal-value btor620))
             (signal-state btor620)))
           (btor713 (signal (bvnot (signal-value btor712)) (list)))
           (btor714
            (signal
             (extract 1 1 (signal-value btor620))
             (signal-state btor620)))
           (btor715
            (signal
             (concat (signal-value btor714) (signal-value btor108))
             (list)))
           (btor716
            (signal
             (concat (signal-value btor108) (signal-value btor715))
             (list)))
           (btor717
            (signal
             (extract 3 3 (signal-value btor620))
             (signal-state btor620)))
           (btor718
            (signal
             (concat (signal-value btor717) (signal-value btor716))
             (list)))
           (btor719
            (signal
             (concat (signal-value btor108) (signal-value btor718))
             (list)))
           (btor720
            (signal
             (extract 5 5 (signal-value btor620))
             (signal-state btor620)))
           (btor721
            (signal
             (concat (signal-value btor720) (signal-value btor719))
             (list)))
           (btor722
            (signal
             (concat (signal-value btor108) (signal-value btor721))
             (list)))
           (btor723
            (signal
             (extract 7 7 (signal-value btor620))
             (signal-state btor620)))
           (btor724
            (signal
             (concat (signal-value btor723) (signal-value btor722))
             (list)))
           (btor725
            (signal
             (concat (signal-value btor108) (signal-value btor724))
             (list)))
           (btor726
            (signal
             (extract 9 9 (signal-value btor620))
             (signal-state btor620)))
           (btor727
            (signal
             (concat (signal-value btor726) (signal-value btor725))
             (list)))
           (btor728
            (signal
             (concat (signal-value btor108) (signal-value btor727))
             (list)))
           (btor729
            (signal
             (extract 11 11 (signal-value btor620))
             (signal-state btor620)))
           (btor730
            (signal
             (concat (signal-value btor729) (signal-value btor728))
             (list)))
           (btor731
            (signal
             (concat (signal-value btor108) (signal-value btor730))
             (list)))
           (btor732
            (signal
             (extract 13 13 (signal-value btor620))
             (signal-state btor620)))
           (btor733
            (signal
             (concat (signal-value btor732) (signal-value btor731))
             (list)))
           (btor734
            (signal
             (concat (signal-value btor108) (signal-value btor733))
             (list)))
           (btor735
            (signal
             (extract 15 15 (signal-value btor620))
             (signal-state btor620)))
           (btor736
            (signal
             (concat (signal-value btor735) (signal-value btor734))
             (list)))
           (btor737
            (signal
             (concat (signal-value btor108) (signal-value btor736))
             (list)))
           (btor738
            (signal
             (extract 17 17 (signal-value btor620))
             (signal-state btor620)))
           (btor739
            (signal
             (concat (signal-value btor738) (signal-value btor737))
             (list)))
           (btor740
            (signal
             (concat (signal-value btor108) (signal-value btor739))
             (list)))
           (btor741
            (signal
             (extract 19 19 (signal-value btor620))
             (signal-state btor620)))
           (btor742
            (signal
             (concat (signal-value btor741) (signal-value btor740))
             (list)))
           (btor743
            (signal
             (concat (signal-value btor108) (signal-value btor742))
             (list)))
           (btor744
            (signal
             (extract 21 21 (signal-value btor620))
             (signal-state btor620)))
           (btor745
            (signal
             (concat (signal-value btor744) (signal-value btor743))
             (list)))
           (btor746
            (signal
             (concat (signal-value btor108) (signal-value btor745))
             (list)))
           (btor747
            (signal
             (extract 23 23 (signal-value btor620))
             (signal-state btor620)))
           (btor748
            (signal
             (concat (signal-value btor747) (signal-value btor746))
             (list)))
           (btor749
            (signal
             (concat (signal-value btor108) (signal-value btor748))
             (list)))
           (btor750
            (signal
             (extract 25 25 (signal-value btor620))
             (signal-state btor620)))
           (btor751
            (signal
             (concat (signal-value btor750) (signal-value btor749))
             (list)))
           (btor752
            (signal
             (concat (signal-value btor108) (signal-value btor751))
             (list)))
           (btor753
            (signal
             (extract 27 27 (signal-value btor620))
             (signal-state btor620)))
           (btor754
            (signal
             (concat (signal-value btor753) (signal-value btor752))
             (list)))
           (btor755
            (signal
             (concat (signal-value btor108) (signal-value btor754))
             (list)))
           (btor756
            (signal
             (extract 29 29 (signal-value btor620))
             (signal-state btor620)))
           (btor757
            (signal
             (concat (signal-value btor756) (signal-value btor755))
             (list)))
           (btor758
            (signal
             (concat (signal-value btor108) (signal-value btor757))
             (list)))
           (btor759
            (signal
             (extract 31 31 (signal-value btor620))
             (signal-state btor620)))
           (btor760
            (signal
             (concat (signal-value btor759) (signal-value btor758))
             (list)))
           (btor761
            (signal
             (concat (signal-value btor108) (signal-value btor760))
             (list)))
           (btor762
            (signal
             (extract 33 33 (signal-value btor620))
             (signal-state btor620)))
           (btor763
            (signal
             (concat (signal-value btor762) (signal-value btor761))
             (list)))
           (btor764
            (signal
             (concat (signal-value btor108) (signal-value btor763))
             (list)))
           (btor765
            (signal
             (extract 35 35 (signal-value btor620))
             (signal-state btor620)))
           (btor766
            (signal
             (concat (signal-value btor765) (signal-value btor764))
             (list)))
           (btor767
            (signal
             (concat (signal-value btor108) (signal-value btor766))
             (list)))
           (btor768
            (signal
             (extract 37 37 (signal-value btor620))
             (signal-state btor620)))
           (btor769
            (signal
             (concat (signal-value btor768) (signal-value btor767))
             (list)))
           (btor770
            (signal
             (concat (signal-value btor108) (signal-value btor769))
             (list)))
           (btor771
            (signal
             (extract 39 39 (signal-value btor620))
             (signal-state btor620)))
           (btor772
            (signal
             (concat (signal-value btor771) (signal-value btor770))
             (list)))
           (btor773
            (signal
             (concat (signal-value btor108) (signal-value btor772))
             (list)))
           (btor774
            (signal
             (extract 41 41 (signal-value btor620))
             (signal-state btor620)))
           (btor775
            (signal
             (concat (signal-value btor774) (signal-value btor773))
             (list)))
           (btor776
            (signal
             (concat (signal-value btor108) (signal-value btor775))
             (list)))
           (btor777
            (signal
             (extract 43 43 (signal-value btor620))
             (signal-state btor620)))
           (btor778
            (signal
             (concat (signal-value btor777) (signal-value btor776))
             (list)))
           (btor779
            (signal
             (concat (signal-value btor713) (signal-value btor778))
             (list)))
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
                          (bv 0 45))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor781
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state781")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state781"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state781")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state781")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 45))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor783
            (if (bitvector->bool (signal-value btor106)) btor781 btor780))
           (btor784
            (if (bitvector->bool (signal-value btor690)) btor783 btor779))
           (btor785
            (if (bitvector->bool (signal-value btor693)) btor784 btor427))
           (btor786
            (signal
             (extract 3 2 (signal-value btor318))
             (signal-state btor318)))
           (btor787
            (bv->signal
             (zero-extend (signal-value btor100) (bitvector 2))
             btor100))
           (btor788
            (signal
             (bool->bitvector
              (bveq (signal-value btor786) (signal-value btor787)))
             (list)))
           (btor789
            (if (bitvector->bool (signal-value btor788)) btor785 btor619))
           (btor790
            (signal
             (concat (signal-value btor444) (signal-value btor789))
             (list)))
           (btor791 (bv->signal (bv 281474976710655 (bitvector 48))))
           (btor792
            (signal
             (bool->bitvector
              (bveq (signal-value btor786) (signal-value btor329)))
             (list)))
           (btor793
            (if (bitvector->bool (signal-value btor792)) btor328 btor791))
           (btor794
            (signal
             (bool->bitvector
              (bveq (signal-value btor786) (signal-value btor165)))
             (list)))
           (btor795
            (signal
             (bvor (signal-value btor794) (signal-value btor792))
             (list)))
           (btor796
            (if (bitvector->bool (signal-value btor795)) btor793 btor790))
           (btor797
            (signal
             (bvxor (signal-value btor711) (signal-value btor796))
             (list)))
           (btor798
            (signal
             (bvand (signal-value btor710) (signal-value btor796))
             (list)))
           (btor799
            (signal
             (bvand (signal-value btor422) (signal-value btor796))
             (list)))
           (btor800
            (signal
             (bvor (signal-value btor798) (signal-value btor799))
             (list)))
           (btor801
            (signal
             (bvand (signal-value btor710) (signal-value btor422))
             (list)))
           (btor802
            (signal
             (bvor (signal-value btor800) (signal-value btor801))
             (list)))
           (btor803
            (signal
             (extract 3 3 (signal-value btor159))
             (signal-state btor159)))
           (btor804
            (if (bitvector->bool (signal-value btor803)) btor802 btor797))
           (btor805
            (signal
             (extract 2 2 (signal-value btor159))
             (signal-state btor159)))
           (btor806
            (if (bitvector->bool (signal-value btor805)) btor310 btor802))
           (btor807
            (signal
             (extract 11 11 (signal-value btor806))
             (signal-state btor806)))
           (btor808
            (signal
             (bvand (signal-value btor807) (signal-value btor178))
             (list)))
           (btor809
            (signal
             (extract 23 23 (signal-value btor806))
             (signal-state btor806)))
           (btor810
            (signal
             (bvand (signal-value btor809) (signal-value btor693))
             (list)))
           (btor811
            (signal
             (extract 35 35 (signal-value btor806))
             (signal-state btor806)))
           (btor812
            (signal
             (bvand (signal-value btor811) (signal-value btor178))
             (list)))
           (btor813
            (signal
             (extract 10 0 (signal-value btor806))
             (signal-state btor806)))
           (btor814
            (signal
             (concat (signal-value btor813) (signal-value btor108))
             (list)))
           (btor815
            (signal
             (concat (signal-value btor808) (signal-value btor814))
             (list)))
           (btor816
            (signal
             (extract 22 12 (signal-value btor806))
             (signal-state btor806)))
           (btor817
            (signal
             (concat (signal-value btor816) (signal-value btor815))
             (list)))
           (btor818
            (signal
             (concat (signal-value btor810) (signal-value btor817))
             (list)))
           (btor819
            (signal
             (extract 34 24 (signal-value btor806))
             (signal-state btor806)))
           (btor820
            (signal
             (concat (signal-value btor819) (signal-value btor818))
             (list)))
           (btor821
            (signal
             (concat (signal-value btor812) (signal-value btor820))
             (list)))
           (btor822
            (signal
             (extract 46 36 (signal-value btor806))
             (signal-state btor806)))
           (btor823
            (signal
             (concat (signal-value btor822) (signal-value btor821))
             (list)))
           (btor824
            (signal
             (bvand (signal-value btor804) (signal-value btor823))
             (list)))
           (btor825
            (signal
             (extract 8 7 (signal-value btor318))
             (signal-state btor318)))
           (btor826
            (bv->signal
             (zero-extend (signal-value btor100) (bitvector 2))
             btor100))
           (btor827
            (signal
             (bool->bitvector
              (bveq (signal-value btor825) (signal-value btor826)))
             (list)))
           (btor828
            (if (bitvector->bool (signal-value btor827)) btor336 btor310))
           (btor829
            (signal
             (bool->bitvector
              (bveq (signal-value btor825) (signal-value btor329)))
             (list)))
           (btor830
            (if (bitvector->bool (signal-value btor829)) btor328 btor77))
           (btor831
            (signal
             (bool->bitvector
              (bveq (signal-value btor825) (signal-value btor165)))
             (list)))
           (btor832
            (signal
             (bvor (signal-value btor831) (signal-value btor829))
             (list)))
           (btor833
            (if (bitvector->bool (signal-value btor832)) btor830 btor828))
           (btor834
            (signal
             (bvand (signal-value btor833) (signal-value btor823))
             (list)))
           (btor835
            (signal
             (bvor (signal-value btor824) (signal-value btor834))
             (list)))
           (btor836
            (signal
             (bvand (signal-value btor804) (signal-value btor833))
             (list)))
           (btor837
            (signal
             (bvor (signal-value btor835) (signal-value btor836))
             (list)))
           (btor838
            (signal
             (extract 35 35 (signal-value btor837))
             (signal-state btor837)))
           (btor839
            (signal
             (bvand (signal-value btor178) (signal-value btor838))
             (list)))
           (btor840
            (signal
             (extract 47 36 (signal-value btor837))
             (signal-state btor837)))
           (btor841
            (signal
             (concat (signal-value btor840) (signal-value btor839))
             (list)))
           (btor842
            (bv->signal
             (zero-extend (signal-value btor841) (bitvector 14))
             btor841))
           (btor843
            (signal
             (bvxor (signal-value btor804) (signal-value btor823))
             (list)))
           (btor844
            (signal
             (bvxor (signal-value btor843) (signal-value btor833))
             (list)))
           (btor845
            (signal
             (extract 47 36 (signal-value btor844))
             (signal-state btor844)))
           (btor846
            (signal
             (extract 47 47 (signal-value btor806))
             (signal-state btor806)))
           (btor847
            (signal
             (concat (signal-value btor846) (signal-value btor845))
             (list)))
           (btor848
            (bv->signal
             (zero-extend (signal-value btor847) (bitvector 14))
             btor847))
           (btor849
            (signal
             (bvadd (signal-value btor842) (signal-value btor848))
             (list)))
           (btor850
            (signal
             (extract 23 23 (signal-value btor837))
             (signal-state btor837)))
           (btor851
            (signal
             (bvand (signal-value btor693) (signal-value btor850))
             (list)))
           (btor852
            (signal
             (extract 34 24 (signal-value btor837))
             (signal-state btor837)))
           (btor853
            (signal
             (concat (signal-value btor852) (signal-value btor851))
             (list)))
           (btor854
            (bv->signal
             (zero-extend (signal-value btor853) (bitvector 13))
             btor853))
           (btor855
            (signal
             (extract 35 24 (signal-value btor844))
             (signal-state btor844)))
           (btor856
            (bv->signal
             (zero-extend (signal-value btor855) (bitvector 13))
             btor855))
           (btor857
            (signal
             (bvadd (signal-value btor854) (signal-value btor856))
             (list)))
           (btor858
            (signal
             (extract 11 11 (signal-value btor837))
             (signal-state btor837)))
           (btor859
            (signal
             (bvand (signal-value btor178) (signal-value btor858))
             (list)))
           (btor860
            (signal
             (extract 22 12 (signal-value btor837))
             (signal-state btor837)))
           (btor861
            (signal
             (concat (signal-value btor860) (signal-value btor859))
             (list)))
           (btor862
            (bv->signal
             (zero-extend (signal-value btor861) (bitvector 13))
             btor861))
           (btor863
            (signal
             (extract 23 12 (signal-value btor844))
             (signal-state btor844)))
           (btor864
            (bv->signal
             (zero-extend (signal-value btor863) (bitvector 13))
             btor863))
           (btor865
            (signal
             (bvadd (signal-value btor862) (signal-value btor864))
             (list)))
           (btor866
            (signal
             (bvxor (signal-value btor27) (signal-value btor53))
             (list)))
           (btor867
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state867")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state867"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state867")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state867")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor868
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state868")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state868"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state868")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state868")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor870
            (if (bitvector->bool (signal-value btor106)) btor868 btor867))
           (btor871
            (signal (extract 0 0 (signal-value btor28)) (signal-state btor28)))
           (btor872
            (if (bitvector->bool (signal-value btor871)) btor870 btor866))
           (btor873 (signal (bvnot (signal-value btor872)) (list)))
           (btor874
            (signal
             (extract 47 47 (signal-value btor74))
             (signal-state btor74)))
           (btor875
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state875")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state875"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state875")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state875")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 3))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor876
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state876")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state876"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state876")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state876")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 3))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor878
            (if (bitvector->bool (signal-value btor106)) btor876 btor875))
           (btor879
            (signal (extract 0 0 (signal-value btor31)) (signal-state btor31)))
           (btor880
            (if (bitvector->bool (signal-value btor879)) btor878 btor30))
           (btor881
            (bv->signal
             (zero-extend (signal-value btor100) (bitvector 3))
             btor100))
           (btor882
            (signal
             (bool->bitvector
              (bveq (signal-value btor880) (signal-value btor881)))
             (list)))
           (btor883
            (if (bitvector->bool (signal-value btor882)) btor874 btor873))
           (btor884 (signal (bvnot (signal-value btor26)) (list)))
           (btor885 (signal (bvnot (signal-value btor874)) (list)))
           (btor886
            (bv->signal
             (zero-extend (signal-value btor329) (bitvector 3))
             btor329))
           (btor887
            (signal
             (bool->bitvector
              (bveq (signal-value btor880) (signal-value btor886)))
             (list)))
           (btor888
            (if (bitvector->bool (signal-value btor887)) btor885 btor884))
           (btor889
            (bv->signal
             (zero-extend (signal-value btor165) (bitvector 3))
             btor165))
           (btor890
            (signal
             (bool->bitvector
              (bveq (signal-value btor880) (signal-value btor889)))
             (list)))
           (btor891
            (signal
             (bvor (signal-value btor890) (signal-value btor887))
             (list)))
           (btor892
            (if (bitvector->bool (signal-value btor891)) btor888 btor883))
           (btor893
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state893")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state893"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state893")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state893")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor894
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state894")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state894"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state894")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state894")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor896
            (if (bitvector->bool (signal-value btor106)) btor894 btor893))
           (btor897
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state897")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state897"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state897")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state897")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 4))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor898
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state898")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state898"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state898")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state898")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 4))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor900
            (if (bitvector->bool (signal-value btor106)) btor898 btor897))
           (btor901
            (signal
             (extract 3 3 (signal-value btor900))
             (signal-state btor900)))
           (btor902
            (signal
             (bvxor (signal-value btor896) (signal-value btor901))
             (list)))
           (btor903 (signal (bvnot (signal-value btor902)) (list)))
           (btor904
            (signal
             (extract 47 47 (signal-value btor336))
             (signal-state btor336)))
           (btor905
            (signal
             (bool->bitvector
              (bveq (signal-value btor880) (signal-value btor372)))
             (list)))
           (btor906
            (if (bitvector->bool (signal-value btor905)) btor904 btor903))
           (btor907
            (signal
             (extract 26 26 (signal-value btor525))
             (signal-state btor525)))
           (btor908
            (signal
             (extract 17 17 (signal-value btor563))
             (signal-state btor563)))
           (btor909
            (signal
             (bvxor (signal-value btor907) (signal-value btor908))
             (list)))
           (btor910 (signal (bvnot (signal-value btor909)) (list)))
           (btor911
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state911")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state911"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state911")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state911")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor912
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state912")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state912"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state912")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state912")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor914
            (if (bitvector->bool (signal-value btor106)) btor912 btor911))
           (btor915
            (if (bitvector->bool (signal-value btor690)) btor914 btor910))
           (btor916 (signal (bvnot (signal-value btor915)) (list)))
           (btor917 (signal (bvnot (signal-value btor904)) (list)))
           (btor918
            (signal
             (bool->bitvector
              (bveq (signal-value btor880) (signal-value btor113)))
             (list)))
           (btor919
            (if (bitvector->bool (signal-value btor918)) btor917 btor916))
           (btor920 (bv->signal (bv 6 (bitvector 3))))
           (btor921
            (signal
             (bool->bitvector
              (bveq (signal-value btor880) (signal-value btor920)))
             (list)))
           (btor922
            (signal
             (bvor (signal-value btor921) (signal-value btor918))
             (list)))
           (btor923
            (if (bitvector->bool (signal-value btor922)) btor919 btor906))
           (btor924
            (signal
             (bool->bitvector
              (bveq (signal-value btor880) (signal-value btor413)))
             (list)))
           (btor925
            (signal
             (concat (signal-value btor905) (signal-value btor922))
             (list)))
           (btor926
            (signal
             (concat (signal-value btor924) (signal-value btor925))
             (list)))
           (btor927
            (signal
             (apply bvor (bitvector->bits (signal-value btor926)))
             (signal-state btor926)))
           (btor928
            (if (bitvector->bool (signal-value btor927)) btor923 btor892))
           (btor929 (signal (bvnot (signal-value btor928)) (list)))
           (btor930
            (signal
             (bvor (signal-value btor803) (signal-value btor805))
             (list)))
           (btor931
            (if (bitvector->bool (signal-value btor930)) btor108 btor929))
           (btor932
            (signal
             (extract 10 0 (signal-value btor837))
             (signal-state btor837)))
           (btor933
            (signal
             (concat (signal-value btor932) (signal-value btor931))
             (list)))
           (btor934
            (bv->signal
             (zero-extend (signal-value btor933) (bitvector 13))
             btor933))
           (btor935
            (signal
             (extract 11 0 (signal-value btor844))
             (signal-state btor844)))
           (btor936
            (bv->signal
             (zero-extend (signal-value btor935) (bitvector 13))
             btor935))
           (btor937
            (signal
             (bvadd (signal-value btor934) (signal-value btor936))
             (list)))
           (btor938
            (signal
             (extract 12 12 (signal-value btor937))
             (signal-state btor937)))
           (btor939
            (signal
             (bvand (signal-value btor178) (signal-value btor938))
             (list)))
           (btor940
            (bv->signal
             (zero-extend (signal-value btor939) (bitvector 13))
             btor939))
           (btor941
            (signal
             (bvadd (signal-value btor865) (signal-value btor940))
             (list)))
           (btor942
            (signal
             (extract 12 12 (signal-value btor941))
             (signal-state btor941)))
           (btor943
            (signal
             (bvand (signal-value btor693) (signal-value btor942))
             (list)))
           (btor944
            (bv->signal
             (zero-extend (signal-value btor943) (bitvector 13))
             btor943))
           (btor945
            (signal
             (bvadd (signal-value btor857) (signal-value btor944))
             (list)))
           (btor946
            (signal
             (extract 12 12 (signal-value btor945))
             (signal-state btor945)))
           (btor947
            (signal
             (bvand (signal-value btor178) (signal-value btor946))
             (list)))
           (btor948
            (bv->signal
             (zero-extend (signal-value btor947) (bitvector 14))
             btor947))
           (btor949
            (signal
             (bvadd (signal-value btor849) (signal-value btor948))
             (list)))
           (btor950
            (signal
             (extract 12 12 (signal-value btor949))
             (signal-state btor949)))
           (btor951
            (signal
             (bvxor (signal-value btor162) (signal-value btor950))
             (list)))
           (btor952
            (signal
             (bvxor (signal-value btor162) (signal-value btor951))
             (list)))
           (btor953
            (signal (extract 0 0 (signal-value btor76)) (signal-state btor76)))
           (btor954
            (if (bitvector->bool (signal-value btor953)) btor902 btor952))
           (btor956
            (signal
             (bvxor (signal-value btor858) (signal-value btor938))
             (list)))
           (btor957
            (signal
             (bvxor (signal-value btor956) (signal-value btor807))
             (list)))
           (btor958
            (signal
             (bvxor (signal-value btor162) (signal-value btor957))
             (list)))
           (btor959
            (signal
             (extract 3 0 (signal-value btor318))
             (signal-state btor318)))
           (btor960
            (bv->signal
             (zero-extend (signal-value btor372) (bitvector 4))
             btor372))
           (btor961
            (signal
             (bool->bitvector
              (bveq (signal-value btor959) (signal-value btor960)))
             (list)))
           (btor962
            (signal
             (extract 3 2 (signal-value btor159))
             (signal-state btor159)))
           (btor963
            (signal
             (apply bvor (bitvector->bits (signal-value btor962)))
             (signal-state btor962)))
           (btor964
            (signal
             (bvor (signal-value btor961) (signal-value btor963))
             (list)))
           (btor965
            (if (bitvector->bool (signal-value btor964)) btor108 btor958))
           (btor966
            (bv->signal
             (zero-extend (signal-value btor100) (bitvector 2))
             btor100))
           (btor967
            (signal
             (bool->bitvector
              (bveq (signal-value btor176) (signal-value btor966)))
             (list)))
           (btor968
            (if (bitvector->bool (signal-value btor967)) btor965 btor108))
           (btor969
            (signal
             (bvxor (signal-value btor850) (signal-value btor942))
             (list)))
           (btor970
            (signal
             (bvxor (signal-value btor969) (signal-value btor809))
             (list)))
           (btor971
            (signal
             (bvxor (signal-value btor162) (signal-value btor970))
             (list)))
           (btor972
            (if (bitvector->bool (signal-value btor964)) btor108 btor971))
           (btor973
            (signal
             (apply bvor (bitvector->bits (signal-value btor176)))
             (signal-state btor176)))
           (btor974
            (if (bitvector->bool (signal-value btor973)) btor972 btor108))
           (btor975
            (signal
             (bvxor (signal-value btor838) (signal-value btor946))
             (list)))
           (btor976
            (signal
             (bvxor (signal-value btor975) (signal-value btor811))
             (list)))
           (btor977
            (signal
             (bvxor (signal-value btor162) (signal-value btor976))
             (list)))
           (btor978
            (if (bitvector->bool (signal-value btor964)) btor108 btor977))
           (btor979
            (if (bitvector->bool (signal-value btor967)) btor978 btor108))
           (btor980
            (signal
             (concat (signal-value btor974) (signal-value btor968))
             (list)))
           (btor981
            (signal
             (concat (signal-value btor979) (signal-value btor980))
             (list)))
           (btor982
            (signal
             (concat (signal-value btor951) (signal-value btor981))
             (list)))
           (btor983
            (if (bitvector->bool (signal-value btor953)) btor900 btor982))
           (btor985
            (signal
             (extract 13 13 (signal-value btor949))
             (signal-state btor949)))
           (btor986
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state986")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state986"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state986")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state986")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor987
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state987")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state987"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state987")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state987")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor989
            (if (bitvector->bool (signal-value btor106)) btor987 btor986))
           (btor990
            (if (bitvector->bool (signal-value btor953)) btor989 btor985))
           (btor992 (bv->signal (bv 17 (bitvector 5))))
           (btor993
            (signal
             (bool->bitvector
              (bveq (signal-value btor89) (signal-value btor992)))
             (list)))
           (btor994
            (if (bitvector->bool (signal-value btor993)) btor100 btor108))
           (btor995 (bv->signal (bv 9 (bitvector 4))))
           (btor996
            (bv->signal
             (zero-extend (signal-value btor995) (bitvector 5))
             btor995))
           (btor997
            (signal
             (bool->bitvector
              (bveq (signal-value btor89) (signal-value btor996)))
             (list)))
           (btor998
            (if (bitvector->bool (signal-value btor997)) btor108 btor994))
           (btor999
            (if (bitvector->bool (signal-value btor998)) btor328 btor73))
           (btor1000
            (signal
             (extract 1 1 (signal-value btor159))
             (signal-state btor159)))
           (btor1001
            (signal
             (extract 1 1 (signal-value btor159))
             (signal-state btor159)))
           (btor1002
            (signal
             (concat (signal-value btor1001) (signal-value btor1000))
             (list)))
           (btor1003
            (signal
             (extract 1 1 (signal-value btor159))
             (signal-state btor159)))
           (btor1004
            (signal
             (concat (signal-value btor1003) (signal-value btor1002))
             (list)))
           (btor1005
            (signal
             (extract 1 1 (signal-value btor159))
             (signal-state btor159)))
           (btor1006
            (signal
             (concat (signal-value btor1005) (signal-value btor1004))
             (list)))
           (btor1007
            (signal
             (extract 1 1 (signal-value btor159))
             (signal-state btor159)))
           (btor1008
            (signal
             (concat (signal-value btor1007) (signal-value btor1006))
             (list)))
           (btor1009
            (signal
             (extract 1 1 (signal-value btor159))
             (signal-state btor159)))
           (btor1010
            (signal
             (concat (signal-value btor1009) (signal-value btor1008))
             (list)))
           (btor1011
            (signal
             (extract 1 1 (signal-value btor159))
             (signal-state btor159)))
           (btor1012
            (signal
             (concat (signal-value btor1011) (signal-value btor1010))
             (list)))
           (btor1013
            (signal
             (extract 1 1 (signal-value btor159))
             (signal-state btor159)))
           (btor1014
            (signal
             (concat (signal-value btor1013) (signal-value btor1012))
             (list)))
           (btor1015
            (signal
             (extract 1 1 (signal-value btor159))
             (signal-state btor159)))
           (btor1016
            (signal
             (concat (signal-value btor1015) (signal-value btor1014))
             (list)))
           (btor1017
            (signal
             (extract 1 1 (signal-value btor159))
             (signal-state btor159)))
           (btor1018
            (signal
             (concat (signal-value btor1017) (signal-value btor1016))
             (list)))
           (btor1019
            (signal
             (extract 1 1 (signal-value btor159))
             (signal-state btor159)))
           (btor1020
            (signal
             (concat (signal-value btor1019) (signal-value btor1018))
             (list)))
           (btor1021
            (signal
             (extract 1 1 (signal-value btor159))
             (signal-state btor159)))
           (btor1022
            (signal
             (concat (signal-value btor1021) (signal-value btor1020))
             (list)))
           (btor1023
            (signal
             (extract 1 1 (signal-value btor159))
             (signal-state btor159)))
           (btor1024
            (signal
             (concat (signal-value btor1023) (signal-value btor1022))
             (list)))
           (btor1025
            (signal
             (extract 1 1 (signal-value btor159))
             (signal-state btor159)))
           (btor1026
            (signal
             (concat (signal-value btor1025) (signal-value btor1024))
             (list)))
           (btor1027
            (signal
             (extract 1 1 (signal-value btor159))
             (signal-state btor159)))
           (btor1028
            (signal
             (concat (signal-value btor1027) (signal-value btor1026))
             (list)))
           (btor1029
            (signal
             (extract 1 1 (signal-value btor159))
             (signal-state btor159)))
           (btor1030
            (signal
             (concat (signal-value btor1029) (signal-value btor1028))
             (list)))
           (btor1031
            (signal
             (extract 1 1 (signal-value btor159))
             (signal-state btor159)))
           (btor1032
            (signal
             (concat (signal-value btor1031) (signal-value btor1030))
             (list)))
           (btor1033
            (signal
             (extract 1 1 (signal-value btor159))
             (signal-state btor159)))
           (btor1034
            (signal
             (concat (signal-value btor1033) (signal-value btor1032))
             (list)))
           (btor1035
            (signal
             (extract 1 1 (signal-value btor159))
             (signal-state btor159)))
           (btor1036
            (signal
             (concat (signal-value btor1035) (signal-value btor1034))
             (list)))
           (btor1037
            (signal
             (extract 1 1 (signal-value btor159))
             (signal-state btor159)))
           (btor1038
            (signal
             (concat (signal-value btor1037) (signal-value btor1036))
             (list)))
           (btor1039
            (signal
             (extract 1 1 (signal-value btor159))
             (signal-state btor159)))
           (btor1040
            (signal
             (concat (signal-value btor1039) (signal-value btor1038))
             (list)))
           (btor1041
            (signal
             (extract 1 1 (signal-value btor159))
             (signal-state btor159)))
           (btor1042
            (signal
             (concat (signal-value btor1041) (signal-value btor1040))
             (list)))
           (btor1043
            (signal
             (extract 1 1 (signal-value btor159))
             (signal-state btor159)))
           (btor1044
            (signal
             (concat (signal-value btor1043) (signal-value btor1042))
             (list)))
           (btor1045
            (signal
             (extract 1 1 (signal-value btor159))
             (signal-state btor159)))
           (btor1046
            (signal
             (concat (signal-value btor1045) (signal-value btor1044))
             (list)))
           (btor1047
            (signal
             (extract 1 1 (signal-value btor159))
             (signal-state btor159)))
           (btor1048
            (signal
             (concat (signal-value btor1047) (signal-value btor1046))
             (list)))
           (btor1049
            (signal
             (extract 1 1 (signal-value btor159))
             (signal-state btor159)))
           (btor1050
            (signal
             (concat (signal-value btor1049) (signal-value btor1048))
             (list)))
           (btor1051
            (signal
             (extract 1 1 (signal-value btor159))
             (signal-state btor159)))
           (btor1052
            (signal
             (concat (signal-value btor1051) (signal-value btor1050))
             (list)))
           (btor1053
            (signal
             (extract 1 1 (signal-value btor159))
             (signal-state btor159)))
           (btor1054
            (signal
             (concat (signal-value btor1053) (signal-value btor1052))
             (list)))
           (btor1055
            (signal
             (extract 1 1 (signal-value btor159))
             (signal-state btor159)))
           (btor1056
            (signal
             (concat (signal-value btor1055) (signal-value btor1054))
             (list)))
           (btor1057
            (signal
             (extract 1 1 (signal-value btor159))
             (signal-state btor159)))
           (btor1058
            (signal
             (concat (signal-value btor1057) (signal-value btor1056))
             (list)))
           (btor1059
            (signal
             (extract 1 1 (signal-value btor159))
             (signal-state btor159)))
           (btor1060
            (signal
             (concat (signal-value btor1059) (signal-value btor1058))
             (list)))
           (btor1061
            (signal
             (extract 1 1 (signal-value btor159))
             (signal-state btor159)))
           (btor1062
            (signal
             (concat (signal-value btor1061) (signal-value btor1060))
             (list)))
           (btor1063
            (signal
             (extract 1 1 (signal-value btor159))
             (signal-state btor159)))
           (btor1064
            (signal
             (concat (signal-value btor1063) (signal-value btor1062))
             (list)))
           (btor1065
            (signal
             (extract 1 1 (signal-value btor159))
             (signal-state btor159)))
           (btor1066
            (signal
             (concat (signal-value btor1065) (signal-value btor1064))
             (list)))
           (btor1067
            (signal
             (extract 1 1 (signal-value btor159))
             (signal-state btor159)))
           (btor1068
            (signal
             (concat (signal-value btor1067) (signal-value btor1066))
             (list)))
           (btor1069
            (signal
             (extract 1 1 (signal-value btor159))
             (signal-state btor159)))
           (btor1070
            (signal
             (concat (signal-value btor1069) (signal-value btor1068))
             (list)))
           (btor1071
            (signal
             (extract 1 1 (signal-value btor159))
             (signal-state btor159)))
           (btor1072
            (signal
             (concat (signal-value btor1071) (signal-value btor1070))
             (list)))
           (btor1073
            (signal
             (extract 1 1 (signal-value btor159))
             (signal-state btor159)))
           (btor1074
            (signal
             (concat (signal-value btor1073) (signal-value btor1072))
             (list)))
           (btor1075
            (signal
             (extract 1 1 (signal-value btor159))
             (signal-state btor159)))
           (btor1076
            (signal
             (concat (signal-value btor1075) (signal-value btor1074))
             (list)))
           (btor1077
            (signal
             (extract 1 1 (signal-value btor159))
             (signal-state btor159)))
           (btor1078
            (signal
             (concat (signal-value btor1077) (signal-value btor1076))
             (list)))
           (btor1079
            (signal
             (extract 1 1 (signal-value btor159))
             (signal-state btor159)))
           (btor1080
            (signal
             (concat (signal-value btor1079) (signal-value btor1078))
             (list)))
           (btor1081
            (signal
             (extract 1 1 (signal-value btor159))
             (signal-state btor159)))
           (btor1082
            (signal
             (concat (signal-value btor1081) (signal-value btor1080))
             (list)))
           (btor1083
            (signal
             (extract 1 1 (signal-value btor159))
             (signal-state btor159)))
           (btor1084
            (signal
             (concat (signal-value btor1083) (signal-value btor1082))
             (list)))
           (btor1085
            (signal
             (extract 1 1 (signal-value btor159))
             (signal-state btor159)))
           (btor1086
            (signal
             (concat (signal-value btor1085) (signal-value btor1084))
             (list)))
           (btor1087
            (signal
             (extract 1 1 (signal-value btor159))
             (signal-state btor159)))
           (btor1088
            (signal
             (concat (signal-value btor1087) (signal-value btor1086))
             (list)))
           (btor1089
            (signal
             (extract 1 1 (signal-value btor159))
             (signal-state btor159)))
           (btor1090
            (signal
             (concat (signal-value btor1089) (signal-value btor1088))
             (list)))
           (btor1091
            (signal
             (extract 1 1 (signal-value btor159))
             (signal-state btor159)))
           (btor1092
            (signal
             (concat (signal-value btor1091) (signal-value btor1090))
             (list)))
           (btor1093
            (signal
             (extract 1 1 (signal-value btor159))
             (signal-state btor159)))
           (btor1094
            (signal
             (concat (signal-value btor1093) (signal-value btor1092))
             (list)))
           (btor1095
            (signal
             (extract 11 0 (signal-value btor937))
             (signal-state btor937)))
           (btor1096
            (signal
             (extract 11 0 (signal-value btor941))
             (signal-state btor941)))
           (btor1097
            (signal
             (concat (signal-value btor1096) (signal-value btor1095))
             (list)))
           (btor1098
            (signal
             (extract 11 0 (signal-value btor945))
             (signal-state btor945)))
           (btor1099
            (signal
             (concat (signal-value btor1098) (signal-value btor1097))
             (list)))
           (btor1100
            (signal
             (extract 11 0 (signal-value btor949))
             (signal-state btor949)))
           (btor1101
            (signal
             (concat (signal-value btor1100) (signal-value btor1099))
             (list)))
           (btor1102
            (signal
             (bvxor (signal-value btor1094) (signal-value btor1101))
             (list)))
           (btor1103
            (signal
             (bvxor (signal-value btor999) (signal-value btor1102))
             (list)))
           (btor1104 (signal (bvnot (signal-value btor1103)) (list)))
           (btor1105
            (signal
             (extract 45 0 (signal-value btor328))
             (signal-state btor328)))
           (btor1106 (signal (bvnot (signal-value btor1105)) (list)))
           (btor1107
            (signal
             (concat (signal-value btor1106) (signal-value btor164))
             (list)))
           (btor1108 (bv->signal (bv 23 (bitvector 5))))
           (btor1109
            (signal
             (bool->bitvector
              (bveq (signal-value btor88) (signal-value btor1108)))
             (list)))
           (btor1110
            (if (bitvector->bool (signal-value btor1109)) btor329 btor164))
           (btor1111 (bv->signal (bv 22 (bitvector 5))))
           (btor1112
            (signal
             (bool->bitvector
              (bveq (signal-value btor88) (signal-value btor1111)))
             (list)))
           (btor1113
            (if (bitvector->bool (signal-value btor1112)) btor165 btor1110))
           (btor1114
            (signal
             (bool->bitvector
              (bveq (signal-value btor88) (signal-value btor992)))
             (list)))
           (btor1115
            (if (bitvector->bool (signal-value btor1114)) btor169 btor1113))
           (btor1116 (bv->signal (bv 8 (bitvector 4))))
           (btor1117
            (bv->signal
             (zero-extend (signal-value btor1116) (bitvector 5))
             btor1116))
           (btor1118
            (signal
             (bool->bitvector
              (bveq (signal-value btor88) (signal-value btor1117)))
             (list)))
           (btor1119
            (if (bitvector->bool (signal-value btor1118)) btor164 btor1115))
           (btor1120
            (signal
             (bool->bitvector
              (bveq (signal-value btor1119) (signal-value btor329)))
             (list)))
           (btor1121
            (if (bitvector->bool (signal-value btor1120)) btor1107 btor68))
           (btor1122
            (signal
             (extract 46 0 (signal-value btor328))
             (signal-state btor328)))
           (btor1123 (signal (bvnot (signal-value btor1122)) (list)))
           (btor1124
            (signal
             (concat (signal-value btor1123) (signal-value btor108))
             (list)))
           (btor1125
            (signal
             (bool->bitvector
              (bveq (signal-value btor1119) (signal-value btor165)))
             (list)))
           (btor1126
            (if (bitvector->bool (signal-value btor1125)) btor1124 btor1121))
           (btor1127
            (bv->signal
             (zero-extend (signal-value btor100) (bitvector 2))
             btor100))
           (btor1128
            (signal
             (bool->bitvector
              (bveq (signal-value btor1119) (signal-value btor1127)))
             (list)))
           (btor1129
            (if (bitvector->bool (signal-value btor1128)) btor328 btor1126))
           (btor1130 (bv->signal (bv 21 (bitvector 5))))
           (btor1131
            (signal
             (bool->bitvector
              (bveq (signal-value btor91) (signal-value btor1130)))
             (list)))
           (btor1132
            (if (bitvector->bool (signal-value btor1131)) btor100 btor108))
           (btor1133 (bv->signal (bv 11 (bitvector 4))))
           (btor1134
            (bv->signal
             (zero-extend (signal-value btor1133) (bitvector 5))
             btor1133))
           (btor1135
            (signal
             (bool->bitvector
              (bveq (signal-value btor91) (signal-value btor1134)))
             (list)))
           (btor1136
            (if (bitvector->bool (signal-value btor1135)) btor108 btor1132))
           (btor1137
            (if (bitvector->bool (signal-value btor1136)) btor1129 btor791))
           (btor1138
            (signal
             (bvor (signal-value btor1104) (signal-value btor1137))
             (list)))
           (btor1139
            (signal
             (apply bvand (bitvector->bits (signal-value btor1138)))
             (signal-state btor1138)))
           (btor1140
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1140")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1140"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1140")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1140")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1141
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1141")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1141"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1141")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1141")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1143
            (if (bitvector->bool (signal-value btor106)) btor1141 btor1140))
           (btor1144
            (if (bitvector->bool (signal-value btor953)) btor1143 btor1139))
           (btor1145 (signal (bvnot (signal-value btor1144)) (list)))
           (btor1146
            (signal
             (bvor (signal-value btor1103) (signal-value btor1137))
             (list)))
           (btor1147
            (signal
             (apply bvand (bitvector->bits (signal-value btor1146)))
             (signal-state btor1146)))
           (btor1148
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1148")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1148"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1148")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1148")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1149
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1149")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1149"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1149")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1149")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1151
            (if (bitvector->bool (signal-value btor106)) btor1149 btor1148))
           (btor1152
            (if (bitvector->bool (signal-value btor953)) btor1151 btor1147))
           (btor1153 (signal (bvnot (signal-value btor1152)) (list)))
           (btor1154
            (signal
             (bvand (signal-value btor1145) (signal-value btor1153))
             (list)))
           (btor1155
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1155")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1155"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1155")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1155")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1156
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1156")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1156"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1156")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1156")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1158
            (if (bitvector->bool (signal-value btor106)) btor1156 btor1155))
           (btor1159
            (if (bitvector->bool (signal-value btor953)) btor1158 btor1139))
           (btor1160
            (signal
             (bvand (signal-value btor1154) (signal-value btor1159))
             (list)))
           (btor1161
            (if (bitvector->bool (signal-value btor1136)) btor1160 btor108))
           (btor1163
            (if (bitvector->bool (signal-value btor953)) btor336 btor1102))
           (btor1168
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1168")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1168"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1168")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1168")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1169
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1169")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1169"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1169")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1169")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1171
            (if (bitvector->bool (signal-value btor106)) btor1169 btor1168))
           (btor1172
            (if (bitvector->bool (signal-value btor953)) btor1171 btor1147))
           (btor1173
            (signal
             (bvand (signal-value btor1154) (signal-value btor1172))
             (list)))
           (btor1174
            (if (bitvector->bool (signal-value btor1136)) btor1173 btor108))
           (btor1176
            (signal
             (extract 5 0 (signal-value btor797))
             (signal-state btor797)))
           (btor1177
            (signal
             (apply bvxor (bitvector->bits (signal-value btor1176)))
             (signal-state btor1176)))
           (btor1178 (bv->signal (bv 24 (bitvector 5))))
           (btor1179
            (signal
             (bool->bitvector
              (bveq (signal-value btor93) (signal-value btor1178)))
             (list)))
           (btor1180
            (if (bitvector->bool (signal-value btor1179)) btor100 btor108))
           (btor1181 (bv->signal (bv 13 (bitvector 4))))
           (btor1182
            (bv->signal
             (zero-extend (signal-value btor1181) (bitvector 5))
             btor1181))
           (btor1183
            (signal
             (bool->bitvector
              (bveq (signal-value btor93) (signal-value btor1182)))
             (list)))
           (btor1184
            (if (bitvector->bool (signal-value btor1183)) btor108 btor1180))
           (btor1185
            (if (bitvector->bool (signal-value btor1184)) btor1177 btor108))
           (btor1186
            (signal
             (extract 11 6 (signal-value btor797))
             (signal-state btor797)))
           (btor1187
            (signal
             (apply bvxor (bitvector->bits (signal-value btor1186)))
             (signal-state btor1186)))
           (btor1188
            (if (bitvector->bool (signal-value btor1184)) btor1187 btor108))
           (btor1189
            (signal
             (bvxor (signal-value btor1185) (signal-value btor1188))
             (list)))
           (btor1190 (bv->signal (bv 26 (bitvector 5))))
           (btor1191
            (signal
             (bool->bitvector
              (bveq (signal-value btor94) (signal-value btor1190)))
             (list)))
           (btor1192
            (if (bitvector->bool (signal-value btor1191)) btor100 btor108))
           (btor1193 (bv->signal (bv 14 (bitvector 4))))
           (btor1194
            (bv->signal
             (zero-extend (signal-value btor1193) (bitvector 5))
             btor1193))
           (btor1195
            (signal
             (bool->bitvector
              (bveq (signal-value btor94) (signal-value btor1194)))
             (list)))
           (btor1196
            (if (bitvector->bool (signal-value btor1195)) btor108 btor1192))
           (btor1197
            (if (bitvector->bool (signal-value btor1196)) btor1185 btor1189))
           (btor1198
            (signal
             (extract 17 12 (signal-value btor797))
             (signal-state btor797)))
           (btor1199
            (signal
             (apply bvxor (bitvector->bits (signal-value btor1198)))
             (signal-state btor1198)))
           (btor1200
            (if (bitvector->bool (signal-value btor1184)) btor1199 btor108))
           (btor1201
            (signal
             (extract 23 18 (signal-value btor797))
             (signal-state btor797)))
           (btor1202
            (signal
             (apply bvxor (bitvector->bits (signal-value btor1201)))
             (signal-state btor1201)))
           (btor1203
            (if (bitvector->bool (signal-value btor1184)) btor1202 btor108))
           (btor1204
            (signal
             (bvxor (signal-value btor1200) (signal-value btor1203))
             (list)))
           (btor1205
            (signal
             (bvxor (signal-value btor1189) (signal-value btor1204))
             (list)))
           (btor1206
            (if (bitvector->bool (signal-value btor1196)) btor1188 btor1205))
           (btor1207
            (if (bitvector->bool (signal-value btor1196)) btor1200 btor1204))
           (btor1208
            (signal
             (extract 29 24 (signal-value btor797))
             (signal-state btor797)))
           (btor1209
            (signal
             (apply bvxor (bitvector->bits (signal-value btor1208)))
             (signal-state btor1208)))
           (btor1210
            (if (bitvector->bool (signal-value btor1184)) btor1209 btor108))
           (btor1211
            (signal
             (extract 35 30 (signal-value btor797))
             (signal-state btor797)))
           (btor1212
            (signal
             (apply bvxor (bitvector->bits (signal-value btor1211)))
             (signal-state btor1211)))
           (btor1213
            (if (bitvector->bool (signal-value btor1184)) btor1212 btor108))
           (btor1214
            (signal
             (bvxor (signal-value btor1210) (signal-value btor1213))
             (list)))
           (btor1215
            (signal
             (extract 41 36 (signal-value btor797))
             (signal-state btor797)))
           (btor1216
            (signal
             (apply bvxor (bitvector->bits (signal-value btor1215)))
             (signal-state btor1215)))
           (btor1217
            (if (bitvector->bool (signal-value btor1184)) btor1216 btor108))
           (btor1218
            (signal
             (extract 47 42 (signal-value btor797))
             (signal-state btor797)))
           (btor1219
            (signal
             (apply bvxor (bitvector->bits (signal-value btor1218)))
             (signal-state btor1218)))
           (btor1220
            (if (bitvector->bool (signal-value btor1184)) btor1219 btor108))
           (btor1221
            (signal
             (bvxor (signal-value btor1217) (signal-value btor1220))
             (list)))
           (btor1222
            (signal
             (bvxor (signal-value btor1214) (signal-value btor1221))
             (list)))
           (btor1223
            (signal
             (bvxor (signal-value btor1205) (signal-value btor1222))
             (list)))
           (btor1224
            (if (bitvector->bool (signal-value btor1196)) btor1203 btor1223))
           (btor1225
            (if (bitvector->bool (signal-value btor1196)) btor1210 btor1214))
           (btor1226
            (if (bitvector->bool (signal-value btor1196)) btor1213 btor1222))
           (btor1227
            (if (bitvector->bool (signal-value btor1196)) btor1217 btor1221))
           (btor1228
            (signal
             (concat (signal-value btor1206) (signal-value btor1197))
             (list)))
           (btor1229
            (signal
             (concat (signal-value btor1207) (signal-value btor1228))
             (list)))
           (btor1230
            (signal
             (concat (signal-value btor1224) (signal-value btor1229))
             (list)))
           (btor1231
            (signal
             (concat (signal-value btor1225) (signal-value btor1230))
             (list)))
           (btor1232
            (signal
             (concat (signal-value btor1226) (signal-value btor1231))
             (list)))
           (btor1233
            (signal
             (concat (signal-value btor1227) (signal-value btor1232))
             (list)))
           (btor1234
            (signal
             (concat (signal-value btor1220) (signal-value btor1233))
             (list)))
           (btor1235
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1235")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1235"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1235")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1235")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 8))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1236 (bv->signal (bv 0 (bitvector 8))))
           (btor1237
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1237")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1237"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1237")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1237")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 8))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1239
            (if (bitvector->bool (signal-value btor106)) btor1237 btor1235))
           (btor1240
            (if (bitvector->bool (signal-value btor953)) btor1239 btor1234))
           (btor1242
            (bv->signal
             (zero-extend (signal-value btor107) (bitvector 30))
             btor107))
           (btor1243
            (bv->signal
             (zero-extend (signal-value btor452) (bitvector 27))
             btor452))
           (btor1244
            (bv->signal
             (zero-extend (signal-value btor121) (bitvector 30))
             btor121))
           (btor1245
            (bv->signal
             (zero-extend (signal-value btor125) (bitvector 2))
             btor125))
           (btor1246
            (bv->signal
             (zero-extend (signal-value btor4) (bitvector 32))
             btor4))
           (btor1247
            (bv->signal
             (zero-extend (signal-value btor5) (bitvector 30))
             btor5))
           (btor1248
            (bv->signal
             (zero-extend (signal-value btor522) (bitvector 1))
             btor522))
           (btor1249
            (bv->signal
             (zero-extend (signal-value btor523) (bitvector 1))
             btor523))
           (btor1250
            (bv->signal
             (zero-extend (signal-value btor6) (bitvector 32))
             btor6))
           (btor1251
            (bv->signal
             (zero-extend (signal-value btor524) (bitvector 27))
             btor524))
           (btor1252
            (bv->signal
             (zero-extend (signal-value btor521) (bitvector 27))
             btor521))
           (btor1253
            (bv->signal
             (zero-extend (signal-value btor517) (bitvector 27))
             btor517))
           (btor1254
            (bv->signal
             (zero-extend (signal-value btor162) (bitvector 1))
             btor162))
           (btor1255
            (bv->signal
             (zero-extend (signal-value btor896) (bitvector 1))
             btor896))
           (btor1256
            (bv->signal
             (zero-extend (signal-value btor158) (bitvector 1))
             btor158))
           (btor1257
            (bv->signal
             (zero-extend (signal-value btor9) (bitvector 32))
             btor9))
           (btor1258
            (bv->signal
             (zero-extend (signal-value btor159) (bitvector 4))
             btor159))
           (btor1259
            (bv->signal
             (zero-extend (signal-value btor152) (bitvector 4))
             btor152))
           (btor1260
            (bv->signal
             (zero-extend (signal-value btor157) (bitvector 4))
             btor157))
           (btor1261
            (bv->signal
             (zero-extend (signal-value btor1102) (bitvector 48))
             btor1102))
           (btor1262
            (bv->signal
             (zero-extend (signal-value btor336) (bitvector 48))
             btor336))
           (btor1263
            (bv->signal
             (zero-extend (signal-value btor907) (bitvector 1))
             btor907))
           (btor1264
            (bv->signal
             (zero-extend (signal-value btor465) (bitvector 1))
             btor465))
           (btor1265
            (bv->signal
             (zero-extend (signal-value btor462) (bitvector 16))
             btor462))
           (btor1266
            (bv->signal
             (zero-extend (signal-value btor122) (bitvector 2))
             btor122))
           (btor1267
            (bv->signal
             (zero-extend (signal-value btor12) (bitvector 32))
             btor12))
           (btor1268
            (bv->signal
             (zero-extend (signal-value btor372) (bitvector 5))
             btor372))
           (btor1269
            (signal
             (bool->bitvector
              (bveq (signal-value btor13) (signal-value btor1268)))
             (list)))
           (btor1270
            (if (bitvector->bool (signal-value btor1269)) btor165 btor164))
           (btor1271
            (bv->signal
             (zero-extend (signal-value btor413) (bitvector 5))
             btor413))
           (btor1272
            (signal
             (bool->bitvector
              (bveq (signal-value btor13) (signal-value btor1271)))
             (list)))
           (btor1273
            (if (bitvector->bool (signal-value btor1272)) btor169 btor1270))
           (btor1274
            (bv->signal
             (zero-extend (signal-value btor329) (bitvector 5))
             btor329))
           (btor1275
            (signal
             (bool->bitvector
              (bveq (signal-value btor13) (signal-value btor1274)))
             (list)))
           (btor1276
            (if (bitvector->bool (signal-value btor1275)) btor164 btor1273))
           (btor1277
            (bv->signal
             (zero-extend (signal-value btor1276) (bitvector 2))
             btor1276))
           (btor1278 (bitvector 120))
           (btor1279 (bitvector 115))
           (btor1280 (bv->signal (bv 0 (bitvector 115))))
           (btor1281
            (signal
             (concat (signal-value btor1280) (signal-value btor13))
             (list)))
           (btor1282
            (bv->signal
             (zero-extend (signal-value btor1281) (bitvector 120))
             btor1281))
           (btor1283 (bv->signal (bv 16 (bitvector 5))))
           (btor1284
            (signal
             (bool->bitvector
              (bveq (signal-value btor14) (signal-value btor1283)))
             (list)))
           (btor1285
            (if (bitvector->bool (signal-value btor1284)) btor100 btor108))
           (btor1286
            (bv->signal
             (zero-extend (signal-value btor920) (bitvector 5))
             btor920))
           (btor1287
            (signal
             (bool->bitvector
              (bveq (signal-value btor14) (signal-value btor1286)))
             (list)))
           (btor1288
            (if (bitvector->bool (signal-value btor1287)) btor108 btor1285))
           (btor1289
            (bv->signal
             (zero-extend (signal-value btor1288) (bitvector 1))
             btor1288))
           (btor1290 (bv->signal (bv 0 (bitvector 35))))
           (btor1291
            (signal
             (concat (signal-value btor1290) (signal-value btor14))
             (list)))
           (btor1292
            (bv->signal
             (zero-extend (signal-value btor1291) (bitvector 40))
             btor1291))
           (btor1293
            (bv->signal
             (zero-extend (signal-value btor124) (bitvector 30))
             btor124))
           (btor1294
            (bv->signal
             (zero-extend (signal-value btor116) (bitvector 1))
             btor116))
           (btor1295 (bitvector 56))
           (btor1296 (bitvector 51))
           (btor1297 (bv->signal (bv 0 (bitvector 51))))
           (btor1298
            (signal
             (concat (signal-value btor1297) (signal-value btor15))
             (list)))
           (btor1299
            (bv->signal
             (zero-extend (signal-value btor1298) (bitvector 56))
             btor1298))
           (btor1300
            (bv->signal
             (zero-extend (signal-value btor2) (bitvector 30))
             btor2))
           (btor1301
            (bv->signal
             (zero-extend (signal-value btor133) (bitvector 18))
             btor133))
           (btor1302
            (bv->signal
             (zero-extend (signal-value btor494) (bitvector 18))
             btor494))
           (btor1303
            (bv->signal
             (zero-extend (signal-value btor147) (bitvector 18))
             btor147))
           (btor1304
            (bv->signal
             (zero-extend (signal-value btor144) (bitvector 18))
             btor144))
           (btor1305
            (bv->signal
             (zero-extend (signal-value btor148) (bitvector 2))
             btor148))
           (btor1306
            (bv->signal
             (zero-extend (signal-value btor18) (bitvector 32))
             btor18))
           (btor1307
            (bv->signal
             (zero-extend (signal-value btor19) (bitvector 18))
             btor19))
           (btor1308
            (bv->signal
             (zero-extend (signal-value btor908) (bitvector 1))
             btor908))
           (btor1309
            (bv->signal
             (zero-extend (signal-value btor472) (bitvector 1))
             btor472))
           (btor1310
            (signal
             (concat (signal-value btor461) (signal-value btor20))
             (list)))
           (btor1311
            (bv->signal
             (zero-extend (signal-value btor1310) (bitvector 16))
             btor1310))
           (btor1312
            (bv->signal
             (zero-extend (signal-value btor145) (bitvector 2))
             btor145))
           (btor1313
            (bv->signal
             (zero-extend (signal-value btor21) (bitvector 32))
             btor21))
           (btor1314
            (bv->signal
             (zero-extend (signal-value btor147) (bitvector 18))
             btor147))
           (btor1315
            (bv->signal
             (zero-extend (signal-value btor139) (bitvector 1))
             btor139))
           (btor1316
            (signal
             (concat (signal-value btor1297) (signal-value btor22))
             (list)))
           (btor1317
            (bv->signal
             (zero-extend (signal-value btor1316) (bitvector 56))
             btor1316))
           (btor1318
            (bv->signal
             (zero-extend (signal-value btor17) (bitvector 18))
             btor17))
           (btor1319
            (bv->signal
             (zero-extend (signal-value btor26) (bitvector 1))
             btor26))
           (btor1320
            (bv->signal
             (zero-extend (signal-value btor871) (bitvector 1))
             btor871))
           (btor1321
            (bv->signal
             (zero-extend (signal-value btor28) (bitvector 32))
             btor28))
           (btor1322
            (bv->signal
             (zero-extend (signal-value btor879) (bitvector 1))
             btor879))
           (btor1323
            (bv->signal
             (zero-extend (signal-value btor31) (bitvector 32))
             btor31))
           (btor1324
            (bv->signal
             (zero-extend (signal-value btor30) (bitvector 3))
             btor30))
           (btor1325
            (bv->signal
             (zero-extend (signal-value btor880) (bitvector 3))
             btor880))
           (btor1326
            (bv->signal
             (zero-extend (signal-value btor878) (bitvector 3))
             btor878))
           (btor1327
            (bv->signal
             (zero-extend (signal-value btor866) (bitvector 1))
             btor866))
           (btor1328
            (bv->signal
             (zero-extend (signal-value btor872) (bitvector 1))
             btor872))
           (btor1329
            (bv->signal
             (zero-extend (signal-value btor870) (bitvector 1))
             btor870))
           (btor1330
            (bv->signal
             (zero-extend (signal-value btor902) (bitvector 1))
             btor902))
           (btor1331
            (bv->signal
             (zero-extend (signal-value btor32) (bitvector 1))
             btor32))
           (btor1332
            (bv->signal
             (zero-extend (signal-value btor33) (bitvector 1))
             btor33))
           (btor1333
            (bv->signal
             (zero-extend (signal-value btor34) (bitvector 1))
             btor34))
           (btor1334
            (bv->signal
             (zero-extend (signal-value btor35) (bitvector 1))
             btor35))
           (btor1335
            (bv->signal
             (zero-extend (signal-value btor36) (bitvector 1))
             btor36))
           (btor1336
            (bv->signal
             (zero-extend (signal-value btor37) (bitvector 1))
             btor37))
           (btor1337
            (bv->signal
             (zero-extend (signal-value btor39) (bitvector 1))
             btor39))
           (btor1338
            (bv->signal
             (zero-extend (signal-value btor40) (bitvector 1))
             btor40))
           (btor1339
            (bv->signal
             (zero-extend (signal-value btor38) (bitvector 1))
             btor38))
           (btor1340
            (bv->signal
             (zero-extend (signal-value btor41) (bitvector 1))
             btor41))
           (btor1341
            (bv->signal
             (zero-extend (signal-value btor42) (bitvector 1))
             btor42))
           (btor1342
            (bv->signal
             (zero-extend (signal-value btor43) (bitvector 1))
             btor43))
           (btor1343
            (bv->signal
             (zero-extend (signal-value btor44) (bitvector 1))
             btor44))
           (btor1344
            (bv->signal
             (zero-extend (signal-value btor99) (bitvector 1))
             btor99))
           (btor1345
            (bv->signal
             (zero-extend (signal-value btor982) (bitvector 4))
             btor982))
           (btor1346
            (bv->signal
             (zero-extend (signal-value btor900) (bitvector 4))
             btor900))
           (btor1347
            (bv->signal
             (zero-extend (signal-value btor327) (bitvector 1))
             btor327))
           (btor1348
            (bv->signal
             (zero-extend (signal-value btor46) (bitvector 32))
             btor46))
           (btor1349
            (bv->signal
             (zero-extend (signal-value btor328) (bitvector 48))
             btor328))
           (btor1350
            (bv->signal
             (zero-extend (signal-value btor24) (bitvector 48))
             btor24))
           (btor1351
            (bv->signal
             (zero-extend (signal-value btor326) (bitvector 48))
             btor326))
           (btor1352
            (bv->signal
             (zero-extend (signal-value btor457) (bitvector 1))
             btor457))
           (btor1353
            (bv->signal
             (zero-extend (signal-value btor487) (bitvector 1))
             btor487))
           (btor1354
            (bv->signal
             (zero-extend (signal-value btor49) (bitvector 32))
             btor49))
           (btor1355
            (bv->signal
             (zero-extend (signal-value btor488) (bitvector 27))
             btor488))
           (btor1356
            (bv->signal
             (zero-extend (signal-value btor490) (bitvector 27))
             btor490))
           (btor1357
            (bv->signal
             (zero-extend (signal-value btor456) (bitvector 27))
             btor456))
           (btor1358
            (bv->signal
             (zero-extend (signal-value btor48) (bitvector 27))
             btor48))
           (btor1359
            (bv->signal
             (zero-extend (signal-value btor436) (bitvector 1))
             btor436))
           (btor1360
            (bv->signal
             (zero-extend (signal-value btor51) (bitvector 32))
             btor51))
           (btor1361
            (bv->signal
             (zero-extend (signal-value btor430) (bitvector 5))
             btor430))
           (btor1362
            (bv->signal
             (zero-extend (signal-value btor437) (bitvector 5))
             btor437))
           (btor1363
            (bv->signal
             (zero-extend (signal-value btor435) (bitvector 5))
             btor435))
           (btor1364
            (bv->signal
             (zero-extend (signal-value btor52) (bitvector 4))
             btor52))
           (btor1365
            (bv->signal
             (zero-extend (signal-value btor53) (bitvector 1))
             btor53))
           (btor1366
            (bv->signal
             (zero-extend (signal-value btor54) (bitvector 1))
             btor54))
           (btor1367
            (bv->signal
             (zero-extend (signal-value btor55) (bitvector 5))
             btor55))
           (btor1368
            (bv->signal
             (zero-extend (signal-value btor57) (bitvector 9))
             btor57))
           (btor1369
            (bv->signal
             (zero-extend (signal-value btor58) (bitvector 1))
             btor58))
           (btor1370
            (bv->signal
             (zero-extend (signal-value btor59) (bitvector 1))
             btor59))
           (btor1371
            (bv->signal
             (zero-extend (signal-value btor60) (bitvector 1))
             btor60))
           (btor1372
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 1))
             btor61))
           (btor1373
            (bv->signal
             (zero-extend (signal-value btor62) (bitvector 1))
             btor62))
           (btor1374
            (bv->signal
             (zero-extend (signal-value btor63) (bitvector 1))
             btor63))
           (btor1375
            (bv->signal
             (zero-extend (signal-value btor64) (bitvector 1))
             btor64))
           (btor1376
            (bv->signal
             (zero-extend (signal-value btor65) (bitvector 1))
             btor65))
           (btor1377
            (bv->signal
             (zero-extend (signal-value btor66) (bitvector 1))
             btor66))
           (btor1378
            (bv->signal
             (zero-extend (signal-value btor67) (bitvector 1))
             btor67))
           (btor1379
            (bv->signal
             (zero-extend (signal-value btor68) (bitvector 48))
             btor68))
           (btor1380
            (bv->signal
             (zero-extend (signal-value btor690) (bitvector 1))
             btor690))
           (btor1381
            (bv->signal
             (zero-extend (signal-value btor69) (bitvector 32))
             btor69))
           (btor1382
            (bv->signal
             (zero-extend (signal-value btor70) (bitvector 1))
             btor70))
           (btor1383
            (bv->signal
             (zero-extend (signal-value btor985) (bitvector 1))
             btor985))
           (btor1384
            (bv->signal
             (zero-extend (signal-value btor989) (bitvector 1))
             btor989))
           (btor1385
            (bv->signal
             (zero-extend (signal-value btor317) (bitvector 1))
             btor317))
           (btor1386
            (bv->signal
             (zero-extend (signal-value btor72) (bitvector 32))
             btor72))
           (btor1387
            (bv->signal
             (zero-extend (signal-value btor311) (bitvector 9))
             btor311))
           (btor1388
            (bv->signal
             (zero-extend (signal-value btor318) (bitvector 9))
             btor318))
           (btor1389
            (bv->signal
             (zero-extend (signal-value btor316) (bitvector 9))
             btor316))
           (btor1390
            (bv->signal
             (zero-extend (signal-value btor73) (bitvector 48))
             btor73))
           (btor1391
            (bv->signal
             (zero-extend (signal-value btor74) (bitvector 48))
             btor74))
           (btor1392
            (bv->signal
             (zero-extend (signal-value btor448) (bitvector 1))
             btor448))
           (btor1393
            (bv->signal
             (zero-extend (signal-value btor445) (bitvector 8))
             btor445))
           (btor1394
            (bv->signal
             (zero-extend (signal-value btor513) (bitvector 27))
             btor513))
           (btor1395
            (bv->signal
             (zero-extend (signal-value btor953) (bitvector 1))
             btor953))
           (btor1396
            (bv->signal
             (zero-extend (signal-value btor76) (bitvector 32))
             btor76))
           (btor1397
            (bv->signal
             (zero-extend (signal-value btor904) (bitvector 1))
             btor904))
           (btor1398
            (bv->signal
             (zero-extend (signal-value btor336) (bitvector 48))
             btor336))
           (btor1399
            (bv->signal
             (zero-extend (signal-value btor77) (bitvector 48))
             btor77))
           (btor1400
            (signal
             (bvxor (signal-value btor79) (signal-value btor58))
             (list)))
           (btor1401
            (bv->signal
             (zero-extend (signal-value btor1400) (bitvector 1))
             btor1400))
           (btor1402
            (signal
             (bvxor (signal-value btor80) (signal-value btor59))
             (list)))
           (btor1403
            (bv->signal
             (zero-extend (signal-value btor1402) (bitvector 1))
             btor1402))
           (btor1404
            (signal
             (bvxor (signal-value btor78) (signal-value btor60))
             (list)))
           (btor1405
            (bv->signal
             (zero-extend (signal-value btor1404) (bitvector 1))
             btor1404))
           (btor1406
            (signal
             (bvxor (signal-value btor81) (signal-value btor61))
             (list)))
           (btor1407
            (bv->signal
             (zero-extend (signal-value btor1406) (bitvector 1))
             btor1406))
           (btor1408
            (signal
             (bvxor (signal-value btor83) (signal-value btor62))
             (list)))
           (btor1409
            (bv->signal
             (zero-extend (signal-value btor1408) (bitvector 1))
             btor1408))
           (btor1410
            (signal
             (bvxor (signal-value btor82) (signal-value btor63))
             (list)))
           (btor1411
            (bv->signal
             (zero-extend (signal-value btor1410) (bitvector 1))
             btor1410))
           (btor1412
            (signal
             (bvxor (signal-value btor84) (signal-value btor64))
             (list)))
           (btor1413
            (bv->signal
             (zero-extend (signal-value btor1412) (bitvector 1))
             btor1412))
           (btor1414
            (signal
             (bvxor (signal-value btor85) (signal-value btor65))
             (list)))
           (btor1415
            (bv->signal
             (zero-extend (signal-value btor1414) (bitvector 1))
             btor1414))
           (btor1416
            (signal
             (bvxor (signal-value btor86) (signal-value btor66))
             (list)))
           (btor1417
            (bv->signal
             (zero-extend (signal-value btor1416) (bitvector 1))
             btor1416))
           (btor1418
            (signal
             (bvxor (signal-value btor87) (signal-value btor67))
             (list)))
           (btor1419
            (bv->signal
             (zero-extend (signal-value btor1418) (bitvector 1))
             btor1418))
           (btor1420
            (bv->signal
             (zero-extend (signal-value btor1119) (bitvector 2))
             btor1119))
           (btor1421 (bitvector 112))
           (btor1422 (bitvector 107))
           (btor1423 (bv->signal (bv 0 (bitvector 107))))
           (btor1424
            (signal
             (concat (signal-value btor1423) (signal-value btor88))
             (list)))
           (btor1425
            (bv->signal
             (zero-extend (signal-value btor1424) (bitvector 112))
             btor1424))
           (btor1426
            (bv->signal
             (zero-extend (signal-value btor998) (bitvector 1))
             btor998))
           (btor1427
            (signal
             (concat (signal-value btor1297) (signal-value btor89))
             (list)))
           (btor1428
            (bv->signal
             (zero-extend (signal-value btor1427) (bitvector 56))
             btor1427))
           (btor1429
            (bv->signal
             (zero-extend (signal-value btor484) (bitvector 2))
             btor484))
           (btor1430 (bitvector 64))
           (btor1431 (bitvector 59))
           (btor1432 (bv->signal (bv 0 (bitvector 59))))
           (btor1433
            (signal
             (concat (signal-value btor1432) (signal-value btor90))
             (list)))
           (btor1434
            (bv->signal
             (zero-extend (signal-value btor1433) (bitvector 64))
             btor1433))
           (btor1435
            (bv->signal
             (zero-extend (signal-value btor1136) (bitvector 1))
             btor1136))
           (btor1436 (bitvector 72))
           (btor1437 (bitvector 67))
           (btor1438 (bv->signal (bv 0 (bitvector 67))))
           (btor1439
            (signal
             (concat (signal-value btor1438) (signal-value btor91))
             (list)))
           (btor1440
            (bv->signal
             (zero-extend (signal-value btor1439) (bitvector 72))
             btor1439))
           (btor1441
            (bv->signal
             (zero-extend (signal-value btor176) (bitvector 2))
             btor176))
           (btor1442 (bv->signal (bv 0 (bitvector 43))))
           (btor1443
            (signal
             (concat (signal-value btor1442) (signal-value btor92))
             (list)))
           (btor1444
            (bv->signal
             (zero-extend (signal-value btor1443) (bitvector 48))
             btor1443))
           (btor1445
            (bv->signal
             (zero-extend (signal-value btor1184) (bitvector 1))
             btor1184))
           (btor1446
            (signal
             (concat (signal-value btor1290) (signal-value btor93))
             (list)))
           (btor1447
            (bv->signal
             (zero-extend (signal-value btor1446) (bitvector 40))
             btor1446))
           (btor1448
            (bv->signal
             (zero-extend (signal-value btor691) (bitvector 45))
             btor691))
           (btor1449
            (bv->signal
             (zero-extend (signal-value btor694) (bitvector 45))
             btor694))
           (btor1450
            (bv->signal
             (zero-extend (signal-value btor689) (bitvector 45))
             btor689))
           (btor1451
            (signal
             (extract 0 0 (signal-value btor620))
             (signal-state btor620)))
           (btor1452
            (signal
             (concat (signal-value btor108) (signal-value btor1451))
             (list)))
           (btor1453
            (signal
             (extract 2 2 (signal-value btor620))
             (signal-state btor620)))
           (btor1454
            (signal
             (concat (signal-value btor1453) (signal-value btor1452))
             (list)))
           (btor1455
            (signal
             (concat (signal-value btor108) (signal-value btor1454))
             (list)))
           (btor1456
            (signal
             (extract 4 4 (signal-value btor620))
             (signal-state btor620)))
           (btor1457
            (signal
             (concat (signal-value btor1456) (signal-value btor1455))
             (list)))
           (btor1458
            (signal
             (concat (signal-value btor108) (signal-value btor1457))
             (list)))
           (btor1459
            (signal
             (extract 6 6 (signal-value btor620))
             (signal-state btor620)))
           (btor1460
            (signal
             (concat (signal-value btor1459) (signal-value btor1458))
             (list)))
           (btor1461
            (signal
             (concat (signal-value btor108) (signal-value btor1460))
             (list)))
           (btor1462
            (signal
             (extract 8 8 (signal-value btor620))
             (signal-state btor620)))
           (btor1463
            (signal
             (concat (signal-value btor1462) (signal-value btor1461))
             (list)))
           (btor1464
            (signal
             (concat (signal-value btor108) (signal-value btor1463))
             (list)))
           (btor1465
            (signal
             (extract 10 10 (signal-value btor620))
             (signal-state btor620)))
           (btor1466
            (signal
             (concat (signal-value btor1465) (signal-value btor1464))
             (list)))
           (btor1467
            (signal
             (concat (signal-value btor108) (signal-value btor1466))
             (list)))
           (btor1468
            (signal
             (extract 12 12 (signal-value btor620))
             (signal-state btor620)))
           (btor1469
            (signal
             (concat (signal-value btor1468) (signal-value btor1467))
             (list)))
           (btor1470
            (signal
             (concat (signal-value btor108) (signal-value btor1469))
             (list)))
           (btor1471
            (signal
             (extract 14 14 (signal-value btor620))
             (signal-state btor620)))
           (btor1472
            (signal
             (concat (signal-value btor1471) (signal-value btor1470))
             (list)))
           (btor1473
            (signal
             (concat (signal-value btor108) (signal-value btor1472))
             (list)))
           (btor1474
            (signal
             (extract 16 16 (signal-value btor620))
             (signal-state btor620)))
           (btor1475
            (signal
             (concat (signal-value btor1474) (signal-value btor1473))
             (list)))
           (btor1476
            (signal
             (concat (signal-value btor108) (signal-value btor1475))
             (list)))
           (btor1477
            (signal
             (extract 18 18 (signal-value btor620))
             (signal-state btor620)))
           (btor1478
            (signal
             (concat (signal-value btor1477) (signal-value btor1476))
             (list)))
           (btor1479
            (signal
             (concat (signal-value btor108) (signal-value btor1478))
             (list)))
           (btor1480
            (signal
             (extract 20 20 (signal-value btor620))
             (signal-state btor620)))
           (btor1481
            (signal
             (concat (signal-value btor1480) (signal-value btor1479))
             (list)))
           (btor1482
            (signal
             (concat (signal-value btor108) (signal-value btor1481))
             (list)))
           (btor1483
            (signal
             (extract 22 22 (signal-value btor620))
             (signal-state btor620)))
           (btor1484
            (signal
             (concat (signal-value btor1483) (signal-value btor1482))
             (list)))
           (btor1485
            (signal
             (concat (signal-value btor108) (signal-value btor1484))
             (list)))
           (btor1486
            (signal
             (extract 24 24 (signal-value btor620))
             (signal-state btor620)))
           (btor1487
            (signal
             (concat (signal-value btor1486) (signal-value btor1485))
             (list)))
           (btor1488
            (signal
             (concat (signal-value btor108) (signal-value btor1487))
             (list)))
           (btor1489
            (signal
             (extract 26 26 (signal-value btor620))
             (signal-state btor620)))
           (btor1490
            (signal
             (concat (signal-value btor1489) (signal-value btor1488))
             (list)))
           (btor1491
            (signal
             (concat (signal-value btor108) (signal-value btor1490))
             (list)))
           (btor1492
            (signal
             (extract 28 28 (signal-value btor620))
             (signal-state btor620)))
           (btor1493
            (signal
             (concat (signal-value btor1492) (signal-value btor1491))
             (list)))
           (btor1494
            (signal
             (concat (signal-value btor108) (signal-value btor1493))
             (list)))
           (btor1495
            (signal
             (extract 30 30 (signal-value btor620))
             (signal-state btor620)))
           (btor1496
            (signal
             (concat (signal-value btor1495) (signal-value btor1494))
             (list)))
           (btor1497
            (signal
             (concat (signal-value btor108) (signal-value btor1496))
             (list)))
           (btor1498
            (signal
             (extract 32 32 (signal-value btor620))
             (signal-state btor620)))
           (btor1499
            (signal
             (concat (signal-value btor1498) (signal-value btor1497))
             (list)))
           (btor1500
            (signal
             (concat (signal-value btor108) (signal-value btor1499))
             (list)))
           (btor1501
            (signal
             (extract 34 34 (signal-value btor620))
             (signal-state btor620)))
           (btor1502
            (signal
             (concat (signal-value btor1501) (signal-value btor1500))
             (list)))
           (btor1503
            (signal
             (concat (signal-value btor108) (signal-value btor1502))
             (list)))
           (btor1504
            (signal
             (extract 36 36 (signal-value btor620))
             (signal-state btor620)))
           (btor1505
            (signal
             (concat (signal-value btor1504) (signal-value btor1503))
             (list)))
           (btor1506
            (signal
             (concat (signal-value btor108) (signal-value btor1505))
             (list)))
           (btor1507
            (signal
             (extract 38 38 (signal-value btor620))
             (signal-state btor620)))
           (btor1508
            (signal
             (concat (signal-value btor1507) (signal-value btor1506))
             (list)))
           (btor1509
            (signal
             (concat (signal-value btor108) (signal-value btor1508))
             (list)))
           (btor1510
            (signal
             (extract 40 40 (signal-value btor620))
             (signal-state btor620)))
           (btor1511
            (signal
             (concat (signal-value btor1510) (signal-value btor1509))
             (list)))
           (btor1512
            (signal
             (concat (signal-value btor108) (signal-value btor1511))
             (list)))
           (btor1513
            (signal
             (extract 42 42 (signal-value btor620))
             (signal-state btor620)))
           (btor1514
            (signal
             (concat (signal-value btor1513) (signal-value btor1512))
             (list)))
           (btor1515
            (bv->signal
             (zero-extend (signal-value btor1514) (bitvector 43))
             btor1514))
           (btor1516
            (bv->signal
             (zero-extend (signal-value btor784) (bitvector 45))
             btor784))
           (btor1517
            (bv->signal
             (zero-extend (signal-value btor785) (bitvector 45))
             btor785))
           (btor1518
            (bv->signal
             (zero-extend (signal-value btor783) (bitvector 45))
             btor783))
           (btor1519
            (bv->signal
             (zero-extend (signal-value btor779) (bitvector 45))
             btor779))
           (btor1520
            (bv->signal
             (zero-extend (signal-value btor1196) (bitvector 1))
             btor1196))
           (btor1521 (bitvector 88))
           (btor1522 (bitvector 83))
           (btor1523 (bv->signal (bv 0 (bitvector 83))))
           (btor1524
            (signal
             (concat (signal-value btor1523) (signal-value btor94))
             (list)))
           (btor1525
            (bv->signal
             (zero-extend (signal-value btor1524) (bitvector 88))
             btor1524))
           (btor1526
            (bv->signal
             (zero-extend (signal-value btor1234) (bitvector 8))
             btor1234))
           (btor1527
            (bv->signal
             (zero-extend (signal-value btor1239) (bitvector 8))
             btor1239))
           (btor1528 (bitvector 49))
           (btor1529
            (signal
             (concat (signal-value btor837) (signal-value btor931))
             (list)))
           (btor1530
            (bv->signal
             (zero-extend (signal-value btor1529) (bitvector 49))
             btor1529))
           (btor1531
            (bv->signal
             (zero-extend (signal-value btor525) (bitvector 27))
             btor525))
           (btor1532 (signal (bvnot (signal-value btor1288)) (list)))
           (btor1533
            (signal
             (bvor (signal-value btor1532) (signal-value btor44))
             (list)))
           (btor1534
            (bv->signal
             (zero-extend (signal-value btor1533) (bitvector 1))
             btor1533))
           (btor1535
            (bv->signal
             (zero-extend (signal-value btor563) (bitvector 18))
             btor563))
           (btor1536
            (bv->signal
             (zero-extend (signal-value btor910) (bitvector 1))
             btor910))
           (btor1537
            (bv->signal
             (zero-extend (signal-value btor43) (bitvector 1))
             btor43))
           (btor1538
            (bv->signal
             (zero-extend (signal-value btor931) (bitvector 1))
             btor931))
           (btor1539
            (bv->signal
             (zero-extend (signal-value btor928) (bitvector 1))
             btor928))
           (btor1540
            (bv->signal
             (zero-extend (signal-value btor802) (bitvector 48))
             btor802))
           (btor1541
            (bv->signal
             (zero-extend (signal-value btor859) (bitvector 1))
             btor859))
           (btor1542
            (bv->signal
             (zero-extend (signal-value btor851) (bitvector 1))
             btor851))
           (btor1543
            (bv->signal
             (zero-extend (signal-value btor839) (bitvector 1))
             btor839))
           (btor1544
            (bv->signal
             (zero-extend (signal-value btor806) (bitvector 48))
             btor806))
           (btor1545
            (signal
             (extract 10 0 (signal-value btor806))
             (signal-state btor806)))
           (btor1546
            (signal
             (concat (signal-value btor808) (signal-value btor1545))
             (list)))
           (btor1547
            (signal
             (extract 22 12 (signal-value btor806))
             (signal-state btor806)))
           (btor1548
            (signal
             (concat (signal-value btor1547) (signal-value btor1546))
             (list)))
           (btor1549
            (signal
             (concat (signal-value btor810) (signal-value btor1548))
             (list)))
           (btor1550
            (signal
             (extract 34 24 (signal-value btor806))
             (signal-state btor806)))
           (btor1551
            (signal
             (concat (signal-value btor1550) (signal-value btor1549))
             (list)))
           (btor1552
            (signal
             (concat (signal-value btor812) (signal-value btor1551))
             (list)))
           (btor1553
            (signal
             (extract 47 36 (signal-value btor806))
             (signal-state btor806)))
           (btor1554
            (signal
             (concat (signal-value btor1553) (signal-value btor1552))
             (list)))
           (btor1555
            (bv->signal
             (zero-extend (signal-value btor1554) (bitvector 48))
             btor1554))
           (btor1556
            (bv->signal
             (zero-extend (signal-value btor837) (bitvector 48))
             btor837))
           (btor1557
            (bv->signal
             (zero-extend (signal-value btor958) (bitvector 1))
             btor958))
           (btor1558
            (bv->signal
             (zero-extend (signal-value btor971) (bitvector 1))
             btor971))
           (btor1559
            (bv->signal
             (zero-extend (signal-value btor977) (bitvector 1))
             btor977))
           (btor1560
            (bv->signal
             (zero-extend (signal-value btor951) (bitvector 1))
             btor951))
           (btor1561
            (bv->signal
             (zero-extend (signal-value btor985) (bitvector 1))
             btor985))
           (btor1562
            (bv->signal
             (zero-extend (signal-value btor965) (bitvector 1))
             btor965))
           (btor1563
            (bv->signal
             (zero-extend (signal-value btor972) (bitvector 1))
             btor972))
           (btor1564
            (bv->signal
             (zero-extend (signal-value btor978) (bitvector 1))
             btor978))
           (btor1565
            (bv->signal
             (zero-extend (signal-value btor951) (bitvector 1))
             btor951))
           (btor1566
            (if (bitvector->bool (signal-value btor43)) btor910 btor914))
           (btor1567
            (bv->signal
             (zero-extend (signal-value btor1566) (bitvector 1))
             btor1566))
           (btor1568
            (if (bitvector->bool (signal-value btor1400)) btor108 btor1566))
           (btor1569
            (bv->signal
             (zero-extend (signal-value btor1568) (bitvector 1))
             btor1568))
           (btor1570
            (bv->signal
             (zero-extend (signal-value btor939) (bitvector 1))
             btor939))
           (btor1571
            (bv->signal
             (zero-extend (signal-value btor943) (bitvector 1))
             btor943))
           (btor1572
            (bv->signal
             (zero-extend (signal-value btor947) (bitvector 1))
             btor947))
           (btor1573
            (bv->signal
             (zero-extend (signal-value btor620) (bitvector 45))
             btor620))
           (btor1574
            (bv->signal
             (zero-extend (signal-value btor964) (bitvector 1))
             btor964))
           (btor1575
            (bv->signal
             (zero-extend (signal-value btor915) (bitvector 1))
             btor915))
           (btor1576
            (bv->signal
             (zero-extend (signal-value btor100) (bitvector 1))
             btor100))
           (btor1577
            (bv->signal
             (zero-extend (signal-value btor1159) (bitvector 1))
             btor1159))
           (btor1578
            (bv->signal
             (zero-extend (signal-value btor1139) (bitvector 1))
             btor1139))
           (btor1579
            (bv->signal
             (zero-extend (signal-value btor1144) (bitvector 1))
             btor1144))
           (btor1580
            (bv->signal
             (zero-extend (signal-value btor1143) (bitvector 1))
             btor1143))
           (btor1581
            (bv->signal
             (zero-extend (signal-value btor1158) (bitvector 1))
             btor1158))
           (btor1582
            (bv->signal
             (zero-extend (signal-value btor1147) (bitvector 1))
             btor1147))
           (btor1583
            (bv->signal
             (zero-extend (signal-value btor1152) (bitvector 1))
             btor1152))
           (btor1584
            (bv->signal
             (zero-extend (signal-value btor1151) (bitvector 1))
             btor1151))
           (btor1585
            (bv->signal
             (zero-extend (signal-value btor1171) (bitvector 1))
             btor1171))
           (btor1586 (bv->signal (bv 5864062014805 (bitvector 44))))
           (btor1587
            (bv->signal
             (zero-extend (signal-value btor1586) (bitvector 44))
             btor1586))
           (btor1588 (bv->signal (bv 11728124029610 (bitvector 44))))
           (btor1589
            (bv->signal
             (zero-extend (signal-value btor1588) (bitvector 44))
             btor1588))
           (btor1590
            (bv->signal
             (zero-extend (signal-value btor914) (bitvector 1))
             btor914))
           (btor1591
            (bv->signal
             (zero-extend (signal-value btor1400) (bitvector 1))
             btor1400))
           (btor1592
            (bv->signal
             (zero-extend (signal-value btor797) (bitvector 48))
             btor797))
           (btor1593
            (bv->signal
             (zero-extend (signal-value btor937) (bitvector 13))
             btor937))
           (btor1594
            (bv->signal
             (zero-extend (signal-value btor941) (bitvector 13))
             btor941))
           (btor1595
            (bv->signal
             (zero-extend (signal-value btor945) (bitvector 13))
             btor945))
           (btor1596
            (bv->signal
             (zero-extend (signal-value btor949) (bitvector 14))
             btor949))
           (btor1597
            (bv->signal
             (zero-extend (signal-value btor804) (bitvector 48))
             btor804))
           (btor1598
            (bv->signal
             (zero-extend (signal-value btor844) (bitvector 48))
             btor844))
           (btor1599
            (signal
             (bvand (signal-value btor1533) (signal-value btor1159))
             (list)))
           (btor1600
            (signal
             (bvand (signal-value btor1599) (signal-value btor1145))
             (list)))
           (btor1601
            (signal
             (bool->bitvector
              (bveq (signal-value btor1276) (signal-value btor165)))
             (list)))
           (btor1602
            (if (bitvector->bool (signal-value btor1601)) btor1600 btor108))
           (btor1603
            (signal
             (bvand (signal-value btor1533) (signal-value btor1144))
             (list)))
           (btor1604
            (bv->signal
             (zero-extend (signal-value btor100) (bitvector 2))
             btor100))
           (btor1605
            (signal
             (bool->bitvector
              (bveq (signal-value btor1276) (signal-value btor1604)))
             (list)))
           (btor1606
            (if (bitvector->bool (signal-value btor1605)) btor1603 btor1602))
           (btor1607
            (bv->signal
             (zero-extend (signal-value btor1606) (bitvector 1))
             btor1606))
           (btor1608
            (bv->signal
             (zero-extend (signal-value btor1137) (bitvector 48))
             btor1137))
           (btor1609
            (bv->signal
             (zero-extend (signal-value btor999) (bitvector 48))
             btor999))
           (btor1610
            (bv->signal
             (zero-extend (signal-value btor1172) (bitvector 1))
             btor1172))
           (btor1611
            (bv->signal
             (zero-extend (signal-value btor833) (bitvector 48))
             btor833))
           (btor1612
            (bv->signal
             (zero-extend (signal-value btor424) (bitvector 2))
             btor424))
           (btor1613
            (bv->signal
             (zero-extend (signal-value btor710) (bitvector 48))
             btor710))
           (btor1614
            (bv->signal
             (zero-extend (signal-value btor1185) (bitvector 1))
             btor1185))
           (btor1615
            (bv->signal
             (zero-extend (signal-value btor1188) (bitvector 1))
             btor1188))
           (btor1616
            (bv->signal
             (zero-extend (signal-value btor1200) (bitvector 1))
             btor1200))
           (btor1617
            (bv->signal
             (zero-extend (signal-value btor1203) (bitvector 1))
             btor1203))
           (btor1618
            (bv->signal
             (zero-extend (signal-value btor1210) (bitvector 1))
             btor1210))
           (btor1619
            (bv->signal
             (zero-extend (signal-value btor1213) (bitvector 1))
             btor1213))
           (btor1620
            (bv->signal
             (zero-extend (signal-value btor1217) (bitvector 1))
             btor1217))
           (btor1621
            (bv->signal
             (zero-extend (signal-value btor1220) (bitvector 1))
             btor1220))
           (btor1622
            (bv->signal
             (zero-extend (signal-value btor1189) (bitvector 1))
             btor1189))
           (btor1623
            (bv->signal
             (zero-extend (signal-value btor1204) (bitvector 1))
             btor1204))
           (btor1624
            (bv->signal
             (zero-extend (signal-value btor1214) (bitvector 1))
             btor1214))
           (btor1625
            (bv->signal
             (zero-extend (signal-value btor1221) (bitvector 1))
             btor1221))
           (btor1626
            (bv->signal
             (zero-extend (signal-value btor1205) (bitvector 1))
             btor1205))
           (btor1627
            (bv->signal
             (zero-extend (signal-value btor1222) (bitvector 1))
             btor1222))
           (btor1628
            (bv->signal
             (zero-extend (signal-value btor1223) (bitvector 1))
             btor1223))
           (btor1629
            (bv->signal
             (zero-extend (signal-value btor796) (bitvector 48))
             btor796))
           (btor1630
            (bv->signal
             (zero-extend (signal-value btor422) (bitvector 48))
             btor422))
           (btor1631
            (bv->signal
             (zero-extend (signal-value btor421) (bitvector 48))
             btor421))
           (btor1633
            (if (bitvector->bool (signal-value btor32)) btor117 btor107))
           (btor1634
            (signal
             (apply bvor (bitvector->bits (signal-value btor122)))
             (signal-state btor122)))
           (btor1635 (signal (bvnot (signal-value btor1634)) (list)))
           (btor1636
            (signal
             (bvor (signal-value btor1404) (signal-value btor1635))
             (list)))
           (btor1637
            (if (bitvector->bool (signal-value btor1636)) btor96 btor1633))
           (btor1641
            (signal
             (bool->bitvector
              (bveq (signal-value btor122) (signal-value btor165)))
             (list)))
           (btor1642
            (if (bitvector->bool (signal-value btor1641)) btor107 btor117))
           (btor1643
            (if (bitvector->bool (signal-value btor33)) btor1642 btor121))
           (btor1644
            (if (bitvector->bool (signal-value btor1636)) btor96 btor1643))
           (btor1647
            (if (bitvector->bool (signal-value btor36)) btor140 btor133))
           (btor1648
            (signal
             (apply bvor (bitvector->bits (signal-value btor145)))
             (signal-state btor145)))
           (btor1649 (signal (bvnot (signal-value btor1648)) (list)))
           (btor1650
            (signal
             (bvor (signal-value btor1406) (signal-value btor1649))
             (list)))
           (btor1651
            (if (bitvector->bool (signal-value btor1650)) btor130 btor1647))
           (btor1654
            (signal
             (bool->bitvector
              (bveq (signal-value btor145) (signal-value btor165)))
             (list)))
           (btor1655
            (if (bitvector->bool (signal-value btor1654)) btor133 btor140))
           (btor1656
            (if (bitvector->bool (signal-value btor37)) btor1655 btor144))
           (btor1657
            (if (bitvector->bool (signal-value btor1406)) btor130 btor1656))
           (btor1660
            (if (bitvector->bool (signal-value btor35)) btor152 btor157))
           (btor1661
            (if (bitvector->bool (signal-value btor1402)) btor154 btor1660))
           (btor1664
            (if (bitvector->bool (signal-value btor40)) btor311 btor316))
           (btor1665
            (if (bitvector->bool (signal-value btor1408)) btor313 btor1664))
           (btor1668
            (if (bitvector->bool (signal-value btor38)) btor24 btor326))
           (btor1669 (signal (bvnot (signal-value btor327)) (list)))
           (btor1670
            (signal
             (bvor (signal-value btor1410) (signal-value btor1669))
             (list)))
           (btor1671
            (if (bitvector->bool (signal-value btor1670)) btor310 btor1668))
           (btor1674
            (signal
             (bvand (signal-value btor44) (signal-value btor953))
             (list)))
           (btor1675
            (if (bitvector->bool (signal-value btor1674)) btor1102 btor336))
           (btor1676
            (signal
             (bvor (signal-value btor1418) (signal-value btor1606))
             (list)))
           (btor1677
            (if (bitvector->bool (signal-value btor1676)) btor310 btor1675))
           (btor1680
            (if (bitvector->bool (signal-value btor42)) btor430 btor435))
           (btor1681 (signal (bvnot (signal-value btor436)) (list)))
           (btor1682
            (signal
             (bvor (signal-value btor1414) (signal-value btor1681))
             (list)))
           (btor1683
            (if (bitvector->bool (signal-value btor1682)) btor432 btor1680))
           (btor1686
            (if (bitvector->bool (signal-value btor41)) btor48 btor456))
           (btor1687 (signal (bvnot (signal-value btor487)) (list)))
           (btor1688
            (signal
             (bvor (signal-value btor1412) (signal-value btor1687))
             (list)))
           (btor1689
            (if (bitvector->bool (signal-value btor1688)) btor440 btor1686))
           (btor1692
            (if (bitvector->bool (signal-value btor34)) btor517 btor521))
           (btor1693
            (if (bitvector->bool (signal-value btor1412)) btor440 btor1692))
           (btor1696
            (if (bitvector->bool (signal-value btor43)) btor685 btor689))
           (btor1697 (signal (bvnot (signal-value btor690)) (list)))
           (btor1698
            (signal
             (bvor (signal-value btor1416) (signal-value btor1697))
             (list)))
           (btor1699
            (if (bitvector->bool (signal-value btor1698)) btor619 btor1696))
           (btor1702
            (if (bitvector->bool (signal-value btor43)) btor779 btor783))
           (btor1703
            (if (bitvector->bool (signal-value btor1698)) btor619 btor1702))
           (btor1706
            (if (bitvector->bool (signal-value btor39)) btor866 btor870))
           (btor1707
            (if (bitvector->bool (signal-value btor1400)) btor108 btor1706))
           (btor1710
            (if (bitvector->bool (signal-value btor40)) btor30 btor878))
           (btor1711
            (if (bitvector->bool (signal-value btor1408)) btor444 btor1710))
           (btor1714
            (if (bitvector->bool (signal-value btor1674)) btor162 btor896))
           (btor1715
            (if (bitvector->bool (signal-value btor1676)) btor108 btor1714))
           (btor1718
            (if (bitvector->bool (signal-value btor1674)) btor982 btor900))
           (btor1719
            (if (bitvector->bool (signal-value btor1676)) btor154 btor1718))
           (btor1724
            (if (bitvector->bool (signal-value btor1674)) btor985 btor989))
           (btor1725
            (if (bitvector->bool (signal-value btor1676)) btor108 btor1724))
           (btor1728
            (if (bitvector->bool (signal-value btor1674)) btor1139 btor1143))
           (btor1729
            (if (bitvector->bool (signal-value btor1676)) btor108 btor1728))
           (btor1732
            (if (bitvector->bool (signal-value btor1674)) btor1147 btor1151))
           (btor1733
            (if (bitvector->bool (signal-value btor1676)) btor108 btor1732))
           (btor1736
            (if (bitvector->bool (signal-value btor1674)) btor1143 btor1158))
           (btor1737
            (if (bitvector->bool (signal-value btor1676)) btor108 btor1736))
           (btor1740
            (if (bitvector->bool (signal-value btor1674)) btor1151 btor1171))
           (btor1741
            (if (bitvector->bool (signal-value btor1676)) btor108 btor1740))
           (btor1744
            (if (bitvector->bool (signal-value btor1674)) btor1234 btor1239))
           (btor1745
            (if (bitvector->bool (signal-value btor1676)) btor1236 btor1744))
           (output-state
            (remove-duplicates
             (append
              (append
               (list
                (cons
                 (string->symbol (string-append name "state1237"))
                 (cons
                  (signal-value btor1745)
                  (if (assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1237")))
                    (add1
                     (cdr
                      (assoc-ref
                       merged-input-state-hash
                       (string->symbol (string-append name "state1237")))))
                    0))))
               (append
                (list
                 (cons
                  (string->symbol (string-append name "state1235"))
                  (cons
                   (signal-value btor1239)
                   (if (assoc-has-key?
                        merged-input-state-hash
                        (string->symbol (string-append name "state1235")))
                     (add1
                      (cdr
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1235")))))
                     0))))
                (append
                 (list
                  (cons
                   (string->symbol (string-append name "state1169"))
                   (cons
                    (signal-value btor1741)
                    (if (assoc-has-key?
                         merged-input-state-hash
                         (string->symbol (string-append name "state1169")))
                      (add1
                       (cdr
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1169")))))
                      0))))
                 (append
                  (list
                   (cons
                    (string->symbol (string-append name "state1168"))
                    (cons
                     (signal-value btor1171)
                     (if (assoc-has-key?
                          merged-input-state-hash
                          (string->symbol (string-append name "state1168")))
                       (add1
                        (cdr
                         (assoc-ref
                          merged-input-state-hash
                          (string->symbol (string-append name "state1168")))))
                       0))))
                  (append
                   (list
                    (cons
                     (string->symbol (string-append name "state1156"))
                     (cons
                      (signal-value btor1737)
                      (if (assoc-has-key?
                           merged-input-state-hash
                           (string->symbol (string-append name "state1156")))
                        (add1
                         (cdr
                          (assoc-ref
                           merged-input-state-hash
                           (string->symbol (string-append name "state1156")))))
                        0))))
                   (append
                    (list
                     (cons
                      (string->symbol (string-append name "state1155"))
                      (cons
                       (signal-value btor1158)
                       (if (assoc-has-key?
                            merged-input-state-hash
                            (string->symbol (string-append name "state1155")))
                         (add1
                          (cdr
                           (assoc-ref
                            merged-input-state-hash
                            (string->symbol
                             (string-append name "state1155")))))
                         0))))
                    (append
                     (list
                      (cons
                       (string->symbol (string-append name "state1149"))
                       (cons
                        (signal-value btor1733)
                        (if (assoc-has-key?
                             merged-input-state-hash
                             (string->symbol (string-append name "state1149")))
                          (add1
                           (cdr
                            (assoc-ref
                             merged-input-state-hash
                             (string->symbol
                              (string-append name "state1149")))))
                          0))))
                     (append
                      (list
                       (cons
                        (string->symbol (string-append name "state1148"))
                        (cons
                         (signal-value btor1151)
                         (if (assoc-has-key?
                              merged-input-state-hash
                              (string->symbol
                               (string-append name "state1148")))
                           (add1
                            (cdr
                             (assoc-ref
                              merged-input-state-hash
                              (string->symbol
                               (string-append name "state1148")))))
                           0))))
                      (append
                       (list
                        (cons
                         (string->symbol (string-append name "state1141"))
                         (cons
                          (signal-value btor1729)
                          (if (assoc-has-key?
                               merged-input-state-hash
                               (string->symbol
                                (string-append name "state1141")))
                            (add1
                             (cdr
                              (assoc-ref
                               merged-input-state-hash
                               (string->symbol
                                (string-append name "state1141")))))
                            0))))
                       (append
                        (list
                         (cons
                          (string->symbol (string-append name "state1140"))
                          (cons
                           (signal-value btor1143)
                           (if (assoc-has-key?
                                merged-input-state-hash
                                (string->symbol
                                 (string-append name "state1140")))
                             (add1
                              (cdr
                               (assoc-ref
                                merged-input-state-hash
                                (string->symbol
                                 (string-append name "state1140")))))
                             0))))
                        (append
                         (list
                          (cons
                           (string->symbol (string-append name "state987"))
                           (cons
                            (signal-value btor1725)
                            (if (assoc-has-key?
                                 merged-input-state-hash
                                 (string->symbol
                                  (string-append name "state987")))
                              (add1
                               (cdr
                                (assoc-ref
                                 merged-input-state-hash
                                 (string->symbol
                                  (string-append name "state987")))))
                              0))))
                         (append
                          (list
                           (cons
                            (string->symbol (string-append name "state986"))
                            (cons
                             (signal-value btor989)
                             (if (assoc-has-key?
                                  merged-input-state-hash
                                  (string->symbol
                                   (string-append name "state986")))
                               (add1
                                (cdr
                                 (assoc-ref
                                  merged-input-state-hash
                                  (string->symbol
                                   (string-append name "state986")))))
                               0))))
                          (append
                           (list
                            (cons
                             (string->symbol (string-append name "state912"))
                             (cons
                              (signal-value btor1568)
                              (if (assoc-has-key?
                                   merged-input-state-hash
                                   (string->symbol
                                    (string-append name "state912")))
                                (add1
                                 (cdr
                                  (assoc-ref
                                   merged-input-state-hash
                                   (string->symbol
                                    (string-append name "state912")))))
                                0))))
                           (append
                            (list
                             (cons
                              (string->symbol (string-append name "state911"))
                              (cons
                               (signal-value btor914)
                               (if (assoc-has-key?
                                    merged-input-state-hash
                                    (string->symbol
                                     (string-append name "state911")))
                                 (add1
                                  (cdr
                                   (assoc-ref
                                    merged-input-state-hash
                                    (string->symbol
                                     (string-append name "state911")))))
                                 0))))
                            (append
                             (list
                              (cons
                               (string->symbol (string-append name "state898"))
                               (cons
                                (signal-value btor1719)
                                (if (assoc-has-key?
                                     merged-input-state-hash
                                     (string->symbol
                                      (string-append name "state898")))
                                  (add1
                                   (cdr
                                    (assoc-ref
                                     merged-input-state-hash
                                     (string->symbol
                                      (string-append name "state898")))))
                                  0))))
                             (append
                              (list
                               (cons
                                (string->symbol
                                 (string-append name "state897"))
                                (cons
                                 (signal-value btor900)
                                 (if (assoc-has-key?
                                      merged-input-state-hash
                                      (string->symbol
                                       (string-append name "state897")))
                                   (add1
                                    (cdr
                                     (assoc-ref
                                      merged-input-state-hash
                                      (string->symbol
                                       (string-append name "state897")))))
                                   0))))
                              (append
                               (list
                                (cons
                                 (string->symbol
                                  (string-append name "state894"))
                                 (cons
                                  (signal-value btor1715)
                                  (if (assoc-has-key?
                                       merged-input-state-hash
                                       (string->symbol
                                        (string-append name "state894")))
                                    (add1
                                     (cdr
                                      (assoc-ref
                                       merged-input-state-hash
                                       (string->symbol
                                        (string-append name "state894")))))
                                    0))))
                               (append
                                (list
                                 (cons
                                  (string->symbol
                                   (string-append name "state893"))
                                  (cons
                                   (signal-value btor896)
                                   (if (assoc-has-key?
                                        merged-input-state-hash
                                        (string->symbol
                                         (string-append name "state893")))
                                     (add1
                                      (cdr
                                       (assoc-ref
                                        merged-input-state-hash
                                        (string->symbol
                                         (string-append name "state893")))))
                                     0))))
                                (append
                                 (list
                                  (cons
                                   (string->symbol
                                    (string-append name "state876"))
                                   (cons
                                    (signal-value btor1711)
                                    (if (assoc-has-key?
                                         merged-input-state-hash
                                         (string->symbol
                                          (string-append name "state876")))
                                      (add1
                                       (cdr
                                        (assoc-ref
                                         merged-input-state-hash
                                         (string->symbol
                                          (string-append name "state876")))))
                                      0))))
                                 (append
                                  (list
                                   (cons
                                    (string->symbol
                                     (string-append name "state875"))
                                    (cons
                                     (signal-value btor878)
                                     (if (assoc-has-key?
                                          merged-input-state-hash
                                          (string->symbol
                                           (string-append name "state875")))
                                       (add1
                                        (cdr
                                         (assoc-ref
                                          merged-input-state-hash
                                          (string->symbol
                                           (string-append name "state875")))))
                                       0))))
                                  (append
                                   (list
                                    (cons
                                     (string->symbol
                                      (string-append name "state868"))
                                     (cons
                                      (signal-value btor1707)
                                      (if (assoc-has-key?
                                           merged-input-state-hash
                                           (string->symbol
                                            (string-append name "state868")))
                                        (add1
                                         (cdr
                                          (assoc-ref
                                           merged-input-state-hash
                                           (string->symbol
                                            (string-append name "state868")))))
                                        0))))
                                   (append
                                    (list
                                     (cons
                                      (string->symbol
                                       (string-append name "state867"))
                                      (cons
                                       (signal-value btor870)
                                       (if (assoc-has-key?
                                            merged-input-state-hash
                                            (string->symbol
                                             (string-append name "state867")))
                                         (add1
                                          (cdr
                                           (assoc-ref
                                            merged-input-state-hash
                                            (string->symbol
                                             (string-append
                                              name
                                              "state867")))))
                                         0))))
                                    (append
                                     (list
                                      (cons
                                       (string->symbol
                                        (string-append name "state781"))
                                       (cons
                                        (signal-value btor1703)
                                        (if (assoc-has-key?
                                             merged-input-state-hash
                                             (string->symbol
                                              (string-append name "state781")))
                                          (add1
                                           (cdr
                                            (assoc-ref
                                             merged-input-state-hash
                                             (string->symbol
                                              (string-append
                                               name
                                               "state781")))))
                                          0))))
                                     (append
                                      (list
                                       (cons
                                        (string->symbol
                                         (string-append name "state780"))
                                        (cons
                                         (signal-value btor783)
                                         (if (assoc-has-key?
                                              merged-input-state-hash
                                              (string->symbol
                                               (string-append
                                                name
                                                "state780")))
                                           (add1
                                            (cdr
                                             (assoc-ref
                                              merged-input-state-hash
                                              (string->symbol
                                               (string-append
                                                name
                                                "state780")))))
                                           0))))
                                      (append
                                       (list
                                        (cons
                                         (string->symbol
                                          (string-append name "state687"))
                                         (cons
                                          (signal-value btor1699)
                                          (if (assoc-has-key?
                                               merged-input-state-hash
                                               (string->symbol
                                                (string-append
                                                 name
                                                 "state687")))
                                            (add1
                                             (cdr
                                              (assoc-ref
                                               merged-input-state-hash
                                               (string->symbol
                                                (string-append
                                                 name
                                                 "state687")))))
                                            0))))
                                       (append
                                        (list
                                         (cons
                                          (string->symbol
                                           (string-append name "state686"))
                                          (cons
                                           (signal-value btor689)
                                           (if (assoc-has-key?
                                                merged-input-state-hash
                                                (string->symbol
                                                 (string-append
                                                  name
                                                  "state686")))
                                             (add1
                                              (cdr
                                               (assoc-ref
                                                merged-input-state-hash
                                                (string->symbol
                                                 (string-append
                                                  name
                                                  "state686")))))
                                             0))))
                                        (append
                                         (list
                                          (cons
                                           (string->symbol
                                            (string-append name "state519"))
                                           (cons
                                            (signal-value btor1693)
                                            (if (assoc-has-key?
                                                 merged-input-state-hash
                                                 (string->symbol
                                                  (string-append
                                                   name
                                                   "state519")))
                                              (add1
                                               (cdr
                                                (assoc-ref
                                                 merged-input-state-hash
                                                 (string->symbol
                                                  (string-append
                                                   name
                                                   "state519")))))
                                              0))))
                                         (append
                                          (list
                                           (cons
                                            (string->symbol
                                             (string-append name "state518"))
                                            (cons
                                             (signal-value btor521)
                                             (if (assoc-has-key?
                                                  merged-input-state-hash
                                                  (string->symbol
                                                   (string-append
                                                    name
                                                    "state518")))
                                               (add1
                                                (cdr
                                                 (assoc-ref
                                                  merged-input-state-hash
                                                  (string->symbol
                                                   (string-append
                                                    name
                                                    "state518")))))
                                               0))))
                                          (append
                                           (list
                                            (cons
                                             (string->symbol
                                              (string-append name "state454"))
                                             (cons
                                              (signal-value btor1689)
                                              (if (assoc-has-key?
                                                   merged-input-state-hash
                                                   (string->symbol
                                                    (string-append
                                                     name
                                                     "state454")))
                                                (add1
                                                 (cdr
                                                  (assoc-ref
                                                   merged-input-state-hash
                                                   (string->symbol
                                                    (string-append
                                                     name
                                                     "state454")))))
                                                0))))
                                           (append
                                            (list
                                             (cons
                                              (string->symbol
                                               (string-append name "state453"))
                                              (cons
                                               (signal-value btor456)
                                               (if (assoc-has-key?
                                                    merged-input-state-hash
                                                    (string->symbol
                                                     (string-append
                                                      name
                                                      "state453")))
                                                 (add1
                                                  (cdr
                                                   (assoc-ref
                                                    merged-input-state-hash
                                                    (string->symbol
                                                     (string-append
                                                      name
                                                      "state453")))))
                                                 0))))
                                            (append
                                             (list
                                              (cons
                                               (string->symbol
                                                (string-append
                                                 name
                                                 "state433"))
                                               (cons
                                                (signal-value btor1683)
                                                (if (assoc-has-key?
                                                     merged-input-state-hash
                                                     (string->symbol
                                                      (string-append
                                                       name
                                                       "state433")))
                                                  (add1
                                                   (cdr
                                                    (assoc-ref
                                                     merged-input-state-hash
                                                     (string->symbol
                                                      (string-append
                                                       name
                                                       "state433")))))
                                                  0))))
                                             (append
                                              (list
                                               (cons
                                                (string->symbol
                                                 (string-append
                                                  name
                                                  "state431"))
                                                (cons
                                                 (signal-value btor435)
                                                 (if (assoc-has-key?
                                                      merged-input-state-hash
                                                      (string->symbol
                                                       (string-append
                                                        name
                                                        "state431")))
                                                   (add1
                                                    (cdr
                                                     (assoc-ref
                                                      merged-input-state-hash
                                                      (string->symbol
                                                       (string-append
                                                        name
                                                        "state431")))))
                                                   0))))
                                              (append
                                               (list
                                                (cons
                                                 (string->symbol
                                                  (string-append
                                                   name
                                                   "state334"))
                                                 (cons
                                                  (signal-value btor1677)
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
                                                   (signal-value btor336)
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
                                                     "state324"))
                                                   (cons
                                                    (signal-value btor1671)
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
                                                      "state323"))
                                                    (cons
                                                     (signal-value btor326)
                                                     (if (assoc-has-key?
                                                          merged-input-state-hash
                                                          (string->symbol
                                                           (string-append
                                                            name
                                                            "state323")))
                                                       (add1
                                                        (cdr
                                                         (assoc-ref
                                                          merged-input-state-hash
                                                          (string->symbol
                                                           (string-append
                                                            name
                                                            "state323")))))
                                                       0))))
                                                  (append
                                                   (list
                                                    (cons
                                                     (string->symbol
                                                      (string-append
                                                       name
                                                       "state314"))
                                                     (cons
                                                      (signal-value btor1665)
                                                      (if (assoc-has-key?
                                                           merged-input-state-hash
                                                           (string->symbol
                                                            (string-append
                                                             name
                                                             "state314")))
                                                        (add1
                                                         (cdr
                                                          (assoc-ref
                                                           merged-input-state-hash
                                                           (string->symbol
                                                            (string-append
                                                             name
                                                             "state314")))))
                                                        0))))
                                                   (append
                                                    (list
                                                     (cons
                                                      (string->symbol
                                                       (string-append
                                                        name
                                                        "state312"))
                                                      (cons
                                                       (signal-value btor316)
                                                       (if (assoc-has-key?
                                                            merged-input-state-hash
                                                            (string->symbol
                                                             (string-append
                                                              name
                                                              "state312")))
                                                         (add1
                                                          (cdr
                                                           (assoc-ref
                                                            merged-input-state-hash
                                                            (string->symbol
                                                             (string-append
                                                              name
                                                              "state312")))))
                                                         0))))
                                                    (append
                                                     (list
                                                      (cons
                                                       (string->symbol
                                                        (string-append
                                                         name
                                                         "state155"))
                                                       (cons
                                                        (signal-value btor1661)
                                                        (if (assoc-has-key?
                                                             merged-input-state-hash
                                                             (string->symbol
                                                              (string-append
                                                               name
                                                               "state155")))
                                                          (add1
                                                           (cdr
                                                            (assoc-ref
                                                             merged-input-state-hash
                                                             (string->symbol
                                                              (string-append
                                                               name
                                                               "state155")))))
                                                          0))))
                                                     (append
                                                      (list
                                                       (cons
                                                        (string->symbol
                                                         (string-append
                                                          name
                                                          "state153"))
                                                        (cons
                                                         (signal-value btor157)
                                                         (if (assoc-has-key?
                                                              merged-input-state-hash
                                                              (string->symbol
                                                               (string-append
                                                                name
                                                                "state153")))
                                                           (add1
                                                            (cdr
                                                             (assoc-ref
                                                              merged-input-state-hash
                                                              (string->symbol
                                                               (string-append
                                                                name
                                                                "state153")))))
                                                           0))))
                                                      (append
                                                       (list
                                                        (cons
                                                         (string->symbol
                                                          (string-append
                                                           name
                                                           "state142"))
                                                         (cons
                                                          (signal-value
                                                           btor1657)
                                                          (if (assoc-has-key?
                                                               merged-input-state-hash
                                                               (string->symbol
                                                                (string-append
                                                                 name
                                                                 "state142")))
                                                            (add1
                                                             (cdr
                                                              (assoc-ref
                                                               merged-input-state-hash
                                                               (string->symbol
                                                                (string-append
                                                                 name
                                                                 "state142")))))
                                                            0))))
                                                       (append
                                                        (list
                                                         (cons
                                                          (string->symbol
                                                           (string-append
                                                            name
                                                            "state141"))
                                                          (cons
                                                           (signal-value
                                                            btor144)
                                                           (if (assoc-has-key?
                                                                merged-input-state-hash
                                                                (string->symbol
                                                                 (string-append
                                                                  name
                                                                  "state141")))
                                                             (add1
                                                              (cdr
                                                               (assoc-ref
                                                                merged-input-state-hash
                                                                (string->symbol
                                                                 (string-append
                                                                  name
                                                                  "state141")))))
                                                             0))))
                                                        (append
                                                         (list
                                                          (cons
                                                           (string->symbol
                                                            (string-append
                                                             name
                                                             "state131"))
                                                           (cons
                                                            (signal-value
                                                             btor1651)
                                                            (if (assoc-has-key?
                                                                 merged-input-state-hash
                                                                 (string->symbol
                                                                  (string-append
                                                                   name
                                                                   "state131")))
                                                              (add1
                                                               (cdr
                                                                (assoc-ref
                                                                 merged-input-state-hash
                                                                 (string->symbol
                                                                  (string-append
                                                                   name
                                                                   "state131")))))
                                                              0))))
                                                         (append
                                                          (list
                                                           (cons
                                                            (string->symbol
                                                             (string-append
                                                              name
                                                              "state129"))
                                                            (cons
                                                             (signal-value
                                                              btor133)
                                                             (if (assoc-has-key?
                                                                  merged-input-state-hash
                                                                  (string->symbol
                                                                   (string-append
                                                                    name
                                                                    "state129")))
                                                               (add1
                                                                (cdr
                                                                 (assoc-ref
                                                                  merged-input-state-hash
                                                                  (string->symbol
                                                                   (string-append
                                                                    name
                                                                    "state129")))))
                                                               0))))
                                                          (append
                                                           (list
                                                            (cons
                                                             (string->symbol
                                                              (string-append
                                                               name
                                                               "state119"))
                                                             (cons
                                                              (signal-value
                                                               btor1644)
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
                                                                "state118"))
                                                              (cons
                                                               (signal-value
                                                                btor121)
                                                               (if (assoc-has-key?
                                                                    merged-input-state-hash
                                                                    (string->symbol
                                                                     (string-append
                                                                      name
                                                                      "state118")))
                                                                 (add1
                                                                  (cdr
                                                                   (assoc-ref
                                                                    merged-input-state-hash
                                                                    (string->symbol
                                                                     (string-append
                                                                      name
                                                                      "state118")))))
                                                                 0))))
                                                            (append
                                                             (list
                                                              (cons
                                                               (string->symbol
                                                                (string-append
                                                                 name
                                                                 "state101"))
                                                               (cons
                                                                (signal-value
                                                                 btor99)
                                                                (if (assoc-has-key?
                                                                     merged-input-state-hash
                                                                     (string->symbol
                                                                      (string-append
                                                                       name
                                                                       "state101")))
                                                                  (add1
                                                                   (cdr
                                                                    (assoc-ref
                                                                     merged-input-state-hash
                                                                     (string->symbol
                                                                      (string-append
                                                                       name
                                                                       "state101")))))
                                                                  0))))
                                                             (append
                                                              (list
                                                               (cons
                                                                (string->symbol
                                                                 (string-append
                                                                  name
                                                                  "state97"))
                                                                (cons
                                                                 (signal-value
                                                                  btor1637)
                                                                 (if (assoc-has-key?
                                                                      merged-input-state-hash
                                                                      (string->symbol
                                                                       (string-append
                                                                        name
                                                                        "state97")))
                                                                   (add1
                                                                    (cdr
                                                                     (assoc-ref
                                                                      merged-input-state-hash
                                                                      (string->symbol
                                                                       (string-append
                                                                        name
                                                                        "state97")))))
                                                                   0))))
                                                              (append
                                                               (list
                                                                (cons
                                                                 (string->symbol
                                                                  (string-append
                                                                   name
                                                                   "state95"))
                                                                 (cons
                                                                  (signal-value
                                                                   btor107)
                                                                  (if (assoc-has-key?
                                                                       merged-input-state-hash
                                                                       (string->symbol
                                                                        (string-append
                                                                         name
                                                                         "state95")))
                                                                    (add1
                                                                     (cdr
                                                                      (assoc-ref
                                                                       merged-input-state-hash
                                                                       (string->symbol
                                                                        (string-append
                                                                         name
                                                                         "state95")))))
                                                                    0))))
                                                               (list))))))))))))))))))))))))))))))))))))))))))))))))))
              merged-input-state-hash)
             equal?
             #:key
             car)))
      (list
       (cons 'XOROUT (signal (signal-value btor1240) output-state))
       (cons 'PCOUT (signal (signal-value btor1163) output-state))
       (cons 'PATTERNBDETECT (signal (signal-value btor1152) output-state))
       (cons 'CARRYCASCOUT (signal (signal-value btor954) output-state))
       (cons 'P (signal (signal-value btor1163) output-state))
       (cons 'CARRYOUT (signal (signal-value btor983) output-state))
       (cons 'UNDERFLOW (signal (signal-value btor1174) output-state))
       (cons 'BCOUT (signal (signal-value btor150) output-state))
       (cons 'MULTSIGNOUT (signal (signal-value btor990) output-state))
       (cons 'OVERFLOW (signal (signal-value btor1161) output-state))
       (cons 'ACOUT (signal (signal-value btor127) output-state))
       (cons 'PATTERNDETECT (signal (signal-value btor1144) output-state))))))
