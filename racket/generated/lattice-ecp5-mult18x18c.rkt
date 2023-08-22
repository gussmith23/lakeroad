#lang racket/base
(provide lattice-ecp5-mult18x18c)
(require "../signal.rkt")
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
               (string->symbol (string-append name "state543"))
               (bv 0 (bitvector 18))))
             (append
              (list
               (cons
                (string->symbol (string-append name "state536"))
                (bv 0 (bitvector 1))))
              (append
               (list
                (cons
                 (string->symbol (string-append name "state368"))
                 (bv 0 (bitvector 1))))
               (append
                (list
                 (cons
                  (string->symbol (string-append name "state288"))
                  (bv 1 (bitvector 1))))
                (append
                 (list
                  (cons
                   (string->symbol (string-append name "state274"))
                   (bv 0 (bitvector 18))))
                 (append
                  (list
                   (cons
                    (string->symbol (string-append name "state267"))
                    (bv 0 (bitvector 1))))
                  (append
                   (list
                    (cons
                     (string->symbol (string-append name "state173"))
                     (bv 1 (bitvector 1))))
                   (append
                    (list
                     (cons
                      (string->symbol (string-append name "state159"))
                      (bv 0 (bitvector 18))))
                    (append
                     (list
                      (cons
                       (string->symbol (string-append name "state150"))
                       (bv 1 (bitvector 1))))
                     (append
                      (list
                       (cons
                        (string->symbol (string-append name "state136"))
                        (bv 0 (bitvector 36))))
                      (append
                       (list
                        (cons
                         (string->symbol (string-append name "state128"))
                         (bv 1 (bitvector 1))))
                       (append
                        (list
                         (cons
                          (string->symbol (string-append name "state108"))
                          (bv 0 (bitvector 36))))
                        (list))))))))))))))
           (btor1 (bitvector 1))
           (btor2 A0)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state A0)))
           (btor3 A1)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state A1)))
           (btor4 A10)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state A10)))
           (btor5 A11)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state A11)))
           (btor6 A12)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state A12)))
           (btor7 A13)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state A13)))
           (btor8 A14)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state A14)))
           (btor9 A15)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state A15)))
           (btor10 A16)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state A16)))
           (btor11 A17)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state A17)))
           (btor12 A2)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state A2)))
           (btor13 A3)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state A3)))
           (btor14 A4)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state A4)))
           (btor15 A5)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state A5)))
           (btor16 A6)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state A6)))
           (btor17 A7)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state A7)))
           (btor18 A8)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state A8)))
           (btor19 A9)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state A9)))
           (btor20 B0)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state B0)))
           (btor21 B1)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state B1)))
           (btor22 B10)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state B10)))
           (btor23 B11)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state B11)))
           (btor24 B12)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state B12)))
           (btor25 B13)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state B13)))
           (btor26 B14)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state B14)))
           (btor27 B15)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state B15)))
           (btor28 B16)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state B16)))
           (btor29 B17)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state B17)))
           (btor30 B2)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state B2)))
           (btor31 B3)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state B3)))
           (btor32 B4)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state B4)))
           (btor33 B5)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state B5)))
           (btor34 B6)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state B6)))
           (btor35 B7)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state B7)))
           (btor36 B8)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state B8)))
           (btor37 B9)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state B9)))
           (btor38 (bitvector 5))
           (btor39 CAS_MATCH_REG)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state CAS_MATCH_REG)))
           (btor40 CE0)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CE0)))
           (btor41 CE1)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CE1)))
           (btor42 CE2)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CE2)))
           (btor43 CE3)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CE3)))
           (btor44 CLK0)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CLK0)))
           (btor45 CLK1)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CLK1)))
           (btor46 CLK2)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CLK2)))
           (btor47 CLK3)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CLK3)))
           (btor48 MULT_BYPASS)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MULT_BYPASS)))
           (btor49 REG_INPUTA_CE)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state REG_INPUTA_CE)))
           (btor50 REG_INPUTA_CLK)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state REG_INPUTA_CLK)))
           (btor51 REG_INPUTA_RST)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state REG_INPUTA_RST)))
           (btor52 REG_INPUTB_CE)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state REG_INPUTB_CE)))
           (btor53 REG_INPUTB_CLK)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state REG_INPUTB_CLK)))
           (btor54 REG_INPUTB_RST)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state REG_INPUTB_RST)))
           (btor55 REG_OUTPUT_CE)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state REG_OUTPUT_CE)))
           (btor56 REG_OUTPUT_CLK)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state REG_OUTPUT_CLK)))
           (btor57 REG_OUTPUT_RST)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state REG_OUTPUT_RST)))
           (btor58 REG_PIPELINE_CE)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state REG_PIPELINE_CE)))
           (btor59 REG_PIPELINE_CLK)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state REG_PIPELINE_CLK)))
           (btor60 REG_PIPELINE_RST)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state REG_PIPELINE_RST)))
           (btor61 RST0)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state RST0)))
           (btor62 RST1)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state RST1)))
           (btor63 RST2)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state RST2)))
           (btor64 RST3)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state RST3)))
           (btor65 SIGNEDA)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SIGNEDA)))
           (btor66 SIGNEDB)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SIGNEDB)))
           (btor67 SOURCEA)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SOURCEA)))
           (btor68 SOURCEB)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SOURCEB)))
           (btor69 SRIA0)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SRIA0)))
           (btor70 SRIA1)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SRIA1)))
           (btor71 SRIA10)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SRIA10)))
           (btor72 SRIA11)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SRIA11)))
           (btor73 SRIA12)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SRIA12)))
           (btor74 SRIA13)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SRIA13)))
           (btor75 SRIA14)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SRIA14)))
           (btor76 SRIA15)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SRIA15)))
           (btor77 SRIA16)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SRIA16)))
           (btor78 SRIA17)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SRIA17)))
           (btor79 SRIA2)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SRIA2)))
           (btor80 SRIA3)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SRIA3)))
           (btor81 SRIA4)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SRIA4)))
           (btor82 SRIA5)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SRIA5)))
           (btor83 SRIA6)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SRIA6)))
           (btor84 SRIA7)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SRIA7)))
           (btor85 SRIA8)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SRIA8)))
           (btor86 SRIA9)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SRIA9)))
           (btor87 SRIB0)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SRIB0)))
           (btor88 SRIB1)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SRIB1)))
           (btor89 SRIB10)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SRIB10)))
           (btor90 SRIB11)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SRIB11)))
           (btor91 SRIB12)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SRIB12)))
           (btor92 SRIB13)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SRIB13)))
           (btor93 SRIB14)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SRIB14)))
           (btor94 SRIB15)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SRIB15)))
           (btor95 SRIB16)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SRIB16)))
           (btor96 SRIB17)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SRIB17)))
           (btor97 SRIB2)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SRIB2)))
           (btor98 SRIB3)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SRIB3)))
           (btor99 SRIB4)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SRIB4)))
           (btor100 SRIB5)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SRIB5)))
           (btor101 SRIB6)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SRIB6)))
           (btor102 SRIB7)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SRIB7)))
           (btor103 SRIB8)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SRIB8)))
           (btor104 SRIB9)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SRIB9)))
           (btor105 (bitvector 36))
           (btor106 (bv->signal (bv 0 (bitvector 36))))
           (btor107
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state107")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state107"))))))
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
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state108"))))))
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
           (btor110 (bitvector 4))
           (btor111 (bv->signal (bv 14 (bitvector 4))))
           (btor112
            (bv->signal
             (zero-extend (signal-value btor111) (bitvector 5))
             btor111))
           (btor113
            (signal
             (bool->bitvector
              (bveq (signal-value btor56) (signal-value btor112)))
             (list)))
           (btor114
            (if (bitvector->bool (signal-value btor113)) btor47 btor44))
           (btor115 (bv->signal (bv 13 (bitvector 4))))
           (btor116
            (bv->signal
             (zero-extend (signal-value btor115) (bitvector 5))
             btor115))
           (btor117
            (signal
             (bool->bitvector
              (bveq (signal-value btor56) (signal-value btor116)))
             (list)))
           (btor118
            (if (bitvector->bool (signal-value btor117)) btor46 btor114))
           (btor119 (bv->signal (bv 12 (bitvector 4))))
           (btor120
            (bv->signal
             (zero-extend (signal-value btor119) (bitvector 5))
             btor119))
           (btor121
            (signal
             (bool->bitvector
              (bveq (signal-value btor56) (signal-value btor120)))
             (list)))
           (btor122
            (if (bitvector->bool (signal-value btor121)) btor45 btor118))
           (btor123 (bv->signal (bv 11 (bitvector 4))))
           (btor124
            (bv->signal
             (zero-extend (signal-value btor123) (bitvector 5))
             btor123))
           (btor125
            (signal
             (bool->bitvector
              (bveq (signal-value btor56) (signal-value btor124)))
             (list)))
           (btor126
            (if (bitvector->bool (signal-value btor125)) btor44 btor122))
           (btor127 (bv->signal (bv 1 (bitvector 1))))
           (btor128
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state128")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state128"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state128")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state128")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor130 (bitvector 2))
           (btor131
            (signal
             (concat (signal-value btor128) (signal-value btor126))
             (list)))
           (btor132
            (bv->signal
             (zero-extend (signal-value btor127) (bitvector 2))
             btor127))
           (btor133
            (signal
             (bool->bitvector
              (bveq (signal-value btor131) (signal-value btor132)))
             (list)))
           (btor134
            (if (bitvector->bool (signal-value btor133)) btor108 btor107))
           (btor135
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state135")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state135"))))))
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
                          (bv 0 36))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor138
            (bv->signal
             (zero-extend (signal-value btor111) (bitvector 5))
             btor111))
           (btor139
            (signal
             (bool->bitvector
              (bveq (signal-value btor59) (signal-value btor138)))
             (list)))
           (btor140
            (if (bitvector->bool (signal-value btor139)) btor47 btor44))
           (btor141
            (bv->signal
             (zero-extend (signal-value btor115) (bitvector 5))
             btor115))
           (btor142
            (signal
             (bool->bitvector
              (bveq (signal-value btor59) (signal-value btor141)))
             (list)))
           (btor143
            (if (bitvector->bool (signal-value btor142)) btor46 btor140))
           (btor144
            (bv->signal
             (zero-extend (signal-value btor119) (bitvector 5))
             btor119))
           (btor145
            (signal
             (bool->bitvector
              (bveq (signal-value btor59) (signal-value btor144)))
             (list)))
           (btor146
            (if (bitvector->bool (signal-value btor145)) btor45 btor143))
           (btor147
            (bv->signal
             (zero-extend (signal-value btor123) (bitvector 5))
             btor123))
           (btor148
            (signal
             (bool->bitvector
              (bveq (signal-value btor59) (signal-value btor147)))
             (list)))
           (btor149
            (if (bitvector->bool (signal-value btor148)) btor44 btor146))
           (btor150
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state150")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state150"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state150")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state150")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor152
            (signal
             (concat (signal-value btor150) (signal-value btor149))
             (list)))
           (btor153
            (bv->signal
             (zero-extend (signal-value btor127) (bitvector 2))
             btor127))
           (btor154
            (signal
             (bool->bitvector
              (bveq (signal-value btor152) (signal-value btor153)))
             (list)))
           (btor155
            (if (bitvector->bool (signal-value btor154)) btor136 btor135))
           (btor156 (bitvector 18))
           (btor157
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state157")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state157"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state157")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state157")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor158 (bv->signal (bv 0 (bitvector 18))))
           (btor159
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state159")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state159"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state159")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state159")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor161
            (bv->signal
             (zero-extend (signal-value btor111) (bitvector 5))
             btor111))
           (btor162
            (signal
             (bool->bitvector
              (bveq (signal-value btor50) (signal-value btor161)))
             (list)))
           (btor163
            (if (bitvector->bool (signal-value btor162)) btor47 btor44))
           (btor164
            (bv->signal
             (zero-extend (signal-value btor115) (bitvector 5))
             btor115))
           (btor165
            (signal
             (bool->bitvector
              (bveq (signal-value btor50) (signal-value btor164)))
             (list)))
           (btor166
            (if (bitvector->bool (signal-value btor165)) btor46 btor163))
           (btor167
            (bv->signal
             (zero-extend (signal-value btor119) (bitvector 5))
             btor119))
           (btor168
            (signal
             (bool->bitvector
              (bveq (signal-value btor50) (signal-value btor167)))
             (list)))
           (btor169
            (if (bitvector->bool (signal-value btor168)) btor45 btor166))
           (btor170
            (bv->signal
             (zero-extend (signal-value btor123) (bitvector 5))
             btor123))
           (btor171
            (signal
             (bool->bitvector
              (bveq (signal-value btor50) (signal-value btor170)))
             (list)))
           (btor172
            (if (bitvector->bool (signal-value btor171)) btor44 btor169))
           (btor173
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state173")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state173"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state173")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state173")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor175
            (signal
             (concat (signal-value btor173) (signal-value btor172))
             (list)))
           (btor176
            (bv->signal
             (zero-extend (signal-value btor127) (bitvector 2))
             btor127))
           (btor177
            (signal
             (bool->bitvector
              (bveq (signal-value btor175) (signal-value btor176)))
             (list)))
           (btor178
            (if (bitvector->bool (signal-value btor177)) btor159 btor157))
           (btor179
            (signal (concat (signal-value btor3) (signal-value btor2)) (list)))
           (btor180 (bitvector 3))
           (btor181
            (signal
             (concat (signal-value btor12) (signal-value btor179))
             (list)))
           (btor182
            (signal
             (concat (signal-value btor13) (signal-value btor181))
             (list)))
           (btor183
            (signal
             (concat (signal-value btor14) (signal-value btor182))
             (list)))
           (btor184 (bitvector 6))
           (btor185
            (signal
             (concat (signal-value btor15) (signal-value btor183))
             (list)))
           (btor186 (bitvector 7))
           (btor187
            (signal
             (concat (signal-value btor16) (signal-value btor185))
             (list)))
           (btor188 (bitvector 8))
           (btor189
            (signal
             (concat (signal-value btor17) (signal-value btor187))
             (list)))
           (btor190 (bitvector 9))
           (btor191
            (signal
             (concat (signal-value btor18) (signal-value btor189))
             (list)))
           (btor192 (bitvector 10))
           (btor193
            (signal
             (concat (signal-value btor19) (signal-value btor191))
             (list)))
           (btor194 (bitvector 11))
           (btor195
            (signal
             (concat (signal-value btor4) (signal-value btor193))
             (list)))
           (btor196 (bitvector 12))
           (btor197
            (signal
             (concat (signal-value btor5) (signal-value btor195))
             (list)))
           (btor198 (bitvector 13))
           (btor199
            (signal
             (concat (signal-value btor6) (signal-value btor197))
             (list)))
           (btor200 (bitvector 14))
           (btor201
            (signal
             (concat (signal-value btor7) (signal-value btor199))
             (list)))
           (btor202 (bitvector 15))
           (btor203
            (signal
             (concat (signal-value btor8) (signal-value btor201))
             (list)))
           (btor204 (bitvector 16))
           (btor205
            (signal
             (concat (signal-value btor9) (signal-value btor203))
             (list)))
           (btor206 (bitvector 17))
           (btor207
            (signal
             (concat (signal-value btor10) (signal-value btor205))
             (list)))
           (btor208
            (signal
             (concat (signal-value btor11) (signal-value btor207))
             (list)))
           (btor209
            (signal
             (concat (signal-value btor70) (signal-value btor69))
             (list)))
           (btor210
            (signal
             (concat (signal-value btor79) (signal-value btor209))
             (list)))
           (btor211
            (signal
             (concat (signal-value btor80) (signal-value btor210))
             (list)))
           (btor212
            (signal
             (concat (signal-value btor81) (signal-value btor211))
             (list)))
           (btor213
            (signal
             (concat (signal-value btor82) (signal-value btor212))
             (list)))
           (btor214
            (signal
             (concat (signal-value btor83) (signal-value btor213))
             (list)))
           (btor215
            (signal
             (concat (signal-value btor84) (signal-value btor214))
             (list)))
           (btor216
            (signal
             (concat (signal-value btor85) (signal-value btor215))
             (list)))
           (btor217
            (signal
             (concat (signal-value btor86) (signal-value btor216))
             (list)))
           (btor218
            (signal
             (concat (signal-value btor71) (signal-value btor217))
             (list)))
           (btor219
            (signal
             (concat (signal-value btor72) (signal-value btor218))
             (list)))
           (btor220
            (signal
             (concat (signal-value btor73) (signal-value btor219))
             (list)))
           (btor221
            (signal
             (concat (signal-value btor74) (signal-value btor220))
             (list)))
           (btor222
            (signal
             (concat (signal-value btor75) (signal-value btor221))
             (list)))
           (btor223
            (signal
             (concat (signal-value btor76) (signal-value btor222))
             (list)))
           (btor224
            (signal
             (concat (signal-value btor77) (signal-value btor223))
             (list)))
           (btor225
            (signal
             (concat (signal-value btor78) (signal-value btor224))
             (list)))
           (btor226
            (if (bitvector->bool (signal-value btor67)) btor225 btor208))
           (btor227
            (signal
             (apply bvor (bitvector->bits (signal-value btor50)))
             (signal-state btor50)))
           (btor228 (signal (bvnot (signal-value btor227)) (list)))
           (btor229
            (if (bitvector->bool (signal-value btor228)) btor226 btor178))
           (btor230
            (signal
             (extract 17 17 (signal-value btor229))
             (signal-state btor229)))
           (btor231
            (signal
             (extract 17 17 (signal-value btor229))
             (signal-state btor229)))
           (btor232
            (signal
             (concat (signal-value btor231) (signal-value btor230))
             (list)))
           (btor233
            (signal
             (extract 17 17 (signal-value btor229))
             (signal-state btor229)))
           (btor234
            (signal
             (concat (signal-value btor233) (signal-value btor232))
             (list)))
           (btor235
            (signal
             (extract 17 17 (signal-value btor229))
             (signal-state btor229)))
           (btor236
            (signal
             (concat (signal-value btor235) (signal-value btor234))
             (list)))
           (btor237
            (signal
             (extract 17 17 (signal-value btor229))
             (signal-state btor229)))
           (btor238
            (signal
             (concat (signal-value btor237) (signal-value btor236))
             (list)))
           (btor239
            (signal
             (extract 17 17 (signal-value btor229))
             (signal-state btor229)))
           (btor240
            (signal
             (concat (signal-value btor239) (signal-value btor238))
             (list)))
           (btor241
            (signal
             (extract 17 17 (signal-value btor229))
             (signal-state btor229)))
           (btor242
            (signal
             (concat (signal-value btor241) (signal-value btor240))
             (list)))
           (btor243
            (signal
             (extract 17 17 (signal-value btor229))
             (signal-state btor229)))
           (btor244
            (signal
             (concat (signal-value btor243) (signal-value btor242))
             (list)))
           (btor245
            (signal
             (extract 17 17 (signal-value btor229))
             (signal-state btor229)))
           (btor246
            (signal
             (concat (signal-value btor245) (signal-value btor244))
             (list)))
           (btor247
            (signal
             (extract 17 17 (signal-value btor229))
             (signal-state btor229)))
           (btor248
            (signal
             (concat (signal-value btor247) (signal-value btor246))
             (list)))
           (btor249
            (signal
             (extract 17 17 (signal-value btor229))
             (signal-state btor229)))
           (btor250
            (signal
             (concat (signal-value btor249) (signal-value btor248))
             (list)))
           (btor251
            (signal
             (extract 17 17 (signal-value btor229))
             (signal-state btor229)))
           (btor252
            (signal
             (concat (signal-value btor251) (signal-value btor250))
             (list)))
           (btor253
            (signal
             (extract 17 17 (signal-value btor229))
             (signal-state btor229)))
           (btor254
            (signal
             (concat (signal-value btor253) (signal-value btor252))
             (list)))
           (btor255
            (signal
             (extract 17 17 (signal-value btor229))
             (signal-state btor229)))
           (btor256
            (signal
             (concat (signal-value btor255) (signal-value btor254))
             (list)))
           (btor257
            (signal
             (extract 17 17 (signal-value btor229))
             (signal-state btor229)))
           (btor258
            (signal
             (concat (signal-value btor257) (signal-value btor256))
             (list)))
           (btor259
            (signal
             (extract 17 17 (signal-value btor229))
             (signal-state btor229)))
           (btor260
            (signal
             (concat (signal-value btor259) (signal-value btor258))
             (list)))
           (btor261
            (signal
             (extract 17 17 (signal-value btor229))
             (signal-state btor229)))
           (btor262
            (signal
             (concat (signal-value btor261) (signal-value btor260))
             (list)))
           (btor263
            (signal
             (extract 17 17 (signal-value btor229))
             (signal-state btor229)))
           (btor264
            (signal
             (concat (signal-value btor263) (signal-value btor262))
             (list)))
           (btor265
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state265")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state265"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state265")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state265")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor266 (bv->signal (bv 0 (bitvector 1))))
           (btor267
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state267")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state267"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state267")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state267")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor269
            (if (bitvector->bool (signal-value btor177)) btor267 btor265))
           (btor270
            (if (bitvector->bool (signal-value btor228)) btor65 btor269))
           (btor271
            (if (bitvector->bool (signal-value btor270)) btor264 btor158))
           (btor272
            (signal
             (concat (signal-value btor271) (signal-value btor229))
             (list)))
           (btor273
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state273")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state273"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state273")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state273")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor274
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state274")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state274"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state274")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state274")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor276
            (bv->signal
             (zero-extend (signal-value btor111) (bitvector 5))
             btor111))
           (btor277
            (signal
             (bool->bitvector
              (bveq (signal-value btor53) (signal-value btor276)))
             (list)))
           (btor278
            (if (bitvector->bool (signal-value btor277)) btor47 btor44))
           (btor279
            (bv->signal
             (zero-extend (signal-value btor115) (bitvector 5))
             btor115))
           (btor280
            (signal
             (bool->bitvector
              (bveq (signal-value btor53) (signal-value btor279)))
             (list)))
           (btor281
            (if (bitvector->bool (signal-value btor280)) btor46 btor278))
           (btor282
            (bv->signal
             (zero-extend (signal-value btor119) (bitvector 5))
             btor119))
           (btor283
            (signal
             (bool->bitvector
              (bveq (signal-value btor53) (signal-value btor282)))
             (list)))
           (btor284
            (if (bitvector->bool (signal-value btor283)) btor45 btor281))
           (btor285
            (bv->signal
             (zero-extend (signal-value btor123) (bitvector 5))
             btor123))
           (btor286
            (signal
             (bool->bitvector
              (bveq (signal-value btor53) (signal-value btor285)))
             (list)))
           (btor287
            (if (bitvector->bool (signal-value btor286)) btor44 btor284))
           (btor288
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state288")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state288"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state288")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state288")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor290
            (signal
             (concat (signal-value btor288) (signal-value btor287))
             (list)))
           (btor291
            (bv->signal
             (zero-extend (signal-value btor127) (bitvector 2))
             btor127))
           (btor292
            (signal
             (bool->bitvector
              (bveq (signal-value btor290) (signal-value btor291)))
             (list)))
           (btor293
            (if (bitvector->bool (signal-value btor292)) btor274 btor273))
           (btor294
            (signal
             (concat (signal-value btor21) (signal-value btor20))
             (list)))
           (btor295
            (signal
             (concat (signal-value btor30) (signal-value btor294))
             (list)))
           (btor296
            (signal
             (concat (signal-value btor31) (signal-value btor295))
             (list)))
           (btor297
            (signal
             (concat (signal-value btor32) (signal-value btor296))
             (list)))
           (btor298
            (signal
             (concat (signal-value btor33) (signal-value btor297))
             (list)))
           (btor299
            (signal
             (concat (signal-value btor34) (signal-value btor298))
             (list)))
           (btor300
            (signal
             (concat (signal-value btor35) (signal-value btor299))
             (list)))
           (btor301
            (signal
             (concat (signal-value btor36) (signal-value btor300))
             (list)))
           (btor302
            (signal
             (concat (signal-value btor37) (signal-value btor301))
             (list)))
           (btor303
            (signal
             (concat (signal-value btor22) (signal-value btor302))
             (list)))
           (btor304
            (signal
             (concat (signal-value btor23) (signal-value btor303))
             (list)))
           (btor305
            (signal
             (concat (signal-value btor24) (signal-value btor304))
             (list)))
           (btor306
            (signal
             (concat (signal-value btor25) (signal-value btor305))
             (list)))
           (btor307
            (signal
             (concat (signal-value btor26) (signal-value btor306))
             (list)))
           (btor308
            (signal
             (concat (signal-value btor27) (signal-value btor307))
             (list)))
           (btor309
            (signal
             (concat (signal-value btor28) (signal-value btor308))
             (list)))
           (btor310
            (signal
             (concat (signal-value btor29) (signal-value btor309))
             (list)))
           (btor311
            (signal
             (concat (signal-value btor88) (signal-value btor87))
             (list)))
           (btor312
            (signal
             (concat (signal-value btor97) (signal-value btor311))
             (list)))
           (btor313
            (signal
             (concat (signal-value btor98) (signal-value btor312))
             (list)))
           (btor314
            (signal
             (concat (signal-value btor99) (signal-value btor313))
             (list)))
           (btor315
            (signal
             (concat (signal-value btor100) (signal-value btor314))
             (list)))
           (btor316
            (signal
             (concat (signal-value btor101) (signal-value btor315))
             (list)))
           (btor317
            (signal
             (concat (signal-value btor102) (signal-value btor316))
             (list)))
           (btor318
            (signal
             (concat (signal-value btor103) (signal-value btor317))
             (list)))
           (btor319
            (signal
             (concat (signal-value btor104) (signal-value btor318))
             (list)))
           (btor320
            (signal
             (concat (signal-value btor89) (signal-value btor319))
             (list)))
           (btor321
            (signal
             (concat (signal-value btor90) (signal-value btor320))
             (list)))
           (btor322
            (signal
             (concat (signal-value btor91) (signal-value btor321))
             (list)))
           (btor323
            (signal
             (concat (signal-value btor92) (signal-value btor322))
             (list)))
           (btor324
            (signal
             (concat (signal-value btor93) (signal-value btor323))
             (list)))
           (btor325
            (signal
             (concat (signal-value btor94) (signal-value btor324))
             (list)))
           (btor326
            (signal
             (concat (signal-value btor95) (signal-value btor325))
             (list)))
           (btor327
            (signal
             (concat (signal-value btor96) (signal-value btor326))
             (list)))
           (btor328
            (if (bitvector->bool (signal-value btor68)) btor327 btor310))
           (btor329
            (signal
             (apply bvor (bitvector->bits (signal-value btor53)))
             (signal-state btor53)))
           (btor330 (signal (bvnot (signal-value btor329)) (list)))
           (btor331
            (if (bitvector->bool (signal-value btor330)) btor328 btor293))
           (btor332
            (signal
             (extract 17 17 (signal-value btor331))
             (signal-state btor331)))
           (btor333
            (signal
             (extract 17 17 (signal-value btor331))
             (signal-state btor331)))
           (btor334
            (signal
             (concat (signal-value btor333) (signal-value btor332))
             (list)))
           (btor335
            (signal
             (extract 17 17 (signal-value btor331))
             (signal-state btor331)))
           (btor336
            (signal
             (concat (signal-value btor335) (signal-value btor334))
             (list)))
           (btor337
            (signal
             (extract 17 17 (signal-value btor331))
             (signal-state btor331)))
           (btor338
            (signal
             (concat (signal-value btor337) (signal-value btor336))
             (list)))
           (btor339
            (signal
             (extract 17 17 (signal-value btor331))
             (signal-state btor331)))
           (btor340
            (signal
             (concat (signal-value btor339) (signal-value btor338))
             (list)))
           (btor341
            (signal
             (extract 17 17 (signal-value btor331))
             (signal-state btor331)))
           (btor342
            (signal
             (concat (signal-value btor341) (signal-value btor340))
             (list)))
           (btor343
            (signal
             (extract 17 17 (signal-value btor331))
             (signal-state btor331)))
           (btor344
            (signal
             (concat (signal-value btor343) (signal-value btor342))
             (list)))
           (btor345
            (signal
             (extract 17 17 (signal-value btor331))
             (signal-state btor331)))
           (btor346
            (signal
             (concat (signal-value btor345) (signal-value btor344))
             (list)))
           (btor347
            (signal
             (extract 17 17 (signal-value btor331))
             (signal-state btor331)))
           (btor348
            (signal
             (concat (signal-value btor347) (signal-value btor346))
             (list)))
           (btor349
            (signal
             (extract 17 17 (signal-value btor331))
             (signal-state btor331)))
           (btor350
            (signal
             (concat (signal-value btor349) (signal-value btor348))
             (list)))
           (btor351
            (signal
             (extract 17 17 (signal-value btor331))
             (signal-state btor331)))
           (btor352
            (signal
             (concat (signal-value btor351) (signal-value btor350))
             (list)))
           (btor353
            (signal
             (extract 17 17 (signal-value btor331))
             (signal-state btor331)))
           (btor354
            (signal
             (concat (signal-value btor353) (signal-value btor352))
             (list)))
           (btor355
            (signal
             (extract 17 17 (signal-value btor331))
             (signal-state btor331)))
           (btor356
            (signal
             (concat (signal-value btor355) (signal-value btor354))
             (list)))
           (btor357
            (signal
             (extract 17 17 (signal-value btor331))
             (signal-state btor331)))
           (btor358
            (signal
             (concat (signal-value btor357) (signal-value btor356))
             (list)))
           (btor359
            (signal
             (extract 17 17 (signal-value btor331))
             (signal-state btor331)))
           (btor360
            (signal
             (concat (signal-value btor359) (signal-value btor358))
             (list)))
           (btor361
            (signal
             (extract 17 17 (signal-value btor331))
             (signal-state btor331)))
           (btor362
            (signal
             (concat (signal-value btor361) (signal-value btor360))
             (list)))
           (btor363
            (signal
             (extract 17 17 (signal-value btor331))
             (signal-state btor331)))
           (btor364
            (signal
             (concat (signal-value btor363) (signal-value btor362))
             (list)))
           (btor365
            (signal
             (extract 17 17 (signal-value btor331))
             (signal-state btor331)))
           (btor366
            (signal
             (concat (signal-value btor365) (signal-value btor364))
             (list)))
           (btor367
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state367")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state367"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state367")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state367")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor368
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state368")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state368"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state368")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state368")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor370
            (if (bitvector->bool (signal-value btor292)) btor368 btor367))
           (btor371
            (if (bitvector->bool (signal-value btor330)) btor66 btor370))
           (btor372
            (if (bitvector->bool (signal-value btor371)) btor366 btor158))
           (btor373
            (signal
             (concat (signal-value btor372) (signal-value btor331))
             (list)))
           (btor374
            (signal
             (bvmul (signal-value btor272) (signal-value btor373))
             (list)))
           (btor375
            (signal
             (apply bvor (bitvector->bits (signal-value btor272)))
             (signal-state btor272)))
           (btor376 (signal (bvnot (signal-value btor375)) (list)))
           (btor377
            (signal
             (apply bvor (bitvector->bits (signal-value btor373)))
             (signal-state btor373)))
           (btor378 (signal (bvnot (signal-value btor377)) (list)))
           (btor379
            (signal
             (bvor (signal-value btor376) (signal-value btor378))
             (list)))
           (btor380
            (if (bitvector->bool (signal-value btor379)) btor106 btor374))
           (btor381
            (signal
             (apply bvor (bitvector->bits (signal-value btor59)))
             (signal-state btor59)))
           (btor382 (signal (bvnot (signal-value btor381)) (list)))
           (btor383
            (if (bitvector->bool (signal-value btor382)) btor380 btor155))
           (btor384
            (signal
             (apply bvor (bitvector->bits (signal-value btor56)))
             (signal-state btor56)))
           (btor385 (signal (bvnot (signal-value btor384)) (list)))
           (btor386
            (if (bitvector->bool (signal-value btor385)) btor383 btor134))
           (btor387 (bv->signal (bv 5 (bitvector 3))))
           (btor388
            (bv->signal
             (zero-extend (signal-value btor387) (bitvector 5))
             btor387))
           (btor389
            (signal
             (bool->bitvector
              (bveq (signal-value btor48) (signal-value btor388)))
             (list)))
           (btor390
            (if (bitvector->bool (signal-value btor389)) btor386 btor106))
           (btor391
            (signal
             (extract 0 0 (signal-value btor390))
             (signal-state btor390)))
           (btor393
            (signal
             (extract 1 1 (signal-value btor390))
             (signal-state btor390)))
           (btor395
            (signal
             (extract 10 10 (signal-value btor390))
             (signal-state btor390)))
           (btor397
            (signal
             (extract 11 11 (signal-value btor390))
             (signal-state btor390)))
           (btor399
            (signal
             (extract 12 12 (signal-value btor390))
             (signal-state btor390)))
           (btor401
            (signal
             (extract 13 13 (signal-value btor390))
             (signal-state btor390)))
           (btor403
            (signal
             (extract 14 14 (signal-value btor390))
             (signal-state btor390)))
           (btor405
            (signal
             (extract 15 15 (signal-value btor390))
             (signal-state btor390)))
           (btor407
            (signal
             (extract 16 16 (signal-value btor390))
             (signal-state btor390)))
           (btor409
            (signal
             (extract 17 17 (signal-value btor390))
             (signal-state btor390)))
           (btor411
            (signal
             (extract 18 18 (signal-value btor390))
             (signal-state btor390)))
           (btor413
            (signal
             (extract 19 19 (signal-value btor390))
             (signal-state btor390)))
           (btor415
            (signal
             (extract 2 2 (signal-value btor390))
             (signal-state btor390)))
           (btor417
            (signal
             (extract 20 20 (signal-value btor390))
             (signal-state btor390)))
           (btor419
            (signal
             (extract 21 21 (signal-value btor390))
             (signal-state btor390)))
           (btor421
            (signal
             (extract 22 22 (signal-value btor390))
             (signal-state btor390)))
           (btor423
            (signal
             (extract 23 23 (signal-value btor390))
             (signal-state btor390)))
           (btor425
            (signal
             (extract 24 24 (signal-value btor390))
             (signal-state btor390)))
           (btor427
            (signal
             (extract 25 25 (signal-value btor390))
             (signal-state btor390)))
           (btor429
            (signal
             (extract 26 26 (signal-value btor390))
             (signal-state btor390)))
           (btor431
            (signal
             (extract 27 27 (signal-value btor390))
             (signal-state btor390)))
           (btor433
            (signal
             (extract 28 28 (signal-value btor390))
             (signal-state btor390)))
           (btor435
            (signal
             (extract 29 29 (signal-value btor390))
             (signal-state btor390)))
           (btor437
            (signal
             (extract 3 3 (signal-value btor390))
             (signal-state btor390)))
           (btor439
            (signal
             (extract 30 30 (signal-value btor390))
             (signal-state btor390)))
           (btor441
            (signal
             (extract 31 31 (signal-value btor390))
             (signal-state btor390)))
           (btor443
            (signal
             (extract 32 32 (signal-value btor390))
             (signal-state btor390)))
           (btor445
            (signal
             (extract 33 33 (signal-value btor390))
             (signal-state btor390)))
           (btor447
            (signal
             (extract 34 34 (signal-value btor390))
             (signal-state btor390)))
           (btor449
            (signal
             (extract 35 35 (signal-value btor390))
             (signal-state btor390)))
           (btor451
            (signal
             (extract 4 4 (signal-value btor390))
             (signal-state btor390)))
           (btor453
            (signal
             (extract 5 5 (signal-value btor390))
             (signal-state btor390)))
           (btor455
            (signal
             (extract 6 6 (signal-value btor390))
             (signal-state btor390)))
           (btor457
            (signal
             (extract 7 7 (signal-value btor390))
             (signal-state btor390)))
           (btor459
            (signal
             (extract 8 8 (signal-value btor390))
             (signal-state btor390)))
           (btor461
            (signal
             (extract 9 9 (signal-value btor390))
             (signal-state btor390)))
           (btor463
            (signal
             (extract 0 0 (signal-value btor229))
             (signal-state btor229)))
           (btor465
            (signal
             (extract 1 1 (signal-value btor229))
             (signal-state btor229)))
           (btor467
            (signal
             (extract 10 10 (signal-value btor229))
             (signal-state btor229)))
           (btor469
            (signal
             (extract 11 11 (signal-value btor229))
             (signal-state btor229)))
           (btor471
            (signal
             (extract 12 12 (signal-value btor229))
             (signal-state btor229)))
           (btor473
            (signal
             (extract 13 13 (signal-value btor229))
             (signal-state btor229)))
           (btor475
            (signal
             (extract 14 14 (signal-value btor229))
             (signal-state btor229)))
           (btor477
            (signal
             (extract 15 15 (signal-value btor229))
             (signal-state btor229)))
           (btor479
            (signal
             (extract 16 16 (signal-value btor229))
             (signal-state btor229)))
           (btor481
            (signal
             (extract 17 17 (signal-value btor229))
             (signal-state btor229)))
           (btor483
            (signal
             (extract 2 2 (signal-value btor229))
             (signal-state btor229)))
           (btor485
            (signal
             (extract 3 3 (signal-value btor229))
             (signal-state btor229)))
           (btor487
            (signal
             (extract 4 4 (signal-value btor229))
             (signal-state btor229)))
           (btor489
            (signal
             (extract 5 5 (signal-value btor229))
             (signal-state btor229)))
           (btor491
            (signal
             (extract 6 6 (signal-value btor229))
             (signal-state btor229)))
           (btor493
            (signal
             (extract 7 7 (signal-value btor229))
             (signal-state btor229)))
           (btor495
            (signal
             (extract 8 8 (signal-value btor229))
             (signal-state btor229)))
           (btor497
            (signal
             (extract 9 9 (signal-value btor229))
             (signal-state btor229)))
           (btor499
            (signal
             (extract 0 0 (signal-value btor331))
             (signal-state btor331)))
           (btor501
            (signal
             (extract 1 1 (signal-value btor331))
             (signal-state btor331)))
           (btor503
            (signal
             (extract 10 10 (signal-value btor331))
             (signal-state btor331)))
           (btor505
            (signal
             (extract 11 11 (signal-value btor331))
             (signal-state btor331)))
           (btor507
            (signal
             (extract 12 12 (signal-value btor331))
             (signal-state btor331)))
           (btor509
            (signal
             (extract 13 13 (signal-value btor331))
             (signal-state btor331)))
           (btor511
            (signal
             (extract 14 14 (signal-value btor331))
             (signal-state btor331)))
           (btor513
            (signal
             (extract 15 15 (signal-value btor331))
             (signal-state btor331)))
           (btor515
            (signal
             (extract 16 16 (signal-value btor331))
             (signal-state btor331)))
           (btor517
            (signal
             (extract 17 17 (signal-value btor331))
             (signal-state btor331)))
           (btor519
            (signal
             (extract 2 2 (signal-value btor331))
             (signal-state btor331)))
           (btor521
            (signal
             (extract 3 3 (signal-value btor331))
             (signal-state btor331)))
           (btor523
            (signal
             (extract 4 4 (signal-value btor331))
             (signal-state btor331)))
           (btor525
            (signal
             (extract 5 5 (signal-value btor331))
             (signal-state btor331)))
           (btor527
            (signal
             (extract 6 6 (signal-value btor331))
             (signal-state btor331)))
           (btor529
            (signal
             (extract 7 7 (signal-value btor331))
             (signal-state btor331)))
           (btor531
            (signal
             (extract 8 8 (signal-value btor331))
             (signal-state btor331)))
           (btor533
            (signal
             (extract 9 9 (signal-value btor331))
             (signal-state btor331)))
           (btor535
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state535")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state535"))))))
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
           (btor536
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state536")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state536"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state536")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state536")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor538
            (if (bitvector->bool (signal-value btor154)) btor536 btor535))
           (btor539
            (signal
             (bvor (signal-value btor270) (signal-value btor371))
             (list)))
           (btor540
            (if (bitvector->bool (signal-value btor382)) btor539 btor538))
           (btor542
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state542")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state542"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state542")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state542")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor543
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state543")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state543"))))))
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
           (btor545
            (if (bitvector->bool (signal-value btor177)) btor543 btor542))
           (btor546
            (if (bitvector->bool (signal-value btor228)) btor229 btor545))
           (btor547 (bv->signal (bv 22 (bitvector 5))))
           (btor548
            (signal
             (bool->bitvector
              (bveq (signal-value btor39) (signal-value btor547)))
             (list)))
           (btor549
            (if (bitvector->bool (signal-value btor548)) btor546 btor229))
           (btor550 (bv->signal (bv 4 (bitvector 3))))
           (btor551
            (bv->signal
             (zero-extend (signal-value btor550) (bitvector 5))
             btor550))
           (btor552
            (signal
             (bool->bitvector
              (bveq (signal-value btor39) (signal-value btor551)))
             (list)))
           (btor553
            (if (bitvector->bool (signal-value btor552)) btor229 btor549))
           (btor554
            (signal
             (extract 0 0 (signal-value btor553))
             (signal-state btor553)))
           (btor556
            (signal
             (extract 1 1 (signal-value btor553))
             (signal-state btor553)))
           (btor558
            (signal
             (extract 10 10 (signal-value btor553))
             (signal-state btor553)))
           (btor560
            (signal
             (extract 11 11 (signal-value btor553))
             (signal-state btor553)))
           (btor562
            (signal
             (extract 12 12 (signal-value btor553))
             (signal-state btor553)))
           (btor564
            (signal
             (extract 13 13 (signal-value btor553))
             (signal-state btor553)))
           (btor566
            (signal
             (extract 14 14 (signal-value btor553))
             (signal-state btor553)))
           (btor568
            (signal
             (extract 15 15 (signal-value btor553))
             (signal-state btor553)))
           (btor570
            (signal
             (extract 16 16 (signal-value btor553))
             (signal-state btor553)))
           (btor572
            (signal
             (extract 17 17 (signal-value btor553))
             (signal-state btor553)))
           (btor574
            (signal
             (extract 2 2 (signal-value btor553))
             (signal-state btor553)))
           (btor576
            (signal
             (extract 3 3 (signal-value btor553))
             (signal-state btor553)))
           (btor578
            (signal
             (extract 4 4 (signal-value btor553))
             (signal-state btor553)))
           (btor580
            (signal
             (extract 5 5 (signal-value btor553))
             (signal-state btor553)))
           (btor582
            (signal
             (extract 6 6 (signal-value btor553))
             (signal-state btor553)))
           (btor584
            (signal
             (extract 7 7 (signal-value btor553))
             (signal-state btor553)))
           (btor586
            (signal
             (extract 8 8 (signal-value btor553))
             (signal-state btor553)))
           (btor588
            (signal
             (extract 9 9 (signal-value btor553))
             (signal-state btor553)))
           (btor608
            (bv->signal
             (zero-extend (signal-value btor40) (bitvector 1))
             btor40))
           (btor609
            (bv->signal
             (zero-extend (signal-value btor41) (bitvector 1))
             btor41))
           (btor610
            (bv->signal
             (zero-extend (signal-value btor42) (bitvector 1))
             btor42))
           (btor611
            (bv->signal
             (zero-extend (signal-value btor43) (bitvector 1))
             btor43))
           (btor612
            (bv->signal
             (zero-extend (signal-value btor44) (bitvector 1))
             btor44))
           (btor613
            (bv->signal
             (zero-extend (signal-value btor45) (bitvector 1))
             btor45))
           (btor614
            (bv->signal
             (zero-extend (signal-value btor46) (bitvector 1))
             btor46))
           (btor615
            (bv->signal
             (zero-extend (signal-value btor47) (bitvector 1))
             btor47))
           (btor616
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 1))
             btor61))
           (btor617
            (bv->signal
             (zero-extend (signal-value btor62) (bitvector 1))
             btor62))
           (btor618
            (bv->signal
             (zero-extend (signal-value btor63) (bitvector 1))
             btor63))
           (btor619
            (bv->signal
             (zero-extend (signal-value btor64) (bitvector 1))
             btor64))
           (btor620
            (bv->signal
             (zero-extend (signal-value btor208) (bitvector 18))
             btor208))
           (btor621
            (bv->signal
             (zero-extend (signal-value btor229) (bitvector 18))
             btor229))
           (btor622
            (bv->signal
             (zero-extend (signal-value btor545) (bitvector 18))
             btor545))
           (btor623
            (bv->signal
             (zero-extend (signal-value btor545) (bitvector 18))
             btor545))
           (btor624
            (bv->signal
             (zero-extend (signal-value btor546) (bitvector 18))
             btor546))
           (btor625
            (bv->signal
             (zero-extend (signal-value btor553) (bitvector 18))
             btor553))
           (btor626
            (bv->signal
             (zero-extend (signal-value btor272) (bitvector 36))
             btor272))
           (btor627
            (bv->signal
             (zero-extend (signal-value btor178) (bitvector 18))
             btor178))
           (btor628
            (bv->signal
             (zero-extend (signal-value btor178) (bitvector 18))
             btor178))
           (btor629
            (bv->signal
             (zero-extend (signal-value btor225) (bitvector 18))
             btor225))
           (btor630
            (bv->signal
             (zero-extend (signal-value btor226) (bitvector 18))
             btor226))
           (btor631
            (bv->signal
             (zero-extend (signal-value btor310) (bitvector 18))
             btor310))
           (btor632
            (bv->signal
             (zero-extend (signal-value btor331) (bitvector 18))
             btor331))
           (btor633
            (bv->signal
             (zero-extend (signal-value btor373) (bitvector 36))
             btor373))
           (btor634
            (bv->signal
             (zero-extend (signal-value btor293) (bitvector 18))
             btor293))
           (btor635
            (bv->signal
             (zero-extend (signal-value btor293) (bitvector 18))
             btor293))
           (btor636
            (bv->signal
             (zero-extend (signal-value btor327) (bitvector 18))
             btor327))
           (btor637
            (bv->signal
             (zero-extend (signal-value btor328) (bitvector 18))
             btor328))
           (btor638 (bv->signal (bv 17 (bitvector 5))))
           (btor639
            (signal
             (bool->bitvector
              (bveq (signal-value btor49) (signal-value btor638)))
             (list)))
           (btor640
            (if (bitvector->bool (signal-value btor639)) btor43 btor40))
           (btor641 (bv->signal (bv 16 (bitvector 5))))
           (btor642
            (signal
             (bool->bitvector
              (bveq (signal-value btor49) (signal-value btor641)))
             (list)))
           (btor643
            (if (bitvector->bool (signal-value btor642)) btor42 btor640))
           (btor644 (bv->signal (bv 15 (bitvector 4))))
           (btor645
            (bv->signal
             (zero-extend (signal-value btor644) (bitvector 5))
             btor644))
           (btor646
            (signal
             (bool->bitvector
              (bveq (signal-value btor49) (signal-value btor645)))
             (list)))
           (btor647
            (if (bitvector->bool (signal-value btor646)) btor41 btor643))
           (btor648
            (bv->signal
             (zero-extend (signal-value btor127) (bitvector 5))
             btor127))
           (btor649
            (signal
             (bool->bitvector
              (bveq (signal-value btor49) (signal-value btor648)))
             (list)))
           (btor650
            (if (bitvector->bool (signal-value btor649)) btor40 btor647))
           (btor651
            (bv->signal
             (zero-extend (signal-value btor650) (bitvector 1))
             btor650))
           (btor652
            (bv->signal
             (zero-extend (signal-value btor172) (bitvector 1))
             btor172))
           (btor653 (bv->signal (bv 20 (bitvector 5))))
           (btor654
            (signal
             (bool->bitvector
              (bveq (signal-value btor51) (signal-value btor653)))
             (list)))
           (btor655
            (if (bitvector->bool (signal-value btor654)) btor64 btor61))
           (btor656 (bv->signal (bv 19 (bitvector 5))))
           (btor657
            (signal
             (bool->bitvector
              (bveq (signal-value btor51) (signal-value btor656)))
             (list)))
           (btor658
            (if (bitvector->bool (signal-value btor657)) btor63 btor655))
           (btor659 (bv->signal (bv 18 (bitvector 5))))
           (btor660
            (signal
             (bool->bitvector
              (bveq (signal-value btor51) (signal-value btor659)))
             (list)))
           (btor661
            (if (bitvector->bool (signal-value btor660)) btor62 btor658))
           (btor662 (bv->signal (bv 2 (bitvector 2))))
           (btor663
            (bv->signal
             (zero-extend (signal-value btor662) (bitvector 5))
             btor662))
           (btor664
            (signal
             (bool->bitvector
              (bveq (signal-value btor51) (signal-value btor663)))
             (list)))
           (btor665
            (if (bitvector->bool (signal-value btor664)) btor61 btor661))
           (btor666
            (bv->signal
             (zero-extend (signal-value btor665) (bitvector 1))
             btor665))
           (btor667
            (bv->signal
             (zero-extend (signal-value btor665) (bitvector 1))
             btor665))
           (btor668
            (signal
             (bool->bitvector
              (bveq (signal-value btor52) (signal-value btor638)))
             (list)))
           (btor669
            (if (bitvector->bool (signal-value btor668)) btor43 btor40))
           (btor670
            (signal
             (bool->bitvector
              (bveq (signal-value btor52) (signal-value btor641)))
             (list)))
           (btor671
            (if (bitvector->bool (signal-value btor670)) btor42 btor669))
           (btor672
            (bv->signal
             (zero-extend (signal-value btor644) (bitvector 5))
             btor644))
           (btor673
            (signal
             (bool->bitvector
              (bveq (signal-value btor52) (signal-value btor672)))
             (list)))
           (btor674
            (if (bitvector->bool (signal-value btor673)) btor41 btor671))
           (btor675
            (bv->signal
             (zero-extend (signal-value btor127) (bitvector 5))
             btor127))
           (btor676
            (signal
             (bool->bitvector
              (bveq (signal-value btor52) (signal-value btor675)))
             (list)))
           (btor677
            (if (bitvector->bool (signal-value btor676)) btor40 btor674))
           (btor678
            (bv->signal
             (zero-extend (signal-value btor677) (bitvector 1))
             btor677))
           (btor679
            (bv->signal
             (zero-extend (signal-value btor287) (bitvector 1))
             btor287))
           (btor680
            (signal
             (bool->bitvector
              (bveq (signal-value btor54) (signal-value btor653)))
             (list)))
           (btor681
            (if (bitvector->bool (signal-value btor680)) btor64 btor61))
           (btor682
            (signal
             (bool->bitvector
              (bveq (signal-value btor54) (signal-value btor656)))
             (list)))
           (btor683
            (if (bitvector->bool (signal-value btor682)) btor63 btor681))
           (btor684
            (signal
             (bool->bitvector
              (bveq (signal-value btor54) (signal-value btor659)))
             (list)))
           (btor685
            (if (bitvector->bool (signal-value btor684)) btor62 btor683))
           (btor686
            (bv->signal
             (zero-extend (signal-value btor662) (bitvector 5))
             btor662))
           (btor687
            (signal
             (bool->bitvector
              (bveq (signal-value btor54) (signal-value btor686)))
             (list)))
           (btor688
            (if (bitvector->bool (signal-value btor687)) btor61 btor685))
           (btor689
            (bv->signal
             (zero-extend (signal-value btor688) (bitvector 1))
             btor688))
           (btor690
            (bv->signal
             (zero-extend (signal-value btor688) (bitvector 1))
             btor688))
           (btor691
            (signal
             (bool->bitvector
              (bveq (signal-value btor55) (signal-value btor638)))
             (list)))
           (btor692
            (if (bitvector->bool (signal-value btor691)) btor43 btor40))
           (btor693
            (signal
             (bool->bitvector
              (bveq (signal-value btor55) (signal-value btor641)))
             (list)))
           (btor694
            (if (bitvector->bool (signal-value btor693)) btor42 btor692))
           (btor695
            (bv->signal
             (zero-extend (signal-value btor644) (bitvector 5))
             btor644))
           (btor696
            (signal
             (bool->bitvector
              (bveq (signal-value btor55) (signal-value btor695)))
             (list)))
           (btor697
            (if (bitvector->bool (signal-value btor696)) btor41 btor694))
           (btor698
            (bv->signal
             (zero-extend (signal-value btor127) (bitvector 5))
             btor127))
           (btor699
            (signal
             (bool->bitvector
              (bveq (signal-value btor55) (signal-value btor698)))
             (list)))
           (btor700
            (if (bitvector->bool (signal-value btor699)) btor40 btor697))
           (btor701
            (bv->signal
             (zero-extend (signal-value btor700) (bitvector 1))
             btor700))
           (btor702
            (bv->signal
             (zero-extend (signal-value btor126) (bitvector 1))
             btor126))
           (btor703
            (signal
             (bool->bitvector
              (bveq (signal-value btor57) (signal-value btor653)))
             (list)))
           (btor704
            (if (bitvector->bool (signal-value btor703)) btor64 btor61))
           (btor705
            (signal
             (bool->bitvector
              (bveq (signal-value btor57) (signal-value btor656)))
             (list)))
           (btor706
            (if (bitvector->bool (signal-value btor705)) btor63 btor704))
           (btor707
            (signal
             (bool->bitvector
              (bveq (signal-value btor57) (signal-value btor659)))
             (list)))
           (btor708
            (if (bitvector->bool (signal-value btor707)) btor62 btor706))
           (btor709
            (bv->signal
             (zero-extend (signal-value btor662) (bitvector 5))
             btor662))
           (btor710
            (signal
             (bool->bitvector
              (bveq (signal-value btor57) (signal-value btor709)))
             (list)))
           (btor711
            (if (bitvector->bool (signal-value btor710)) btor61 btor708))
           (btor712
            (bv->signal
             (zero-extend (signal-value btor711) (bitvector 1))
             btor711))
           (btor713
            (bv->signal
             (zero-extend (signal-value btor711) (bitvector 1))
             btor711))
           (btor714
            (bv->signal
             (zero-extend (signal-value btor390) (bitvector 36))
             btor390))
           (btor715
            (bv->signal
             (zero-extend (signal-value btor380) (bitvector 36))
             btor380))
           (btor716
            (bv->signal
             (zero-extend (signal-value btor155) (bitvector 36))
             btor155))
           (btor717
            (bv->signal
             (zero-extend (signal-value btor134) (bitvector 36))
             btor134))
           (btor718
            (bv->signal
             (zero-extend (signal-value btor134) (bitvector 36))
             btor134))
           (btor719
            (bv->signal
             (zero-extend (signal-value btor155) (bitvector 36))
             btor155))
           (btor720
            (bv->signal
             (zero-extend (signal-value btor386) (bitvector 36))
             btor386))
           (btor721
            (bv->signal
             (zero-extend (signal-value btor383) (bitvector 36))
             btor383))
           (btor722
            (signal
             (bool->bitvector
              (bveq (signal-value btor58) (signal-value btor638)))
             (list)))
           (btor723
            (if (bitvector->bool (signal-value btor722)) btor43 btor40))
           (btor724
            (signal
             (bool->bitvector
              (bveq (signal-value btor58) (signal-value btor641)))
             (list)))
           (btor725
            (if (bitvector->bool (signal-value btor724)) btor42 btor723))
           (btor726
            (bv->signal
             (zero-extend (signal-value btor644) (bitvector 5))
             btor644))
           (btor727
            (signal
             (bool->bitvector
              (bveq (signal-value btor58) (signal-value btor726)))
             (list)))
           (btor728
            (if (bitvector->bool (signal-value btor727)) btor41 btor725))
           (btor729
            (bv->signal
             (zero-extend (signal-value btor127) (bitvector 5))
             btor127))
           (btor730
            (signal
             (bool->bitvector
              (bveq (signal-value btor58) (signal-value btor729)))
             (list)))
           (btor731
            (if (bitvector->bool (signal-value btor730)) btor40 btor728))
           (btor732
            (bv->signal
             (zero-extend (signal-value btor731) (bitvector 1))
             btor731))
           (btor733
            (bv->signal
             (zero-extend (signal-value btor149) (bitvector 1))
             btor149))
           (btor734
            (signal
             (bool->bitvector
              (bveq (signal-value btor60) (signal-value btor653)))
             (list)))
           (btor735
            (if (bitvector->bool (signal-value btor734)) btor64 btor61))
           (btor736
            (signal
             (bool->bitvector
              (bveq (signal-value btor60) (signal-value btor656)))
             (list)))
           (btor737
            (if (bitvector->bool (signal-value btor736)) btor63 btor735))
           (btor738
            (signal
             (bool->bitvector
              (bveq (signal-value btor60) (signal-value btor659)))
             (list)))
           (btor739
            (if (bitvector->bool (signal-value btor738)) btor62 btor737))
           (btor740
            (bv->signal
             (zero-extend (signal-value btor662) (bitvector 5))
             btor662))
           (btor741
            (signal
             (bool->bitvector
              (bveq (signal-value btor60) (signal-value btor740)))
             (list)))
           (btor742
            (if (bitvector->bool (signal-value btor741)) btor61 btor739))
           (btor743
            (bv->signal
             (zero-extend (signal-value btor742) (bitvector 1))
             btor742))
           (btor744
            (bv->signal
             (zero-extend (signal-value btor742) (bitvector 1))
             btor742))
           (btor745
            (bv->signal
             (zero-extend (signal-value btor229) (bitvector 18))
             btor229))
           (btor746
            (bv->signal
             (zero-extend (signal-value btor270) (bitvector 1))
             btor270))
           (btor747
            (bv->signal
             (zero-extend (signal-value btor269) (bitvector 1))
             btor269))
           (btor748
            (bv->signal
             (zero-extend (signal-value btor269) (bitvector 1))
             btor269))
           (btor749
            (bv->signal
             (zero-extend (signal-value btor65) (bitvector 1))
             btor65))
           (btor750
            (bv->signal
             (zero-extend (signal-value btor538) (bitvector 1))
             btor538))
           (btor751
            (bv->signal
             (zero-extend (signal-value btor539) (bitvector 1))
             btor539))
           (btor752
            (bv->signal
             (zero-extend (signal-value btor538) (bitvector 1))
             btor538))
           (btor753
            (bv->signal
             (zero-extend (signal-value btor371) (bitvector 1))
             btor371))
           (btor754
            (bv->signal
             (zero-extend (signal-value btor370) (bitvector 1))
             btor370))
           (btor755
            (bv->signal
             (zero-extend (signal-value btor370) (bitvector 1))
             btor370))
           (btor756
            (bv->signal
             (zero-extend (signal-value btor66) (bitvector 1))
             btor66))
           (btor757
            (bv->signal
             (zero-extend (signal-value btor540) (bitvector 1))
             btor540))
           (btor758
            (bv->signal
             (zero-extend (signal-value btor67) (bitvector 1))
             btor67))
           (btor759
            (bv->signal
             (zero-extend (signal-value btor68) (bitvector 1))
             btor68))
           (btor760
            (bv->signal
             (zero-extend (signal-value btor553) (bitvector 18))
             btor553))
           (btor761
            (bv->signal
             (zero-extend (signal-value btor331) (bitvector 18))
             btor331))
           (btor763
            (if (bitvector->bool (signal-value btor700)) btor383 btor134))
           (btor764
            (if (bitvector->bool (signal-value btor711)) btor106 btor763))
           (btor768
            (if (bitvector->bool (signal-value btor731)) btor380 btor155))
           (btor769
            (if (bitvector->bool (signal-value btor742)) btor106 btor768))
           (btor773
            (if (bitvector->bool (signal-value btor650)) btor226 btor178))
           (btor774
            (if (bitvector->bool (signal-value btor665)) btor158 btor773))
           (btor778
            (if (bitvector->bool (signal-value btor650)) btor65 btor269))
           (btor779
            (if (bitvector->bool (signal-value btor665)) btor266 btor778))
           (btor782
            (if (bitvector->bool (signal-value btor677)) btor328 btor293))
           (btor783
            (if (bitvector->bool (signal-value btor688)) btor158 btor782))
           (btor787
            (if (bitvector->bool (signal-value btor677)) btor66 btor370))
           (btor788
            (if (bitvector->bool (signal-value btor688)) btor266 btor787))
           (btor791
            (if (bitvector->bool (signal-value btor731)) btor539 btor538))
           (btor792
            (if (bitvector->bool (signal-value btor742)) btor266 btor791))
           (btor795
            (if (bitvector->bool (signal-value btor650)) btor229 btor545))
           (btor796
            (if (bitvector->bool (signal-value btor665)) btor158 btor795))
           (output-state
            (remove-duplicates
             (append
              (append
               (list
                (cons
                 (string->symbol (string-append name "state543"))
                 (cons
                  (signal-value btor796)
                  (if (assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state543")))
                    (add1
                     (cdr
                      (assoc-ref
                       merged-input-state-hash
                       (string->symbol (string-append name "state543")))))
                    0))))
               (append
                (list
                 (cons
                  (string->symbol (string-append name "state542"))
                  (cons
                   (signal-value btor545)
                   (if (assoc-has-key?
                        merged-input-state-hash
                        (string->symbol (string-append name "state542")))
                     (add1
                      (cdr
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state542")))))
                     0))))
                (append
                 (list
                  (cons
                   (string->symbol (string-append name "state536"))
                   (cons
                    (signal-value btor792)
                    (if (assoc-has-key?
                         merged-input-state-hash
                         (string->symbol (string-append name "state536")))
                      (add1
                       (cdr
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state536")))))
                      0))))
                 (append
                  (list
                   (cons
                    (string->symbol (string-append name "state535"))
                    (cons
                     (signal-value btor538)
                     (if (assoc-has-key?
                          merged-input-state-hash
                          (string->symbol (string-append name "state535")))
                       (add1
                        (cdr
                         (assoc-ref
                          merged-input-state-hash
                          (string->symbol (string-append name "state535")))))
                       0))))
                  (append
                   (list
                    (cons
                     (string->symbol (string-append name "state368"))
                     (cons
                      (signal-value btor788)
                      (if (assoc-has-key?
                           merged-input-state-hash
                           (string->symbol (string-append name "state368")))
                        (add1
                         (cdr
                          (assoc-ref
                           merged-input-state-hash
                           (string->symbol (string-append name "state368")))))
                        0))))
                   (append
                    (list
                     (cons
                      (string->symbol (string-append name "state367"))
                      (cons
                       (signal-value btor370)
                       (if (assoc-has-key?
                            merged-input-state-hash
                            (string->symbol (string-append name "state367")))
                         (add1
                          (cdr
                           (assoc-ref
                            merged-input-state-hash
                            (string->symbol (string-append name "state367")))))
                         0))))
                    (append
                     (list
                      (cons
                       (string->symbol (string-append name "state288"))
                       (cons
                        (signal-value btor287)
                        (if (assoc-has-key?
                             merged-input-state-hash
                             (string->symbol (string-append name "state288")))
                          (add1
                           (cdr
                            (assoc-ref
                             merged-input-state-hash
                             (string->symbol
                              (string-append name "state288")))))
                          0))))
                     (append
                      (list
                       (cons
                        (string->symbol (string-append name "state274"))
                        (cons
                         (signal-value btor783)
                         (if (assoc-has-key?
                              merged-input-state-hash
                              (string->symbol (string-append name "state274")))
                           (add1
                            (cdr
                             (assoc-ref
                              merged-input-state-hash
                              (string->symbol
                               (string-append name "state274")))))
                           0))))
                      (append
                       (list
                        (cons
                         (string->symbol (string-append name "state273"))
                         (cons
                          (signal-value btor293)
                          (if (assoc-has-key?
                               merged-input-state-hash
                               (string->symbol
                                (string-append name "state273")))
                            (add1
                             (cdr
                              (assoc-ref
                               merged-input-state-hash
                               (string->symbol
                                (string-append name "state273")))))
                            0))))
                       (append
                        (list
                         (cons
                          (string->symbol (string-append name "state267"))
                          (cons
                           (signal-value btor779)
                           (if (assoc-has-key?
                                merged-input-state-hash
                                (string->symbol
                                 (string-append name "state267")))
                             (add1
                              (cdr
                               (assoc-ref
                                merged-input-state-hash
                                (string->symbol
                                 (string-append name "state267")))))
                             0))))
                        (append
                         (list
                          (cons
                           (string->symbol (string-append name "state265"))
                           (cons
                            (signal-value btor269)
                            (if (assoc-has-key?
                                 merged-input-state-hash
                                 (string->symbol
                                  (string-append name "state265")))
                              (add1
                               (cdr
                                (assoc-ref
                                 merged-input-state-hash
                                 (string->symbol
                                  (string-append name "state265")))))
                              0))))
                         (append
                          (list
                           (cons
                            (string->symbol (string-append name "state173"))
                            (cons
                             (signal-value btor172)
                             (if (assoc-has-key?
                                  merged-input-state-hash
                                  (string->symbol
                                   (string-append name "state173")))
                               (add1
                                (cdr
                                 (assoc-ref
                                  merged-input-state-hash
                                  (string->symbol
                                   (string-append name "state173")))))
                               0))))
                          (append
                           (list
                            (cons
                             (string->symbol (string-append name "state159"))
                             (cons
                              (signal-value btor774)
                              (if (assoc-has-key?
                                   merged-input-state-hash
                                   (string->symbol
                                    (string-append name "state159")))
                                (add1
                                 (cdr
                                  (assoc-ref
                                   merged-input-state-hash
                                   (string->symbol
                                    (string-append name "state159")))))
                                0))))
                           (append
                            (list
                             (cons
                              (string->symbol (string-append name "state157"))
                              (cons
                               (signal-value btor178)
                               (if (assoc-has-key?
                                    merged-input-state-hash
                                    (string->symbol
                                     (string-append name "state157")))
                                 (add1
                                  (cdr
                                   (assoc-ref
                                    merged-input-state-hash
                                    (string->symbol
                                     (string-append name "state157")))))
                                 0))))
                            (append
                             (list
                              (cons
                               (string->symbol (string-append name "state150"))
                               (cons
                                (signal-value btor149)
                                (if (assoc-has-key?
                                     merged-input-state-hash
                                     (string->symbol
                                      (string-append name "state150")))
                                  (add1
                                   (cdr
                                    (assoc-ref
                                     merged-input-state-hash
                                     (string->symbol
                                      (string-append name "state150")))))
                                  0))))
                             (append
                              (list
                               (cons
                                (string->symbol
                                 (string-append name "state136"))
                                (cons
                                 (signal-value btor769)
                                 (if (assoc-has-key?
                                      merged-input-state-hash
                                      (string->symbol
                                       (string-append name "state136")))
                                   (add1
                                    (cdr
                                     (assoc-ref
                                      merged-input-state-hash
                                      (string->symbol
                                       (string-append name "state136")))))
                                   0))))
                              (append
                               (list
                                (cons
                                 (string->symbol
                                  (string-append name "state135"))
                                 (cons
                                  (signal-value btor155)
                                  (if (assoc-has-key?
                                       merged-input-state-hash
                                       (string->symbol
                                        (string-append name "state135")))
                                    (add1
                                     (cdr
                                      (assoc-ref
                                       merged-input-state-hash
                                       (string->symbol
                                        (string-append name "state135")))))
                                    0))))
                               (append
                                (list
                                 (cons
                                  (string->symbol
                                   (string-append name "state128"))
                                  (cons
                                   (signal-value btor126)
                                   (if (assoc-has-key?
                                        merged-input-state-hash
                                        (string->symbol
                                         (string-append name "state128")))
                                     (add1
                                      (cdr
                                       (assoc-ref
                                        merged-input-state-hash
                                        (string->symbol
                                         (string-append name "state128")))))
                                     0))))
                                (append
                                 (list
                                  (cons
                                   (string->symbol
                                    (string-append name "state108"))
                                   (cons
                                    (signal-value btor764)
                                    (if (assoc-has-key?
                                         merged-input-state-hash
                                         (string->symbol
                                          (string-append name "state108")))
                                      (add1
                                       (cdr
                                        (assoc-ref
                                         merged-input-state-hash
                                         (string->symbol
                                          (string-append name "state108")))))
                                      0))))
                                 (append
                                  (list
                                   (cons
                                    (string->symbol
                                     (string-append name "state107"))
                                    (cons
                                     (signal-value btor134)
                                     (if (assoc-has-key?
                                          merged-input-state-hash
                                          (string->symbol
                                           (string-append name "state107")))
                                       (add1
                                        (cdr
                                         (assoc-ref
                                          merged-input-state-hash
                                          (string->symbol
                                           (string-append name "state107")))))
                                       0))))
                                  (list)))))))))))))))))))))
              merged-input-state-hash)
             equal?
             #:key
             car)))
      (list
       (cons 'SROB0 (signal (signal-value btor499) output-state))
       (cons 'SROB15 (signal (signal-value btor513) output-state))
       (cons 'P31 (signal (signal-value btor441) output-state))
       (cons 'ROA0 (signal (signal-value btor463) output-state))
       (cons 'SROA8 (signal (signal-value btor586) output-state))
       (cons 'SROA9 (signal (signal-value btor588) output-state))
       (cons 'P30 (signal (signal-value btor439) output-state))
       (cons 'P18 (signal (signal-value btor411) output-state))
       (cons 'ROB2 (signal (signal-value btor519) output-state))
       (cons 'P0 (signal (signal-value btor391) output-state))
       (cons 'ROA17 (signal (signal-value btor481) output-state))
       (cons 'SROA14 (signal (signal-value btor566) output-state))
       (cons 'SROA7 (signal (signal-value btor584) output-state))
       (cons 'SROB9 (signal (signal-value btor533) output-state))
       (cons 'SROA15 (signal (signal-value btor568) output-state))
       (cons 'ROB11 (signal (signal-value btor505) output-state))
       (cons 'ROA1 (signal (signal-value btor465) output-state))
       (cons 'SROB14 (signal (signal-value btor511) output-state))
       (cons 'P1 (signal (signal-value btor393) output-state))
       (cons 'P19 (signal (signal-value btor413) output-state))
       (cons 'ROB3 (signal (signal-value btor521) output-state))
       (cons 'P2 (signal (signal-value btor415) output-state))
       (cons 'ROA15 (signal (signal-value btor477) output-state))
       (cons 'SROA12 (signal (signal-value btor562) output-state))
       (cons 'ROB4 (signal (signal-value btor523) output-state))
       (cons 'ROA9 (signal (signal-value btor497) output-state))
       (cons 'ROA2 (signal (signal-value btor483) output-state))
       (cons 'P28 (signal (signal-value btor433) output-state))
       (cons 'P11 (signal (signal-value btor397) output-state))
       (cons 'ROB12 (signal (signal-value btor507) output-state))
       (cons 'P27 (signal (signal-value btor431) output-state))
       (cons 'P8 (signal (signal-value btor459) output-state))
       (cons 'SROB13 (signal (signal-value btor509) output-state))
       (cons 'SROB8 (signal (signal-value btor531) output-state))
       (cons 'P21 (signal (signal-value btor419) output-state))
       (cons 'SROB2 (signal (signal-value btor519) output-state))
       (cons 'ROA8 (signal (signal-value btor495) output-state))
       (cons 'SROA0 (signal (signal-value btor554) output-state))
       (cons 'SROA6 (signal (signal-value btor582) output-state))
       (cons 'SROB12 (signal (signal-value btor507) output-state))
       (cons 'P29 (signal (signal-value btor435) output-state))
       (cons 'SROA13 (signal (signal-value btor564) output-state))
       (cons 'P10 (signal (signal-value btor395) output-state))
       (cons 'ROB13 (signal (signal-value btor509) output-state))
       (cons 'P26 (signal (signal-value btor429) output-state))
       (cons 'P9 (signal (signal-value btor461) output-state))
       (cons 'ROA10 (signal (signal-value btor467) output-state))
       (cons 'ROA3 (signal (signal-value btor485) output-state))
       (cons 'ROB5 (signal (signal-value btor525) output-state))
       (cons 'P3 (signal (signal-value btor437) output-state))
       (cons 'ROA16 (signal (signal-value btor479) output-state))
       (cons 'P17 (signal (signal-value btor409) output-state))
       (cons 'SROA5 (signal (signal-value btor580) output-state))
       (cons 'P16 (signal (signal-value btor407) output-state))
       (cons 'SROB7 (signal (signal-value btor529) output-state))
       (cons 'P20 (signal (signal-value btor417) output-state))
       (cons 'SROB1 (signal (signal-value btor501) output-state))
       (cons 'ROB9 (signal (signal-value btor533) output-state))
       (cons 'SROB5 (signal (signal-value btor525) output-state))
       (cons 'SROA3 (signal (signal-value btor576) output-state))
       (cons 'P34 (signal (signal-value btor447) output-state))
       (cons 'P14 (signal (signal-value btor403) output-state))
       (cons 'P22 (signal (signal-value btor421) output-state))
       (cons 'ROA7 (signal (signal-value btor493) output-state))
       (cons 'SIGNEDP (signal (signal-value btor540) output-state))
       (cons 'P7 (signal (signal-value btor457) output-state))
       (cons 'SROA11 (signal (signal-value btor560) output-state))
       (cons 'ROB15 (signal (signal-value btor513) output-state))
       (cons 'SROA17 (signal (signal-value btor572) output-state))
       (cons 'ROA14 (signal (signal-value btor475) output-state))
       (cons 'ROA6 (signal (signal-value btor491) output-state))
       (cons 'SROA4 (signal (signal-value btor578) output-state))
       (cons 'P15 (signal (signal-value btor405) output-state))
       (cons 'P23 (signal (signal-value btor423) output-state))
       (cons 'SROA16 (signal (signal-value btor570) output-state))
       (cons 'ROB8 (signal (signal-value btor531) output-state))
       (cons 'P35 (signal (signal-value btor449) output-state))
       (cons 'SROB6 (signal (signal-value btor527) output-state))
       (cons 'ROA13 (signal (signal-value btor473) output-state))
       (cons 'SROA10 (signal (signal-value btor558) output-state))
       (cons 'P6 (signal (signal-value btor455) output-state))
       (cons 'ROB14 (signal (signal-value btor511) output-state))
       (cons 'SROA1 (signal (signal-value btor556) output-state))
       (cons 'ROB17 (signal (signal-value btor517) output-state))
       (cons 'P12 (signal (signal-value btor399) output-state))
       (cons 'ROB1 (signal (signal-value btor501) output-state))
       (cons 'SROB3 (signal (signal-value btor521) output-state))
       (cons 'P24 (signal (signal-value btor425) output-state))
       (cons 'ROA12 (signal (signal-value btor471) output-state))
       (cons 'ROB7 (signal (signal-value btor529) output-state))
       (cons 'SROB16 (signal (signal-value btor515) output-state))
       (cons 'P32 (signal (signal-value btor443) output-state))
       (cons 'ROA5 (signal (signal-value btor489) output-state))
       (cons 'SROB10 (signal (signal-value btor503) output-state))
       (cons 'P5 (signal (signal-value btor453) output-state))
       (cons 'ROB16 (signal (signal-value btor515) output-state))
       (cons 'ROB10 (signal (signal-value btor503) output-state))
       (cons 'P4 (signal (signal-value btor451) output-state))
       (cons 'SROB17 (signal (signal-value btor517) output-state))
       (cons 'SROA2 (signal (signal-value btor574) output-state))
       (cons 'P33 (signal (signal-value btor445) output-state))
       (cons 'P13 (signal (signal-value btor401) output-state))
       (cons 'SROB4 (signal (signal-value btor523) output-state))
       (cons 'P25 (signal (signal-value btor427) output-state))
       (cons 'ROA11 (signal (signal-value btor469) output-state))
       (cons 'SROB11 (signal (signal-value btor505) output-state))
       (cons 'ROB0 (signal (signal-value btor499) output-state))
       (cons 'ROA4 (signal (signal-value btor487) output-state))
       (cons 'ROB6 (signal (signal-value btor527) output-state))))))
