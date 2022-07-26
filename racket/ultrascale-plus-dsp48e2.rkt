#lang racket/base
;;; Implementation automatically generated via
;;;
;;; racket racket/btor-to-racket.rkt --input-file racket/DSP48E2.btor --output-signal P \
;;;   --output-file ultrascale-plus-dsp48e2.rkt
;;;
;;; See the enum in utils/tests/convert-module-to-btor/DSP48E2.v to understand how to set the values
;;; of parameters that originally took string arguments. E.g. if you wanted to feed the A_INPUT param
;;; the setting "DIRECT", you would give it the value (bv->signal (bv 7 5)), as the DIRECT enum
;;; variant is defined as DIRECT_ENUM_VAL = 7.

(provide ultrascale-plus-dsp48e2-P)

(require "stateful-design-experiment.rkt"
         rosette
         racket/hash)

(define ultrascale-plus-dsp48e2-P
  ;;; (define/contract ultrascale-plus-dsp48e2-P
  ;;;  (->* ()
  ;;;       (#:A (struct/c signal (bitvector 30) (hash/c symbol? bv?))
  ;;;        #:ACASCREG (struct/c signal (bitvector 32) (hash/c symbol? bv?))
  ;;;        #:ACIN (struct/c signal (bitvector 30) (hash/c symbol? bv?))
  ;;;        #:ADREG (struct/c signal (bitvector 32) (hash/c symbol? bv?))
  ;;;        #:ALUMODE (struct/c signal (bitvector 4) (hash/c symbol? bv?))
  ;;;        #:ALUMODEREG (struct/c signal (bitvector 32) (hash/c symbol? bv?))
  ;;;        #:AMULTSEL (struct/c signal (bitvector 5) (hash/c symbol? bv?))
  ;;;        #:AREG (struct/c signal (bitvector 32) (hash/c symbol? bv?))
  ;;;        #:AUTORESET_PATDET (struct/c signal (bitvector 5) (hash/c symbol? bv?))
  ;;;        #:AUTORESET_PRIORITY (struct/c signal (bitvector 5) (hash/c symbol? bv?))
  ;;;        #:A_INPUT (struct/c signal (bitvector 5) (hash/c symbol? bv?))
  ;;;        #:B (struct/c signal (bitvector 18) (hash/c symbol? bv?))
  ;;;        #:BCASCREG (struct/c signal (bitvector 32) (hash/c symbol? bv?))
  ;;;        #:BCIN (struct/c signal (bitvector 18) (hash/c symbol? bv?))
  ;;;        #:BMULTSEL (struct/c signal (bitvector 5) (hash/c symbol? bv?))
  ;;;        #:BREG (struct/c signal (bitvector 32) (hash/c symbol? bv?))
  ;;;        #:B_INPUT (struct/c signal (bitvector 5) (hash/c symbol? bv?))
  ;;;        #:C (struct/c signal (bitvector 48) (hash/c symbol? bv?))
  ;;;        #:CARRYCASCIN (struct/c signal (bitvector 1) (hash/c symbol? bv?))
  ;;;        #:CARRYIN (struct/c signal (bitvector 1) (hash/c symbol? bv?))
  ;;;        #:CARRYINREG (struct/c signal (bitvector 32) (hash/c symbol? bv?))
  ;;;        #:CARRYINSEL (struct/c signal (bitvector 3) (hash/c symbol? bv?))
  ;;;        #:CARRYINSELREG (struct/c signal (bitvector 32) (hash/c symbol? bv?))
  ;;;        #:CEA1 (struct/c signal (bitvector 1) (hash/c symbol? bv?))
  ;;;        #:CEA2 (struct/c signal (bitvector 1) (hash/c symbol? bv?))
  ;;;        #:CEAD (struct/c signal (bitvector 1) (hash/c symbol? bv?))
  ;;;        #:CEALUMODE (struct/c signal (bitvector 1) (hash/c symbol? bv?))
  ;;;        #:CEB1 (struct/c signal (bitvector 1) (hash/c symbol? bv?))
  ;;;        #:CEB2 (struct/c signal (bitvector 1) (hash/c symbol? bv?))
  ;;;        #:CEC (struct/c signal (bitvector 1) (hash/c symbol? bv?))
  ;;;        #:CECARRYIN (struct/c signal (bitvector 1) (hash/c symbol? bv?))
  ;;;        #:CECTRL (struct/c signal (bitvector 1) (hash/c symbol? bv?))
  ;;;        #:CED (struct/c signal (bitvector 1) (hash/c symbol? bv?))
  ;;;        #:CEINMODE (struct/c signal (bitvector 1) (hash/c symbol? bv?))
  ;;;        #:CEM (struct/c signal (bitvector 1) (hash/c symbol? bv?))
  ;;;        #:CEP (struct/c signal (bitvector 1) (hash/c symbol? bv?))
  ;;;        #:CLK (struct/c signal (bitvector 1) (hash/c symbol? bv?))
  ;;;        #:CREG (struct/c signal (bitvector 32) (hash/c symbol? bv?))
  ;;;        #:D (struct/c signal (bitvector 27) (hash/c symbol? bv?))
  ;;;        #:DREG (struct/c signal (bitvector 32) (hash/c symbol? bv?))
  ;;;        #:INMODE (struct/c signal (bitvector 5) (hash/c symbol? bv?))
  ;;;        #:INMODEREG (struct/c signal (bitvector 32) (hash/c symbol? bv?))
  ;;;        #:IS_ALUMODE_INVERTED (struct/c signal (bitvector 4) (hash/c symbol? bv?))
  ;;;        #:IS_CARRYIN_INVERTED (struct/c signal (bitvector 1) (hash/c symbol? bv?))
  ;;;        #:IS_CLK_INVERTED (struct/c signal (bitvector 1) (hash/c symbol? bv?))
  ;;;        #:IS_INMODE_INVERTED (struct/c signal (bitvector 5) (hash/c symbol? bv?))
  ;;;        #:IS_OPMODE_INVERTED (struct/c signal (bitvector 9) (hash/c symbol? bv?))
  ;;;        #:IS_RSTALLCARRYIN_INVERTED (struct/c signal (bitvector 1) (hash/c symbol? bv?))
  ;;;        #:IS_RSTALUMODE_INVERTED (struct/c signal (bitvector 1) (hash/c symbol? bv?))
  ;;;        #:IS_RSTA_INVERTED (struct/c signal (bitvector 1) (hash/c symbol? bv?))
  ;;;        #:IS_RSTB_INVERTED (struct/c signal (bitvector 1) (hash/c symbol? bv?))
  ;;;        #:IS_RSTCTRL_INVERTED (struct/c signal (bitvector 1) (hash/c symbol? bv?))
  ;;;        #:IS_RSTC_INVERTED (struct/c signal (bitvector 1) (hash/c symbol? bv?))
  ;;;        #:IS_RSTD_INVERTED (struct/c signal (bitvector 1) (hash/c symbol? bv?))
  ;;;        #:IS_RSTINMODE_INVERTED (struct/c signal (bitvector 1) (hash/c symbol? bv?))
  ;;;        #:IS_RSTM_INVERTED (struct/c signal (bitvector 1) (hash/c symbol? bv?))
  ;;;        #:IS_RSTP_INVERTED (struct/c signal (bitvector 1) (hash/c symbol? bv?))
  ;;;        #:MASK (struct/c signal (bitvector 48) (hash/c symbol? bv?))
  ;;;        #:MREG (struct/c signal (bitvector 32) (hash/c symbol? bv?))
  ;;;        #:MULTSIGNIN (struct/c signal (bitvector 1) (hash/c symbol? bv?))
  ;;;        #:OPMODE (struct/c signal (bitvector 9) (hash/c symbol? bv?))
  ;;;        #:OPMODEREG (struct/c signal (bitvector 32) (hash/c symbol? bv?))
  ;;;        #:PATTERN (struct/c signal (bitvector 48) (hash/c symbol? bv?))
  ;;;        #:PCIN (struct/c signal (bitvector 48) (hash/c symbol? bv?))
  ;;;        #:PREADDINSEL (struct/c signal (bitvector 5) (hash/c symbol? bv?))
  ;;;        #:PREG (struct/c signal (bitvector 32) (hash/c symbol? bv?))
  ;;;        #:RND (struct/c signal (bitvector 48) (hash/c symbol? bv?))
  ;;;        #:RSTA (struct/c signal (bitvector 1) (hash/c symbol? bv?))
  ;;;        #:RSTALLCARRYIN (struct/c signal (bitvector 1) (hash/c symbol? bv?))
  ;;;        #:RSTALUMODE (struct/c signal (bitvector 1) (hash/c symbol? bv?))
  ;;;        #:RSTB (struct/c signal (bitvector 1) (hash/c symbol? bv?))
  ;;;        #:RSTC (struct/c signal (bitvector 1) (hash/c symbol? bv?))
  ;;;        #:RSTCTRL (struct/c signal (bitvector 1) (hash/c symbol? bv?))
  ;;;        #:RSTD (struct/c signal (bitvector 1) (hash/c symbol? bv?))
  ;;;        #:RSTINMODE (struct/c signal (bitvector 1) (hash/c symbol? bv?))
  ;;;        #:RSTM (struct/c signal (bitvector 1) (hash/c symbol? bv?))
  ;;;        #:RSTP (struct/c signal (bitvector 1) (hash/c symbol? bv?))
  ;;;        #:SEL_MASK (struct/c signal (bitvector 5) (hash/c symbol? bv?))
  ;;;        #:SEL_PATTERN (struct/c signal (bitvector 5) (hash/c symbol? bv?))
  ;;;        #:USE_MULT (struct/c signal (bitvector 5) (hash/c symbol? bv?))
  ;;;        #:USE_PATTERN_DETECT (struct/c signal (bitvector 5) (hash/c symbol? bv?))
  ;;;        #:USE_SIMD (struct/c signal (bitvector 5) (hash/c symbol? bv?))
  ;;;        #:USE_WIDEXOR (struct/c signal (bitvector 5) (hash/c symbol? bv?))
  ;;;        #:XORSIMD (struct/c signal (bitvector 5) (hash/c symbol? bv?))
  ;;;        #:unnamed-input-531 (struct/c signal (bitvector 48) (hash/c symbol? bv?))
  ;;;        #:unnamed-input-897 (struct/c signal (bitvector 48) (hash/c symbol? bv?))
  ;;;        #:unnamed-input-1276 (struct/c signal (bitvector 48) (hash/c symbol? bv?))
  ;;;        #:unnamed-input-1332 (struct/c signal (bitvector 48) (hash/c symbol? bv?))
  ;;;        #:unnamed-input-1376 (struct/c signal (bitvector 1) (hash/c symbol? bv?)))
  ;;;       (struct/c signal bv? hash?))
  (λ (#:A (A (bv->signal (constant (list 'A 'symbolic-constant) (bitvector 30))))
      #:ACASCREG (ACASCREG (bv->signal (constant (list 'ACASCREG 'symbolic-constant) (bitvector 32))))
      #:ACIN (ACIN (bv->signal (constant (list 'ACIN 'symbolic-constant) (bitvector 30))))
      #:ADREG (ADREG (bv->signal (constant (list 'ADREG 'symbolic-constant) (bitvector 32))))
      #:ALUMODE (ALUMODE (bv->signal (constant (list 'ALUMODE 'symbolic-constant) (bitvector 4))))
      #:ALUMODEREG (ALUMODEREG (bv->signal (constant (list 'ALUMODEREG 'symbolic-constant)
                                                     (bitvector 32))))
      #:AMULTSEL (AMULTSEL (bv->signal (constant (list 'AMULTSEL 'symbolic-constant) (bitvector 5))))
      #:AREG (AREG (bv->signal (constant (list 'AREG 'symbolic-constant) (bitvector 32))))
      #:AUTORESET_PATDET
      (AUTORESET_PATDET (bv->signal (constant (list 'AUTORESET_PATDET 'symbolic-constant)
                                              (bitvector 5))))
      #:AUTORESET_PRIORITY
      (AUTORESET_PRIORITY
       (bv->signal (constant (list 'AUTORESET_PRIORITY 'symbolic-constant) (bitvector 5))))
      #:A_INPUT (A_INPUT (bv->signal (constant (list 'A_INPUT 'symbolic-constant) (bitvector 5))))
      #:B (B (bv->signal (constant (list 'B 'symbolic-constant) (bitvector 18))))
      #:BCASCREG (BCASCREG (bv->signal (constant (list 'BCASCREG 'symbolic-constant) (bitvector 32))))
      #:BCIN (BCIN (bv->signal (constant (list 'BCIN 'symbolic-constant) (bitvector 18))))
      #:BMULTSEL (BMULTSEL (bv->signal (constant (list 'BMULTSEL 'symbolic-constant) (bitvector 5))))
      #:BREG (BREG (bv->signal (constant (list 'BREG 'symbolic-constant) (bitvector 32))))
      #:B_INPUT (B_INPUT (bv->signal (constant (list 'B_INPUT 'symbolic-constant) (bitvector 5))))
      #:C (C (bv->signal (constant (list 'C 'symbolic-constant) (bitvector 48))))
      #:CARRYCASCIN (CARRYCASCIN (bv->signal (constant (list 'CARRYCASCIN 'symbolic-constant)
                                                       (bitvector 1))))
      #:CARRYIN (CARRYIN (bv->signal (constant (list 'CARRYIN 'symbolic-constant) (bitvector 1))))
      #:CARRYINREG (CARRYINREG (bv->signal (constant (list 'CARRYINREG 'symbolic-constant)
                                                     (bitvector 32))))
      #:CARRYINSEL (CARRYINSEL (bv->signal (constant (list 'CARRYINSEL 'symbolic-constant)
                                                     (bitvector 3))))
      #:CARRYINSELREG (CARRYINSELREG (bv->signal (constant (list 'CARRYINSELREG 'symbolic-constant)
                                                           (bitvector 32))))
      #:CEA1 (CEA1 (bv->signal (constant (list 'CEA1 'symbolic-constant) (bitvector 1))))
      #:CEA2 (CEA2 (bv->signal (constant (list 'CEA2 'symbolic-constant) (bitvector 1))))
      #:CEAD (CEAD (bv->signal (constant (list 'CEAD 'symbolic-constant) (bitvector 1))))
      #:CEALUMODE (CEALUMODE (bv->signal (constant (list 'CEALUMODE 'symbolic-constant)
                                                   (bitvector 1))))
      #:CEB1 (CEB1 (bv->signal (constant (list 'CEB1 'symbolic-constant) (bitvector 1))))
      #:CEB2 (CEB2 (bv->signal (constant (list 'CEB2 'symbolic-constant) (bitvector 1))))
      #:CEC (CEC (bv->signal (constant (list 'CEC 'symbolic-constant) (bitvector 1))))
      #:CECARRYIN (CECARRYIN (bv->signal (constant (list 'CECARRYIN 'symbolic-constant)
                                                   (bitvector 1))))
      #:CECTRL (CECTRL (bv->signal (constant (list 'CECTRL 'symbolic-constant) (bitvector 1))))
      #:CED (CED (bv->signal (constant (list 'CED 'symbolic-constant) (bitvector 1))))
      #:CEINMODE (CEINMODE (bv->signal (constant (list 'CEINMODE 'symbolic-constant) (bitvector 1))))
      #:CEM (CEM (bv->signal (constant (list 'CEM 'symbolic-constant) (bitvector 1))))
      #:CEP (CEP (bv->signal (constant (list 'CEP 'symbolic-constant) (bitvector 1))))
      #:CLK (CLK (bv->signal (constant (list 'CLK 'symbolic-constant) (bitvector 1))))
      #:CREG (CREG (bv->signal (constant (list 'CREG 'symbolic-constant) (bitvector 32))))
      #:D (D (bv->signal (constant (list 'D 'symbolic-constant) (bitvector 27))))
      #:DREG (DREG (bv->signal (constant (list 'DREG 'symbolic-constant) (bitvector 32))))
      #:INMODE (INMODE (bv->signal (constant (list 'INMODE 'symbolic-constant) (bitvector 5))))
      #:INMODEREG (INMODEREG (bv->signal (constant (list 'INMODEREG 'symbolic-constant)
                                                   (bitvector 32))))
      #:IS_ALUMODE_INVERTED
      (IS_ALUMODE_INVERTED
       (bv->signal (constant (list 'IS_ALUMODE_INVERTED 'symbolic-constant) (bitvector 4))))
      #:IS_CARRYIN_INVERTED
      (IS_CARRYIN_INVERTED
       (bv->signal (constant (list 'IS_CARRYIN_INVERTED 'symbolic-constant) (bitvector 1))))
      #:IS_CLK_INVERTED
      (IS_CLK_INVERTED (bv->signal (constant (list 'IS_CLK_INVERTED 'symbolic-constant)
                                             (bitvector 1))))
      #:IS_INMODE_INVERTED
      (IS_INMODE_INVERTED
       (bv->signal (constant (list 'IS_INMODE_INVERTED 'symbolic-constant) (bitvector 5))))
      #:IS_OPMODE_INVERTED
      (IS_OPMODE_INVERTED
       (bv->signal (constant (list 'IS_OPMODE_INVERTED 'symbolic-constant) (bitvector 9))))
      #:IS_RSTALLCARRYIN_INVERTED
      (IS_RSTALLCARRYIN_INVERTED
       (bv->signal (constant (list 'IS_RSTALLCARRYIN_INVERTED 'symbolic-constant) (bitvector 1))))
      #:IS_RSTALUMODE_INVERTED
      (IS_RSTALUMODE_INVERTED
       (bv->signal (constant (list 'IS_RSTALUMODE_INVERTED 'symbolic-constant) (bitvector 1))))
      #:IS_RSTA_INVERTED
      (IS_RSTA_INVERTED (bv->signal (constant (list 'IS_RSTA_INVERTED 'symbolic-constant)
                                              (bitvector 1))))
      #:IS_RSTB_INVERTED
      (IS_RSTB_INVERTED (bv->signal (constant (list 'IS_RSTB_INVERTED 'symbolic-constant)
                                              (bitvector 1))))
      #:IS_RSTCTRL_INVERTED
      (IS_RSTCTRL_INVERTED
       (bv->signal (constant (list 'IS_RSTCTRL_INVERTED 'symbolic-constant) (bitvector 1))))
      #:IS_RSTC_INVERTED
      (IS_RSTC_INVERTED (bv->signal (constant (list 'IS_RSTC_INVERTED 'symbolic-constant)
                                              (bitvector 1))))
      #:IS_RSTD_INVERTED
      (IS_RSTD_INVERTED (bv->signal (constant (list 'IS_RSTD_INVERTED 'symbolic-constant)
                                              (bitvector 1))))
      #:IS_RSTINMODE_INVERTED
      (IS_RSTINMODE_INVERTED
       (bv->signal (constant (list 'IS_RSTINMODE_INVERTED 'symbolic-constant) (bitvector 1))))
      #:IS_RSTM_INVERTED
      (IS_RSTM_INVERTED (bv->signal (constant (list 'IS_RSTM_INVERTED 'symbolic-constant)
                                              (bitvector 1))))
      #:IS_RSTP_INVERTED
      (IS_RSTP_INVERTED (bv->signal (constant (list 'IS_RSTP_INVERTED 'symbolic-constant)
                                              (bitvector 1))))
      #:MASK (MASK (bv->signal (constant (list 'MASK 'symbolic-constant) (bitvector 48))))
      #:MREG (MREG (bv->signal (constant (list 'MREG 'symbolic-constant) (bitvector 32))))
      #:MULTSIGNIN (MULTSIGNIN (bv->signal (constant (list 'MULTSIGNIN 'symbolic-constant)
                                                     (bitvector 1))))
      #:OPMODE (OPMODE (bv->signal (constant (list 'OPMODE 'symbolic-constant) (bitvector 9))))
      #:OPMODEREG (OPMODEREG (bv->signal (constant (list 'OPMODEREG 'symbolic-constant)
                                                   (bitvector 32))))
      #:PATTERN (PATTERN (bv->signal (constant (list 'PATTERN 'symbolic-constant) (bitvector 48))))
      #:PCIN (PCIN (bv->signal (constant (list 'PCIN 'symbolic-constant) (bitvector 48))))
      #:PREADDINSEL (PREADDINSEL (bv->signal (constant (list 'PREADDINSEL 'symbolic-constant)
                                                       (bitvector 5))))
      #:PREG (PREG (bv->signal (constant (list 'PREG 'symbolic-constant) (bitvector 32))))
      #:RND (RND (bv->signal (constant (list 'RND 'symbolic-constant) (bitvector 48))))
      #:RSTA (RSTA (bv->signal (constant (list 'RSTA 'symbolic-constant) (bitvector 1))))
      #:RSTALLCARRYIN (RSTALLCARRYIN (bv->signal (constant (list 'RSTALLCARRYIN 'symbolic-constant)
                                                           (bitvector 1))))
      #:RSTALUMODE (RSTALUMODE (bv->signal (constant (list 'RSTALUMODE 'symbolic-constant)
                                                     (bitvector 1))))
      #:RSTB (RSTB (bv->signal (constant (list 'RSTB 'symbolic-constant) (bitvector 1))))
      #:RSTC (RSTC (bv->signal (constant (list 'RSTC 'symbolic-constant) (bitvector 1))))
      #:RSTCTRL (RSTCTRL (bv->signal (constant (list 'RSTCTRL 'symbolic-constant) (bitvector 1))))
      #:RSTD (RSTD (bv->signal (constant (list 'RSTD 'symbolic-constant) (bitvector 1))))
      #:RSTINMODE (RSTINMODE (bv->signal (constant (list 'RSTINMODE 'symbolic-constant)
                                                   (bitvector 1))))
      #:RSTM (RSTM (bv->signal (constant (list 'RSTM 'symbolic-constant) (bitvector 1))))
      #:RSTP (RSTP (bv->signal (constant (list 'RSTP 'symbolic-constant) (bitvector 1))))
      #:SEL_MASK (SEL_MASK (bv->signal (constant (list 'SEL_MASK 'symbolic-constant) (bitvector 5))))
      #:SEL_PATTERN (SEL_PATTERN (bv->signal (constant (list 'SEL_PATTERN 'symbolic-constant)
                                                       (bitvector 5))))
      #:USE_MULT (USE_MULT (bv->signal (constant (list 'USE_MULT 'symbolic-constant) (bitvector 5))))
      #:USE_PATTERN_DETECT
      (USE_PATTERN_DETECT
       (bv->signal (constant (list 'USE_PATTERN_DETECT 'symbolic-constant) (bitvector 5))))
      #:USE_SIMD (USE_SIMD (bv->signal (constant (list 'USE_SIMD 'symbolic-constant) (bitvector 5))))
      #:USE_WIDEXOR (USE_WIDEXOR (bv->signal (constant (list 'USE_WIDEXOR 'symbolic-constant)
                                                       (bitvector 5))))
      #:XORSIMD (XORSIMD (bv->signal (constant (list 'XORSIMD 'symbolic-constant) (bitvector 5))))
      #:unnamed-input-331
      (unnamed-input-331 (bv->signal (constant (list 'unnamed-input-331 'symbolic-constant)
                                               (bitvector 48))))
      #:unnamed-input-488
      (unnamed-input-488 (bv->signal (constant (list 'unnamed-input-488 'symbolic-constant)
                                               (bitvector 48))))
      #:unnamed-input-750
      (unnamed-input-750 (bv->signal (constant (list 'unnamed-input-750 'symbolic-constant)
                                               (bitvector 48))))
      #:unnamed-input-806
      (unnamed-input-806 (bv->signal (constant (list 'unnamed-input-806 'symbolic-constant)
                                               (bitvector 48))))
      #:unnamed-input-850
      (unnamed-input-850 (bv->signal (constant (list 'unnamed-input-850 'symbolic-constant)
                                               (bitvector 1)))))
    (let* ([merged-input-state-hash (hash)]
           [init-hash
            (hash-set
             (hash-set
              (hash-set
               (hash-set
                (hash-set
                 (hash-set
                  (hash-set
                   (hash-set
                    (hash-set
                     (hash-set
                      (hash-set
                       (hash-set
                        (hash-set
                         (hash-set
                          (hash-set
                           (hash-set
                            (hash-set
                             (hash-set
                              (hash-set
                               (hash-set
                                (hash-set
                                 (hash-set (hash-set (hash-set (hash) 'state98 (bv 1 (bitvector 1)))
                                                     'state118
                                                     (bv 1 (bitvector 1)))
                                           'state132
                                           (bv 1 (bitvector 1)))
                                 'state146
                                 (bv 1 (bitvector 1)))
                                'state175
                                (bv 1 (bitvector 1)))
                               'state334
                               (bv 1 (bitvector 1)))
                              'state411
                              (bv 1 (bitvector 1)))
                             'state470
                             (bv 1 (bitvector 1)))
                            'state519
                            (bv 1 (bitvector 1)))
                           'state543
                           (bv 1 (bitvector 1)))
                          'state612
                          (bv 1 (bitvector 1)))
                         'state723
                         (bv 1 (bitvector 1)))
                        'state764
                        (bv 1 (bitvector 1)))
                       'state855
                       (bv 1 (bitvector 1)))
                      'state870
                      (bv 1 (bitvector 1)))
                     'state884
                     (bv 1 (bitvector 1)))
                    'state891
                    (bv 1 (bitvector 1)))
                   'state916
                   (bv 1 (bitvector 1)))
                  'state986
                  (bv 1 (bitvector 1)))
                 'state1143
                 (bv 1 (bitvector 1)))
                'state1154
                (bv 1 (bitvector 1)))
               'state1164
               (bv 1 (bitvector 1)))
              'state1180
              (bv 1 (bitvector 1)))
             'state1250
             (bv 1 (bitvector 1)))]
           [btor1 (bitvector 30)]
           [btor2 A]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state A))]
           [btor3 (bitvector 32)]
           [btor4 ACASCREG]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state ACASCREG))]
           [btor5 ACIN]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state ACIN))]
           [btor6 ADREG]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state ADREG))]
           [btor7 (bitvector 4)]
           [btor8 ALUMODE]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state ALUMODE))]
           [btor9 ALUMODEREG]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state ALUMODEREG))]
           [btor10 (bitvector 5)]
           [btor11 AMULTSEL]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state AMULTSEL))]
           [btor12 AREG]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state AREG))]
           [btor13 AUTORESET_PATDET]
           [merged-input-state-hash (hash-union merged-input-state-hash
                                                (signal-state AUTORESET_PATDET))]
           [btor14 AUTORESET_PRIORITY]
           [merged-input-state-hash (hash-union merged-input-state-hash
                                                (signal-state AUTORESET_PRIORITY))]
           [btor15 A_INPUT]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state A_INPUT))]
           [btor16 (bitvector 18)]
           [btor17 B]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state B))]
           [btor18 BCASCREG]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state BCASCREG))]
           [btor19 BCIN]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state BCIN))]
           [btor20 BMULTSEL]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state BMULTSEL))]
           [btor21 BREG]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state BREG))]
           [btor22 B_INPUT]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state B_INPUT))]
           [btor23 (bitvector 48)]
           [btor24 C]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state C))]
           [btor25 (bitvector 1)]
           [btor26 CARRYCASCIN]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CARRYCASCIN))]
           [btor27 CARRYIN]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CARRYIN))]
           [btor28 CARRYINREG]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CARRYINREG))]
           [btor29 (bitvector 3)]
           [btor30 CARRYINSEL]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CARRYINSEL))]
           [btor31 CARRYINSELREG]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CARRYINSELREG))]
           [btor32 CEA1]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CEA1))]
           [btor33 CEA2]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CEA2))]
           [btor34 CEAD]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CEAD))]
           [btor35 CEALUMODE]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CEALUMODE))]
           [btor36 CEB1]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CEB1))]
           [btor37 CEB2]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CEB2))]
           [btor38 CEC]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CEC))]
           [btor39 CECARRYIN]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CECARRYIN))]
           [btor40 CECTRL]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CECTRL))]
           [btor41 CED]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CED))]
           [btor42 CEINMODE]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CEINMODE))]
           [btor43 CEM]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CEM))]
           [btor44 CEP]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CEP))]
           [btor45 CLK]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CLK))]
           [btor46 CREG]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CREG))]
           [btor47 (bitvector 27)]
           [btor48 D]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state D))]
           [btor49 DREG]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state DREG))]
           [btor50 INMODE]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state INMODE))]
           [btor51 INMODEREG]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state INMODEREG))]
           [btor52 IS_ALUMODE_INVERTED]
           [merged-input-state-hash (hash-union merged-input-state-hash
                                                (signal-state IS_ALUMODE_INVERTED))]
           [btor53 IS_CARRYIN_INVERTED]
           [merged-input-state-hash (hash-union merged-input-state-hash
                                                (signal-state IS_CARRYIN_INVERTED))]
           [btor54 IS_CLK_INVERTED]
           [merged-input-state-hash (hash-union merged-input-state-hash
                                                (signal-state IS_CLK_INVERTED))]
           [btor55 IS_INMODE_INVERTED]
           [merged-input-state-hash (hash-union merged-input-state-hash
                                                (signal-state IS_INMODE_INVERTED))]
           [btor56 (bitvector 9)]
           [btor57 IS_OPMODE_INVERTED]
           [merged-input-state-hash (hash-union merged-input-state-hash
                                                (signal-state IS_OPMODE_INVERTED))]
           [btor58 IS_RSTALLCARRYIN_INVERTED]
           [merged-input-state-hash (hash-union merged-input-state-hash
                                                (signal-state IS_RSTALLCARRYIN_INVERTED))]
           [btor59 IS_RSTALUMODE_INVERTED]
           [merged-input-state-hash (hash-union merged-input-state-hash
                                                (signal-state IS_RSTALUMODE_INVERTED))]
           [btor60 IS_RSTA_INVERTED]
           [merged-input-state-hash (hash-union merged-input-state-hash
                                                (signal-state IS_RSTA_INVERTED))]
           [btor61 IS_RSTB_INVERTED]
           [merged-input-state-hash (hash-union merged-input-state-hash
                                                (signal-state IS_RSTB_INVERTED))]
           [btor62 IS_RSTCTRL_INVERTED]
           [merged-input-state-hash (hash-union merged-input-state-hash
                                                (signal-state IS_RSTCTRL_INVERTED))]
           [btor63 IS_RSTC_INVERTED]
           [merged-input-state-hash (hash-union merged-input-state-hash
                                                (signal-state IS_RSTC_INVERTED))]
           [btor64 IS_RSTD_INVERTED]
           [merged-input-state-hash (hash-union merged-input-state-hash
                                                (signal-state IS_RSTD_INVERTED))]
           [btor65 IS_RSTINMODE_INVERTED]
           [merged-input-state-hash (hash-union merged-input-state-hash
                                                (signal-state IS_RSTINMODE_INVERTED))]
           [btor66 IS_RSTM_INVERTED]
           [merged-input-state-hash (hash-union merged-input-state-hash
                                                (signal-state IS_RSTM_INVERTED))]
           [btor67 IS_RSTP_INVERTED]
           [merged-input-state-hash (hash-union merged-input-state-hash
                                                (signal-state IS_RSTP_INVERTED))]
           [btor68 MASK]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state MASK))]
           [btor69 MREG]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state MREG))]
           [btor70 MULTSIGNIN]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state MULTSIGNIN))]
           [btor71 OPMODE]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state OPMODE))]
           [btor72 OPMODEREG]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state OPMODEREG))]
           [btor73 PATTERN]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state PATTERN))]
           [btor74 PCIN]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state PCIN))]
           [btor75 PREADDINSEL]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state PREADDINSEL))]
           [btor76 PREG]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state PREG))]
           [btor77 RND]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state RND))]
           [btor78 RSTA]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state RSTA))]
           [btor79 RSTALLCARRYIN]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state RSTALLCARRYIN))]
           [btor80 RSTALUMODE]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state RSTALUMODE))]
           [btor81 RSTB]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state RSTB))]
           [btor82 RSTC]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state RSTC))]
           [btor83 RSTCTRL]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state RSTCTRL))]
           [btor84 RSTD]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state RSTD))]
           [btor85 RSTINMODE]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state RSTINMODE))]
           [btor86 RSTM]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state RSTM))]
           [btor87 RSTP]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state RSTP))]
           [btor88 SEL_MASK]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state SEL_MASK))]
           [btor89 SEL_PATTERN]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state SEL_PATTERN))]
           [btor90 USE_MULT]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state USE_MULT))]
           [btor91 USE_PATTERN_DETECT]
           [merged-input-state-hash (hash-union merged-input-state-hash
                                                (signal-state USE_PATTERN_DETECT))]
           [btor92 USE_SIMD]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state USE_SIMD))]
           [btor93 USE_WIDEXOR]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state USE_WIDEXOR))]
           [btor94 XORSIMD]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state XORSIMD))]
           [btor95
            (let* ([state-value
                    (cond
                      [(hash-has-key? merged-input-state-hash 'state95)
                       (bv->signal (hash-ref merged-input-state-hash 'state95))]
                      [(hash-has-key? init-hash 'state95) (bv->signal (hash-ref init-hash 'state95))]
                      [else
                       (log-warning
                        "state ~a with no initial value, init to 0, this may not be correct in the long term"
                        'state95)
                       (bv->signal (bv 0 (bitvector 30)))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              (when (not (bv? (signal-value state-value)))
                (error "Signal value invalid"))
              state-value)]
           [btor96
            (let* ([state-value
                    (cond
                      [(hash-has-key? merged-input-state-hash 'state96)
                       (bv->signal (hash-ref merged-input-state-hash 'state96))]
                      [(hash-has-key? init-hash 'state96) (bv->signal (hash-ref init-hash 'state96))]
                      [else
                       (log-warning
                        "state ~a with no initial value, init to 0, this may not be correct in the long term"
                        'state96)
                       (bv->signal (bv 0 (bitvector 30)))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              (when (not (bv? (signal-value state-value)))
                (error "Signal value invalid"))
              state-value)]
           [btor97 (bv->signal (bv 1 (bitvector 1)))]
           [btor98
            (let* ([state-value
                    (cond
                      [(hash-has-key? merged-input-state-hash 'state98)
                       (bv->signal (hash-ref merged-input-state-hash 'state98))]
                      [(hash-has-key? init-hash 'state98) (bv->signal (hash-ref init-hash 'state98))]
                      [else
                       (log-warning
                        "state ~a with no initial value, init to 0, this may not be correct in the long term"
                        'state98)
                       (bv->signal (bv 0 (bitvector 1)))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              (when (not (bv? (signal-value state-value)))
                (error "Signal value invalid"))
              state-value)]
           [btor100 (signal (bvxor (signal-value btor45) (signal-value btor54))
                            (merge-state (list btor45 btor54)))]
           [btor101 (bitvector 2)]
           [btor102 (signal (concat (signal-value btor100) (signal-value btor98))
                            (merge-state (list btor100 btor98)))]
           [btor103 (bv->signal (bv 2 (bitvector 2)))]
           [btor104 (signal (bool->bitvector (bveq (signal-value btor102) (signal-value btor103)))
                            (merge-state (list btor102 btor103)))]
           [btor105 (if (bitvector->bool (signal-value btor104)) btor96 btor95)]
           [btor106 (bv->signal (bv 0 (bitvector 1)))]
           [btor107 (bv->signal (bv 15 (bitvector 4)))]
           [btor108 (bv->signal (zero-extend (signal-value btor107) (bitvector 5)) btor107)]
           [btor109 (signal (bool->bitvector (bveq (signal-value btor15) (signal-value btor108)))
                            (merge-state (list btor15 btor108)))]
           [btor110 (if (bitvector->bool (signal-value btor109)) btor97 btor106)]
           [btor111 (bv->signal (bv 7 (bitvector 3)))]
           [btor112 (bv->signal (zero-extend (signal-value btor111) (bitvector 5)) btor111)]
           [btor113 (signal (bool->bitvector (bveq (signal-value btor15) (signal-value btor112)))
                            (merge-state (list btor15 btor112)))]
           [btor114 (if (bitvector->bool (signal-value btor113)) btor106 btor110)]
           [btor115 (if (bitvector->bool (signal-value btor114)) btor5 btor2)]
           [btor116
            (let* ([state-value
                    (cond
                      [(hash-has-key? merged-input-state-hash 'state116)
                       (bv->signal (hash-ref merged-input-state-hash 'state116))]
                      [(hash-has-key? init-hash 'state116)
                       (bv->signal (hash-ref init-hash 'state116))]
                      [else
                       (log-warning
                        "state ~a with no initial value, init to 0, this may not be correct in the long term"
                        'state116)
                       (bv->signal (bv 0 (bitvector 30)))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              (when (not (bv? (signal-value state-value)))
                (error "Signal value invalid"))
              state-value)]
           [btor117
            (let* ([state-value
                    (cond
                      [(hash-has-key? merged-input-state-hash 'state117)
                       (bv->signal (hash-ref merged-input-state-hash 'state117))]
                      [(hash-has-key? init-hash 'state117)
                       (bv->signal (hash-ref init-hash 'state117))]
                      [else
                       (log-warning
                        "state ~a with no initial value, init to 0, this may not be correct in the long term"
                        'state117)
                       (bv->signal (bv 0 (bitvector 30)))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              (when (not (bv? (signal-value state-value)))
                (error "Signal value invalid"))
              state-value)]
           [btor118
            (let* ([state-value
                    (cond
                      [(hash-has-key? merged-input-state-hash 'state118)
                       (bv->signal (hash-ref merged-input-state-hash 'state118))]
                      [(hash-has-key? init-hash 'state118)
                       (bv->signal (hash-ref init-hash 'state118))]
                      [else
                       (log-warning
                        "state ~a with no initial value, init to 0, this may not be correct in the long term"
                        'state118)
                       (bv->signal (bv 0 (bitvector 1)))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              (when (not (bv? (signal-value state-value)))
                (error "Signal value invalid"))
              state-value)]
           [btor120 (signal (concat (signal-value btor100) (signal-value btor118))
                            (merge-state (list btor100 btor118)))]
           [btor121 (signal (bool->bitvector (bveq (signal-value btor120) (signal-value btor103)))
                            (merge-state (list btor120 btor103)))]
           [btor122 (if (bitvector->bool (signal-value btor121)) btor117 btor116)]
           [btor123 (signal (extract 1 0 (signal-value btor12)) (signal-state btor12))]
           [btor124 (signal (apply bvor (bitvector->bits (signal-value btor123)))
                            (signal-state btor123))]
           [btor125 (if (bitvector->bool (signal-value btor124)) btor122 btor115)]
           [btor126 (signal (extract 1 0 (signal-value btor4)) (signal-state btor4))]
           [btor127 (signal (bool->bitvector (bveq (signal-value btor126) (signal-value btor123)))
                            (merge-state (list btor126 btor123)))]
           [btor128 (if (bitvector->bool (signal-value btor127)) btor125 btor105)]
           [btor130
            (let* ([state-value
                    (cond
                      [(hash-has-key? merged-input-state-hash 'state130)
                       (bv->signal (hash-ref merged-input-state-hash 'state130))]
                      [(hash-has-key? init-hash 'state130)
                       (bv->signal (hash-ref init-hash 'state130))]
                      [else
                       (log-warning
                        "state ~a with no initial value, init to 0, this may not be correct in the long term"
                        'state130)
                       (bv->signal (bv 0 (bitvector 18)))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              (when (not (bv? (signal-value state-value)))
                (error "Signal value invalid"))
              state-value)]
           [btor131
            (let* ([state-value
                    (cond
                      [(hash-has-key? merged-input-state-hash 'state131)
                       (bv->signal (hash-ref merged-input-state-hash 'state131))]
                      [(hash-has-key? init-hash 'state131)
                       (bv->signal (hash-ref init-hash 'state131))]
                      [else
                       (log-warning
                        "state ~a with no initial value, init to 0, this may not be correct in the long term"
                        'state131)
                       (bv->signal (bv 0 (bitvector 18)))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              (when (not (bv? (signal-value state-value)))
                (error "Signal value invalid"))
              state-value)]
           [btor132
            (let* ([state-value
                    (cond
                      [(hash-has-key? merged-input-state-hash 'state132)
                       (bv->signal (hash-ref merged-input-state-hash 'state132))]
                      [(hash-has-key? init-hash 'state132)
                       (bv->signal (hash-ref init-hash 'state132))]
                      [else
                       (log-warning
                        "state ~a with no initial value, init to 0, this may not be correct in the long term"
                        'state132)
                       (bv->signal (bv 0 (bitvector 1)))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              (when (not (bv? (signal-value state-value)))
                (error "Signal value invalid"))
              state-value)]
           [btor134 (signal (concat (signal-value btor100) (signal-value btor132))
                            (merge-state (list btor100 btor132)))]
           [btor135 (signal (bool->bitvector (bveq (signal-value btor134) (signal-value btor103)))
                            (merge-state (list btor134 btor103)))]
           [btor136 (if (bitvector->bool (signal-value btor135)) btor131 btor130)]
           [btor137 (bv->signal (zero-extend (signal-value btor107) (bitvector 5)) btor107)]
           [btor138 (signal (bool->bitvector (bveq (signal-value btor22) (signal-value btor137)))
                            (merge-state (list btor22 btor137)))]
           [btor139 (if (bitvector->bool (signal-value btor138)) btor97 btor106)]
           [btor140 (bv->signal (zero-extend (signal-value btor111) (bitvector 5)) btor111)]
           [btor141 (signal (bool->bitvector (bveq (signal-value btor22) (signal-value btor140)))
                            (merge-state (list btor22 btor140)))]
           [btor142 (if (bitvector->bool (signal-value btor141)) btor106 btor139)]
           [btor143 (if (bitvector->bool (signal-value btor142)) btor19 btor17)]
           [btor144
            (let* ([state-value
                    (cond
                      [(hash-has-key? merged-input-state-hash 'state144)
                       (bv->signal (hash-ref merged-input-state-hash 'state144))]
                      [(hash-has-key? init-hash 'state144)
                       (bv->signal (hash-ref init-hash 'state144))]
                      [else
                       (log-warning
                        "state ~a with no initial value, init to 0, this may not be correct in the long term"
                        'state144)
                       (bv->signal (bv 0 (bitvector 18)))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              (when (not (bv? (signal-value state-value)))
                (error "Signal value invalid"))
              state-value)]
           [btor145
            (let* ([state-value
                    (cond
                      [(hash-has-key? merged-input-state-hash 'state145)
                       (bv->signal (hash-ref merged-input-state-hash 'state145))]
                      [(hash-has-key? init-hash 'state145)
                       (bv->signal (hash-ref init-hash 'state145))]
                      [else
                       (log-warning
                        "state ~a with no initial value, init to 0, this may not be correct in the long term"
                        'state145)
                       (bv->signal (bv 0 (bitvector 18)))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              (when (not (bv? (signal-value state-value)))
                (error "Signal value invalid"))
              state-value)]
           [btor146
            (let* ([state-value
                    (cond
                      [(hash-has-key? merged-input-state-hash 'state146)
                       (bv->signal (hash-ref merged-input-state-hash 'state146))]
                      [(hash-has-key? init-hash 'state146)
                       (bv->signal (hash-ref init-hash 'state146))]
                      [else
                       (log-warning
                        "state ~a with no initial value, init to 0, this may not be correct in the long term"
                        'state146)
                       (bv->signal (bv 0 (bitvector 1)))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              (when (not (bv? (signal-value state-value)))
                (error "Signal value invalid"))
              state-value)]
           [btor148 (signal (concat (signal-value btor100) (signal-value btor146))
                            (merge-state (list btor100 btor146)))]
           [btor149 (signal (bool->bitvector (bveq (signal-value btor148) (signal-value btor103)))
                            (merge-state (list btor148 btor103)))]
           [btor150 (if (bitvector->bool (signal-value btor149)) btor145 btor144)]
           [btor151 (signal (extract 1 0 (signal-value btor21)) (signal-state btor21))]
           [btor152 (signal (apply bvor (bitvector->bits (signal-value btor151)))
                            (signal-state btor151))]
           [btor153 (if (bitvector->bool (signal-value btor152)) btor150 btor143)]
           [btor154 (signal (extract 1 0 (signal-value btor18)) (signal-state btor18))]
           [btor155 (signal (bool->bitvector (bveq (signal-value btor154) (signal-value btor151)))
                            (merge-state (list btor154 btor151)))]
           [btor156 (if (bitvector->bool (signal-value btor155)) btor153 btor136)]
           [btor158 (signal (extract 0 0 (signal-value btor8)) (signal-state btor8))]
           [btor159 (signal (extract 0 0 (signal-value btor52)) (signal-state btor52))]
           [btor160 (signal (bvxor (signal-value btor158) (signal-value btor159))
                            (merge-state (list btor158 btor159)))]
           [btor161 (signal (extract 1 1 (signal-value btor8)) (signal-state btor8))]
           [btor162 (signal (extract 1 1 (signal-value btor52)) (signal-state btor52))]
           [btor163 (signal (bvxor (signal-value btor161) (signal-value btor162))
                            (merge-state (list btor161 btor162)))]
           [btor164 (signal (extract 2 2 (signal-value btor8)) (signal-state btor8))]
           [btor165 (signal (extract 2 2 (signal-value btor52)) (signal-state btor52))]
           [btor166 (signal (bvxor (signal-value btor164) (signal-value btor165))
                            (merge-state (list btor164 btor165)))]
           [btor167 (signal (extract 3 3 (signal-value btor8)) (signal-state btor8))]
           [btor168 (signal (extract 3 3 (signal-value btor52)) (signal-state btor52))]
           [btor169 (signal (bvxor (signal-value btor167) (signal-value btor168))
                            (merge-state (list btor167 btor168)))]
           [btor170 (signal (concat (signal-value btor163) (signal-value btor160))
                            (merge-state (list btor163 btor160)))]
           [btor171 (signal (concat (signal-value btor166) (signal-value btor170))
                            (merge-state (list btor166 btor170)))]
           [btor172 (signal (concat (signal-value btor169) (signal-value btor171))
                            (merge-state (list btor169 btor171)))]
           [btor173
            (let* ([state-value
                    (cond
                      [(hash-has-key? merged-input-state-hash 'state173)
                       (bv->signal (hash-ref merged-input-state-hash 'state173))]
                      [(hash-has-key? init-hash 'state173)
                       (bv->signal (hash-ref init-hash 'state173))]
                      [else
                       (log-warning
                        "state ~a with no initial value, init to 0, this may not be correct in the long term"
                        'state173)
                       (bv->signal (bv 0 (bitvector 4)))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              (when (not (bv? (signal-value state-value)))
                (error "Signal value invalid"))
              state-value)]
           [btor174
            (let* ([state-value
                    (cond
                      [(hash-has-key? merged-input-state-hash 'state174)
                       (bv->signal (hash-ref merged-input-state-hash 'state174))]
                      [(hash-has-key? init-hash 'state174)
                       (bv->signal (hash-ref init-hash 'state174))]
                      [else
                       (log-warning
                        "state ~a with no initial value, init to 0, this may not be correct in the long term"
                        'state174)
                       (bv->signal (bv 0 (bitvector 4)))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              (when (not (bv? (signal-value state-value)))
                (error "Signal value invalid"))
              state-value)]
           [btor175
            (let* ([state-value
                    (cond
                      [(hash-has-key? merged-input-state-hash 'state175)
                       (bv->signal (hash-ref merged-input-state-hash 'state175))]
                      [(hash-has-key? init-hash 'state175)
                       (bv->signal (hash-ref init-hash 'state175))]
                      [else
                       (log-warning
                        "state ~a with no initial value, init to 0, this may not be correct in the long term"
                        'state175)
                       (bv->signal (bv 0 (bitvector 1)))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              (when (not (bv? (signal-value state-value)))
                (error "Signal value invalid"))
              state-value)]
           [btor177 (signal (concat (signal-value btor100) (signal-value btor175))
                            (merge-state (list btor100 btor175)))]
           [btor178 (signal (bool->bitvector (bveq (signal-value btor177) (signal-value btor103)))
                            (merge-state (list btor177 btor103)))]
           [btor179 (if (bitvector->bool (signal-value btor178)) btor174 btor173)]
           [btor180 (signal (extract 0 0 (signal-value btor9)) (signal-state btor9))]
           [btor181 (if (bitvector->bool (signal-value btor180)) btor179 btor172)]
           [btor182 (signal (extract 0 0 (signal-value btor181)) (signal-state btor181))]
           [btor183 (signal (extract 1 1 (signal-value btor181)) (signal-state btor181))]
           [btor184 (signal (bvand (signal-value btor182) (signal-value btor183))
                            (merge-state (list btor182 btor183)))]
           [btor185 (bitvector 14)]
           [btor186 (bv->signal (bv 0 (bitvector 2)))]
           [btor187 (bv->signal (bv 25 (bitvector 5)))]
           [btor188 (signal (bool->bitvector (bveq (signal-value btor92) (signal-value btor187)))
                            (merge-state (list btor92 btor187)))]
           [btor189 (if (bitvector->bool (signal-value btor188)) btor103 btor186)]
           [btor190 (bv->signal (bv 1 (bitvector 2)))]
           [btor191 (bv->signal (bv 19 (bitvector 5)))]
           [btor192 (signal (bool->bitvector (bveq (signal-value btor92) (signal-value btor191)))
                            (merge-state (list btor92 btor191)))]
           [btor193 (if (bitvector->bool (signal-value btor192)) btor190 btor189)]
           [btor194 (bv->signal (bv 12 (bitvector 4)))]
           [btor195 (bv->signal (zero-extend (signal-value btor194) (bitvector 5)) btor194)]
           [btor196 (signal (bool->bitvector (bveq (signal-value btor92) (signal-value btor195)))
                            (merge-state (list btor92 btor195)))]
           [btor197 (if (bitvector->bool (signal-value btor196)) btor186 btor193)]
           [btor198 (bv->signal (zero-extend (signal-value btor97) (bitvector 2)) btor97)]
           [btor199 (signal (bool->bitvector ((compose1 not bveq) (signal-value btor197)
                                                                  (signal-value btor198)))
                            (merge-state (list btor197 btor198)))]
           [btor200 (signal (extract 0 0 (signal-value btor181)) (signal-state btor181))]
           [btor201 (signal (extract 0 0 (signal-value btor181)) (signal-state btor181))]
           [btor202 (signal (concat (signal-value btor201) (signal-value btor200))
                            (merge-state (list btor201 btor200)))]
           [btor203 (signal (extract 0 0 (signal-value btor181)) (signal-state btor181))]
           [btor204 (signal (concat (signal-value btor203) (signal-value btor202))
                            (merge-state (list btor203 btor202)))]
           [btor205 (signal (extract 0 0 (signal-value btor181)) (signal-state btor181))]
           [btor206 (signal (concat (signal-value btor205) (signal-value btor204))
                            (merge-state (list btor205 btor204)))]
           [btor207 (signal (extract 0 0 (signal-value btor181)) (signal-state btor181))]
           [btor208 (signal (concat (signal-value btor207) (signal-value btor206))
                            (merge-state (list btor207 btor206)))]
           [btor209 (signal (extract 0 0 (signal-value btor181)) (signal-state btor181))]
           [btor210 (bitvector 6)]
           [btor211 (signal (concat (signal-value btor209) (signal-value btor208))
                            (merge-state (list btor209 btor208)))]
           [btor212 (signal (extract 0 0 (signal-value btor181)) (signal-state btor181))]
           [btor213 (bitvector 7)]
           [btor214 (signal (concat (signal-value btor212) (signal-value btor211))
                            (merge-state (list btor212 btor211)))]
           [btor215 (signal (extract 0 0 (signal-value btor181)) (signal-state btor181))]
           [btor216 (bitvector 8)]
           [btor217 (signal (concat (signal-value btor215) (signal-value btor214))
                            (merge-state (list btor215 btor214)))]
           [btor218 (signal (extract 0 0 (signal-value btor181)) (signal-state btor181))]
           [btor219 (signal (concat (signal-value btor218) (signal-value btor217))
                            (merge-state (list btor218 btor217)))]
           [btor220 (signal (extract 0 0 (signal-value btor181)) (signal-state btor181))]
           [btor221 (bitvector 10)]
           [btor222 (signal (concat (signal-value btor220) (signal-value btor219))
                            (merge-state (list btor220 btor219)))]
           [btor223 (signal (extract 0 0 (signal-value btor181)) (signal-state btor181))]
           [btor224 (bitvector 11)]
           [btor225 (signal (concat (signal-value btor223) (signal-value btor222))
                            (merge-state (list btor223 btor222)))]
           [btor226 (signal (extract 0 0 (signal-value btor181)) (signal-state btor181))]
           [btor227 (bitvector 12)]
           [btor228 (signal (concat (signal-value btor226) (signal-value btor225))
                            (merge-state (list btor226 btor225)))]
           [btor229 (signal (extract 0 0 (signal-value btor181)) (signal-state btor181))]
           [btor230 (bitvector 13)]
           [btor231 (signal (concat (signal-value btor229) (signal-value btor228))
                            (merge-state (list btor229 btor228)))]
           [btor232 (signal (extract 0 0 (signal-value btor181)) (signal-state btor181))]
           [btor233 (signal (concat (signal-value btor232) (signal-value btor231))
                            (merge-state (list btor232 btor231)))]
           [btor234 (signal (extract 0 0 (signal-value btor181)) (signal-state btor181))]
           [btor235 (bitvector 15)]
           [btor236 (signal (concat (signal-value btor234) (signal-value btor233))
                            (merge-state (list btor234 btor233)))]
           [btor237 (signal (extract 0 0 (signal-value btor181)) (signal-state btor181))]
           [btor238 (bitvector 16)]
           [btor239 (signal (concat (signal-value btor237) (signal-value btor236))
                            (merge-state (list btor237 btor236)))]
           [btor240 (signal (extract 0 0 (signal-value btor181)) (signal-state btor181))]
           [btor241 (bitvector 17)]
           [btor242 (signal (concat (signal-value btor240) (signal-value btor239))
                            (merge-state (list btor240 btor239)))]
           [btor243 (signal (extract 0 0 (signal-value btor181)) (signal-state btor181))]
           [btor244 (signal (concat (signal-value btor243) (signal-value btor242))
                            (merge-state (list btor243 btor242)))]
           [btor245 (signal (extract 0 0 (signal-value btor181)) (signal-state btor181))]
           [btor246 (bitvector 19)]
           [btor247 (signal (concat (signal-value btor245) (signal-value btor244))
                            (merge-state (list btor245 btor244)))]
           [btor248 (signal (extract 0 0 (signal-value btor181)) (signal-state btor181))]
           [btor249 (bitvector 20)]
           [btor250 (signal (concat (signal-value btor248) (signal-value btor247))
                            (merge-state (list btor248 btor247)))]
           [btor251 (signal (extract 0 0 (signal-value btor181)) (signal-state btor181))]
           [btor252 (bitvector 21)]
           [btor253 (signal (concat (signal-value btor251) (signal-value btor250))
                            (merge-state (list btor251 btor250)))]
           [btor254 (signal (extract 0 0 (signal-value btor181)) (signal-state btor181))]
           [btor255 (bitvector 22)]
           [btor256 (signal (concat (signal-value btor254) (signal-value btor253))
                            (merge-state (list btor254 btor253)))]
           [btor257 (signal (extract 0 0 (signal-value btor181)) (signal-state btor181))]
           [btor258 (bitvector 23)]
           [btor259 (signal (concat (signal-value btor257) (signal-value btor256))
                            (merge-state (list btor257 btor256)))]
           [btor260 (signal (extract 0 0 (signal-value btor181)) (signal-state btor181))]
           [btor261 (bitvector 24)]
           [btor262 (signal (concat (signal-value btor260) (signal-value btor259))
                            (merge-state (list btor260 btor259)))]
           [btor263 (signal (extract 0 0 (signal-value btor181)) (signal-state btor181))]
           [btor264 (bitvector 25)]
           [btor265 (signal (concat (signal-value btor263) (signal-value btor262))
                            (merge-state (list btor263 btor262)))]
           [btor266 (signal (extract 0 0 (signal-value btor181)) (signal-state btor181))]
           [btor267 (bitvector 26)]
           [btor268 (signal (concat (signal-value btor266) (signal-value btor265))
                            (merge-state (list btor266 btor265)))]
           [btor269 (signal (extract 0 0 (signal-value btor181)) (signal-state btor181))]
           [btor270 (signal (concat (signal-value btor269) (signal-value btor268))
                            (merge-state (list btor269 btor268)))]
           [btor271 (signal (extract 0 0 (signal-value btor181)) (signal-state btor181))]
           [btor272 (bitvector 28)]
           [btor273 (signal (concat (signal-value btor271) (signal-value btor270))
                            (merge-state (list btor271 btor270)))]
           [btor274 (signal (extract 0 0 (signal-value btor181)) (signal-state btor181))]
           [btor275 (bitvector 29)]
           [btor276 (signal (concat (signal-value btor274) (signal-value btor273))
                            (merge-state (list btor274 btor273)))]
           [btor277 (signal (extract 0 0 (signal-value btor181)) (signal-state btor181))]
           [btor278 (signal (concat (signal-value btor277) (signal-value btor276))
                            (merge-state (list btor277 btor276)))]
           [btor279 (signal (extract 0 0 (signal-value btor181)) (signal-state btor181))]
           [btor280 (bitvector 31)]
           [btor281 (signal (concat (signal-value btor279) (signal-value btor278))
                            (merge-state (list btor279 btor278)))]
           [btor282 (signal (extract 0 0 (signal-value btor181)) (signal-state btor181))]
           [btor283 (signal (concat (signal-value btor282) (signal-value btor281))
                            (merge-state (list btor282 btor281)))]
           [btor284 (signal (extract 0 0 (signal-value btor181)) (signal-state btor181))]
           [btor285 (bitvector 33)]
           [btor286 (signal (concat (signal-value btor284) (signal-value btor283))
                            (merge-state (list btor284 btor283)))]
           [btor287 (signal (extract 0 0 (signal-value btor181)) (signal-state btor181))]
           [btor288 (bitvector 34)]
           [btor289 (signal (concat (signal-value btor287) (signal-value btor286))
                            (merge-state (list btor287 btor286)))]
           [btor290 (signal (extract 0 0 (signal-value btor181)) (signal-state btor181))]
           [btor291 (bitvector 35)]
           [btor292 (signal (concat (signal-value btor290) (signal-value btor289))
                            (merge-state (list btor290 btor289)))]
           [btor293 (signal (extract 0 0 (signal-value btor181)) (signal-state btor181))]
           [btor294 (bitvector 36)]
           [btor295 (signal (concat (signal-value btor293) (signal-value btor292))
                            (merge-state (list btor293 btor292)))]
           [btor296 (signal (extract 0 0 (signal-value btor181)) (signal-state btor181))]
           [btor297 (bitvector 37)]
           [btor298 (signal (concat (signal-value btor296) (signal-value btor295))
                            (merge-state (list btor296 btor295)))]
           [btor299 (signal (extract 0 0 (signal-value btor181)) (signal-state btor181))]
           [btor300 (bitvector 38)]
           [btor301 (signal (concat (signal-value btor299) (signal-value btor298))
                            (merge-state (list btor299 btor298)))]
           [btor302 (signal (extract 0 0 (signal-value btor181)) (signal-state btor181))]
           [btor303 (bitvector 39)]
           [btor304 (signal (concat (signal-value btor302) (signal-value btor301))
                            (merge-state (list btor302 btor301)))]
           [btor305 (signal (extract 0 0 (signal-value btor181)) (signal-state btor181))]
           [btor306 (bitvector 40)]
           [btor307 (signal (concat (signal-value btor305) (signal-value btor304))
                            (merge-state (list btor305 btor304)))]
           [btor308 (signal (extract 0 0 (signal-value btor181)) (signal-state btor181))]
           [btor309 (bitvector 41)]
           [btor310 (signal (concat (signal-value btor308) (signal-value btor307))
                            (merge-state (list btor308 btor307)))]
           [btor311 (signal (extract 0 0 (signal-value btor181)) (signal-state btor181))]
           [btor312 (bitvector 42)]
           [btor313 (signal (concat (signal-value btor311) (signal-value btor310))
                            (merge-state (list btor311 btor310)))]
           [btor314 (signal (extract 0 0 (signal-value btor181)) (signal-state btor181))]
           [btor315 (bitvector 43)]
           [btor316 (signal (concat (signal-value btor314) (signal-value btor313))
                            (merge-state (list btor314 btor313)))]
           [btor317 (signal (extract 0 0 (signal-value btor181)) (signal-state btor181))]
           [btor318 (bitvector 44)]
           [btor319 (signal (concat (signal-value btor317) (signal-value btor316))
                            (merge-state (list btor317 btor316)))]
           [btor320 (signal (extract 0 0 (signal-value btor181)) (signal-state btor181))]
           [btor321 (bitvector 45)]
           [btor322 (signal (concat (signal-value btor320) (signal-value btor319))
                            (merge-state (list btor320 btor319)))]
           [btor323 (signal (extract 0 0 (signal-value btor181)) (signal-state btor181))]
           [btor324 (bitvector 46)]
           [btor325 (signal (concat (signal-value btor323) (signal-value btor322))
                            (merge-state (list btor323 btor322)))]
           [btor326 (signal (extract 0 0 (signal-value btor181)) (signal-state btor181))]
           [btor327 (bitvector 47)]
           [btor328 (signal (concat (signal-value btor326) (signal-value btor325))
                            (merge-state (list btor326 btor325)))]
           [btor329 (signal (extract 0 0 (signal-value btor181)) (signal-state btor181))]
           [btor330 (signal (concat (signal-value btor329) (signal-value btor328))
                            (merge-state (list btor329 btor328)))]
           [btor331 unnamed-input-331]
           [btor332
            (let* ([state-value
                    (cond
                      [(hash-has-key? merged-input-state-hash 'state332)
                       (bv->signal (hash-ref merged-input-state-hash 'state332))]
                      [(hash-has-key? init-hash 'state332)
                       (bv->signal (hash-ref init-hash 'state332))]
                      [else
                       (log-warning
                        "state ~a with no initial value, init to 0, this may not be correct in the long term"
                        'state332)
                       (bv->signal (bv 0 (bitvector 48)))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              (when (not (bv? (signal-value state-value)))
                (error "Signal value invalid"))
              state-value)]
           [btor333
            (let* ([state-value
                    (cond
                      [(hash-has-key? merged-input-state-hash 'state333)
                       (bv->signal (hash-ref merged-input-state-hash 'state333))]
                      [(hash-has-key? init-hash 'state333)
                       (bv->signal (hash-ref init-hash 'state333))]
                      [else
                       (log-warning
                        "state ~a with no initial value, init to 0, this may not be correct in the long term"
                        'state333)
                       (bv->signal (bv 0 (bitvector 48)))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              (when (not (bv? (signal-value state-value)))
                (error "Signal value invalid"))
              state-value)]
           [btor334
            (let* ([state-value
                    (cond
                      [(hash-has-key? merged-input-state-hash 'state334)
                       (bv->signal (hash-ref merged-input-state-hash 'state334))]
                      [(hash-has-key? init-hash 'state334)
                       (bv->signal (hash-ref init-hash 'state334))]
                      [else
                       (log-warning
                        "state ~a with no initial value, init to 0, this may not be correct in the long term"
                        'state334)
                       (bv->signal (bv 0 (bitvector 1)))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              (when (not (bv? (signal-value state-value)))
                (error "Signal value invalid"))
              state-value)]
           [btor336 (signal (concat (signal-value btor100) (signal-value btor334))
                            (merge-state (list btor100 btor334)))]
           [btor337 (signal (bool->bitvector (bveq (signal-value btor336) (signal-value btor103)))
                            (merge-state (list btor336 btor103)))]
           [btor338 (if (bitvector->bool (signal-value btor337)) btor333 btor332)]
           [btor339 (signal (extract 47 17 (signal-value btor338)) (signal-state btor338))]
           [btor340 (signal (extract 47 47 (signal-value btor338)) (signal-state btor338))]
           [btor341 (signal (concat (signal-value btor340) (signal-value btor339))
                            (merge-state (list btor340 btor339)))]
           [btor342 (signal (extract 47 47 (signal-value btor338)) (signal-state btor338))]
           [btor343 (signal (concat (signal-value btor342) (signal-value btor341))
                            (merge-state (list btor342 btor341)))]
           [btor344 (signal (extract 47 47 (signal-value btor338)) (signal-state btor338))]
           [btor345 (signal (concat (signal-value btor344) (signal-value btor343))
                            (merge-state (list btor344 btor343)))]
           [btor346 (signal (extract 47 47 (signal-value btor338)) (signal-state btor338))]
           [btor347 (signal (concat (signal-value btor346) (signal-value btor345))
                            (merge-state (list btor346 btor345)))]
           [btor348 (signal (extract 47 47 (signal-value btor338)) (signal-state btor338))]
           [btor349 (signal (concat (signal-value btor348) (signal-value btor347))
                            (merge-state (list btor348 btor347)))]
           [btor350 (signal (extract 47 47 (signal-value btor338)) (signal-state btor338))]
           [btor351 (signal (concat (signal-value btor350) (signal-value btor349))
                            (merge-state (list btor350 btor349)))]
           [btor352 (signal (extract 47 47 (signal-value btor338)) (signal-state btor338))]
           [btor353 (signal (concat (signal-value btor352) (signal-value btor351))
                            (merge-state (list btor352 btor351)))]
           [btor354 (signal (extract 47 47 (signal-value btor338)) (signal-state btor338))]
           [btor355 (signal (concat (signal-value btor354) (signal-value btor353))
                            (merge-state (list btor354 btor353)))]
           [btor356 (signal (extract 47 47 (signal-value btor338)) (signal-state btor338))]
           [btor357 (signal (concat (signal-value btor356) (signal-value btor355))
                            (merge-state (list btor356 btor355)))]
           [btor358 (signal (extract 47 47 (signal-value btor338)) (signal-state btor338))]
           [btor359 (signal (concat (signal-value btor358) (signal-value btor357))
                            (merge-state (list btor358 btor357)))]
           [btor360 (signal (extract 47 47 (signal-value btor338)) (signal-state btor338))]
           [btor361 (signal (concat (signal-value btor360) (signal-value btor359))
                            (merge-state (list btor360 btor359)))]
           [btor362 (signal (extract 47 47 (signal-value btor338)) (signal-state btor338))]
           [btor363 (signal (concat (signal-value btor362) (signal-value btor361))
                            (merge-state (list btor362 btor361)))]
           [btor364 (signal (extract 47 47 (signal-value btor338)) (signal-state btor338))]
           [btor365 (signal (concat (signal-value btor364) (signal-value btor363))
                            (merge-state (list btor364 btor363)))]
           [btor366 (signal (extract 47 47 (signal-value btor338)) (signal-state btor338))]
           [btor367 (signal (concat (signal-value btor366) (signal-value btor365))
                            (merge-state (list btor366 btor365)))]
           [btor368 (signal (extract 47 47 (signal-value btor338)) (signal-state btor338))]
           [btor369 (signal (concat (signal-value btor368) (signal-value btor367))
                            (merge-state (list btor368 btor367)))]
           [btor370 (signal (extract 47 47 (signal-value btor338)) (signal-state btor338))]
           [btor371 (signal (concat (signal-value btor370) (signal-value btor369))
                            (merge-state (list btor370 btor369)))]
           [btor372 (signal (extract 47 47 (signal-value btor338)) (signal-state btor338))]
           [btor373 (signal (concat (signal-value btor372) (signal-value btor371))
                            (merge-state (list btor372 btor371)))]
           [btor374 (signal (extract 0 0 (signal-value btor71)) (signal-state btor71))]
           [btor375 (signal (extract 0 0 (signal-value btor57)) (signal-state btor57))]
           [btor376 (signal (bvxor (signal-value btor374) (signal-value btor375))
                            (merge-state (list btor374 btor375)))]
           [btor377 (signal (extract 1 1 (signal-value btor71)) (signal-state btor71))]
           [btor378 (signal (extract 1 1 (signal-value btor57)) (signal-state btor57))]
           [btor379 (signal (bvxor (signal-value btor377) (signal-value btor378))
                            (merge-state (list btor377 btor378)))]
           [btor380 (signal (extract 2 2 (signal-value btor71)) (signal-state btor71))]
           [btor381 (signal (extract 2 2 (signal-value btor57)) (signal-state btor57))]
           [btor382 (signal (bvxor (signal-value btor380) (signal-value btor381))
                            (merge-state (list btor380 btor381)))]
           [btor383 (signal (extract 3 3 (signal-value btor71)) (signal-state btor71))]
           [btor384 (signal (extract 3 3 (signal-value btor57)) (signal-state btor57))]
           [btor385 (signal (bvxor (signal-value btor383) (signal-value btor384))
                            (merge-state (list btor383 btor384)))]
           [btor386 (signal (extract 4 4 (signal-value btor71)) (signal-state btor71))]
           [btor387 (signal (extract 4 4 (signal-value btor57)) (signal-state btor57))]
           [btor388 (signal (bvxor (signal-value btor386) (signal-value btor387))
                            (merge-state (list btor386 btor387)))]
           [btor389 (signal (extract 5 5 (signal-value btor71)) (signal-state btor71))]
           [btor390 (signal (extract 5 5 (signal-value btor57)) (signal-state btor57))]
           [btor391 (signal (bvxor (signal-value btor389) (signal-value btor390))
                            (merge-state (list btor389 btor390)))]
           [btor392 (signal (extract 6 6 (signal-value btor71)) (signal-state btor71))]
           [btor393 (signal (extract 6 6 (signal-value btor57)) (signal-state btor57))]
           [btor394 (signal (bvxor (signal-value btor392) (signal-value btor393))
                            (merge-state (list btor392 btor393)))]
           [btor395 (signal (extract 7 7 (signal-value btor71)) (signal-state btor71))]
           [btor396 (signal (extract 7 7 (signal-value btor57)) (signal-state btor57))]
           [btor397 (signal (bvxor (signal-value btor395) (signal-value btor396))
                            (merge-state (list btor395 btor396)))]
           [btor398 (signal (extract 8 8 (signal-value btor71)) (signal-state btor71))]
           [btor399 (signal (extract 8 8 (signal-value btor57)) (signal-state btor57))]
           [btor400 (signal (bvxor (signal-value btor398) (signal-value btor399))
                            (merge-state (list btor398 btor399)))]
           [btor401 (signal (concat (signal-value btor379) (signal-value btor376))
                            (merge-state (list btor379 btor376)))]
           [btor402 (signal (concat (signal-value btor382) (signal-value btor401))
                            (merge-state (list btor382 btor401)))]
           [btor403 (signal (concat (signal-value btor385) (signal-value btor402))
                            (merge-state (list btor385 btor402)))]
           [btor404 (signal (concat (signal-value btor388) (signal-value btor403))
                            (merge-state (list btor388 btor403)))]
           [btor405 (signal (concat (signal-value btor391) (signal-value btor404))
                            (merge-state (list btor391 btor404)))]
           [btor406 (signal (concat (signal-value btor394) (signal-value btor405))
                            (merge-state (list btor394 btor405)))]
           [btor407 (signal (concat (signal-value btor397) (signal-value btor406))
                            (merge-state (list btor397 btor406)))]
           [btor408 (signal (concat (signal-value btor400) (signal-value btor407))
                            (merge-state (list btor400 btor407)))]
           [btor409
            (let* ([state-value
                    (cond
                      [(hash-has-key? merged-input-state-hash 'state409)
                       (bv->signal (hash-ref merged-input-state-hash 'state409))]
                      [(hash-has-key? init-hash 'state409)
                       (bv->signal (hash-ref init-hash 'state409))]
                      [else
                       (log-warning
                        "state ~a with no initial value, init to 0, this may not be correct in the long term"
                        'state409)
                       (bv->signal (bv 0 (bitvector 9)))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              (when (not (bv? (signal-value state-value)))
                (error "Signal value invalid"))
              state-value)]
           [btor410
            (let* ([state-value
                    (cond
                      [(hash-has-key? merged-input-state-hash 'state410)
                       (bv->signal (hash-ref merged-input-state-hash 'state410))]
                      [(hash-has-key? init-hash 'state410)
                       (bv->signal (hash-ref init-hash 'state410))]
                      [else
                       (log-warning
                        "state ~a with no initial value, init to 0, this may not be correct in the long term"
                        'state410)
                       (bv->signal (bv 0 (bitvector 9)))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              (when (not (bv? (signal-value state-value)))
                (error "Signal value invalid"))
              state-value)]
           [btor411
            (let* ([state-value
                    (cond
                      [(hash-has-key? merged-input-state-hash 'state411)
                       (bv->signal (hash-ref merged-input-state-hash 'state411))]
                      [(hash-has-key? init-hash 'state411)
                       (bv->signal (hash-ref init-hash 'state411))]
                      [else
                       (log-warning
                        "state ~a with no initial value, init to 0, this may not be correct in the long term"
                        'state411)
                       (bv->signal (bv 0 (bitvector 1)))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              (when (not (bv? (signal-value state-value)))
                (error "Signal value invalid"))
              state-value)]
           [btor413 (signal (concat (signal-value btor100) (signal-value btor411))
                            (merge-state (list btor100 btor411)))]
           [btor414 (signal (bool->bitvector (bveq (signal-value btor413) (signal-value btor103)))
                            (merge-state (list btor413 btor103)))]
           [btor415 (if (bitvector->bool (signal-value btor414)) btor410 btor409)]
           [btor416 (signal (extract 0 0 (signal-value btor72)) (signal-state btor72))]
           [btor417 (if (bitvector->bool (signal-value btor416)) btor415 btor408)]
           [btor418 (signal (extract 6 5 (signal-value btor417)) (signal-state btor417))]
           [btor419 (bv->signal (bv 3 (bitvector 2)))]
           [btor420 (signal (bool->bitvector (bveq (signal-value btor418) (signal-value btor419)))
                            (merge-state (list btor418 btor419)))]
           [btor421 (if (bitvector->bool (signal-value btor420)) btor373 btor331)]
           [btor422 (signal (extract 47 17 (signal-value btor74)) (signal-state btor74))]
           [btor423 (signal (extract 47 47 (signal-value btor74)) (signal-state btor74))]
           [btor424 (signal (concat (signal-value btor423) (signal-value btor422))
                            (merge-state (list btor423 btor422)))]
           [btor425 (signal (extract 47 47 (signal-value btor74)) (signal-state btor74))]
           [btor426 (signal (concat (signal-value btor425) (signal-value btor424))
                            (merge-state (list btor425 btor424)))]
           [btor427 (signal (extract 47 47 (signal-value btor74)) (signal-state btor74))]
           [btor428 (signal (concat (signal-value btor427) (signal-value btor426))
                            (merge-state (list btor427 btor426)))]
           [btor429 (signal (extract 47 47 (signal-value btor74)) (signal-state btor74))]
           [btor430 (signal (concat (signal-value btor429) (signal-value btor428))
                            (merge-state (list btor429 btor428)))]
           [btor431 (signal (extract 47 47 (signal-value btor74)) (signal-state btor74))]
           [btor432 (signal (concat (signal-value btor431) (signal-value btor430))
                            (merge-state (list btor431 btor430)))]
           [btor433 (signal (extract 47 47 (signal-value btor74)) (signal-state btor74))]
           [btor434 (signal (concat (signal-value btor433) (signal-value btor432))
                            (merge-state (list btor433 btor432)))]
           [btor435 (signal (extract 47 47 (signal-value btor74)) (signal-state btor74))]
           [btor436 (signal (concat (signal-value btor435) (signal-value btor434))
                            (merge-state (list btor435 btor434)))]
           [btor437 (signal (extract 47 47 (signal-value btor74)) (signal-state btor74))]
           [btor438 (signal (concat (signal-value btor437) (signal-value btor436))
                            (merge-state (list btor437 btor436)))]
           [btor439 (signal (extract 47 47 (signal-value btor74)) (signal-state btor74))]
           [btor440 (signal (concat (signal-value btor439) (signal-value btor438))
                            (merge-state (list btor439 btor438)))]
           [btor441 (signal (extract 47 47 (signal-value btor74)) (signal-state btor74))]
           [btor442 (signal (concat (signal-value btor441) (signal-value btor440))
                            (merge-state (list btor441 btor440)))]
           [btor443 (signal (extract 47 47 (signal-value btor74)) (signal-state btor74))]
           [btor444 (signal (concat (signal-value btor443) (signal-value btor442))
                            (merge-state (list btor443 btor442)))]
           [btor445 (signal (extract 47 47 (signal-value btor74)) (signal-state btor74))]
           [btor446 (signal (concat (signal-value btor445) (signal-value btor444))
                            (merge-state (list btor445 btor444)))]
           [btor447 (signal (extract 47 47 (signal-value btor74)) (signal-state btor74))]
           [btor448 (signal (concat (signal-value btor447) (signal-value btor446))
                            (merge-state (list btor447 btor446)))]
           [btor449 (signal (extract 47 47 (signal-value btor74)) (signal-state btor74))]
           [btor450 (signal (concat (signal-value btor449) (signal-value btor448))
                            (merge-state (list btor449 btor448)))]
           [btor451 (signal (extract 47 47 (signal-value btor74)) (signal-state btor74))]
           [btor452 (signal (concat (signal-value btor451) (signal-value btor450))
                            (merge-state (list btor451 btor450)))]
           [btor453 (signal (extract 47 47 (signal-value btor74)) (signal-state btor74))]
           [btor454 (signal (concat (signal-value btor453) (signal-value btor452))
                            (merge-state (list btor453 btor452)))]
           [btor455 (signal (extract 47 47 (signal-value btor74)) (signal-state btor74))]
           [btor456 (signal (concat (signal-value btor455) (signal-value btor454))
                            (merge-state (list btor455 btor454)))]
           [btor457 (signal (extract 6 4 (signal-value btor417)) (signal-state btor417))]
           [btor458 (bv->signal (bv 5 (bitvector 3)))]
           [btor459 (signal (bool->bitvector (bveq (signal-value btor457) (signal-value btor458)))
                            (merge-state (list btor457 btor458)))]
           [btor460 (if (bitvector->bool (signal-value btor459)) btor456 btor421)]
           [btor461 (bv->signal (bv 4 (bitvector 3)))]
           [btor462 (signal (bool->bitvector (bveq (signal-value btor457) (signal-value btor461)))
                            (merge-state (list btor457 btor461)))]
           [btor463 (bv->signal (zero-extend (signal-value btor103) (bitvector 3)) btor103)]
           [btor464 (signal (bool->bitvector (bveq (signal-value btor457) (signal-value btor463)))
                            (merge-state (list btor457 btor463)))]
           [btor465 (signal (concat (signal-value btor464) (signal-value btor462))
                            (merge-state (list btor464 btor462)))]
           [btor466 (signal (apply bvor (bitvector->bits (signal-value btor465)))
                            (signal-state btor465))]
           [btor467 (if (bitvector->bool (signal-value btor466)) btor338 btor460)]
           [btor468
            (let* ([state-value
                    (cond
                      [(hash-has-key? merged-input-state-hash 'state468)
                       (bv->signal (hash-ref merged-input-state-hash 'state468))]
                      [(hash-has-key? init-hash 'state468)
                       (bv->signal (hash-ref init-hash 'state468))]
                      [else
                       (log-warning
                        "state ~a with no initial value, init to 0, this may not be correct in the long term"
                        'state468)
                       (bv->signal (bv 0 (bitvector 48)))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              (when (not (bv? (signal-value state-value)))
                (error "Signal value invalid"))
              state-value)]
           [btor469
            (let* ([state-value
                    (cond
                      [(hash-has-key? merged-input-state-hash 'state469)
                       (bv->signal (hash-ref merged-input-state-hash 'state469))]
                      [(hash-has-key? init-hash 'state469)
                       (bv->signal (hash-ref init-hash 'state469))]
                      [else
                       (log-warning
                        "state ~a with no initial value, init to 0, this may not be correct in the long term"
                        'state469)
                       (bv->signal (bv 0 (bitvector 48)))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              (when (not (bv? (signal-value state-value)))
                (error "Signal value invalid"))
              state-value)]
           [btor470
            (let* ([state-value
                    (cond
                      [(hash-has-key? merged-input-state-hash 'state470)
                       (bv->signal (hash-ref merged-input-state-hash 'state470))]
                      [(hash-has-key? init-hash 'state470)
                       (bv->signal (hash-ref init-hash 'state470))]
                      [else
                       (log-warning
                        "state ~a with no initial value, init to 0, this may not be correct in the long term"
                        'state470)
                       (bv->signal (bv 0 (bitvector 1)))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              (when (not (bv? (signal-value state-value)))
                (error "Signal value invalid"))
              state-value)]
           [btor472 (signal (concat (signal-value btor100) (signal-value btor470))
                            (merge-state (list btor100 btor470)))]
           [btor473 (signal (bool->bitvector (bveq (signal-value btor472) (signal-value btor103)))
                            (merge-state (list btor472 btor103)))]
           [btor474 (if (bitvector->bool (signal-value btor473)) btor469 btor468)]
           [btor475 (signal (extract 0 0 (signal-value btor46)) (signal-state btor46))]
           [btor476 (if (bitvector->bool (signal-value btor475)) btor474 btor24)]
           [btor477 (bv->signal (zero-extend (signal-value btor419) (bitvector 3)) btor419)]
           [btor478 (signal (bool->bitvector (bveq (signal-value btor457) (signal-value btor477)))
                            (merge-state (list btor457 btor477)))]
           [btor479 (if (bitvector->bool (signal-value btor478)) btor476 btor467)]
           [btor480 (bv->signal (zero-extend (signal-value btor97) (bitvector 3)) btor97)]
           [btor481 (signal (bool->bitvector (bveq (signal-value btor457) (signal-value btor480)))
                            (merge-state (list btor457 btor480)))]
           [btor482 (if (bitvector->bool (signal-value btor481)) btor74 btor479)]
           [btor483 (bv->signal (bv 0 (bitvector 48)))]
           [btor484 (signal (apply bvor (bitvector->bits (signal-value btor457)))
                            (signal-state btor457))]
           [btor485 (signal (bvnot (signal-value btor484)) (merge-state (list btor484)))]
           [btor486 (if (bitvector->bool (signal-value btor485)) btor483 btor482)]
           [btor487 (signal (bvxor (signal-value btor330) (signal-value btor486))
                            (merge-state (list btor330 btor486)))]
           [btor488 unnamed-input-488]
           [btor489 (signal (concat (signal-value btor125) (signal-value btor153))
                            (merge-state (list btor125 btor153)))]
           [btor490 (signal (extract 1 0 (signal-value btor417)) (signal-state btor417))]
           [btor491 (signal (bool->bitvector (bveq (signal-value btor490) (signal-value btor419)))
                            (merge-state (list btor490 btor419)))]
           [btor492 (if (bitvector->bool (signal-value btor491)) btor489 btor488)]
           [btor493 (signal (bool->bitvector (bveq (signal-value btor490) (signal-value btor103)))
                            (merge-state (list btor490 btor103)))]
           [btor494 (if (bitvector->bool (signal-value btor493)) btor338 btor492)]
           [btor495 (bv->signal (bv 17592186044416 (bitvector 45)))]
           [btor496 (signal (extract 26 0 (signal-value btor125)) (signal-state btor125))]
           [btor497 (signal (extract 26 0 (signal-value btor105)) (signal-state btor105))]
           [btor498 (signal (extract 0 0 (signal-value btor50)) (signal-state btor50))]
           [btor499 (signal (extract 0 0 (signal-value btor55)) (signal-state btor55))]
           [btor500 (signal (bvxor (signal-value btor498) (signal-value btor499))
                            (merge-state (list btor498 btor499)))]
           [btor501 (signal (extract 1 1 (signal-value btor50)) (signal-state btor50))]
           [btor502 (signal (extract 1 1 (signal-value btor55)) (signal-state btor55))]
           [btor503 (signal (bvxor (signal-value btor501) (signal-value btor502))
                            (merge-state (list btor501 btor502)))]
           [btor504 (signal (extract 2 2 (signal-value btor50)) (signal-state btor50))]
           [btor505 (signal (extract 2 2 (signal-value btor55)) (signal-state btor55))]
           [btor506 (signal (bvxor (signal-value btor504) (signal-value btor505))
                            (merge-state (list btor504 btor505)))]
           [btor507 (signal (extract 3 3 (signal-value btor50)) (signal-state btor50))]
           [btor508 (signal (extract 3 3 (signal-value btor55)) (signal-state btor55))]
           [btor509 (signal (bvxor (signal-value btor507) (signal-value btor508))
                            (merge-state (list btor507 btor508)))]
           [btor510 (signal (extract 4 4 (signal-value btor50)) (signal-state btor50))]
           [btor511 (signal (extract 4 4 (signal-value btor55)) (signal-state btor55))]
           [btor512 (signal (bvxor (signal-value btor510) (signal-value btor511))
                            (merge-state (list btor510 btor511)))]
           [btor513 (signal (concat (signal-value btor503) (signal-value btor500))
                            (merge-state (list btor503 btor500)))]
           [btor514 (signal (concat (signal-value btor506) (signal-value btor513))
                            (merge-state (list btor506 btor513)))]
           [btor515 (signal (concat (signal-value btor509) (signal-value btor514))
                            (merge-state (list btor509 btor514)))]
           [btor516 (signal (concat (signal-value btor512) (signal-value btor515))
                            (merge-state (list btor512 btor515)))]
           [btor517
            (let* ([state-value
                    (cond
                      [(hash-has-key? merged-input-state-hash 'state517)
                       (bv->signal (hash-ref merged-input-state-hash 'state517))]
                      [(hash-has-key? init-hash 'state517)
                       (bv->signal (hash-ref init-hash 'state517))]
                      [else
                       (log-warning
                        "state ~a with no initial value, init to 0, this may not be correct in the long term"
                        'state517)
                       (bv->signal (bv 0 (bitvector 5)))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              (when (not (bv? (signal-value state-value)))
                (error "Signal value invalid"))
              state-value)]
           [btor518
            (let* ([state-value
                    (cond
                      [(hash-has-key? merged-input-state-hash 'state518)
                       (bv->signal (hash-ref merged-input-state-hash 'state518))]
                      [(hash-has-key? init-hash 'state518)
                       (bv->signal (hash-ref init-hash 'state518))]
                      [else
                       (log-warning
                        "state ~a with no initial value, init to 0, this may not be correct in the long term"
                        'state518)
                       (bv->signal (bv 0 (bitvector 5)))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              (when (not (bv? (signal-value state-value)))
                (error "Signal value invalid"))
              state-value)]
           [btor519
            (let* ([state-value
                    (cond
                      [(hash-has-key? merged-input-state-hash 'state519)
                       (bv->signal (hash-ref merged-input-state-hash 'state519))]
                      [(hash-has-key? init-hash 'state519)
                       (bv->signal (hash-ref init-hash 'state519))]
                      [else
                       (log-warning
                        "state ~a with no initial value, init to 0, this may not be correct in the long term"
                        'state519)
                       (bv->signal (bv 0 (bitvector 1)))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              (when (not (bv? (signal-value state-value)))
                (error "Signal value invalid"))
              state-value)]
           [btor521 (signal (concat (signal-value btor100) (signal-value btor519))
                            (merge-state (list btor100 btor519)))]
           [btor522 (signal (bool->bitvector (bveq (signal-value btor521) (signal-value btor103)))
                            (merge-state (list btor521 btor103)))]
           [btor523 (if (bitvector->bool (signal-value btor522)) btor518 btor517)]
           [btor524 (signal (extract 0 0 (signal-value btor51)) (signal-state btor51))]
           [btor525 (if (bitvector->bool (signal-value btor524)) btor523 btor516)]
           [btor526 (signal (extract 0 0 (signal-value btor525)) (signal-state btor525))]
           [btor527 (if (bitvector->bool (signal-value btor526)) btor497 btor496)]
           [btor528 (bv->signal (bv 0 (bitvector 27)))]
           [btor529 (bv->signal (zero-extend (signal-value btor97) (bitvector 5)) btor97)]
           [btor530 (signal (bool->bitvector (bveq (signal-value btor75) (signal-value btor529)))
                            (merge-state (list btor75 btor529)))]
           [btor531 (if (bitvector->bool (signal-value btor530)) btor97 btor106)]
           [btor532 (bv->signal (bv 0 (bitvector 3)))]
           [btor533 (signal (concat (signal-value btor532) (signal-value btor75))
                            (merge-state (list btor532 btor75)))]
           [btor534 (signal (apply bvor (bitvector->bits (signal-value btor533)))
                            (signal-state btor533))]
           [btor535 (signal (bvnot (signal-value btor534)) (merge-state (list btor534)))]
           [btor536 (if (bitvector->bool (signal-value btor535)) btor106 btor531)]
           [btor537 (signal (bvnot (signal-value btor536)) (merge-state (list btor536)))]
           [btor538 (signal (extract 1 1 (signal-value btor525)) (signal-state btor525))]
           [btor539 (signal (bvand (signal-value btor537) (signal-value btor538))
                            (merge-state (list btor537 btor538)))]
           [btor540 (if (bitvector->bool (signal-value btor539)) btor528 btor527)]
           [btor541
            (let* ([state-value
                    (cond
                      [(hash-has-key? merged-input-state-hash 'state541)
                       (bv->signal (hash-ref merged-input-state-hash 'state541))]
                      [(hash-has-key? init-hash 'state541)
                       (bv->signal (hash-ref init-hash 'state541))]
                      [else
                       (log-warning
                        "state ~a with no initial value, init to 0, this may not be correct in the long term"
                        'state541)
                       (bv->signal (bv 0 (bitvector 27)))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              (when (not (bv? (signal-value state-value)))
                (error "Signal value invalid"))
              state-value)]
           [btor542
            (let* ([state-value
                    (cond
                      [(hash-has-key? merged-input-state-hash 'state542)
                       (bv->signal (hash-ref merged-input-state-hash 'state542))]
                      [(hash-has-key? init-hash 'state542)
                       (bv->signal (hash-ref init-hash 'state542))]
                      [else
                       (log-warning
                        "state ~a with no initial value, init to 0, this may not be correct in the long term"
                        'state542)
                       (bv->signal (bv 0 (bitvector 27)))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              (when (not (bv? (signal-value state-value)))
                (error "Signal value invalid"))
              state-value)]
           [btor543
            (let* ([state-value
                    (cond
                      [(hash-has-key? merged-input-state-hash 'state543)
                       (bv->signal (hash-ref merged-input-state-hash 'state543))]
                      [(hash-has-key? init-hash 'state543)
                       (bv->signal (hash-ref init-hash 'state543))]
                      [else
                       (log-warning
                        "state ~a with no initial value, init to 0, this may not be correct in the long term"
                        'state543)
                       (bv->signal (bv 0 (bitvector 1)))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              (when (not (bv? (signal-value state-value)))
                (error "Signal value invalid"))
              state-value)]
           [btor545 (signal (concat (signal-value btor100) (signal-value btor543))
                            (merge-state (list btor100 btor543)))]
           [btor546 (signal (bool->bitvector (bveq (signal-value btor545) (signal-value btor103)))
                            (merge-state (list btor545 btor103)))]
           [btor547 (if (bitvector->bool (signal-value btor546)) btor542 btor541)]
           [btor548 (signal (extract 0 0 (signal-value btor49)) (signal-state btor49))]
           [btor549 (bv->signal (zero-extend (signal-value btor103) (bitvector 5)) btor103)]
           [btor550 (signal (bool->bitvector (bveq (signal-value btor11) (signal-value btor549)))
                            (merge-state (list btor11 btor549)))]
           [btor551 (if (bitvector->bool (signal-value btor550)) btor97 btor106)]
           [btor552 (bv->signal (bv 0 (bitvector 11)))]
           [btor553 (signal (concat (signal-value btor552) (signal-value btor11))
                            (merge-state (list btor552 btor11)))]
           [btor554 (signal (apply bvor (bitvector->bits (signal-value btor553)))
                            (signal-state btor553))]
           [btor555 (signal (bvnot (signal-value btor554)) (merge-state (list btor554)))]
           [btor556 (if (bitvector->bool (signal-value btor555)) btor106 btor551)]
           [btor557 (signal (bvnot (signal-value btor556)) (merge-state (list btor556)))]
           [btor558 (bv->signal (zero-extend (signal-value btor103) (bitvector 5)) btor103)]
           [btor559 (signal (bool->bitvector (bveq (signal-value btor20) (signal-value btor558)))
                            (merge-state (list btor20 btor558)))]
           [btor560 (if (bitvector->bool (signal-value btor559)) btor97 btor106)]
           [btor561 (bv->signal (zero-extend (signal-value btor97) (bitvector 5)) btor97)]
           [btor562 (signal (bool->bitvector (bveq (signal-value btor20) (signal-value btor561)))
                            (merge-state (list btor20 btor561)))]
           [btor563 (if (bitvector->bool (signal-value btor562)) btor106 btor560)]
           [btor564 (signal (bvnot (signal-value btor563)) (merge-state (list btor563)))]
           [btor565 (signal (bvand (signal-value btor557) (signal-value btor564))
                            (merge-state (list btor557 btor564)))]
           [btor566 (bv->signal (bv 20 (bitvector 5)))]
           [btor567 (signal (bool->bitvector (bveq (signal-value btor90) (signal-value btor566)))
                            (merge-state (list btor90 btor566)))]
           [btor568 (if (bitvector->bool (signal-value btor567)) btor103 btor186)]
           [btor569 (bv->signal (bv 18 (bitvector 5)))]
           [btor570 (signal (bool->bitvector (bveq (signal-value btor90) (signal-value btor569)))
                            (merge-state (list btor90 btor569)))]
           [btor571 (if (bitvector->bool (signal-value btor570)) btor190 btor568)]
           [btor572 (bv->signal (bv 10 (bitvector 4)))]
           [btor573 (bv->signal (zero-extend (signal-value btor572) (bitvector 5)) btor572)]
           [btor574 (signal (bool->bitvector (bveq (signal-value btor90) (signal-value btor573)))
                            (merge-state (list btor90 btor573)))]
           [btor575 (if (bitvector->bool (signal-value btor574)) btor186 btor571)]
           [btor576 (signal (bool->bitvector (bveq (signal-value btor575) (signal-value btor103)))
                            (merge-state (list btor575 btor103)))]
           [btor577 (signal (bvor (signal-value btor565) (signal-value btor576))
                            (merge-state (list btor565 btor576)))]
           [btor578 (if (bitvector->bool (signal-value btor577)) btor106 btor548)]
           [btor579 (if (bitvector->bool (signal-value btor578)) btor547 btor48)]
           [btor580 (signal (extract 2 2 (signal-value btor525)) (signal-state btor525))]
           [btor581 (if (bitvector->bool (signal-value btor580)) btor579 btor528)]
           [btor582 (signal (extract 4 4 (signal-value btor525)) (signal-state btor525))]
           [btor583 (if (bitvector->bool (signal-value btor582)) btor136 btor153)]
           [btor584 (bv->signal (bv 0 (bitvector 18)))]
           [btor585 (signal (bvand (signal-value btor536) (signal-value btor538))
                            (merge-state (list btor536 btor538)))]
           [btor586 (if (bitvector->bool (signal-value btor585)) btor584 btor583)]
           [btor587 (signal (extract 17 17 (signal-value btor586)) (signal-state btor586))]
           [btor588 (signal (concat (signal-value btor587) (signal-value btor586))
                            (merge-state (list btor587 btor586)))]
           [btor589 (signal (extract 17 17 (signal-value btor586)) (signal-state btor586))]
           [btor590 (signal (concat (signal-value btor589) (signal-value btor588))
                            (merge-state (list btor589 btor588)))]
           [btor591 (signal (extract 17 17 (signal-value btor586)) (signal-state btor586))]
           [btor592 (signal (concat (signal-value btor591) (signal-value btor590))
                            (merge-state (list btor591 btor590)))]
           [btor593 (signal (extract 17 17 (signal-value btor586)) (signal-state btor586))]
           [btor594 (signal (concat (signal-value btor593) (signal-value btor592))
                            (merge-state (list btor593 btor592)))]
           [btor595 (signal (extract 17 17 (signal-value btor586)) (signal-state btor586))]
           [btor596 (signal (concat (signal-value btor595) (signal-value btor594))
                            (merge-state (list btor595 btor594)))]
           [btor597 (signal (extract 17 17 (signal-value btor586)) (signal-state btor586))]
           [btor598 (signal (concat (signal-value btor597) (signal-value btor596))
                            (merge-state (list btor597 btor596)))]
           [btor599 (signal (extract 17 17 (signal-value btor586)) (signal-state btor586))]
           [btor600 (signal (concat (signal-value btor599) (signal-value btor598))
                            (merge-state (list btor599 btor598)))]
           [btor601 (signal (extract 17 17 (signal-value btor586)) (signal-state btor586))]
           [btor602 (signal (concat (signal-value btor601) (signal-value btor600))
                            (merge-state (list btor601 btor600)))]
           [btor603 (signal (extract 17 17 (signal-value btor586)) (signal-state btor586))]
           [btor604 (signal (concat (signal-value btor603) (signal-value btor602))
                            (merge-state (list btor603 btor602)))]
           [btor605 (if (bitvector->bool (signal-value btor536)) btor604 btor540)]
           [btor606 (signal (bvadd (signal-value btor581) (signal-value btor605))
                            (merge-state (list btor581 btor605)))]
           [btor607 (signal (bvsub (signal-value btor581) (signal-value btor605))
                            (merge-state (list btor581 btor605)))]
           [btor608 (signal (extract 3 3 (signal-value btor525)) (signal-state btor525))]
           [btor609 (if (bitvector->bool (signal-value btor608)) btor607 btor606)]
           [btor610
            (let* ([state-value
                    (cond
                      [(hash-has-key? merged-input-state-hash 'state610)
                       (bv->signal (hash-ref merged-input-state-hash 'state610))]
                      [(hash-has-key? init-hash 'state610)
                       (bv->signal (hash-ref init-hash 'state610))]
                      [else
                       (log-warning
                        "state ~a with no initial value, init to 0, this may not be correct in the long term"
                        'state610)
                       (bv->signal (bv 0 (bitvector 27)))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              (when (not (bv? (signal-value state-value)))
                (error "Signal value invalid"))
              state-value)]
           [btor611
            (let* ([state-value
                    (cond
                      [(hash-has-key? merged-input-state-hash 'state611)
                       (bv->signal (hash-ref merged-input-state-hash 'state611))]
                      [(hash-has-key? init-hash 'state611)
                       (bv->signal (hash-ref init-hash 'state611))]
                      [else
                       (log-warning
                        "state ~a with no initial value, init to 0, this may not be correct in the long term"
                        'state611)
                       (bv->signal (bv 0 (bitvector 27)))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              (when (not (bv? (signal-value state-value)))
                (error "Signal value invalid"))
              state-value)]
           [btor612
            (let* ([state-value
                    (cond
                      [(hash-has-key? merged-input-state-hash 'state612)
                       (bv->signal (hash-ref merged-input-state-hash 'state612))]
                      [(hash-has-key? init-hash 'state612)
                       (bv->signal (hash-ref init-hash 'state612))]
                      [else
                       (log-warning
                        "state ~a with no initial value, init to 0, this may not be correct in the long term"
                        'state612)
                       (bv->signal (bv 0 (bitvector 1)))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              (when (not (bv? (signal-value state-value)))
                (error "Signal value invalid"))
              state-value)]
           [btor614 (signal (concat (signal-value btor100) (signal-value btor612))
                            (merge-state (list btor100 btor612)))]
           [btor615 (signal (bool->bitvector (bveq (signal-value btor614) (signal-value btor103)))
                            (merge-state (list btor614 btor103)))]
           [btor616 (if (bitvector->bool (signal-value btor615)) btor611 btor610)]
           [btor617 (signal (extract 0 0 (signal-value btor6)) (signal-state btor6))]
           [btor618 (if (bitvector->bool (signal-value btor577)) btor106 btor617)]
           [btor619 (if (bitvector->bool (signal-value btor618)) btor616 btor609)]
           [btor620 (if (bitvector->bool (signal-value btor556)) btor619 btor540)]
           [btor621 (signal (extract 26 26 (signal-value btor620)) (signal-state btor620))]
           [btor622 (signal (concat (signal-value btor621) (signal-value btor620))
                            (merge-state (list btor621 btor620)))]
           [btor623 (signal (extract 26 26 (signal-value btor620)) (signal-state btor620))]
           [btor624 (signal (concat (signal-value btor623) (signal-value btor622))
                            (merge-state (list btor623 btor622)))]
           [btor625 (signal (extract 26 26 (signal-value btor620)) (signal-state btor620))]
           [btor626 (signal (concat (signal-value btor625) (signal-value btor624))
                            (merge-state (list btor625 btor624)))]
           [btor627 (signal (extract 26 26 (signal-value btor620)) (signal-state btor620))]
           [btor628 (signal (concat (signal-value btor627) (signal-value btor626))
                            (merge-state (list btor627 btor626)))]
           [btor629 (signal (extract 26 26 (signal-value btor620)) (signal-state btor620))]
           [btor630 (signal (concat (signal-value btor629) (signal-value btor628))
                            (merge-state (list btor629 btor628)))]
           [btor631 (signal (extract 26 26 (signal-value btor620)) (signal-state btor620))]
           [btor632 (signal (concat (signal-value btor631) (signal-value btor630))
                            (merge-state (list btor631 btor630)))]
           [btor633 (signal (extract 26 26 (signal-value btor620)) (signal-state btor620))]
           [btor634 (signal (concat (signal-value btor633) (signal-value btor632))
                            (merge-state (list btor633 btor632)))]
           [btor635 (signal (extract 26 26 (signal-value btor620)) (signal-state btor620))]
           [btor636 (signal (concat (signal-value btor635) (signal-value btor634))
                            (merge-state (list btor635 btor634)))]
           [btor637 (signal (extract 26 26 (signal-value btor620)) (signal-state btor620))]
           [btor638 (signal (concat (signal-value btor637) (signal-value btor636))
                            (merge-state (list btor637 btor636)))]
           [btor639 (signal (extract 26 26 (signal-value btor620)) (signal-state btor620))]
           [btor640 (signal (concat (signal-value btor639) (signal-value btor638))
                            (merge-state (list btor639 btor638)))]
           [btor641 (signal (extract 26 26 (signal-value btor620)) (signal-state btor620))]
           [btor642 (signal (concat (signal-value btor641) (signal-value btor640))
                            (merge-state (list btor641 btor640)))]
           [btor643 (signal (extract 26 26 (signal-value btor620)) (signal-state btor620))]
           [btor644 (signal (concat (signal-value btor643) (signal-value btor642))
                            (merge-state (list btor643 btor642)))]
           [btor645 (signal (extract 26 26 (signal-value btor620)) (signal-state btor620))]
           [btor646 (signal (concat (signal-value btor645) (signal-value btor644))
                            (merge-state (list btor645 btor644)))]
           [btor647 (signal (extract 26 26 (signal-value btor620)) (signal-state btor620))]
           [btor648 (signal (concat (signal-value btor647) (signal-value btor646))
                            (merge-state (list btor647 btor646)))]
           [btor649 (signal (extract 26 26 (signal-value btor620)) (signal-state btor620))]
           [btor650 (signal (concat (signal-value btor649) (signal-value btor648))
                            (merge-state (list btor649 btor648)))]
           [btor651 (signal (extract 26 26 (signal-value btor620)) (signal-state btor620))]
           [btor652 (signal (concat (signal-value btor651) (signal-value btor650))
                            (merge-state (list btor651 btor650)))]
           [btor653 (signal (extract 26 26 (signal-value btor620)) (signal-state btor620))]
           [btor654 (signal (concat (signal-value btor653) (signal-value btor652))
                            (merge-state (list btor653 btor652)))]
           [btor655 (signal (extract 26 26 (signal-value btor620)) (signal-state btor620))]
           [btor656 (signal (concat (signal-value btor655) (signal-value btor654))
                            (merge-state (list btor655 btor654)))]
           [btor657 (signal (extract 17 0 (signal-value btor619)) (signal-state btor619))]
           [btor658 (if (bitvector->bool (signal-value btor563)) btor657 btor586)]
           [btor659 (signal (extract 17 17 (signal-value btor658)) (signal-state btor658))]
           [btor660 (signal (concat (signal-value btor659) (signal-value btor658))
                            (merge-state (list btor659 btor658)))]
           [btor661 (signal (extract 17 17 (signal-value btor658)) (signal-state btor658))]
           [btor662 (signal (concat (signal-value btor661) (signal-value btor660))
                            (merge-state (list btor661 btor660)))]
           [btor663 (signal (extract 17 17 (signal-value btor658)) (signal-state btor658))]
           [btor664 (signal (concat (signal-value btor663) (signal-value btor662))
                            (merge-state (list btor663 btor662)))]
           [btor665 (signal (extract 17 17 (signal-value btor658)) (signal-state btor658))]
           [btor666 (signal (concat (signal-value btor665) (signal-value btor664))
                            (merge-state (list btor665 btor664)))]
           [btor667 (signal (extract 17 17 (signal-value btor658)) (signal-state btor658))]
           [btor668 (signal (concat (signal-value btor667) (signal-value btor666))
                            (merge-state (list btor667 btor666)))]
           [btor669 (signal (extract 17 17 (signal-value btor658)) (signal-state btor658))]
           [btor670 (signal (concat (signal-value btor669) (signal-value btor668))
                            (merge-state (list btor669 btor668)))]
           [btor671 (signal (extract 17 17 (signal-value btor658)) (signal-state btor658))]
           [btor672 (signal (concat (signal-value btor671) (signal-value btor670))
                            (merge-state (list btor671 btor670)))]
           [btor673 (signal (extract 17 17 (signal-value btor658)) (signal-state btor658))]
           [btor674 (signal (concat (signal-value btor673) (signal-value btor672))
                            (merge-state (list btor673 btor672)))]
           [btor675 (signal (extract 17 17 (signal-value btor658)) (signal-state btor658))]
           [btor676 (signal (concat (signal-value btor675) (signal-value btor674))
                            (merge-state (list btor675 btor674)))]
           [btor677 (signal (extract 17 17 (signal-value btor658)) (signal-state btor658))]
           [btor678 (signal (concat (signal-value btor677) (signal-value btor676))
                            (merge-state (list btor677 btor676)))]
           [btor679 (signal (extract 17 17 (signal-value btor658)) (signal-state btor658))]
           [btor680 (signal (concat (signal-value btor679) (signal-value btor678))
                            (merge-state (list btor679 btor678)))]
           [btor681 (signal (extract 17 17 (signal-value btor658)) (signal-state btor658))]
           [btor682 (signal (concat (signal-value btor681) (signal-value btor680))
                            (merge-state (list btor681 btor680)))]
           [btor683 (signal (extract 17 17 (signal-value btor658)) (signal-state btor658))]
           [btor684 (signal (concat (signal-value btor683) (signal-value btor682))
                            (merge-state (list btor683 btor682)))]
           [btor685 (signal (extract 17 17 (signal-value btor658)) (signal-state btor658))]
           [btor686 (signal (concat (signal-value btor685) (signal-value btor684))
                            (merge-state (list btor685 btor684)))]
           [btor687 (signal (extract 17 17 (signal-value btor658)) (signal-state btor658))]
           [btor688 (signal (concat (signal-value btor687) (signal-value btor686))
                            (merge-state (list btor687 btor686)))]
           [btor689 (signal (extract 17 17 (signal-value btor658)) (signal-state btor658))]
           [btor690 (signal (concat (signal-value btor689) (signal-value btor688))
                            (merge-state (list btor689 btor688)))]
           [btor691 (signal (extract 17 17 (signal-value btor658)) (signal-state btor658))]
           [btor692 (signal (concat (signal-value btor691) (signal-value btor690))
                            (merge-state (list btor691 btor690)))]
           [btor693 (signal (extract 17 17 (signal-value btor658)) (signal-state btor658))]
           [btor694 (signal (concat (signal-value btor693) (signal-value btor692))
                            (merge-state (list btor693 btor692)))]
           [btor695 (signal (extract 17 17 (signal-value btor658)) (signal-state btor658))]
           [btor696 (signal (concat (signal-value btor695) (signal-value btor694))
                            (merge-state (list btor695 btor694)))]
           [btor697 (signal (extract 17 17 (signal-value btor658)) (signal-state btor658))]
           [btor698 (signal (concat (signal-value btor697) (signal-value btor696))
                            (merge-state (list btor697 btor696)))]
           [btor699 (signal (extract 17 17 (signal-value btor658)) (signal-state btor658))]
           [btor700 (signal (concat (signal-value btor699) (signal-value btor698))
                            (merge-state (list btor699 btor698)))]
           [btor701 (signal (extract 17 17 (signal-value btor658)) (signal-state btor658))]
           [btor702 (signal (concat (signal-value btor701) (signal-value btor700))
                            (merge-state (list btor701 btor700)))]
           [btor703 (signal (extract 17 17 (signal-value btor658)) (signal-state btor658))]
           [btor704 (signal (concat (signal-value btor703) (signal-value btor702))
                            (merge-state (list btor703 btor702)))]
           [btor705 (signal (extract 17 17 (signal-value btor658)) (signal-state btor658))]
           [btor706 (signal (concat (signal-value btor705) (signal-value btor704))
                            (merge-state (list btor705 btor704)))]
           [btor707 (signal (extract 17 17 (signal-value btor658)) (signal-state btor658))]
           [btor708 (signal (concat (signal-value btor707) (signal-value btor706))
                            (merge-state (list btor707 btor706)))]
           [btor709 (signal (extract 17 17 (signal-value btor658)) (signal-state btor658))]
           [btor710 (signal (concat (signal-value btor709) (signal-value btor708))
                            (merge-state (list btor709 btor708)))]
           [btor711 (signal (extract 17 17 (signal-value btor658)) (signal-state btor658))]
           [btor712 (signal (concat (signal-value btor711) (signal-value btor710))
                            (merge-state (list btor711 btor710)))]
           [btor713 (signal (bvmul (signal-value btor656) (signal-value btor712))
                            (merge-state (list btor656 btor712)))]
           [btor714 (bv->signal (bv 0 (bitvector 45)))]
           [btor715 (if (bitvector->bool (signal-value btor576)) btor714 btor713)]
           [btor716 (signal (extract 43 0 (signal-value btor715)) (signal-state btor715))]
           [btor717 (bv->signal (bv 5864062014805 (bitvector 43)))]
           [btor718 (bv->signal (zero-extend (signal-value btor717) (bitvector 44)) btor717)]
           [btor719 (signal (bvand (signal-value btor716) (signal-value btor718))
                            (merge-state (list btor716 btor718)))]
           [btor720 (signal (concat (signal-value btor97) (signal-value btor719))
                            (merge-state (list btor97 btor719)))]
           [btor721
            (let* ([state-value
                    (cond
                      [(hash-has-key? merged-input-state-hash 'state721)
                       (bv->signal (hash-ref merged-input-state-hash 'state721))]
                      [(hash-has-key? init-hash 'state721)
                       (bv->signal (hash-ref init-hash 'state721))]
                      [else
                       (log-warning
                        "state ~a with no initial value, init to 0, this may not be correct in the long term"
                        'state721)
                       (bv->signal (bv 0 (bitvector 45)))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              (when (not (bv? (signal-value state-value)))
                (error "Signal value invalid"))
              state-value)]
           [btor722
            (let* ([state-value
                    (cond
                      [(hash-has-key? merged-input-state-hash 'state722)
                       (bv->signal (hash-ref merged-input-state-hash 'state722))]
                      [(hash-has-key? init-hash 'state722)
                       (bv->signal (hash-ref init-hash 'state722))]
                      [else
                       (log-warning
                        "state ~a with no initial value, init to 0, this may not be correct in the long term"
                        'state722)
                       (bv->signal (bv 0 (bitvector 45)))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              (when (not (bv? (signal-value state-value)))
                (error "Signal value invalid"))
              state-value)]
           [btor723
            (let* ([state-value
                    (cond
                      [(hash-has-key? merged-input-state-hash 'state723)
                       (bv->signal (hash-ref merged-input-state-hash 'state723))]
                      [(hash-has-key? init-hash 'state723)
                       (bv->signal (hash-ref init-hash 'state723))]
                      [else
                       (log-warning
                        "state ~a with no initial value, init to 0, this may not be correct in the long term"
                        'state723)
                       (bv->signal (bv 0 (bitvector 1)))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              (when (not (bv? (signal-value state-value)))
                (error "Signal value invalid"))
              state-value)]
           [btor725 (signal (concat (signal-value btor100) (signal-value btor723))
                            (merge-state (list btor100 btor723)))]
           [btor726 (signal (bool->bitvector (bveq (signal-value btor725) (signal-value btor103)))
                            (merge-state (list btor725 btor103)))]
           [btor727 (if (bitvector->bool (signal-value btor726)) btor722 btor721)]
           [btor728 (signal (extract 0 0 (signal-value btor69)) (signal-state btor69))]
           [btor729 (if (bitvector->bool (signal-value btor728)) btor727 btor720)]
           [btor730 (signal (apply bvor (bitvector->bits (signal-value btor197)))
                            (signal-state btor197))]
           [btor731 (signal (bvnot (signal-value btor730)) (merge-state (list btor730)))]
           [btor732 (if (bitvector->bool (signal-value btor731)) btor729 btor495)]
           [btor733 (signal (extract 44 44 (signal-value btor732)) (signal-state btor732))]
           [btor734 (signal (concat (signal-value btor733) (signal-value btor732))
                            (merge-state (list btor733 btor732)))]
           [btor735 (signal (extract 44 44 (signal-value btor732)) (signal-state btor732))]
           [btor736 (signal (concat (signal-value btor735) (signal-value btor734))
                            (merge-state (list btor735 btor734)))]
           [btor737 (signal (extract 44 44 (signal-value btor732)) (signal-state btor732))]
           [btor738 (signal (concat (signal-value btor737) (signal-value btor736))
                            (merge-state (list btor737 btor736)))]
           [btor739 (bv->signal (zero-extend (signal-value btor97) (bitvector 2)) btor97)]
           [btor740 (signal (bool->bitvector (bveq (signal-value btor490) (signal-value btor739)))
                            (merge-state (list btor490 btor739)))]
           [btor741 (if (bitvector->bool (signal-value btor740)) btor738 btor494)]
           [btor742 (signal (concat (signal-value btor70) (signal-value btor106))
                            (merge-state (list btor70 btor106)))]
           [btor743 (if (bitvector->bool (signal-value btor462)) btor742 btor186)]
           [btor744 (bv->signal (bv 0 (bitvector 46)))]
           [btor745 (signal (concat (signal-value btor744) (signal-value btor743))
                            (merge-state (list btor744 btor743)))]
           [btor746 (signal (apply bvor (bitvector->bits (signal-value btor490)))
                            (signal-state btor490))]
           [btor747 (signal (bvnot (signal-value btor746)) (merge-state (list btor746)))]
           [btor748 (if (bitvector->bool (signal-value btor747)) btor745 btor741)]
           [btor749 (signal (bvxor (signal-value btor487) (signal-value btor748))
                            (merge-state (list btor487 btor748)))]
           [btor750 unnamed-input-750]
           [btor751 (signal (extract 3 2 (signal-value btor417)) (signal-state btor417))]
           [btor752 (signal (bool->bitvector (bveq (signal-value btor751) (signal-value btor419)))
                            (merge-state (list btor751 btor419)))]
           [btor753 (if (bitvector->bool (signal-value btor752)) btor476 btor750)]
           [btor754 (bv->signal (bv 281474976710655 (bitvector 48)))]
           [btor755 (signal (bool->bitvector (bveq (signal-value btor751) (signal-value btor103)))
                            (merge-state (list btor751 btor103)))]
           [btor756 (if (bitvector->bool (signal-value btor755)) btor754 btor753)]
           [btor757 (bv->signal (bv 11728124029610 (bitvector 44)))]
           [btor758 (signal (bvand (signal-value btor716) (signal-value btor757))
                            (merge-state (list btor716 btor757)))]
           [btor759 (signal (extract 44 44 (signal-value btor715)) (signal-state btor715))]
           [btor760 (signal (bvnot (signal-value btor759)) (merge-state (list btor759)))]
           [btor761 (signal (concat (signal-value btor760) (signal-value btor758))
                            (merge-state (list btor760 btor758)))]
           [btor762
            (let* ([state-value
                    (cond
                      [(hash-has-key? merged-input-state-hash 'state762)
                       (bv->signal (hash-ref merged-input-state-hash 'state762))]
                      [(hash-has-key? init-hash 'state762)
                       (bv->signal (hash-ref init-hash 'state762))]
                      [else
                       (log-warning
                        "state ~a with no initial value, init to 0, this may not be correct in the long term"
                        'state762)
                       (bv->signal (bv 0 (bitvector 45)))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              (when (not (bv? (signal-value state-value)))
                (error "Signal value invalid"))
              state-value)]
           [btor763
            (let* ([state-value
                    (cond
                      [(hash-has-key? merged-input-state-hash 'state763)
                       (bv->signal (hash-ref merged-input-state-hash 'state763))]
                      [(hash-has-key? init-hash 'state763)
                       (bv->signal (hash-ref init-hash 'state763))]
                      [else
                       (log-warning
                        "state ~a with no initial value, init to 0, this may not be correct in the long term"
                        'state763)
                       (bv->signal (bv 0 (bitvector 45)))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              (when (not (bv? (signal-value state-value)))
                (error "Signal value invalid"))
              state-value)]
           [btor764
            (let* ([state-value
                    (cond
                      [(hash-has-key? merged-input-state-hash 'state764)
                       (bv->signal (hash-ref merged-input-state-hash 'state764))]
                      [(hash-has-key? init-hash 'state764)
                       (bv->signal (hash-ref init-hash 'state764))]
                      [else
                       (log-warning
                        "state ~a with no initial value, init to 0, this may not be correct in the long term"
                        'state764)
                       (bv->signal (bv 0 (bitvector 1)))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              (when (not (bv? (signal-value state-value)))
                (error "Signal value invalid"))
              state-value)]
           [btor766 (signal (concat (signal-value btor100) (signal-value btor764))
                            (merge-state (list btor100 btor764)))]
           [btor767 (signal (bool->bitvector (bveq (signal-value btor766) (signal-value btor103)))
                            (merge-state (list btor766 btor103)))]
           [btor768 (if (bitvector->bool (signal-value btor767)) btor763 btor762)]
           [btor769 (if (bitvector->bool (signal-value btor728)) btor768 btor761)]
           [btor770 (if (bitvector->bool (signal-value btor731)) btor769 btor495)]
           [btor771 (signal (concat (signal-value btor532) (signal-value btor770))
                            (merge-state (list btor532 btor770)))]
           [btor772 (bv->signal (zero-extend (signal-value btor97) (bitvector 2)) btor97)]
           [btor773 (signal (bool->bitvector (bveq (signal-value btor751) (signal-value btor772)))
                            (merge-state (list btor751 btor772)))]
           [btor774 (if (bitvector->bool (signal-value btor773)) btor771 btor756)]
           [btor775 (signal (apply bvor (bitvector->bits (signal-value btor751)))
                            (signal-state btor751))]
           [btor776 (signal (bvnot (signal-value btor775)) (merge-state (list btor775)))]
           [btor777 (if (bitvector->bool (signal-value btor776)) btor483 btor774)]
           [btor778 (signal (bvxor (signal-value btor749) (signal-value btor777))
                            (merge-state (list btor749 btor777)))]
           [btor779 (signal (bvand (signal-value btor748) (signal-value btor777))
                            (merge-state (list btor748 btor777)))]
           [btor780 (signal (bvand (signal-value btor487) (signal-value btor777))
                            (merge-state (list btor487 btor777)))]
           [btor781 (signal (bvor (signal-value btor779) (signal-value btor780))
                            (merge-state (list btor779 btor780)))]
           [btor782 (signal (bvand (signal-value btor748) (signal-value btor487))
                            (merge-state (list btor748 btor487)))]
           [btor783 (signal (bvor (signal-value btor781) (signal-value btor782))
                            (merge-state (list btor781 btor782)))]
           [btor784 (signal (extract 3 3 (signal-value btor181)) (signal-state btor181))]
           [btor785 (if (bitvector->bool (signal-value btor784)) btor783 btor778)]
           [btor786 (signal (extract 2 2 (signal-value btor181)) (signal-state btor181))]
           [btor787 (if (bitvector->bool (signal-value btor786)) btor483 btor783)]
           [btor788 (signal (extract 11 11 (signal-value btor787)) (signal-state btor787))]
           [btor789 (signal (bvand (signal-value btor788) (signal-value btor199))
                            (merge-state (list btor788 btor199)))]
           [btor790 (signal (extract 23 23 (signal-value btor787)) (signal-state btor787))]
           [btor791 (signal (bvand (signal-value btor790) (signal-value btor731))
                            (merge-state (list btor790 btor731)))]
           [btor792 (signal (extract 35 35 (signal-value btor787)) (signal-state btor787))]
           [btor793 (signal (bvand (signal-value btor792) (signal-value btor199))
                            (merge-state (list btor792 btor199)))]
           [btor794 (signal (extract 10 0 (signal-value btor787)) (signal-state btor787))]
           [btor795 (signal (concat (signal-value btor794) (signal-value btor106))
                            (merge-state (list btor794 btor106)))]
           [btor796 (signal (concat (signal-value btor789) (signal-value btor795))
                            (merge-state (list btor789 btor795)))]
           [btor797 (signal (extract 22 12 (signal-value btor787)) (signal-state btor787))]
           [btor798 (signal (concat (signal-value btor797) (signal-value btor796))
                            (merge-state (list btor797 btor796)))]
           [btor799 (signal (concat (signal-value btor791) (signal-value btor798))
                            (merge-state (list btor791 btor798)))]
           [btor800 (signal (extract 34 24 (signal-value btor787)) (signal-state btor787))]
           [btor801 (signal (concat (signal-value btor800) (signal-value btor799))
                            (merge-state (list btor800 btor799)))]
           [btor802 (signal (concat (signal-value btor793) (signal-value btor801))
                            (merge-state (list btor793 btor801)))]
           [btor803 (signal (extract 46 36 (signal-value btor787)) (signal-state btor787))]
           [btor804 (signal (concat (signal-value btor803) (signal-value btor802))
                            (merge-state (list btor803 btor802)))]
           [btor805 (signal (bvand (signal-value btor785) (signal-value btor804))
                            (merge-state (list btor785 btor804)))]
           [btor806 unnamed-input-806]
           [btor807 (signal (extract 8 7 (signal-value btor417)) (signal-state btor417))]
           [btor808 (signal (bool->bitvector (bveq (signal-value btor807) (signal-value btor419)))
                            (merge-state (list btor807 btor419)))]
           [btor809 (if (bitvector->bool (signal-value btor808)) btor476 btor806)]
           [btor810 (signal (bool->bitvector (bveq (signal-value btor807) (signal-value btor103)))
                            (merge-state (list btor807 btor103)))]
           [btor811 (if (bitvector->bool (signal-value btor810)) btor77 btor809)]
           [btor812 (bv->signal (zero-extend (signal-value btor97) (bitvector 2)) btor97)]
           [btor813 (signal (bool->bitvector (bveq (signal-value btor807) (signal-value btor812)))
                            (merge-state (list btor807 btor812)))]
           [btor814 (if (bitvector->bool (signal-value btor813)) btor338 btor811)]
           [btor815 (signal (apply bvor (bitvector->bits (signal-value btor807)))
                            (signal-state btor807))]
           [btor816 (signal (bvnot (signal-value btor815)) (merge-state (list btor815)))]
           [btor817 (if (bitvector->bool (signal-value btor816)) btor483 btor814)]
           [btor818 (signal (bvand (signal-value btor817) (signal-value btor804))
                            (merge-state (list btor817 btor804)))]
           [btor819 (signal (bvor (signal-value btor805) (signal-value btor818))
                            (merge-state (list btor805 btor818)))]
           [btor820 (signal (bvand (signal-value btor785) (signal-value btor817))
                            (merge-state (list btor785 btor817)))]
           [btor821 (signal (bvor (signal-value btor819) (signal-value btor820))
                            (merge-state (list btor819 btor820)))]
           [btor822 (signal (extract 35 35 (signal-value btor821)) (signal-state btor821))]
           [btor823 (signal (bvand (signal-value btor199) (signal-value btor822))
                            (merge-state (list btor199 btor822)))]
           [btor824 (signal (extract 47 36 (signal-value btor821)) (signal-state btor821))]
           [btor825 (signal (concat (signal-value btor824) (signal-value btor823))
                            (merge-state (list btor824 btor823)))]
           [btor826 (bv->signal (zero-extend (signal-value btor825) (bitvector 14)) btor825)]
           [btor827 (signal (bvxor (signal-value btor785) (signal-value btor804))
                            (merge-state (list btor785 btor804)))]
           [btor828 (signal (bvxor (signal-value btor827) (signal-value btor817))
                            (merge-state (list btor827 btor817)))]
           [btor829 (signal (extract 47 36 (signal-value btor828)) (signal-state btor828))]
           [btor830 (signal (extract 47 47 (signal-value btor787)) (signal-state btor787))]
           [btor831 (signal (concat (signal-value btor830) (signal-value btor829))
                            (merge-state (list btor830 btor829)))]
           [btor832 (bv->signal (zero-extend (signal-value btor831) (bitvector 14)) btor831)]
           [btor833 (signal (bvadd (signal-value btor826) (signal-value btor832))
                            (merge-state (list btor826 btor832)))]
           [btor834 (signal (extract 23 23 (signal-value btor821)) (signal-state btor821))]
           [btor835 (signal (bvand (signal-value btor731) (signal-value btor834))
                            (merge-state (list btor731 btor834)))]
           [btor836 (signal (extract 34 24 (signal-value btor821)) (signal-state btor821))]
           [btor837 (signal (concat (signal-value btor836) (signal-value btor835))
                            (merge-state (list btor836 btor835)))]
           [btor838 (bv->signal (zero-extend (signal-value btor837) (bitvector 13)) btor837)]
           [btor839 (signal (extract 35 24 (signal-value btor828)) (signal-state btor828))]
           [btor840 (bv->signal (zero-extend (signal-value btor839) (bitvector 13)) btor839)]
           [btor841 (signal (bvadd (signal-value btor838) (signal-value btor840))
                            (merge-state (list btor838 btor840)))]
           [btor842 (signal (extract 11 11 (signal-value btor821)) (signal-state btor821))]
           [btor843 (signal (bvand (signal-value btor199) (signal-value btor842))
                            (merge-state (list btor199 btor842)))]
           [btor844 (signal (extract 22 12 (signal-value btor821)) (signal-state btor821))]
           [btor845 (signal (concat (signal-value btor844) (signal-value btor843))
                            (merge-state (list btor844 btor843)))]
           [btor846 (bv->signal (zero-extend (signal-value btor845) (bitvector 13)) btor845)]
           [btor847 (signal (extract 23 12 (signal-value btor828)) (signal-state btor828))]
           [btor848 (bv->signal (zero-extend (signal-value btor847) (bitvector 13)) btor847)]
           [btor849 (signal (bvadd (signal-value btor846) (signal-value btor848))
                            (merge-state (list btor846 btor848)))]
           [btor850 unnamed-input-850]
           [btor851 (signal (extract 47 47 (signal-value btor338)) (signal-state btor338))]
           [btor852 (signal (bvnot (signal-value btor851)) (merge-state (list btor851)))]
           [btor853
            (let* ([state-value
                    (cond
                      [(hash-has-key? merged-input-state-hash 'state853)
                       (bv->signal (hash-ref merged-input-state-hash 'state853))]
                      [(hash-has-key? init-hash 'state853)
                       (bv->signal (hash-ref init-hash 'state853))]
                      [else
                       (log-warning
                        "state ~a with no initial value, init to 0, this may not be correct in the long term"
                        'state853)
                       (bv->signal (bv 0 (bitvector 3)))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              (when (not (bv? (signal-value state-value)))
                (error "Signal value invalid"))
              state-value)]
           [btor854
            (let* ([state-value
                    (cond
                      [(hash-has-key? merged-input-state-hash 'state854)
                       (bv->signal (hash-ref merged-input-state-hash 'state854))]
                      [(hash-has-key? init-hash 'state854)
                       (bv->signal (hash-ref init-hash 'state854))]
                      [else
                       (log-warning
                        "state ~a with no initial value, init to 0, this may not be correct in the long term"
                        'state854)
                       (bv->signal (bv 0 (bitvector 3)))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              (when (not (bv? (signal-value state-value)))
                (error "Signal value invalid"))
              state-value)]
           [btor855
            (let* ([state-value
                    (cond
                      [(hash-has-key? merged-input-state-hash 'state855)
                       (bv->signal (hash-ref merged-input-state-hash 'state855))]
                      [(hash-has-key? init-hash 'state855)
                       (bv->signal (hash-ref init-hash 'state855))]
                      [else
                       (log-warning
                        "state ~a with no initial value, init to 0, this may not be correct in the long term"
                        'state855)
                       (bv->signal (bv 0 (bitvector 1)))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              (when (not (bv? (signal-value state-value)))
                (error "Signal value invalid"))
              state-value)]
           [btor857 (signal (concat (signal-value btor100) (signal-value btor855))
                            (merge-state (list btor100 btor855)))]
           [btor858 (signal (bool->bitvector (bveq (signal-value btor857) (signal-value btor103)))
                            (merge-state (list btor857 btor103)))]
           [btor859 (if (bitvector->bool (signal-value btor858)) btor854 btor853)]
           [btor860 (signal (extract 0 0 (signal-value btor31)) (signal-state btor31))]
           [btor861 (if (bitvector->bool (signal-value btor860)) btor859 btor30)]
           [btor862 (signal (bool->bitvector (bveq (signal-value btor861) (signal-value btor111)))
                            (merge-state (list btor861 btor111)))]
           [btor863 (if (bitvector->bool (signal-value btor862)) btor852 btor850)]
           [btor864 (signal (extract 26 26 (signal-value btor620)) (signal-state btor620))]
           [btor865 (signal (extract 17 17 (signal-value btor658)) (signal-state btor658))]
           [btor866 (signal (bvxor (signal-value btor864) (signal-value btor865))
                            (merge-state (list btor864 btor865)))]
           [btor867 (signal (bvnot (signal-value btor866)) (merge-state (list btor866)))]
           [btor868
            (let* ([state-value
                    (cond
                      [(hash-has-key? merged-input-state-hash 'state868)
                       (bv->signal (hash-ref merged-input-state-hash 'state868))]
                      [(hash-has-key? init-hash 'state868)
                       (bv->signal (hash-ref init-hash 'state868))]
                      [else
                       (log-warning
                        "state ~a with no initial value, init to 0, this may not be correct in the long term"
                        'state868)
                       (bv->signal (bv 0 (bitvector 1)))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              (when (not (bv? (signal-value state-value)))
                (error "Signal value invalid"))
              state-value)]
           [btor869
            (let* ([state-value
                    (cond
                      [(hash-has-key? merged-input-state-hash 'state869)
                       (bv->signal (hash-ref merged-input-state-hash 'state869))]
                      [(hash-has-key? init-hash 'state869)
                       (bv->signal (hash-ref init-hash 'state869))]
                      [else
                       (log-warning
                        "state ~a with no initial value, init to 0, this may not be correct in the long term"
                        'state869)
                       (bv->signal (bv 0 (bitvector 1)))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              (when (not (bv? (signal-value state-value)))
                (error "Signal value invalid"))
              state-value)]
           [btor870
            (let* ([state-value
                    (cond
                      [(hash-has-key? merged-input-state-hash 'state870)
                       (bv->signal (hash-ref merged-input-state-hash 'state870))]
                      [(hash-has-key? init-hash 'state870)
                       (bv->signal (hash-ref init-hash 'state870))]
                      [else
                       (log-warning
                        "state ~a with no initial value, init to 0, this may not be correct in the long term"
                        'state870)
                       (bv->signal (bv 0 (bitvector 1)))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              (when (not (bv? (signal-value state-value)))
                (error "Signal value invalid"))
              state-value)]
           [btor872 (signal (concat (signal-value btor100) (signal-value btor870))
                            (merge-state (list btor100 btor870)))]
           [btor873 (signal (bool->bitvector (bveq (signal-value btor872) (signal-value btor103)))
                            (merge-state (list btor872 btor103)))]
           [btor874 (if (bitvector->bool (signal-value btor873)) btor869 btor868)]
           [btor875 (if (bitvector->bool (signal-value btor728)) btor874 btor867)]
           [btor876 (signal (bvnot (signal-value btor875)) (merge-state (list btor875)))]
           [btor877 (bv->signal (bv 6 (bitvector 3)))]
           [btor878 (signal (bool->bitvector (bveq (signal-value btor861) (signal-value btor877)))
                            (merge-state (list btor861 btor877)))]
           [btor879 (if (bitvector->bool (signal-value btor878)) btor876 btor863)]
           [btor880 (signal (bool->bitvector (bveq (signal-value btor861) (signal-value btor458)))
                            (merge-state (list btor861 btor458)))]
           [btor881 (if (bitvector->bool (signal-value btor880)) btor851 btor879)]
           [btor882
            (let* ([state-value
                    (cond
                      [(hash-has-key? merged-input-state-hash 'state882)
                       (bv->signal (hash-ref merged-input-state-hash 'state882))]
                      [(hash-has-key? init-hash 'state882)
                       (bv->signal (hash-ref init-hash 'state882))]
                      [else
                       (log-warning
                        "state ~a with no initial value, init to 0, this may not be correct in the long term"
                        'state882)
                       (bv->signal (bv 0 (bitvector 1)))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              (when (not (bv? (signal-value state-value)))
                (error "Signal value invalid"))
              state-value)]
           [btor883
            (let* ([state-value
                    (cond
                      [(hash-has-key? merged-input-state-hash 'state883)
                       (bv->signal (hash-ref merged-input-state-hash 'state883))]
                      [(hash-has-key? init-hash 'state883)
                       (bv->signal (hash-ref init-hash 'state883))]
                      [else
                       (log-warning
                        "state ~a with no initial value, init to 0, this may not be correct in the long term"
                        'state883)
                       (bv->signal (bv 0 (bitvector 1)))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              (when (not (bv? (signal-value state-value)))
                (error "Signal value invalid"))
              state-value)]
           [btor884
            (let* ([state-value
                    (cond
                      [(hash-has-key? merged-input-state-hash 'state884)
                       (bv->signal (hash-ref merged-input-state-hash 'state884))]
                      [(hash-has-key? init-hash 'state884)
                       (bv->signal (hash-ref init-hash 'state884))]
                      [else
                       (log-warning
                        "state ~a with no initial value, init to 0, this may not be correct in the long term"
                        'state884)
                       (bv->signal (bv 0 (bitvector 1)))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              (when (not (bv? (signal-value state-value)))
                (error "Signal value invalid"))
              state-value)]
           [btor886 (signal (concat (signal-value btor100) (signal-value btor884))
                            (merge-state (list btor100 btor884)))]
           [btor887 (signal (bool->bitvector (bveq (signal-value btor886) (signal-value btor103)))
                            (merge-state (list btor886 btor103)))]
           [btor888 (if (bitvector->bool (signal-value btor887)) btor883 btor882)]
           [btor889
            (let* ([state-value
                    (cond
                      [(hash-has-key? merged-input-state-hash 'state889)
                       (bv->signal (hash-ref merged-input-state-hash 'state889))]
                      [(hash-has-key? init-hash 'state889)
                       (bv->signal (hash-ref init-hash 'state889))]
                      [else
                       (log-warning
                        "state ~a with no initial value, init to 0, this may not be correct in the long term"
                        'state889)
                       (bv->signal (bv 0 (bitvector 4)))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              (when (not (bv? (signal-value state-value)))
                (error "Signal value invalid"))
              state-value)]
           [btor890
            (let* ([state-value
                    (cond
                      [(hash-has-key? merged-input-state-hash 'state890)
                       (bv->signal (hash-ref merged-input-state-hash 'state890))]
                      [(hash-has-key? init-hash 'state890)
                       (bv->signal (hash-ref init-hash 'state890))]
                      [else
                       (log-warning
                        "state ~a with no initial value, init to 0, this may not be correct in the long term"
                        'state890)
                       (bv->signal (bv 0 (bitvector 4)))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              (when (not (bv? (signal-value state-value)))
                (error "Signal value invalid"))
              state-value)]
           [btor891
            (let* ([state-value
                    (cond
                      [(hash-has-key? merged-input-state-hash 'state891)
                       (bv->signal (hash-ref merged-input-state-hash 'state891))]
                      [(hash-has-key? init-hash 'state891)
                       (bv->signal (hash-ref init-hash 'state891))]
                      [else
                       (log-warning
                        "state ~a with no initial value, init to 0, this may not be correct in the long term"
                        'state891)
                       (bv->signal (bv 0 (bitvector 1)))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              (when (not (bv? (signal-value state-value)))
                (error "Signal value invalid"))
              state-value)]
           [btor893 (signal (concat (signal-value btor100) (signal-value btor891))
                            (merge-state (list btor100 btor891)))]
           [btor894 (signal (bool->bitvector (bveq (signal-value btor893) (signal-value btor103)))
                            (merge-state (list btor893 btor103)))]
           [btor895 (if (bitvector->bool (signal-value btor894)) btor890 btor889)]
           [btor896 (signal (extract 3 3 (signal-value btor895)) (signal-state btor895))]
           [btor897 (signal (bvxor (signal-value btor888) (signal-value btor896))
                            (merge-state (list btor888 btor896)))]
           [btor898 (signal (bvnot (signal-value btor897)) (merge-state (list btor897)))]
           [btor899 (signal (bool->bitvector (bveq (signal-value btor861) (signal-value btor461)))
                            (merge-state (list btor861 btor461)))]
           [btor900 (if (bitvector->bool (signal-value btor899)) btor898 btor881)]
           [btor901 (signal (extract 47 47 (signal-value btor74)) (signal-state btor74))]
           [btor902 (signal (bvnot (signal-value btor901)) (merge-state (list btor901)))]
           [btor903 (bv->signal (zero-extend (signal-value btor419) (bitvector 3)) btor419)]
           [btor904 (signal (bool->bitvector (bveq (signal-value btor861) (signal-value btor903)))
                            (merge-state (list btor861 btor903)))]
           [btor905 (if (bitvector->bool (signal-value btor904)) btor902 btor900)]
           [btor906 (signal (bvnot (signal-value btor26)) (merge-state (list btor26)))]
           [btor907 (bv->signal (zero-extend (signal-value btor103) (bitvector 3)) btor103)]
           [btor908 (signal (bool->bitvector (bveq (signal-value btor861) (signal-value btor907)))
                            (merge-state (list btor861 btor907)))]
           [btor909 (if (bitvector->bool (signal-value btor908)) btor906 btor905)]
           [btor910 (bv->signal (zero-extend (signal-value btor97) (bitvector 3)) btor97)]
           [btor911 (signal (bool->bitvector (bveq (signal-value btor861) (signal-value btor910)))
                            (merge-state (list btor861 btor910)))]
           [btor912 (if (bitvector->bool (signal-value btor911)) btor901 btor909)]
           [btor913 (signal (bvxor (signal-value btor27) (signal-value btor53))
                            (merge-state (list btor27 btor53)))]
           [btor914
            (let* ([state-value
                    (cond
                      [(hash-has-key? merged-input-state-hash 'state914)
                       (bv->signal (hash-ref merged-input-state-hash 'state914))]
                      [(hash-has-key? init-hash 'state914)
                       (bv->signal (hash-ref init-hash 'state914))]
                      [else
                       (log-warning
                        "state ~a with no initial value, init to 0, this may not be correct in the long term"
                        'state914)
                       (bv->signal (bv 0 (bitvector 1)))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              (when (not (bv? (signal-value state-value)))
                (error "Signal value invalid"))
              state-value)]
           [btor915
            (let* ([state-value
                    (cond
                      [(hash-has-key? merged-input-state-hash 'state915)
                       (bv->signal (hash-ref merged-input-state-hash 'state915))]
                      [(hash-has-key? init-hash 'state915)
                       (bv->signal (hash-ref init-hash 'state915))]
                      [else
                       (log-warning
                        "state ~a with no initial value, init to 0, this may not be correct in the long term"
                        'state915)
                       (bv->signal (bv 0 (bitvector 1)))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              (when (not (bv? (signal-value state-value)))
                (error "Signal value invalid"))
              state-value)]
           [btor916
            (let* ([state-value
                    (cond
                      [(hash-has-key? merged-input-state-hash 'state916)
                       (bv->signal (hash-ref merged-input-state-hash 'state916))]
                      [(hash-has-key? init-hash 'state916)
                       (bv->signal (hash-ref init-hash 'state916))]
                      [else
                       (log-warning
                        "state ~a with no initial value, init to 0, this may not be correct in the long term"
                        'state916)
                       (bv->signal (bv 0 (bitvector 1)))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              (when (not (bv? (signal-value state-value)))
                (error "Signal value invalid"))
              state-value)]
           [btor918 (signal (concat (signal-value btor100) (signal-value btor916))
                            (merge-state (list btor100 btor916)))]
           [btor919 (signal (bool->bitvector (bveq (signal-value btor918) (signal-value btor103)))
                            (merge-state (list btor918 btor103)))]
           [btor920 (if (bitvector->bool (signal-value btor919)) btor915 btor914)]
           [btor921 (signal (extract 0 0 (signal-value btor28)) (signal-state btor28))]
           [btor922 (if (bitvector->bool (signal-value btor921)) btor920 btor913)]
           [btor923 (signal (bvnot (signal-value btor922)) (merge-state (list btor922)))]
           [btor924 (signal (apply bvor (bitvector->bits (signal-value btor861)))
                            (signal-state btor861))]
           [btor925 (signal (bvnot (signal-value btor924)) (merge-state (list btor924)))]
           [btor926 (if (bitvector->bool (signal-value btor925)) btor923 btor912)]
           [btor927 (signal (bvnot (signal-value btor926)) (merge-state (list btor926)))]
           [btor928 (signal (bvor (signal-value btor784) (signal-value btor786))
                            (merge-state (list btor784 btor786)))]
           [btor929 (if (bitvector->bool (signal-value btor928)) btor106 btor927)]
           [btor930 (signal (extract 10 0 (signal-value btor821)) (signal-state btor821))]
           [btor931 (signal (concat (signal-value btor930) (signal-value btor929))
                            (merge-state (list btor930 btor929)))]
           [btor932 (bv->signal (zero-extend (signal-value btor931) (bitvector 13)) btor931)]
           [btor933 (signal (extract 11 0 (signal-value btor828)) (signal-state btor828))]
           [btor934 (bv->signal (zero-extend (signal-value btor933) (bitvector 13)) btor933)]
           [btor935 (signal (bvadd (signal-value btor932) (signal-value btor934))
                            (merge-state (list btor932 btor934)))]
           [btor936 (signal (extract 12 12 (signal-value btor935)) (signal-state btor935))]
           [btor937 (signal (bvand (signal-value btor199) (signal-value btor936))
                            (merge-state (list btor199 btor936)))]
           [btor938 (bv->signal (zero-extend (signal-value btor937) (bitvector 13)) btor937)]
           [btor939 (signal (bvadd (signal-value btor849) (signal-value btor938))
                            (merge-state (list btor849 btor938)))]
           [btor940 (signal (extract 12 12 (signal-value btor939)) (signal-state btor939))]
           [btor941 (signal (bvand (signal-value btor731) (signal-value btor940))
                            (merge-state (list btor731 btor940)))]
           [btor942 (bv->signal (zero-extend (signal-value btor941) (bitvector 13)) btor941)]
           [btor943 (signal (bvadd (signal-value btor841) (signal-value btor942))
                            (merge-state (list btor841 btor942)))]
           [btor944 (signal (extract 12 12 (signal-value btor943)) (signal-state btor943))]
           [btor945 (signal (bvand (signal-value btor199) (signal-value btor944))
                            (merge-state (list btor199 btor944)))]
           [btor946 (bv->signal (zero-extend (signal-value btor945) (bitvector 14)) btor945)]
           [btor947 (signal (bvadd (signal-value btor833) (signal-value btor946))
                            (merge-state (list btor833 btor946)))]
           [btor948 (signal (extract 12 12 (signal-value btor947)) (signal-state btor947))]
           [btor949 (signal (bvxor (signal-value btor184) (signal-value btor948))
                            (merge-state (list btor184 btor948)))]
           [btor950 (signal (bvxor (signal-value btor184) (signal-value btor949))
                            (merge-state (list btor184 btor949)))]
           [btor951 (signal (extract 0 0 (signal-value btor76)) (signal-state btor76))]
           [btor952 (if (bitvector->bool (signal-value btor951)) btor897 btor950)]
           [btor954 (signal (bvxor (signal-value btor842) (signal-value btor936))
                            (merge-state (list btor842 btor936)))]
           [btor955 (signal (bvxor (signal-value btor954) (signal-value btor788))
                            (merge-state (list btor954 btor788)))]
           [btor956 (signal (bvxor (signal-value btor184) (signal-value btor955))
                            (merge-state (list btor184 btor955)))]
           [btor957 (signal (extract 3 0 (signal-value btor417)) (signal-state btor417))]
           [btor958 (bv->signal (zero-extend (signal-value btor458) (bitvector 4)) btor458)]
           [btor959 (signal (bool->bitvector (bveq (signal-value btor957) (signal-value btor958)))
                            (merge-state (list btor957 btor958)))]
           [btor960 (signal (extract 3 2 (signal-value btor181)) (signal-state btor181))]
           [btor961 (signal (apply bvor (bitvector->bits (signal-value btor960)))
                            (signal-state btor960))]
           [btor962 (signal (bvor (signal-value btor959) (signal-value btor961))
                            (merge-state (list btor959 btor961)))]
           [btor963 (if (bitvector->bool (signal-value btor962)) btor106 btor956)]
           [btor964 (bv->signal (zero-extend (signal-value btor97) (bitvector 2)) btor97)]
           [btor965 (signal (bool->bitvector (bveq (signal-value btor197) (signal-value btor964)))
                            (merge-state (list btor197 btor964)))]
           [btor966 (if (bitvector->bool (signal-value btor965)) btor963 btor106)]
           [btor967 (signal (bvxor (signal-value btor834) (signal-value btor940))
                            (merge-state (list btor834 btor940)))]
           [btor968 (signal (bvxor (signal-value btor967) (signal-value btor790))
                            (merge-state (list btor967 btor790)))]
           [btor969 (signal (bvxor (signal-value btor184) (signal-value btor968))
                            (merge-state (list btor184 btor968)))]
           [btor970 (if (bitvector->bool (signal-value btor962)) btor106 btor969)]
           [btor971 (signal (apply bvor (bitvector->bits (signal-value btor197)))
                            (signal-state btor197))]
           [btor972 (if (bitvector->bool (signal-value btor971)) btor970 btor106)]
           [btor973 (signal (bvxor (signal-value btor822) (signal-value btor944))
                            (merge-state (list btor822 btor944)))]
           [btor974 (signal (bvxor (signal-value btor973) (signal-value btor792))
                            (merge-state (list btor973 btor792)))]
           [btor975 (signal (bvxor (signal-value btor184) (signal-value btor974))
                            (merge-state (list btor184 btor974)))]
           [btor976 (if (bitvector->bool (signal-value btor962)) btor106 btor975)]
           [btor977 (if (bitvector->bool (signal-value btor965)) btor976 btor106)]
           [btor978 (signal (concat (signal-value btor972) (signal-value btor966))
                            (merge-state (list btor972 btor966)))]
           [btor979 (signal (concat (signal-value btor977) (signal-value btor978))
                            (merge-state (list btor977 btor978)))]
           [btor980 (signal (concat (signal-value btor949) (signal-value btor979))
                            (merge-state (list btor949 btor979)))]
           [btor981 (if (bitvector->bool (signal-value btor951)) btor895 btor980)]
           [btor983 (signal (extract 13 13 (signal-value btor947)) (signal-state btor947))]
           [btor984
            (let* ([state-value
                    (cond
                      [(hash-has-key? merged-input-state-hash 'state984)
                       (bv->signal (hash-ref merged-input-state-hash 'state984))]
                      [(hash-has-key? init-hash 'state984)
                       (bv->signal (hash-ref init-hash 'state984))]
                      [else
                       (log-warning
                        "state ~a with no initial value, init to 0, this may not be correct in the long term"
                        'state984)
                       (bv->signal (bv 0 (bitvector 1)))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              (when (not (bv? (signal-value state-value)))
                (error "Signal value invalid"))
              state-value)]
           [btor985
            (let* ([state-value
                    (cond
                      [(hash-has-key? merged-input-state-hash 'state985)
                       (bv->signal (hash-ref merged-input-state-hash 'state985))]
                      [(hash-has-key? init-hash 'state985)
                       (bv->signal (hash-ref init-hash 'state985))]
                      [else
                       (log-warning
                        "state ~a with no initial value, init to 0, this may not be correct in the long term"
                        'state985)
                       (bv->signal (bv 0 (bitvector 1)))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              (when (not (bv? (signal-value state-value)))
                (error "Signal value invalid"))
              state-value)]
           [btor986
            (let* ([state-value
                    (cond
                      [(hash-has-key? merged-input-state-hash 'state986)
                       (bv->signal (hash-ref merged-input-state-hash 'state986))]
                      [(hash-has-key? init-hash 'state986)
                       (bv->signal (hash-ref init-hash 'state986))]
                      [else
                       (log-warning
                        "state ~a with no initial value, init to 0, this may not be correct in the long term"
                        'state986)
                       (bv->signal (bv 0 (bitvector 1)))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              (when (not (bv? (signal-value state-value)))
                (error "Signal value invalid"))
              state-value)]
           [btor988 (signal (concat (signal-value btor100) (signal-value btor986))
                            (merge-state (list btor100 btor986)))]
           [btor989 (signal (bool->bitvector (bveq (signal-value btor988) (signal-value btor103)))
                            (merge-state (list btor988 btor103)))]
           [btor990 (if (bitvector->bool (signal-value btor989)) btor985 btor984)]
           [btor991 (if (bitvector->bool (signal-value btor951)) btor990 btor983)]
           [btor993 (bv->signal (bv 17 (bitvector 5)))]
           [btor994 (signal (bool->bitvector (bveq (signal-value btor89) (signal-value btor993)))
                            (merge-state (list btor89 btor993)))]
           [btor995 (if (bitvector->bool (signal-value btor994)) btor97 btor106)]
           [btor996 (bv->signal (bv 9 (bitvector 4)))]
           [btor997 (bv->signal (zero-extend (signal-value btor996) (bitvector 5)) btor996)]
           [btor998 (signal (bool->bitvector (bveq (signal-value btor89) (signal-value btor997)))
                            (merge-state (list btor89 btor997)))]
           [btor999 (if (bitvector->bool (signal-value btor998)) btor106 btor995)]
           [btor1000 (if (bitvector->bool (signal-value btor999)) btor476 btor73)]
           [btor1001 (signal (extract 1 1 (signal-value btor181)) (signal-state btor181))]
           [btor1002 (signal (extract 1 1 (signal-value btor181)) (signal-state btor181))]
           [btor1003 (signal (concat (signal-value btor1002) (signal-value btor1001))
                             (merge-state (list btor1002 btor1001)))]
           [btor1004 (signal (extract 1 1 (signal-value btor181)) (signal-state btor181))]
           [btor1005 (signal (concat (signal-value btor1004) (signal-value btor1003))
                             (merge-state (list btor1004 btor1003)))]
           [btor1006 (signal (extract 1 1 (signal-value btor181)) (signal-state btor181))]
           [btor1007 (signal (concat (signal-value btor1006) (signal-value btor1005))
                             (merge-state (list btor1006 btor1005)))]
           [btor1008 (signal (extract 1 1 (signal-value btor181)) (signal-state btor181))]
           [btor1009 (signal (concat (signal-value btor1008) (signal-value btor1007))
                             (merge-state (list btor1008 btor1007)))]
           [btor1010 (signal (extract 1 1 (signal-value btor181)) (signal-state btor181))]
           [btor1011 (signal (concat (signal-value btor1010) (signal-value btor1009))
                             (merge-state (list btor1010 btor1009)))]
           [btor1012 (signal (extract 1 1 (signal-value btor181)) (signal-state btor181))]
           [btor1013 (signal (concat (signal-value btor1012) (signal-value btor1011))
                             (merge-state (list btor1012 btor1011)))]
           [btor1014 (signal (extract 1 1 (signal-value btor181)) (signal-state btor181))]
           [btor1015 (signal (concat (signal-value btor1014) (signal-value btor1013))
                             (merge-state (list btor1014 btor1013)))]
           [btor1016 (signal (extract 1 1 (signal-value btor181)) (signal-state btor181))]
           [btor1017 (signal (concat (signal-value btor1016) (signal-value btor1015))
                             (merge-state (list btor1016 btor1015)))]
           [btor1018 (signal (extract 1 1 (signal-value btor181)) (signal-state btor181))]
           [btor1019 (signal (concat (signal-value btor1018) (signal-value btor1017))
                             (merge-state (list btor1018 btor1017)))]
           [btor1020 (signal (extract 1 1 (signal-value btor181)) (signal-state btor181))]
           [btor1021 (signal (concat (signal-value btor1020) (signal-value btor1019))
                             (merge-state (list btor1020 btor1019)))]
           [btor1022 (signal (extract 1 1 (signal-value btor181)) (signal-state btor181))]
           [btor1023 (signal (concat (signal-value btor1022) (signal-value btor1021))
                             (merge-state (list btor1022 btor1021)))]
           [btor1024 (signal (extract 1 1 (signal-value btor181)) (signal-state btor181))]
           [btor1025 (signal (concat (signal-value btor1024) (signal-value btor1023))
                             (merge-state (list btor1024 btor1023)))]
           [btor1026 (signal (extract 1 1 (signal-value btor181)) (signal-state btor181))]
           [btor1027 (signal (concat (signal-value btor1026) (signal-value btor1025))
                             (merge-state (list btor1026 btor1025)))]
           [btor1028 (signal (extract 1 1 (signal-value btor181)) (signal-state btor181))]
           [btor1029 (signal (concat (signal-value btor1028) (signal-value btor1027))
                             (merge-state (list btor1028 btor1027)))]
           [btor1030 (signal (extract 1 1 (signal-value btor181)) (signal-state btor181))]
           [btor1031 (signal (concat (signal-value btor1030) (signal-value btor1029))
                             (merge-state (list btor1030 btor1029)))]
           [btor1032 (signal (extract 1 1 (signal-value btor181)) (signal-state btor181))]
           [btor1033 (signal (concat (signal-value btor1032) (signal-value btor1031))
                             (merge-state (list btor1032 btor1031)))]
           [btor1034 (signal (extract 1 1 (signal-value btor181)) (signal-state btor181))]
           [btor1035 (signal (concat (signal-value btor1034) (signal-value btor1033))
                             (merge-state (list btor1034 btor1033)))]
           [btor1036 (signal (extract 1 1 (signal-value btor181)) (signal-state btor181))]
           [btor1037 (signal (concat (signal-value btor1036) (signal-value btor1035))
                             (merge-state (list btor1036 btor1035)))]
           [btor1038 (signal (extract 1 1 (signal-value btor181)) (signal-state btor181))]
           [btor1039 (signal (concat (signal-value btor1038) (signal-value btor1037))
                             (merge-state (list btor1038 btor1037)))]
           [btor1040 (signal (extract 1 1 (signal-value btor181)) (signal-state btor181))]
           [btor1041 (signal (concat (signal-value btor1040) (signal-value btor1039))
                             (merge-state (list btor1040 btor1039)))]
           [btor1042 (signal (extract 1 1 (signal-value btor181)) (signal-state btor181))]
           [btor1043 (signal (concat (signal-value btor1042) (signal-value btor1041))
                             (merge-state (list btor1042 btor1041)))]
           [btor1044 (signal (extract 1 1 (signal-value btor181)) (signal-state btor181))]
           [btor1045 (signal (concat (signal-value btor1044) (signal-value btor1043))
                             (merge-state (list btor1044 btor1043)))]
           [btor1046 (signal (extract 1 1 (signal-value btor181)) (signal-state btor181))]
           [btor1047 (signal (concat (signal-value btor1046) (signal-value btor1045))
                             (merge-state (list btor1046 btor1045)))]
           [btor1048 (signal (extract 1 1 (signal-value btor181)) (signal-state btor181))]
           [btor1049 (signal (concat (signal-value btor1048) (signal-value btor1047))
                             (merge-state (list btor1048 btor1047)))]
           [btor1050 (signal (extract 1 1 (signal-value btor181)) (signal-state btor181))]
           [btor1051 (signal (concat (signal-value btor1050) (signal-value btor1049))
                             (merge-state (list btor1050 btor1049)))]
           [btor1052 (signal (extract 1 1 (signal-value btor181)) (signal-state btor181))]
           [btor1053 (signal (concat (signal-value btor1052) (signal-value btor1051))
                             (merge-state (list btor1052 btor1051)))]
           [btor1054 (signal (extract 1 1 (signal-value btor181)) (signal-state btor181))]
           [btor1055 (signal (concat (signal-value btor1054) (signal-value btor1053))
                             (merge-state (list btor1054 btor1053)))]
           [btor1056 (signal (extract 1 1 (signal-value btor181)) (signal-state btor181))]
           [btor1057 (signal (concat (signal-value btor1056) (signal-value btor1055))
                             (merge-state (list btor1056 btor1055)))]
           [btor1058 (signal (extract 1 1 (signal-value btor181)) (signal-state btor181))]
           [btor1059 (signal (concat (signal-value btor1058) (signal-value btor1057))
                             (merge-state (list btor1058 btor1057)))]
           [btor1060 (signal (extract 1 1 (signal-value btor181)) (signal-state btor181))]
           [btor1061 (signal (concat (signal-value btor1060) (signal-value btor1059))
                             (merge-state (list btor1060 btor1059)))]
           [btor1062 (signal (extract 1 1 (signal-value btor181)) (signal-state btor181))]
           [btor1063 (signal (concat (signal-value btor1062) (signal-value btor1061))
                             (merge-state (list btor1062 btor1061)))]
           [btor1064 (signal (extract 1 1 (signal-value btor181)) (signal-state btor181))]
           [btor1065 (signal (concat (signal-value btor1064) (signal-value btor1063))
                             (merge-state (list btor1064 btor1063)))]
           [btor1066 (signal (extract 1 1 (signal-value btor181)) (signal-state btor181))]
           [btor1067 (signal (concat (signal-value btor1066) (signal-value btor1065))
                             (merge-state (list btor1066 btor1065)))]
           [btor1068 (signal (extract 1 1 (signal-value btor181)) (signal-state btor181))]
           [btor1069 (signal (concat (signal-value btor1068) (signal-value btor1067))
                             (merge-state (list btor1068 btor1067)))]
           [btor1070 (signal (extract 1 1 (signal-value btor181)) (signal-state btor181))]
           [btor1071 (signal (concat (signal-value btor1070) (signal-value btor1069))
                             (merge-state (list btor1070 btor1069)))]
           [btor1072 (signal (extract 1 1 (signal-value btor181)) (signal-state btor181))]
           [btor1073 (signal (concat (signal-value btor1072) (signal-value btor1071))
                             (merge-state (list btor1072 btor1071)))]
           [btor1074 (signal (extract 1 1 (signal-value btor181)) (signal-state btor181))]
           [btor1075 (signal (concat (signal-value btor1074) (signal-value btor1073))
                             (merge-state (list btor1074 btor1073)))]
           [btor1076 (signal (extract 1 1 (signal-value btor181)) (signal-state btor181))]
           [btor1077 (signal (concat (signal-value btor1076) (signal-value btor1075))
                             (merge-state (list btor1076 btor1075)))]
           [btor1078 (signal (extract 1 1 (signal-value btor181)) (signal-state btor181))]
           [btor1079 (signal (concat (signal-value btor1078) (signal-value btor1077))
                             (merge-state (list btor1078 btor1077)))]
           [btor1080 (signal (extract 1 1 (signal-value btor181)) (signal-state btor181))]
           [btor1081 (signal (concat (signal-value btor1080) (signal-value btor1079))
                             (merge-state (list btor1080 btor1079)))]
           [btor1082 (signal (extract 1 1 (signal-value btor181)) (signal-state btor181))]
           [btor1083 (signal (concat (signal-value btor1082) (signal-value btor1081))
                             (merge-state (list btor1082 btor1081)))]
           [btor1084 (signal (extract 1 1 (signal-value btor181)) (signal-state btor181))]
           [btor1085 (signal (concat (signal-value btor1084) (signal-value btor1083))
                             (merge-state (list btor1084 btor1083)))]
           [btor1086 (signal (extract 1 1 (signal-value btor181)) (signal-state btor181))]
           [btor1087 (signal (concat (signal-value btor1086) (signal-value btor1085))
                             (merge-state (list btor1086 btor1085)))]
           [btor1088 (signal (extract 1 1 (signal-value btor181)) (signal-state btor181))]
           [btor1089 (signal (concat (signal-value btor1088) (signal-value btor1087))
                             (merge-state (list btor1088 btor1087)))]
           [btor1090 (signal (extract 1 1 (signal-value btor181)) (signal-state btor181))]
           [btor1091 (signal (concat (signal-value btor1090) (signal-value btor1089))
                             (merge-state (list btor1090 btor1089)))]
           [btor1092 (signal (extract 1 1 (signal-value btor181)) (signal-state btor181))]
           [btor1093 (signal (concat (signal-value btor1092) (signal-value btor1091))
                             (merge-state (list btor1092 btor1091)))]
           [btor1094 (signal (extract 1 1 (signal-value btor181)) (signal-state btor181))]
           [btor1095 (signal (concat (signal-value btor1094) (signal-value btor1093))
                             (merge-state (list btor1094 btor1093)))]
           [btor1096 (signal (extract 11 0 (signal-value btor935)) (signal-state btor935))]
           [btor1097 (signal (extract 11 0 (signal-value btor939)) (signal-state btor939))]
           [btor1098 (signal (concat (signal-value btor1097) (signal-value btor1096))
                             (merge-state (list btor1097 btor1096)))]
           [btor1099 (signal (extract 11 0 (signal-value btor943)) (signal-state btor943))]
           [btor1100 (signal (concat (signal-value btor1099) (signal-value btor1098))
                             (merge-state (list btor1099 btor1098)))]
           [btor1101 (signal (extract 11 0 (signal-value btor947)) (signal-state btor947))]
           [btor1102 (signal (concat (signal-value btor1101) (signal-value btor1100))
                             (merge-state (list btor1101 btor1100)))]
           [btor1103 (signal (bvxor (signal-value btor1095) (signal-value btor1102))
                             (merge-state (list btor1095 btor1102)))]
           [btor1104 (signal (bvxor (signal-value btor1000) (signal-value btor1103))
                             (merge-state (list btor1000 btor1103)))]
           [btor1105 (signal (bvnot (signal-value btor1104)) (merge-state (list btor1104)))]
           [btor1106 (signal (extract 45 0 (signal-value btor476)) (signal-state btor476))]
           [btor1107 (signal (bvnot (signal-value btor1106)) (merge-state (list btor1106)))]
           [btor1108 (signal (concat (signal-value btor1107) (signal-value btor186))
                             (merge-state (list btor1107 btor186)))]
           [btor1109 (bv->signal (bv 23 (bitvector 5)))]
           [btor1110 (signal (bool->bitvector (bveq (signal-value btor88) (signal-value btor1109)))
                             (merge-state (list btor88 btor1109)))]
           [btor1111 (if (bitvector->bool (signal-value btor1110)) btor419 btor186)]
           [btor1112 (bv->signal (bv 22 (bitvector 5)))]
           [btor1113 (signal (bool->bitvector (bveq (signal-value btor88) (signal-value btor1112)))
                             (merge-state (list btor88 btor1112)))]
           [btor1114 (if (bitvector->bool (signal-value btor1113)) btor103 btor1111)]
           [btor1115 (signal (bool->bitvector (bveq (signal-value btor88) (signal-value btor993)))
                             (merge-state (list btor88 btor993)))]
           [btor1116 (if (bitvector->bool (signal-value btor1115)) btor190 btor1114)]
           [btor1117 (bv->signal (bv 8 (bitvector 4)))]
           [btor1118 (bv->signal (zero-extend (signal-value btor1117) (bitvector 5)) btor1117)]
           [btor1119 (signal (bool->bitvector (bveq (signal-value btor88) (signal-value btor1118)))
                             (merge-state (list btor88 btor1118)))]
           [btor1120 (if (bitvector->bool (signal-value btor1119)) btor186 btor1116)]
           [btor1121 (signal (bool->bitvector (bveq (signal-value btor1120) (signal-value btor419)))
                             (merge-state (list btor1120 btor419)))]
           [btor1122 (if (bitvector->bool (signal-value btor1121)) btor1108 btor68)]
           [btor1123 (signal (extract 46 0 (signal-value btor476)) (signal-state btor476))]
           [btor1124 (signal (bvnot (signal-value btor1123)) (merge-state (list btor1123)))]
           [btor1125 (signal (concat (signal-value btor1124) (signal-value btor106))
                             (merge-state (list btor1124 btor106)))]
           [btor1126 (signal (bool->bitvector (bveq (signal-value btor1120) (signal-value btor103)))
                             (merge-state (list btor1120 btor103)))]
           [btor1127 (if (bitvector->bool (signal-value btor1126)) btor1125 btor1122)]
           [btor1128 (bv->signal (zero-extend (signal-value btor97) (bitvector 2)) btor97)]
           [btor1129 (signal (bool->bitvector (bveq (signal-value btor1120) (signal-value btor1128)))
                             (merge-state (list btor1120 btor1128)))]
           [btor1130 (if (bitvector->bool (signal-value btor1129)) btor476 btor1127)]
           [btor1131 (bv->signal (bv 21 (bitvector 5)))]
           [btor1132 (signal (bool->bitvector (bveq (signal-value btor91) (signal-value btor1131)))
                             (merge-state (list btor91 btor1131)))]
           [btor1133 (if (bitvector->bool (signal-value btor1132)) btor97 btor106)]
           [btor1134 (bv->signal (bv 11 (bitvector 4)))]
           [btor1135 (bv->signal (zero-extend (signal-value btor1134) (bitvector 5)) btor1134)]
           [btor1136 (signal (bool->bitvector (bveq (signal-value btor91) (signal-value btor1135)))
                             (merge-state (list btor91 btor1135)))]
           [btor1137 (if (bitvector->bool (signal-value btor1136)) btor106 btor1133)]
           [btor1138 (if (bitvector->bool (signal-value btor1137)) btor1130 btor754)]
           [btor1139 (signal (bvor (signal-value btor1105) (signal-value btor1138))
                             (merge-state (list btor1105 btor1138)))]
           [btor1140 (signal (apply bvand (bitvector->bits (signal-value btor1139)))
                             (signal-state btor1139))]
           [btor1141
            (let* ([state-value
                    (cond
                      [(hash-has-key? merged-input-state-hash 'state1141)
                       (bv->signal (hash-ref merged-input-state-hash 'state1141))]
                      [(hash-has-key? init-hash 'state1141)
                       (bv->signal (hash-ref init-hash 'state1141))]
                      [else
                       (log-warning
                        "state ~a with no initial value, init to 0, this may not be correct in the long term"
                        'state1141)
                       (bv->signal (bv 0 (bitvector 1)))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              (when (not (bv? (signal-value state-value)))
                (error "Signal value invalid"))
              state-value)]
           [btor1142
            (let* ([state-value
                    (cond
                      [(hash-has-key? merged-input-state-hash 'state1142)
                       (bv->signal (hash-ref merged-input-state-hash 'state1142))]
                      [(hash-has-key? init-hash 'state1142)
                       (bv->signal (hash-ref init-hash 'state1142))]
                      [else
                       (log-warning
                        "state ~a with no initial value, init to 0, this may not be correct in the long term"
                        'state1142)
                       (bv->signal (bv 0 (bitvector 1)))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              (when (not (bv? (signal-value state-value)))
                (error "Signal value invalid"))
              state-value)]
           [btor1143
            (let* ([state-value
                    (cond
                      [(hash-has-key? merged-input-state-hash 'state1143)
                       (bv->signal (hash-ref merged-input-state-hash 'state1143))]
                      [(hash-has-key? init-hash 'state1143)
                       (bv->signal (hash-ref init-hash 'state1143))]
                      [else
                       (log-warning
                        "state ~a with no initial value, init to 0, this may not be correct in the long term"
                        'state1143)
                       (bv->signal (bv 0 (bitvector 1)))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              (when (not (bv? (signal-value state-value)))
                (error "Signal value invalid"))
              state-value)]
           [btor1145 (signal (concat (signal-value btor100) (signal-value btor1143))
                             (merge-state (list btor100 btor1143)))]
           [btor1146 (signal (bool->bitvector (bveq (signal-value btor1145) (signal-value btor103)))
                             (merge-state (list btor1145 btor103)))]
           [btor1147 (if (bitvector->bool (signal-value btor1146)) btor1142 btor1141)]
           [btor1148 (if (bitvector->bool (signal-value btor951)) btor1147 btor1140)]
           [btor1149 (signal (bvnot (signal-value btor1148)) (merge-state (list btor1148)))]
           [btor1150 (signal (bvor (signal-value btor1104) (signal-value btor1138))
                             (merge-state (list btor1104 btor1138)))]
           [btor1151 (signal (apply bvand (bitvector->bits (signal-value btor1150)))
                             (signal-state btor1150))]
           [btor1152
            (let* ([state-value
                    (cond
                      [(hash-has-key? merged-input-state-hash 'state1152)
                       (bv->signal (hash-ref merged-input-state-hash 'state1152))]
                      [(hash-has-key? init-hash 'state1152)
                       (bv->signal (hash-ref init-hash 'state1152))]
                      [else
                       (log-warning
                        "state ~a with no initial value, init to 0, this may not be correct in the long term"
                        'state1152)
                       (bv->signal (bv 0 (bitvector 1)))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              (when (not (bv? (signal-value state-value)))
                (error "Signal value invalid"))
              state-value)]
           [btor1153
            (let* ([state-value
                    (cond
                      [(hash-has-key? merged-input-state-hash 'state1153)
                       (bv->signal (hash-ref merged-input-state-hash 'state1153))]
                      [(hash-has-key? init-hash 'state1153)
                       (bv->signal (hash-ref init-hash 'state1153))]
                      [else
                       (log-warning
                        "state ~a with no initial value, init to 0, this may not be correct in the long term"
                        'state1153)
                       (bv->signal (bv 0 (bitvector 1)))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              (when (not (bv? (signal-value state-value)))
                (error "Signal value invalid"))
              state-value)]
           [btor1154
            (let* ([state-value
                    (cond
                      [(hash-has-key? merged-input-state-hash 'state1154)
                       (bv->signal (hash-ref merged-input-state-hash 'state1154))]
                      [(hash-has-key? init-hash 'state1154)
                       (bv->signal (hash-ref init-hash 'state1154))]
                      [else
                       (log-warning
                        "state ~a with no initial value, init to 0, this may not be correct in the long term"
                        'state1154)
                       (bv->signal (bv 0 (bitvector 1)))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              (when (not (bv? (signal-value state-value)))
                (error "Signal value invalid"))
              state-value)]
           [btor1156 (signal (concat (signal-value btor100) (signal-value btor1154))
                             (merge-state (list btor100 btor1154)))]
           [btor1157 (signal (bool->bitvector (bveq (signal-value btor1156) (signal-value btor103)))
                             (merge-state (list btor1156 btor103)))]
           [btor1158 (if (bitvector->bool (signal-value btor1157)) btor1153 btor1152)]
           [btor1159 (if (bitvector->bool (signal-value btor951)) btor1158 btor1151)]
           [btor1160 (signal (bvnot (signal-value btor1159)) (merge-state (list btor1159)))]
           [btor1161 (signal (bvand (signal-value btor1149) (signal-value btor1160))
                             (merge-state (list btor1149 btor1160)))]
           [btor1162
            (let* ([state-value
                    (cond
                      [(hash-has-key? merged-input-state-hash 'state1162)
                       (bv->signal (hash-ref merged-input-state-hash 'state1162))]
                      [(hash-has-key? init-hash 'state1162)
                       (bv->signal (hash-ref init-hash 'state1162))]
                      [else
                       (log-warning
                        "state ~a with no initial value, init to 0, this may not be correct in the long term"
                        'state1162)
                       (bv->signal (bv 0 (bitvector 1)))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              (when (not (bv? (signal-value state-value)))
                (error "Signal value invalid"))
              state-value)]
           [btor1163
            (let* ([state-value
                    (cond
                      [(hash-has-key? merged-input-state-hash 'state1163)
                       (bv->signal (hash-ref merged-input-state-hash 'state1163))]
                      [(hash-has-key? init-hash 'state1163)
                       (bv->signal (hash-ref init-hash 'state1163))]
                      [else
                       (log-warning
                        "state ~a with no initial value, init to 0, this may not be correct in the long term"
                        'state1163)
                       (bv->signal (bv 0 (bitvector 1)))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              (when (not (bv? (signal-value state-value)))
                (error "Signal value invalid"))
              state-value)]
           [btor1164
            (let* ([state-value
                    (cond
                      [(hash-has-key? merged-input-state-hash 'state1164)
                       (bv->signal (hash-ref merged-input-state-hash 'state1164))]
                      [(hash-has-key? init-hash 'state1164)
                       (bv->signal (hash-ref init-hash 'state1164))]
                      [else
                       (log-warning
                        "state ~a with no initial value, init to 0, this may not be correct in the long term"
                        'state1164)
                       (bv->signal (bv 0 (bitvector 1)))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              (when (not (bv? (signal-value state-value)))
                (error "Signal value invalid"))
              state-value)]
           [btor1166 (signal (concat (signal-value btor100) (signal-value btor1164))
                             (merge-state (list btor100 btor1164)))]
           [btor1167 (signal (bool->bitvector (bveq (signal-value btor1166) (signal-value btor103)))
                             (merge-state (list btor1166 btor103)))]
           [btor1168 (if (bitvector->bool (signal-value btor1167)) btor1163 btor1162)]
           [btor1169 (if (bitvector->bool (signal-value btor951)) btor1168 btor1140)]
           [btor1170 (signal (bvand (signal-value btor1161) (signal-value btor1169))
                             (merge-state (list btor1161 btor1169)))]
           [btor1171 (if (bitvector->bool (signal-value btor1137)) btor1170 btor106)]
           [btor1173 (if (bitvector->bool (signal-value btor951)) btor338 btor1103)]
           [btor1178
            (let* ([state-value
                    (cond
                      [(hash-has-key? merged-input-state-hash 'state1178)
                       (bv->signal (hash-ref merged-input-state-hash 'state1178))]
                      [(hash-has-key? init-hash 'state1178)
                       (bv->signal (hash-ref init-hash 'state1178))]
                      [else
                       (log-warning
                        "state ~a with no initial value, init to 0, this may not be correct in the long term"
                        'state1178)
                       (bv->signal (bv 0 (bitvector 1)))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              (when (not (bv? (signal-value state-value)))
                (error "Signal value invalid"))
              state-value)]
           [btor1179
            (let* ([state-value
                    (cond
                      [(hash-has-key? merged-input-state-hash 'state1179)
                       (bv->signal (hash-ref merged-input-state-hash 'state1179))]
                      [(hash-has-key? init-hash 'state1179)
                       (bv->signal (hash-ref init-hash 'state1179))]
                      [else
                       (log-warning
                        "state ~a with no initial value, init to 0, this may not be correct in the long term"
                        'state1179)
                       (bv->signal (bv 0 (bitvector 1)))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              (when (not (bv? (signal-value state-value)))
                (error "Signal value invalid"))
              state-value)]
           [btor1180
            (let* ([state-value
                    (cond
                      [(hash-has-key? merged-input-state-hash 'state1180)
                       (bv->signal (hash-ref merged-input-state-hash 'state1180))]
                      [(hash-has-key? init-hash 'state1180)
                       (bv->signal (hash-ref init-hash 'state1180))]
                      [else
                       (log-warning
                        "state ~a with no initial value, init to 0, this may not be correct in the long term"
                        'state1180)
                       (bv->signal (bv 0 (bitvector 1)))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              (when (not (bv? (signal-value state-value)))
                (error "Signal value invalid"))
              state-value)]
           [btor1182 (signal (concat (signal-value btor100) (signal-value btor1180))
                             (merge-state (list btor100 btor1180)))]
           [btor1183 (signal (bool->bitvector (bveq (signal-value btor1182) (signal-value btor103)))
                             (merge-state (list btor1182 btor103)))]
           [btor1184 (if (bitvector->bool (signal-value btor1183)) btor1179 btor1178)]
           [btor1185 (if (bitvector->bool (signal-value btor951)) btor1184 btor1151)]
           [btor1186 (signal (bvand (signal-value btor1161) (signal-value btor1185))
                             (merge-state (list btor1161 btor1185)))]
           [btor1187 (if (bitvector->bool (signal-value btor1137)) btor1186 btor106)]
           [btor1189 (signal (extract 5 0 (signal-value btor778)) (signal-state btor778))]
           [btor1190 (signal (apply bvxor (bitvector->bits (signal-value btor1189)))
                             (signal-state btor1189))]
           [btor1191 (bv->signal (bv 24 (bitvector 5)))]
           [btor1192 (signal (bool->bitvector (bveq (signal-value btor93) (signal-value btor1191)))
                             (merge-state (list btor93 btor1191)))]
           [btor1193 (if (bitvector->bool (signal-value btor1192)) btor97 btor106)]
           [btor1194 (bv->signal (bv 13 (bitvector 4)))]
           [btor1195 (bv->signal (zero-extend (signal-value btor1194) (bitvector 5)) btor1194)]
           [btor1196 (signal (bool->bitvector (bveq (signal-value btor93) (signal-value btor1195)))
                             (merge-state (list btor93 btor1195)))]
           [btor1197 (if (bitvector->bool (signal-value btor1196)) btor106 btor1193)]
           [btor1198 (if (bitvector->bool (signal-value btor1197)) btor1190 btor106)]
           [btor1199 (signal (extract 11 6 (signal-value btor778)) (signal-state btor778))]
           [btor1200 (signal (apply bvxor (bitvector->bits (signal-value btor1199)))
                             (signal-state btor1199))]
           [btor1201 (if (bitvector->bool (signal-value btor1197)) btor1200 btor106)]
           [btor1202 (signal (bvxor (signal-value btor1198) (signal-value btor1201))
                             (merge-state (list btor1198 btor1201)))]
           [btor1203 (bv->signal (bv 26 (bitvector 5)))]
           [btor1204 (signal (bool->bitvector (bveq (signal-value btor94) (signal-value btor1203)))
                             (merge-state (list btor94 btor1203)))]
           [btor1205 (if (bitvector->bool (signal-value btor1204)) btor97 btor106)]
           [btor1206 (bv->signal (bv 14 (bitvector 4)))]
           [btor1207 (bv->signal (zero-extend (signal-value btor1206) (bitvector 5)) btor1206)]
           [btor1208 (signal (bool->bitvector (bveq (signal-value btor94) (signal-value btor1207)))
                             (merge-state (list btor94 btor1207)))]
           [btor1209 (if (bitvector->bool (signal-value btor1208)) btor106 btor1205)]
           [btor1210 (if (bitvector->bool (signal-value btor1209)) btor1198 btor1202)]
           [btor1211 (signal (extract 17 12 (signal-value btor778)) (signal-state btor778))]
           [btor1212 (signal (apply bvxor (bitvector->bits (signal-value btor1211)))
                             (signal-state btor1211))]
           [btor1213 (if (bitvector->bool (signal-value btor1197)) btor1212 btor106)]
           [btor1214 (signal (extract 23 18 (signal-value btor778)) (signal-state btor778))]
           [btor1215 (signal (apply bvxor (bitvector->bits (signal-value btor1214)))
                             (signal-state btor1214))]
           [btor1216 (if (bitvector->bool (signal-value btor1197)) btor1215 btor106)]
           [btor1217 (signal (bvxor (signal-value btor1213) (signal-value btor1216))
                             (merge-state (list btor1213 btor1216)))]
           [btor1218 (signal (bvxor (signal-value btor1202) (signal-value btor1217))
                             (merge-state (list btor1202 btor1217)))]
           [btor1219 (if (bitvector->bool (signal-value btor1209)) btor1201 btor1218)]
           [btor1220 (if (bitvector->bool (signal-value btor1209)) btor1213 btor1217)]
           [btor1221 (signal (extract 29 24 (signal-value btor778)) (signal-state btor778))]
           [btor1222 (signal (apply bvxor (bitvector->bits (signal-value btor1221)))
                             (signal-state btor1221))]
           [btor1223 (if (bitvector->bool (signal-value btor1197)) btor1222 btor106)]
           [btor1224 (signal (extract 35 30 (signal-value btor778)) (signal-state btor778))]
           [btor1225 (signal (apply bvxor (bitvector->bits (signal-value btor1224)))
                             (signal-state btor1224))]
           [btor1226 (if (bitvector->bool (signal-value btor1197)) btor1225 btor106)]
           [btor1227 (signal (bvxor (signal-value btor1223) (signal-value btor1226))
                             (merge-state (list btor1223 btor1226)))]
           [btor1228 (signal (extract 41 36 (signal-value btor778)) (signal-state btor778))]
           [btor1229 (signal (apply bvxor (bitvector->bits (signal-value btor1228)))
                             (signal-state btor1228))]
           [btor1230 (if (bitvector->bool (signal-value btor1197)) btor1229 btor106)]
           [btor1231 (signal (extract 47 42 (signal-value btor778)) (signal-state btor778))]
           [btor1232 (signal (apply bvxor (bitvector->bits (signal-value btor1231)))
                             (signal-state btor1231))]
           [btor1233 (if (bitvector->bool (signal-value btor1197)) btor1232 btor106)]
           [btor1234 (signal (bvxor (signal-value btor1230) (signal-value btor1233))
                             (merge-state (list btor1230 btor1233)))]
           [btor1235 (signal (bvxor (signal-value btor1227) (signal-value btor1234))
                             (merge-state (list btor1227 btor1234)))]
           [btor1236 (signal (bvxor (signal-value btor1218) (signal-value btor1235))
                             (merge-state (list btor1218 btor1235)))]
           [btor1237 (if (bitvector->bool (signal-value btor1209)) btor1216 btor1236)]
           [btor1238 (if (bitvector->bool (signal-value btor1209)) btor1223 btor1227)]
           [btor1239 (if (bitvector->bool (signal-value btor1209)) btor1226 btor1235)]
           [btor1240 (if (bitvector->bool (signal-value btor1209)) btor1230 btor1234)]
           [btor1241 (signal (concat (signal-value btor1219) (signal-value btor1210))
                             (merge-state (list btor1219 btor1210)))]
           [btor1242 (signal (concat (signal-value btor1220) (signal-value btor1241))
                             (merge-state (list btor1220 btor1241)))]
           [btor1243 (signal (concat (signal-value btor1237) (signal-value btor1242))
                             (merge-state (list btor1237 btor1242)))]
           [btor1244 (signal (concat (signal-value btor1238) (signal-value btor1243))
                             (merge-state (list btor1238 btor1243)))]
           [btor1245 (signal (concat (signal-value btor1239) (signal-value btor1244))
                             (merge-state (list btor1239 btor1244)))]
           [btor1246 (signal (concat (signal-value btor1240) (signal-value btor1245))
                             (merge-state (list btor1240 btor1245)))]
           [btor1247 (signal (concat (signal-value btor1233) (signal-value btor1246))
                             (merge-state (list btor1233 btor1246)))]
           [btor1248
            (let* ([state-value
                    (cond
                      [(hash-has-key? merged-input-state-hash 'state1248)
                       (bv->signal (hash-ref merged-input-state-hash 'state1248))]
                      [(hash-has-key? init-hash 'state1248)
                       (bv->signal (hash-ref init-hash 'state1248))]
                      [else
                       (log-warning
                        "state ~a with no initial value, init to 0, this may not be correct in the long term"
                        'state1248)
                       (bv->signal (bv 0 (bitvector 8)))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              (when (not (bv? (signal-value state-value)))
                (error "Signal value invalid"))
              state-value)]
           [btor1249
            (let* ([state-value
                    (cond
                      [(hash-has-key? merged-input-state-hash 'state1249)
                       (bv->signal (hash-ref merged-input-state-hash 'state1249))]
                      [(hash-has-key? init-hash 'state1249)
                       (bv->signal (hash-ref init-hash 'state1249))]
                      [else
                       (log-warning
                        "state ~a with no initial value, init to 0, this may not be correct in the long term"
                        'state1249)
                       (bv->signal (bv 0 (bitvector 8)))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              (when (not (bv? (signal-value state-value)))
                (error "Signal value invalid"))
              state-value)]
           [btor1250
            (let* ([state-value
                    (cond
                      [(hash-has-key? merged-input-state-hash 'state1250)
                       (bv->signal (hash-ref merged-input-state-hash 'state1250))]
                      [(hash-has-key? init-hash 'state1250)
                       (bv->signal (hash-ref init-hash 'state1250))]
                      [else
                       (log-warning
                        "state ~a with no initial value, init to 0, this may not be correct in the long term"
                        'state1250)
                       (bv->signal (bv 0 (bitvector 1)))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              (when (not (bv? (signal-value state-value)))
                (error "Signal value invalid"))
              state-value)]
           [btor1252 (signal (concat (signal-value btor100) (signal-value btor1250))
                             (merge-state (list btor100 btor1250)))]
           [btor1253 (signal (bool->bitvector (bveq (signal-value btor1252) (signal-value btor103)))
                             (merge-state (list btor1252 btor103)))]
           [btor1254 (if (bitvector->bool (signal-value btor1253)) btor1249 btor1248)]
           [btor1255 (if (bitvector->bool (signal-value btor951)) btor1254 btor1247)]
           [btor1257 (bv->signal (zero-extend (signal-value btor105) (bitvector 30)) btor105)]
           [btor1258 (bv->signal (zero-extend (signal-value btor540) (bitvector 27)) btor540)]
           [btor1259 (bv->signal (zero-extend (signal-value btor122) (bitvector 30)) btor122)]
           [btor1260 (bv->signal (zero-extend (signal-value btor126) (bitvector 2)) btor126)]
           [btor1261 (bv->signal (zero-extend (signal-value btor4) (bitvector 32)) btor4)]
           [btor1262 (bv->signal (zero-extend (signal-value btor5) (bitvector 30)) btor5)]
           [btor1263 (bv->signal (zero-extend (signal-value btor617) (bitvector 1)) btor617)]
           [btor1264 (bv->signal (zero-extend (signal-value btor618) (bitvector 1)) btor618)]
           [btor1265 (bv->signal (zero-extend (signal-value btor6) (bitvector 32)) btor6)]
           [btor1266 (bv->signal (zero-extend (signal-value btor619) (bitvector 27)) btor619)]
           [btor1267 (bv->signal (zero-extend (signal-value btor616) (bitvector 27)) btor616)]
           [btor1268 (bv->signal (zero-extend (signal-value btor609) (bitvector 27)) btor609)]
           [btor1269 (bv->signal (zero-extend (signal-value btor184) (bitvector 1)) btor184)]
           [btor1270 (bv->signal (zero-extend (signal-value btor888) (bitvector 1)) btor888)]
           [btor1271 (bv->signal (zero-extend (signal-value btor180) (bitvector 1)) btor180)]
           [btor1272 (bv->signal (zero-extend (signal-value btor9) (bitvector 32)) btor9)]
           [btor1273 (bv->signal (zero-extend (signal-value btor181) (bitvector 4)) btor181)]
           [btor1274 (bv->signal (zero-extend (signal-value btor172) (bitvector 4)) btor172)]
           [btor1275 (bv->signal (zero-extend (signal-value btor179) (bitvector 4)) btor179)]
           [btor1276 (bv->signal (zero-extend (signal-value btor1103) (bitvector 48)) btor1103)]
           [btor1277 (bv->signal (zero-extend (signal-value btor338) (bitvector 48)) btor338)]
           [btor1278 (bv->signal (zero-extend (signal-value btor864) (bitvector 1)) btor864)]
           [btor1279 (bv->signal (zero-extend (signal-value btor556) (bitvector 1)) btor556)]
           [btor1280 (bv->signal (zero-extend (signal-value btor553) (bitvector 16)) btor553)]
           [btor1281 (bv->signal (zero-extend (signal-value btor123) (bitvector 2)) btor123)]
           [btor1282 (bv->signal (zero-extend (signal-value btor12) (bitvector 32)) btor12)]
           [btor1283 (bv->signal (zero-extend (signal-value btor458) (bitvector 5)) btor458)]
           [btor1284 (signal (bool->bitvector (bveq (signal-value btor13) (signal-value btor1283)))
                             (merge-state (list btor13 btor1283)))]
           [btor1285 (if (bitvector->bool (signal-value btor1284)) btor103 btor186)]
           [btor1286 (bv->signal (zero-extend (signal-value btor461) (bitvector 5)) btor461)]
           [btor1287 (signal (bool->bitvector (bveq (signal-value btor13) (signal-value btor1286)))
                             (merge-state (list btor13 btor1286)))]
           [btor1288 (if (bitvector->bool (signal-value btor1287)) btor190 btor1285)]
           [btor1289 (bv->signal (zero-extend (signal-value btor419) (bitvector 5)) btor419)]
           [btor1290 (signal (bool->bitvector (bveq (signal-value btor13) (signal-value btor1289)))
                             (merge-state (list btor13 btor1289)))]
           [btor1291 (if (bitvector->bool (signal-value btor1290)) btor186 btor1288)]
           [btor1292 (bv->signal (zero-extend (signal-value btor1291) (bitvector 2)) btor1291)]
           [btor1293 (bitvector 120)]
           [btor1294 (bitvector 115)]
           [btor1295 (bv->signal (bv 0 (bitvector 115)))]
           [btor1296 (signal (concat (signal-value btor1295) (signal-value btor13))
                             (merge-state (list btor1295 btor13)))]
           [btor1297 (bv->signal (zero-extend (signal-value btor1296) (bitvector 120)) btor1296)]
           [btor1298 (bv->signal (bv 16 (bitvector 5)))]
           [btor1299 (signal (bool->bitvector (bveq (signal-value btor14) (signal-value btor1298)))
                             (merge-state (list btor14 btor1298)))]
           [btor1300 (if (bitvector->bool (signal-value btor1299)) btor97 btor106)]
           [btor1301 (bv->signal (zero-extend (signal-value btor877) (bitvector 5)) btor877)]
           [btor1302 (signal (bool->bitvector (bveq (signal-value btor14) (signal-value btor1301)))
                             (merge-state (list btor14 btor1301)))]
           [btor1303 (if (bitvector->bool (signal-value btor1302)) btor106 btor1300)]
           [btor1304 (bv->signal (zero-extend (signal-value btor1303) (bitvector 1)) btor1303)]
           [btor1305 (bv->signal (bv 0 (bitvector 35)))]
           [btor1306 (signal (concat (signal-value btor1305) (signal-value btor14))
                             (merge-state (list btor1305 btor14)))]
           [btor1307 (bv->signal (zero-extend (signal-value btor1306) (bitvector 40)) btor1306)]
           [btor1308 (bv->signal (zero-extend (signal-value btor125) (bitvector 30)) btor125)]
           [btor1309 (bv->signal (zero-extend (signal-value btor114) (bitvector 1)) btor114)]
           [btor1310 (bitvector 56)]
           [btor1311 (bitvector 51)]
           [btor1312 (bv->signal (bv 0 (bitvector 51)))]
           [btor1313 (signal (concat (signal-value btor1312) (signal-value btor15))
                             (merge-state (list btor1312 btor15)))]
           [btor1314 (bv->signal (zero-extend (signal-value btor1313) (bitvector 56)) btor1313)]
           [btor1315 (bv->signal (zero-extend (signal-value btor2) (bitvector 30)) btor2)]
           [btor1316 (bv->signal (zero-extend (signal-value btor136) (bitvector 18)) btor136)]
           [btor1317 (bv->signal (zero-extend (signal-value btor586) (bitvector 18)) btor586)]
           [btor1318 (bv->signal (zero-extend (signal-value btor153) (bitvector 18)) btor153)]
           [btor1319 (bv->signal (zero-extend (signal-value btor150) (bitvector 18)) btor150)]
           [btor1320 (bv->signal (zero-extend (signal-value btor154) (bitvector 2)) btor154)]
           [btor1321 (bv->signal (zero-extend (signal-value btor18) (bitvector 32)) btor18)]
           [btor1322 (bv->signal (zero-extend (signal-value btor19) (bitvector 18)) btor19)]
           [btor1323 (bv->signal (zero-extend (signal-value btor865) (bitvector 1)) btor865)]
           [btor1324 (bv->signal (zero-extend (signal-value btor563) (bitvector 1)) btor563)]
           [btor1325 (signal (concat (signal-value btor552) (signal-value btor20))
                             (merge-state (list btor552 btor20)))]
           [btor1326 (bv->signal (zero-extend (signal-value btor1325) (bitvector 16)) btor1325)]
           [btor1327 (bv->signal (zero-extend (signal-value btor151) (bitvector 2)) btor151)]
           [btor1328 (bv->signal (zero-extend (signal-value btor21) (bitvector 32)) btor21)]
           [btor1329 (bv->signal (zero-extend (signal-value btor153) (bitvector 18)) btor153)]
           [btor1330 (bv->signal (zero-extend (signal-value btor142) (bitvector 1)) btor142)]
           [btor1331 (signal (concat (signal-value btor1312) (signal-value btor22))
                             (merge-state (list btor1312 btor22)))]
           [btor1332 (bv->signal (zero-extend (signal-value btor1331) (bitvector 56)) btor1331)]
           [btor1333 (bv->signal (zero-extend (signal-value btor17) (bitvector 18)) btor17)]
           [btor1334 (bv->signal (zero-extend (signal-value btor26) (bitvector 1)) btor26)]
           [btor1335 (bv->signal (zero-extend (signal-value btor921) (bitvector 1)) btor921)]
           [btor1336 (bv->signal (zero-extend (signal-value btor28) (bitvector 32)) btor28)]
           [btor1337 (bv->signal (zero-extend (signal-value btor860) (bitvector 1)) btor860)]
           [btor1338 (bv->signal (zero-extend (signal-value btor31) (bitvector 32)) btor31)]
           [btor1339 (bv->signal (zero-extend (signal-value btor30) (bitvector 3)) btor30)]
           [btor1340 (bv->signal (zero-extend (signal-value btor861) (bitvector 3)) btor861)]
           [btor1341 (bv->signal (zero-extend (signal-value btor859) (bitvector 3)) btor859)]
           [btor1342 (bv->signal (zero-extend (signal-value btor913) (bitvector 1)) btor913)]
           [btor1343 (bv->signal (zero-extend (signal-value btor922) (bitvector 1)) btor922)]
           [btor1344 (bv->signal (zero-extend (signal-value btor920) (bitvector 1)) btor920)]
           [btor1345 (bv->signal (zero-extend (signal-value btor897) (bitvector 1)) btor897)]
           [btor1346 (bv->signal (zero-extend (signal-value btor32) (bitvector 1)) btor32)]
           [btor1347 (bv->signal (zero-extend (signal-value btor33) (bitvector 1)) btor33)]
           [btor1348 (bv->signal (zero-extend (signal-value btor34) (bitvector 1)) btor34)]
           [btor1349 (bv->signal (zero-extend (signal-value btor35) (bitvector 1)) btor35)]
           [btor1350 (bv->signal (zero-extend (signal-value btor36) (bitvector 1)) btor36)]
           [btor1351 (bv->signal (zero-extend (signal-value btor37) (bitvector 1)) btor37)]
           [btor1352 (bv->signal (zero-extend (signal-value btor39) (bitvector 1)) btor39)]
           [btor1353 (bv->signal (zero-extend (signal-value btor40) (bitvector 1)) btor40)]
           [btor1354 (bv->signal (zero-extend (signal-value btor38) (bitvector 1)) btor38)]
           [btor1355 (bv->signal (zero-extend (signal-value btor41) (bitvector 1)) btor41)]
           [btor1356 (bv->signal (zero-extend (signal-value btor42) (bitvector 1)) btor42)]
           [btor1357 (bv->signal (zero-extend (signal-value btor43) (bitvector 1)) btor43)]
           [btor1358 (bv->signal (zero-extend (signal-value btor44) (bitvector 1)) btor44)]
           [btor1359 (bv->signal (zero-extend (signal-value btor100) (bitvector 1)) btor100)]
           [btor1360 (bv->signal (zero-extend (signal-value btor980) (bitvector 4)) btor980)]
           [btor1361 (bv->signal (zero-extend (signal-value btor895) (bitvector 4)) btor895)]
           [btor1362 (bv->signal (zero-extend (signal-value btor475) (bitvector 1)) btor475)]
           [btor1363 (bv->signal (zero-extend (signal-value btor46) (bitvector 32)) btor46)]
           [btor1364 (bv->signal (zero-extend (signal-value btor476) (bitvector 48)) btor476)]
           [btor1365 (bv->signal (zero-extend (signal-value btor24) (bitvector 48)) btor24)]
           [btor1366 (bv->signal (zero-extend (signal-value btor474) (bitvector 48)) btor474)]
           [btor1367 (bv->signal (zero-extend (signal-value btor548) (bitvector 1)) btor548)]
           [btor1368 (bv->signal (zero-extend (signal-value btor578) (bitvector 1)) btor578)]
           [btor1369 (bv->signal (zero-extend (signal-value btor49) (bitvector 32)) btor49)]
           [btor1370 (bv->signal (zero-extend (signal-value btor579) (bitvector 27)) btor579)]
           [btor1371 (bv->signal (zero-extend (signal-value btor581) (bitvector 27)) btor581)]
           [btor1372 (bv->signal (zero-extend (signal-value btor547) (bitvector 27)) btor547)]
           [btor1373 (bv->signal (zero-extend (signal-value btor48) (bitvector 27)) btor48)]
           [btor1374 (bv->signal (zero-extend (signal-value btor524) (bitvector 1)) btor524)]
           [btor1375 (bv->signal (zero-extend (signal-value btor51) (bitvector 32)) btor51)]
           [btor1376 (bv->signal (zero-extend (signal-value btor516) (bitvector 5)) btor516)]
           [btor1377 (bv->signal (zero-extend (signal-value btor525) (bitvector 5)) btor525)]
           [btor1378 (bv->signal (zero-extend (signal-value btor523) (bitvector 5)) btor523)]
           [btor1379 (bv->signal (zero-extend (signal-value btor52) (bitvector 4)) btor52)]
           [btor1380 (bv->signal (zero-extend (signal-value btor53) (bitvector 1)) btor53)]
           [btor1381 (bv->signal (zero-extend (signal-value btor54) (bitvector 1)) btor54)]
           [btor1382 (bv->signal (zero-extend (signal-value btor55) (bitvector 5)) btor55)]
           [btor1383 (bv->signal (zero-extend (signal-value btor57) (bitvector 9)) btor57)]
           [btor1384 (bv->signal (zero-extend (signal-value btor58) (bitvector 1)) btor58)]
           [btor1385 (bv->signal (zero-extend (signal-value btor59) (bitvector 1)) btor59)]
           [btor1386 (bv->signal (zero-extend (signal-value btor60) (bitvector 1)) btor60)]
           [btor1387 (bv->signal (zero-extend (signal-value btor61) (bitvector 1)) btor61)]
           [btor1388 (bv->signal (zero-extend (signal-value btor62) (bitvector 1)) btor62)]
           [btor1389 (bv->signal (zero-extend (signal-value btor63) (bitvector 1)) btor63)]
           [btor1390 (bv->signal (zero-extend (signal-value btor64) (bitvector 1)) btor64)]
           [btor1391 (bv->signal (zero-extend (signal-value btor65) (bitvector 1)) btor65)]
           [btor1392 (bv->signal (zero-extend (signal-value btor66) (bitvector 1)) btor66)]
           [btor1393 (bv->signal (zero-extend (signal-value btor67) (bitvector 1)) btor67)]
           [btor1394 (bv->signal (zero-extend (signal-value btor68) (bitvector 48)) btor68)]
           [btor1395 (bv->signal (zero-extend (signal-value btor728) (bitvector 1)) btor728)]
           [btor1396 (bv->signal (zero-extend (signal-value btor69) (bitvector 32)) btor69)]
           [btor1397 (bv->signal (zero-extend (signal-value btor70) (bitvector 1)) btor70)]
           [btor1398 (bv->signal (zero-extend (signal-value btor983) (bitvector 1)) btor983)]
           [btor1399 (bv->signal (zero-extend (signal-value btor990) (bitvector 1)) btor990)]
           [btor1400 (bv->signal (zero-extend (signal-value btor416) (bitvector 1)) btor416)]
           [btor1401 (bv->signal (zero-extend (signal-value btor72) (bitvector 32)) btor72)]
           [btor1402 (bv->signal (zero-extend (signal-value btor408) (bitvector 9)) btor408)]
           [btor1403 (bv->signal (zero-extend (signal-value btor417) (bitvector 9)) btor417)]
           [btor1404 (bv->signal (zero-extend (signal-value btor415) (bitvector 9)) btor415)]
           [btor1405 (bv->signal (zero-extend (signal-value btor73) (bitvector 48)) btor73)]
           [btor1406 (bv->signal (zero-extend (signal-value btor74) (bitvector 48)) btor74)]
           [btor1407 (bv->signal (zero-extend (signal-value btor536) (bitvector 1)) btor536)]
           [btor1408 (bv->signal (zero-extend (signal-value btor533) (bitvector 8)) btor533)]
           [btor1409 (bv->signal (zero-extend (signal-value btor605) (bitvector 27)) btor605)]
           [btor1410 (bv->signal (zero-extend (signal-value btor951) (bitvector 1)) btor951)]
           [btor1411 (bv->signal (zero-extend (signal-value btor76) (bitvector 32)) btor76)]
           [btor1412 (bv->signal (zero-extend (signal-value btor851) (bitvector 1)) btor851)]
           [btor1413 (bv->signal (zero-extend (signal-value btor338) (bitvector 48)) btor338)]
           [btor1414 (bv->signal (zero-extend (signal-value btor77) (bitvector 48)) btor77)]
           [btor1415 (signal (bvxor (signal-value btor79) (signal-value btor58))
                             (merge-state (list btor79 btor58)))]
           [btor1416 (bv->signal (zero-extend (signal-value btor1415) (bitvector 1)) btor1415)]
           [btor1417 (signal (bvxor (signal-value btor80) (signal-value btor59))
                             (merge-state (list btor80 btor59)))]
           [btor1418 (bv->signal (zero-extend (signal-value btor1417) (bitvector 1)) btor1417)]
           [btor1419 (signal (bvxor (signal-value btor78) (signal-value btor60))
                             (merge-state (list btor78 btor60)))]
           [btor1420 (bv->signal (zero-extend (signal-value btor1419) (bitvector 1)) btor1419)]
           [btor1421 (signal (bvxor (signal-value btor81) (signal-value btor61))
                             (merge-state (list btor81 btor61)))]
           [btor1422 (bv->signal (zero-extend (signal-value btor1421) (bitvector 1)) btor1421)]
           [btor1423 (signal (bvxor (signal-value btor83) (signal-value btor62))
                             (merge-state (list btor83 btor62)))]
           [btor1424 (bv->signal (zero-extend (signal-value btor1423) (bitvector 1)) btor1423)]
           [btor1425 (signal (bvxor (signal-value btor82) (signal-value btor63))
                             (merge-state (list btor82 btor63)))]
           [btor1426 (bv->signal (zero-extend (signal-value btor1425) (bitvector 1)) btor1425)]
           [btor1427 (signal (bvxor (signal-value btor84) (signal-value btor64))
                             (merge-state (list btor84 btor64)))]
           [btor1428 (bv->signal (zero-extend (signal-value btor1427) (bitvector 1)) btor1427)]
           [btor1429 (signal (bvxor (signal-value btor85) (signal-value btor65))
                             (merge-state (list btor85 btor65)))]
           [btor1430 (bv->signal (zero-extend (signal-value btor1429) (bitvector 1)) btor1429)]
           [btor1431 (signal (bvxor (signal-value btor86) (signal-value btor66))
                             (merge-state (list btor86 btor66)))]
           [btor1432 (bv->signal (zero-extend (signal-value btor1431) (bitvector 1)) btor1431)]
           [btor1433 (signal (bvxor (signal-value btor87) (signal-value btor67))
                             (merge-state (list btor87 btor67)))]
           [btor1434 (bv->signal (zero-extend (signal-value btor1433) (bitvector 1)) btor1433)]
           [btor1435 (bv->signal (zero-extend (signal-value btor1120) (bitvector 2)) btor1120)]
           [btor1436 (bitvector 112)]
           [btor1437 (bitvector 107)]
           [btor1438 (bv->signal (bv 0 (bitvector 107)))]
           [btor1439 (signal (concat (signal-value btor1438) (signal-value btor88))
                             (merge-state (list btor1438 btor88)))]
           [btor1440 (bv->signal (zero-extend (signal-value btor1439) (bitvector 112)) btor1439)]
           [btor1441 (bv->signal (zero-extend (signal-value btor999) (bitvector 1)) btor999)]
           [btor1442 (signal (concat (signal-value btor1312) (signal-value btor89))
                             (merge-state (list btor1312 btor89)))]
           [btor1443 (bv->signal (zero-extend (signal-value btor1442) (bitvector 56)) btor1442)]
           [btor1444 (bv->signal (zero-extend (signal-value btor575) (bitvector 2)) btor575)]
           [btor1445 (bitvector 64)]
           [btor1446 (bitvector 59)]
           [btor1447 (bv->signal (bv 0 (bitvector 59)))]
           [btor1448 (signal (concat (signal-value btor1447) (signal-value btor90))
                             (merge-state (list btor1447 btor90)))]
           [btor1449 (bv->signal (zero-extend (signal-value btor1448) (bitvector 64)) btor1448)]
           [btor1450 (bv->signal (zero-extend (signal-value btor1137) (bitvector 1)) btor1137)]
           [btor1451 (bitvector 72)]
           [btor1452 (bitvector 67)]
           [btor1453 (bv->signal (bv 0 (bitvector 67)))]
           [btor1454 (signal (concat (signal-value btor1453) (signal-value btor91))
                             (merge-state (list btor1453 btor91)))]
           [btor1455 (bv->signal (zero-extend (signal-value btor1454) (bitvector 72)) btor1454)]
           [btor1456 (bv->signal (zero-extend (signal-value btor197) (bitvector 2)) btor197)]
           [btor1457 (bv->signal (bv 0 (bitvector 43)))]
           [btor1458 (signal (concat (signal-value btor1457) (signal-value btor92))
                             (merge-state (list btor1457 btor92)))]
           [btor1459 (bv->signal (zero-extend (signal-value btor1458) (bitvector 48)) btor1458)]
           [btor1460 (bv->signal (zero-extend (signal-value btor1197) (bitvector 1)) btor1197)]
           [btor1461 (signal (concat (signal-value btor1305) (signal-value btor93))
                             (merge-state (list btor1305 btor93)))]
           [btor1462 (bv->signal (zero-extend (signal-value btor1461) (bitvector 40)) btor1461)]
           [btor1463 (bv->signal (zero-extend (signal-value btor729) (bitvector 45)) btor729)]
           [btor1464 (bv->signal (zero-extend (signal-value btor732) (bitvector 45)) btor732)]
           [btor1465 (bv->signal (zero-extend (signal-value btor727) (bitvector 45)) btor727)]
           [btor1466 (bv->signal (zero-extend (signal-value btor719) (bitvector 44)) btor719)]
           [btor1467 (bv->signal (zero-extend (signal-value btor769) (bitvector 45)) btor769)]
           [btor1468 (bv->signal (zero-extend (signal-value btor770) (bitvector 45)) btor770)]
           [btor1469 (bv->signal (zero-extend (signal-value btor768) (bitvector 45)) btor768)]
           [btor1470 (bv->signal (zero-extend (signal-value btor761) (bitvector 45)) btor761)]
           [btor1471 (bv->signal (zero-extend (signal-value btor1209) (bitvector 1)) btor1209)]
           [btor1472 (bitvector 88)]
           [btor1473 (bitvector 83)]
           [btor1474 (bv->signal (bv 0 (bitvector 83)))]
           [btor1475 (signal (concat (signal-value btor1474) (signal-value btor94))
                             (merge-state (list btor1474 btor94)))]
           [btor1476 (bv->signal (zero-extend (signal-value btor1475) (bitvector 88)) btor1475)]
           [btor1477 (bv->signal (zero-extend (signal-value btor1247) (bitvector 8)) btor1247)]
           [btor1478 (bv->signal (zero-extend (signal-value btor1254) (bitvector 8)) btor1254)]
           [btor1479 (bitvector 49)]
           [btor1480 (signal (concat (signal-value btor821) (signal-value btor929))
                             (merge-state (list btor821 btor929)))]
           [btor1481 (bv->signal (zero-extend (signal-value btor1480) (bitvector 49)) btor1480)]
           [btor1482 (bv->signal (zero-extend (signal-value btor620) (bitvector 27)) btor620)]
           [btor1483 (signal (bvnot (signal-value btor1303)) (merge-state (list btor1303)))]
           [btor1484 (signal (bvor (signal-value btor1483) (signal-value btor44))
                             (merge-state (list btor1483 btor44)))]
           [btor1485 (bv->signal (zero-extend (signal-value btor1484) (bitvector 1)) btor1484)]
           [btor1486 (bv->signal (zero-extend (signal-value btor658) (bitvector 18)) btor658)]
           [btor1487 (bv->signal (zero-extend (signal-value btor867) (bitvector 1)) btor867)]
           [btor1488 (bv->signal (zero-extend (signal-value btor43) (bitvector 1)) btor43)]
           [btor1489 (bv->signal (zero-extend (signal-value btor929) (bitvector 1)) btor929)]
           [btor1490 (bv->signal (zero-extend (signal-value btor926) (bitvector 1)) btor926)]
           [btor1491 (bv->signal (zero-extend (signal-value btor783) (bitvector 48)) btor783)]
           [btor1492 (bv->signal (zero-extend (signal-value btor843) (bitvector 1)) btor843)]
           [btor1493 (bv->signal (zero-extend (signal-value btor835) (bitvector 1)) btor835)]
           [btor1494 (bv->signal (zero-extend (signal-value btor823) (bitvector 1)) btor823)]
           [btor1495 (bv->signal (zero-extend (signal-value btor787) (bitvector 48)) btor787)]
           [btor1496 (signal (extract 10 0 (signal-value btor787)) (signal-state btor787))]
           [btor1497 (signal (concat (signal-value btor789) (signal-value btor1496))
                             (merge-state (list btor789 btor1496)))]
           [btor1498 (signal (extract 22 12 (signal-value btor787)) (signal-state btor787))]
           [btor1499 (signal (concat (signal-value btor1498) (signal-value btor1497))
                             (merge-state (list btor1498 btor1497)))]
           [btor1500 (signal (concat (signal-value btor791) (signal-value btor1499))
                             (merge-state (list btor791 btor1499)))]
           [btor1501 (signal (extract 34 24 (signal-value btor787)) (signal-state btor787))]
           [btor1502 (signal (concat (signal-value btor1501) (signal-value btor1500))
                             (merge-state (list btor1501 btor1500)))]
           [btor1503 (signal (concat (signal-value btor793) (signal-value btor1502))
                             (merge-state (list btor793 btor1502)))]
           [btor1504 (signal (extract 47 36 (signal-value btor787)) (signal-state btor787))]
           [btor1505 (signal (concat (signal-value btor1504) (signal-value btor1503))
                             (merge-state (list btor1504 btor1503)))]
           [btor1506 (bv->signal (zero-extend (signal-value btor1505) (bitvector 48)) btor1505)]
           [btor1507 (bv->signal (zero-extend (signal-value btor821) (bitvector 48)) btor821)]
           [btor1508 (bv->signal (zero-extend (signal-value btor956) (bitvector 1)) btor956)]
           [btor1509 (bv->signal (zero-extend (signal-value btor969) (bitvector 1)) btor969)]
           [btor1510 (bv->signal (zero-extend (signal-value btor975) (bitvector 1)) btor975)]
           [btor1511 (bv->signal (zero-extend (signal-value btor949) (bitvector 1)) btor949)]
           [btor1512 (bv->signal (zero-extend (signal-value btor983) (bitvector 1)) btor983)]
           [btor1513 (bv->signal (zero-extend (signal-value btor963) (bitvector 1)) btor963)]
           [btor1514 (bv->signal (zero-extend (signal-value btor970) (bitvector 1)) btor970)]
           [btor1515 (bv->signal (zero-extend (signal-value btor976) (bitvector 1)) btor976)]
           [btor1516 (bv->signal (zero-extend (signal-value btor949) (bitvector 1)) btor949)]
           [btor1517 (if (bitvector->bool (signal-value btor43)) btor867 btor874)]
           [btor1518 (bv->signal (zero-extend (signal-value btor1517) (bitvector 1)) btor1517)]
           [btor1519 (if (bitvector->bool (signal-value btor1415)) btor106 btor1517)]
           [btor1520 (bv->signal (zero-extend (signal-value btor1519) (bitvector 1)) btor1519)]
           [btor1521 (bv->signal (zero-extend (signal-value btor106) (bitvector 1)) btor106)]
           [btor1522 (bv->signal (zero-extend (signal-value btor937) (bitvector 1)) btor937)]
           [btor1523 (bv->signal (zero-extend (signal-value btor941) (bitvector 1)) btor941)]
           [btor1524 (bv->signal (zero-extend (signal-value btor945) (bitvector 1)) btor945)]
           [btor1525 (bv->signal (zero-extend (signal-value btor715) (bitvector 45)) btor715)]
           [btor1526 (bv->signal (zero-extend (signal-value btor962) (bitvector 1)) btor962)]
           [btor1527 (bv->signal (zero-extend (signal-value btor875) (bitvector 1)) btor875)]
           [btor1528 (bv->signal (zero-extend (signal-value btor97) (bitvector 1)) btor97)]
           [btor1529 (bv->signal (zero-extend (signal-value btor1169) (bitvector 1)) btor1169)]
           [btor1530 (bv->signal (zero-extend (signal-value btor1140) (bitvector 1)) btor1140)]
           [btor1531 (bv->signal (zero-extend (signal-value btor1148) (bitvector 1)) btor1148)]
           [btor1532 (bv->signal (zero-extend (signal-value btor1147) (bitvector 1)) btor1147)]
           [btor1533 (bv->signal (zero-extend (signal-value btor1168) (bitvector 1)) btor1168)]
           [btor1534 (bv->signal (zero-extend (signal-value btor1151) (bitvector 1)) btor1151)]
           [btor1535 (bv->signal (zero-extend (signal-value btor1159) (bitvector 1)) btor1159)]
           [btor1536 (bv->signal (zero-extend (signal-value btor1158) (bitvector 1)) btor1158)]
           [btor1537 (bv->signal (zero-extend (signal-value btor1184) (bitvector 1)) btor1184)]
           [btor1538 (bv->signal (bv 5864062014805 (bitvector 44)))]
           [btor1539 (bv->signal (zero-extend (signal-value btor1538) (bitvector 44)) btor1538)]
           [btor1540 (bv->signal (zero-extend (signal-value btor757) (bitvector 44)) btor757)]
           [btor1541 (bv->signal (zero-extend (signal-value btor874) (bitvector 1)) btor874)]
           [btor1542 (bv->signal (zero-extend (signal-value btor1415) (bitvector 1)) btor1415)]
           [btor1543 (bv->signal (zero-extend (signal-value btor778) (bitvector 48)) btor778)]
           [btor1544 (bv->signal (zero-extend (signal-value btor935) (bitvector 13)) btor935)]
           [btor1545 (bv->signal (zero-extend (signal-value btor939) (bitvector 13)) btor939)]
           [btor1546 (bv->signal (zero-extend (signal-value btor943) (bitvector 13)) btor943)]
           [btor1547 (bv->signal (zero-extend (signal-value btor947) (bitvector 14)) btor947)]
           [btor1548 (bv->signal (zero-extend (signal-value btor785) (bitvector 48)) btor785)]
           [btor1549 (bv->signal (zero-extend (signal-value btor828) (bitvector 48)) btor828)]
           [btor1550 (signal (bvand (signal-value btor1484) (signal-value btor1169))
                             (merge-state (list btor1484 btor1169)))]
           [btor1551 (signal (bvand (signal-value btor1550) (signal-value btor1149))
                             (merge-state (list btor1550 btor1149)))]
           [btor1552 (signal (bool->bitvector (bveq (signal-value btor1291) (signal-value btor103)))
                             (merge-state (list btor1291 btor103)))]
           [btor1553 (if (bitvector->bool (signal-value btor1552)) btor1551 btor106)]
           [btor1554 (signal (bvand (signal-value btor1484) (signal-value btor1148))
                             (merge-state (list btor1484 btor1148)))]
           [btor1555 (bv->signal (zero-extend (signal-value btor97) (bitvector 2)) btor97)]
           [btor1556 (signal (bool->bitvector (bveq (signal-value btor1291) (signal-value btor1555)))
                             (merge-state (list btor1291 btor1555)))]
           [btor1557 (if (bitvector->bool (signal-value btor1556)) btor1554 btor1553)]
           [btor1558 (bv->signal (zero-extend (signal-value btor1557) (bitvector 1)) btor1557)]
           [btor1559 (bv->signal (zero-extend (signal-value btor1138) (bitvector 48)) btor1138)]
           [btor1560 (bv->signal (zero-extend (signal-value btor1000) (bitvector 48)) btor1000)]
           [btor1561 (bv->signal (zero-extend (signal-value btor1185) (bitvector 1)) btor1185)]
           [btor1562 (bv->signal (zero-extend (signal-value btor817) (bitvector 48)) btor817)]
           [btor1563 (bv->signal (zero-extend (signal-value btor743) (bitvector 2)) btor743)]
           [btor1564 (bv->signal (zero-extend (signal-value btor748) (bitvector 48)) btor748)]
           [btor1565 (bv->signal (zero-extend (signal-value btor1198) (bitvector 1)) btor1198)]
           [btor1566 (bv->signal (zero-extend (signal-value btor1201) (bitvector 1)) btor1201)]
           [btor1567 (bv->signal (zero-extend (signal-value btor1213) (bitvector 1)) btor1213)]
           [btor1568 (bv->signal (zero-extend (signal-value btor1216) (bitvector 1)) btor1216)]
           [btor1569 (bv->signal (zero-extend (signal-value btor1223) (bitvector 1)) btor1223)]
           [btor1570 (bv->signal (zero-extend (signal-value btor1226) (bitvector 1)) btor1226)]
           [btor1571 (bv->signal (zero-extend (signal-value btor1230) (bitvector 1)) btor1230)]
           [btor1572 (bv->signal (zero-extend (signal-value btor1233) (bitvector 1)) btor1233)]
           [btor1573 (bv->signal (zero-extend (signal-value btor1202) (bitvector 1)) btor1202)]
           [btor1574 (bv->signal (zero-extend (signal-value btor1217) (bitvector 1)) btor1217)]
           [btor1575 (bv->signal (zero-extend (signal-value btor1227) (bitvector 1)) btor1227)]
           [btor1576 (bv->signal (zero-extend (signal-value btor1234) (bitvector 1)) btor1234)]
           [btor1577 (bv->signal (zero-extend (signal-value btor1218) (bitvector 1)) btor1218)]
           [btor1578 (bv->signal (zero-extend (signal-value btor1235) (bitvector 1)) btor1235)]
           [btor1579 (bv->signal (zero-extend (signal-value btor1236) (bitvector 1)) btor1236)]
           [btor1580 (bv->signal (zero-extend (signal-value btor777) (bitvector 48)) btor777)]
           [btor1581 (bv->signal (zero-extend (signal-value btor487) (bitvector 48)) btor487)]
           [btor1582 (bv->signal (zero-extend (signal-value btor486) (bitvector 48)) btor486)]
           [btor1584 (if (bitvector->bool (signal-value btor32)) btor115 btor105)]
           [btor1585 (bv->signal (bv 0 (bitvector 30)))]
           [btor1586 (signal (apply bvor (bitvector->bits (signal-value btor123)))
                             (signal-state btor123))]
           [btor1587 (signal (bvnot (signal-value btor1586)) (merge-state (list btor1586)))]
           [btor1588 (signal (bvor (signal-value btor1419) (signal-value btor1587))
                             (merge-state (list btor1419 btor1587)))]
           [btor1589 (if (bitvector->bool (signal-value btor1588)) btor1585 btor1584)]
           [btor1593 (signal (bool->bitvector (bveq (signal-value btor123) (signal-value btor103)))
                             (merge-state (list btor123 btor103)))]
           [btor1594 (if (bitvector->bool (signal-value btor1593)) btor105 btor115)]
           [btor1595 (if (bitvector->bool (signal-value btor33)) btor1594 btor122)]
           [btor1596 (if (bitvector->bool (signal-value btor1588)) btor1585 btor1595)]
           [btor1600 (if (bitvector->bool (signal-value btor36)) btor143 btor136)]
           [btor1601 (signal (apply bvor (bitvector->bits (signal-value btor151)))
                             (signal-state btor151))]
           [btor1602 (signal (bvnot (signal-value btor1601)) (merge-state (list btor1601)))]
           [btor1603 (signal (bvor (signal-value btor1421) (signal-value btor1602))
                             (merge-state (list btor1421 btor1602)))]
           [btor1604 (if (bitvector->bool (signal-value btor1603)) btor584 btor1600)]
           [btor1608 (signal (bool->bitvector (bveq (signal-value btor151) (signal-value btor103)))
                             (merge-state (list btor151 btor103)))]
           [btor1609 (if (bitvector->bool (signal-value btor1608)) btor136 btor143)]
           [btor1610 (if (bitvector->bool (signal-value btor37)) btor1609 btor150)]
           [btor1611 (if (bitvector->bool (signal-value btor1421)) btor584 btor1610)]
           [btor1615 (if (bitvector->bool (signal-value btor35)) btor172 btor179)]
           [btor1616 (bv->signal (bv 0 (bitvector 4)))]
           [btor1617 (if (bitvector->bool (signal-value btor1417)) btor1616 btor1615)]
           [btor1621 (signal (bvand (signal-value btor44) (signal-value btor951))
                             (merge-state (list btor44 btor951)))]
           [btor1622 (if (bitvector->bool (signal-value btor1621)) btor1103 btor338)]
           [btor1623 (signal (bvor (signal-value btor1433) (signal-value btor1557))
                             (merge-state (list btor1433 btor1557)))]
           [btor1624 (if (bitvector->bool (signal-value btor1623)) btor483 btor1622)]
           [btor1628 (if (bitvector->bool (signal-value btor40)) btor408 btor415)]
           [btor1629 (bv->signal (bv 0 (bitvector 9)))]
           [btor1630 (if (bitvector->bool (signal-value btor1423)) btor1629 btor1628)]
           [btor1634 (if (bitvector->bool (signal-value btor38)) btor24 btor474)]
           [btor1635 (signal (bvnot (signal-value btor475)) (merge-state (list btor475)))]
           [btor1636 (signal (bvor (signal-value btor1425) (signal-value btor1635))
                             (merge-state (list btor1425 btor1635)))]
           [btor1637 (if (bitvector->bool (signal-value btor1636)) btor483 btor1634)]
           [btor1641 (if (bitvector->bool (signal-value btor42)) btor516 btor523)]
           [btor1642 (bv->signal (bv 0 (bitvector 5)))]
           [btor1643 (signal (bvnot (signal-value btor524)) (merge-state (list btor524)))]
           [btor1644 (signal (bvor (signal-value btor1429) (signal-value btor1643))
                             (merge-state (list btor1429 btor1643)))]
           [btor1645 (if (bitvector->bool (signal-value btor1644)) btor1642 btor1641)]
           [btor1649 (if (bitvector->bool (signal-value btor41)) btor48 btor547)]
           [btor1650 (signal (bvnot (signal-value btor578)) (merge-state (list btor578)))]
           [btor1651 (signal (bvor (signal-value btor1427) (signal-value btor1650))
                             (merge-state (list btor1427 btor1650)))]
           [btor1652 (if (bitvector->bool (signal-value btor1651)) btor528 btor1649)]
           [btor1656 (if (bitvector->bool (signal-value btor34)) btor609 btor616)]
           [btor1657 (if (bitvector->bool (signal-value btor1427)) btor528 btor1656)]
           [btor1661 (if (bitvector->bool (signal-value btor43)) btor720 btor727)]
           [btor1662 (signal (bvnot (signal-value btor728)) (merge-state (list btor728)))]
           [btor1663 (signal (bvor (signal-value btor1431) (signal-value btor1662))
                             (merge-state (list btor1431 btor1662)))]
           [btor1664 (if (bitvector->bool (signal-value btor1663)) btor714 btor1661)]
           [btor1668 (if (bitvector->bool (signal-value btor43)) btor761 btor768)]
           [btor1669 (if (bitvector->bool (signal-value btor1663)) btor714 btor1668)]
           [btor1673 (if (bitvector->bool (signal-value btor40)) btor30 btor859)]
           [btor1674 (if (bitvector->bool (signal-value btor1423)) btor532 btor1673)]
           [btor1681 (if (bitvector->bool (signal-value btor1621)) btor184 btor888)]
           [btor1682 (if (bitvector->bool (signal-value btor1623)) btor106 btor1681)]
           [btor1686 (if (bitvector->bool (signal-value btor1621)) btor980 btor895)]
           [btor1687 (if (bitvector->bool (signal-value btor1623)) btor1616 btor1686)]
           [btor1691 (if (bitvector->bool (signal-value btor39)) btor913 btor920)]
           [btor1692 (if (bitvector->bool (signal-value btor1415)) btor106 btor1691)]
           [btor1696 (if (bitvector->bool (signal-value btor1621)) btor983 btor990)]
           [btor1697 (if (bitvector->bool (signal-value btor1623)) btor106 btor1696)]
           [btor1701 (if (bitvector->bool (signal-value btor1621)) btor1140 btor1147)]
           [btor1702 (if (bitvector->bool (signal-value btor1623)) btor106 btor1701)]
           [btor1706 (if (bitvector->bool (signal-value btor1621)) btor1151 btor1158)]
           [btor1707 (if (bitvector->bool (signal-value btor1623)) btor106 btor1706)]
           [btor1711 (if (bitvector->bool (signal-value btor1621)) btor1147 btor1168)]
           [btor1712 (if (bitvector->bool (signal-value btor1623)) btor106 btor1711)]
           [btor1716 (if (bitvector->bool (signal-value btor1621)) btor1158 btor1184)]
           [btor1717 (if (bitvector->bool (signal-value btor1623)) btor106 btor1716)]
           [btor1721 (if (bitvector->bool (signal-value btor1621)) btor1247 btor1254)]
           [btor1722 (bv->signal (bv 0 (bitvector 8)))]
           [btor1723 (if (bitvector->bool (signal-value btor1623)) btor1722 btor1721)])
      (signal
       (signal-value btor1173)
       (hash-set
        (hash-set
         (hash-set
          (hash-set
           (hash-set
            (hash-set
             (hash-set
              (hash-set
               (hash-set
                (hash-set
                 (hash-set
                  (hash-set
                   (hash-set
                    (hash-set
                     (hash-set
                      (hash-set
                       (hash-set
                        (hash-set
                         (hash-set
                          (hash-set
                           (hash-set
                            (hash-set
                             (hash-set
                              (hash-set
                               (hash-set
                                (hash-set
                                 (hash-set
                                  (hash-set
                                   (hash-set
                                    (hash-set
                                     (hash-set
                                      (hash-set
                                       (hash-set
                                        (hash-set
                                         (hash-set
                                          (hash-set
                                           (hash-set
                                            (hash-set
                                             (hash-set
                                              (hash-set
                                               (hash-set
                                                (hash-set
                                                 (hash-set
                                                  (hash-set
                                                   (hash-set
                                                    (hash-set
                                                     (hash-set
                                                      (hash-set
                                                       (hash-set
                                                        (hash-set
                                                         (hash-set
                                                          (hash-set
                                                           (hash-set
                                                            (hash-set
                                                             (hash-set
                                                              (hash-set
                                                               (hash-set
                                                                (hash-set
                                                                 (hash-set
                                                                  (hash-set
                                                                   (hash-set
                                                                    (hash-set
                                                                     (hash-set
                                                                      (hash-set
                                                                       (hash-set
                                                                        (hash-set
                                                                         (hash-set
                                                                          (hash-set
                                                                           (hash-set
                                                                            (hash-set
                                                                             (hash-set
                                                                              (hash-set (hash)
                                                                                        'state95
                                                                                        (signal-value
                                                                                         btor105))
                                                                              'state96
                                                                              (signal-value btor1589))
                                                                             'state98
                                                                             (signal-value btor100))
                                                                            'state116
                                                                            (signal-value btor122))
                                                                           'state117
                                                                           (signal-value btor1596))
                                                                          'state118
                                                                          (signal-value btor100))
                                                                         'state130
                                                                         (signal-value btor136))
                                                                        'state131
                                                                        (signal-value btor1604))
                                                                       'state132
                                                                       (signal-value btor100))
                                                                      'state144
                                                                      (signal-value btor150))
                                                                     'state145
                                                                     (signal-value btor1611))
                                                                    'state146
                                                                    (signal-value btor100))
                                                                   'state173
                                                                   (signal-value btor179))
                                                                  'state174
                                                                  (signal-value btor1617))
                                                                 'state175
                                                                 (signal-value btor100))
                                                                'state332
                                                                (signal-value btor338))
                                                               'state333
                                                               (signal-value btor1624))
                                                              'state334
                                                              (signal-value btor100))
                                                             'state409
                                                             (signal-value btor415))
                                                            'state410
                                                            (signal-value btor1630))
                                                           'state411
                                                           (signal-value btor100))
                                                          'state468
                                                          (signal-value btor474))
                                                         'state469
                                                         (signal-value btor1637))
                                                        'state470
                                                        (signal-value btor100))
                                                       'state517
                                                       (signal-value btor523))
                                                      'state518
                                                      (signal-value btor1645))
                                                     'state519
                                                     (signal-value btor100))
                                                    'state541
                                                    (signal-value btor547))
                                                   'state542
                                                   (signal-value btor1652))
                                                  'state543
                                                  (signal-value btor100))
                                                 'state610
                                                 (signal-value btor616))
                                                'state611
                                                (signal-value btor1657))
                                               'state612
                                               (signal-value btor100))
                                              'state721
                                              (signal-value btor727))
                                             'state722
                                             (signal-value btor1664))
                                            'state723
                                            (signal-value btor100))
                                           'state762
                                           (signal-value btor768))
                                          'state763
                                          (signal-value btor1669))
                                         'state764
                                         (signal-value btor100))
                                        'state853
                                        (signal-value btor859))
                                       'state854
                                       (signal-value btor1674))
                                      'state855
                                      (signal-value btor100))
                                     'state868
                                     (signal-value btor874))
                                    'state869
                                    (signal-value btor1519))
                                   'state870
                                   (signal-value btor100))
                                  'state882
                                  (signal-value btor888))
                                 'state883
                                 (signal-value btor1682))
                                'state884
                                (signal-value btor100))
                               'state889
                               (signal-value btor895))
                              'state890
                              (signal-value btor1687))
                             'state891
                             (signal-value btor100))
                            'state914
                            (signal-value btor920))
                           'state915
                           (signal-value btor1692))
                          'state916
                          (signal-value btor100))
                         'state984
                         (signal-value btor990))
                        'state985
                        (signal-value btor1697))
                       'state986
                       (signal-value btor100))
                      'state1141
                      (signal-value btor1147))
                     'state1142
                     (signal-value btor1702))
                    'state1143
                    (signal-value btor100))
                   'state1152
                   (signal-value btor1158))
                  'state1153
                  (signal-value btor1707))
                 'state1154
                 (signal-value btor100))
                'state1162
                (signal-value btor1168))
               'state1163
               (signal-value btor1712))
              'state1164
              (signal-value btor100))
             'state1178
             (signal-value btor1184))
            'state1179
            (signal-value btor1717))
           'state1180
           (signal-value btor100))
          'state1248
          (signal-value btor1254))
         'state1249
         (signal-value btor1723))
        'state1250
        (signal-value btor100))))))
