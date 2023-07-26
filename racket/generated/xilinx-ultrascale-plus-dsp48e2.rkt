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
            (append merged-input-state-hash (signal-state A)))
           (btor3 (bitvector 32))
           (btor4 ACASCREG)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state ACASCREG)))
           (btor5 ACIN)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state ACIN)))
           (btor6 ADREG)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state ADREG)))
           (btor7 (bitvector 4))
           (btor8 ALUMODE)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state ALUMODE)))
           (btor9 ALUMODEREG)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state ALUMODEREG)))
           (btor10 (bitvector 5))
           (btor11 AMULTSEL)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state AMULTSEL)))
           (btor12 AREG)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state AREG)))
           (btor13 AUTORESET_PATDET)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state AUTORESET_PATDET)))
           (btor14 AUTORESET_PRIORITY)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state AUTORESET_PRIORITY)))
           (btor15 A_INPUT)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state A_INPUT)))
           (btor16 (bitvector 18))
           (btor17 B)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state B)))
           (btor18 BCASCREG)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state BCASCREG)))
           (btor19 BCIN)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state BCIN)))
           (btor20 BMULTSEL)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state BMULTSEL)))
           (btor21 BREG)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state BREG)))
           (btor22 B_INPUT)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state B_INPUT)))
           (btor23 (bitvector 48))
           (btor24 C)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state C)))
           (btor25 (bitvector 1))
           (btor26 CARRYCASCIN)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CARRYCASCIN)))
           (btor27 CARRYIN)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CARRYIN)))
           (btor28 CARRYINREG)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CARRYINREG)))
           (btor29 (bitvector 3))
           (btor30 CARRYINSEL)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CARRYINSEL)))
           (btor31 CARRYINSELREG)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CARRYINSELREG)))
           (btor32 CEA1)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CEA1)))
           (btor33 CEA2)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CEA2)))
           (btor34 CEAD)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CEAD)))
           (btor35 CEALUMODE)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CEALUMODE)))
           (btor36 CEB1)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CEB1)))
           (btor37 CEB2)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CEB2)))
           (btor38 CEC)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CEC)))
           (btor39 CECARRYIN)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CECARRYIN)))
           (btor40 CECTRL)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CECTRL)))
           (btor41 CED)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CED)))
           (btor42 CEINMODE)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CEINMODE)))
           (btor43 CEM)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CEM)))
           (btor44 CEP)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CEP)))
           (btor45 CLK)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CLK)))
           (btor46 CREG)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CREG)))
           (btor47 (bitvector 27))
           (btor48 D)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state D)))
           (btor49 DREG)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state DREG)))
           (btor50 INMODE)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state INMODE)))
           (btor51 INMODEREG)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state INMODEREG)))
           (btor52 IS_ALUMODE_INVERTED)
           (merged-input-state-hash
            (append
             merged-input-state-hash
             (signal-state IS_ALUMODE_INVERTED)))
           (btor53 IS_CARRYIN_INVERTED)
           (merged-input-state-hash
            (append
             merged-input-state-hash
             (signal-state IS_CARRYIN_INVERTED)))
           (btor54 IS_CLK_INVERTED)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state IS_CLK_INVERTED)))
           (btor55 IS_INMODE_INVERTED)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state IS_INMODE_INVERTED)))
           (btor56 (bitvector 9))
           (btor57 IS_OPMODE_INVERTED)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state IS_OPMODE_INVERTED)))
           (btor58 IS_RSTALLCARRYIN_INVERTED)
           (merged-input-state-hash
            (append
             merged-input-state-hash
             (signal-state IS_RSTALLCARRYIN_INVERTED)))
           (btor59 IS_RSTALUMODE_INVERTED)
           (merged-input-state-hash
            (append
             merged-input-state-hash
             (signal-state IS_RSTALUMODE_INVERTED)))
           (btor60 IS_RSTA_INVERTED)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state IS_RSTA_INVERTED)))
           (btor61 IS_RSTB_INVERTED)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state IS_RSTB_INVERTED)))
           (btor62 IS_RSTCTRL_INVERTED)
           (merged-input-state-hash
            (append
             merged-input-state-hash
             (signal-state IS_RSTCTRL_INVERTED)))
           (btor63 IS_RSTC_INVERTED)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state IS_RSTC_INVERTED)))
           (btor64 IS_RSTD_INVERTED)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state IS_RSTD_INVERTED)))
           (btor65 IS_RSTINMODE_INVERTED)
           (merged-input-state-hash
            (append
             merged-input-state-hash
             (signal-state IS_RSTINMODE_INVERTED)))
           (btor66 IS_RSTM_INVERTED)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state IS_RSTM_INVERTED)))
           (btor67 IS_RSTP_INVERTED)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state IS_RSTP_INVERTED)))
           (btor68 MASK)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MASK)))
           (btor69 MREG)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MREG)))
           (btor70 MULTSIGNIN)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MULTSIGNIN)))
           (btor71 OPMODE)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state OPMODE)))
           (btor72 OPMODEREG)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state OPMODEREG)))
           (btor73 PATTERN)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state PATTERN)))
           (btor74 PCIN)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state PCIN)))
           (btor75 PREADDINSEL)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state PREADDINSEL)))
           (btor76 PREG)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state PREG)))
           (btor77 RND)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state RND)))
           (btor78 RSTA)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state RSTA)))
           (btor79 RSTALLCARRYIN)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state RSTALLCARRYIN)))
           (btor80 RSTALUMODE)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state RSTALUMODE)))
           (btor81 RSTB)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state RSTB)))
           (btor82 RSTC)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state RSTC)))
           (btor83 RSTCTRL)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state RSTCTRL)))
           (btor84 RSTD)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state RSTD)))
           (btor85 RSTINMODE)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state RSTINMODE)))
           (btor86 RSTM)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state RSTM)))
           (btor87 RSTP)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state RSTP)))
           (btor88 SEL_MASK)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SEL_MASK)))
           (btor89 SEL_PATTERN)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SEL_PATTERN)))
           (btor90 USE_MULT)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state USE_MULT)))
           (btor91 USE_PATTERN_DETECT)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state USE_PATTERN_DETECT)))
           (btor92 USE_SIMD)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state USE_SIMD)))
           (btor93 USE_WIDEXOR)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state USE_WIDEXOR)))
           (btor94 XORSIMD)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state XORSIMD)))
           (btor95
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state95")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state95")))))
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
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state96")))))
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
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state98")))))
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
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state116")))))
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
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state117")))))
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
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state126")))))
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
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state127")))))
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
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state136")))))
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
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state137")))))
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
            (signal (extract 0 0 (signal-value btor8)) (signal-state btor8)))
           (btor147
            (signal (extract 0 0 (signal-value btor52)) (signal-state btor52)))
           (btor148
            (signal
             (bvxor (signal-value btor146) (signal-value btor147))
             (list)))
           (btor149
            (signal (extract 1 1 (signal-value btor8)) (signal-state btor8)))
           (btor150
            (signal (extract 1 1 (signal-value btor52)) (signal-state btor52)))
           (btor151
            (signal
             (bvxor (signal-value btor149) (signal-value btor150))
             (list)))
           (btor152
            (signal (extract 2 2 (signal-value btor8)) (signal-state btor8)))
           (btor153
            (signal (extract 2 2 (signal-value btor52)) (signal-state btor52)))
           (btor154
            (signal
             (bvxor (signal-value btor152) (signal-value btor153))
             (list)))
           (btor155
            (signal (extract 3 3 (signal-value btor8)) (signal-state btor8)))
           (btor156
            (signal (extract 3 3 (signal-value btor52)) (signal-state btor52)))
           (btor157
            (signal
             (bvxor (signal-value btor155) (signal-value btor156))
             (list)))
           (btor158
            (signal
             (concat (signal-value btor151) (signal-value btor148))
             (list)))
           (btor159
            (signal
             (concat (signal-value btor154) (signal-value btor158))
             (list)))
           (btor160
            (signal
             (concat (signal-value btor157) (signal-value btor159))
             (list)))
           (btor161
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state161")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state161")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state161")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state161")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 4))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor162
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state162")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state162")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state162")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state162")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 4))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor163
            (if (bitvector->bool (signal-value btor104)) btor162 btor161))
           (btor164
            (signal (extract 0 0 (signal-value btor9)) (signal-state btor9)))
           (btor165
            (if (bitvector->bool (signal-value btor164)) btor163 btor160))
           (btor166
            (signal
             (extract 0 0 (signal-value btor165))
             (signal-state btor165)))
           (btor167
            (signal
             (extract 1 1 (signal-value btor165))
             (signal-state btor165)))
           (btor168
            (signal
             (bvand (signal-value btor166) (signal-value btor167))
             (list)))
           (btor169 (bitvector 14))
           (btor170 (bv->signal (bv 0 (bitvector 2))))
           (btor171 (bv->signal (bv 25 (bitvector 5))))
           (btor172
            (signal
             (bool->bitvector
              (bveq (signal-value btor92) (signal-value btor171)))
             (list)))
           (btor173
            (if (bitvector->bool (signal-value btor172)) btor103 btor170))
           (btor174 (bv->signal (bv 1 (bitvector 2))))
           (btor175 (bv->signal (bv 19 (bitvector 5))))
           (btor176
            (signal
             (bool->bitvector
              (bveq (signal-value btor92) (signal-value btor175)))
             (list)))
           (btor177
            (if (bitvector->bool (signal-value btor176)) btor174 btor173))
           (btor178 (bv->signal (bv 12 (bitvector 4))))
           (btor179
            (bv->signal
             (zero-extend (signal-value btor178) (bitvector 5))
             btor178))
           (btor180
            (signal
             (bool->bitvector
              (bveq (signal-value btor92) (signal-value btor179)))
             (list)))
           (btor181
            (if (bitvector->bool (signal-value btor180)) btor170 btor177))
           (btor182
            (bv->signal
             (zero-extend (signal-value btor97) (bitvector 2))
             btor97))
           (btor183
            (signal
             (bool->bitvector
              ((compose1 not bveq)
               (signal-value btor181)
               (signal-value btor182)))
             (list)))
           (btor184
            (signal
             (extract 0 0 (signal-value btor165))
             (signal-state btor165)))
           (btor185
            (signal
             (extract 0 0 (signal-value btor165))
             (signal-state btor165)))
           (btor186
            (signal
             (concat (signal-value btor185) (signal-value btor184))
             (list)))
           (btor187
            (signal
             (extract 0 0 (signal-value btor165))
             (signal-state btor165)))
           (btor188
            (signal
             (concat (signal-value btor187) (signal-value btor186))
             (list)))
           (btor189
            (signal
             (extract 0 0 (signal-value btor165))
             (signal-state btor165)))
           (btor190
            (signal
             (concat (signal-value btor189) (signal-value btor188))
             (list)))
           (btor191
            (signal
             (extract 0 0 (signal-value btor165))
             (signal-state btor165)))
           (btor192
            (signal
             (concat (signal-value btor191) (signal-value btor190))
             (list)))
           (btor193
            (signal
             (extract 0 0 (signal-value btor165))
             (signal-state btor165)))
           (btor194 (bitvector 6))
           (btor195
            (signal
             (concat (signal-value btor193) (signal-value btor192))
             (list)))
           (btor196
            (signal
             (extract 0 0 (signal-value btor165))
             (signal-state btor165)))
           (btor197 (bitvector 7))
           (btor198
            (signal
             (concat (signal-value btor196) (signal-value btor195))
             (list)))
           (btor199
            (signal
             (extract 0 0 (signal-value btor165))
             (signal-state btor165)))
           (btor200 (bitvector 8))
           (btor201
            (signal
             (concat (signal-value btor199) (signal-value btor198))
             (list)))
           (btor202
            (signal
             (extract 0 0 (signal-value btor165))
             (signal-state btor165)))
           (btor203
            (signal
             (concat (signal-value btor202) (signal-value btor201))
             (list)))
           (btor204
            (signal
             (extract 0 0 (signal-value btor165))
             (signal-state btor165)))
           (btor205 (bitvector 10))
           (btor206
            (signal
             (concat (signal-value btor204) (signal-value btor203))
             (list)))
           (btor207
            (signal
             (extract 0 0 (signal-value btor165))
             (signal-state btor165)))
           (btor208 (bitvector 11))
           (btor209
            (signal
             (concat (signal-value btor207) (signal-value btor206))
             (list)))
           (btor210
            (signal
             (extract 0 0 (signal-value btor165))
             (signal-state btor165)))
           (btor211 (bitvector 12))
           (btor212
            (signal
             (concat (signal-value btor210) (signal-value btor209))
             (list)))
           (btor213
            (signal
             (extract 0 0 (signal-value btor165))
             (signal-state btor165)))
           (btor214 (bitvector 13))
           (btor215
            (signal
             (concat (signal-value btor213) (signal-value btor212))
             (list)))
           (btor216
            (signal
             (extract 0 0 (signal-value btor165))
             (signal-state btor165)))
           (btor217
            (signal
             (concat (signal-value btor216) (signal-value btor215))
             (list)))
           (btor218
            (signal
             (extract 0 0 (signal-value btor165))
             (signal-state btor165)))
           (btor219 (bitvector 15))
           (btor220
            (signal
             (concat (signal-value btor218) (signal-value btor217))
             (list)))
           (btor221
            (signal
             (extract 0 0 (signal-value btor165))
             (signal-state btor165)))
           (btor222 (bitvector 16))
           (btor223
            (signal
             (concat (signal-value btor221) (signal-value btor220))
             (list)))
           (btor224
            (signal
             (extract 0 0 (signal-value btor165))
             (signal-state btor165)))
           (btor225 (bitvector 17))
           (btor226
            (signal
             (concat (signal-value btor224) (signal-value btor223))
             (list)))
           (btor227
            (signal
             (extract 0 0 (signal-value btor165))
             (signal-state btor165)))
           (btor228
            (signal
             (concat (signal-value btor227) (signal-value btor226))
             (list)))
           (btor229
            (signal
             (extract 0 0 (signal-value btor165))
             (signal-state btor165)))
           (btor230 (bitvector 19))
           (btor231
            (signal
             (concat (signal-value btor229) (signal-value btor228))
             (list)))
           (btor232
            (signal
             (extract 0 0 (signal-value btor165))
             (signal-state btor165)))
           (btor233 (bitvector 20))
           (btor234
            (signal
             (concat (signal-value btor232) (signal-value btor231))
             (list)))
           (btor235
            (signal
             (extract 0 0 (signal-value btor165))
             (signal-state btor165)))
           (btor236 (bitvector 21))
           (btor237
            (signal
             (concat (signal-value btor235) (signal-value btor234))
             (list)))
           (btor238
            (signal
             (extract 0 0 (signal-value btor165))
             (signal-state btor165)))
           (btor239 (bitvector 22))
           (btor240
            (signal
             (concat (signal-value btor238) (signal-value btor237))
             (list)))
           (btor241
            (signal
             (extract 0 0 (signal-value btor165))
             (signal-state btor165)))
           (btor242 (bitvector 23))
           (btor243
            (signal
             (concat (signal-value btor241) (signal-value btor240))
             (list)))
           (btor244
            (signal
             (extract 0 0 (signal-value btor165))
             (signal-state btor165)))
           (btor245 (bitvector 24))
           (btor246
            (signal
             (concat (signal-value btor244) (signal-value btor243))
             (list)))
           (btor247
            (signal
             (extract 0 0 (signal-value btor165))
             (signal-state btor165)))
           (btor248 (bitvector 25))
           (btor249
            (signal
             (concat (signal-value btor247) (signal-value btor246))
             (list)))
           (btor250
            (signal
             (extract 0 0 (signal-value btor165))
             (signal-state btor165)))
           (btor251 (bitvector 26))
           (btor252
            (signal
             (concat (signal-value btor250) (signal-value btor249))
             (list)))
           (btor253
            (signal
             (extract 0 0 (signal-value btor165))
             (signal-state btor165)))
           (btor254
            (signal
             (concat (signal-value btor253) (signal-value btor252))
             (list)))
           (btor255
            (signal
             (extract 0 0 (signal-value btor165))
             (signal-state btor165)))
           (btor256 (bitvector 28))
           (btor257
            (signal
             (concat (signal-value btor255) (signal-value btor254))
             (list)))
           (btor258
            (signal
             (extract 0 0 (signal-value btor165))
             (signal-state btor165)))
           (btor259 (bitvector 29))
           (btor260
            (signal
             (concat (signal-value btor258) (signal-value btor257))
             (list)))
           (btor261
            (signal
             (extract 0 0 (signal-value btor165))
             (signal-state btor165)))
           (btor262
            (signal
             (concat (signal-value btor261) (signal-value btor260))
             (list)))
           (btor263
            (signal
             (extract 0 0 (signal-value btor165))
             (signal-state btor165)))
           (btor264 (bitvector 31))
           (btor265
            (signal
             (concat (signal-value btor263) (signal-value btor262))
             (list)))
           (btor266
            (signal
             (extract 0 0 (signal-value btor165))
             (signal-state btor165)))
           (btor267
            (signal
             (concat (signal-value btor266) (signal-value btor265))
             (list)))
           (btor268
            (signal
             (extract 0 0 (signal-value btor165))
             (signal-state btor165)))
           (btor269 (bitvector 33))
           (btor270
            (signal
             (concat (signal-value btor268) (signal-value btor267))
             (list)))
           (btor271
            (signal
             (extract 0 0 (signal-value btor165))
             (signal-state btor165)))
           (btor272 (bitvector 34))
           (btor273
            (signal
             (concat (signal-value btor271) (signal-value btor270))
             (list)))
           (btor274
            (signal
             (extract 0 0 (signal-value btor165))
             (signal-state btor165)))
           (btor275 (bitvector 35))
           (btor276
            (signal
             (concat (signal-value btor274) (signal-value btor273))
             (list)))
           (btor277
            (signal
             (extract 0 0 (signal-value btor165))
             (signal-state btor165)))
           (btor278 (bitvector 36))
           (btor279
            (signal
             (concat (signal-value btor277) (signal-value btor276))
             (list)))
           (btor280
            (signal
             (extract 0 0 (signal-value btor165))
             (signal-state btor165)))
           (btor281 (bitvector 37))
           (btor282
            (signal
             (concat (signal-value btor280) (signal-value btor279))
             (list)))
           (btor283
            (signal
             (extract 0 0 (signal-value btor165))
             (signal-state btor165)))
           (btor284 (bitvector 38))
           (btor285
            (signal
             (concat (signal-value btor283) (signal-value btor282))
             (list)))
           (btor286
            (signal
             (extract 0 0 (signal-value btor165))
             (signal-state btor165)))
           (btor287 (bitvector 39))
           (btor288
            (signal
             (concat (signal-value btor286) (signal-value btor285))
             (list)))
           (btor289
            (signal
             (extract 0 0 (signal-value btor165))
             (signal-state btor165)))
           (btor290 (bitvector 40))
           (btor291
            (signal
             (concat (signal-value btor289) (signal-value btor288))
             (list)))
           (btor292
            (signal
             (extract 0 0 (signal-value btor165))
             (signal-state btor165)))
           (btor293 (bitvector 41))
           (btor294
            (signal
             (concat (signal-value btor292) (signal-value btor291))
             (list)))
           (btor295
            (signal
             (extract 0 0 (signal-value btor165))
             (signal-state btor165)))
           (btor296 (bitvector 42))
           (btor297
            (signal
             (concat (signal-value btor295) (signal-value btor294))
             (list)))
           (btor298
            (signal
             (extract 0 0 (signal-value btor165))
             (signal-state btor165)))
           (btor299 (bitvector 43))
           (btor300
            (signal
             (concat (signal-value btor298) (signal-value btor297))
             (list)))
           (btor301
            (signal
             (extract 0 0 (signal-value btor165))
             (signal-state btor165)))
           (btor302 (bitvector 44))
           (btor303
            (signal
             (concat (signal-value btor301) (signal-value btor300))
             (list)))
           (btor304
            (signal
             (extract 0 0 (signal-value btor165))
             (signal-state btor165)))
           (btor305 (bitvector 45))
           (btor306
            (signal
             (concat (signal-value btor304) (signal-value btor303))
             (list)))
           (btor307
            (signal
             (extract 0 0 (signal-value btor165))
             (signal-state btor165)))
           (btor308 (bitvector 46))
           (btor309
            (signal
             (concat (signal-value btor307) (signal-value btor306))
             (list)))
           (btor310
            (signal
             (extract 0 0 (signal-value btor165))
             (signal-state btor165)))
           (btor311 (bitvector 47))
           (btor312
            (signal
             (concat (signal-value btor310) (signal-value btor309))
             (list)))
           (btor313
            (signal
             (extract 0 0 (signal-value btor165))
             (signal-state btor165)))
           (btor314
            (signal
             (concat (signal-value btor313) (signal-value btor312))
             (list)))
           (btor315 (bv->signal (bv 0 (bitvector 48))))
           (btor316
            (signal (extract 0 0 (signal-value btor71)) (signal-state btor71)))
           (btor317
            (signal (extract 0 0 (signal-value btor57)) (signal-state btor57)))
           (btor318
            (signal
             (bvxor (signal-value btor316) (signal-value btor317))
             (list)))
           (btor319
            (signal (extract 1 1 (signal-value btor71)) (signal-state btor71)))
           (btor320
            (signal (extract 1 1 (signal-value btor57)) (signal-state btor57)))
           (btor321
            (signal
             (bvxor (signal-value btor319) (signal-value btor320))
             (list)))
           (btor322
            (signal (extract 2 2 (signal-value btor71)) (signal-state btor71)))
           (btor323
            (signal (extract 2 2 (signal-value btor57)) (signal-state btor57)))
           (btor324
            (signal
             (bvxor (signal-value btor322) (signal-value btor323))
             (list)))
           (btor325
            (signal (extract 3 3 (signal-value btor71)) (signal-state btor71)))
           (btor326
            (signal (extract 3 3 (signal-value btor57)) (signal-state btor57)))
           (btor327
            (signal
             (bvxor (signal-value btor325) (signal-value btor326))
             (list)))
           (btor328
            (signal (extract 4 4 (signal-value btor71)) (signal-state btor71)))
           (btor329
            (signal (extract 4 4 (signal-value btor57)) (signal-state btor57)))
           (btor330
            (signal
             (bvxor (signal-value btor328) (signal-value btor329))
             (list)))
           (btor331
            (signal (extract 5 5 (signal-value btor71)) (signal-state btor71)))
           (btor332
            (signal (extract 5 5 (signal-value btor57)) (signal-state btor57)))
           (btor333
            (signal
             (bvxor (signal-value btor331) (signal-value btor332))
             (list)))
           (btor334
            (signal (extract 6 6 (signal-value btor71)) (signal-state btor71)))
           (btor335
            (signal (extract 6 6 (signal-value btor57)) (signal-state btor57)))
           (btor336
            (signal
             (bvxor (signal-value btor334) (signal-value btor335))
             (list)))
           (btor337
            (signal (extract 7 7 (signal-value btor71)) (signal-state btor71)))
           (btor338
            (signal (extract 7 7 (signal-value btor57)) (signal-state btor57)))
           (btor339
            (signal
             (bvxor (signal-value btor337) (signal-value btor338))
             (list)))
           (btor340
            (signal (extract 8 8 (signal-value btor71)) (signal-state btor71)))
           (btor341
            (signal (extract 8 8 (signal-value btor57)) (signal-state btor57)))
           (btor342
            (signal
             (bvxor (signal-value btor340) (signal-value btor341))
             (list)))
           (btor343
            (signal
             (concat (signal-value btor321) (signal-value btor318))
             (list)))
           (btor344
            (signal
             (concat (signal-value btor324) (signal-value btor343))
             (list)))
           (btor345
            (signal
             (concat (signal-value btor327) (signal-value btor344))
             (list)))
           (btor346
            (signal
             (concat (signal-value btor330) (signal-value btor345))
             (list)))
           (btor347
            (signal
             (concat (signal-value btor333) (signal-value btor346))
             (list)))
           (btor348
            (signal
             (concat (signal-value btor336) (signal-value btor347))
             (list)))
           (btor349
            (signal
             (concat (signal-value btor339) (signal-value btor348))
             (list)))
           (btor350
            (signal
             (concat (signal-value btor342) (signal-value btor349))
             (list)))
           (btor351
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state351")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state351")))))
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
                          (bv 0 9))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor352
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state352")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state352")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state352")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state352")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 9))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor353
            (if (bitvector->bool (signal-value btor104)) btor352 btor351))
           (btor354
            (signal (extract 0 0 (signal-value btor72)) (signal-state btor72)))
           (btor355
            (if (bitvector->bool (signal-value btor354)) btor353 btor350))
           (btor356
            (signal
             (extract 6 4 (signal-value btor355))
             (signal-state btor355)))
           (btor357
            (bv->signal
             (zero-extend (signal-value btor97) (bitvector 3))
             btor97))
           (btor358
            (signal
             (bool->bitvector
              (bveq (signal-value btor356) (signal-value btor357)))
             (list)))
           (btor359
            (if (bitvector->bool (signal-value btor358)) btor74 btor315))
           (btor360
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state360")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state360")))))
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
                          (bv 0 48))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor361
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state361")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state361")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state361")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state361")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 48))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor362
            (if (bitvector->bool (signal-value btor104)) btor361 btor360))
           (btor363
            (signal (extract 0 0 (signal-value btor46)) (signal-state btor46)))
           (btor364
            (if (bitvector->bool (signal-value btor363)) btor362 btor24))
           (btor365 (bv->signal (bv 3 (bitvector 2))))
           (btor366
            (bv->signal
             (zero-extend (signal-value btor365) (bitvector 3))
             btor365))
           (btor367
            (signal
             (bool->bitvector
              (bveq (signal-value btor356) (signal-value btor366)))
             (list)))
           (btor368
            (if (bitvector->bool (signal-value btor367)) btor364 btor359))
           (btor369
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state369")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state369")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state369")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state369")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 48))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor370
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state370")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state370")))))
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
                          (bv 0 48))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor371
            (if (bitvector->bool (signal-value btor104)) btor370 btor369))
           (btor372
            (signal
             (extract 47 17 (signal-value btor74))
             (signal-state btor74)))
           (btor373
            (signal
             (extract 47 47 (signal-value btor74))
             (signal-state btor74)))
           (btor374
            (signal
             (concat (signal-value btor373) (signal-value btor372))
             (list)))
           (btor375
            (signal
             (extract 47 47 (signal-value btor74))
             (signal-state btor74)))
           (btor376
            (signal
             (concat (signal-value btor375) (signal-value btor374))
             (list)))
           (btor377
            (signal
             (extract 47 47 (signal-value btor74))
             (signal-state btor74)))
           (btor378
            (signal
             (concat (signal-value btor377) (signal-value btor376))
             (list)))
           (btor379
            (signal
             (extract 47 47 (signal-value btor74))
             (signal-state btor74)))
           (btor380
            (signal
             (concat (signal-value btor379) (signal-value btor378))
             (list)))
           (btor381
            (signal
             (extract 47 47 (signal-value btor74))
             (signal-state btor74)))
           (btor382
            (signal
             (concat (signal-value btor381) (signal-value btor380))
             (list)))
           (btor383
            (signal
             (extract 47 47 (signal-value btor74))
             (signal-state btor74)))
           (btor384
            (signal
             (concat (signal-value btor383) (signal-value btor382))
             (list)))
           (btor385
            (signal
             (extract 47 47 (signal-value btor74))
             (signal-state btor74)))
           (btor386
            (signal
             (concat (signal-value btor385) (signal-value btor384))
             (list)))
           (btor387
            (signal
             (extract 47 47 (signal-value btor74))
             (signal-state btor74)))
           (btor388
            (signal
             (concat (signal-value btor387) (signal-value btor386))
             (list)))
           (btor389
            (signal
             (extract 47 47 (signal-value btor74))
             (signal-state btor74)))
           (btor390
            (signal
             (concat (signal-value btor389) (signal-value btor388))
             (list)))
           (btor391
            (signal
             (extract 47 47 (signal-value btor74))
             (signal-state btor74)))
           (btor392
            (signal
             (concat (signal-value btor391) (signal-value btor390))
             (list)))
           (btor393
            (signal
             (extract 47 47 (signal-value btor74))
             (signal-state btor74)))
           (btor394
            (signal
             (concat (signal-value btor393) (signal-value btor392))
             (list)))
           (btor395
            (signal
             (extract 47 47 (signal-value btor74))
             (signal-state btor74)))
           (btor396
            (signal
             (concat (signal-value btor395) (signal-value btor394))
             (list)))
           (btor397
            (signal
             (extract 47 47 (signal-value btor74))
             (signal-state btor74)))
           (btor398
            (signal
             (concat (signal-value btor397) (signal-value btor396))
             (list)))
           (btor399
            (signal
             (extract 47 47 (signal-value btor74))
             (signal-state btor74)))
           (btor400
            (signal
             (concat (signal-value btor399) (signal-value btor398))
             (list)))
           (btor401
            (signal
             (extract 47 47 (signal-value btor74))
             (signal-state btor74)))
           (btor402
            (signal
             (concat (signal-value btor401) (signal-value btor400))
             (list)))
           (btor403
            (signal
             (extract 47 47 (signal-value btor74))
             (signal-state btor74)))
           (btor404
            (signal
             (concat (signal-value btor403) (signal-value btor402))
             (list)))
           (btor405
            (signal
             (extract 47 47 (signal-value btor74))
             (signal-state btor74)))
           (btor406
            (signal
             (concat (signal-value btor405) (signal-value btor404))
             (list)))
           (btor407 (bv->signal (bv 5 (bitvector 3))))
           (btor408
            (signal
             (bool->bitvector
              (bveq (signal-value btor356) (signal-value btor407)))
             (list)))
           (btor409
            (if (bitvector->bool (signal-value btor408)) btor406 btor371))
           (btor410
            (signal
             (extract 47 17 (signal-value btor371))
             (signal-state btor371)))
           (btor411
            (signal
             (extract 47 47 (signal-value btor371))
             (signal-state btor371)))
           (btor412
            (signal
             (concat (signal-value btor411) (signal-value btor410))
             (list)))
           (btor413
            (signal
             (extract 47 47 (signal-value btor371))
             (signal-state btor371)))
           (btor414
            (signal
             (concat (signal-value btor413) (signal-value btor412))
             (list)))
           (btor415
            (signal
             (extract 47 47 (signal-value btor371))
             (signal-state btor371)))
           (btor416
            (signal
             (concat (signal-value btor415) (signal-value btor414))
             (list)))
           (btor417
            (signal
             (extract 47 47 (signal-value btor371))
             (signal-state btor371)))
           (btor418
            (signal
             (concat (signal-value btor417) (signal-value btor416))
             (list)))
           (btor419
            (signal
             (extract 47 47 (signal-value btor371))
             (signal-state btor371)))
           (btor420
            (signal
             (concat (signal-value btor419) (signal-value btor418))
             (list)))
           (btor421
            (signal
             (extract 47 47 (signal-value btor371))
             (signal-state btor371)))
           (btor422
            (signal
             (concat (signal-value btor421) (signal-value btor420))
             (list)))
           (btor423
            (signal
             (extract 47 47 (signal-value btor371))
             (signal-state btor371)))
           (btor424
            (signal
             (concat (signal-value btor423) (signal-value btor422))
             (list)))
           (btor425
            (signal
             (extract 47 47 (signal-value btor371))
             (signal-state btor371)))
           (btor426
            (signal
             (concat (signal-value btor425) (signal-value btor424))
             (list)))
           (btor427
            (signal
             (extract 47 47 (signal-value btor371))
             (signal-state btor371)))
           (btor428
            (signal
             (concat (signal-value btor427) (signal-value btor426))
             (list)))
           (btor429
            (signal
             (extract 47 47 (signal-value btor371))
             (signal-state btor371)))
           (btor430
            (signal
             (concat (signal-value btor429) (signal-value btor428))
             (list)))
           (btor431
            (signal
             (extract 47 47 (signal-value btor371))
             (signal-state btor371)))
           (btor432
            (signal
             (concat (signal-value btor431) (signal-value btor430))
             (list)))
           (btor433
            (signal
             (extract 47 47 (signal-value btor371))
             (signal-state btor371)))
           (btor434
            (signal
             (concat (signal-value btor433) (signal-value btor432))
             (list)))
           (btor435
            (signal
             (extract 47 47 (signal-value btor371))
             (signal-state btor371)))
           (btor436
            (signal
             (concat (signal-value btor435) (signal-value btor434))
             (list)))
           (btor437
            (signal
             (extract 47 47 (signal-value btor371))
             (signal-state btor371)))
           (btor438
            (signal
             (concat (signal-value btor437) (signal-value btor436))
             (list)))
           (btor439
            (signal
             (extract 47 47 (signal-value btor371))
             (signal-state btor371)))
           (btor440
            (signal
             (concat (signal-value btor439) (signal-value btor438))
             (list)))
           (btor441
            (signal
             (extract 47 47 (signal-value btor371))
             (signal-state btor371)))
           (btor442
            (signal
             (concat (signal-value btor441) (signal-value btor440))
             (list)))
           (btor443
            (signal
             (extract 47 47 (signal-value btor371))
             (signal-state btor371)))
           (btor444
            (signal
             (concat (signal-value btor443) (signal-value btor442))
             (list)))
           (btor445
            (signal
             (extract 6 5 (signal-value btor355))
             (signal-state btor355)))
           (btor446
            (signal
             (bool->bitvector
              (bveq (signal-value btor445) (signal-value btor365)))
             (list)))
           (btor447
            (if (bitvector->bool (signal-value btor446)) btor444 btor409))
           (btor448 (bv->signal (bv 4 (bitvector 3))))
           (btor449
            (signal
             (bool->bitvector
              (bveq (signal-value btor356) (signal-value btor448)))
             (list)))
           (btor450
            (bv->signal
             (zero-extend (signal-value btor103) (bitvector 3))
             btor103))
           (btor451
            (signal
             (bool->bitvector
              (bveq (signal-value btor356) (signal-value btor450)))
             (list)))
           (btor452
            (signal
             (concat (signal-value btor446) (signal-value btor449))
             (list)))
           (btor453
            (signal
             (concat (signal-value btor408) (signal-value btor452))
             (list)))
           (btor454
            (signal
             (concat (signal-value btor451) (signal-value btor453))
             (list)))
           (btor455
            (signal
             (apply bvor (bitvector->bits (signal-value btor454)))
             (signal-state btor454)))
           (btor456
            (if (bitvector->bool (signal-value btor455)) btor447 btor368))
           (btor457
            (signal
             (bvxor (signal-value btor314) (signal-value btor456))
             (list)))
           (btor458
            (signal
             (concat (signal-value btor70) (signal-value btor106))
             (list)))
           (btor459
            (if (bitvector->bool (signal-value btor449)) btor458 btor170))
           (btor460 (bv->signal (bv 0 (bitvector 46))))
           (btor461
            (signal
             (concat (signal-value btor460) (signal-value btor459))
             (list)))
           (btor462 (bv->signal (bv 17592186044416 (bitvector 45))))
           (btor463
            (signal
             (extract 26 0 (signal-value btor121))
             (signal-state btor121)))
           (btor464
            (signal
             (extract 26 0 (signal-value btor105))
             (signal-state btor105)))
           (btor465
            (signal (extract 0 0 (signal-value btor50)) (signal-state btor50)))
           (btor466
            (signal (extract 0 0 (signal-value btor55)) (signal-state btor55)))
           (btor467
            (signal
             (bvxor (signal-value btor465) (signal-value btor466))
             (list)))
           (btor468
            (signal (extract 1 1 (signal-value btor50)) (signal-state btor50)))
           (btor469
            (signal (extract 1 1 (signal-value btor55)) (signal-state btor55)))
           (btor470
            (signal
             (bvxor (signal-value btor468) (signal-value btor469))
             (list)))
           (btor471
            (signal (extract 2 2 (signal-value btor50)) (signal-state btor50)))
           (btor472
            (signal (extract 2 2 (signal-value btor55)) (signal-state btor55)))
           (btor473
            (signal
             (bvxor (signal-value btor471) (signal-value btor472))
             (list)))
           (btor474
            (signal (extract 3 3 (signal-value btor50)) (signal-state btor50)))
           (btor475
            (signal (extract 3 3 (signal-value btor55)) (signal-state btor55)))
           (btor476
            (signal
             (bvxor (signal-value btor474) (signal-value btor475))
             (list)))
           (btor477
            (signal (extract 4 4 (signal-value btor50)) (signal-state btor50)))
           (btor478
            (signal (extract 4 4 (signal-value btor55)) (signal-state btor55)))
           (btor479
            (signal
             (bvxor (signal-value btor477) (signal-value btor478))
             (list)))
           (btor480
            (signal
             (concat (signal-value btor470) (signal-value btor467))
             (list)))
           (btor481
            (signal
             (concat (signal-value btor473) (signal-value btor480))
             (list)))
           (btor482
            (signal
             (concat (signal-value btor476) (signal-value btor481))
             (list)))
           (btor483
            (signal
             (concat (signal-value btor479) (signal-value btor482))
             (list)))
           (btor484
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state484")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state484")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state484")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state484")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 5))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor485
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state485")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state485")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state485")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state485")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 5))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor486
            (if (bitvector->bool (signal-value btor104)) btor485 btor484))
           (btor487
            (signal (extract 0 0 (signal-value btor51)) (signal-state btor51)))
           (btor488
            (if (bitvector->bool (signal-value btor487)) btor486 btor483))
           (btor489
            (signal
             (extract 0 0 (signal-value btor488))
             (signal-state btor488)))
           (btor490
            (if (bitvector->bool (signal-value btor489)) btor464 btor463))
           (btor491 (bv->signal (bv 0 (bitvector 27))))
           (btor492
            (bv->signal
             (zero-extend (signal-value btor97) (bitvector 5))
             btor97))
           (btor493
            (signal
             (bool->bitvector
              (bveq (signal-value btor75) (signal-value btor492)))
             (list)))
           (btor494
            (if (bitvector->bool (signal-value btor493)) btor97 btor106))
           (btor495 (bv->signal (bv 0 (bitvector 3))))
           (btor496
            (signal
             (concat (signal-value btor495) (signal-value btor75))
             (list)))
           (btor497
            (signal
             (apply bvor (bitvector->bits (signal-value btor496)))
             (signal-state btor496)))
           (btor498 (signal (bvnot (signal-value btor497)) (list)))
           (btor499
            (if (bitvector->bool (signal-value btor498)) btor106 btor494))
           (btor500 (signal (bvnot (signal-value btor499)) (list)))
           (btor501
            (signal
             (extract 1 1 (signal-value btor488))
             (signal-state btor488)))
           (btor502
            (signal
             (bvand (signal-value btor500) (signal-value btor501))
             (list)))
           (btor503
            (if (bitvector->bool (signal-value btor502)) btor491 btor490))
           (btor504
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state504")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state504")))))
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
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state505")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state505")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state505")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state505")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 27))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor506
            (if (bitvector->bool (signal-value btor104)) btor505 btor504))
           (btor507
            (signal (extract 0 0 (signal-value btor49)) (signal-state btor49)))
           (btor508
            (bv->signal
             (zero-extend (signal-value btor103) (bitvector 5))
             btor103))
           (btor509
            (signal
             (bool->bitvector
              (bveq (signal-value btor11) (signal-value btor508)))
             (list)))
           (btor510
            (if (bitvector->bool (signal-value btor509)) btor97 btor106))
           (btor511 (bv->signal (bv 0 (bitvector 11))))
           (btor512
            (signal
             (concat (signal-value btor511) (signal-value btor11))
             (list)))
           (btor513
            (signal
             (apply bvor (bitvector->bits (signal-value btor512)))
             (signal-state btor512)))
           (btor514 (signal (bvnot (signal-value btor513)) (list)))
           (btor515
            (if (bitvector->bool (signal-value btor514)) btor106 btor510))
           (btor516 (signal (bvnot (signal-value btor515)) (list)))
           (btor517
            (bv->signal
             (zero-extend (signal-value btor103) (bitvector 5))
             btor103))
           (btor518
            (signal
             (bool->bitvector
              (bveq (signal-value btor20) (signal-value btor517)))
             (list)))
           (btor519
            (if (bitvector->bool (signal-value btor518)) btor97 btor106))
           (btor520
            (bv->signal
             (zero-extend (signal-value btor97) (bitvector 5))
             btor97))
           (btor521
            (signal
             (bool->bitvector
              (bveq (signal-value btor20) (signal-value btor520)))
             (list)))
           (btor522
            (if (bitvector->bool (signal-value btor521)) btor106 btor519))
           (btor523 (signal (bvnot (signal-value btor522)) (list)))
           (btor524
            (signal
             (bvand (signal-value btor516) (signal-value btor523))
             (list)))
           (btor525 (bv->signal (bv 20 (bitvector 5))))
           (btor526
            (signal
             (bool->bitvector
              (bveq (signal-value btor90) (signal-value btor525)))
             (list)))
           (btor527
            (if (bitvector->bool (signal-value btor526)) btor103 btor170))
           (btor528 (bv->signal (bv 18 (bitvector 5))))
           (btor529
            (signal
             (bool->bitvector
              (bveq (signal-value btor90) (signal-value btor528)))
             (list)))
           (btor530
            (if (bitvector->bool (signal-value btor529)) btor174 btor527))
           (btor531 (bv->signal (bv 10 (bitvector 4))))
           (btor532
            (bv->signal
             (zero-extend (signal-value btor531) (bitvector 5))
             btor531))
           (btor533
            (signal
             (bool->bitvector
              (bveq (signal-value btor90) (signal-value btor532)))
             (list)))
           (btor534
            (if (bitvector->bool (signal-value btor533)) btor170 btor530))
           (btor535
            (signal
             (bool->bitvector
              (bveq (signal-value btor534) (signal-value btor103)))
             (list)))
           (btor536
            (signal
             (bvor (signal-value btor524) (signal-value btor535))
             (list)))
           (btor537
            (if (bitvector->bool (signal-value btor536)) btor106 btor507))
           (btor538
            (if (bitvector->bool (signal-value btor537)) btor506 btor48))
           (btor539
            (signal
             (extract 2 2 (signal-value btor488))
             (signal-state btor488)))
           (btor540
            (if (bitvector->bool (signal-value btor539)) btor538 btor491))
           (btor541
            (signal
             (extract 4 4 (signal-value btor488))
             (signal-state btor488)))
           (btor542
            (if (bitvector->bool (signal-value btor541)) btor128 btor141))
           (btor543 (bv->signal (bv 0 (bitvector 18))))
           (btor544
            (signal
             (bvand (signal-value btor499) (signal-value btor501))
             (list)))
           (btor545
            (if (bitvector->bool (signal-value btor544)) btor543 btor542))
           (btor546
            (signal
             (extract 17 17 (signal-value btor545))
             (signal-state btor545)))
           (btor547
            (signal
             (concat (signal-value btor546) (signal-value btor545))
             (list)))
           (btor548
            (signal
             (extract 17 17 (signal-value btor545))
             (signal-state btor545)))
           (btor549
            (signal
             (concat (signal-value btor548) (signal-value btor547))
             (list)))
           (btor550
            (signal
             (extract 17 17 (signal-value btor545))
             (signal-state btor545)))
           (btor551
            (signal
             (concat (signal-value btor550) (signal-value btor549))
             (list)))
           (btor552
            (signal
             (extract 17 17 (signal-value btor545))
             (signal-state btor545)))
           (btor553
            (signal
             (concat (signal-value btor552) (signal-value btor551))
             (list)))
           (btor554
            (signal
             (extract 17 17 (signal-value btor545))
             (signal-state btor545)))
           (btor555
            (signal
             (concat (signal-value btor554) (signal-value btor553))
             (list)))
           (btor556
            (signal
             (extract 17 17 (signal-value btor545))
             (signal-state btor545)))
           (btor557
            (signal
             (concat (signal-value btor556) (signal-value btor555))
             (list)))
           (btor558
            (signal
             (extract 17 17 (signal-value btor545))
             (signal-state btor545)))
           (btor559
            (signal
             (concat (signal-value btor558) (signal-value btor557))
             (list)))
           (btor560
            (signal
             (extract 17 17 (signal-value btor545))
             (signal-state btor545)))
           (btor561
            (signal
             (concat (signal-value btor560) (signal-value btor559))
             (list)))
           (btor562
            (signal
             (extract 17 17 (signal-value btor545))
             (signal-state btor545)))
           (btor563
            (signal
             (concat (signal-value btor562) (signal-value btor561))
             (list)))
           (btor564
            (if (bitvector->bool (signal-value btor499)) btor563 btor503))
           (btor565
            (signal
             (bvadd (signal-value btor540) (signal-value btor564))
             (list)))
           (btor566
            (signal
             (bvsub (signal-value btor540) (signal-value btor564))
             (list)))
           (btor567
            (signal
             (extract 3 3 (signal-value btor488))
             (signal-state btor488)))
           (btor568
            (if (bitvector->bool (signal-value btor567)) btor566 btor565))
           (btor569
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state569")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state569")))))
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
                          (bv 0 27))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor570
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state570")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state570")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state570")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state570")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 27))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor571
            (if (bitvector->bool (signal-value btor104)) btor570 btor569))
           (btor572
            (signal (extract 0 0 (signal-value btor6)) (signal-state btor6)))
           (btor573
            (if (bitvector->bool (signal-value btor536)) btor106 btor572))
           (btor574
            (if (bitvector->bool (signal-value btor573)) btor571 btor568))
           (btor575
            (if (bitvector->bool (signal-value btor515)) btor574 btor503))
           (btor576
            (signal
             (extract 26 26 (signal-value btor575))
             (signal-state btor575)))
           (btor577
            (signal
             (concat (signal-value btor576) (signal-value btor575))
             (list)))
           (btor578
            (signal
             (extract 26 26 (signal-value btor575))
             (signal-state btor575)))
           (btor579
            (signal
             (concat (signal-value btor578) (signal-value btor577))
             (list)))
           (btor580
            (signal
             (extract 26 26 (signal-value btor575))
             (signal-state btor575)))
           (btor581
            (signal
             (concat (signal-value btor580) (signal-value btor579))
             (list)))
           (btor582
            (signal
             (extract 26 26 (signal-value btor575))
             (signal-state btor575)))
           (btor583
            (signal
             (concat (signal-value btor582) (signal-value btor581))
             (list)))
           (btor584
            (signal
             (extract 26 26 (signal-value btor575))
             (signal-state btor575)))
           (btor585
            (signal
             (concat (signal-value btor584) (signal-value btor583))
             (list)))
           (btor586
            (signal
             (extract 26 26 (signal-value btor575))
             (signal-state btor575)))
           (btor587
            (signal
             (concat (signal-value btor586) (signal-value btor585))
             (list)))
           (btor588
            (signal
             (extract 26 26 (signal-value btor575))
             (signal-state btor575)))
           (btor589
            (signal
             (concat (signal-value btor588) (signal-value btor587))
             (list)))
           (btor590
            (signal
             (extract 26 26 (signal-value btor575))
             (signal-state btor575)))
           (btor591
            (signal
             (concat (signal-value btor590) (signal-value btor589))
             (list)))
           (btor592
            (signal
             (extract 26 26 (signal-value btor575))
             (signal-state btor575)))
           (btor593
            (signal
             (concat (signal-value btor592) (signal-value btor591))
             (list)))
           (btor594
            (signal
             (extract 26 26 (signal-value btor575))
             (signal-state btor575)))
           (btor595
            (signal
             (concat (signal-value btor594) (signal-value btor593))
             (list)))
           (btor596
            (signal
             (extract 26 26 (signal-value btor575))
             (signal-state btor575)))
           (btor597
            (signal
             (concat (signal-value btor596) (signal-value btor595))
             (list)))
           (btor598
            (signal
             (extract 26 26 (signal-value btor575))
             (signal-state btor575)))
           (btor599
            (signal
             (concat (signal-value btor598) (signal-value btor597))
             (list)))
           (btor600
            (signal
             (extract 26 26 (signal-value btor575))
             (signal-state btor575)))
           (btor601
            (signal
             (concat (signal-value btor600) (signal-value btor599))
             (list)))
           (btor602
            (signal
             (extract 26 26 (signal-value btor575))
             (signal-state btor575)))
           (btor603
            (signal
             (concat (signal-value btor602) (signal-value btor601))
             (list)))
           (btor604
            (signal
             (extract 26 26 (signal-value btor575))
             (signal-state btor575)))
           (btor605
            (signal
             (concat (signal-value btor604) (signal-value btor603))
             (list)))
           (btor606
            (signal
             (extract 26 26 (signal-value btor575))
             (signal-state btor575)))
           (btor607
            (signal
             (concat (signal-value btor606) (signal-value btor605))
             (list)))
           (btor608
            (signal
             (extract 26 26 (signal-value btor575))
             (signal-state btor575)))
           (btor609
            (signal
             (concat (signal-value btor608) (signal-value btor607))
             (list)))
           (btor610
            (signal
             (extract 26 26 (signal-value btor575))
             (signal-state btor575)))
           (btor611
            (signal
             (concat (signal-value btor610) (signal-value btor609))
             (list)))
           (btor612
            (signal
             (extract 17 0 (signal-value btor574))
             (signal-state btor574)))
           (btor613
            (if (bitvector->bool (signal-value btor522)) btor612 btor545))
           (btor614
            (signal
             (extract 17 17 (signal-value btor613))
             (signal-state btor613)))
           (btor615
            (signal
             (concat (signal-value btor614) (signal-value btor613))
             (list)))
           (btor616
            (signal
             (extract 17 17 (signal-value btor613))
             (signal-state btor613)))
           (btor617
            (signal
             (concat (signal-value btor616) (signal-value btor615))
             (list)))
           (btor618
            (signal
             (extract 17 17 (signal-value btor613))
             (signal-state btor613)))
           (btor619
            (signal
             (concat (signal-value btor618) (signal-value btor617))
             (list)))
           (btor620
            (signal
             (extract 17 17 (signal-value btor613))
             (signal-state btor613)))
           (btor621
            (signal
             (concat (signal-value btor620) (signal-value btor619))
             (list)))
           (btor622
            (signal
             (extract 17 17 (signal-value btor613))
             (signal-state btor613)))
           (btor623
            (signal
             (concat (signal-value btor622) (signal-value btor621))
             (list)))
           (btor624
            (signal
             (extract 17 17 (signal-value btor613))
             (signal-state btor613)))
           (btor625
            (signal
             (concat (signal-value btor624) (signal-value btor623))
             (list)))
           (btor626
            (signal
             (extract 17 17 (signal-value btor613))
             (signal-state btor613)))
           (btor627
            (signal
             (concat (signal-value btor626) (signal-value btor625))
             (list)))
           (btor628
            (signal
             (extract 17 17 (signal-value btor613))
             (signal-state btor613)))
           (btor629
            (signal
             (concat (signal-value btor628) (signal-value btor627))
             (list)))
           (btor630
            (signal
             (extract 17 17 (signal-value btor613))
             (signal-state btor613)))
           (btor631
            (signal
             (concat (signal-value btor630) (signal-value btor629))
             (list)))
           (btor632
            (signal
             (extract 17 17 (signal-value btor613))
             (signal-state btor613)))
           (btor633
            (signal
             (concat (signal-value btor632) (signal-value btor631))
             (list)))
           (btor634
            (signal
             (extract 17 17 (signal-value btor613))
             (signal-state btor613)))
           (btor635
            (signal
             (concat (signal-value btor634) (signal-value btor633))
             (list)))
           (btor636
            (signal
             (extract 17 17 (signal-value btor613))
             (signal-state btor613)))
           (btor637
            (signal
             (concat (signal-value btor636) (signal-value btor635))
             (list)))
           (btor638
            (signal
             (extract 17 17 (signal-value btor613))
             (signal-state btor613)))
           (btor639
            (signal
             (concat (signal-value btor638) (signal-value btor637))
             (list)))
           (btor640
            (signal
             (extract 17 17 (signal-value btor613))
             (signal-state btor613)))
           (btor641
            (signal
             (concat (signal-value btor640) (signal-value btor639))
             (list)))
           (btor642
            (signal
             (extract 17 17 (signal-value btor613))
             (signal-state btor613)))
           (btor643
            (signal
             (concat (signal-value btor642) (signal-value btor641))
             (list)))
           (btor644
            (signal
             (extract 17 17 (signal-value btor613))
             (signal-state btor613)))
           (btor645
            (signal
             (concat (signal-value btor644) (signal-value btor643))
             (list)))
           (btor646
            (signal
             (extract 17 17 (signal-value btor613))
             (signal-state btor613)))
           (btor647
            (signal
             (concat (signal-value btor646) (signal-value btor645))
             (list)))
           (btor648
            (signal
             (extract 17 17 (signal-value btor613))
             (signal-state btor613)))
           (btor649
            (signal
             (concat (signal-value btor648) (signal-value btor647))
             (list)))
           (btor650
            (signal
             (extract 17 17 (signal-value btor613))
             (signal-state btor613)))
           (btor651
            (signal
             (concat (signal-value btor650) (signal-value btor649))
             (list)))
           (btor652
            (signal
             (extract 17 17 (signal-value btor613))
             (signal-state btor613)))
           (btor653
            (signal
             (concat (signal-value btor652) (signal-value btor651))
             (list)))
           (btor654
            (signal
             (extract 17 17 (signal-value btor613))
             (signal-state btor613)))
           (btor655
            (signal
             (concat (signal-value btor654) (signal-value btor653))
             (list)))
           (btor656
            (signal
             (extract 17 17 (signal-value btor613))
             (signal-state btor613)))
           (btor657
            (signal
             (concat (signal-value btor656) (signal-value btor655))
             (list)))
           (btor658
            (signal
             (extract 17 17 (signal-value btor613))
             (signal-state btor613)))
           (btor659
            (signal
             (concat (signal-value btor658) (signal-value btor657))
             (list)))
           (btor660
            (signal
             (extract 17 17 (signal-value btor613))
             (signal-state btor613)))
           (btor661
            (signal
             (concat (signal-value btor660) (signal-value btor659))
             (list)))
           (btor662
            (signal
             (extract 17 17 (signal-value btor613))
             (signal-state btor613)))
           (btor663
            (signal
             (concat (signal-value btor662) (signal-value btor661))
             (list)))
           (btor664
            (signal
             (extract 17 17 (signal-value btor613))
             (signal-state btor613)))
           (btor665
            (signal
             (concat (signal-value btor664) (signal-value btor663))
             (list)))
           (btor666
            (signal
             (extract 17 17 (signal-value btor613))
             (signal-state btor613)))
           (btor667
            (signal
             (concat (signal-value btor666) (signal-value btor665))
             (list)))
           (btor668
            (signal
             (bvmul (signal-value btor611) (signal-value btor667))
             (list)))
           (btor669 (bv->signal (bv 0 (bitvector 45))))
           (btor670
            (if (bitvector->bool (signal-value btor535)) btor669 btor668))
           (btor671
            (signal
             (extract 43 0 (signal-value btor670))
             (signal-state btor670)))
           (btor672 (bv->signal (bv 5864062014805 (bitvector 43))))
           (btor673
            (bv->signal
             (zero-extend (signal-value btor672) (bitvector 44))
             btor672))
           (btor674
            (signal
             (bvand (signal-value btor671) (signal-value btor673))
             (list)))
           (btor675
            (signal
             (concat (signal-value btor97) (signal-value btor674))
             (list)))
           (btor676
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state676")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state676")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state676")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state676")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 45))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor677
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state677")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state677")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state677")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state677")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 45))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor678
            (if (bitvector->bool (signal-value btor104)) btor677 btor676))
           (btor679
            (signal (extract 0 0 (signal-value btor69)) (signal-state btor69)))
           (btor680
            (if (bitvector->bool (signal-value btor679)) btor678 btor675))
           (btor681
            (signal
             (apply bvor (bitvector->bits (signal-value btor181)))
             (signal-state btor181)))
           (btor682 (signal (bvnot (signal-value btor681)) (list)))
           (btor683
            (if (bitvector->bool (signal-value btor682)) btor680 btor462))
           (btor684
            (signal
             (extract 44 44 (signal-value btor683))
             (signal-state btor683)))
           (btor685
            (signal
             (concat (signal-value btor684) (signal-value btor683))
             (list)))
           (btor686
            (signal
             (extract 44 44 (signal-value btor683))
             (signal-state btor683)))
           (btor687
            (signal
             (concat (signal-value btor686) (signal-value btor685))
             (list)))
           (btor688
            (signal
             (extract 44 44 (signal-value btor683))
             (signal-state btor683)))
           (btor689
            (signal
             (concat (signal-value btor688) (signal-value btor687))
             (list)))
           (btor690
            (signal
             (extract 1 0 (signal-value btor355))
             (signal-state btor355)))
           (btor691
            (bv->signal
             (zero-extend (signal-value btor97) (bitvector 2))
             btor97))
           (btor692
            (signal
             (bool->bitvector
              (bveq (signal-value btor690) (signal-value btor691)))
             (list)))
           (btor693
            (if (bitvector->bool (signal-value btor692)) btor689 btor461))
           (btor694
            (signal
             (concat (signal-value btor121) (signal-value btor141))
             (list)))
           (btor695
            (signal
             (bool->bitvector
              (bveq (signal-value btor690) (signal-value btor365)))
             (list)))
           (btor696
            (if (bitvector->bool (signal-value btor695)) btor694 btor371))
           (btor697
            (signal
             (bool->bitvector
              (bveq (signal-value btor690) (signal-value btor103)))
             (list)))
           (btor698
            (signal
             (bvor (signal-value btor697) (signal-value btor695))
             (list)))
           (btor699
            (if (bitvector->bool (signal-value btor698)) btor696 btor693))
           (btor700
            (signal
             (bvxor (signal-value btor457) (signal-value btor699))
             (list)))
           (btor701 (bv->signal (bv 11728124029610 (bitvector 44))))
           (btor702
            (signal
             (bvand (signal-value btor671) (signal-value btor701))
             (list)))
           (btor703
            (signal
             (extract 44 44 (signal-value btor670))
             (signal-state btor670)))
           (btor704 (signal (bvnot (signal-value btor703)) (list)))
           (btor705
            (signal
             (concat (signal-value btor704) (signal-value btor702))
             (list)))
           (btor706
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state706")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state706")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state706")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state706")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 45))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor707
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state707")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state707")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state707")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state707")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 45))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor708
            (if (bitvector->bool (signal-value btor104)) btor707 btor706))
           (btor709
            (if (bitvector->bool (signal-value btor679)) btor708 btor705))
           (btor710
            (if (bitvector->bool (signal-value btor682)) btor709 btor462))
           (btor711
            (signal
             (extract 3 2 (signal-value btor355))
             (signal-state btor355)))
           (btor712
            (bv->signal
             (zero-extend (signal-value btor97) (bitvector 2))
             btor97))
           (btor713
            (signal
             (bool->bitvector
              (bveq (signal-value btor711) (signal-value btor712)))
             (list)))
           (btor714
            (if (bitvector->bool (signal-value btor713)) btor710 btor669))
           (btor715
            (signal
             (concat (signal-value btor495) (signal-value btor714))
             (list)))
           (btor716 (bv->signal (bv 281474976710655 (bitvector 48))))
           (btor717
            (signal
             (bool->bitvector
              (bveq (signal-value btor711) (signal-value btor365)))
             (list)))
           (btor718
            (if (bitvector->bool (signal-value btor717)) btor364 btor716))
           (btor719
            (signal
             (bool->bitvector
              (bveq (signal-value btor711) (signal-value btor103)))
             (list)))
           (btor720
            (signal
             (bvor (signal-value btor719) (signal-value btor717))
             (list)))
           (btor721
            (if (bitvector->bool (signal-value btor720)) btor718 btor715))
           (btor722
            (signal
             (bvxor (signal-value btor700) (signal-value btor721))
             (list)))
           (btor723
            (signal
             (bvand (signal-value btor699) (signal-value btor721))
             (list)))
           (btor724
            (signal
             (bvand (signal-value btor457) (signal-value btor721))
             (list)))
           (btor725
            (signal
             (bvor (signal-value btor723) (signal-value btor724))
             (list)))
           (btor726
            (signal
             (bvand (signal-value btor699) (signal-value btor457))
             (list)))
           (btor727
            (signal
             (bvor (signal-value btor725) (signal-value btor726))
             (list)))
           (btor728
            (signal
             (extract 3 3 (signal-value btor165))
             (signal-state btor165)))
           (btor729
            (if (bitvector->bool (signal-value btor728)) btor727 btor722))
           (btor730
            (signal
             (extract 2 2 (signal-value btor165))
             (signal-state btor165)))
           (btor731
            (if (bitvector->bool (signal-value btor730)) btor315 btor727))
           (btor732
            (signal
             (extract 11 11 (signal-value btor731))
             (signal-state btor731)))
           (btor733
            (signal
             (bvand (signal-value btor732) (signal-value btor183))
             (list)))
           (btor734
            (signal
             (extract 23 23 (signal-value btor731))
             (signal-state btor731)))
           (btor735
            (signal
             (bvand (signal-value btor734) (signal-value btor682))
             (list)))
           (btor736
            (signal
             (extract 35 35 (signal-value btor731))
             (signal-state btor731)))
           (btor737
            (signal
             (bvand (signal-value btor736) (signal-value btor183))
             (list)))
           (btor738
            (signal
             (extract 10 0 (signal-value btor731))
             (signal-state btor731)))
           (btor739
            (signal
             (concat (signal-value btor738) (signal-value btor106))
             (list)))
           (btor740
            (signal
             (concat (signal-value btor733) (signal-value btor739))
             (list)))
           (btor741
            (signal
             (extract 22 12 (signal-value btor731))
             (signal-state btor731)))
           (btor742
            (signal
             (concat (signal-value btor741) (signal-value btor740))
             (list)))
           (btor743
            (signal
             (concat (signal-value btor735) (signal-value btor742))
             (list)))
           (btor744
            (signal
             (extract 34 24 (signal-value btor731))
             (signal-state btor731)))
           (btor745
            (signal
             (concat (signal-value btor744) (signal-value btor743))
             (list)))
           (btor746
            (signal
             (concat (signal-value btor737) (signal-value btor745))
             (list)))
           (btor747
            (signal
             (extract 46 36 (signal-value btor731))
             (signal-state btor731)))
           (btor748
            (signal
             (concat (signal-value btor747) (signal-value btor746))
             (list)))
           (btor749
            (signal
             (bvand (signal-value btor729) (signal-value btor748))
             (list)))
           (btor750
            (signal
             (extract 8 7 (signal-value btor355))
             (signal-state btor355)))
           (btor751
            (bv->signal
             (zero-extend (signal-value btor97) (bitvector 2))
             btor97))
           (btor752
            (signal
             (bool->bitvector
              (bveq (signal-value btor750) (signal-value btor751)))
             (list)))
           (btor753
            (if (bitvector->bool (signal-value btor752)) btor371 btor315))
           (btor754
            (signal
             (bool->bitvector
              (bveq (signal-value btor750) (signal-value btor365)))
             (list)))
           (btor755
            (if (bitvector->bool (signal-value btor754)) btor364 btor77))
           (btor756
            (signal
             (bool->bitvector
              (bveq (signal-value btor750) (signal-value btor103)))
             (list)))
           (btor757
            (signal
             (bvor (signal-value btor756) (signal-value btor754))
             (list)))
           (btor758
            (if (bitvector->bool (signal-value btor757)) btor755 btor753))
           (btor759
            (signal
             (bvand (signal-value btor758) (signal-value btor748))
             (list)))
           (btor760
            (signal
             (bvor (signal-value btor749) (signal-value btor759))
             (list)))
           (btor761
            (signal
             (bvand (signal-value btor729) (signal-value btor758))
             (list)))
           (btor762
            (signal
             (bvor (signal-value btor760) (signal-value btor761))
             (list)))
           (btor763
            (signal
             (extract 35 35 (signal-value btor762))
             (signal-state btor762)))
           (btor764
            (signal
             (bvand (signal-value btor183) (signal-value btor763))
             (list)))
           (btor765
            (signal
             (extract 47 36 (signal-value btor762))
             (signal-state btor762)))
           (btor766
            (signal
             (concat (signal-value btor765) (signal-value btor764))
             (list)))
           (btor767
            (bv->signal
             (zero-extend (signal-value btor766) (bitvector 14))
             btor766))
           (btor768
            (signal
             (bvxor (signal-value btor729) (signal-value btor748))
             (list)))
           (btor769
            (signal
             (bvxor (signal-value btor768) (signal-value btor758))
             (list)))
           (btor770
            (signal
             (extract 47 36 (signal-value btor769))
             (signal-state btor769)))
           (btor771
            (signal
             (extract 47 47 (signal-value btor731))
             (signal-state btor731)))
           (btor772
            (signal
             (concat (signal-value btor771) (signal-value btor770))
             (list)))
           (btor773
            (bv->signal
             (zero-extend (signal-value btor772) (bitvector 14))
             btor772))
           (btor774
            (signal
             (bvadd (signal-value btor767) (signal-value btor773))
             (list)))
           (btor775
            (signal
             (extract 23 23 (signal-value btor762))
             (signal-state btor762)))
           (btor776
            (signal
             (bvand (signal-value btor682) (signal-value btor775))
             (list)))
           (btor777
            (signal
             (extract 34 24 (signal-value btor762))
             (signal-state btor762)))
           (btor778
            (signal
             (concat (signal-value btor777) (signal-value btor776))
             (list)))
           (btor779
            (bv->signal
             (zero-extend (signal-value btor778) (bitvector 13))
             btor778))
           (btor780
            (signal
             (extract 35 24 (signal-value btor769))
             (signal-state btor769)))
           (btor781
            (bv->signal
             (zero-extend (signal-value btor780) (bitvector 13))
             btor780))
           (btor782
            (signal
             (bvadd (signal-value btor779) (signal-value btor781))
             (list)))
           (btor783
            (signal
             (extract 11 11 (signal-value btor762))
             (signal-state btor762)))
           (btor784
            (signal
             (bvand (signal-value btor183) (signal-value btor783))
             (list)))
           (btor785
            (signal
             (extract 22 12 (signal-value btor762))
             (signal-state btor762)))
           (btor786
            (signal
             (concat (signal-value btor785) (signal-value btor784))
             (list)))
           (btor787
            (bv->signal
             (zero-extend (signal-value btor786) (bitvector 13))
             btor786))
           (btor788
            (signal
             (extract 23 12 (signal-value btor769))
             (signal-state btor769)))
           (btor789
            (bv->signal
             (zero-extend (signal-value btor788) (bitvector 13))
             btor788))
           (btor790
            (signal
             (bvadd (signal-value btor787) (signal-value btor789))
             (list)))
           (btor791
            (signal
             (bvxor (signal-value btor27) (signal-value btor53))
             (list)))
           (btor792
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state792")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state792")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state792")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state792")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor793
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state793")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state793")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state793")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state793")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor794
            (if (bitvector->bool (signal-value btor104)) btor793 btor792))
           (btor795
            (signal (extract 0 0 (signal-value btor28)) (signal-state btor28)))
           (btor796
            (if (bitvector->bool (signal-value btor795)) btor794 btor791))
           (btor797 (signal (bvnot (signal-value btor796)) (list)))
           (btor798
            (signal
             (extract 47 47 (signal-value btor74))
             (signal-state btor74)))
           (btor799
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state799")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state799")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state799")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state799")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 3))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor800
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state800")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state800")))))
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
                          (bv 0 3))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor801
            (if (bitvector->bool (signal-value btor104)) btor800 btor799))
           (btor802
            (signal (extract 0 0 (signal-value btor31)) (signal-state btor31)))
           (btor803
            (if (bitvector->bool (signal-value btor802)) btor801 btor30))
           (btor804
            (bv->signal
             (zero-extend (signal-value btor97) (bitvector 3))
             btor97))
           (btor805
            (signal
             (bool->bitvector
              (bveq (signal-value btor803) (signal-value btor804)))
             (list)))
           (btor806
            (if (bitvector->bool (signal-value btor805)) btor798 btor797))
           (btor807 (signal (bvnot (signal-value btor26)) (list)))
           (btor808 (signal (bvnot (signal-value btor798)) (list)))
           (btor809
            (bv->signal
             (zero-extend (signal-value btor365) (bitvector 3))
             btor365))
           (btor810
            (signal
             (bool->bitvector
              (bveq (signal-value btor803) (signal-value btor809)))
             (list)))
           (btor811
            (if (bitvector->bool (signal-value btor810)) btor808 btor807))
           (btor812
            (bv->signal
             (zero-extend (signal-value btor103) (bitvector 3))
             btor103))
           (btor813
            (signal
             (bool->bitvector
              (bveq (signal-value btor803) (signal-value btor812)))
             (list)))
           (btor814
            (signal
             (bvor (signal-value btor813) (signal-value btor810))
             (list)))
           (btor815
            (if (bitvector->bool (signal-value btor814)) btor811 btor806))
           (btor816
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state816")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state816")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state816")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state816")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor817
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state817")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state817")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state817")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state817")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor818
            (if (bitvector->bool (signal-value btor104)) btor817 btor816))
           (btor819
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state819")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state819")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state819")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state819")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 4))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor820
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state820")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state820")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state820")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state820")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 4))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor821
            (if (bitvector->bool (signal-value btor104)) btor820 btor819))
           (btor822
            (signal
             (extract 3 3 (signal-value btor821))
             (signal-state btor821)))
           (btor823
            (signal
             (bvxor (signal-value btor818) (signal-value btor822))
             (list)))
           (btor824 (signal (bvnot (signal-value btor823)) (list)))
           (btor825
            (signal
             (extract 47 47 (signal-value btor371))
             (signal-state btor371)))
           (btor826
            (signal
             (bool->bitvector
              (bveq (signal-value btor803) (signal-value btor407)))
             (list)))
           (btor827
            (if (bitvector->bool (signal-value btor826)) btor825 btor824))
           (btor828
            (signal
             (extract 26 26 (signal-value btor575))
             (signal-state btor575)))
           (btor829
            (signal
             (extract 17 17 (signal-value btor613))
             (signal-state btor613)))
           (btor830
            (signal
             (bvxor (signal-value btor828) (signal-value btor829))
             (list)))
           (btor831 (signal (bvnot (signal-value btor830)) (list)))
           (btor832
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state832")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state832")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state832")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state832")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor833
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state833")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state833")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state833")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state833")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor834
            (if (bitvector->bool (signal-value btor104)) btor833 btor832))
           (btor835
            (if (bitvector->bool (signal-value btor679)) btor834 btor831))
           (btor836 (signal (bvnot (signal-value btor835)) (list)))
           (btor837 (signal (bvnot (signal-value btor825)) (list)))
           (btor838
            (signal
             (bool->bitvector
              (bveq (signal-value btor803) (signal-value btor111)))
             (list)))
           (btor839
            (if (bitvector->bool (signal-value btor838)) btor837 btor836))
           (btor840 (bv->signal (bv 6 (bitvector 3))))
           (btor841
            (signal
             (bool->bitvector
              (bveq (signal-value btor803) (signal-value btor840)))
             (list)))
           (btor842
            (signal
             (bvor (signal-value btor841) (signal-value btor838))
             (list)))
           (btor843
            (if (bitvector->bool (signal-value btor842)) btor839 btor827))
           (btor844
            (signal
             (bool->bitvector
              (bveq (signal-value btor803) (signal-value btor448)))
             (list)))
           (btor845
            (signal
             (concat (signal-value btor826) (signal-value btor842))
             (list)))
           (btor846
            (signal
             (concat (signal-value btor844) (signal-value btor845))
             (list)))
           (btor847
            (signal
             (apply bvor (bitvector->bits (signal-value btor846)))
             (signal-state btor846)))
           (btor848
            (if (bitvector->bool (signal-value btor847)) btor843 btor815))
           (btor849 (signal (bvnot (signal-value btor848)) (list)))
           (btor850
            (signal
             (bvor (signal-value btor728) (signal-value btor730))
             (list)))
           (btor851
            (if (bitvector->bool (signal-value btor850)) btor106 btor849))
           (btor852
            (signal
             (extract 10 0 (signal-value btor762))
             (signal-state btor762)))
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
             (extract 11 0 (signal-value btor769))
             (signal-state btor769)))
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
             (extract 12 12 (signal-value btor857))
             (signal-state btor857)))
           (btor859
            (signal
             (bvand (signal-value btor183) (signal-value btor858))
             (list)))
           (btor860
            (bv->signal
             (zero-extend (signal-value btor859) (bitvector 13))
             btor859))
           (btor861
            (signal
             (bvadd (signal-value btor790) (signal-value btor860))
             (list)))
           (btor862
            (signal
             (extract 12 12 (signal-value btor861))
             (signal-state btor861)))
           (btor863
            (signal
             (bvand (signal-value btor682) (signal-value btor862))
             (list)))
           (btor864
            (bv->signal
             (zero-extend (signal-value btor863) (bitvector 13))
             btor863))
           (btor865
            (signal
             (bvadd (signal-value btor782) (signal-value btor864))
             (list)))
           (btor866
            (signal
             (extract 12 12 (signal-value btor865))
             (signal-state btor865)))
           (btor867
            (signal
             (bvand (signal-value btor183) (signal-value btor866))
             (list)))
           (btor868
            (bv->signal
             (zero-extend (signal-value btor867) (bitvector 14))
             btor867))
           (btor869
            (signal
             (bvadd (signal-value btor774) (signal-value btor868))
             (list)))
           (btor870
            (signal
             (extract 12 12 (signal-value btor869))
             (signal-state btor869)))
           (btor871
            (signal
             (bvxor (signal-value btor168) (signal-value btor870))
             (list)))
           (btor872
            (signal
             (bvxor (signal-value btor168) (signal-value btor871))
             (list)))
           (btor873
            (signal (extract 0 0 (signal-value btor76)) (signal-state btor76)))
           (btor874
            (if (bitvector->bool (signal-value btor873)) btor823 btor872))
           (btor876
            (signal
             (bvxor (signal-value btor783) (signal-value btor858))
             (list)))
           (btor877
            (signal
             (bvxor (signal-value btor876) (signal-value btor732))
             (list)))
           (btor878
            (signal
             (bvxor (signal-value btor168) (signal-value btor877))
             (list)))
           (btor879
            (signal
             (extract 3 0 (signal-value btor355))
             (signal-state btor355)))
           (btor880
            (bv->signal
             (zero-extend (signal-value btor407) (bitvector 4))
             btor407))
           (btor881
            (signal
             (bool->bitvector
              (bveq (signal-value btor879) (signal-value btor880)))
             (list)))
           (btor882
            (signal
             (extract 3 2 (signal-value btor165))
             (signal-state btor165)))
           (btor883
            (signal
             (apply bvor (bitvector->bits (signal-value btor882)))
             (signal-state btor882)))
           (btor884
            (signal
             (bvor (signal-value btor881) (signal-value btor883))
             (list)))
           (btor885
            (if (bitvector->bool (signal-value btor884)) btor106 btor878))
           (btor886
            (bv->signal
             (zero-extend (signal-value btor97) (bitvector 2))
             btor97))
           (btor887
            (signal
             (bool->bitvector
              (bveq (signal-value btor181) (signal-value btor886)))
             (list)))
           (btor888
            (if (bitvector->bool (signal-value btor887)) btor885 btor106))
           (btor889
            (signal
             (bvxor (signal-value btor775) (signal-value btor862))
             (list)))
           (btor890
            (signal
             (bvxor (signal-value btor889) (signal-value btor734))
             (list)))
           (btor891
            (signal
             (bvxor (signal-value btor168) (signal-value btor890))
             (list)))
           (btor892
            (if (bitvector->bool (signal-value btor884)) btor106 btor891))
           (btor893
            (signal
             (apply bvor (bitvector->bits (signal-value btor181)))
             (signal-state btor181)))
           (btor894
            (if (bitvector->bool (signal-value btor893)) btor892 btor106))
           (btor895
            (signal
             (bvxor (signal-value btor763) (signal-value btor866))
             (list)))
           (btor896
            (signal
             (bvxor (signal-value btor895) (signal-value btor736))
             (list)))
           (btor897
            (signal
             (bvxor (signal-value btor168) (signal-value btor896))
             (list)))
           (btor898
            (if (bitvector->bool (signal-value btor884)) btor106 btor897))
           (btor899
            (if (bitvector->bool (signal-value btor887)) btor898 btor106))
           (btor900
            (signal
             (concat (signal-value btor894) (signal-value btor888))
             (list)))
           (btor901
            (signal
             (concat (signal-value btor899) (signal-value btor900))
             (list)))
           (btor902
            (signal
             (concat (signal-value btor871) (signal-value btor901))
             (list)))
           (btor903
            (if (bitvector->bool (signal-value btor873)) btor821 btor902))
           (btor905
            (signal
             (extract 13 13 (signal-value btor869))
             (signal-state btor869)))
           (btor906
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state906")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state906")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state906")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state906")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor907
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state907")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state907")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state907")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state907")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor908
            (if (bitvector->bool (signal-value btor104)) btor907 btor906))
           (btor909
            (if (bitvector->bool (signal-value btor873)) btor908 btor905))
           (btor911 (bv->signal (bv 17 (bitvector 5))))
           (btor912
            (signal
             (bool->bitvector
              (bveq (signal-value btor89) (signal-value btor911)))
             (list)))
           (btor913
            (if (bitvector->bool (signal-value btor912)) btor97 btor106))
           (btor914 (bv->signal (bv 9 (bitvector 4))))
           (btor915
            (bv->signal
             (zero-extend (signal-value btor914) (bitvector 5))
             btor914))
           (btor916
            (signal
             (bool->bitvector
              (bveq (signal-value btor89) (signal-value btor915)))
             (list)))
           (btor917
            (if (bitvector->bool (signal-value btor916)) btor106 btor913))
           (btor918
            (if (bitvector->bool (signal-value btor917)) btor364 btor73))
           (btor919
            (signal
             (extract 1 1 (signal-value btor165))
             (signal-state btor165)))
           (btor920
            (signal
             (extract 1 1 (signal-value btor165))
             (signal-state btor165)))
           (btor921
            (signal
             (concat (signal-value btor920) (signal-value btor919))
             (list)))
           (btor922
            (signal
             (extract 1 1 (signal-value btor165))
             (signal-state btor165)))
           (btor923
            (signal
             (concat (signal-value btor922) (signal-value btor921))
             (list)))
           (btor924
            (signal
             (extract 1 1 (signal-value btor165))
             (signal-state btor165)))
           (btor925
            (signal
             (concat (signal-value btor924) (signal-value btor923))
             (list)))
           (btor926
            (signal
             (extract 1 1 (signal-value btor165))
             (signal-state btor165)))
           (btor927
            (signal
             (concat (signal-value btor926) (signal-value btor925))
             (list)))
           (btor928
            (signal
             (extract 1 1 (signal-value btor165))
             (signal-state btor165)))
           (btor929
            (signal
             (concat (signal-value btor928) (signal-value btor927))
             (list)))
           (btor930
            (signal
             (extract 1 1 (signal-value btor165))
             (signal-state btor165)))
           (btor931
            (signal
             (concat (signal-value btor930) (signal-value btor929))
             (list)))
           (btor932
            (signal
             (extract 1 1 (signal-value btor165))
             (signal-state btor165)))
           (btor933
            (signal
             (concat (signal-value btor932) (signal-value btor931))
             (list)))
           (btor934
            (signal
             (extract 1 1 (signal-value btor165))
             (signal-state btor165)))
           (btor935
            (signal
             (concat (signal-value btor934) (signal-value btor933))
             (list)))
           (btor936
            (signal
             (extract 1 1 (signal-value btor165))
             (signal-state btor165)))
           (btor937
            (signal
             (concat (signal-value btor936) (signal-value btor935))
             (list)))
           (btor938
            (signal
             (extract 1 1 (signal-value btor165))
             (signal-state btor165)))
           (btor939
            (signal
             (concat (signal-value btor938) (signal-value btor937))
             (list)))
           (btor940
            (signal
             (extract 1 1 (signal-value btor165))
             (signal-state btor165)))
           (btor941
            (signal
             (concat (signal-value btor940) (signal-value btor939))
             (list)))
           (btor942
            (signal
             (extract 1 1 (signal-value btor165))
             (signal-state btor165)))
           (btor943
            (signal
             (concat (signal-value btor942) (signal-value btor941))
             (list)))
           (btor944
            (signal
             (extract 1 1 (signal-value btor165))
             (signal-state btor165)))
           (btor945
            (signal
             (concat (signal-value btor944) (signal-value btor943))
             (list)))
           (btor946
            (signal
             (extract 1 1 (signal-value btor165))
             (signal-state btor165)))
           (btor947
            (signal
             (concat (signal-value btor946) (signal-value btor945))
             (list)))
           (btor948
            (signal
             (extract 1 1 (signal-value btor165))
             (signal-state btor165)))
           (btor949
            (signal
             (concat (signal-value btor948) (signal-value btor947))
             (list)))
           (btor950
            (signal
             (extract 1 1 (signal-value btor165))
             (signal-state btor165)))
           (btor951
            (signal
             (concat (signal-value btor950) (signal-value btor949))
             (list)))
           (btor952
            (signal
             (extract 1 1 (signal-value btor165))
             (signal-state btor165)))
           (btor953
            (signal
             (concat (signal-value btor952) (signal-value btor951))
             (list)))
           (btor954
            (signal
             (extract 1 1 (signal-value btor165))
             (signal-state btor165)))
           (btor955
            (signal
             (concat (signal-value btor954) (signal-value btor953))
             (list)))
           (btor956
            (signal
             (extract 1 1 (signal-value btor165))
             (signal-state btor165)))
           (btor957
            (signal
             (concat (signal-value btor956) (signal-value btor955))
             (list)))
           (btor958
            (signal
             (extract 1 1 (signal-value btor165))
             (signal-state btor165)))
           (btor959
            (signal
             (concat (signal-value btor958) (signal-value btor957))
             (list)))
           (btor960
            (signal
             (extract 1 1 (signal-value btor165))
             (signal-state btor165)))
           (btor961
            (signal
             (concat (signal-value btor960) (signal-value btor959))
             (list)))
           (btor962
            (signal
             (extract 1 1 (signal-value btor165))
             (signal-state btor165)))
           (btor963
            (signal
             (concat (signal-value btor962) (signal-value btor961))
             (list)))
           (btor964
            (signal
             (extract 1 1 (signal-value btor165))
             (signal-state btor165)))
           (btor965
            (signal
             (concat (signal-value btor964) (signal-value btor963))
             (list)))
           (btor966
            (signal
             (extract 1 1 (signal-value btor165))
             (signal-state btor165)))
           (btor967
            (signal
             (concat (signal-value btor966) (signal-value btor965))
             (list)))
           (btor968
            (signal
             (extract 1 1 (signal-value btor165))
             (signal-state btor165)))
           (btor969
            (signal
             (concat (signal-value btor968) (signal-value btor967))
             (list)))
           (btor970
            (signal
             (extract 1 1 (signal-value btor165))
             (signal-state btor165)))
           (btor971
            (signal
             (concat (signal-value btor970) (signal-value btor969))
             (list)))
           (btor972
            (signal
             (extract 1 1 (signal-value btor165))
             (signal-state btor165)))
           (btor973
            (signal
             (concat (signal-value btor972) (signal-value btor971))
             (list)))
           (btor974
            (signal
             (extract 1 1 (signal-value btor165))
             (signal-state btor165)))
           (btor975
            (signal
             (concat (signal-value btor974) (signal-value btor973))
             (list)))
           (btor976
            (signal
             (extract 1 1 (signal-value btor165))
             (signal-state btor165)))
           (btor977
            (signal
             (concat (signal-value btor976) (signal-value btor975))
             (list)))
           (btor978
            (signal
             (extract 1 1 (signal-value btor165))
             (signal-state btor165)))
           (btor979
            (signal
             (concat (signal-value btor978) (signal-value btor977))
             (list)))
           (btor980
            (signal
             (extract 1 1 (signal-value btor165))
             (signal-state btor165)))
           (btor981
            (signal
             (concat (signal-value btor980) (signal-value btor979))
             (list)))
           (btor982
            (signal
             (extract 1 1 (signal-value btor165))
             (signal-state btor165)))
           (btor983
            (signal
             (concat (signal-value btor982) (signal-value btor981))
             (list)))
           (btor984
            (signal
             (extract 1 1 (signal-value btor165))
             (signal-state btor165)))
           (btor985
            (signal
             (concat (signal-value btor984) (signal-value btor983))
             (list)))
           (btor986
            (signal
             (extract 1 1 (signal-value btor165))
             (signal-state btor165)))
           (btor987
            (signal
             (concat (signal-value btor986) (signal-value btor985))
             (list)))
           (btor988
            (signal
             (extract 1 1 (signal-value btor165))
             (signal-state btor165)))
           (btor989
            (signal
             (concat (signal-value btor988) (signal-value btor987))
             (list)))
           (btor990
            (signal
             (extract 1 1 (signal-value btor165))
             (signal-state btor165)))
           (btor991
            (signal
             (concat (signal-value btor990) (signal-value btor989))
             (list)))
           (btor992
            (signal
             (extract 1 1 (signal-value btor165))
             (signal-state btor165)))
           (btor993
            (signal
             (concat (signal-value btor992) (signal-value btor991))
             (list)))
           (btor994
            (signal
             (extract 1 1 (signal-value btor165))
             (signal-state btor165)))
           (btor995
            (signal
             (concat (signal-value btor994) (signal-value btor993))
             (list)))
           (btor996
            (signal
             (extract 1 1 (signal-value btor165))
             (signal-state btor165)))
           (btor997
            (signal
             (concat (signal-value btor996) (signal-value btor995))
             (list)))
           (btor998
            (signal
             (extract 1 1 (signal-value btor165))
             (signal-state btor165)))
           (btor999
            (signal
             (concat (signal-value btor998) (signal-value btor997))
             (list)))
           (btor1000
            (signal
             (extract 1 1 (signal-value btor165))
             (signal-state btor165)))
           (btor1001
            (signal
             (concat (signal-value btor1000) (signal-value btor999))
             (list)))
           (btor1002
            (signal
             (extract 1 1 (signal-value btor165))
             (signal-state btor165)))
           (btor1003
            (signal
             (concat (signal-value btor1002) (signal-value btor1001))
             (list)))
           (btor1004
            (signal
             (extract 1 1 (signal-value btor165))
             (signal-state btor165)))
           (btor1005
            (signal
             (concat (signal-value btor1004) (signal-value btor1003))
             (list)))
           (btor1006
            (signal
             (extract 1 1 (signal-value btor165))
             (signal-state btor165)))
           (btor1007
            (signal
             (concat (signal-value btor1006) (signal-value btor1005))
             (list)))
           (btor1008
            (signal
             (extract 1 1 (signal-value btor165))
             (signal-state btor165)))
           (btor1009
            (signal
             (concat (signal-value btor1008) (signal-value btor1007))
             (list)))
           (btor1010
            (signal
             (extract 1 1 (signal-value btor165))
             (signal-state btor165)))
           (btor1011
            (signal
             (concat (signal-value btor1010) (signal-value btor1009))
             (list)))
           (btor1012
            (signal
             (extract 1 1 (signal-value btor165))
             (signal-state btor165)))
           (btor1013
            (signal
             (concat (signal-value btor1012) (signal-value btor1011))
             (list)))
           (btor1014
            (signal
             (extract 11 0 (signal-value btor857))
             (signal-state btor857)))
           (btor1015
            (signal
             (extract 11 0 (signal-value btor861))
             (signal-state btor861)))
           (btor1016
            (signal
             (concat (signal-value btor1015) (signal-value btor1014))
             (list)))
           (btor1017
            (signal
             (extract 11 0 (signal-value btor865))
             (signal-state btor865)))
           (btor1018
            (signal
             (concat (signal-value btor1017) (signal-value btor1016))
             (list)))
           (btor1019
            (signal
             (extract 11 0 (signal-value btor869))
             (signal-state btor869)))
           (btor1020
            (signal
             (concat (signal-value btor1019) (signal-value btor1018))
             (list)))
           (btor1021
            (signal
             (bvxor (signal-value btor1013) (signal-value btor1020))
             (list)))
           (btor1022
            (signal
             (bvxor (signal-value btor918) (signal-value btor1021))
             (list)))
           (btor1023 (signal (bvnot (signal-value btor1022)) (list)))
           (btor1024
            (signal
             (extract 45 0 (signal-value btor364))
             (signal-state btor364)))
           (btor1025 (signal (bvnot (signal-value btor1024)) (list)))
           (btor1026
            (signal
             (concat (signal-value btor1025) (signal-value btor170))
             (list)))
           (btor1027 (bv->signal (bv 23 (bitvector 5))))
           (btor1028
            (signal
             (bool->bitvector
              (bveq (signal-value btor88) (signal-value btor1027)))
             (list)))
           (btor1029
            (if (bitvector->bool (signal-value btor1028)) btor365 btor170))
           (btor1030 (bv->signal (bv 22 (bitvector 5))))
           (btor1031
            (signal
             (bool->bitvector
              (bveq (signal-value btor88) (signal-value btor1030)))
             (list)))
           (btor1032
            (if (bitvector->bool (signal-value btor1031)) btor103 btor1029))
           (btor1033
            (signal
             (bool->bitvector
              (bveq (signal-value btor88) (signal-value btor911)))
             (list)))
           (btor1034
            (if (bitvector->bool (signal-value btor1033)) btor174 btor1032))
           (btor1035 (bv->signal (bv 8 (bitvector 4))))
           (btor1036
            (bv->signal
             (zero-extend (signal-value btor1035) (bitvector 5))
             btor1035))
           (btor1037
            (signal
             (bool->bitvector
              (bveq (signal-value btor88) (signal-value btor1036)))
             (list)))
           (btor1038
            (if (bitvector->bool (signal-value btor1037)) btor170 btor1034))
           (btor1039
            (signal
             (bool->bitvector
              (bveq (signal-value btor1038) (signal-value btor365)))
             (list)))
           (btor1040
            (if (bitvector->bool (signal-value btor1039)) btor1026 btor68))
           (btor1041
            (signal
             (extract 46 0 (signal-value btor364))
             (signal-state btor364)))
           (btor1042 (signal (bvnot (signal-value btor1041)) (list)))
           (btor1043
            (signal
             (concat (signal-value btor1042) (signal-value btor106))
             (list)))
           (btor1044
            (signal
             (bool->bitvector
              (bveq (signal-value btor1038) (signal-value btor103)))
             (list)))
           (btor1045
            (if (bitvector->bool (signal-value btor1044)) btor1043 btor1040))
           (btor1046
            (bv->signal
             (zero-extend (signal-value btor97) (bitvector 2))
             btor97))
           (btor1047
            (signal
             (bool->bitvector
              (bveq (signal-value btor1038) (signal-value btor1046)))
             (list)))
           (btor1048
            (if (bitvector->bool (signal-value btor1047)) btor364 btor1045))
           (btor1049 (bv->signal (bv 21 (bitvector 5))))
           (btor1050
            (signal
             (bool->bitvector
              (bveq (signal-value btor91) (signal-value btor1049)))
             (list)))
           (btor1051
            (if (bitvector->bool (signal-value btor1050)) btor97 btor106))
           (btor1052 (bv->signal (bv 11 (bitvector 4))))
           (btor1053
            (bv->signal
             (zero-extend (signal-value btor1052) (bitvector 5))
             btor1052))
           (btor1054
            (signal
             (bool->bitvector
              (bveq (signal-value btor91) (signal-value btor1053)))
             (list)))
           (btor1055
            (if (bitvector->bool (signal-value btor1054)) btor106 btor1051))
           (btor1056
            (if (bitvector->bool (signal-value btor1055)) btor1048 btor716))
           (btor1057
            (signal
             (bvor (signal-value btor1023) (signal-value btor1056))
             (list)))
           (btor1058
            (signal
             (apply bvand (bitvector->bits (signal-value btor1057)))
             (signal-state btor1057)))
           (btor1059
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1059")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1059")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1059")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1059")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1060
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1060")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1060")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1060")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1060")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1061
            (if (bitvector->bool (signal-value btor104)) btor1060 btor1059))
           (btor1062
            (if (bitvector->bool (signal-value btor873)) btor1061 btor1058))
           (btor1063 (signal (bvnot (signal-value btor1062)) (list)))
           (btor1064
            (signal
             (bvor (signal-value btor1022) (signal-value btor1056))
             (list)))
           (btor1065
            (signal
             (apply bvand (bitvector->bits (signal-value btor1064)))
             (signal-state btor1064)))
           (btor1066
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1066")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1066")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1066")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1066")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1067
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1067")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1067")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1067")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1067")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1068
            (if (bitvector->bool (signal-value btor104)) btor1067 btor1066))
           (btor1069
            (if (bitvector->bool (signal-value btor873)) btor1068 btor1065))
           (btor1070 (signal (bvnot (signal-value btor1069)) (list)))
           (btor1071
            (signal
             (bvand (signal-value btor1063) (signal-value btor1070))
             (list)))
           (btor1072
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1072")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1072")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1072")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1072")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1073
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1073")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1073")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1073")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1073")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1074
            (if (bitvector->bool (signal-value btor104)) btor1073 btor1072))
           (btor1075
            (if (bitvector->bool (signal-value btor873)) btor1074 btor1058))
           (btor1076
            (signal
             (bvand (signal-value btor1071) (signal-value btor1075))
             (list)))
           (btor1077
            (if (bitvector->bool (signal-value btor1055)) btor1076 btor106))
           (btor1079
            (if (bitvector->bool (signal-value btor873)) btor371 btor1021))
           (btor1084
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1084")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1084")))))
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
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1085
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1085")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1085")))))
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
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1086
            (if (bitvector->bool (signal-value btor104)) btor1085 btor1084))
           (btor1087
            (if (bitvector->bool (signal-value btor873)) btor1086 btor1065))
           (btor1088
            (signal
             (bvand (signal-value btor1071) (signal-value btor1087))
             (list)))
           (btor1089
            (if (bitvector->bool (signal-value btor1055)) btor1088 btor106))
           (btor1091
            (signal
             (extract 5 0 (signal-value btor722))
             (signal-state btor722)))
           (btor1092
            (signal
             (apply bvxor (bitvector->bits (signal-value btor1091)))
             (signal-state btor1091)))
           (btor1093 (bv->signal (bv 24 (bitvector 5))))
           (btor1094
            (signal
             (bool->bitvector
              (bveq (signal-value btor93) (signal-value btor1093)))
             (list)))
           (btor1095
            (if (bitvector->bool (signal-value btor1094)) btor97 btor106))
           (btor1096 (bv->signal (bv 13 (bitvector 4))))
           (btor1097
            (bv->signal
             (zero-extend (signal-value btor1096) (bitvector 5))
             btor1096))
           (btor1098
            (signal
             (bool->bitvector
              (bveq (signal-value btor93) (signal-value btor1097)))
             (list)))
           (btor1099
            (if (bitvector->bool (signal-value btor1098)) btor106 btor1095))
           (btor1100
            (if (bitvector->bool (signal-value btor1099)) btor1092 btor106))
           (btor1101
            (signal
             (extract 11 6 (signal-value btor722))
             (signal-state btor722)))
           (btor1102
            (signal
             (apply bvxor (bitvector->bits (signal-value btor1101)))
             (signal-state btor1101)))
           (btor1103
            (if (bitvector->bool (signal-value btor1099)) btor1102 btor106))
           (btor1104
            (signal
             (bvxor (signal-value btor1100) (signal-value btor1103))
             (list)))
           (btor1105 (bv->signal (bv 26 (bitvector 5))))
           (btor1106
            (signal
             (bool->bitvector
              (bveq (signal-value btor94) (signal-value btor1105)))
             (list)))
           (btor1107
            (if (bitvector->bool (signal-value btor1106)) btor97 btor106))
           (btor1108 (bv->signal (bv 14 (bitvector 4))))
           (btor1109
            (bv->signal
             (zero-extend (signal-value btor1108) (bitvector 5))
             btor1108))
           (btor1110
            (signal
             (bool->bitvector
              (bveq (signal-value btor94) (signal-value btor1109)))
             (list)))
           (btor1111
            (if (bitvector->bool (signal-value btor1110)) btor106 btor1107))
           (btor1112
            (if (bitvector->bool (signal-value btor1111)) btor1100 btor1104))
           (btor1113
            (signal
             (extract 17 12 (signal-value btor722))
             (signal-state btor722)))
           (btor1114
            (signal
             (apply bvxor (bitvector->bits (signal-value btor1113)))
             (signal-state btor1113)))
           (btor1115
            (if (bitvector->bool (signal-value btor1099)) btor1114 btor106))
           (btor1116
            (signal
             (extract 23 18 (signal-value btor722))
             (signal-state btor722)))
           (btor1117
            (signal
             (apply bvxor (bitvector->bits (signal-value btor1116)))
             (signal-state btor1116)))
           (btor1118
            (if (bitvector->bool (signal-value btor1099)) btor1117 btor106))
           (btor1119
            (signal
             (bvxor (signal-value btor1115) (signal-value btor1118))
             (list)))
           (btor1120
            (signal
             (bvxor (signal-value btor1104) (signal-value btor1119))
             (list)))
           (btor1121
            (if (bitvector->bool (signal-value btor1111)) btor1103 btor1120))
           (btor1122
            (if (bitvector->bool (signal-value btor1111)) btor1115 btor1119))
           (btor1123
            (signal
             (extract 29 24 (signal-value btor722))
             (signal-state btor722)))
           (btor1124
            (signal
             (apply bvxor (bitvector->bits (signal-value btor1123)))
             (signal-state btor1123)))
           (btor1125
            (if (bitvector->bool (signal-value btor1099)) btor1124 btor106))
           (btor1126
            (signal
             (extract 35 30 (signal-value btor722))
             (signal-state btor722)))
           (btor1127
            (signal
             (apply bvxor (bitvector->bits (signal-value btor1126)))
             (signal-state btor1126)))
           (btor1128
            (if (bitvector->bool (signal-value btor1099)) btor1127 btor106))
           (btor1129
            (signal
             (bvxor (signal-value btor1125) (signal-value btor1128))
             (list)))
           (btor1130
            (signal
             (extract 41 36 (signal-value btor722))
             (signal-state btor722)))
           (btor1131
            (signal
             (apply bvxor (bitvector->bits (signal-value btor1130)))
             (signal-state btor1130)))
           (btor1132
            (if (bitvector->bool (signal-value btor1099)) btor1131 btor106))
           (btor1133
            (signal
             (extract 47 42 (signal-value btor722))
             (signal-state btor722)))
           (btor1134
            (signal
             (apply bvxor (bitvector->bits (signal-value btor1133)))
             (signal-state btor1133)))
           (btor1135
            (if (bitvector->bool (signal-value btor1099)) btor1134 btor106))
           (btor1136
            (signal
             (bvxor (signal-value btor1132) (signal-value btor1135))
             (list)))
           (btor1137
            (signal
             (bvxor (signal-value btor1129) (signal-value btor1136))
             (list)))
           (btor1138
            (signal
             (bvxor (signal-value btor1120) (signal-value btor1137))
             (list)))
           (btor1139
            (if (bitvector->bool (signal-value btor1111)) btor1118 btor1138))
           (btor1140
            (if (bitvector->bool (signal-value btor1111)) btor1125 btor1129))
           (btor1141
            (if (bitvector->bool (signal-value btor1111)) btor1128 btor1137))
           (btor1142
            (if (bitvector->bool (signal-value btor1111)) btor1132 btor1136))
           (btor1143
            (signal
             (concat (signal-value btor1121) (signal-value btor1112))
             (list)))
           (btor1144
            (signal
             (concat (signal-value btor1122) (signal-value btor1143))
             (list)))
           (btor1145
            (signal
             (concat (signal-value btor1139) (signal-value btor1144))
             (list)))
           (btor1146
            (signal
             (concat (signal-value btor1140) (signal-value btor1145))
             (list)))
           (btor1147
            (signal
             (concat (signal-value btor1141) (signal-value btor1146))
             (list)))
           (btor1148
            (signal
             (concat (signal-value btor1142) (signal-value btor1147))
             (list)))
           (btor1149
            (signal
             (concat (signal-value btor1135) (signal-value btor1148))
             (list)))
           (btor1150
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1150")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1150")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1150")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1150")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 8))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1151
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1151")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1151")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1151")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1151")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 8))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1152
            (if (bitvector->bool (signal-value btor104)) btor1151 btor1150))
           (btor1153
            (if (bitvector->bool (signal-value btor873)) btor1152 btor1149))
           (btor1155
            (bv->signal
             (zero-extend (signal-value btor105) (bitvector 30))
             btor105))
           (btor1156
            (bv->signal
             (zero-extend (signal-value btor503) (bitvector 27))
             btor503))
           (btor1157
            (bv->signal
             (zero-extend (signal-value btor118) (bitvector 30))
             btor118))
           (btor1158
            (bv->signal
             (zero-extend (signal-value btor122) (bitvector 2))
             btor122))
           (btor1159
            (bv->signal
             (zero-extend (signal-value btor4) (bitvector 32))
             btor4))
           (btor1160
            (bv->signal
             (zero-extend (signal-value btor5) (bitvector 30))
             btor5))
           (btor1161
            (bv->signal
             (zero-extend (signal-value btor572) (bitvector 1))
             btor572))
           (btor1162
            (bv->signal
             (zero-extend (signal-value btor573) (bitvector 1))
             btor573))
           (btor1163
            (bv->signal
             (zero-extend (signal-value btor6) (bitvector 32))
             btor6))
           (btor1164
            (bv->signal
             (zero-extend (signal-value btor574) (bitvector 27))
             btor574))
           (btor1165
            (bv->signal
             (zero-extend (signal-value btor571) (bitvector 27))
             btor571))
           (btor1166
            (bv->signal
             (zero-extend (signal-value btor568) (bitvector 27))
             btor568))
           (btor1167
            (bv->signal
             (zero-extend (signal-value btor168) (bitvector 1))
             btor168))
           (btor1168
            (bv->signal
             (zero-extend (signal-value btor818) (bitvector 1))
             btor818))
           (btor1169
            (bv->signal
             (zero-extend (signal-value btor164) (bitvector 1))
             btor164))
           (btor1170
            (bv->signal
             (zero-extend (signal-value btor9) (bitvector 32))
             btor9))
           (btor1171
            (bv->signal
             (zero-extend (signal-value btor165) (bitvector 4))
             btor165))
           (btor1172
            (bv->signal
             (zero-extend (signal-value btor160) (bitvector 4))
             btor160))
           (btor1173
            (bv->signal
             (zero-extend (signal-value btor163) (bitvector 4))
             btor163))
           (btor1174
            (bv->signal
             (zero-extend (signal-value btor1021) (bitvector 48))
             btor1021))
           (btor1175
            (bv->signal
             (zero-extend (signal-value btor371) (bitvector 48))
             btor371))
           (btor1176
            (bv->signal
             (zero-extend (signal-value btor828) (bitvector 1))
             btor828))
           (btor1177
            (bv->signal
             (zero-extend (signal-value btor515) (bitvector 1))
             btor515))
           (btor1178
            (bv->signal
             (zero-extend (signal-value btor512) (bitvector 16))
             btor512))
           (btor1179
            (bv->signal
             (zero-extend (signal-value btor119) (bitvector 2))
             btor119))
           (btor1180
            (bv->signal
             (zero-extend (signal-value btor12) (bitvector 32))
             btor12))
           (btor1181
            (bv->signal
             (zero-extend (signal-value btor407) (bitvector 5))
             btor407))
           (btor1182
            (signal
             (bool->bitvector
              (bveq (signal-value btor13) (signal-value btor1181)))
             (list)))
           (btor1183
            (if (bitvector->bool (signal-value btor1182)) btor103 btor170))
           (btor1184
            (bv->signal
             (zero-extend (signal-value btor448) (bitvector 5))
             btor448))
           (btor1185
            (signal
             (bool->bitvector
              (bveq (signal-value btor13) (signal-value btor1184)))
             (list)))
           (btor1186
            (if (bitvector->bool (signal-value btor1185)) btor174 btor1183))
           (btor1187
            (bv->signal
             (zero-extend (signal-value btor365) (bitvector 5))
             btor365))
           (btor1188
            (signal
             (bool->bitvector
              (bveq (signal-value btor13) (signal-value btor1187)))
             (list)))
           (btor1189
            (if (bitvector->bool (signal-value btor1188)) btor170 btor1186))
           (btor1190
            (bv->signal
             (zero-extend (signal-value btor1189) (bitvector 2))
             btor1189))
           (btor1191 (bitvector 120))
           (btor1192 (bitvector 115))
           (btor1193 (bv->signal (bv 0 (bitvector 115))))
           (btor1194
            (signal
             (concat (signal-value btor1193) (signal-value btor13))
             (list)))
           (btor1195
            (bv->signal
             (zero-extend (signal-value btor1194) (bitvector 120))
             btor1194))
           (btor1196 (bv->signal (bv 16 (bitvector 5))))
           (btor1197
            (signal
             (bool->bitvector
              (bveq (signal-value btor14) (signal-value btor1196)))
             (list)))
           (btor1198
            (if (bitvector->bool (signal-value btor1197)) btor97 btor106))
           (btor1199
            (bv->signal
             (zero-extend (signal-value btor840) (bitvector 5))
             btor840))
           (btor1200
            (signal
             (bool->bitvector
              (bveq (signal-value btor14) (signal-value btor1199)))
             (list)))
           (btor1201
            (if (bitvector->bool (signal-value btor1200)) btor106 btor1198))
           (btor1202
            (bv->signal
             (zero-extend (signal-value btor1201) (bitvector 1))
             btor1201))
           (btor1203 (bv->signal (bv 0 (bitvector 35))))
           (btor1204
            (signal
             (concat (signal-value btor1203) (signal-value btor14))
             (list)))
           (btor1205
            (bv->signal
             (zero-extend (signal-value btor1204) (bitvector 40))
             btor1204))
           (btor1206
            (bv->signal
             (zero-extend (signal-value btor121) (bitvector 30))
             btor121))
           (btor1207
            (bv->signal
             (zero-extend (signal-value btor114) (bitvector 1))
             btor114))
           (btor1208 (bitvector 56))
           (btor1209 (bitvector 51))
           (btor1210 (bv->signal (bv 0 (bitvector 51))))
           (btor1211
            (signal
             (concat (signal-value btor1210) (signal-value btor15))
             (list)))
           (btor1212
            (bv->signal
             (zero-extend (signal-value btor1211) (bitvector 56))
             btor1211))
           (btor1213
            (bv->signal
             (zero-extend (signal-value btor2) (bitvector 30))
             btor2))
           (btor1214
            (bv->signal
             (zero-extend (signal-value btor128) (bitvector 18))
             btor128))
           (btor1215
            (bv->signal
             (zero-extend (signal-value btor545) (bitvector 18))
             btor545))
           (btor1216
            (bv->signal
             (zero-extend (signal-value btor141) (bitvector 18))
             btor141))
           (btor1217
            (bv->signal
             (zero-extend (signal-value btor138) (bitvector 18))
             btor138))
           (btor1218
            (bv->signal
             (zero-extend (signal-value btor142) (bitvector 2))
             btor142))
           (btor1219
            (bv->signal
             (zero-extend (signal-value btor18) (bitvector 32))
             btor18))
           (btor1220
            (bv->signal
             (zero-extend (signal-value btor19) (bitvector 18))
             btor19))
           (btor1221
            (bv->signal
             (zero-extend (signal-value btor829) (bitvector 1))
             btor829))
           (btor1222
            (bv->signal
             (zero-extend (signal-value btor522) (bitvector 1))
             btor522))
           (btor1223
            (signal
             (concat (signal-value btor511) (signal-value btor20))
             (list)))
           (btor1224
            (bv->signal
             (zero-extend (signal-value btor1223) (bitvector 16))
             btor1223))
           (btor1225
            (bv->signal
             (zero-extend (signal-value btor139) (bitvector 2))
             btor139))
           (btor1226
            (bv->signal
             (zero-extend (signal-value btor21) (bitvector 32))
             btor21))
           (btor1227
            (bv->signal
             (zero-extend (signal-value btor141) (bitvector 18))
             btor141))
           (btor1228
            (bv->signal
             (zero-extend (signal-value btor134) (bitvector 1))
             btor134))
           (btor1229
            (signal
             (concat (signal-value btor1210) (signal-value btor22))
             (list)))
           (btor1230
            (bv->signal
             (zero-extend (signal-value btor1229) (bitvector 56))
             btor1229))
           (btor1231
            (bv->signal
             (zero-extend (signal-value btor17) (bitvector 18))
             btor17))
           (btor1232
            (bv->signal
             (zero-extend (signal-value btor26) (bitvector 1))
             btor26))
           (btor1233
            (bv->signal
             (zero-extend (signal-value btor795) (bitvector 1))
             btor795))
           (btor1234
            (bv->signal
             (zero-extend (signal-value btor28) (bitvector 32))
             btor28))
           (btor1235
            (bv->signal
             (zero-extend (signal-value btor802) (bitvector 1))
             btor802))
           (btor1236
            (bv->signal
             (zero-extend (signal-value btor31) (bitvector 32))
             btor31))
           (btor1237
            (bv->signal
             (zero-extend (signal-value btor30) (bitvector 3))
             btor30))
           (btor1238
            (bv->signal
             (zero-extend (signal-value btor803) (bitvector 3))
             btor803))
           (btor1239
            (bv->signal
             (zero-extend (signal-value btor801) (bitvector 3))
             btor801))
           (btor1240
            (bv->signal
             (zero-extend (signal-value btor791) (bitvector 1))
             btor791))
           (btor1241
            (bv->signal
             (zero-extend (signal-value btor796) (bitvector 1))
             btor796))
           (btor1242
            (bv->signal
             (zero-extend (signal-value btor794) (bitvector 1))
             btor794))
           (btor1243
            (bv->signal
             (zero-extend (signal-value btor823) (bitvector 1))
             btor823))
           (btor1244
            (bv->signal
             (zero-extend (signal-value btor32) (bitvector 1))
             btor32))
           (btor1245
            (bv->signal
             (zero-extend (signal-value btor33) (bitvector 1))
             btor33))
           (btor1246
            (bv->signal
             (zero-extend (signal-value btor34) (bitvector 1))
             btor34))
           (btor1247
            (bv->signal
             (zero-extend (signal-value btor35) (bitvector 1))
             btor35))
           (btor1248
            (bv->signal
             (zero-extend (signal-value btor36) (bitvector 1))
             btor36))
           (btor1249
            (bv->signal
             (zero-extend (signal-value btor37) (bitvector 1))
             btor37))
           (btor1250
            (bv->signal
             (zero-extend (signal-value btor39) (bitvector 1))
             btor39))
           (btor1251
            (bv->signal
             (zero-extend (signal-value btor40) (bitvector 1))
             btor40))
           (btor1252
            (bv->signal
             (zero-extend (signal-value btor38) (bitvector 1))
             btor38))
           (btor1253
            (bv->signal
             (zero-extend (signal-value btor41) (bitvector 1))
             btor41))
           (btor1254
            (bv->signal
             (zero-extend (signal-value btor42) (bitvector 1))
             btor42))
           (btor1255
            (bv->signal
             (zero-extend (signal-value btor43) (bitvector 1))
             btor43))
           (btor1256
            (bv->signal
             (zero-extend (signal-value btor44) (bitvector 1))
             btor44))
           (btor1257
            (bv->signal
             (zero-extend (signal-value btor100) (bitvector 1))
             btor100))
           (btor1258
            (bv->signal
             (zero-extend (signal-value btor902) (bitvector 4))
             btor902))
           (btor1259
            (bv->signal
             (zero-extend (signal-value btor821) (bitvector 4))
             btor821))
           (btor1260
            (bv->signal
             (zero-extend (signal-value btor363) (bitvector 1))
             btor363))
           (btor1261
            (bv->signal
             (zero-extend (signal-value btor46) (bitvector 32))
             btor46))
           (btor1262
            (bv->signal
             (zero-extend (signal-value btor364) (bitvector 48))
             btor364))
           (btor1263
            (bv->signal
             (zero-extend (signal-value btor24) (bitvector 48))
             btor24))
           (btor1264
            (bv->signal
             (zero-extend (signal-value btor362) (bitvector 48))
             btor362))
           (btor1265
            (bv->signal
             (zero-extend (signal-value btor507) (bitvector 1))
             btor507))
           (btor1266
            (bv->signal
             (zero-extend (signal-value btor537) (bitvector 1))
             btor537))
           (btor1267
            (bv->signal
             (zero-extend (signal-value btor49) (bitvector 32))
             btor49))
           (btor1268
            (bv->signal
             (zero-extend (signal-value btor538) (bitvector 27))
             btor538))
           (btor1269
            (bv->signal
             (zero-extend (signal-value btor540) (bitvector 27))
             btor540))
           (btor1270
            (bv->signal
             (zero-extend (signal-value btor506) (bitvector 27))
             btor506))
           (btor1271
            (bv->signal
             (zero-extend (signal-value btor48) (bitvector 27))
             btor48))
           (btor1272
            (bv->signal
             (zero-extend (signal-value btor487) (bitvector 1))
             btor487))
           (btor1273
            (bv->signal
             (zero-extend (signal-value btor51) (bitvector 32))
             btor51))
           (btor1274
            (bv->signal
             (zero-extend (signal-value btor483) (bitvector 5))
             btor483))
           (btor1275
            (bv->signal
             (zero-extend (signal-value btor488) (bitvector 5))
             btor488))
           (btor1276
            (bv->signal
             (zero-extend (signal-value btor486) (bitvector 5))
             btor486))
           (btor1277
            (bv->signal
             (zero-extend (signal-value btor52) (bitvector 4))
             btor52))
           (btor1278
            (bv->signal
             (zero-extend (signal-value btor53) (bitvector 1))
             btor53))
           (btor1279
            (bv->signal
             (zero-extend (signal-value btor54) (bitvector 1))
             btor54))
           (btor1280
            (bv->signal
             (zero-extend (signal-value btor55) (bitvector 5))
             btor55))
           (btor1281
            (bv->signal
             (zero-extend (signal-value btor57) (bitvector 9))
             btor57))
           (btor1282
            (bv->signal
             (zero-extend (signal-value btor58) (bitvector 1))
             btor58))
           (btor1283
            (bv->signal
             (zero-extend (signal-value btor59) (bitvector 1))
             btor59))
           (btor1284
            (bv->signal
             (zero-extend (signal-value btor60) (bitvector 1))
             btor60))
           (btor1285
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 1))
             btor61))
           (btor1286
            (bv->signal
             (zero-extend (signal-value btor62) (bitvector 1))
             btor62))
           (btor1287
            (bv->signal
             (zero-extend (signal-value btor63) (bitvector 1))
             btor63))
           (btor1288
            (bv->signal
             (zero-extend (signal-value btor64) (bitvector 1))
             btor64))
           (btor1289
            (bv->signal
             (zero-extend (signal-value btor65) (bitvector 1))
             btor65))
           (btor1290
            (bv->signal
             (zero-extend (signal-value btor66) (bitvector 1))
             btor66))
           (btor1291
            (bv->signal
             (zero-extend (signal-value btor67) (bitvector 1))
             btor67))
           (btor1292
            (bv->signal
             (zero-extend (signal-value btor68) (bitvector 48))
             btor68))
           (btor1293
            (bv->signal
             (zero-extend (signal-value btor679) (bitvector 1))
             btor679))
           (btor1294
            (bv->signal
             (zero-extend (signal-value btor69) (bitvector 32))
             btor69))
           (btor1295
            (bv->signal
             (zero-extend (signal-value btor70) (bitvector 1))
             btor70))
           (btor1296
            (bv->signal
             (zero-extend (signal-value btor905) (bitvector 1))
             btor905))
           (btor1297
            (bv->signal
             (zero-extend (signal-value btor908) (bitvector 1))
             btor908))
           (btor1298
            (bv->signal
             (zero-extend (signal-value btor354) (bitvector 1))
             btor354))
           (btor1299
            (bv->signal
             (zero-extend (signal-value btor72) (bitvector 32))
             btor72))
           (btor1300
            (bv->signal
             (zero-extend (signal-value btor350) (bitvector 9))
             btor350))
           (btor1301
            (bv->signal
             (zero-extend (signal-value btor355) (bitvector 9))
             btor355))
           (btor1302
            (bv->signal
             (zero-extend (signal-value btor353) (bitvector 9))
             btor353))
           (btor1303
            (bv->signal
             (zero-extend (signal-value btor73) (bitvector 48))
             btor73))
           (btor1304
            (bv->signal
             (zero-extend (signal-value btor74) (bitvector 48))
             btor74))
           (btor1305
            (bv->signal
             (zero-extend (signal-value btor499) (bitvector 1))
             btor499))
           (btor1306
            (bv->signal
             (zero-extend (signal-value btor496) (bitvector 8))
             btor496))
           (btor1307
            (bv->signal
             (zero-extend (signal-value btor564) (bitvector 27))
             btor564))
           (btor1308
            (bv->signal
             (zero-extend (signal-value btor873) (bitvector 1))
             btor873))
           (btor1309
            (bv->signal
             (zero-extend (signal-value btor76) (bitvector 32))
             btor76))
           (btor1310
            (bv->signal
             (zero-extend (signal-value btor825) (bitvector 1))
             btor825))
           (btor1311
            (bv->signal
             (zero-extend (signal-value btor371) (bitvector 48))
             btor371))
           (btor1312
            (bv->signal
             (zero-extend (signal-value btor77) (bitvector 48))
             btor77))
           (btor1313
            (signal
             (bvxor (signal-value btor79) (signal-value btor58))
             (list)))
           (btor1314
            (bv->signal
             (zero-extend (signal-value btor1313) (bitvector 1))
             btor1313))
           (btor1315
            (signal
             (bvxor (signal-value btor80) (signal-value btor59))
             (list)))
           (btor1316
            (bv->signal
             (zero-extend (signal-value btor1315) (bitvector 1))
             btor1315))
           (btor1317
            (signal
             (bvxor (signal-value btor78) (signal-value btor60))
             (list)))
           (btor1318
            (bv->signal
             (zero-extend (signal-value btor1317) (bitvector 1))
             btor1317))
           (btor1319
            (signal
             (bvxor (signal-value btor81) (signal-value btor61))
             (list)))
           (btor1320
            (bv->signal
             (zero-extend (signal-value btor1319) (bitvector 1))
             btor1319))
           (btor1321
            (signal
             (bvxor (signal-value btor83) (signal-value btor62))
             (list)))
           (btor1322
            (bv->signal
             (zero-extend (signal-value btor1321) (bitvector 1))
             btor1321))
           (btor1323
            (signal
             (bvxor (signal-value btor82) (signal-value btor63))
             (list)))
           (btor1324
            (bv->signal
             (zero-extend (signal-value btor1323) (bitvector 1))
             btor1323))
           (btor1325
            (signal
             (bvxor (signal-value btor84) (signal-value btor64))
             (list)))
           (btor1326
            (bv->signal
             (zero-extend (signal-value btor1325) (bitvector 1))
             btor1325))
           (btor1327
            (signal
             (bvxor (signal-value btor85) (signal-value btor65))
             (list)))
           (btor1328
            (bv->signal
             (zero-extend (signal-value btor1327) (bitvector 1))
             btor1327))
           (btor1329
            (signal
             (bvxor (signal-value btor86) (signal-value btor66))
             (list)))
           (btor1330
            (bv->signal
             (zero-extend (signal-value btor1329) (bitvector 1))
             btor1329))
           (btor1331
            (signal
             (bvxor (signal-value btor87) (signal-value btor67))
             (list)))
           (btor1332
            (bv->signal
             (zero-extend (signal-value btor1331) (bitvector 1))
             btor1331))
           (btor1333
            (bv->signal
             (zero-extend (signal-value btor1038) (bitvector 2))
             btor1038))
           (btor1334 (bitvector 112))
           (btor1335 (bitvector 107))
           (btor1336 (bv->signal (bv 0 (bitvector 107))))
           (btor1337
            (signal
             (concat (signal-value btor1336) (signal-value btor88))
             (list)))
           (btor1338
            (bv->signal
             (zero-extend (signal-value btor1337) (bitvector 112))
             btor1337))
           (btor1339
            (bv->signal
             (zero-extend (signal-value btor917) (bitvector 1))
             btor917))
           (btor1340
            (signal
             (concat (signal-value btor1210) (signal-value btor89))
             (list)))
           (btor1341
            (bv->signal
             (zero-extend (signal-value btor1340) (bitvector 56))
             btor1340))
           (btor1342
            (bv->signal
             (zero-extend (signal-value btor534) (bitvector 2))
             btor534))
           (btor1343 (bitvector 64))
           (btor1344 (bitvector 59))
           (btor1345 (bv->signal (bv 0 (bitvector 59))))
           (btor1346
            (signal
             (concat (signal-value btor1345) (signal-value btor90))
             (list)))
           (btor1347
            (bv->signal
             (zero-extend (signal-value btor1346) (bitvector 64))
             btor1346))
           (btor1348
            (bv->signal
             (zero-extend (signal-value btor1055) (bitvector 1))
             btor1055))
           (btor1349 (bitvector 72))
           (btor1350 (bitvector 67))
           (btor1351 (bv->signal (bv 0 (bitvector 67))))
           (btor1352
            (signal
             (concat (signal-value btor1351) (signal-value btor91))
             (list)))
           (btor1353
            (bv->signal
             (zero-extend (signal-value btor1352) (bitvector 72))
             btor1352))
           (btor1354
            (bv->signal
             (zero-extend (signal-value btor181) (bitvector 2))
             btor181))
           (btor1355 (bv->signal (bv 0 (bitvector 43))))
           (btor1356
            (signal
             (concat (signal-value btor1355) (signal-value btor92))
             (list)))
           (btor1357
            (bv->signal
             (zero-extend (signal-value btor1356) (bitvector 48))
             btor1356))
           (btor1358
            (bv->signal
             (zero-extend (signal-value btor1099) (bitvector 1))
             btor1099))
           (btor1359
            (signal
             (concat (signal-value btor1203) (signal-value btor93))
             (list)))
           (btor1360
            (bv->signal
             (zero-extend (signal-value btor1359) (bitvector 40))
             btor1359))
           (btor1361
            (bv->signal
             (zero-extend (signal-value btor680) (bitvector 45))
             btor680))
           (btor1362
            (bv->signal
             (zero-extend (signal-value btor683) (bitvector 45))
             btor683))
           (btor1363
            (bv->signal
             (zero-extend (signal-value btor678) (bitvector 45))
             btor678))
           (btor1364
            (bv->signal
             (zero-extend (signal-value btor674) (bitvector 44))
             btor674))
           (btor1365
            (bv->signal
             (zero-extend (signal-value btor709) (bitvector 45))
             btor709))
           (btor1366
            (bv->signal
             (zero-extend (signal-value btor710) (bitvector 45))
             btor710))
           (btor1367
            (bv->signal
             (zero-extend (signal-value btor708) (bitvector 45))
             btor708))
           (btor1368
            (bv->signal
             (zero-extend (signal-value btor705) (bitvector 45))
             btor705))
           (btor1369
            (bv->signal
             (zero-extend (signal-value btor1111) (bitvector 1))
             btor1111))
           (btor1370 (bitvector 88))
           (btor1371 (bitvector 83))
           (btor1372 (bv->signal (bv 0 (bitvector 83))))
           (btor1373
            (signal
             (concat (signal-value btor1372) (signal-value btor94))
             (list)))
           (btor1374
            (bv->signal
             (zero-extend (signal-value btor1373) (bitvector 88))
             btor1373))
           (btor1375
            (bv->signal
             (zero-extend (signal-value btor1149) (bitvector 8))
             btor1149))
           (btor1376
            (bv->signal
             (zero-extend (signal-value btor1152) (bitvector 8))
             btor1152))
           (btor1377 (bitvector 49))
           (btor1378
            (signal
             (concat (signal-value btor762) (signal-value btor851))
             (list)))
           (btor1379
            (bv->signal
             (zero-extend (signal-value btor1378) (bitvector 49))
             btor1378))
           (btor1380
            (bv->signal
             (zero-extend (signal-value btor575) (bitvector 27))
             btor575))
           (btor1381 (signal (bvnot (signal-value btor1201)) (list)))
           (btor1382
            (signal
             (bvor (signal-value btor1381) (signal-value btor44))
             (list)))
           (btor1383
            (bv->signal
             (zero-extend (signal-value btor1382) (bitvector 1))
             btor1382))
           (btor1384
            (bv->signal
             (zero-extend (signal-value btor613) (bitvector 18))
             btor613))
           (btor1385
            (bv->signal
             (zero-extend (signal-value btor831) (bitvector 1))
             btor831))
           (btor1386
            (bv->signal
             (zero-extend (signal-value btor43) (bitvector 1))
             btor43))
           (btor1387
            (bv->signal
             (zero-extend (signal-value btor851) (bitvector 1))
             btor851))
           (btor1388
            (bv->signal
             (zero-extend (signal-value btor848) (bitvector 1))
             btor848))
           (btor1389
            (bv->signal
             (zero-extend (signal-value btor727) (bitvector 48))
             btor727))
           (btor1390
            (bv->signal
             (zero-extend (signal-value btor784) (bitvector 1))
             btor784))
           (btor1391
            (bv->signal
             (zero-extend (signal-value btor776) (bitvector 1))
             btor776))
           (btor1392
            (bv->signal
             (zero-extend (signal-value btor764) (bitvector 1))
             btor764))
           (btor1393
            (bv->signal
             (zero-extend (signal-value btor731) (bitvector 48))
             btor731))
           (btor1394
            (signal
             (extract 10 0 (signal-value btor731))
             (signal-state btor731)))
           (btor1395
            (signal
             (concat (signal-value btor733) (signal-value btor1394))
             (list)))
           (btor1396
            (signal
             (extract 22 12 (signal-value btor731))
             (signal-state btor731)))
           (btor1397
            (signal
             (concat (signal-value btor1396) (signal-value btor1395))
             (list)))
           (btor1398
            (signal
             (concat (signal-value btor735) (signal-value btor1397))
             (list)))
           (btor1399
            (signal
             (extract 34 24 (signal-value btor731))
             (signal-state btor731)))
           (btor1400
            (signal
             (concat (signal-value btor1399) (signal-value btor1398))
             (list)))
           (btor1401
            (signal
             (concat (signal-value btor737) (signal-value btor1400))
             (list)))
           (btor1402
            (signal
             (extract 47 36 (signal-value btor731))
             (signal-state btor731)))
           (btor1403
            (signal
             (concat (signal-value btor1402) (signal-value btor1401))
             (list)))
           (btor1404
            (bv->signal
             (zero-extend (signal-value btor1403) (bitvector 48))
             btor1403))
           (btor1405
            (bv->signal
             (zero-extend (signal-value btor762) (bitvector 48))
             btor762))
           (btor1406
            (bv->signal
             (zero-extend (signal-value btor878) (bitvector 1))
             btor878))
           (btor1407
            (bv->signal
             (zero-extend (signal-value btor891) (bitvector 1))
             btor891))
           (btor1408
            (bv->signal
             (zero-extend (signal-value btor897) (bitvector 1))
             btor897))
           (btor1409
            (bv->signal
             (zero-extend (signal-value btor871) (bitvector 1))
             btor871))
           (btor1410
            (bv->signal
             (zero-extend (signal-value btor905) (bitvector 1))
             btor905))
           (btor1411
            (bv->signal
             (zero-extend (signal-value btor885) (bitvector 1))
             btor885))
           (btor1412
            (bv->signal
             (zero-extend (signal-value btor892) (bitvector 1))
             btor892))
           (btor1413
            (bv->signal
             (zero-extend (signal-value btor898) (bitvector 1))
             btor898))
           (btor1414
            (bv->signal
             (zero-extend (signal-value btor871) (bitvector 1))
             btor871))
           (btor1415
            (if (bitvector->bool (signal-value btor43)) btor831 btor834))
           (btor1416
            (bv->signal
             (zero-extend (signal-value btor1415) (bitvector 1))
             btor1415))
           (btor1417
            (if (bitvector->bool (signal-value btor1313)) btor106 btor1415))
           (btor1418
            (bv->signal
             (zero-extend (signal-value btor1417) (bitvector 1))
             btor1417))
           (btor1419
            (bv->signal
             (zero-extend (signal-value btor106) (bitvector 1))
             btor106))
           (btor1420
            (bv->signal
             (zero-extend (signal-value btor859) (bitvector 1))
             btor859))
           (btor1421
            (bv->signal
             (zero-extend (signal-value btor863) (bitvector 1))
             btor863))
           (btor1422
            (bv->signal
             (zero-extend (signal-value btor867) (bitvector 1))
             btor867))
           (btor1423
            (bv->signal
             (zero-extend (signal-value btor670) (bitvector 45))
             btor670))
           (btor1424
            (bv->signal
             (zero-extend (signal-value btor884) (bitvector 1))
             btor884))
           (btor1425
            (bv->signal
             (zero-extend (signal-value btor835) (bitvector 1))
             btor835))
           (btor1426
            (bv->signal
             (zero-extend (signal-value btor97) (bitvector 1))
             btor97))
           (btor1427
            (bv->signal
             (zero-extend (signal-value btor1075) (bitvector 1))
             btor1075))
           (btor1428
            (bv->signal
             (zero-extend (signal-value btor1058) (bitvector 1))
             btor1058))
           (btor1429
            (bv->signal
             (zero-extend (signal-value btor1062) (bitvector 1))
             btor1062))
           (btor1430
            (bv->signal
             (zero-extend (signal-value btor1061) (bitvector 1))
             btor1061))
           (btor1431
            (bv->signal
             (zero-extend (signal-value btor1074) (bitvector 1))
             btor1074))
           (btor1432
            (bv->signal
             (zero-extend (signal-value btor1065) (bitvector 1))
             btor1065))
           (btor1433
            (bv->signal
             (zero-extend (signal-value btor1069) (bitvector 1))
             btor1069))
           (btor1434
            (bv->signal
             (zero-extend (signal-value btor1068) (bitvector 1))
             btor1068))
           (btor1435
            (bv->signal
             (zero-extend (signal-value btor1086) (bitvector 1))
             btor1086))
           (btor1436 (bv->signal (bv 5864062014805 (bitvector 44))))
           (btor1437
            (bv->signal
             (zero-extend (signal-value btor1436) (bitvector 44))
             btor1436))
           (btor1438
            (bv->signal
             (zero-extend (signal-value btor701) (bitvector 44))
             btor701))
           (btor1439
            (bv->signal
             (zero-extend (signal-value btor834) (bitvector 1))
             btor834))
           (btor1440
            (bv->signal
             (zero-extend (signal-value btor1313) (bitvector 1))
             btor1313))
           (btor1441
            (bv->signal
             (zero-extend (signal-value btor722) (bitvector 48))
             btor722))
           (btor1442
            (bv->signal
             (zero-extend (signal-value btor857) (bitvector 13))
             btor857))
           (btor1443
            (bv->signal
             (zero-extend (signal-value btor861) (bitvector 13))
             btor861))
           (btor1444
            (bv->signal
             (zero-extend (signal-value btor865) (bitvector 13))
             btor865))
           (btor1445
            (bv->signal
             (zero-extend (signal-value btor869) (bitvector 14))
             btor869))
           (btor1446
            (bv->signal
             (zero-extend (signal-value btor729) (bitvector 48))
             btor729))
           (btor1447
            (bv->signal
             (zero-extend (signal-value btor769) (bitvector 48))
             btor769))
           (btor1448
            (signal
             (bvand (signal-value btor1382) (signal-value btor1075))
             (list)))
           (btor1449
            (signal
             (bvand (signal-value btor1448) (signal-value btor1063))
             (list)))
           (btor1450
            (signal
             (bool->bitvector
              (bveq (signal-value btor1189) (signal-value btor103)))
             (list)))
           (btor1451
            (if (bitvector->bool (signal-value btor1450)) btor1449 btor106))
           (btor1452
            (signal
             (bvand (signal-value btor1382) (signal-value btor1062))
             (list)))
           (btor1453
            (bv->signal
             (zero-extend (signal-value btor97) (bitvector 2))
             btor97))
           (btor1454
            (signal
             (bool->bitvector
              (bveq (signal-value btor1189) (signal-value btor1453)))
             (list)))
           (btor1455
            (if (bitvector->bool (signal-value btor1454)) btor1452 btor1451))
           (btor1456
            (bv->signal
             (zero-extend (signal-value btor1455) (bitvector 1))
             btor1455))
           (btor1457
            (bv->signal
             (zero-extend (signal-value btor1056) (bitvector 48))
             btor1056))
           (btor1458
            (bv->signal
             (zero-extend (signal-value btor918) (bitvector 48))
             btor918))
           (btor1459
            (bv->signal
             (zero-extend (signal-value btor1087) (bitvector 1))
             btor1087))
           (btor1460
            (bv->signal
             (zero-extend (signal-value btor758) (bitvector 48))
             btor758))
           (btor1461
            (bv->signal
             (zero-extend (signal-value btor459) (bitvector 2))
             btor459))
           (btor1462
            (bv->signal
             (zero-extend (signal-value btor699) (bitvector 48))
             btor699))
           (btor1463
            (bv->signal
             (zero-extend (signal-value btor1100) (bitvector 1))
             btor1100))
           (btor1464
            (bv->signal
             (zero-extend (signal-value btor1103) (bitvector 1))
             btor1103))
           (btor1465
            (bv->signal
             (zero-extend (signal-value btor1115) (bitvector 1))
             btor1115))
           (btor1466
            (bv->signal
             (zero-extend (signal-value btor1118) (bitvector 1))
             btor1118))
           (btor1467
            (bv->signal
             (zero-extend (signal-value btor1125) (bitvector 1))
             btor1125))
           (btor1468
            (bv->signal
             (zero-extend (signal-value btor1128) (bitvector 1))
             btor1128))
           (btor1469
            (bv->signal
             (zero-extend (signal-value btor1132) (bitvector 1))
             btor1132))
           (btor1470
            (bv->signal
             (zero-extend (signal-value btor1135) (bitvector 1))
             btor1135))
           (btor1471
            (bv->signal
             (zero-extend (signal-value btor1104) (bitvector 1))
             btor1104))
           (btor1472
            (bv->signal
             (zero-extend (signal-value btor1119) (bitvector 1))
             btor1119))
           (btor1473
            (bv->signal
             (zero-extend (signal-value btor1129) (bitvector 1))
             btor1129))
           (btor1474
            (bv->signal
             (zero-extend (signal-value btor1136) (bitvector 1))
             btor1136))
           (btor1475
            (bv->signal
             (zero-extend (signal-value btor1120) (bitvector 1))
             btor1120))
           (btor1476
            (bv->signal
             (zero-extend (signal-value btor1137) (bitvector 1))
             btor1137))
           (btor1477
            (bv->signal
             (zero-extend (signal-value btor1138) (bitvector 1))
             btor1138))
           (btor1478
            (bv->signal
             (zero-extend (signal-value btor721) (bitvector 48))
             btor721))
           (btor1479
            (bv->signal
             (zero-extend (signal-value btor457) (bitvector 48))
             btor457))
           (btor1480
            (bv->signal
             (zero-extend (signal-value btor456) (bitvector 48))
             btor456))
           (btor1482
            (if (bitvector->bool (signal-value btor32)) btor115 btor105))
           (btor1483 (bv->signal (bv 0 (bitvector 30))))
           (btor1484
            (signal
             (apply bvor (bitvector->bits (signal-value btor119)))
             (signal-state btor119)))
           (btor1485 (signal (bvnot (signal-value btor1484)) (list)))
           (btor1486
            (signal
             (bvor (signal-value btor1317) (signal-value btor1485))
             (list)))
           (btor1487
            (if (bitvector->bool (signal-value btor1486)) btor1483 btor1482))
           (btor1491
            (signal
             (bool->bitvector
              (bveq (signal-value btor119) (signal-value btor103)))
             (list)))
           (btor1492
            (if (bitvector->bool (signal-value btor1491)) btor105 btor115))
           (btor1493
            (if (bitvector->bool (signal-value btor33)) btor1492 btor118))
           (btor1494
            (if (bitvector->bool (signal-value btor1486)) btor1483 btor1493))
           (btor1497
            (if (bitvector->bool (signal-value btor36)) btor135 btor128))
           (btor1498
            (signal
             (apply bvor (bitvector->bits (signal-value btor139)))
             (signal-state btor139)))
           (btor1499 (signal (bvnot (signal-value btor1498)) (list)))
           (btor1500
            (signal
             (bvor (signal-value btor1319) (signal-value btor1499))
             (list)))
           (btor1501
            (if (bitvector->bool (signal-value btor1500)) btor543 btor1497))
           (btor1504
            (signal
             (bool->bitvector
              (bveq (signal-value btor139) (signal-value btor103)))
             (list)))
           (btor1505
            (if (bitvector->bool (signal-value btor1504)) btor128 btor135))
           (btor1506
            (if (bitvector->bool (signal-value btor37)) btor1505 btor138))
           (btor1507
            (if (bitvector->bool (signal-value btor1319)) btor543 btor1506))
           (btor1510
            (if (bitvector->bool (signal-value btor35)) btor160 btor163))
           (btor1511 (bv->signal (bv 0 (bitvector 4))))
           (btor1512
            (if (bitvector->bool (signal-value btor1315)) btor1511 btor1510))
           (btor1515
            (if (bitvector->bool (signal-value btor40)) btor350 btor353))
           (btor1516 (bv->signal (bv 0 (bitvector 9))))
           (btor1517
            (if (bitvector->bool (signal-value btor1321)) btor1516 btor1515))
           (btor1520
            (if (bitvector->bool (signal-value btor38)) btor24 btor362))
           (btor1521 (signal (bvnot (signal-value btor363)) (list)))
           (btor1522
            (signal
             (bvor (signal-value btor1323) (signal-value btor1521))
             (list)))
           (btor1523
            (if (bitvector->bool (signal-value btor1522)) btor315 btor1520))
           (btor1526
            (signal
             (bvand (signal-value btor44) (signal-value btor873))
             (list)))
           (btor1527
            (if (bitvector->bool (signal-value btor1526)) btor1021 btor371))
           (btor1528
            (signal
             (bvor (signal-value btor1331) (signal-value btor1455))
             (list)))
           (btor1529
            (if (bitvector->bool (signal-value btor1528)) btor315 btor1527))
           (btor1532
            (if (bitvector->bool (signal-value btor42)) btor483 btor486))
           (btor1533 (bv->signal (bv 0 (bitvector 5))))
           (btor1534 (signal (bvnot (signal-value btor487)) (list)))
           (btor1535
            (signal
             (bvor (signal-value btor1327) (signal-value btor1534))
             (list)))
           (btor1536
            (if (bitvector->bool (signal-value btor1535)) btor1533 btor1532))
           (btor1539
            (if (bitvector->bool (signal-value btor41)) btor48 btor506))
           (btor1540 (signal (bvnot (signal-value btor537)) (list)))
           (btor1541
            (signal
             (bvor (signal-value btor1325) (signal-value btor1540))
             (list)))
           (btor1542
            (if (bitvector->bool (signal-value btor1541)) btor491 btor1539))
           (btor1545
            (if (bitvector->bool (signal-value btor34)) btor568 btor571))
           (btor1546
            (if (bitvector->bool (signal-value btor1325)) btor491 btor1545))
           (btor1549
            (if (bitvector->bool (signal-value btor43)) btor675 btor678))
           (btor1550 (signal (bvnot (signal-value btor679)) (list)))
           (btor1551
            (signal
             (bvor (signal-value btor1329) (signal-value btor1550))
             (list)))
           (btor1552
            (if (bitvector->bool (signal-value btor1551)) btor669 btor1549))
           (btor1555
            (if (bitvector->bool (signal-value btor43)) btor705 btor708))
           (btor1556
            (if (bitvector->bool (signal-value btor1551)) btor669 btor1555))
           (btor1559
            (if (bitvector->bool (signal-value btor39)) btor791 btor794))
           (btor1560
            (if (bitvector->bool (signal-value btor1313)) btor106 btor1559))
           (btor1563
            (if (bitvector->bool (signal-value btor40)) btor30 btor801))
           (btor1564
            (if (bitvector->bool (signal-value btor1321)) btor495 btor1563))
           (btor1567
            (if (bitvector->bool (signal-value btor1526)) btor168 btor818))
           (btor1568
            (if (bitvector->bool (signal-value btor1528)) btor106 btor1567))
           (btor1571
            (if (bitvector->bool (signal-value btor1526)) btor902 btor821))
           (btor1572
            (if (bitvector->bool (signal-value btor1528)) btor1511 btor1571))
           (btor1577
            (if (bitvector->bool (signal-value btor1526)) btor905 btor908))
           (btor1578
            (if (bitvector->bool (signal-value btor1528)) btor106 btor1577))
           (btor1581
            (if (bitvector->bool (signal-value btor1526)) btor1058 btor1061))
           (btor1582
            (if (bitvector->bool (signal-value btor1528)) btor106 btor1581))
           (btor1585
            (if (bitvector->bool (signal-value btor1526)) btor1065 btor1068))
           (btor1586
            (if (bitvector->bool (signal-value btor1528)) btor106 btor1585))
           (btor1589
            (if (bitvector->bool (signal-value btor1526)) btor1061 btor1074))
           (btor1590
            (if (bitvector->bool (signal-value btor1528)) btor106 btor1589))
           (btor1593
            (if (bitvector->bool (signal-value btor1526)) btor1068 btor1086))
           (btor1594
            (if (bitvector->bool (signal-value btor1528)) btor106 btor1593))
           (btor1597
            (if (bitvector->bool (signal-value btor1526)) btor1149 btor1152))
           (btor1598 (bv->signal (bv 0 (bitvector 8))))
           (btor1599
            (if (bitvector->bool (signal-value btor1528)) btor1598 btor1597))
           (output-state
            (remove-duplicates
             (append
              (append
               (list
                (cons
                 (string->symbol (string-append name "state1151"))
                 (signal-value btor1599)))
               (append
                (list
                 (cons
                  (string->symbol (string-append name "state1150"))
                  (signal-value btor1152)))
                (append
                 (list
                  (cons
                   (string->symbol (string-append name "state1085"))
                   (signal-value btor1594)))
                 (append
                  (list
                   (cons
                    (string->symbol (string-append name "state1084"))
                    (signal-value btor1086)))
                  (append
                   (list
                    (cons
                     (string->symbol (string-append name "state1073"))
                     (signal-value btor1590)))
                   (append
                    (list
                     (cons
                      (string->symbol (string-append name "state1072"))
                      (signal-value btor1074)))
                    (append
                     (list
                      (cons
                       (string->symbol (string-append name "state1067"))
                       (signal-value btor1586)))
                     (append
                      (list
                       (cons
                        (string->symbol (string-append name "state1066"))
                        (signal-value btor1068)))
                      (append
                       (list
                        (cons
                         (string->symbol (string-append name "state1060"))
                         (signal-value btor1582)))
                       (append
                        (list
                         (cons
                          (string->symbol (string-append name "state1059"))
                          (signal-value btor1061)))
                        (append
                         (list
                          (cons
                           (string->symbol (string-append name "state907"))
                           (signal-value btor1578)))
                         (append
                          (list
                           (cons
                            (string->symbol (string-append name "state906"))
                            (signal-value btor908)))
                          (append
                           (list
                            (cons
                             (string->symbol (string-append name "state833"))
                             (signal-value btor1417)))
                           (append
                            (list
                             (cons
                              (string->symbol (string-append name "state832"))
                              (signal-value btor834)))
                            (append
                             (list
                              (cons
                               (string->symbol (string-append name "state820"))
                               (signal-value btor1572)))
                             (append
                              (list
                               (cons
                                (string->symbol
                                 (string-append name "state819"))
                                (signal-value btor821)))
                              (append
                               (list
                                (cons
                                 (string->symbol
                                  (string-append name "state817"))
                                 (signal-value btor1568)))
                               (append
                                (list
                                 (cons
                                  (string->symbol
                                   (string-append name "state816"))
                                  (signal-value btor818)))
                                (append
                                 (list
                                  (cons
                                   (string->symbol
                                    (string-append name "state800"))
                                   (signal-value btor1564)))
                                 (append
                                  (list
                                   (cons
                                    (string->symbol
                                     (string-append name "state799"))
                                    (signal-value btor801)))
                                  (append
                                   (list
                                    (cons
                                     (string->symbol
                                      (string-append name "state793"))
                                     (signal-value btor1560)))
                                   (append
                                    (list
                                     (cons
                                      (string->symbol
                                       (string-append name "state792"))
                                      (signal-value btor794)))
                                    (append
                                     (list
                                      (cons
                                       (string->symbol
                                        (string-append name "state707"))
                                       (signal-value btor1556)))
                                     (append
                                      (list
                                       (cons
                                        (string->symbol
                                         (string-append name "state706"))
                                        (signal-value btor708)))
                                      (append
                                       (list
                                        (cons
                                         (string->symbol
                                          (string-append name "state677"))
                                         (signal-value btor1552)))
                                       (append
                                        (list
                                         (cons
                                          (string->symbol
                                           (string-append name "state676"))
                                          (signal-value btor678)))
                                        (append
                                         (list
                                          (cons
                                           (string->symbol
                                            (string-append name "state570"))
                                           (signal-value btor1546)))
                                         (append
                                          (list
                                           (cons
                                            (string->symbol
                                             (string-append name "state569"))
                                            (signal-value btor571)))
                                          (append
                                           (list
                                            (cons
                                             (string->symbol
                                              (string-append name "state505"))
                                             (signal-value btor1542)))
                                           (append
                                            (list
                                             (cons
                                              (string->symbol
                                               (string-append name "state504"))
                                              (signal-value btor506)))
                                            (append
                                             (list
                                              (cons
                                               (string->symbol
                                                (string-append
                                                 name
                                                 "state485"))
                                               (signal-value btor1536)))
                                             (append
                                              (list
                                               (cons
                                                (string->symbol
                                                 (string-append
                                                  name
                                                  "state484"))
                                                (signal-value btor486)))
                                              (append
                                               (list
                                                (cons
                                                 (string->symbol
                                                  (string-append
                                                   name
                                                   "state370"))
                                                 (signal-value btor1529)))
                                               (append
                                                (list
                                                 (cons
                                                  (string->symbol
                                                   (string-append
                                                    name
                                                    "state369"))
                                                  (signal-value btor371)))
                                                (append
                                                 (list
                                                  (cons
                                                   (string->symbol
                                                    (string-append
                                                     name
                                                     "state361"))
                                                   (signal-value btor1523)))
                                                 (append
                                                  (list
                                                   (cons
                                                    (string->symbol
                                                     (string-append
                                                      name
                                                      "state360"))
                                                    (signal-value btor362)))
                                                  (append
                                                   (list
                                                    (cons
                                                     (string->symbol
                                                      (string-append
                                                       name
                                                       "state352"))
                                                     (signal-value btor1517)))
                                                   (append
                                                    (list
                                                     (cons
                                                      (string->symbol
                                                       (string-append
                                                        name
                                                        "state351"))
                                                      (signal-value btor353)))
                                                    (append
                                                     (list
                                                      (cons
                                                       (string->symbol
                                                        (string-append
                                                         name
                                                         "state162"))
                                                       (signal-value
                                                        btor1512)))
                                                     (append
                                                      (list
                                                       (cons
                                                        (string->symbol
                                                         (string-append
                                                          name
                                                          "state161"))
                                                        (signal-value
                                                         btor163)))
                                                      (append
                                                       (list
                                                        (cons
                                                         (string->symbol
                                                          (string-append
                                                           name
                                                           "state137"))
                                                         (signal-value
                                                          btor1507)))
                                                       (append
                                                        (list
                                                         (cons
                                                          (string->symbol
                                                           (string-append
                                                            name
                                                            "state136"))
                                                          (signal-value
                                                           btor138)))
                                                        (append
                                                         (list
                                                          (cons
                                                           (string->symbol
                                                            (string-append
                                                             name
                                                             "state127"))
                                                           (signal-value
                                                            btor1501)))
                                                         (append
                                                          (list
                                                           (cons
                                                            (string->symbol
                                                             (string-append
                                                              name
                                                              "state126"))
                                                            (signal-value
                                                             btor128)))
                                                          (append
                                                           (list
                                                            (cons
                                                             (string->symbol
                                                              (string-append
                                                               name
                                                               "state117"))
                                                             (signal-value
                                                              btor1494)))
                                                           (append
                                                            (list
                                                             (cons
                                                              (string->symbol
                                                               (string-append
                                                                name
                                                                "state116"))
                                                              (signal-value
                                                               btor118)))
                                                            (append
                                                             (list
                                                              (cons
                                                               (string->symbol
                                                                (string-append
                                                                 name
                                                                 "state98"))
                                                               (signal-value
                                                                btor100)))
                                                             (append
                                                              (list
                                                               (cons
                                                                (string->symbol
                                                                 (string-append
                                                                  name
                                                                  "state96"))
                                                                (signal-value
                                                                 btor1487)))
                                                              (append
                                                               (list
                                                                (cons
                                                                 (string->symbol
                                                                  (string-append
                                                                   name
                                                                   "state95"))
                                                                 (signal-value
                                                                  btor105)))
                                                               (list))))))))))))))))))))))))))))))))))))))))))))))))))
              merged-input-state-hash)
             equal?
             #:key
             car)))
      (list
       (cons 'XOROUT (signal (signal-value btor1153) output-state))
       (cons 'PCOUT (signal (signal-value btor1079) output-state))
       (cons 'PATTERNBDETECT (signal (signal-value btor1069) output-state))
       (cons 'CARRYCASCOUT (signal (signal-value btor874) output-state))
       (cons 'P (signal (signal-value btor1079) output-state))
       (cons 'CARRYOUT (signal (signal-value btor903) output-state))
       (cons 'UNDERFLOW (signal (signal-value btor1089) output-state))
       (cons 'BCOUT (signal (signal-value btor144) output-state))
       (cons 'MULTSIGNOUT (signal (signal-value btor909) output-state))
       (cons 'OVERFLOW (signal (signal-value btor1077) output-state))
       (cons 'ACOUT (signal (signal-value btor124) output-state))
       (cons 'PATTERNDETECT (signal (signal-value btor1062) output-state))))))
