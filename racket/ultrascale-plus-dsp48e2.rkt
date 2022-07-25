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

(provide P)
(require (file "/Users/gus/lakeroad/racket/stateful-design-experiment.rkt"))
(require rosette)
(require racket/hash)
(define/contract
 P
 (->* ()
      (#:A (struct/c signal (bitvector 30) (hash/c symbol? bv?))
       #:ACASCREG (struct/c signal (bitvector 32) (hash/c symbol? bv?))
       #:ACIN (struct/c signal (bitvector 30) (hash/c symbol? bv?))
       #:ADREG (struct/c signal (bitvector 32) (hash/c symbol? bv?))
       #:ALUMODE (struct/c signal (bitvector 4) (hash/c symbol? bv?))
       #:ALUMODEREG (struct/c signal (bitvector 32) (hash/c symbol? bv?))
       #:AMULTSEL (struct/c signal (bitvector 5) (hash/c symbol? bv?))
       #:AREG (struct/c signal (bitvector 32) (hash/c symbol? bv?))
       #:AUTORESET_PATDET (struct/c signal (bitvector 5) (hash/c symbol? bv?))
       #:AUTORESET_PRIORITY (struct/c signal (bitvector 5) (hash/c symbol? bv?))
       #:A_INPUT (struct/c signal (bitvector 5) (hash/c symbol? bv?))
       #:B (struct/c signal (bitvector 18) (hash/c symbol? bv?))
       #:BCASCREG (struct/c signal (bitvector 32) (hash/c symbol? bv?))
       #:BCIN (struct/c signal (bitvector 18) (hash/c symbol? bv?))
       #:BMULTSEL (struct/c signal (bitvector 5) (hash/c symbol? bv?))
       #:BREG (struct/c signal (bitvector 32) (hash/c symbol? bv?))
       #:B_INPUT (struct/c signal (bitvector 5) (hash/c symbol? bv?))
       #:C (struct/c signal (bitvector 48) (hash/c symbol? bv?))
       #:CARRYCASCIN (struct/c signal (bitvector 1) (hash/c symbol? bv?))
       #:CARRYIN (struct/c signal (bitvector 1) (hash/c symbol? bv?))
       #:CARRYINREG (struct/c signal (bitvector 32) (hash/c symbol? bv?))
       #:CARRYINSEL (struct/c signal (bitvector 3) (hash/c symbol? bv?))
       #:CARRYINSELREG (struct/c signal (bitvector 32) (hash/c symbol? bv?))
       #:CEA1 (struct/c signal (bitvector 1) (hash/c symbol? bv?))
       #:CEA2 (struct/c signal (bitvector 1) (hash/c symbol? bv?))
       #:CEAD (struct/c signal (bitvector 1) (hash/c symbol? bv?))
       #:CEALUMODE (struct/c signal (bitvector 1) (hash/c symbol? bv?))
       #:CEB1 (struct/c signal (bitvector 1) (hash/c symbol? bv?))
       #:CEB2 (struct/c signal (bitvector 1) (hash/c symbol? bv?))
       #:CEC (struct/c signal (bitvector 1) (hash/c symbol? bv?))
       #:CECARRYIN (struct/c signal (bitvector 1) (hash/c symbol? bv?))
       #:CECTRL (struct/c signal (bitvector 1) (hash/c symbol? bv?))
       #:CED (struct/c signal (bitvector 1) (hash/c symbol? bv?))
       #:CEINMODE (struct/c signal (bitvector 1) (hash/c symbol? bv?))
       #:CEM (struct/c signal (bitvector 1) (hash/c symbol? bv?))
       #:CEP (struct/c signal (bitvector 1) (hash/c symbol? bv?))
       #:CLK (struct/c signal (bitvector 1) (hash/c symbol? bv?))
       #:CREG (struct/c signal (bitvector 32) (hash/c symbol? bv?))
       #:D (struct/c signal (bitvector 27) (hash/c symbol? bv?))
       #:DREG (struct/c signal (bitvector 32) (hash/c symbol? bv?))
       #:INMODE (struct/c signal (bitvector 5) (hash/c symbol? bv?))
       #:INMODEREG (struct/c signal (bitvector 32) (hash/c symbol? bv?))
       #:IS_ALUMODE_INVERTED (struct/c signal (bitvector 4) (hash/c symbol? bv?))
       #:IS_CARRYIN_INVERTED (struct/c signal (bitvector 1) (hash/c symbol? bv?))
       #:IS_CLK_INVERTED (struct/c signal (bitvector 1) (hash/c symbol? bv?))
       #:IS_INMODE_INVERTED (struct/c signal (bitvector 5) (hash/c symbol? bv?))
       #:IS_OPMODE_INVERTED (struct/c signal (bitvector 9) (hash/c symbol? bv?))
       #:IS_RSTALLCARRYIN_INVERTED (struct/c signal (bitvector 1) (hash/c symbol? bv?))
       #:IS_RSTALUMODE_INVERTED (struct/c signal (bitvector 1) (hash/c symbol? bv?))
       #:IS_RSTA_INVERTED (struct/c signal (bitvector 1) (hash/c symbol? bv?))
       #:IS_RSTB_INVERTED (struct/c signal (bitvector 1) (hash/c symbol? bv?))
       #:IS_RSTCTRL_INVERTED (struct/c signal (bitvector 1) (hash/c symbol? bv?))
       #:IS_RSTC_INVERTED (struct/c signal (bitvector 1) (hash/c symbol? bv?))
       #:IS_RSTD_INVERTED (struct/c signal (bitvector 1) (hash/c symbol? bv?))
       #:IS_RSTINMODE_INVERTED (struct/c signal (bitvector 1) (hash/c symbol? bv?))
       #:IS_RSTM_INVERTED (struct/c signal (bitvector 1) (hash/c symbol? bv?))
       #:IS_RSTP_INVERTED (struct/c signal (bitvector 1) (hash/c symbol? bv?))
       #:MASK (struct/c signal (bitvector 48) (hash/c symbol? bv?))
       #:MREG (struct/c signal (bitvector 32) (hash/c symbol? bv?))
       #:MULTSIGNIN (struct/c signal (bitvector 1) (hash/c symbol? bv?))
       #:OPMODE (struct/c signal (bitvector 9) (hash/c symbol? bv?))
       #:OPMODEREG (struct/c signal (bitvector 32) (hash/c symbol? bv?))
       #:PATTERN (struct/c signal (bitvector 48) (hash/c symbol? bv?))
       #:PCIN (struct/c signal (bitvector 48) (hash/c symbol? bv?))
       #:PREADDINSEL (struct/c signal (bitvector 5) (hash/c symbol? bv?))
       #:PREG (struct/c signal (bitvector 32) (hash/c symbol? bv?))
       #:RND (struct/c signal (bitvector 48) (hash/c symbol? bv?))
       #:RSTA (struct/c signal (bitvector 1) (hash/c symbol? bv?))
       #:RSTALLCARRYIN (struct/c signal (bitvector 1) (hash/c symbol? bv?))
       #:RSTALUMODE (struct/c signal (bitvector 1) (hash/c symbol? bv?))
       #:RSTB (struct/c signal (bitvector 1) (hash/c symbol? bv?))
       #:RSTC (struct/c signal (bitvector 1) (hash/c symbol? bv?))
       #:RSTCTRL (struct/c signal (bitvector 1) (hash/c symbol? bv?))
       #:RSTD (struct/c signal (bitvector 1) (hash/c symbol? bv?))
       #:RSTINMODE (struct/c signal (bitvector 1) (hash/c symbol? bv?))
       #:RSTM (struct/c signal (bitvector 1) (hash/c symbol? bv?))
       #:RSTP (struct/c signal (bitvector 1) (hash/c symbol? bv?))
       #:SEL_MASK (struct/c signal (bitvector 5) (hash/c symbol? bv?))
       #:SEL_PATTERN (struct/c signal (bitvector 5) (hash/c symbol? bv?))
       #:USE_MULT (struct/c signal (bitvector 5) (hash/c symbol? bv?))
       #:USE_PATTERN_DETECT (struct/c signal (bitvector 5) (hash/c symbol? bv?))
       #:USE_SIMD (struct/c signal (bitvector 5) (hash/c symbol? bv?))
       #:USE_WIDEXOR (struct/c signal (bitvector 5) (hash/c symbol? bv?))
       #:XORSIMD (struct/c signal (bitvector 5) (hash/c symbol? bv?))
       #:unnamed-input-531 (struct/c signal (bitvector 48) (hash/c symbol? bv?))
       #:unnamed-input-897 (struct/c signal (bitvector 48) (hash/c symbol? bv?))
       #:unnamed-input-1276 (struct/c signal (bitvector 48) (hash/c symbol? bv?))
       #:unnamed-input-1332 (struct/c signal (bitvector 48) (hash/c symbol? bv?))
       #:unnamed-input-1376 (struct/c signal (bitvector 1) (hash/c symbol? bv?)))
      (struct/c signal bv? hash?))
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
     #:unnamed-input-531
     (unnamed-input-531 (bv->signal (constant (list 'unnamed-input-531 'symbolic-constant)
                                              (bitvector 48))))
     #:unnamed-input-897
     (unnamed-input-897 (bv->signal (constant (list 'unnamed-input-897 'symbolic-constant)
                                              (bitvector 48))))
     #:unnamed-input-1276
     (unnamed-input-1276
      (bv->signal (constant (list 'unnamed-input-1276 'symbolic-constant) (bitvector 48))))
     #:unnamed-input-1332
     (unnamed-input-1332
      (bv->signal (constant (list 'unnamed-input-1332 'symbolic-constant) (bitvector 48))))
     #:unnamed-input-1376
     (unnamed-input-1376 (bv->signal (constant (list 'unnamed-input-1376 'symbolic-constant)
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
                                                    'state260
                                                    (bv 1 (bitvector 1)))
                                          'state274
                                          (bv 1 (bitvector 1)))
                                'state359
                                (bv 1 (bitvector 1)))
                               'state396
                               (bv 1 (bitvector 1)))
                              'state534
                              (bv 1 (bitvector 1)))
                             'state629
                             (bv 1 (bitvector 1)))
                            'state879
                            (bv 1 (bitvector 1)))
                           'state938
                           (bv 1 (bitvector 1)))
                          'state1069
                          (bv 1 (bitvector 1)))
                         'state1138
                         (bv 1 (bitvector 1)))
                        'state1249
                        (bv 1 (bitvector 1)))
                       'state1290
                       (bv 1 (bitvector 1)))
                      'state1392
                      (bv 1 (bitvector 1)))
                     'state1407
                     (bv 1 (bitvector 1)))
                    'state1421
                    (bv 1 (bitvector 1)))
                   'state1428
                   (bv 1 (bitvector 1)))
                  'state1455
                  (bv 1 (bitvector 1)))
                 'state1525
                 (bv 1 (bitvector 1)))
                'state1682
                (bv 1 (bitvector 1)))
               'state1693
               (bv 1 (bitvector 1)))
              'state1703
              (bv 1 (bitvector 1)))
             'state1719
             (bv 1 (bitvector 1)))
            'state1789
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
          [btor100 (signal (bool->bitvector ((compose1 not bveq) (signal-value btor45)
                                                                 (signal-value btor97)))
                           (merge-state (list btor45 btor97)))]
          [btor101 (signal (bvxor (signal-value btor45) (signal-value btor54))
                           (merge-state (list btor45 btor54)))]
          [btor102 (signal (bvand (signal-value btor100) (signal-value btor101))
                           (merge-state (list btor100 btor101)))]
          [btor103 (bitvector 2)]
          [btor104 (signal (concat (signal-value btor102) (signal-value btor98))
                           (merge-state (list btor102 btor98)))]
          [btor105 (bv->signal (bv 2 (bitvector 2)))]
          [btor106 (signal (bool->bitvector (bveq (signal-value btor104) (signal-value btor105)))
                           (merge-state (list btor104 btor105)))]
          [btor107 (if (bitvector->bool (signal-value btor106)) btor96 btor95)]
          [btor108 (signal (extract 0 0 (signal-value btor2)) (signal-state btor2))]
          [btor109 (signal (bool->bitvector (bveq (signal-value btor108) (signal-value btor97)))
                           (merge-state (list btor108 btor97)))]
          [btor110 (signal (bvor (signal-value btor109) (signal-value btor108))
                           (merge-state (list btor109 btor108)))]
          [btor111 (signal (extract 1 1 (signal-value btor2)) (signal-state btor2))]
          [btor112 (signal (bool->bitvector (bveq (signal-value btor111) (signal-value btor97)))
                           (merge-state (list btor111 btor97)))]
          [btor113 (signal (bvor (signal-value btor112) (signal-value btor111))
                           (merge-state (list btor112 btor111)))]
          [btor114 (signal (extract 2 2 (signal-value btor2)) (signal-state btor2))]
          [btor115 (signal (bool->bitvector (bveq (signal-value btor114) (signal-value btor97)))
                           (merge-state (list btor114 btor97)))]
          [btor116 (signal (bvor (signal-value btor115) (signal-value btor114))
                           (merge-state (list btor115 btor114)))]
          [btor117 (signal (extract 3 3 (signal-value btor2)) (signal-state btor2))]
          [btor118 (signal (bool->bitvector (bveq (signal-value btor117) (signal-value btor97)))
                           (merge-state (list btor117 btor97)))]
          [btor119 (signal (bvor (signal-value btor118) (signal-value btor117))
                           (merge-state (list btor118 btor117)))]
          [btor120 (signal (extract 4 4 (signal-value btor2)) (signal-state btor2))]
          [btor121 (signal (bool->bitvector (bveq (signal-value btor120) (signal-value btor97)))
                           (merge-state (list btor120 btor97)))]
          [btor122 (signal (bvor (signal-value btor121) (signal-value btor120))
                           (merge-state (list btor121 btor120)))]
          [btor123 (signal (extract 5 5 (signal-value btor2)) (signal-state btor2))]
          [btor124 (signal (bool->bitvector (bveq (signal-value btor123) (signal-value btor97)))
                           (merge-state (list btor123 btor97)))]
          [btor125 (signal (bvor (signal-value btor124) (signal-value btor123))
                           (merge-state (list btor124 btor123)))]
          [btor126 (signal (extract 6 6 (signal-value btor2)) (signal-state btor2))]
          [btor127 (signal (bool->bitvector (bveq (signal-value btor126) (signal-value btor97)))
                           (merge-state (list btor126 btor97)))]
          [btor128 (signal (bvor (signal-value btor127) (signal-value btor126))
                           (merge-state (list btor127 btor126)))]
          [btor129 (signal (extract 7 7 (signal-value btor2)) (signal-state btor2))]
          [btor130 (signal (bool->bitvector (bveq (signal-value btor129) (signal-value btor97)))
                           (merge-state (list btor129 btor97)))]
          [btor131 (signal (bvor (signal-value btor130) (signal-value btor129))
                           (merge-state (list btor130 btor129)))]
          [btor132 (signal (extract 8 8 (signal-value btor2)) (signal-state btor2))]
          [btor133 (signal (bool->bitvector (bveq (signal-value btor132) (signal-value btor97)))
                           (merge-state (list btor132 btor97)))]
          [btor134 (signal (bvor (signal-value btor133) (signal-value btor132))
                           (merge-state (list btor133 btor132)))]
          [btor135 (signal (extract 9 9 (signal-value btor2)) (signal-state btor2))]
          [btor136 (signal (bool->bitvector (bveq (signal-value btor135) (signal-value btor97)))
                           (merge-state (list btor135 btor97)))]
          [btor137 (signal (bvor (signal-value btor136) (signal-value btor135))
                           (merge-state (list btor136 btor135)))]
          [btor138 (signal (extract 10 10 (signal-value btor2)) (signal-state btor2))]
          [btor139 (signal (bool->bitvector (bveq (signal-value btor138) (signal-value btor97)))
                           (merge-state (list btor138 btor97)))]
          [btor140 (signal (bvor (signal-value btor139) (signal-value btor138))
                           (merge-state (list btor139 btor138)))]
          [btor141 (signal (extract 11 11 (signal-value btor2)) (signal-state btor2))]
          [btor142 (signal (bool->bitvector (bveq (signal-value btor141) (signal-value btor97)))
                           (merge-state (list btor141 btor97)))]
          [btor143 (signal (bvor (signal-value btor142) (signal-value btor141))
                           (merge-state (list btor142 btor141)))]
          [btor144 (signal (extract 12 12 (signal-value btor2)) (signal-state btor2))]
          [btor145 (signal (bool->bitvector (bveq (signal-value btor144) (signal-value btor97)))
                           (merge-state (list btor144 btor97)))]
          [btor146 (signal (bvor (signal-value btor145) (signal-value btor144))
                           (merge-state (list btor145 btor144)))]
          [btor147 (signal (extract 13 13 (signal-value btor2)) (signal-state btor2))]
          [btor148 (signal (bool->bitvector (bveq (signal-value btor147) (signal-value btor97)))
                           (merge-state (list btor147 btor97)))]
          [btor149 (signal (bvor (signal-value btor148) (signal-value btor147))
                           (merge-state (list btor148 btor147)))]
          [btor150 (signal (extract 14 14 (signal-value btor2)) (signal-state btor2))]
          [btor151 (signal (bool->bitvector (bveq (signal-value btor150) (signal-value btor97)))
                           (merge-state (list btor150 btor97)))]
          [btor152 (signal (bvor (signal-value btor151) (signal-value btor150))
                           (merge-state (list btor151 btor150)))]
          [btor153 (signal (extract 15 15 (signal-value btor2)) (signal-state btor2))]
          [btor154 (signal (bool->bitvector (bveq (signal-value btor153) (signal-value btor97)))
                           (merge-state (list btor153 btor97)))]
          [btor155 (signal (bvor (signal-value btor154) (signal-value btor153))
                           (merge-state (list btor154 btor153)))]
          [btor156 (signal (extract 16 16 (signal-value btor2)) (signal-state btor2))]
          [btor157 (signal (bool->bitvector (bveq (signal-value btor156) (signal-value btor97)))
                           (merge-state (list btor156 btor97)))]
          [btor158 (signal (bvor (signal-value btor157) (signal-value btor156))
                           (merge-state (list btor157 btor156)))]
          [btor159 (signal (extract 17 17 (signal-value btor2)) (signal-state btor2))]
          [btor160 (signal (bool->bitvector (bveq (signal-value btor159) (signal-value btor97)))
                           (merge-state (list btor159 btor97)))]
          [btor161 (signal (bvor (signal-value btor160) (signal-value btor159))
                           (merge-state (list btor160 btor159)))]
          [btor162 (signal (extract 18 18 (signal-value btor2)) (signal-state btor2))]
          [btor163 (signal (bool->bitvector (bveq (signal-value btor162) (signal-value btor97)))
                           (merge-state (list btor162 btor97)))]
          [btor164 (signal (bvor (signal-value btor163) (signal-value btor162))
                           (merge-state (list btor163 btor162)))]
          [btor165 (signal (extract 19 19 (signal-value btor2)) (signal-state btor2))]
          [btor166 (signal (bool->bitvector (bveq (signal-value btor165) (signal-value btor97)))
                           (merge-state (list btor165 btor97)))]
          [btor167 (signal (bvor (signal-value btor166) (signal-value btor165))
                           (merge-state (list btor166 btor165)))]
          [btor168 (signal (extract 20 20 (signal-value btor2)) (signal-state btor2))]
          [btor169 (signal (bool->bitvector (bveq (signal-value btor168) (signal-value btor97)))
                           (merge-state (list btor168 btor97)))]
          [btor170 (signal (bvor (signal-value btor169) (signal-value btor168))
                           (merge-state (list btor169 btor168)))]
          [btor171 (signal (extract 21 21 (signal-value btor2)) (signal-state btor2))]
          [btor172 (signal (bool->bitvector (bveq (signal-value btor171) (signal-value btor97)))
                           (merge-state (list btor171 btor97)))]
          [btor173 (signal (bvor (signal-value btor172) (signal-value btor171))
                           (merge-state (list btor172 btor171)))]
          [btor174 (signal (extract 22 22 (signal-value btor2)) (signal-state btor2))]
          [btor175 (signal (bool->bitvector (bveq (signal-value btor174) (signal-value btor97)))
                           (merge-state (list btor174 btor97)))]
          [btor176 (signal (bvor (signal-value btor175) (signal-value btor174))
                           (merge-state (list btor175 btor174)))]
          [btor177 (signal (extract 23 23 (signal-value btor2)) (signal-state btor2))]
          [btor178 (signal (bool->bitvector (bveq (signal-value btor177) (signal-value btor97)))
                           (merge-state (list btor177 btor97)))]
          [btor179 (signal (bvor (signal-value btor178) (signal-value btor177))
                           (merge-state (list btor178 btor177)))]
          [btor180 (signal (extract 24 24 (signal-value btor2)) (signal-state btor2))]
          [btor181 (signal (bool->bitvector (bveq (signal-value btor180) (signal-value btor97)))
                           (merge-state (list btor180 btor97)))]
          [btor182 (signal (bvor (signal-value btor181) (signal-value btor180))
                           (merge-state (list btor181 btor180)))]
          [btor183 (signal (extract 25 25 (signal-value btor2)) (signal-state btor2))]
          [btor184 (signal (bool->bitvector (bveq (signal-value btor183) (signal-value btor97)))
                           (merge-state (list btor183 btor97)))]
          [btor185 (signal (bvor (signal-value btor184) (signal-value btor183))
                           (merge-state (list btor184 btor183)))]
          [btor186 (signal (extract 26 26 (signal-value btor2)) (signal-state btor2))]
          [btor187 (signal (bool->bitvector (bveq (signal-value btor186) (signal-value btor97)))
                           (merge-state (list btor186 btor97)))]
          [btor188 (signal (bvor (signal-value btor187) (signal-value btor186))
                           (merge-state (list btor187 btor186)))]
          [btor189 (signal (extract 27 27 (signal-value btor2)) (signal-state btor2))]
          [btor190 (signal (bool->bitvector (bveq (signal-value btor189) (signal-value btor97)))
                           (merge-state (list btor189 btor97)))]
          [btor191 (signal (bvor (signal-value btor190) (signal-value btor189))
                           (merge-state (list btor190 btor189)))]
          [btor192 (signal (extract 28 28 (signal-value btor2)) (signal-state btor2))]
          [btor193 (signal (bool->bitvector (bveq (signal-value btor192) (signal-value btor97)))
                           (merge-state (list btor192 btor97)))]
          [btor194 (signal (bvor (signal-value btor193) (signal-value btor192))
                           (merge-state (list btor193 btor192)))]
          [btor195 (signal (extract 29 29 (signal-value btor2)) (signal-state btor2))]
          [btor196 (signal (bool->bitvector (bveq (signal-value btor195) (signal-value btor97)))
                           (merge-state (list btor195 btor97)))]
          [btor197 (signal (bvor (signal-value btor196) (signal-value btor195))
                           (merge-state (list btor196 btor195)))]
          [btor198 (signal (concat (signal-value btor113) (signal-value btor110))
                           (merge-state (list btor113 btor110)))]
          [btor199 (signal (concat (signal-value btor116) (signal-value btor198))
                           (merge-state (list btor116 btor198)))]
          [btor200 (signal (concat (signal-value btor119) (signal-value btor199))
                           (merge-state (list btor119 btor199)))]
          [btor201 (signal (concat (signal-value btor122) (signal-value btor200))
                           (merge-state (list btor122 btor200)))]
          [btor202 (bitvector 6)]
          [btor203 (signal (concat (signal-value btor125) (signal-value btor201))
                           (merge-state (list btor125 btor201)))]
          [btor204 (bitvector 7)]
          [btor205 (signal (concat (signal-value btor128) (signal-value btor203))
                           (merge-state (list btor128 btor203)))]
          [btor206 (bitvector 8)]
          [btor207 (signal (concat (signal-value btor131) (signal-value btor205))
                           (merge-state (list btor131 btor205)))]
          [btor208 (signal (concat (signal-value btor134) (signal-value btor207))
                           (merge-state (list btor134 btor207)))]
          [btor209 (bitvector 10)]
          [btor210 (signal (concat (signal-value btor137) (signal-value btor208))
                           (merge-state (list btor137 btor208)))]
          [btor211 (bitvector 11)]
          [btor212 (signal (concat (signal-value btor140) (signal-value btor210))
                           (merge-state (list btor140 btor210)))]
          [btor213 (bitvector 12)]
          [btor214 (signal (concat (signal-value btor143) (signal-value btor212))
                           (merge-state (list btor143 btor212)))]
          [btor215 (bitvector 13)]
          [btor216 (signal (concat (signal-value btor146) (signal-value btor214))
                           (merge-state (list btor146 btor214)))]
          [btor217 (bitvector 14)]
          [btor218 (signal (concat (signal-value btor149) (signal-value btor216))
                           (merge-state (list btor149 btor216)))]
          [btor219 (bitvector 15)]
          [btor220 (signal (concat (signal-value btor152) (signal-value btor218))
                           (merge-state (list btor152 btor218)))]
          [btor221 (bitvector 16)]
          [btor222 (signal (concat (signal-value btor155) (signal-value btor220))
                           (merge-state (list btor155 btor220)))]
          [btor223 (bitvector 17)]
          [btor224 (signal (concat (signal-value btor158) (signal-value btor222))
                           (merge-state (list btor158 btor222)))]
          [btor225 (signal (concat (signal-value btor161) (signal-value btor224))
                           (merge-state (list btor161 btor224)))]
          [btor226 (bitvector 19)]
          [btor227 (signal (concat (signal-value btor164) (signal-value btor225))
                           (merge-state (list btor164 btor225)))]
          [btor228 (bitvector 20)]
          [btor229 (signal (concat (signal-value btor167) (signal-value btor227))
                           (merge-state (list btor167 btor227)))]
          [btor230 (bitvector 21)]
          [btor231 (signal (concat (signal-value btor170) (signal-value btor229))
                           (merge-state (list btor170 btor229)))]
          [btor232 (bitvector 22)]
          [btor233 (signal (concat (signal-value btor173) (signal-value btor231))
                           (merge-state (list btor173 btor231)))]
          [btor234 (bitvector 23)]
          [btor235 (signal (concat (signal-value btor176) (signal-value btor233))
                           (merge-state (list btor176 btor233)))]
          [btor236 (bitvector 24)]
          [btor237 (signal (concat (signal-value btor179) (signal-value btor235))
                           (merge-state (list btor179 btor235)))]
          [btor238 (bitvector 25)]
          [btor239 (signal (concat (signal-value btor182) (signal-value btor237))
                           (merge-state (list btor182 btor237)))]
          [btor240 (bitvector 26)]
          [btor241 (signal (concat (signal-value btor185) (signal-value btor239))
                           (merge-state (list btor185 btor239)))]
          [btor242 (signal (concat (signal-value btor188) (signal-value btor241))
                           (merge-state (list btor188 btor241)))]
          [btor243 (bitvector 28)]
          [btor244 (signal (concat (signal-value btor191) (signal-value btor242))
                           (merge-state (list btor191 btor242)))]
          [btor245 (bitvector 29)]
          [btor246 (signal (concat (signal-value btor194) (signal-value btor244))
                           (merge-state (list btor194 btor244)))]
          [btor247 (signal (concat (signal-value btor197) (signal-value btor246))
                           (merge-state (list btor197 btor246)))]
          [btor248 (bv->signal (bv 0 (bitvector 1)))]
          [btor249 (bv->signal (bv 15 (bitvector 4)))]
          [btor250 (bv->signal (zero-extend (signal-value btor249) (bitvector 5)) btor249)]
          [btor251 (signal (bool->bitvector (bveq (signal-value btor15) (signal-value btor250)))
                           (merge-state (list btor15 btor250)))]
          [btor252 (if (bitvector->bool (signal-value btor251)) btor97 btor248)]
          [btor253 (bv->signal (bv 7 (bitvector 3)))]
          [btor254 (bv->signal (zero-extend (signal-value btor253) (bitvector 5)) btor253)]
          [btor255 (signal (bool->bitvector (bveq (signal-value btor15) (signal-value btor254)))
                           (merge-state (list btor15 btor254)))]
          [btor256 (if (bitvector->bool (signal-value btor255)) btor248 btor252)]
          [btor257 (if (bitvector->bool (signal-value btor256)) btor5 btor247)]
          [btor258
           (let* ([state-value
                   (cond
                     [(hash-has-key? merged-input-state-hash 'state258)
                      (bv->signal (hash-ref merged-input-state-hash 'state258))]
                     [(hash-has-key? init-hash 'state258) (bv->signal (hash-ref init-hash 'state258))]
                     [else
                      (log-warning
                       "state ~a with no initial value, init to 0, this may not be correct in the long term"
                       'state258)
                      (bv->signal (bv 0 (bitvector 30)))])])
             (when (not (signal? state-value))
               (error "Expected signal"))
             (when (not (bv? (signal-value state-value)))
               (error "Signal value invalid"))
             state-value)]
          [btor259
           (let* ([state-value
                   (cond
                     [(hash-has-key? merged-input-state-hash 'state259)
                      (bv->signal (hash-ref merged-input-state-hash 'state259))]
                     [(hash-has-key? init-hash 'state259) (bv->signal (hash-ref init-hash 'state259))]
                     [else
                      (log-warning
                       "state ~a with no initial value, init to 0, this may not be correct in the long term"
                       'state259)
                      (bv->signal (bv 0 (bitvector 30)))])])
             (when (not (signal? state-value))
               (error "Expected signal"))
             (when (not (bv? (signal-value state-value)))
               (error "Signal value invalid"))
             state-value)]
          [btor260
           (let* ([state-value
                   (cond
                     [(hash-has-key? merged-input-state-hash 'state260)
                      (bv->signal (hash-ref merged-input-state-hash 'state260))]
                     [(hash-has-key? init-hash 'state260) (bv->signal (hash-ref init-hash 'state260))]
                     [else
                      (log-warning
                       "state ~a with no initial value, init to 0, this may not be correct in the long term"
                       'state260)
                      (bv->signal (bv 0 (bitvector 1)))])])
             (when (not (signal? state-value))
               (error "Expected signal"))
             (when (not (bv? (signal-value state-value)))
               (error "Signal value invalid"))
             state-value)]
          [btor262 (signal (concat (signal-value btor102) (signal-value btor260))
                           (merge-state (list btor102 btor260)))]
          [btor263 (signal (bool->bitvector (bveq (signal-value btor262) (signal-value btor105)))
                           (merge-state (list btor262 btor105)))]
          [btor264 (if (bitvector->bool (signal-value btor263)) btor259 btor258)]
          [btor265 (signal (extract 1 0 (signal-value btor12)) (signal-state btor12))]
          [btor266 (signal (apply bvor (bitvector->bits (signal-value btor265)))
                           (signal-state btor265))]
          [btor267 (if (bitvector->bool (signal-value btor266)) btor264 btor257)]
          [btor268 (signal (extract 1 0 (signal-value btor4)) (signal-state btor4))]
          [btor269 (signal (bool->bitvector (bveq (signal-value btor268) (signal-value btor265)))
                           (merge-state (list btor268 btor265)))]
          [btor270 (if (bitvector->bool (signal-value btor269)) btor267 btor107)]
          [btor272
           (let* ([state-value
                   (cond
                     [(hash-has-key? merged-input-state-hash 'state272)
                      (bv->signal (hash-ref merged-input-state-hash 'state272))]
                     [(hash-has-key? init-hash 'state272) (bv->signal (hash-ref init-hash 'state272))]
                     [else
                      (log-warning
                       "state ~a with no initial value, init to 0, this may not be correct in the long term"
                       'state272)
                      (bv->signal (bv 0 (bitvector 18)))])])
             (when (not (signal? state-value))
               (error "Expected signal"))
             (when (not (bv? (signal-value state-value)))
               (error "Signal value invalid"))
             state-value)]
          [btor273
           (let* ([state-value
                   (cond
                     [(hash-has-key? merged-input-state-hash 'state273)
                      (bv->signal (hash-ref merged-input-state-hash 'state273))]
                     [(hash-has-key? init-hash 'state273) (bv->signal (hash-ref init-hash 'state273))]
                     [else
                      (log-warning
                       "state ~a with no initial value, init to 0, this may not be correct in the long term"
                       'state273)
                      (bv->signal (bv 0 (bitvector 18)))])])
             (when (not (signal? state-value))
               (error "Expected signal"))
             (when (not (bv? (signal-value state-value)))
               (error "Signal value invalid"))
             state-value)]
          [btor274
           (let* ([state-value
                   (cond
                     [(hash-has-key? merged-input-state-hash 'state274)
                      (bv->signal (hash-ref merged-input-state-hash 'state274))]
                     [(hash-has-key? init-hash 'state274) (bv->signal (hash-ref init-hash 'state274))]
                     [else
                      (log-warning
                       "state ~a with no initial value, init to 0, this may not be correct in the long term"
                       'state274)
                      (bv->signal (bv 0 (bitvector 1)))])])
             (when (not (signal? state-value))
               (error "Expected signal"))
             (when (not (bv? (signal-value state-value)))
               (error "Signal value invalid"))
             state-value)]
          [btor276 (signal (concat (signal-value btor102) (signal-value btor274))
                           (merge-state (list btor102 btor274)))]
          [btor277 (signal (bool->bitvector (bveq (signal-value btor276) (signal-value btor105)))
                           (merge-state (list btor276 btor105)))]
          [btor278 (if (bitvector->bool (signal-value btor277)) btor273 btor272)]
          [btor279 (signal (extract 0 0 (signal-value btor17)) (signal-state btor17))]
          [btor280 (signal (bool->bitvector (bveq (signal-value btor279) (signal-value btor97)))
                           (merge-state (list btor279 btor97)))]
          [btor281 (signal (bvor (signal-value btor280) (signal-value btor279))
                           (merge-state (list btor280 btor279)))]
          [btor282 (signal (extract 1 1 (signal-value btor17)) (signal-state btor17))]
          [btor283 (signal (bool->bitvector (bveq (signal-value btor282) (signal-value btor97)))
                           (merge-state (list btor282 btor97)))]
          [btor284 (signal (bvor (signal-value btor283) (signal-value btor282))
                           (merge-state (list btor283 btor282)))]
          [btor285 (signal (extract 2 2 (signal-value btor17)) (signal-state btor17))]
          [btor286 (signal (bool->bitvector (bveq (signal-value btor285) (signal-value btor97)))
                           (merge-state (list btor285 btor97)))]
          [btor287 (signal (bvor (signal-value btor286) (signal-value btor285))
                           (merge-state (list btor286 btor285)))]
          [btor288 (signal (extract 3 3 (signal-value btor17)) (signal-state btor17))]
          [btor289 (signal (bool->bitvector (bveq (signal-value btor288) (signal-value btor97)))
                           (merge-state (list btor288 btor97)))]
          [btor290 (signal (bvor (signal-value btor289) (signal-value btor288))
                           (merge-state (list btor289 btor288)))]
          [btor291 (signal (extract 4 4 (signal-value btor17)) (signal-state btor17))]
          [btor292 (signal (bool->bitvector (bveq (signal-value btor291) (signal-value btor97)))
                           (merge-state (list btor291 btor97)))]
          [btor293 (signal (bvor (signal-value btor292) (signal-value btor291))
                           (merge-state (list btor292 btor291)))]
          [btor294 (signal (extract 5 5 (signal-value btor17)) (signal-state btor17))]
          [btor295 (signal (bool->bitvector (bveq (signal-value btor294) (signal-value btor97)))
                           (merge-state (list btor294 btor97)))]
          [btor296 (signal (bvor (signal-value btor295) (signal-value btor294))
                           (merge-state (list btor295 btor294)))]
          [btor297 (signal (extract 6 6 (signal-value btor17)) (signal-state btor17))]
          [btor298 (signal (bool->bitvector (bveq (signal-value btor297) (signal-value btor97)))
                           (merge-state (list btor297 btor97)))]
          [btor299 (signal (bvor (signal-value btor298) (signal-value btor297))
                           (merge-state (list btor298 btor297)))]
          [btor300 (signal (extract 7 7 (signal-value btor17)) (signal-state btor17))]
          [btor301 (signal (bool->bitvector (bveq (signal-value btor300) (signal-value btor97)))
                           (merge-state (list btor300 btor97)))]
          [btor302 (signal (bvor (signal-value btor301) (signal-value btor300))
                           (merge-state (list btor301 btor300)))]
          [btor303 (signal (extract 8 8 (signal-value btor17)) (signal-state btor17))]
          [btor304 (signal (bool->bitvector (bveq (signal-value btor303) (signal-value btor97)))
                           (merge-state (list btor303 btor97)))]
          [btor305 (signal (bvor (signal-value btor304) (signal-value btor303))
                           (merge-state (list btor304 btor303)))]
          [btor306 (signal (extract 9 9 (signal-value btor17)) (signal-state btor17))]
          [btor307 (signal (bool->bitvector (bveq (signal-value btor306) (signal-value btor97)))
                           (merge-state (list btor306 btor97)))]
          [btor308 (signal (bvor (signal-value btor307) (signal-value btor306))
                           (merge-state (list btor307 btor306)))]
          [btor309 (signal (extract 10 10 (signal-value btor17)) (signal-state btor17))]
          [btor310 (signal (bool->bitvector (bveq (signal-value btor309) (signal-value btor97)))
                           (merge-state (list btor309 btor97)))]
          [btor311 (signal (bvor (signal-value btor310) (signal-value btor309))
                           (merge-state (list btor310 btor309)))]
          [btor312 (signal (extract 11 11 (signal-value btor17)) (signal-state btor17))]
          [btor313 (signal (bool->bitvector (bveq (signal-value btor312) (signal-value btor97)))
                           (merge-state (list btor312 btor97)))]
          [btor314 (signal (bvor (signal-value btor313) (signal-value btor312))
                           (merge-state (list btor313 btor312)))]
          [btor315 (signal (extract 12 12 (signal-value btor17)) (signal-state btor17))]
          [btor316 (signal (bool->bitvector (bveq (signal-value btor315) (signal-value btor97)))
                           (merge-state (list btor315 btor97)))]
          [btor317 (signal (bvor (signal-value btor316) (signal-value btor315))
                           (merge-state (list btor316 btor315)))]
          [btor318 (signal (extract 13 13 (signal-value btor17)) (signal-state btor17))]
          [btor319 (signal (bool->bitvector (bveq (signal-value btor318) (signal-value btor97)))
                           (merge-state (list btor318 btor97)))]
          [btor320 (signal (bvor (signal-value btor319) (signal-value btor318))
                           (merge-state (list btor319 btor318)))]
          [btor321 (signal (extract 14 14 (signal-value btor17)) (signal-state btor17))]
          [btor322 (signal (bool->bitvector (bveq (signal-value btor321) (signal-value btor97)))
                           (merge-state (list btor321 btor97)))]
          [btor323 (signal (bvor (signal-value btor322) (signal-value btor321))
                           (merge-state (list btor322 btor321)))]
          [btor324 (signal (extract 15 15 (signal-value btor17)) (signal-state btor17))]
          [btor325 (signal (bool->bitvector (bveq (signal-value btor324) (signal-value btor97)))
                           (merge-state (list btor324 btor97)))]
          [btor326 (signal (bvor (signal-value btor325) (signal-value btor324))
                           (merge-state (list btor325 btor324)))]
          [btor327 (signal (extract 16 16 (signal-value btor17)) (signal-state btor17))]
          [btor328 (signal (bool->bitvector (bveq (signal-value btor327) (signal-value btor97)))
                           (merge-state (list btor327 btor97)))]
          [btor329 (signal (bvor (signal-value btor328) (signal-value btor327))
                           (merge-state (list btor328 btor327)))]
          [btor330 (signal (extract 17 17 (signal-value btor17)) (signal-state btor17))]
          [btor331 (signal (bool->bitvector (bveq (signal-value btor330) (signal-value btor97)))
                           (merge-state (list btor330 btor97)))]
          [btor332 (signal (bvor (signal-value btor331) (signal-value btor330))
                           (merge-state (list btor331 btor330)))]
          [btor333 (signal (concat (signal-value btor284) (signal-value btor281))
                           (merge-state (list btor284 btor281)))]
          [btor334 (signal (concat (signal-value btor287) (signal-value btor333))
                           (merge-state (list btor287 btor333)))]
          [btor335 (signal (concat (signal-value btor290) (signal-value btor334))
                           (merge-state (list btor290 btor334)))]
          [btor336 (signal (concat (signal-value btor293) (signal-value btor335))
                           (merge-state (list btor293 btor335)))]
          [btor337 (signal (concat (signal-value btor296) (signal-value btor336))
                           (merge-state (list btor296 btor336)))]
          [btor338 (signal (concat (signal-value btor299) (signal-value btor337))
                           (merge-state (list btor299 btor337)))]
          [btor339 (signal (concat (signal-value btor302) (signal-value btor338))
                           (merge-state (list btor302 btor338)))]
          [btor340 (signal (concat (signal-value btor305) (signal-value btor339))
                           (merge-state (list btor305 btor339)))]
          [btor341 (signal (concat (signal-value btor308) (signal-value btor340))
                           (merge-state (list btor308 btor340)))]
          [btor342 (signal (concat (signal-value btor311) (signal-value btor341))
                           (merge-state (list btor311 btor341)))]
          [btor343 (signal (concat (signal-value btor314) (signal-value btor342))
                           (merge-state (list btor314 btor342)))]
          [btor344 (signal (concat (signal-value btor317) (signal-value btor343))
                           (merge-state (list btor317 btor343)))]
          [btor345 (signal (concat (signal-value btor320) (signal-value btor344))
                           (merge-state (list btor320 btor344)))]
          [btor346 (signal (concat (signal-value btor323) (signal-value btor345))
                           (merge-state (list btor323 btor345)))]
          [btor347 (signal (concat (signal-value btor326) (signal-value btor346))
                           (merge-state (list btor326 btor346)))]
          [btor348 (signal (concat (signal-value btor329) (signal-value btor347))
                           (merge-state (list btor329 btor347)))]
          [btor349 (signal (concat (signal-value btor332) (signal-value btor348))
                           (merge-state (list btor332 btor348)))]
          [btor350 (bv->signal (zero-extend (signal-value btor249) (bitvector 5)) btor249)]
          [btor351 (signal (bool->bitvector (bveq (signal-value btor22) (signal-value btor350)))
                           (merge-state (list btor22 btor350)))]
          [btor352 (if (bitvector->bool (signal-value btor351)) btor97 btor248)]
          [btor353 (bv->signal (zero-extend (signal-value btor253) (bitvector 5)) btor253)]
          [btor354 (signal (bool->bitvector (bveq (signal-value btor22) (signal-value btor353)))
                           (merge-state (list btor22 btor353)))]
          [btor355 (if (bitvector->bool (signal-value btor354)) btor248 btor352)]
          [btor356 (if (bitvector->bool (signal-value btor355)) btor19 btor349)]
          [btor357
           (let* ([state-value
                   (cond
                     [(hash-has-key? merged-input-state-hash 'state357)
                      (bv->signal (hash-ref merged-input-state-hash 'state357))]
                     [(hash-has-key? init-hash 'state357) (bv->signal (hash-ref init-hash 'state357))]
                     [else
                      (log-warning
                       "state ~a with no initial value, init to 0, this may not be correct in the long term"
                       'state357)
                      (bv->signal (bv 0 (bitvector 18)))])])
             (when (not (signal? state-value))
               (error "Expected signal"))
             (when (not (bv? (signal-value state-value)))
               (error "Signal value invalid"))
             state-value)]
          [btor358
           (let* ([state-value
                   (cond
                     [(hash-has-key? merged-input-state-hash 'state358)
                      (bv->signal (hash-ref merged-input-state-hash 'state358))]
                     [(hash-has-key? init-hash 'state358) (bv->signal (hash-ref init-hash 'state358))]
                     [else
                      (log-warning
                       "state ~a with no initial value, init to 0, this may not be correct in the long term"
                       'state358)
                      (bv->signal (bv 0 (bitvector 18)))])])
             (when (not (signal? state-value))
               (error "Expected signal"))
             (when (not (bv? (signal-value state-value)))
               (error "Signal value invalid"))
             state-value)]
          [btor359
           (let* ([state-value
                   (cond
                     [(hash-has-key? merged-input-state-hash 'state359)
                      (bv->signal (hash-ref merged-input-state-hash 'state359))]
                     [(hash-has-key? init-hash 'state359) (bv->signal (hash-ref init-hash 'state359))]
                     [else
                      (log-warning
                       "state ~a with no initial value, init to 0, this may not be correct in the long term"
                       'state359)
                      (bv->signal (bv 0 (bitvector 1)))])])
             (when (not (signal? state-value))
               (error "Expected signal"))
             (when (not (bv? (signal-value state-value)))
               (error "Signal value invalid"))
             state-value)]
          [btor361 (signal (concat (signal-value btor102) (signal-value btor359))
                           (merge-state (list btor102 btor359)))]
          [btor362 (signal (bool->bitvector (bveq (signal-value btor361) (signal-value btor105)))
                           (merge-state (list btor361 btor105)))]
          [btor363 (if (bitvector->bool (signal-value btor362)) btor358 btor357)]
          [btor364 (signal (extract 1 0 (signal-value btor21)) (signal-state btor21))]
          [btor365 (signal (apply bvor (bitvector->bits (signal-value btor364)))
                           (signal-state btor364))]
          [btor366 (if (bitvector->bool (signal-value btor365)) btor363 btor356)]
          [btor367 (signal (extract 1 0 (signal-value btor18)) (signal-state btor18))]
          [btor368 (signal (bool->bitvector (bveq (signal-value btor367) (signal-value btor364)))
                           (merge-state (list btor367 btor364)))]
          [btor369 (if (bitvector->bool (signal-value btor368)) btor366 btor278)]
          [btor371 (signal (extract 0 0 (signal-value btor8)) (signal-state btor8))]
          [btor372 (signal (bool->bitvector ((compose1 not bveq) (signal-value btor371)
                                                                 (signal-value btor97)))
                           (merge-state (list btor371 btor97)))]
          [btor373 (signal (extract 0 0 (signal-value btor52)) (signal-state btor52))]
          [btor374 (signal (bvxor (signal-value btor371) (signal-value btor373))
                           (merge-state (list btor371 btor373)))]
          [btor375 (signal (bvand (signal-value btor372) (signal-value btor374))
                           (merge-state (list btor372 btor374)))]
          [btor376 (signal (extract 1 1 (signal-value btor8)) (signal-state btor8))]
          [btor377 (signal (bool->bitvector ((compose1 not bveq) (signal-value btor376)
                                                                 (signal-value btor97)))
                           (merge-state (list btor376 btor97)))]
          [btor378 (signal (extract 1 1 (signal-value btor52)) (signal-state btor52))]
          [btor379 (signal (bvxor (signal-value btor376) (signal-value btor378))
                           (merge-state (list btor376 btor378)))]
          [btor380 (signal (bvand (signal-value btor377) (signal-value btor379))
                           (merge-state (list btor377 btor379)))]
          [btor381 (signal (extract 2 2 (signal-value btor8)) (signal-state btor8))]
          [btor382 (signal (bool->bitvector ((compose1 not bveq) (signal-value btor381)
                                                                 (signal-value btor97)))
                           (merge-state (list btor381 btor97)))]
          [btor383 (signal (extract 2 2 (signal-value btor52)) (signal-state btor52))]
          [btor384 (signal (bvxor (signal-value btor381) (signal-value btor383))
                           (merge-state (list btor381 btor383)))]
          [btor385 (signal (bvand (signal-value btor382) (signal-value btor384))
                           (merge-state (list btor382 btor384)))]
          [btor386 (signal (extract 3 3 (signal-value btor8)) (signal-state btor8))]
          [btor387 (signal (bool->bitvector ((compose1 not bveq) (signal-value btor386)
                                                                 (signal-value btor97)))
                           (merge-state (list btor386 btor97)))]
          [btor388 (signal (extract 3 3 (signal-value btor52)) (signal-state btor52))]
          [btor389 (signal (bvxor (signal-value btor386) (signal-value btor388))
                           (merge-state (list btor386 btor388)))]
          [btor390 (signal (bvand (signal-value btor387) (signal-value btor389))
                           (merge-state (list btor387 btor389)))]
          [btor391 (signal (concat (signal-value btor380) (signal-value btor375))
                           (merge-state (list btor380 btor375)))]
          [btor392 (signal (concat (signal-value btor385) (signal-value btor391))
                           (merge-state (list btor385 btor391)))]
          [btor393 (signal (concat (signal-value btor390) (signal-value btor392))
                           (merge-state (list btor390 btor392)))]
          [btor394
           (let* ([state-value
                   (cond
                     [(hash-has-key? merged-input-state-hash 'state394)
                      (bv->signal (hash-ref merged-input-state-hash 'state394))]
                     [(hash-has-key? init-hash 'state394) (bv->signal (hash-ref init-hash 'state394))]
                     [else
                      (log-warning
                       "state ~a with no initial value, init to 0, this may not be correct in the long term"
                       'state394)
                      (bv->signal (bv 0 (bitvector 4)))])])
             (when (not (signal? state-value))
               (error "Expected signal"))
             (when (not (bv? (signal-value state-value)))
               (error "Signal value invalid"))
             state-value)]
          [btor395
           (let* ([state-value
                   (cond
                     [(hash-has-key? merged-input-state-hash 'state395)
                      (bv->signal (hash-ref merged-input-state-hash 'state395))]
                     [(hash-has-key? init-hash 'state395) (bv->signal (hash-ref init-hash 'state395))]
                     [else
                      (log-warning
                       "state ~a with no initial value, init to 0, this may not be correct in the long term"
                       'state395)
                      (bv->signal (bv 0 (bitvector 4)))])])
             (when (not (signal? state-value))
               (error "Expected signal"))
             (when (not (bv? (signal-value state-value)))
               (error "Signal value invalid"))
             state-value)]
          [btor396
           (let* ([state-value
                   (cond
                     [(hash-has-key? merged-input-state-hash 'state396)
                      (bv->signal (hash-ref merged-input-state-hash 'state396))]
                     [(hash-has-key? init-hash 'state396) (bv->signal (hash-ref init-hash 'state396))]
                     [else
                      (log-warning
                       "state ~a with no initial value, init to 0, this may not be correct in the long term"
                       'state396)
                      (bv->signal (bv 0 (bitvector 1)))])])
             (when (not (signal? state-value))
               (error "Expected signal"))
             (when (not (bv? (signal-value state-value)))
               (error "Signal value invalid"))
             state-value)]
          [btor398 (signal (concat (signal-value btor102) (signal-value btor396))
                           (merge-state (list btor102 btor396)))]
          [btor399 (signal (bool->bitvector (bveq (signal-value btor398) (signal-value btor105)))
                           (merge-state (list btor398 btor105)))]
          [btor400 (if (bitvector->bool (signal-value btor399)) btor395 btor394)]
          [btor401 (signal (extract 0 0 (signal-value btor9)) (signal-state btor9))]
          [btor402 (if (bitvector->bool (signal-value btor401)) btor400 btor393)]
          [btor403 (signal (extract 0 0 (signal-value btor402)) (signal-state btor402))]
          [btor404 (signal (extract 1 1 (signal-value btor402)) (signal-state btor402))]
          [btor405 (signal (bvand (signal-value btor403) (signal-value btor404))
                           (merge-state (list btor403 btor404)))]
          [btor406 (bv->signal (bv 0 (bitvector 2)))]
          [btor407 (bv->signal (bv 25 (bitvector 5)))]
          [btor408 (signal (bool->bitvector (bveq (signal-value btor92) (signal-value btor407)))
                           (merge-state (list btor92 btor407)))]
          [btor409 (if (bitvector->bool (signal-value btor408)) btor105 btor406)]
          [btor410 (bv->signal (bv 1 (bitvector 2)))]
          [btor411 (bv->signal (bv 19 (bitvector 5)))]
          [btor412 (signal (bool->bitvector (bveq (signal-value btor92) (signal-value btor411)))
                           (merge-state (list btor92 btor411)))]
          [btor413 (if (bitvector->bool (signal-value btor412)) btor410 btor409)]
          [btor414 (bv->signal (bv 12 (bitvector 4)))]
          [btor415 (bv->signal (zero-extend (signal-value btor414) (bitvector 5)) btor414)]
          [btor416 (signal (bool->bitvector (bveq (signal-value btor92) (signal-value btor415)))
                           (merge-state (list btor92 btor415)))]
          [btor417 (if (bitvector->bool (signal-value btor416)) btor406 btor413)]
          [btor418 (bv->signal (zero-extend (signal-value btor97) (bitvector 2)) btor97)]
          [btor419 (signal (bool->bitvector ((compose1 not bveq) (signal-value btor417)
                                                                 (signal-value btor418)))
                           (merge-state (list btor417 btor418)))]
          [btor420 (signal (extract 0 0 (signal-value btor402)) (signal-state btor402))]
          [btor421 (signal (extract 0 0 (signal-value btor402)) (signal-state btor402))]
          [btor422 (signal (concat (signal-value btor421) (signal-value btor420))
                           (merge-state (list btor421 btor420)))]
          [btor423 (signal (extract 0 0 (signal-value btor402)) (signal-state btor402))]
          [btor424 (signal (concat (signal-value btor423) (signal-value btor422))
                           (merge-state (list btor423 btor422)))]
          [btor425 (signal (extract 0 0 (signal-value btor402)) (signal-state btor402))]
          [btor426 (signal (concat (signal-value btor425) (signal-value btor424))
                           (merge-state (list btor425 btor424)))]
          [btor427 (signal (extract 0 0 (signal-value btor402)) (signal-state btor402))]
          [btor428 (signal (concat (signal-value btor427) (signal-value btor426))
                           (merge-state (list btor427 btor426)))]
          [btor429 (signal (extract 0 0 (signal-value btor402)) (signal-state btor402))]
          [btor430 (signal (concat (signal-value btor429) (signal-value btor428))
                           (merge-state (list btor429 btor428)))]
          [btor431 (signal (extract 0 0 (signal-value btor402)) (signal-state btor402))]
          [btor432 (signal (concat (signal-value btor431) (signal-value btor430))
                           (merge-state (list btor431 btor430)))]
          [btor433 (signal (extract 0 0 (signal-value btor402)) (signal-state btor402))]
          [btor434 (signal (concat (signal-value btor433) (signal-value btor432))
                           (merge-state (list btor433 btor432)))]
          [btor435 (signal (extract 0 0 (signal-value btor402)) (signal-state btor402))]
          [btor436 (signal (concat (signal-value btor435) (signal-value btor434))
                           (merge-state (list btor435 btor434)))]
          [btor437 (signal (extract 0 0 (signal-value btor402)) (signal-state btor402))]
          [btor438 (signal (concat (signal-value btor437) (signal-value btor436))
                           (merge-state (list btor437 btor436)))]
          [btor439 (signal (extract 0 0 (signal-value btor402)) (signal-state btor402))]
          [btor440 (signal (concat (signal-value btor439) (signal-value btor438))
                           (merge-state (list btor439 btor438)))]
          [btor441 (signal (extract 0 0 (signal-value btor402)) (signal-state btor402))]
          [btor442 (signal (concat (signal-value btor441) (signal-value btor440))
                           (merge-state (list btor441 btor440)))]
          [btor443 (signal (extract 0 0 (signal-value btor402)) (signal-state btor402))]
          [btor444 (signal (concat (signal-value btor443) (signal-value btor442))
                           (merge-state (list btor443 btor442)))]
          [btor445 (signal (extract 0 0 (signal-value btor402)) (signal-state btor402))]
          [btor446 (signal (concat (signal-value btor445) (signal-value btor444))
                           (merge-state (list btor445 btor444)))]
          [btor447 (signal (extract 0 0 (signal-value btor402)) (signal-state btor402))]
          [btor448 (signal (concat (signal-value btor447) (signal-value btor446))
                           (merge-state (list btor447 btor446)))]
          [btor449 (signal (extract 0 0 (signal-value btor402)) (signal-state btor402))]
          [btor450 (signal (concat (signal-value btor449) (signal-value btor448))
                           (merge-state (list btor449 btor448)))]
          [btor451 (signal (extract 0 0 (signal-value btor402)) (signal-state btor402))]
          [btor452 (signal (concat (signal-value btor451) (signal-value btor450))
                           (merge-state (list btor451 btor450)))]
          [btor453 (signal (extract 0 0 (signal-value btor402)) (signal-state btor402))]
          [btor454 (signal (concat (signal-value btor453) (signal-value btor452))
                           (merge-state (list btor453 btor452)))]
          [btor455 (signal (extract 0 0 (signal-value btor402)) (signal-state btor402))]
          [btor456 (signal (concat (signal-value btor455) (signal-value btor454))
                           (merge-state (list btor455 btor454)))]
          [btor457 (signal (extract 0 0 (signal-value btor402)) (signal-state btor402))]
          [btor458 (signal (concat (signal-value btor457) (signal-value btor456))
                           (merge-state (list btor457 btor456)))]
          [btor459 (signal (extract 0 0 (signal-value btor402)) (signal-state btor402))]
          [btor460 (signal (concat (signal-value btor459) (signal-value btor458))
                           (merge-state (list btor459 btor458)))]
          [btor461 (signal (extract 0 0 (signal-value btor402)) (signal-state btor402))]
          [btor462 (signal (concat (signal-value btor461) (signal-value btor460))
                           (merge-state (list btor461 btor460)))]
          [btor463 (signal (extract 0 0 (signal-value btor402)) (signal-state btor402))]
          [btor464 (signal (concat (signal-value btor463) (signal-value btor462))
                           (merge-state (list btor463 btor462)))]
          [btor465 (signal (extract 0 0 (signal-value btor402)) (signal-state btor402))]
          [btor466 (signal (concat (signal-value btor465) (signal-value btor464))
                           (merge-state (list btor465 btor464)))]
          [btor467 (signal (extract 0 0 (signal-value btor402)) (signal-state btor402))]
          [btor468 (signal (concat (signal-value btor467) (signal-value btor466))
                           (merge-state (list btor467 btor466)))]
          [btor469 (signal (extract 0 0 (signal-value btor402)) (signal-state btor402))]
          [btor470 (signal (concat (signal-value btor469) (signal-value btor468))
                           (merge-state (list btor469 btor468)))]
          [btor471 (signal (extract 0 0 (signal-value btor402)) (signal-state btor402))]
          [btor472 (signal (concat (signal-value btor471) (signal-value btor470))
                           (merge-state (list btor471 btor470)))]
          [btor473 (signal (extract 0 0 (signal-value btor402)) (signal-state btor402))]
          [btor474 (signal (concat (signal-value btor473) (signal-value btor472))
                           (merge-state (list btor473 btor472)))]
          [btor475 (signal (extract 0 0 (signal-value btor402)) (signal-state btor402))]
          [btor476 (signal (concat (signal-value btor475) (signal-value btor474))
                           (merge-state (list btor475 btor474)))]
          [btor477 (signal (extract 0 0 (signal-value btor402)) (signal-state btor402))]
          [btor478 (signal (concat (signal-value btor477) (signal-value btor476))
                           (merge-state (list btor477 btor476)))]
          [btor479 (signal (extract 0 0 (signal-value btor402)) (signal-state btor402))]
          [btor480 (bitvector 31)]
          [btor481 (signal (concat (signal-value btor479) (signal-value btor478))
                           (merge-state (list btor479 btor478)))]
          [btor482 (signal (extract 0 0 (signal-value btor402)) (signal-state btor402))]
          [btor483 (signal (concat (signal-value btor482) (signal-value btor481))
                           (merge-state (list btor482 btor481)))]
          [btor484 (signal (extract 0 0 (signal-value btor402)) (signal-state btor402))]
          [btor485 (bitvector 33)]
          [btor486 (signal (concat (signal-value btor484) (signal-value btor483))
                           (merge-state (list btor484 btor483)))]
          [btor487 (signal (extract 0 0 (signal-value btor402)) (signal-state btor402))]
          [btor488 (bitvector 34)]
          [btor489 (signal (concat (signal-value btor487) (signal-value btor486))
                           (merge-state (list btor487 btor486)))]
          [btor490 (signal (extract 0 0 (signal-value btor402)) (signal-state btor402))]
          [btor491 (bitvector 35)]
          [btor492 (signal (concat (signal-value btor490) (signal-value btor489))
                           (merge-state (list btor490 btor489)))]
          [btor493 (signal (extract 0 0 (signal-value btor402)) (signal-state btor402))]
          [btor494 (bitvector 36)]
          [btor495 (signal (concat (signal-value btor493) (signal-value btor492))
                           (merge-state (list btor493 btor492)))]
          [btor496 (signal (extract 0 0 (signal-value btor402)) (signal-state btor402))]
          [btor497 (bitvector 37)]
          [btor498 (signal (concat (signal-value btor496) (signal-value btor495))
                           (merge-state (list btor496 btor495)))]
          [btor499 (signal (extract 0 0 (signal-value btor402)) (signal-state btor402))]
          [btor500 (bitvector 38)]
          [btor501 (signal (concat (signal-value btor499) (signal-value btor498))
                           (merge-state (list btor499 btor498)))]
          [btor502 (signal (extract 0 0 (signal-value btor402)) (signal-state btor402))]
          [btor503 (bitvector 39)]
          [btor504 (signal (concat (signal-value btor502) (signal-value btor501))
                           (merge-state (list btor502 btor501)))]
          [btor505 (signal (extract 0 0 (signal-value btor402)) (signal-state btor402))]
          [btor506 (bitvector 40)]
          [btor507 (signal (concat (signal-value btor505) (signal-value btor504))
                           (merge-state (list btor505 btor504)))]
          [btor508 (signal (extract 0 0 (signal-value btor402)) (signal-state btor402))]
          [btor509 (bitvector 41)]
          [btor510 (signal (concat (signal-value btor508) (signal-value btor507))
                           (merge-state (list btor508 btor507)))]
          [btor511 (signal (extract 0 0 (signal-value btor402)) (signal-state btor402))]
          [btor512 (bitvector 42)]
          [btor513 (signal (concat (signal-value btor511) (signal-value btor510))
                           (merge-state (list btor511 btor510)))]
          [btor514 (signal (extract 0 0 (signal-value btor402)) (signal-state btor402))]
          [btor515 (bitvector 43)]
          [btor516 (signal (concat (signal-value btor514) (signal-value btor513))
                           (merge-state (list btor514 btor513)))]
          [btor517 (signal (extract 0 0 (signal-value btor402)) (signal-state btor402))]
          [btor518 (bitvector 44)]
          [btor519 (signal (concat (signal-value btor517) (signal-value btor516))
                           (merge-state (list btor517 btor516)))]
          [btor520 (signal (extract 0 0 (signal-value btor402)) (signal-state btor402))]
          [btor521 (bitvector 45)]
          [btor522 (signal (concat (signal-value btor520) (signal-value btor519))
                           (merge-state (list btor520 btor519)))]
          [btor523 (signal (extract 0 0 (signal-value btor402)) (signal-state btor402))]
          [btor524 (bitvector 46)]
          [btor525 (signal (concat (signal-value btor523) (signal-value btor522))
                           (merge-state (list btor523 btor522)))]
          [btor526 (signal (extract 0 0 (signal-value btor402)) (signal-state btor402))]
          [btor527 (bitvector 47)]
          [btor528 (signal (concat (signal-value btor526) (signal-value btor525))
                           (merge-state (list btor526 btor525)))]
          [btor529 (signal (extract 0 0 (signal-value btor402)) (signal-state btor402))]
          [btor530 (signal (concat (signal-value btor529) (signal-value btor528))
                           (merge-state (list btor529 btor528)))]
          [btor531 unnamed-input-531]
          [btor532
           (let* ([state-value
                   (cond
                     [(hash-has-key? merged-input-state-hash 'state532)
                      (bv->signal (hash-ref merged-input-state-hash 'state532))]
                     [(hash-has-key? init-hash 'state532) (bv->signal (hash-ref init-hash 'state532))]
                     [else
                      (log-warning
                       "state ~a with no initial value, init to 0, this may not be correct in the long term"
                       'state532)
                      (bv->signal (bv 0 (bitvector 48)))])])
             (when (not (signal? state-value))
               (error "Expected signal"))
             (when (not (bv? (signal-value state-value)))
               (error "Signal value invalid"))
             state-value)]
          [btor533
           (let* ([state-value
                   (cond
                     [(hash-has-key? merged-input-state-hash 'state533)
                      (bv->signal (hash-ref merged-input-state-hash 'state533))]
                     [(hash-has-key? init-hash 'state533) (bv->signal (hash-ref init-hash 'state533))]
                     [else
                      (log-warning
                       "state ~a with no initial value, init to 0, this may not be correct in the long term"
                       'state533)
                      (bv->signal (bv 0 (bitvector 48)))])])
             (when (not (signal? state-value))
               (error "Expected signal"))
             (when (not (bv? (signal-value state-value)))
               (error "Signal value invalid"))
             state-value)]
          [btor534
           (let* ([state-value
                   (cond
                     [(hash-has-key? merged-input-state-hash 'state534)
                      (bv->signal (hash-ref merged-input-state-hash 'state534))]
                     [(hash-has-key? init-hash 'state534) (bv->signal (hash-ref init-hash 'state534))]
                     [else
                      (log-warning
                       "state ~a with no initial value, init to 0, this may not be correct in the long term"
                       'state534)
                      (bv->signal (bv 0 (bitvector 1)))])])
             (when (not (signal? state-value))
               (error "Expected signal"))
             (when (not (bv? (signal-value state-value)))
               (error "Signal value invalid"))
             state-value)]
          [btor536 (signal (concat (signal-value btor102) (signal-value btor534))
                           (merge-state (list btor102 btor534)))]
          [btor537 (signal (bool->bitvector (bveq (signal-value btor536) (signal-value btor105)))
                           (merge-state (list btor536 btor105)))]
          [btor538 (if (bitvector->bool (signal-value btor537)) btor533 btor532)]
          [btor539 (signal (extract 47 17 (signal-value btor538)) (signal-state btor538))]
          [btor540 (signal (extract 47 47 (signal-value btor538)) (signal-state btor538))]
          [btor541 (signal (concat (signal-value btor540) (signal-value btor539))
                           (merge-state (list btor540 btor539)))]
          [btor542 (signal (extract 47 47 (signal-value btor538)) (signal-state btor538))]
          [btor543 (signal (concat (signal-value btor542) (signal-value btor541))
                           (merge-state (list btor542 btor541)))]
          [btor544 (signal (extract 47 47 (signal-value btor538)) (signal-state btor538))]
          [btor545 (signal (concat (signal-value btor544) (signal-value btor543))
                           (merge-state (list btor544 btor543)))]
          [btor546 (signal (extract 47 47 (signal-value btor538)) (signal-state btor538))]
          [btor547 (signal (concat (signal-value btor546) (signal-value btor545))
                           (merge-state (list btor546 btor545)))]
          [btor548 (signal (extract 47 47 (signal-value btor538)) (signal-state btor538))]
          [btor549 (signal (concat (signal-value btor548) (signal-value btor547))
                           (merge-state (list btor548 btor547)))]
          [btor550 (signal (extract 47 47 (signal-value btor538)) (signal-state btor538))]
          [btor551 (signal (concat (signal-value btor550) (signal-value btor549))
                           (merge-state (list btor550 btor549)))]
          [btor552 (signal (extract 47 47 (signal-value btor538)) (signal-state btor538))]
          [btor553 (signal (concat (signal-value btor552) (signal-value btor551))
                           (merge-state (list btor552 btor551)))]
          [btor554 (signal (extract 47 47 (signal-value btor538)) (signal-state btor538))]
          [btor555 (signal (concat (signal-value btor554) (signal-value btor553))
                           (merge-state (list btor554 btor553)))]
          [btor556 (signal (extract 47 47 (signal-value btor538)) (signal-state btor538))]
          [btor557 (signal (concat (signal-value btor556) (signal-value btor555))
                           (merge-state (list btor556 btor555)))]
          [btor558 (signal (extract 47 47 (signal-value btor538)) (signal-state btor538))]
          [btor559 (signal (concat (signal-value btor558) (signal-value btor557))
                           (merge-state (list btor558 btor557)))]
          [btor560 (signal (extract 47 47 (signal-value btor538)) (signal-state btor538))]
          [btor561 (signal (concat (signal-value btor560) (signal-value btor559))
                           (merge-state (list btor560 btor559)))]
          [btor562 (signal (extract 47 47 (signal-value btor538)) (signal-state btor538))]
          [btor563 (signal (concat (signal-value btor562) (signal-value btor561))
                           (merge-state (list btor562 btor561)))]
          [btor564 (signal (extract 47 47 (signal-value btor538)) (signal-state btor538))]
          [btor565 (signal (concat (signal-value btor564) (signal-value btor563))
                           (merge-state (list btor564 btor563)))]
          [btor566 (signal (extract 47 47 (signal-value btor538)) (signal-state btor538))]
          [btor567 (signal (concat (signal-value btor566) (signal-value btor565))
                           (merge-state (list btor566 btor565)))]
          [btor568 (signal (extract 47 47 (signal-value btor538)) (signal-state btor538))]
          [btor569 (signal (concat (signal-value btor568) (signal-value btor567))
                           (merge-state (list btor568 btor567)))]
          [btor570 (signal (extract 47 47 (signal-value btor538)) (signal-state btor538))]
          [btor571 (signal (concat (signal-value btor570) (signal-value btor569))
                           (merge-state (list btor570 btor569)))]
          [btor572 (signal (extract 47 47 (signal-value btor538)) (signal-state btor538))]
          [btor573 (signal (concat (signal-value btor572) (signal-value btor571))
                           (merge-state (list btor572 btor571)))]
          [btor574 (signal (extract 0 0 (signal-value btor71)) (signal-state btor71))]
          [btor575 (signal (bool->bitvector ((compose1 not bveq) (signal-value btor574)
                                                                 (signal-value btor97)))
                           (merge-state (list btor574 btor97)))]
          [btor576 (signal (extract 0 0 (signal-value btor57)) (signal-state btor57))]
          [btor577 (signal (bvxor (signal-value btor574) (signal-value btor576))
                           (merge-state (list btor574 btor576)))]
          [btor578 (signal (bvand (signal-value btor575) (signal-value btor577))
                           (merge-state (list btor575 btor577)))]
          [btor579 (signal (extract 1 1 (signal-value btor71)) (signal-state btor71))]
          [btor580 (signal (bool->bitvector ((compose1 not bveq) (signal-value btor579)
                                                                 (signal-value btor97)))
                           (merge-state (list btor579 btor97)))]
          [btor581 (signal (extract 1 1 (signal-value btor57)) (signal-state btor57))]
          [btor582 (signal (bvxor (signal-value btor579) (signal-value btor581))
                           (merge-state (list btor579 btor581)))]
          [btor583 (signal (bvand (signal-value btor580) (signal-value btor582))
                           (merge-state (list btor580 btor582)))]
          [btor584 (signal (extract 2 2 (signal-value btor71)) (signal-state btor71))]
          [btor585 (signal (bool->bitvector ((compose1 not bveq) (signal-value btor584)
                                                                 (signal-value btor97)))
                           (merge-state (list btor584 btor97)))]
          [btor586 (signal (extract 2 2 (signal-value btor57)) (signal-state btor57))]
          [btor587 (signal (bvxor (signal-value btor584) (signal-value btor586))
                           (merge-state (list btor584 btor586)))]
          [btor588 (signal (bvand (signal-value btor585) (signal-value btor587))
                           (merge-state (list btor585 btor587)))]
          [btor589 (signal (extract 3 3 (signal-value btor71)) (signal-state btor71))]
          [btor590 (signal (bool->bitvector ((compose1 not bveq) (signal-value btor589)
                                                                 (signal-value btor97)))
                           (merge-state (list btor589 btor97)))]
          [btor591 (signal (extract 3 3 (signal-value btor57)) (signal-state btor57))]
          [btor592 (signal (bvxor (signal-value btor589) (signal-value btor591))
                           (merge-state (list btor589 btor591)))]
          [btor593 (signal (bvand (signal-value btor590) (signal-value btor592))
                           (merge-state (list btor590 btor592)))]
          [btor594 (signal (extract 4 4 (signal-value btor71)) (signal-state btor71))]
          [btor595 (signal (bool->bitvector ((compose1 not bveq) (signal-value btor594)
                                                                 (signal-value btor97)))
                           (merge-state (list btor594 btor97)))]
          [btor596 (signal (extract 4 4 (signal-value btor57)) (signal-state btor57))]
          [btor597 (signal (bvxor (signal-value btor594) (signal-value btor596))
                           (merge-state (list btor594 btor596)))]
          [btor598 (signal (bvand (signal-value btor595) (signal-value btor597))
                           (merge-state (list btor595 btor597)))]
          [btor599 (signal (extract 5 5 (signal-value btor71)) (signal-state btor71))]
          [btor600 (signal (bool->bitvector ((compose1 not bveq) (signal-value btor599)
                                                                 (signal-value btor97)))
                           (merge-state (list btor599 btor97)))]
          [btor601 (signal (extract 5 5 (signal-value btor57)) (signal-state btor57))]
          [btor602 (signal (bvxor (signal-value btor599) (signal-value btor601))
                           (merge-state (list btor599 btor601)))]
          [btor603 (signal (bvand (signal-value btor600) (signal-value btor602))
                           (merge-state (list btor600 btor602)))]
          [btor604 (signal (extract 6 6 (signal-value btor71)) (signal-state btor71))]
          [btor605 (signal (bool->bitvector ((compose1 not bveq) (signal-value btor604)
                                                                 (signal-value btor97)))
                           (merge-state (list btor604 btor97)))]
          [btor606 (signal (extract 6 6 (signal-value btor57)) (signal-state btor57))]
          [btor607 (signal (bvxor (signal-value btor604) (signal-value btor606))
                           (merge-state (list btor604 btor606)))]
          [btor608 (signal (bvand (signal-value btor605) (signal-value btor607))
                           (merge-state (list btor605 btor607)))]
          [btor609 (signal (extract 7 7 (signal-value btor71)) (signal-state btor71))]
          [btor610 (signal (bool->bitvector ((compose1 not bveq) (signal-value btor609)
                                                                 (signal-value btor97)))
                           (merge-state (list btor609 btor97)))]
          [btor611 (signal (extract 7 7 (signal-value btor57)) (signal-state btor57))]
          [btor612 (signal (bvxor (signal-value btor609) (signal-value btor611))
                           (merge-state (list btor609 btor611)))]
          [btor613 (signal (bvand (signal-value btor610) (signal-value btor612))
                           (merge-state (list btor610 btor612)))]
          [btor614 (signal (extract 8 8 (signal-value btor71)) (signal-state btor71))]
          [btor615 (signal (bool->bitvector ((compose1 not bveq) (signal-value btor614)
                                                                 (signal-value btor97)))
                           (merge-state (list btor614 btor97)))]
          [btor616 (signal (extract 8 8 (signal-value btor57)) (signal-state btor57))]
          [btor617 (signal (bvxor (signal-value btor614) (signal-value btor616))
                           (merge-state (list btor614 btor616)))]
          [btor618 (signal (bvand (signal-value btor615) (signal-value btor617))
                           (merge-state (list btor615 btor617)))]
          [btor619 (signal (concat (signal-value btor583) (signal-value btor578))
                           (merge-state (list btor583 btor578)))]
          [btor620 (signal (concat (signal-value btor588) (signal-value btor619))
                           (merge-state (list btor588 btor619)))]
          [btor621 (signal (concat (signal-value btor593) (signal-value btor620))
                           (merge-state (list btor593 btor620)))]
          [btor622 (signal (concat (signal-value btor598) (signal-value btor621))
                           (merge-state (list btor598 btor621)))]
          [btor623 (signal (concat (signal-value btor603) (signal-value btor622))
                           (merge-state (list btor603 btor622)))]
          [btor624 (signal (concat (signal-value btor608) (signal-value btor623))
                           (merge-state (list btor608 btor623)))]
          [btor625 (signal (concat (signal-value btor613) (signal-value btor624))
                           (merge-state (list btor613 btor624)))]
          [btor626 (signal (concat (signal-value btor618) (signal-value btor625))
                           (merge-state (list btor618 btor625)))]
          [btor627
           (let* ([state-value
                   (cond
                     [(hash-has-key? merged-input-state-hash 'state627)
                      (bv->signal (hash-ref merged-input-state-hash 'state627))]
                     [(hash-has-key? init-hash 'state627) (bv->signal (hash-ref init-hash 'state627))]
                     [else
                      (log-warning
                       "state ~a with no initial value, init to 0, this may not be correct in the long term"
                       'state627)
                      (bv->signal (bv 0 (bitvector 9)))])])
             (when (not (signal? state-value))
               (error "Expected signal"))
             (when (not (bv? (signal-value state-value)))
               (error "Signal value invalid"))
             state-value)]
          [btor628
           (let* ([state-value
                   (cond
                     [(hash-has-key? merged-input-state-hash 'state628)
                      (bv->signal (hash-ref merged-input-state-hash 'state628))]
                     [(hash-has-key? init-hash 'state628) (bv->signal (hash-ref init-hash 'state628))]
                     [else
                      (log-warning
                       "state ~a with no initial value, init to 0, this may not be correct in the long term"
                       'state628)
                      (bv->signal (bv 0 (bitvector 9)))])])
             (when (not (signal? state-value))
               (error "Expected signal"))
             (when (not (bv? (signal-value state-value)))
               (error "Signal value invalid"))
             state-value)]
          [btor629
           (let* ([state-value
                   (cond
                     [(hash-has-key? merged-input-state-hash 'state629)
                      (bv->signal (hash-ref merged-input-state-hash 'state629))]
                     [(hash-has-key? init-hash 'state629) (bv->signal (hash-ref init-hash 'state629))]
                     [else
                      (log-warning
                       "state ~a with no initial value, init to 0, this may not be correct in the long term"
                       'state629)
                      (bv->signal (bv 0 (bitvector 1)))])])
             (when (not (signal? state-value))
               (error "Expected signal"))
             (when (not (bv? (signal-value state-value)))
               (error "Signal value invalid"))
             state-value)]
          [btor631 (signal (concat (signal-value btor102) (signal-value btor629))
                           (merge-state (list btor102 btor629)))]
          [btor632 (signal (bool->bitvector (bveq (signal-value btor631) (signal-value btor105)))
                           (merge-state (list btor631 btor105)))]
          [btor633 (if (bitvector->bool (signal-value btor632)) btor628 btor627)]
          [btor634 (signal (extract 0 0 (signal-value btor72)) (signal-state btor72))]
          [btor635 (if (bitvector->bool (signal-value btor634)) btor633 btor626)]
          [btor636 (signal (extract 6 5 (signal-value btor635)) (signal-state btor635))]
          [btor637 (bv->signal (bv 3 (bitvector 2)))]
          [btor638 (signal (bool->bitvector (bveq (signal-value btor636) (signal-value btor637)))
                           (merge-state (list btor636 btor637)))]
          [btor639 (if (bitvector->bool (signal-value btor638)) btor573 btor531)]
          [btor640 (signal (extract 47 17 (signal-value btor74)) (signal-state btor74))]
          [btor641 (signal (extract 47 47 (signal-value btor74)) (signal-state btor74))]
          [btor642 (signal (concat (signal-value btor641) (signal-value btor640))
                           (merge-state (list btor641 btor640)))]
          [btor643 (signal (extract 47 47 (signal-value btor74)) (signal-state btor74))]
          [btor644 (signal (concat (signal-value btor643) (signal-value btor642))
                           (merge-state (list btor643 btor642)))]
          [btor645 (signal (extract 47 47 (signal-value btor74)) (signal-state btor74))]
          [btor646 (signal (concat (signal-value btor645) (signal-value btor644))
                           (merge-state (list btor645 btor644)))]
          [btor647 (signal (extract 47 47 (signal-value btor74)) (signal-state btor74))]
          [btor648 (signal (concat (signal-value btor647) (signal-value btor646))
                           (merge-state (list btor647 btor646)))]
          [btor649 (signal (extract 47 47 (signal-value btor74)) (signal-state btor74))]
          [btor650 (signal (concat (signal-value btor649) (signal-value btor648))
                           (merge-state (list btor649 btor648)))]
          [btor651 (signal (extract 47 47 (signal-value btor74)) (signal-state btor74))]
          [btor652 (signal (concat (signal-value btor651) (signal-value btor650))
                           (merge-state (list btor651 btor650)))]
          [btor653 (signal (extract 47 47 (signal-value btor74)) (signal-state btor74))]
          [btor654 (signal (concat (signal-value btor653) (signal-value btor652))
                           (merge-state (list btor653 btor652)))]
          [btor655 (signal (extract 47 47 (signal-value btor74)) (signal-state btor74))]
          [btor656 (signal (concat (signal-value btor655) (signal-value btor654))
                           (merge-state (list btor655 btor654)))]
          [btor657 (signal (extract 47 47 (signal-value btor74)) (signal-state btor74))]
          [btor658 (signal (concat (signal-value btor657) (signal-value btor656))
                           (merge-state (list btor657 btor656)))]
          [btor659 (signal (extract 47 47 (signal-value btor74)) (signal-state btor74))]
          [btor660 (signal (concat (signal-value btor659) (signal-value btor658))
                           (merge-state (list btor659 btor658)))]
          [btor661 (signal (extract 47 47 (signal-value btor74)) (signal-state btor74))]
          [btor662 (signal (concat (signal-value btor661) (signal-value btor660))
                           (merge-state (list btor661 btor660)))]
          [btor663 (signal (extract 47 47 (signal-value btor74)) (signal-state btor74))]
          [btor664 (signal (concat (signal-value btor663) (signal-value btor662))
                           (merge-state (list btor663 btor662)))]
          [btor665 (signal (extract 47 47 (signal-value btor74)) (signal-state btor74))]
          [btor666 (signal (concat (signal-value btor665) (signal-value btor664))
                           (merge-state (list btor665 btor664)))]
          [btor667 (signal (extract 47 47 (signal-value btor74)) (signal-state btor74))]
          [btor668 (signal (concat (signal-value btor667) (signal-value btor666))
                           (merge-state (list btor667 btor666)))]
          [btor669 (signal (extract 47 47 (signal-value btor74)) (signal-state btor74))]
          [btor670 (signal (concat (signal-value btor669) (signal-value btor668))
                           (merge-state (list btor669 btor668)))]
          [btor671 (signal (extract 47 47 (signal-value btor74)) (signal-state btor74))]
          [btor672 (signal (concat (signal-value btor671) (signal-value btor670))
                           (merge-state (list btor671 btor670)))]
          [btor673 (signal (extract 47 47 (signal-value btor74)) (signal-state btor74))]
          [btor674 (signal (concat (signal-value btor673) (signal-value btor672))
                           (merge-state (list btor673 btor672)))]
          [btor675 (signal (extract 6 4 (signal-value btor635)) (signal-state btor635))]
          [btor676 (bv->signal (bv 5 (bitvector 3)))]
          [btor677 (signal (bool->bitvector (bveq (signal-value btor675) (signal-value btor676)))
                           (merge-state (list btor675 btor676)))]
          [btor678 (if (bitvector->bool (signal-value btor677)) btor674 btor639)]
          [btor679 (bv->signal (bv 4 (bitvector 3)))]
          [btor680 (signal (bool->bitvector (bveq (signal-value btor675) (signal-value btor679)))
                           (merge-state (list btor675 btor679)))]
          [btor681 (bv->signal (zero-extend (signal-value btor105) (bitvector 3)) btor105)]
          [btor682 (signal (bool->bitvector (bveq (signal-value btor675) (signal-value btor681)))
                           (merge-state (list btor675 btor681)))]
          [btor683 (signal (concat (signal-value btor682) (signal-value btor680))
                           (merge-state (list btor682 btor680)))]
          [btor684 (signal (apply bvor (bitvector->bits (signal-value btor683)))
                           (signal-state btor683))]
          [btor685 (if (bitvector->bool (signal-value btor684)) btor538 btor678)]
          [btor686 (signal (extract 0 0 (signal-value btor24)) (signal-state btor24))]
          [btor687 (signal (bool->bitvector (bveq (signal-value btor686) (signal-value btor97)))
                           (merge-state (list btor686 btor97)))]
          [btor688 (signal (bvor (signal-value btor687) (signal-value btor686))
                           (merge-state (list btor687 btor686)))]
          [btor689 (signal (extract 1 1 (signal-value btor24)) (signal-state btor24))]
          [btor690 (signal (bool->bitvector (bveq (signal-value btor689) (signal-value btor97)))
                           (merge-state (list btor689 btor97)))]
          [btor691 (signal (bvor (signal-value btor690) (signal-value btor689))
                           (merge-state (list btor690 btor689)))]
          [btor692 (signal (extract 2 2 (signal-value btor24)) (signal-state btor24))]
          [btor693 (signal (bool->bitvector (bveq (signal-value btor692) (signal-value btor97)))
                           (merge-state (list btor692 btor97)))]
          [btor694 (signal (bvor (signal-value btor693) (signal-value btor692))
                           (merge-state (list btor693 btor692)))]
          [btor695 (signal (extract 3 3 (signal-value btor24)) (signal-state btor24))]
          [btor696 (signal (bool->bitvector (bveq (signal-value btor695) (signal-value btor97)))
                           (merge-state (list btor695 btor97)))]
          [btor697 (signal (bvor (signal-value btor696) (signal-value btor695))
                           (merge-state (list btor696 btor695)))]
          [btor698 (signal (extract 4 4 (signal-value btor24)) (signal-state btor24))]
          [btor699 (signal (bool->bitvector (bveq (signal-value btor698) (signal-value btor97)))
                           (merge-state (list btor698 btor97)))]
          [btor700 (signal (bvor (signal-value btor699) (signal-value btor698))
                           (merge-state (list btor699 btor698)))]
          [btor701 (signal (extract 5 5 (signal-value btor24)) (signal-state btor24))]
          [btor702 (signal (bool->bitvector (bveq (signal-value btor701) (signal-value btor97)))
                           (merge-state (list btor701 btor97)))]
          [btor703 (signal (bvor (signal-value btor702) (signal-value btor701))
                           (merge-state (list btor702 btor701)))]
          [btor704 (signal (extract 6 6 (signal-value btor24)) (signal-state btor24))]
          [btor705 (signal (bool->bitvector (bveq (signal-value btor704) (signal-value btor97)))
                           (merge-state (list btor704 btor97)))]
          [btor706 (signal (bvor (signal-value btor705) (signal-value btor704))
                           (merge-state (list btor705 btor704)))]
          [btor707 (signal (extract 7 7 (signal-value btor24)) (signal-state btor24))]
          [btor708 (signal (bool->bitvector (bveq (signal-value btor707) (signal-value btor97)))
                           (merge-state (list btor707 btor97)))]
          [btor709 (signal (bvor (signal-value btor708) (signal-value btor707))
                           (merge-state (list btor708 btor707)))]
          [btor710 (signal (extract 8 8 (signal-value btor24)) (signal-state btor24))]
          [btor711 (signal (bool->bitvector (bveq (signal-value btor710) (signal-value btor97)))
                           (merge-state (list btor710 btor97)))]
          [btor712 (signal (bvor (signal-value btor711) (signal-value btor710))
                           (merge-state (list btor711 btor710)))]
          [btor713 (signal (extract 9 9 (signal-value btor24)) (signal-state btor24))]
          [btor714 (signal (bool->bitvector (bveq (signal-value btor713) (signal-value btor97)))
                           (merge-state (list btor713 btor97)))]
          [btor715 (signal (bvor (signal-value btor714) (signal-value btor713))
                           (merge-state (list btor714 btor713)))]
          [btor716 (signal (extract 10 10 (signal-value btor24)) (signal-state btor24))]
          [btor717 (signal (bool->bitvector (bveq (signal-value btor716) (signal-value btor97)))
                           (merge-state (list btor716 btor97)))]
          [btor718 (signal (bvor (signal-value btor717) (signal-value btor716))
                           (merge-state (list btor717 btor716)))]
          [btor719 (signal (extract 11 11 (signal-value btor24)) (signal-state btor24))]
          [btor720 (signal (bool->bitvector (bveq (signal-value btor719) (signal-value btor97)))
                           (merge-state (list btor719 btor97)))]
          [btor721 (signal (bvor (signal-value btor720) (signal-value btor719))
                           (merge-state (list btor720 btor719)))]
          [btor722 (signal (extract 12 12 (signal-value btor24)) (signal-state btor24))]
          [btor723 (signal (bool->bitvector (bveq (signal-value btor722) (signal-value btor97)))
                           (merge-state (list btor722 btor97)))]
          [btor724 (signal (bvor (signal-value btor723) (signal-value btor722))
                           (merge-state (list btor723 btor722)))]
          [btor725 (signal (extract 13 13 (signal-value btor24)) (signal-state btor24))]
          [btor726 (signal (bool->bitvector (bveq (signal-value btor725) (signal-value btor97)))
                           (merge-state (list btor725 btor97)))]
          [btor727 (signal (bvor (signal-value btor726) (signal-value btor725))
                           (merge-state (list btor726 btor725)))]
          [btor728 (signal (extract 14 14 (signal-value btor24)) (signal-state btor24))]
          [btor729 (signal (bool->bitvector (bveq (signal-value btor728) (signal-value btor97)))
                           (merge-state (list btor728 btor97)))]
          [btor730 (signal (bvor (signal-value btor729) (signal-value btor728))
                           (merge-state (list btor729 btor728)))]
          [btor731 (signal (extract 15 15 (signal-value btor24)) (signal-state btor24))]
          [btor732 (signal (bool->bitvector (bveq (signal-value btor731) (signal-value btor97)))
                           (merge-state (list btor731 btor97)))]
          [btor733 (signal (bvor (signal-value btor732) (signal-value btor731))
                           (merge-state (list btor732 btor731)))]
          [btor734 (signal (extract 16 16 (signal-value btor24)) (signal-state btor24))]
          [btor735 (signal (bool->bitvector (bveq (signal-value btor734) (signal-value btor97)))
                           (merge-state (list btor734 btor97)))]
          [btor736 (signal (bvor (signal-value btor735) (signal-value btor734))
                           (merge-state (list btor735 btor734)))]
          [btor737 (signal (extract 17 17 (signal-value btor24)) (signal-state btor24))]
          [btor738 (signal (bool->bitvector (bveq (signal-value btor737) (signal-value btor97)))
                           (merge-state (list btor737 btor97)))]
          [btor739 (signal (bvor (signal-value btor738) (signal-value btor737))
                           (merge-state (list btor738 btor737)))]
          [btor740 (signal (extract 18 18 (signal-value btor24)) (signal-state btor24))]
          [btor741 (signal (bool->bitvector (bveq (signal-value btor740) (signal-value btor97)))
                           (merge-state (list btor740 btor97)))]
          [btor742 (signal (bvor (signal-value btor741) (signal-value btor740))
                           (merge-state (list btor741 btor740)))]
          [btor743 (signal (extract 19 19 (signal-value btor24)) (signal-state btor24))]
          [btor744 (signal (bool->bitvector (bveq (signal-value btor743) (signal-value btor97)))
                           (merge-state (list btor743 btor97)))]
          [btor745 (signal (bvor (signal-value btor744) (signal-value btor743))
                           (merge-state (list btor744 btor743)))]
          [btor746 (signal (extract 20 20 (signal-value btor24)) (signal-state btor24))]
          [btor747 (signal (bool->bitvector (bveq (signal-value btor746) (signal-value btor97)))
                           (merge-state (list btor746 btor97)))]
          [btor748 (signal (bvor (signal-value btor747) (signal-value btor746))
                           (merge-state (list btor747 btor746)))]
          [btor749 (signal (extract 21 21 (signal-value btor24)) (signal-state btor24))]
          [btor750 (signal (bool->bitvector (bveq (signal-value btor749) (signal-value btor97)))
                           (merge-state (list btor749 btor97)))]
          [btor751 (signal (bvor (signal-value btor750) (signal-value btor749))
                           (merge-state (list btor750 btor749)))]
          [btor752 (signal (extract 22 22 (signal-value btor24)) (signal-state btor24))]
          [btor753 (signal (bool->bitvector (bveq (signal-value btor752) (signal-value btor97)))
                           (merge-state (list btor752 btor97)))]
          [btor754 (signal (bvor (signal-value btor753) (signal-value btor752))
                           (merge-state (list btor753 btor752)))]
          [btor755 (signal (extract 23 23 (signal-value btor24)) (signal-state btor24))]
          [btor756 (signal (bool->bitvector (bveq (signal-value btor755) (signal-value btor97)))
                           (merge-state (list btor755 btor97)))]
          [btor757 (signal (bvor (signal-value btor756) (signal-value btor755))
                           (merge-state (list btor756 btor755)))]
          [btor758 (signal (extract 24 24 (signal-value btor24)) (signal-state btor24))]
          [btor759 (signal (bool->bitvector (bveq (signal-value btor758) (signal-value btor97)))
                           (merge-state (list btor758 btor97)))]
          [btor760 (signal (bvor (signal-value btor759) (signal-value btor758))
                           (merge-state (list btor759 btor758)))]
          [btor761 (signal (extract 25 25 (signal-value btor24)) (signal-state btor24))]
          [btor762 (signal (bool->bitvector (bveq (signal-value btor761) (signal-value btor97)))
                           (merge-state (list btor761 btor97)))]
          [btor763 (signal (bvor (signal-value btor762) (signal-value btor761))
                           (merge-state (list btor762 btor761)))]
          [btor764 (signal (extract 26 26 (signal-value btor24)) (signal-state btor24))]
          [btor765 (signal (bool->bitvector (bveq (signal-value btor764) (signal-value btor97)))
                           (merge-state (list btor764 btor97)))]
          [btor766 (signal (bvor (signal-value btor765) (signal-value btor764))
                           (merge-state (list btor765 btor764)))]
          [btor767 (signal (extract 27 27 (signal-value btor24)) (signal-state btor24))]
          [btor768 (signal (bool->bitvector (bveq (signal-value btor767) (signal-value btor97)))
                           (merge-state (list btor767 btor97)))]
          [btor769 (signal (bvor (signal-value btor768) (signal-value btor767))
                           (merge-state (list btor768 btor767)))]
          [btor770 (signal (extract 28 28 (signal-value btor24)) (signal-state btor24))]
          [btor771 (signal (bool->bitvector (bveq (signal-value btor770) (signal-value btor97)))
                           (merge-state (list btor770 btor97)))]
          [btor772 (signal (bvor (signal-value btor771) (signal-value btor770))
                           (merge-state (list btor771 btor770)))]
          [btor773 (signal (extract 29 29 (signal-value btor24)) (signal-state btor24))]
          [btor774 (signal (bool->bitvector (bveq (signal-value btor773) (signal-value btor97)))
                           (merge-state (list btor773 btor97)))]
          [btor775 (signal (bvor (signal-value btor774) (signal-value btor773))
                           (merge-state (list btor774 btor773)))]
          [btor776 (signal (extract 30 30 (signal-value btor24)) (signal-state btor24))]
          [btor777 (signal (bool->bitvector (bveq (signal-value btor776) (signal-value btor97)))
                           (merge-state (list btor776 btor97)))]
          [btor778 (signal (bvor (signal-value btor777) (signal-value btor776))
                           (merge-state (list btor777 btor776)))]
          [btor779 (signal (extract 31 31 (signal-value btor24)) (signal-state btor24))]
          [btor780 (signal (bool->bitvector (bveq (signal-value btor779) (signal-value btor97)))
                           (merge-state (list btor779 btor97)))]
          [btor781 (signal (bvor (signal-value btor780) (signal-value btor779))
                           (merge-state (list btor780 btor779)))]
          [btor782 (signal (extract 32 32 (signal-value btor24)) (signal-state btor24))]
          [btor783 (signal (bool->bitvector (bveq (signal-value btor782) (signal-value btor97)))
                           (merge-state (list btor782 btor97)))]
          [btor784 (signal (bvor (signal-value btor783) (signal-value btor782))
                           (merge-state (list btor783 btor782)))]
          [btor785 (signal (extract 33 33 (signal-value btor24)) (signal-state btor24))]
          [btor786 (signal (bool->bitvector (bveq (signal-value btor785) (signal-value btor97)))
                           (merge-state (list btor785 btor97)))]
          [btor787 (signal (bvor (signal-value btor786) (signal-value btor785))
                           (merge-state (list btor786 btor785)))]
          [btor788 (signal (extract 34 34 (signal-value btor24)) (signal-state btor24))]
          [btor789 (signal (bool->bitvector (bveq (signal-value btor788) (signal-value btor97)))
                           (merge-state (list btor788 btor97)))]
          [btor790 (signal (bvor (signal-value btor789) (signal-value btor788))
                           (merge-state (list btor789 btor788)))]
          [btor791 (signal (extract 35 35 (signal-value btor24)) (signal-state btor24))]
          [btor792 (signal (bool->bitvector (bveq (signal-value btor791) (signal-value btor97)))
                           (merge-state (list btor791 btor97)))]
          [btor793 (signal (bvor (signal-value btor792) (signal-value btor791))
                           (merge-state (list btor792 btor791)))]
          [btor794 (signal (extract 36 36 (signal-value btor24)) (signal-state btor24))]
          [btor795 (signal (bool->bitvector (bveq (signal-value btor794) (signal-value btor97)))
                           (merge-state (list btor794 btor97)))]
          [btor796 (signal (bvor (signal-value btor795) (signal-value btor794))
                           (merge-state (list btor795 btor794)))]
          [btor797 (signal (extract 37 37 (signal-value btor24)) (signal-state btor24))]
          [btor798 (signal (bool->bitvector (bveq (signal-value btor797) (signal-value btor97)))
                           (merge-state (list btor797 btor97)))]
          [btor799 (signal (bvor (signal-value btor798) (signal-value btor797))
                           (merge-state (list btor798 btor797)))]
          [btor800 (signal (extract 38 38 (signal-value btor24)) (signal-state btor24))]
          [btor801 (signal (bool->bitvector (bveq (signal-value btor800) (signal-value btor97)))
                           (merge-state (list btor800 btor97)))]
          [btor802 (signal (bvor (signal-value btor801) (signal-value btor800))
                           (merge-state (list btor801 btor800)))]
          [btor803 (signal (extract 39 39 (signal-value btor24)) (signal-state btor24))]
          [btor804 (signal (bool->bitvector (bveq (signal-value btor803) (signal-value btor97)))
                           (merge-state (list btor803 btor97)))]
          [btor805 (signal (bvor (signal-value btor804) (signal-value btor803))
                           (merge-state (list btor804 btor803)))]
          [btor806 (signal (extract 40 40 (signal-value btor24)) (signal-state btor24))]
          [btor807 (signal (bool->bitvector (bveq (signal-value btor806) (signal-value btor97)))
                           (merge-state (list btor806 btor97)))]
          [btor808 (signal (bvor (signal-value btor807) (signal-value btor806))
                           (merge-state (list btor807 btor806)))]
          [btor809 (signal (extract 41 41 (signal-value btor24)) (signal-state btor24))]
          [btor810 (signal (bool->bitvector (bveq (signal-value btor809) (signal-value btor97)))
                           (merge-state (list btor809 btor97)))]
          [btor811 (signal (bvor (signal-value btor810) (signal-value btor809))
                           (merge-state (list btor810 btor809)))]
          [btor812 (signal (extract 42 42 (signal-value btor24)) (signal-state btor24))]
          [btor813 (signal (bool->bitvector (bveq (signal-value btor812) (signal-value btor97)))
                           (merge-state (list btor812 btor97)))]
          [btor814 (signal (bvor (signal-value btor813) (signal-value btor812))
                           (merge-state (list btor813 btor812)))]
          [btor815 (signal (extract 43 43 (signal-value btor24)) (signal-state btor24))]
          [btor816 (signal (bool->bitvector (bveq (signal-value btor815) (signal-value btor97)))
                           (merge-state (list btor815 btor97)))]
          [btor817 (signal (bvor (signal-value btor816) (signal-value btor815))
                           (merge-state (list btor816 btor815)))]
          [btor818 (signal (extract 44 44 (signal-value btor24)) (signal-state btor24))]
          [btor819 (signal (bool->bitvector (bveq (signal-value btor818) (signal-value btor97)))
                           (merge-state (list btor818 btor97)))]
          [btor820 (signal (bvor (signal-value btor819) (signal-value btor818))
                           (merge-state (list btor819 btor818)))]
          [btor821 (signal (extract 45 45 (signal-value btor24)) (signal-state btor24))]
          [btor822 (signal (bool->bitvector (bveq (signal-value btor821) (signal-value btor97)))
                           (merge-state (list btor821 btor97)))]
          [btor823 (signal (bvor (signal-value btor822) (signal-value btor821))
                           (merge-state (list btor822 btor821)))]
          [btor824 (signal (extract 46 46 (signal-value btor24)) (signal-state btor24))]
          [btor825 (signal (bool->bitvector (bveq (signal-value btor824) (signal-value btor97)))
                           (merge-state (list btor824 btor97)))]
          [btor826 (signal (bvor (signal-value btor825) (signal-value btor824))
                           (merge-state (list btor825 btor824)))]
          [btor827 (signal (extract 47 47 (signal-value btor24)) (signal-state btor24))]
          [btor828 (signal (bool->bitvector (bveq (signal-value btor827) (signal-value btor97)))
                           (merge-state (list btor827 btor97)))]
          [btor829 (signal (bvor (signal-value btor828) (signal-value btor827))
                           (merge-state (list btor828 btor827)))]
          [btor830 (signal (concat (signal-value btor691) (signal-value btor688))
                           (merge-state (list btor691 btor688)))]
          [btor831 (signal (concat (signal-value btor694) (signal-value btor830))
                           (merge-state (list btor694 btor830)))]
          [btor832 (signal (concat (signal-value btor697) (signal-value btor831))
                           (merge-state (list btor697 btor831)))]
          [btor833 (signal (concat (signal-value btor700) (signal-value btor832))
                           (merge-state (list btor700 btor832)))]
          [btor834 (signal (concat (signal-value btor703) (signal-value btor833))
                           (merge-state (list btor703 btor833)))]
          [btor835 (signal (concat (signal-value btor706) (signal-value btor834))
                           (merge-state (list btor706 btor834)))]
          [btor836 (signal (concat (signal-value btor709) (signal-value btor835))
                           (merge-state (list btor709 btor835)))]
          [btor837 (signal (concat (signal-value btor712) (signal-value btor836))
                           (merge-state (list btor712 btor836)))]
          [btor838 (signal (concat (signal-value btor715) (signal-value btor837))
                           (merge-state (list btor715 btor837)))]
          [btor839 (signal (concat (signal-value btor718) (signal-value btor838))
                           (merge-state (list btor718 btor838)))]
          [btor840 (signal (concat (signal-value btor721) (signal-value btor839))
                           (merge-state (list btor721 btor839)))]
          [btor841 (signal (concat (signal-value btor724) (signal-value btor840))
                           (merge-state (list btor724 btor840)))]
          [btor842 (signal (concat (signal-value btor727) (signal-value btor841))
                           (merge-state (list btor727 btor841)))]
          [btor843 (signal (concat (signal-value btor730) (signal-value btor842))
                           (merge-state (list btor730 btor842)))]
          [btor844 (signal (concat (signal-value btor733) (signal-value btor843))
                           (merge-state (list btor733 btor843)))]
          [btor845 (signal (concat (signal-value btor736) (signal-value btor844))
                           (merge-state (list btor736 btor844)))]
          [btor846 (signal (concat (signal-value btor739) (signal-value btor845))
                           (merge-state (list btor739 btor845)))]
          [btor847 (signal (concat (signal-value btor742) (signal-value btor846))
                           (merge-state (list btor742 btor846)))]
          [btor848 (signal (concat (signal-value btor745) (signal-value btor847))
                           (merge-state (list btor745 btor847)))]
          [btor849 (signal (concat (signal-value btor748) (signal-value btor848))
                           (merge-state (list btor748 btor848)))]
          [btor850 (signal (concat (signal-value btor751) (signal-value btor849))
                           (merge-state (list btor751 btor849)))]
          [btor851 (signal (concat (signal-value btor754) (signal-value btor850))
                           (merge-state (list btor754 btor850)))]
          [btor852 (signal (concat (signal-value btor757) (signal-value btor851))
                           (merge-state (list btor757 btor851)))]
          [btor853 (signal (concat (signal-value btor760) (signal-value btor852))
                           (merge-state (list btor760 btor852)))]
          [btor854 (signal (concat (signal-value btor763) (signal-value btor853))
                           (merge-state (list btor763 btor853)))]
          [btor855 (signal (concat (signal-value btor766) (signal-value btor854))
                           (merge-state (list btor766 btor854)))]
          [btor856 (signal (concat (signal-value btor769) (signal-value btor855))
                           (merge-state (list btor769 btor855)))]
          [btor857 (signal (concat (signal-value btor772) (signal-value btor856))
                           (merge-state (list btor772 btor856)))]
          [btor858 (signal (concat (signal-value btor775) (signal-value btor857))
                           (merge-state (list btor775 btor857)))]
          [btor859 (signal (concat (signal-value btor778) (signal-value btor858))
                           (merge-state (list btor778 btor858)))]
          [btor860 (signal (concat (signal-value btor781) (signal-value btor859))
                           (merge-state (list btor781 btor859)))]
          [btor861 (signal (concat (signal-value btor784) (signal-value btor860))
                           (merge-state (list btor784 btor860)))]
          [btor862 (signal (concat (signal-value btor787) (signal-value btor861))
                           (merge-state (list btor787 btor861)))]
          [btor863 (signal (concat (signal-value btor790) (signal-value btor862))
                           (merge-state (list btor790 btor862)))]
          [btor864 (signal (concat (signal-value btor793) (signal-value btor863))
                           (merge-state (list btor793 btor863)))]
          [btor865 (signal (concat (signal-value btor796) (signal-value btor864))
                           (merge-state (list btor796 btor864)))]
          [btor866 (signal (concat (signal-value btor799) (signal-value btor865))
                           (merge-state (list btor799 btor865)))]
          [btor867 (signal (concat (signal-value btor802) (signal-value btor866))
                           (merge-state (list btor802 btor866)))]
          [btor868 (signal (concat (signal-value btor805) (signal-value btor867))
                           (merge-state (list btor805 btor867)))]
          [btor869 (signal (concat (signal-value btor808) (signal-value btor868))
                           (merge-state (list btor808 btor868)))]
          [btor870 (signal (concat (signal-value btor811) (signal-value btor869))
                           (merge-state (list btor811 btor869)))]
          [btor871 (signal (concat (signal-value btor814) (signal-value btor870))
                           (merge-state (list btor814 btor870)))]
          [btor872 (signal (concat (signal-value btor817) (signal-value btor871))
                           (merge-state (list btor817 btor871)))]
          [btor873 (signal (concat (signal-value btor820) (signal-value btor872))
                           (merge-state (list btor820 btor872)))]
          [btor874 (signal (concat (signal-value btor823) (signal-value btor873))
                           (merge-state (list btor823 btor873)))]
          [btor875 (signal (concat (signal-value btor826) (signal-value btor874))
                           (merge-state (list btor826 btor874)))]
          [btor876 (signal (concat (signal-value btor829) (signal-value btor875))
                           (merge-state (list btor829 btor875)))]
          [btor877
           (let* ([state-value
                   (cond
                     [(hash-has-key? merged-input-state-hash 'state877)
                      (bv->signal (hash-ref merged-input-state-hash 'state877))]
                     [(hash-has-key? init-hash 'state877) (bv->signal (hash-ref init-hash 'state877))]
                     [else
                      (log-warning
                       "state ~a with no initial value, init to 0, this may not be correct in the long term"
                       'state877)
                      (bv->signal (bv 0 (bitvector 48)))])])
             (when (not (signal? state-value))
               (error "Expected signal"))
             (when (not (bv? (signal-value state-value)))
               (error "Signal value invalid"))
             state-value)]
          [btor878
           (let* ([state-value
                   (cond
                     [(hash-has-key? merged-input-state-hash 'state878)
                      (bv->signal (hash-ref merged-input-state-hash 'state878))]
                     [(hash-has-key? init-hash 'state878) (bv->signal (hash-ref init-hash 'state878))]
                     [else
                      (log-warning
                       "state ~a with no initial value, init to 0, this may not be correct in the long term"
                       'state878)
                      (bv->signal (bv 0 (bitvector 48)))])])
             (when (not (signal? state-value))
               (error "Expected signal"))
             (when (not (bv? (signal-value state-value)))
               (error "Signal value invalid"))
             state-value)]
          [btor879
           (let* ([state-value
                   (cond
                     [(hash-has-key? merged-input-state-hash 'state879)
                      (bv->signal (hash-ref merged-input-state-hash 'state879))]
                     [(hash-has-key? init-hash 'state879) (bv->signal (hash-ref init-hash 'state879))]
                     [else
                      (log-warning
                       "state ~a with no initial value, init to 0, this may not be correct in the long term"
                       'state879)
                      (bv->signal (bv 0 (bitvector 1)))])])
             (when (not (signal? state-value))
               (error "Expected signal"))
             (when (not (bv? (signal-value state-value)))
               (error "Signal value invalid"))
             state-value)]
          [btor881 (signal (concat (signal-value btor102) (signal-value btor879))
                           (merge-state (list btor102 btor879)))]
          [btor882 (signal (bool->bitvector (bveq (signal-value btor881) (signal-value btor105)))
                           (merge-state (list btor881 btor105)))]
          [btor883 (if (bitvector->bool (signal-value btor882)) btor878 btor877)]
          [btor884 (signal (extract 0 0 (signal-value btor46)) (signal-state btor46))]
          [btor885 (if (bitvector->bool (signal-value btor884)) btor883 btor876)]
          [btor886 (bv->signal (zero-extend (signal-value btor637) (bitvector 3)) btor637)]
          [btor887 (signal (bool->bitvector (bveq (signal-value btor675) (signal-value btor886)))
                           (merge-state (list btor675 btor886)))]
          [btor888 (if (bitvector->bool (signal-value btor887)) btor885 btor685)]
          [btor889 (bv->signal (zero-extend (signal-value btor97) (bitvector 3)) btor97)]
          [btor890 (signal (bool->bitvector (bveq (signal-value btor675) (signal-value btor889)))
                           (merge-state (list btor675 btor889)))]
          [btor891 (if (bitvector->bool (signal-value btor890)) btor74 btor888)]
          [btor892 (bv->signal (bv 0 (bitvector 48)))]
          [btor893 (signal (apply bvor (bitvector->bits (signal-value btor675)))
                           (signal-state btor675))]
          [btor894 (signal (bvnot (signal-value btor893)) (merge-state (list btor893)))]
          [btor895 (if (bitvector->bool (signal-value btor894)) btor892 btor891)]
          [btor896 (signal (bvxor (signal-value btor530) (signal-value btor895))
                           (merge-state (list btor530 btor895)))]
          [btor897 unnamed-input-897]
          [btor898 (signal (concat (signal-value btor267) (signal-value btor366))
                           (merge-state (list btor267 btor366)))]
          [btor899 (signal (extract 1 0 (signal-value btor635)) (signal-state btor635))]
          [btor900 (signal (bool->bitvector (bveq (signal-value btor899) (signal-value btor637)))
                           (merge-state (list btor899 btor637)))]
          [btor901 (if (bitvector->bool (signal-value btor900)) btor898 btor897)]
          [btor902 (signal (bool->bitvector (bveq (signal-value btor899) (signal-value btor105)))
                           (merge-state (list btor899 btor105)))]
          [btor903 (if (bitvector->bool (signal-value btor902)) btor538 btor901)]
          [btor904 (bv->signal (bv 17592186044416 (bitvector 45)))]
          [btor905 (signal (extract 26 0 (signal-value btor267)) (signal-state btor267))]
          [btor906 (signal (extract 26 0 (signal-value btor107)) (signal-state btor107))]
          [btor907 (signal (extract 0 0 (signal-value btor50)) (signal-state btor50))]
          [btor908 (signal (bool->bitvector ((compose1 not bveq) (signal-value btor907)
                                                                 (signal-value btor97)))
                           (merge-state (list btor907 btor97)))]
          [btor909 (signal (extract 0 0 (signal-value btor55)) (signal-state btor55))]
          [btor910 (signal (bvxor (signal-value btor907) (signal-value btor909))
                           (merge-state (list btor907 btor909)))]
          [btor911 (signal (bvand (signal-value btor908) (signal-value btor910))
                           (merge-state (list btor908 btor910)))]
          [btor912 (signal (extract 1 1 (signal-value btor50)) (signal-state btor50))]
          [btor913 (signal (bool->bitvector ((compose1 not bveq) (signal-value btor912)
                                                                 (signal-value btor97)))
                           (merge-state (list btor912 btor97)))]
          [btor914 (signal (extract 1 1 (signal-value btor55)) (signal-state btor55))]
          [btor915 (signal (bvxor (signal-value btor912) (signal-value btor914))
                           (merge-state (list btor912 btor914)))]
          [btor916 (signal (bvand (signal-value btor913) (signal-value btor915))
                           (merge-state (list btor913 btor915)))]
          [btor917 (signal (extract 2 2 (signal-value btor50)) (signal-state btor50))]
          [btor918 (signal (bool->bitvector ((compose1 not bveq) (signal-value btor917)
                                                                 (signal-value btor97)))
                           (merge-state (list btor917 btor97)))]
          [btor919 (signal (extract 2 2 (signal-value btor55)) (signal-state btor55))]
          [btor920 (signal (bvxor (signal-value btor917) (signal-value btor919))
                           (merge-state (list btor917 btor919)))]
          [btor921 (signal (bvand (signal-value btor918) (signal-value btor920))
                           (merge-state (list btor918 btor920)))]
          [btor922 (signal (extract 3 3 (signal-value btor50)) (signal-state btor50))]
          [btor923 (signal (bool->bitvector ((compose1 not bveq) (signal-value btor922)
                                                                 (signal-value btor97)))
                           (merge-state (list btor922 btor97)))]
          [btor924 (signal (extract 3 3 (signal-value btor55)) (signal-state btor55))]
          [btor925 (signal (bvxor (signal-value btor922) (signal-value btor924))
                           (merge-state (list btor922 btor924)))]
          [btor926 (signal (bvand (signal-value btor923) (signal-value btor925))
                           (merge-state (list btor923 btor925)))]
          [btor927 (signal (extract 4 4 (signal-value btor50)) (signal-state btor50))]
          [btor928 (signal (bool->bitvector ((compose1 not bveq) (signal-value btor927)
                                                                 (signal-value btor97)))
                           (merge-state (list btor927 btor97)))]
          [btor929 (signal (extract 4 4 (signal-value btor55)) (signal-state btor55))]
          [btor930 (signal (bvxor (signal-value btor927) (signal-value btor929))
                           (merge-state (list btor927 btor929)))]
          [btor931 (signal (bvand (signal-value btor928) (signal-value btor930))
                           (merge-state (list btor928 btor930)))]
          [btor932 (signal (concat (signal-value btor916) (signal-value btor911))
                           (merge-state (list btor916 btor911)))]
          [btor933 (signal (concat (signal-value btor921) (signal-value btor932))
                           (merge-state (list btor921 btor932)))]
          [btor934 (signal (concat (signal-value btor926) (signal-value btor933))
                           (merge-state (list btor926 btor933)))]
          [btor935 (signal (concat (signal-value btor931) (signal-value btor934))
                           (merge-state (list btor931 btor934)))]
          [btor936
           (let* ([state-value
                   (cond
                     [(hash-has-key? merged-input-state-hash 'state936)
                      (bv->signal (hash-ref merged-input-state-hash 'state936))]
                     [(hash-has-key? init-hash 'state936) (bv->signal (hash-ref init-hash 'state936))]
                     [else
                      (log-warning
                       "state ~a with no initial value, init to 0, this may not be correct in the long term"
                       'state936)
                      (bv->signal (bv 0 (bitvector 5)))])])
             (when (not (signal? state-value))
               (error "Expected signal"))
             (when (not (bv? (signal-value state-value)))
               (error "Signal value invalid"))
             state-value)]
          [btor937
           (let* ([state-value
                   (cond
                     [(hash-has-key? merged-input-state-hash 'state937)
                      (bv->signal (hash-ref merged-input-state-hash 'state937))]
                     [(hash-has-key? init-hash 'state937) (bv->signal (hash-ref init-hash 'state937))]
                     [else
                      (log-warning
                       "state ~a with no initial value, init to 0, this may not be correct in the long term"
                       'state937)
                      (bv->signal (bv 0 (bitvector 5)))])])
             (when (not (signal? state-value))
               (error "Expected signal"))
             (when (not (bv? (signal-value state-value)))
               (error "Signal value invalid"))
             state-value)]
          [btor938
           (let* ([state-value
                   (cond
                     [(hash-has-key? merged-input-state-hash 'state938)
                      (bv->signal (hash-ref merged-input-state-hash 'state938))]
                     [(hash-has-key? init-hash 'state938) (bv->signal (hash-ref init-hash 'state938))]
                     [else
                      (log-warning
                       "state ~a with no initial value, init to 0, this may not be correct in the long term"
                       'state938)
                      (bv->signal (bv 0 (bitvector 1)))])])
             (when (not (signal? state-value))
               (error "Expected signal"))
             (when (not (bv? (signal-value state-value)))
               (error "Signal value invalid"))
             state-value)]
          [btor940 (signal (concat (signal-value btor102) (signal-value btor938))
                           (merge-state (list btor102 btor938)))]
          [btor941 (signal (bool->bitvector (bveq (signal-value btor940) (signal-value btor105)))
                           (merge-state (list btor940 btor105)))]
          [btor942 (if (bitvector->bool (signal-value btor941)) btor937 btor936)]
          [btor943 (signal (extract 0 0 (signal-value btor51)) (signal-state btor51))]
          [btor944 (if (bitvector->bool (signal-value btor943)) btor942 btor935)]
          [btor945 (signal (extract 0 0 (signal-value btor944)) (signal-state btor944))]
          [btor946 (if (bitvector->bool (signal-value btor945)) btor906 btor905)]
          [btor947 (bv->signal (bv 0 (bitvector 27)))]
          [btor948 (bv->signal (zero-extend (signal-value btor97) (bitvector 5)) btor97)]
          [btor949 (signal (bool->bitvector (bveq (signal-value btor75) (signal-value btor948)))
                           (merge-state (list btor75 btor948)))]
          [btor950 (if (bitvector->bool (signal-value btor949)) btor97 btor248)]
          [btor951 (bv->signal (bv 0 (bitvector 3)))]
          [btor952 (signal (concat (signal-value btor951) (signal-value btor75))
                           (merge-state (list btor951 btor75)))]
          [btor953 (signal (apply bvor (bitvector->bits (signal-value btor952)))
                           (signal-state btor952))]
          [btor954 (signal (bvnot (signal-value btor953)) (merge-state (list btor953)))]
          [btor955 (if (bitvector->bool (signal-value btor954)) btor248 btor950)]
          [btor956 (signal (bvnot (signal-value btor955)) (merge-state (list btor955)))]
          [btor957 (signal (extract 1 1 (signal-value btor944)) (signal-state btor944))]
          [btor958 (signal (bvand (signal-value btor956) (signal-value btor957))
                           (merge-state (list btor956 btor957)))]
          [btor959 (if (bitvector->bool (signal-value btor958)) btor947 btor946)]
          [btor960 (signal (extract 0 0 (signal-value btor48)) (signal-state btor48))]
          [btor961 (signal (bool->bitvector ((compose1 not bveq) (signal-value btor960)
                                                                 (signal-value btor97)))
                           (merge-state (list btor960 btor97)))]
          [btor962 (signal (bvand (signal-value btor961) (signal-value btor960))
                           (merge-state (list btor961 btor960)))]
          [btor963 (signal (extract 1 1 (signal-value btor48)) (signal-state btor48))]
          [btor964 (signal (bool->bitvector ((compose1 not bveq) (signal-value btor963)
                                                                 (signal-value btor97)))
                           (merge-state (list btor963 btor97)))]
          [btor965 (signal (bvand (signal-value btor964) (signal-value btor963))
                           (merge-state (list btor964 btor963)))]
          [btor966 (signal (extract 2 2 (signal-value btor48)) (signal-state btor48))]
          [btor967 (signal (bool->bitvector ((compose1 not bveq) (signal-value btor966)
                                                                 (signal-value btor97)))
                           (merge-state (list btor966 btor97)))]
          [btor968 (signal (bvand (signal-value btor967) (signal-value btor966))
                           (merge-state (list btor967 btor966)))]
          [btor969 (signal (extract 3 3 (signal-value btor48)) (signal-state btor48))]
          [btor970 (signal (bool->bitvector ((compose1 not bveq) (signal-value btor969)
                                                                 (signal-value btor97)))
                           (merge-state (list btor969 btor97)))]
          [btor971 (signal (bvand (signal-value btor970) (signal-value btor969))
                           (merge-state (list btor970 btor969)))]
          [btor972 (signal (extract 4 4 (signal-value btor48)) (signal-state btor48))]
          [btor973 (signal (bool->bitvector ((compose1 not bveq) (signal-value btor972)
                                                                 (signal-value btor97)))
                           (merge-state (list btor972 btor97)))]
          [btor974 (signal (bvand (signal-value btor973) (signal-value btor972))
                           (merge-state (list btor973 btor972)))]
          [btor975 (signal (extract 5 5 (signal-value btor48)) (signal-state btor48))]
          [btor976 (signal (bool->bitvector ((compose1 not bveq) (signal-value btor975)
                                                                 (signal-value btor97)))
                           (merge-state (list btor975 btor97)))]
          [btor977 (signal (bvand (signal-value btor976) (signal-value btor975))
                           (merge-state (list btor976 btor975)))]
          [btor978 (signal (extract 6 6 (signal-value btor48)) (signal-state btor48))]
          [btor979 (signal (bool->bitvector ((compose1 not bveq) (signal-value btor978)
                                                                 (signal-value btor97)))
                           (merge-state (list btor978 btor97)))]
          [btor980 (signal (bvand (signal-value btor979) (signal-value btor978))
                           (merge-state (list btor979 btor978)))]
          [btor981 (signal (extract 7 7 (signal-value btor48)) (signal-state btor48))]
          [btor982 (signal (bool->bitvector ((compose1 not bveq) (signal-value btor981)
                                                                 (signal-value btor97)))
                           (merge-state (list btor981 btor97)))]
          [btor983 (signal (bvand (signal-value btor982) (signal-value btor981))
                           (merge-state (list btor982 btor981)))]
          [btor984 (signal (extract 8 8 (signal-value btor48)) (signal-state btor48))]
          [btor985 (signal (bool->bitvector ((compose1 not bveq) (signal-value btor984)
                                                                 (signal-value btor97)))
                           (merge-state (list btor984 btor97)))]
          [btor986 (signal (bvand (signal-value btor985) (signal-value btor984))
                           (merge-state (list btor985 btor984)))]
          [btor987 (signal (extract 9 9 (signal-value btor48)) (signal-state btor48))]
          [btor988 (signal (bool->bitvector ((compose1 not bveq) (signal-value btor987)
                                                                 (signal-value btor97)))
                           (merge-state (list btor987 btor97)))]
          [btor989 (signal (bvand (signal-value btor988) (signal-value btor987))
                           (merge-state (list btor988 btor987)))]
          [btor990 (signal (extract 10 10 (signal-value btor48)) (signal-state btor48))]
          [btor991 (signal (bool->bitvector ((compose1 not bveq) (signal-value btor990)
                                                                 (signal-value btor97)))
                           (merge-state (list btor990 btor97)))]
          [btor992 (signal (bvand (signal-value btor991) (signal-value btor990))
                           (merge-state (list btor991 btor990)))]
          [btor993 (signal (extract 11 11 (signal-value btor48)) (signal-state btor48))]
          [btor994 (signal (bool->bitvector ((compose1 not bveq) (signal-value btor993)
                                                                 (signal-value btor97)))
                           (merge-state (list btor993 btor97)))]
          [btor995 (signal (bvand (signal-value btor994) (signal-value btor993))
                           (merge-state (list btor994 btor993)))]
          [btor996 (signal (extract 12 12 (signal-value btor48)) (signal-state btor48))]
          [btor997 (signal (bool->bitvector ((compose1 not bveq) (signal-value btor996)
                                                                 (signal-value btor97)))
                           (merge-state (list btor996 btor97)))]
          [btor998 (signal (bvand (signal-value btor997) (signal-value btor996))
                           (merge-state (list btor997 btor996)))]
          [btor999 (signal (extract 13 13 (signal-value btor48)) (signal-state btor48))]
          [btor1000 (signal (bool->bitvector ((compose1 not bveq) (signal-value btor999)
                                                                  (signal-value btor97)))
                            (merge-state (list btor999 btor97)))]
          [btor1001 (signal (bvand (signal-value btor1000) (signal-value btor999))
                            (merge-state (list btor1000 btor999)))]
          [btor1002 (signal (extract 14 14 (signal-value btor48)) (signal-state btor48))]
          [btor1003 (signal (bool->bitvector ((compose1 not bveq) (signal-value btor1002)
                                                                  (signal-value btor97)))
                            (merge-state (list btor1002 btor97)))]
          [btor1004 (signal (bvand (signal-value btor1003) (signal-value btor1002))
                            (merge-state (list btor1003 btor1002)))]
          [btor1005 (signal (extract 15 15 (signal-value btor48)) (signal-state btor48))]
          [btor1006 (signal (bool->bitvector ((compose1 not bveq) (signal-value btor1005)
                                                                  (signal-value btor97)))
                            (merge-state (list btor1005 btor97)))]
          [btor1007 (signal (bvand (signal-value btor1006) (signal-value btor1005))
                            (merge-state (list btor1006 btor1005)))]
          [btor1008 (signal (extract 16 16 (signal-value btor48)) (signal-state btor48))]
          [btor1009 (signal (bool->bitvector ((compose1 not bveq) (signal-value btor1008)
                                                                  (signal-value btor97)))
                            (merge-state (list btor1008 btor97)))]
          [btor1010 (signal (bvand (signal-value btor1009) (signal-value btor1008))
                            (merge-state (list btor1009 btor1008)))]
          [btor1011 (signal (extract 17 17 (signal-value btor48)) (signal-state btor48))]
          [btor1012 (signal (bool->bitvector ((compose1 not bveq) (signal-value btor1011)
                                                                  (signal-value btor97)))
                            (merge-state (list btor1011 btor97)))]
          [btor1013 (signal (bvand (signal-value btor1012) (signal-value btor1011))
                            (merge-state (list btor1012 btor1011)))]
          [btor1014 (signal (extract 18 18 (signal-value btor48)) (signal-state btor48))]
          [btor1015 (signal (bool->bitvector ((compose1 not bveq) (signal-value btor1014)
                                                                  (signal-value btor97)))
                            (merge-state (list btor1014 btor97)))]
          [btor1016 (signal (bvand (signal-value btor1015) (signal-value btor1014))
                            (merge-state (list btor1015 btor1014)))]
          [btor1017 (signal (extract 19 19 (signal-value btor48)) (signal-state btor48))]
          [btor1018 (signal (bool->bitvector ((compose1 not bveq) (signal-value btor1017)
                                                                  (signal-value btor97)))
                            (merge-state (list btor1017 btor97)))]
          [btor1019 (signal (bvand (signal-value btor1018) (signal-value btor1017))
                            (merge-state (list btor1018 btor1017)))]
          [btor1020 (signal (extract 20 20 (signal-value btor48)) (signal-state btor48))]
          [btor1021 (signal (bool->bitvector ((compose1 not bveq) (signal-value btor1020)
                                                                  (signal-value btor97)))
                            (merge-state (list btor1020 btor97)))]
          [btor1022 (signal (bvand (signal-value btor1021) (signal-value btor1020))
                            (merge-state (list btor1021 btor1020)))]
          [btor1023 (signal (extract 21 21 (signal-value btor48)) (signal-state btor48))]
          [btor1024 (signal (bool->bitvector ((compose1 not bveq) (signal-value btor1023)
                                                                  (signal-value btor97)))
                            (merge-state (list btor1023 btor97)))]
          [btor1025 (signal (bvand (signal-value btor1024) (signal-value btor1023))
                            (merge-state (list btor1024 btor1023)))]
          [btor1026 (signal (extract 22 22 (signal-value btor48)) (signal-state btor48))]
          [btor1027 (signal (bool->bitvector ((compose1 not bveq) (signal-value btor1026)
                                                                  (signal-value btor97)))
                            (merge-state (list btor1026 btor97)))]
          [btor1028 (signal (bvand (signal-value btor1027) (signal-value btor1026))
                            (merge-state (list btor1027 btor1026)))]
          [btor1029 (signal (extract 23 23 (signal-value btor48)) (signal-state btor48))]
          [btor1030 (signal (bool->bitvector ((compose1 not bveq) (signal-value btor1029)
                                                                  (signal-value btor97)))
                            (merge-state (list btor1029 btor97)))]
          [btor1031 (signal (bvand (signal-value btor1030) (signal-value btor1029))
                            (merge-state (list btor1030 btor1029)))]
          [btor1032 (signal (extract 24 24 (signal-value btor48)) (signal-state btor48))]
          [btor1033 (signal (bool->bitvector ((compose1 not bveq) (signal-value btor1032)
                                                                  (signal-value btor97)))
                            (merge-state (list btor1032 btor97)))]
          [btor1034 (signal (bvand (signal-value btor1033) (signal-value btor1032))
                            (merge-state (list btor1033 btor1032)))]
          [btor1035 (signal (extract 25 25 (signal-value btor48)) (signal-state btor48))]
          [btor1036 (signal (bool->bitvector ((compose1 not bveq) (signal-value btor1035)
                                                                  (signal-value btor97)))
                            (merge-state (list btor1035 btor97)))]
          [btor1037 (signal (bvand (signal-value btor1036) (signal-value btor1035))
                            (merge-state (list btor1036 btor1035)))]
          [btor1038 (signal (extract 26 26 (signal-value btor48)) (signal-state btor48))]
          [btor1039 (signal (bool->bitvector ((compose1 not bveq) (signal-value btor1038)
                                                                  (signal-value btor97)))
                            (merge-state (list btor1038 btor97)))]
          [btor1040 (signal (bvand (signal-value btor1039) (signal-value btor1038))
                            (merge-state (list btor1039 btor1038)))]
          [btor1041 (signal (concat (signal-value btor965) (signal-value btor962))
                            (merge-state (list btor965 btor962)))]
          [btor1042 (signal (concat (signal-value btor968) (signal-value btor1041))
                            (merge-state (list btor968 btor1041)))]
          [btor1043 (signal (concat (signal-value btor971) (signal-value btor1042))
                            (merge-state (list btor971 btor1042)))]
          [btor1044 (signal (concat (signal-value btor974) (signal-value btor1043))
                            (merge-state (list btor974 btor1043)))]
          [btor1045 (signal (concat (signal-value btor977) (signal-value btor1044))
                            (merge-state (list btor977 btor1044)))]
          [btor1046 (signal (concat (signal-value btor980) (signal-value btor1045))
                            (merge-state (list btor980 btor1045)))]
          [btor1047 (signal (concat (signal-value btor983) (signal-value btor1046))
                            (merge-state (list btor983 btor1046)))]
          [btor1048 (signal (concat (signal-value btor986) (signal-value btor1047))
                            (merge-state (list btor986 btor1047)))]
          [btor1049 (signal (concat (signal-value btor989) (signal-value btor1048))
                            (merge-state (list btor989 btor1048)))]
          [btor1050 (signal (concat (signal-value btor992) (signal-value btor1049))
                            (merge-state (list btor992 btor1049)))]
          [btor1051 (signal (concat (signal-value btor995) (signal-value btor1050))
                            (merge-state (list btor995 btor1050)))]
          [btor1052 (signal (concat (signal-value btor998) (signal-value btor1051))
                            (merge-state (list btor998 btor1051)))]
          [btor1053 (signal (concat (signal-value btor1001) (signal-value btor1052))
                            (merge-state (list btor1001 btor1052)))]
          [btor1054 (signal (concat (signal-value btor1004) (signal-value btor1053))
                            (merge-state (list btor1004 btor1053)))]
          [btor1055 (signal (concat (signal-value btor1007) (signal-value btor1054))
                            (merge-state (list btor1007 btor1054)))]
          [btor1056 (signal (concat (signal-value btor1010) (signal-value btor1055))
                            (merge-state (list btor1010 btor1055)))]
          [btor1057 (signal (concat (signal-value btor1013) (signal-value btor1056))
                            (merge-state (list btor1013 btor1056)))]
          [btor1058 (signal (concat (signal-value btor1016) (signal-value btor1057))
                            (merge-state (list btor1016 btor1057)))]
          [btor1059 (signal (concat (signal-value btor1019) (signal-value btor1058))
                            (merge-state (list btor1019 btor1058)))]
          [btor1060 (signal (concat (signal-value btor1022) (signal-value btor1059))
                            (merge-state (list btor1022 btor1059)))]
          [btor1061 (signal (concat (signal-value btor1025) (signal-value btor1060))
                            (merge-state (list btor1025 btor1060)))]
          [btor1062 (signal (concat (signal-value btor1028) (signal-value btor1061))
                            (merge-state (list btor1028 btor1061)))]
          [btor1063 (signal (concat (signal-value btor1031) (signal-value btor1062))
                            (merge-state (list btor1031 btor1062)))]
          [btor1064 (signal (concat (signal-value btor1034) (signal-value btor1063))
                            (merge-state (list btor1034 btor1063)))]
          [btor1065 (signal (concat (signal-value btor1037) (signal-value btor1064))
                            (merge-state (list btor1037 btor1064)))]
          [btor1066 (signal (concat (signal-value btor1040) (signal-value btor1065))
                            (merge-state (list btor1040 btor1065)))]
          [btor1067
           (let* ([state-value
                   (cond
                     [(hash-has-key? merged-input-state-hash 'state1067)
                      (bv->signal (hash-ref merged-input-state-hash 'state1067))]
                     [(hash-has-key? init-hash 'state1067)
                      (bv->signal (hash-ref init-hash 'state1067))]
                     [else
                      (log-warning
                       "state ~a with no initial value, init to 0, this may not be correct in the long term"
                       'state1067)
                      (bv->signal (bv 0 (bitvector 27)))])])
             (when (not (signal? state-value))
               (error "Expected signal"))
             (when (not (bv? (signal-value state-value)))
               (error "Signal value invalid"))
             state-value)]
          [btor1068
           (let* ([state-value
                   (cond
                     [(hash-has-key? merged-input-state-hash 'state1068)
                      (bv->signal (hash-ref merged-input-state-hash 'state1068))]
                     [(hash-has-key? init-hash 'state1068)
                      (bv->signal (hash-ref init-hash 'state1068))]
                     [else
                      (log-warning
                       "state ~a with no initial value, init to 0, this may not be correct in the long term"
                       'state1068)
                      (bv->signal (bv 0 (bitvector 27)))])])
             (when (not (signal? state-value))
               (error "Expected signal"))
             (when (not (bv? (signal-value state-value)))
               (error "Signal value invalid"))
             state-value)]
          [btor1069
           (let* ([state-value
                   (cond
                     [(hash-has-key? merged-input-state-hash 'state1069)
                      (bv->signal (hash-ref merged-input-state-hash 'state1069))]
                     [(hash-has-key? init-hash 'state1069)
                      (bv->signal (hash-ref init-hash 'state1069))]
                     [else
                      (log-warning
                       "state ~a with no initial value, init to 0, this may not be correct in the long term"
                       'state1069)
                      (bv->signal (bv 0 (bitvector 1)))])])
             (when (not (signal? state-value))
               (error "Expected signal"))
             (when (not (bv? (signal-value state-value)))
               (error "Signal value invalid"))
             state-value)]
          [btor1071 (signal (concat (signal-value btor102) (signal-value btor1069))
                            (merge-state (list btor102 btor1069)))]
          [btor1072 (signal (bool->bitvector (bveq (signal-value btor1071) (signal-value btor105)))
                            (merge-state (list btor1071 btor105)))]
          [btor1073 (if (bitvector->bool (signal-value btor1072)) btor1068 btor1067)]
          [btor1074 (signal (extract 0 0 (signal-value btor49)) (signal-state btor49))]
          [btor1075 (bv->signal (zero-extend (signal-value btor105) (bitvector 5)) btor105)]
          [btor1076 (signal (bool->bitvector (bveq (signal-value btor11) (signal-value btor1075)))
                            (merge-state (list btor11 btor1075)))]
          [btor1077 (if (bitvector->bool (signal-value btor1076)) btor97 btor248)]
          [btor1078 (bv->signal (bv 0 (bitvector 11)))]
          [btor1079 (signal (concat (signal-value btor1078) (signal-value btor11))
                            (merge-state (list btor1078 btor11)))]
          [btor1080 (signal (apply bvor (bitvector->bits (signal-value btor1079)))
                            (signal-state btor1079))]
          [btor1081 (signal (bvnot (signal-value btor1080)) (merge-state (list btor1080)))]
          [btor1082 (if (bitvector->bool (signal-value btor1081)) btor248 btor1077)]
          [btor1083 (signal (bvnot (signal-value btor1082)) (merge-state (list btor1082)))]
          [btor1084 (bv->signal (zero-extend (signal-value btor105) (bitvector 5)) btor105)]
          [btor1085 (signal (bool->bitvector (bveq (signal-value btor20) (signal-value btor1084)))
                            (merge-state (list btor20 btor1084)))]
          [btor1086 (if (bitvector->bool (signal-value btor1085)) btor97 btor248)]
          [btor1087 (bv->signal (zero-extend (signal-value btor97) (bitvector 5)) btor97)]
          [btor1088 (signal (bool->bitvector (bveq (signal-value btor20) (signal-value btor1087)))
                            (merge-state (list btor20 btor1087)))]
          [btor1089 (if (bitvector->bool (signal-value btor1088)) btor248 btor1086)]
          [btor1090 (signal (bvnot (signal-value btor1089)) (merge-state (list btor1089)))]
          [btor1091 (signal (bvand (signal-value btor1083) (signal-value btor1090))
                            (merge-state (list btor1083 btor1090)))]
          [btor1092 (bv->signal (bv 20 (bitvector 5)))]
          [btor1093 (signal (bool->bitvector (bveq (signal-value btor90) (signal-value btor1092)))
                            (merge-state (list btor90 btor1092)))]
          [btor1094 (if (bitvector->bool (signal-value btor1093)) btor105 btor406)]
          [btor1095 (bv->signal (bv 18 (bitvector 5)))]
          [btor1096 (signal (bool->bitvector (bveq (signal-value btor90) (signal-value btor1095)))
                            (merge-state (list btor90 btor1095)))]
          [btor1097 (if (bitvector->bool (signal-value btor1096)) btor410 btor1094)]
          [btor1098 (bv->signal (bv 10 (bitvector 4)))]
          [btor1099 (bv->signal (zero-extend (signal-value btor1098) (bitvector 5)) btor1098)]
          [btor1100 (signal (bool->bitvector (bveq (signal-value btor90) (signal-value btor1099)))
                            (merge-state (list btor90 btor1099)))]
          [btor1101 (if (bitvector->bool (signal-value btor1100)) btor406 btor1097)]
          [btor1102 (signal (bool->bitvector (bveq (signal-value btor1101) (signal-value btor105)))
                            (merge-state (list btor1101 btor105)))]
          [btor1103 (signal (bvor (signal-value btor1091) (signal-value btor1102))
                            (merge-state (list btor1091 btor1102)))]
          [btor1104 (if (bitvector->bool (signal-value btor1103)) btor248 btor1074)]
          [btor1105 (if (bitvector->bool (signal-value btor1104)) btor1073 btor1066)]
          [btor1106 (signal (extract 2 2 (signal-value btor944)) (signal-state btor944))]
          [btor1107 (if (bitvector->bool (signal-value btor1106)) btor1105 btor947)]
          [btor1108 (signal (extract 4 4 (signal-value btor944)) (signal-state btor944))]
          [btor1109 (if (bitvector->bool (signal-value btor1108)) btor278 btor366)]
          [btor1110 (bv->signal (bv 0 (bitvector 18)))]
          [btor1111 (signal (bvand (signal-value btor955) (signal-value btor957))
                            (merge-state (list btor955 btor957)))]
          [btor1112 (if (bitvector->bool (signal-value btor1111)) btor1110 btor1109)]
          [btor1113 (signal (extract 17 17 (signal-value btor1112)) (signal-state btor1112))]
          [btor1114 (signal (concat (signal-value btor1113) (signal-value btor1112))
                            (merge-state (list btor1113 btor1112)))]
          [btor1115 (signal (extract 17 17 (signal-value btor1112)) (signal-state btor1112))]
          [btor1116 (signal (concat (signal-value btor1115) (signal-value btor1114))
                            (merge-state (list btor1115 btor1114)))]
          [btor1117 (signal (extract 17 17 (signal-value btor1112)) (signal-state btor1112))]
          [btor1118 (signal (concat (signal-value btor1117) (signal-value btor1116))
                            (merge-state (list btor1117 btor1116)))]
          [btor1119 (signal (extract 17 17 (signal-value btor1112)) (signal-state btor1112))]
          [btor1120 (signal (concat (signal-value btor1119) (signal-value btor1118))
                            (merge-state (list btor1119 btor1118)))]
          [btor1121 (signal (extract 17 17 (signal-value btor1112)) (signal-state btor1112))]
          [btor1122 (signal (concat (signal-value btor1121) (signal-value btor1120))
                            (merge-state (list btor1121 btor1120)))]
          [btor1123 (signal (extract 17 17 (signal-value btor1112)) (signal-state btor1112))]
          [btor1124 (signal (concat (signal-value btor1123) (signal-value btor1122))
                            (merge-state (list btor1123 btor1122)))]
          [btor1125 (signal (extract 17 17 (signal-value btor1112)) (signal-state btor1112))]
          [btor1126 (signal (concat (signal-value btor1125) (signal-value btor1124))
                            (merge-state (list btor1125 btor1124)))]
          [btor1127 (signal (extract 17 17 (signal-value btor1112)) (signal-state btor1112))]
          [btor1128 (signal (concat (signal-value btor1127) (signal-value btor1126))
                            (merge-state (list btor1127 btor1126)))]
          [btor1129 (signal (extract 17 17 (signal-value btor1112)) (signal-state btor1112))]
          [btor1130 (signal (concat (signal-value btor1129) (signal-value btor1128))
                            (merge-state (list btor1129 btor1128)))]
          [btor1131 (if (bitvector->bool (signal-value btor955)) btor1130 btor959)]
          [btor1132 (signal (bvadd (signal-value btor1107) (signal-value btor1131))
                            (merge-state (list btor1107 btor1131)))]
          [btor1133 (signal (bvsub (signal-value btor1107) (signal-value btor1131))
                            (merge-state (list btor1107 btor1131)))]
          [btor1134 (signal (extract 3 3 (signal-value btor944)) (signal-state btor944))]
          [btor1135 (if (bitvector->bool (signal-value btor1134)) btor1133 btor1132)]
          [btor1136
           (let* ([state-value
                   (cond
                     [(hash-has-key? merged-input-state-hash 'state1136)
                      (bv->signal (hash-ref merged-input-state-hash 'state1136))]
                     [(hash-has-key? init-hash 'state1136)
                      (bv->signal (hash-ref init-hash 'state1136))]
                     [else
                      (log-warning
                       "state ~a with no initial value, init to 0, this may not be correct in the long term"
                       'state1136)
                      (bv->signal (bv 0 (bitvector 27)))])])
             (when (not (signal? state-value))
               (error "Expected signal"))
             (when (not (bv? (signal-value state-value)))
               (error "Signal value invalid"))
             state-value)]
          [btor1137
           (let* ([state-value
                   (cond
                     [(hash-has-key? merged-input-state-hash 'state1137)
                      (bv->signal (hash-ref merged-input-state-hash 'state1137))]
                     [(hash-has-key? init-hash 'state1137)
                      (bv->signal (hash-ref init-hash 'state1137))]
                     [else
                      (log-warning
                       "state ~a with no initial value, init to 0, this may not be correct in the long term"
                       'state1137)
                      (bv->signal (bv 0 (bitvector 27)))])])
             (when (not (signal? state-value))
               (error "Expected signal"))
             (when (not (bv? (signal-value state-value)))
               (error "Signal value invalid"))
             state-value)]
          [btor1138
           (let* ([state-value
                   (cond
                     [(hash-has-key? merged-input-state-hash 'state1138)
                      (bv->signal (hash-ref merged-input-state-hash 'state1138))]
                     [(hash-has-key? init-hash 'state1138)
                      (bv->signal (hash-ref init-hash 'state1138))]
                     [else
                      (log-warning
                       "state ~a with no initial value, init to 0, this may not be correct in the long term"
                       'state1138)
                      (bv->signal (bv 0 (bitvector 1)))])])
             (when (not (signal? state-value))
               (error "Expected signal"))
             (when (not (bv? (signal-value state-value)))
               (error "Signal value invalid"))
             state-value)]
          [btor1140 (signal (concat (signal-value btor102) (signal-value btor1138))
                            (merge-state (list btor102 btor1138)))]
          [btor1141 (signal (bool->bitvector (bveq (signal-value btor1140) (signal-value btor105)))
                            (merge-state (list btor1140 btor105)))]
          [btor1142 (if (bitvector->bool (signal-value btor1141)) btor1137 btor1136)]
          [btor1143 (signal (extract 0 0 (signal-value btor6)) (signal-state btor6))]
          [btor1144 (if (bitvector->bool (signal-value btor1103)) btor248 btor1143)]
          [btor1145 (if (bitvector->bool (signal-value btor1144)) btor1142 btor1135)]
          [btor1146 (if (bitvector->bool (signal-value btor1082)) btor1145 btor959)]
          [btor1147 (signal (extract 26 26 (signal-value btor1146)) (signal-state btor1146))]
          [btor1148 (signal (concat (signal-value btor1147) (signal-value btor1146))
                            (merge-state (list btor1147 btor1146)))]
          [btor1149 (signal (extract 26 26 (signal-value btor1146)) (signal-state btor1146))]
          [btor1150 (signal (concat (signal-value btor1149) (signal-value btor1148))
                            (merge-state (list btor1149 btor1148)))]
          [btor1151 (signal (extract 26 26 (signal-value btor1146)) (signal-state btor1146))]
          [btor1152 (signal (concat (signal-value btor1151) (signal-value btor1150))
                            (merge-state (list btor1151 btor1150)))]
          [btor1153 (signal (extract 26 26 (signal-value btor1146)) (signal-state btor1146))]
          [btor1154 (signal (concat (signal-value btor1153) (signal-value btor1152))
                            (merge-state (list btor1153 btor1152)))]
          [btor1155 (signal (extract 26 26 (signal-value btor1146)) (signal-state btor1146))]
          [btor1156 (signal (concat (signal-value btor1155) (signal-value btor1154))
                            (merge-state (list btor1155 btor1154)))]
          [btor1157 (signal (extract 26 26 (signal-value btor1146)) (signal-state btor1146))]
          [btor1158 (signal (concat (signal-value btor1157) (signal-value btor1156))
                            (merge-state (list btor1157 btor1156)))]
          [btor1159 (signal (extract 26 26 (signal-value btor1146)) (signal-state btor1146))]
          [btor1160 (signal (concat (signal-value btor1159) (signal-value btor1158))
                            (merge-state (list btor1159 btor1158)))]
          [btor1161 (signal (extract 26 26 (signal-value btor1146)) (signal-state btor1146))]
          [btor1162 (signal (concat (signal-value btor1161) (signal-value btor1160))
                            (merge-state (list btor1161 btor1160)))]
          [btor1163 (signal (extract 26 26 (signal-value btor1146)) (signal-state btor1146))]
          [btor1164 (signal (concat (signal-value btor1163) (signal-value btor1162))
                            (merge-state (list btor1163 btor1162)))]
          [btor1165 (signal (extract 26 26 (signal-value btor1146)) (signal-state btor1146))]
          [btor1166 (signal (concat (signal-value btor1165) (signal-value btor1164))
                            (merge-state (list btor1165 btor1164)))]
          [btor1167 (signal (extract 26 26 (signal-value btor1146)) (signal-state btor1146))]
          [btor1168 (signal (concat (signal-value btor1167) (signal-value btor1166))
                            (merge-state (list btor1167 btor1166)))]
          [btor1169 (signal (extract 26 26 (signal-value btor1146)) (signal-state btor1146))]
          [btor1170 (signal (concat (signal-value btor1169) (signal-value btor1168))
                            (merge-state (list btor1169 btor1168)))]
          [btor1171 (signal (extract 26 26 (signal-value btor1146)) (signal-state btor1146))]
          [btor1172 (signal (concat (signal-value btor1171) (signal-value btor1170))
                            (merge-state (list btor1171 btor1170)))]
          [btor1173 (signal (extract 26 26 (signal-value btor1146)) (signal-state btor1146))]
          [btor1174 (signal (concat (signal-value btor1173) (signal-value btor1172))
                            (merge-state (list btor1173 btor1172)))]
          [btor1175 (signal (extract 26 26 (signal-value btor1146)) (signal-state btor1146))]
          [btor1176 (signal (concat (signal-value btor1175) (signal-value btor1174))
                            (merge-state (list btor1175 btor1174)))]
          [btor1177 (signal (extract 26 26 (signal-value btor1146)) (signal-state btor1146))]
          [btor1178 (signal (concat (signal-value btor1177) (signal-value btor1176))
                            (merge-state (list btor1177 btor1176)))]
          [btor1179 (signal (extract 26 26 (signal-value btor1146)) (signal-state btor1146))]
          [btor1180 (signal (concat (signal-value btor1179) (signal-value btor1178))
                            (merge-state (list btor1179 btor1178)))]
          [btor1181 (signal (extract 26 26 (signal-value btor1146)) (signal-state btor1146))]
          [btor1182 (signal (concat (signal-value btor1181) (signal-value btor1180))
                            (merge-state (list btor1181 btor1180)))]
          [btor1183 (signal (extract 17 0 (signal-value btor1145)) (signal-state btor1145))]
          [btor1184 (if (bitvector->bool (signal-value btor1089)) btor1183 btor1112)]
          [btor1185 (signal (extract 17 17 (signal-value btor1184)) (signal-state btor1184))]
          [btor1186 (signal (concat (signal-value btor1185) (signal-value btor1184))
                            (merge-state (list btor1185 btor1184)))]
          [btor1187 (signal (extract 17 17 (signal-value btor1184)) (signal-state btor1184))]
          [btor1188 (signal (concat (signal-value btor1187) (signal-value btor1186))
                            (merge-state (list btor1187 btor1186)))]
          [btor1189 (signal (extract 17 17 (signal-value btor1184)) (signal-state btor1184))]
          [btor1190 (signal (concat (signal-value btor1189) (signal-value btor1188))
                            (merge-state (list btor1189 btor1188)))]
          [btor1191 (signal (extract 17 17 (signal-value btor1184)) (signal-state btor1184))]
          [btor1192 (signal (concat (signal-value btor1191) (signal-value btor1190))
                            (merge-state (list btor1191 btor1190)))]
          [btor1193 (signal (extract 17 17 (signal-value btor1184)) (signal-state btor1184))]
          [btor1194 (signal (concat (signal-value btor1193) (signal-value btor1192))
                            (merge-state (list btor1193 btor1192)))]
          [btor1195 (signal (extract 17 17 (signal-value btor1184)) (signal-state btor1184))]
          [btor1196 (signal (concat (signal-value btor1195) (signal-value btor1194))
                            (merge-state (list btor1195 btor1194)))]
          [btor1197 (signal (extract 17 17 (signal-value btor1184)) (signal-state btor1184))]
          [btor1198 (signal (concat (signal-value btor1197) (signal-value btor1196))
                            (merge-state (list btor1197 btor1196)))]
          [btor1199 (signal (extract 17 17 (signal-value btor1184)) (signal-state btor1184))]
          [btor1200 (signal (concat (signal-value btor1199) (signal-value btor1198))
                            (merge-state (list btor1199 btor1198)))]
          [btor1201 (signal (extract 17 17 (signal-value btor1184)) (signal-state btor1184))]
          [btor1202 (signal (concat (signal-value btor1201) (signal-value btor1200))
                            (merge-state (list btor1201 btor1200)))]
          [btor1203 (signal (extract 17 17 (signal-value btor1184)) (signal-state btor1184))]
          [btor1204 (signal (concat (signal-value btor1203) (signal-value btor1202))
                            (merge-state (list btor1203 btor1202)))]
          [btor1205 (signal (extract 17 17 (signal-value btor1184)) (signal-state btor1184))]
          [btor1206 (signal (concat (signal-value btor1205) (signal-value btor1204))
                            (merge-state (list btor1205 btor1204)))]
          [btor1207 (signal (extract 17 17 (signal-value btor1184)) (signal-state btor1184))]
          [btor1208 (signal (concat (signal-value btor1207) (signal-value btor1206))
                            (merge-state (list btor1207 btor1206)))]
          [btor1209 (signal (extract 17 17 (signal-value btor1184)) (signal-state btor1184))]
          [btor1210 (signal (concat (signal-value btor1209) (signal-value btor1208))
                            (merge-state (list btor1209 btor1208)))]
          [btor1211 (signal (extract 17 17 (signal-value btor1184)) (signal-state btor1184))]
          [btor1212 (signal (concat (signal-value btor1211) (signal-value btor1210))
                            (merge-state (list btor1211 btor1210)))]
          [btor1213 (signal (extract 17 17 (signal-value btor1184)) (signal-state btor1184))]
          [btor1214 (signal (concat (signal-value btor1213) (signal-value btor1212))
                            (merge-state (list btor1213 btor1212)))]
          [btor1215 (signal (extract 17 17 (signal-value btor1184)) (signal-state btor1184))]
          [btor1216 (signal (concat (signal-value btor1215) (signal-value btor1214))
                            (merge-state (list btor1215 btor1214)))]
          [btor1217 (signal (extract 17 17 (signal-value btor1184)) (signal-state btor1184))]
          [btor1218 (signal (concat (signal-value btor1217) (signal-value btor1216))
                            (merge-state (list btor1217 btor1216)))]
          [btor1219 (signal (extract 17 17 (signal-value btor1184)) (signal-state btor1184))]
          [btor1220 (signal (concat (signal-value btor1219) (signal-value btor1218))
                            (merge-state (list btor1219 btor1218)))]
          [btor1221 (signal (extract 17 17 (signal-value btor1184)) (signal-state btor1184))]
          [btor1222 (signal (concat (signal-value btor1221) (signal-value btor1220))
                            (merge-state (list btor1221 btor1220)))]
          [btor1223 (signal (extract 17 17 (signal-value btor1184)) (signal-state btor1184))]
          [btor1224 (signal (concat (signal-value btor1223) (signal-value btor1222))
                            (merge-state (list btor1223 btor1222)))]
          [btor1225 (signal (extract 17 17 (signal-value btor1184)) (signal-state btor1184))]
          [btor1226 (signal (concat (signal-value btor1225) (signal-value btor1224))
                            (merge-state (list btor1225 btor1224)))]
          [btor1227 (signal (extract 17 17 (signal-value btor1184)) (signal-state btor1184))]
          [btor1228 (signal (concat (signal-value btor1227) (signal-value btor1226))
                            (merge-state (list btor1227 btor1226)))]
          [btor1229 (signal (extract 17 17 (signal-value btor1184)) (signal-state btor1184))]
          [btor1230 (signal (concat (signal-value btor1229) (signal-value btor1228))
                            (merge-state (list btor1229 btor1228)))]
          [btor1231 (signal (extract 17 17 (signal-value btor1184)) (signal-state btor1184))]
          [btor1232 (signal (concat (signal-value btor1231) (signal-value btor1230))
                            (merge-state (list btor1231 btor1230)))]
          [btor1233 (signal (extract 17 17 (signal-value btor1184)) (signal-state btor1184))]
          [btor1234 (signal (concat (signal-value btor1233) (signal-value btor1232))
                            (merge-state (list btor1233 btor1232)))]
          [btor1235 (signal (extract 17 17 (signal-value btor1184)) (signal-state btor1184))]
          [btor1236 (signal (concat (signal-value btor1235) (signal-value btor1234))
                            (merge-state (list btor1235 btor1234)))]
          [btor1237 (signal (extract 17 17 (signal-value btor1184)) (signal-state btor1184))]
          [btor1238 (signal (concat (signal-value btor1237) (signal-value btor1236))
                            (merge-state (list btor1237 btor1236)))]
          [btor1239 (signal (bvmul (signal-value btor1182) (signal-value btor1238))
                            (merge-state (list btor1182 btor1238)))]
          [btor1240 (bv->signal (bv 0 (bitvector 45)))]
          [btor1241 (if (bitvector->bool (signal-value btor1102)) btor1240 btor1239)]
          [btor1242 (signal (extract 43 0 (signal-value btor1241)) (signal-state btor1241))]
          [btor1243 (bv->signal (bv 5864062014805 (bitvector 43)))]
          [btor1244 (bv->signal (zero-extend (signal-value btor1243) (bitvector 44)) btor1243)]
          [btor1245 (signal (bvand (signal-value btor1242) (signal-value btor1244))
                            (merge-state (list btor1242 btor1244)))]
          [btor1246 (signal (concat (signal-value btor97) (signal-value btor1245))
                            (merge-state (list btor97 btor1245)))]
          [btor1247
           (let* ([state-value
                   (cond
                     [(hash-has-key? merged-input-state-hash 'state1247)
                      (bv->signal (hash-ref merged-input-state-hash 'state1247))]
                     [(hash-has-key? init-hash 'state1247)
                      (bv->signal (hash-ref init-hash 'state1247))]
                     [else
                      (log-warning
                       "state ~a with no initial value, init to 0, this may not be correct in the long term"
                       'state1247)
                      (bv->signal (bv 0 (bitvector 45)))])])
             (when (not (signal? state-value))
               (error "Expected signal"))
             (when (not (bv? (signal-value state-value)))
               (error "Signal value invalid"))
             state-value)]
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
                      (bv->signal (bv 0 (bitvector 45)))])])
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
                      (bv->signal (bv 0 (bitvector 1)))])])
             (when (not (signal? state-value))
               (error "Expected signal"))
             (when (not (bv? (signal-value state-value)))
               (error "Signal value invalid"))
             state-value)]
          [btor1251 (signal (concat (signal-value btor102) (signal-value btor1249))
                            (merge-state (list btor102 btor1249)))]
          [btor1252 (signal (bool->bitvector (bveq (signal-value btor1251) (signal-value btor105)))
                            (merge-state (list btor1251 btor105)))]
          [btor1253 (if (bitvector->bool (signal-value btor1252)) btor1248 btor1247)]
          [btor1254 (signal (extract 0 0 (signal-value btor69)) (signal-state btor69))]
          [btor1255 (if (bitvector->bool (signal-value btor1254)) btor1253 btor1246)]
          [btor1256 (signal (apply bvor (bitvector->bits (signal-value btor417)))
                            (signal-state btor417))]
          [btor1257 (signal (bvnot (signal-value btor1256)) (merge-state (list btor1256)))]
          [btor1258 (if (bitvector->bool (signal-value btor1257)) btor1255 btor904)]
          [btor1259 (signal (extract 44 44 (signal-value btor1258)) (signal-state btor1258))]
          [btor1260 (signal (concat (signal-value btor1259) (signal-value btor1258))
                            (merge-state (list btor1259 btor1258)))]
          [btor1261 (signal (extract 44 44 (signal-value btor1258)) (signal-state btor1258))]
          [btor1262 (signal (concat (signal-value btor1261) (signal-value btor1260))
                            (merge-state (list btor1261 btor1260)))]
          [btor1263 (signal (extract 44 44 (signal-value btor1258)) (signal-state btor1258))]
          [btor1264 (signal (concat (signal-value btor1263) (signal-value btor1262))
                            (merge-state (list btor1263 btor1262)))]
          [btor1265 (bv->signal (zero-extend (signal-value btor97) (bitvector 2)) btor97)]
          [btor1266 (signal (bool->bitvector (bveq (signal-value btor899) (signal-value btor1265)))
                            (merge-state (list btor899 btor1265)))]
          [btor1267 (if (bitvector->bool (signal-value btor1266)) btor1264 btor903)]
          [btor1268 (signal (concat (signal-value btor70) (signal-value btor248))
                            (merge-state (list btor70 btor248)))]
          [btor1269 (if (bitvector->bool (signal-value btor680)) btor1268 btor406)]
          [btor1270 (bv->signal (bv 0 (bitvector 46)))]
          [btor1271 (signal (concat (signal-value btor1270) (signal-value btor1269))
                            (merge-state (list btor1270 btor1269)))]
          [btor1272 (signal (apply bvor (bitvector->bits (signal-value btor899)))
                            (signal-state btor899))]
          [btor1273 (signal (bvnot (signal-value btor1272)) (merge-state (list btor1272)))]
          [btor1274 (if (bitvector->bool (signal-value btor1273)) btor1271 btor1267)]
          [btor1275 (signal (bvxor (signal-value btor896) (signal-value btor1274))
                            (merge-state (list btor896 btor1274)))]
          [btor1276 unnamed-input-1276]
          [btor1277 (signal (extract 3 2 (signal-value btor635)) (signal-state btor635))]
          [btor1278 (signal (bool->bitvector (bveq (signal-value btor1277) (signal-value btor637)))
                            (merge-state (list btor1277 btor637)))]
          [btor1279 (if (bitvector->bool (signal-value btor1278)) btor885 btor1276)]
          [btor1280 (bv->signal (bv 281474976710655 (bitvector 48)))]
          [btor1281 (signal (bool->bitvector (bveq (signal-value btor1277) (signal-value btor105)))
                            (merge-state (list btor1277 btor105)))]
          [btor1282 (if (bitvector->bool (signal-value btor1281)) btor1280 btor1279)]
          [btor1283 (bv->signal (bv 11728124029610 (bitvector 44)))]
          [btor1284 (signal (bvand (signal-value btor1242) (signal-value btor1283))
                            (merge-state (list btor1242 btor1283)))]
          [btor1285 (signal (extract 44 44 (signal-value btor1241)) (signal-state btor1241))]
          [btor1286 (signal (bvnot (signal-value btor1285)) (merge-state (list btor1285)))]
          [btor1287 (signal (concat (signal-value btor1286) (signal-value btor1284))
                            (merge-state (list btor1286 btor1284)))]
          [btor1288
           (let* ([state-value
                   (cond
                     [(hash-has-key? merged-input-state-hash 'state1288)
                      (bv->signal (hash-ref merged-input-state-hash 'state1288))]
                     [(hash-has-key? init-hash 'state1288)
                      (bv->signal (hash-ref init-hash 'state1288))]
                     [else
                      (log-warning
                       "state ~a with no initial value, init to 0, this may not be correct in the long term"
                       'state1288)
                      (bv->signal (bv 0 (bitvector 45)))])])
             (when (not (signal? state-value))
               (error "Expected signal"))
             (when (not (bv? (signal-value state-value)))
               (error "Signal value invalid"))
             state-value)]
          [btor1289
           (let* ([state-value
                   (cond
                     [(hash-has-key? merged-input-state-hash 'state1289)
                      (bv->signal (hash-ref merged-input-state-hash 'state1289))]
                     [(hash-has-key? init-hash 'state1289)
                      (bv->signal (hash-ref init-hash 'state1289))]
                     [else
                      (log-warning
                       "state ~a with no initial value, init to 0, this may not be correct in the long term"
                       'state1289)
                      (bv->signal (bv 0 (bitvector 45)))])])
             (when (not (signal? state-value))
               (error "Expected signal"))
             (when (not (bv? (signal-value state-value)))
               (error "Signal value invalid"))
             state-value)]
          [btor1290
           (let* ([state-value
                   (cond
                     [(hash-has-key? merged-input-state-hash 'state1290)
                      (bv->signal (hash-ref merged-input-state-hash 'state1290))]
                     [(hash-has-key? init-hash 'state1290)
                      (bv->signal (hash-ref init-hash 'state1290))]
                     [else
                      (log-warning
                       "state ~a with no initial value, init to 0, this may not be correct in the long term"
                       'state1290)
                      (bv->signal (bv 0 (bitvector 1)))])])
             (when (not (signal? state-value))
               (error "Expected signal"))
             (when (not (bv? (signal-value state-value)))
               (error "Signal value invalid"))
             state-value)]
          [btor1292 (signal (concat (signal-value btor102) (signal-value btor1290))
                            (merge-state (list btor102 btor1290)))]
          [btor1293 (signal (bool->bitvector (bveq (signal-value btor1292) (signal-value btor105)))
                            (merge-state (list btor1292 btor105)))]
          [btor1294 (if (bitvector->bool (signal-value btor1293)) btor1289 btor1288)]
          [btor1295 (if (bitvector->bool (signal-value btor1254)) btor1294 btor1287)]
          [btor1296 (if (bitvector->bool (signal-value btor1257)) btor1295 btor904)]
          [btor1297 (signal (concat (signal-value btor951) (signal-value btor1296))
                            (merge-state (list btor951 btor1296)))]
          [btor1298 (bv->signal (zero-extend (signal-value btor97) (bitvector 2)) btor97)]
          [btor1299 (signal (bool->bitvector (bveq (signal-value btor1277) (signal-value btor1298)))
                            (merge-state (list btor1277 btor1298)))]
          [btor1300 (if (bitvector->bool (signal-value btor1299)) btor1297 btor1282)]
          [btor1301 (signal (apply bvor (bitvector->bits (signal-value btor1277)))
                            (signal-state btor1277))]
          [btor1302 (signal (bvnot (signal-value btor1301)) (merge-state (list btor1301)))]
          [btor1303 (if (bitvector->bool (signal-value btor1302)) btor892 btor1300)]
          [btor1304 (signal (bvxor (signal-value btor1275) (signal-value btor1303))
                            (merge-state (list btor1275 btor1303)))]
          [btor1305 (signal (bvand (signal-value btor1274) (signal-value btor1303))
                            (merge-state (list btor1274 btor1303)))]
          [btor1306 (signal (bvand (signal-value btor896) (signal-value btor1303))
                            (merge-state (list btor896 btor1303)))]
          [btor1307 (signal (bvor (signal-value btor1305) (signal-value btor1306))
                            (merge-state (list btor1305 btor1306)))]
          [btor1308 (signal (bvand (signal-value btor1274) (signal-value btor896))
                            (merge-state (list btor1274 btor896)))]
          [btor1309 (signal (bvor (signal-value btor1307) (signal-value btor1308))
                            (merge-state (list btor1307 btor1308)))]
          [btor1310 (signal (extract 3 3 (signal-value btor402)) (signal-state btor402))]
          [btor1311 (if (bitvector->bool (signal-value btor1310)) btor1309 btor1304)]
          [btor1312 (signal (extract 2 2 (signal-value btor402)) (signal-state btor402))]
          [btor1313 (if (bitvector->bool (signal-value btor1312)) btor892 btor1309)]
          [btor1314 (signal (extract 11 11 (signal-value btor1313)) (signal-state btor1313))]
          [btor1315 (signal (bvand (signal-value btor1314) (signal-value btor419))
                            (merge-state (list btor1314 btor419)))]
          [btor1316 (signal (extract 23 23 (signal-value btor1313)) (signal-state btor1313))]
          [btor1317 (signal (bvand (signal-value btor1316) (signal-value btor1257))
                            (merge-state (list btor1316 btor1257)))]
          [btor1318 (signal (extract 35 35 (signal-value btor1313)) (signal-state btor1313))]
          [btor1319 (signal (bvand (signal-value btor1318) (signal-value btor419))
                            (merge-state (list btor1318 btor419)))]
          [btor1320 (signal (extract 10 0 (signal-value btor1313)) (signal-state btor1313))]
          [btor1321 (signal (concat (signal-value btor1320) (signal-value btor248))
                            (merge-state (list btor1320 btor248)))]
          [btor1322 (signal (concat (signal-value btor1315) (signal-value btor1321))
                            (merge-state (list btor1315 btor1321)))]
          [btor1323 (signal (extract 22 12 (signal-value btor1313)) (signal-state btor1313))]
          [btor1324 (signal (concat (signal-value btor1323) (signal-value btor1322))
                            (merge-state (list btor1323 btor1322)))]
          [btor1325 (signal (concat (signal-value btor1317) (signal-value btor1324))
                            (merge-state (list btor1317 btor1324)))]
          [btor1326 (signal (extract 34 24 (signal-value btor1313)) (signal-state btor1313))]
          [btor1327 (signal (concat (signal-value btor1326) (signal-value btor1325))
                            (merge-state (list btor1326 btor1325)))]
          [btor1328 (signal (concat (signal-value btor1319) (signal-value btor1327))
                            (merge-state (list btor1319 btor1327)))]
          [btor1329 (signal (extract 46 36 (signal-value btor1313)) (signal-state btor1313))]
          [btor1330 (signal (concat (signal-value btor1329) (signal-value btor1328))
                            (merge-state (list btor1329 btor1328)))]
          [btor1331 (signal (bvand (signal-value btor1311) (signal-value btor1330))
                            (merge-state (list btor1311 btor1330)))]
          [btor1332 unnamed-input-1332]
          [btor1333 (signal (extract 8 7 (signal-value btor635)) (signal-state btor635))]
          [btor1334 (signal (bool->bitvector (bveq (signal-value btor1333) (signal-value btor637)))
                            (merge-state (list btor1333 btor637)))]
          [btor1335 (if (bitvector->bool (signal-value btor1334)) btor885 btor1332)]
          [btor1336 (signal (bool->bitvector (bveq (signal-value btor1333) (signal-value btor105)))
                            (merge-state (list btor1333 btor105)))]
          [btor1337 (if (bitvector->bool (signal-value btor1336)) btor77 btor1335)]
          [btor1338 (bv->signal (zero-extend (signal-value btor97) (bitvector 2)) btor97)]
          [btor1339 (signal (bool->bitvector (bveq (signal-value btor1333) (signal-value btor1338)))
                            (merge-state (list btor1333 btor1338)))]
          [btor1340 (if (bitvector->bool (signal-value btor1339)) btor538 btor1337)]
          [btor1341 (signal (apply bvor (bitvector->bits (signal-value btor1333)))
                            (signal-state btor1333))]
          [btor1342 (signal (bvnot (signal-value btor1341)) (merge-state (list btor1341)))]
          [btor1343 (if (bitvector->bool (signal-value btor1342)) btor892 btor1340)]
          [btor1344 (signal (bvand (signal-value btor1343) (signal-value btor1330))
                            (merge-state (list btor1343 btor1330)))]
          [btor1345 (signal (bvor (signal-value btor1331) (signal-value btor1344))
                            (merge-state (list btor1331 btor1344)))]
          [btor1346 (signal (bvand (signal-value btor1311) (signal-value btor1343))
                            (merge-state (list btor1311 btor1343)))]
          [btor1347 (signal (bvor (signal-value btor1345) (signal-value btor1346))
                            (merge-state (list btor1345 btor1346)))]
          [btor1348 (signal (extract 35 35 (signal-value btor1347)) (signal-state btor1347))]
          [btor1349 (signal (bvand (signal-value btor419) (signal-value btor1348))
                            (merge-state (list btor419 btor1348)))]
          [btor1350 (signal (extract 47 36 (signal-value btor1347)) (signal-state btor1347))]
          [btor1351 (signal (concat (signal-value btor1350) (signal-value btor1349))
                            (merge-state (list btor1350 btor1349)))]
          [btor1352 (bv->signal (zero-extend (signal-value btor1351) (bitvector 14)) btor1351)]
          [btor1353 (signal (bvxor (signal-value btor1311) (signal-value btor1330))
                            (merge-state (list btor1311 btor1330)))]
          [btor1354 (signal (bvxor (signal-value btor1353) (signal-value btor1343))
                            (merge-state (list btor1353 btor1343)))]
          [btor1355 (signal (extract 47 36 (signal-value btor1354)) (signal-state btor1354))]
          [btor1356 (signal (extract 47 47 (signal-value btor1313)) (signal-state btor1313))]
          [btor1357 (signal (concat (signal-value btor1356) (signal-value btor1355))
                            (merge-state (list btor1356 btor1355)))]
          [btor1358 (bv->signal (zero-extend (signal-value btor1357) (bitvector 14)) btor1357)]
          [btor1359 (signal (bvadd (signal-value btor1352) (signal-value btor1358))
                            (merge-state (list btor1352 btor1358)))]
          [btor1360 (signal (extract 23 23 (signal-value btor1347)) (signal-state btor1347))]
          [btor1361 (signal (bvand (signal-value btor1257) (signal-value btor1360))
                            (merge-state (list btor1257 btor1360)))]
          [btor1362 (signal (extract 34 24 (signal-value btor1347)) (signal-state btor1347))]
          [btor1363 (signal (concat (signal-value btor1362) (signal-value btor1361))
                            (merge-state (list btor1362 btor1361)))]
          [btor1364 (bv->signal (zero-extend (signal-value btor1363) (bitvector 13)) btor1363)]
          [btor1365 (signal (extract 35 24 (signal-value btor1354)) (signal-state btor1354))]
          [btor1366 (bv->signal (zero-extend (signal-value btor1365) (bitvector 13)) btor1365)]
          [btor1367 (signal (bvadd (signal-value btor1364) (signal-value btor1366))
                            (merge-state (list btor1364 btor1366)))]
          [btor1368 (signal (extract 11 11 (signal-value btor1347)) (signal-state btor1347))]
          [btor1369 (signal (bvand (signal-value btor419) (signal-value btor1368))
                            (merge-state (list btor419 btor1368)))]
          [btor1370 (signal (extract 22 12 (signal-value btor1347)) (signal-state btor1347))]
          [btor1371 (signal (concat (signal-value btor1370) (signal-value btor1369))
                            (merge-state (list btor1370 btor1369)))]
          [btor1372 (bv->signal (zero-extend (signal-value btor1371) (bitvector 13)) btor1371)]
          [btor1373 (signal (extract 23 12 (signal-value btor1354)) (signal-state btor1354))]
          [btor1374 (bv->signal (zero-extend (signal-value btor1373) (bitvector 13)) btor1373)]
          [btor1375 (signal (bvadd (signal-value btor1372) (signal-value btor1374))
                            (merge-state (list btor1372 btor1374)))]
          [btor1376 unnamed-input-1376]
          [btor1377 (signal (extract 47 47 (signal-value btor538)) (signal-state btor538))]
          [btor1378 (signal (bvnot (signal-value btor1377)) (merge-state (list btor1377)))]
          [btor1379 (signal (extract 0 0 (signal-value btor30)) (signal-state btor30))]
          [btor1380 (signal (bool->bitvector ((compose1 not bveq) (signal-value btor1379)
                                                                  (signal-value btor97)))
                            (merge-state (list btor1379 btor97)))]
          [btor1381 (signal (bvand (signal-value btor1380) (signal-value btor1379))
                            (merge-state (list btor1380 btor1379)))]
          [btor1382 (signal (extract 1 1 (signal-value btor30)) (signal-state btor30))]
          [btor1383 (signal (bool->bitvector ((compose1 not bveq) (signal-value btor1382)
                                                                  (signal-value btor97)))
                            (merge-state (list btor1382 btor97)))]
          [btor1384 (signal (bvand (signal-value btor1383) (signal-value btor1382))
                            (merge-state (list btor1383 btor1382)))]
          [btor1385 (signal (extract 2 2 (signal-value btor30)) (signal-state btor30))]
          [btor1386 (signal (bool->bitvector ((compose1 not bveq) (signal-value btor1385)
                                                                  (signal-value btor97)))
                            (merge-state (list btor1385 btor97)))]
          [btor1387 (signal (bvand (signal-value btor1386) (signal-value btor1385))
                            (merge-state (list btor1386 btor1385)))]
          [btor1388 (signal (concat (signal-value btor1384) (signal-value btor1381))
                            (merge-state (list btor1384 btor1381)))]
          [btor1389 (signal (concat (signal-value btor1387) (signal-value btor1388))
                            (merge-state (list btor1387 btor1388)))]
          [btor1390
           (let* ([state-value
                   (cond
                     [(hash-has-key? merged-input-state-hash 'state1390)
                      (bv->signal (hash-ref merged-input-state-hash 'state1390))]
                     [(hash-has-key? init-hash 'state1390)
                      (bv->signal (hash-ref init-hash 'state1390))]
                     [else
                      (log-warning
                       "state ~a with no initial value, init to 0, this may not be correct in the long term"
                       'state1390)
                      (bv->signal (bv 0 (bitvector 3)))])])
             (when (not (signal? state-value))
               (error "Expected signal"))
             (when (not (bv? (signal-value state-value)))
               (error "Signal value invalid"))
             state-value)]
          [btor1391
           (let* ([state-value
                   (cond
                     [(hash-has-key? merged-input-state-hash 'state1391)
                      (bv->signal (hash-ref merged-input-state-hash 'state1391))]
                     [(hash-has-key? init-hash 'state1391)
                      (bv->signal (hash-ref init-hash 'state1391))]
                     [else
                      (log-warning
                       "state ~a with no initial value, init to 0, this may not be correct in the long term"
                       'state1391)
                      (bv->signal (bv 0 (bitvector 3)))])])
             (when (not (signal? state-value))
               (error "Expected signal"))
             (when (not (bv? (signal-value state-value)))
               (error "Signal value invalid"))
             state-value)]
          [btor1392
           (let* ([state-value
                   (cond
                     [(hash-has-key? merged-input-state-hash 'state1392)
                      (bv->signal (hash-ref merged-input-state-hash 'state1392))]
                     [(hash-has-key? init-hash 'state1392)
                      (bv->signal (hash-ref init-hash 'state1392))]
                     [else
                      (log-warning
                       "state ~a with no initial value, init to 0, this may not be correct in the long term"
                       'state1392)
                      (bv->signal (bv 0 (bitvector 1)))])])
             (when (not (signal? state-value))
               (error "Expected signal"))
             (when (not (bv? (signal-value state-value)))
               (error "Signal value invalid"))
             state-value)]
          [btor1394 (signal (concat (signal-value btor102) (signal-value btor1392))
                            (merge-state (list btor102 btor1392)))]
          [btor1395 (signal (bool->bitvector (bveq (signal-value btor1394) (signal-value btor105)))
                            (merge-state (list btor1394 btor105)))]
          [btor1396 (if (bitvector->bool (signal-value btor1395)) btor1391 btor1390)]
          [btor1397 (signal (extract 0 0 (signal-value btor31)) (signal-state btor31))]
          [btor1398 (if (bitvector->bool (signal-value btor1397)) btor1396 btor1389)]
          [btor1399 (signal (bool->bitvector (bveq (signal-value btor1398) (signal-value btor253)))
                            (merge-state (list btor1398 btor253)))]
          [btor1400 (if (bitvector->bool (signal-value btor1399)) btor1378 btor1376)]
          [btor1401 (signal (extract 26 26 (signal-value btor1146)) (signal-state btor1146))]
          [btor1402 (signal (extract 17 17 (signal-value btor1184)) (signal-state btor1184))]
          [btor1403 (signal (bvxor (signal-value btor1401) (signal-value btor1402))
                            (merge-state (list btor1401 btor1402)))]
          [btor1404 (signal (bvnot (signal-value btor1403)) (merge-state (list btor1403)))]
          [btor1405
           (let* ([state-value
                   (cond
                     [(hash-has-key? merged-input-state-hash 'state1405)
                      (bv->signal (hash-ref merged-input-state-hash 'state1405))]
                     [(hash-has-key? init-hash 'state1405)
                      (bv->signal (hash-ref init-hash 'state1405))]
                     [else
                      (log-warning
                       "state ~a with no initial value, init to 0, this may not be correct in the long term"
                       'state1405)
                      (bv->signal (bv 0 (bitvector 1)))])])
             (when (not (signal? state-value))
               (error "Expected signal"))
             (when (not (bv? (signal-value state-value)))
               (error "Signal value invalid"))
             state-value)]
          [btor1406
           (let* ([state-value
                   (cond
                     [(hash-has-key? merged-input-state-hash 'state1406)
                      (bv->signal (hash-ref merged-input-state-hash 'state1406))]
                     [(hash-has-key? init-hash 'state1406)
                      (bv->signal (hash-ref init-hash 'state1406))]
                     [else
                      (log-warning
                       "state ~a with no initial value, init to 0, this may not be correct in the long term"
                       'state1406)
                      (bv->signal (bv 0 (bitvector 1)))])])
             (when (not (signal? state-value))
               (error "Expected signal"))
             (when (not (bv? (signal-value state-value)))
               (error "Signal value invalid"))
             state-value)]
          [btor1407
           (let* ([state-value
                   (cond
                     [(hash-has-key? merged-input-state-hash 'state1407)
                      (bv->signal (hash-ref merged-input-state-hash 'state1407))]
                     [(hash-has-key? init-hash 'state1407)
                      (bv->signal (hash-ref init-hash 'state1407))]
                     [else
                      (log-warning
                       "state ~a with no initial value, init to 0, this may not be correct in the long term"
                       'state1407)
                      (bv->signal (bv 0 (bitvector 1)))])])
             (when (not (signal? state-value))
               (error "Expected signal"))
             (when (not (bv? (signal-value state-value)))
               (error "Signal value invalid"))
             state-value)]
          [btor1409 (signal (concat (signal-value btor102) (signal-value btor1407))
                            (merge-state (list btor102 btor1407)))]
          [btor1410 (signal (bool->bitvector (bveq (signal-value btor1409) (signal-value btor105)))
                            (merge-state (list btor1409 btor105)))]
          [btor1411 (if (bitvector->bool (signal-value btor1410)) btor1406 btor1405)]
          [btor1412 (if (bitvector->bool (signal-value btor1254)) btor1411 btor1404)]
          [btor1413 (signal (bvnot (signal-value btor1412)) (merge-state (list btor1412)))]
          [btor1414 (bv->signal (bv 6 (bitvector 3)))]
          [btor1415 (signal (bool->bitvector (bveq (signal-value btor1398) (signal-value btor1414)))
                            (merge-state (list btor1398 btor1414)))]
          [btor1416 (if (bitvector->bool (signal-value btor1415)) btor1413 btor1400)]
          [btor1417 (signal (bool->bitvector (bveq (signal-value btor1398) (signal-value btor676)))
                            (merge-state (list btor1398 btor676)))]
          [btor1418 (if (bitvector->bool (signal-value btor1417)) btor1377 btor1416)]
          [btor1419
           (let* ([state-value
                   (cond
                     [(hash-has-key? merged-input-state-hash 'state1419)
                      (bv->signal (hash-ref merged-input-state-hash 'state1419))]
                     [(hash-has-key? init-hash 'state1419)
                      (bv->signal (hash-ref init-hash 'state1419))]
                     [else
                      (log-warning
                       "state ~a with no initial value, init to 0, this may not be correct in the long term"
                       'state1419)
                      (bv->signal (bv 0 (bitvector 1)))])])
             (when (not (signal? state-value))
               (error "Expected signal"))
             (when (not (bv? (signal-value state-value)))
               (error "Signal value invalid"))
             state-value)]
          [btor1420
           (let* ([state-value
                   (cond
                     [(hash-has-key? merged-input-state-hash 'state1420)
                      (bv->signal (hash-ref merged-input-state-hash 'state1420))]
                     [(hash-has-key? init-hash 'state1420)
                      (bv->signal (hash-ref init-hash 'state1420))]
                     [else
                      (log-warning
                       "state ~a with no initial value, init to 0, this may not be correct in the long term"
                       'state1420)
                      (bv->signal (bv 0 (bitvector 1)))])])
             (when (not (signal? state-value))
               (error "Expected signal"))
             (when (not (bv? (signal-value state-value)))
               (error "Signal value invalid"))
             state-value)]
          [btor1421
           (let* ([state-value
                   (cond
                     [(hash-has-key? merged-input-state-hash 'state1421)
                      (bv->signal (hash-ref merged-input-state-hash 'state1421))]
                     [(hash-has-key? init-hash 'state1421)
                      (bv->signal (hash-ref init-hash 'state1421))]
                     [else
                      (log-warning
                       "state ~a with no initial value, init to 0, this may not be correct in the long term"
                       'state1421)
                      (bv->signal (bv 0 (bitvector 1)))])])
             (when (not (signal? state-value))
               (error "Expected signal"))
             (when (not (bv? (signal-value state-value)))
               (error "Signal value invalid"))
             state-value)]
          [btor1423 (signal (concat (signal-value btor102) (signal-value btor1421))
                            (merge-state (list btor102 btor1421)))]
          [btor1424 (signal (bool->bitvector (bveq (signal-value btor1423) (signal-value btor105)))
                            (merge-state (list btor1423 btor105)))]
          [btor1425 (if (bitvector->bool (signal-value btor1424)) btor1420 btor1419)]
          [btor1426
           (let* ([state-value
                   (cond
                     [(hash-has-key? merged-input-state-hash 'state1426)
                      (bv->signal (hash-ref merged-input-state-hash 'state1426))]
                     [(hash-has-key? init-hash 'state1426)
                      (bv->signal (hash-ref init-hash 'state1426))]
                     [else
                      (log-warning
                       "state ~a with no initial value, init to 0, this may not be correct in the long term"
                       'state1426)
                      (bv->signal (bv 0 (bitvector 4)))])])
             (when (not (signal? state-value))
               (error "Expected signal"))
             (when (not (bv? (signal-value state-value)))
               (error "Signal value invalid"))
             state-value)]
          [btor1427
           (let* ([state-value
                   (cond
                     [(hash-has-key? merged-input-state-hash 'state1427)
                      (bv->signal (hash-ref merged-input-state-hash 'state1427))]
                     [(hash-has-key? init-hash 'state1427)
                      (bv->signal (hash-ref init-hash 'state1427))]
                     [else
                      (log-warning
                       "state ~a with no initial value, init to 0, this may not be correct in the long term"
                       'state1427)
                      (bv->signal (bv 0 (bitvector 4)))])])
             (when (not (signal? state-value))
               (error "Expected signal"))
             (when (not (bv? (signal-value state-value)))
               (error "Signal value invalid"))
             state-value)]
          [btor1428
           (let* ([state-value
                   (cond
                     [(hash-has-key? merged-input-state-hash 'state1428)
                      (bv->signal (hash-ref merged-input-state-hash 'state1428))]
                     [(hash-has-key? init-hash 'state1428)
                      (bv->signal (hash-ref init-hash 'state1428))]
                     [else
                      (log-warning
                       "state ~a with no initial value, init to 0, this may not be correct in the long term"
                       'state1428)
                      (bv->signal (bv 0 (bitvector 1)))])])
             (when (not (signal? state-value))
               (error "Expected signal"))
             (when (not (bv? (signal-value state-value)))
               (error "Signal value invalid"))
             state-value)]
          [btor1430 (signal (concat (signal-value btor102) (signal-value btor1428))
                            (merge-state (list btor102 btor1428)))]
          [btor1431 (signal (bool->bitvector (bveq (signal-value btor1430) (signal-value btor105)))
                            (merge-state (list btor1430 btor105)))]
          [btor1432 (if (bitvector->bool (signal-value btor1431)) btor1427 btor1426)]
          [btor1433 (signal (extract 3 3 (signal-value btor1432)) (signal-state btor1432))]
          [btor1434 (signal (bvxor (signal-value btor1425) (signal-value btor1433))
                            (merge-state (list btor1425 btor1433)))]
          [btor1435 (signal (bvnot (signal-value btor1434)) (merge-state (list btor1434)))]
          [btor1436 (signal (bool->bitvector (bveq (signal-value btor1398) (signal-value btor679)))
                            (merge-state (list btor1398 btor679)))]
          [btor1437 (if (bitvector->bool (signal-value btor1436)) btor1435 btor1418)]
          [btor1438 (signal (extract 47 47 (signal-value btor74)) (signal-state btor74))]
          [btor1439 (signal (bvnot (signal-value btor1438)) (merge-state (list btor1438)))]
          [btor1440 (bv->signal (zero-extend (signal-value btor637) (bitvector 3)) btor637)]
          [btor1441 (signal (bool->bitvector (bveq (signal-value btor1398) (signal-value btor1440)))
                            (merge-state (list btor1398 btor1440)))]
          [btor1442 (if (bitvector->bool (signal-value btor1441)) btor1439 btor1437)]
          [btor1443 (signal (bvnot (signal-value btor26)) (merge-state (list btor26)))]
          [btor1444 (bv->signal (zero-extend (signal-value btor105) (bitvector 3)) btor105)]
          [btor1445 (signal (bool->bitvector (bveq (signal-value btor1398) (signal-value btor1444)))
                            (merge-state (list btor1398 btor1444)))]
          [btor1446 (if (bitvector->bool (signal-value btor1445)) btor1443 btor1442)]
          [btor1447 (bv->signal (zero-extend (signal-value btor97) (bitvector 3)) btor97)]
          [btor1448 (signal (bool->bitvector (bveq (signal-value btor1398) (signal-value btor1447)))
                            (merge-state (list btor1398 btor1447)))]
          [btor1449 (if (bitvector->bool (signal-value btor1448)) btor1438 btor1446)]
          [btor1450 (signal (bool->bitvector ((compose1 not bveq) (signal-value btor27)
                                                                  (signal-value btor97)))
                            (merge-state (list btor27 btor97)))]
          [btor1451 (signal (bvxor (signal-value btor27) (signal-value btor53))
                            (merge-state (list btor27 btor53)))]
          [btor1452 (signal (bvand (signal-value btor1450) (signal-value btor1451))
                            (merge-state (list btor1450 btor1451)))]
          [btor1453
           (let* ([state-value
                   (cond
                     [(hash-has-key? merged-input-state-hash 'state1453)
                      (bv->signal (hash-ref merged-input-state-hash 'state1453))]
                     [(hash-has-key? init-hash 'state1453)
                      (bv->signal (hash-ref init-hash 'state1453))]
                     [else
                      (log-warning
                       "state ~a with no initial value, init to 0, this may not be correct in the long term"
                       'state1453)
                      (bv->signal (bv 0 (bitvector 1)))])])
             (when (not (signal? state-value))
               (error "Expected signal"))
             (when (not (bv? (signal-value state-value)))
               (error "Signal value invalid"))
             state-value)]
          [btor1454
           (let* ([state-value
                   (cond
                     [(hash-has-key? merged-input-state-hash 'state1454)
                      (bv->signal (hash-ref merged-input-state-hash 'state1454))]
                     [(hash-has-key? init-hash 'state1454)
                      (bv->signal (hash-ref init-hash 'state1454))]
                     [else
                      (log-warning
                       "state ~a with no initial value, init to 0, this may not be correct in the long term"
                       'state1454)
                      (bv->signal (bv 0 (bitvector 1)))])])
             (when (not (signal? state-value))
               (error "Expected signal"))
             (when (not (bv? (signal-value state-value)))
               (error "Signal value invalid"))
             state-value)]
          [btor1455
           (let* ([state-value
                   (cond
                     [(hash-has-key? merged-input-state-hash 'state1455)
                      (bv->signal (hash-ref merged-input-state-hash 'state1455))]
                     [(hash-has-key? init-hash 'state1455)
                      (bv->signal (hash-ref init-hash 'state1455))]
                     [else
                      (log-warning
                       "state ~a with no initial value, init to 0, this may not be correct in the long term"
                       'state1455)
                      (bv->signal (bv 0 (bitvector 1)))])])
             (when (not (signal? state-value))
               (error "Expected signal"))
             (when (not (bv? (signal-value state-value)))
               (error "Signal value invalid"))
             state-value)]
          [btor1457 (signal (concat (signal-value btor102) (signal-value btor1455))
                            (merge-state (list btor102 btor1455)))]
          [btor1458 (signal (bool->bitvector (bveq (signal-value btor1457) (signal-value btor105)))
                            (merge-state (list btor1457 btor105)))]
          [btor1459 (if (bitvector->bool (signal-value btor1458)) btor1454 btor1453)]
          [btor1460 (signal (extract 0 0 (signal-value btor28)) (signal-state btor28))]
          [btor1461 (if (bitvector->bool (signal-value btor1460)) btor1459 btor1452)]
          [btor1462 (signal (bvnot (signal-value btor1461)) (merge-state (list btor1461)))]
          [btor1463 (signal (apply bvor (bitvector->bits (signal-value btor1398)))
                            (signal-state btor1398))]
          [btor1464 (signal (bvnot (signal-value btor1463)) (merge-state (list btor1463)))]
          [btor1465 (if (bitvector->bool (signal-value btor1464)) btor1462 btor1449)]
          [btor1466 (signal (bvnot (signal-value btor1465)) (merge-state (list btor1465)))]
          [btor1467 (signal (bvor (signal-value btor1310) (signal-value btor1312))
                            (merge-state (list btor1310 btor1312)))]
          [btor1468 (if (bitvector->bool (signal-value btor1467)) btor248 btor1466)]
          [btor1469 (signal (extract 10 0 (signal-value btor1347)) (signal-state btor1347))]
          [btor1470 (signal (concat (signal-value btor1469) (signal-value btor1468))
                            (merge-state (list btor1469 btor1468)))]
          [btor1471 (bv->signal (zero-extend (signal-value btor1470) (bitvector 13)) btor1470)]
          [btor1472 (signal (extract 11 0 (signal-value btor1354)) (signal-state btor1354))]
          [btor1473 (bv->signal (zero-extend (signal-value btor1472) (bitvector 13)) btor1472)]
          [btor1474 (signal (bvadd (signal-value btor1471) (signal-value btor1473))
                            (merge-state (list btor1471 btor1473)))]
          [btor1475 (signal (extract 12 12 (signal-value btor1474)) (signal-state btor1474))]
          [btor1476 (signal (bvand (signal-value btor419) (signal-value btor1475))
                            (merge-state (list btor419 btor1475)))]
          [btor1477 (bv->signal (zero-extend (signal-value btor1476) (bitvector 13)) btor1476)]
          [btor1478 (signal (bvadd (signal-value btor1375) (signal-value btor1477))
                            (merge-state (list btor1375 btor1477)))]
          [btor1479 (signal (extract 12 12 (signal-value btor1478)) (signal-state btor1478))]
          [btor1480 (signal (bvand (signal-value btor1257) (signal-value btor1479))
                            (merge-state (list btor1257 btor1479)))]
          [btor1481 (bv->signal (zero-extend (signal-value btor1480) (bitvector 13)) btor1480)]
          [btor1482 (signal (bvadd (signal-value btor1367) (signal-value btor1481))
                            (merge-state (list btor1367 btor1481)))]
          [btor1483 (signal (extract 12 12 (signal-value btor1482)) (signal-state btor1482))]
          [btor1484 (signal (bvand (signal-value btor419) (signal-value btor1483))
                            (merge-state (list btor419 btor1483)))]
          [btor1485 (bv->signal (zero-extend (signal-value btor1484) (bitvector 14)) btor1484)]
          [btor1486 (signal (bvadd (signal-value btor1359) (signal-value btor1485))
                            (merge-state (list btor1359 btor1485)))]
          [btor1487 (signal (extract 12 12 (signal-value btor1486)) (signal-state btor1486))]
          [btor1488 (signal (bvxor (signal-value btor405) (signal-value btor1487))
                            (merge-state (list btor405 btor1487)))]
          [btor1489 (signal (bvxor (signal-value btor405) (signal-value btor1488))
                            (merge-state (list btor405 btor1488)))]
          [btor1490 (signal (extract 0 0 (signal-value btor76)) (signal-state btor76))]
          [btor1491 (if (bitvector->bool (signal-value btor1490)) btor1434 btor1489)]
          [btor1493 (signal (bvxor (signal-value btor1368) (signal-value btor1475))
                            (merge-state (list btor1368 btor1475)))]
          [btor1494 (signal (bvxor (signal-value btor1493) (signal-value btor1314))
                            (merge-state (list btor1493 btor1314)))]
          [btor1495 (signal (bvxor (signal-value btor405) (signal-value btor1494))
                            (merge-state (list btor405 btor1494)))]
          [btor1496 (signal (extract 3 0 (signal-value btor635)) (signal-state btor635))]
          [btor1497 (bv->signal (zero-extend (signal-value btor676) (bitvector 4)) btor676)]
          [btor1498 (signal (bool->bitvector (bveq (signal-value btor1496) (signal-value btor1497)))
                            (merge-state (list btor1496 btor1497)))]
          [btor1499 (signal (extract 3 2 (signal-value btor402)) (signal-state btor402))]
          [btor1500 (signal (apply bvor (bitvector->bits (signal-value btor1499)))
                            (signal-state btor1499))]
          [btor1501 (signal (bvor (signal-value btor1498) (signal-value btor1500))
                            (merge-state (list btor1498 btor1500)))]
          [btor1502 (if (bitvector->bool (signal-value btor1501)) btor248 btor1495)]
          [btor1503 (bv->signal (zero-extend (signal-value btor97) (bitvector 2)) btor97)]
          [btor1504 (signal (bool->bitvector (bveq (signal-value btor417) (signal-value btor1503)))
                            (merge-state (list btor417 btor1503)))]
          [btor1505 (if (bitvector->bool (signal-value btor1504)) btor1502 btor248)]
          [btor1506 (signal (bvxor (signal-value btor1360) (signal-value btor1479))
                            (merge-state (list btor1360 btor1479)))]
          [btor1507 (signal (bvxor (signal-value btor1506) (signal-value btor1316))
                            (merge-state (list btor1506 btor1316)))]
          [btor1508 (signal (bvxor (signal-value btor405) (signal-value btor1507))
                            (merge-state (list btor405 btor1507)))]
          [btor1509 (if (bitvector->bool (signal-value btor1501)) btor248 btor1508)]
          [btor1510 (signal (apply bvor (bitvector->bits (signal-value btor417)))
                            (signal-state btor417))]
          [btor1511 (if (bitvector->bool (signal-value btor1510)) btor1509 btor248)]
          [btor1512 (signal (bvxor (signal-value btor1348) (signal-value btor1483))
                            (merge-state (list btor1348 btor1483)))]
          [btor1513 (signal (bvxor (signal-value btor1512) (signal-value btor1318))
                            (merge-state (list btor1512 btor1318)))]
          [btor1514 (signal (bvxor (signal-value btor405) (signal-value btor1513))
                            (merge-state (list btor405 btor1513)))]
          [btor1515 (if (bitvector->bool (signal-value btor1501)) btor248 btor1514)]
          [btor1516 (if (bitvector->bool (signal-value btor1504)) btor1515 btor248)]
          [btor1517 (signal (concat (signal-value btor1511) (signal-value btor1505))
                            (merge-state (list btor1511 btor1505)))]
          [btor1518 (signal (concat (signal-value btor1516) (signal-value btor1517))
                            (merge-state (list btor1516 btor1517)))]
          [btor1519 (signal (concat (signal-value btor1488) (signal-value btor1518))
                            (merge-state (list btor1488 btor1518)))]
          [btor1520 (if (bitvector->bool (signal-value btor1490)) btor1432 btor1519)]
          [btor1522 (signal (extract 13 13 (signal-value btor1486)) (signal-state btor1486))]
          [btor1523
           (let* ([state-value
                   (cond
                     [(hash-has-key? merged-input-state-hash 'state1523)
                      (bv->signal (hash-ref merged-input-state-hash 'state1523))]
                     [(hash-has-key? init-hash 'state1523)
                      (bv->signal (hash-ref init-hash 'state1523))]
                     [else
                      (log-warning
                       "state ~a with no initial value, init to 0, this may not be correct in the long term"
                       'state1523)
                      (bv->signal (bv 0 (bitvector 1)))])])
             (when (not (signal? state-value))
               (error "Expected signal"))
             (when (not (bv? (signal-value state-value)))
               (error "Signal value invalid"))
             state-value)]
          [btor1524
           (let* ([state-value
                   (cond
                     [(hash-has-key? merged-input-state-hash 'state1524)
                      (bv->signal (hash-ref merged-input-state-hash 'state1524))]
                     [(hash-has-key? init-hash 'state1524)
                      (bv->signal (hash-ref init-hash 'state1524))]
                     [else
                      (log-warning
                       "state ~a with no initial value, init to 0, this may not be correct in the long term"
                       'state1524)
                      (bv->signal (bv 0 (bitvector 1)))])])
             (when (not (signal? state-value))
               (error "Expected signal"))
             (when (not (bv? (signal-value state-value)))
               (error "Signal value invalid"))
             state-value)]
          [btor1525
           (let* ([state-value
                   (cond
                     [(hash-has-key? merged-input-state-hash 'state1525)
                      (bv->signal (hash-ref merged-input-state-hash 'state1525))]
                     [(hash-has-key? init-hash 'state1525)
                      (bv->signal (hash-ref init-hash 'state1525))]
                     [else
                      (log-warning
                       "state ~a with no initial value, init to 0, this may not be correct in the long term"
                       'state1525)
                      (bv->signal (bv 0 (bitvector 1)))])])
             (when (not (signal? state-value))
               (error "Expected signal"))
             (when (not (bv? (signal-value state-value)))
               (error "Signal value invalid"))
             state-value)]
          [btor1527 (signal (concat (signal-value btor102) (signal-value btor1525))
                            (merge-state (list btor102 btor1525)))]
          [btor1528 (signal (bool->bitvector (bveq (signal-value btor1527) (signal-value btor105)))
                            (merge-state (list btor1527 btor105)))]
          [btor1529 (if (bitvector->bool (signal-value btor1528)) btor1524 btor1523)]
          [btor1530 (if (bitvector->bool (signal-value btor1490)) btor1529 btor1522)]
          [btor1532 (bv->signal (bv 17 (bitvector 5)))]
          [btor1533 (signal (bool->bitvector (bveq (signal-value btor89) (signal-value btor1532)))
                            (merge-state (list btor89 btor1532)))]
          [btor1534 (if (bitvector->bool (signal-value btor1533)) btor97 btor248)]
          [btor1535 (bv->signal (bv 9 (bitvector 4)))]
          [btor1536 (bv->signal (zero-extend (signal-value btor1535) (bitvector 5)) btor1535)]
          [btor1537 (signal (bool->bitvector (bveq (signal-value btor89) (signal-value btor1536)))
                            (merge-state (list btor89 btor1536)))]
          [btor1538 (if (bitvector->bool (signal-value btor1537)) btor248 btor1534)]
          [btor1539 (if (bitvector->bool (signal-value btor1538)) btor885 btor73)]
          [btor1540 (signal (extract 1 1 (signal-value btor402)) (signal-state btor402))]
          [btor1541 (signal (extract 1 1 (signal-value btor402)) (signal-state btor402))]
          [btor1542 (signal (concat (signal-value btor1541) (signal-value btor1540))
                            (merge-state (list btor1541 btor1540)))]
          [btor1543 (signal (extract 1 1 (signal-value btor402)) (signal-state btor402))]
          [btor1544 (signal (concat (signal-value btor1543) (signal-value btor1542))
                            (merge-state (list btor1543 btor1542)))]
          [btor1545 (signal (extract 1 1 (signal-value btor402)) (signal-state btor402))]
          [btor1546 (signal (concat (signal-value btor1545) (signal-value btor1544))
                            (merge-state (list btor1545 btor1544)))]
          [btor1547 (signal (extract 1 1 (signal-value btor402)) (signal-state btor402))]
          [btor1548 (signal (concat (signal-value btor1547) (signal-value btor1546))
                            (merge-state (list btor1547 btor1546)))]
          [btor1549 (signal (extract 1 1 (signal-value btor402)) (signal-state btor402))]
          [btor1550 (signal (concat (signal-value btor1549) (signal-value btor1548))
                            (merge-state (list btor1549 btor1548)))]
          [btor1551 (signal (extract 1 1 (signal-value btor402)) (signal-state btor402))]
          [btor1552 (signal (concat (signal-value btor1551) (signal-value btor1550))
                            (merge-state (list btor1551 btor1550)))]
          [btor1553 (signal (extract 1 1 (signal-value btor402)) (signal-state btor402))]
          [btor1554 (signal (concat (signal-value btor1553) (signal-value btor1552))
                            (merge-state (list btor1553 btor1552)))]
          [btor1555 (signal (extract 1 1 (signal-value btor402)) (signal-state btor402))]
          [btor1556 (signal (concat (signal-value btor1555) (signal-value btor1554))
                            (merge-state (list btor1555 btor1554)))]
          [btor1557 (signal (extract 1 1 (signal-value btor402)) (signal-state btor402))]
          [btor1558 (signal (concat (signal-value btor1557) (signal-value btor1556))
                            (merge-state (list btor1557 btor1556)))]
          [btor1559 (signal (extract 1 1 (signal-value btor402)) (signal-state btor402))]
          [btor1560 (signal (concat (signal-value btor1559) (signal-value btor1558))
                            (merge-state (list btor1559 btor1558)))]
          [btor1561 (signal (extract 1 1 (signal-value btor402)) (signal-state btor402))]
          [btor1562 (signal (concat (signal-value btor1561) (signal-value btor1560))
                            (merge-state (list btor1561 btor1560)))]
          [btor1563 (signal (extract 1 1 (signal-value btor402)) (signal-state btor402))]
          [btor1564 (signal (concat (signal-value btor1563) (signal-value btor1562))
                            (merge-state (list btor1563 btor1562)))]
          [btor1565 (signal (extract 1 1 (signal-value btor402)) (signal-state btor402))]
          [btor1566 (signal (concat (signal-value btor1565) (signal-value btor1564))
                            (merge-state (list btor1565 btor1564)))]
          [btor1567 (signal (extract 1 1 (signal-value btor402)) (signal-state btor402))]
          [btor1568 (signal (concat (signal-value btor1567) (signal-value btor1566))
                            (merge-state (list btor1567 btor1566)))]
          [btor1569 (signal (extract 1 1 (signal-value btor402)) (signal-state btor402))]
          [btor1570 (signal (concat (signal-value btor1569) (signal-value btor1568))
                            (merge-state (list btor1569 btor1568)))]
          [btor1571 (signal (extract 1 1 (signal-value btor402)) (signal-state btor402))]
          [btor1572 (signal (concat (signal-value btor1571) (signal-value btor1570))
                            (merge-state (list btor1571 btor1570)))]
          [btor1573 (signal (extract 1 1 (signal-value btor402)) (signal-state btor402))]
          [btor1574 (signal (concat (signal-value btor1573) (signal-value btor1572))
                            (merge-state (list btor1573 btor1572)))]
          [btor1575 (signal (extract 1 1 (signal-value btor402)) (signal-state btor402))]
          [btor1576 (signal (concat (signal-value btor1575) (signal-value btor1574))
                            (merge-state (list btor1575 btor1574)))]
          [btor1577 (signal (extract 1 1 (signal-value btor402)) (signal-state btor402))]
          [btor1578 (signal (concat (signal-value btor1577) (signal-value btor1576))
                            (merge-state (list btor1577 btor1576)))]
          [btor1579 (signal (extract 1 1 (signal-value btor402)) (signal-state btor402))]
          [btor1580 (signal (concat (signal-value btor1579) (signal-value btor1578))
                            (merge-state (list btor1579 btor1578)))]
          [btor1581 (signal (extract 1 1 (signal-value btor402)) (signal-state btor402))]
          [btor1582 (signal (concat (signal-value btor1581) (signal-value btor1580))
                            (merge-state (list btor1581 btor1580)))]
          [btor1583 (signal (extract 1 1 (signal-value btor402)) (signal-state btor402))]
          [btor1584 (signal (concat (signal-value btor1583) (signal-value btor1582))
                            (merge-state (list btor1583 btor1582)))]
          [btor1585 (signal (extract 1 1 (signal-value btor402)) (signal-state btor402))]
          [btor1586 (signal (concat (signal-value btor1585) (signal-value btor1584))
                            (merge-state (list btor1585 btor1584)))]
          [btor1587 (signal (extract 1 1 (signal-value btor402)) (signal-state btor402))]
          [btor1588 (signal (concat (signal-value btor1587) (signal-value btor1586))
                            (merge-state (list btor1587 btor1586)))]
          [btor1589 (signal (extract 1 1 (signal-value btor402)) (signal-state btor402))]
          [btor1590 (signal (concat (signal-value btor1589) (signal-value btor1588))
                            (merge-state (list btor1589 btor1588)))]
          [btor1591 (signal (extract 1 1 (signal-value btor402)) (signal-state btor402))]
          [btor1592 (signal (concat (signal-value btor1591) (signal-value btor1590))
                            (merge-state (list btor1591 btor1590)))]
          [btor1593 (signal (extract 1 1 (signal-value btor402)) (signal-state btor402))]
          [btor1594 (signal (concat (signal-value btor1593) (signal-value btor1592))
                            (merge-state (list btor1593 btor1592)))]
          [btor1595 (signal (extract 1 1 (signal-value btor402)) (signal-state btor402))]
          [btor1596 (signal (concat (signal-value btor1595) (signal-value btor1594))
                            (merge-state (list btor1595 btor1594)))]
          [btor1597 (signal (extract 1 1 (signal-value btor402)) (signal-state btor402))]
          [btor1598 (signal (concat (signal-value btor1597) (signal-value btor1596))
                            (merge-state (list btor1597 btor1596)))]
          [btor1599 (signal (extract 1 1 (signal-value btor402)) (signal-state btor402))]
          [btor1600 (signal (concat (signal-value btor1599) (signal-value btor1598))
                            (merge-state (list btor1599 btor1598)))]
          [btor1601 (signal (extract 1 1 (signal-value btor402)) (signal-state btor402))]
          [btor1602 (signal (concat (signal-value btor1601) (signal-value btor1600))
                            (merge-state (list btor1601 btor1600)))]
          [btor1603 (signal (extract 1 1 (signal-value btor402)) (signal-state btor402))]
          [btor1604 (signal (concat (signal-value btor1603) (signal-value btor1602))
                            (merge-state (list btor1603 btor1602)))]
          [btor1605 (signal (extract 1 1 (signal-value btor402)) (signal-state btor402))]
          [btor1606 (signal (concat (signal-value btor1605) (signal-value btor1604))
                            (merge-state (list btor1605 btor1604)))]
          [btor1607 (signal (extract 1 1 (signal-value btor402)) (signal-state btor402))]
          [btor1608 (signal (concat (signal-value btor1607) (signal-value btor1606))
                            (merge-state (list btor1607 btor1606)))]
          [btor1609 (signal (extract 1 1 (signal-value btor402)) (signal-state btor402))]
          [btor1610 (signal (concat (signal-value btor1609) (signal-value btor1608))
                            (merge-state (list btor1609 btor1608)))]
          [btor1611 (signal (extract 1 1 (signal-value btor402)) (signal-state btor402))]
          [btor1612 (signal (concat (signal-value btor1611) (signal-value btor1610))
                            (merge-state (list btor1611 btor1610)))]
          [btor1613 (signal (extract 1 1 (signal-value btor402)) (signal-state btor402))]
          [btor1614 (signal (concat (signal-value btor1613) (signal-value btor1612))
                            (merge-state (list btor1613 btor1612)))]
          [btor1615 (signal (extract 1 1 (signal-value btor402)) (signal-state btor402))]
          [btor1616 (signal (concat (signal-value btor1615) (signal-value btor1614))
                            (merge-state (list btor1615 btor1614)))]
          [btor1617 (signal (extract 1 1 (signal-value btor402)) (signal-state btor402))]
          [btor1618 (signal (concat (signal-value btor1617) (signal-value btor1616))
                            (merge-state (list btor1617 btor1616)))]
          [btor1619 (signal (extract 1 1 (signal-value btor402)) (signal-state btor402))]
          [btor1620 (signal (concat (signal-value btor1619) (signal-value btor1618))
                            (merge-state (list btor1619 btor1618)))]
          [btor1621 (signal (extract 1 1 (signal-value btor402)) (signal-state btor402))]
          [btor1622 (signal (concat (signal-value btor1621) (signal-value btor1620))
                            (merge-state (list btor1621 btor1620)))]
          [btor1623 (signal (extract 1 1 (signal-value btor402)) (signal-state btor402))]
          [btor1624 (signal (concat (signal-value btor1623) (signal-value btor1622))
                            (merge-state (list btor1623 btor1622)))]
          [btor1625 (signal (extract 1 1 (signal-value btor402)) (signal-state btor402))]
          [btor1626 (signal (concat (signal-value btor1625) (signal-value btor1624))
                            (merge-state (list btor1625 btor1624)))]
          [btor1627 (signal (extract 1 1 (signal-value btor402)) (signal-state btor402))]
          [btor1628 (signal (concat (signal-value btor1627) (signal-value btor1626))
                            (merge-state (list btor1627 btor1626)))]
          [btor1629 (signal (extract 1 1 (signal-value btor402)) (signal-state btor402))]
          [btor1630 (signal (concat (signal-value btor1629) (signal-value btor1628))
                            (merge-state (list btor1629 btor1628)))]
          [btor1631 (signal (extract 1 1 (signal-value btor402)) (signal-state btor402))]
          [btor1632 (signal (concat (signal-value btor1631) (signal-value btor1630))
                            (merge-state (list btor1631 btor1630)))]
          [btor1633 (signal (extract 1 1 (signal-value btor402)) (signal-state btor402))]
          [btor1634 (signal (concat (signal-value btor1633) (signal-value btor1632))
                            (merge-state (list btor1633 btor1632)))]
          [btor1635 (signal (extract 11 0 (signal-value btor1474)) (signal-state btor1474))]
          [btor1636 (signal (extract 11 0 (signal-value btor1478)) (signal-state btor1478))]
          [btor1637 (signal (concat (signal-value btor1636) (signal-value btor1635))
                            (merge-state (list btor1636 btor1635)))]
          [btor1638 (signal (extract 11 0 (signal-value btor1482)) (signal-state btor1482))]
          [btor1639 (signal (concat (signal-value btor1638) (signal-value btor1637))
                            (merge-state (list btor1638 btor1637)))]
          [btor1640 (signal (extract 11 0 (signal-value btor1486)) (signal-state btor1486))]
          [btor1641 (signal (concat (signal-value btor1640) (signal-value btor1639))
                            (merge-state (list btor1640 btor1639)))]
          [btor1642 (signal (bvxor (signal-value btor1634) (signal-value btor1641))
                            (merge-state (list btor1634 btor1641)))]
          [btor1643 (signal (bvxor (signal-value btor1539) (signal-value btor1642))
                            (merge-state (list btor1539 btor1642)))]
          [btor1644 (signal (bvnot (signal-value btor1643)) (merge-state (list btor1643)))]
          [btor1645 (signal (extract 45 0 (signal-value btor885)) (signal-state btor885))]
          [btor1646 (signal (bvnot (signal-value btor1645)) (merge-state (list btor1645)))]
          [btor1647 (signal (concat (signal-value btor1646) (signal-value btor406))
                            (merge-state (list btor1646 btor406)))]
          [btor1648 (bv->signal (bv 23 (bitvector 5)))]
          [btor1649 (signal (bool->bitvector (bveq (signal-value btor88) (signal-value btor1648)))
                            (merge-state (list btor88 btor1648)))]
          [btor1650 (if (bitvector->bool (signal-value btor1649)) btor637 btor406)]
          [btor1651 (bv->signal (bv 22 (bitvector 5)))]
          [btor1652 (signal (bool->bitvector (bveq (signal-value btor88) (signal-value btor1651)))
                            (merge-state (list btor88 btor1651)))]
          [btor1653 (if (bitvector->bool (signal-value btor1652)) btor105 btor1650)]
          [btor1654 (signal (bool->bitvector (bveq (signal-value btor88) (signal-value btor1532)))
                            (merge-state (list btor88 btor1532)))]
          [btor1655 (if (bitvector->bool (signal-value btor1654)) btor410 btor1653)]
          [btor1656 (bv->signal (bv 8 (bitvector 4)))]
          [btor1657 (bv->signal (zero-extend (signal-value btor1656) (bitvector 5)) btor1656)]
          [btor1658 (signal (bool->bitvector (bveq (signal-value btor88) (signal-value btor1657)))
                            (merge-state (list btor88 btor1657)))]
          [btor1659 (if (bitvector->bool (signal-value btor1658)) btor406 btor1655)]
          [btor1660 (signal (bool->bitvector (bveq (signal-value btor1659) (signal-value btor637)))
                            (merge-state (list btor1659 btor637)))]
          [btor1661 (if (bitvector->bool (signal-value btor1660)) btor1647 btor68)]
          [btor1662 (signal (extract 46 0 (signal-value btor885)) (signal-state btor885))]
          [btor1663 (signal (bvnot (signal-value btor1662)) (merge-state (list btor1662)))]
          [btor1664 (signal (concat (signal-value btor1663) (signal-value btor248))
                            (merge-state (list btor1663 btor248)))]
          [btor1665 (signal (bool->bitvector (bveq (signal-value btor1659) (signal-value btor105)))
                            (merge-state (list btor1659 btor105)))]
          [btor1666 (if (bitvector->bool (signal-value btor1665)) btor1664 btor1661)]
          [btor1667 (bv->signal (zero-extend (signal-value btor97) (bitvector 2)) btor97)]
          [btor1668 (signal (bool->bitvector (bveq (signal-value btor1659) (signal-value btor1667)))
                            (merge-state (list btor1659 btor1667)))]
          [btor1669 (if (bitvector->bool (signal-value btor1668)) btor885 btor1666)]
          [btor1670 (bv->signal (bv 21 (bitvector 5)))]
          [btor1671 (signal (bool->bitvector (bveq (signal-value btor91) (signal-value btor1670)))
                            (merge-state (list btor91 btor1670)))]
          [btor1672 (if (bitvector->bool (signal-value btor1671)) btor97 btor248)]
          [btor1673 (bv->signal (bv 11 (bitvector 4)))]
          [btor1674 (bv->signal (zero-extend (signal-value btor1673) (bitvector 5)) btor1673)]
          [btor1675 (signal (bool->bitvector (bveq (signal-value btor91) (signal-value btor1674)))
                            (merge-state (list btor91 btor1674)))]
          [btor1676 (if (bitvector->bool (signal-value btor1675)) btor248 btor1672)]
          [btor1677 (if (bitvector->bool (signal-value btor1676)) btor1669 btor1280)]
          [btor1678 (signal (bvor (signal-value btor1644) (signal-value btor1677))
                            (merge-state (list btor1644 btor1677)))]
          [btor1679 (signal (apply bvand (bitvector->bits (signal-value btor1678)))
                            (signal-state btor1678))]
          [btor1680
           (let* ([state-value
                   (cond
                     [(hash-has-key? merged-input-state-hash 'state1680)
                      (bv->signal (hash-ref merged-input-state-hash 'state1680))]
                     [(hash-has-key? init-hash 'state1680)
                      (bv->signal (hash-ref init-hash 'state1680))]
                     [else
                      (log-warning
                       "state ~a with no initial value, init to 0, this may not be correct in the long term"
                       'state1680)
                      (bv->signal (bv 0 (bitvector 1)))])])
             (when (not (signal? state-value))
               (error "Expected signal"))
             (when (not (bv? (signal-value state-value)))
               (error "Signal value invalid"))
             state-value)]
          [btor1681
           (let* ([state-value
                   (cond
                     [(hash-has-key? merged-input-state-hash 'state1681)
                      (bv->signal (hash-ref merged-input-state-hash 'state1681))]
                     [(hash-has-key? init-hash 'state1681)
                      (bv->signal (hash-ref init-hash 'state1681))]
                     [else
                      (log-warning
                       "state ~a with no initial value, init to 0, this may not be correct in the long term"
                       'state1681)
                      (bv->signal (bv 0 (bitvector 1)))])])
             (when (not (signal? state-value))
               (error "Expected signal"))
             (when (not (bv? (signal-value state-value)))
               (error "Signal value invalid"))
             state-value)]
          [btor1682
           (let* ([state-value
                   (cond
                     [(hash-has-key? merged-input-state-hash 'state1682)
                      (bv->signal (hash-ref merged-input-state-hash 'state1682))]
                     [(hash-has-key? init-hash 'state1682)
                      (bv->signal (hash-ref init-hash 'state1682))]
                     [else
                      (log-warning
                       "state ~a with no initial value, init to 0, this may not be correct in the long term"
                       'state1682)
                      (bv->signal (bv 0 (bitvector 1)))])])
             (when (not (signal? state-value))
               (error "Expected signal"))
             (when (not (bv? (signal-value state-value)))
               (error "Signal value invalid"))
             state-value)]
          [btor1684 (signal (concat (signal-value btor102) (signal-value btor1682))
                            (merge-state (list btor102 btor1682)))]
          [btor1685 (signal (bool->bitvector (bveq (signal-value btor1684) (signal-value btor105)))
                            (merge-state (list btor1684 btor105)))]
          [btor1686 (if (bitvector->bool (signal-value btor1685)) btor1681 btor1680)]
          [btor1687 (if (bitvector->bool (signal-value btor1490)) btor1686 btor1679)]
          [btor1688 (signal (bvnot (signal-value btor1687)) (merge-state (list btor1687)))]
          [btor1689 (signal (bvor (signal-value btor1643) (signal-value btor1677))
                            (merge-state (list btor1643 btor1677)))]
          [btor1690 (signal (apply bvand (bitvector->bits (signal-value btor1689)))
                            (signal-state btor1689))]
          [btor1691
           (let* ([state-value
                   (cond
                     [(hash-has-key? merged-input-state-hash 'state1691)
                      (bv->signal (hash-ref merged-input-state-hash 'state1691))]
                     [(hash-has-key? init-hash 'state1691)
                      (bv->signal (hash-ref init-hash 'state1691))]
                     [else
                      (log-warning
                       "state ~a with no initial value, init to 0, this may not be correct in the long term"
                       'state1691)
                      (bv->signal (bv 0 (bitvector 1)))])])
             (when (not (signal? state-value))
               (error "Expected signal"))
             (when (not (bv? (signal-value state-value)))
               (error "Signal value invalid"))
             state-value)]
          [btor1692
           (let* ([state-value
                   (cond
                     [(hash-has-key? merged-input-state-hash 'state1692)
                      (bv->signal (hash-ref merged-input-state-hash 'state1692))]
                     [(hash-has-key? init-hash 'state1692)
                      (bv->signal (hash-ref init-hash 'state1692))]
                     [else
                      (log-warning
                       "state ~a with no initial value, init to 0, this may not be correct in the long term"
                       'state1692)
                      (bv->signal (bv 0 (bitvector 1)))])])
             (when (not (signal? state-value))
               (error "Expected signal"))
             (when (not (bv? (signal-value state-value)))
               (error "Signal value invalid"))
             state-value)]
          [btor1693
           (let* ([state-value
                   (cond
                     [(hash-has-key? merged-input-state-hash 'state1693)
                      (bv->signal (hash-ref merged-input-state-hash 'state1693))]
                     [(hash-has-key? init-hash 'state1693)
                      (bv->signal (hash-ref init-hash 'state1693))]
                     [else
                      (log-warning
                       "state ~a with no initial value, init to 0, this may not be correct in the long term"
                       'state1693)
                      (bv->signal (bv 0 (bitvector 1)))])])
             (when (not (signal? state-value))
               (error "Expected signal"))
             (when (not (bv? (signal-value state-value)))
               (error "Signal value invalid"))
             state-value)]
          [btor1695 (signal (concat (signal-value btor102) (signal-value btor1693))
                            (merge-state (list btor102 btor1693)))]
          [btor1696 (signal (bool->bitvector (bveq (signal-value btor1695) (signal-value btor105)))
                            (merge-state (list btor1695 btor105)))]
          [btor1697 (if (bitvector->bool (signal-value btor1696)) btor1692 btor1691)]
          [btor1698 (if (bitvector->bool (signal-value btor1490)) btor1697 btor1690)]
          [btor1699 (signal (bvnot (signal-value btor1698)) (merge-state (list btor1698)))]
          [btor1700 (signal (bvand (signal-value btor1688) (signal-value btor1699))
                            (merge-state (list btor1688 btor1699)))]
          [btor1701
           (let* ([state-value
                   (cond
                     [(hash-has-key? merged-input-state-hash 'state1701)
                      (bv->signal (hash-ref merged-input-state-hash 'state1701))]
                     [(hash-has-key? init-hash 'state1701)
                      (bv->signal (hash-ref init-hash 'state1701))]
                     [else
                      (log-warning
                       "state ~a with no initial value, init to 0, this may not be correct in the long term"
                       'state1701)
                      (bv->signal (bv 0 (bitvector 1)))])])
             (when (not (signal? state-value))
               (error "Expected signal"))
             (when (not (bv? (signal-value state-value)))
               (error "Signal value invalid"))
             state-value)]
          [btor1702
           (let* ([state-value
                   (cond
                     [(hash-has-key? merged-input-state-hash 'state1702)
                      (bv->signal (hash-ref merged-input-state-hash 'state1702))]
                     [(hash-has-key? init-hash 'state1702)
                      (bv->signal (hash-ref init-hash 'state1702))]
                     [else
                      (log-warning
                       "state ~a with no initial value, init to 0, this may not be correct in the long term"
                       'state1702)
                      (bv->signal (bv 0 (bitvector 1)))])])
             (when (not (signal? state-value))
               (error "Expected signal"))
             (when (not (bv? (signal-value state-value)))
               (error "Signal value invalid"))
             state-value)]
          [btor1703
           (let* ([state-value
                   (cond
                     [(hash-has-key? merged-input-state-hash 'state1703)
                      (bv->signal (hash-ref merged-input-state-hash 'state1703))]
                     [(hash-has-key? init-hash 'state1703)
                      (bv->signal (hash-ref init-hash 'state1703))]
                     [else
                      (log-warning
                       "state ~a with no initial value, init to 0, this may not be correct in the long term"
                       'state1703)
                      (bv->signal (bv 0 (bitvector 1)))])])
             (when (not (signal? state-value))
               (error "Expected signal"))
             (when (not (bv? (signal-value state-value)))
               (error "Signal value invalid"))
             state-value)]
          [btor1705 (signal (concat (signal-value btor102) (signal-value btor1703))
                            (merge-state (list btor102 btor1703)))]
          [btor1706 (signal (bool->bitvector (bveq (signal-value btor1705) (signal-value btor105)))
                            (merge-state (list btor1705 btor105)))]
          [btor1707 (if (bitvector->bool (signal-value btor1706)) btor1702 btor1701)]
          [btor1708 (if (bitvector->bool (signal-value btor1490)) btor1707 btor1679)]
          [btor1709 (signal (bvand (signal-value btor1700) (signal-value btor1708))
                            (merge-state (list btor1700 btor1708)))]
          [btor1710 (if (bitvector->bool (signal-value btor1676)) btor1709 btor248)]
          [btor1712 (if (bitvector->bool (signal-value btor1490)) btor538 btor1642)]
          [btor1717
           (let* ([state-value
                   (cond
                     [(hash-has-key? merged-input-state-hash 'state1717)
                      (bv->signal (hash-ref merged-input-state-hash 'state1717))]
                     [(hash-has-key? init-hash 'state1717)
                      (bv->signal (hash-ref init-hash 'state1717))]
                     [else
                      (log-warning
                       "state ~a with no initial value, init to 0, this may not be correct in the long term"
                       'state1717)
                      (bv->signal (bv 0 (bitvector 1)))])])
             (when (not (signal? state-value))
               (error "Expected signal"))
             (when (not (bv? (signal-value state-value)))
               (error "Signal value invalid"))
             state-value)]
          [btor1718
           (let* ([state-value
                   (cond
                     [(hash-has-key? merged-input-state-hash 'state1718)
                      (bv->signal (hash-ref merged-input-state-hash 'state1718))]
                     [(hash-has-key? init-hash 'state1718)
                      (bv->signal (hash-ref init-hash 'state1718))]
                     [else
                      (log-warning
                       "state ~a with no initial value, init to 0, this may not be correct in the long term"
                       'state1718)
                      (bv->signal (bv 0 (bitvector 1)))])])
             (when (not (signal? state-value))
               (error "Expected signal"))
             (when (not (bv? (signal-value state-value)))
               (error "Signal value invalid"))
             state-value)]
          [btor1719
           (let* ([state-value
                   (cond
                     [(hash-has-key? merged-input-state-hash 'state1719)
                      (bv->signal (hash-ref merged-input-state-hash 'state1719))]
                     [(hash-has-key? init-hash 'state1719)
                      (bv->signal (hash-ref init-hash 'state1719))]
                     [else
                      (log-warning
                       "state ~a with no initial value, init to 0, this may not be correct in the long term"
                       'state1719)
                      (bv->signal (bv 0 (bitvector 1)))])])
             (when (not (signal? state-value))
               (error "Expected signal"))
             (when (not (bv? (signal-value state-value)))
               (error "Signal value invalid"))
             state-value)]
          [btor1721 (signal (concat (signal-value btor102) (signal-value btor1719))
                            (merge-state (list btor102 btor1719)))]
          [btor1722 (signal (bool->bitvector (bveq (signal-value btor1721) (signal-value btor105)))
                            (merge-state (list btor1721 btor105)))]
          [btor1723 (if (bitvector->bool (signal-value btor1722)) btor1718 btor1717)]
          [btor1724 (if (bitvector->bool (signal-value btor1490)) btor1723 btor1690)]
          [btor1725 (signal (bvand (signal-value btor1700) (signal-value btor1724))
                            (merge-state (list btor1700 btor1724)))]
          [btor1726 (if (bitvector->bool (signal-value btor1676)) btor1725 btor248)]
          [btor1728 (signal (extract 5 0 (signal-value btor1304)) (signal-state btor1304))]
          [btor1729 (signal (apply bvxor (bitvector->bits (signal-value btor1728)))
                            (signal-state btor1728))]
          [btor1730 (bv->signal (bv 24 (bitvector 5)))]
          [btor1731 (signal (bool->bitvector (bveq (signal-value btor93) (signal-value btor1730)))
                            (merge-state (list btor93 btor1730)))]
          [btor1732 (if (bitvector->bool (signal-value btor1731)) btor97 btor248)]
          [btor1733 (bv->signal (bv 13 (bitvector 4)))]
          [btor1734 (bv->signal (zero-extend (signal-value btor1733) (bitvector 5)) btor1733)]
          [btor1735 (signal (bool->bitvector (bveq (signal-value btor93) (signal-value btor1734)))
                            (merge-state (list btor93 btor1734)))]
          [btor1736 (if (bitvector->bool (signal-value btor1735)) btor248 btor1732)]
          [btor1737 (if (bitvector->bool (signal-value btor1736)) btor1729 btor248)]
          [btor1738 (signal (extract 11 6 (signal-value btor1304)) (signal-state btor1304))]
          [btor1739 (signal (apply bvxor (bitvector->bits (signal-value btor1738)))
                            (signal-state btor1738))]
          [btor1740 (if (bitvector->bool (signal-value btor1736)) btor1739 btor248)]
          [btor1741 (signal (bvxor (signal-value btor1737) (signal-value btor1740))
                            (merge-state (list btor1737 btor1740)))]
          [btor1742 (bv->signal (bv 26 (bitvector 5)))]
          [btor1743 (signal (bool->bitvector (bveq (signal-value btor94) (signal-value btor1742)))
                            (merge-state (list btor94 btor1742)))]
          [btor1744 (if (bitvector->bool (signal-value btor1743)) btor97 btor248)]
          [btor1745 (bv->signal (bv 14 (bitvector 4)))]
          [btor1746 (bv->signal (zero-extend (signal-value btor1745) (bitvector 5)) btor1745)]
          [btor1747 (signal (bool->bitvector (bveq (signal-value btor94) (signal-value btor1746)))
                            (merge-state (list btor94 btor1746)))]
          [btor1748 (if (bitvector->bool (signal-value btor1747)) btor248 btor1744)]
          [btor1749 (if (bitvector->bool (signal-value btor1748)) btor1737 btor1741)]
          [btor1750 (signal (extract 17 12 (signal-value btor1304)) (signal-state btor1304))]
          [btor1751 (signal (apply bvxor (bitvector->bits (signal-value btor1750)))
                            (signal-state btor1750))]
          [btor1752 (if (bitvector->bool (signal-value btor1736)) btor1751 btor248)]
          [btor1753 (signal (extract 23 18 (signal-value btor1304)) (signal-state btor1304))]
          [btor1754 (signal (apply bvxor (bitvector->bits (signal-value btor1753)))
                            (signal-state btor1753))]
          [btor1755 (if (bitvector->bool (signal-value btor1736)) btor1754 btor248)]
          [btor1756 (signal (bvxor (signal-value btor1752) (signal-value btor1755))
                            (merge-state (list btor1752 btor1755)))]
          [btor1757 (signal (bvxor (signal-value btor1741) (signal-value btor1756))
                            (merge-state (list btor1741 btor1756)))]
          [btor1758 (if (bitvector->bool (signal-value btor1748)) btor1740 btor1757)]
          [btor1759 (if (bitvector->bool (signal-value btor1748)) btor1752 btor1756)]
          [btor1760 (signal (extract 29 24 (signal-value btor1304)) (signal-state btor1304))]
          [btor1761 (signal (apply bvxor (bitvector->bits (signal-value btor1760)))
                            (signal-state btor1760))]
          [btor1762 (if (bitvector->bool (signal-value btor1736)) btor1761 btor248)]
          [btor1763 (signal (extract 35 30 (signal-value btor1304)) (signal-state btor1304))]
          [btor1764 (signal (apply bvxor (bitvector->bits (signal-value btor1763)))
                            (signal-state btor1763))]
          [btor1765 (if (bitvector->bool (signal-value btor1736)) btor1764 btor248)]
          [btor1766 (signal (bvxor (signal-value btor1762) (signal-value btor1765))
                            (merge-state (list btor1762 btor1765)))]
          [btor1767 (signal (extract 41 36 (signal-value btor1304)) (signal-state btor1304))]
          [btor1768 (signal (apply bvxor (bitvector->bits (signal-value btor1767)))
                            (signal-state btor1767))]
          [btor1769 (if (bitvector->bool (signal-value btor1736)) btor1768 btor248)]
          [btor1770 (signal (extract 47 42 (signal-value btor1304)) (signal-state btor1304))]
          [btor1771 (signal (apply bvxor (bitvector->bits (signal-value btor1770)))
                            (signal-state btor1770))]
          [btor1772 (if (bitvector->bool (signal-value btor1736)) btor1771 btor248)]
          [btor1773 (signal (bvxor (signal-value btor1769) (signal-value btor1772))
                            (merge-state (list btor1769 btor1772)))]
          [btor1774 (signal (bvxor (signal-value btor1766) (signal-value btor1773))
                            (merge-state (list btor1766 btor1773)))]
          [btor1775 (signal (bvxor (signal-value btor1757) (signal-value btor1774))
                            (merge-state (list btor1757 btor1774)))]
          [btor1776 (if (bitvector->bool (signal-value btor1748)) btor1755 btor1775)]
          [btor1777 (if (bitvector->bool (signal-value btor1748)) btor1762 btor1766)]
          [btor1778 (if (bitvector->bool (signal-value btor1748)) btor1765 btor1774)]
          [btor1779 (if (bitvector->bool (signal-value btor1748)) btor1769 btor1773)]
          [btor1780 (signal (concat (signal-value btor1758) (signal-value btor1749))
                            (merge-state (list btor1758 btor1749)))]
          [btor1781 (signal (concat (signal-value btor1759) (signal-value btor1780))
                            (merge-state (list btor1759 btor1780)))]
          [btor1782 (signal (concat (signal-value btor1776) (signal-value btor1781))
                            (merge-state (list btor1776 btor1781)))]
          [btor1783 (signal (concat (signal-value btor1777) (signal-value btor1782))
                            (merge-state (list btor1777 btor1782)))]
          [btor1784 (signal (concat (signal-value btor1778) (signal-value btor1783))
                            (merge-state (list btor1778 btor1783)))]
          [btor1785 (signal (concat (signal-value btor1779) (signal-value btor1784))
                            (merge-state (list btor1779 btor1784)))]
          [btor1786 (signal (concat (signal-value btor1772) (signal-value btor1785))
                            (merge-state (list btor1772 btor1785)))]
          [btor1787
           (let* ([state-value
                   (cond
                     [(hash-has-key? merged-input-state-hash 'state1787)
                      (bv->signal (hash-ref merged-input-state-hash 'state1787))]
                     [(hash-has-key? init-hash 'state1787)
                      (bv->signal (hash-ref init-hash 'state1787))]
                     [else
                      (log-warning
                       "state ~a with no initial value, init to 0, this may not be correct in the long term"
                       'state1787)
                      (bv->signal (bv 0 (bitvector 8)))])])
             (when (not (signal? state-value))
               (error "Expected signal"))
             (when (not (bv? (signal-value state-value)))
               (error "Signal value invalid"))
             state-value)]
          [btor1788
           (let* ([state-value
                   (cond
                     [(hash-has-key? merged-input-state-hash 'state1788)
                      (bv->signal (hash-ref merged-input-state-hash 'state1788))]
                     [(hash-has-key? init-hash 'state1788)
                      (bv->signal (hash-ref init-hash 'state1788))]
                     [else
                      (log-warning
                       "state ~a with no initial value, init to 0, this may not be correct in the long term"
                       'state1788)
                      (bv->signal (bv 0 (bitvector 8)))])])
             (when (not (signal? state-value))
               (error "Expected signal"))
             (when (not (bv? (signal-value state-value)))
               (error "Signal value invalid"))
             state-value)]
          [btor1789
           (let* ([state-value
                   (cond
                     [(hash-has-key? merged-input-state-hash 'state1789)
                      (bv->signal (hash-ref merged-input-state-hash 'state1789))]
                     [(hash-has-key? init-hash 'state1789)
                      (bv->signal (hash-ref init-hash 'state1789))]
                     [else
                      (log-warning
                       "state ~a with no initial value, init to 0, this may not be correct in the long term"
                       'state1789)
                      (bv->signal (bv 0 (bitvector 1)))])])
             (when (not (signal? state-value))
               (error "Expected signal"))
             (when (not (bv? (signal-value state-value)))
               (error "Signal value invalid"))
             state-value)]
          [btor1791 (signal (concat (signal-value btor102) (signal-value btor1789))
                            (merge-state (list btor102 btor1789)))]
          [btor1792 (signal (bool->bitvector (bveq (signal-value btor1791) (signal-value btor105)))
                            (merge-state (list btor1791 btor105)))]
          [btor1793 (if (bitvector->bool (signal-value btor1792)) btor1788 btor1787)]
          [btor1794 (if (bitvector->bool (signal-value btor1490)) btor1793 btor1786)]
          [btor1796 (bv->signal (zero-extend (signal-value btor107) (bitvector 30)) btor107)]
          [btor1797 (bv->signal (zero-extend (signal-value btor959) (bitvector 27)) btor959)]
          [btor1798 (bv->signal (zero-extend (signal-value btor264) (bitvector 30)) btor264)]
          [btor1799 (bv->signal (zero-extend (signal-value btor268) (bitvector 2)) btor268)]
          [btor1800 (bv->signal (zero-extend (signal-value btor4) (bitvector 32)) btor4)]
          [btor1801 (bv->signal (zero-extend (signal-value btor5) (bitvector 30)) btor5)]
          [btor1802 (bv->signal (zero-extend (signal-value btor1143) (bitvector 1)) btor1143)]
          [btor1803 (bv->signal (zero-extend (signal-value btor1144) (bitvector 1)) btor1144)]
          [btor1804 (bv->signal (zero-extend (signal-value btor6) (bitvector 32)) btor6)]
          [btor1805 (bv->signal (zero-extend (signal-value btor1145) (bitvector 27)) btor1145)]
          [btor1806 (bv->signal (zero-extend (signal-value btor1142) (bitvector 27)) btor1142)]
          [btor1807 (bv->signal (zero-extend (signal-value btor1135) (bitvector 27)) btor1135)]
          [btor1808 (bv->signal (zero-extend (signal-value btor405) (bitvector 1)) btor405)]
          [btor1809 (bv->signal (zero-extend (signal-value btor1425) (bitvector 1)) btor1425)]
          [btor1810 (bv->signal (zero-extend (signal-value btor401) (bitvector 1)) btor401)]
          [btor1811 (bv->signal (zero-extend (signal-value btor9) (bitvector 32)) btor9)]
          [btor1812 (bv->signal (zero-extend (signal-value btor402) (bitvector 4)) btor402)]
          [btor1813 (bv->signal (zero-extend (signal-value btor393) (bitvector 4)) btor393)]
          [btor1814 (bv->signal (zero-extend (signal-value btor400) (bitvector 4)) btor400)]
          [btor1815 (bv->signal (zero-extend (signal-value btor1642) (bitvector 48)) btor1642)]
          [btor1816 (bv->signal (zero-extend (signal-value btor538) (bitvector 48)) btor538)]
          [btor1817 (bv->signal (zero-extend (signal-value btor1401) (bitvector 1)) btor1401)]
          [btor1818 (bv->signal (zero-extend (signal-value btor1082) (bitvector 1)) btor1082)]
          [btor1819 (bv->signal (zero-extend (signal-value btor1079) (bitvector 16)) btor1079)]
          [btor1820 (bv->signal (zero-extend (signal-value btor265) (bitvector 2)) btor265)]
          [btor1821 (bv->signal (zero-extend (signal-value btor12) (bitvector 32)) btor12)]
          [btor1822 (bv->signal (zero-extend (signal-value btor676) (bitvector 5)) btor676)]
          [btor1823 (signal (bool->bitvector (bveq (signal-value btor13) (signal-value btor1822)))
                            (merge-state (list btor13 btor1822)))]
          [btor1824 (if (bitvector->bool (signal-value btor1823)) btor105 btor406)]
          [btor1825 (bv->signal (zero-extend (signal-value btor679) (bitvector 5)) btor679)]
          [btor1826 (signal (bool->bitvector (bveq (signal-value btor13) (signal-value btor1825)))
                            (merge-state (list btor13 btor1825)))]
          [btor1827 (if (bitvector->bool (signal-value btor1826)) btor410 btor1824)]
          [btor1828 (bv->signal (zero-extend (signal-value btor637) (bitvector 5)) btor637)]
          [btor1829 (signal (bool->bitvector (bveq (signal-value btor13) (signal-value btor1828)))
                            (merge-state (list btor13 btor1828)))]
          [btor1830 (if (bitvector->bool (signal-value btor1829)) btor406 btor1827)]
          [btor1831 (bv->signal (zero-extend (signal-value btor1830) (bitvector 2)) btor1830)]
          [btor1832 (bitvector 120)]
          [btor1833 (bitvector 115)]
          [btor1834 (bv->signal (bv 0 (bitvector 115)))]
          [btor1835 (signal (concat (signal-value btor1834) (signal-value btor13))
                            (merge-state (list btor1834 btor13)))]
          [btor1836 (bv->signal (zero-extend (signal-value btor1835) (bitvector 120)) btor1835)]
          [btor1837 (bv->signal (bv 16 (bitvector 5)))]
          [btor1838 (signal (bool->bitvector (bveq (signal-value btor14) (signal-value btor1837)))
                            (merge-state (list btor14 btor1837)))]
          [btor1839 (if (bitvector->bool (signal-value btor1838)) btor97 btor248)]
          [btor1840 (bv->signal (zero-extend (signal-value btor1414) (bitvector 5)) btor1414)]
          [btor1841 (signal (bool->bitvector (bveq (signal-value btor14) (signal-value btor1840)))
                            (merge-state (list btor14 btor1840)))]
          [btor1842 (if (bitvector->bool (signal-value btor1841)) btor248 btor1839)]
          [btor1843 (bv->signal (zero-extend (signal-value btor1842) (bitvector 1)) btor1842)]
          [btor1844 (bv->signal (bv 0 (bitvector 35)))]
          [btor1845 (signal (concat (signal-value btor1844) (signal-value btor14))
                            (merge-state (list btor1844 btor14)))]
          [btor1846 (bv->signal (zero-extend (signal-value btor1845) (bitvector 40)) btor1845)]
          [btor1847 (bv->signal (zero-extend (signal-value btor267) (bitvector 30)) btor267)]
          [btor1848 (bv->signal (zero-extend (signal-value btor256) (bitvector 1)) btor256)]
          [btor1849 (bitvector 56)]
          [btor1850 (bitvector 51)]
          [btor1851 (bv->signal (bv 0 (bitvector 51)))]
          [btor1852 (signal (concat (signal-value btor1851) (signal-value btor15))
                            (merge-state (list btor1851 btor15)))]
          [btor1853 (bv->signal (zero-extend (signal-value btor1852) (bitvector 56)) btor1852)]
          [btor1854 (bv->signal (zero-extend (signal-value btor247) (bitvector 30)) btor247)]
          [btor1855 (bv->signal (zero-extend (signal-value btor278) (bitvector 18)) btor278)]
          [btor1856 (bv->signal (zero-extend (signal-value btor1112) (bitvector 18)) btor1112)]
          [btor1857 (bv->signal (zero-extend (signal-value btor366) (bitvector 18)) btor366)]
          [btor1858 (bv->signal (zero-extend (signal-value btor363) (bitvector 18)) btor363)]
          [btor1859 (bv->signal (zero-extend (signal-value btor367) (bitvector 2)) btor367)]
          [btor1860 (bv->signal (zero-extend (signal-value btor18) (bitvector 32)) btor18)]
          [btor1861 (bv->signal (zero-extend (signal-value btor19) (bitvector 18)) btor19)]
          [btor1862 (bv->signal (zero-extend (signal-value btor1402) (bitvector 1)) btor1402)]
          [btor1863 (bv->signal (zero-extend (signal-value btor1089) (bitvector 1)) btor1089)]
          [btor1864 (signal (concat (signal-value btor1078) (signal-value btor20))
                            (merge-state (list btor1078 btor20)))]
          [btor1865 (bv->signal (zero-extend (signal-value btor1864) (bitvector 16)) btor1864)]
          [btor1866 (bv->signal (zero-extend (signal-value btor364) (bitvector 2)) btor364)]
          [btor1867 (bv->signal (zero-extend (signal-value btor21) (bitvector 32)) btor21)]
          [btor1868 (bv->signal (zero-extend (signal-value btor366) (bitvector 18)) btor366)]
          [btor1869 (bv->signal (zero-extend (signal-value btor355) (bitvector 1)) btor355)]
          [btor1870 (signal (concat (signal-value btor1851) (signal-value btor22))
                            (merge-state (list btor1851 btor22)))]
          [btor1871 (bv->signal (zero-extend (signal-value btor1870) (bitvector 56)) btor1870)]
          [btor1872 (bv->signal (zero-extend (signal-value btor349) (bitvector 18)) btor349)]
          [btor1873 (bv->signal (zero-extend (signal-value btor26) (bitvector 1)) btor26)]
          [btor1874 (bv->signal (zero-extend (signal-value btor1460) (bitvector 1)) btor1460)]
          [btor1875 (bv->signal (zero-extend (signal-value btor28) (bitvector 32)) btor28)]
          [btor1876 (bv->signal (zero-extend (signal-value btor1397) (bitvector 1)) btor1397)]
          [btor1877 (bv->signal (zero-extend (signal-value btor31) (bitvector 32)) btor31)]
          [btor1878 (bv->signal (zero-extend (signal-value btor1389) (bitvector 3)) btor1389)]
          [btor1879 (bv->signal (zero-extend (signal-value btor1398) (bitvector 3)) btor1398)]
          [btor1880 (bv->signal (zero-extend (signal-value btor1396) (bitvector 3)) btor1396)]
          [btor1881 (bv->signal (zero-extend (signal-value btor1452) (bitvector 1)) btor1452)]
          [btor1882 (bv->signal (zero-extend (signal-value btor1461) (bitvector 1)) btor1461)]
          [btor1883 (bv->signal (zero-extend (signal-value btor1459) (bitvector 1)) btor1459)]
          [btor1884 (bv->signal (zero-extend (signal-value btor1434) (bitvector 1)) btor1434)]
          [btor1885 (signal (bool->bitvector ((compose1 not bveq) (signal-value btor32)
                                                                  (signal-value btor97)))
                            (merge-state (list btor32 btor97)))]
          [btor1886 (signal (bvand (signal-value btor1885) (signal-value btor32))
                            (merge-state (list btor1885 btor32)))]
          [btor1887 (bv->signal (zero-extend (signal-value btor1886) (bitvector 1)) btor1886)]
          [btor1888 (signal (bool->bitvector ((compose1 not bveq) (signal-value btor33)
                                                                  (signal-value btor97)))
                            (merge-state (list btor33 btor97)))]
          [btor1889 (signal (bvand (signal-value btor1888) (signal-value btor33))
                            (merge-state (list btor1888 btor33)))]
          [btor1890 (bv->signal (zero-extend (signal-value btor1889) (bitvector 1)) btor1889)]
          [btor1891 (signal (bool->bitvector ((compose1 not bveq) (signal-value btor34)
                                                                  (signal-value btor97)))
                            (merge-state (list btor34 btor97)))]
          [btor1892 (signal (bvand (signal-value btor1891) (signal-value btor34))
                            (merge-state (list btor1891 btor34)))]
          [btor1893 (bv->signal (zero-extend (signal-value btor1892) (bitvector 1)) btor1892)]
          [btor1894 (signal (bool->bitvector ((compose1 not bveq) (signal-value btor35)
                                                                  (signal-value btor97)))
                            (merge-state (list btor35 btor97)))]
          [btor1895 (signal (bvand (signal-value btor1894) (signal-value btor35))
                            (merge-state (list btor1894 btor35)))]
          [btor1896 (bv->signal (zero-extend (signal-value btor1895) (bitvector 1)) btor1895)]
          [btor1897 (signal (bool->bitvector ((compose1 not bveq) (signal-value btor36)
                                                                  (signal-value btor97)))
                            (merge-state (list btor36 btor97)))]
          [btor1898 (signal (bvand (signal-value btor1897) (signal-value btor36))
                            (merge-state (list btor1897 btor36)))]
          [btor1899 (bv->signal (zero-extend (signal-value btor1898) (bitvector 1)) btor1898)]
          [btor1900 (signal (bool->bitvector ((compose1 not bveq) (signal-value btor37)
                                                                  (signal-value btor97)))
                            (merge-state (list btor37 btor97)))]
          [btor1901 (signal (bvand (signal-value btor1900) (signal-value btor37))
                            (merge-state (list btor1900 btor37)))]
          [btor1902 (bv->signal (zero-extend (signal-value btor1901) (bitvector 1)) btor1901)]
          [btor1903 (signal (bool->bitvector ((compose1 not bveq) (signal-value btor39)
                                                                  (signal-value btor97)))
                            (merge-state (list btor39 btor97)))]
          [btor1904 (signal (bvand (signal-value btor1903) (signal-value btor39))
                            (merge-state (list btor1903 btor39)))]
          [btor1905 (bv->signal (zero-extend (signal-value btor1904) (bitvector 1)) btor1904)]
          [btor1906 (signal (bool->bitvector ((compose1 not bveq) (signal-value btor40)
                                                                  (signal-value btor97)))
                            (merge-state (list btor40 btor97)))]
          [btor1907 (signal (bvand (signal-value btor1906) (signal-value btor40))
                            (merge-state (list btor1906 btor40)))]
          [btor1908 (bv->signal (zero-extend (signal-value btor1907) (bitvector 1)) btor1907)]
          [btor1909 (signal (bool->bitvector ((compose1 not bveq) (signal-value btor38)
                                                                  (signal-value btor97)))
                            (merge-state (list btor38 btor97)))]
          [btor1910 (signal (bvand (signal-value btor1909) (signal-value btor38))
                            (merge-state (list btor1909 btor38)))]
          [btor1911 (bv->signal (zero-extend (signal-value btor1910) (bitvector 1)) btor1910)]
          [btor1912 (signal (bool->bitvector ((compose1 not bveq) (signal-value btor41)
                                                                  (signal-value btor97)))
                            (merge-state (list btor41 btor97)))]
          [btor1913 (signal (bvand (signal-value btor1912) (signal-value btor41))
                            (merge-state (list btor1912 btor41)))]
          [btor1914 (bv->signal (zero-extend (signal-value btor1913) (bitvector 1)) btor1913)]
          [btor1915 (bv->signal (zero-extend (signal-value btor42) (bitvector 1)) btor42)]
          [btor1916 (signal (bool->bitvector ((compose1 not bveq) (signal-value btor43)
                                                                  (signal-value btor97)))
                            (merge-state (list btor43 btor97)))]
          [btor1917 (signal (bvand (signal-value btor1916) (signal-value btor43))
                            (merge-state (list btor1916 btor43)))]
          [btor1918 (bv->signal (zero-extend (signal-value btor1917) (bitvector 1)) btor1917)]
          [btor1919 (signal (bool->bitvector ((compose1 not bveq) (signal-value btor44)
                                                                  (signal-value btor97)))
                            (merge-state (list btor44 btor97)))]
          [btor1920 (signal (bvand (signal-value btor1919) (signal-value btor44))
                            (merge-state (list btor1919 btor44)))]
          [btor1921 (bv->signal (zero-extend (signal-value btor1920) (bitvector 1)) btor1920)]
          [btor1922 (bv->signal (zero-extend (signal-value btor102) (bitvector 1)) btor102)]
          [btor1923 (bv->signal (zero-extend (signal-value btor1519) (bitvector 4)) btor1519)]
          [btor1924 (bv->signal (zero-extend (signal-value btor1432) (bitvector 4)) btor1432)]
          [btor1925 (bv->signal (zero-extend (signal-value btor884) (bitvector 1)) btor884)]
          [btor1926 (bv->signal (zero-extend (signal-value btor46) (bitvector 32)) btor46)]
          [btor1927 (bv->signal (zero-extend (signal-value btor885) (bitvector 48)) btor885)]
          [btor1928 (bv->signal (zero-extend (signal-value btor876) (bitvector 48)) btor876)]
          [btor1929 (bv->signal (zero-extend (signal-value btor883) (bitvector 48)) btor883)]
          [btor1930 (bv->signal (zero-extend (signal-value btor1074) (bitvector 1)) btor1074)]
          [btor1931 (bv->signal (zero-extend (signal-value btor1104) (bitvector 1)) btor1104)]
          [btor1932 (bv->signal (zero-extend (signal-value btor49) (bitvector 32)) btor49)]
          [btor1933 (bv->signal (zero-extend (signal-value btor1105) (bitvector 27)) btor1105)]
          [btor1934 (bv->signal (zero-extend (signal-value btor1107) (bitvector 27)) btor1107)]
          [btor1935 (bv->signal (zero-extend (signal-value btor1073) (bitvector 27)) btor1073)]
          [btor1936 (bv->signal (zero-extend (signal-value btor1066) (bitvector 27)) btor1066)]
          [btor1937 (bv->signal (zero-extend (signal-value btor943) (bitvector 1)) btor943)]
          [btor1938 (bv->signal (zero-extend (signal-value btor51) (bitvector 32)) btor51)]
          [btor1939 (bv->signal (zero-extend (signal-value btor935) (bitvector 5)) btor935)]
          [btor1940 (bv->signal (zero-extend (signal-value btor944) (bitvector 5)) btor944)]
          [btor1941 (bv->signal (zero-extend (signal-value btor942) (bitvector 5)) btor942)]
          [btor1942 (bv->signal (zero-extend (signal-value btor52) (bitvector 4)) btor52)]
          [btor1943 (bv->signal (zero-extend (signal-value btor53) (bitvector 1)) btor53)]
          [btor1944 (bv->signal (zero-extend (signal-value btor54) (bitvector 1)) btor54)]
          [btor1945 (bv->signal (zero-extend (signal-value btor55) (bitvector 5)) btor55)]
          [btor1946 (bv->signal (zero-extend (signal-value btor57) (bitvector 9)) btor57)]
          [btor1947 (bv->signal (zero-extend (signal-value btor58) (bitvector 1)) btor58)]
          [btor1948 (bv->signal (zero-extend (signal-value btor59) (bitvector 1)) btor59)]
          [btor1949 (bv->signal (zero-extend (signal-value btor60) (bitvector 1)) btor60)]
          [btor1950 (bv->signal (zero-extend (signal-value btor61) (bitvector 1)) btor61)]
          [btor1951 (bv->signal (zero-extend (signal-value btor62) (bitvector 1)) btor62)]
          [btor1952 (bv->signal (zero-extend (signal-value btor63) (bitvector 1)) btor63)]
          [btor1953 (bv->signal (zero-extend (signal-value btor64) (bitvector 1)) btor64)]
          [btor1954 (bv->signal (zero-extend (signal-value btor65) (bitvector 1)) btor65)]
          [btor1955 (bv->signal (zero-extend (signal-value btor66) (bitvector 1)) btor66)]
          [btor1956 (bv->signal (zero-extend (signal-value btor67) (bitvector 1)) btor67)]
          [btor1957 (bv->signal (zero-extend (signal-value btor68) (bitvector 48)) btor68)]
          [btor1958 (bv->signal (zero-extend (signal-value btor1254) (bitvector 1)) btor1254)]
          [btor1959 (bv->signal (zero-extend (signal-value btor69) (bitvector 32)) btor69)]
          [btor1960 (bv->signal (zero-extend (signal-value btor70) (bitvector 1)) btor70)]
          [btor1961 (bv->signal (zero-extend (signal-value btor1522) (bitvector 1)) btor1522)]
          [btor1962 (bv->signal (zero-extend (signal-value btor1529) (bitvector 1)) btor1529)]
          [btor1963 (bv->signal (zero-extend (signal-value btor634) (bitvector 1)) btor634)]
          [btor1964 (bv->signal (zero-extend (signal-value btor72) (bitvector 32)) btor72)]
          [btor1965 (bv->signal (zero-extend (signal-value btor626) (bitvector 9)) btor626)]
          [btor1966 (bv->signal (zero-extend (signal-value btor635) (bitvector 9)) btor635)]
          [btor1967 (bv->signal (zero-extend (signal-value btor633) (bitvector 9)) btor633)]
          [btor1968 (bv->signal (zero-extend (signal-value btor73) (bitvector 48)) btor73)]
          [btor1969 (bv->signal (zero-extend (signal-value btor74) (bitvector 48)) btor74)]
          [btor1970 (bv->signal (zero-extend (signal-value btor955) (bitvector 1)) btor955)]
          [btor1971 (bv->signal (zero-extend (signal-value btor952) (bitvector 8)) btor952)]
          [btor1972 (bv->signal (zero-extend (signal-value btor1131) (bitvector 27)) btor1131)]
          [btor1973 (bv->signal (zero-extend (signal-value btor1490) (bitvector 1)) btor1490)]
          [btor1974 (bv->signal (zero-extend (signal-value btor76) (bitvector 32)) btor76)]
          [btor1975 (bv->signal (zero-extend (signal-value btor1377) (bitvector 1)) btor1377)]
          [btor1976 (bv->signal (zero-extend (signal-value btor538) (bitvector 48)) btor538)]
          [btor1977 (bv->signal (zero-extend (signal-value btor77) (bitvector 48)) btor77)]
          [btor1978 (signal (bool->bitvector ((compose1 not bveq) (signal-value btor79)
                                                                  (signal-value btor97)))
                            (merge-state (list btor79 btor97)))]
          [btor1979 (signal (bvxor (signal-value btor79) (signal-value btor58))
                            (merge-state (list btor79 btor58)))]
          [btor1980 (signal (bvand (signal-value btor1978) (signal-value btor1979))
                            (merge-state (list btor1978 btor1979)))]
          [btor1981 (bv->signal (zero-extend (signal-value btor1980) (bitvector 1)) btor1980)]
          [btor1982 (signal (bool->bitvector ((compose1 not bveq) (signal-value btor80)
                                                                  (signal-value btor97)))
                            (merge-state (list btor80 btor97)))]
          [btor1983 (signal (bvxor (signal-value btor80) (signal-value btor59))
                            (merge-state (list btor80 btor59)))]
          [btor1984 (signal (bvand (signal-value btor1982) (signal-value btor1983))
                            (merge-state (list btor1982 btor1983)))]
          [btor1985 (bv->signal (zero-extend (signal-value btor1984) (bitvector 1)) btor1984)]
          [btor1986 (signal (bool->bitvector ((compose1 not bveq) (signal-value btor78)
                                                                  (signal-value btor97)))
                            (merge-state (list btor78 btor97)))]
          [btor1987 (signal (bvxor (signal-value btor78) (signal-value btor60))
                            (merge-state (list btor78 btor60)))]
          [btor1988 (signal (bvand (signal-value btor1986) (signal-value btor1987))
                            (merge-state (list btor1986 btor1987)))]
          [btor1989 (bv->signal (zero-extend (signal-value btor1988) (bitvector 1)) btor1988)]
          [btor1990 (signal (bool->bitvector ((compose1 not bveq) (signal-value btor81)
                                                                  (signal-value btor97)))
                            (merge-state (list btor81 btor97)))]
          [btor1991 (signal (bvxor (signal-value btor81) (signal-value btor61))
                            (merge-state (list btor81 btor61)))]
          [btor1992 (signal (bvand (signal-value btor1990) (signal-value btor1991))
                            (merge-state (list btor1990 btor1991)))]
          [btor1993 (bv->signal (zero-extend (signal-value btor1992) (bitvector 1)) btor1992)]
          [btor1994 (signal (bool->bitvector ((compose1 not bveq) (signal-value btor83)
                                                                  (signal-value btor97)))
                            (merge-state (list btor83 btor97)))]
          [btor1995 (signal (bvxor (signal-value btor83) (signal-value btor62))
                            (merge-state (list btor83 btor62)))]
          [btor1996 (signal (bvand (signal-value btor1994) (signal-value btor1995))
                            (merge-state (list btor1994 btor1995)))]
          [btor1997 (bv->signal (zero-extend (signal-value btor1996) (bitvector 1)) btor1996)]
          [btor1998 (signal (bool->bitvector ((compose1 not bveq) (signal-value btor82)
                                                                  (signal-value btor97)))
                            (merge-state (list btor82 btor97)))]
          [btor1999 (signal (bvxor (signal-value btor82) (signal-value btor63))
                            (merge-state (list btor82 btor63)))]
          [btor2000 (signal (bvand (signal-value btor1998) (signal-value btor1999))
                            (merge-state (list btor1998 btor1999)))]
          [btor2001 (bv->signal (zero-extend (signal-value btor2000) (bitvector 1)) btor2000)]
          [btor2002 (signal (bool->bitvector ((compose1 not bveq) (signal-value btor84)
                                                                  (signal-value btor97)))
                            (merge-state (list btor84 btor97)))]
          [btor2003 (signal (bvxor (signal-value btor84) (signal-value btor64))
                            (merge-state (list btor84 btor64)))]
          [btor2004 (signal (bvand (signal-value btor2002) (signal-value btor2003))
                            (merge-state (list btor2002 btor2003)))]
          [btor2005 (bv->signal (zero-extend (signal-value btor2004) (bitvector 1)) btor2004)]
          [btor2006 (signal (bool->bitvector ((compose1 not bveq) (signal-value btor85)
                                                                  (signal-value btor97)))
                            (merge-state (list btor85 btor97)))]
          [btor2007 (signal (bvxor (signal-value btor85) (signal-value btor65))
                            (merge-state (list btor85 btor65)))]
          [btor2008 (signal (bvand (signal-value btor2006) (signal-value btor2007))
                            (merge-state (list btor2006 btor2007)))]
          [btor2009 (bv->signal (zero-extend (signal-value btor2008) (bitvector 1)) btor2008)]
          [btor2010 (signal (bool->bitvector ((compose1 not bveq) (signal-value btor86)
                                                                  (signal-value btor97)))
                            (merge-state (list btor86 btor97)))]
          [btor2011 (signal (bvxor (signal-value btor86) (signal-value btor66))
                            (merge-state (list btor86 btor66)))]
          [btor2012 (signal (bvand (signal-value btor2010) (signal-value btor2011))
                            (merge-state (list btor2010 btor2011)))]
          [btor2013 (bv->signal (zero-extend (signal-value btor2012) (bitvector 1)) btor2012)]
          [btor2014 (signal (bool->bitvector ((compose1 not bveq) (signal-value btor87)
                                                                  (signal-value btor97)))
                            (merge-state (list btor87 btor97)))]
          [btor2015 (signal (bvxor (signal-value btor87) (signal-value btor67))
                            (merge-state (list btor87 btor67)))]
          [btor2016 (signal (bvand (signal-value btor2014) (signal-value btor2015))
                            (merge-state (list btor2014 btor2015)))]
          [btor2017 (bv->signal (zero-extend (signal-value btor2016) (bitvector 1)) btor2016)]
          [btor2018 (bv->signal (zero-extend (signal-value btor1659) (bitvector 2)) btor1659)]
          [btor2019 (bitvector 112)]
          [btor2020 (bitvector 107)]
          [btor2021 (bv->signal (bv 0 (bitvector 107)))]
          [btor2022 (signal (concat (signal-value btor2021) (signal-value btor88))
                            (merge-state (list btor2021 btor88)))]
          [btor2023 (bv->signal (zero-extend (signal-value btor2022) (bitvector 112)) btor2022)]
          [btor2024 (bv->signal (zero-extend (signal-value btor1538) (bitvector 1)) btor1538)]
          [btor2025 (signal (concat (signal-value btor1851) (signal-value btor89))
                            (merge-state (list btor1851 btor89)))]
          [btor2026 (bv->signal (zero-extend (signal-value btor2025) (bitvector 56)) btor2025)]
          [btor2027 (bv->signal (zero-extend (signal-value btor1101) (bitvector 2)) btor1101)]
          [btor2028 (bitvector 64)]
          [btor2029 (bitvector 59)]
          [btor2030 (bv->signal (bv 0 (bitvector 59)))]
          [btor2031 (signal (concat (signal-value btor2030) (signal-value btor90))
                            (merge-state (list btor2030 btor90)))]
          [btor2032 (bv->signal (zero-extend (signal-value btor2031) (bitvector 64)) btor2031)]
          [btor2033 (bv->signal (zero-extend (signal-value btor1676) (bitvector 1)) btor1676)]
          [btor2034 (bitvector 72)]
          [btor2035 (bitvector 67)]
          [btor2036 (bv->signal (bv 0 (bitvector 67)))]
          [btor2037 (signal (concat (signal-value btor2036) (signal-value btor91))
                            (merge-state (list btor2036 btor91)))]
          [btor2038 (bv->signal (zero-extend (signal-value btor2037) (bitvector 72)) btor2037)]
          [btor2039 (bv->signal (zero-extend (signal-value btor417) (bitvector 2)) btor417)]
          [btor2040 (bv->signal (bv 0 (bitvector 43)))]
          [btor2041 (signal (concat (signal-value btor2040) (signal-value btor92))
                            (merge-state (list btor2040 btor92)))]
          [btor2042 (bv->signal (zero-extend (signal-value btor2041) (bitvector 48)) btor2041)]
          [btor2043 (bv->signal (zero-extend (signal-value btor1736) (bitvector 1)) btor1736)]
          [btor2044 (signal (concat (signal-value btor1844) (signal-value btor93))
                            (merge-state (list btor1844 btor93)))]
          [btor2045 (bv->signal (zero-extend (signal-value btor2044) (bitvector 40)) btor2044)]
          [btor2046 (bv->signal (zero-extend (signal-value btor1255) (bitvector 45)) btor1255)]
          [btor2047 (bv->signal (zero-extend (signal-value btor1258) (bitvector 45)) btor1258)]
          [btor2048 (bv->signal (zero-extend (signal-value btor1253) (bitvector 45)) btor1253)]
          [btor2049 (bv->signal (zero-extend (signal-value btor1245) (bitvector 44)) btor1245)]
          [btor2050 (bv->signal (zero-extend (signal-value btor1295) (bitvector 45)) btor1295)]
          [btor2051 (bv->signal (zero-extend (signal-value btor1296) (bitvector 45)) btor1296)]
          [btor2052 (bv->signal (zero-extend (signal-value btor1294) (bitvector 45)) btor1294)]
          [btor2053 (bv->signal (zero-extend (signal-value btor1287) (bitvector 45)) btor1287)]
          [btor2054 (bv->signal (zero-extend (signal-value btor1748) (bitvector 1)) btor1748)]
          [btor2055 (bitvector 88)]
          [btor2056 (bitvector 83)]
          [btor2057 (bv->signal (bv 0 (bitvector 83)))]
          [btor2058 (signal (concat (signal-value btor2057) (signal-value btor94))
                            (merge-state (list btor2057 btor94)))]
          [btor2059 (bv->signal (zero-extend (signal-value btor2058) (bitvector 88)) btor2058)]
          [btor2060 (bv->signal (zero-extend (signal-value btor1786) (bitvector 8)) btor1786)]
          [btor2061 (bv->signal (zero-extend (signal-value btor1793) (bitvector 8)) btor1793)]
          [btor2062 (bitvector 49)]
          [btor2063 (signal (concat (signal-value btor1347) (signal-value btor1468))
                            (merge-state (list btor1347 btor1468)))]
          [btor2064 (bv->signal (zero-extend (signal-value btor2063) (bitvector 49)) btor2063)]
          [btor2065 (bv->signal (zero-extend (signal-value btor1146) (bitvector 27)) btor1146)]
          [btor2066 (signal (bvnot (signal-value btor1842)) (merge-state (list btor1842)))]
          [btor2067 (signal (bvor (signal-value btor2066) (signal-value btor1920))
                            (merge-state (list btor2066 btor1920)))]
          [btor2068 (bv->signal (zero-extend (signal-value btor2067) (bitvector 1)) btor2067)]
          [btor2069 (bv->signal (zero-extend (signal-value btor1184) (bitvector 18)) btor1184)]
          [btor2070 (bv->signal (zero-extend (signal-value btor1404) (bitvector 1)) btor1404)]
          [btor2071 (bv->signal (zero-extend (signal-value btor1917) (bitvector 1)) btor1917)]
          [btor2072 (bv->signal (zero-extend (signal-value btor1468) (bitvector 1)) btor1468)]
          [btor2073 (bv->signal (zero-extend (signal-value btor1465) (bitvector 1)) btor1465)]
          [btor2074 (bv->signal (zero-extend (signal-value btor1309) (bitvector 48)) btor1309)]
          [btor2075 (bv->signal (zero-extend (signal-value btor1369) (bitvector 1)) btor1369)]
          [btor2076 (bv->signal (zero-extend (signal-value btor1361) (bitvector 1)) btor1361)]
          [btor2077 (bv->signal (zero-extend (signal-value btor1349) (bitvector 1)) btor1349)]
          [btor2078 (bv->signal (zero-extend (signal-value btor1313) (bitvector 48)) btor1313)]
          [btor2079 (signal (extract 10 0 (signal-value btor1313)) (signal-state btor1313))]
          [btor2080 (signal (concat (signal-value btor1315) (signal-value btor2079))
                            (merge-state (list btor1315 btor2079)))]
          [btor2081 (signal (extract 22 12 (signal-value btor1313)) (signal-state btor1313))]
          [btor2082 (signal (concat (signal-value btor2081) (signal-value btor2080))
                            (merge-state (list btor2081 btor2080)))]
          [btor2083 (signal (concat (signal-value btor1317) (signal-value btor2082))
                            (merge-state (list btor1317 btor2082)))]
          [btor2084 (signal (extract 34 24 (signal-value btor1313)) (signal-state btor1313))]
          [btor2085 (signal (concat (signal-value btor2084) (signal-value btor2083))
                            (merge-state (list btor2084 btor2083)))]
          [btor2086 (signal (concat (signal-value btor1319) (signal-value btor2085))
                            (merge-state (list btor1319 btor2085)))]
          [btor2087 (signal (extract 47 36 (signal-value btor1313)) (signal-state btor1313))]
          [btor2088 (signal (concat (signal-value btor2087) (signal-value btor2086))
                            (merge-state (list btor2087 btor2086)))]
          [btor2089 (bv->signal (zero-extend (signal-value btor2088) (bitvector 48)) btor2088)]
          [btor2090 (bv->signal (zero-extend (signal-value btor1347) (bitvector 48)) btor1347)]
          [btor2091 (bv->signal (zero-extend (signal-value btor1495) (bitvector 1)) btor1495)]
          [btor2092 (bv->signal (zero-extend (signal-value btor1508) (bitvector 1)) btor1508)]
          [btor2093 (bv->signal (zero-extend (signal-value btor1514) (bitvector 1)) btor1514)]
          [btor2094 (bv->signal (zero-extend (signal-value btor1488) (bitvector 1)) btor1488)]
          [btor2095 (bv->signal (zero-extend (signal-value btor1522) (bitvector 1)) btor1522)]
          [btor2096 (bv->signal (zero-extend (signal-value btor1502) (bitvector 1)) btor1502)]
          [btor2097 (bv->signal (zero-extend (signal-value btor1509) (bitvector 1)) btor1509)]
          [btor2098 (bv->signal (zero-extend (signal-value btor1515) (bitvector 1)) btor1515)]
          [btor2099 (bv->signal (zero-extend (signal-value btor1488) (bitvector 1)) btor1488)]
          [btor2100 (if (bitvector->bool (signal-value btor1917)) btor1404 btor1411)]
          [btor2101 (bv->signal (zero-extend (signal-value btor2100) (bitvector 1)) btor2100)]
          [btor2102 (if (bitvector->bool (signal-value btor1980)) btor248 btor2100)]
          [btor2103 (bv->signal (zero-extend (signal-value btor2102) (bitvector 1)) btor2102)]
          [btor2104 (bv->signal (zero-extend (signal-value btor248) (bitvector 1)) btor248)]
          [btor2105 (bv->signal (zero-extend (signal-value btor1476) (bitvector 1)) btor1476)]
          [btor2106 (bv->signal (zero-extend (signal-value btor1480) (bitvector 1)) btor1480)]
          [btor2107 (bv->signal (zero-extend (signal-value btor1484) (bitvector 1)) btor1484)]
          [btor2108 (bv->signal (zero-extend (signal-value btor1241) (bitvector 45)) btor1241)]
          [btor2109 (bv->signal (zero-extend (signal-value btor1501) (bitvector 1)) btor1501)]
          [btor2110 (bv->signal (zero-extend (signal-value btor1412) (bitvector 1)) btor1412)]
          [btor2111 (bv->signal (zero-extend (signal-value btor97) (bitvector 1)) btor97)]
          [btor2112 (bv->signal (zero-extend (signal-value btor1708) (bitvector 1)) btor1708)]
          [btor2113 (bv->signal (zero-extend (signal-value btor1679) (bitvector 1)) btor1679)]
          [btor2114 (bv->signal (zero-extend (signal-value btor1687) (bitvector 1)) btor1687)]
          [btor2115 (bv->signal (zero-extend (signal-value btor1686) (bitvector 1)) btor1686)]
          [btor2116 (bv->signal (zero-extend (signal-value btor1707) (bitvector 1)) btor1707)]
          [btor2117 (bv->signal (zero-extend (signal-value btor1690) (bitvector 1)) btor1690)]
          [btor2118 (bv->signal (zero-extend (signal-value btor1698) (bitvector 1)) btor1698)]
          [btor2119 (bv->signal (zero-extend (signal-value btor1697) (bitvector 1)) btor1697)]
          [btor2120 (bv->signal (zero-extend (signal-value btor1723) (bitvector 1)) btor1723)]
          [btor2121 (bv->signal (bv 5864062014805 (bitvector 44)))]
          [btor2122 (bv->signal (zero-extend (signal-value btor2121) (bitvector 44)) btor2121)]
          [btor2123 (bv->signal (zero-extend (signal-value btor1283) (bitvector 44)) btor1283)]
          [btor2124 (bv->signal (zero-extend (signal-value btor1411) (bitvector 1)) btor1411)]
          [btor2125 (bv->signal (zero-extend (signal-value btor1980) (bitvector 1)) btor1980)]
          [btor2126 (bv->signal (zero-extend (signal-value btor1304) (bitvector 48)) btor1304)]
          [btor2127 (bv->signal (zero-extend (signal-value btor1474) (bitvector 13)) btor1474)]
          [btor2128 (bv->signal (zero-extend (signal-value btor1478) (bitvector 13)) btor1478)]
          [btor2129 (bv->signal (zero-extend (signal-value btor1482) (bitvector 13)) btor1482)]
          [btor2130 (bv->signal (zero-extend (signal-value btor1486) (bitvector 14)) btor1486)]
          [btor2131 (bv->signal (zero-extend (signal-value btor1311) (bitvector 48)) btor1311)]
          [btor2132 (bv->signal (zero-extend (signal-value btor1354) (bitvector 48)) btor1354)]
          [btor2133 (signal (bvand (signal-value btor2067) (signal-value btor1708))
                            (merge-state (list btor2067 btor1708)))]
          [btor2134 (signal (bvand (signal-value btor2133) (signal-value btor1688))
                            (merge-state (list btor2133 btor1688)))]
          [btor2135 (signal (bool->bitvector (bveq (signal-value btor1830) (signal-value btor105)))
                            (merge-state (list btor1830 btor105)))]
          [btor2136 (if (bitvector->bool (signal-value btor2135)) btor2134 btor248)]
          [btor2137 (signal (bvand (signal-value btor2067) (signal-value btor1687))
                            (merge-state (list btor2067 btor1687)))]
          [btor2138 (bv->signal (zero-extend (signal-value btor97) (bitvector 2)) btor97)]
          [btor2139 (signal (bool->bitvector (bveq (signal-value btor1830) (signal-value btor2138)))
                            (merge-state (list btor1830 btor2138)))]
          [btor2140 (if (bitvector->bool (signal-value btor2139)) btor2137 btor2136)]
          [btor2141 (bv->signal (zero-extend (signal-value btor2140) (bitvector 1)) btor2140)]
          [btor2142 (bv->signal (zero-extend (signal-value btor1677) (bitvector 48)) btor1677)]
          [btor2143 (bv->signal (zero-extend (signal-value btor1539) (bitvector 48)) btor1539)]
          [btor2144 (bv->signal (zero-extend (signal-value btor1724) (bitvector 1)) btor1724)]
          [btor2145 (bv->signal (zero-extend (signal-value btor1343) (bitvector 48)) btor1343)]
          [btor2146 (bv->signal (zero-extend (signal-value btor1269) (bitvector 2)) btor1269)]
          [btor2147 (bv->signal (zero-extend (signal-value btor1274) (bitvector 48)) btor1274)]
          [btor2148 (bv->signal (zero-extend (signal-value btor1737) (bitvector 1)) btor1737)]
          [btor2149 (bv->signal (zero-extend (signal-value btor1740) (bitvector 1)) btor1740)]
          [btor2150 (bv->signal (zero-extend (signal-value btor1752) (bitvector 1)) btor1752)]
          [btor2151 (bv->signal (zero-extend (signal-value btor1755) (bitvector 1)) btor1755)]
          [btor2152 (bv->signal (zero-extend (signal-value btor1762) (bitvector 1)) btor1762)]
          [btor2153 (bv->signal (zero-extend (signal-value btor1765) (bitvector 1)) btor1765)]
          [btor2154 (bv->signal (zero-extend (signal-value btor1769) (bitvector 1)) btor1769)]
          [btor2155 (bv->signal (zero-extend (signal-value btor1772) (bitvector 1)) btor1772)]
          [btor2156 (bv->signal (zero-extend (signal-value btor1741) (bitvector 1)) btor1741)]
          [btor2157 (bv->signal (zero-extend (signal-value btor1756) (bitvector 1)) btor1756)]
          [btor2158 (bv->signal (zero-extend (signal-value btor1766) (bitvector 1)) btor1766)]
          [btor2159 (bv->signal (zero-extend (signal-value btor1773) (bitvector 1)) btor1773)]
          [btor2160 (bv->signal (zero-extend (signal-value btor1757) (bitvector 1)) btor1757)]
          [btor2161 (bv->signal (zero-extend (signal-value btor1774) (bitvector 1)) btor1774)]
          [btor2162 (bv->signal (zero-extend (signal-value btor1775) (bitvector 1)) btor1775)]
          [btor2163 (bv->signal (zero-extend (signal-value btor1303) (bitvector 48)) btor1303)]
          [btor2164 (bv->signal (zero-extend (signal-value btor896) (bitvector 48)) btor896)]
          [btor2165 (bv->signal (zero-extend (signal-value btor895) (bitvector 48)) btor895)]
          [btor2167 (if (bitvector->bool (signal-value btor1886)) btor257 btor107)]
          [btor2168 (bv->signal (bv 0 (bitvector 30)))]
          [btor2169 (signal (apply bvor (bitvector->bits (signal-value btor265)))
                            (signal-state btor265))]
          [btor2170 (signal (bvnot (signal-value btor2169)) (merge-state (list btor2169)))]
          [btor2171 (signal (bvor (signal-value btor1988) (signal-value btor2170))
                            (merge-state (list btor1988 btor2170)))]
          [btor2172 (if (bitvector->bool (signal-value btor2171)) btor2168 btor2167)]
          [btor2176 (signal (bool->bitvector (bveq (signal-value btor265) (signal-value btor105)))
                            (merge-state (list btor265 btor105)))]
          [btor2177 (if (bitvector->bool (signal-value btor2176)) btor107 btor257)]
          [btor2178 (if (bitvector->bool (signal-value btor1889)) btor2177 btor264)]
          [btor2179 (if (bitvector->bool (signal-value btor2171)) btor2168 btor2178)]
          [btor2183 (if (bitvector->bool (signal-value btor1898)) btor356 btor278)]
          [btor2184 (signal (apply bvor (bitvector->bits (signal-value btor364)))
                            (signal-state btor364))]
          [btor2185 (signal (bvnot (signal-value btor2184)) (merge-state (list btor2184)))]
          [btor2186 (signal (bvor (signal-value btor1992) (signal-value btor2185))
                            (merge-state (list btor1992 btor2185)))]
          [btor2187 (if (bitvector->bool (signal-value btor2186)) btor1110 btor2183)]
          [btor2191 (signal (bool->bitvector (bveq (signal-value btor364) (signal-value btor105)))
                            (merge-state (list btor364 btor105)))]
          [btor2192 (if (bitvector->bool (signal-value btor2191)) btor278 btor356)]
          [btor2193 (if (bitvector->bool (signal-value btor1901)) btor2192 btor363)]
          [btor2194 (if (bitvector->bool (signal-value btor1992)) btor1110 btor2193)]
          [btor2198 (if (bitvector->bool (signal-value btor1895)) btor393 btor400)]
          [btor2199 (bv->signal (bv 0 (bitvector 4)))]
          [btor2200 (if (bitvector->bool (signal-value btor1984)) btor2199 btor2198)]
          [btor2204 (signal (bvand (signal-value btor1920) (signal-value btor1490))
                            (merge-state (list btor1920 btor1490)))]
          [btor2205 (if (bitvector->bool (signal-value btor2204)) btor1642 btor538)]
          [btor2206 (signal (bvor (signal-value btor2016) (signal-value btor2140))
                            (merge-state (list btor2016 btor2140)))]
          [btor2207 (if (bitvector->bool (signal-value btor2206)) btor892 btor2205)]
          [btor2211 (if (bitvector->bool (signal-value btor1907)) btor626 btor633)]
          [btor2212 (bv->signal (bv 0 (bitvector 9)))]
          [btor2213 (if (bitvector->bool (signal-value btor1996)) btor2212 btor2211)]
          [btor2217 (if (bitvector->bool (signal-value btor1910)) btor876 btor883)]
          [btor2218 (signal (bvnot (signal-value btor884)) (merge-state (list btor884)))]
          [btor2219 (signal (bvor (signal-value btor2000) (signal-value btor2218))
                            (merge-state (list btor2000 btor2218)))]
          [btor2220 (if (bitvector->bool (signal-value btor2219)) btor892 btor2217)]
          [btor2224 (if (bitvector->bool (signal-value btor42)) btor935 btor942)]
          [btor2225 (bv->signal (bv 0 (bitvector 5)))]
          [btor2226 (signal (bvnot (signal-value btor943)) (merge-state (list btor943)))]
          [btor2227 (signal (bvor (signal-value btor2008) (signal-value btor2226))
                            (merge-state (list btor2008 btor2226)))]
          [btor2228 (if (bitvector->bool (signal-value btor2227)) btor2225 btor2224)]
          [btor2232 (if (bitvector->bool (signal-value btor1913)) btor1066 btor1073)]
          [btor2233 (signal (bvnot (signal-value btor1104)) (merge-state (list btor1104)))]
          [btor2234 (signal (bvor (signal-value btor2004) (signal-value btor2233))
                            (merge-state (list btor2004 btor2233)))]
          [btor2235 (if (bitvector->bool (signal-value btor2234)) btor947 btor2232)]
          [btor2239 (if (bitvector->bool (signal-value btor1892)) btor1135 btor1142)]
          [btor2240 (if (bitvector->bool (signal-value btor2004)) btor947 btor2239)]
          [btor2244 (if (bitvector->bool (signal-value btor1917)) btor1246 btor1253)]
          [btor2245 (signal (bvnot (signal-value btor1254)) (merge-state (list btor1254)))]
          [btor2246 (signal (bvor (signal-value btor2012) (signal-value btor2245))
                            (merge-state (list btor2012 btor2245)))]
          [btor2247 (if (bitvector->bool (signal-value btor2246)) btor1240 btor2244)]
          [btor2251 (if (bitvector->bool (signal-value btor1917)) btor1287 btor1294)]
          [btor2252 (if (bitvector->bool (signal-value btor2246)) btor1240 btor2251)]
          [btor2256 (if (bitvector->bool (signal-value btor1907)) btor1389 btor1396)]
          [btor2257 (if (bitvector->bool (signal-value btor1996)) btor951 btor2256)]
          [btor2264 (if (bitvector->bool (signal-value btor2204)) btor405 btor1425)]
          [btor2265 (if (bitvector->bool (signal-value btor2206)) btor248 btor2264)]
          [btor2269 (if (bitvector->bool (signal-value btor2204)) btor1519 btor1432)]
          [btor2270 (if (bitvector->bool (signal-value btor2206)) btor2199 btor2269)]
          [btor2274 (if (bitvector->bool (signal-value btor1904)) btor1452 btor1459)]
          [btor2275 (if (bitvector->bool (signal-value btor1980)) btor248 btor2274)]
          [btor2279 (if (bitvector->bool (signal-value btor2204)) btor1522 btor1529)]
          [btor2280 (if (bitvector->bool (signal-value btor2206)) btor248 btor2279)]
          [btor2284 (if (bitvector->bool (signal-value btor2204)) btor1679 btor1686)]
          [btor2285 (if (bitvector->bool (signal-value btor2206)) btor248 btor2284)]
          [btor2289 (if (bitvector->bool (signal-value btor2204)) btor1690 btor1697)]
          [btor2290 (if (bitvector->bool (signal-value btor2206)) btor248 btor2289)]
          [btor2294 (if (bitvector->bool (signal-value btor2204)) btor1686 btor1707)]
          [btor2295 (if (bitvector->bool (signal-value btor2206)) btor248 btor2294)]
          [btor2299 (if (bitvector->bool (signal-value btor2204)) btor1697 btor1723)]
          [btor2300 (if (bitvector->bool (signal-value btor2206)) btor248 btor2299)]
          [btor2304 (if (bitvector->bool (signal-value btor2204)) btor1786 btor1793)]
          [btor2305 (bv->signal (bv 0 (bitvector 8)))]
          [btor2306 (if (bitvector->bool (signal-value btor2206)) btor2305 btor2304)])
     (signal
      (signal-value btor1712)
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
                                                                                        btor107))
                                                                             'state96
                                                                             (signal-value btor2172))
                                                                            'state98
                                                                            (signal-value btor102))
                                                                           'state258
                                                                           (signal-value btor264))
                                                                          'state259
                                                                          (signal-value btor2179))
                                                                         'state260
                                                                         (signal-value btor102))
                                                                        'state272
                                                                        (signal-value btor278))
                                                                       'state273
                                                                       (signal-value btor2187))
                                                                      'state274
                                                                      (signal-value btor102))
                                                                     'state357
                                                                     (signal-value btor363))
                                                                    'state358
                                                                    (signal-value btor2194))
                                                                   'state359
                                                                   (signal-value btor102))
                                                                  'state394
                                                                  (signal-value btor400))
                                                                 'state395
                                                                 (signal-value btor2200))
                                                                'state396
                                                                (signal-value btor102))
                                                               'state532
                                                               (signal-value btor538))
                                                              'state533
                                                              (signal-value btor2207))
                                                             'state534
                                                             (signal-value btor102))
                                                            'state627
                                                            (signal-value btor633))
                                                           'state628
                                                           (signal-value btor2213))
                                                          'state629
                                                          (signal-value btor102))
                                                         'state877
                                                         (signal-value btor883))
                                                        'state878
                                                        (signal-value btor2220))
                                                       'state879
                                                       (signal-value btor102))
                                                      'state936
                                                      (signal-value btor942))
                                                     'state937
                                                     (signal-value btor2228))
                                                    'state938
                                                    (signal-value btor102))
                                                   'state1067
                                                   (signal-value btor1073))
                                                  'state1068
                                                  (signal-value btor2235))
                                                 'state1069
                                                 (signal-value btor102))
                                                'state1136
                                                (signal-value btor1142))
                                               'state1137
                                               (signal-value btor2240))
                                              'state1138
                                              (signal-value btor102))
                                             'state1247
                                             (signal-value btor1253))
                                            'state1248
                                            (signal-value btor2247))
                                           'state1249
                                           (signal-value btor102))
                                          'state1288
                                          (signal-value btor1294))
                                         'state1289
                                         (signal-value btor2252))
                                        'state1290
                                        (signal-value btor102))
                                       'state1390
                                       (signal-value btor1396))
                                      'state1391
                                      (signal-value btor2257))
                                     'state1392
                                     (signal-value btor102))
                                    'state1405
                                    (signal-value btor1411))
                                   'state1406
                                   (signal-value btor2102))
                                  'state1407
                                  (signal-value btor102))
                                 'state1419
                                 (signal-value btor1425))
                                'state1420
                                (signal-value btor2265))
                               'state1421
                               (signal-value btor102))
                              'state1426
                              (signal-value btor1432))
                             'state1427
                             (signal-value btor2270))
                            'state1428
                            (signal-value btor102))
                           'state1453
                           (signal-value btor1459))
                          'state1454
                          (signal-value btor2275))
                         'state1455
                         (signal-value btor102))
                        'state1523
                        (signal-value btor1529))
                       'state1524
                       (signal-value btor2280))
                      'state1525
                      (signal-value btor102))
                     'state1680
                     (signal-value btor1686))
                    'state1681
                    (signal-value btor2285))
                   'state1682
                   (signal-value btor102))
                  'state1691
                  (signal-value btor1697))
                 'state1692
                 (signal-value btor2290))
                'state1693
                (signal-value btor102))
               'state1701
               (signal-value btor1707))
              'state1702
              (signal-value btor2295))
             'state1703
             (signal-value btor102))
            'state1717
            (signal-value btor1723))
           'state1718
           (signal-value btor2300))
          'state1719
          (signal-value btor102))
         'state1787
         (signal-value btor1793))
        'state1788
        (signal-value btor2306))
       'state1789
       (signal-value btor102))))))

(module+ test
  (require rackunit
           rosette)
  (begin-test (define-symbolic A (bitvector 30))
              (define-symbolic ACASCREG (bitvector 32))
              (define-symbolic ACIN (bitvector 30))
              (define-symbolic ADREG (bitvector 32))
              (define-symbolic ALUMODE (bitvector 4))
              (define-symbolic ALUMODEREG (bitvector 32))
              (define-symbolic AMULTSEL (bitvector 5))
              (define-symbolic AREG (bitvector 32))
              (define-symbolic AUTORESET_PATDET (bitvector 5))
              (define-symbolic AUTORESET_PRIORITY (bitvector 5))
              (define-symbolic A_INPUT (bitvector 5))
              (define-symbolic B (bitvector 18))
              (define-symbolic BCASCREG (bitvector 32))
              (define-symbolic BCIN (bitvector 18))
              (define-symbolic BMULTSEL (bitvector 5))
              (define-symbolic BREG (bitvector 32))
              (define-symbolic B_INPUT (bitvector 5))
              (define-symbolic C (bitvector 48))
              (define-symbolic CARRYCASCIN (bitvector 1))
              (define-symbolic CARRYIN (bitvector 1))
              (define-symbolic CARRYINREG (bitvector 32))
              (define-symbolic CARRYINSEL (bitvector 3))
              (define-symbolic CARRYINSELREG (bitvector 32))
              (define-symbolic CEA1 (bitvector 1))
              (define-symbolic CEA2 (bitvector 1))
              (define-symbolic CEAD (bitvector 1))
              (define-symbolic CEALUMODE (bitvector 1))
              (define-symbolic CEB1 (bitvector 1))
              (define-symbolic CEB2 (bitvector 1))
              (define-symbolic CEC (bitvector 1))
              (define-symbolic CECARRYIN (bitvector 1))
              (define-symbolic CECTRL (bitvector 1))
              (define-symbolic CED (bitvector 1))
              (define-symbolic CEINMODE (bitvector 1))
              (define-symbolic CEM (bitvector 1))
              (define-symbolic CEP (bitvector 1))
              (define-symbolic CLK (bitvector 1))
              (define-symbolic CREG (bitvector 32))
              (define-symbolic D (bitvector 27))
              (define-symbolic DREG (bitvector 32))
              (define-symbolic INMODE (bitvector 5))
              (define-symbolic INMODEREG (bitvector 32))
              (define-symbolic IS_ALUMODE_INVERTED (bitvector 4))
              (define-symbolic IS_CARRYIN_INVERTED (bitvector 1))
              (define-symbolic IS_CLK_INVERTED (bitvector 1))
              (define-symbolic IS_INMODE_INVERTED (bitvector 5))
              (define-symbolic IS_OPMODE_INVERTED (bitvector 9))
              (define-symbolic IS_RSTALLCARRYIN_INVERTED (bitvector 1))
              (define-symbolic IS_RSTALUMODE_INVERTED (bitvector 1))
              (define-symbolic IS_RSTA_INVERTED (bitvector 1))
              (define-symbolic IS_RSTB_INVERTED (bitvector 1))
              (define-symbolic IS_RSTCTRL_INVERTED (bitvector 1))
              (define-symbolic IS_RSTC_INVERTED (bitvector 1))
              (define-symbolic IS_RSTD_INVERTED (bitvector 1))
              (define-symbolic IS_RSTINMODE_INVERTED (bitvector 1))
              (define-symbolic IS_RSTM_INVERTED (bitvector 1))
              (define-symbolic IS_RSTP_INVERTED (bitvector 1))
              (define-symbolic MASK (bitvector 48))
              (define-symbolic MREG (bitvector 32))
              (define-symbolic MULTSIGNIN (bitvector 1))
              (define-symbolic OPMODE (bitvector 9))
              (define-symbolic OPMODEREG (bitvector 32))
              (define-symbolic PATTERN (bitvector 48))
              (define-symbolic PCIN (bitvector 48))
              (define-symbolic PREADDINSEL (bitvector 5))
              (define-symbolic PREG (bitvector 32))
              (define-symbolic RND (bitvector 48))
              (define-symbolic RSTA (bitvector 1))
              (define-symbolic RSTALLCARRYIN (bitvector 1))
              (define-symbolic RSTALUMODE (bitvector 1))
              (define-symbolic RSTB (bitvector 2))
              (define-symbolic RSTC (bitvector 1))
              (define-symbolic RSTCTRL (bitvector 1))
              (define-symbolic RSTD (bitvector 1))
              (define-symbolic RSTINMODE (bitvector 1))
              (define-symbolic RSTM (bitvector 1))
              (define-symbolic RSTP (bitvector 1))
              (define-symbolic SEL_MASK (bitvector 5))
              (define-symbolic SEL_PATTERN (bitvector 5))
              (define-symbolic USE_MULT (bitvector 5))
              (define-symbolic USE_PATTERN_DETECT (bitvector 5))
              (define-symbolic USE_SIMD (bitvector 5))
              (define-symbolic USE_WIDEXOR (bitvector 5))
              (define-symbolic XORSIMD (bitvector 5))
              (define-symbolic unnamed-input-531 (bitvector 48))
              (define-symbolic unnamed-input-897 (bitvector 48))
              (define-symbolic unnamed-input-1276 (bitvector 48))
              (define-symbolic unnamed-input-1332 (bitvector 48))
              (define-symbolic unnamed-input-1376 (bitvector 1))))
