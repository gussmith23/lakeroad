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
      #:unnamed-input-300
      (unnamed-input-300
       (bv->signal (constant 'unnamed-input-300 (bitvector 48))))
      #:unnamed-input-439
      (unnamed-input-439
       (bv->signal (constant 'unnamed-input-439 (bitvector 48))))
      #:unnamed-input-677
      (unnamed-input-677
       (bv->signal (constant 'unnamed-input-677 (bitvector 48))))
      #:unnamed-input-727
      (unnamed-input-727
       (bv->signal (constant 'unnamed-input-727 (bitvector 48))))
      #:unnamed-input-771
      (unnamed-input-771
       (bv->signal (constant 'unnamed-input-771 (bitvector 1)))))
    (let* ((merged-input-state-hash (list))
           (init-hash (list))
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
                     ((assoc-has-key? merged-input-state-hash 'A1_reg)
                      (bv->signal (assoc-ref merged-input-state-hash 'A1_reg)))
                     ((assoc-has-key? init-hash 'A1_reg)
                      (bv->signal (assoc-ref init-hash 'A1_reg)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 30))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor96 (bv->signal (bv 0 (bitvector 1))))
           (btor97 (bv->signal (bv 1 (bitvector 1))))
           (btor98 (bv->signal (bv 15 (bitvector 4))))
           (btor99
            (bv->signal
             (zero-extend (signal-value btor98) (bitvector 5))
             btor98))
           (btor100
            (signal
             (bool->bitvector
              (bveq (signal-value btor15) (signal-value btor99)))
             (list)))
           (btor101
            (if (bitvector->bool (signal-value btor100)) btor97 btor96))
           (btor102 (bv->signal (bv 7 (bitvector 3))))
           (btor103
            (bv->signal
             (zero-extend (signal-value btor102) (bitvector 5))
             btor102))
           (btor104
            (signal
             (bool->bitvector
              (bveq (signal-value btor15) (signal-value btor103)))
             (list)))
           (btor105
            (if (bitvector->bool (signal-value btor104)) btor96 btor101))
           (btor106 (if (bitvector->bool (signal-value btor105)) btor5 btor2))
           (btor107
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'A2_reg)
                      (bv->signal (assoc-ref merged-input-state-hash 'A2_reg)))
                     ((assoc-has-key? init-hash 'A2_reg)
                      (bv->signal (assoc-ref init-hash 'A2_reg)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 30))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor108 (bitvector 2))
           (btor109
            (signal (extract 1 0 (signal-value btor12)) (signal-state btor12)))
           (btor110
            (signal
             (apply bvor (bitvector->bits (signal-value btor109)))
             (signal-state btor109)))
           (btor111
            (if (bitvector->bool (signal-value btor110)) btor107 btor106))
           (btor112
            (signal (extract 1 0 (signal-value btor4)) (signal-state btor4)))
           (btor113
            (signal
             (bool->bitvector
              (bveq (signal-value btor112) (signal-value btor109)))
             (list)))
           (btor114
            (if (bitvector->bool (signal-value btor113)) btor111 btor95))
           (btor116
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'B1_DATA_out)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'B1_DATA_out)))
                     ((assoc-has-key? init-hash 'B1_DATA_out)
                      (bv->signal (assoc-ref init-hash 'B1_DATA_out)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor117
            (bv->signal
             (zero-extend (signal-value btor98) (bitvector 5))
             btor98))
           (btor118
            (signal
             (bool->bitvector
              (bveq (signal-value btor22) (signal-value btor117)))
             (list)))
           (btor119
            (if (bitvector->bool (signal-value btor118)) btor97 btor96))
           (btor120
            (bv->signal
             (zero-extend (signal-value btor102) (bitvector 5))
             btor102))
           (btor121
            (signal
             (bool->bitvector
              (bveq (signal-value btor22) (signal-value btor120)))
             (list)))
           (btor122
            (if (bitvector->bool (signal-value btor121)) btor96 btor119))
           (btor123
            (if (bitvector->bool (signal-value btor122)) btor19 btor17))
           (btor124
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'B2_reg)
                      (bv->signal (assoc-ref merged-input-state-hash 'B2_reg)))
                     ((assoc-has-key? init-hash 'B2_reg)
                      (bv->signal (assoc-ref init-hash 'B2_reg)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor125
            (signal (extract 1 0 (signal-value btor21)) (signal-state btor21)))
           (btor126
            (signal
             (apply bvor (bitvector->bits (signal-value btor125)))
             (signal-state btor125)))
           (btor127
            (if (bitvector->bool (signal-value btor126)) btor124 btor123))
           (btor128
            (signal (extract 1 0 (signal-value btor18)) (signal-state btor18)))
           (btor129
            (signal
             (bool->bitvector
              (bveq (signal-value btor128) (signal-value btor125)))
             (list)))
           (btor130
            (if (bitvector->bool (signal-value btor129)) btor127 btor116))
           (btor132
            (signal (extract 0 0 (signal-value btor8)) (signal-state btor8)))
           (btor133
            (signal (extract 0 0 (signal-value btor52)) (signal-state btor52)))
           (btor134
            (signal
             (bvxor (signal-value btor132) (signal-value btor133))
             (list)))
           (btor135
            (signal (extract 1 1 (signal-value btor8)) (signal-state btor8)))
           (btor136
            (signal (extract 1 1 (signal-value btor52)) (signal-state btor52)))
           (btor137
            (signal
             (bvxor (signal-value btor135) (signal-value btor136))
             (list)))
           (btor138
            (signal (extract 2 2 (signal-value btor8)) (signal-state btor8)))
           (btor139
            (signal (extract 2 2 (signal-value btor52)) (signal-state btor52)))
           (btor140
            (signal
             (bvxor (signal-value btor138) (signal-value btor139))
             (list)))
           (btor141
            (signal (extract 3 3 (signal-value btor8)) (signal-state btor8)))
           (btor142
            (signal (extract 3 3 (signal-value btor52)) (signal-state btor52)))
           (btor143
            (signal
             (bvxor (signal-value btor141) (signal-value btor142))
             (list)))
           (btor144
            (signal
             (concat (signal-value btor137) (signal-value btor134))
             (list)))
           (btor145
            (signal
             (concat (signal-value btor140) (signal-value btor144))
             (list)))
           (btor146
            (signal
             (concat (signal-value btor143) (signal-value btor145))
             (list)))
           (btor147
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'ALUMODE_reg)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'ALUMODE_reg)))
                     ((assoc-has-key? init-hash 'ALUMODE_reg)
                      (bv->signal (assoc-ref init-hash 'ALUMODE_reg)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 4))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor148
            (signal (extract 0 0 (signal-value btor9)) (signal-state btor9)))
           (btor149
            (if (bitvector->bool (signal-value btor148)) btor147 btor146))
           (btor150
            (signal
             (extract 0 0 (signal-value btor149))
             (signal-state btor149)))
           (btor151
            (signal
             (extract 1 1 (signal-value btor149))
             (signal-state btor149)))
           (btor152
            (signal
             (bvand (signal-value btor150) (signal-value btor151))
             (list)))
           (btor153 (bitvector 14))
           (btor154 (bv->signal (bv 0 (bitvector 2))))
           (btor155 (bv->signal (bv 2 (bitvector 2))))
           (btor156 (bv->signal (bv 25 (bitvector 5))))
           (btor157
            (signal
             (bool->bitvector
              (bveq (signal-value btor92) (signal-value btor156)))
             (list)))
           (btor158
            (if (bitvector->bool (signal-value btor157)) btor155 btor154))
           (btor159 (bv->signal (bv 1 (bitvector 2))))
           (btor160 (bv->signal (bv 19 (bitvector 5))))
           (btor161
            (signal
             (bool->bitvector
              (bveq (signal-value btor92) (signal-value btor160)))
             (list)))
           (btor162
            (if (bitvector->bool (signal-value btor161)) btor159 btor158))
           (btor163 (bv->signal (bv 12 (bitvector 4))))
           (btor164
            (bv->signal
             (zero-extend (signal-value btor163) (bitvector 5))
             btor163))
           (btor165
            (signal
             (bool->bitvector
              (bveq (signal-value btor92) (signal-value btor164)))
             (list)))
           (btor166
            (if (bitvector->bool (signal-value btor165)) btor154 btor162))
           (btor167
            (bv->signal
             (zero-extend (signal-value btor97) (bitvector 2))
             btor97))
           (btor168
            (signal
             (bool->bitvector
              ((compose1 not bveq)
               (signal-value btor166)
               (signal-value btor167)))
             (list)))
           (btor169
            (signal
             (extract 0 0 (signal-value btor149))
             (signal-state btor149)))
           (btor170
            (signal
             (extract 0 0 (signal-value btor149))
             (signal-state btor149)))
           (btor171
            (signal
             (concat (signal-value btor170) (signal-value btor169))
             (list)))
           (btor172
            (signal
             (extract 0 0 (signal-value btor149))
             (signal-state btor149)))
           (btor173
            (signal
             (concat (signal-value btor172) (signal-value btor171))
             (list)))
           (btor174
            (signal
             (extract 0 0 (signal-value btor149))
             (signal-state btor149)))
           (btor175
            (signal
             (concat (signal-value btor174) (signal-value btor173))
             (list)))
           (btor176
            (signal
             (extract 0 0 (signal-value btor149))
             (signal-state btor149)))
           (btor177
            (signal
             (concat (signal-value btor176) (signal-value btor175))
             (list)))
           (btor178
            (signal
             (extract 0 0 (signal-value btor149))
             (signal-state btor149)))
           (btor179 (bitvector 6))
           (btor180
            (signal
             (concat (signal-value btor178) (signal-value btor177))
             (list)))
           (btor181
            (signal
             (extract 0 0 (signal-value btor149))
             (signal-state btor149)))
           (btor182 (bitvector 7))
           (btor183
            (signal
             (concat (signal-value btor181) (signal-value btor180))
             (list)))
           (btor184
            (signal
             (extract 0 0 (signal-value btor149))
             (signal-state btor149)))
           (btor185 (bitvector 8))
           (btor186
            (signal
             (concat (signal-value btor184) (signal-value btor183))
             (list)))
           (btor187
            (signal
             (extract 0 0 (signal-value btor149))
             (signal-state btor149)))
           (btor188
            (signal
             (concat (signal-value btor187) (signal-value btor186))
             (list)))
           (btor189
            (signal
             (extract 0 0 (signal-value btor149))
             (signal-state btor149)))
           (btor190 (bitvector 10))
           (btor191
            (signal
             (concat (signal-value btor189) (signal-value btor188))
             (list)))
           (btor192
            (signal
             (extract 0 0 (signal-value btor149))
             (signal-state btor149)))
           (btor193 (bitvector 11))
           (btor194
            (signal
             (concat (signal-value btor192) (signal-value btor191))
             (list)))
           (btor195
            (signal
             (extract 0 0 (signal-value btor149))
             (signal-state btor149)))
           (btor196 (bitvector 12))
           (btor197
            (signal
             (concat (signal-value btor195) (signal-value btor194))
             (list)))
           (btor198
            (signal
             (extract 0 0 (signal-value btor149))
             (signal-state btor149)))
           (btor199 (bitvector 13))
           (btor200
            (signal
             (concat (signal-value btor198) (signal-value btor197))
             (list)))
           (btor201
            (signal
             (extract 0 0 (signal-value btor149))
             (signal-state btor149)))
           (btor202
            (signal
             (concat (signal-value btor201) (signal-value btor200))
             (list)))
           (btor203
            (signal
             (extract 0 0 (signal-value btor149))
             (signal-state btor149)))
           (btor204 (bitvector 15))
           (btor205
            (signal
             (concat (signal-value btor203) (signal-value btor202))
             (list)))
           (btor206
            (signal
             (extract 0 0 (signal-value btor149))
             (signal-state btor149)))
           (btor207 (bitvector 16))
           (btor208
            (signal
             (concat (signal-value btor206) (signal-value btor205))
             (list)))
           (btor209
            (signal
             (extract 0 0 (signal-value btor149))
             (signal-state btor149)))
           (btor210 (bitvector 17))
           (btor211
            (signal
             (concat (signal-value btor209) (signal-value btor208))
             (list)))
           (btor212
            (signal
             (extract 0 0 (signal-value btor149))
             (signal-state btor149)))
           (btor213
            (signal
             (concat (signal-value btor212) (signal-value btor211))
             (list)))
           (btor214
            (signal
             (extract 0 0 (signal-value btor149))
             (signal-state btor149)))
           (btor215 (bitvector 19))
           (btor216
            (signal
             (concat (signal-value btor214) (signal-value btor213))
             (list)))
           (btor217
            (signal
             (extract 0 0 (signal-value btor149))
             (signal-state btor149)))
           (btor218 (bitvector 20))
           (btor219
            (signal
             (concat (signal-value btor217) (signal-value btor216))
             (list)))
           (btor220
            (signal
             (extract 0 0 (signal-value btor149))
             (signal-state btor149)))
           (btor221 (bitvector 21))
           (btor222
            (signal
             (concat (signal-value btor220) (signal-value btor219))
             (list)))
           (btor223
            (signal
             (extract 0 0 (signal-value btor149))
             (signal-state btor149)))
           (btor224 (bitvector 22))
           (btor225
            (signal
             (concat (signal-value btor223) (signal-value btor222))
             (list)))
           (btor226
            (signal
             (extract 0 0 (signal-value btor149))
             (signal-state btor149)))
           (btor227 (bitvector 23))
           (btor228
            (signal
             (concat (signal-value btor226) (signal-value btor225))
             (list)))
           (btor229
            (signal
             (extract 0 0 (signal-value btor149))
             (signal-state btor149)))
           (btor230 (bitvector 24))
           (btor231
            (signal
             (concat (signal-value btor229) (signal-value btor228))
             (list)))
           (btor232
            (signal
             (extract 0 0 (signal-value btor149))
             (signal-state btor149)))
           (btor233 (bitvector 25))
           (btor234
            (signal
             (concat (signal-value btor232) (signal-value btor231))
             (list)))
           (btor235
            (signal
             (extract 0 0 (signal-value btor149))
             (signal-state btor149)))
           (btor236 (bitvector 26))
           (btor237
            (signal
             (concat (signal-value btor235) (signal-value btor234))
             (list)))
           (btor238
            (signal
             (extract 0 0 (signal-value btor149))
             (signal-state btor149)))
           (btor239
            (signal
             (concat (signal-value btor238) (signal-value btor237))
             (list)))
           (btor240
            (signal
             (extract 0 0 (signal-value btor149))
             (signal-state btor149)))
           (btor241 (bitvector 28))
           (btor242
            (signal
             (concat (signal-value btor240) (signal-value btor239))
             (list)))
           (btor243
            (signal
             (extract 0 0 (signal-value btor149))
             (signal-state btor149)))
           (btor244 (bitvector 29))
           (btor245
            (signal
             (concat (signal-value btor243) (signal-value btor242))
             (list)))
           (btor246
            (signal
             (extract 0 0 (signal-value btor149))
             (signal-state btor149)))
           (btor247
            (signal
             (concat (signal-value btor246) (signal-value btor245))
             (list)))
           (btor248
            (signal
             (extract 0 0 (signal-value btor149))
             (signal-state btor149)))
           (btor249 (bitvector 31))
           (btor250
            (signal
             (concat (signal-value btor248) (signal-value btor247))
             (list)))
           (btor251
            (signal
             (extract 0 0 (signal-value btor149))
             (signal-state btor149)))
           (btor252
            (signal
             (concat (signal-value btor251) (signal-value btor250))
             (list)))
           (btor253
            (signal
             (extract 0 0 (signal-value btor149))
             (signal-state btor149)))
           (btor254 (bitvector 33))
           (btor255
            (signal
             (concat (signal-value btor253) (signal-value btor252))
             (list)))
           (btor256
            (signal
             (extract 0 0 (signal-value btor149))
             (signal-state btor149)))
           (btor257 (bitvector 34))
           (btor258
            (signal
             (concat (signal-value btor256) (signal-value btor255))
             (list)))
           (btor259
            (signal
             (extract 0 0 (signal-value btor149))
             (signal-state btor149)))
           (btor260 (bitvector 35))
           (btor261
            (signal
             (concat (signal-value btor259) (signal-value btor258))
             (list)))
           (btor262
            (signal
             (extract 0 0 (signal-value btor149))
             (signal-state btor149)))
           (btor263 (bitvector 36))
           (btor264
            (signal
             (concat (signal-value btor262) (signal-value btor261))
             (list)))
           (btor265
            (signal
             (extract 0 0 (signal-value btor149))
             (signal-state btor149)))
           (btor266 (bitvector 37))
           (btor267
            (signal
             (concat (signal-value btor265) (signal-value btor264))
             (list)))
           (btor268
            (signal
             (extract 0 0 (signal-value btor149))
             (signal-state btor149)))
           (btor269 (bitvector 38))
           (btor270
            (signal
             (concat (signal-value btor268) (signal-value btor267))
             (list)))
           (btor271
            (signal
             (extract 0 0 (signal-value btor149))
             (signal-state btor149)))
           (btor272 (bitvector 39))
           (btor273
            (signal
             (concat (signal-value btor271) (signal-value btor270))
             (list)))
           (btor274
            (signal
             (extract 0 0 (signal-value btor149))
             (signal-state btor149)))
           (btor275 (bitvector 40))
           (btor276
            (signal
             (concat (signal-value btor274) (signal-value btor273))
             (list)))
           (btor277
            (signal
             (extract 0 0 (signal-value btor149))
             (signal-state btor149)))
           (btor278 (bitvector 41))
           (btor279
            (signal
             (concat (signal-value btor277) (signal-value btor276))
             (list)))
           (btor280
            (signal
             (extract 0 0 (signal-value btor149))
             (signal-state btor149)))
           (btor281 (bitvector 42))
           (btor282
            (signal
             (concat (signal-value btor280) (signal-value btor279))
             (list)))
           (btor283
            (signal
             (extract 0 0 (signal-value btor149))
             (signal-state btor149)))
           (btor284 (bitvector 43))
           (btor285
            (signal
             (concat (signal-value btor283) (signal-value btor282))
             (list)))
           (btor286
            (signal
             (extract 0 0 (signal-value btor149))
             (signal-state btor149)))
           (btor287 (bitvector 44))
           (btor288
            (signal
             (concat (signal-value btor286) (signal-value btor285))
             (list)))
           (btor289
            (signal
             (extract 0 0 (signal-value btor149))
             (signal-state btor149)))
           (btor290 (bitvector 45))
           (btor291
            (signal
             (concat (signal-value btor289) (signal-value btor288))
             (list)))
           (btor292
            (signal
             (extract 0 0 (signal-value btor149))
             (signal-state btor149)))
           (btor293 (bitvector 46))
           (btor294
            (signal
             (concat (signal-value btor292) (signal-value btor291))
             (list)))
           (btor295
            (signal
             (extract 0 0 (signal-value btor149))
             (signal-state btor149)))
           (btor296 (bitvector 47))
           (btor297
            (signal
             (concat (signal-value btor295) (signal-value btor294))
             (list)))
           (btor298
            (signal
             (extract 0 0 (signal-value btor149))
             (signal-state btor149)))
           (btor299
            (signal
             (concat (signal-value btor298) (signal-value btor297))
             (list)))
           (btor300 unnamed-input-300)
           (btor301
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'ALU_OUT_reg)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'ALU_OUT_reg)))
                     ((assoc-has-key? init-hash 'ALU_OUT_reg)
                      (bv->signal (assoc-ref init-hash 'ALU_OUT_reg)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 48))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor302
            (signal
             (extract 47 17 (signal-value btor301))
             (signal-state btor301)))
           (btor303
            (signal
             (extract 47 47 (signal-value btor301))
             (signal-state btor301)))
           (btor304
            (signal
             (concat (signal-value btor303) (signal-value btor302))
             (list)))
           (btor305
            (signal
             (extract 47 47 (signal-value btor301))
             (signal-state btor301)))
           (btor306
            (signal
             (concat (signal-value btor305) (signal-value btor304))
             (list)))
           (btor307
            (signal
             (extract 47 47 (signal-value btor301))
             (signal-state btor301)))
           (btor308
            (signal
             (concat (signal-value btor307) (signal-value btor306))
             (list)))
           (btor309
            (signal
             (extract 47 47 (signal-value btor301))
             (signal-state btor301)))
           (btor310
            (signal
             (concat (signal-value btor309) (signal-value btor308))
             (list)))
           (btor311
            (signal
             (extract 47 47 (signal-value btor301))
             (signal-state btor301)))
           (btor312
            (signal
             (concat (signal-value btor311) (signal-value btor310))
             (list)))
           (btor313
            (signal
             (extract 47 47 (signal-value btor301))
             (signal-state btor301)))
           (btor314
            (signal
             (concat (signal-value btor313) (signal-value btor312))
             (list)))
           (btor315
            (signal
             (extract 47 47 (signal-value btor301))
             (signal-state btor301)))
           (btor316
            (signal
             (concat (signal-value btor315) (signal-value btor314))
             (list)))
           (btor317
            (signal
             (extract 47 47 (signal-value btor301))
             (signal-state btor301)))
           (btor318
            (signal
             (concat (signal-value btor317) (signal-value btor316))
             (list)))
           (btor319
            (signal
             (extract 47 47 (signal-value btor301))
             (signal-state btor301)))
           (btor320
            (signal
             (concat (signal-value btor319) (signal-value btor318))
             (list)))
           (btor321
            (signal
             (extract 47 47 (signal-value btor301))
             (signal-state btor301)))
           (btor322
            (signal
             (concat (signal-value btor321) (signal-value btor320))
             (list)))
           (btor323
            (signal
             (extract 47 47 (signal-value btor301))
             (signal-state btor301)))
           (btor324
            (signal
             (concat (signal-value btor323) (signal-value btor322))
             (list)))
           (btor325
            (signal
             (extract 47 47 (signal-value btor301))
             (signal-state btor301)))
           (btor326
            (signal
             (concat (signal-value btor325) (signal-value btor324))
             (list)))
           (btor327
            (signal
             (extract 47 47 (signal-value btor301))
             (signal-state btor301)))
           (btor328
            (signal
             (concat (signal-value btor327) (signal-value btor326))
             (list)))
           (btor329
            (signal
             (extract 47 47 (signal-value btor301))
             (signal-state btor301)))
           (btor330
            (signal
             (concat (signal-value btor329) (signal-value btor328))
             (list)))
           (btor331
            (signal
             (extract 47 47 (signal-value btor301))
             (signal-state btor301)))
           (btor332
            (signal
             (concat (signal-value btor331) (signal-value btor330))
             (list)))
           (btor333
            (signal
             (extract 47 47 (signal-value btor301))
             (signal-state btor301)))
           (btor334
            (signal
             (concat (signal-value btor333) (signal-value btor332))
             (list)))
           (btor335
            (signal
             (extract 47 47 (signal-value btor301))
             (signal-state btor301)))
           (btor336
            (signal
             (concat (signal-value btor335) (signal-value btor334))
             (list)))
           (btor337
            (signal (extract 0 0 (signal-value btor71)) (signal-state btor71)))
           (btor338
            (signal (extract 0 0 (signal-value btor57)) (signal-state btor57)))
           (btor339
            (signal
             (bvxor (signal-value btor337) (signal-value btor338))
             (list)))
           (btor340
            (signal (extract 1 1 (signal-value btor71)) (signal-state btor71)))
           (btor341
            (signal (extract 1 1 (signal-value btor57)) (signal-state btor57)))
           (btor342
            (signal
             (bvxor (signal-value btor340) (signal-value btor341))
             (list)))
           (btor343
            (signal (extract 2 2 (signal-value btor71)) (signal-state btor71)))
           (btor344
            (signal (extract 2 2 (signal-value btor57)) (signal-state btor57)))
           (btor345
            (signal
             (bvxor (signal-value btor343) (signal-value btor344))
             (list)))
           (btor346
            (signal (extract 3 3 (signal-value btor71)) (signal-state btor71)))
           (btor347
            (signal (extract 3 3 (signal-value btor57)) (signal-state btor57)))
           (btor348
            (signal
             (bvxor (signal-value btor346) (signal-value btor347))
             (list)))
           (btor349
            (signal (extract 4 4 (signal-value btor71)) (signal-state btor71)))
           (btor350
            (signal (extract 4 4 (signal-value btor57)) (signal-state btor57)))
           (btor351
            (signal
             (bvxor (signal-value btor349) (signal-value btor350))
             (list)))
           (btor352
            (signal (extract 5 5 (signal-value btor71)) (signal-state btor71)))
           (btor353
            (signal (extract 5 5 (signal-value btor57)) (signal-state btor57)))
           (btor354
            (signal
             (bvxor (signal-value btor352) (signal-value btor353))
             (list)))
           (btor355
            (signal (extract 6 6 (signal-value btor71)) (signal-state btor71)))
           (btor356
            (signal (extract 6 6 (signal-value btor57)) (signal-state btor57)))
           (btor357
            (signal
             (bvxor (signal-value btor355) (signal-value btor356))
             (list)))
           (btor358
            (signal (extract 7 7 (signal-value btor71)) (signal-state btor71)))
           (btor359
            (signal (extract 7 7 (signal-value btor57)) (signal-state btor57)))
           (btor360
            (signal
             (bvxor (signal-value btor358) (signal-value btor359))
             (list)))
           (btor361
            (signal (extract 8 8 (signal-value btor71)) (signal-state btor71)))
           (btor362
            (signal (extract 8 8 (signal-value btor57)) (signal-state btor57)))
           (btor363
            (signal
             (bvxor (signal-value btor361) (signal-value btor362))
             (list)))
           (btor364
            (signal
             (concat (signal-value btor342) (signal-value btor339))
             (list)))
           (btor365
            (signal
             (concat (signal-value btor345) (signal-value btor364))
             (list)))
           (btor366
            (signal
             (concat (signal-value btor348) (signal-value btor365))
             (list)))
           (btor367
            (signal
             (concat (signal-value btor351) (signal-value btor366))
             (list)))
           (btor368
            (signal
             (concat (signal-value btor354) (signal-value btor367))
             (list)))
           (btor369
            (signal
             (concat (signal-value btor357) (signal-value btor368))
             (list)))
           (btor370
            (signal
             (concat (signal-value btor360) (signal-value btor369))
             (list)))
           (btor371
            (signal
             (concat (signal-value btor363) (signal-value btor370))
             (list)))
           (btor372
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'OPMODE_reg)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'OPMODE_reg)))
                     ((assoc-has-key? init-hash 'OPMODE_reg)
                      (bv->signal (assoc-ref init-hash 'OPMODE_reg)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 9))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor373
            (signal (extract 0 0 (signal-value btor72)) (signal-state btor72)))
           (btor374
            (if (bitvector->bool (signal-value btor373)) btor372 btor371))
           (btor375
            (signal
             (extract 6 5 (signal-value btor374))
             (signal-state btor374)))
           (btor376 (bv->signal (bv 3 (bitvector 2))))
           (btor377
            (signal
             (bool->bitvector
              (bveq (signal-value btor375) (signal-value btor376)))
             (list)))
           (btor378
            (if (bitvector->bool (signal-value btor377)) btor336 btor300))
           (btor379
            (signal
             (extract 47 17 (signal-value btor74))
             (signal-state btor74)))
           (btor380
            (signal
             (extract 47 47 (signal-value btor74))
             (signal-state btor74)))
           (btor381
            (signal
             (concat (signal-value btor380) (signal-value btor379))
             (list)))
           (btor382
            (signal
             (extract 47 47 (signal-value btor74))
             (signal-state btor74)))
           (btor383
            (signal
             (concat (signal-value btor382) (signal-value btor381))
             (list)))
           (btor384
            (signal
             (extract 47 47 (signal-value btor74))
             (signal-state btor74)))
           (btor385
            (signal
             (concat (signal-value btor384) (signal-value btor383))
             (list)))
           (btor386
            (signal
             (extract 47 47 (signal-value btor74))
             (signal-state btor74)))
           (btor387
            (signal
             (concat (signal-value btor386) (signal-value btor385))
             (list)))
           (btor388
            (signal
             (extract 47 47 (signal-value btor74))
             (signal-state btor74)))
           (btor389
            (signal
             (concat (signal-value btor388) (signal-value btor387))
             (list)))
           (btor390
            (signal
             (extract 47 47 (signal-value btor74))
             (signal-state btor74)))
           (btor391
            (signal
             (concat (signal-value btor390) (signal-value btor389))
             (list)))
           (btor392
            (signal
             (extract 47 47 (signal-value btor74))
             (signal-state btor74)))
           (btor393
            (signal
             (concat (signal-value btor392) (signal-value btor391))
             (list)))
           (btor394
            (signal
             (extract 47 47 (signal-value btor74))
             (signal-state btor74)))
           (btor395
            (signal
             (concat (signal-value btor394) (signal-value btor393))
             (list)))
           (btor396
            (signal
             (extract 47 47 (signal-value btor74))
             (signal-state btor74)))
           (btor397
            (signal
             (concat (signal-value btor396) (signal-value btor395))
             (list)))
           (btor398
            (signal
             (extract 47 47 (signal-value btor74))
             (signal-state btor74)))
           (btor399
            (signal
             (concat (signal-value btor398) (signal-value btor397))
             (list)))
           (btor400
            (signal
             (extract 47 47 (signal-value btor74))
             (signal-state btor74)))
           (btor401
            (signal
             (concat (signal-value btor400) (signal-value btor399))
             (list)))
           (btor402
            (signal
             (extract 47 47 (signal-value btor74))
             (signal-state btor74)))
           (btor403
            (signal
             (concat (signal-value btor402) (signal-value btor401))
             (list)))
           (btor404
            (signal
             (extract 47 47 (signal-value btor74))
             (signal-state btor74)))
           (btor405
            (signal
             (concat (signal-value btor404) (signal-value btor403))
             (list)))
           (btor406
            (signal
             (extract 47 47 (signal-value btor74))
             (signal-state btor74)))
           (btor407
            (signal
             (concat (signal-value btor406) (signal-value btor405))
             (list)))
           (btor408
            (signal
             (extract 47 47 (signal-value btor74))
             (signal-state btor74)))
           (btor409
            (signal
             (concat (signal-value btor408) (signal-value btor407))
             (list)))
           (btor410
            (signal
             (extract 47 47 (signal-value btor74))
             (signal-state btor74)))
           (btor411
            (signal
             (concat (signal-value btor410) (signal-value btor409))
             (list)))
           (btor412
            (signal
             (extract 47 47 (signal-value btor74))
             (signal-state btor74)))
           (btor413
            (signal
             (concat (signal-value btor412) (signal-value btor411))
             (list)))
           (btor414
            (signal
             (extract 6 4 (signal-value btor374))
             (signal-state btor374)))
           (btor415 (bv->signal (bv 5 (bitvector 3))))
           (btor416
            (signal
             (bool->bitvector
              (bveq (signal-value btor414) (signal-value btor415)))
             (list)))
           (btor417
            (if (bitvector->bool (signal-value btor416)) btor413 btor378))
           (btor418 (bv->signal (bv 4 (bitvector 3))))
           (btor419
            (signal
             (bool->bitvector
              (bveq (signal-value btor414) (signal-value btor418)))
             (list)))
           (btor420
            (bv->signal
             (zero-extend (signal-value btor155) (bitvector 3))
             btor155))
           (btor421
            (signal
             (bool->bitvector
              (bveq (signal-value btor414) (signal-value btor420)))
             (list)))
           (btor422
            (signal
             (concat (signal-value btor421) (signal-value btor419))
             (list)))
           (btor423
            (signal
             (apply bvor (bitvector->bits (signal-value btor422)))
             (signal-state btor422)))
           (btor424
            (if (bitvector->bool (signal-value btor423)) btor301 btor417))
           (btor425
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'C_reg)
                      (bv->signal (assoc-ref merged-input-state-hash 'C_reg)))
                     ((assoc-has-key? init-hash 'C_reg)
                      (bv->signal (assoc-ref init-hash 'C_reg)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 48))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor426
            (signal (extract 0 0 (signal-value btor46)) (signal-state btor46)))
           (btor427
            (if (bitvector->bool (signal-value btor426)) btor425 btor24))
           (btor428
            (bv->signal
             (zero-extend (signal-value btor376) (bitvector 3))
             btor376))
           (btor429
            (signal
             (bool->bitvector
              (bveq (signal-value btor414) (signal-value btor428)))
             (list)))
           (btor430
            (if (bitvector->bool (signal-value btor429)) btor427 btor424))
           (btor431
            (bv->signal
             (zero-extend (signal-value btor97) (bitvector 3))
             btor97))
           (btor432
            (signal
             (bool->bitvector
              (bveq (signal-value btor414) (signal-value btor431)))
             (list)))
           (btor433
            (if (bitvector->bool (signal-value btor432)) btor74 btor430))
           (btor434 (bv->signal (bv 0 (bitvector 48))))
           (btor435
            (signal
             (apply bvor (bitvector->bits (signal-value btor414)))
             (signal-state btor414)))
           (btor436 (signal (bvnot (signal-value btor435)) (list)))
           (btor437
            (if (bitvector->bool (signal-value btor436)) btor434 btor433))
           (btor438
            (signal
             (bvxor (signal-value btor299) (signal-value btor437))
             (list)))
           (btor439 unnamed-input-439)
           (btor440
            (signal
             (concat (signal-value btor111) (signal-value btor127))
             (list)))
           (btor441
            (signal
             (extract 1 0 (signal-value btor374))
             (signal-state btor374)))
           (btor442
            (signal
             (bool->bitvector
              (bveq (signal-value btor441) (signal-value btor376)))
             (list)))
           (btor443
            (if (bitvector->bool (signal-value btor442)) btor440 btor439))
           (btor444
            (signal
             (bool->bitvector
              (bveq (signal-value btor441) (signal-value btor155)))
             (list)))
           (btor445
            (if (bitvector->bool (signal-value btor444)) btor301 btor443))
           (btor446 (bv->signal (bv 17592186044416 (bitvector 45))))
           (btor447
            (signal
             (extract 26 0 (signal-value btor111))
             (signal-state btor111)))
           (btor448
            (signal
             (extract 26 0 (signal-value btor95))
             (signal-state btor95)))
           (btor449
            (signal (extract 0 0 (signal-value btor50)) (signal-state btor50)))
           (btor450
            (signal (extract 0 0 (signal-value btor55)) (signal-state btor55)))
           (btor451
            (signal
             (bvxor (signal-value btor449) (signal-value btor450))
             (list)))
           (btor452
            (signal (extract 1 1 (signal-value btor50)) (signal-state btor50)))
           (btor453
            (signal (extract 1 1 (signal-value btor55)) (signal-state btor55)))
           (btor454
            (signal
             (bvxor (signal-value btor452) (signal-value btor453))
             (list)))
           (btor455
            (signal (extract 2 2 (signal-value btor50)) (signal-state btor50)))
           (btor456
            (signal (extract 2 2 (signal-value btor55)) (signal-state btor55)))
           (btor457
            (signal
             (bvxor (signal-value btor455) (signal-value btor456))
             (list)))
           (btor458
            (signal (extract 3 3 (signal-value btor50)) (signal-state btor50)))
           (btor459
            (signal (extract 3 3 (signal-value btor55)) (signal-state btor55)))
           (btor460
            (signal
             (bvxor (signal-value btor458) (signal-value btor459))
             (list)))
           (btor461
            (signal (extract 4 4 (signal-value btor50)) (signal-state btor50)))
           (btor462
            (signal (extract 4 4 (signal-value btor55)) (signal-state btor55)))
           (btor463
            (signal
             (bvxor (signal-value btor461) (signal-value btor462))
             (list)))
           (btor464
            (signal
             (concat (signal-value btor454) (signal-value btor451))
             (list)))
           (btor465
            (signal
             (concat (signal-value btor457) (signal-value btor464))
             (list)))
           (btor466
            (signal
             (concat (signal-value btor460) (signal-value btor465))
             (list)))
           (btor467
            (signal
             (concat (signal-value btor463) (signal-value btor466))
             (list)))
           (btor468
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'INMODE_reg)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'INMODE_reg)))
                     ((assoc-has-key? init-hash 'INMODE_reg)
                      (bv->signal (assoc-ref init-hash 'INMODE_reg)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 5))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor469
            (signal (extract 0 0 (signal-value btor51)) (signal-state btor51)))
           (btor470
            (if (bitvector->bool (signal-value btor469)) btor468 btor467))
           (btor471
            (signal
             (extract 0 0 (signal-value btor470))
             (signal-state btor470)))
           (btor472
            (if (bitvector->bool (signal-value btor471)) btor448 btor447))
           (btor473 (bv->signal (bv 0 (bitvector 27))))
           (btor474
            (bv->signal
             (zero-extend (signal-value btor97) (bitvector 5))
             btor97))
           (btor475
            (signal
             (bool->bitvector
              (bveq (signal-value btor75) (signal-value btor474)))
             (list)))
           (btor476
            (if (bitvector->bool (signal-value btor475)) btor97 btor96))
           (btor477 (bv->signal (bv 0 (bitvector 3))))
           (btor478
            (signal
             (concat (signal-value btor477) (signal-value btor75))
             (list)))
           (btor479
            (signal
             (apply bvor (bitvector->bits (signal-value btor478)))
             (signal-state btor478)))
           (btor480 (signal (bvnot (signal-value btor479)) (list)))
           (btor481
            (if (bitvector->bool (signal-value btor480)) btor96 btor476))
           (btor482 (signal (bvnot (signal-value btor481)) (list)))
           (btor483
            (signal
             (extract 1 1 (signal-value btor470))
             (signal-state btor470)))
           (btor484
            (signal
             (bvand (signal-value btor482) (signal-value btor483))
             (list)))
           (btor485
            (if (bitvector->bool (signal-value btor484)) btor473 btor472))
           (btor486
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'D_DATA_reg)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'D_DATA_reg)))
                     ((assoc-has-key? init-hash 'D_DATA_reg)
                      (bv->signal (assoc-ref init-hash 'D_DATA_reg)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 27))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor487
            (signal (extract 0 0 (signal-value btor49)) (signal-state btor49)))
           (btor488
            (bv->signal
             (zero-extend (signal-value btor155) (bitvector 5))
             btor155))
           (btor489
            (signal
             (bool->bitvector
              (bveq (signal-value btor11) (signal-value btor488)))
             (list)))
           (btor490
            (if (bitvector->bool (signal-value btor489)) btor97 btor96))
           (btor491 (bv->signal (bv 0 (bitvector 11))))
           (btor492
            (signal
             (concat (signal-value btor491) (signal-value btor11))
             (list)))
           (btor493
            (signal
             (apply bvor (bitvector->bits (signal-value btor492)))
             (signal-state btor492)))
           (btor494 (signal (bvnot (signal-value btor493)) (list)))
           (btor495
            (if (bitvector->bool (signal-value btor494)) btor96 btor490))
           (btor496 (signal (bvnot (signal-value btor495)) (list)))
           (btor497
            (bv->signal
             (zero-extend (signal-value btor155) (bitvector 5))
             btor155))
           (btor498
            (signal
             (bool->bitvector
              (bveq (signal-value btor20) (signal-value btor497)))
             (list)))
           (btor499
            (if (bitvector->bool (signal-value btor498)) btor97 btor96))
           (btor500
            (bv->signal
             (zero-extend (signal-value btor97) (bitvector 5))
             btor97))
           (btor501
            (signal
             (bool->bitvector
              (bveq (signal-value btor20) (signal-value btor500)))
             (list)))
           (btor502
            (if (bitvector->bool (signal-value btor501)) btor96 btor499))
           (btor503 (signal (bvnot (signal-value btor502)) (list)))
           (btor504
            (signal
             (bvand (signal-value btor496) (signal-value btor503))
             (list)))
           (btor505 (bv->signal (bv 20 (bitvector 5))))
           (btor506
            (signal
             (bool->bitvector
              (bveq (signal-value btor90) (signal-value btor505)))
             (list)))
           (btor507
            (if (bitvector->bool (signal-value btor506)) btor155 btor154))
           (btor508 (bv->signal (bv 18 (bitvector 5))))
           (btor509
            (signal
             (bool->bitvector
              (bveq (signal-value btor90) (signal-value btor508)))
             (list)))
           (btor510
            (if (bitvector->bool (signal-value btor509)) btor159 btor507))
           (btor511 (bv->signal (bv 10 (bitvector 4))))
           (btor512
            (bv->signal
             (zero-extend (signal-value btor511) (bitvector 5))
             btor511))
           (btor513
            (signal
             (bool->bitvector
              (bveq (signal-value btor90) (signal-value btor512)))
             (list)))
           (btor514
            (if (bitvector->bool (signal-value btor513)) btor154 btor510))
           (btor515
            (signal
             (bool->bitvector
              (bveq (signal-value btor514) (signal-value btor155)))
             (list)))
           (btor516
            (signal
             (bvor (signal-value btor504) (signal-value btor515))
             (list)))
           (btor517
            (if (bitvector->bool (signal-value btor516)) btor96 btor487))
           (btor518
            (if (bitvector->bool (signal-value btor517)) btor486 btor48))
           (btor519
            (signal
             (extract 2 2 (signal-value btor470))
             (signal-state btor470)))
           (btor520
            (if (bitvector->bool (signal-value btor519)) btor518 btor473))
           (btor521
            (signal
             (extract 4 4 (signal-value btor470))
             (signal-state btor470)))
           (btor522
            (if (bitvector->bool (signal-value btor521)) btor116 btor127))
           (btor523 (bv->signal (bv 0 (bitvector 18))))
           (btor524
            (signal
             (bvand (signal-value btor481) (signal-value btor483))
             (list)))
           (btor525
            (if (bitvector->bool (signal-value btor524)) btor523 btor522))
           (btor526
            (signal
             (extract 17 17 (signal-value btor525))
             (signal-state btor525)))
           (btor527
            (signal
             (concat (signal-value btor526) (signal-value btor525))
             (list)))
           (btor528
            (signal
             (extract 17 17 (signal-value btor525))
             (signal-state btor525)))
           (btor529
            (signal
             (concat (signal-value btor528) (signal-value btor527))
             (list)))
           (btor530
            (signal
             (extract 17 17 (signal-value btor525))
             (signal-state btor525)))
           (btor531
            (signal
             (concat (signal-value btor530) (signal-value btor529))
             (list)))
           (btor532
            (signal
             (extract 17 17 (signal-value btor525))
             (signal-state btor525)))
           (btor533
            (signal
             (concat (signal-value btor532) (signal-value btor531))
             (list)))
           (btor534
            (signal
             (extract 17 17 (signal-value btor525))
             (signal-state btor525)))
           (btor535
            (signal
             (concat (signal-value btor534) (signal-value btor533))
             (list)))
           (btor536
            (signal
             (extract 17 17 (signal-value btor525))
             (signal-state btor525)))
           (btor537
            (signal
             (concat (signal-value btor536) (signal-value btor535))
             (list)))
           (btor538
            (signal
             (extract 17 17 (signal-value btor525))
             (signal-state btor525)))
           (btor539
            (signal
             (concat (signal-value btor538) (signal-value btor537))
             (list)))
           (btor540
            (signal
             (extract 17 17 (signal-value btor525))
             (signal-state btor525)))
           (btor541
            (signal
             (concat (signal-value btor540) (signal-value btor539))
             (list)))
           (btor542
            (signal
             (extract 17 17 (signal-value btor525))
             (signal-state btor525)))
           (btor543
            (signal
             (concat (signal-value btor542) (signal-value btor541))
             (list)))
           (btor544
            (if (bitvector->bool (signal-value btor481)) btor543 btor485))
           (btor545
            (signal
             (bvadd (signal-value btor520) (signal-value btor544))
             (list)))
           (btor546
            (signal
             (bvsub (signal-value btor520) (signal-value btor544))
             (list)))
           (btor547
            (signal
             (extract 3 3 (signal-value btor470))
             (signal-state btor470)))
           (btor548
            (if (bitvector->bool (signal-value btor547)) btor546 btor545))
           (btor549
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'AD_DATA_reg)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'AD_DATA_reg)))
                     ((assoc-has-key? init-hash 'AD_DATA_reg)
                      (bv->signal (assoc-ref init-hash 'AD_DATA_reg)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 27))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor550
            (signal (extract 0 0 (signal-value btor6)) (signal-state btor6)))
           (btor551
            (if (bitvector->bool (signal-value btor516)) btor96 btor550))
           (btor552
            (if (bitvector->bool (signal-value btor551)) btor549 btor548))
           (btor553
            (if (bitvector->bool (signal-value btor495)) btor552 btor485))
           (btor554
            (signal
             (extract 26 26 (signal-value btor553))
             (signal-state btor553)))
           (btor555
            (signal
             (concat (signal-value btor554) (signal-value btor553))
             (list)))
           (btor556
            (signal
             (extract 26 26 (signal-value btor553))
             (signal-state btor553)))
           (btor557
            (signal
             (concat (signal-value btor556) (signal-value btor555))
             (list)))
           (btor558
            (signal
             (extract 26 26 (signal-value btor553))
             (signal-state btor553)))
           (btor559
            (signal
             (concat (signal-value btor558) (signal-value btor557))
             (list)))
           (btor560
            (signal
             (extract 26 26 (signal-value btor553))
             (signal-state btor553)))
           (btor561
            (signal
             (concat (signal-value btor560) (signal-value btor559))
             (list)))
           (btor562
            (signal
             (extract 26 26 (signal-value btor553))
             (signal-state btor553)))
           (btor563
            (signal
             (concat (signal-value btor562) (signal-value btor561))
             (list)))
           (btor564
            (signal
             (extract 26 26 (signal-value btor553))
             (signal-state btor553)))
           (btor565
            (signal
             (concat (signal-value btor564) (signal-value btor563))
             (list)))
           (btor566
            (signal
             (extract 26 26 (signal-value btor553))
             (signal-state btor553)))
           (btor567
            (signal
             (concat (signal-value btor566) (signal-value btor565))
             (list)))
           (btor568
            (signal
             (extract 26 26 (signal-value btor553))
             (signal-state btor553)))
           (btor569
            (signal
             (concat (signal-value btor568) (signal-value btor567))
             (list)))
           (btor570
            (signal
             (extract 26 26 (signal-value btor553))
             (signal-state btor553)))
           (btor571
            (signal
             (concat (signal-value btor570) (signal-value btor569))
             (list)))
           (btor572
            (signal
             (extract 26 26 (signal-value btor553))
             (signal-state btor553)))
           (btor573
            (signal
             (concat (signal-value btor572) (signal-value btor571))
             (list)))
           (btor574
            (signal
             (extract 26 26 (signal-value btor553))
             (signal-state btor553)))
           (btor575
            (signal
             (concat (signal-value btor574) (signal-value btor573))
             (list)))
           (btor576
            (signal
             (extract 26 26 (signal-value btor553))
             (signal-state btor553)))
           (btor577
            (signal
             (concat (signal-value btor576) (signal-value btor575))
             (list)))
           (btor578
            (signal
             (extract 26 26 (signal-value btor553))
             (signal-state btor553)))
           (btor579
            (signal
             (concat (signal-value btor578) (signal-value btor577))
             (list)))
           (btor580
            (signal
             (extract 26 26 (signal-value btor553))
             (signal-state btor553)))
           (btor581
            (signal
             (concat (signal-value btor580) (signal-value btor579))
             (list)))
           (btor582
            (signal
             (extract 26 26 (signal-value btor553))
             (signal-state btor553)))
           (btor583
            (signal
             (concat (signal-value btor582) (signal-value btor581))
             (list)))
           (btor584
            (signal
             (extract 26 26 (signal-value btor553))
             (signal-state btor553)))
           (btor585
            (signal
             (concat (signal-value btor584) (signal-value btor583))
             (list)))
           (btor586
            (signal
             (extract 26 26 (signal-value btor553))
             (signal-state btor553)))
           (btor587
            (signal
             (concat (signal-value btor586) (signal-value btor585))
             (list)))
           (btor588
            (signal
             (extract 26 26 (signal-value btor553))
             (signal-state btor553)))
           (btor589
            (signal
             (concat (signal-value btor588) (signal-value btor587))
             (list)))
           (btor590
            (signal
             (extract 17 0 (signal-value btor552))
             (signal-state btor552)))
           (btor591
            (if (bitvector->bool (signal-value btor502)) btor590 btor525))
           (btor592
            (signal
             (extract 17 17 (signal-value btor591))
             (signal-state btor591)))
           (btor593
            (signal
             (concat (signal-value btor592) (signal-value btor591))
             (list)))
           (btor594
            (signal
             (extract 17 17 (signal-value btor591))
             (signal-state btor591)))
           (btor595
            (signal
             (concat (signal-value btor594) (signal-value btor593))
             (list)))
           (btor596
            (signal
             (extract 17 17 (signal-value btor591))
             (signal-state btor591)))
           (btor597
            (signal
             (concat (signal-value btor596) (signal-value btor595))
             (list)))
           (btor598
            (signal
             (extract 17 17 (signal-value btor591))
             (signal-state btor591)))
           (btor599
            (signal
             (concat (signal-value btor598) (signal-value btor597))
             (list)))
           (btor600
            (signal
             (extract 17 17 (signal-value btor591))
             (signal-state btor591)))
           (btor601
            (signal
             (concat (signal-value btor600) (signal-value btor599))
             (list)))
           (btor602
            (signal
             (extract 17 17 (signal-value btor591))
             (signal-state btor591)))
           (btor603
            (signal
             (concat (signal-value btor602) (signal-value btor601))
             (list)))
           (btor604
            (signal
             (extract 17 17 (signal-value btor591))
             (signal-state btor591)))
           (btor605
            (signal
             (concat (signal-value btor604) (signal-value btor603))
             (list)))
           (btor606
            (signal
             (extract 17 17 (signal-value btor591))
             (signal-state btor591)))
           (btor607
            (signal
             (concat (signal-value btor606) (signal-value btor605))
             (list)))
           (btor608
            (signal
             (extract 17 17 (signal-value btor591))
             (signal-state btor591)))
           (btor609
            (signal
             (concat (signal-value btor608) (signal-value btor607))
             (list)))
           (btor610
            (signal
             (extract 17 17 (signal-value btor591))
             (signal-state btor591)))
           (btor611
            (signal
             (concat (signal-value btor610) (signal-value btor609))
             (list)))
           (btor612
            (signal
             (extract 17 17 (signal-value btor591))
             (signal-state btor591)))
           (btor613
            (signal
             (concat (signal-value btor612) (signal-value btor611))
             (list)))
           (btor614
            (signal
             (extract 17 17 (signal-value btor591))
             (signal-state btor591)))
           (btor615
            (signal
             (concat (signal-value btor614) (signal-value btor613))
             (list)))
           (btor616
            (signal
             (extract 17 17 (signal-value btor591))
             (signal-state btor591)))
           (btor617
            (signal
             (concat (signal-value btor616) (signal-value btor615))
             (list)))
           (btor618
            (signal
             (extract 17 17 (signal-value btor591))
             (signal-state btor591)))
           (btor619
            (signal
             (concat (signal-value btor618) (signal-value btor617))
             (list)))
           (btor620
            (signal
             (extract 17 17 (signal-value btor591))
             (signal-state btor591)))
           (btor621
            (signal
             (concat (signal-value btor620) (signal-value btor619))
             (list)))
           (btor622
            (signal
             (extract 17 17 (signal-value btor591))
             (signal-state btor591)))
           (btor623
            (signal
             (concat (signal-value btor622) (signal-value btor621))
             (list)))
           (btor624
            (signal
             (extract 17 17 (signal-value btor591))
             (signal-state btor591)))
           (btor625
            (signal
             (concat (signal-value btor624) (signal-value btor623))
             (list)))
           (btor626
            (signal
             (extract 17 17 (signal-value btor591))
             (signal-state btor591)))
           (btor627
            (signal
             (concat (signal-value btor626) (signal-value btor625))
             (list)))
           (btor628
            (signal
             (extract 17 17 (signal-value btor591))
             (signal-state btor591)))
           (btor629
            (signal
             (concat (signal-value btor628) (signal-value btor627))
             (list)))
           (btor630
            (signal
             (extract 17 17 (signal-value btor591))
             (signal-state btor591)))
           (btor631
            (signal
             (concat (signal-value btor630) (signal-value btor629))
             (list)))
           (btor632
            (signal
             (extract 17 17 (signal-value btor591))
             (signal-state btor591)))
           (btor633
            (signal
             (concat (signal-value btor632) (signal-value btor631))
             (list)))
           (btor634
            (signal
             (extract 17 17 (signal-value btor591))
             (signal-state btor591)))
           (btor635
            (signal
             (concat (signal-value btor634) (signal-value btor633))
             (list)))
           (btor636
            (signal
             (extract 17 17 (signal-value btor591))
             (signal-state btor591)))
           (btor637
            (signal
             (concat (signal-value btor636) (signal-value btor635))
             (list)))
           (btor638
            (signal
             (extract 17 17 (signal-value btor591))
             (signal-state btor591)))
           (btor639
            (signal
             (concat (signal-value btor638) (signal-value btor637))
             (list)))
           (btor640
            (signal
             (extract 17 17 (signal-value btor591))
             (signal-state btor591)))
           (btor641
            (signal
             (concat (signal-value btor640) (signal-value btor639))
             (list)))
           (btor642
            (signal
             (extract 17 17 (signal-value btor591))
             (signal-state btor591)))
           (btor643
            (signal
             (concat (signal-value btor642) (signal-value btor641))
             (list)))
           (btor644
            (signal
             (extract 17 17 (signal-value btor591))
             (signal-state btor591)))
           (btor645
            (signal
             (concat (signal-value btor644) (signal-value btor643))
             (list)))
           (btor646
            (signal
             (bvmul (signal-value btor589) (signal-value btor645))
             (list)))
           (btor647 (bv->signal (bv 0 (bitvector 45))))
           (btor648
            (if (bitvector->bool (signal-value btor515)) btor647 btor646))
           (btor649
            (signal
             (extract 43 0 (signal-value btor648))
             (signal-state btor648)))
           (btor650 (bv->signal (bv 5864062014805 (bitvector 43))))
           (btor651
            (bv->signal
             (zero-extend (signal-value btor650) (bitvector 44))
             btor650))
           (btor652
            (signal
             (bvand (signal-value btor649) (signal-value btor651))
             (list)))
           (btor653
            (signal
             (concat (signal-value btor97) (signal-value btor652))
             (list)))
           (btor654
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'U_DATA_reg)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'U_DATA_reg)))
                     ((assoc-has-key? init-hash 'U_DATA_reg)
                      (bv->signal (assoc-ref init-hash 'U_DATA_reg)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 45))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor655
            (signal (extract 0 0 (signal-value btor69)) (signal-state btor69)))
           (btor656
            (if (bitvector->bool (signal-value btor655)) btor654 btor653))
           (btor657
            (signal
             (apply bvor (bitvector->bits (signal-value btor166)))
             (signal-state btor166)))
           (btor658 (signal (bvnot (signal-value btor657)) (list)))
           (btor659
            (if (bitvector->bool (signal-value btor658)) btor656 btor446))
           (btor660
            (signal
             (extract 44 44 (signal-value btor659))
             (signal-state btor659)))
           (btor661
            (signal
             (concat (signal-value btor660) (signal-value btor659))
             (list)))
           (btor662
            (signal
             (extract 44 44 (signal-value btor659))
             (signal-state btor659)))
           (btor663
            (signal
             (concat (signal-value btor662) (signal-value btor661))
             (list)))
           (btor664
            (signal
             (extract 44 44 (signal-value btor659))
             (signal-state btor659)))
           (btor665
            (signal
             (concat (signal-value btor664) (signal-value btor663))
             (list)))
           (btor666
            (bv->signal
             (zero-extend (signal-value btor97) (bitvector 2))
             btor97))
           (btor667
            (signal
             (bool->bitvector
              (bveq (signal-value btor441) (signal-value btor666)))
             (list)))
           (btor668
            (if (bitvector->bool (signal-value btor667)) btor665 btor445))
           (btor669
            (signal
             (concat (signal-value btor70) (signal-value btor96))
             (list)))
           (btor670
            (if (bitvector->bool (signal-value btor419)) btor669 btor154))
           (btor671 (bv->signal (bv 0 (bitvector 46))))
           (btor672
            (signal
             (concat (signal-value btor671) (signal-value btor670))
             (list)))
           (btor673
            (signal
             (apply bvor (bitvector->bits (signal-value btor441)))
             (signal-state btor441)))
           (btor674 (signal (bvnot (signal-value btor673)) (list)))
           (btor675
            (if (bitvector->bool (signal-value btor674)) btor672 btor668))
           (btor676
            (signal
             (bvxor (signal-value btor438) (signal-value btor675))
             (list)))
           (btor677 unnamed-input-677)
           (btor678
            (signal
             (extract 3 2 (signal-value btor374))
             (signal-state btor374)))
           (btor679
            (signal
             (bool->bitvector
              (bveq (signal-value btor678) (signal-value btor376)))
             (list)))
           (btor680
            (if (bitvector->bool (signal-value btor679)) btor427 btor677))
           (btor681 (bv->signal (bv 281474976710655 (bitvector 48))))
           (btor682
            (signal
             (bool->bitvector
              (bveq (signal-value btor678) (signal-value btor155)))
             (list)))
           (btor683
            (if (bitvector->bool (signal-value btor682)) btor681 btor680))
           (btor684 (bv->signal (bv 11728124029610 (bitvector 44))))
           (btor685
            (signal
             (bvand (signal-value btor649) (signal-value btor684))
             (list)))
           (btor686
            (signal
             (extract 44 44 (signal-value btor648))
             (signal-state btor648)))
           (btor687 (signal (bvnot (signal-value btor686)) (list)))
           (btor688
            (signal
             (concat (signal-value btor687) (signal-value btor685))
             (list)))
           (btor689
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'V_DATA_reg)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'V_DATA_reg)))
                     ((assoc-has-key? init-hash 'V_DATA_reg)
                      (bv->signal (assoc-ref init-hash 'V_DATA_reg)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 45))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor690
            (if (bitvector->bool (signal-value btor655)) btor689 btor688))
           (btor691
            (if (bitvector->bool (signal-value btor658)) btor690 btor446))
           (btor692
            (signal
             (concat (signal-value btor477) (signal-value btor691))
             (list)))
           (btor693
            (bv->signal
             (zero-extend (signal-value btor97) (bitvector 2))
             btor97))
           (btor694
            (signal
             (bool->bitvector
              (bveq (signal-value btor678) (signal-value btor693)))
             (list)))
           (btor695
            (if (bitvector->bool (signal-value btor694)) btor692 btor683))
           (btor696
            (signal
             (apply bvor (bitvector->bits (signal-value btor678)))
             (signal-state btor678)))
           (btor697 (signal (bvnot (signal-value btor696)) (list)))
           (btor698
            (if (bitvector->bool (signal-value btor697)) btor434 btor695))
           (btor699
            (signal
             (bvxor (signal-value btor676) (signal-value btor698))
             (list)))
           (btor700
            (signal
             (bvand (signal-value btor675) (signal-value btor698))
             (list)))
           (btor701
            (signal
             (bvand (signal-value btor438) (signal-value btor698))
             (list)))
           (btor702
            (signal
             (bvor (signal-value btor700) (signal-value btor701))
             (list)))
           (btor703
            (signal
             (bvand (signal-value btor675) (signal-value btor438))
             (list)))
           (btor704
            (signal
             (bvor (signal-value btor702) (signal-value btor703))
             (list)))
           (btor705
            (signal
             (extract 3 3 (signal-value btor149))
             (signal-state btor149)))
           (btor706
            (if (bitvector->bool (signal-value btor705)) btor704 btor699))
           (btor707
            (signal
             (extract 2 2 (signal-value btor149))
             (signal-state btor149)))
           (btor708
            (if (bitvector->bool (signal-value btor707)) btor434 btor704))
           (btor709
            (signal
             (extract 11 11 (signal-value btor708))
             (signal-state btor708)))
           (btor710
            (signal
             (bvand (signal-value btor709) (signal-value btor168))
             (list)))
           (btor711
            (signal
             (extract 23 23 (signal-value btor708))
             (signal-state btor708)))
           (btor712
            (signal
             (bvand (signal-value btor711) (signal-value btor658))
             (list)))
           (btor713
            (signal
             (extract 35 35 (signal-value btor708))
             (signal-state btor708)))
           (btor714
            (signal
             (bvand (signal-value btor713) (signal-value btor168))
             (list)))
           (btor715
            (signal
             (extract 10 0 (signal-value btor708))
             (signal-state btor708)))
           (btor716
            (signal
             (concat (signal-value btor715) (signal-value btor96))
             (list)))
           (btor717
            (signal
             (concat (signal-value btor710) (signal-value btor716))
             (list)))
           (btor718
            (signal
             (extract 22 12 (signal-value btor708))
             (signal-state btor708)))
           (btor719
            (signal
             (concat (signal-value btor718) (signal-value btor717))
             (list)))
           (btor720
            (signal
             (concat (signal-value btor712) (signal-value btor719))
             (list)))
           (btor721
            (signal
             (extract 34 24 (signal-value btor708))
             (signal-state btor708)))
           (btor722
            (signal
             (concat (signal-value btor721) (signal-value btor720))
             (list)))
           (btor723
            (signal
             (concat (signal-value btor714) (signal-value btor722))
             (list)))
           (btor724
            (signal
             (extract 46 36 (signal-value btor708))
             (signal-state btor708)))
           (btor725
            (signal
             (concat (signal-value btor724) (signal-value btor723))
             (list)))
           (btor726
            (signal
             (bvand (signal-value btor706) (signal-value btor725))
             (list)))
           (btor727 unnamed-input-727)
           (btor728
            (signal
             (extract 8 7 (signal-value btor374))
             (signal-state btor374)))
           (btor729
            (signal
             (bool->bitvector
              (bveq (signal-value btor728) (signal-value btor376)))
             (list)))
           (btor730
            (if (bitvector->bool (signal-value btor729)) btor427 btor727))
           (btor731
            (signal
             (bool->bitvector
              (bveq (signal-value btor728) (signal-value btor155)))
             (list)))
           (btor732
            (if (bitvector->bool (signal-value btor731)) btor77 btor730))
           (btor733
            (bv->signal
             (zero-extend (signal-value btor97) (bitvector 2))
             btor97))
           (btor734
            (signal
             (bool->bitvector
              (bveq (signal-value btor728) (signal-value btor733)))
             (list)))
           (btor735
            (if (bitvector->bool (signal-value btor734)) btor301 btor732))
           (btor736
            (signal
             (apply bvor (bitvector->bits (signal-value btor728)))
             (signal-state btor728)))
           (btor737 (signal (bvnot (signal-value btor736)) (list)))
           (btor738
            (if (bitvector->bool (signal-value btor737)) btor434 btor735))
           (btor739
            (signal
             (bvand (signal-value btor738) (signal-value btor725))
             (list)))
           (btor740
            (signal
             (bvor (signal-value btor726) (signal-value btor739))
             (list)))
           (btor741
            (signal
             (bvand (signal-value btor706) (signal-value btor738))
             (list)))
           (btor742
            (signal
             (bvor (signal-value btor740) (signal-value btor741))
             (list)))
           (btor743
            (signal
             (extract 35 35 (signal-value btor742))
             (signal-state btor742)))
           (btor744
            (signal
             (bvand (signal-value btor168) (signal-value btor743))
             (list)))
           (btor745
            (signal
             (extract 47 36 (signal-value btor742))
             (signal-state btor742)))
           (btor746
            (signal
             (concat (signal-value btor745) (signal-value btor744))
             (list)))
           (btor747
            (bv->signal
             (zero-extend (signal-value btor746) (bitvector 14))
             btor746))
           (btor748
            (signal
             (bvxor (signal-value btor706) (signal-value btor725))
             (list)))
           (btor749
            (signal
             (bvxor (signal-value btor748) (signal-value btor738))
             (list)))
           (btor750
            (signal
             (extract 47 36 (signal-value btor749))
             (signal-state btor749)))
           (btor751
            (signal
             (extract 47 47 (signal-value btor708))
             (signal-state btor708)))
           (btor752
            (signal
             (concat (signal-value btor751) (signal-value btor750))
             (list)))
           (btor753
            (bv->signal
             (zero-extend (signal-value btor752) (bitvector 14))
             btor752))
           (btor754
            (signal
             (bvadd (signal-value btor747) (signal-value btor753))
             (list)))
           (btor755
            (signal
             (extract 23 23 (signal-value btor742))
             (signal-state btor742)))
           (btor756
            (signal
             (bvand (signal-value btor658) (signal-value btor755))
             (list)))
           (btor757
            (signal
             (extract 34 24 (signal-value btor742))
             (signal-state btor742)))
           (btor758
            (signal
             (concat (signal-value btor757) (signal-value btor756))
             (list)))
           (btor759
            (bv->signal
             (zero-extend (signal-value btor758) (bitvector 13))
             btor758))
           (btor760
            (signal
             (extract 35 24 (signal-value btor749))
             (signal-state btor749)))
           (btor761
            (bv->signal
             (zero-extend (signal-value btor760) (bitvector 13))
             btor760))
           (btor762
            (signal
             (bvadd (signal-value btor759) (signal-value btor761))
             (list)))
           (btor763
            (signal
             (extract 11 11 (signal-value btor742))
             (signal-state btor742)))
           (btor764
            (signal
             (bvand (signal-value btor168) (signal-value btor763))
             (list)))
           (btor765
            (signal
             (extract 22 12 (signal-value btor742))
             (signal-state btor742)))
           (btor766
            (signal
             (concat (signal-value btor765) (signal-value btor764))
             (list)))
           (btor767
            (bv->signal
             (zero-extend (signal-value btor766) (bitvector 13))
             btor766))
           (btor768
            (signal
             (extract 23 12 (signal-value btor749))
             (signal-state btor749)))
           (btor769
            (bv->signal
             (zero-extend (signal-value btor768) (bitvector 13))
             btor768))
           (btor770
            (signal
             (bvadd (signal-value btor767) (signal-value btor769))
             (list)))
           (btor771 unnamed-input-771)
           (btor772
            (signal
             (extract 47 47 (signal-value btor301))
             (signal-state btor301)))
           (btor773 (signal (bvnot (signal-value btor772)) (list)))
           (btor774
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'CARRYINSEL_reg)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'CARRYINSEL_reg)))
                     ((assoc-has-key? init-hash 'CARRYINSEL_reg)
                      (bv->signal (assoc-ref init-hash 'CARRYINSEL_reg)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 3))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor775
            (signal (extract 0 0 (signal-value btor31)) (signal-state btor31)))
           (btor776
            (if (bitvector->bool (signal-value btor775)) btor774 btor30))
           (btor777
            (signal
             (bool->bitvector
              (bveq (signal-value btor776) (signal-value btor102)))
             (list)))
           (btor778
            (if (bitvector->bool (signal-value btor777)) btor773 btor771))
           (btor779
            (signal
             (extract 26 26 (signal-value btor553))
             (signal-state btor553)))
           (btor780
            (signal
             (extract 17 17 (signal-value btor591))
             (signal-state btor591)))
           (btor781
            (signal
             (bvxor (signal-value btor779) (signal-value btor780))
             (list)))
           (btor782 (signal (bvnot (signal-value btor781)) (list)))
           (btor783
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'qmultcarryin)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'qmultcarryin)))
                     ((assoc-has-key? init-hash 'qmultcarryin)
                      (bv->signal (assoc-ref init-hash 'qmultcarryin)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor784
            (if (bitvector->bool (signal-value btor655)) btor783 btor782))
           (btor785 (signal (bvnot (signal-value btor784)) (list)))
           (btor786 (bv->signal (bv 6 (bitvector 3))))
           (btor787
            (signal
             (bool->bitvector
              (bveq (signal-value btor776) (signal-value btor786)))
             (list)))
           (btor788
            (if (bitvector->bool (signal-value btor787)) btor785 btor778))
           (btor789
            (signal
             (bool->bitvector
              (bveq (signal-value btor776) (signal-value btor415)))
             (list)))
           (btor790
            (if (bitvector->bool (signal-value btor789)) btor772 btor788))
           (btor791
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'ALUMODE10_reg)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'ALUMODE10_reg)))
                     ((assoc-has-key? init-hash 'ALUMODE10_reg)
                      (bv->signal (assoc-ref init-hash 'ALUMODE10_reg)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor792
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'COUT_reg)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'COUT_reg)))
                     ((assoc-has-key? init-hash 'COUT_reg)
                      (bv->signal (assoc-ref init-hash 'COUT_reg)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 4))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor793
            (signal
             (extract 3 3 (signal-value btor792))
             (signal-state btor792)))
           (btor794
            (signal
             (bvxor (signal-value btor791) (signal-value btor793))
             (list)))
           (btor795 (signal (bvnot (signal-value btor794)) (list)))
           (btor796
            (signal
             (bool->bitvector
              (bveq (signal-value btor776) (signal-value btor418)))
             (list)))
           (btor797
            (if (bitvector->bool (signal-value btor796)) btor795 btor790))
           (btor798
            (signal
             (extract 47 47 (signal-value btor74))
             (signal-state btor74)))
           (btor799 (signal (bvnot (signal-value btor798)) (list)))
           (btor800
            (bv->signal
             (zero-extend (signal-value btor376) (bitvector 3))
             btor376))
           (btor801
            (signal
             (bool->bitvector
              (bveq (signal-value btor776) (signal-value btor800)))
             (list)))
           (btor802
            (if (bitvector->bool (signal-value btor801)) btor799 btor797))
           (btor803 (signal (bvnot (signal-value btor26)) (list)))
           (btor804
            (bv->signal
             (zero-extend (signal-value btor155) (bitvector 3))
             btor155))
           (btor805
            (signal
             (bool->bitvector
              (bveq (signal-value btor776) (signal-value btor804)))
             (list)))
           (btor806
            (if (bitvector->bool (signal-value btor805)) btor803 btor802))
           (btor807
            (bv->signal
             (zero-extend (signal-value btor97) (bitvector 3))
             btor97))
           (btor808
            (signal
             (bool->bitvector
              (bveq (signal-value btor776) (signal-value btor807)))
             (list)))
           (btor809
            (if (bitvector->bool (signal-value btor808)) btor798 btor806))
           (btor810
            (signal
             (bvxor (signal-value btor27) (signal-value btor53))
             (list)))
           (btor811
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'CARRYIN_reg)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'CARRYIN_reg)))
                     ((assoc-has-key? init-hash 'CARRYIN_reg)
                      (bv->signal (assoc-ref init-hash 'CARRYIN_reg)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor812
            (signal (extract 0 0 (signal-value btor28)) (signal-state btor28)))
           (btor813
            (if (bitvector->bool (signal-value btor812)) btor811 btor810))
           (btor814 (signal (bvnot (signal-value btor813)) (list)))
           (btor815
            (signal
             (apply bvor (bitvector->bits (signal-value btor776)))
             (signal-state btor776)))
           (btor816 (signal (bvnot (signal-value btor815)) (list)))
           (btor817
            (if (bitvector->bool (signal-value btor816)) btor814 btor809))
           (btor818 (signal (bvnot (signal-value btor817)) (list)))
           (btor819
            (signal
             (bvor (signal-value btor705) (signal-value btor707))
             (list)))
           (btor820
            (if (bitvector->bool (signal-value btor819)) btor96 btor818))
           (btor821
            (signal
             (extract 10 0 (signal-value btor742))
             (signal-state btor742)))
           (btor822
            (signal
             (concat (signal-value btor821) (signal-value btor820))
             (list)))
           (btor823
            (bv->signal
             (zero-extend (signal-value btor822) (bitvector 13))
             btor822))
           (btor824
            (signal
             (extract 11 0 (signal-value btor749))
             (signal-state btor749)))
           (btor825
            (bv->signal
             (zero-extend (signal-value btor824) (bitvector 13))
             btor824))
           (btor826
            (signal
             (bvadd (signal-value btor823) (signal-value btor825))
             (list)))
           (btor827
            (signal
             (extract 12 12 (signal-value btor826))
             (signal-state btor826)))
           (btor828
            (signal
             (bvand (signal-value btor168) (signal-value btor827))
             (list)))
           (btor829
            (bv->signal
             (zero-extend (signal-value btor828) (bitvector 13))
             btor828))
           (btor830
            (signal
             (bvadd (signal-value btor770) (signal-value btor829))
             (list)))
           (btor831
            (signal
             (extract 12 12 (signal-value btor830))
             (signal-state btor830)))
           (btor832
            (signal
             (bvand (signal-value btor658) (signal-value btor831))
             (list)))
           (btor833
            (bv->signal
             (zero-extend (signal-value btor832) (bitvector 13))
             btor832))
           (btor834
            (signal
             (bvadd (signal-value btor762) (signal-value btor833))
             (list)))
           (btor835
            (signal
             (extract 12 12 (signal-value btor834))
             (signal-state btor834)))
           (btor836
            (signal
             (bvand (signal-value btor168) (signal-value btor835))
             (list)))
           (btor837
            (bv->signal
             (zero-extend (signal-value btor836) (bitvector 14))
             btor836))
           (btor838
            (signal
             (bvadd (signal-value btor754) (signal-value btor837))
             (list)))
           (btor839
            (signal
             (extract 12 12 (signal-value btor838))
             (signal-state btor838)))
           (btor840
            (signal
             (bvxor (signal-value btor152) (signal-value btor839))
             (list)))
           (btor841
            (signal
             (bvxor (signal-value btor152) (signal-value btor840))
             (list)))
           (btor842
            (signal (extract 0 0 (signal-value btor76)) (signal-state btor76)))
           (btor843
            (if (bitvector->bool (signal-value btor842)) btor794 btor841))
           (btor845
            (signal
             (bvxor (signal-value btor763) (signal-value btor827))
             (list)))
           (btor846
            (signal
             (bvxor (signal-value btor845) (signal-value btor709))
             (list)))
           (btor847
            (signal
             (bvxor (signal-value btor152) (signal-value btor846))
             (list)))
           (btor848
            (signal
             (extract 3 0 (signal-value btor374))
             (signal-state btor374)))
           (btor849
            (bv->signal
             (zero-extend (signal-value btor415) (bitvector 4))
             btor415))
           (btor850
            (signal
             (bool->bitvector
              (bveq (signal-value btor848) (signal-value btor849)))
             (list)))
           (btor851
            (signal
             (extract 3 2 (signal-value btor149))
             (signal-state btor149)))
           (btor852
            (signal
             (apply bvor (bitvector->bits (signal-value btor851)))
             (signal-state btor851)))
           (btor853
            (signal
             (bvor (signal-value btor850) (signal-value btor852))
             (list)))
           (btor854
            (if (bitvector->bool (signal-value btor853)) btor96 btor847))
           (btor855
            (bv->signal
             (zero-extend (signal-value btor97) (bitvector 2))
             btor97))
           (btor856
            (signal
             (bool->bitvector
              (bveq (signal-value btor166) (signal-value btor855)))
             (list)))
           (btor857
            (if (bitvector->bool (signal-value btor856)) btor854 btor96))
           (btor858
            (signal
             (bvxor (signal-value btor755) (signal-value btor831))
             (list)))
           (btor859
            (signal
             (bvxor (signal-value btor858) (signal-value btor711))
             (list)))
           (btor860
            (signal
             (bvxor (signal-value btor152) (signal-value btor859))
             (list)))
           (btor861
            (if (bitvector->bool (signal-value btor853)) btor96 btor860))
           (btor862
            (signal
             (apply bvor (bitvector->bits (signal-value btor166)))
             (signal-state btor166)))
           (btor863
            (if (bitvector->bool (signal-value btor862)) btor861 btor96))
           (btor864
            (signal
             (bvxor (signal-value btor743) (signal-value btor835))
             (list)))
           (btor865
            (signal
             (bvxor (signal-value btor864) (signal-value btor713))
             (list)))
           (btor866
            (signal
             (bvxor (signal-value btor152) (signal-value btor865))
             (list)))
           (btor867
            (if (bitvector->bool (signal-value btor853)) btor96 btor866))
           (btor868
            (if (bitvector->bool (signal-value btor856)) btor867 btor96))
           (btor869
            (signal
             (concat (signal-value btor863) (signal-value btor857))
             (list)))
           (btor870
            (signal
             (concat (signal-value btor868) (signal-value btor869))
             (list)))
           (btor871
            (signal
             (concat (signal-value btor840) (signal-value btor870))
             (list)))
           (btor872
            (if (bitvector->bool (signal-value btor842)) btor792 btor871))
           (btor874
            (signal
             (extract 13 13 (signal-value btor838))
             (signal-state btor838)))
           (btor875
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       'MULTSIGN_ALU_reg)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'MULTSIGN_ALU_reg)))
                     ((assoc-has-key? init-hash 'MULTSIGN_ALU_reg)
                      (bv->signal (assoc-ref init-hash 'MULTSIGN_ALU_reg)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor876
            (if (bitvector->bool (signal-value btor842)) btor875 btor874))
           (btor878 (bv->signal (bv 17 (bitvector 5))))
           (btor879
            (signal
             (bool->bitvector
              (bveq (signal-value btor89) (signal-value btor878)))
             (list)))
           (btor880
            (if (bitvector->bool (signal-value btor879)) btor97 btor96))
           (btor881 (bv->signal (bv 9 (bitvector 4))))
           (btor882
            (bv->signal
             (zero-extend (signal-value btor881) (bitvector 5))
             btor881))
           (btor883
            (signal
             (bool->bitvector
              (bveq (signal-value btor89) (signal-value btor882)))
             (list)))
           (btor884
            (if (bitvector->bool (signal-value btor883)) btor96 btor880))
           (btor885
            (if (bitvector->bool (signal-value btor884)) btor427 btor73))
           (btor886
            (signal
             (extract 1 1 (signal-value btor149))
             (signal-state btor149)))
           (btor887
            (signal
             (extract 1 1 (signal-value btor149))
             (signal-state btor149)))
           (btor888
            (signal
             (concat (signal-value btor887) (signal-value btor886))
             (list)))
           (btor889
            (signal
             (extract 1 1 (signal-value btor149))
             (signal-state btor149)))
           (btor890
            (signal
             (concat (signal-value btor889) (signal-value btor888))
             (list)))
           (btor891
            (signal
             (extract 1 1 (signal-value btor149))
             (signal-state btor149)))
           (btor892
            (signal
             (concat (signal-value btor891) (signal-value btor890))
             (list)))
           (btor893
            (signal
             (extract 1 1 (signal-value btor149))
             (signal-state btor149)))
           (btor894
            (signal
             (concat (signal-value btor893) (signal-value btor892))
             (list)))
           (btor895
            (signal
             (extract 1 1 (signal-value btor149))
             (signal-state btor149)))
           (btor896
            (signal
             (concat (signal-value btor895) (signal-value btor894))
             (list)))
           (btor897
            (signal
             (extract 1 1 (signal-value btor149))
             (signal-state btor149)))
           (btor898
            (signal
             (concat (signal-value btor897) (signal-value btor896))
             (list)))
           (btor899
            (signal
             (extract 1 1 (signal-value btor149))
             (signal-state btor149)))
           (btor900
            (signal
             (concat (signal-value btor899) (signal-value btor898))
             (list)))
           (btor901
            (signal
             (extract 1 1 (signal-value btor149))
             (signal-state btor149)))
           (btor902
            (signal
             (concat (signal-value btor901) (signal-value btor900))
             (list)))
           (btor903
            (signal
             (extract 1 1 (signal-value btor149))
             (signal-state btor149)))
           (btor904
            (signal
             (concat (signal-value btor903) (signal-value btor902))
             (list)))
           (btor905
            (signal
             (extract 1 1 (signal-value btor149))
             (signal-state btor149)))
           (btor906
            (signal
             (concat (signal-value btor905) (signal-value btor904))
             (list)))
           (btor907
            (signal
             (extract 1 1 (signal-value btor149))
             (signal-state btor149)))
           (btor908
            (signal
             (concat (signal-value btor907) (signal-value btor906))
             (list)))
           (btor909
            (signal
             (extract 1 1 (signal-value btor149))
             (signal-state btor149)))
           (btor910
            (signal
             (concat (signal-value btor909) (signal-value btor908))
             (list)))
           (btor911
            (signal
             (extract 1 1 (signal-value btor149))
             (signal-state btor149)))
           (btor912
            (signal
             (concat (signal-value btor911) (signal-value btor910))
             (list)))
           (btor913
            (signal
             (extract 1 1 (signal-value btor149))
             (signal-state btor149)))
           (btor914
            (signal
             (concat (signal-value btor913) (signal-value btor912))
             (list)))
           (btor915
            (signal
             (extract 1 1 (signal-value btor149))
             (signal-state btor149)))
           (btor916
            (signal
             (concat (signal-value btor915) (signal-value btor914))
             (list)))
           (btor917
            (signal
             (extract 1 1 (signal-value btor149))
             (signal-state btor149)))
           (btor918
            (signal
             (concat (signal-value btor917) (signal-value btor916))
             (list)))
           (btor919
            (signal
             (extract 1 1 (signal-value btor149))
             (signal-state btor149)))
           (btor920
            (signal
             (concat (signal-value btor919) (signal-value btor918))
             (list)))
           (btor921
            (signal
             (extract 1 1 (signal-value btor149))
             (signal-state btor149)))
           (btor922
            (signal
             (concat (signal-value btor921) (signal-value btor920))
             (list)))
           (btor923
            (signal
             (extract 1 1 (signal-value btor149))
             (signal-state btor149)))
           (btor924
            (signal
             (concat (signal-value btor923) (signal-value btor922))
             (list)))
           (btor925
            (signal
             (extract 1 1 (signal-value btor149))
             (signal-state btor149)))
           (btor926
            (signal
             (concat (signal-value btor925) (signal-value btor924))
             (list)))
           (btor927
            (signal
             (extract 1 1 (signal-value btor149))
             (signal-state btor149)))
           (btor928
            (signal
             (concat (signal-value btor927) (signal-value btor926))
             (list)))
           (btor929
            (signal
             (extract 1 1 (signal-value btor149))
             (signal-state btor149)))
           (btor930
            (signal
             (concat (signal-value btor929) (signal-value btor928))
             (list)))
           (btor931
            (signal
             (extract 1 1 (signal-value btor149))
             (signal-state btor149)))
           (btor932
            (signal
             (concat (signal-value btor931) (signal-value btor930))
             (list)))
           (btor933
            (signal
             (extract 1 1 (signal-value btor149))
             (signal-state btor149)))
           (btor934
            (signal
             (concat (signal-value btor933) (signal-value btor932))
             (list)))
           (btor935
            (signal
             (extract 1 1 (signal-value btor149))
             (signal-state btor149)))
           (btor936
            (signal
             (concat (signal-value btor935) (signal-value btor934))
             (list)))
           (btor937
            (signal
             (extract 1 1 (signal-value btor149))
             (signal-state btor149)))
           (btor938
            (signal
             (concat (signal-value btor937) (signal-value btor936))
             (list)))
           (btor939
            (signal
             (extract 1 1 (signal-value btor149))
             (signal-state btor149)))
           (btor940
            (signal
             (concat (signal-value btor939) (signal-value btor938))
             (list)))
           (btor941
            (signal
             (extract 1 1 (signal-value btor149))
             (signal-state btor149)))
           (btor942
            (signal
             (concat (signal-value btor941) (signal-value btor940))
             (list)))
           (btor943
            (signal
             (extract 1 1 (signal-value btor149))
             (signal-state btor149)))
           (btor944
            (signal
             (concat (signal-value btor943) (signal-value btor942))
             (list)))
           (btor945
            (signal
             (extract 1 1 (signal-value btor149))
             (signal-state btor149)))
           (btor946
            (signal
             (concat (signal-value btor945) (signal-value btor944))
             (list)))
           (btor947
            (signal
             (extract 1 1 (signal-value btor149))
             (signal-state btor149)))
           (btor948
            (signal
             (concat (signal-value btor947) (signal-value btor946))
             (list)))
           (btor949
            (signal
             (extract 1 1 (signal-value btor149))
             (signal-state btor149)))
           (btor950
            (signal
             (concat (signal-value btor949) (signal-value btor948))
             (list)))
           (btor951
            (signal
             (extract 1 1 (signal-value btor149))
             (signal-state btor149)))
           (btor952
            (signal
             (concat (signal-value btor951) (signal-value btor950))
             (list)))
           (btor953
            (signal
             (extract 1 1 (signal-value btor149))
             (signal-state btor149)))
           (btor954
            (signal
             (concat (signal-value btor953) (signal-value btor952))
             (list)))
           (btor955
            (signal
             (extract 1 1 (signal-value btor149))
             (signal-state btor149)))
           (btor956
            (signal
             (concat (signal-value btor955) (signal-value btor954))
             (list)))
           (btor957
            (signal
             (extract 1 1 (signal-value btor149))
             (signal-state btor149)))
           (btor958
            (signal
             (concat (signal-value btor957) (signal-value btor956))
             (list)))
           (btor959
            (signal
             (extract 1 1 (signal-value btor149))
             (signal-state btor149)))
           (btor960
            (signal
             (concat (signal-value btor959) (signal-value btor958))
             (list)))
           (btor961
            (signal
             (extract 1 1 (signal-value btor149))
             (signal-state btor149)))
           (btor962
            (signal
             (concat (signal-value btor961) (signal-value btor960))
             (list)))
           (btor963
            (signal
             (extract 1 1 (signal-value btor149))
             (signal-state btor149)))
           (btor964
            (signal
             (concat (signal-value btor963) (signal-value btor962))
             (list)))
           (btor965
            (signal
             (extract 1 1 (signal-value btor149))
             (signal-state btor149)))
           (btor966
            (signal
             (concat (signal-value btor965) (signal-value btor964))
             (list)))
           (btor967
            (signal
             (extract 1 1 (signal-value btor149))
             (signal-state btor149)))
           (btor968
            (signal
             (concat (signal-value btor967) (signal-value btor966))
             (list)))
           (btor969
            (signal
             (extract 1 1 (signal-value btor149))
             (signal-state btor149)))
           (btor970
            (signal
             (concat (signal-value btor969) (signal-value btor968))
             (list)))
           (btor971
            (signal
             (extract 1 1 (signal-value btor149))
             (signal-state btor149)))
           (btor972
            (signal
             (concat (signal-value btor971) (signal-value btor970))
             (list)))
           (btor973
            (signal
             (extract 1 1 (signal-value btor149))
             (signal-state btor149)))
           (btor974
            (signal
             (concat (signal-value btor973) (signal-value btor972))
             (list)))
           (btor975
            (signal
             (extract 1 1 (signal-value btor149))
             (signal-state btor149)))
           (btor976
            (signal
             (concat (signal-value btor975) (signal-value btor974))
             (list)))
           (btor977
            (signal
             (extract 1 1 (signal-value btor149))
             (signal-state btor149)))
           (btor978
            (signal
             (concat (signal-value btor977) (signal-value btor976))
             (list)))
           (btor979
            (signal
             (extract 1 1 (signal-value btor149))
             (signal-state btor149)))
           (btor980
            (signal
             (concat (signal-value btor979) (signal-value btor978))
             (list)))
           (btor981
            (signal
             (extract 11 0 (signal-value btor826))
             (signal-state btor826)))
           (btor982
            (signal
             (extract 11 0 (signal-value btor830))
             (signal-state btor830)))
           (btor983
            (signal
             (concat (signal-value btor982) (signal-value btor981))
             (list)))
           (btor984
            (signal
             (extract 11 0 (signal-value btor834))
             (signal-state btor834)))
           (btor985
            (signal
             (concat (signal-value btor984) (signal-value btor983))
             (list)))
           (btor986
            (signal
             (extract 11 0 (signal-value btor838))
             (signal-state btor838)))
           (btor987
            (signal
             (concat (signal-value btor986) (signal-value btor985))
             (list)))
           (btor988
            (signal
             (bvxor (signal-value btor980) (signal-value btor987))
             (list)))
           (btor989
            (signal
             (bvxor (signal-value btor885) (signal-value btor988))
             (list)))
           (btor990 (signal (bvnot (signal-value btor989)) (list)))
           (btor991
            (signal
             (extract 45 0 (signal-value btor427))
             (signal-state btor427)))
           (btor992 (signal (bvnot (signal-value btor991)) (list)))
           (btor993
            (signal
             (concat (signal-value btor992) (signal-value btor154))
             (list)))
           (btor994 (bv->signal (bv 23 (bitvector 5))))
           (btor995
            (signal
             (bool->bitvector
              (bveq (signal-value btor88) (signal-value btor994)))
             (list)))
           (btor996
            (if (bitvector->bool (signal-value btor995)) btor376 btor154))
           (btor997 (bv->signal (bv 22 (bitvector 5))))
           (btor998
            (signal
             (bool->bitvector
              (bveq (signal-value btor88) (signal-value btor997)))
             (list)))
           (btor999
            (if (bitvector->bool (signal-value btor998)) btor155 btor996))
           (btor1000
            (signal
             (bool->bitvector
              (bveq (signal-value btor88) (signal-value btor878)))
             (list)))
           (btor1001
            (if (bitvector->bool (signal-value btor1000)) btor159 btor999))
           (btor1002 (bv->signal (bv 8 (bitvector 4))))
           (btor1003
            (bv->signal
             (zero-extend (signal-value btor1002) (bitvector 5))
             btor1002))
           (btor1004
            (signal
             (bool->bitvector
              (bveq (signal-value btor88) (signal-value btor1003)))
             (list)))
           (btor1005
            (if (bitvector->bool (signal-value btor1004)) btor154 btor1001))
           (btor1006
            (signal
             (bool->bitvector
              (bveq (signal-value btor1005) (signal-value btor376)))
             (list)))
           (btor1007
            (if (bitvector->bool (signal-value btor1006)) btor993 btor68))
           (btor1008
            (signal
             (extract 46 0 (signal-value btor427))
             (signal-state btor427)))
           (btor1009 (signal (bvnot (signal-value btor1008)) (list)))
           (btor1010
            (signal
             (concat (signal-value btor1009) (signal-value btor96))
             (list)))
           (btor1011
            (signal
             (bool->bitvector
              (bveq (signal-value btor1005) (signal-value btor155)))
             (list)))
           (btor1012
            (if (bitvector->bool (signal-value btor1011)) btor1010 btor1007))
           (btor1013
            (bv->signal
             (zero-extend (signal-value btor97) (bitvector 2))
             btor97))
           (btor1014
            (signal
             (bool->bitvector
              (bveq (signal-value btor1005) (signal-value btor1013)))
             (list)))
           (btor1015
            (if (bitvector->bool (signal-value btor1014)) btor427 btor1012))
           (btor1016 (bv->signal (bv 21 (bitvector 5))))
           (btor1017
            (signal
             (bool->bitvector
              (bveq (signal-value btor91) (signal-value btor1016)))
             (list)))
           (btor1018
            (if (bitvector->bool (signal-value btor1017)) btor97 btor96))
           (btor1019 (bv->signal (bv 11 (bitvector 4))))
           (btor1020
            (bv->signal
             (zero-extend (signal-value btor1019) (bitvector 5))
             btor1019))
           (btor1021
            (signal
             (bool->bitvector
              (bveq (signal-value btor91) (signal-value btor1020)))
             (list)))
           (btor1022
            (if (bitvector->bool (signal-value btor1021)) btor96 btor1018))
           (btor1023
            (if (bitvector->bool (signal-value btor1022)) btor1015 btor681))
           (btor1024
            (signal
             (bvor (signal-value btor990) (signal-value btor1023))
             (list)))
           (btor1025
            (signal
             (apply bvand (bitvector->bits (signal-value btor1024)))
             (signal-state btor1024)))
           (btor1026
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'pdet_o_reg1)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'pdet_o_reg1)))
                     ((assoc-has-key? init-hash 'pdet_o_reg1)
                      (bv->signal (assoc-ref init-hash 'pdet_o_reg1)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1027
            (if (bitvector->bool (signal-value btor842)) btor1026 btor1025))
           (btor1028 (signal (bvnot (signal-value btor1027)) (list)))
           (btor1029
            (signal
             (bvor (signal-value btor989) (signal-value btor1023))
             (list)))
           (btor1030
            (signal
             (apply bvand (bitvector->bits (signal-value btor1029)))
             (signal-state btor1029)))
           (btor1031
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'pdetb_o_reg1)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'pdetb_o_reg1)))
                     ((assoc-has-key? init-hash 'pdetb_o_reg1)
                      (bv->signal (assoc-ref init-hash 'pdetb_o_reg1)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1032
            (if (bitvector->bool (signal-value btor842)) btor1031 btor1030))
           (btor1033 (signal (bvnot (signal-value btor1032)) (list)))
           (btor1034
            (signal
             (bvand (signal-value btor1028) (signal-value btor1033))
             (list)))
           (btor1035
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'pdet_o_reg2)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'pdet_o_reg2)))
                     ((assoc-has-key? init-hash 'pdet_o_reg2)
                      (bv->signal (assoc-ref init-hash 'pdet_o_reg2)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1036
            (if (bitvector->bool (signal-value btor842)) btor1035 btor1025))
           (btor1037
            (signal
             (bvand (signal-value btor1034) (signal-value btor1036))
             (list)))
           (btor1038
            (if (bitvector->bool (signal-value btor1022)) btor1037 btor96))
           (btor1040
            (if (bitvector->bool (signal-value btor842)) btor301 btor988))
           (btor1045
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'pdetb_o_reg2)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'pdetb_o_reg2)))
                     ((assoc-has-key? init-hash 'pdetb_o_reg2)
                      (bv->signal (assoc-ref init-hash 'pdetb_o_reg2)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1046
            (if (bitvector->bool (signal-value btor842)) btor1045 btor1030))
           (btor1047
            (signal
             (bvand (signal-value btor1034) (signal-value btor1046))
             (list)))
           (btor1048
            (if (bitvector->bool (signal-value btor1022)) btor1047 btor96))
           (btor1050
            (signal
             (extract 5 0 (signal-value btor699))
             (signal-state btor699)))
           (btor1051
            (signal
             (apply bvxor (bitvector->bits (signal-value btor1050)))
             (signal-state btor1050)))
           (btor1052 (bv->signal (bv 24 (bitvector 5))))
           (btor1053
            (signal
             (bool->bitvector
              (bveq (signal-value btor93) (signal-value btor1052)))
             (list)))
           (btor1054
            (if (bitvector->bool (signal-value btor1053)) btor97 btor96))
           (btor1055 (bv->signal (bv 13 (bitvector 4))))
           (btor1056
            (bv->signal
             (zero-extend (signal-value btor1055) (bitvector 5))
             btor1055))
           (btor1057
            (signal
             (bool->bitvector
              (bveq (signal-value btor93) (signal-value btor1056)))
             (list)))
           (btor1058
            (if (bitvector->bool (signal-value btor1057)) btor96 btor1054))
           (btor1059
            (if (bitvector->bool (signal-value btor1058)) btor1051 btor96))
           (btor1060
            (signal
             (extract 11 6 (signal-value btor699))
             (signal-state btor699)))
           (btor1061
            (signal
             (apply bvxor (bitvector->bits (signal-value btor1060)))
             (signal-state btor1060)))
           (btor1062
            (if (bitvector->bool (signal-value btor1058)) btor1061 btor96))
           (btor1063
            (signal
             (bvxor (signal-value btor1059) (signal-value btor1062))
             (list)))
           (btor1064 (bv->signal (bv 26 (bitvector 5))))
           (btor1065
            (signal
             (bool->bitvector
              (bveq (signal-value btor94) (signal-value btor1064)))
             (list)))
           (btor1066
            (if (bitvector->bool (signal-value btor1065)) btor97 btor96))
           (btor1067 (bv->signal (bv 14 (bitvector 4))))
           (btor1068
            (bv->signal
             (zero-extend (signal-value btor1067) (bitvector 5))
             btor1067))
           (btor1069
            (signal
             (bool->bitvector
              (bveq (signal-value btor94) (signal-value btor1068)))
             (list)))
           (btor1070
            (if (bitvector->bool (signal-value btor1069)) btor96 btor1066))
           (btor1071
            (if (bitvector->bool (signal-value btor1070)) btor1059 btor1063))
           (btor1072
            (signal
             (extract 17 12 (signal-value btor699))
             (signal-state btor699)))
           (btor1073
            (signal
             (apply bvxor (bitvector->bits (signal-value btor1072)))
             (signal-state btor1072)))
           (btor1074
            (if (bitvector->bool (signal-value btor1058)) btor1073 btor96))
           (btor1075
            (signal
             (extract 23 18 (signal-value btor699))
             (signal-state btor699)))
           (btor1076
            (signal
             (apply bvxor (bitvector->bits (signal-value btor1075)))
             (signal-state btor1075)))
           (btor1077
            (if (bitvector->bool (signal-value btor1058)) btor1076 btor96))
           (btor1078
            (signal
             (bvxor (signal-value btor1074) (signal-value btor1077))
             (list)))
           (btor1079
            (signal
             (bvxor (signal-value btor1063) (signal-value btor1078))
             (list)))
           (btor1080
            (if (bitvector->bool (signal-value btor1070)) btor1062 btor1079))
           (btor1081
            (if (bitvector->bool (signal-value btor1070)) btor1074 btor1078))
           (btor1082
            (signal
             (extract 29 24 (signal-value btor699))
             (signal-state btor699)))
           (btor1083
            (signal
             (apply bvxor (bitvector->bits (signal-value btor1082)))
             (signal-state btor1082)))
           (btor1084
            (if (bitvector->bool (signal-value btor1058)) btor1083 btor96))
           (btor1085
            (signal
             (extract 35 30 (signal-value btor699))
             (signal-state btor699)))
           (btor1086
            (signal
             (apply bvxor (bitvector->bits (signal-value btor1085)))
             (signal-state btor1085)))
           (btor1087
            (if (bitvector->bool (signal-value btor1058)) btor1086 btor96))
           (btor1088
            (signal
             (bvxor (signal-value btor1084) (signal-value btor1087))
             (list)))
           (btor1089
            (signal
             (extract 41 36 (signal-value btor699))
             (signal-state btor699)))
           (btor1090
            (signal
             (apply bvxor (bitvector->bits (signal-value btor1089)))
             (signal-state btor1089)))
           (btor1091
            (if (bitvector->bool (signal-value btor1058)) btor1090 btor96))
           (btor1092
            (signal
             (extract 47 42 (signal-value btor699))
             (signal-state btor699)))
           (btor1093
            (signal
             (apply bvxor (bitvector->bits (signal-value btor1092)))
             (signal-state btor1092)))
           (btor1094
            (if (bitvector->bool (signal-value btor1058)) btor1093 btor96))
           (btor1095
            (signal
             (bvxor (signal-value btor1091) (signal-value btor1094))
             (list)))
           (btor1096
            (signal
             (bvxor (signal-value btor1088) (signal-value btor1095))
             (list)))
           (btor1097
            (signal
             (bvxor (signal-value btor1079) (signal-value btor1096))
             (list)))
           (btor1098
            (if (bitvector->bool (signal-value btor1070)) btor1077 btor1097))
           (btor1099
            (if (bitvector->bool (signal-value btor1070)) btor1084 btor1088))
           (btor1100
            (if (bitvector->bool (signal-value btor1070)) btor1087 btor1096))
           (btor1101
            (if (bitvector->bool (signal-value btor1070)) btor1091 btor1095))
           (btor1102
            (signal
             (concat (signal-value btor1080) (signal-value btor1071))
             (list)))
           (btor1103
            (signal
             (concat (signal-value btor1081) (signal-value btor1102))
             (list)))
           (btor1104
            (signal
             (concat (signal-value btor1098) (signal-value btor1103))
             (list)))
           (btor1105
            (signal
             (concat (signal-value btor1099) (signal-value btor1104))
             (list)))
           (btor1106
            (signal
             (concat (signal-value btor1100) (signal-value btor1105))
             (list)))
           (btor1107
            (signal
             (concat (signal-value btor1101) (signal-value btor1106))
             (list)))
           (btor1108
            (signal
             (concat (signal-value btor1094) (signal-value btor1107))
             (list)))
           (btor1109
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'XOR_MX_reg)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'XOR_MX_reg)))
                     ((assoc-has-key? init-hash 'XOR_MX_reg)
                      (bv->signal (assoc-ref init-hash 'XOR_MX_reg)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 8))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1110
            (if (bitvector->bool (signal-value btor842)) btor1109 btor1108))
           (btor1112
            (bv->signal
             (zero-extend (signal-value btor485) (bitvector 27))
             btor485))
           (btor1113
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 2))
             btor112))
           (btor1114
            (bv->signal
             (zero-extend (signal-value btor4) (bitvector 32))
             btor4))
           (btor1115
            (bv->signal
             (zero-extend (signal-value btor5) (bitvector 30))
             btor5))
           (btor1116
            (bv->signal
             (zero-extend (signal-value btor550) (bitvector 1))
             btor550))
           (btor1117
            (bv->signal
             (zero-extend (signal-value btor551) (bitvector 1))
             btor551))
           (btor1118
            (bv->signal
             (zero-extend (signal-value btor6) (bitvector 32))
             btor6))
           (btor1119
            (bv->signal
             (zero-extend (signal-value btor552) (bitvector 27))
             btor552))
           (btor1120
            (bv->signal
             (zero-extend (signal-value btor548) (bitvector 27))
             btor548))
           (btor1121
            (bv->signal
             (zero-extend (signal-value btor152) (bitvector 1))
             btor152))
           (btor1122
            (bv->signal
             (zero-extend (signal-value btor148) (bitvector 1))
             btor148))
           (btor1123
            (bv->signal
             (zero-extend (signal-value btor9) (bitvector 32))
             btor9))
           (btor1124
            (bv->signal
             (zero-extend (signal-value btor149) (bitvector 4))
             btor149))
           (btor1125
            (bv->signal
             (zero-extend (signal-value btor146) (bitvector 4))
             btor146))
           (btor1126
            (bv->signal
             (zero-extend (signal-value btor988) (bitvector 48))
             btor988))
           (btor1127
            (bv->signal
             (zero-extend (signal-value btor779) (bitvector 1))
             btor779))
           (btor1128
            (bv->signal
             (zero-extend (signal-value btor495) (bitvector 1))
             btor495))
           (btor1129
            (bv->signal
             (zero-extend (signal-value btor492) (bitvector 16))
             btor492))
           (btor1130
            (bv->signal
             (zero-extend (signal-value btor109) (bitvector 2))
             btor109))
           (btor1131
            (bv->signal
             (zero-extend (signal-value btor12) (bitvector 32))
             btor12))
           (btor1132
            (bv->signal
             (zero-extend (signal-value btor415) (bitvector 5))
             btor415))
           (btor1133
            (signal
             (bool->bitvector
              (bveq (signal-value btor13) (signal-value btor1132)))
             (list)))
           (btor1134
            (if (bitvector->bool (signal-value btor1133)) btor155 btor154))
           (btor1135
            (bv->signal
             (zero-extend (signal-value btor418) (bitvector 5))
             btor418))
           (btor1136
            (signal
             (bool->bitvector
              (bveq (signal-value btor13) (signal-value btor1135)))
             (list)))
           (btor1137
            (if (bitvector->bool (signal-value btor1136)) btor159 btor1134))
           (btor1138
            (bv->signal
             (zero-extend (signal-value btor376) (bitvector 5))
             btor376))
           (btor1139
            (signal
             (bool->bitvector
              (bveq (signal-value btor13) (signal-value btor1138)))
             (list)))
           (btor1140
            (if (bitvector->bool (signal-value btor1139)) btor154 btor1137))
           (btor1141
            (bv->signal
             (zero-extend (signal-value btor1140) (bitvector 2))
             btor1140))
           (btor1142 (bitvector 120))
           (btor1143 (bitvector 115))
           (btor1144 (bv->signal (bv 0 (bitvector 115))))
           (btor1145
            (signal
             (concat (signal-value btor1144) (signal-value btor13))
             (list)))
           (btor1146
            (bv->signal
             (zero-extend (signal-value btor1145) (bitvector 120))
             btor1145))
           (btor1147 (bv->signal (bv 16 (bitvector 5))))
           (btor1148
            (signal
             (bool->bitvector
              (bveq (signal-value btor14) (signal-value btor1147)))
             (list)))
           (btor1149
            (if (bitvector->bool (signal-value btor1148)) btor97 btor96))
           (btor1150
            (bv->signal
             (zero-extend (signal-value btor786) (bitvector 5))
             btor786))
           (btor1151
            (signal
             (bool->bitvector
              (bveq (signal-value btor14) (signal-value btor1150)))
             (list)))
           (btor1152
            (if (bitvector->bool (signal-value btor1151)) btor96 btor1149))
           (btor1153
            (bv->signal
             (zero-extend (signal-value btor1152) (bitvector 1))
             btor1152))
           (btor1154 (bv->signal (bv 0 (bitvector 35))))
           (btor1155
            (signal
             (concat (signal-value btor1154) (signal-value btor14))
             (list)))
           (btor1156
            (bv->signal
             (zero-extend (signal-value btor1155) (bitvector 40))
             btor1155))
           (btor1157
            (bv->signal
             (zero-extend (signal-value btor111) (bitvector 30))
             btor111))
           (btor1158
            (bv->signal
             (zero-extend (signal-value btor105) (bitvector 1))
             btor105))
           (btor1159 (bitvector 56))
           (btor1160 (bitvector 51))
           (btor1161 (bv->signal (bv 0 (bitvector 51))))
           (btor1162
            (signal
             (concat (signal-value btor1161) (signal-value btor15))
             (list)))
           (btor1163
            (bv->signal
             (zero-extend (signal-value btor1162) (bitvector 56))
             btor1162))
           (btor1164
            (bv->signal
             (zero-extend (signal-value btor2) (bitvector 30))
             btor2))
           (btor1165
            (bv->signal
             (zero-extend (signal-value btor525) (bitvector 18))
             btor525))
           (btor1166
            (bv->signal
             (zero-extend (signal-value btor127) (bitvector 18))
             btor127))
           (btor1167
            (bv->signal
             (zero-extend (signal-value btor128) (bitvector 2))
             btor128))
           (btor1168
            (bv->signal
             (zero-extend (signal-value btor18) (bitvector 32))
             btor18))
           (btor1169
            (bv->signal
             (zero-extend (signal-value btor19) (bitvector 18))
             btor19))
           (btor1170
            (bv->signal
             (zero-extend (signal-value btor780) (bitvector 1))
             btor780))
           (btor1171
            (bv->signal
             (zero-extend (signal-value btor502) (bitvector 1))
             btor502))
           (btor1172
            (signal
             (concat (signal-value btor491) (signal-value btor20))
             (list)))
           (btor1173
            (bv->signal
             (zero-extend (signal-value btor1172) (bitvector 16))
             btor1172))
           (btor1174
            (bv->signal
             (zero-extend (signal-value btor125) (bitvector 2))
             btor125))
           (btor1175
            (bv->signal
             (zero-extend (signal-value btor21) (bitvector 32))
             btor21))
           (btor1176
            (bv->signal
             (zero-extend (signal-value btor127) (bitvector 18))
             btor127))
           (btor1177
            (bv->signal
             (zero-extend (signal-value btor122) (bitvector 1))
             btor122))
           (btor1178
            (signal
             (concat (signal-value btor1161) (signal-value btor22))
             (list)))
           (btor1179
            (bv->signal
             (zero-extend (signal-value btor1178) (bitvector 56))
             btor1178))
           (btor1180
            (bv->signal
             (zero-extend (signal-value btor17) (bitvector 18))
             btor17))
           (btor1181
            (bv->signal
             (zero-extend (signal-value btor26) (bitvector 1))
             btor26))
           (btor1182
            (bv->signal
             (zero-extend (signal-value btor812) (bitvector 1))
             btor812))
           (btor1183
            (bv->signal
             (zero-extend (signal-value btor28) (bitvector 32))
             btor28))
           (btor1184
            (bv->signal
             (zero-extend (signal-value btor775) (bitvector 1))
             btor775))
           (btor1185
            (bv->signal
             (zero-extend (signal-value btor31) (bitvector 32))
             btor31))
           (btor1186
            (bv->signal
             (zero-extend (signal-value btor30) (bitvector 3))
             btor30))
           (btor1187
            (bv->signal
             (zero-extend (signal-value btor776) (bitvector 3))
             btor776))
           (btor1188
            (bv->signal
             (zero-extend (signal-value btor810) (bitvector 1))
             btor810))
           (btor1189
            (bv->signal
             (zero-extend (signal-value btor813) (bitvector 1))
             btor813))
           (btor1190
            (bv->signal
             (zero-extend (signal-value btor794) (bitvector 1))
             btor794))
           (btor1191
            (bv->signal
             (zero-extend (signal-value btor32) (bitvector 1))
             btor32))
           (btor1192
            (bv->signal
             (zero-extend (signal-value btor33) (bitvector 1))
             btor33))
           (btor1193
            (bv->signal
             (zero-extend (signal-value btor34) (bitvector 1))
             btor34))
           (btor1194
            (bv->signal
             (zero-extend (signal-value btor35) (bitvector 1))
             btor35))
           (btor1195
            (bv->signal
             (zero-extend (signal-value btor36) (bitvector 1))
             btor36))
           (btor1196
            (bv->signal
             (zero-extend (signal-value btor37) (bitvector 1))
             btor37))
           (btor1197
            (bv->signal
             (zero-extend (signal-value btor39) (bitvector 1))
             btor39))
           (btor1198
            (bv->signal
             (zero-extend (signal-value btor40) (bitvector 1))
             btor40))
           (btor1199
            (bv->signal
             (zero-extend (signal-value btor38) (bitvector 1))
             btor38))
           (btor1200
            (bv->signal
             (zero-extend (signal-value btor41) (bitvector 1))
             btor41))
           (btor1201
            (bv->signal
             (zero-extend (signal-value btor42) (bitvector 1))
             btor42))
           (btor1202
            (bv->signal
             (zero-extend (signal-value btor43) (bitvector 1))
             btor43))
           (btor1203
            (bv->signal
             (zero-extend (signal-value btor44) (bitvector 1))
             btor44))
           (btor1204
            (signal
             (bvxor (signal-value btor45) (signal-value btor54))
             (list)))
           (btor1205
            (bv->signal
             (zero-extend (signal-value btor1204) (bitvector 1))
             btor1204))
           (btor1206
            (bv->signal
             (zero-extend (signal-value btor871) (bitvector 4))
             btor871))
           (btor1207
            (bv->signal
             (zero-extend (signal-value btor426) (bitvector 1))
             btor426))
           (btor1208
            (bv->signal
             (zero-extend (signal-value btor46) (bitvector 32))
             btor46))
           (btor1209
            (bv->signal
             (zero-extend (signal-value btor427) (bitvector 48))
             btor427))
           (btor1210
            (bv->signal
             (zero-extend (signal-value btor24) (bitvector 48))
             btor24))
           (btor1211
            (bv->signal
             (zero-extend (signal-value btor487) (bitvector 1))
             btor487))
           (btor1212
            (bv->signal
             (zero-extend (signal-value btor517) (bitvector 1))
             btor517))
           (btor1213
            (bv->signal
             (zero-extend (signal-value btor49) (bitvector 32))
             btor49))
           (btor1214
            (bv->signal
             (zero-extend (signal-value btor518) (bitvector 27))
             btor518))
           (btor1215
            (bv->signal
             (zero-extend (signal-value btor520) (bitvector 27))
             btor520))
           (btor1216
            (bv->signal
             (zero-extend (signal-value btor48) (bitvector 27))
             btor48))
           (btor1217
            (bv->signal
             (zero-extend (signal-value btor469) (bitvector 1))
             btor469))
           (btor1218
            (bv->signal
             (zero-extend (signal-value btor51) (bitvector 32))
             btor51))
           (btor1219
            (bv->signal
             (zero-extend (signal-value btor467) (bitvector 5))
             btor467))
           (btor1220
            (bv->signal
             (zero-extend (signal-value btor470) (bitvector 5))
             btor470))
           (btor1221
            (bv->signal
             (zero-extend (signal-value btor52) (bitvector 4))
             btor52))
           (btor1222
            (bv->signal
             (zero-extend (signal-value btor53) (bitvector 1))
             btor53))
           (btor1223
            (bv->signal
             (zero-extend (signal-value btor54) (bitvector 1))
             btor54))
           (btor1224
            (bv->signal
             (zero-extend (signal-value btor55) (bitvector 5))
             btor55))
           (btor1225
            (bv->signal
             (zero-extend (signal-value btor57) (bitvector 9))
             btor57))
           (btor1226
            (bv->signal
             (zero-extend (signal-value btor58) (bitvector 1))
             btor58))
           (btor1227
            (bv->signal
             (zero-extend (signal-value btor59) (bitvector 1))
             btor59))
           (btor1228
            (bv->signal
             (zero-extend (signal-value btor60) (bitvector 1))
             btor60))
           (btor1229
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 1))
             btor61))
           (btor1230
            (bv->signal
             (zero-extend (signal-value btor62) (bitvector 1))
             btor62))
           (btor1231
            (bv->signal
             (zero-extend (signal-value btor63) (bitvector 1))
             btor63))
           (btor1232
            (bv->signal
             (zero-extend (signal-value btor64) (bitvector 1))
             btor64))
           (btor1233
            (bv->signal
             (zero-extend (signal-value btor65) (bitvector 1))
             btor65))
           (btor1234
            (bv->signal
             (zero-extend (signal-value btor66) (bitvector 1))
             btor66))
           (btor1235
            (bv->signal
             (zero-extend (signal-value btor67) (bitvector 1))
             btor67))
           (btor1236
            (bv->signal
             (zero-extend (signal-value btor68) (bitvector 48))
             btor68))
           (btor1237
            (bv->signal
             (zero-extend (signal-value btor655) (bitvector 1))
             btor655))
           (btor1238
            (bv->signal
             (zero-extend (signal-value btor69) (bitvector 32))
             btor69))
           (btor1239
            (bv->signal
             (zero-extend (signal-value btor70) (bitvector 1))
             btor70))
           (btor1240
            (bv->signal
             (zero-extend (signal-value btor874) (bitvector 1))
             btor874))
           (btor1241
            (bv->signal
             (zero-extend (signal-value btor373) (bitvector 1))
             btor373))
           (btor1242
            (bv->signal
             (zero-extend (signal-value btor72) (bitvector 32))
             btor72))
           (btor1243
            (bv->signal
             (zero-extend (signal-value btor371) (bitvector 9))
             btor371))
           (btor1244
            (bv->signal
             (zero-extend (signal-value btor374) (bitvector 9))
             btor374))
           (btor1245
            (bv->signal
             (zero-extend (signal-value btor73) (bitvector 48))
             btor73))
           (btor1246
            (bv->signal
             (zero-extend (signal-value btor74) (bitvector 48))
             btor74))
           (btor1247
            (bv->signal
             (zero-extend (signal-value btor481) (bitvector 1))
             btor481))
           (btor1248
            (bv->signal
             (zero-extend (signal-value btor478) (bitvector 8))
             btor478))
           (btor1249
            (bv->signal
             (zero-extend (signal-value btor544) (bitvector 27))
             btor544))
           (btor1250
            (bv->signal
             (zero-extend (signal-value btor842) (bitvector 1))
             btor842))
           (btor1251
            (bv->signal
             (zero-extend (signal-value btor76) (bitvector 32))
             btor76))
           (btor1252
            (bv->signal
             (zero-extend (signal-value btor772) (bitvector 1))
             btor772))
           (btor1253
            (bv->signal
             (zero-extend (signal-value btor301) (bitvector 48))
             btor301))
           (btor1254
            (bv->signal
             (zero-extend (signal-value btor77) (bitvector 48))
             btor77))
           (btor1255
            (signal
             (bvxor (signal-value btor79) (signal-value btor58))
             (list)))
           (btor1256
            (bv->signal
             (zero-extend (signal-value btor1255) (bitvector 1))
             btor1255))
           (btor1257
            (signal
             (bvxor (signal-value btor80) (signal-value btor59))
             (list)))
           (btor1258
            (bv->signal
             (zero-extend (signal-value btor1257) (bitvector 1))
             btor1257))
           (btor1259
            (signal
             (bvxor (signal-value btor78) (signal-value btor60))
             (list)))
           (btor1260
            (bv->signal
             (zero-extend (signal-value btor1259) (bitvector 1))
             btor1259))
           (btor1261
            (signal
             (bvxor (signal-value btor81) (signal-value btor61))
             (list)))
           (btor1262
            (bv->signal
             (zero-extend (signal-value btor1261) (bitvector 1))
             btor1261))
           (btor1263
            (signal
             (bvxor (signal-value btor83) (signal-value btor62))
             (list)))
           (btor1264
            (bv->signal
             (zero-extend (signal-value btor1263) (bitvector 1))
             btor1263))
           (btor1265
            (signal
             (bvxor (signal-value btor82) (signal-value btor63))
             (list)))
           (btor1266
            (bv->signal
             (zero-extend (signal-value btor1265) (bitvector 1))
             btor1265))
           (btor1267
            (signal
             (bvxor (signal-value btor84) (signal-value btor64))
             (list)))
           (btor1268
            (bv->signal
             (zero-extend (signal-value btor1267) (bitvector 1))
             btor1267))
           (btor1269
            (signal
             (bvxor (signal-value btor85) (signal-value btor65))
             (list)))
           (btor1270
            (bv->signal
             (zero-extend (signal-value btor1269) (bitvector 1))
             btor1269))
           (btor1271
            (signal
             (bvxor (signal-value btor86) (signal-value btor66))
             (list)))
           (btor1272
            (bv->signal
             (zero-extend (signal-value btor1271) (bitvector 1))
             btor1271))
           (btor1273
            (signal
             (bvxor (signal-value btor87) (signal-value btor67))
             (list)))
           (btor1274
            (bv->signal
             (zero-extend (signal-value btor1273) (bitvector 1))
             btor1273))
           (btor1275
            (bv->signal
             (zero-extend (signal-value btor1005) (bitvector 2))
             btor1005))
           (btor1276 (bitvector 112))
           (btor1277 (bitvector 107))
           (btor1278 (bv->signal (bv 0 (bitvector 107))))
           (btor1279
            (signal
             (concat (signal-value btor1278) (signal-value btor88))
             (list)))
           (btor1280
            (bv->signal
             (zero-extend (signal-value btor1279) (bitvector 112))
             btor1279))
           (btor1281
            (bv->signal
             (zero-extend (signal-value btor884) (bitvector 1))
             btor884))
           (btor1282
            (signal
             (concat (signal-value btor1161) (signal-value btor89))
             (list)))
           (btor1283
            (bv->signal
             (zero-extend (signal-value btor1282) (bitvector 56))
             btor1282))
           (btor1284
            (bv->signal
             (zero-extend (signal-value btor514) (bitvector 2))
             btor514))
           (btor1285 (bitvector 64))
           (btor1286 (bitvector 59))
           (btor1287 (bv->signal (bv 0 (bitvector 59))))
           (btor1288
            (signal
             (concat (signal-value btor1287) (signal-value btor90))
             (list)))
           (btor1289
            (bv->signal
             (zero-extend (signal-value btor1288) (bitvector 64))
             btor1288))
           (btor1290
            (bv->signal
             (zero-extend (signal-value btor1022) (bitvector 1))
             btor1022))
           (btor1291 (bitvector 72))
           (btor1292 (bitvector 67))
           (btor1293 (bv->signal (bv 0 (bitvector 67))))
           (btor1294
            (signal
             (concat (signal-value btor1293) (signal-value btor91))
             (list)))
           (btor1295
            (bv->signal
             (zero-extend (signal-value btor1294) (bitvector 72))
             btor1294))
           (btor1296
            (bv->signal
             (zero-extend (signal-value btor166) (bitvector 2))
             btor166))
           (btor1297 (bv->signal (bv 0 (bitvector 43))))
           (btor1298
            (signal
             (concat (signal-value btor1297) (signal-value btor92))
             (list)))
           (btor1299
            (bv->signal
             (zero-extend (signal-value btor1298) (bitvector 48))
             btor1298))
           (btor1300
            (bv->signal
             (zero-extend (signal-value btor1058) (bitvector 1))
             btor1058))
           (btor1301
            (signal
             (concat (signal-value btor1154) (signal-value btor93))
             (list)))
           (btor1302
            (bv->signal
             (zero-extend (signal-value btor1301) (bitvector 40))
             btor1301))
           (btor1303
            (bv->signal
             (zero-extend (signal-value btor656) (bitvector 45))
             btor656))
           (btor1304
            (bv->signal
             (zero-extend (signal-value btor659) (bitvector 45))
             btor659))
           (btor1305
            (bv->signal
             (zero-extend (signal-value btor652) (bitvector 44))
             btor652))
           (btor1306
            (bv->signal
             (zero-extend (signal-value btor690) (bitvector 45))
             btor690))
           (btor1307
            (bv->signal
             (zero-extend (signal-value btor691) (bitvector 45))
             btor691))
           (btor1308
            (bv->signal
             (zero-extend (signal-value btor688) (bitvector 45))
             btor688))
           (btor1309
            (bv->signal
             (zero-extend (signal-value btor1070) (bitvector 1))
             btor1070))
           (btor1310 (bitvector 88))
           (btor1311 (bitvector 83))
           (btor1312 (bv->signal (bv 0 (bitvector 83))))
           (btor1313
            (signal
             (concat (signal-value btor1312) (signal-value btor94))
             (list)))
           (btor1314
            (bv->signal
             (zero-extend (signal-value btor1313) (bitvector 88))
             btor1313))
           (btor1315
            (bv->signal
             (zero-extend (signal-value btor1108) (bitvector 8))
             btor1108))
           (btor1316 (bitvector 49))
           (btor1317
            (signal
             (concat (signal-value btor742) (signal-value btor820))
             (list)))
           (btor1318
            (bv->signal
             (zero-extend (signal-value btor1317) (bitvector 49))
             btor1317))
           (btor1319
            (bv->signal
             (zero-extend (signal-value btor553) (bitvector 27))
             btor553))
           (btor1320 (signal (bvnot (signal-value btor1152)) (list)))
           (btor1321
            (signal
             (bvor (signal-value btor1320) (signal-value btor44))
             (list)))
           (btor1322
            (bv->signal
             (zero-extend (signal-value btor1321) (bitvector 1))
             btor1321))
           (btor1323
            (bv->signal
             (zero-extend (signal-value btor591) (bitvector 18))
             btor591))
           (btor1324
            (bv->signal
             (zero-extend (signal-value btor782) (bitvector 1))
             btor782))
           (btor1325
            (bv->signal
             (zero-extend (signal-value btor43) (bitvector 1))
             btor43))
           (btor1326
            (bv->signal
             (zero-extend (signal-value btor820) (bitvector 1))
             btor820))
           (btor1327
            (bv->signal
             (zero-extend (signal-value btor817) (bitvector 1))
             btor817))
           (btor1328
            (bv->signal
             (zero-extend (signal-value btor704) (bitvector 48))
             btor704))
           (btor1329
            (bv->signal
             (zero-extend (signal-value btor764) (bitvector 1))
             btor764))
           (btor1330
            (bv->signal
             (zero-extend (signal-value btor756) (bitvector 1))
             btor756))
           (btor1331
            (bv->signal
             (zero-extend (signal-value btor744) (bitvector 1))
             btor744))
           (btor1332
            (bv->signal
             (zero-extend (signal-value btor708) (bitvector 48))
             btor708))
           (btor1333
            (signal
             (extract 10 0 (signal-value btor708))
             (signal-state btor708)))
           (btor1334
            (signal
             (concat (signal-value btor710) (signal-value btor1333))
             (list)))
           (btor1335
            (signal
             (extract 22 12 (signal-value btor708))
             (signal-state btor708)))
           (btor1336
            (signal
             (concat (signal-value btor1335) (signal-value btor1334))
             (list)))
           (btor1337
            (signal
             (concat (signal-value btor712) (signal-value btor1336))
             (list)))
           (btor1338
            (signal
             (extract 34 24 (signal-value btor708))
             (signal-state btor708)))
           (btor1339
            (signal
             (concat (signal-value btor1338) (signal-value btor1337))
             (list)))
           (btor1340
            (signal
             (concat (signal-value btor714) (signal-value btor1339))
             (list)))
           (btor1341
            (signal
             (extract 47 36 (signal-value btor708))
             (signal-state btor708)))
           (btor1342
            (signal
             (concat (signal-value btor1341) (signal-value btor1340))
             (list)))
           (btor1343
            (bv->signal
             (zero-extend (signal-value btor1342) (bitvector 48))
             btor1342))
           (btor1344
            (bv->signal
             (zero-extend (signal-value btor742) (bitvector 48))
             btor742))
           (btor1345
            (bv->signal
             (zero-extend (signal-value btor847) (bitvector 1))
             btor847))
           (btor1346
            (bv->signal
             (zero-extend (signal-value btor860) (bitvector 1))
             btor860))
           (btor1347
            (bv->signal
             (zero-extend (signal-value btor866) (bitvector 1))
             btor866))
           (btor1348
            (bv->signal
             (zero-extend (signal-value btor840) (bitvector 1))
             btor840))
           (btor1349
            (bv->signal
             (zero-extend (signal-value btor874) (bitvector 1))
             btor874))
           (btor1350
            (bv->signal
             (zero-extend (signal-value btor854) (bitvector 1))
             btor854))
           (btor1351
            (bv->signal
             (zero-extend (signal-value btor861) (bitvector 1))
             btor861))
           (btor1352
            (bv->signal
             (zero-extend (signal-value btor867) (bitvector 1))
             btor867))
           (btor1353
            (bv->signal
             (zero-extend (signal-value btor840) (bitvector 1))
             btor840))
           (btor1354
            (if (bitvector->bool (signal-value btor43)) btor782 btor783))
           (btor1355
            (bv->signal
             (zero-extend (signal-value btor1354) (bitvector 1))
             btor1354))
           (btor1356
            (if (bitvector->bool (signal-value btor1255)) btor96 btor1354))
           (btor1357
            (bv->signal
             (zero-extend (signal-value btor1356) (bitvector 1))
             btor1356))
           (btor1358
            (bv->signal
             (zero-extend (signal-value btor96) (bitvector 1))
             btor96))
           (btor1359
            (bv->signal
             (zero-extend (signal-value btor828) (bitvector 1))
             btor828))
           (btor1360
            (bv->signal
             (zero-extend (signal-value btor832) (bitvector 1))
             btor832))
           (btor1361
            (bv->signal
             (zero-extend (signal-value btor836) (bitvector 1))
             btor836))
           (btor1362
            (bv->signal
             (zero-extend (signal-value btor648) (bitvector 45))
             btor648))
           (btor1363
            (bv->signal
             (zero-extend (signal-value btor853) (bitvector 1))
             btor853))
           (btor1364
            (bv->signal
             (zero-extend (signal-value btor784) (bitvector 1))
             btor784))
           (btor1365
            (bv->signal
             (zero-extend (signal-value btor97) (bitvector 1))
             btor97))
           (btor1366
            (bv->signal
             (zero-extend (signal-value btor1036) (bitvector 1))
             btor1036))
           (btor1367
            (bv->signal
             (zero-extend (signal-value btor1025) (bitvector 1))
             btor1025))
           (btor1368
            (bv->signal
             (zero-extend (signal-value btor1027) (bitvector 1))
             btor1027))
           (btor1369
            (bv->signal
             (zero-extend (signal-value btor1030) (bitvector 1))
             btor1030))
           (btor1370
            (bv->signal
             (zero-extend (signal-value btor1032) (bitvector 1))
             btor1032))
           (btor1371 (bv->signal (bv 5864062014805 (bitvector 44))))
           (btor1372
            (bv->signal
             (zero-extend (signal-value btor1371) (bitvector 44))
             btor1371))
           (btor1373
            (bv->signal
             (zero-extend (signal-value btor684) (bitvector 44))
             btor684))
           (btor1374
            (bv->signal
             (zero-extend (signal-value btor1255) (bitvector 1))
             btor1255))
           (btor1375
            (bv->signal
             (zero-extend (signal-value btor699) (bitvector 48))
             btor699))
           (btor1376
            (bv->signal
             (zero-extend (signal-value btor826) (bitvector 13))
             btor826))
           (btor1377
            (bv->signal
             (zero-extend (signal-value btor830) (bitvector 13))
             btor830))
           (btor1378
            (bv->signal
             (zero-extend (signal-value btor834) (bitvector 13))
             btor834))
           (btor1379
            (bv->signal
             (zero-extend (signal-value btor838) (bitvector 14))
             btor838))
           (btor1380
            (bv->signal
             (zero-extend (signal-value btor706) (bitvector 48))
             btor706))
           (btor1381
            (bv->signal
             (zero-extend (signal-value btor749) (bitvector 48))
             btor749))
           (btor1382
            (signal
             (bvand (signal-value btor1321) (signal-value btor1036))
             (list)))
           (btor1383
            (signal
             (bvand (signal-value btor1382) (signal-value btor1028))
             (list)))
           (btor1384
            (signal
             (bool->bitvector
              (bveq (signal-value btor1140) (signal-value btor155)))
             (list)))
           (btor1385
            (if (bitvector->bool (signal-value btor1384)) btor1383 btor96))
           (btor1386
            (signal
             (bvand (signal-value btor1321) (signal-value btor1027))
             (list)))
           (btor1387
            (bv->signal
             (zero-extend (signal-value btor97) (bitvector 2))
             btor97))
           (btor1388
            (signal
             (bool->bitvector
              (bveq (signal-value btor1140) (signal-value btor1387)))
             (list)))
           (btor1389
            (if (bitvector->bool (signal-value btor1388)) btor1386 btor1385))
           (btor1390
            (bv->signal
             (zero-extend (signal-value btor1389) (bitvector 1))
             btor1389))
           (btor1391
            (bv->signal
             (zero-extend (signal-value btor1023) (bitvector 48))
             btor1023))
           (btor1392
            (bv->signal
             (zero-extend (signal-value btor885) (bitvector 48))
             btor885))
           (btor1393
            (bv->signal
             (zero-extend (signal-value btor1046) (bitvector 1))
             btor1046))
           (btor1394
            (bv->signal
             (zero-extend (signal-value btor738) (bitvector 48))
             btor738))
           (btor1395
            (bv->signal
             (zero-extend (signal-value btor670) (bitvector 2))
             btor670))
           (btor1396
            (bv->signal
             (zero-extend (signal-value btor675) (bitvector 48))
             btor675))
           (btor1397
            (bv->signal
             (zero-extend (signal-value btor1059) (bitvector 1))
             btor1059))
           (btor1398
            (bv->signal
             (zero-extend (signal-value btor1062) (bitvector 1))
             btor1062))
           (btor1399
            (bv->signal
             (zero-extend (signal-value btor1074) (bitvector 1))
             btor1074))
           (btor1400
            (bv->signal
             (zero-extend (signal-value btor1077) (bitvector 1))
             btor1077))
           (btor1401
            (bv->signal
             (zero-extend (signal-value btor1084) (bitvector 1))
             btor1084))
           (btor1402
            (bv->signal
             (zero-extend (signal-value btor1087) (bitvector 1))
             btor1087))
           (btor1403
            (bv->signal
             (zero-extend (signal-value btor1091) (bitvector 1))
             btor1091))
           (btor1404
            (bv->signal
             (zero-extend (signal-value btor1094) (bitvector 1))
             btor1094))
           (btor1405
            (bv->signal
             (zero-extend (signal-value btor1063) (bitvector 1))
             btor1063))
           (btor1406
            (bv->signal
             (zero-extend (signal-value btor1078) (bitvector 1))
             btor1078))
           (btor1407
            (bv->signal
             (zero-extend (signal-value btor1088) (bitvector 1))
             btor1088))
           (btor1408
            (bv->signal
             (zero-extend (signal-value btor1095) (bitvector 1))
             btor1095))
           (btor1409
            (bv->signal
             (zero-extend (signal-value btor1079) (bitvector 1))
             btor1079))
           (btor1410
            (bv->signal
             (zero-extend (signal-value btor1096) (bitvector 1))
             btor1096))
           (btor1411
            (bv->signal
             (zero-extend (signal-value btor1097) (bitvector 1))
             btor1097))
           (btor1412
            (bv->signal
             (zero-extend (signal-value btor698) (bitvector 48))
             btor698))
           (btor1413
            (bv->signal
             (zero-extend (signal-value btor438) (bitvector 48))
             btor438))
           (btor1414
            (bv->signal
             (zero-extend (signal-value btor437) (bitvector 48))
             btor437))
           (btor1415
            (if (bitvector->bool (signal-value btor32)) btor106 btor95))
           (btor1416 (bv->signal (bv 0 (bitvector 30))))
           (btor1417
            (signal
             (apply bvor (bitvector->bits (signal-value btor109)))
             (signal-state btor109)))
           (btor1418 (signal (bvnot (signal-value btor1417)) (list)))
           (btor1419
            (signal
             (bvor (signal-value btor1259) (signal-value btor1418))
             (list)))
           (btor1420
            (if (bitvector->bool (signal-value btor1419)) btor1416 btor1415))
           (btor1422
            (signal
             (bool->bitvector
              (bveq (signal-value btor109) (signal-value btor155)))
             (list)))
           (btor1423
            (if (bitvector->bool (signal-value btor1422)) btor95 btor106))
           (btor1424
            (if (bitvector->bool (signal-value btor33)) btor1423 btor107))
           (btor1425
            (if (bitvector->bool (signal-value btor1419)) btor1416 btor1424))
           (btor1427
            (if (bitvector->bool (signal-value btor36)) btor123 btor116))
           (btor1428
            (signal
             (apply bvor (bitvector->bits (signal-value btor125)))
             (signal-state btor125)))
           (btor1429 (signal (bvnot (signal-value btor1428)) (list)))
           (btor1430
            (signal
             (bvor (signal-value btor1261) (signal-value btor1429))
             (list)))
           (btor1431
            (if (bitvector->bool (signal-value btor1430)) btor523 btor1427))
           (btor1433
            (signal
             (bool->bitvector
              (bveq (signal-value btor125) (signal-value btor155)))
             (list)))
           (btor1434
            (if (bitvector->bool (signal-value btor1433)) btor116 btor123))
           (btor1435
            (if (bitvector->bool (signal-value btor37)) btor1434 btor124))
           (btor1436
            (if (bitvector->bool (signal-value btor1261)) btor523 btor1435))
           (btor1438
            (if (bitvector->bool (signal-value btor35)) btor146 btor147))
           (btor1439 (bv->signal (bv 0 (bitvector 4))))
           (btor1440
            (if (bitvector->bool (signal-value btor1257)) btor1439 btor1438))
           (btor1442
            (signal
             (bvand (signal-value btor44) (signal-value btor842))
             (list)))
           (btor1443
            (if (bitvector->bool (signal-value btor1442)) btor988 btor301))
           (btor1444
            (signal
             (bvor (signal-value btor1273) (signal-value btor1389))
             (list)))
           (btor1445
            (if (bitvector->bool (signal-value btor1444)) btor434 btor1443))
           (btor1447
            (if (bitvector->bool (signal-value btor40)) btor371 btor372))
           (btor1448 (bv->signal (bv 0 (bitvector 9))))
           (btor1449
            (if (bitvector->bool (signal-value btor1263)) btor1448 btor1447))
           (btor1451
            (if (bitvector->bool (signal-value btor38)) btor24 btor425))
           (btor1452 (signal (bvnot (signal-value btor426)) (list)))
           (btor1453
            (signal
             (bvor (signal-value btor1265) (signal-value btor1452))
             (list)))
           (btor1454
            (if (bitvector->bool (signal-value btor1453)) btor434 btor1451))
           (btor1456
            (if (bitvector->bool (signal-value btor42)) btor467 btor468))
           (btor1457 (bv->signal (bv 0 (bitvector 5))))
           (btor1458 (signal (bvnot (signal-value btor469)) (list)))
           (btor1459
            (signal
             (bvor (signal-value btor1269) (signal-value btor1458))
             (list)))
           (btor1460
            (if (bitvector->bool (signal-value btor1459)) btor1457 btor1456))
           (btor1462
            (if (bitvector->bool (signal-value btor41)) btor48 btor486))
           (btor1463 (signal (bvnot (signal-value btor517)) (list)))
           (btor1464
            (signal
             (bvor (signal-value btor1267) (signal-value btor1463))
             (list)))
           (btor1465
            (if (bitvector->bool (signal-value btor1464)) btor473 btor1462))
           (btor1467
            (if (bitvector->bool (signal-value btor34)) btor548 btor549))
           (btor1468
            (if (bitvector->bool (signal-value btor1267)) btor473 btor1467))
           (btor1470
            (if (bitvector->bool (signal-value btor43)) btor653 btor654))
           (btor1471 (signal (bvnot (signal-value btor655)) (list)))
           (btor1472
            (signal
             (bvor (signal-value btor1271) (signal-value btor1471))
             (list)))
           (btor1473
            (if (bitvector->bool (signal-value btor1472)) btor647 btor1470))
           (btor1475
            (if (bitvector->bool (signal-value btor43)) btor688 btor689))
           (btor1476
            (if (bitvector->bool (signal-value btor1472)) btor647 btor1475))
           (btor1478
            (if (bitvector->bool (signal-value btor40)) btor30 btor774))
           (btor1479
            (if (bitvector->bool (signal-value btor1263)) btor477 btor1478))
           (btor1482
            (if (bitvector->bool (signal-value btor1442)) btor152 btor791))
           (btor1483
            (if (bitvector->bool (signal-value btor1444)) btor96 btor1482))
           (btor1485
            (if (bitvector->bool (signal-value btor1442)) btor871 btor792))
           (btor1486
            (if (bitvector->bool (signal-value btor1444)) btor1439 btor1485))
           (btor1488
            (if (bitvector->bool (signal-value btor39)) btor810 btor811))
           (btor1489
            (if (bitvector->bool (signal-value btor1255)) btor96 btor1488))
           (btor1491
            (if (bitvector->bool (signal-value btor1442)) btor874 btor875))
           (btor1492
            (if (bitvector->bool (signal-value btor1444)) btor96 btor1491))
           (btor1494
            (if (bitvector->bool (signal-value btor1442)) btor1025 btor1026))
           (btor1495
            (if (bitvector->bool (signal-value btor1444)) btor96 btor1494))
           (btor1497
            (if (bitvector->bool (signal-value btor1442)) btor1030 btor1031))
           (btor1498
            (if (bitvector->bool (signal-value btor1444)) btor96 btor1497))
           (btor1500
            (if (bitvector->bool (signal-value btor1442)) btor1026 btor1035))
           (btor1501
            (if (bitvector->bool (signal-value btor1444)) btor96 btor1500))
           (btor1503
            (if (bitvector->bool (signal-value btor1442)) btor1031 btor1045))
           (btor1504
            (if (bitvector->bool (signal-value btor1444)) btor96 btor1503))
           (btor1506
            (if (bitvector->bool (signal-value btor1442)) btor1108 btor1109))
           (btor1507 (bv->signal (bv 0 (bitvector 8))))
           (btor1508
            (if (bitvector->bool (signal-value btor1444)) btor1507 btor1506)))
      (list
       (cons
        'XOROUT
        (signal
         (signal-value btor1110)
         (append
          (list (cons 'XOR_MX_reg (signal-value btor1508)))
          (append
           (list (cons 'pdetb_o_reg2 (signal-value btor1504)))
           (append
            (list (cons 'pdet_o_reg2 (signal-value btor1501)))
            (append
             (list (cons 'pdetb_o_reg1 (signal-value btor1498)))
             (append
              (list (cons 'pdet_o_reg1 (signal-value btor1495)))
              (append
               (list (cons 'MULTSIGN_ALU_reg (signal-value btor1492)))
               (append
                (list (cons 'CARRYIN_reg (signal-value btor1489)))
                (append
                 (list (cons 'COUT_reg (signal-value btor1486)))
                 (append
                  (list (cons 'ALUMODE10_reg (signal-value btor1483)))
                  (append
                   (list (cons 'qmultcarryin (signal-value btor1356)))
                   (append
                    (list (cons 'CARRYINSEL_reg (signal-value btor1479)))
                    (append
                     (list (cons 'V_DATA_reg (signal-value btor1476)))
                     (append
                      (list (cons 'U_DATA_reg (signal-value btor1473)))
                      (append
                       (list (cons 'AD_DATA_reg (signal-value btor1468)))
                       (append
                        (list (cons 'D_DATA_reg (signal-value btor1465)))
                        (append
                         (list (cons 'INMODE_reg (signal-value btor1460)))
                         (append
                          (list (cons 'C_reg (signal-value btor1454)))
                          (append
                           (list (cons 'OPMODE_reg (signal-value btor1449)))
                           (append
                            (list (cons 'ALU_OUT_reg (signal-value btor1445)))
                            (append
                             (list (cons 'ALUMODE_reg (signal-value btor1440)))
                             (append
                              (list (cons 'B2_reg (signal-value btor1436)))
                              (append
                               (list
                                (cons 'B1_DATA_out (signal-value btor1431)))
                               (append
                                (list (cons 'A2_reg (signal-value btor1425)))
                                (append
                                 (list (cons 'A1_reg (signal-value btor1420)))
                                 (list)))))))))))))))))))))))))))
       (cons
        'PCOUT
        (signal
         (signal-value btor1040)
         (append
          (list (cons 'XOR_MX_reg (signal-value btor1508)))
          (append
           (list (cons 'pdetb_o_reg2 (signal-value btor1504)))
           (append
            (list (cons 'pdet_o_reg2 (signal-value btor1501)))
            (append
             (list (cons 'pdetb_o_reg1 (signal-value btor1498)))
             (append
              (list (cons 'pdet_o_reg1 (signal-value btor1495)))
              (append
               (list (cons 'MULTSIGN_ALU_reg (signal-value btor1492)))
               (append
                (list (cons 'CARRYIN_reg (signal-value btor1489)))
                (append
                 (list (cons 'COUT_reg (signal-value btor1486)))
                 (append
                  (list (cons 'ALUMODE10_reg (signal-value btor1483)))
                  (append
                   (list (cons 'qmultcarryin (signal-value btor1356)))
                   (append
                    (list (cons 'CARRYINSEL_reg (signal-value btor1479)))
                    (append
                     (list (cons 'V_DATA_reg (signal-value btor1476)))
                     (append
                      (list (cons 'U_DATA_reg (signal-value btor1473)))
                      (append
                       (list (cons 'AD_DATA_reg (signal-value btor1468)))
                       (append
                        (list (cons 'D_DATA_reg (signal-value btor1465)))
                        (append
                         (list (cons 'INMODE_reg (signal-value btor1460)))
                         (append
                          (list (cons 'C_reg (signal-value btor1454)))
                          (append
                           (list (cons 'OPMODE_reg (signal-value btor1449)))
                           (append
                            (list (cons 'ALU_OUT_reg (signal-value btor1445)))
                            (append
                             (list (cons 'ALUMODE_reg (signal-value btor1440)))
                             (append
                              (list (cons 'B2_reg (signal-value btor1436)))
                              (append
                               (list
                                (cons 'B1_DATA_out (signal-value btor1431)))
                               (append
                                (list (cons 'A2_reg (signal-value btor1425)))
                                (append
                                 (list (cons 'A1_reg (signal-value btor1420)))
                                 (list)))))))))))))))))))))))))))
       (cons
        'PATTERNBDETECT
        (signal
         (signal-value btor1032)
         (append
          (list (cons 'XOR_MX_reg (signal-value btor1508)))
          (append
           (list (cons 'pdetb_o_reg2 (signal-value btor1504)))
           (append
            (list (cons 'pdet_o_reg2 (signal-value btor1501)))
            (append
             (list (cons 'pdetb_o_reg1 (signal-value btor1498)))
             (append
              (list (cons 'pdet_o_reg1 (signal-value btor1495)))
              (append
               (list (cons 'MULTSIGN_ALU_reg (signal-value btor1492)))
               (append
                (list (cons 'CARRYIN_reg (signal-value btor1489)))
                (append
                 (list (cons 'COUT_reg (signal-value btor1486)))
                 (append
                  (list (cons 'ALUMODE10_reg (signal-value btor1483)))
                  (append
                   (list (cons 'qmultcarryin (signal-value btor1356)))
                   (append
                    (list (cons 'CARRYINSEL_reg (signal-value btor1479)))
                    (append
                     (list (cons 'V_DATA_reg (signal-value btor1476)))
                     (append
                      (list (cons 'U_DATA_reg (signal-value btor1473)))
                      (append
                       (list (cons 'AD_DATA_reg (signal-value btor1468)))
                       (append
                        (list (cons 'D_DATA_reg (signal-value btor1465)))
                        (append
                         (list (cons 'INMODE_reg (signal-value btor1460)))
                         (append
                          (list (cons 'C_reg (signal-value btor1454)))
                          (append
                           (list (cons 'OPMODE_reg (signal-value btor1449)))
                           (append
                            (list (cons 'ALU_OUT_reg (signal-value btor1445)))
                            (append
                             (list (cons 'ALUMODE_reg (signal-value btor1440)))
                             (append
                              (list (cons 'B2_reg (signal-value btor1436)))
                              (append
                               (list
                                (cons 'B1_DATA_out (signal-value btor1431)))
                               (append
                                (list (cons 'A2_reg (signal-value btor1425)))
                                (append
                                 (list (cons 'A1_reg (signal-value btor1420)))
                                 (list)))))))))))))))))))))))))))
       (cons
        'CARRYCASCOUT
        (signal
         (signal-value btor843)
         (append
          (list (cons 'XOR_MX_reg (signal-value btor1508)))
          (append
           (list (cons 'pdetb_o_reg2 (signal-value btor1504)))
           (append
            (list (cons 'pdet_o_reg2 (signal-value btor1501)))
            (append
             (list (cons 'pdetb_o_reg1 (signal-value btor1498)))
             (append
              (list (cons 'pdet_o_reg1 (signal-value btor1495)))
              (append
               (list (cons 'MULTSIGN_ALU_reg (signal-value btor1492)))
               (append
                (list (cons 'CARRYIN_reg (signal-value btor1489)))
                (append
                 (list (cons 'COUT_reg (signal-value btor1486)))
                 (append
                  (list (cons 'ALUMODE10_reg (signal-value btor1483)))
                  (append
                   (list (cons 'qmultcarryin (signal-value btor1356)))
                   (append
                    (list (cons 'CARRYINSEL_reg (signal-value btor1479)))
                    (append
                     (list (cons 'V_DATA_reg (signal-value btor1476)))
                     (append
                      (list (cons 'U_DATA_reg (signal-value btor1473)))
                      (append
                       (list (cons 'AD_DATA_reg (signal-value btor1468)))
                       (append
                        (list (cons 'D_DATA_reg (signal-value btor1465)))
                        (append
                         (list (cons 'INMODE_reg (signal-value btor1460)))
                         (append
                          (list (cons 'C_reg (signal-value btor1454)))
                          (append
                           (list (cons 'OPMODE_reg (signal-value btor1449)))
                           (append
                            (list (cons 'ALU_OUT_reg (signal-value btor1445)))
                            (append
                             (list (cons 'ALUMODE_reg (signal-value btor1440)))
                             (append
                              (list (cons 'B2_reg (signal-value btor1436)))
                              (append
                               (list
                                (cons 'B1_DATA_out (signal-value btor1431)))
                               (append
                                (list (cons 'A2_reg (signal-value btor1425)))
                                (append
                                 (list (cons 'A1_reg (signal-value btor1420)))
                                 (list)))))))))))))))))))))))))))
       (cons
        'P
        (signal
         (signal-value btor1040)
         (append
          (list (cons 'XOR_MX_reg (signal-value btor1508)))
          (append
           (list (cons 'pdetb_o_reg2 (signal-value btor1504)))
           (append
            (list (cons 'pdet_o_reg2 (signal-value btor1501)))
            (append
             (list (cons 'pdetb_o_reg1 (signal-value btor1498)))
             (append
              (list (cons 'pdet_o_reg1 (signal-value btor1495)))
              (append
               (list (cons 'MULTSIGN_ALU_reg (signal-value btor1492)))
               (append
                (list (cons 'CARRYIN_reg (signal-value btor1489)))
                (append
                 (list (cons 'COUT_reg (signal-value btor1486)))
                 (append
                  (list (cons 'ALUMODE10_reg (signal-value btor1483)))
                  (append
                   (list (cons 'qmultcarryin (signal-value btor1356)))
                   (append
                    (list (cons 'CARRYINSEL_reg (signal-value btor1479)))
                    (append
                     (list (cons 'V_DATA_reg (signal-value btor1476)))
                     (append
                      (list (cons 'U_DATA_reg (signal-value btor1473)))
                      (append
                       (list (cons 'AD_DATA_reg (signal-value btor1468)))
                       (append
                        (list (cons 'D_DATA_reg (signal-value btor1465)))
                        (append
                         (list (cons 'INMODE_reg (signal-value btor1460)))
                         (append
                          (list (cons 'C_reg (signal-value btor1454)))
                          (append
                           (list (cons 'OPMODE_reg (signal-value btor1449)))
                           (append
                            (list (cons 'ALU_OUT_reg (signal-value btor1445)))
                            (append
                             (list (cons 'ALUMODE_reg (signal-value btor1440)))
                             (append
                              (list (cons 'B2_reg (signal-value btor1436)))
                              (append
                               (list
                                (cons 'B1_DATA_out (signal-value btor1431)))
                               (append
                                (list (cons 'A2_reg (signal-value btor1425)))
                                (append
                                 (list (cons 'A1_reg (signal-value btor1420)))
                                 (list)))))))))))))))))))))))))))
       (cons
        'CARRYOUT
        (signal
         (signal-value btor872)
         (append
          (list (cons 'XOR_MX_reg (signal-value btor1508)))
          (append
           (list (cons 'pdetb_o_reg2 (signal-value btor1504)))
           (append
            (list (cons 'pdet_o_reg2 (signal-value btor1501)))
            (append
             (list (cons 'pdetb_o_reg1 (signal-value btor1498)))
             (append
              (list (cons 'pdet_o_reg1 (signal-value btor1495)))
              (append
               (list (cons 'MULTSIGN_ALU_reg (signal-value btor1492)))
               (append
                (list (cons 'CARRYIN_reg (signal-value btor1489)))
                (append
                 (list (cons 'COUT_reg (signal-value btor1486)))
                 (append
                  (list (cons 'ALUMODE10_reg (signal-value btor1483)))
                  (append
                   (list (cons 'qmultcarryin (signal-value btor1356)))
                   (append
                    (list (cons 'CARRYINSEL_reg (signal-value btor1479)))
                    (append
                     (list (cons 'V_DATA_reg (signal-value btor1476)))
                     (append
                      (list (cons 'U_DATA_reg (signal-value btor1473)))
                      (append
                       (list (cons 'AD_DATA_reg (signal-value btor1468)))
                       (append
                        (list (cons 'D_DATA_reg (signal-value btor1465)))
                        (append
                         (list (cons 'INMODE_reg (signal-value btor1460)))
                         (append
                          (list (cons 'C_reg (signal-value btor1454)))
                          (append
                           (list (cons 'OPMODE_reg (signal-value btor1449)))
                           (append
                            (list (cons 'ALU_OUT_reg (signal-value btor1445)))
                            (append
                             (list (cons 'ALUMODE_reg (signal-value btor1440)))
                             (append
                              (list (cons 'B2_reg (signal-value btor1436)))
                              (append
                               (list
                                (cons 'B1_DATA_out (signal-value btor1431)))
                               (append
                                (list (cons 'A2_reg (signal-value btor1425)))
                                (append
                                 (list (cons 'A1_reg (signal-value btor1420)))
                                 (list)))))))))))))))))))))))))))
       (cons
        'UNDERFLOW
        (signal
         (signal-value btor1048)
         (append
          (list (cons 'XOR_MX_reg (signal-value btor1508)))
          (append
           (list (cons 'pdetb_o_reg2 (signal-value btor1504)))
           (append
            (list (cons 'pdet_o_reg2 (signal-value btor1501)))
            (append
             (list (cons 'pdetb_o_reg1 (signal-value btor1498)))
             (append
              (list (cons 'pdet_o_reg1 (signal-value btor1495)))
              (append
               (list (cons 'MULTSIGN_ALU_reg (signal-value btor1492)))
               (append
                (list (cons 'CARRYIN_reg (signal-value btor1489)))
                (append
                 (list (cons 'COUT_reg (signal-value btor1486)))
                 (append
                  (list (cons 'ALUMODE10_reg (signal-value btor1483)))
                  (append
                   (list (cons 'qmultcarryin (signal-value btor1356)))
                   (append
                    (list (cons 'CARRYINSEL_reg (signal-value btor1479)))
                    (append
                     (list (cons 'V_DATA_reg (signal-value btor1476)))
                     (append
                      (list (cons 'U_DATA_reg (signal-value btor1473)))
                      (append
                       (list (cons 'AD_DATA_reg (signal-value btor1468)))
                       (append
                        (list (cons 'D_DATA_reg (signal-value btor1465)))
                        (append
                         (list (cons 'INMODE_reg (signal-value btor1460)))
                         (append
                          (list (cons 'C_reg (signal-value btor1454)))
                          (append
                           (list (cons 'OPMODE_reg (signal-value btor1449)))
                           (append
                            (list (cons 'ALU_OUT_reg (signal-value btor1445)))
                            (append
                             (list (cons 'ALUMODE_reg (signal-value btor1440)))
                             (append
                              (list (cons 'B2_reg (signal-value btor1436)))
                              (append
                               (list
                                (cons 'B1_DATA_out (signal-value btor1431)))
                               (append
                                (list (cons 'A2_reg (signal-value btor1425)))
                                (append
                                 (list (cons 'A1_reg (signal-value btor1420)))
                                 (list)))))))))))))))))))))))))))
       (cons
        'BCOUT
        (signal
         (signal-value btor130)
         (append
          (list (cons 'XOR_MX_reg (signal-value btor1508)))
          (append
           (list (cons 'pdetb_o_reg2 (signal-value btor1504)))
           (append
            (list (cons 'pdet_o_reg2 (signal-value btor1501)))
            (append
             (list (cons 'pdetb_o_reg1 (signal-value btor1498)))
             (append
              (list (cons 'pdet_o_reg1 (signal-value btor1495)))
              (append
               (list (cons 'MULTSIGN_ALU_reg (signal-value btor1492)))
               (append
                (list (cons 'CARRYIN_reg (signal-value btor1489)))
                (append
                 (list (cons 'COUT_reg (signal-value btor1486)))
                 (append
                  (list (cons 'ALUMODE10_reg (signal-value btor1483)))
                  (append
                   (list (cons 'qmultcarryin (signal-value btor1356)))
                   (append
                    (list (cons 'CARRYINSEL_reg (signal-value btor1479)))
                    (append
                     (list (cons 'V_DATA_reg (signal-value btor1476)))
                     (append
                      (list (cons 'U_DATA_reg (signal-value btor1473)))
                      (append
                       (list (cons 'AD_DATA_reg (signal-value btor1468)))
                       (append
                        (list (cons 'D_DATA_reg (signal-value btor1465)))
                        (append
                         (list (cons 'INMODE_reg (signal-value btor1460)))
                         (append
                          (list (cons 'C_reg (signal-value btor1454)))
                          (append
                           (list (cons 'OPMODE_reg (signal-value btor1449)))
                           (append
                            (list (cons 'ALU_OUT_reg (signal-value btor1445)))
                            (append
                             (list (cons 'ALUMODE_reg (signal-value btor1440)))
                             (append
                              (list (cons 'B2_reg (signal-value btor1436)))
                              (append
                               (list
                                (cons 'B1_DATA_out (signal-value btor1431)))
                               (append
                                (list (cons 'A2_reg (signal-value btor1425)))
                                (append
                                 (list (cons 'A1_reg (signal-value btor1420)))
                                 (list)))))))))))))))))))))))))))
       (cons
        'MULTSIGNOUT
        (signal
         (signal-value btor876)
         (append
          (list (cons 'XOR_MX_reg (signal-value btor1508)))
          (append
           (list (cons 'pdetb_o_reg2 (signal-value btor1504)))
           (append
            (list (cons 'pdet_o_reg2 (signal-value btor1501)))
            (append
             (list (cons 'pdetb_o_reg1 (signal-value btor1498)))
             (append
              (list (cons 'pdet_o_reg1 (signal-value btor1495)))
              (append
               (list (cons 'MULTSIGN_ALU_reg (signal-value btor1492)))
               (append
                (list (cons 'CARRYIN_reg (signal-value btor1489)))
                (append
                 (list (cons 'COUT_reg (signal-value btor1486)))
                 (append
                  (list (cons 'ALUMODE10_reg (signal-value btor1483)))
                  (append
                   (list (cons 'qmultcarryin (signal-value btor1356)))
                   (append
                    (list (cons 'CARRYINSEL_reg (signal-value btor1479)))
                    (append
                     (list (cons 'V_DATA_reg (signal-value btor1476)))
                     (append
                      (list (cons 'U_DATA_reg (signal-value btor1473)))
                      (append
                       (list (cons 'AD_DATA_reg (signal-value btor1468)))
                       (append
                        (list (cons 'D_DATA_reg (signal-value btor1465)))
                        (append
                         (list (cons 'INMODE_reg (signal-value btor1460)))
                         (append
                          (list (cons 'C_reg (signal-value btor1454)))
                          (append
                           (list (cons 'OPMODE_reg (signal-value btor1449)))
                           (append
                            (list (cons 'ALU_OUT_reg (signal-value btor1445)))
                            (append
                             (list (cons 'ALUMODE_reg (signal-value btor1440)))
                             (append
                              (list (cons 'B2_reg (signal-value btor1436)))
                              (append
                               (list
                                (cons 'B1_DATA_out (signal-value btor1431)))
                               (append
                                (list (cons 'A2_reg (signal-value btor1425)))
                                (append
                                 (list (cons 'A1_reg (signal-value btor1420)))
                                 (list)))))))))))))))))))))))))))
       (cons
        'OVERFLOW
        (signal
         (signal-value btor1038)
         (append
          (list (cons 'XOR_MX_reg (signal-value btor1508)))
          (append
           (list (cons 'pdetb_o_reg2 (signal-value btor1504)))
           (append
            (list (cons 'pdet_o_reg2 (signal-value btor1501)))
            (append
             (list (cons 'pdetb_o_reg1 (signal-value btor1498)))
             (append
              (list (cons 'pdet_o_reg1 (signal-value btor1495)))
              (append
               (list (cons 'MULTSIGN_ALU_reg (signal-value btor1492)))
               (append
                (list (cons 'CARRYIN_reg (signal-value btor1489)))
                (append
                 (list (cons 'COUT_reg (signal-value btor1486)))
                 (append
                  (list (cons 'ALUMODE10_reg (signal-value btor1483)))
                  (append
                   (list (cons 'qmultcarryin (signal-value btor1356)))
                   (append
                    (list (cons 'CARRYINSEL_reg (signal-value btor1479)))
                    (append
                     (list (cons 'V_DATA_reg (signal-value btor1476)))
                     (append
                      (list (cons 'U_DATA_reg (signal-value btor1473)))
                      (append
                       (list (cons 'AD_DATA_reg (signal-value btor1468)))
                       (append
                        (list (cons 'D_DATA_reg (signal-value btor1465)))
                        (append
                         (list (cons 'INMODE_reg (signal-value btor1460)))
                         (append
                          (list (cons 'C_reg (signal-value btor1454)))
                          (append
                           (list (cons 'OPMODE_reg (signal-value btor1449)))
                           (append
                            (list (cons 'ALU_OUT_reg (signal-value btor1445)))
                            (append
                             (list (cons 'ALUMODE_reg (signal-value btor1440)))
                             (append
                              (list (cons 'B2_reg (signal-value btor1436)))
                              (append
                               (list
                                (cons 'B1_DATA_out (signal-value btor1431)))
                               (append
                                (list (cons 'A2_reg (signal-value btor1425)))
                                (append
                                 (list (cons 'A1_reg (signal-value btor1420)))
                                 (list)))))))))))))))))))))))))))
       (cons
        'ACOUT
        (signal
         (signal-value btor114)
         (append
          (list (cons 'XOR_MX_reg (signal-value btor1508)))
          (append
           (list (cons 'pdetb_o_reg2 (signal-value btor1504)))
           (append
            (list (cons 'pdet_o_reg2 (signal-value btor1501)))
            (append
             (list (cons 'pdetb_o_reg1 (signal-value btor1498)))
             (append
              (list (cons 'pdet_o_reg1 (signal-value btor1495)))
              (append
               (list (cons 'MULTSIGN_ALU_reg (signal-value btor1492)))
               (append
                (list (cons 'CARRYIN_reg (signal-value btor1489)))
                (append
                 (list (cons 'COUT_reg (signal-value btor1486)))
                 (append
                  (list (cons 'ALUMODE10_reg (signal-value btor1483)))
                  (append
                   (list (cons 'qmultcarryin (signal-value btor1356)))
                   (append
                    (list (cons 'CARRYINSEL_reg (signal-value btor1479)))
                    (append
                     (list (cons 'V_DATA_reg (signal-value btor1476)))
                     (append
                      (list (cons 'U_DATA_reg (signal-value btor1473)))
                      (append
                       (list (cons 'AD_DATA_reg (signal-value btor1468)))
                       (append
                        (list (cons 'D_DATA_reg (signal-value btor1465)))
                        (append
                         (list (cons 'INMODE_reg (signal-value btor1460)))
                         (append
                          (list (cons 'C_reg (signal-value btor1454)))
                          (append
                           (list (cons 'OPMODE_reg (signal-value btor1449)))
                           (append
                            (list (cons 'ALU_OUT_reg (signal-value btor1445)))
                            (append
                             (list (cons 'ALUMODE_reg (signal-value btor1440)))
                             (append
                              (list (cons 'B2_reg (signal-value btor1436)))
                              (append
                               (list
                                (cons 'B1_DATA_out (signal-value btor1431)))
                               (append
                                (list (cons 'A2_reg (signal-value btor1425)))
                                (append
                                 (list (cons 'A1_reg (signal-value btor1420)))
                                 (list)))))))))))))))))))))))))))
       (cons
        'PATTERNDETECT
        (signal
         (signal-value btor1027)
         (append
          (list (cons 'XOR_MX_reg (signal-value btor1508)))
          (append
           (list (cons 'pdetb_o_reg2 (signal-value btor1504)))
           (append
            (list (cons 'pdet_o_reg2 (signal-value btor1501)))
            (append
             (list (cons 'pdetb_o_reg1 (signal-value btor1498)))
             (append
              (list (cons 'pdet_o_reg1 (signal-value btor1495)))
              (append
               (list (cons 'MULTSIGN_ALU_reg (signal-value btor1492)))
               (append
                (list (cons 'CARRYIN_reg (signal-value btor1489)))
                (append
                 (list (cons 'COUT_reg (signal-value btor1486)))
                 (append
                  (list (cons 'ALUMODE10_reg (signal-value btor1483)))
                  (append
                   (list (cons 'qmultcarryin (signal-value btor1356)))
                   (append
                    (list (cons 'CARRYINSEL_reg (signal-value btor1479)))
                    (append
                     (list (cons 'V_DATA_reg (signal-value btor1476)))
                     (append
                      (list (cons 'U_DATA_reg (signal-value btor1473)))
                      (append
                       (list (cons 'AD_DATA_reg (signal-value btor1468)))
                       (append
                        (list (cons 'D_DATA_reg (signal-value btor1465)))
                        (append
                         (list (cons 'INMODE_reg (signal-value btor1460)))
                         (append
                          (list (cons 'C_reg (signal-value btor1454)))
                          (append
                           (list (cons 'OPMODE_reg (signal-value btor1449)))
                           (append
                            (list (cons 'ALU_OUT_reg (signal-value btor1445)))
                            (append
                             (list (cons 'ALUMODE_reg (signal-value btor1440)))
                             (append
                              (list (cons 'B2_reg (signal-value btor1436)))
                              (append
                               (list
                                (cons 'B1_DATA_out (signal-value btor1431)))
                               (append
                                (list (cons 'A2_reg (signal-value btor1425)))
                                (append
                                 (list (cons 'A1_reg (signal-value btor1420)))
                                 (list)))))))))))))))))))))))))))))))
