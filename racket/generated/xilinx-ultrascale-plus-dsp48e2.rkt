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
               (string->symbol (string-append name "state98"))
               (bv 1 (bitvector 1))))
             (list)))
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
           (btor96
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state96")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state96"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state96")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state96")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 30))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor97 (bv->signal (bv 1 (bitvector 1))))
           (btor98
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state98")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state98"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state98")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state98")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor100
            (signal
             (bvxor (signal-value btor45) (signal-value btor54))
             (list)))
           (btor101 (bitvector 2))
           (btor102
            (signal
             (concat (signal-value btor100) (signal-value btor98))
             (list)))
           (btor103 (bv->signal (bv 2 (bitvector 2))))
           (btor104
            (signal
             (bool->bitvector
              (bveq (signal-value btor102) (signal-value btor103)))
             (list)))
           (btor105
            (if (bitvector->bool (signal-value btor104)) btor96 btor95))
           (btor106 (bv->signal (bv 0 (bitvector 1))))
           (btor107 (bv->signal (bv 15 (bitvector 4))))
           (btor108
            (bv->signal
             (zero-extend (signal-value btor107) (bitvector 5))
             btor107))
           (btor109
            (signal
             (bool->bitvector
              (bveq (signal-value btor15) (signal-value btor108)))
             (list)))
           (btor110
            (if (bitvector->bool (signal-value btor109)) btor97 btor106))
           (btor111 (bv->signal (bv 7 (bitvector 3))))
           (btor112
            (bv->signal
             (zero-extend (signal-value btor111) (bitvector 5))
             btor111))
           (btor113
            (signal
             (bool->bitvector
              (bveq (signal-value btor15) (signal-value btor112)))
             (list)))
           (btor114
            (if (bitvector->bool (signal-value btor113)) btor106 btor110))
           (btor115 (if (bitvector->bool (signal-value btor114)) btor5 btor2))
           (btor116
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state116")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state116"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state116")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state116")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 30))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor117
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state117")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state117"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state117")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state117")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 30))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor118
            (if (bitvector->bool (signal-value btor104)) btor117 btor116))
           (btor119
            (signal (extract 1 0 (signal-value btor12)) (signal-state btor12)))
           (btor120
            (signal
             (apply bvor (bitvector->bits (signal-value btor119)))
             (signal-state btor119)))
           (btor121
            (if (bitvector->bool (signal-value btor120)) btor118 btor115))
           (btor122
            (signal (extract 1 0 (signal-value btor4)) (signal-state btor4)))
           (btor123
            (signal
             (bool->bitvector
              (bveq (signal-value btor122) (signal-value btor119)))
             (list)))
           (btor124
            (if (bitvector->bool (signal-value btor123)) btor121 btor105))
           (btor126
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state126")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state126"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state126")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state126")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
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
           (btor128
            (if (bitvector->bool (signal-value btor104)) btor127 btor126))
           (btor129
            (bv->signal
             (zero-extend (signal-value btor107) (bitvector 5))
             btor107))
           (btor130
            (signal
             (bool->bitvector
              (bveq (signal-value btor22) (signal-value btor129)))
             (list)))
           (btor131
            (if (bitvector->bool (signal-value btor130)) btor97 btor106))
           (btor132
            (bv->signal
             (zero-extend (signal-value btor111) (bitvector 5))
             btor111))
           (btor133
            (signal
             (bool->bitvector
              (bveq (signal-value btor22) (signal-value btor132)))
             (list)))
           (btor134
            (if (bitvector->bool (signal-value btor133)) btor106 btor131))
           (btor135
            (if (bitvector->bool (signal-value btor134)) btor19 btor17))
           (btor136
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state136")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state136"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state136")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state136")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor137
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state137")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state137"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state137")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state137")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor138
            (if (bitvector->bool (signal-value btor104)) btor137 btor136))
           (btor139
            (signal (extract 1 0 (signal-value btor21)) (signal-state btor21)))
           (btor140
            (signal
             (apply bvor (bitvector->bits (signal-value btor139)))
             (signal-state btor139)))
           (btor141
            (if (bitvector->bool (signal-value btor140)) btor138 btor135))
           (btor142
            (signal (extract 1 0 (signal-value btor18)) (signal-state btor18)))
           (btor143
            (signal
             (bool->bitvector
              (bveq (signal-value btor142) (signal-value btor139)))
             (list)))
           (btor144
            (if (bitvector->bool (signal-value btor143)) btor141 btor128))
           (btor146
            (signal (bvxor (signal-value btor8) (signal-value btor52)) (list)))
           (btor147
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state147")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state147"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state147")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state147")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 4))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor148
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state148")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state148"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state148")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state148")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 4))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor149
            (if (bitvector->bool (signal-value btor104)) btor148 btor147))
           (btor150
            (signal (extract 0 0 (signal-value btor9)) (signal-state btor9)))
           (btor151
            (if (bitvector->bool (signal-value btor150)) btor149 btor146))
           (btor152
            (signal
             (extract 0 0 (signal-value btor151))
             (signal-state btor151)))
           (btor153
            (signal
             (extract 1 1 (signal-value btor151))
             (signal-state btor151)))
           (btor154
            (signal
             (bvand (signal-value btor152) (signal-value btor153))
             (list)))
           (btor155 (bitvector 14))
           (btor156 (bv->signal (bv 0 (bitvector 2))))
           (btor157 (bv->signal (bv 25 (bitvector 5))))
           (btor158
            (signal
             (bool->bitvector
              (bveq (signal-value btor92) (signal-value btor157)))
             (list)))
           (btor159
            (if (bitvector->bool (signal-value btor158)) btor103 btor156))
           (btor160 (bv->signal (bv 1 (bitvector 2))))
           (btor161 (bv->signal (bv 19 (bitvector 5))))
           (btor162
            (signal
             (bool->bitvector
              (bveq (signal-value btor92) (signal-value btor161)))
             (list)))
           (btor163
            (if (bitvector->bool (signal-value btor162)) btor160 btor159))
           (btor164 (bv->signal (bv 12 (bitvector 4))))
           (btor165
            (bv->signal
             (zero-extend (signal-value btor164) (bitvector 5))
             btor164))
           (btor166
            (signal
             (bool->bitvector
              (bveq (signal-value btor92) (signal-value btor165)))
             (list)))
           (btor167
            (if (bitvector->bool (signal-value btor166)) btor156 btor163))
           (btor168
            (bv->signal
             (zero-extend (signal-value btor97) (bitvector 2))
             btor97))
           (btor169
            (signal
             (bool->bitvector
              ((compose1 not bveq)
               (signal-value btor167)
               (signal-value btor168)))
             (list)))
           (btor170
            (signal
             (extract 0 0 (signal-value btor151))
             (signal-state btor151)))
           (btor171
            (signal
             (extract 0 0 (signal-value btor151))
             (signal-state btor151)))
           (btor172
            (signal
             (concat (signal-value btor171) (signal-value btor170))
             (list)))
           (btor173
            (signal
             (extract 0 0 (signal-value btor151))
             (signal-state btor151)))
           (btor174
            (signal
             (concat (signal-value btor173) (signal-value btor172))
             (list)))
           (btor175
            (signal
             (extract 0 0 (signal-value btor151))
             (signal-state btor151)))
           (btor176
            (signal
             (concat (signal-value btor175) (signal-value btor174))
             (list)))
           (btor177
            (signal
             (extract 0 0 (signal-value btor151))
             (signal-state btor151)))
           (btor178
            (signal
             (concat (signal-value btor177) (signal-value btor176))
             (list)))
           (btor179
            (signal
             (extract 0 0 (signal-value btor151))
             (signal-state btor151)))
           (btor180 (bitvector 6))
           (btor181
            (signal
             (concat (signal-value btor179) (signal-value btor178))
             (list)))
           (btor182
            (signal
             (extract 0 0 (signal-value btor151))
             (signal-state btor151)))
           (btor183 (bitvector 7))
           (btor184
            (signal
             (concat (signal-value btor182) (signal-value btor181))
             (list)))
           (btor185
            (signal
             (extract 0 0 (signal-value btor151))
             (signal-state btor151)))
           (btor186 (bitvector 8))
           (btor187
            (signal
             (concat (signal-value btor185) (signal-value btor184))
             (list)))
           (btor188
            (signal
             (extract 0 0 (signal-value btor151))
             (signal-state btor151)))
           (btor189
            (signal
             (concat (signal-value btor188) (signal-value btor187))
             (list)))
           (btor190
            (signal
             (extract 0 0 (signal-value btor151))
             (signal-state btor151)))
           (btor191 (bitvector 10))
           (btor192
            (signal
             (concat (signal-value btor190) (signal-value btor189))
             (list)))
           (btor193
            (signal
             (extract 0 0 (signal-value btor151))
             (signal-state btor151)))
           (btor194 (bitvector 11))
           (btor195
            (signal
             (concat (signal-value btor193) (signal-value btor192))
             (list)))
           (btor196
            (signal
             (extract 0 0 (signal-value btor151))
             (signal-state btor151)))
           (btor197 (bitvector 12))
           (btor198
            (signal
             (concat (signal-value btor196) (signal-value btor195))
             (list)))
           (btor199
            (signal
             (extract 0 0 (signal-value btor151))
             (signal-state btor151)))
           (btor200 (bitvector 13))
           (btor201
            (signal
             (concat (signal-value btor199) (signal-value btor198))
             (list)))
           (btor202
            (signal
             (extract 0 0 (signal-value btor151))
             (signal-state btor151)))
           (btor203
            (signal
             (concat (signal-value btor202) (signal-value btor201))
             (list)))
           (btor204
            (signal
             (extract 0 0 (signal-value btor151))
             (signal-state btor151)))
           (btor205 (bitvector 15))
           (btor206
            (signal
             (concat (signal-value btor204) (signal-value btor203))
             (list)))
           (btor207
            (signal
             (extract 0 0 (signal-value btor151))
             (signal-state btor151)))
           (btor208 (bitvector 16))
           (btor209
            (signal
             (concat (signal-value btor207) (signal-value btor206))
             (list)))
           (btor210
            (signal
             (extract 0 0 (signal-value btor151))
             (signal-state btor151)))
           (btor211 (bitvector 17))
           (btor212
            (signal
             (concat (signal-value btor210) (signal-value btor209))
             (list)))
           (btor213
            (signal
             (extract 0 0 (signal-value btor151))
             (signal-state btor151)))
           (btor214
            (signal
             (concat (signal-value btor213) (signal-value btor212))
             (list)))
           (btor215
            (signal
             (extract 0 0 (signal-value btor151))
             (signal-state btor151)))
           (btor216 (bitvector 19))
           (btor217
            (signal
             (concat (signal-value btor215) (signal-value btor214))
             (list)))
           (btor218
            (signal
             (extract 0 0 (signal-value btor151))
             (signal-state btor151)))
           (btor219 (bitvector 20))
           (btor220
            (signal
             (concat (signal-value btor218) (signal-value btor217))
             (list)))
           (btor221
            (signal
             (extract 0 0 (signal-value btor151))
             (signal-state btor151)))
           (btor222 (bitvector 21))
           (btor223
            (signal
             (concat (signal-value btor221) (signal-value btor220))
             (list)))
           (btor224
            (signal
             (extract 0 0 (signal-value btor151))
             (signal-state btor151)))
           (btor225 (bitvector 22))
           (btor226
            (signal
             (concat (signal-value btor224) (signal-value btor223))
             (list)))
           (btor227
            (signal
             (extract 0 0 (signal-value btor151))
             (signal-state btor151)))
           (btor228 (bitvector 23))
           (btor229
            (signal
             (concat (signal-value btor227) (signal-value btor226))
             (list)))
           (btor230
            (signal
             (extract 0 0 (signal-value btor151))
             (signal-state btor151)))
           (btor231 (bitvector 24))
           (btor232
            (signal
             (concat (signal-value btor230) (signal-value btor229))
             (list)))
           (btor233
            (signal
             (extract 0 0 (signal-value btor151))
             (signal-state btor151)))
           (btor234 (bitvector 25))
           (btor235
            (signal
             (concat (signal-value btor233) (signal-value btor232))
             (list)))
           (btor236
            (signal
             (extract 0 0 (signal-value btor151))
             (signal-state btor151)))
           (btor237 (bitvector 26))
           (btor238
            (signal
             (concat (signal-value btor236) (signal-value btor235))
             (list)))
           (btor239
            (signal
             (extract 0 0 (signal-value btor151))
             (signal-state btor151)))
           (btor240
            (signal
             (concat (signal-value btor239) (signal-value btor238))
             (list)))
           (btor241
            (signal
             (extract 0 0 (signal-value btor151))
             (signal-state btor151)))
           (btor242 (bitvector 28))
           (btor243
            (signal
             (concat (signal-value btor241) (signal-value btor240))
             (list)))
           (btor244
            (signal
             (extract 0 0 (signal-value btor151))
             (signal-state btor151)))
           (btor245 (bitvector 29))
           (btor246
            (signal
             (concat (signal-value btor244) (signal-value btor243))
             (list)))
           (btor247
            (signal
             (extract 0 0 (signal-value btor151))
             (signal-state btor151)))
           (btor248
            (signal
             (concat (signal-value btor247) (signal-value btor246))
             (list)))
           (btor249
            (signal
             (extract 0 0 (signal-value btor151))
             (signal-state btor151)))
           (btor250 (bitvector 31))
           (btor251
            (signal
             (concat (signal-value btor249) (signal-value btor248))
             (list)))
           (btor252
            (signal
             (extract 0 0 (signal-value btor151))
             (signal-state btor151)))
           (btor253
            (signal
             (concat (signal-value btor252) (signal-value btor251))
             (list)))
           (btor254
            (signal
             (extract 0 0 (signal-value btor151))
             (signal-state btor151)))
           (btor255 (bitvector 33))
           (btor256
            (signal
             (concat (signal-value btor254) (signal-value btor253))
             (list)))
           (btor257
            (signal
             (extract 0 0 (signal-value btor151))
             (signal-state btor151)))
           (btor258 (bitvector 34))
           (btor259
            (signal
             (concat (signal-value btor257) (signal-value btor256))
             (list)))
           (btor260
            (signal
             (extract 0 0 (signal-value btor151))
             (signal-state btor151)))
           (btor261 (bitvector 35))
           (btor262
            (signal
             (concat (signal-value btor260) (signal-value btor259))
             (list)))
           (btor263
            (signal
             (extract 0 0 (signal-value btor151))
             (signal-state btor151)))
           (btor264 (bitvector 36))
           (btor265
            (signal
             (concat (signal-value btor263) (signal-value btor262))
             (list)))
           (btor266
            (signal
             (extract 0 0 (signal-value btor151))
             (signal-state btor151)))
           (btor267 (bitvector 37))
           (btor268
            (signal
             (concat (signal-value btor266) (signal-value btor265))
             (list)))
           (btor269
            (signal
             (extract 0 0 (signal-value btor151))
             (signal-state btor151)))
           (btor270 (bitvector 38))
           (btor271
            (signal
             (concat (signal-value btor269) (signal-value btor268))
             (list)))
           (btor272
            (signal
             (extract 0 0 (signal-value btor151))
             (signal-state btor151)))
           (btor273 (bitvector 39))
           (btor274
            (signal
             (concat (signal-value btor272) (signal-value btor271))
             (list)))
           (btor275
            (signal
             (extract 0 0 (signal-value btor151))
             (signal-state btor151)))
           (btor276 (bitvector 40))
           (btor277
            (signal
             (concat (signal-value btor275) (signal-value btor274))
             (list)))
           (btor278
            (signal
             (extract 0 0 (signal-value btor151))
             (signal-state btor151)))
           (btor279 (bitvector 41))
           (btor280
            (signal
             (concat (signal-value btor278) (signal-value btor277))
             (list)))
           (btor281
            (signal
             (extract 0 0 (signal-value btor151))
             (signal-state btor151)))
           (btor282 (bitvector 42))
           (btor283
            (signal
             (concat (signal-value btor281) (signal-value btor280))
             (list)))
           (btor284
            (signal
             (extract 0 0 (signal-value btor151))
             (signal-state btor151)))
           (btor285 (bitvector 43))
           (btor286
            (signal
             (concat (signal-value btor284) (signal-value btor283))
             (list)))
           (btor287
            (signal
             (extract 0 0 (signal-value btor151))
             (signal-state btor151)))
           (btor288 (bitvector 44))
           (btor289
            (signal
             (concat (signal-value btor287) (signal-value btor286))
             (list)))
           (btor290
            (signal
             (extract 0 0 (signal-value btor151))
             (signal-state btor151)))
           (btor291 (bitvector 45))
           (btor292
            (signal
             (concat (signal-value btor290) (signal-value btor289))
             (list)))
           (btor293
            (signal
             (extract 0 0 (signal-value btor151))
             (signal-state btor151)))
           (btor294 (bitvector 46))
           (btor295
            (signal
             (concat (signal-value btor293) (signal-value btor292))
             (list)))
           (btor296
            (signal
             (extract 0 0 (signal-value btor151))
             (signal-state btor151)))
           (btor297 (bitvector 47))
           (btor298
            (signal
             (concat (signal-value btor296) (signal-value btor295))
             (list)))
           (btor299
            (signal
             (extract 0 0 (signal-value btor151))
             (signal-state btor151)))
           (btor300
            (signal
             (concat (signal-value btor299) (signal-value btor298))
             (list)))
           (btor301 (bv->signal (bv 0 (bitvector 48))))
           (btor302
            (signal
             (bvxor (signal-value btor71) (signal-value btor57))
             (list)))
           (btor303
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state303")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state303"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state303")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state303")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 9))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor304
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state304")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state304"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state304")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state304")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 9))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor305
            (if (bitvector->bool (signal-value btor104)) btor304 btor303))
           (btor306
            (signal (extract 0 0 (signal-value btor72)) (signal-state btor72)))
           (btor307
            (if (bitvector->bool (signal-value btor306)) btor305 btor302))
           (btor308
            (signal
             (extract 6 4 (signal-value btor307))
             (signal-state btor307)))
           (btor309
            (bv->signal
             (zero-extend (signal-value btor97) (bitvector 3))
             btor97))
           (btor310
            (signal
             (bool->bitvector
              (bveq (signal-value btor308) (signal-value btor309)))
             (list)))
           (btor311
            (if (bitvector->bool (signal-value btor310)) btor74 btor301))
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
                          (bv 0 48))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor313
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state313")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state313"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state313")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state313")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 48))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor314
            (if (bitvector->bool (signal-value btor104)) btor313 btor312))
           (btor315
            (signal (extract 0 0 (signal-value btor46)) (signal-state btor46)))
           (btor316
            (if (bitvector->bool (signal-value btor315)) btor314 btor24))
           (btor317 (bv->signal (bv 3 (bitvector 2))))
           (btor318
            (bv->signal
             (zero-extend (signal-value btor317) (bitvector 3))
             btor317))
           (btor319
            (signal
             (bool->bitvector
              (bveq (signal-value btor308) (signal-value btor318)))
             (list)))
           (btor320
            (if (bitvector->bool (signal-value btor319)) btor316 btor311))
           (btor321
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state321")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state321"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state321")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state321")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 48))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor322
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state322")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state322"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state322")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state322")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 48))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor323
            (if (bitvector->bool (signal-value btor104)) btor322 btor321))
           (btor324
            (signal
             (extract 47 17 (signal-value btor74))
             (signal-state btor74)))
           (btor325
            (signal
             (extract 47 47 (signal-value btor74))
             (signal-state btor74)))
           (btor326
            (signal
             (concat (signal-value btor325) (signal-value btor324))
             (list)))
           (btor327
            (signal
             (extract 47 47 (signal-value btor74))
             (signal-state btor74)))
           (btor328
            (signal
             (concat (signal-value btor327) (signal-value btor326))
             (list)))
           (btor329
            (signal
             (extract 47 47 (signal-value btor74))
             (signal-state btor74)))
           (btor330
            (signal
             (concat (signal-value btor329) (signal-value btor328))
             (list)))
           (btor331
            (signal
             (extract 47 47 (signal-value btor74))
             (signal-state btor74)))
           (btor332
            (signal
             (concat (signal-value btor331) (signal-value btor330))
             (list)))
           (btor333
            (signal
             (extract 47 47 (signal-value btor74))
             (signal-state btor74)))
           (btor334
            (signal
             (concat (signal-value btor333) (signal-value btor332))
             (list)))
           (btor335
            (signal
             (extract 47 47 (signal-value btor74))
             (signal-state btor74)))
           (btor336
            (signal
             (concat (signal-value btor335) (signal-value btor334))
             (list)))
           (btor337
            (signal
             (extract 47 47 (signal-value btor74))
             (signal-state btor74)))
           (btor338
            (signal
             (concat (signal-value btor337) (signal-value btor336))
             (list)))
           (btor339
            (signal
             (extract 47 47 (signal-value btor74))
             (signal-state btor74)))
           (btor340
            (signal
             (concat (signal-value btor339) (signal-value btor338))
             (list)))
           (btor341
            (signal
             (extract 47 47 (signal-value btor74))
             (signal-state btor74)))
           (btor342
            (signal
             (concat (signal-value btor341) (signal-value btor340))
             (list)))
           (btor343
            (signal
             (extract 47 47 (signal-value btor74))
             (signal-state btor74)))
           (btor344
            (signal
             (concat (signal-value btor343) (signal-value btor342))
             (list)))
           (btor345
            (signal
             (extract 47 47 (signal-value btor74))
             (signal-state btor74)))
           (btor346
            (signal
             (concat (signal-value btor345) (signal-value btor344))
             (list)))
           (btor347
            (signal
             (extract 47 47 (signal-value btor74))
             (signal-state btor74)))
           (btor348
            (signal
             (concat (signal-value btor347) (signal-value btor346))
             (list)))
           (btor349
            (signal
             (extract 47 47 (signal-value btor74))
             (signal-state btor74)))
           (btor350
            (signal
             (concat (signal-value btor349) (signal-value btor348))
             (list)))
           (btor351
            (signal
             (extract 47 47 (signal-value btor74))
             (signal-state btor74)))
           (btor352
            (signal
             (concat (signal-value btor351) (signal-value btor350))
             (list)))
           (btor353
            (signal
             (extract 47 47 (signal-value btor74))
             (signal-state btor74)))
           (btor354
            (signal
             (concat (signal-value btor353) (signal-value btor352))
             (list)))
           (btor355
            (signal
             (extract 47 47 (signal-value btor74))
             (signal-state btor74)))
           (btor356
            (signal
             (concat (signal-value btor355) (signal-value btor354))
             (list)))
           (btor357
            (signal
             (extract 47 47 (signal-value btor74))
             (signal-state btor74)))
           (btor358
            (signal
             (concat (signal-value btor357) (signal-value btor356))
             (list)))
           (btor359 (bv->signal (bv 5 (bitvector 3))))
           (btor360
            (signal
             (bool->bitvector
              (bveq (signal-value btor308) (signal-value btor359)))
             (list)))
           (btor361
            (if (bitvector->bool (signal-value btor360)) btor358 btor323))
           (btor362
            (signal
             (extract 47 17 (signal-value btor323))
             (signal-state btor323)))
           (btor363
            (signal
             (extract 47 47 (signal-value btor323))
             (signal-state btor323)))
           (btor364
            (signal
             (concat (signal-value btor363) (signal-value btor362))
             (list)))
           (btor365
            (signal
             (extract 47 47 (signal-value btor323))
             (signal-state btor323)))
           (btor366
            (signal
             (concat (signal-value btor365) (signal-value btor364))
             (list)))
           (btor367
            (signal
             (extract 47 47 (signal-value btor323))
             (signal-state btor323)))
           (btor368
            (signal
             (concat (signal-value btor367) (signal-value btor366))
             (list)))
           (btor369
            (signal
             (extract 47 47 (signal-value btor323))
             (signal-state btor323)))
           (btor370
            (signal
             (concat (signal-value btor369) (signal-value btor368))
             (list)))
           (btor371
            (signal
             (extract 47 47 (signal-value btor323))
             (signal-state btor323)))
           (btor372
            (signal
             (concat (signal-value btor371) (signal-value btor370))
             (list)))
           (btor373
            (signal
             (extract 47 47 (signal-value btor323))
             (signal-state btor323)))
           (btor374
            (signal
             (concat (signal-value btor373) (signal-value btor372))
             (list)))
           (btor375
            (signal
             (extract 47 47 (signal-value btor323))
             (signal-state btor323)))
           (btor376
            (signal
             (concat (signal-value btor375) (signal-value btor374))
             (list)))
           (btor377
            (signal
             (extract 47 47 (signal-value btor323))
             (signal-state btor323)))
           (btor378
            (signal
             (concat (signal-value btor377) (signal-value btor376))
             (list)))
           (btor379
            (signal
             (extract 47 47 (signal-value btor323))
             (signal-state btor323)))
           (btor380
            (signal
             (concat (signal-value btor379) (signal-value btor378))
             (list)))
           (btor381
            (signal
             (extract 47 47 (signal-value btor323))
             (signal-state btor323)))
           (btor382
            (signal
             (concat (signal-value btor381) (signal-value btor380))
             (list)))
           (btor383
            (signal
             (extract 47 47 (signal-value btor323))
             (signal-state btor323)))
           (btor384
            (signal
             (concat (signal-value btor383) (signal-value btor382))
             (list)))
           (btor385
            (signal
             (extract 47 47 (signal-value btor323))
             (signal-state btor323)))
           (btor386
            (signal
             (concat (signal-value btor385) (signal-value btor384))
             (list)))
           (btor387
            (signal
             (extract 47 47 (signal-value btor323))
             (signal-state btor323)))
           (btor388
            (signal
             (concat (signal-value btor387) (signal-value btor386))
             (list)))
           (btor389
            (signal
             (extract 47 47 (signal-value btor323))
             (signal-state btor323)))
           (btor390
            (signal
             (concat (signal-value btor389) (signal-value btor388))
             (list)))
           (btor391
            (signal
             (extract 47 47 (signal-value btor323))
             (signal-state btor323)))
           (btor392
            (signal
             (concat (signal-value btor391) (signal-value btor390))
             (list)))
           (btor393
            (signal
             (extract 47 47 (signal-value btor323))
             (signal-state btor323)))
           (btor394
            (signal
             (concat (signal-value btor393) (signal-value btor392))
             (list)))
           (btor395
            (signal
             (extract 47 47 (signal-value btor323))
             (signal-state btor323)))
           (btor396
            (signal
             (concat (signal-value btor395) (signal-value btor394))
             (list)))
           (btor397
            (signal
             (extract 6 5 (signal-value btor307))
             (signal-state btor307)))
           (btor398
            (signal
             (bool->bitvector
              (bveq (signal-value btor397) (signal-value btor317)))
             (list)))
           (btor399
            (if (bitvector->bool (signal-value btor398)) btor396 btor361))
           (btor400 (bv->signal (bv 4 (bitvector 3))))
           (btor401
            (signal
             (bool->bitvector
              (bveq (signal-value btor308) (signal-value btor400)))
             (list)))
           (btor402
            (bv->signal
             (zero-extend (signal-value btor103) (bitvector 3))
             btor103))
           (btor403
            (signal
             (bool->bitvector
              (bveq (signal-value btor308) (signal-value btor402)))
             (list)))
           (btor404
            (signal
             (concat (signal-value btor398) (signal-value btor401))
             (list)))
           (btor405
            (signal
             (concat (signal-value btor360) (signal-value btor404))
             (list)))
           (btor406
            (signal
             (concat (signal-value btor403) (signal-value btor405))
             (list)))
           (btor407
            (signal
             (apply bvor (bitvector->bits (signal-value btor406)))
             (signal-state btor406)))
           (btor408
            (if (bitvector->bool (signal-value btor407)) btor399 btor320))
           (btor409
            (signal
             (bvxor (signal-value btor300) (signal-value btor408))
             (list)))
           (btor410
            (signal
             (concat (signal-value btor70) (signal-value btor106))
             (list)))
           (btor411
            (if (bitvector->bool (signal-value btor401)) btor410 btor156))
           (btor412 (bv->signal (bv 0 (bitvector 46))))
           (btor413
            (signal
             (concat (signal-value btor412) (signal-value btor411))
             (list)))
           (btor414 (bv->signal (bv 17592186044416 (bitvector 45))))
           (btor415
            (signal
             (extract 26 0 (signal-value btor121))
             (signal-state btor121)))
           (btor416
            (signal
             (extract 26 0 (signal-value btor105))
             (signal-state btor105)))
           (btor417
            (signal
             (bvxor (signal-value btor50) (signal-value btor55))
             (list)))
           (btor418
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state418")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state418"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state418")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state418")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 5))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor419
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state419")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state419"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state419")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state419")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 5))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor420
            (if (bitvector->bool (signal-value btor104)) btor419 btor418))
           (btor421
            (signal (extract 0 0 (signal-value btor51)) (signal-state btor51)))
           (btor422
            (if (bitvector->bool (signal-value btor421)) btor420 btor417))
           (btor423
            (signal
             (extract 0 0 (signal-value btor422))
             (signal-state btor422)))
           (btor424
            (if (bitvector->bool (signal-value btor423)) btor416 btor415))
           (btor425 (bv->signal (bv 0 (bitvector 27))))
           (btor426
            (bv->signal
             (zero-extend (signal-value btor97) (bitvector 5))
             btor97))
           (btor427
            (signal
             (bool->bitvector
              (bveq (signal-value btor75) (signal-value btor426)))
             (list)))
           (btor428
            (if (bitvector->bool (signal-value btor427)) btor97 btor106))
           (btor429 (bv->signal (bv 0 (bitvector 3))))
           (btor430
            (signal
             (concat (signal-value btor429) (signal-value btor75))
             (list)))
           (btor431
            (signal
             (apply bvor (bitvector->bits (signal-value btor430)))
             (signal-state btor430)))
           (btor432 (signal (bvnot (signal-value btor431)) (list)))
           (btor433
            (if (bitvector->bool (signal-value btor432)) btor106 btor428))
           (btor434 (signal (bvnot (signal-value btor433)) (list)))
           (btor435
            (signal
             (extract 1 1 (signal-value btor422))
             (signal-state btor422)))
           (btor436
            (signal
             (bvand (signal-value btor434) (signal-value btor435))
             (list)))
           (btor437
            (if (bitvector->bool (signal-value btor436)) btor425 btor424))
           (btor438
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state438")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state438"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state438")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state438")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 27))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
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
                          (bv 0 27))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor440
            (if (bitvector->bool (signal-value btor104)) btor439 btor438))
           (btor441
            (signal (extract 0 0 (signal-value btor49)) (signal-state btor49)))
           (btor442
            (bv->signal
             (zero-extend (signal-value btor103) (bitvector 5))
             btor103))
           (btor443
            (signal
             (bool->bitvector
              (bveq (signal-value btor11) (signal-value btor442)))
             (list)))
           (btor444
            (if (bitvector->bool (signal-value btor443)) btor97 btor106))
           (btor445 (bv->signal (bv 0 (bitvector 11))))
           (btor446
            (signal
             (concat (signal-value btor445) (signal-value btor11))
             (list)))
           (btor447
            (signal
             (apply bvor (bitvector->bits (signal-value btor446)))
             (signal-state btor446)))
           (btor448 (signal (bvnot (signal-value btor447)) (list)))
           (btor449
            (if (bitvector->bool (signal-value btor448)) btor106 btor444))
           (btor450 (signal (bvnot (signal-value btor449)) (list)))
           (btor451
            (bv->signal
             (zero-extend (signal-value btor103) (bitvector 5))
             btor103))
           (btor452
            (signal
             (bool->bitvector
              (bveq (signal-value btor20) (signal-value btor451)))
             (list)))
           (btor453
            (if (bitvector->bool (signal-value btor452)) btor97 btor106))
           (btor454
            (bv->signal
             (zero-extend (signal-value btor97) (bitvector 5))
             btor97))
           (btor455
            (signal
             (bool->bitvector
              (bveq (signal-value btor20) (signal-value btor454)))
             (list)))
           (btor456
            (if (bitvector->bool (signal-value btor455)) btor106 btor453))
           (btor457 (signal (bvnot (signal-value btor456)) (list)))
           (btor458
            (signal
             (bvand (signal-value btor450) (signal-value btor457))
             (list)))
           (btor459 (bv->signal (bv 20 (bitvector 5))))
           (btor460
            (signal
             (bool->bitvector
              (bveq (signal-value btor90) (signal-value btor459)))
             (list)))
           (btor461
            (if (bitvector->bool (signal-value btor460)) btor103 btor156))
           (btor462 (bv->signal (bv 18 (bitvector 5))))
           (btor463
            (signal
             (bool->bitvector
              (bveq (signal-value btor90) (signal-value btor462)))
             (list)))
           (btor464
            (if (bitvector->bool (signal-value btor463)) btor160 btor461))
           (btor465 (bv->signal (bv 10 (bitvector 4))))
           (btor466
            (bv->signal
             (zero-extend (signal-value btor465) (bitvector 5))
             btor465))
           (btor467
            (signal
             (bool->bitvector
              (bveq (signal-value btor90) (signal-value btor466)))
             (list)))
           (btor468
            (if (bitvector->bool (signal-value btor467)) btor156 btor464))
           (btor469
            (signal
             (bool->bitvector
              (bveq (signal-value btor468) (signal-value btor103)))
             (list)))
           (btor470
            (signal
             (bvor (signal-value btor458) (signal-value btor469))
             (list)))
           (btor471
            (if (bitvector->bool (signal-value btor470)) btor106 btor441))
           (btor472
            (if (bitvector->bool (signal-value btor471)) btor440 btor48))
           (btor473
            (signal
             (extract 2 2 (signal-value btor422))
             (signal-state btor422)))
           (btor474
            (if (bitvector->bool (signal-value btor473)) btor472 btor425))
           (btor475
            (signal
             (extract 4 4 (signal-value btor422))
             (signal-state btor422)))
           (btor476
            (if (bitvector->bool (signal-value btor475)) btor128 btor141))
           (btor477 (bv->signal (bv 0 (bitvector 18))))
           (btor478
            (signal
             (bvand (signal-value btor433) (signal-value btor435))
             (list)))
           (btor479
            (if (bitvector->bool (signal-value btor478)) btor477 btor476))
           (btor480
            (signal
             (extract 17 17 (signal-value btor479))
             (signal-state btor479)))
           (btor481
            (signal
             (concat (signal-value btor480) (signal-value btor479))
             (list)))
           (btor482
            (signal
             (extract 17 17 (signal-value btor479))
             (signal-state btor479)))
           (btor483
            (signal
             (concat (signal-value btor482) (signal-value btor481))
             (list)))
           (btor484
            (signal
             (extract 17 17 (signal-value btor479))
             (signal-state btor479)))
           (btor485
            (signal
             (concat (signal-value btor484) (signal-value btor483))
             (list)))
           (btor486
            (signal
             (extract 17 17 (signal-value btor479))
             (signal-state btor479)))
           (btor487
            (signal
             (concat (signal-value btor486) (signal-value btor485))
             (list)))
           (btor488
            (signal
             (extract 17 17 (signal-value btor479))
             (signal-state btor479)))
           (btor489
            (signal
             (concat (signal-value btor488) (signal-value btor487))
             (list)))
           (btor490
            (signal
             (extract 17 17 (signal-value btor479))
             (signal-state btor479)))
           (btor491
            (signal
             (concat (signal-value btor490) (signal-value btor489))
             (list)))
           (btor492
            (signal
             (extract 17 17 (signal-value btor479))
             (signal-state btor479)))
           (btor493
            (signal
             (concat (signal-value btor492) (signal-value btor491))
             (list)))
           (btor494
            (signal
             (extract 17 17 (signal-value btor479))
             (signal-state btor479)))
           (btor495
            (signal
             (concat (signal-value btor494) (signal-value btor493))
             (list)))
           (btor496
            (signal
             (extract 17 17 (signal-value btor479))
             (signal-state btor479)))
           (btor497
            (signal
             (concat (signal-value btor496) (signal-value btor495))
             (list)))
           (btor498
            (if (bitvector->bool (signal-value btor433)) btor497 btor437))
           (btor499
            (signal
             (bvadd (signal-value btor474) (signal-value btor498))
             (list)))
           (btor500
            (signal
             (bvsub (signal-value btor474) (signal-value btor498))
             (list)))
           (btor501
            (signal
             (extract 3 3 (signal-value btor422))
             (signal-state btor422)))
           (btor502
            (if (bitvector->bool (signal-value btor501)) btor500 btor499))
           (btor503
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state503")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state503"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state503")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state503")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 27))))))))
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
                          (bv 0 27))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor505
            (if (bitvector->bool (signal-value btor104)) btor504 btor503))
           (btor506
            (signal (extract 0 0 (signal-value btor6)) (signal-state btor6)))
           (btor507
            (if (bitvector->bool (signal-value btor470)) btor106 btor506))
           (btor508
            (if (bitvector->bool (signal-value btor507)) btor505 btor502))
           (btor509
            (if (bitvector->bool (signal-value btor449)) btor508 btor437))
           (btor510
            (signal
             (extract 26 26 (signal-value btor509))
             (signal-state btor509)))
           (btor511
            (signal
             (concat (signal-value btor510) (signal-value btor509))
             (list)))
           (btor512
            (signal
             (extract 26 26 (signal-value btor509))
             (signal-state btor509)))
           (btor513
            (signal
             (concat (signal-value btor512) (signal-value btor511))
             (list)))
           (btor514
            (signal
             (extract 26 26 (signal-value btor509))
             (signal-state btor509)))
           (btor515
            (signal
             (concat (signal-value btor514) (signal-value btor513))
             (list)))
           (btor516
            (signal
             (extract 26 26 (signal-value btor509))
             (signal-state btor509)))
           (btor517
            (signal
             (concat (signal-value btor516) (signal-value btor515))
             (list)))
           (btor518
            (signal
             (extract 26 26 (signal-value btor509))
             (signal-state btor509)))
           (btor519
            (signal
             (concat (signal-value btor518) (signal-value btor517))
             (list)))
           (btor520
            (signal
             (extract 26 26 (signal-value btor509))
             (signal-state btor509)))
           (btor521
            (signal
             (concat (signal-value btor520) (signal-value btor519))
             (list)))
           (btor522
            (signal
             (extract 26 26 (signal-value btor509))
             (signal-state btor509)))
           (btor523
            (signal
             (concat (signal-value btor522) (signal-value btor521))
             (list)))
           (btor524
            (signal
             (extract 26 26 (signal-value btor509))
             (signal-state btor509)))
           (btor525
            (signal
             (concat (signal-value btor524) (signal-value btor523))
             (list)))
           (btor526
            (signal
             (extract 26 26 (signal-value btor509))
             (signal-state btor509)))
           (btor527
            (signal
             (concat (signal-value btor526) (signal-value btor525))
             (list)))
           (btor528
            (signal
             (extract 26 26 (signal-value btor509))
             (signal-state btor509)))
           (btor529
            (signal
             (concat (signal-value btor528) (signal-value btor527))
             (list)))
           (btor530
            (signal
             (extract 26 26 (signal-value btor509))
             (signal-state btor509)))
           (btor531
            (signal
             (concat (signal-value btor530) (signal-value btor529))
             (list)))
           (btor532
            (signal
             (extract 26 26 (signal-value btor509))
             (signal-state btor509)))
           (btor533
            (signal
             (concat (signal-value btor532) (signal-value btor531))
             (list)))
           (btor534
            (signal
             (extract 26 26 (signal-value btor509))
             (signal-state btor509)))
           (btor535
            (signal
             (concat (signal-value btor534) (signal-value btor533))
             (list)))
           (btor536
            (signal
             (extract 26 26 (signal-value btor509))
             (signal-state btor509)))
           (btor537
            (signal
             (concat (signal-value btor536) (signal-value btor535))
             (list)))
           (btor538
            (signal
             (extract 26 26 (signal-value btor509))
             (signal-state btor509)))
           (btor539
            (signal
             (concat (signal-value btor538) (signal-value btor537))
             (list)))
           (btor540
            (signal
             (extract 26 26 (signal-value btor509))
             (signal-state btor509)))
           (btor541
            (signal
             (concat (signal-value btor540) (signal-value btor539))
             (list)))
           (btor542
            (signal
             (extract 26 26 (signal-value btor509))
             (signal-state btor509)))
           (btor543
            (signal
             (concat (signal-value btor542) (signal-value btor541))
             (list)))
           (btor544
            (signal
             (extract 26 26 (signal-value btor509))
             (signal-state btor509)))
           (btor545
            (signal
             (concat (signal-value btor544) (signal-value btor543))
             (list)))
           (btor546
            (signal
             (extract 17 0 (signal-value btor508))
             (signal-state btor508)))
           (btor547
            (if (bitvector->bool (signal-value btor456)) btor546 btor479))
           (btor548
            (signal
             (extract 17 17 (signal-value btor547))
             (signal-state btor547)))
           (btor549
            (signal
             (concat (signal-value btor548) (signal-value btor547))
             (list)))
           (btor550
            (signal
             (extract 17 17 (signal-value btor547))
             (signal-state btor547)))
           (btor551
            (signal
             (concat (signal-value btor550) (signal-value btor549))
             (list)))
           (btor552
            (signal
             (extract 17 17 (signal-value btor547))
             (signal-state btor547)))
           (btor553
            (signal
             (concat (signal-value btor552) (signal-value btor551))
             (list)))
           (btor554
            (signal
             (extract 17 17 (signal-value btor547))
             (signal-state btor547)))
           (btor555
            (signal
             (concat (signal-value btor554) (signal-value btor553))
             (list)))
           (btor556
            (signal
             (extract 17 17 (signal-value btor547))
             (signal-state btor547)))
           (btor557
            (signal
             (concat (signal-value btor556) (signal-value btor555))
             (list)))
           (btor558
            (signal
             (extract 17 17 (signal-value btor547))
             (signal-state btor547)))
           (btor559
            (signal
             (concat (signal-value btor558) (signal-value btor557))
             (list)))
           (btor560
            (signal
             (extract 17 17 (signal-value btor547))
             (signal-state btor547)))
           (btor561
            (signal
             (concat (signal-value btor560) (signal-value btor559))
             (list)))
           (btor562
            (signal
             (extract 17 17 (signal-value btor547))
             (signal-state btor547)))
           (btor563
            (signal
             (concat (signal-value btor562) (signal-value btor561))
             (list)))
           (btor564
            (signal
             (extract 17 17 (signal-value btor547))
             (signal-state btor547)))
           (btor565
            (signal
             (concat (signal-value btor564) (signal-value btor563))
             (list)))
           (btor566
            (signal
             (extract 17 17 (signal-value btor547))
             (signal-state btor547)))
           (btor567
            (signal
             (concat (signal-value btor566) (signal-value btor565))
             (list)))
           (btor568
            (signal
             (extract 17 17 (signal-value btor547))
             (signal-state btor547)))
           (btor569
            (signal
             (concat (signal-value btor568) (signal-value btor567))
             (list)))
           (btor570
            (signal
             (extract 17 17 (signal-value btor547))
             (signal-state btor547)))
           (btor571
            (signal
             (concat (signal-value btor570) (signal-value btor569))
             (list)))
           (btor572
            (signal
             (extract 17 17 (signal-value btor547))
             (signal-state btor547)))
           (btor573
            (signal
             (concat (signal-value btor572) (signal-value btor571))
             (list)))
           (btor574
            (signal
             (extract 17 17 (signal-value btor547))
             (signal-state btor547)))
           (btor575
            (signal
             (concat (signal-value btor574) (signal-value btor573))
             (list)))
           (btor576
            (signal
             (extract 17 17 (signal-value btor547))
             (signal-state btor547)))
           (btor577
            (signal
             (concat (signal-value btor576) (signal-value btor575))
             (list)))
           (btor578
            (signal
             (extract 17 17 (signal-value btor547))
             (signal-state btor547)))
           (btor579
            (signal
             (concat (signal-value btor578) (signal-value btor577))
             (list)))
           (btor580
            (signal
             (extract 17 17 (signal-value btor547))
             (signal-state btor547)))
           (btor581
            (signal
             (concat (signal-value btor580) (signal-value btor579))
             (list)))
           (btor582
            (signal
             (extract 17 17 (signal-value btor547))
             (signal-state btor547)))
           (btor583
            (signal
             (concat (signal-value btor582) (signal-value btor581))
             (list)))
           (btor584
            (signal
             (extract 17 17 (signal-value btor547))
             (signal-state btor547)))
           (btor585
            (signal
             (concat (signal-value btor584) (signal-value btor583))
             (list)))
           (btor586
            (signal
             (extract 17 17 (signal-value btor547))
             (signal-state btor547)))
           (btor587
            (signal
             (concat (signal-value btor586) (signal-value btor585))
             (list)))
           (btor588
            (signal
             (extract 17 17 (signal-value btor547))
             (signal-state btor547)))
           (btor589
            (signal
             (concat (signal-value btor588) (signal-value btor587))
             (list)))
           (btor590
            (signal
             (extract 17 17 (signal-value btor547))
             (signal-state btor547)))
           (btor591
            (signal
             (concat (signal-value btor590) (signal-value btor589))
             (list)))
           (btor592
            (signal
             (extract 17 17 (signal-value btor547))
             (signal-state btor547)))
           (btor593
            (signal
             (concat (signal-value btor592) (signal-value btor591))
             (list)))
           (btor594
            (signal
             (extract 17 17 (signal-value btor547))
             (signal-state btor547)))
           (btor595
            (signal
             (concat (signal-value btor594) (signal-value btor593))
             (list)))
           (btor596
            (signal
             (extract 17 17 (signal-value btor547))
             (signal-state btor547)))
           (btor597
            (signal
             (concat (signal-value btor596) (signal-value btor595))
             (list)))
           (btor598
            (signal
             (extract 17 17 (signal-value btor547))
             (signal-state btor547)))
           (btor599
            (signal
             (concat (signal-value btor598) (signal-value btor597))
             (list)))
           (btor600
            (signal
             (extract 17 17 (signal-value btor547))
             (signal-state btor547)))
           (btor601
            (signal
             (concat (signal-value btor600) (signal-value btor599))
             (list)))
           (btor602
            (signal
             (bvmul (signal-value btor545) (signal-value btor601))
             (list)))
           (btor603 (bv->signal (bv 0 (bitvector 45))))
           (btor604
            (if (bitvector->bool (signal-value btor469)) btor603 btor602))
           (btor605
            (signal
             (extract 43 0 (signal-value btor604))
             (signal-state btor604)))
           (btor606 (bv->signal (bv 5864062014805 (bitvector 43))))
           (btor607
            (bv->signal
             (zero-extend (signal-value btor606) (bitvector 44))
             btor606))
           (btor608
            (signal
             (bvand (signal-value btor605) (signal-value btor607))
             (list)))
           (btor609
            (signal
             (concat (signal-value btor97) (signal-value btor608))
             (list)))
           (btor610
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state610")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state610"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state610")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state610")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 45))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor611
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state611")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state611"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state611")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state611")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 45))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor612
            (if (bitvector->bool (signal-value btor104)) btor611 btor610))
           (btor613
            (signal (extract 0 0 (signal-value btor69)) (signal-state btor69)))
           (btor614
            (if (bitvector->bool (signal-value btor613)) btor612 btor609))
           (btor615
            (signal
             (apply bvor (bitvector->bits (signal-value btor167)))
             (signal-state btor167)))
           (btor616 (signal (bvnot (signal-value btor615)) (list)))
           (btor617
            (if (bitvector->bool (signal-value btor616)) btor614 btor414))
           (btor618
            (signal
             (extract 44 44 (signal-value btor617))
             (signal-state btor617)))
           (btor619
            (signal
             (concat (signal-value btor618) (signal-value btor617))
             (list)))
           (btor620
            (signal
             (extract 44 44 (signal-value btor617))
             (signal-state btor617)))
           (btor621
            (signal
             (concat (signal-value btor620) (signal-value btor619))
             (list)))
           (btor622
            (signal
             (extract 44 44 (signal-value btor617))
             (signal-state btor617)))
           (btor623
            (signal
             (concat (signal-value btor622) (signal-value btor621))
             (list)))
           (btor624
            (signal
             (extract 1 0 (signal-value btor307))
             (signal-state btor307)))
           (btor625
            (bv->signal
             (zero-extend (signal-value btor97) (bitvector 2))
             btor97))
           (btor626
            (signal
             (bool->bitvector
              (bveq (signal-value btor624) (signal-value btor625)))
             (list)))
           (btor627
            (if (bitvector->bool (signal-value btor626)) btor623 btor413))
           (btor628
            (signal
             (concat (signal-value btor121) (signal-value btor141))
             (list)))
           (btor629
            (signal
             (bool->bitvector
              (bveq (signal-value btor624) (signal-value btor317)))
             (list)))
           (btor630
            (if (bitvector->bool (signal-value btor629)) btor628 btor323))
           (btor631
            (signal
             (bool->bitvector
              (bveq (signal-value btor624) (signal-value btor103)))
             (list)))
           (btor632
            (signal
             (bvor (signal-value btor631) (signal-value btor629))
             (list)))
           (btor633
            (if (bitvector->bool (signal-value btor632)) btor630 btor627))
           (btor634
            (signal
             (bvxor (signal-value btor409) (signal-value btor633))
             (list)))
           (btor635 (bv->signal (bv 11728124029610 (bitvector 44))))
           (btor636
            (signal
             (bvand (signal-value btor605) (signal-value btor635))
             (list)))
           (btor637
            (signal
             (extract 44 44 (signal-value btor604))
             (signal-state btor604)))
           (btor638 (signal (bvnot (signal-value btor637)) (list)))
           (btor639
            (signal
             (concat (signal-value btor638) (signal-value btor636))
             (list)))
           (btor640
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state640")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state640"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state640")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state640")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 45))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
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
                          (bv 0 45))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor642
            (if (bitvector->bool (signal-value btor104)) btor641 btor640))
           (btor643
            (if (bitvector->bool (signal-value btor613)) btor642 btor639))
           (btor644
            (if (bitvector->bool (signal-value btor616)) btor643 btor414))
           (btor645
            (signal
             (extract 3 2 (signal-value btor307))
             (signal-state btor307)))
           (btor646
            (bv->signal
             (zero-extend (signal-value btor97) (bitvector 2))
             btor97))
           (btor647
            (signal
             (bool->bitvector
              (bveq (signal-value btor645) (signal-value btor646)))
             (list)))
           (btor648
            (if (bitvector->bool (signal-value btor647)) btor644 btor603))
           (btor649
            (signal
             (concat (signal-value btor429) (signal-value btor648))
             (list)))
           (btor650 (bv->signal (bv 281474976710655 (bitvector 48))))
           (btor651
            (signal
             (bool->bitvector
              (bveq (signal-value btor645) (signal-value btor317)))
             (list)))
           (btor652
            (if (bitvector->bool (signal-value btor651)) btor316 btor650))
           (btor653
            (signal
             (bool->bitvector
              (bveq (signal-value btor645) (signal-value btor103)))
             (list)))
           (btor654
            (signal
             (bvor (signal-value btor653) (signal-value btor651))
             (list)))
           (btor655
            (if (bitvector->bool (signal-value btor654)) btor652 btor649))
           (btor656
            (signal
             (bvxor (signal-value btor634) (signal-value btor655))
             (list)))
           (btor657
            (signal
             (bvand (signal-value btor633) (signal-value btor655))
             (list)))
           (btor658
            (signal
             (bvand (signal-value btor409) (signal-value btor655))
             (list)))
           (btor659
            (signal
             (bvor (signal-value btor657) (signal-value btor658))
             (list)))
           (btor660
            (signal
             (bvand (signal-value btor633) (signal-value btor409))
             (list)))
           (btor661
            (signal
             (bvor (signal-value btor659) (signal-value btor660))
             (list)))
           (btor662
            (signal
             (extract 3 3 (signal-value btor151))
             (signal-state btor151)))
           (btor663
            (if (bitvector->bool (signal-value btor662)) btor661 btor656))
           (btor664
            (signal
             (extract 2 2 (signal-value btor151))
             (signal-state btor151)))
           (btor665
            (if (bitvector->bool (signal-value btor664)) btor301 btor661))
           (btor666
            (signal
             (extract 11 11 (signal-value btor665))
             (signal-state btor665)))
           (btor667
            (signal
             (bvand (signal-value btor666) (signal-value btor169))
             (list)))
           (btor668
            (signal
             (extract 23 23 (signal-value btor665))
             (signal-state btor665)))
           (btor669
            (signal
             (bvand (signal-value btor668) (signal-value btor616))
             (list)))
           (btor670
            (signal
             (extract 35 35 (signal-value btor665))
             (signal-state btor665)))
           (btor671
            (signal
             (bvand (signal-value btor670) (signal-value btor169))
             (list)))
           (btor672
            (signal
             (extract 10 0 (signal-value btor665))
             (signal-state btor665)))
           (btor673
            (signal
             (concat (signal-value btor672) (signal-value btor106))
             (list)))
           (btor674
            (signal
             (concat (signal-value btor667) (signal-value btor673))
             (list)))
           (btor675
            (signal
             (extract 22 12 (signal-value btor665))
             (signal-state btor665)))
           (btor676
            (signal
             (concat (signal-value btor675) (signal-value btor674))
             (list)))
           (btor677
            (signal
             (concat (signal-value btor669) (signal-value btor676))
             (list)))
           (btor678
            (signal
             (extract 34 24 (signal-value btor665))
             (signal-state btor665)))
           (btor679
            (signal
             (concat (signal-value btor678) (signal-value btor677))
             (list)))
           (btor680
            (signal
             (concat (signal-value btor671) (signal-value btor679))
             (list)))
           (btor681
            (signal
             (extract 46 36 (signal-value btor665))
             (signal-state btor665)))
           (btor682
            (signal
             (concat (signal-value btor681) (signal-value btor680))
             (list)))
           (btor683
            (signal
             (bvand (signal-value btor663) (signal-value btor682))
             (list)))
           (btor684
            (signal
             (extract 8 7 (signal-value btor307))
             (signal-state btor307)))
           (btor685
            (bv->signal
             (zero-extend (signal-value btor97) (bitvector 2))
             btor97))
           (btor686
            (signal
             (bool->bitvector
              (bveq (signal-value btor684) (signal-value btor685)))
             (list)))
           (btor687
            (if (bitvector->bool (signal-value btor686)) btor323 btor301))
           (btor688
            (signal
             (bool->bitvector
              (bveq (signal-value btor684) (signal-value btor317)))
             (list)))
           (btor689
            (if (bitvector->bool (signal-value btor688)) btor316 btor77))
           (btor690
            (signal
             (bool->bitvector
              (bveq (signal-value btor684) (signal-value btor103)))
             (list)))
           (btor691
            (signal
             (bvor (signal-value btor690) (signal-value btor688))
             (list)))
           (btor692
            (if (bitvector->bool (signal-value btor691)) btor689 btor687))
           (btor693
            (signal
             (bvand (signal-value btor692) (signal-value btor682))
             (list)))
           (btor694
            (signal
             (bvor (signal-value btor683) (signal-value btor693))
             (list)))
           (btor695
            (signal
             (bvand (signal-value btor663) (signal-value btor692))
             (list)))
           (btor696
            (signal
             (bvor (signal-value btor694) (signal-value btor695))
             (list)))
           (btor697
            (signal
             (extract 35 35 (signal-value btor696))
             (signal-state btor696)))
           (btor698
            (signal
             (bvand (signal-value btor169) (signal-value btor697))
             (list)))
           (btor699
            (signal
             (extract 47 36 (signal-value btor696))
             (signal-state btor696)))
           (btor700
            (signal
             (concat (signal-value btor699) (signal-value btor698))
             (list)))
           (btor701
            (bv->signal
             (zero-extend (signal-value btor700) (bitvector 14))
             btor700))
           (btor702
            (signal
             (bvxor (signal-value btor663) (signal-value btor682))
             (list)))
           (btor703
            (signal
             (bvxor (signal-value btor702) (signal-value btor692))
             (list)))
           (btor704
            (signal
             (extract 47 36 (signal-value btor703))
             (signal-state btor703)))
           (btor705
            (signal
             (extract 47 47 (signal-value btor665))
             (signal-state btor665)))
           (btor706
            (signal
             (concat (signal-value btor705) (signal-value btor704))
             (list)))
           (btor707
            (bv->signal
             (zero-extend (signal-value btor706) (bitvector 14))
             btor706))
           (btor708
            (signal
             (bvadd (signal-value btor701) (signal-value btor707))
             (list)))
           (btor709
            (signal
             (extract 23 23 (signal-value btor696))
             (signal-state btor696)))
           (btor710
            (signal
             (bvand (signal-value btor616) (signal-value btor709))
             (list)))
           (btor711
            (signal
             (extract 34 24 (signal-value btor696))
             (signal-state btor696)))
           (btor712
            (signal
             (concat (signal-value btor711) (signal-value btor710))
             (list)))
           (btor713
            (bv->signal
             (zero-extend (signal-value btor712) (bitvector 13))
             btor712))
           (btor714
            (signal
             (extract 35 24 (signal-value btor703))
             (signal-state btor703)))
           (btor715
            (bv->signal
             (zero-extend (signal-value btor714) (bitvector 13))
             btor714))
           (btor716
            (signal
             (bvadd (signal-value btor713) (signal-value btor715))
             (list)))
           (btor717
            (signal
             (extract 11 11 (signal-value btor696))
             (signal-state btor696)))
           (btor718
            (signal
             (bvand (signal-value btor169) (signal-value btor717))
             (list)))
           (btor719
            (signal
             (extract 22 12 (signal-value btor696))
             (signal-state btor696)))
           (btor720
            (signal
             (concat (signal-value btor719) (signal-value btor718))
             (list)))
           (btor721
            (bv->signal
             (zero-extend (signal-value btor720) (bitvector 13))
             btor720))
           (btor722
            (signal
             (extract 23 12 (signal-value btor703))
             (signal-state btor703)))
           (btor723
            (bv->signal
             (zero-extend (signal-value btor722) (bitvector 13))
             btor722))
           (btor724
            (signal
             (bvadd (signal-value btor721) (signal-value btor723))
             (list)))
           (btor725
            (signal
             (bvxor (signal-value btor27) (signal-value btor53))
             (list)))
           (btor726
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state726")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state726"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state726")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state726")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
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
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor728
            (if (bitvector->bool (signal-value btor104)) btor727 btor726))
           (btor729
            (signal (extract 0 0 (signal-value btor28)) (signal-state btor28)))
           (btor730
            (if (bitvector->bool (signal-value btor729)) btor728 btor725))
           (btor731 (signal (bvnot (signal-value btor730)) (list)))
           (btor732
            (signal
             (extract 47 47 (signal-value btor74))
             (signal-state btor74)))
           (btor733
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state733")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state733"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state733")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state733")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 3))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor734
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state734")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state734"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state734")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state734")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 3))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor735
            (if (bitvector->bool (signal-value btor104)) btor734 btor733))
           (btor736
            (signal (extract 0 0 (signal-value btor31)) (signal-state btor31)))
           (btor737
            (if (bitvector->bool (signal-value btor736)) btor735 btor30))
           (btor738
            (bv->signal
             (zero-extend (signal-value btor97) (bitvector 3))
             btor97))
           (btor739
            (signal
             (bool->bitvector
              (bveq (signal-value btor737) (signal-value btor738)))
             (list)))
           (btor740
            (if (bitvector->bool (signal-value btor739)) btor732 btor731))
           (btor741 (signal (bvnot (signal-value btor26)) (list)))
           (btor742 (signal (bvnot (signal-value btor732)) (list)))
           (btor743
            (bv->signal
             (zero-extend (signal-value btor317) (bitvector 3))
             btor317))
           (btor744
            (signal
             (bool->bitvector
              (bveq (signal-value btor737) (signal-value btor743)))
             (list)))
           (btor745
            (if (bitvector->bool (signal-value btor744)) btor742 btor741))
           (btor746
            (bv->signal
             (zero-extend (signal-value btor103) (bitvector 3))
             btor103))
           (btor747
            (signal
             (bool->bitvector
              (bveq (signal-value btor737) (signal-value btor746)))
             (list)))
           (btor748
            (signal
             (bvor (signal-value btor747) (signal-value btor744))
             (list)))
           (btor749
            (if (bitvector->bool (signal-value btor748)) btor745 btor740))
           (btor750
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state750")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state750"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state750")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state750")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor751
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state751")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state751"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state751")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state751")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor752
            (if (bitvector->bool (signal-value btor104)) btor751 btor750))
           (btor753
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state753")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state753"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state753")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state753")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 4))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor754
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state754")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state754"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state754")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state754")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 4))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor755
            (if (bitvector->bool (signal-value btor104)) btor754 btor753))
           (btor756
            (signal
             (extract 3 3 (signal-value btor755))
             (signal-state btor755)))
           (btor757
            (signal
             (bvxor (signal-value btor752) (signal-value btor756))
             (list)))
           (btor758 (signal (bvnot (signal-value btor757)) (list)))
           (btor759
            (signal
             (extract 47 47 (signal-value btor323))
             (signal-state btor323)))
           (btor760
            (signal
             (bool->bitvector
              (bveq (signal-value btor737) (signal-value btor359)))
             (list)))
           (btor761
            (if (bitvector->bool (signal-value btor760)) btor759 btor758))
           (btor762
            (signal
             (extract 26 26 (signal-value btor509))
             (signal-state btor509)))
           (btor763
            (signal
             (extract 17 17 (signal-value btor547))
             (signal-state btor547)))
           (btor764
            (signal
             (bvxor (signal-value btor762) (signal-value btor763))
             (list)))
           (btor765 (signal (bvnot (signal-value btor764)) (list)))
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
           (btor767
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state767")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state767"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state767")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state767")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor768
            (if (bitvector->bool (signal-value btor104)) btor767 btor766))
           (btor769
            (if (bitvector->bool (signal-value btor613)) btor768 btor765))
           (btor770 (signal (bvnot (signal-value btor769)) (list)))
           (btor771 (signal (bvnot (signal-value btor759)) (list)))
           (btor772
            (signal
             (bool->bitvector
              (bveq (signal-value btor737) (signal-value btor111)))
             (list)))
           (btor773
            (if (bitvector->bool (signal-value btor772)) btor771 btor770))
           (btor774 (bv->signal (bv 6 (bitvector 3))))
           (btor775
            (signal
             (bool->bitvector
              (bveq (signal-value btor737) (signal-value btor774)))
             (list)))
           (btor776
            (signal
             (bvor (signal-value btor775) (signal-value btor772))
             (list)))
           (btor777
            (if (bitvector->bool (signal-value btor776)) btor773 btor761))
           (btor778
            (signal
             (bool->bitvector
              (bveq (signal-value btor737) (signal-value btor400)))
             (list)))
           (btor779
            (signal
             (concat (signal-value btor760) (signal-value btor776))
             (list)))
           (btor780
            (signal
             (concat (signal-value btor778) (signal-value btor779))
             (list)))
           (btor781
            (signal
             (apply bvor (bitvector->bits (signal-value btor780)))
             (signal-state btor780)))
           (btor782
            (if (bitvector->bool (signal-value btor781)) btor777 btor749))
           (btor783 (signal (bvnot (signal-value btor782)) (list)))
           (btor784
            (signal
             (bvor (signal-value btor662) (signal-value btor664))
             (list)))
           (btor785
            (if (bitvector->bool (signal-value btor784)) btor106 btor783))
           (btor786
            (signal
             (extract 10 0 (signal-value btor696))
             (signal-state btor696)))
           (btor787
            (signal
             (concat (signal-value btor786) (signal-value btor785))
             (list)))
           (btor788
            (bv->signal
             (zero-extend (signal-value btor787) (bitvector 13))
             btor787))
           (btor789
            (signal
             (extract 11 0 (signal-value btor703))
             (signal-state btor703)))
           (btor790
            (bv->signal
             (zero-extend (signal-value btor789) (bitvector 13))
             btor789))
           (btor791
            (signal
             (bvadd (signal-value btor788) (signal-value btor790))
             (list)))
           (btor792
            (signal
             (extract 12 12 (signal-value btor791))
             (signal-state btor791)))
           (btor793
            (signal
             (bvand (signal-value btor169) (signal-value btor792))
             (list)))
           (btor794
            (bv->signal
             (zero-extend (signal-value btor793) (bitvector 13))
             btor793))
           (btor795
            (signal
             (bvadd (signal-value btor724) (signal-value btor794))
             (list)))
           (btor796
            (signal
             (extract 12 12 (signal-value btor795))
             (signal-state btor795)))
           (btor797
            (signal
             (bvand (signal-value btor616) (signal-value btor796))
             (list)))
           (btor798
            (bv->signal
             (zero-extend (signal-value btor797) (bitvector 13))
             btor797))
           (btor799
            (signal
             (bvadd (signal-value btor716) (signal-value btor798))
             (list)))
           (btor800
            (signal
             (extract 12 12 (signal-value btor799))
             (signal-state btor799)))
           (btor801
            (signal
             (bvand (signal-value btor169) (signal-value btor800))
             (list)))
           (btor802
            (bv->signal
             (zero-extend (signal-value btor801) (bitvector 14))
             btor801))
           (btor803
            (signal
             (bvadd (signal-value btor708) (signal-value btor802))
             (list)))
           (btor804
            (signal
             (extract 12 12 (signal-value btor803))
             (signal-state btor803)))
           (btor805
            (signal
             (bvxor (signal-value btor154) (signal-value btor804))
             (list)))
           (btor806
            (signal
             (bvxor (signal-value btor154) (signal-value btor805))
             (list)))
           (btor807
            (signal (extract 0 0 (signal-value btor76)) (signal-state btor76)))
           (btor808
            (if (bitvector->bool (signal-value btor807)) btor757 btor806))
           (btor810
            (signal
             (bvxor (signal-value btor717) (signal-value btor792))
             (list)))
           (btor811
            (signal
             (bvxor (signal-value btor810) (signal-value btor666))
             (list)))
           (btor812
            (signal
             (bvxor (signal-value btor154) (signal-value btor811))
             (list)))
           (btor813
            (signal
             (extract 3 0 (signal-value btor307))
             (signal-state btor307)))
           (btor814
            (bv->signal
             (zero-extend (signal-value btor359) (bitvector 4))
             btor359))
           (btor815
            (signal
             (bool->bitvector
              (bveq (signal-value btor813) (signal-value btor814)))
             (list)))
           (btor816
            (signal
             (extract 3 2 (signal-value btor151))
             (signal-state btor151)))
           (btor817
            (signal
             (apply bvor (bitvector->bits (signal-value btor816)))
             (signal-state btor816)))
           (btor818
            (signal
             (bvor (signal-value btor815) (signal-value btor817))
             (list)))
           (btor819
            (if (bitvector->bool (signal-value btor818)) btor106 btor812))
           (btor820
            (bv->signal
             (zero-extend (signal-value btor97) (bitvector 2))
             btor97))
           (btor821
            (signal
             (bool->bitvector
              (bveq (signal-value btor167) (signal-value btor820)))
             (list)))
           (btor822
            (if (bitvector->bool (signal-value btor821)) btor819 btor106))
           (btor823
            (signal
             (bvxor (signal-value btor709) (signal-value btor796))
             (list)))
           (btor824
            (signal
             (bvxor (signal-value btor823) (signal-value btor668))
             (list)))
           (btor825
            (signal
             (bvxor (signal-value btor154) (signal-value btor824))
             (list)))
           (btor826
            (if (bitvector->bool (signal-value btor818)) btor106 btor825))
           (btor827
            (signal
             (apply bvor (bitvector->bits (signal-value btor167)))
             (signal-state btor167)))
           (btor828
            (if (bitvector->bool (signal-value btor827)) btor826 btor106))
           (btor829
            (signal
             (bvxor (signal-value btor697) (signal-value btor800))
             (list)))
           (btor830
            (signal
             (bvxor (signal-value btor829) (signal-value btor670))
             (list)))
           (btor831
            (signal
             (bvxor (signal-value btor154) (signal-value btor830))
             (list)))
           (btor832
            (if (bitvector->bool (signal-value btor818)) btor106 btor831))
           (btor833
            (if (bitvector->bool (signal-value btor821)) btor832 btor106))
           (btor834
            (signal
             (concat (signal-value btor828) (signal-value btor822))
             (list)))
           (btor835
            (signal
             (concat (signal-value btor833) (signal-value btor834))
             (list)))
           (btor836
            (signal
             (concat (signal-value btor805) (signal-value btor835))
             (list)))
           (btor837
            (if (bitvector->bool (signal-value btor807)) btor755 btor836))
           (btor839
            (signal
             (extract 13 13 (signal-value btor803))
             (signal-state btor803)))
           (btor840
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state840")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state840"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state840")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state840")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor841
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state841")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state841"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state841")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state841")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor842
            (if (bitvector->bool (signal-value btor104)) btor841 btor840))
           (btor843
            (if (bitvector->bool (signal-value btor807)) btor842 btor839))
           (btor845 (bv->signal (bv 17 (bitvector 5))))
           (btor846
            (signal
             (bool->bitvector
              (bveq (signal-value btor89) (signal-value btor845)))
             (list)))
           (btor847
            (if (bitvector->bool (signal-value btor846)) btor97 btor106))
           (btor848 (bv->signal (bv 9 (bitvector 4))))
           (btor849
            (bv->signal
             (zero-extend (signal-value btor848) (bitvector 5))
             btor848))
           (btor850
            (signal
             (bool->bitvector
              (bveq (signal-value btor89) (signal-value btor849)))
             (list)))
           (btor851
            (if (bitvector->bool (signal-value btor850)) btor106 btor847))
           (btor852
            (if (bitvector->bool (signal-value btor851)) btor316 btor73))
           (btor853
            (signal
             (extract 1 1 (signal-value btor151))
             (signal-state btor151)))
           (btor854
            (signal
             (extract 1 1 (signal-value btor151))
             (signal-state btor151)))
           (btor855
            (signal
             (concat (signal-value btor854) (signal-value btor853))
             (list)))
           (btor856
            (signal
             (extract 1 1 (signal-value btor151))
             (signal-state btor151)))
           (btor857
            (signal
             (concat (signal-value btor856) (signal-value btor855))
             (list)))
           (btor858
            (signal
             (extract 1 1 (signal-value btor151))
             (signal-state btor151)))
           (btor859
            (signal
             (concat (signal-value btor858) (signal-value btor857))
             (list)))
           (btor860
            (signal
             (extract 1 1 (signal-value btor151))
             (signal-state btor151)))
           (btor861
            (signal
             (concat (signal-value btor860) (signal-value btor859))
             (list)))
           (btor862
            (signal
             (extract 1 1 (signal-value btor151))
             (signal-state btor151)))
           (btor863
            (signal
             (concat (signal-value btor862) (signal-value btor861))
             (list)))
           (btor864
            (signal
             (extract 1 1 (signal-value btor151))
             (signal-state btor151)))
           (btor865
            (signal
             (concat (signal-value btor864) (signal-value btor863))
             (list)))
           (btor866
            (signal
             (extract 1 1 (signal-value btor151))
             (signal-state btor151)))
           (btor867
            (signal
             (concat (signal-value btor866) (signal-value btor865))
             (list)))
           (btor868
            (signal
             (extract 1 1 (signal-value btor151))
             (signal-state btor151)))
           (btor869
            (signal
             (concat (signal-value btor868) (signal-value btor867))
             (list)))
           (btor870
            (signal
             (extract 1 1 (signal-value btor151))
             (signal-state btor151)))
           (btor871
            (signal
             (concat (signal-value btor870) (signal-value btor869))
             (list)))
           (btor872
            (signal
             (extract 1 1 (signal-value btor151))
             (signal-state btor151)))
           (btor873
            (signal
             (concat (signal-value btor872) (signal-value btor871))
             (list)))
           (btor874
            (signal
             (extract 1 1 (signal-value btor151))
             (signal-state btor151)))
           (btor875
            (signal
             (concat (signal-value btor874) (signal-value btor873))
             (list)))
           (btor876
            (signal
             (extract 1 1 (signal-value btor151))
             (signal-state btor151)))
           (btor877
            (signal
             (concat (signal-value btor876) (signal-value btor875))
             (list)))
           (btor878
            (signal
             (extract 1 1 (signal-value btor151))
             (signal-state btor151)))
           (btor879
            (signal
             (concat (signal-value btor878) (signal-value btor877))
             (list)))
           (btor880
            (signal
             (extract 1 1 (signal-value btor151))
             (signal-state btor151)))
           (btor881
            (signal
             (concat (signal-value btor880) (signal-value btor879))
             (list)))
           (btor882
            (signal
             (extract 1 1 (signal-value btor151))
             (signal-state btor151)))
           (btor883
            (signal
             (concat (signal-value btor882) (signal-value btor881))
             (list)))
           (btor884
            (signal
             (extract 1 1 (signal-value btor151))
             (signal-state btor151)))
           (btor885
            (signal
             (concat (signal-value btor884) (signal-value btor883))
             (list)))
           (btor886
            (signal
             (extract 1 1 (signal-value btor151))
             (signal-state btor151)))
           (btor887
            (signal
             (concat (signal-value btor886) (signal-value btor885))
             (list)))
           (btor888
            (signal
             (extract 1 1 (signal-value btor151))
             (signal-state btor151)))
           (btor889
            (signal
             (concat (signal-value btor888) (signal-value btor887))
             (list)))
           (btor890
            (signal
             (extract 1 1 (signal-value btor151))
             (signal-state btor151)))
           (btor891
            (signal
             (concat (signal-value btor890) (signal-value btor889))
             (list)))
           (btor892
            (signal
             (extract 1 1 (signal-value btor151))
             (signal-state btor151)))
           (btor893
            (signal
             (concat (signal-value btor892) (signal-value btor891))
             (list)))
           (btor894
            (signal
             (extract 1 1 (signal-value btor151))
             (signal-state btor151)))
           (btor895
            (signal
             (concat (signal-value btor894) (signal-value btor893))
             (list)))
           (btor896
            (signal
             (extract 1 1 (signal-value btor151))
             (signal-state btor151)))
           (btor897
            (signal
             (concat (signal-value btor896) (signal-value btor895))
             (list)))
           (btor898
            (signal
             (extract 1 1 (signal-value btor151))
             (signal-state btor151)))
           (btor899
            (signal
             (concat (signal-value btor898) (signal-value btor897))
             (list)))
           (btor900
            (signal
             (extract 1 1 (signal-value btor151))
             (signal-state btor151)))
           (btor901
            (signal
             (concat (signal-value btor900) (signal-value btor899))
             (list)))
           (btor902
            (signal
             (extract 1 1 (signal-value btor151))
             (signal-state btor151)))
           (btor903
            (signal
             (concat (signal-value btor902) (signal-value btor901))
             (list)))
           (btor904
            (signal
             (extract 1 1 (signal-value btor151))
             (signal-state btor151)))
           (btor905
            (signal
             (concat (signal-value btor904) (signal-value btor903))
             (list)))
           (btor906
            (signal
             (extract 1 1 (signal-value btor151))
             (signal-state btor151)))
           (btor907
            (signal
             (concat (signal-value btor906) (signal-value btor905))
             (list)))
           (btor908
            (signal
             (extract 1 1 (signal-value btor151))
             (signal-state btor151)))
           (btor909
            (signal
             (concat (signal-value btor908) (signal-value btor907))
             (list)))
           (btor910
            (signal
             (extract 1 1 (signal-value btor151))
             (signal-state btor151)))
           (btor911
            (signal
             (concat (signal-value btor910) (signal-value btor909))
             (list)))
           (btor912
            (signal
             (extract 1 1 (signal-value btor151))
             (signal-state btor151)))
           (btor913
            (signal
             (concat (signal-value btor912) (signal-value btor911))
             (list)))
           (btor914
            (signal
             (extract 1 1 (signal-value btor151))
             (signal-state btor151)))
           (btor915
            (signal
             (concat (signal-value btor914) (signal-value btor913))
             (list)))
           (btor916
            (signal
             (extract 1 1 (signal-value btor151))
             (signal-state btor151)))
           (btor917
            (signal
             (concat (signal-value btor916) (signal-value btor915))
             (list)))
           (btor918
            (signal
             (extract 1 1 (signal-value btor151))
             (signal-state btor151)))
           (btor919
            (signal
             (concat (signal-value btor918) (signal-value btor917))
             (list)))
           (btor920
            (signal
             (extract 1 1 (signal-value btor151))
             (signal-state btor151)))
           (btor921
            (signal
             (concat (signal-value btor920) (signal-value btor919))
             (list)))
           (btor922
            (signal
             (extract 1 1 (signal-value btor151))
             (signal-state btor151)))
           (btor923
            (signal
             (concat (signal-value btor922) (signal-value btor921))
             (list)))
           (btor924
            (signal
             (extract 1 1 (signal-value btor151))
             (signal-state btor151)))
           (btor925
            (signal
             (concat (signal-value btor924) (signal-value btor923))
             (list)))
           (btor926
            (signal
             (extract 1 1 (signal-value btor151))
             (signal-state btor151)))
           (btor927
            (signal
             (concat (signal-value btor926) (signal-value btor925))
             (list)))
           (btor928
            (signal
             (extract 1 1 (signal-value btor151))
             (signal-state btor151)))
           (btor929
            (signal
             (concat (signal-value btor928) (signal-value btor927))
             (list)))
           (btor930
            (signal
             (extract 1 1 (signal-value btor151))
             (signal-state btor151)))
           (btor931
            (signal
             (concat (signal-value btor930) (signal-value btor929))
             (list)))
           (btor932
            (signal
             (extract 1 1 (signal-value btor151))
             (signal-state btor151)))
           (btor933
            (signal
             (concat (signal-value btor932) (signal-value btor931))
             (list)))
           (btor934
            (signal
             (extract 1 1 (signal-value btor151))
             (signal-state btor151)))
           (btor935
            (signal
             (concat (signal-value btor934) (signal-value btor933))
             (list)))
           (btor936
            (signal
             (extract 1 1 (signal-value btor151))
             (signal-state btor151)))
           (btor937
            (signal
             (concat (signal-value btor936) (signal-value btor935))
             (list)))
           (btor938
            (signal
             (extract 1 1 (signal-value btor151))
             (signal-state btor151)))
           (btor939
            (signal
             (concat (signal-value btor938) (signal-value btor937))
             (list)))
           (btor940
            (signal
             (extract 1 1 (signal-value btor151))
             (signal-state btor151)))
           (btor941
            (signal
             (concat (signal-value btor940) (signal-value btor939))
             (list)))
           (btor942
            (signal
             (extract 1 1 (signal-value btor151))
             (signal-state btor151)))
           (btor943
            (signal
             (concat (signal-value btor942) (signal-value btor941))
             (list)))
           (btor944
            (signal
             (extract 1 1 (signal-value btor151))
             (signal-state btor151)))
           (btor945
            (signal
             (concat (signal-value btor944) (signal-value btor943))
             (list)))
           (btor946
            (signal
             (extract 1 1 (signal-value btor151))
             (signal-state btor151)))
           (btor947
            (signal
             (concat (signal-value btor946) (signal-value btor945))
             (list)))
           (btor948
            (signal
             (extract 11 0 (signal-value btor791))
             (signal-state btor791)))
           (btor949
            (signal
             (extract 11 0 (signal-value btor795))
             (signal-state btor795)))
           (btor950
            (signal
             (concat (signal-value btor949) (signal-value btor948))
             (list)))
           (btor951
            (signal
             (extract 11 0 (signal-value btor799))
             (signal-state btor799)))
           (btor952
            (signal
             (concat (signal-value btor951) (signal-value btor950))
             (list)))
           (btor953
            (signal
             (extract 11 0 (signal-value btor803))
             (signal-state btor803)))
           (btor954
            (signal
             (concat (signal-value btor953) (signal-value btor952))
             (list)))
           (btor955
            (signal
             (bvxor (signal-value btor947) (signal-value btor954))
             (list)))
           (btor956
            (signal
             (bvxor (signal-value btor852) (signal-value btor955))
             (list)))
           (btor957 (signal (bvnot (signal-value btor956)) (list)))
           (btor958
            (signal
             (extract 45 0 (signal-value btor316))
             (signal-state btor316)))
           (btor959 (signal (bvnot (signal-value btor958)) (list)))
           (btor960
            (signal
             (concat (signal-value btor959) (signal-value btor156))
             (list)))
           (btor961 (bv->signal (bv 23 (bitvector 5))))
           (btor962
            (signal
             (bool->bitvector
              (bveq (signal-value btor88) (signal-value btor961)))
             (list)))
           (btor963
            (if (bitvector->bool (signal-value btor962)) btor317 btor156))
           (btor964 (bv->signal (bv 22 (bitvector 5))))
           (btor965
            (signal
             (bool->bitvector
              (bveq (signal-value btor88) (signal-value btor964)))
             (list)))
           (btor966
            (if (bitvector->bool (signal-value btor965)) btor103 btor963))
           (btor967
            (signal
             (bool->bitvector
              (bveq (signal-value btor88) (signal-value btor845)))
             (list)))
           (btor968
            (if (bitvector->bool (signal-value btor967)) btor160 btor966))
           (btor969 (bv->signal (bv 8 (bitvector 4))))
           (btor970
            (bv->signal
             (zero-extend (signal-value btor969) (bitvector 5))
             btor969))
           (btor971
            (signal
             (bool->bitvector
              (bveq (signal-value btor88) (signal-value btor970)))
             (list)))
           (btor972
            (if (bitvector->bool (signal-value btor971)) btor156 btor968))
           (btor973
            (signal
             (bool->bitvector
              (bveq (signal-value btor972) (signal-value btor317)))
             (list)))
           (btor974
            (if (bitvector->bool (signal-value btor973)) btor960 btor68))
           (btor975
            (signal
             (extract 46 0 (signal-value btor316))
             (signal-state btor316)))
           (btor976 (signal (bvnot (signal-value btor975)) (list)))
           (btor977
            (signal
             (concat (signal-value btor976) (signal-value btor106))
             (list)))
           (btor978
            (signal
             (bool->bitvector
              (bveq (signal-value btor972) (signal-value btor103)))
             (list)))
           (btor979
            (if (bitvector->bool (signal-value btor978)) btor977 btor974))
           (btor980
            (bv->signal
             (zero-extend (signal-value btor97) (bitvector 2))
             btor97))
           (btor981
            (signal
             (bool->bitvector
              (bveq (signal-value btor972) (signal-value btor980)))
             (list)))
           (btor982
            (if (bitvector->bool (signal-value btor981)) btor316 btor979))
           (btor983 (bv->signal (bv 21 (bitvector 5))))
           (btor984
            (signal
             (bool->bitvector
              (bveq (signal-value btor91) (signal-value btor983)))
             (list)))
           (btor985
            (if (bitvector->bool (signal-value btor984)) btor97 btor106))
           (btor986 (bv->signal (bv 11 (bitvector 4))))
           (btor987
            (bv->signal
             (zero-extend (signal-value btor986) (bitvector 5))
             btor986))
           (btor988
            (signal
             (bool->bitvector
              (bveq (signal-value btor91) (signal-value btor987)))
             (list)))
           (btor989
            (if (bitvector->bool (signal-value btor988)) btor106 btor985))
           (btor990
            (if (bitvector->bool (signal-value btor989)) btor982 btor650))
           (btor991
            (signal
             (bvor (signal-value btor957) (signal-value btor990))
             (list)))
           (btor992
            (signal
             (apply bvand (bitvector->bits (signal-value btor991)))
             (signal-state btor991)))
           (btor993
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state993")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state993"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state993")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state993")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
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
            (if (bitvector->bool (signal-value btor104)) btor994 btor993))
           (btor996
            (if (bitvector->bool (signal-value btor807)) btor995 btor992))
           (btor997 (signal (bvnot (signal-value btor996)) (list)))
           (btor998
            (signal
             (bvor (signal-value btor956) (signal-value btor990))
             (list)))
           (btor999
            (signal
             (apply bvand (bitvector->bits (signal-value btor998)))
             (signal-state btor998)))
           (btor1000
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1000")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1000"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1000")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1000")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1001
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1001")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1001"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1001")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1001")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1002
            (if (bitvector->bool (signal-value btor104)) btor1001 btor1000))
           (btor1003
            (if (bitvector->bool (signal-value btor807)) btor1002 btor999))
           (btor1004 (signal (bvnot (signal-value btor1003)) (list)))
           (btor1005
            (signal
             (bvand (signal-value btor997) (signal-value btor1004))
             (list)))
           (btor1006
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1006")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1006"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1006")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1006")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1007
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1007")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1007"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1007")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1007")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1008
            (if (bitvector->bool (signal-value btor104)) btor1007 btor1006))
           (btor1009
            (if (bitvector->bool (signal-value btor807)) btor1008 btor992))
           (btor1010
            (signal
             (bvand (signal-value btor1005) (signal-value btor1009))
             (list)))
           (btor1011
            (if (bitvector->bool (signal-value btor989)) btor1010 btor106))
           (btor1013
            (if (bitvector->bool (signal-value btor807)) btor323 btor955))
           (btor1018
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1018")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1018"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1018")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1018")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1019
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1019")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1019"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1019")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1019")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1020
            (if (bitvector->bool (signal-value btor104)) btor1019 btor1018))
           (btor1021
            (if (bitvector->bool (signal-value btor807)) btor1020 btor999))
           (btor1022
            (signal
             (bvand (signal-value btor1005) (signal-value btor1021))
             (list)))
           (btor1023
            (if (bitvector->bool (signal-value btor989)) btor1022 btor106))
           (btor1025
            (signal
             (extract 5 0 (signal-value btor656))
             (signal-state btor656)))
           (btor1026
            (signal
             (apply bvxor (bitvector->bits (signal-value btor1025)))
             (signal-state btor1025)))
           (btor1027 (bv->signal (bv 24 (bitvector 5))))
           (btor1028
            (signal
             (bool->bitvector
              (bveq (signal-value btor93) (signal-value btor1027)))
             (list)))
           (btor1029
            (if (bitvector->bool (signal-value btor1028)) btor97 btor106))
           (btor1030 (bv->signal (bv 13 (bitvector 4))))
           (btor1031
            (bv->signal
             (zero-extend (signal-value btor1030) (bitvector 5))
             btor1030))
           (btor1032
            (signal
             (bool->bitvector
              (bveq (signal-value btor93) (signal-value btor1031)))
             (list)))
           (btor1033
            (if (bitvector->bool (signal-value btor1032)) btor106 btor1029))
           (btor1034
            (if (bitvector->bool (signal-value btor1033)) btor1026 btor106))
           (btor1035
            (signal
             (extract 11 6 (signal-value btor656))
             (signal-state btor656)))
           (btor1036
            (signal
             (apply bvxor (bitvector->bits (signal-value btor1035)))
             (signal-state btor1035)))
           (btor1037
            (if (bitvector->bool (signal-value btor1033)) btor1036 btor106))
           (btor1038
            (signal
             (bvxor (signal-value btor1034) (signal-value btor1037))
             (list)))
           (btor1039 (bv->signal (bv 26 (bitvector 5))))
           (btor1040
            (signal
             (bool->bitvector
              (bveq (signal-value btor94) (signal-value btor1039)))
             (list)))
           (btor1041
            (if (bitvector->bool (signal-value btor1040)) btor97 btor106))
           (btor1042 (bv->signal (bv 14 (bitvector 4))))
           (btor1043
            (bv->signal
             (zero-extend (signal-value btor1042) (bitvector 5))
             btor1042))
           (btor1044
            (signal
             (bool->bitvector
              (bveq (signal-value btor94) (signal-value btor1043)))
             (list)))
           (btor1045
            (if (bitvector->bool (signal-value btor1044)) btor106 btor1041))
           (btor1046
            (if (bitvector->bool (signal-value btor1045)) btor1034 btor1038))
           (btor1047
            (signal
             (extract 17 12 (signal-value btor656))
             (signal-state btor656)))
           (btor1048
            (signal
             (apply bvxor (bitvector->bits (signal-value btor1047)))
             (signal-state btor1047)))
           (btor1049
            (if (bitvector->bool (signal-value btor1033)) btor1048 btor106))
           (btor1050
            (signal
             (extract 23 18 (signal-value btor656))
             (signal-state btor656)))
           (btor1051
            (signal
             (apply bvxor (bitvector->bits (signal-value btor1050)))
             (signal-state btor1050)))
           (btor1052
            (if (bitvector->bool (signal-value btor1033)) btor1051 btor106))
           (btor1053
            (signal
             (bvxor (signal-value btor1049) (signal-value btor1052))
             (list)))
           (btor1054
            (signal
             (bvxor (signal-value btor1038) (signal-value btor1053))
             (list)))
           (btor1055
            (if (bitvector->bool (signal-value btor1045)) btor1037 btor1054))
           (btor1056
            (if (bitvector->bool (signal-value btor1045)) btor1049 btor1053))
           (btor1057
            (signal
             (extract 29 24 (signal-value btor656))
             (signal-state btor656)))
           (btor1058
            (signal
             (apply bvxor (bitvector->bits (signal-value btor1057)))
             (signal-state btor1057)))
           (btor1059
            (if (bitvector->bool (signal-value btor1033)) btor1058 btor106))
           (btor1060
            (signal
             (extract 35 30 (signal-value btor656))
             (signal-state btor656)))
           (btor1061
            (signal
             (apply bvxor (bitvector->bits (signal-value btor1060)))
             (signal-state btor1060)))
           (btor1062
            (if (bitvector->bool (signal-value btor1033)) btor1061 btor106))
           (btor1063
            (signal
             (bvxor (signal-value btor1059) (signal-value btor1062))
             (list)))
           (btor1064
            (signal
             (extract 41 36 (signal-value btor656))
             (signal-state btor656)))
           (btor1065
            (signal
             (apply bvxor (bitvector->bits (signal-value btor1064)))
             (signal-state btor1064)))
           (btor1066
            (if (bitvector->bool (signal-value btor1033)) btor1065 btor106))
           (btor1067
            (signal
             (extract 47 42 (signal-value btor656))
             (signal-state btor656)))
           (btor1068
            (signal
             (apply bvxor (bitvector->bits (signal-value btor1067)))
             (signal-state btor1067)))
           (btor1069
            (if (bitvector->bool (signal-value btor1033)) btor1068 btor106))
           (btor1070
            (signal
             (bvxor (signal-value btor1066) (signal-value btor1069))
             (list)))
           (btor1071
            (signal
             (bvxor (signal-value btor1063) (signal-value btor1070))
             (list)))
           (btor1072
            (signal
             (bvxor (signal-value btor1054) (signal-value btor1071))
             (list)))
           (btor1073
            (if (bitvector->bool (signal-value btor1045)) btor1052 btor1072))
           (btor1074
            (if (bitvector->bool (signal-value btor1045)) btor1059 btor1063))
           (btor1075
            (if (bitvector->bool (signal-value btor1045)) btor1062 btor1071))
           (btor1076
            (if (bitvector->bool (signal-value btor1045)) btor1066 btor1070))
           (btor1077
            (signal
             (concat (signal-value btor1055) (signal-value btor1046))
             (list)))
           (btor1078
            (signal
             (concat (signal-value btor1056) (signal-value btor1077))
             (list)))
           (btor1079
            (signal
             (concat (signal-value btor1073) (signal-value btor1078))
             (list)))
           (btor1080
            (signal
             (concat (signal-value btor1074) (signal-value btor1079))
             (list)))
           (btor1081
            (signal
             (concat (signal-value btor1075) (signal-value btor1080))
             (list)))
           (btor1082
            (signal
             (concat (signal-value btor1076) (signal-value btor1081))
             (list)))
           (btor1083
            (signal
             (concat (signal-value btor1069) (signal-value btor1082))
             (list)))
           (btor1084
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1084")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1084"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1084")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1084")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 8))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1085
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1085")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1085"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1085")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1085")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 8))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1086
            (if (bitvector->bool (signal-value btor104)) btor1085 btor1084))
           (btor1087
            (if (bitvector->bool (signal-value btor807)) btor1086 btor1083))
           (btor1089
            (bv->signal
             (zero-extend (signal-value btor105) (bitvector 30))
             btor105))
           (btor1090
            (bv->signal
             (zero-extend (signal-value btor437) (bitvector 27))
             btor437))
           (btor1091
            (bv->signal
             (zero-extend (signal-value btor118) (bitvector 30))
             btor118))
           (btor1092
            (bv->signal
             (zero-extend (signal-value btor122) (bitvector 2))
             btor122))
           (btor1093
            (bv->signal
             (zero-extend (signal-value btor4) (bitvector 32))
             btor4))
           (btor1094
            (bv->signal
             (zero-extend (signal-value btor5) (bitvector 30))
             btor5))
           (btor1095
            (bv->signal
             (zero-extend (signal-value btor506) (bitvector 1))
             btor506))
           (btor1096
            (bv->signal
             (zero-extend (signal-value btor507) (bitvector 1))
             btor507))
           (btor1097
            (bv->signal
             (zero-extend (signal-value btor6) (bitvector 32))
             btor6))
           (btor1098
            (bv->signal
             (zero-extend (signal-value btor508) (bitvector 27))
             btor508))
           (btor1099
            (bv->signal
             (zero-extend (signal-value btor505) (bitvector 27))
             btor505))
           (btor1100
            (bv->signal
             (zero-extend (signal-value btor502) (bitvector 27))
             btor502))
           (btor1101
            (bv->signal
             (zero-extend (signal-value btor154) (bitvector 1))
             btor154))
           (btor1102
            (bv->signal
             (zero-extend (signal-value btor752) (bitvector 1))
             btor752))
           (btor1103
            (bv->signal
             (zero-extend (signal-value btor150) (bitvector 1))
             btor150))
           (btor1104
            (bv->signal
             (zero-extend (signal-value btor9) (bitvector 32))
             btor9))
           (btor1105
            (bv->signal
             (zero-extend (signal-value btor151) (bitvector 4))
             btor151))
           (btor1106
            (bv->signal
             (zero-extend (signal-value btor146) (bitvector 4))
             btor146))
           (btor1107
            (bv->signal
             (zero-extend (signal-value btor149) (bitvector 4))
             btor149))
           (btor1108
            (bv->signal
             (zero-extend (signal-value btor955) (bitvector 48))
             btor955))
           (btor1109
            (bv->signal
             (zero-extend (signal-value btor323) (bitvector 48))
             btor323))
           (btor1110
            (bv->signal
             (zero-extend (signal-value btor762) (bitvector 1))
             btor762))
           (btor1111
            (bv->signal
             (zero-extend (signal-value btor449) (bitvector 1))
             btor449))
           (btor1112
            (bv->signal
             (zero-extend (signal-value btor446) (bitvector 16))
             btor446))
           (btor1113
            (bv->signal
             (zero-extend (signal-value btor119) (bitvector 2))
             btor119))
           (btor1114
            (bv->signal
             (zero-extend (signal-value btor12) (bitvector 32))
             btor12))
           (btor1115
            (bv->signal
             (zero-extend (signal-value btor359) (bitvector 5))
             btor359))
           (btor1116
            (signal
             (bool->bitvector
              (bveq (signal-value btor13) (signal-value btor1115)))
             (list)))
           (btor1117
            (if (bitvector->bool (signal-value btor1116)) btor103 btor156))
           (btor1118
            (bv->signal
             (zero-extend (signal-value btor400) (bitvector 5))
             btor400))
           (btor1119
            (signal
             (bool->bitvector
              (bveq (signal-value btor13) (signal-value btor1118)))
             (list)))
           (btor1120
            (if (bitvector->bool (signal-value btor1119)) btor160 btor1117))
           (btor1121
            (bv->signal
             (zero-extend (signal-value btor317) (bitvector 5))
             btor317))
           (btor1122
            (signal
             (bool->bitvector
              (bveq (signal-value btor13) (signal-value btor1121)))
             (list)))
           (btor1123
            (if (bitvector->bool (signal-value btor1122)) btor156 btor1120))
           (btor1124
            (bv->signal
             (zero-extend (signal-value btor1123) (bitvector 2))
             btor1123))
           (btor1125 (bitvector 120))
           (btor1126 (bitvector 115))
           (btor1127 (bv->signal (bv 0 (bitvector 115))))
           (btor1128
            (signal
             (concat (signal-value btor1127) (signal-value btor13))
             (list)))
           (btor1129
            (bv->signal
             (zero-extend (signal-value btor1128) (bitvector 120))
             btor1128))
           (btor1130 (bv->signal (bv 16 (bitvector 5))))
           (btor1131
            (signal
             (bool->bitvector
              (bveq (signal-value btor14) (signal-value btor1130)))
             (list)))
           (btor1132
            (if (bitvector->bool (signal-value btor1131)) btor97 btor106))
           (btor1133
            (bv->signal
             (zero-extend (signal-value btor774) (bitvector 5))
             btor774))
           (btor1134
            (signal
             (bool->bitvector
              (bveq (signal-value btor14) (signal-value btor1133)))
             (list)))
           (btor1135
            (if (bitvector->bool (signal-value btor1134)) btor106 btor1132))
           (btor1136
            (bv->signal
             (zero-extend (signal-value btor1135) (bitvector 1))
             btor1135))
           (btor1137 (bv->signal (bv 0 (bitvector 35))))
           (btor1138
            (signal
             (concat (signal-value btor1137) (signal-value btor14))
             (list)))
           (btor1139
            (bv->signal
             (zero-extend (signal-value btor1138) (bitvector 40))
             btor1138))
           (btor1140
            (bv->signal
             (zero-extend (signal-value btor121) (bitvector 30))
             btor121))
           (btor1141
            (bv->signal
             (zero-extend (signal-value btor114) (bitvector 1))
             btor114))
           (btor1142 (bitvector 56))
           (btor1143 (bitvector 51))
           (btor1144 (bv->signal (bv 0 (bitvector 51))))
           (btor1145
            (signal
             (concat (signal-value btor1144) (signal-value btor15))
             (list)))
           (btor1146
            (bv->signal
             (zero-extend (signal-value btor1145) (bitvector 56))
             btor1145))
           (btor1147
            (bv->signal
             (zero-extend (signal-value btor2) (bitvector 30))
             btor2))
           (btor1148
            (bv->signal
             (zero-extend (signal-value btor128) (bitvector 18))
             btor128))
           (btor1149
            (bv->signal
             (zero-extend (signal-value btor479) (bitvector 18))
             btor479))
           (btor1150
            (bv->signal
             (zero-extend (signal-value btor141) (bitvector 18))
             btor141))
           (btor1151
            (bv->signal
             (zero-extend (signal-value btor138) (bitvector 18))
             btor138))
           (btor1152
            (bv->signal
             (zero-extend (signal-value btor142) (bitvector 2))
             btor142))
           (btor1153
            (bv->signal
             (zero-extend (signal-value btor18) (bitvector 32))
             btor18))
           (btor1154
            (bv->signal
             (zero-extend (signal-value btor19) (bitvector 18))
             btor19))
           (btor1155
            (bv->signal
             (zero-extend (signal-value btor763) (bitvector 1))
             btor763))
           (btor1156
            (bv->signal
             (zero-extend (signal-value btor456) (bitvector 1))
             btor456))
           (btor1157
            (signal
             (concat (signal-value btor445) (signal-value btor20))
             (list)))
           (btor1158
            (bv->signal
             (zero-extend (signal-value btor1157) (bitvector 16))
             btor1157))
           (btor1159
            (bv->signal
             (zero-extend (signal-value btor139) (bitvector 2))
             btor139))
           (btor1160
            (bv->signal
             (zero-extend (signal-value btor21) (bitvector 32))
             btor21))
           (btor1161
            (bv->signal
             (zero-extend (signal-value btor141) (bitvector 18))
             btor141))
           (btor1162
            (bv->signal
             (zero-extend (signal-value btor134) (bitvector 1))
             btor134))
           (btor1163
            (signal
             (concat (signal-value btor1144) (signal-value btor22))
             (list)))
           (btor1164
            (bv->signal
             (zero-extend (signal-value btor1163) (bitvector 56))
             btor1163))
           (btor1165
            (bv->signal
             (zero-extend (signal-value btor17) (bitvector 18))
             btor17))
           (btor1166
            (bv->signal
             (zero-extend (signal-value btor26) (bitvector 1))
             btor26))
           (btor1167
            (bv->signal
             (zero-extend (signal-value btor729) (bitvector 1))
             btor729))
           (btor1168
            (bv->signal
             (zero-extend (signal-value btor28) (bitvector 32))
             btor28))
           (btor1169
            (bv->signal
             (zero-extend (signal-value btor736) (bitvector 1))
             btor736))
           (btor1170
            (bv->signal
             (zero-extend (signal-value btor31) (bitvector 32))
             btor31))
           (btor1171
            (bv->signal
             (zero-extend (signal-value btor30) (bitvector 3))
             btor30))
           (btor1172
            (bv->signal
             (zero-extend (signal-value btor737) (bitvector 3))
             btor737))
           (btor1173
            (bv->signal
             (zero-extend (signal-value btor735) (bitvector 3))
             btor735))
           (btor1174
            (bv->signal
             (zero-extend (signal-value btor725) (bitvector 1))
             btor725))
           (btor1175
            (bv->signal
             (zero-extend (signal-value btor730) (bitvector 1))
             btor730))
           (btor1176
            (bv->signal
             (zero-extend (signal-value btor728) (bitvector 1))
             btor728))
           (btor1177
            (bv->signal
             (zero-extend (signal-value btor757) (bitvector 1))
             btor757))
           (btor1178
            (bv->signal
             (zero-extend (signal-value btor32) (bitvector 1))
             btor32))
           (btor1179
            (bv->signal
             (zero-extend (signal-value btor33) (bitvector 1))
             btor33))
           (btor1180
            (bv->signal
             (zero-extend (signal-value btor34) (bitvector 1))
             btor34))
           (btor1181
            (bv->signal
             (zero-extend (signal-value btor35) (bitvector 1))
             btor35))
           (btor1182
            (bv->signal
             (zero-extend (signal-value btor36) (bitvector 1))
             btor36))
           (btor1183
            (bv->signal
             (zero-extend (signal-value btor37) (bitvector 1))
             btor37))
           (btor1184
            (bv->signal
             (zero-extend (signal-value btor39) (bitvector 1))
             btor39))
           (btor1185
            (bv->signal
             (zero-extend (signal-value btor40) (bitvector 1))
             btor40))
           (btor1186
            (bv->signal
             (zero-extend (signal-value btor38) (bitvector 1))
             btor38))
           (btor1187
            (bv->signal
             (zero-extend (signal-value btor41) (bitvector 1))
             btor41))
           (btor1188
            (bv->signal
             (zero-extend (signal-value btor42) (bitvector 1))
             btor42))
           (btor1189
            (bv->signal
             (zero-extend (signal-value btor43) (bitvector 1))
             btor43))
           (btor1190
            (bv->signal
             (zero-extend (signal-value btor44) (bitvector 1))
             btor44))
           (btor1191
            (bv->signal
             (zero-extend (signal-value btor100) (bitvector 1))
             btor100))
           (btor1192
            (bv->signal
             (zero-extend (signal-value btor836) (bitvector 4))
             btor836))
           (btor1193
            (bv->signal
             (zero-extend (signal-value btor755) (bitvector 4))
             btor755))
           (btor1194
            (bv->signal
             (zero-extend (signal-value btor315) (bitvector 1))
             btor315))
           (btor1195
            (bv->signal
             (zero-extend (signal-value btor46) (bitvector 32))
             btor46))
           (btor1196
            (bv->signal
             (zero-extend (signal-value btor316) (bitvector 48))
             btor316))
           (btor1197
            (bv->signal
             (zero-extend (signal-value btor24) (bitvector 48))
             btor24))
           (btor1198
            (bv->signal
             (zero-extend (signal-value btor314) (bitvector 48))
             btor314))
           (btor1199
            (bv->signal
             (zero-extend (signal-value btor441) (bitvector 1))
             btor441))
           (btor1200
            (bv->signal
             (zero-extend (signal-value btor471) (bitvector 1))
             btor471))
           (btor1201
            (bv->signal
             (zero-extend (signal-value btor49) (bitvector 32))
             btor49))
           (btor1202
            (bv->signal
             (zero-extend (signal-value btor472) (bitvector 27))
             btor472))
           (btor1203
            (bv->signal
             (zero-extend (signal-value btor474) (bitvector 27))
             btor474))
           (btor1204
            (bv->signal
             (zero-extend (signal-value btor440) (bitvector 27))
             btor440))
           (btor1205
            (bv->signal
             (zero-extend (signal-value btor48) (bitvector 27))
             btor48))
           (btor1206
            (bv->signal
             (zero-extend (signal-value btor421) (bitvector 1))
             btor421))
           (btor1207
            (bv->signal
             (zero-extend (signal-value btor51) (bitvector 32))
             btor51))
           (btor1208
            (bv->signal
             (zero-extend (signal-value btor417) (bitvector 5))
             btor417))
           (btor1209
            (bv->signal
             (zero-extend (signal-value btor422) (bitvector 5))
             btor422))
           (btor1210
            (bv->signal
             (zero-extend (signal-value btor420) (bitvector 5))
             btor420))
           (btor1211
            (bv->signal
             (zero-extend (signal-value btor52) (bitvector 4))
             btor52))
           (btor1212
            (bv->signal
             (zero-extend (signal-value btor53) (bitvector 1))
             btor53))
           (btor1213
            (bv->signal
             (zero-extend (signal-value btor54) (bitvector 1))
             btor54))
           (btor1214
            (bv->signal
             (zero-extend (signal-value btor55) (bitvector 5))
             btor55))
           (btor1215
            (bv->signal
             (zero-extend (signal-value btor57) (bitvector 9))
             btor57))
           (btor1216
            (bv->signal
             (zero-extend (signal-value btor58) (bitvector 1))
             btor58))
           (btor1217
            (bv->signal
             (zero-extend (signal-value btor59) (bitvector 1))
             btor59))
           (btor1218
            (bv->signal
             (zero-extend (signal-value btor60) (bitvector 1))
             btor60))
           (btor1219
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 1))
             btor61))
           (btor1220
            (bv->signal
             (zero-extend (signal-value btor62) (bitvector 1))
             btor62))
           (btor1221
            (bv->signal
             (zero-extend (signal-value btor63) (bitvector 1))
             btor63))
           (btor1222
            (bv->signal
             (zero-extend (signal-value btor64) (bitvector 1))
             btor64))
           (btor1223
            (bv->signal
             (zero-extend (signal-value btor65) (bitvector 1))
             btor65))
           (btor1224
            (bv->signal
             (zero-extend (signal-value btor66) (bitvector 1))
             btor66))
           (btor1225
            (bv->signal
             (zero-extend (signal-value btor67) (bitvector 1))
             btor67))
           (btor1226
            (bv->signal
             (zero-extend (signal-value btor68) (bitvector 48))
             btor68))
           (btor1227
            (bv->signal
             (zero-extend (signal-value btor613) (bitvector 1))
             btor613))
           (btor1228
            (bv->signal
             (zero-extend (signal-value btor69) (bitvector 32))
             btor69))
           (btor1229
            (bv->signal
             (zero-extend (signal-value btor70) (bitvector 1))
             btor70))
           (btor1230
            (bv->signal
             (zero-extend (signal-value btor839) (bitvector 1))
             btor839))
           (btor1231
            (bv->signal
             (zero-extend (signal-value btor842) (bitvector 1))
             btor842))
           (btor1232
            (bv->signal
             (zero-extend (signal-value btor306) (bitvector 1))
             btor306))
           (btor1233
            (bv->signal
             (zero-extend (signal-value btor72) (bitvector 32))
             btor72))
           (btor1234
            (bv->signal
             (zero-extend (signal-value btor302) (bitvector 9))
             btor302))
           (btor1235
            (bv->signal
             (zero-extend (signal-value btor307) (bitvector 9))
             btor307))
           (btor1236
            (bv->signal
             (zero-extend (signal-value btor305) (bitvector 9))
             btor305))
           (btor1237
            (bv->signal
             (zero-extend (signal-value btor73) (bitvector 48))
             btor73))
           (btor1238
            (bv->signal
             (zero-extend (signal-value btor74) (bitvector 48))
             btor74))
           (btor1239
            (bv->signal
             (zero-extend (signal-value btor433) (bitvector 1))
             btor433))
           (btor1240
            (bv->signal
             (zero-extend (signal-value btor430) (bitvector 8))
             btor430))
           (btor1241
            (bv->signal
             (zero-extend (signal-value btor498) (bitvector 27))
             btor498))
           (btor1242
            (bv->signal
             (zero-extend (signal-value btor807) (bitvector 1))
             btor807))
           (btor1243
            (bv->signal
             (zero-extend (signal-value btor76) (bitvector 32))
             btor76))
           (btor1244
            (bv->signal
             (zero-extend (signal-value btor759) (bitvector 1))
             btor759))
           (btor1245
            (bv->signal
             (zero-extend (signal-value btor323) (bitvector 48))
             btor323))
           (btor1246
            (bv->signal
             (zero-extend (signal-value btor77) (bitvector 48))
             btor77))
           (btor1247
            (signal
             (bvxor (signal-value btor79) (signal-value btor58))
             (list)))
           (btor1248
            (bv->signal
             (zero-extend (signal-value btor1247) (bitvector 1))
             btor1247))
           (btor1249
            (signal
             (bvxor (signal-value btor80) (signal-value btor59))
             (list)))
           (btor1250
            (bv->signal
             (zero-extend (signal-value btor1249) (bitvector 1))
             btor1249))
           (btor1251
            (signal
             (bvxor (signal-value btor78) (signal-value btor60))
             (list)))
           (btor1252
            (bv->signal
             (zero-extend (signal-value btor1251) (bitvector 1))
             btor1251))
           (btor1253
            (signal
             (bvxor (signal-value btor81) (signal-value btor61))
             (list)))
           (btor1254
            (bv->signal
             (zero-extend (signal-value btor1253) (bitvector 1))
             btor1253))
           (btor1255
            (signal
             (bvxor (signal-value btor83) (signal-value btor62))
             (list)))
           (btor1256
            (bv->signal
             (zero-extend (signal-value btor1255) (bitvector 1))
             btor1255))
           (btor1257
            (signal
             (bvxor (signal-value btor82) (signal-value btor63))
             (list)))
           (btor1258
            (bv->signal
             (zero-extend (signal-value btor1257) (bitvector 1))
             btor1257))
           (btor1259
            (signal
             (bvxor (signal-value btor84) (signal-value btor64))
             (list)))
           (btor1260
            (bv->signal
             (zero-extend (signal-value btor1259) (bitvector 1))
             btor1259))
           (btor1261
            (signal
             (bvxor (signal-value btor85) (signal-value btor65))
             (list)))
           (btor1262
            (bv->signal
             (zero-extend (signal-value btor1261) (bitvector 1))
             btor1261))
           (btor1263
            (signal
             (bvxor (signal-value btor86) (signal-value btor66))
             (list)))
           (btor1264
            (bv->signal
             (zero-extend (signal-value btor1263) (bitvector 1))
             btor1263))
           (btor1265
            (signal
             (bvxor (signal-value btor87) (signal-value btor67))
             (list)))
           (btor1266
            (bv->signal
             (zero-extend (signal-value btor1265) (bitvector 1))
             btor1265))
           (btor1267
            (bv->signal
             (zero-extend (signal-value btor972) (bitvector 2))
             btor972))
           (btor1268 (bitvector 112))
           (btor1269 (bitvector 107))
           (btor1270 (bv->signal (bv 0 (bitvector 107))))
           (btor1271
            (signal
             (concat (signal-value btor1270) (signal-value btor88))
             (list)))
           (btor1272
            (bv->signal
             (zero-extend (signal-value btor1271) (bitvector 112))
             btor1271))
           (btor1273
            (bv->signal
             (zero-extend (signal-value btor851) (bitvector 1))
             btor851))
           (btor1274
            (signal
             (concat (signal-value btor1144) (signal-value btor89))
             (list)))
           (btor1275
            (bv->signal
             (zero-extend (signal-value btor1274) (bitvector 56))
             btor1274))
           (btor1276
            (bv->signal
             (zero-extend (signal-value btor468) (bitvector 2))
             btor468))
           (btor1277 (bitvector 64))
           (btor1278 (bitvector 59))
           (btor1279 (bv->signal (bv 0 (bitvector 59))))
           (btor1280
            (signal
             (concat (signal-value btor1279) (signal-value btor90))
             (list)))
           (btor1281
            (bv->signal
             (zero-extend (signal-value btor1280) (bitvector 64))
             btor1280))
           (btor1282
            (bv->signal
             (zero-extend (signal-value btor989) (bitvector 1))
             btor989))
           (btor1283 (bitvector 72))
           (btor1284 (bitvector 67))
           (btor1285 (bv->signal (bv 0 (bitvector 67))))
           (btor1286
            (signal
             (concat (signal-value btor1285) (signal-value btor91))
             (list)))
           (btor1287
            (bv->signal
             (zero-extend (signal-value btor1286) (bitvector 72))
             btor1286))
           (btor1288
            (bv->signal
             (zero-extend (signal-value btor167) (bitvector 2))
             btor167))
           (btor1289 (bv->signal (bv 0 (bitvector 43))))
           (btor1290
            (signal
             (concat (signal-value btor1289) (signal-value btor92))
             (list)))
           (btor1291
            (bv->signal
             (zero-extend (signal-value btor1290) (bitvector 48))
             btor1290))
           (btor1292
            (bv->signal
             (zero-extend (signal-value btor1033) (bitvector 1))
             btor1033))
           (btor1293
            (signal
             (concat (signal-value btor1137) (signal-value btor93))
             (list)))
           (btor1294
            (bv->signal
             (zero-extend (signal-value btor1293) (bitvector 40))
             btor1293))
           (btor1295
            (bv->signal
             (zero-extend (signal-value btor614) (bitvector 45))
             btor614))
           (btor1296
            (bv->signal
             (zero-extend (signal-value btor617) (bitvector 45))
             btor617))
           (btor1297
            (bv->signal
             (zero-extend (signal-value btor612) (bitvector 45))
             btor612))
           (btor1298
            (bv->signal
             (zero-extend (signal-value btor608) (bitvector 44))
             btor608))
           (btor1299
            (bv->signal
             (zero-extend (signal-value btor643) (bitvector 45))
             btor643))
           (btor1300
            (bv->signal
             (zero-extend (signal-value btor644) (bitvector 45))
             btor644))
           (btor1301
            (bv->signal
             (zero-extend (signal-value btor642) (bitvector 45))
             btor642))
           (btor1302
            (bv->signal
             (zero-extend (signal-value btor639) (bitvector 45))
             btor639))
           (btor1303
            (bv->signal
             (zero-extend (signal-value btor1045) (bitvector 1))
             btor1045))
           (btor1304 (bitvector 88))
           (btor1305 (bitvector 83))
           (btor1306 (bv->signal (bv 0 (bitvector 83))))
           (btor1307
            (signal
             (concat (signal-value btor1306) (signal-value btor94))
             (list)))
           (btor1308
            (bv->signal
             (zero-extend (signal-value btor1307) (bitvector 88))
             btor1307))
           (btor1309
            (bv->signal
             (zero-extend (signal-value btor1083) (bitvector 8))
             btor1083))
           (btor1310
            (bv->signal
             (zero-extend (signal-value btor1086) (bitvector 8))
             btor1086))
           (btor1311 (bitvector 49))
           (btor1312
            (signal
             (concat (signal-value btor696) (signal-value btor785))
             (list)))
           (btor1313
            (bv->signal
             (zero-extend (signal-value btor1312) (bitvector 49))
             btor1312))
           (btor1314
            (bv->signal
             (zero-extend (signal-value btor509) (bitvector 27))
             btor509))
           (btor1315 (signal (bvnot (signal-value btor1135)) (list)))
           (btor1316
            (signal
             (bvor (signal-value btor1315) (signal-value btor44))
             (list)))
           (btor1317
            (bv->signal
             (zero-extend (signal-value btor1316) (bitvector 1))
             btor1316))
           (btor1318
            (bv->signal
             (zero-extend (signal-value btor547) (bitvector 18))
             btor547))
           (btor1319
            (bv->signal
             (zero-extend (signal-value btor765) (bitvector 1))
             btor765))
           (btor1320
            (bv->signal
             (zero-extend (signal-value btor43) (bitvector 1))
             btor43))
           (btor1321
            (bv->signal
             (zero-extend (signal-value btor785) (bitvector 1))
             btor785))
           (btor1322
            (bv->signal
             (zero-extend (signal-value btor782) (bitvector 1))
             btor782))
           (btor1323
            (bv->signal
             (zero-extend (signal-value btor661) (bitvector 48))
             btor661))
           (btor1324
            (bv->signal
             (zero-extend (signal-value btor718) (bitvector 1))
             btor718))
           (btor1325
            (bv->signal
             (zero-extend (signal-value btor710) (bitvector 1))
             btor710))
           (btor1326
            (bv->signal
             (zero-extend (signal-value btor698) (bitvector 1))
             btor698))
           (btor1327
            (bv->signal
             (zero-extend (signal-value btor665) (bitvector 48))
             btor665))
           (btor1328
            (signal
             (extract 10 0 (signal-value btor665))
             (signal-state btor665)))
           (btor1329
            (signal
             (concat (signal-value btor667) (signal-value btor1328))
             (list)))
           (btor1330
            (signal
             (extract 22 12 (signal-value btor665))
             (signal-state btor665)))
           (btor1331
            (signal
             (concat (signal-value btor1330) (signal-value btor1329))
             (list)))
           (btor1332
            (signal
             (concat (signal-value btor669) (signal-value btor1331))
             (list)))
           (btor1333
            (signal
             (extract 34 24 (signal-value btor665))
             (signal-state btor665)))
           (btor1334
            (signal
             (concat (signal-value btor1333) (signal-value btor1332))
             (list)))
           (btor1335
            (signal
             (concat (signal-value btor671) (signal-value btor1334))
             (list)))
           (btor1336
            (signal
             (extract 47 36 (signal-value btor665))
             (signal-state btor665)))
           (btor1337
            (signal
             (concat (signal-value btor1336) (signal-value btor1335))
             (list)))
           (btor1338
            (bv->signal
             (zero-extend (signal-value btor1337) (bitvector 48))
             btor1337))
           (btor1339
            (bv->signal
             (zero-extend (signal-value btor696) (bitvector 48))
             btor696))
           (btor1340
            (bv->signal
             (zero-extend (signal-value btor812) (bitvector 1))
             btor812))
           (btor1341
            (bv->signal
             (zero-extend (signal-value btor825) (bitvector 1))
             btor825))
           (btor1342
            (bv->signal
             (zero-extend (signal-value btor831) (bitvector 1))
             btor831))
           (btor1343
            (bv->signal
             (zero-extend (signal-value btor805) (bitvector 1))
             btor805))
           (btor1344
            (bv->signal
             (zero-extend (signal-value btor839) (bitvector 1))
             btor839))
           (btor1345
            (bv->signal
             (zero-extend (signal-value btor819) (bitvector 1))
             btor819))
           (btor1346
            (bv->signal
             (zero-extend (signal-value btor826) (bitvector 1))
             btor826))
           (btor1347
            (bv->signal
             (zero-extend (signal-value btor832) (bitvector 1))
             btor832))
           (btor1348
            (bv->signal
             (zero-extend (signal-value btor805) (bitvector 1))
             btor805))
           (btor1349
            (if (bitvector->bool (signal-value btor43)) btor765 btor768))
           (btor1350
            (bv->signal
             (zero-extend (signal-value btor1349) (bitvector 1))
             btor1349))
           (btor1351
            (if (bitvector->bool (signal-value btor1247)) btor106 btor1349))
           (btor1352
            (bv->signal
             (zero-extend (signal-value btor1351) (bitvector 1))
             btor1351))
           (btor1353
            (bv->signal
             (zero-extend (signal-value btor793) (bitvector 1))
             btor793))
           (btor1354
            (bv->signal
             (zero-extend (signal-value btor797) (bitvector 1))
             btor797))
           (btor1355
            (bv->signal
             (zero-extend (signal-value btor801) (bitvector 1))
             btor801))
           (btor1356
            (bv->signal
             (zero-extend (signal-value btor604) (bitvector 45))
             btor604))
           (btor1357
            (bv->signal
             (zero-extend (signal-value btor818) (bitvector 1))
             btor818))
           (btor1358
            (bv->signal
             (zero-extend (signal-value btor769) (bitvector 1))
             btor769))
           (btor1359
            (bv->signal
             (zero-extend (signal-value btor97) (bitvector 1))
             btor97))
           (btor1360
            (bv->signal
             (zero-extend (signal-value btor1009) (bitvector 1))
             btor1009))
           (btor1361
            (bv->signal
             (zero-extend (signal-value btor992) (bitvector 1))
             btor992))
           (btor1362
            (bv->signal
             (zero-extend (signal-value btor996) (bitvector 1))
             btor996))
           (btor1363
            (bv->signal
             (zero-extend (signal-value btor995) (bitvector 1))
             btor995))
           (btor1364
            (bv->signal
             (zero-extend (signal-value btor1008) (bitvector 1))
             btor1008))
           (btor1365
            (bv->signal
             (zero-extend (signal-value btor999) (bitvector 1))
             btor999))
           (btor1366
            (bv->signal
             (zero-extend (signal-value btor1003) (bitvector 1))
             btor1003))
           (btor1367
            (bv->signal
             (zero-extend (signal-value btor1002) (bitvector 1))
             btor1002))
           (btor1368
            (bv->signal
             (zero-extend (signal-value btor1020) (bitvector 1))
             btor1020))
           (btor1369 (bv->signal (bv 5864062014805 (bitvector 44))))
           (btor1370
            (bv->signal
             (zero-extend (signal-value btor1369) (bitvector 44))
             btor1369))
           (btor1371
            (bv->signal
             (zero-extend (signal-value btor635) (bitvector 44))
             btor635))
           (btor1372
            (bv->signal
             (zero-extend (signal-value btor768) (bitvector 1))
             btor768))
           (btor1373
            (bv->signal
             (zero-extend (signal-value btor1247) (bitvector 1))
             btor1247))
           (btor1374
            (bv->signal
             (zero-extend (signal-value btor656) (bitvector 48))
             btor656))
           (btor1375
            (bv->signal
             (zero-extend (signal-value btor791) (bitvector 13))
             btor791))
           (btor1376
            (bv->signal
             (zero-extend (signal-value btor795) (bitvector 13))
             btor795))
           (btor1377
            (bv->signal
             (zero-extend (signal-value btor799) (bitvector 13))
             btor799))
           (btor1378
            (bv->signal
             (zero-extend (signal-value btor803) (bitvector 14))
             btor803))
           (btor1379
            (bv->signal
             (zero-extend (signal-value btor663) (bitvector 48))
             btor663))
           (btor1380
            (bv->signal
             (zero-extend (signal-value btor703) (bitvector 48))
             btor703))
           (btor1381
            (signal
             (bvand (signal-value btor1316) (signal-value btor1009))
             (list)))
           (btor1382
            (signal
             (bvand (signal-value btor1381) (signal-value btor997))
             (list)))
           (btor1383
            (signal
             (bool->bitvector
              (bveq (signal-value btor1123) (signal-value btor103)))
             (list)))
           (btor1384
            (if (bitvector->bool (signal-value btor1383)) btor1382 btor106))
           (btor1385
            (signal
             (bvand (signal-value btor1316) (signal-value btor996))
             (list)))
           (btor1386
            (bv->signal
             (zero-extend (signal-value btor97) (bitvector 2))
             btor97))
           (btor1387
            (signal
             (bool->bitvector
              (bveq (signal-value btor1123) (signal-value btor1386)))
             (list)))
           (btor1388
            (if (bitvector->bool (signal-value btor1387)) btor1385 btor1384))
           (btor1389
            (bv->signal
             (zero-extend (signal-value btor1388) (bitvector 1))
             btor1388))
           (btor1390
            (bv->signal
             (zero-extend (signal-value btor990) (bitvector 48))
             btor990))
           (btor1391
            (bv->signal
             (zero-extend (signal-value btor852) (bitvector 48))
             btor852))
           (btor1392
            (bv->signal
             (zero-extend (signal-value btor1021) (bitvector 1))
             btor1021))
           (btor1393
            (bv->signal
             (zero-extend (signal-value btor692) (bitvector 48))
             btor692))
           (btor1394
            (bv->signal
             (zero-extend (signal-value btor411) (bitvector 2))
             btor411))
           (btor1395
            (bv->signal
             (zero-extend (signal-value btor633) (bitvector 48))
             btor633))
           (btor1396
            (bv->signal
             (zero-extend (signal-value btor1034) (bitvector 1))
             btor1034))
           (btor1397
            (bv->signal
             (zero-extend (signal-value btor1037) (bitvector 1))
             btor1037))
           (btor1398
            (bv->signal
             (zero-extend (signal-value btor1049) (bitvector 1))
             btor1049))
           (btor1399
            (bv->signal
             (zero-extend (signal-value btor1052) (bitvector 1))
             btor1052))
           (btor1400
            (bv->signal
             (zero-extend (signal-value btor1059) (bitvector 1))
             btor1059))
           (btor1401
            (bv->signal
             (zero-extend (signal-value btor1062) (bitvector 1))
             btor1062))
           (btor1402
            (bv->signal
             (zero-extend (signal-value btor1066) (bitvector 1))
             btor1066))
           (btor1403
            (bv->signal
             (zero-extend (signal-value btor1069) (bitvector 1))
             btor1069))
           (btor1404
            (bv->signal
             (zero-extend (signal-value btor1038) (bitvector 1))
             btor1038))
           (btor1405
            (bv->signal
             (zero-extend (signal-value btor1053) (bitvector 1))
             btor1053))
           (btor1406
            (bv->signal
             (zero-extend (signal-value btor1063) (bitvector 1))
             btor1063))
           (btor1407
            (bv->signal
             (zero-extend (signal-value btor1070) (bitvector 1))
             btor1070))
           (btor1408
            (bv->signal
             (zero-extend (signal-value btor1054) (bitvector 1))
             btor1054))
           (btor1409
            (bv->signal
             (zero-extend (signal-value btor1071) (bitvector 1))
             btor1071))
           (btor1410
            (bv->signal
             (zero-extend (signal-value btor1072) (bitvector 1))
             btor1072))
           (btor1411
            (bv->signal
             (zero-extend (signal-value btor655) (bitvector 48))
             btor655))
           (btor1412
            (bv->signal
             (zero-extend (signal-value btor409) (bitvector 48))
             btor409))
           (btor1413
            (bv->signal
             (zero-extend (signal-value btor408) (bitvector 48))
             btor408))
           (btor1415
            (if (bitvector->bool (signal-value btor32)) btor115 btor105))
           (btor1416 (bv->signal (bv 0 (bitvector 30))))
           (btor1417
            (signal
             (apply bvor (bitvector->bits (signal-value btor119)))
             (signal-state btor119)))
           (btor1418 (signal (bvnot (signal-value btor1417)) (list)))
           (btor1419
            (signal
             (bvor (signal-value btor1251) (signal-value btor1418))
             (list)))
           (btor1420
            (if (bitvector->bool (signal-value btor1419)) btor1416 btor1415))
           (btor1424
            (signal
             (bool->bitvector
              (bveq (signal-value btor119) (signal-value btor103)))
             (list)))
           (btor1425
            (if (bitvector->bool (signal-value btor1424)) btor105 btor115))
           (btor1426
            (if (bitvector->bool (signal-value btor33)) btor1425 btor118))
           (btor1427
            (if (bitvector->bool (signal-value btor1419)) btor1416 btor1426))
           (btor1430
            (if (bitvector->bool (signal-value btor36)) btor135 btor128))
           (btor1431
            (signal
             (apply bvor (bitvector->bits (signal-value btor139)))
             (signal-state btor139)))
           (btor1432 (signal (bvnot (signal-value btor1431)) (list)))
           (btor1433
            (signal
             (bvor (signal-value btor1253) (signal-value btor1432))
             (list)))
           (btor1434
            (if (bitvector->bool (signal-value btor1433)) btor477 btor1430))
           (btor1437
            (signal
             (bool->bitvector
              (bveq (signal-value btor139) (signal-value btor103)))
             (list)))
           (btor1438
            (if (bitvector->bool (signal-value btor1437)) btor128 btor135))
           (btor1439
            (if (bitvector->bool (signal-value btor37)) btor1438 btor138))
           (btor1440
            (if (bitvector->bool (signal-value btor1253)) btor477 btor1439))
           (btor1443
            (if (bitvector->bool (signal-value btor35)) btor146 btor149))
           (btor1444 (bv->signal (bv 0 (bitvector 4))))
           (btor1445
            (if (bitvector->bool (signal-value btor1249)) btor1444 btor1443))
           (btor1448
            (if (bitvector->bool (signal-value btor40)) btor302 btor305))
           (btor1449 (bv->signal (bv 0 (bitvector 9))))
           (btor1450
            (if (bitvector->bool (signal-value btor1255)) btor1449 btor1448))
           (btor1453
            (if (bitvector->bool (signal-value btor38)) btor24 btor314))
           (btor1454 (signal (bvnot (signal-value btor315)) (list)))
           (btor1455
            (signal
             (bvor (signal-value btor1257) (signal-value btor1454))
             (list)))
           (btor1456
            (if (bitvector->bool (signal-value btor1455)) btor301 btor1453))
           (btor1459
            (signal
             (bvand (signal-value btor44) (signal-value btor807))
             (list)))
           (btor1460
            (if (bitvector->bool (signal-value btor1459)) btor955 btor323))
           (btor1461
            (signal
             (bvor (signal-value btor1265) (signal-value btor1388))
             (list)))
           (btor1462
            (if (bitvector->bool (signal-value btor1461)) btor301 btor1460))
           (btor1465
            (if (bitvector->bool (signal-value btor42)) btor417 btor420))
           (btor1466 (bv->signal (bv 0 (bitvector 5))))
           (btor1467 (signal (bvnot (signal-value btor421)) (list)))
           (btor1468
            (signal
             (bvor (signal-value btor1261) (signal-value btor1467))
             (list)))
           (btor1469
            (if (bitvector->bool (signal-value btor1468)) btor1466 btor1465))
           (btor1472
            (if (bitvector->bool (signal-value btor41)) btor48 btor440))
           (btor1473 (signal (bvnot (signal-value btor471)) (list)))
           (btor1474
            (signal
             (bvor (signal-value btor1259) (signal-value btor1473))
             (list)))
           (btor1475
            (if (bitvector->bool (signal-value btor1474)) btor425 btor1472))
           (btor1478
            (if (bitvector->bool (signal-value btor34)) btor502 btor505))
           (btor1479
            (if (bitvector->bool (signal-value btor1259)) btor425 btor1478))
           (btor1482
            (if (bitvector->bool (signal-value btor43)) btor609 btor612))
           (btor1483 (signal (bvnot (signal-value btor613)) (list)))
           (btor1484
            (signal
             (bvor (signal-value btor1263) (signal-value btor1483))
             (list)))
           (btor1485
            (if (bitvector->bool (signal-value btor1484)) btor603 btor1482))
           (btor1488
            (if (bitvector->bool (signal-value btor43)) btor639 btor642))
           (btor1489
            (if (bitvector->bool (signal-value btor1484)) btor603 btor1488))
           (btor1492
            (if (bitvector->bool (signal-value btor39)) btor725 btor728))
           (btor1493
            (if (bitvector->bool (signal-value btor1247)) btor106 btor1492))
           (btor1496
            (if (bitvector->bool (signal-value btor40)) btor30 btor735))
           (btor1497
            (if (bitvector->bool (signal-value btor1255)) btor429 btor1496))
           (btor1500
            (if (bitvector->bool (signal-value btor1459)) btor154 btor752))
           (btor1501
            (if (bitvector->bool (signal-value btor1461)) btor106 btor1500))
           (btor1504
            (if (bitvector->bool (signal-value btor1459)) btor836 btor755))
           (btor1505
            (if (bitvector->bool (signal-value btor1461)) btor1444 btor1504))
           (btor1510
            (if (bitvector->bool (signal-value btor1459)) btor839 btor842))
           (btor1511
            (if (bitvector->bool (signal-value btor1461)) btor106 btor1510))
           (btor1514
            (if (bitvector->bool (signal-value btor1459)) btor992 btor995))
           (btor1515
            (if (bitvector->bool (signal-value btor1461)) btor106 btor1514))
           (btor1518
            (if (bitvector->bool (signal-value btor1459)) btor999 btor1002))
           (btor1519
            (if (bitvector->bool (signal-value btor1461)) btor106 btor1518))
           (btor1522
            (if (bitvector->bool (signal-value btor1459)) btor995 btor1008))
           (btor1523
            (if (bitvector->bool (signal-value btor1461)) btor106 btor1522))
           (btor1526
            (if (bitvector->bool (signal-value btor1459)) btor1002 btor1020))
           (btor1527
            (if (bitvector->bool (signal-value btor1461)) btor106 btor1526))
           (btor1530
            (if (bitvector->bool (signal-value btor1459)) btor1083 btor1086))
           (btor1531 (bv->signal (bv 0 (bitvector 8))))
           (btor1532
            (if (bitvector->bool (signal-value btor1461)) btor1531 btor1530))
           (output-state
            (remove-duplicates
             (append
              (append
               (list
                (cons
                 (string->symbol (string-append name "state1085"))
                 (cons
                  (signal-value btor1532)
                  (if (assoc-has-key? merged-input-state-hash)
                    (add1
                     (cdr
                      (assoc-ref
                       merged-input-state-hash
                       (string->symbol (string-append name "state1085")))))
                    0))))
               (append
                (list
                 (cons
                  (string->symbol (string-append name "state1084"))
                  (cons
                   (signal-value btor1086)
                   (if (assoc-has-key? merged-input-state-hash)
                     (add1
                      (cdr
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1084")))))
                     0))))
                (append
                 (list
                  (cons
                   (string->symbol (string-append name "state1019"))
                   (cons
                    (signal-value btor1527)
                    (if (assoc-has-key? merged-input-state-hash)
                      (add1
                       (cdr
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1019")))))
                      0))))
                 (append
                  (list
                   (cons
                    (string->symbol (string-append name "state1018"))
                    (cons
                     (signal-value btor1020)
                     (if (assoc-has-key? merged-input-state-hash)
                       (add1
                        (cdr
                         (assoc-ref
                          merged-input-state-hash
                          (string->symbol (string-append name "state1018")))))
                       0))))
                  (append
                   (list
                    (cons
                     (string->symbol (string-append name "state1007"))
                     (cons
                      (signal-value btor1523)
                      (if (assoc-has-key? merged-input-state-hash)
                        (add1
                         (cdr
                          (assoc-ref
                           merged-input-state-hash
                           (string->symbol (string-append name "state1007")))))
                        0))))
                   (append
                    (list
                     (cons
                      (string->symbol (string-append name "state1006"))
                      (cons
                       (signal-value btor1008)
                       (if (assoc-has-key? merged-input-state-hash)
                         (add1
                          (cdr
                           (assoc-ref
                            merged-input-state-hash
                            (string->symbol
                             (string-append name "state1006")))))
                         0))))
                    (append
                     (list
                      (cons
                       (string->symbol (string-append name "state1001"))
                       (cons
                        (signal-value btor1519)
                        (if (assoc-has-key? merged-input-state-hash)
                          (add1
                           (cdr
                            (assoc-ref
                             merged-input-state-hash
                             (string->symbol
                              (string-append name "state1001")))))
                          0))))
                     (append
                      (list
                       (cons
                        (string->symbol (string-append name "state1000"))
                        (cons
                         (signal-value btor1002)
                         (if (assoc-has-key? merged-input-state-hash)
                           (add1
                            (cdr
                             (assoc-ref
                              merged-input-state-hash
                              (string->symbol
                               (string-append name "state1000")))))
                           0))))
                      (append
                       (list
                        (cons
                         (string->symbol (string-append name "state994"))
                         (cons
                          (signal-value btor1515)
                          (if (assoc-has-key? merged-input-state-hash)
                            (add1
                             (cdr
                              (assoc-ref
                               merged-input-state-hash
                               (string->symbol
                                (string-append name "state994")))))
                            0))))
                       (append
                        (list
                         (cons
                          (string->symbol (string-append name "state993"))
                          (cons
                           (signal-value btor995)
                           (if (assoc-has-key? merged-input-state-hash)
                             (add1
                              (cdr
                               (assoc-ref
                                merged-input-state-hash
                                (string->symbol
                                 (string-append name "state993")))))
                             0))))
                        (append
                         (list
                          (cons
                           (string->symbol (string-append name "state841"))
                           (cons
                            (signal-value btor1511)
                            (if (assoc-has-key? merged-input-state-hash)
                              (add1
                               (cdr
                                (assoc-ref
                                 merged-input-state-hash
                                 (string->symbol
                                  (string-append name "state841")))))
                              0))))
                         (append
                          (list
                           (cons
                            (string->symbol (string-append name "state840"))
                            (cons
                             (signal-value btor842)
                             (if (assoc-has-key? merged-input-state-hash)
                               (add1
                                (cdr
                                 (assoc-ref
                                  merged-input-state-hash
                                  (string->symbol
                                   (string-append name "state840")))))
                               0))))
                          (append
                           (list
                            (cons
                             (string->symbol (string-append name "state767"))
                             (cons
                              (signal-value btor1351)
                              (if (assoc-has-key? merged-input-state-hash)
                                (add1
                                 (cdr
                                  (assoc-ref
                                   merged-input-state-hash
                                   (string->symbol
                                    (string-append name "state767")))))
                                0))))
                           (append
                            (list
                             (cons
                              (string->symbol (string-append name "state766"))
                              (cons
                               (signal-value btor768)
                               (if (assoc-has-key? merged-input-state-hash)
                                 (add1
                                  (cdr
                                   (assoc-ref
                                    merged-input-state-hash
                                    (string->symbol
                                     (string-append name "state766")))))
                                 0))))
                            (append
                             (list
                              (cons
                               (string->symbol (string-append name "state754"))
                               (cons
                                (signal-value btor1505)
                                (if (assoc-has-key? merged-input-state-hash)
                                  (add1
                                   (cdr
                                    (assoc-ref
                                     merged-input-state-hash
                                     (string->symbol
                                      (string-append name "state754")))))
                                  0))))
                             (append
                              (list
                               (cons
                                (string->symbol
                                 (string-append name "state753"))
                                (cons
                                 (signal-value btor755)
                                 (if (assoc-has-key? merged-input-state-hash)
                                   (add1
                                    (cdr
                                     (assoc-ref
                                      merged-input-state-hash
                                      (string->symbol
                                       (string-append name "state753")))))
                                   0))))
                              (append
                               (list
                                (cons
                                 (string->symbol
                                  (string-append name "state751"))
                                 (cons
                                  (signal-value btor1501)
                                  (if (assoc-has-key? merged-input-state-hash)
                                    (add1
                                     (cdr
                                      (assoc-ref
                                       merged-input-state-hash
                                       (string->symbol
                                        (string-append name "state751")))))
                                    0))))
                               (append
                                (list
                                 (cons
                                  (string->symbol
                                   (string-append name "state750"))
                                  (cons
                                   (signal-value btor752)
                                   (if (assoc-has-key? merged-input-state-hash)
                                     (add1
                                      (cdr
                                       (assoc-ref
                                        merged-input-state-hash
                                        (string->symbol
                                         (string-append name "state750")))))
                                     0))))
                                (append
                                 (list
                                  (cons
                                   (string->symbol
                                    (string-append name "state734"))
                                   (cons
                                    (signal-value btor1497)
                                    (if (assoc-has-key?
                                         merged-input-state-hash)
                                      (add1
                                       (cdr
                                        (assoc-ref
                                         merged-input-state-hash
                                         (string->symbol
                                          (string-append name "state734")))))
                                      0))))
                                 (append
                                  (list
                                   (cons
                                    (string->symbol
                                     (string-append name "state733"))
                                    (cons
                                     (signal-value btor735)
                                     (if (assoc-has-key?
                                          merged-input-state-hash)
                                       (add1
                                        (cdr
                                         (assoc-ref
                                          merged-input-state-hash
                                          (string->symbol
                                           (string-append name "state733")))))
                                       0))))
                                  (append
                                   (list
                                    (cons
                                     (string->symbol
                                      (string-append name "state727"))
                                     (cons
                                      (signal-value btor1493)
                                      (if (assoc-has-key?
                                           merged-input-state-hash)
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
                                      (string->symbol
                                       (string-append name "state726"))
                                      (cons
                                       (signal-value btor728)
                                       (if (assoc-has-key?
                                            merged-input-state-hash)
                                         (add1
                                          (cdr
                                           (assoc-ref
                                            merged-input-state-hash
                                            (string->symbol
                                             (string-append
                                              name
                                              "state726")))))
                                         0))))
                                    (append
                                     (list
                                      (cons
                                       (string->symbol
                                        (string-append name "state641"))
                                       (cons
                                        (signal-value btor1489)
                                        (if (assoc-has-key?
                                             merged-input-state-hash)
                                          (add1
                                           (cdr
                                            (assoc-ref
                                             merged-input-state-hash
                                             (string->symbol
                                              (string-append
                                               name
                                               "state641")))))
                                          0))))
                                     (append
                                      (list
                                       (cons
                                        (string->symbol
                                         (string-append name "state640"))
                                        (cons
                                         (signal-value btor642)
                                         (if (assoc-has-key?
                                              merged-input-state-hash)
                                           (add1
                                            (cdr
                                             (assoc-ref
                                              merged-input-state-hash
                                              (string->symbol
                                               (string-append
                                                name
                                                "state640")))))
                                           0))))
                                      (append
                                       (list
                                        (cons
                                         (string->symbol
                                          (string-append name "state611"))
                                         (cons
                                          (signal-value btor1485)
                                          (if (assoc-has-key?
                                               merged-input-state-hash)
                                            (add1
                                             (cdr
                                              (assoc-ref
                                               merged-input-state-hash
                                               (string->symbol
                                                (string-append
                                                 name
                                                 "state611")))))
                                            0))))
                                       (append
                                        (list
                                         (cons
                                          (string->symbol
                                           (string-append name "state610"))
                                          (cons
                                           (signal-value btor612)
                                           (if (assoc-has-key?
                                                merged-input-state-hash)
                                             (add1
                                              (cdr
                                               (assoc-ref
                                                merged-input-state-hash
                                                (string->symbol
                                                 (string-append
                                                  name
                                                  "state610")))))
                                             0))))
                                        (append
                                         (list
                                          (cons
                                           (string->symbol
                                            (string-append name "state504"))
                                           (cons
                                            (signal-value btor1479)
                                            (if (assoc-has-key?
                                                 merged-input-state-hash)
                                              (add1
                                               (cdr
                                                (assoc-ref
                                                 merged-input-state-hash
                                                 (string->symbol
                                                  (string-append
                                                   name
                                                   "state504")))))
                                              0))))
                                         (append
                                          (list
                                           (cons
                                            (string->symbol
                                             (string-append name "state503"))
                                            (cons
                                             (signal-value btor505)
                                             (if (assoc-has-key?
                                                  merged-input-state-hash)
                                               (add1
                                                (cdr
                                                 (assoc-ref
                                                  merged-input-state-hash
                                                  (string->symbol
                                                   (string-append
                                                    name
                                                    "state503")))))
                                               0))))
                                          (append
                                           (list
                                            (cons
                                             (string->symbol
                                              (string-append name "state439"))
                                             (cons
                                              (signal-value btor1475)
                                              (if (assoc-has-key?
                                                   merged-input-state-hash)
                                                (add1
                                                 (cdr
                                                  (assoc-ref
                                                   merged-input-state-hash
                                                   (string->symbol
                                                    (string-append
                                                     name
                                                     "state439")))))
                                                0))))
                                           (append
                                            (list
                                             (cons
                                              (string->symbol
                                               (string-append name "state438"))
                                              (cons
                                               (signal-value btor440)
                                               (if (assoc-has-key?
                                                    merged-input-state-hash)
                                                 (add1
                                                  (cdr
                                                   (assoc-ref
                                                    merged-input-state-hash
                                                    (string->symbol
                                                     (string-append
                                                      name
                                                      "state438")))))
                                                 0))))
                                            (append
                                             (list
                                              (cons
                                               (string->symbol
                                                (string-append
                                                 name
                                                 "state419"))
                                               (cons
                                                (signal-value btor1469)
                                                (if (assoc-has-key?
                                                     merged-input-state-hash)
                                                  (add1
                                                   (cdr
                                                    (assoc-ref
                                                     merged-input-state-hash
                                                     (string->symbol
                                                      (string-append
                                                       name
                                                       "state419")))))
                                                  0))))
                                             (append
                                              (list
                                               (cons
                                                (string->symbol
                                                 (string-append
                                                  name
                                                  "state418"))
                                                (cons
                                                 (signal-value btor420)
                                                 (if (assoc-has-key?
                                                      merged-input-state-hash)
                                                   (add1
                                                    (cdr
                                                     (assoc-ref
                                                      merged-input-state-hash
                                                      (string->symbol
                                                       (string-append
                                                        name
                                                        "state418")))))
                                                   0))))
                                              (append
                                               (list
                                                (cons
                                                 (string->symbol
                                                  (string-append
                                                   name
                                                   "state322"))
                                                 (cons
                                                  (signal-value btor1462)
                                                  (if (assoc-has-key?
                                                       merged-input-state-hash)
                                                    (add1
                                                     (cdr
                                                      (assoc-ref
                                                       merged-input-state-hash
                                                       (string->symbol
                                                        (string-append
                                                         name
                                                         "state322")))))
                                                    0))))
                                               (append
                                                (list
                                                 (cons
                                                  (string->symbol
                                                   (string-append
                                                    name
                                                    "state321"))
                                                  (cons
                                                   (signal-value btor323)
                                                   (if (assoc-has-key?
                                                        merged-input-state-hash)
                                                     (add1
                                                      (cdr
                                                       (assoc-ref
                                                        merged-input-state-hash
                                                        (string->symbol
                                                         (string-append
                                                          name
                                                          "state321")))))
                                                     0))))
                                                (append
                                                 (list
                                                  (cons
                                                   (string->symbol
                                                    (string-append
                                                     name
                                                     "state313"))
                                                   (cons
                                                    (signal-value btor1456)
                                                    (if (assoc-has-key?
                                                         merged-input-state-hash)
                                                      (add1
                                                       (cdr
                                                        (assoc-ref
                                                         merged-input-state-hash
                                                         (string->symbol
                                                          (string-append
                                                           name
                                                           "state313")))))
                                                      0))))
                                                 (append
                                                  (list
                                                   (cons
                                                    (string->symbol
                                                     (string-append
                                                      name
                                                      "state312"))
                                                    (cons
                                                     (signal-value btor314)
                                                     (if (assoc-has-key?
                                                          merged-input-state-hash)
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
                                                       "state304"))
                                                     (cons
                                                      (signal-value btor1450)
                                                      (if (assoc-has-key?
                                                           merged-input-state-hash)
                                                        (add1
                                                         (cdr
                                                          (assoc-ref
                                                           merged-input-state-hash
                                                           (string->symbol
                                                            (string-append
                                                             name
                                                             "state304")))))
                                                        0))))
                                                   (append
                                                    (list
                                                     (cons
                                                      (string->symbol
                                                       (string-append
                                                        name
                                                        "state303"))
                                                      (cons
                                                       (signal-value btor305)
                                                       (if (assoc-has-key?
                                                            merged-input-state-hash)
                                                         (add1
                                                          (cdr
                                                           (assoc-ref
                                                            merged-input-state-hash
                                                            (string->symbol
                                                             (string-append
                                                              name
                                                              "state303")))))
                                                         0))))
                                                    (append
                                                     (list
                                                      (cons
                                                       (string->symbol
                                                        (string-append
                                                         name
                                                         "state148"))
                                                       (cons
                                                        (signal-value btor1445)
                                                        (if (assoc-has-key?
                                                             merged-input-state-hash)
                                                          (add1
                                                           (cdr
                                                            (assoc-ref
                                                             merged-input-state-hash
                                                             (string->symbol
                                                              (string-append
                                                               name
                                                               "state148")))))
                                                          0))))
                                                     (append
                                                      (list
                                                       (cons
                                                        (string->symbol
                                                         (string-append
                                                          name
                                                          "state147"))
                                                        (cons
                                                         (signal-value btor149)
                                                         (if (assoc-has-key?
                                                              merged-input-state-hash)
                                                           (add1
                                                            (cdr
                                                             (assoc-ref
                                                              merged-input-state-hash
                                                              (string->symbol
                                                               (string-append
                                                                name
                                                                "state147")))))
                                                           0))))
                                                      (append
                                                       (list
                                                        (cons
                                                         (string->symbol
                                                          (string-append
                                                           name
                                                           "state137"))
                                                         (cons
                                                          (signal-value
                                                           btor1440)
                                                          (if (assoc-has-key?
                                                               merged-input-state-hash)
                                                            (add1
                                                             (cdr
                                                              (assoc-ref
                                                               merged-input-state-hash
                                                               (string->symbol
                                                                (string-append
                                                                 name
                                                                 "state137")))))
                                                            0))))
                                                       (append
                                                        (list
                                                         (cons
                                                          (string->symbol
                                                           (string-append
                                                            name
                                                            "state136"))
                                                          (cons
                                                           (signal-value
                                                            btor138)
                                                           (if (assoc-has-key?
                                                                merged-input-state-hash)
                                                             (add1
                                                              (cdr
                                                               (assoc-ref
                                                                merged-input-state-hash
                                                                (string->symbol
                                                                 (string-append
                                                                  name
                                                                  "state136")))))
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
                                                             btor1434)
                                                            (if (assoc-has-key?
                                                                 merged-input-state-hash)
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
                                                              "state126"))
                                                            (cons
                                                             (signal-value
                                                              btor128)
                                                             (if (assoc-has-key?
                                                                  merged-input-state-hash)
                                                               (add1
                                                                (cdr
                                                                 (assoc-ref
                                                                  merged-input-state-hash
                                                                  (string->symbol
                                                                   (string-append
                                                                    name
                                                                    "state126")))))
                                                               0))))
                                                          (append
                                                           (list
                                                            (cons
                                                             (string->symbol
                                                              (string-append
                                                               name
                                                               "state117"))
                                                             (cons
                                                              (signal-value
                                                               btor1427)
                                                              (if (assoc-has-key?
                                                                   merged-input-state-hash)
                                                                (add1
                                                                 (cdr
                                                                  (assoc-ref
                                                                   merged-input-state-hash
                                                                   (string->symbol
                                                                    (string-append
                                                                     name
                                                                     "state117")))))
                                                                0))))
                                                           (append
                                                            (list
                                                             (cons
                                                              (string->symbol
                                                               (string-append
                                                                name
                                                                "state116"))
                                                              (cons
                                                               (signal-value
                                                                btor118)
                                                               (if (assoc-has-key?
                                                                    merged-input-state-hash)
                                                                 (add1
                                                                  (cdr
                                                                   (assoc-ref
                                                                    merged-input-state-hash
                                                                    (string->symbol
                                                                     (string-append
                                                                      name
                                                                      "state116")))))
                                                                 0))))
                                                            (append
                                                             (list
                                                              (cons
                                                               (string->symbol
                                                                (string-append
                                                                 name
                                                                 "state98"))
                                                               (cons
                                                                (signal-value
                                                                 btor100)
                                                                (if (assoc-has-key?
                                                                     merged-input-state-hash)
                                                                  (add1
                                                                   (cdr
                                                                    (assoc-ref
                                                                     merged-input-state-hash
                                                                     (string->symbol
                                                                      (string-append
                                                                       name
                                                                       "state98")))))
                                                                  0))))
                                                             (append
                                                              (list
                                                               (cons
                                                                (string->symbol
                                                                 (string-append
                                                                  name
                                                                  "state96"))
                                                                (cons
                                                                 (signal-value
                                                                  btor1420)
                                                                 (if (assoc-has-key?
                                                                      merged-input-state-hash)
                                                                   (add1
                                                                    (cdr
                                                                     (assoc-ref
                                                                      merged-input-state-hash
                                                                      (string->symbol
                                                                       (string-append
                                                                        name
                                                                        "state96")))))
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
                                                                   btor105)
                                                                  (if (assoc-has-key?
                                                                       merged-input-state-hash)
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
       (cons 'XOROUT (signal (signal-value btor1087) output-state))
       (cons 'PCOUT (signal (signal-value btor1013) output-state))
       (cons 'PATTERNBDETECT (signal (signal-value btor1003) output-state))
       (cons 'CARRYCASCOUT (signal (signal-value btor808) output-state))
       (cons 'P (signal (signal-value btor1013) output-state))
       (cons 'CARRYOUT (signal (signal-value btor837) output-state))
       (cons 'UNDERFLOW (signal (signal-value btor1023) output-state))
       (cons 'BCOUT (signal (signal-value btor144) output-state))
       (cons 'MULTSIGNOUT (signal (signal-value btor843) output-state))
       (cons 'OVERFLOW (signal (signal-value btor1011) output-state))
       (cons 'ACOUT (signal (signal-value btor124) output-state))
       (cons 'PATTERNDETECT (signal (signal-value btor996) output-state))))))
