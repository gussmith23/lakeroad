#lang racket/base
(provide lattice-ecp5-mult18x18c)
(require (file "../signal.rkt"))
(require rosette)
(define lattice-ecp5-mult18x18c
  (λ (#:A0
      (A0 (bv->signal (constant 'A0 (bitvector 1))))
      #:A1
      (A1 (bv->signal (constant 'A1 (bitvector 1))))
      #:A10
      (A10 (bv->signal (constant 'A10 (bitvector 1))))
      #:A11
      (A11 (bv->signal (constant 'A11 (bitvector 1))))
      #:A12
      (A12 (bv->signal (constant 'A12 (bitvector 1))))
      #:A13
      (A13 (bv->signal (constant 'A13 (bitvector 1))))
      #:A14
      (A14 (bv->signal (constant 'A14 (bitvector 1))))
      #:A15
      (A15 (bv->signal (constant 'A15 (bitvector 1))))
      #:A16
      (A16 (bv->signal (constant 'A16 (bitvector 1))))
      #:A17
      (A17 (bv->signal (constant 'A17 (bitvector 1))))
      #:A2
      (A2 (bv->signal (constant 'A2 (bitvector 1))))
      #:A3
      (A3 (bv->signal (constant 'A3 (bitvector 1))))
      #:A4
      (A4 (bv->signal (constant 'A4 (bitvector 1))))
      #:A5
      (A5 (bv->signal (constant 'A5 (bitvector 1))))
      #:A6
      (A6 (bv->signal (constant 'A6 (bitvector 1))))
      #:A7
      (A7 (bv->signal (constant 'A7 (bitvector 1))))
      #:A8
      (A8 (bv->signal (constant 'A8 (bitvector 1))))
      #:A9
      (A9 (bv->signal (constant 'A9 (bitvector 1))))
      #:B0
      (B0 (bv->signal (constant 'B0 (bitvector 1))))
      #:B1
      (B1 (bv->signal (constant 'B1 (bitvector 1))))
      #:B10
      (B10 (bv->signal (constant 'B10 (bitvector 1))))
      #:B11
      (B11 (bv->signal (constant 'B11 (bitvector 1))))
      #:B12
      (B12 (bv->signal (constant 'B12 (bitvector 1))))
      #:B13
      (B13 (bv->signal (constant 'B13 (bitvector 1))))
      #:B14
      (B14 (bv->signal (constant 'B14 (bitvector 1))))
      #:B15
      (B15 (bv->signal (constant 'B15 (bitvector 1))))
      #:B16
      (B16 (bv->signal (constant 'B16 (bitvector 1))))
      #:B17
      (B17 (bv->signal (constant 'B17 (bitvector 1))))
      #:B2
      (B2 (bv->signal (constant 'B2 (bitvector 1))))
      #:B3
      (B3 (bv->signal (constant 'B3 (bitvector 1))))
      #:B4
      (B4 (bv->signal (constant 'B4 (bitvector 1))))
      #:B5
      (B5 (bv->signal (constant 'B5 (bitvector 1))))
      #:B6
      (B6 (bv->signal (constant 'B6 (bitvector 1))))
      #:B7
      (B7 (bv->signal (constant 'B7 (bitvector 1))))
      #:B8
      (B8 (bv->signal (constant 'B8 (bitvector 1))))
      #:B9
      (B9 (bv->signal (constant 'B9 (bitvector 1))))
      #:CAS_MATCH_REG
      (CAS_MATCH_REG (bv->signal (constant 'CAS_MATCH_REG (bitvector 5))))
      #:CE0
      (CE0 (bv->signal (constant 'CE0 (bitvector 1))))
      #:CE1
      (CE1 (bv->signal (constant 'CE1 (bitvector 1))))
      #:CE2
      (CE2 (bv->signal (constant 'CE2 (bitvector 1))))
      #:CE3
      (CE3 (bv->signal (constant 'CE3 (bitvector 1))))
      #:CLK0
      (CLK0 (bv->signal (constant 'CLK0 (bitvector 1))))
      #:CLK1
      (CLK1 (bv->signal (constant 'CLK1 (bitvector 1))))
      #:CLK2
      (CLK2 (bv->signal (constant 'CLK2 (bitvector 1))))
      #:CLK3
      (CLK3 (bv->signal (constant 'CLK3 (bitvector 1))))
      #:MULT_BYPASS
      (MULT_BYPASS (bv->signal (constant 'MULT_BYPASS (bitvector 5))))
      #:REG_INPUTA_CE
      (REG_INPUTA_CE (bv->signal (constant 'REG_INPUTA_CE (bitvector 5))))
      #:REG_INPUTA_CLK
      (REG_INPUTA_CLK (bv->signal (constant 'REG_INPUTA_CLK (bitvector 5))))
      #:REG_INPUTA_RST
      (REG_INPUTA_RST (bv->signal (constant 'REG_INPUTA_RST (bitvector 5))))
      #:REG_INPUTB_CE
      (REG_INPUTB_CE (bv->signal (constant 'REG_INPUTB_CE (bitvector 5))))
      #:REG_INPUTB_CLK
      (REG_INPUTB_CLK (bv->signal (constant 'REG_INPUTB_CLK (bitvector 5))))
      #:REG_INPUTB_RST
      (REG_INPUTB_RST (bv->signal (constant 'REG_INPUTB_RST (bitvector 5))))
      #:REG_OUTPUT_CE
      (REG_OUTPUT_CE (bv->signal (constant 'REG_OUTPUT_CE (bitvector 5))))
      #:REG_OUTPUT_CLK
      (REG_OUTPUT_CLK (bv->signal (constant 'REG_OUTPUT_CLK (bitvector 5))))
      #:REG_OUTPUT_RST
      (REG_OUTPUT_RST (bv->signal (constant 'REG_OUTPUT_RST (bitvector 5))))
      #:REG_PIPELINE_CE
      (REG_PIPELINE_CE (bv->signal (constant 'REG_PIPELINE_CE (bitvector 5))))
      #:REG_PIPELINE_CLK
      (REG_PIPELINE_CLK
       (bv->signal (constant 'REG_PIPELINE_CLK (bitvector 5))))
      #:REG_PIPELINE_RST
      (REG_PIPELINE_RST
       (bv->signal (constant 'REG_PIPELINE_RST (bitvector 5))))
      #:RST0
      (RST0 (bv->signal (constant 'RST0 (bitvector 1))))
      #:RST1
      (RST1 (bv->signal (constant 'RST1 (bitvector 1))))
      #:RST2
      (RST2 (bv->signal (constant 'RST2 (bitvector 1))))
      #:RST3
      (RST3 (bv->signal (constant 'RST3 (bitvector 1))))
      #:SIGNEDA
      (SIGNEDA (bv->signal (constant 'SIGNEDA (bitvector 1))))
      #:SIGNEDB
      (SIGNEDB (bv->signal (constant 'SIGNEDB (bitvector 1))))
      #:SOURCEA
      (SOURCEA (bv->signal (constant 'SOURCEA (bitvector 1))))
      #:SOURCEB
      (SOURCEB (bv->signal (constant 'SOURCEB (bitvector 1))))
      #:SRIA0
      (SRIA0 (bv->signal (constant 'SRIA0 (bitvector 1))))
      #:SRIA1
      (SRIA1 (bv->signal (constant 'SRIA1 (bitvector 1))))
      #:SRIA10
      (SRIA10 (bv->signal (constant 'SRIA10 (bitvector 1))))
      #:SRIA11
      (SRIA11 (bv->signal (constant 'SRIA11 (bitvector 1))))
      #:SRIA12
      (SRIA12 (bv->signal (constant 'SRIA12 (bitvector 1))))
      #:SRIA13
      (SRIA13 (bv->signal (constant 'SRIA13 (bitvector 1))))
      #:SRIA14
      (SRIA14 (bv->signal (constant 'SRIA14 (bitvector 1))))
      #:SRIA15
      (SRIA15 (bv->signal (constant 'SRIA15 (bitvector 1))))
      #:SRIA16
      (SRIA16 (bv->signal (constant 'SRIA16 (bitvector 1))))
      #:SRIA17
      (SRIA17 (bv->signal (constant 'SRIA17 (bitvector 1))))
      #:SRIA2
      (SRIA2 (bv->signal (constant 'SRIA2 (bitvector 1))))
      #:SRIA3
      (SRIA3 (bv->signal (constant 'SRIA3 (bitvector 1))))
      #:SRIA4
      (SRIA4 (bv->signal (constant 'SRIA4 (bitvector 1))))
      #:SRIA5
      (SRIA5 (bv->signal (constant 'SRIA5 (bitvector 1))))
      #:SRIA6
      (SRIA6 (bv->signal (constant 'SRIA6 (bitvector 1))))
      #:SRIA7
      (SRIA7 (bv->signal (constant 'SRIA7 (bitvector 1))))
      #:SRIA8
      (SRIA8 (bv->signal (constant 'SRIA8 (bitvector 1))))
      #:SRIA9
      (SRIA9 (bv->signal (constant 'SRIA9 (bitvector 1))))
      #:SRIB0
      (SRIB0 (bv->signal (constant 'SRIB0 (bitvector 1))))
      #:SRIB1
      (SRIB1 (bv->signal (constant 'SRIB1 (bitvector 1))))
      #:SRIB10
      (SRIB10 (bv->signal (constant 'SRIB10 (bitvector 1))))
      #:SRIB11
      (SRIB11 (bv->signal (constant 'SRIB11 (bitvector 1))))
      #:SRIB12
      (SRIB12 (bv->signal (constant 'SRIB12 (bitvector 1))))
      #:SRIB13
      (SRIB13 (bv->signal (constant 'SRIB13 (bitvector 1))))
      #:SRIB14
      (SRIB14 (bv->signal (constant 'SRIB14 (bitvector 1))))
      #:SRIB15
      (SRIB15 (bv->signal (constant 'SRIB15 (bitvector 1))))
      #:SRIB16
      (SRIB16 (bv->signal (constant 'SRIB16 (bitvector 1))))
      #:SRIB17
      (SRIB17 (bv->signal (constant 'SRIB17 (bitvector 1))))
      #:SRIB2
      (SRIB2 (bv->signal (constant 'SRIB2 (bitvector 1))))
      #:SRIB3
      (SRIB3 (bv->signal (constant 'SRIB3 (bitvector 1))))
      #:SRIB4
      (SRIB4 (bv->signal (constant 'SRIB4 (bitvector 1))))
      #:SRIB5
      (SRIB5 (bv->signal (constant 'SRIB5 (bitvector 1))))
      #:SRIB6
      (SRIB6 (bv->signal (constant 'SRIB6 (bitvector 1))))
      #:SRIB7
      (SRIB7 (bv->signal (constant 'SRIB7 (bitvector 1))))
      #:SRIB8
      (SRIB8 (bv->signal (constant 'SRIB8 (bitvector 1))))
      #:SRIB9
      (SRIB9 (bv->signal (constant 'SRIB9 (bitvector 1))))
      #:name
      (name ""))
    (let* ((merged-input-state-hash (list))
           (init-hash
            (append
             (list
              (cons
               (string->symbol (string-append name "state545"))
               (bv 1 (bitvector 1))))
             (append
              (list
               (cons
                (string->symbol (string-append name "state535"))
                (bv 1 (bitvector 1))))
              (append
               (list
                (cons
                 (string->symbol (string-append name "state364"))
                 (bv 1 (bitvector 1))))
               (append
                (list
                 (cons
                  (string->symbol (string-append name "state272"))
                  (bv 1 (bitvector 1))))
                (append
                 (list
                  (cons
                   (string->symbol (string-append name "state262"))
                   (bv 1 (bitvector 1))))
                 (append
                  (list
                   (cons
                    (string->symbol (string-append name "state156"))
                    (bv 1 (bitvector 1))))
                  (append
                   (list
                    (cons
                     (string->symbol (string-append name "state136"))
                     (bv 1 (bitvector 1))))
                   (append
                    (list
                     (cons
                      (string->symbol (string-append name "state110"))
                      (bv 1 (bitvector 1))))
                    (list))))))))))
           (btor1 (bitvector 1))
           (btor2 A0)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state A0)))
           (btor3 A1)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state A1)))
           (btor4 A10)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state A10)))
           (btor5 A11)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state A11)))
           (btor6 A12)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state A12)))
           (btor7 A13)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state A13)))
           (btor8 A14)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state A14)))
           (btor9 A15)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state A15)))
           (btor10 A16)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state A16)))
           (btor11 A17)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state A17)))
           (btor12 A2)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state A2)))
           (btor13 A3)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state A3)))
           (btor14 A4)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state A4)))
           (btor15 A5)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state A5)))
           (btor16 A6)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state A6)))
           (btor17 A7)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state A7)))
           (btor18 A8)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state A8)))
           (btor19 A9)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state A9)))
           (btor20 B0)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state B0)))
           (btor21 B1)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state B1)))
           (btor22 B10)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state B10)))
           (btor23 B11)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state B11)))
           (btor24 B12)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state B12)))
           (btor25 B13)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state B13)))
           (btor26 B14)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state B14)))
           (btor27 B15)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state B15)))
           (btor28 B16)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state B16)))
           (btor29 B17)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state B17)))
           (btor30 B2)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state B2)))
           (btor31 B3)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state B3)))
           (btor32 B4)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state B4)))
           (btor33 B5)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state B5)))
           (btor34 B6)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state B6)))
           (btor35 B7)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state B7)))
           (btor36 B8)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state B8)))
           (btor37 B9)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state B9)))
           (btor38 (bitvector 5))
           (btor39 CAS_MATCH_REG)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CAS_MATCH_REG)))
           (btor40 CE0)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CE0)))
           (btor41 CE1)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CE1)))
           (btor42 CE2)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CE2)))
           (btor43 CE3)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CE3)))
           (btor44 CLK0)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CLK0)))
           (btor45 CLK1)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CLK1)))
           (btor46 CLK2)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CLK2)))
           (btor47 CLK3)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CLK3)))
           (btor48 MULT_BYPASS)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MULT_BYPASS)))
           (btor49 REG_INPUTA_CE)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state REG_INPUTA_CE)))
           (btor50 REG_INPUTA_CLK)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state REG_INPUTA_CLK)))
           (btor51 REG_INPUTA_RST)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state REG_INPUTA_RST)))
           (btor52 REG_INPUTB_CE)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state REG_INPUTB_CE)))
           (btor53 REG_INPUTB_CLK)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state REG_INPUTB_CLK)))
           (btor54 REG_INPUTB_RST)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state REG_INPUTB_RST)))
           (btor55 REG_OUTPUT_CE)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state REG_OUTPUT_CE)))
           (btor56 REG_OUTPUT_CLK)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state REG_OUTPUT_CLK)))
           (btor57 REG_OUTPUT_RST)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state REG_OUTPUT_RST)))
           (btor58 REG_PIPELINE_CE)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state REG_PIPELINE_CE)))
           (btor59 REG_PIPELINE_CLK)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state REG_PIPELINE_CLK)))
           (btor60 REG_PIPELINE_RST)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state REG_PIPELINE_RST)))
           (btor61 RST0)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state RST0)))
           (btor62 RST1)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state RST1)))
           (btor63 RST2)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state RST2)))
           (btor64 RST3)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state RST3)))
           (btor65 SIGNEDA)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SIGNEDA)))
           (btor66 SIGNEDB)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SIGNEDB)))
           (btor67 SOURCEA)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SOURCEA)))
           (btor68 SOURCEB)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SOURCEB)))
           (btor69 SRIA0)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SRIA0)))
           (btor70 SRIA1)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SRIA1)))
           (btor71 SRIA10)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SRIA10)))
           (btor72 SRIA11)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SRIA11)))
           (btor73 SRIA12)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SRIA12)))
           (btor74 SRIA13)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SRIA13)))
           (btor75 SRIA14)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SRIA14)))
           (btor76 SRIA15)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SRIA15)))
           (btor77 SRIA16)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SRIA16)))
           (btor78 SRIA17)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SRIA17)))
           (btor79 SRIA2)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SRIA2)))
           (btor80 SRIA3)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SRIA3)))
           (btor81 SRIA4)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SRIA4)))
           (btor82 SRIA5)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SRIA5)))
           (btor83 SRIA6)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SRIA6)))
           (btor84 SRIA7)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SRIA7)))
           (btor85 SRIA8)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SRIA8)))
           (btor86 SRIA9)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SRIA9)))
           (btor87 SRIB0)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SRIB0)))
           (btor88 SRIB1)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SRIB1)))
           (btor89 SRIB10)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SRIB10)))
           (btor90 SRIB11)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SRIB11)))
           (btor91 SRIB12)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SRIB12)))
           (btor92 SRIB13)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SRIB13)))
           (btor93 SRIB14)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SRIB14)))
           (btor94 SRIB15)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SRIB15)))
           (btor95 SRIB16)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SRIB16)))
           (btor96 SRIB17)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SRIB17)))
           (btor97 SRIB2)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SRIB2)))
           (btor98 SRIB3)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SRIB3)))
           (btor99 SRIB4)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SRIB4)))
           (btor100 SRIB5)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SRIB5)))
           (btor101 SRIB6)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SRIB6)))
           (btor102 SRIB7)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SRIB7)))
           (btor103 SRIB8)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SRIB8)))
           (btor104 SRIB9)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SRIB9)))
           (btor105 (bitvector 36))
           (btor106 (bv->signal (bv 0 (bitvector 36))))
           (btor107
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state107")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state107")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state107")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state107")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 36))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor108
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state108")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state108")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state108")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state108")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 36))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor109 (bv->signal (bv 1 (bitvector 1))))
           (btor110
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state110")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state110")))))
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
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor112 (bitvector 4))
           (btor113 (bv->signal (bv 14 (bitvector 4))))
           (btor114
            (bv->signal
             (zero-extend (signal-value btor113) (bitvector 5))
             btor113))
           (btor115
            (signal
             (bool->bitvector
              (bveq (signal-value btor56) (signal-value btor114)))
             (list)))
           (btor116
            (if (bitvector->bool (signal-value btor115)) btor47 btor44))
           (btor117 (bv->signal (bv 13 (bitvector 4))))
           (btor118
            (bv->signal
             (zero-extend (signal-value btor117) (bitvector 5))
             btor117))
           (btor119
            (signal
             (bool->bitvector
              (bveq (signal-value btor56) (signal-value btor118)))
             (list)))
           (btor120
            (if (bitvector->bool (signal-value btor119)) btor46 btor116))
           (btor121 (bv->signal (bv 12 (bitvector 4))))
           (btor122
            (bv->signal
             (zero-extend (signal-value btor121) (bitvector 5))
             btor121))
           (btor123
            (signal
             (bool->bitvector
              (bveq (signal-value btor56) (signal-value btor122)))
             (list)))
           (btor124
            (if (bitvector->bool (signal-value btor123)) btor45 btor120))
           (btor125 (bv->signal (bv 11 (bitvector 4))))
           (btor126
            (bv->signal
             (zero-extend (signal-value btor125) (bitvector 5))
             btor125))
           (btor127
            (signal
             (bool->bitvector
              (bveq (signal-value btor56) (signal-value btor126)))
             (list)))
           (btor128
            (if (bitvector->bool (signal-value btor127)) btor44 btor124))
           (btor129 (bitvector 2))
           (btor130
            (signal
             (concat (signal-value btor128) (signal-value btor110))
             (list)))
           (btor131 (bv->signal (bv 2 (bitvector 2))))
           (btor132
            (signal
             (bool->bitvector
              (bveq (signal-value btor130) (signal-value btor131)))
             (list)))
           (btor133
            (if (bitvector->bool (signal-value btor132)) btor108 btor107))
           (btor134
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state134")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state134")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state134")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state134")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 36))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor135
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state135")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state135")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state135")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state135")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 36))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
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
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor138
            (bv->signal
             (zero-extend (signal-value btor113) (bitvector 5))
             btor113))
           (btor139
            (signal
             (bool->bitvector
              (bveq (signal-value btor59) (signal-value btor138)))
             (list)))
           (btor140
            (if (bitvector->bool (signal-value btor139)) btor47 btor44))
           (btor141
            (bv->signal
             (zero-extend (signal-value btor117) (bitvector 5))
             btor117))
           (btor142
            (signal
             (bool->bitvector
              (bveq (signal-value btor59) (signal-value btor141)))
             (list)))
           (btor143
            (if (bitvector->bool (signal-value btor142)) btor46 btor140))
           (btor144
            (bv->signal
             (zero-extend (signal-value btor121) (bitvector 5))
             btor121))
           (btor145
            (signal
             (bool->bitvector
              (bveq (signal-value btor59) (signal-value btor144)))
             (list)))
           (btor146
            (if (bitvector->bool (signal-value btor145)) btor45 btor143))
           (btor147
            (bv->signal
             (zero-extend (signal-value btor125) (bitvector 5))
             btor125))
           (btor148
            (signal
             (bool->bitvector
              (bveq (signal-value btor59) (signal-value btor147)))
             (list)))
           (btor149
            (if (bitvector->bool (signal-value btor148)) btor44 btor146))
           (btor150
            (signal
             (concat (signal-value btor149) (signal-value btor136))
             (list)))
           (btor151
            (signal
             (bool->bitvector
              (bveq (signal-value btor150) (signal-value btor131)))
             (list)))
           (btor152
            (if (bitvector->bool (signal-value btor151)) btor135 btor134))
           (btor153 (bitvector 18))
           (btor154
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state154")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state154")))))
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
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state155")))))
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
           (btor156
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state156")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state156")))))
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
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor158
            (bv->signal
             (zero-extend (signal-value btor113) (bitvector 5))
             btor113))
           (btor159
            (signal
             (bool->bitvector
              (bveq (signal-value btor50) (signal-value btor158)))
             (list)))
           (btor160
            (if (bitvector->bool (signal-value btor159)) btor47 btor44))
           (btor161
            (bv->signal
             (zero-extend (signal-value btor117) (bitvector 5))
             btor117))
           (btor162
            (signal
             (bool->bitvector
              (bveq (signal-value btor50) (signal-value btor161)))
             (list)))
           (btor163
            (if (bitvector->bool (signal-value btor162)) btor46 btor160))
           (btor164
            (bv->signal
             (zero-extend (signal-value btor121) (bitvector 5))
             btor121))
           (btor165
            (signal
             (bool->bitvector
              (bveq (signal-value btor50) (signal-value btor164)))
             (list)))
           (btor166
            (if (bitvector->bool (signal-value btor165)) btor45 btor163))
           (btor167
            (bv->signal
             (zero-extend (signal-value btor125) (bitvector 5))
             btor125))
           (btor168
            (signal
             (bool->bitvector
              (bveq (signal-value btor50) (signal-value btor167)))
             (list)))
           (btor169
            (if (bitvector->bool (signal-value btor168)) btor44 btor166))
           (btor170
            (signal
             (concat (signal-value btor169) (signal-value btor156))
             (list)))
           (btor171
            (signal
             (bool->bitvector
              (bveq (signal-value btor170) (signal-value btor131)))
             (list)))
           (btor172
            (if (bitvector->bool (signal-value btor171)) btor155 btor154))
           (btor173
            (signal (concat (signal-value btor3) (signal-value btor2)) (list)))
           (btor174 (bitvector 3))
           (btor175
            (signal
             (concat (signal-value btor12) (signal-value btor173))
             (list)))
           (btor176
            (signal
             (concat (signal-value btor13) (signal-value btor175))
             (list)))
           (btor177
            (signal
             (concat (signal-value btor14) (signal-value btor176))
             (list)))
           (btor178 (bitvector 6))
           (btor179
            (signal
             (concat (signal-value btor15) (signal-value btor177))
             (list)))
           (btor180 (bitvector 7))
           (btor181
            (signal
             (concat (signal-value btor16) (signal-value btor179))
             (list)))
           (btor182 (bitvector 8))
           (btor183
            (signal
             (concat (signal-value btor17) (signal-value btor181))
             (list)))
           (btor184 (bitvector 9))
           (btor185
            (signal
             (concat (signal-value btor18) (signal-value btor183))
             (list)))
           (btor186 (bitvector 10))
           (btor187
            (signal
             (concat (signal-value btor19) (signal-value btor185))
             (list)))
           (btor188 (bitvector 11))
           (btor189
            (signal
             (concat (signal-value btor4) (signal-value btor187))
             (list)))
           (btor190 (bitvector 12))
           (btor191
            (signal
             (concat (signal-value btor5) (signal-value btor189))
             (list)))
           (btor192 (bitvector 13))
           (btor193
            (signal
             (concat (signal-value btor6) (signal-value btor191))
             (list)))
           (btor194 (bitvector 14))
           (btor195
            (signal
             (concat (signal-value btor7) (signal-value btor193))
             (list)))
           (btor196 (bitvector 15))
           (btor197
            (signal
             (concat (signal-value btor8) (signal-value btor195))
             (list)))
           (btor198 (bitvector 16))
           (btor199
            (signal
             (concat (signal-value btor9) (signal-value btor197))
             (list)))
           (btor200 (bitvector 17))
           (btor201
            (signal
             (concat (signal-value btor10) (signal-value btor199))
             (list)))
           (btor202
            (signal
             (concat (signal-value btor11) (signal-value btor201))
             (list)))
           (btor203
            (signal
             (concat (signal-value btor70) (signal-value btor69))
             (list)))
           (btor204
            (signal
             (concat (signal-value btor79) (signal-value btor203))
             (list)))
           (btor205
            (signal
             (concat (signal-value btor80) (signal-value btor204))
             (list)))
           (btor206
            (signal
             (concat (signal-value btor81) (signal-value btor205))
             (list)))
           (btor207
            (signal
             (concat (signal-value btor82) (signal-value btor206))
             (list)))
           (btor208
            (signal
             (concat (signal-value btor83) (signal-value btor207))
             (list)))
           (btor209
            (signal
             (concat (signal-value btor84) (signal-value btor208))
             (list)))
           (btor210
            (signal
             (concat (signal-value btor85) (signal-value btor209))
             (list)))
           (btor211
            (signal
             (concat (signal-value btor86) (signal-value btor210))
             (list)))
           (btor212
            (signal
             (concat (signal-value btor71) (signal-value btor211))
             (list)))
           (btor213
            (signal
             (concat (signal-value btor72) (signal-value btor212))
             (list)))
           (btor214
            (signal
             (concat (signal-value btor73) (signal-value btor213))
             (list)))
           (btor215
            (signal
             (concat (signal-value btor74) (signal-value btor214))
             (list)))
           (btor216
            (signal
             (concat (signal-value btor75) (signal-value btor215))
             (list)))
           (btor217
            (signal
             (concat (signal-value btor76) (signal-value btor216))
             (list)))
           (btor218
            (signal
             (concat (signal-value btor77) (signal-value btor217))
             (list)))
           (btor219
            (signal
             (concat (signal-value btor78) (signal-value btor218))
             (list)))
           (btor220
            (if (bitvector->bool (signal-value btor67)) btor219 btor202))
           (btor221
            (signal
             (apply bvor (bitvector->bits (signal-value btor50)))
             (signal-state btor50)))
           (btor222 (signal (bvnot (signal-value btor221)) (list)))
           (btor223
            (if (bitvector->bool (signal-value btor222)) btor220 btor172))
           (btor224 (bv->signal (bv 0 (bitvector 18))))
           (btor225
            (signal
             (extract 17 17 (signal-value btor223))
             (signal-state btor223)))
           (btor226
            (signal
             (extract 17 17 (signal-value btor223))
             (signal-state btor223)))
           (btor227
            (signal
             (concat (signal-value btor226) (signal-value btor225))
             (list)))
           (btor228
            (signal
             (extract 17 17 (signal-value btor223))
             (signal-state btor223)))
           (btor229
            (signal
             (concat (signal-value btor228) (signal-value btor227))
             (list)))
           (btor230
            (signal
             (extract 17 17 (signal-value btor223))
             (signal-state btor223)))
           (btor231
            (signal
             (concat (signal-value btor230) (signal-value btor229))
             (list)))
           (btor232
            (signal
             (extract 17 17 (signal-value btor223))
             (signal-state btor223)))
           (btor233
            (signal
             (concat (signal-value btor232) (signal-value btor231))
             (list)))
           (btor234
            (signal
             (extract 17 17 (signal-value btor223))
             (signal-state btor223)))
           (btor235
            (signal
             (concat (signal-value btor234) (signal-value btor233))
             (list)))
           (btor236
            (signal
             (extract 17 17 (signal-value btor223))
             (signal-state btor223)))
           (btor237
            (signal
             (concat (signal-value btor236) (signal-value btor235))
             (list)))
           (btor238
            (signal
             (extract 17 17 (signal-value btor223))
             (signal-state btor223)))
           (btor239
            (signal
             (concat (signal-value btor238) (signal-value btor237))
             (list)))
           (btor240
            (signal
             (extract 17 17 (signal-value btor223))
             (signal-state btor223)))
           (btor241
            (signal
             (concat (signal-value btor240) (signal-value btor239))
             (list)))
           (btor242
            (signal
             (extract 17 17 (signal-value btor223))
             (signal-state btor223)))
           (btor243
            (signal
             (concat (signal-value btor242) (signal-value btor241))
             (list)))
           (btor244
            (signal
             (extract 17 17 (signal-value btor223))
             (signal-state btor223)))
           (btor245
            (signal
             (concat (signal-value btor244) (signal-value btor243))
             (list)))
           (btor246
            (signal
             (extract 17 17 (signal-value btor223))
             (signal-state btor223)))
           (btor247
            (signal
             (concat (signal-value btor246) (signal-value btor245))
             (list)))
           (btor248
            (signal
             (extract 17 17 (signal-value btor223))
             (signal-state btor223)))
           (btor249
            (signal
             (concat (signal-value btor248) (signal-value btor247))
             (list)))
           (btor250
            (signal
             (extract 17 17 (signal-value btor223))
             (signal-state btor223)))
           (btor251
            (signal
             (concat (signal-value btor250) (signal-value btor249))
             (list)))
           (btor252
            (signal
             (extract 17 17 (signal-value btor223))
             (signal-state btor223)))
           (btor253
            (signal
             (concat (signal-value btor252) (signal-value btor251))
             (list)))
           (btor254
            (signal
             (extract 17 17 (signal-value btor223))
             (signal-state btor223)))
           (btor255
            (signal
             (concat (signal-value btor254) (signal-value btor253))
             (list)))
           (btor256
            (signal
             (extract 17 17 (signal-value btor223))
             (signal-state btor223)))
           (btor257
            (signal
             (concat (signal-value btor256) (signal-value btor255))
             (list)))
           (btor258
            (signal
             (extract 17 17 (signal-value btor223))
             (signal-state btor223)))
           (btor259
            (signal
             (concat (signal-value btor258) (signal-value btor257))
             (list)))
           (btor260
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state260")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state260")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state260")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state260")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor261
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state261")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state261")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state261")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state261")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor262
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state262")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state262")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state262")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state262")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor264
            (signal
             (concat (signal-value btor169) (signal-value btor262))
             (list)))
           (btor265
            (signal
             (bool->bitvector
              (bveq (signal-value btor264) (signal-value btor131)))
             (list)))
           (btor266
            (if (bitvector->bool (signal-value btor265)) btor261 btor260))
           (btor267
            (if (bitvector->bool (signal-value btor222)) btor65 btor266))
           (btor268
            (if (bitvector->bool (signal-value btor267)) btor259 btor224))
           (btor269
            (signal
             (concat (signal-value btor268) (signal-value btor223))
             (list)))
           (btor270
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state270")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state270")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state270")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state270")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor271
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state271")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state271")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state271")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state271")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor272
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state272")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state272")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state272")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state272")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor274
            (bv->signal
             (zero-extend (signal-value btor113) (bitvector 5))
             btor113))
           (btor275
            (signal
             (bool->bitvector
              (bveq (signal-value btor53) (signal-value btor274)))
             (list)))
           (btor276
            (if (bitvector->bool (signal-value btor275)) btor47 btor44))
           (btor277
            (bv->signal
             (zero-extend (signal-value btor117) (bitvector 5))
             btor117))
           (btor278
            (signal
             (bool->bitvector
              (bveq (signal-value btor53) (signal-value btor277)))
             (list)))
           (btor279
            (if (bitvector->bool (signal-value btor278)) btor46 btor276))
           (btor280
            (bv->signal
             (zero-extend (signal-value btor121) (bitvector 5))
             btor121))
           (btor281
            (signal
             (bool->bitvector
              (bveq (signal-value btor53) (signal-value btor280)))
             (list)))
           (btor282
            (if (bitvector->bool (signal-value btor281)) btor45 btor279))
           (btor283
            (bv->signal
             (zero-extend (signal-value btor125) (bitvector 5))
             btor125))
           (btor284
            (signal
             (bool->bitvector
              (bveq (signal-value btor53) (signal-value btor283)))
             (list)))
           (btor285
            (if (bitvector->bool (signal-value btor284)) btor44 btor282))
           (btor286
            (signal
             (concat (signal-value btor285) (signal-value btor272))
             (list)))
           (btor287
            (signal
             (bool->bitvector
              (bveq (signal-value btor286) (signal-value btor131)))
             (list)))
           (btor288
            (if (bitvector->bool (signal-value btor287)) btor271 btor270))
           (btor289
            (signal
             (concat (signal-value btor21) (signal-value btor20))
             (list)))
           (btor290
            (signal
             (concat (signal-value btor30) (signal-value btor289))
             (list)))
           (btor291
            (signal
             (concat (signal-value btor31) (signal-value btor290))
             (list)))
           (btor292
            (signal
             (concat (signal-value btor32) (signal-value btor291))
             (list)))
           (btor293
            (signal
             (concat (signal-value btor33) (signal-value btor292))
             (list)))
           (btor294
            (signal
             (concat (signal-value btor34) (signal-value btor293))
             (list)))
           (btor295
            (signal
             (concat (signal-value btor35) (signal-value btor294))
             (list)))
           (btor296
            (signal
             (concat (signal-value btor36) (signal-value btor295))
             (list)))
           (btor297
            (signal
             (concat (signal-value btor37) (signal-value btor296))
             (list)))
           (btor298
            (signal
             (concat (signal-value btor22) (signal-value btor297))
             (list)))
           (btor299
            (signal
             (concat (signal-value btor23) (signal-value btor298))
             (list)))
           (btor300
            (signal
             (concat (signal-value btor24) (signal-value btor299))
             (list)))
           (btor301
            (signal
             (concat (signal-value btor25) (signal-value btor300))
             (list)))
           (btor302
            (signal
             (concat (signal-value btor26) (signal-value btor301))
             (list)))
           (btor303
            (signal
             (concat (signal-value btor27) (signal-value btor302))
             (list)))
           (btor304
            (signal
             (concat (signal-value btor28) (signal-value btor303))
             (list)))
           (btor305
            (signal
             (concat (signal-value btor29) (signal-value btor304))
             (list)))
           (btor306
            (signal
             (concat (signal-value btor88) (signal-value btor87))
             (list)))
           (btor307
            (signal
             (concat (signal-value btor97) (signal-value btor306))
             (list)))
           (btor308
            (signal
             (concat (signal-value btor98) (signal-value btor307))
             (list)))
           (btor309
            (signal
             (concat (signal-value btor99) (signal-value btor308))
             (list)))
           (btor310
            (signal
             (concat (signal-value btor100) (signal-value btor309))
             (list)))
           (btor311
            (signal
             (concat (signal-value btor101) (signal-value btor310))
             (list)))
           (btor312
            (signal
             (concat (signal-value btor102) (signal-value btor311))
             (list)))
           (btor313
            (signal
             (concat (signal-value btor103) (signal-value btor312))
             (list)))
           (btor314
            (signal
             (concat (signal-value btor104) (signal-value btor313))
             (list)))
           (btor315
            (signal
             (concat (signal-value btor89) (signal-value btor314))
             (list)))
           (btor316
            (signal
             (concat (signal-value btor90) (signal-value btor315))
             (list)))
           (btor317
            (signal
             (concat (signal-value btor91) (signal-value btor316))
             (list)))
           (btor318
            (signal
             (concat (signal-value btor92) (signal-value btor317))
             (list)))
           (btor319
            (signal
             (concat (signal-value btor93) (signal-value btor318))
             (list)))
           (btor320
            (signal
             (concat (signal-value btor94) (signal-value btor319))
             (list)))
           (btor321
            (signal
             (concat (signal-value btor95) (signal-value btor320))
             (list)))
           (btor322
            (signal
             (concat (signal-value btor96) (signal-value btor321))
             (list)))
           (btor323
            (if (bitvector->bool (signal-value btor68)) btor322 btor305))
           (btor324
            (signal
             (apply bvor (bitvector->bits (signal-value btor53)))
             (signal-state btor53)))
           (btor325 (signal (bvnot (signal-value btor324)) (list)))
           (btor326
            (if (bitvector->bool (signal-value btor325)) btor323 btor288))
           (btor327
            (signal
             (extract 17 17 (signal-value btor326))
             (signal-state btor326)))
           (btor328
            (signal
             (extract 17 17 (signal-value btor326))
             (signal-state btor326)))
           (btor329
            (signal
             (concat (signal-value btor328) (signal-value btor327))
             (list)))
           (btor330
            (signal
             (extract 17 17 (signal-value btor326))
             (signal-state btor326)))
           (btor331
            (signal
             (concat (signal-value btor330) (signal-value btor329))
             (list)))
           (btor332
            (signal
             (extract 17 17 (signal-value btor326))
             (signal-state btor326)))
           (btor333
            (signal
             (concat (signal-value btor332) (signal-value btor331))
             (list)))
           (btor334
            (signal
             (extract 17 17 (signal-value btor326))
             (signal-state btor326)))
           (btor335
            (signal
             (concat (signal-value btor334) (signal-value btor333))
             (list)))
           (btor336
            (signal
             (extract 17 17 (signal-value btor326))
             (signal-state btor326)))
           (btor337
            (signal
             (concat (signal-value btor336) (signal-value btor335))
             (list)))
           (btor338
            (signal
             (extract 17 17 (signal-value btor326))
             (signal-state btor326)))
           (btor339
            (signal
             (concat (signal-value btor338) (signal-value btor337))
             (list)))
           (btor340
            (signal
             (extract 17 17 (signal-value btor326))
             (signal-state btor326)))
           (btor341
            (signal
             (concat (signal-value btor340) (signal-value btor339))
             (list)))
           (btor342
            (signal
             (extract 17 17 (signal-value btor326))
             (signal-state btor326)))
           (btor343
            (signal
             (concat (signal-value btor342) (signal-value btor341))
             (list)))
           (btor344
            (signal
             (extract 17 17 (signal-value btor326))
             (signal-state btor326)))
           (btor345
            (signal
             (concat (signal-value btor344) (signal-value btor343))
             (list)))
           (btor346
            (signal
             (extract 17 17 (signal-value btor326))
             (signal-state btor326)))
           (btor347
            (signal
             (concat (signal-value btor346) (signal-value btor345))
             (list)))
           (btor348
            (signal
             (extract 17 17 (signal-value btor326))
             (signal-state btor326)))
           (btor349
            (signal
             (concat (signal-value btor348) (signal-value btor347))
             (list)))
           (btor350
            (signal
             (extract 17 17 (signal-value btor326))
             (signal-state btor326)))
           (btor351
            (signal
             (concat (signal-value btor350) (signal-value btor349))
             (list)))
           (btor352
            (signal
             (extract 17 17 (signal-value btor326))
             (signal-state btor326)))
           (btor353
            (signal
             (concat (signal-value btor352) (signal-value btor351))
             (list)))
           (btor354
            (signal
             (extract 17 17 (signal-value btor326))
             (signal-state btor326)))
           (btor355
            (signal
             (concat (signal-value btor354) (signal-value btor353))
             (list)))
           (btor356
            (signal
             (extract 17 17 (signal-value btor326))
             (signal-state btor326)))
           (btor357
            (signal
             (concat (signal-value btor356) (signal-value btor355))
             (list)))
           (btor358
            (signal
             (extract 17 17 (signal-value btor326))
             (signal-state btor326)))
           (btor359
            (signal
             (concat (signal-value btor358) (signal-value btor357))
             (list)))
           (btor360
            (signal
             (extract 17 17 (signal-value btor326))
             (signal-state btor326)))
           (btor361
            (signal
             (concat (signal-value btor360) (signal-value btor359))
             (list)))
           (btor362
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state362")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state362")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state362")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state362")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor363
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state363")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state363")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state363")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state363")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor364
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state364")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state364")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state364")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state364")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor366
            (signal
             (concat (signal-value btor285) (signal-value btor364))
             (list)))
           (btor367
            (signal
             (bool->bitvector
              (bveq (signal-value btor366) (signal-value btor131)))
             (list)))
           (btor368
            (if (bitvector->bool (signal-value btor367)) btor363 btor362))
           (btor369
            (if (bitvector->bool (signal-value btor325)) btor66 btor368))
           (btor370
            (if (bitvector->bool (signal-value btor369)) btor361 btor224))
           (btor371
            (signal
             (concat (signal-value btor370) (signal-value btor326))
             (list)))
           (btor372
            (signal
             (bvmul (signal-value btor269) (signal-value btor371))
             (list)))
           (btor373
            (signal
             (apply bvor (bitvector->bits (signal-value btor269)))
             (signal-state btor269)))
           (btor374 (signal (bvnot (signal-value btor373)) (list)))
           (btor375
            (signal
             (apply bvor (bitvector->bits (signal-value btor371)))
             (signal-state btor371)))
           (btor376 (signal (bvnot (signal-value btor375)) (list)))
           (btor377
            (signal
             (bvor (signal-value btor374) (signal-value btor376))
             (list)))
           (btor378
            (if (bitvector->bool (signal-value btor377)) btor106 btor372))
           (btor379
            (signal
             (apply bvor (bitvector->bits (signal-value btor59)))
             (signal-state btor59)))
           (btor380 (signal (bvnot (signal-value btor379)) (list)))
           (btor381
            (if (bitvector->bool (signal-value btor380)) btor378 btor152))
           (btor382
            (signal
             (apply bvor (bitvector->bits (signal-value btor56)))
             (signal-state btor56)))
           (btor383 (signal (bvnot (signal-value btor382)) (list)))
           (btor384
            (if (bitvector->bool (signal-value btor383)) btor381 btor133))
           (btor385 (bv->signal (bv 5 (bitvector 3))))
           (btor386
            (bv->signal
             (zero-extend (signal-value btor385) (bitvector 5))
             btor385))
           (btor387
            (signal
             (bool->bitvector
              (bveq (signal-value btor48) (signal-value btor386)))
             (list)))
           (btor388
            (if (bitvector->bool (signal-value btor387)) btor384 btor106))
           (btor389
            (signal
             (extract 0 0 (signal-value btor388))
             (signal-state btor388)))
           (btor391
            (signal
             (extract 1 1 (signal-value btor388))
             (signal-state btor388)))
           (btor393
            (signal
             (extract 10 10 (signal-value btor388))
             (signal-state btor388)))
           (btor395
            (signal
             (extract 11 11 (signal-value btor388))
             (signal-state btor388)))
           (btor397
            (signal
             (extract 12 12 (signal-value btor388))
             (signal-state btor388)))
           (btor399
            (signal
             (extract 13 13 (signal-value btor388))
             (signal-state btor388)))
           (btor401
            (signal
             (extract 14 14 (signal-value btor388))
             (signal-state btor388)))
           (btor403
            (signal
             (extract 15 15 (signal-value btor388))
             (signal-state btor388)))
           (btor405
            (signal
             (extract 16 16 (signal-value btor388))
             (signal-state btor388)))
           (btor407
            (signal
             (extract 17 17 (signal-value btor388))
             (signal-state btor388)))
           (btor409
            (signal
             (extract 18 18 (signal-value btor388))
             (signal-state btor388)))
           (btor411
            (signal
             (extract 19 19 (signal-value btor388))
             (signal-state btor388)))
           (btor413
            (signal
             (extract 2 2 (signal-value btor388))
             (signal-state btor388)))
           (btor415
            (signal
             (extract 20 20 (signal-value btor388))
             (signal-state btor388)))
           (btor417
            (signal
             (extract 21 21 (signal-value btor388))
             (signal-state btor388)))
           (btor419
            (signal
             (extract 22 22 (signal-value btor388))
             (signal-state btor388)))
           (btor421
            (signal
             (extract 23 23 (signal-value btor388))
             (signal-state btor388)))
           (btor423
            (signal
             (extract 24 24 (signal-value btor388))
             (signal-state btor388)))
           (btor425
            (signal
             (extract 25 25 (signal-value btor388))
             (signal-state btor388)))
           (btor427
            (signal
             (extract 26 26 (signal-value btor388))
             (signal-state btor388)))
           (btor429
            (signal
             (extract 27 27 (signal-value btor388))
             (signal-state btor388)))
           (btor431
            (signal
             (extract 28 28 (signal-value btor388))
             (signal-state btor388)))
           (btor433
            (signal
             (extract 29 29 (signal-value btor388))
             (signal-state btor388)))
           (btor435
            (signal
             (extract 3 3 (signal-value btor388))
             (signal-state btor388)))
           (btor437
            (signal
             (extract 30 30 (signal-value btor388))
             (signal-state btor388)))
           (btor439
            (signal
             (extract 31 31 (signal-value btor388))
             (signal-state btor388)))
           (btor441
            (signal
             (extract 32 32 (signal-value btor388))
             (signal-state btor388)))
           (btor443
            (signal
             (extract 33 33 (signal-value btor388))
             (signal-state btor388)))
           (btor445
            (signal
             (extract 34 34 (signal-value btor388))
             (signal-state btor388)))
           (btor447
            (signal
             (extract 35 35 (signal-value btor388))
             (signal-state btor388)))
           (btor449
            (signal
             (extract 4 4 (signal-value btor388))
             (signal-state btor388)))
           (btor451
            (signal
             (extract 5 5 (signal-value btor388))
             (signal-state btor388)))
           (btor453
            (signal
             (extract 6 6 (signal-value btor388))
             (signal-state btor388)))
           (btor455
            (signal
             (extract 7 7 (signal-value btor388))
             (signal-state btor388)))
           (btor457
            (signal
             (extract 8 8 (signal-value btor388))
             (signal-state btor388)))
           (btor459
            (signal
             (extract 9 9 (signal-value btor388))
             (signal-state btor388)))
           (btor461
            (signal
             (extract 0 0 (signal-value btor223))
             (signal-state btor223)))
           (btor463
            (signal
             (extract 1 1 (signal-value btor223))
             (signal-state btor223)))
           (btor465
            (signal
             (extract 10 10 (signal-value btor223))
             (signal-state btor223)))
           (btor467
            (signal
             (extract 11 11 (signal-value btor223))
             (signal-state btor223)))
           (btor469
            (signal
             (extract 12 12 (signal-value btor223))
             (signal-state btor223)))
           (btor471
            (signal
             (extract 13 13 (signal-value btor223))
             (signal-state btor223)))
           (btor473
            (signal
             (extract 14 14 (signal-value btor223))
             (signal-state btor223)))
           (btor475
            (signal
             (extract 15 15 (signal-value btor223))
             (signal-state btor223)))
           (btor477
            (signal
             (extract 16 16 (signal-value btor223))
             (signal-state btor223)))
           (btor479
            (signal
             (extract 17 17 (signal-value btor223))
             (signal-state btor223)))
           (btor481
            (signal
             (extract 2 2 (signal-value btor223))
             (signal-state btor223)))
           (btor483
            (signal
             (extract 3 3 (signal-value btor223))
             (signal-state btor223)))
           (btor485
            (signal
             (extract 4 4 (signal-value btor223))
             (signal-state btor223)))
           (btor487
            (signal
             (extract 5 5 (signal-value btor223))
             (signal-state btor223)))
           (btor489
            (signal
             (extract 6 6 (signal-value btor223))
             (signal-state btor223)))
           (btor491
            (signal
             (extract 7 7 (signal-value btor223))
             (signal-state btor223)))
           (btor493
            (signal
             (extract 8 8 (signal-value btor223))
             (signal-state btor223)))
           (btor495
            (signal
             (extract 9 9 (signal-value btor223))
             (signal-state btor223)))
           (btor497
            (signal
             (extract 0 0 (signal-value btor326))
             (signal-state btor326)))
           (btor499
            (signal
             (extract 1 1 (signal-value btor326))
             (signal-state btor326)))
           (btor501
            (signal
             (extract 10 10 (signal-value btor326))
             (signal-state btor326)))
           (btor503
            (signal
             (extract 11 11 (signal-value btor326))
             (signal-state btor326)))
           (btor505
            (signal
             (extract 12 12 (signal-value btor326))
             (signal-state btor326)))
           (btor507
            (signal
             (extract 13 13 (signal-value btor326))
             (signal-state btor326)))
           (btor509
            (signal
             (extract 14 14 (signal-value btor326))
             (signal-state btor326)))
           (btor511
            (signal
             (extract 15 15 (signal-value btor326))
             (signal-state btor326)))
           (btor513
            (signal
             (extract 16 16 (signal-value btor326))
             (signal-state btor326)))
           (btor515
            (signal
             (extract 17 17 (signal-value btor326))
             (signal-state btor326)))
           (btor517
            (signal
             (extract 2 2 (signal-value btor326))
             (signal-state btor326)))
           (btor519
            (signal
             (extract 3 3 (signal-value btor326))
             (signal-state btor326)))
           (btor521
            (signal
             (extract 4 4 (signal-value btor326))
             (signal-state btor326)))
           (btor523
            (signal
             (extract 5 5 (signal-value btor326))
             (signal-state btor326)))
           (btor525
            (signal
             (extract 6 6 (signal-value btor326))
             (signal-state btor326)))
           (btor527
            (signal
             (extract 7 7 (signal-value btor326))
             (signal-state btor326)))
           (btor529
            (signal
             (extract 8 8 (signal-value btor326))
             (signal-state btor326)))
           (btor531
            (signal
             (extract 9 9 (signal-value btor326))
             (signal-state btor326)))
           (btor533
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state533")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state533")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state533")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state533")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor534
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state534")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state534")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state534")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state534")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor535
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state535")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state535")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state535")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state535")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor537
            (signal
             (concat (signal-value btor149) (signal-value btor535))
             (list)))
           (btor538
            (signal
             (bool->bitvector
              (bveq (signal-value btor537) (signal-value btor131)))
             (list)))
           (btor539
            (if (bitvector->bool (signal-value btor538)) btor534 btor533))
           (btor540
            (signal
             (bvor (signal-value btor267) (signal-value btor369))
             (list)))
           (btor541
            (if (bitvector->bool (signal-value btor380)) btor540 btor539))
           (btor543
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state543")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state543")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state543")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state543")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor544
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state544")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state544")))))
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
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor545
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state545")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state545")))))
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
            (signal
             (concat (signal-value btor169) (signal-value btor545))
             (list)))
           (btor548
            (signal
             (bool->bitvector
              (bveq (signal-value btor547) (signal-value btor131)))
             (list)))
           (btor549
            (if (bitvector->bool (signal-value btor548)) btor544 btor543))
           (btor550
            (if (bitvector->bool (signal-value btor222)) btor223 btor549))
           (btor551 (bv->signal (bv 22 (bitvector 5))))
           (btor552
            (signal
             (bool->bitvector
              (bveq (signal-value btor39) (signal-value btor551)))
             (list)))
           (btor553
            (if (bitvector->bool (signal-value btor552)) btor550 btor223))
           (btor554 (bv->signal (bv 4 (bitvector 3))))
           (btor555
            (bv->signal
             (zero-extend (signal-value btor554) (bitvector 5))
             btor554))
           (btor556
            (signal
             (bool->bitvector
              (bveq (signal-value btor39) (signal-value btor555)))
             (list)))
           (btor557
            (if (bitvector->bool (signal-value btor556)) btor223 btor553))
           (btor558
            (signal
             (extract 0 0 (signal-value btor557))
             (signal-state btor557)))
           (btor560
            (signal
             (extract 1 1 (signal-value btor557))
             (signal-state btor557)))
           (btor562
            (signal
             (extract 10 10 (signal-value btor557))
             (signal-state btor557)))
           (btor564
            (signal
             (extract 11 11 (signal-value btor557))
             (signal-state btor557)))
           (btor566
            (signal
             (extract 12 12 (signal-value btor557))
             (signal-state btor557)))
           (btor568
            (signal
             (extract 13 13 (signal-value btor557))
             (signal-state btor557)))
           (btor570
            (signal
             (extract 14 14 (signal-value btor557))
             (signal-state btor557)))
           (btor572
            (signal
             (extract 15 15 (signal-value btor557))
             (signal-state btor557)))
           (btor574
            (signal
             (extract 16 16 (signal-value btor557))
             (signal-state btor557)))
           (btor576
            (signal
             (extract 17 17 (signal-value btor557))
             (signal-state btor557)))
           (btor578
            (signal
             (extract 2 2 (signal-value btor557))
             (signal-state btor557)))
           (btor580
            (signal
             (extract 3 3 (signal-value btor557))
             (signal-state btor557)))
           (btor582
            (signal
             (extract 4 4 (signal-value btor557))
             (signal-state btor557)))
           (btor584
            (signal
             (extract 5 5 (signal-value btor557))
             (signal-state btor557)))
           (btor586
            (signal
             (extract 6 6 (signal-value btor557))
             (signal-state btor557)))
           (btor588
            (signal
             (extract 7 7 (signal-value btor557))
             (signal-state btor557)))
           (btor590
            (signal
             (extract 8 8 (signal-value btor557))
             (signal-state btor557)))
           (btor592
            (signal
             (extract 9 9 (signal-value btor557))
             (signal-state btor557)))
           (btor612
            (bv->signal
             (zero-extend (signal-value btor40) (bitvector 1))
             btor40))
           (btor613
            (bv->signal
             (zero-extend (signal-value btor41) (bitvector 1))
             btor41))
           (btor614
            (bv->signal
             (zero-extend (signal-value btor42) (bitvector 1))
             btor42))
           (btor615
            (bv->signal
             (zero-extend (signal-value btor43) (bitvector 1))
             btor43))
           (btor616
            (bv->signal
             (zero-extend (signal-value btor44) (bitvector 1))
             btor44))
           (btor617
            (bv->signal
             (zero-extend (signal-value btor45) (bitvector 1))
             btor45))
           (btor618
            (bv->signal
             (zero-extend (signal-value btor46) (bitvector 1))
             btor46))
           (btor619
            (bv->signal
             (zero-extend (signal-value btor47) (bitvector 1))
             btor47))
           (btor620
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 1))
             btor61))
           (btor621
            (bv->signal
             (zero-extend (signal-value btor62) (bitvector 1))
             btor62))
           (btor622
            (bv->signal
             (zero-extend (signal-value btor63) (bitvector 1))
             btor63))
           (btor623
            (bv->signal
             (zero-extend (signal-value btor64) (bitvector 1))
             btor64))
           (btor624
            (bv->signal
             (zero-extend (signal-value btor202) (bitvector 18))
             btor202))
           (btor625
            (bv->signal
             (zero-extend (signal-value btor223) (bitvector 18))
             btor223))
           (btor626
            (bv->signal
             (zero-extend (signal-value btor549) (bitvector 18))
             btor549))
           (btor627
            (bv->signal
             (zero-extend (signal-value btor549) (bitvector 18))
             btor549))
           (btor628
            (bv->signal
             (zero-extend (signal-value btor550) (bitvector 18))
             btor550))
           (btor629
            (bv->signal
             (zero-extend (signal-value btor557) (bitvector 18))
             btor557))
           (btor630
            (bv->signal
             (zero-extend (signal-value btor269) (bitvector 36))
             btor269))
           (btor631
            (bv->signal
             (zero-extend (signal-value btor172) (bitvector 18))
             btor172))
           (btor632
            (bv->signal
             (zero-extend (signal-value btor172) (bitvector 18))
             btor172))
           (btor633
            (bv->signal
             (zero-extend (signal-value btor219) (bitvector 18))
             btor219))
           (btor634
            (bv->signal
             (zero-extend (signal-value btor220) (bitvector 18))
             btor220))
           (btor635
            (bv->signal
             (zero-extend (signal-value btor305) (bitvector 18))
             btor305))
           (btor636
            (bv->signal
             (zero-extend (signal-value btor326) (bitvector 18))
             btor326))
           (btor637
            (bv->signal
             (zero-extend (signal-value btor371) (bitvector 36))
             btor371))
           (btor638
            (bv->signal
             (zero-extend (signal-value btor288) (bitvector 18))
             btor288))
           (btor639
            (bv->signal
             (zero-extend (signal-value btor288) (bitvector 18))
             btor288))
           (btor640
            (bv->signal
             (zero-extend (signal-value btor322) (bitvector 18))
             btor322))
           (btor641
            (bv->signal
             (zero-extend (signal-value btor323) (bitvector 18))
             btor323))
           (btor642 (bv->signal (bv 17 (bitvector 5))))
           (btor643
            (signal
             (bool->bitvector
              (bveq (signal-value btor49) (signal-value btor642)))
             (list)))
           (btor644
            (if (bitvector->bool (signal-value btor643)) btor43 btor40))
           (btor645 (bv->signal (bv 16 (bitvector 5))))
           (btor646
            (signal
             (bool->bitvector
              (bveq (signal-value btor49) (signal-value btor645)))
             (list)))
           (btor647
            (if (bitvector->bool (signal-value btor646)) btor42 btor644))
           (btor648 (bv->signal (bv 15 (bitvector 4))))
           (btor649
            (bv->signal
             (zero-extend (signal-value btor648) (bitvector 5))
             btor648))
           (btor650
            (signal
             (bool->bitvector
              (bveq (signal-value btor49) (signal-value btor649)))
             (list)))
           (btor651
            (if (bitvector->bool (signal-value btor650)) btor41 btor647))
           (btor652
            (bv->signal
             (zero-extend (signal-value btor109) (bitvector 5))
             btor109))
           (btor653
            (signal
             (bool->bitvector
              (bveq (signal-value btor49) (signal-value btor652)))
             (list)))
           (btor654
            (if (bitvector->bool (signal-value btor653)) btor40 btor651))
           (btor655
            (bv->signal
             (zero-extend (signal-value btor654) (bitvector 1))
             btor654))
           (btor656
            (bv->signal
             (zero-extend (signal-value btor169) (bitvector 1))
             btor169))
           (btor657 (bv->signal (bv 20 (bitvector 5))))
           (btor658
            (signal
             (bool->bitvector
              (bveq (signal-value btor51) (signal-value btor657)))
             (list)))
           (btor659
            (if (bitvector->bool (signal-value btor658)) btor64 btor61))
           (btor660 (bv->signal (bv 19 (bitvector 5))))
           (btor661
            (signal
             (bool->bitvector
              (bveq (signal-value btor51) (signal-value btor660)))
             (list)))
           (btor662
            (if (bitvector->bool (signal-value btor661)) btor63 btor659))
           (btor663 (bv->signal (bv 18 (bitvector 5))))
           (btor664
            (signal
             (bool->bitvector
              (bveq (signal-value btor51) (signal-value btor663)))
             (list)))
           (btor665
            (if (bitvector->bool (signal-value btor664)) btor62 btor662))
           (btor666
            (bv->signal
             (zero-extend (signal-value btor131) (bitvector 5))
             btor131))
           (btor667
            (signal
             (bool->bitvector
              (bveq (signal-value btor51) (signal-value btor666)))
             (list)))
           (btor668
            (if (bitvector->bool (signal-value btor667)) btor61 btor665))
           (btor669
            (bv->signal
             (zero-extend (signal-value btor668) (bitvector 1))
             btor668))
           (btor670
            (bv->signal
             (zero-extend (signal-value btor668) (bitvector 1))
             btor668))
           (btor671
            (signal
             (bool->bitvector
              (bveq (signal-value btor52) (signal-value btor642)))
             (list)))
           (btor672
            (if (bitvector->bool (signal-value btor671)) btor43 btor40))
           (btor673
            (signal
             (bool->bitvector
              (bveq (signal-value btor52) (signal-value btor645)))
             (list)))
           (btor674
            (if (bitvector->bool (signal-value btor673)) btor42 btor672))
           (btor675
            (bv->signal
             (zero-extend (signal-value btor648) (bitvector 5))
             btor648))
           (btor676
            (signal
             (bool->bitvector
              (bveq (signal-value btor52) (signal-value btor675)))
             (list)))
           (btor677
            (if (bitvector->bool (signal-value btor676)) btor41 btor674))
           (btor678
            (bv->signal
             (zero-extend (signal-value btor109) (bitvector 5))
             btor109))
           (btor679
            (signal
             (bool->bitvector
              (bveq (signal-value btor52) (signal-value btor678)))
             (list)))
           (btor680
            (if (bitvector->bool (signal-value btor679)) btor40 btor677))
           (btor681
            (bv->signal
             (zero-extend (signal-value btor680) (bitvector 1))
             btor680))
           (btor682
            (bv->signal
             (zero-extend (signal-value btor285) (bitvector 1))
             btor285))
           (btor683
            (signal
             (bool->bitvector
              (bveq (signal-value btor54) (signal-value btor657)))
             (list)))
           (btor684
            (if (bitvector->bool (signal-value btor683)) btor64 btor61))
           (btor685
            (signal
             (bool->bitvector
              (bveq (signal-value btor54) (signal-value btor660)))
             (list)))
           (btor686
            (if (bitvector->bool (signal-value btor685)) btor63 btor684))
           (btor687
            (signal
             (bool->bitvector
              (bveq (signal-value btor54) (signal-value btor663)))
             (list)))
           (btor688
            (if (bitvector->bool (signal-value btor687)) btor62 btor686))
           (btor689
            (bv->signal
             (zero-extend (signal-value btor131) (bitvector 5))
             btor131))
           (btor690
            (signal
             (bool->bitvector
              (bveq (signal-value btor54) (signal-value btor689)))
             (list)))
           (btor691
            (if (bitvector->bool (signal-value btor690)) btor61 btor688))
           (btor692
            (bv->signal
             (zero-extend (signal-value btor691) (bitvector 1))
             btor691))
           (btor693
            (bv->signal
             (zero-extend (signal-value btor691) (bitvector 1))
             btor691))
           (btor694
            (signal
             (bool->bitvector
              (bveq (signal-value btor55) (signal-value btor642)))
             (list)))
           (btor695
            (if (bitvector->bool (signal-value btor694)) btor43 btor40))
           (btor696
            (signal
             (bool->bitvector
              (bveq (signal-value btor55) (signal-value btor645)))
             (list)))
           (btor697
            (if (bitvector->bool (signal-value btor696)) btor42 btor695))
           (btor698
            (bv->signal
             (zero-extend (signal-value btor648) (bitvector 5))
             btor648))
           (btor699
            (signal
             (bool->bitvector
              (bveq (signal-value btor55) (signal-value btor698)))
             (list)))
           (btor700
            (if (bitvector->bool (signal-value btor699)) btor41 btor697))
           (btor701
            (bv->signal
             (zero-extend (signal-value btor109) (bitvector 5))
             btor109))
           (btor702
            (signal
             (bool->bitvector
              (bveq (signal-value btor55) (signal-value btor701)))
             (list)))
           (btor703
            (if (bitvector->bool (signal-value btor702)) btor40 btor700))
           (btor704
            (bv->signal
             (zero-extend (signal-value btor703) (bitvector 1))
             btor703))
           (btor705
            (bv->signal
             (zero-extend (signal-value btor128) (bitvector 1))
             btor128))
           (btor706
            (signal
             (bool->bitvector
              (bveq (signal-value btor57) (signal-value btor657)))
             (list)))
           (btor707
            (if (bitvector->bool (signal-value btor706)) btor64 btor61))
           (btor708
            (signal
             (bool->bitvector
              (bveq (signal-value btor57) (signal-value btor660)))
             (list)))
           (btor709
            (if (bitvector->bool (signal-value btor708)) btor63 btor707))
           (btor710
            (signal
             (bool->bitvector
              (bveq (signal-value btor57) (signal-value btor663)))
             (list)))
           (btor711
            (if (bitvector->bool (signal-value btor710)) btor62 btor709))
           (btor712
            (bv->signal
             (zero-extend (signal-value btor131) (bitvector 5))
             btor131))
           (btor713
            (signal
             (bool->bitvector
              (bveq (signal-value btor57) (signal-value btor712)))
             (list)))
           (btor714
            (if (bitvector->bool (signal-value btor713)) btor61 btor711))
           (btor715
            (bv->signal
             (zero-extend (signal-value btor714) (bitvector 1))
             btor714))
           (btor716
            (bv->signal
             (zero-extend (signal-value btor714) (bitvector 1))
             btor714))
           (btor717
            (bv->signal
             (zero-extend (signal-value btor388) (bitvector 36))
             btor388))
           (btor718
            (bv->signal
             (zero-extend (signal-value btor378) (bitvector 36))
             btor378))
           (btor719
            (bv->signal
             (zero-extend (signal-value btor152) (bitvector 36))
             btor152))
           (btor720
            (bv->signal
             (zero-extend (signal-value btor133) (bitvector 36))
             btor133))
           (btor721
            (bv->signal
             (zero-extend (signal-value btor133) (bitvector 36))
             btor133))
           (btor722
            (bv->signal
             (zero-extend (signal-value btor152) (bitvector 36))
             btor152))
           (btor723
            (bv->signal
             (zero-extend (signal-value btor384) (bitvector 36))
             btor384))
           (btor724
            (bv->signal
             (zero-extend (signal-value btor381) (bitvector 36))
             btor381))
           (btor725
            (signal
             (bool->bitvector
              (bveq (signal-value btor58) (signal-value btor642)))
             (list)))
           (btor726
            (if (bitvector->bool (signal-value btor725)) btor43 btor40))
           (btor727
            (signal
             (bool->bitvector
              (bveq (signal-value btor58) (signal-value btor645)))
             (list)))
           (btor728
            (if (bitvector->bool (signal-value btor727)) btor42 btor726))
           (btor729
            (bv->signal
             (zero-extend (signal-value btor648) (bitvector 5))
             btor648))
           (btor730
            (signal
             (bool->bitvector
              (bveq (signal-value btor58) (signal-value btor729)))
             (list)))
           (btor731
            (if (bitvector->bool (signal-value btor730)) btor41 btor728))
           (btor732
            (bv->signal
             (zero-extend (signal-value btor109) (bitvector 5))
             btor109))
           (btor733
            (signal
             (bool->bitvector
              (bveq (signal-value btor58) (signal-value btor732)))
             (list)))
           (btor734
            (if (bitvector->bool (signal-value btor733)) btor40 btor731))
           (btor735
            (bv->signal
             (zero-extend (signal-value btor734) (bitvector 1))
             btor734))
           (btor736
            (bv->signal
             (zero-extend (signal-value btor149) (bitvector 1))
             btor149))
           (btor737
            (signal
             (bool->bitvector
              (bveq (signal-value btor60) (signal-value btor657)))
             (list)))
           (btor738
            (if (bitvector->bool (signal-value btor737)) btor64 btor61))
           (btor739
            (signal
             (bool->bitvector
              (bveq (signal-value btor60) (signal-value btor660)))
             (list)))
           (btor740
            (if (bitvector->bool (signal-value btor739)) btor63 btor738))
           (btor741
            (signal
             (bool->bitvector
              (bveq (signal-value btor60) (signal-value btor663)))
             (list)))
           (btor742
            (if (bitvector->bool (signal-value btor741)) btor62 btor740))
           (btor743
            (bv->signal
             (zero-extend (signal-value btor131) (bitvector 5))
             btor131))
           (btor744
            (signal
             (bool->bitvector
              (bveq (signal-value btor60) (signal-value btor743)))
             (list)))
           (btor745
            (if (bitvector->bool (signal-value btor744)) btor61 btor742))
           (btor746
            (bv->signal
             (zero-extend (signal-value btor745) (bitvector 1))
             btor745))
           (btor747
            (bv->signal
             (zero-extend (signal-value btor745) (bitvector 1))
             btor745))
           (btor748
            (bv->signal
             (zero-extend (signal-value btor223) (bitvector 18))
             btor223))
           (btor749
            (bv->signal
             (zero-extend (signal-value btor267) (bitvector 1))
             btor267))
           (btor750
            (bv->signal
             (zero-extend (signal-value btor266) (bitvector 1))
             btor266))
           (btor751
            (bv->signal
             (zero-extend (signal-value btor266) (bitvector 1))
             btor266))
           (btor752
            (bv->signal
             (zero-extend (signal-value btor65) (bitvector 1))
             btor65))
           (btor753
            (bv->signal
             (zero-extend (signal-value btor539) (bitvector 1))
             btor539))
           (btor754
            (bv->signal
             (zero-extend (signal-value btor540) (bitvector 1))
             btor540))
           (btor755
            (bv->signal
             (zero-extend (signal-value btor539) (bitvector 1))
             btor539))
           (btor756
            (bv->signal
             (zero-extend (signal-value btor369) (bitvector 1))
             btor369))
           (btor757
            (bv->signal
             (zero-extend (signal-value btor368) (bitvector 1))
             btor368))
           (btor758
            (bv->signal
             (zero-extend (signal-value btor368) (bitvector 1))
             btor368))
           (btor759
            (bv->signal
             (zero-extend (signal-value btor66) (bitvector 1))
             btor66))
           (btor760
            (bv->signal
             (zero-extend (signal-value btor541) (bitvector 1))
             btor541))
           (btor761
            (bv->signal
             (zero-extend (signal-value btor67) (bitvector 1))
             btor67))
           (btor762
            (bv->signal
             (zero-extend (signal-value btor68) (bitvector 1))
             btor68))
           (btor763
            (bv->signal
             (zero-extend (signal-value btor557) (bitvector 18))
             btor557))
           (btor764
            (bv->signal
             (zero-extend (signal-value btor326) (bitvector 18))
             btor326))
           (btor766
            (if (bitvector->bool (signal-value btor703)) btor381 btor133))
           (btor767
            (if (bitvector->bool (signal-value btor714)) btor106 btor766))
           (btor771
            (if (bitvector->bool (signal-value btor734)) btor378 btor152))
           (btor772
            (if (bitvector->bool (signal-value btor745)) btor106 btor771))
           (btor776
            (if (bitvector->bool (signal-value btor654)) btor220 btor172))
           (btor777
            (if (bitvector->bool (signal-value btor668)) btor224 btor776))
           (btor781
            (if (bitvector->bool (signal-value btor654)) btor65 btor266))
           (btor782 (bv->signal (bv 0 (bitvector 1))))
           (btor783
            (if (bitvector->bool (signal-value btor668)) btor782 btor781))
           (btor787
            (if (bitvector->bool (signal-value btor680)) btor323 btor288))
           (btor788
            (if (bitvector->bool (signal-value btor691)) btor224 btor787))
           (btor792
            (if (bitvector->bool (signal-value btor680)) btor66 btor368))
           (btor793
            (if (bitvector->bool (signal-value btor691)) btor782 btor792))
           (btor797
            (if (bitvector->bool (signal-value btor734)) btor540 btor539))
           (btor798
            (if (bitvector->bool (signal-value btor745)) btor782 btor797))
           (btor802
            (if (bitvector->bool (signal-value btor654)) btor223 btor549))
           (btor803
            (if (bitvector->bool (signal-value btor668)) btor224 btor802))
           (output-state
            (remove-duplicates
             (append
              (append
               (list
                (cons
                 (string->symbol (string-append name "state545"))
                 (signal-value btor169)))
               (append
                (list
                 (cons
                  (string->symbol (string-append name "state544"))
                  (signal-value btor803)))
                (append
                 (list
                  (cons
                   (string->symbol (string-append name "state543"))
                   (signal-value btor549)))
                 (append
                  (list
                   (cons
                    (string->symbol (string-append name "state535"))
                    (signal-value btor149)))
                  (append
                   (list
                    (cons
                     (string->symbol (string-append name "state534"))
                     (signal-value btor798)))
                   (append
                    (list
                     (cons
                      (string->symbol (string-append name "state533"))
                      (signal-value btor539)))
                    (append
                     (list
                      (cons
                       (string->symbol (string-append name "state364"))
                       (signal-value btor285)))
                     (append
                      (list
                       (cons
                        (string->symbol (string-append name "state363"))
                        (signal-value btor793)))
                      (append
                       (list
                        (cons
                         (string->symbol (string-append name "state362"))
                         (signal-value btor368)))
                       (append
                        (list
                         (cons
                          (string->symbol (string-append name "state272"))
                          (signal-value btor285)))
                        (append
                         (list
                          (cons
                           (string->symbol (string-append name "state271"))
                           (signal-value btor788)))
                         (append
                          (list
                           (cons
                            (string->symbol (string-append name "state270"))
                            (signal-value btor288)))
                          (append
                           (list
                            (cons
                             (string->symbol (string-append name "state262"))
                             (signal-value btor169)))
                           (append
                            (list
                             (cons
                              (string->symbol (string-append name "state261"))
                              (signal-value btor783)))
                            (append
                             (list
                              (cons
                               (string->symbol (string-append name "state260"))
                               (signal-value btor266)))
                             (append
                              (list
                               (cons
                                (string->symbol
                                 (string-append name "state156"))
                                (signal-value btor169)))
                              (append
                               (list
                                (cons
                                 (string->symbol
                                  (string-append name "state155"))
                                 (signal-value btor777)))
                               (append
                                (list
                                 (cons
                                  (string->symbol
                                   (string-append name "state154"))
                                  (signal-value btor172)))
                                (append
                                 (list
                                  (cons
                                   (string->symbol
                                    (string-append name "state136"))
                                   (signal-value btor149)))
                                 (append
                                  (list
                                   (cons
                                    (string->symbol
                                     (string-append name "state135"))
                                    (signal-value btor772)))
                                  (append
                                   (list
                                    (cons
                                     (string->symbol
                                      (string-append name "state134"))
                                     (signal-value btor152)))
                                   (append
                                    (list
                                     (cons
                                      (string->symbol
                                       (string-append name "state110"))
                                      (signal-value btor128)))
                                    (append
                                     (list
                                      (cons
                                       (string->symbol
                                        (string-append name "state108"))
                                       (signal-value btor767)))
                                     (append
                                      (list
                                       (cons
                                        (string->symbol
                                         (string-append name "state107"))
                                        (signal-value btor133)))
                                      (list)))))))))))))))))))))))))
              merged-input-state-hash)
             equal?
             #:key
             car)))
      (list
       (cons 'SROB0 (signal (signal-value btor497) output-state))
       (cons 'SROB15 (signal (signal-value btor511) output-state))
       (cons 'P31 (signal (signal-value btor439) output-state))
       (cons 'ROA0 (signal (signal-value btor461) output-state))
       (cons 'SROA8 (signal (signal-value btor590) output-state))
       (cons 'SROA9 (signal (signal-value btor592) output-state))
       (cons 'P30 (signal (signal-value btor437) output-state))
       (cons 'P18 (signal (signal-value btor409) output-state))
       (cons 'ROB2 (signal (signal-value btor517) output-state))
       (cons 'P0 (signal (signal-value btor389) output-state))
       (cons 'ROA17 (signal (signal-value btor479) output-state))
       (cons 'SROA14 (signal (signal-value btor570) output-state))
       (cons 'SROA7 (signal (signal-value btor588) output-state))
       (cons 'SROB9 (signal (signal-value btor531) output-state))
       (cons 'SROA15 (signal (signal-value btor572) output-state))
       (cons 'ROB11 (signal (signal-value btor503) output-state))
       (cons 'ROA1 (signal (signal-value btor463) output-state))
       (cons 'SROB14 (signal (signal-value btor509) output-state))
       (cons 'P1 (signal (signal-value btor391) output-state))
       (cons 'P19 (signal (signal-value btor411) output-state))
       (cons 'ROB3 (signal (signal-value btor519) output-state))
       (cons 'P2 (signal (signal-value btor413) output-state))
       (cons 'ROA15 (signal (signal-value btor475) output-state))
       (cons 'SROA12 (signal (signal-value btor566) output-state))
       (cons 'ROB4 (signal (signal-value btor521) output-state))
       (cons 'ROA9 (signal (signal-value btor495) output-state))
       (cons 'ROA2 (signal (signal-value btor481) output-state))
       (cons 'P28 (signal (signal-value btor431) output-state))
       (cons 'P11 (signal (signal-value btor395) output-state))
       (cons 'ROB12 (signal (signal-value btor505) output-state))
       (cons 'P27 (signal (signal-value btor429) output-state))
       (cons 'P8 (signal (signal-value btor457) output-state))
       (cons 'SROB13 (signal (signal-value btor507) output-state))
       (cons 'SROB8 (signal (signal-value btor529) output-state))
       (cons 'P21 (signal (signal-value btor417) output-state))
       (cons 'SROB2 (signal (signal-value btor517) output-state))
       (cons 'ROA8 (signal (signal-value btor493) output-state))
       (cons 'SROA0 (signal (signal-value btor558) output-state))
       (cons 'SROA6 (signal (signal-value btor586) output-state))
       (cons 'SROB12 (signal (signal-value btor505) output-state))
       (cons 'P29 (signal (signal-value btor433) output-state))
       (cons 'SROA13 (signal (signal-value btor568) output-state))
       (cons 'P10 (signal (signal-value btor393) output-state))
       (cons 'ROB13 (signal (signal-value btor507) output-state))
       (cons 'P26 (signal (signal-value btor427) output-state))
       (cons 'P9 (signal (signal-value btor459) output-state))
       (cons 'ROA10 (signal (signal-value btor465) output-state))
       (cons 'ROA3 (signal (signal-value btor483) output-state))
       (cons 'ROB5 (signal (signal-value btor523) output-state))
       (cons 'P3 (signal (signal-value btor435) output-state))
       (cons 'ROA16 (signal (signal-value btor477) output-state))
       (cons 'P17 (signal (signal-value btor407) output-state))
       (cons 'SROA5 (signal (signal-value btor584) output-state))
       (cons 'P16 (signal (signal-value btor405) output-state))
       (cons 'SROB7 (signal (signal-value btor527) output-state))
       (cons 'P20 (signal (signal-value btor415) output-state))
       (cons 'SROB1 (signal (signal-value btor499) output-state))
       (cons 'ROB9 (signal (signal-value btor531) output-state))
       (cons 'SROB5 (signal (signal-value btor523) output-state))
       (cons 'SROA3 (signal (signal-value btor580) output-state))
       (cons 'P34 (signal (signal-value btor445) output-state))
       (cons 'P14 (signal (signal-value btor401) output-state))
       (cons 'P22 (signal (signal-value btor419) output-state))
       (cons 'ROA7 (signal (signal-value btor491) output-state))
       (cons 'SIGNEDP (signal (signal-value btor541) output-state))
       (cons 'P7 (signal (signal-value btor455) output-state))
       (cons 'SROA11 (signal (signal-value btor564) output-state))
       (cons 'ROB15 (signal (signal-value btor511) output-state))
       (cons 'SROA17 (signal (signal-value btor576) output-state))
       (cons 'ROA14 (signal (signal-value btor473) output-state))
       (cons 'ROA6 (signal (signal-value btor489) output-state))
       (cons 'SROA4 (signal (signal-value btor582) output-state))
       (cons 'P15 (signal (signal-value btor403) output-state))
       (cons 'P23 (signal (signal-value btor421) output-state))
       (cons 'SROA16 (signal (signal-value btor574) output-state))
       (cons 'ROB8 (signal (signal-value btor529) output-state))
       (cons 'P35 (signal (signal-value btor447) output-state))
       (cons 'SROB6 (signal (signal-value btor525) output-state))
       (cons 'ROA13 (signal (signal-value btor471) output-state))
       (cons 'SROA10 (signal (signal-value btor562) output-state))
       (cons 'P6 (signal (signal-value btor453) output-state))
       (cons 'ROB14 (signal (signal-value btor509) output-state))
       (cons 'SROA1 (signal (signal-value btor560) output-state))
       (cons 'ROB17 (signal (signal-value btor515) output-state))
       (cons 'P12 (signal (signal-value btor397) output-state))
       (cons 'ROB1 (signal (signal-value btor499) output-state))
       (cons 'SROB3 (signal (signal-value btor519) output-state))
       (cons 'P24 (signal (signal-value btor423) output-state))
       (cons 'ROA12 (signal (signal-value btor469) output-state))
       (cons 'ROB7 (signal (signal-value btor527) output-state))
       (cons 'SROB16 (signal (signal-value btor513) output-state))
       (cons 'P32 (signal (signal-value btor441) output-state))
       (cons 'ROA5 (signal (signal-value btor487) output-state))
       (cons 'SROB10 (signal (signal-value btor501) output-state))
       (cons 'P5 (signal (signal-value btor451) output-state))
       (cons 'ROB16 (signal (signal-value btor513) output-state))
       (cons 'ROB10 (signal (signal-value btor501) output-state))
       (cons 'P4 (signal (signal-value btor449) output-state))
       (cons 'SROB17 (signal (signal-value btor515) output-state))
       (cons 'SROA2 (signal (signal-value btor578) output-state))
       (cons 'P33 (signal (signal-value btor443) output-state))
       (cons 'P13 (signal (signal-value btor399) output-state))
       (cons 'SROB4 (signal (signal-value btor521) output-state))
       (cons 'P25 (signal (signal-value btor425) output-state))
       (cons 'ROA11 (signal (signal-value btor467) output-state))
       (cons 'SROB11 (signal (signal-value btor503) output-state))
       (cons 'ROB0 (signal (signal-value btor497) output-state))
       (cons 'ROA4 (signal (signal-value btor485) output-state))
       (cons 'ROB6 (signal (signal-value btor525) output-state))))))

