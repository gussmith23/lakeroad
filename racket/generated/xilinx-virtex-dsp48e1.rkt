#lang racket/base
(provide xilinx-virtex-dsp48e1)
(require (file "/Users/vishalc/files/CS/research/lakeroad/racket/signal.rkt"))
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
               (string->symbol (string-append name "state784"))
               (bv 0 (bitvector 1))))
             (append
              (list
               (cons
                (string->symbol (string-append name "state782"))
                (bv 0 (bitvector 1))))
              (append
               (list
                (cons
                 (string->symbol (string-append name "state762"))
                 (bv 0 (bitvector 48))))
               (append
                (list
                 (cons
                  (string->symbol (string-append name "state760"))
                  (bv 0 (bitvector 48))))
                (append
                 (list
                  (cons
                   (string->symbol (string-append name "state749"))
                   (bv 0 (bitvector 1))))
                 (append
                  (list
                   (cons
                    (string->symbol (string-append name "state747"))
                    (bv 0 (bitvector 1))))
                  (append
                   (list
                    (cons
                     (string->symbol (string-append name "state742"))
                     (bv 0 (bitvector 1))))
                   (append
                    (list
                     (cons
                      (string->symbol (string-append name "state740"))
                      (bv 0 (bitvector 1))))
                    (append
                     (list
                      (cons
                       (string->symbol (string-append name "state737"))
                       (bv 0 (bitvector 1))))
                     (append
                      (list
                       (cons
                        (string->symbol (string-append name "state735"))
                        (bv 0 (bitvector 1))))
                      (append
                       (list
                        (cons
                         (string->symbol (string-append name "state726"))
                         (bv 0 (bitvector 1))))
                       (append
                        (list
                         (cons
                          (string->symbol (string-append name "state724"))
                          (bv 0 (bitvector 1))))
                        (append
                         (list
                          (cons
                           (string->symbol (string-append name "state679"))
                           (bv 0 (bitvector 4))))
                         (append
                          (list
                           (cons
                            (string->symbol (string-append name "state677"))
                            (bv 0 (bitvector 4))))
                          (append
                           (list
                            (cons
                             (string->symbol (string-append name "state629"))
                             (bv 0 (bitvector 1))))
                           (append
                            (list
                             (cons
                              (string->symbol (string-append name "state627"))
                              (bv 0 (bitvector 1))))
                            (append
                             (list
                              (cons
                               (string->symbol (string-append name "state614"))
                               (bv 0 (bitvector 1))))
                             (append
                              (list
                               (cons
                                (string->symbol
                                 (string-append name "state612"))
                                (bv 0 (bitvector 1))))
                              (append
                               (list
                                (cons
                                 (string->symbol
                                  (string-append name "state564"))
                                 (bv 0 (bitvector 4))))
                               (append
                                (list
                                 (cons
                                  (string->symbol
                                   (string-append name "state562"))
                                  (bv 0 (bitvector 4))))
                                (append
                                 (list
                                  (cons
                                   (string->symbol
                                    (string-append name "state491"))
                                   (bv 0 (bitvector 48))))
                                 (append
                                  (list
                                   (cons
                                    (string->symbol
                                     (string-append name "state489"))
                                    (bv 0 (bitvector 48))))
                                  (append
                                   (list
                                    (cons
                                     (string->symbol
                                      (string-append name "state391"))
                                     (bv 0 (bitvector 7))))
                                   (append
                                    (list
                                     (cons
                                      (string->symbol
                                       (string-append name "state389"))
                                      (bv 0 (bitvector 7))))
                                    (append
                                     (list
                                      (cons
                                       (string->symbol
                                        (string-append name "state361"))
                                       (bv 0 (bitvector 3))))
                                     (append
                                      (list
                                       (cons
                                        (string->symbol
                                         (string-append name "state359"))
                                        (bv 0 (bitvector 3))))
                                      (append
                                       (list
                                        (cons
                                         (string->symbol
                                          (string-append name "state352"))
                                         (bv 0 (bitvector 43))))
                                       (append
                                        (list
                                         (cons
                                          (string->symbol
                                           (string-append name "state350"))
                                          (bv 0 (bitvector 43))))
                                        (append
                                         (list
                                          (cons
                                           (string->symbol
                                            (string-append name "state207"))
                                           (bv 0 (bitvector 25))))
                                         (append
                                          (list
                                           (cons
                                            (string->symbol
                                             (string-append name "state205"))
                                            (bv 0 (bitvector 25))))
                                          (append
                                           (list
                                            (cons
                                             (string->symbol
                                              (string-append name "state199"))
                                             (bv 0 (bitvector 25))))
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
                                                (string-append
                                                 name
                                                 "state186"))
                                               (bv 0 (bitvector 5))))
                                             (append
                                              (list
                                               (cons
                                                (string->symbol
                                                 (string-append
                                                  name
                                                  "state184"))
                                                (bv 0 (bitvector 5))))
                                              (append
                                               (list
                                                (cons
                                                 (string->symbol
                                                  (string-append
                                                   name
                                                   "state169"))
                                                 (bv 1 (bitvector 1))))
                                               (append
                                                (list
                                                 (cons
                                                  (string->symbol
                                                   (string-append
                                                    name
                                                    "state166"))
                                                  (bv 0 (bitvector 1))))
                                                (append
                                                 (list
                                                  (cons
                                                   (string->symbol
                                                    (string-append
                                                     name
                                                     "state164"))
                                                   (bv 0 (bitvector 1))))
                                                 (append
                                                  (list
                                                   (cons
                                                    (string->symbol
                                                     (string-append
                                                      name
                                                      "state155"))
                                                    (bv 0 (bitvector 18))))
                                                  (append
                                                   (list
                                                    (cons
                                                     (string->symbol
                                                      (string-append
                                                       name
                                                       "state153"))
                                                     (bv 0 (bitvector 18))))
                                                   (append
                                                    (list
                                                     (cons
                                                      (string->symbol
                                                       (string-append
                                                        name
                                                        "state129"))
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
                                                          "state118"))
                                                        (bv 0 (bitvector 30))))
                                                      (append
                                                       (list
                                                        (cons
                                                         (string->symbol
                                                          (string-append
                                                           name
                                                           "state116"))
                                                         (bv
                                                          0
                                                          (bitvector 30))))
                                                       (append
                                                        (list
                                                         (cons
                                                          (string->symbol
                                                           (string-append
                                                            name
                                                            "state85"))
                                                          (bv
                                                           1
                                                           (bitvector 1))))
                                                        (append
                                                         (list
                                                          (cons
                                                           (string->symbol
                                                            (string-append
                                                             name
                                                             "state82"))
                                                           (bv
                                                            0
                                                            (bitvector 30))))
                                                         (append
                                                          (list
                                                           (cons
                                                            (string->symbol
                                                             (string-append
                                                              name
                                                              "state80"))
                                                            (bv
                                                             0
                                                             (bitvector 30))))
                                                          (list))))))))))))))))))))))))))))))))))))))))))))))))
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
           (btor82
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state82")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state82"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state82")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state82")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 30))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor84 (bv->signal (bv 1 (bitvector 1))))
           (btor85
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state85")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state85"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state85")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state85")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor87 (bitvector 2))
           (btor88
            (signal
             (concat (signal-value btor85) (signal-value btor42))
             (list)))
           (btor89
            (bv->signal
             (zero-extend (signal-value btor84) (bitvector 2))
             btor84))
           (btor90
            (signal
             (bool->bitvector
              (bveq (signal-value btor88) (signal-value btor89)))
             (list)))
           (btor91 (if (bitvector->bool (signal-value btor90)) btor82 btor80))
           (btor92 (bv->signal (bv 1 (bitvector 2))))
           (btor93
            (bv->signal
             (sign-extend (signal-value btor92) (bitvector 32))
             btor92))
           (btor94
            (signal
             (bool->bitvector
              (bveq (signal-value btor10) (signal-value btor93)))
             (list)))
           (btor95 (bv->signal (bv 2 (bitvector 3))))
           (btor96
            (bv->signal
             (sign-extend (signal-value btor95) (bitvector 32))
             btor95))
           (btor97
            (signal
             (bool->bitvector
              (bveq (signal-value btor10) (signal-value btor96)))
             (list)))
           (btor98
            (signal (bvor (signal-value btor94) (signal-value btor97)) (list)))
           (btor99 (if (bitvector->bool (signal-value btor98)) btor91 btor79))
           (btor100 (bv->signal (bv 8 (bitvector 4))))
           (btor101
            (bv->signal
             (zero-extend (signal-value btor100) (bitvector 5))
             btor100))
           (btor102
            (signal
             (bool->bitvector
              (bveq (signal-value btor13) (signal-value btor101)))
             (list)))
           (btor103 (if (bitvector->bool (signal-value btor102)) btor5 btor79))
           (btor104
            (bv->signal
             (zero-extend (signal-value btor84) (bitvector 5))
             btor84))
           (btor105
            (signal
             (bool->bitvector
              (bveq (signal-value btor13) (signal-value btor104)))
             (list)))
           (btor106
            (if (bitvector->bool (signal-value btor105)) btor2 btor103))
           (btor107
            (signal
             (apply bvor (bitvector->bits (signal-value btor10)))
             (signal-state btor10)))
           (btor108 (signal (bvnot (signal-value btor107)) (list)))
           (btor109
            (if (bitvector->bool (signal-value btor108)) btor106 btor99))
           (btor110
            (signal
             (apply bvor (bitvector->bits (signal-value btor4)))
             (signal-state btor4)))
           (btor111 (signal (bvnot (signal-value btor110)) (list)))
           (btor112
            (bv->signal
             (sign-extend (signal-value btor95) (bitvector 32))
             btor95))
           (btor113
            (signal
             (bool->bitvector
              (bveq (signal-value btor4) (signal-value btor112)))
             (list)))
           (btor114
            (signal
             (bvor (signal-value btor111) (signal-value btor113))
             (list)))
           (btor115
            (if (bitvector->bool (signal-value btor114)) btor109 btor79))
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
           (btor120
            (if (bitvector->bool (signal-value btor90)) btor118 btor116))
           (btor121
            (if (bitvector->bool (signal-value btor97)) btor120 btor109))
           (btor122
            (bv->signal
             (sign-extend (signal-value btor92) (bitvector 32))
             btor92))
           (btor123
            (signal
             (bool->bitvector
              (bveq (signal-value btor4) (signal-value btor122)))
             (list)))
           (btor124
            (if (bitvector->bool (signal-value btor123)) btor121 btor115))
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
           (btor131
            (if (bitvector->bool (signal-value btor90)) btor129 btor127))
           (btor132
            (bv->signal
             (sign-extend (signal-value btor92) (bitvector 32))
             btor92))
           (btor133
            (signal
             (bool->bitvector
              (bveq (signal-value btor18) (signal-value btor132)))
             (list)))
           (btor134
            (bv->signal
             (sign-extend (signal-value btor95) (bitvector 32))
             btor95))
           (btor135
            (signal
             (bool->bitvector
              (bveq (signal-value btor18) (signal-value btor134)))
             (list)))
           (btor136
            (signal
             (bvor (signal-value btor133) (signal-value btor135))
             (list)))
           (btor137
            (if (bitvector->bool (signal-value btor136)) btor131 btor126))
           (btor138
            (bv->signal
             (zero-extend (signal-value btor100) (bitvector 5))
             btor100))
           (btor139
            (signal
             (bool->bitvector
              (bveq (signal-value btor19) (signal-value btor138)))
             (list)))
           (btor140
            (if (bitvector->bool (signal-value btor139)) btor17 btor126))
           (btor141
            (bv->signal
             (zero-extend (signal-value btor84) (bitvector 5))
             btor84))
           (btor142
            (signal
             (bool->bitvector
              (bveq (signal-value btor19) (signal-value btor141)))
             (list)))
           (btor143
            (if (bitvector->bool (signal-value btor142)) btor15 btor140))
           (btor144
            (signal
             (apply bvor (bitvector->bits (signal-value btor18)))
             (signal-state btor18)))
           (btor145 (signal (bvnot (signal-value btor144)) (list)))
           (btor146
            (if (bitvector->bool (signal-value btor145)) btor143 btor137))
           (btor147
            (signal
             (apply bvor (bitvector->bits (signal-value btor16)))
             (signal-state btor16)))
           (btor148 (signal (bvnot (signal-value btor147)) (list)))
           (btor149
            (bv->signal
             (sign-extend (signal-value btor95) (bitvector 32))
             btor95))
           (btor150
            (signal
             (bool->bitvector
              (bveq (signal-value btor16) (signal-value btor149)))
             (list)))
           (btor151
            (signal
             (bvor (signal-value btor148) (signal-value btor150))
             (list)))
           (btor152
            (if (bitvector->bool (signal-value btor151)) btor146 btor126))
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
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
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
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor157
            (if (bitvector->bool (signal-value btor90)) btor155 btor153))
           (btor158
            (if (bitvector->bool (signal-value btor135)) btor157 btor146))
           (btor159
            (bv->signal
             (sign-extend (signal-value btor92) (bitvector 32))
             btor92))
           (btor160
            (signal
             (bool->bitvector
              (bveq (signal-value btor16) (signal-value btor159)))
             (list)))
           (btor161
            (if (bitvector->bool (signal-value btor160)) btor158 btor152))
           (btor163 (bv->signal (bv 0 (bitvector 1))))
           (btor164
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state164")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state164"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state164")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state164")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
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
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor168
            (signal
             (bvxor (signal-value btor42) (signal-value btor51))
             (list)))
           (btor169
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state169")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state169"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state169")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state169")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor171
            (signal
             (concat (signal-value btor169) (signal-value btor168))
             (list)))
           (btor172
            (bv->signal
             (zero-extend (signal-value btor84) (bitvector 2))
             btor84))
           (btor173
            (signal
             (bool->bitvector
              (bveq (signal-value btor171) (signal-value btor172)))
             (list)))
           (btor174
            (if (bitvector->bool (signal-value btor173)) btor166 btor164))
           (btor175
            (bv->signal
             (sign-extend (signal-value btor92) (bitvector 32))
             btor92))
           (btor176
            (signal
             (bool->bitvector
              (bveq (signal-value btor62) (signal-value btor175)))
             (list)))
           (btor177
            (if (bitvector->bool (signal-value btor176)) btor174 btor163))
           (btor178 (bitvector 13))
           (btor179 (bitvector 43))
           (btor180
            (signal
             (extract 24 0 (signal-value btor109))
             (signal-state btor109)))
           (btor181
            (signal
             (extract 24 0 (signal-value btor120))
             (signal-state btor120)))
           (btor182
            (signal
             (bvxor (signal-value btor47) (signal-value btor52))
             (list)))
           (btor183 (bv->signal (bv 0 (bitvector 5))))
           (btor184
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state184")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state184"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state184")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state184")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 5))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor186
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state186")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state186"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state186")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state186")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 5))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor188
            (if (bitvector->bool (signal-value btor173)) btor186 btor184))
           (btor189
            (bv->signal
             (sign-extend (signal-value btor92) (bitvector 32))
             btor92))
           (btor190
            (signal
             (bool->bitvector
              (bveq (signal-value btor48) (signal-value btor189)))
             (list)))
           (btor191
            (if (bitvector->bool (signal-value btor190)) btor188 btor182))
           (btor192
            (signal
             (extract 0 0 (signal-value btor191))
             (signal-state btor191)))
           (btor193
            (if (bitvector->bool (signal-value btor192)) btor181 btor180))
           (btor194 (bv->signal (bv 0 (bitvector 25))))
           (btor195
            (signal
             (extract 1 1 (signal-value btor191))
             (signal-state btor191)))
           (btor196
            (if (bitvector->bool (signal-value btor195)) btor194 btor193))
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
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state199")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state199"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state199")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state199")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 25))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor201
            (if (bitvector->bool (signal-value btor173)) btor199 btor197))
           (btor202
            (bv->signal
             (sign-extend (signal-value btor92) (bitvector 32))
             btor92))
           (btor203
            (signal
             (bool->bitvector
              (bveq (signal-value btor6) (signal-value btor202)))
             (list)))
           (btor204
            (if (bitvector->bool (signal-value btor203)) btor201 btor194))
           (btor205
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state205")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state205"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state205")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state205")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 25))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor207
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state207")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state207"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state207")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state207")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 25))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor209
            (if (bitvector->bool (signal-value btor173)) btor207 btor205))
           (btor210
            (signal
             (apply bvor (bitvector->bits (signal-value btor46)))
             (signal-state btor46)))
           (btor211 (signal (bvnot (signal-value btor210)) (list)))
           (btor212
            (if (bitvector->bool (signal-value btor211)) btor45 btor209))
           (btor213
            (signal
             (extract 2 2 (signal-value btor191))
             (signal-state btor191)))
           (btor214
            (if (bitvector->bool (signal-value btor213)) btor212 btor194))
           (btor215
            (signal
             (bvadd (signal-value btor196) (signal-value btor214))
             (list)))
           (btor216 (signal (bvneg (signal-value btor196)) (list)))
           (btor217
            (signal
             (bvadd (signal-value btor216) (signal-value btor214))
             (list)))
           (btor218
            (signal
             (extract 3 3 (signal-value btor191))
             (signal-state btor191)))
           (btor219
            (if (bitvector->bool (signal-value btor218)) btor217 btor215))
           (btor220
            (signal
             (apply bvor (bitvector->bits (signal-value btor6)))
             (signal-state btor6)))
           (btor221 (signal (bvnot (signal-value btor220)) (list)))
           (btor222
            (if (bitvector->bool (signal-value btor221)) btor219 btor204))
           (btor223 (bv->signal (bv 9 (bitvector 4))))
           (btor224
            (bv->signal
             (zero-extend (signal-value btor223) (bitvector 5))
             btor223))
           (btor225
            (signal
             (bool->bitvector
              (bveq (signal-value btor75) (signal-value btor224)))
             (list)))
           (btor226
            (if (bitvector->bool (signal-value btor225)) btor222 btor196))
           (btor227
            (signal
             (extract 24 24 (signal-value btor226))
             (signal-state btor226)))
           (btor228 (bitvector 26))
           (btor229
            (signal
             (concat (signal-value btor227) (signal-value btor226))
             (list)))
           (btor230
            (signal
             (extract 24 24 (signal-value btor226))
             (signal-state btor226)))
           (btor231 (bitvector 27))
           (btor232
            (signal
             (concat (signal-value btor230) (signal-value btor229))
             (list)))
           (btor233
            (signal
             (extract 24 24 (signal-value btor226))
             (signal-state btor226)))
           (btor234 (bitvector 28))
           (btor235
            (signal
             (concat (signal-value btor233) (signal-value btor232))
             (list)))
           (btor236
            (signal
             (extract 24 24 (signal-value btor226))
             (signal-state btor226)))
           (btor237 (bitvector 29))
           (btor238
            (signal
             (concat (signal-value btor236) (signal-value btor235))
             (list)))
           (btor239
            (signal
             (extract 24 24 (signal-value btor226))
             (signal-state btor226)))
           (btor240
            (signal
             (concat (signal-value btor239) (signal-value btor238))
             (list)))
           (btor241
            (signal
             (extract 24 24 (signal-value btor226))
             (signal-state btor226)))
           (btor242 (bitvector 31))
           (btor243
            (signal
             (concat (signal-value btor241) (signal-value btor240))
             (list)))
           (btor244
            (signal
             (extract 24 24 (signal-value btor226))
             (signal-state btor226)))
           (btor245
            (signal
             (concat (signal-value btor244) (signal-value btor243))
             (list)))
           (btor246
            (signal
             (extract 24 24 (signal-value btor226))
             (signal-state btor226)))
           (btor247 (bitvector 33))
           (btor248
            (signal
             (concat (signal-value btor246) (signal-value btor245))
             (list)))
           (btor249
            (signal
             (extract 24 24 (signal-value btor226))
             (signal-state btor226)))
           (btor250 (bitvector 34))
           (btor251
            (signal
             (concat (signal-value btor249) (signal-value btor248))
             (list)))
           (btor252
            (signal
             (extract 24 24 (signal-value btor226))
             (signal-state btor226)))
           (btor253 (bitvector 35))
           (btor254
            (signal
             (concat (signal-value btor252) (signal-value btor251))
             (list)))
           (btor255
            (signal
             (extract 24 24 (signal-value btor226))
             (signal-state btor226)))
           (btor256 (bitvector 36))
           (btor257
            (signal
             (concat (signal-value btor255) (signal-value btor254))
             (list)))
           (btor258
            (signal
             (extract 24 24 (signal-value btor226))
             (signal-state btor226)))
           (btor259 (bitvector 37))
           (btor260
            (signal
             (concat (signal-value btor258) (signal-value btor257))
             (list)))
           (btor261
            (signal
             (extract 24 24 (signal-value btor226))
             (signal-state btor226)))
           (btor262 (bitvector 38))
           (btor263
            (signal
             (concat (signal-value btor261) (signal-value btor260))
             (list)))
           (btor264
            (signal
             (extract 24 24 (signal-value btor226))
             (signal-state btor226)))
           (btor265 (bitvector 39))
           (btor266
            (signal
             (concat (signal-value btor264) (signal-value btor263))
             (list)))
           (btor267
            (signal
             (extract 24 24 (signal-value btor226))
             (signal-state btor226)))
           (btor268 (bitvector 40))
           (btor269
            (signal
             (concat (signal-value btor267) (signal-value btor266))
             (list)))
           (btor270
            (signal
             (extract 24 24 (signal-value btor226))
             (signal-state btor226)))
           (btor271 (bitvector 41))
           (btor272
            (signal
             (concat (signal-value btor270) (signal-value btor269))
             (list)))
           (btor273
            (signal
             (extract 24 24 (signal-value btor226))
             (signal-state btor226)))
           (btor274 (bitvector 42))
           (btor275
            (signal
             (concat (signal-value btor273) (signal-value btor272))
             (list)))
           (btor276
            (signal
             (extract 24 24 (signal-value btor226))
             (signal-state btor226)))
           (btor277
            (signal
             (concat (signal-value btor276) (signal-value btor275))
             (list)))
           (btor278
            (signal
             (extract 4 4 (signal-value btor191))
             (signal-state btor191)))
           (btor279
            (if (bitvector->bool (signal-value btor278)) btor157 btor146))
           (btor280
            (signal
             (extract 17 17 (signal-value btor279))
             (signal-state btor279)))
           (btor281 (bitvector 19))
           (btor282
            (signal
             (concat (signal-value btor280) (signal-value btor279))
             (list)))
           (btor283
            (signal
             (extract 17 17 (signal-value btor279))
             (signal-state btor279)))
           (btor284 (bitvector 20))
           (btor285
            (signal
             (concat (signal-value btor283) (signal-value btor282))
             (list)))
           (btor286
            (signal
             (extract 17 17 (signal-value btor279))
             (signal-state btor279)))
           (btor287 (bitvector 21))
           (btor288
            (signal
             (concat (signal-value btor286) (signal-value btor285))
             (list)))
           (btor289
            (signal
             (extract 17 17 (signal-value btor279))
             (signal-state btor279)))
           (btor290 (bitvector 22))
           (btor291
            (signal
             (concat (signal-value btor289) (signal-value btor288))
             (list)))
           (btor292
            (signal
             (extract 17 17 (signal-value btor279))
             (signal-state btor279)))
           (btor293 (bitvector 23))
           (btor294
            (signal
             (concat (signal-value btor292) (signal-value btor291))
             (list)))
           (btor295
            (signal
             (extract 17 17 (signal-value btor279))
             (signal-state btor279)))
           (btor296 (bitvector 24))
           (btor297
            (signal
             (concat (signal-value btor295) (signal-value btor294))
             (list)))
           (btor298
            (signal
             (extract 17 17 (signal-value btor279))
             (signal-state btor279)))
           (btor299
            (signal
             (concat (signal-value btor298) (signal-value btor297))
             (list)))
           (btor300
            (signal
             (extract 17 17 (signal-value btor279))
             (signal-state btor279)))
           (btor301
            (signal
             (concat (signal-value btor300) (signal-value btor299))
             (list)))
           (btor302
            (signal
             (extract 17 17 (signal-value btor279))
             (signal-state btor279)))
           (btor303
            (signal
             (concat (signal-value btor302) (signal-value btor301))
             (list)))
           (btor304
            (signal
             (extract 17 17 (signal-value btor279))
             (signal-state btor279)))
           (btor305
            (signal
             (concat (signal-value btor304) (signal-value btor303))
             (list)))
           (btor306
            (signal
             (extract 17 17 (signal-value btor279))
             (signal-state btor279)))
           (btor307
            (signal
             (concat (signal-value btor306) (signal-value btor305))
             (list)))
           (btor308
            (signal
             (extract 17 17 (signal-value btor279))
             (signal-state btor279)))
           (btor309
            (signal
             (concat (signal-value btor308) (signal-value btor307))
             (list)))
           (btor310
            (signal
             (extract 17 17 (signal-value btor279))
             (signal-state btor279)))
           (btor311
            (signal
             (concat (signal-value btor310) (signal-value btor309))
             (list)))
           (btor312
            (signal
             (extract 17 17 (signal-value btor279))
             (signal-state btor279)))
           (btor313
            (signal
             (concat (signal-value btor312) (signal-value btor311))
             (list)))
           (btor314
            (signal
             (extract 17 17 (signal-value btor279))
             (signal-state btor279)))
           (btor315
            (signal
             (concat (signal-value btor314) (signal-value btor313))
             (list)))
           (btor316
            (signal
             (extract 17 17 (signal-value btor279))
             (signal-state btor279)))
           (btor317
            (signal
             (concat (signal-value btor316) (signal-value btor315))
             (list)))
           (btor318
            (signal
             (extract 17 17 (signal-value btor279))
             (signal-state btor279)))
           (btor319
            (signal
             (concat (signal-value btor318) (signal-value btor317))
             (list)))
           (btor320
            (signal
             (extract 17 17 (signal-value btor279))
             (signal-state btor279)))
           (btor321
            (signal
             (concat (signal-value btor320) (signal-value btor319))
             (list)))
           (btor322
            (signal
             (extract 17 17 (signal-value btor279))
             (signal-state btor279)))
           (btor323
            (signal
             (concat (signal-value btor322) (signal-value btor321))
             (list)))
           (btor324
            (signal
             (extract 17 17 (signal-value btor279))
             (signal-state btor279)))
           (btor325
            (signal
             (concat (signal-value btor324) (signal-value btor323))
             (list)))
           (btor326
            (signal
             (extract 17 17 (signal-value btor279))
             (signal-state btor279)))
           (btor327
            (signal
             (concat (signal-value btor326) (signal-value btor325))
             (list)))
           (btor328
            (signal
             (extract 17 17 (signal-value btor279))
             (signal-state btor279)))
           (btor329
            (signal
             (concat (signal-value btor328) (signal-value btor327))
             (list)))
           (btor330
            (signal
             (extract 17 17 (signal-value btor279))
             (signal-state btor279)))
           (btor331
            (signal
             (concat (signal-value btor330) (signal-value btor329))
             (list)))
           (btor332
            (signal
             (extract 17 17 (signal-value btor279))
             (signal-state btor279)))
           (btor333
            (signal
             (concat (signal-value btor332) (signal-value btor331))
             (list)))
           (btor334
            (signal
             (extract 17 17 (signal-value btor279))
             (signal-state btor279)))
           (btor335
            (signal
             (concat (signal-value btor334) (signal-value btor333))
             (list)))
           (btor336
            (signal
             (bvmul (signal-value btor277) (signal-value btor335))
             (list)))
           (btor337 (bv->signal (bv 0 (bitvector 43))))
           (btor338 (bv->signal (bv 2 (bitvector 2))))
           (btor339
            (bv->signal
             (zero-extend (signal-value btor338) (bitvector 3))
             btor338))
           (btor340
            (signal
             (bool->bitvector
              (bveq (signal-value btor27) (signal-value btor339)))
             (list)))
           (btor341
            (if (bitvector->bool (signal-value btor340)) btor337 btor336))
           (btor342 (bv->signal (bv 11 (bitvector 4))))
           (btor343
            (bv->signal
             (zero-extend (signal-value btor342) (bitvector 5))
             btor342))
           (btor344
            (signal
             (bool->bitvector
              (bveq (signal-value btor76) (signal-value btor343)))
             (list)))
           (btor345 (bv->signal (bv 7 (bitvector 3))))
           (btor346
            (bv->signal
             (zero-extend (signal-value btor345) (bitvector 5))
             btor345))
           (btor347
            (signal
             (bool->bitvector
              ((compose1 not bveq)
               (signal-value btor78)
               (signal-value btor346)))
             (list)))
           (btor348
            (signal
             (bvor (signal-value btor344) (signal-value btor347))
             (list)))
           (btor349
            (if (bitvector->bool (signal-value btor348)) btor337 btor341))
           (btor350
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state350")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state350"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state350")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state350")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 43))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor352
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state352")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state352"))))))
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
                          (bv 0 43))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor354
            (if (bitvector->bool (signal-value btor173)) btor352 btor350))
           (btor355
            (bv->signal
             (sign-extend (signal-value btor92) (bitvector 32))
             btor92))
           (btor356
            (signal
             (bool->bitvector
              (bveq (signal-value btor56) (signal-value btor355)))
             (list)))
           (btor357
            (if (bitvector->bool (signal-value btor356)) btor354 btor349))
           (btor358 (bv->signal (bv 0 (bitvector 3))))
           (btor359
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state359")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state359"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state359")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state359")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 3))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor361
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state361")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state361"))))))
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
                          (bv 0 3))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor363
            (if (bitvector->bool (signal-value btor173)) btor361 btor359))
           (btor364
            (bv->signal
             (sign-extend (signal-value btor92) (bitvector 32))
             btor92))
           (btor365
            (signal
             (bool->bitvector
              (bveq (signal-value btor28) (signal-value btor364)))
             (list)))
           (btor366
            (if (bitvector->bool (signal-value btor365)) btor363 btor358))
           (btor367
            (signal
             (apply bvor (bitvector->bits (signal-value btor28)))
             (signal-state btor28)))
           (btor368 (signal (bvnot (signal-value btor367)) (list)))
           (btor369
            (if (bitvector->bool (signal-value btor368)) btor27 btor366))
           (btor370
            (bv->signal
             (zero-extend (signal-value btor338) (bitvector 3))
             btor338))
           (btor371
            (signal
             (bool->bitvector
              (bveq (signal-value btor369) (signal-value btor370)))
             (list)))
           (btor372
            (if (bitvector->bool (signal-value btor371)) btor337 btor357))
           (btor373
            (signal
             (extract 42 42 (signal-value btor372))
             (signal-state btor372)))
           (btor374 (bitvector 44))
           (btor375
            (signal
             (concat (signal-value btor373) (signal-value btor372))
             (list)))
           (btor376
            (signal
             (extract 42 42 (signal-value btor372))
             (signal-state btor372)))
           (btor377 (bitvector 45))
           (btor378
            (signal
             (concat (signal-value btor376) (signal-value btor375))
             (list)))
           (btor379
            (signal
             (extract 42 42 (signal-value btor372))
             (signal-state btor372)))
           (btor380 (bitvector 46))
           (btor381
            (signal
             (concat (signal-value btor379) (signal-value btor378))
             (list)))
           (btor382
            (signal
             (extract 42 42 (signal-value btor372))
             (signal-state btor372)))
           (btor383 (bitvector 47))
           (btor384
            (signal
             (concat (signal-value btor382) (signal-value btor381))
             (list)))
           (btor385
            (signal
             (extract 42 42 (signal-value btor372))
             (signal-state btor372)))
           (btor386
            (signal
             (concat (signal-value btor385) (signal-value btor384))
             (list)))
           (btor387 (bv->signal (bv 0 (bitvector 48))))
           (btor388 (bv->signal (bv 0 (bitvector 7))))
           (btor389
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state389")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state389"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state389")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state389")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 7))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor391
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state391")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state391"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state391")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state391")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 7))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor393
            (if (bitvector->bool (signal-value btor173)) btor391 btor389))
           (btor394
            (signal
             (bvxor (signal-value btor58) (signal-value btor54))
             (list)))
           (btor395
            (signal
             (apply bvor (bitvector->bits (signal-value btor59)))
             (signal-state btor59)))
           (btor396 (signal (bvnot (signal-value btor395)) (list)))
           (btor397
            (if (bitvector->bool (signal-value btor396)) btor394 btor393))
           (btor398
            (signal
             (extract 1 0 (signal-value btor397))
             (signal-state btor397)))
           (btor399
            (signal
             (bool->bitvector
              (bveq (signal-value btor398) (signal-value btor338)))
             (list)))
           (btor400
            (signal
             (apply bvor (bitvector->bits (signal-value btor398)))
             (signal-state btor398)))
           (btor401 (signal (bvnot (signal-value btor400)) (list)))
           (btor402
            (signal
             (concat (signal-value btor401) (signal-value btor399))
             (list)))
           (btor403
            (signal
             (apply bvor (bitvector->bits (signal-value btor402)))
             (signal-state btor402)))
           (btor404
            (if (bitvector->bool (signal-value btor403)) btor387 btor386))
           (btor405
            (signal
             (concat (signal-value btor109) (signal-value btor146))
             (list)))
           (btor406 (bv->signal (bv 5 (bitvector 3))))
           (btor407
            (bv->signal
             (zero-extend (signal-value btor406) (bitvector 5))
             btor406))
           (btor408
            (signal
             (bool->bitvector
              (bveq (signal-value btor76) (signal-value btor407)))
             (list)))
           (btor409
            (signal
             (bvand (signal-value btor108) (signal-value btor145))
             (list)))
           (btor410
            (signal
             (apply bvor (bitvector->bits (signal-value btor56)))
             (signal-state btor56)))
           (btor411 (signal (bvnot (signal-value btor410)) (list)))
           (btor412
            (signal
             (bvand (signal-value btor409) (signal-value btor411))
             (list)))
           (btor413
            (signal
             (apply bvor (bitvector->bits (signal-value btor62)))
             (signal-state btor62)))
           (btor414 (signal (bvnot (signal-value btor413)) (list)))
           (btor415
            (signal
             (bvand (signal-value btor409) (signal-value btor414))
             (list)))
           (btor416
            (signal
             (bvor (signal-value btor412) (signal-value btor415))
             (list)))
           (btor417
            (signal
             (bvand (signal-value btor411) (signal-value btor414))
             (list)))
           (btor418
            (signal
             (bvor (signal-value btor416) (signal-value btor417))
             (list)))
           (btor419
            (signal
             (bvand (signal-value btor408) (signal-value btor418))
             (list)))
           (btor420
            (if (bitvector->bool (signal-value btor419)) btor387 btor405))
           (btor421 (bv->signal (bv 3 (bitvector 2))))
           (btor422
            (signal
             (bool->bitvector
              (bveq (signal-value btor398) (signal-value btor421)))
             (list)))
           (btor423
            (if (bitvector->bool (signal-value btor422)) btor420 btor404))
           (btor424 (bv->signal (bv 281474976710655 (bitvector 48))))
           (btor425
            (signal
             (concat (signal-value btor57) (signal-value btor57))
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
           (btor429 (bitvector 6))
           (btor430
            (signal
             (concat (signal-value btor57) (signal-value btor428))
             (list)))
           (btor431
            (signal
             (concat (signal-value btor57) (signal-value btor430))
             (list)))
           (btor432 (bitvector 8))
           (btor433
            (signal
             (concat (signal-value btor57) (signal-value btor431))
             (list)))
           (btor434 (bitvector 9))
           (btor435
            (signal
             (concat (signal-value btor57) (signal-value btor433))
             (list)))
           (btor436 (bitvector 10))
           (btor437
            (signal
             (concat (signal-value btor57) (signal-value btor435))
             (list)))
           (btor438 (bitvector 11))
           (btor439
            (signal
             (concat (signal-value btor57) (signal-value btor437))
             (list)))
           (btor440 (bitvector 12))
           (btor441
            (signal
             (concat (signal-value btor57) (signal-value btor439))
             (list)))
           (btor442
            (signal
             (concat (signal-value btor57) (signal-value btor441))
             (list)))
           (btor443 (bitvector 14))
           (btor444
            (signal
             (concat (signal-value btor57) (signal-value btor442))
             (list)))
           (btor445 (bitvector 15))
           (btor446
            (signal
             (concat (signal-value btor57) (signal-value btor444))
             (list)))
           (btor447 (bitvector 16))
           (btor448
            (signal
             (concat (signal-value btor57) (signal-value btor446))
             (list)))
           (btor449 (bitvector 17))
           (btor450
            (signal
             (concat (signal-value btor57) (signal-value btor448))
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
             (concat (signal-value btor57) (signal-value btor472))
             (list)))
           (btor474
            (signal
             (concat (signal-value btor57) (signal-value btor473))
             (list)))
           (btor475
            (signal
             (concat (signal-value btor57) (signal-value btor474))
             (list)))
           (btor476
            (signal
             (concat (signal-value btor57) (signal-value btor475))
             (list)))
           (btor477
            (signal
             (concat (signal-value btor57) (signal-value btor476))
             (list)))
           (btor478
            (signal
             (concat (signal-value btor57) (signal-value btor477))
             (list)))
           (btor479
            (signal
             (concat (signal-value btor57) (signal-value btor478))
             (list)))
           (btor480
            (signal
             (concat (signal-value btor57) (signal-value btor479))
             (list)))
           (btor481
            (signal
             (concat (signal-value btor57) (signal-value btor480))
             (list)))
           (btor482
            (signal
             (extract 6 4 (signal-value btor397))
             (signal-state btor397)))
           (btor483 (bv->signal (bv 4 (bitvector 3))))
           (btor484
            (signal
             (bool->bitvector
              (bveq (signal-value btor482) (signal-value btor483)))
             (list)))
           (btor485
            (if (bitvector->bool (signal-value btor484)) btor481 btor424))
           (btor486
            (signal
             (extract 3 2 (signal-value btor397))
             (signal-state btor397)))
           (btor487
            (signal
             (bool->bitvector
              (bveq (signal-value btor486) (signal-value btor338)))
             (list)))
           (btor488
            (if (bitvector->bool (signal-value btor487)) btor485 btor387))
           (btor489
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state489")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state489"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state489")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state489")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 48))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor491
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state491")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state491"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state491")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state491")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 48))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor493
            (if (bitvector->bool (signal-value btor173)) btor491 btor489))
           (btor494
            (signal
             (apply bvor (bitvector->bits (signal-value btor43)))
             (signal-state btor43)))
           (btor495 (signal (bvnot (signal-value btor494)) (list)))
           (btor496
            (if (bitvector->bool (signal-value btor495)) btor21 btor493))
           (btor497
            (signal
             (bool->bitvector
              (bveq (signal-value btor486) (signal-value btor421)))
             (list)))
           (btor498
            (if (bitvector->bool (signal-value btor497)) btor496 btor488))
           (btor499
            (signal
             (bvand (signal-value btor423) (signal-value btor498))
             (list)))
           (btor500
            (bv->signal
             (zero-extend (signal-value btor421) (bitvector 3))
             btor421))
           (btor501
            (signal
             (bool->bitvector
              (bveq (signal-value btor482) (signal-value btor500)))
             (list)))
           (btor502
            (if (bitvector->bool (signal-value btor501)) btor496 btor61))
           (btor503
            (signal
             (extract 47 17 (signal-value btor61))
             (signal-state btor61)))
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
           (btor534
            (signal
             (extract 47 47 (signal-value btor61))
             (signal-state btor61)))
           (btor535
            (signal
             (concat (signal-value btor534) (signal-value btor533))
             (list)))
           (btor536
            (signal
             (extract 47 47 (signal-value btor61))
             (signal-state btor61)))
           (btor537
            (signal
             (concat (signal-value btor536) (signal-value btor535))
             (list)))
           (btor538
            (signal
             (extract 6 5 (signal-value btor397))
             (signal-state btor397)))
           (btor539
            (signal
             (bool->bitvector
              (bveq (signal-value btor538) (signal-value btor421)))
             (list)))
           (btor540
            (bv->signal
             (zero-extend (signal-value btor338) (bitvector 3))
             btor338))
           (btor541
            (signal
             (bool->bitvector
              (bveq (signal-value btor482) (signal-value btor540)))
             (list)))
           (btor542
            (signal
             (apply bvor (bitvector->bits (signal-value btor482)))
             (signal-state btor482)))
           (btor543 (signal (bvnot (signal-value btor542)) (list)))
           (btor544
            (signal
             (concat (signal-value btor539) (signal-value btor484))
             (list)))
           (btor545
            (signal
             (concat (signal-value btor541) (signal-value btor544))
             (list)))
           (btor546
            (signal
             (concat (signal-value btor543) (signal-value btor545))
             (list)))
           (btor547
            (signal
             (apply bvor (bitvector->bits (signal-value btor546)))
             (signal-state btor546)))
           (btor548
            (if (bitvector->bool (signal-value btor547)) btor387 btor537))
           (btor549
            (signal
             (bool->bitvector
              (bveq (signal-value btor482) (signal-value btor406)))
             (list)))
           (btor550
            (signal
             (bvor (signal-value btor549) (signal-value btor547))
             (list)))
           (btor551
            (if (bitvector->bool (signal-value btor550)) btor548 btor502))
           (btor552
            (signal
             (bvand (signal-value btor551) (signal-value btor498))
             (list)))
           (btor553
            (signal
             (bvor (signal-value btor499) (signal-value btor552))
             (list)))
           (btor554
            (signal
             (bvand (signal-value btor423) (signal-value btor551))
             (list)))
           (btor555
            (signal
             (bvor (signal-value btor553) (signal-value btor554))
             (list)))
           (btor556 (signal (bvnot (signal-value btor551)) (list)))
           (btor557
            (signal
             (bvand (signal-value btor556) (signal-value btor498))
             (list)))
           (btor558
            (signal
             (bvor (signal-value btor499) (signal-value btor557))
             (list)))
           (btor559
            (signal
             (bvand (signal-value btor423) (signal-value btor556))
             (list)))
           (btor560
            (signal
             (bvor (signal-value btor558) (signal-value btor559))
             (list)))
           (btor561 (bv->signal (bv 0 (bitvector 4))))
           (btor562
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state562")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state562"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state562")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state562")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 4))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor564
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state564")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state564"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state564")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state564")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 4))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor566
            (if (bitvector->bool (signal-value btor173)) btor564 btor562))
           (btor567
            (signal (bvxor (signal-value btor8) (signal-value btor49)) (list)))
           (btor568
            (signal
             (apply bvor (bitvector->bits (signal-value btor9)))
             (signal-state btor9)))
           (btor569 (signal (bvnot (signal-value btor568)) (list)))
           (btor570
            (if (bitvector->bool (signal-value btor569)) btor567 btor566))
           (btor571
            (signal
             (extract 0 0 (signal-value btor570))
             (signal-state btor570)))
           (btor572
            (if (bitvector->bool (signal-value btor571)) btor560 btor555))
           (btor573
            (signal
             (extract 2 2 (signal-value btor570))
             (signal-state btor570)))
           (btor574
            (if (bitvector->bool (signal-value btor573)) btor387 btor572))
           (btor575
            (signal
             (extract 35 35 (signal-value btor574))
             (signal-state btor574)))
           (btor576 (bv->signal (bv 13 (bitvector 4))))
           (btor577
            (bv->signal
             (zero-extend (signal-value btor576) (bitvector 5))
             btor576))
           (btor578
            (signal
             (bool->bitvector
              (bveq (signal-value btor78) (signal-value btor577)))
             (list)))
           (btor579
            (if (bitvector->bool (signal-value btor578)) btor163 btor575))
           (btor580
            (signal
             (extract 47 36 (signal-value btor574))
             (signal-state btor574)))
           (btor581
            (signal
             (concat (signal-value btor580) (signal-value btor579))
             (list)))
           (btor582
            (signal
             (bvxor (signal-value btor551) (signal-value btor423))
             (list)))
           (btor583
            (signal
             (bvxor (signal-value btor582) (signal-value btor498))
             (list)))
           (btor584
            (signal
             (bvxor (signal-value btor556) (signal-value btor423))
             (list)))
           (btor585
            (signal
             (bvxor (signal-value btor584) (signal-value btor498))
             (list)))
           (btor586
            (if (bitvector->bool (signal-value btor571)) btor585 btor583))
           (btor587
            (signal
             (extract 3 3 (signal-value btor570))
             (signal-state btor570)))
           (btor588
            (if (bitvector->bool (signal-value btor587)) btor572 btor586))
           (btor589
            (signal
             (extract 47 36 (signal-value btor588))
             (signal-state btor588)))
           (btor590
            (bv->signal
             (zero-extend (signal-value btor589) (bitvector 13))
             btor589))
           (btor591
            (signal
             (bvadd (signal-value btor581) (signal-value btor590))
             (list)))
           (btor592
            (signal
             (extract 23 23 (signal-value btor574))
             (signal-state btor574)))
           (btor593 (bv->signal (bv 12 (bitvector 4))))
           (btor594
            (bv->signal
             (zero-extend (signal-value btor593) (bitvector 5))
             btor593))
           (btor595
            (signal
             (bool->bitvector
              (bveq (signal-value btor78) (signal-value btor594)))
             (list)))
           (btor596
            (signal
             (bvor (signal-value btor595) (signal-value btor578))
             (list)))
           (btor597
            (if (bitvector->bool (signal-value btor596)) btor163 btor592))
           (btor598
            (signal
             (extract 34 24 (signal-value btor574))
             (signal-state btor574)))
           (btor599
            (signal
             (concat (signal-value btor598) (signal-value btor597))
             (list)))
           (btor600
            (bv->signal
             (zero-extend (signal-value btor599) (bitvector 13))
             btor599))
           (btor601
            (signal
             (extract 35 24 (signal-value btor588))
             (signal-state btor588)))
           (btor602
            (bv->signal
             (zero-extend (signal-value btor601) (bitvector 13))
             btor601))
           (btor603
            (signal
             (bvadd (signal-value btor600) (signal-value btor602))
             (list)))
           (btor604
            (signal
             (extract 11 11 (signal-value btor574))
             (signal-state btor574)))
           (btor605
            (if (bitvector->bool (signal-value btor578)) btor163 btor604))
           (btor606
            (signal
             (extract 22 12 (signal-value btor574))
             (signal-state btor574)))
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
             (extract 23 12 (signal-value btor588))
             (signal-state btor588)))
           (btor610
            (bv->signal
             (zero-extend (signal-value btor609) (bitvector 13))
             btor609))
           (btor611
            (signal
             (bvadd (signal-value btor608) (signal-value btor610))
             (list)))
           (btor612
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state612")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state612"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state612")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state612")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor614
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state614")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state614"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state614")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state614")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor616
            (if (bitvector->bool (signal-value btor173)) btor614 btor612))
           (btor617
            (signal
             (bvxor (signal-value btor24) (signal-value btor50))
             (list)))
           (btor618
            (signal
             (apply bvor (bitvector->bits (signal-value btor25)))
             (signal-state btor25)))
           (btor619 (signal (bvnot (signal-value btor618)) (list)))
           (btor620
            (if (bitvector->bool (signal-value btor619)) btor617 btor616))
           (btor621
            (signal
             (extract 47 47 (signal-value btor61))
             (signal-state btor61)))
           (btor622 (signal (bvnot (signal-value btor621)) (list)))
           (btor623
            (bv->signal
             (zero-extend (signal-value btor84) (bitvector 3))
             btor84))
           (btor624
            (signal
             (bool->bitvector
              (bveq (signal-value btor369) (signal-value btor623)))
             (list)))
           (btor625
            (if (bitvector->bool (signal-value btor624)) btor622 btor620))
           (btor626
            (if (bitvector->bool (signal-value btor371)) btor23 btor625))
           (btor627
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state627")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state627"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state627")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state627")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor629
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state629")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state629"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state629")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state629")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor631
            (if (bitvector->bool (signal-value btor173)) btor629 btor627))
           (btor632
            (signal
             (extract 24 24 (signal-value btor226))
             (signal-state btor226)))
           (btor633
            (signal
             (extract 17 17 (signal-value btor279))
             (signal-state btor279)))
           (btor634
            (signal
             ((lambda (a b) (bvnot (bvxor a b)))
              (signal-value btor632)
              (signal-value btor633))
             (list)))
           (btor635
            (if (bitvector->bool (signal-value btor411)) btor634 btor631))
           (btor636 (bv->signal (bv 6 (bitvector 3))))
           (btor637
            (signal
             (bool->bitvector
              (bveq (signal-value btor369) (signal-value btor636)))
             (list)))
           (btor638
            (if (bitvector->bool (signal-value btor637)) btor635 btor621))
           (btor639
            (signal
             (bool->bitvector
              (bveq (signal-value btor369) (signal-value btor345)))
             (list)))
           (btor640
            (signal
             (bool->bitvector
              (bveq (signal-value btor369) (signal-value btor406)))
             (list)))
           (btor641
            (signal
             (bool->bitvector
              (bveq (signal-value btor369) (signal-value btor483)))
             (list)))
           (btor642
            (signal
             (concat (signal-value btor640) (signal-value btor639))
             (list)))
           (btor643
            (signal
             (concat (signal-value btor641) (signal-value btor642))
             (list)))
           (btor644
            (signal
             (apply bvor (bitvector->bits (signal-value btor643)))
             (signal-state btor643)))
           (btor645
            (if (bitvector->bool (signal-value btor644)) btor163 btor638))
           (btor646
            (bv->signal
             (zero-extend (signal-value btor421) (bitvector 3))
             btor421))
           (btor647
            (signal
             (bool->bitvector
              (bveq (signal-value btor369) (signal-value btor646)))
             (list)))
           (btor648
            (signal
             (concat (signal-value btor637) (signal-value btor639))
             (list)))
           (btor649
            (signal
             (concat (signal-value btor640) (signal-value btor648))
             (list)))
           (btor650
            (signal
             (concat (signal-value btor641) (signal-value btor649))
             (list)))
           (btor651
            (signal
             (concat (signal-value btor647) (signal-value btor650))
             (list)))
           (btor652
            (signal
             (apply bvor (bitvector->bits (signal-value btor651)))
             (signal-state btor651)))
           (btor653
            (if (bitvector->bool (signal-value btor652)) btor645 btor626))
           (btor654
            (signal
             (bvor (signal-value btor587) (signal-value btor573))
             (list)))
           (btor655
            (if (bitvector->bool (signal-value btor654)) btor163 btor653))
           (btor656
            (signal
             (extract 10 0 (signal-value btor574))
             (signal-state btor574)))
           (btor657
            (signal
             (concat (signal-value btor656) (signal-value btor655))
             (list)))
           (btor658
            (bv->signal
             (zero-extend (signal-value btor657) (bitvector 13))
             btor657))
           (btor659
            (signal
             (extract 11 0 (signal-value btor588))
             (signal-state btor588)))
           (btor660
            (bv->signal
             (zero-extend (signal-value btor659) (bitvector 13))
             btor659))
           (btor661
            (signal
             (bvadd (signal-value btor658) (signal-value btor660))
             (list)))
           (btor662
            (signal
             (extract 12 12 (signal-value btor661))
             (signal-state btor661)))
           (btor663
            (if (bitvector->bool (signal-value btor578)) btor163 btor662))
           (btor664
            (bv->signal
             (zero-extend (signal-value btor663) (bitvector 13))
             btor663))
           (btor665
            (signal
             (bvadd (signal-value btor611) (signal-value btor664))
             (list)))
           (btor666
            (signal
             (extract 12 12 (signal-value btor665))
             (signal-state btor665)))
           (btor667
            (if (bitvector->bool (signal-value btor596)) btor163 btor666))
           (btor668
            (bv->signal
             (zero-extend (signal-value btor667) (bitvector 13))
             btor667))
           (btor669
            (signal
             (bvadd (signal-value btor603) (signal-value btor668))
             (list)))
           (btor670
            (signal
             (extract 12 12 (signal-value btor669))
             (signal-state btor669)))
           (btor671
            (if (bitvector->bool (signal-value btor578)) btor163 btor670))
           (btor672
            (bv->signal
             (zero-extend (signal-value btor671) (bitvector 13))
             btor671))
           (btor673
            (signal
             (bvadd (signal-value btor591) (signal-value btor672))
             (list)))
           (btor674
            (signal
             (extract 12 12 (signal-value btor673))
             (signal-state btor673)))
           (btor675
            (if (bitvector->bool (signal-value btor414)) btor674 btor177))
           (btor677
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state677")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state677"))))))
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
                          (bv 0 4))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor679
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state679")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state679"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state679")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state679")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 4))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor681
            (if (bitvector->bool (signal-value btor173)) btor679 btor677))
           (btor682
            (if (bitvector->bool (signal-value btor176)) btor681 btor561))
           (btor683
            (signal
             (bvadd (signal-value btor604) (signal-value btor662))
             (list)))
           (btor684 (signal (bvnot (signal-value btor683)) (list)))
           (btor685
            (signal
             (extract 1 1 (signal-value btor570))
             (signal-state btor570)))
           (btor686
            (signal
             (bvand (signal-value btor571) (signal-value btor685))
             (list)))
           (btor687
            (if (bitvector->bool (signal-value btor686)) btor684 btor683))
           (btor688
            (if (bitvector->bool (signal-value btor578)) btor687 btor163))
           (btor689
            (signal
             (extract 3 0 (signal-value btor397))
             (signal-state btor397)))
           (btor690
            (bv->signal
             (zero-extend (signal-value btor406) (bitvector 4))
             btor406))
           (btor691
            (signal
             (bool->bitvector
              (bveq (signal-value btor689) (signal-value btor690)))
             (list)))
           (btor692
            (signal
             (extract 3 2 (signal-value btor570))
             (signal-state btor570)))
           (btor693
            (signal
             (apply bvor (bitvector->bits (signal-value btor692)))
             (signal-state btor692)))
           (btor694
            (signal
             (bvor (signal-value btor691) (signal-value btor693))
             (list)))
           (btor695
            (if (bitvector->bool (signal-value btor694)) btor163 btor688))
           (btor696
            (signal
             (bvadd (signal-value btor592) (signal-value btor666))
             (list)))
           (btor697 (signal (bvnot (signal-value btor696)) (list)))
           (btor698
            (if (bitvector->bool (signal-value btor686)) btor697 btor696))
           (btor699
            (if (bitvector->bool (signal-value btor596)) btor698 btor163))
           (btor700
            (if (bitvector->bool (signal-value btor694)) btor163 btor699))
           (btor701
            (signal
             (bvadd (signal-value btor575) (signal-value btor670))
             (list)))
           (btor702 (signal (bvnot (signal-value btor701)) (list)))
           (btor703
            (if (bitvector->bool (signal-value btor686)) btor702 btor701))
           (btor704
            (if (bitvector->bool (signal-value btor578)) btor703 btor163))
           (btor705
            (if (bitvector->bool (signal-value btor694)) btor163 btor704))
           (btor706 (signal (bvnot (signal-value btor674)) (list)))
           (btor707
            (if (bitvector->bool (signal-value btor686)) btor706 btor674))
           (btor708
            (if (bitvector->bool (signal-value btor694)) btor163 btor707))
           (btor709
            (signal
             (concat (signal-value btor700) (signal-value btor695))
             (list)))
           (btor710
            (signal
             (concat (signal-value btor705) (signal-value btor709))
             (list)))
           (btor711
            (signal
             (concat (signal-value btor708) (signal-value btor710))
             (list)))
           (btor712
            (if (bitvector->bool (signal-value btor414)) btor711 btor682))
           (btor713
            (signal
             (extract 0 0 (signal-value btor712))
             (signal-state btor712)))
           (btor714
            (if (bitvector->bool (signal-value btor578)) btor713 btor163))
           (btor715
            (signal
             (extract 1 1 (signal-value btor712))
             (signal-state btor712)))
           (btor716
            (if (bitvector->bool (signal-value btor596)) btor715 btor163))
           (btor717
            (signal
             (extract 2 2 (signal-value btor712))
             (signal-state btor712)))
           (btor718
            (if (bitvector->bool (signal-value btor578)) btor717 btor163))
           (btor719
            (signal
             (concat (signal-value btor716) (signal-value btor714))
             (list)))
           (btor720
            (signal
             (concat (signal-value btor718) (signal-value btor719))
             (list)))
           (btor721
            (signal
             (extract 3 3 (signal-value btor712))
             (signal-state btor712)))
           (btor722
            (signal
             (concat (signal-value btor721) (signal-value btor720))
             (list)))
           (btor724
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state724")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state724"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state724")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state724")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
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
           (btor728
            (if (bitvector->bool (signal-value btor173)) btor726 btor724))
           (btor729
            (if (bitvector->bool (signal-value btor176)) btor728 btor163))
           (btor730
            (signal
             (extract 42 42 (signal-value btor372))
             (signal-state btor372)))
           (btor731
            (signal
             (bool->bitvector
              (bveq (signal-value btor482) (signal-value btor483)))
             (list)))
           (btor732
            (if (bitvector->bool (signal-value btor731)) btor57 btor730))
           (btor733
            (if (bitvector->bool (signal-value btor414)) btor732 btor729))
           (btor735
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state735")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state735"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state735")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state735")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor737
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state737")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state737"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state737")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state737")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor739
            (if (bitvector->bool (signal-value btor173)) btor737 btor735))
           (btor740
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state740")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state740"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state740")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state740")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor742
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state742")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state742"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state742")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state742")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor744
            (if (bitvector->bool (signal-value btor173)) btor742 btor740))
           (btor745 (signal (bvnot (signal-value btor744)) (list)))
           (btor746
            (signal
             (bvand (signal-value btor739) (signal-value btor745))
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
            (if (bitvector->bool (signal-value btor173)) btor749 btor747))
           (btor752 (signal (bvnot (signal-value btor751)) (list)))
           (btor753
            (signal
             (bvand (signal-value btor746) (signal-value btor752))
             (list)))
           (btor754 (bv->signal (bv 10 (bitvector 4))))
           (btor755
            (bv->signal
             (zero-extend (signal-value btor754) (bitvector 5))
             btor754))
           (btor756
            (signal
             (bool->bitvector
              (bveq (signal-value btor77) (signal-value btor755)))
             (list)))
           (btor757
            (signal
             (bvor (signal-value btor756) (signal-value btor176))
             (list)))
           (btor758
            (if (bitvector->bool (signal-value btor757)) btor753 btor163))
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
                          (bv 0 48))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor762
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state762")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state762"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state762")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state762")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 48))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor764
            (if (bitvector->bool (signal-value btor173)) btor762 btor760))
           (btor765
            (if (bitvector->bool (signal-value btor176)) btor764 btor387))
           (btor766
            (signal
             (extract 11 0 (signal-value btor661))
             (signal-state btor661)))
           (btor767
            (signal
             (extract 11 0 (signal-value btor665))
             (signal-state btor665)))
           (btor768
            (signal
             (concat (signal-value btor767) (signal-value btor766))
             (list)))
           (btor769
            (signal
             (extract 11 0 (signal-value btor669))
             (signal-state btor669)))
           (btor770
            (signal
             (concat (signal-value btor769) (signal-value btor768))
             (list)))
           (btor771
            (signal
             (extract 11 0 (signal-value btor673))
             (signal-state btor673)))
           (btor772
            (signal
             (concat (signal-value btor771) (signal-value btor770))
             (list)))
           (btor773 (signal (bvnot (signal-value btor772)) (list)))
           (btor774
            (if (bitvector->bool (signal-value btor685)) btor773 btor772))
           (btor775
            (if (bitvector->bool (signal-value btor414)) btor774 btor765))
           (btor777
            (if (bitvector->bool (signal-value btor176)) btor751 btor163))
           (btor779
            (if (bitvector->bool (signal-value btor176)) btor744 btor163))
           (btor782
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state782")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state782"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state782")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state782")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor784
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state784")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state784"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state784")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state784")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor786
            (if (bitvector->bool (signal-value btor173)) btor784 btor782))
           (btor787
            (signal
             (bvand (signal-value btor786) (signal-value btor745))
             (list)))
           (btor788
            (signal
             (bvand (signal-value btor787) (signal-value btor752))
             (list)))
           (btor789
            (if (bitvector->bool (signal-value btor757)) btor788 btor163))
           (btor791
            (bv->signal
             (zero-extend (signal-value btor663) (bitvector 1))
             btor663))
           (btor792
            (bv->signal
             (zero-extend (signal-value btor667) (bitvector 1))
             btor667))
           (btor793
            (bv->signal
             (zero-extend (signal-value btor671) (bitvector 1))
             btor671))
           (btor794
            (bv->signal
             (zero-extend (signal-value btor49) (bitvector 4))
             btor49))
           (btor795
            (bv->signal
             (zero-extend (signal-value btor50) (bitvector 1))
             btor50))
           (btor796
            (bv->signal
             (zero-extend (signal-value btor51) (bitvector 1))
             btor51))
           (btor797
            (bv->signal
             (zero-extend (signal-value btor52) (bitvector 5))
             btor52))
           (btor798
            (bv->signal
             (zero-extend (signal-value btor54) (bitvector 7))
             btor54))
           (btor799
            (bv->signal
             (zero-extend (signal-value btor2) (bitvector 30))
             btor2))
           (btor800
            (bv->signal
             (zero-extend (signal-value btor2) (bitvector 30))
             btor2))
           (btor801
            (bv->signal
             (zero-extend (signal-value btor106) (bitvector 30))
             btor106))
           (btor802
            (bv->signal
             (zero-extend (signal-value btor196) (bitvector 25))
             btor196))
           (btor803
            (bv->signal
             (zero-extend (signal-value btor5) (bitvector 30))
             btor5))
           (btor804
            (bv->signal
             (zero-extend (signal-value btor5) (bitvector 30))
             btor5))
           (btor805
            (bv->signal
             (zero-extend (signal-value btor219) (bitvector 25))
             btor219))
           (btor806
            (bv->signal
             (zero-extend (signal-value btor226) (bitvector 25))
             btor226))
           (btor807 (bitvector 49))
           (btor808 (bv->signal (bv 0 (bitvector 49))))
           (btor809
            (bv->signal
             (zero-extend (signal-value btor808) (bitvector 49))
             btor808))
           (btor810
            (bv->signal
             (zero-extend (signal-value btor194) (bitvector 25))
             btor194))
           (btor811
            (bv->signal
             (zero-extend (signal-value btor194) (bitvector 25))
             btor194))
           (btor812
            (bv->signal
             (zero-extend (signal-value btor774) (bitvector 48))
             btor774))
           (btor813 (bv->signal (bv 0 (bitvector 13))))
           (btor814
            (bv->signal
             (zero-extend (signal-value btor813) (bitvector 13))
             btor813))
           (btor815
            (bv->signal
             (zero-extend (signal-value btor813) (bitvector 13))
             btor813))
           (btor816
            (bv->signal
             (zero-extend (signal-value btor813) (bitvector 13))
             btor813))
           (btor817
            (bv->signal
             (zero-extend (signal-value btor813) (bitvector 13))
             btor813))
           (btor818
            (bv->signal
             (zero-extend (signal-value btor8) (bitvector 4))
             btor8))
           (btor819
            (bv->signal
             (zero-extend (signal-value btor567) (bitvector 4))
             btor567))
           (btor820
            (bv->signal
             (zero-extend (signal-value btor15) (bitvector 18))
             btor15))
           (btor821
            (bv->signal
             (zero-extend (signal-value btor15) (bitvector 18))
             btor15))
           (btor822
            (bv->signal
             (zero-extend (signal-value btor279) (bitvector 18))
             btor279))
           (btor823
            (bv->signal
             (zero-extend (signal-value btor143) (bitvector 18))
             btor143))
           (btor824
            (bv->signal
             (zero-extend (signal-value btor17) (bitvector 18))
             btor17))
           (btor825
            (bv->signal
             (zero-extend (signal-value btor17) (bitvector 18))
             btor17))
           (btor826
            (bv->signal
             (zero-extend (signal-value btor21) (bitvector 48))
             btor21))
           (btor827
            (bv->signal
             (zero-extend (signal-value btor21) (bitvector 48))
             btor21))
           (btor828
            (bv->signal
             (zero-extend (signal-value btor23) (bitvector 1))
             btor23))
           (btor829
            (bv->signal
             (zero-extend (signal-value btor23) (bitvector 1))
             btor23))
           (btor830
            (bv->signal
             (zero-extend (signal-value btor674) (bitvector 1))
             btor674))
           (btor831
            (bv->signal
             (zero-extend (signal-value btor675) (bitvector 1))
             btor675))
           (btor832
            (bv->signal
             (zero-extend (signal-value btor174) (bitvector 1))
             btor174))
           (btor833
            (bv->signal
             (zero-extend (signal-value btor24) (bitvector 1))
             btor24))
           (btor834
            (bv->signal
             (zero-extend (signal-value btor617) (bitvector 1))
             btor617))
           (btor835
            (bv->signal
             (zero-extend (signal-value btor27) (bitvector 3))
             btor27))
           (btor836
            (bv->signal
             (zero-extend (signal-value btor27) (bitvector 3))
             btor27))
           (btor837
            (bv->signal
             (zero-extend (signal-value btor711) (bitvector 4))
             btor711))
           (btor838
            (signal
             (concat (signal-value btor698) (signal-value btor687))
             (list)))
           (btor839
            (signal
             (concat (signal-value btor703) (signal-value btor838))
             (list)))
           (btor840
            (signal
             (concat (signal-value btor707) (signal-value btor839))
             (list)))
           (btor841
            (bv->signal
             (zero-extend (signal-value btor840) (bitvector 4))
             btor840))
           (btor842
            (bv->signal
             (zero-extend (signal-value btor712) (bitvector 4))
             btor712))
           (btor843
            (bv->signal
             (zero-extend (signal-value btor681) (bitvector 4))
             btor681))
           (btor844
            (bv->signal
             (zero-extend (signal-value btor722) (bitvector 4))
             btor722))
           (btor845
            (bv->signal
             (zero-extend (signal-value btor163) (bitvector 1))
             btor163))
           (btor846
            (bv->signal
             (zero-extend (signal-value btor29) (bitvector 1))
             btor29))
           (btor847
            (bv->signal
             (zero-extend (signal-value btor29) (bitvector 1))
             btor29))
           (btor848
            (bv->signal
             (zero-extend (signal-value btor30) (bitvector 1))
             btor30))
           (btor849
            (bv->signal
             (zero-extend (signal-value btor30) (bitvector 1))
             btor30))
           (btor850
            (bv->signal
             (zero-extend (signal-value btor31) (bitvector 1))
             btor31))
           (btor851
            (bv->signal
             (zero-extend (signal-value btor31) (bitvector 1))
             btor31))
           (btor852
            (bv->signal
             (zero-extend (signal-value btor32) (bitvector 1))
             btor32))
           (btor853
            (bv->signal
             (zero-extend (signal-value btor32) (bitvector 1))
             btor32))
           (btor854
            (bv->signal
             (zero-extend (signal-value btor33) (bitvector 1))
             btor33))
           (btor855
            (bv->signal
             (zero-extend (signal-value btor33) (bitvector 1))
             btor33))
           (btor856
            (bv->signal
             (zero-extend (signal-value btor34) (bitvector 1))
             btor34))
           (btor857
            (bv->signal
             (zero-extend (signal-value btor34) (bitvector 1))
             btor34))
           (btor858
            (bv->signal
             (zero-extend (signal-value btor35) (bitvector 1))
             btor35))
           (btor859
            (bv->signal
             (zero-extend (signal-value btor35) (bitvector 1))
             btor35))
           (btor860
            (bv->signal
             (zero-extend (signal-value btor36) (bitvector 1))
             btor36))
           (btor861
            (bv->signal
             (zero-extend (signal-value btor36) (bitvector 1))
             btor36))
           (btor862
            (bv->signal
             (zero-extend (signal-value btor37) (bitvector 1))
             btor37))
           (btor863
            (bv->signal
             (zero-extend (signal-value btor37) (bitvector 1))
             btor37))
           (btor864
            (bv->signal
             (zero-extend (signal-value btor38) (bitvector 1))
             btor38))
           (btor865
            (bv->signal
             (zero-extend (signal-value btor38) (bitvector 1))
             btor38))
           (btor866
            (bv->signal
             (zero-extend (signal-value btor39) (bitvector 1))
             btor39))
           (btor867
            (bv->signal
             (zero-extend (signal-value btor39) (bitvector 1))
             btor39))
           (btor868
            (bv->signal
             (zero-extend (signal-value btor40) (bitvector 1))
             btor40))
           (btor869
            (bv->signal
             (zero-extend (signal-value btor40) (bitvector 1))
             btor40))
           (btor870
            (bv->signal
             (zero-extend (signal-value btor41) (bitvector 1))
             btor41))
           (btor871
            (bv->signal
             (zero-extend (signal-value btor41) (bitvector 1))
             btor41))
           (btor872
            (bv->signal
             (zero-extend (signal-value btor163) (bitvector 1))
             btor163))
           (btor873
            (bv->signal
             (zero-extend (signal-value btor42) (bitvector 1))
             btor42))
           (btor874
            (bv->signal
             (zero-extend (signal-value btor168) (bitvector 1))
             btor168))
           (btor875
            (bv->signal
             (zero-extend (signal-value btor572) (bitvector 48))
             btor572))
           (btor876
            (bv->signal
             (zero-extend (signal-value btor605) (bitvector 1))
             btor605))
           (btor877
            (bv->signal
             (zero-extend (signal-value btor597) (bitvector 1))
             btor597))
           (btor878
            (bv->signal
             (zero-extend (signal-value btor579) (bitvector 1))
             btor579))
           (btor879
            (bv->signal
             (zero-extend (signal-value btor574) (bitvector 48))
             btor574))
           (btor880
            (bv->signal
             (zero-extend (signal-value btor683) (bitvector 1))
             btor683))
           (btor881
            (bv->signal
             (zero-extend (signal-value btor696) (bitvector 1))
             btor696))
           (btor882
            (bv->signal
             (zero-extend (signal-value btor701) (bitvector 1))
             btor701))
           (btor883
            (bv->signal
             (zero-extend (signal-value btor674) (bitvector 1))
             btor674))
           (btor884
            (bv->signal
             (zero-extend (signal-value btor45) (bitvector 25))
             btor45))
           (btor885
            (bv->signal
             (zero-extend (signal-value btor45) (bitvector 25))
             btor45))
           (btor886
            (bv->signal
             (zero-extend (signal-value btor194) (bitvector 25))
             btor194))
           (btor887
            (bv->signal
             (zero-extend (signal-value btor47) (bitvector 5))
             btor47))
           (btor888
            (bv->signal
             (zero-extend (signal-value btor182) (bitvector 5))
             btor182))
           (btor889
            (bv->signal
             (zero-extend (signal-value btor163) (bitvector 1))
             btor163))
           (btor890
            (bv->signal
             (zero-extend (signal-value btor349) (bitvector 43))
             btor349))
           (btor891
            (bv->signal
             (zero-extend (signal-value btor57) (bitvector 1))
             btor57))
           (btor892
            (bv->signal
             (zero-extend (signal-value btor57) (bitvector 1))
             btor57))
           (btor893
            (bv->signal
             (zero-extend (signal-value btor733) (bitvector 1))
             btor733))
           (btor894
            (bv->signal
             (zero-extend (signal-value btor732) (bitvector 1))
             btor732))
           (btor895
            (bv->signal
             (zero-extend (signal-value btor163) (bitvector 1))
             btor163))
           (btor896
            (bv->signal
             (zero-extend (signal-value btor58) (bitvector 7))
             btor58))
           (btor897
            (bv->signal
             (zero-extend (signal-value btor394) (bitvector 7))
             btor394))
           (btor898
            (bv->signal
             (zero-extend (signal-value btor163) (bitvector 1))
             btor163))
           (btor899
            (bv->signal
             (zero-extend (signal-value btor758) (bitvector 1))
             btor758))
           (btor900
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 48))
             btor61))
           (btor901
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 48))
             btor61))
           (btor902
            (bv->signal
             (zero-extend (signal-value btor163) (bitvector 1))
             btor163))
           (btor903
            (bv->signal
             (zero-extend (signal-value btor779) (bitvector 1))
             btor779))
           (btor904
            (bv->signal
             (zero-extend (signal-value btor744) (bitvector 1))
             btor744))
           (btor905
            (bv->signal
             (zero-extend (signal-value btor739) (bitvector 1))
             btor739))
           (btor906
            (bv->signal
             (zero-extend (signal-value btor163) (bitvector 1))
             btor163))
           (btor907
            (bv->signal
             (zero-extend (signal-value btor777) (bitvector 1))
             btor777))
           (btor908
            (bv->signal
             (zero-extend (signal-value btor751) (bitvector 1))
             btor751))
           (btor909
            (bv->signal
             (zero-extend (signal-value btor786) (bitvector 1))
             btor786))
           (btor910
            (bv->signal
             (zero-extend (signal-value btor163) (bitvector 1))
             btor163))
           (btor911
            (bv->signal
             (zero-extend (signal-value btor109) (bitvector 30))
             btor109))
           (btor912
            (bv->signal
             (zero-extend (signal-value btor120) (bitvector 30))
             btor120))
           (btor913
            (bv->signal
             (zero-extend (signal-value btor91) (bitvector 30))
             btor91))
           (btor914
            (bv->signal
             (zero-extend (signal-value btor124) (bitvector 30))
             btor124))
           (btor915
            (bv->signal
             (zero-extend (signal-value btor222) (bitvector 25))
             btor222))
           (btor916
            (bv->signal
             (zero-extend (signal-value btor201) (bitvector 25))
             btor201))
           (btor917
            (bv->signal
             (zero-extend (signal-value btor570) (bitvector 4))
             btor570))
           (btor918
            (bv->signal
             (zero-extend (signal-value btor566) (bitvector 4))
             btor566))
           (btor919
            (bv->signal
             (zero-extend (signal-value btor146) (bitvector 18))
             btor146))
           (btor920
            (bv->signal
             (zero-extend (signal-value btor157) (bitvector 18))
             btor157))
           (btor921
            (bv->signal
             (zero-extend (signal-value btor131) (bitvector 18))
             btor131))
           (btor922
            (bv->signal
             (zero-extend (signal-value btor161) (bitvector 18))
             btor161))
           (btor923
            (bv->signal
             (zero-extend (signal-value btor496) (bitvector 48))
             btor496))
           (btor924
            (bv->signal
             (zero-extend (signal-value btor493) (bitvector 48))
             btor493))
           (btor925
            (bv->signal
             (zero-extend (signal-value btor655) (bitvector 1))
             btor655))
           (btor926
            (bv->signal
             (zero-extend (signal-value btor620) (bitvector 1))
             btor620))
           (btor927
            (bv->signal
             (zero-extend (signal-value btor635) (bitvector 1))
             btor635))
           (btor928
            (bv->signal
             (zero-extend (signal-value btor653) (bitvector 1))
             btor653))
           (btor929
            (bv->signal
             (zero-extend (signal-value btor163) (bitvector 1))
             btor163))
           (btor930
            (bv->signal
             (zero-extend (signal-value btor616) (bitvector 1))
             btor616))
           (btor931
            (bv->signal
             (zero-extend (signal-value btor631) (bitvector 1))
             btor631))
           (btor932
            (bv->signal
             (zero-extend (signal-value btor369) (bitvector 3))
             btor369))
           (btor933
            (bv->signal
             (zero-extend (signal-value btor363) (bitvector 3))
             btor363))
           (btor934
            (bv->signal
             (zero-extend (signal-value btor212) (bitvector 25))
             btor212))
           (btor935
            (bv->signal
             (zero-extend (signal-value btor209) (bitvector 25))
             btor209))
           (btor936
            (bv->signal
             (zero-extend (signal-value btor191) (bitvector 5))
             btor191))
           (btor937
            (bv->signal
             (zero-extend (signal-value btor188) (bitvector 5))
             btor188))
           (btor938
            (bv->signal
             (zero-extend (signal-value btor372) (bitvector 43))
             btor372))
           (btor939
            (bv->signal
             (zero-extend (signal-value btor354) (bitvector 43))
             btor354))
           (btor940
            (bv->signal
             (zero-extend (signal-value btor728) (bitvector 1))
             btor728))
           (btor941
            (bv->signal
             (zero-extend (signal-value btor397) (bitvector 7))
             btor397))
           (btor942
            (bv->signal
             (zero-extend (signal-value btor393) (bitvector 7))
             btor393))
           (btor943
            (bv->signal
             (zero-extend (signal-value btor775) (bitvector 48))
             btor775))
           (btor944
            (bv->signal
             (zero-extend (signal-value btor764) (bitvector 48))
             btor764))
           (btor945
            (bv->signal
             (zero-extend (signal-value btor423) (bitvector 48))
             btor423))
           (btor946
            (bv->signal
             (zero-extend (signal-value btor498) (bitvector 48))
             btor498))
           (btor947
            (bv->signal
             (zero-extend (signal-value btor551) (bitvector 48))
             btor551))
           (btor948
            (bv->signal
             (zero-extend (signal-value btor63) (bitvector 1))
             btor63))
           (btor949
            (bv->signal
             (zero-extend (signal-value btor63) (bitvector 1))
             btor63))
           (btor950
            (bv->signal
             (zero-extend (signal-value btor64) (bitvector 1))
             btor64))
           (btor951
            (bv->signal
             (zero-extend (signal-value btor64) (bitvector 1))
             btor64))
           (btor952
            (bv->signal
             (zero-extend (signal-value btor65) (bitvector 1))
             btor65))
           (btor953
            (bv->signal
             (zero-extend (signal-value btor65) (bitvector 1))
             btor65))
           (btor954
            (bv->signal
             (zero-extend (signal-value btor66) (bitvector 1))
             btor66))
           (btor955
            (bv->signal
             (zero-extend (signal-value btor66) (bitvector 1))
             btor66))
           (btor956
            (bv->signal
             (zero-extend (signal-value btor67) (bitvector 1))
             btor67))
           (btor957
            (bv->signal
             (zero-extend (signal-value btor67) (bitvector 1))
             btor67))
           (btor958
            (bv->signal
             (zero-extend (signal-value btor68) (bitvector 1))
             btor68))
           (btor959
            (bv->signal
             (zero-extend (signal-value btor68) (bitvector 1))
             btor68))
           (btor960
            (bv->signal
             (zero-extend (signal-value btor69) (bitvector 1))
             btor69))
           (btor961
            (bv->signal
             (zero-extend (signal-value btor69) (bitvector 1))
             btor69))
           (btor962
            (bv->signal
             (zero-extend (signal-value btor70) (bitvector 1))
             btor70))
           (btor963
            (bv->signal
             (zero-extend (signal-value btor70) (bitvector 1))
             btor70))
           (btor964
            (bv->signal
             (zero-extend (signal-value btor71) (bitvector 1))
             btor71))
           (btor965
            (bv->signal
             (zero-extend (signal-value btor71) (bitvector 1))
             btor71))
           (btor966
            (bv->signal
             (zero-extend (signal-value btor72) (bitvector 1))
             btor72))
           (btor967
            (bv->signal
             (zero-extend (signal-value btor72) (bitvector 1))
             btor72))
           (btor968
            (bv->signal
             (zero-extend (signal-value btor586) (bitvector 48))
             btor586))
           (btor969
            (bv->signal
             (zero-extend (signal-value btor661) (bitvector 13))
             btor661))
           (btor970
            (bv->signal
             (zero-extend (signal-value btor665) (bitvector 13))
             btor665))
           (btor971
            (bv->signal
             (zero-extend (signal-value btor669) (bitvector 13))
             btor669))
           (btor972
            (bv->signal
             (zero-extend (signal-value btor673) (bitvector 13))
             btor673))
           (btor973
            (bv->signal
             (zero-extend (signal-value btor588) (bitvector 48))
             btor588))
           (btor974 (bv->signal (bv 17 (bitvector 5))))
           (btor975
            (signal
             (bool->bitvector
              (bveq (signal-value btor12) (signal-value btor974)))
             (list)))
           (btor976
            (signal
             (bvand (signal-value btor975) (signal-value btor744))
             (list)))
           (btor977 (bv->signal (bv 18 (bitvector 5))))
           (btor978
            (signal
             (bool->bitvector
              (bveq (signal-value btor12) (signal-value btor977)))
             (list)))
           (btor979
            (signal
             (bvand (signal-value btor739) (signal-value btor745))
             (list)))
           (btor980
            (signal
             (bvand (signal-value btor978) (signal-value btor979))
             (list)))
           (btor981
            (signal
             (bvor (signal-value btor976) (signal-value btor980))
             (list)))
           (btor982
            (bv->signal
             (zero-extend (signal-value btor981) (bitvector 1))
             btor981))
           (btor983
            (bv->signal
             (zero-extend (signal-value btor789) (bitvector 1))
             btor789))
           (btor984
            (bv->signal
             (zero-extend (signal-value btor485) (bitvector 48))
             btor485))
           (btor986
            (if (bitvector->bool (signal-value btor94)) btor106 btor120))
           (btor987
            (if (bitvector->bool (signal-value btor30)) btor986 btor91))
           (btor988
            (if (bitvector->bool (signal-value btor63)) btor79 btor987))
           (btor992
            (if (bitvector->bool (signal-value btor29)) btor106 btor120))
           (btor993
            (if (bitvector->bool (signal-value btor63)) btor79 btor992))
           (btor996
            (if (bitvector->bool (signal-value btor133)) btor143 btor157))
           (btor997
            (if (bitvector->bool (signal-value btor34)) btor996 btor131))
           (btor998
            (if (bitvector->bool (signal-value btor66)) btor126 btor997))
           (btor1001
            (if (bitvector->bool (signal-value btor33)) btor143 btor157))
           (btor1002
            (if (bitvector->bool (signal-value btor66)) btor126 btor1001))
           (btor1005
            (if (bitvector->bool (signal-value btor41)) btor674 btor174))
           (btor1006
            (signal
             (bvor (signal-value btor72) (signal-value btor981))
             (list)))
           (btor1007
            (if (bitvector->bool (signal-value btor1006)) btor163 btor1005))
           (btor1011
            (if (bitvector->bool (signal-value btor39)) btor182 btor188))
           (btor1012
            (if (bitvector->bool (signal-value btor70)) btor183 btor1011))
           (btor1015
            (if (bitvector->bool (signal-value btor31)) btor219 btor201))
           (btor1016
            (if (bitvector->bool (signal-value btor69)) btor194 btor1015))
           (btor1019
            (if (bitvector->bool (signal-value btor38)) btor45 btor209))
           (btor1020
            (if (bitvector->bool (signal-value btor69)) btor194 btor1019))
           (btor1023
            (if (bitvector->bool (signal-value btor40)) btor349 btor354))
           (btor1024
            (if (bitvector->bool (signal-value btor71)) btor337 btor1023))
           (btor1027
            (if (bitvector->bool (signal-value btor37)) btor27 btor363))
           (btor1028
            (if (bitvector->bool (signal-value btor68)) btor358 btor1027))
           (btor1031
            (if (bitvector->bool (signal-value btor37)) btor394 btor393))
           (btor1032
            (if (bitvector->bool (signal-value btor68)) btor388 btor1031))
           (btor1035
            (if (bitvector->bool (signal-value btor35)) btor21 btor493))
           (btor1036
            (if (bitvector->bool (signal-value btor67)) btor387 btor1035))
           (btor1039
            (if (bitvector->bool (signal-value btor32)) btor567 btor566))
           (btor1040
            (if (bitvector->bool (signal-value btor65)) btor561 btor1039))
           (btor1043
            (if (bitvector->bool (signal-value btor36)) btor617 btor616))
           (btor1044
            (if (bitvector->bool (signal-value btor64)) btor163 btor1043))
           (btor1047
            (if (bitvector->bool (signal-value btor40)) btor634 btor631))
           (btor1048
            (if (bitvector->bool (signal-value btor64)) btor163 btor1047))
           (btor1051
            (if (bitvector->bool (signal-value btor41)) btor711 btor681))
           (btor1052
            (if (bitvector->bool (signal-value btor1006)) btor561 btor1051))
           (btor1055
            (if (bitvector->bool (signal-value btor41)) btor732 btor728))
           (btor1056
            (if (bitvector->bool (signal-value btor1006)) btor163 btor1055))
           (btor1059
            (if (bitvector->bool (signal-value btor41)) btor744 btor739))
           (btor1060
            (if (bitvector->bool (signal-value btor1006)) btor163 btor1059))
           (btor1063
            (if (bitvector->bool (signal-value btor41)) btor163 btor744))
           (btor1064
            (if (bitvector->bool (signal-value btor1006)) btor163 btor1063))
           (btor1067
            (if (bitvector->bool (signal-value btor41)) btor163 btor751))
           (btor1068
            (if (bitvector->bool (signal-value btor1006)) btor163 btor1067))
           (btor1071
            (if (bitvector->bool (signal-value btor41)) btor774 btor764))
           (btor1072
            (if (bitvector->bool (signal-value btor1006)) btor387 btor1071))
           (btor1075
            (if (bitvector->bool (signal-value btor41)) btor751 btor786))
           (btor1076
            (if (bitvector->bool (signal-value btor1006)) btor163 btor1075))
           (output-state
            (remove-duplicates
             (append
              (append
               (list
                (cons
                 (string->symbol (string-append name "state784"))
                 (cons
                  (signal-value btor1076)
                  (if (assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state784")))
                    (add1
                     (cdr
                      (assoc-ref
                       merged-input-state-hash
                       (string->symbol (string-append name "state784")))))
                    0))))
               (append
                (list
                 (cons
                  (string->symbol (string-append name "state782"))
                  (cons
                   (signal-value btor786)
                   (if (assoc-has-key?
                        merged-input-state-hash
                        (string->symbol (string-append name "state782")))
                     (add1
                      (cdr
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state782")))))
                     0))))
                (append
                 (list
                  (cons
                   (string->symbol (string-append name "state762"))
                   (cons
                    (signal-value btor1072)
                    (if (assoc-has-key?
                         merged-input-state-hash
                         (string->symbol (string-append name "state762")))
                      (add1
                       (cdr
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state762")))))
                      0))))
                 (append
                  (list
                   (cons
                    (string->symbol (string-append name "state760"))
                    (cons
                     (signal-value btor764)
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
                     (string->symbol (string-append name "state749"))
                     (cons
                      (signal-value btor1068)
                      (if (assoc-has-key?
                           merged-input-state-hash
                           (string->symbol (string-append name "state749")))
                        (add1
                         (cdr
                          (assoc-ref
                           merged-input-state-hash
                           (string->symbol (string-append name "state749")))))
                        0))))
                   (append
                    (list
                     (cons
                      (string->symbol (string-append name "state747"))
                      (cons
                       (signal-value btor751)
                       (if (assoc-has-key?
                            merged-input-state-hash
                            (string->symbol (string-append name "state747")))
                         (add1
                          (cdr
                           (assoc-ref
                            merged-input-state-hash
                            (string->symbol (string-append name "state747")))))
                         0))))
                    (append
                     (list
                      (cons
                       (string->symbol (string-append name "state742"))
                       (cons
                        (signal-value btor1064)
                        (if (assoc-has-key?
                             merged-input-state-hash
                             (string->symbol (string-append name "state742")))
                          (add1
                           (cdr
                            (assoc-ref
                             merged-input-state-hash
                             (string->symbol
                              (string-append name "state742")))))
                          0))))
                     (append
                      (list
                       (cons
                        (string->symbol (string-append name "state740"))
                        (cons
                         (signal-value btor744)
                         (if (assoc-has-key?
                              merged-input-state-hash
                              (string->symbol (string-append name "state740")))
                           (add1
                            (cdr
                             (assoc-ref
                              merged-input-state-hash
                              (string->symbol
                               (string-append name "state740")))))
                           0))))
                      (append
                       (list
                        (cons
                         (string->symbol (string-append name "state737"))
                         (cons
                          (signal-value btor1060)
                          (if (assoc-has-key?
                               merged-input-state-hash
                               (string->symbol
                                (string-append name "state737")))
                            (add1
                             (cdr
                              (assoc-ref
                               merged-input-state-hash
                               (string->symbol
                                (string-append name "state737")))))
                            0))))
                       (append
                        (list
                         (cons
                          (string->symbol (string-append name "state735"))
                          (cons
                           (signal-value btor739)
                           (if (assoc-has-key?
                                merged-input-state-hash
                                (string->symbol
                                 (string-append name "state735")))
                             (add1
                              (cdr
                               (assoc-ref
                                merged-input-state-hash
                                (string->symbol
                                 (string-append name "state735")))))
                             0))))
                        (append
                         (list
                          (cons
                           (string->symbol (string-append name "state726"))
                           (cons
                            (signal-value btor1056)
                            (if (assoc-has-key?
                                 merged-input-state-hash
                                 (string->symbol
                                  (string-append name "state726")))
                              (add1
                               (cdr
                                (assoc-ref
                                 merged-input-state-hash
                                 (string->symbol
                                  (string-append name "state726")))))
                              0))))
                         (append
                          (list
                           (cons
                            (string->symbol (string-append name "state724"))
                            (cons
                             (signal-value btor728)
                             (if (assoc-has-key?
                                  merged-input-state-hash
                                  (string->symbol
                                   (string-append name "state724")))
                               (add1
                                (cdr
                                 (assoc-ref
                                  merged-input-state-hash
                                  (string->symbol
                                   (string-append name "state724")))))
                               0))))
                          (append
                           (list
                            (cons
                             (string->symbol (string-append name "state679"))
                             (cons
                              (signal-value btor1052)
                              (if (assoc-has-key?
                                   merged-input-state-hash
                                   (string->symbol
                                    (string-append name "state679")))
                                (add1
                                 (cdr
                                  (assoc-ref
                                   merged-input-state-hash
                                   (string->symbol
                                    (string-append name "state679")))))
                                0))))
                           (append
                            (list
                             (cons
                              (string->symbol (string-append name "state677"))
                              (cons
                               (signal-value btor681)
                               (if (assoc-has-key?
                                    merged-input-state-hash
                                    (string->symbol
                                     (string-append name "state677")))
                                 (add1
                                  (cdr
                                   (assoc-ref
                                    merged-input-state-hash
                                    (string->symbol
                                     (string-append name "state677")))))
                                 0))))
                            (append
                             (list
                              (cons
                               (string->symbol (string-append name "state629"))
                               (cons
                                (signal-value btor1048)
                                (if (assoc-has-key?
                                     merged-input-state-hash
                                     (string->symbol
                                      (string-append name "state629")))
                                  (add1
                                   (cdr
                                    (assoc-ref
                                     merged-input-state-hash
                                     (string->symbol
                                      (string-append name "state629")))))
                                  0))))
                             (append
                              (list
                               (cons
                                (string->symbol
                                 (string-append name "state627"))
                                (cons
                                 (signal-value btor631)
                                 (if (assoc-has-key?
                                      merged-input-state-hash
                                      (string->symbol
                                       (string-append name "state627")))
                                   (add1
                                    (cdr
                                     (assoc-ref
                                      merged-input-state-hash
                                      (string->symbol
                                       (string-append name "state627")))))
                                   0))))
                              (append
                               (list
                                (cons
                                 (string->symbol
                                  (string-append name "state614"))
                                 (cons
                                  (signal-value btor1044)
                                  (if (assoc-has-key?
                                       merged-input-state-hash
                                       (string->symbol
                                        (string-append name "state614")))
                                    (add1
                                     (cdr
                                      (assoc-ref
                                       merged-input-state-hash
                                       (string->symbol
                                        (string-append name "state614")))))
                                    0))))
                               (append
                                (list
                                 (cons
                                  (string->symbol
                                   (string-append name "state612"))
                                  (cons
                                   (signal-value btor616)
                                   (if (assoc-has-key?
                                        merged-input-state-hash
                                        (string->symbol
                                         (string-append name "state612")))
                                     (add1
                                      (cdr
                                       (assoc-ref
                                        merged-input-state-hash
                                        (string->symbol
                                         (string-append name "state612")))))
                                     0))))
                                (append
                                 (list
                                  (cons
                                   (string->symbol
                                    (string-append name "state564"))
                                   (cons
                                    (signal-value btor1040)
                                    (if (assoc-has-key?
                                         merged-input-state-hash
                                         (string->symbol
                                          (string-append name "state564")))
                                      (add1
                                       (cdr
                                        (assoc-ref
                                         merged-input-state-hash
                                         (string->symbol
                                          (string-append name "state564")))))
                                      0))))
                                 (append
                                  (list
                                   (cons
                                    (string->symbol
                                     (string-append name "state562"))
                                    (cons
                                     (signal-value btor566)
                                     (if (assoc-has-key?
                                          merged-input-state-hash
                                          (string->symbol
                                           (string-append name "state562")))
                                       (add1
                                        (cdr
                                         (assoc-ref
                                          merged-input-state-hash
                                          (string->symbol
                                           (string-append name "state562")))))
                                       0))))
                                  (append
                                   (list
                                    (cons
                                     (string->symbol
                                      (string-append name "state491"))
                                     (cons
                                      (signal-value btor1036)
                                      (if (assoc-has-key?
                                           merged-input-state-hash
                                           (string->symbol
                                            (string-append name "state491")))
                                        (add1
                                         (cdr
                                          (assoc-ref
                                           merged-input-state-hash
                                           (string->symbol
                                            (string-append name "state491")))))
                                        0))))
                                   (append
                                    (list
                                     (cons
                                      (string->symbol
                                       (string-append name "state489"))
                                      (cons
                                       (signal-value btor493)
                                       (if (assoc-has-key?
                                            merged-input-state-hash
                                            (string->symbol
                                             (string-append name "state489")))
                                         (add1
                                          (cdr
                                           (assoc-ref
                                            merged-input-state-hash
                                            (string->symbol
                                             (string-append
                                              name
                                              "state489")))))
                                         0))))
                                    (append
                                     (list
                                      (cons
                                       (string->symbol
                                        (string-append name "state391"))
                                       (cons
                                        (signal-value btor1032)
                                        (if (assoc-has-key?
                                             merged-input-state-hash
                                             (string->symbol
                                              (string-append name "state391")))
                                          (add1
                                           (cdr
                                            (assoc-ref
                                             merged-input-state-hash
                                             (string->symbol
                                              (string-append
                                               name
                                               "state391")))))
                                          0))))
                                     (append
                                      (list
                                       (cons
                                        (string->symbol
                                         (string-append name "state389"))
                                        (cons
                                         (signal-value btor393)
                                         (if (assoc-has-key?
                                              merged-input-state-hash
                                              (string->symbol
                                               (string-append
                                                name
                                                "state389")))
                                           (add1
                                            (cdr
                                             (assoc-ref
                                              merged-input-state-hash
                                              (string->symbol
                                               (string-append
                                                name
                                                "state389")))))
                                           0))))
                                      (append
                                       (list
                                        (cons
                                         (string->symbol
                                          (string-append name "state361"))
                                         (cons
                                          (signal-value btor1028)
                                          (if (assoc-has-key?
                                               merged-input-state-hash
                                               (string->symbol
                                                (string-append
                                                 name
                                                 "state361")))
                                            (add1
                                             (cdr
                                              (assoc-ref
                                               merged-input-state-hash
                                               (string->symbol
                                                (string-append
                                                 name
                                                 "state361")))))
                                            0))))
                                       (append
                                        (list
                                         (cons
                                          (string->symbol
                                           (string-append name "state359"))
                                          (cons
                                           (signal-value btor363)
                                           (if (assoc-has-key?
                                                merged-input-state-hash
                                                (string->symbol
                                                 (string-append
                                                  name
                                                  "state359")))
                                             (add1
                                              (cdr
                                               (assoc-ref
                                                merged-input-state-hash
                                                (string->symbol
                                                 (string-append
                                                  name
                                                  "state359")))))
                                             0))))
                                        (append
                                         (list
                                          (cons
                                           (string->symbol
                                            (string-append name "state352"))
                                           (cons
                                            (signal-value btor1024)
                                            (if (assoc-has-key?
                                                 merged-input-state-hash
                                                 (string->symbol
                                                  (string-append
                                                   name
                                                   "state352")))
                                              (add1
                                               (cdr
                                                (assoc-ref
                                                 merged-input-state-hash
                                                 (string->symbol
                                                  (string-append
                                                   name
                                                   "state352")))))
                                              0))))
                                         (append
                                          (list
                                           (cons
                                            (string->symbol
                                             (string-append name "state350"))
                                            (cons
                                             (signal-value btor354)
                                             (if (assoc-has-key?
                                                  merged-input-state-hash
                                                  (string->symbol
                                                   (string-append
                                                    name
                                                    "state350")))
                                               (add1
                                                (cdr
                                                 (assoc-ref
                                                  merged-input-state-hash
                                                  (string->symbol
                                                   (string-append
                                                    name
                                                    "state350")))))
                                               0))))
                                          (append
                                           (list
                                            (cons
                                             (string->symbol
                                              (string-append name "state207"))
                                             (cons
                                              (signal-value btor1020)
                                              (if (assoc-has-key?
                                                   merged-input-state-hash
                                                   (string->symbol
                                                    (string-append
                                                     name
                                                     "state207")))
                                                (add1
                                                 (cdr
                                                  (assoc-ref
                                                   merged-input-state-hash
                                                   (string->symbol
                                                    (string-append
                                                     name
                                                     "state207")))))
                                                0))))
                                           (append
                                            (list
                                             (cons
                                              (string->symbol
                                               (string-append name "state205"))
                                              (cons
                                               (signal-value btor209)
                                               (if (assoc-has-key?
                                                    merged-input-state-hash
                                                    (string->symbol
                                                     (string-append
                                                      name
                                                      "state205")))
                                                 (add1
                                                  (cdr
                                                   (assoc-ref
                                                    merged-input-state-hash
                                                    (string->symbol
                                                     (string-append
                                                      name
                                                      "state205")))))
                                                 0))))
                                            (append
                                             (list
                                              (cons
                                               (string->symbol
                                                (string-append
                                                 name
                                                 "state199"))
                                               (cons
                                                (signal-value btor1016)
                                                (if (assoc-has-key?
                                                     merged-input-state-hash
                                                     (string->symbol
                                                      (string-append
                                                       name
                                                       "state199")))
                                                  (add1
                                                   (cdr
                                                    (assoc-ref
                                                     merged-input-state-hash
                                                     (string->symbol
                                                      (string-append
                                                       name
                                                       "state199")))))
                                                  0))))
                                             (append
                                              (list
                                               (cons
                                                (string->symbol
                                                 (string-append
                                                  name
                                                  "state197"))
                                                (cons
                                                 (signal-value btor201)
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
                                                   "state186"))
                                                 (cons
                                                  (signal-value btor1012)
                                                  (if (assoc-has-key?
                                                       merged-input-state-hash
                                                       (string->symbol
                                                        (string-append
                                                         name
                                                         "state186")))
                                                    (add1
                                                     (cdr
                                                      (assoc-ref
                                                       merged-input-state-hash
                                                       (string->symbol
                                                        (string-append
                                                         name
                                                         "state186")))))
                                                    0))))
                                               (append
                                                (list
                                                 (cons
                                                  (string->symbol
                                                   (string-append
                                                    name
                                                    "state184"))
                                                  (cons
                                                   (signal-value btor188)
                                                   (if (assoc-has-key?
                                                        merged-input-state-hash
                                                        (string->symbol
                                                         (string-append
                                                          name
                                                          "state184")))
                                                     (add1
                                                      (cdr
                                                       (assoc-ref
                                                        merged-input-state-hash
                                                        (string->symbol
                                                         (string-append
                                                          name
                                                          "state184")))))
                                                     0))))
                                                (append
                                                 (list
                                                  (cons
                                                   (string->symbol
                                                    (string-append
                                                     name
                                                     "state169"))
                                                   (cons
                                                    (signal-value btor168)
                                                    (if (assoc-has-key?
                                                         merged-input-state-hash
                                                         (string->symbol
                                                          (string-append
                                                           name
                                                           "state169")))
                                                      (add1
                                                       (cdr
                                                        (assoc-ref
                                                         merged-input-state-hash
                                                         (string->symbol
                                                          (string-append
                                                           name
                                                           "state169")))))
                                                      0))))
                                                 (append
                                                  (list
                                                   (cons
                                                    (string->symbol
                                                     (string-append
                                                      name
                                                      "state166"))
                                                    (cons
                                                     (signal-value btor1007)
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
                                                       "state164"))
                                                     (cons
                                                      (signal-value btor174)
                                                      (if (assoc-has-key?
                                                           merged-input-state-hash
                                                           (string->symbol
                                                            (string-append
                                                             name
                                                             "state164")))
                                                        (add1
                                                         (cdr
                                                          (assoc-ref
                                                           merged-input-state-hash
                                                           (string->symbol
                                                            (string-append
                                                             name
                                                             "state164")))))
                                                        0))))
                                                   (append
                                                    (list
                                                     (cons
                                                      (string->symbol
                                                       (string-append
                                                        name
                                                        "state155"))
                                                      (cons
                                                       (signal-value btor1002)
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
                                                          "state129"))
                                                        (cons
                                                         (signal-value btor998)
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
                                                           "state127"))
                                                         (cons
                                                          (signal-value
                                                           btor131)
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
                                                            "state118"))
                                                          (cons
                                                           (signal-value
                                                            btor993)
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
                                                             "state116"))
                                                           (cons
                                                            (signal-value
                                                             btor120)
                                                            (if (assoc-has-key?
                                                                 merged-input-state-hash
                                                                 (string->symbol
                                                                  (string-append
                                                                   name
                                                                   "state116")))
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
                                                              "state85"))
                                                            (cons
                                                             (signal-value
                                                              btor42)
                                                             (if (assoc-has-key?
                                                                  merged-input-state-hash
                                                                  (string->symbol
                                                                   (string-append
                                                                    name
                                                                    "state85")))
                                                               (add1
                                                                (cdr
                                                                 (assoc-ref
                                                                  merged-input-state-hash
                                                                  (string->symbol
                                                                   (string-append
                                                                    name
                                                                    "state85")))))
                                                               0))))
                                                          (append
                                                           (list
                                                            (cons
                                                             (string->symbol
                                                              (string-append
                                                               name
                                                               "state82"))
                                                             (cons
                                                              (signal-value
                                                               btor988)
                                                              (if (assoc-has-key?
                                                                   merged-input-state-hash
                                                                   (string->symbol
                                                                    (string-append
                                                                     name
                                                                     "state82")))
                                                                (add1
                                                                 (cdr
                                                                  (assoc-ref
                                                                   merged-input-state-hash
                                                                   (string->symbol
                                                                    (string-append
                                                                     name
                                                                     "state82")))))
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
                                                                btor91)
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
                                                            (list)))))))))))))))))))))))))))))))))))))))))))))))
              merged-input-state-hash)
             equal?
             #:key
             car)))
      (list
       (cons 'PCOUT (signal (signal-value btor775) output-state))
       (cons 'PATTERNBDETECT (signal (signal-value btor777) output-state))
       (cons 'CARRYCASCOUT (signal (signal-value btor675) output-state))
       (cons 'P (signal (signal-value btor775) output-state))
       (cons 'CARRYOUT (signal (signal-value btor722) output-state))
       (cons 'UNDERFLOW (signal (signal-value btor789) output-state))
       (cons 'BCOUT (signal (signal-value btor161) output-state))
       (cons 'MULTSIGNOUT (signal (signal-value btor733) output-state))
       (cons 'OVERFLOW (signal (signal-value btor758) output-state))
       (cons 'ACOUT (signal (signal-value btor124) output-state))
       (cons 'PATTERNDETECT (signal (signal-value btor779) output-state))))))

