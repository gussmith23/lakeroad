#lang racket/base
(provide lattice-ecp5-mult18x18d)
(require "../signal.rkt")
(require rosette)
(define lattice-ecp5-mult18x18d
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
      #:C0
      (C0 (bv->signal (constant 'C0 (bitvector 1))))
      #:C1
      (C1 (bv->signal (constant 'C1 (bitvector 1))))
      #:C10
      (C10 (bv->signal (constant 'C10 (bitvector 1))))
      #:C11
      (C11 (bv->signal (constant 'C11 (bitvector 1))))
      #:C12
      (C12 (bv->signal (constant 'C12 (bitvector 1))))
      #:C13
      (C13 (bv->signal (constant 'C13 (bitvector 1))))
      #:C14
      (C14 (bv->signal (constant 'C14 (bitvector 1))))
      #:C15
      (C15 (bv->signal (constant 'C15 (bitvector 1))))
      #:C16
      (C16 (bv->signal (constant 'C16 (bitvector 1))))
      #:C17
      (C17 (bv->signal (constant 'C17 (bitvector 1))))
      #:C2
      (C2 (bv->signal (constant 'C2 (bitvector 1))))
      #:C3
      (C3 (bv->signal (constant 'C3 (bitvector 1))))
      #:C4
      (C4 (bv->signal (constant 'C4 (bitvector 1))))
      #:C5
      (C5 (bv->signal (constant 'C5 (bitvector 1))))
      #:C6
      (C6 (bv->signal (constant 'C6 (bitvector 1))))
      #:C7
      (C7 (bv->signal (constant 'C7 (bitvector 1))))
      #:C8
      (C8 (bv->signal (constant 'C8 (bitvector 1))))
      #:C9
      (C9 (bv->signal (constant 'C9 (bitvector 1))))
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
      #:CLK0_DIV
      (CLK0_DIV (bv->signal (constant 'CLK0_DIV (bitvector 5))))
      #:CLK1
      (CLK1 (bv->signal (constant 'CLK1 (bitvector 1))))
      #:CLK1_DIV
      (CLK1_DIV (bv->signal (constant 'CLK1_DIV (bitvector 5))))
      #:CLK2
      (CLK2 (bv->signal (constant 'CLK2 (bitvector 1))))
      #:CLK2_DIV
      (CLK2_DIV (bv->signal (constant 'CLK2_DIV (bitvector 5))))
      #:CLK3
      (CLK3 (bv->signal (constant 'CLK3 (bitvector 1))))
      #:CLK3_DIV
      (CLK3_DIV (bv->signal (constant 'CLK3_DIV (bitvector 5))))
      #:GSR
      (GSR (bv->signal (constant 'GSR (bitvector 5))))
      #:HIGHSPEED_CLK
      (HIGHSPEED_CLK (bv->signal (constant 'HIGHSPEED_CLK (bitvector 5))))
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
      #:REG_INPUTC_CE
      (REG_INPUTC_CE (bv->signal (constant 'REG_INPUTC_CE (bitvector 5))))
      #:REG_INPUTC_CLK
      (REG_INPUTC_CLK (bv->signal (constant 'REG_INPUTC_CLK (bitvector 5))))
      #:REG_INPUTC_RST
      (REG_INPUTC_RST (bv->signal (constant 'REG_INPUTC_RST (bitvector 5))))
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
      #:SOURCEB_MODE
      (SOURCEB_MODE (bv->signal (constant 'SOURCEB_MODE (bitvector 5))))
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
               (string->symbol (string-append name "state1335"))
               (bv 0 (bitvector 1))))
             (append
              (list
               (cons
                (string->symbol (string-append name "state1333"))
                (bv 0 (bitvector 1))))
              (append
               (list
                (cons
                 (string->symbol (string-append name "state1305"))
                 (bv 0 (bitvector 1))))
               (append
                (list
                 (cons
                  (string->symbol (string-append name "state1303"))
                  (bv 0 (bitvector 1))))
                (append
                 (list
                  (cons
                   (string->symbol (string-append name "state1266"))
                   (bv 0 (bitvector 1))))
                 (append
                  (list
                   (cons
                    (string->symbol (string-append name "state1264"))
                    (bv 0 (bitvector 1))))
                  (append
                   (list
                    (cons
                     (string->symbol (string-append name "state1236"))
                     (bv 0 (bitvector 1))))
                   (append
                    (list
                     (cons
                      (string->symbol (string-append name "state1234"))
                      (bv 0 (bitvector 1))))
                    (append
                     (list
                      (cons
                       (string->symbol (string-append name "state1205"))
                       (bv 0 (bitvector 1))))
                     (append
                      (list
                       (cons
                        (string->symbol (string-append name "state1203"))
                        (bv 0 (bitvector 1))))
                      (append
                       (list
                        (cons
                         (string->symbol (string-append name "state1175"))
                         (bv 0 (bitvector 1))))
                       (append
                        (list
                         (cons
                          (string->symbol (string-append name "state1173"))
                          (bv 0 (bitvector 1))))
                        (append
                         (list
                          (cons
                           (string->symbol (string-append name "state1144"))
                           (bv 0 (bitvector 1))))
                         (append
                          (list
                           (cons
                            (string->symbol (string-append name "state1142"))
                            (bv 0 (bitvector 1))))
                          (append
                           (list
                            (cons
                             (string->symbol (string-append name "state1114"))
                             (bv 0 (bitvector 1))))
                           (append
                            (list
                             (cons
                              (string->symbol (string-append name "state1112"))
                              (bv 0 (bitvector 1))))
                            (append
                             (list
                              (cons
                               (string->symbol
                                (string-append name "state1082"))
                               (bv 0 (bitvector 1))))
                             (append
                              (list
                               (cons
                                (string->symbol
                                 (string-append name "state1080"))
                                (bv 0 (bitvector 1))))
                              (append
                               (list
                                (cons
                                 (string->symbol
                                  (string-append name "state1048"))
                                 (bv 0 (bitvector 1))))
                               (append
                                (list
                                 (cons
                                  (string->symbol
                                   (string-append name "state1046"))
                                  (bv 0 (bitvector 1))))
                                (append
                                 (list
                                  (cons
                                   (string->symbol
                                    (string-append name "state928"))
                                   (bv 0 (bitvector 1))))
                                 (append
                                  (list
                                   (cons
                                    (string->symbol
                                     (string-append name "state926"))
                                    (bv 0 (bitvector 18))))
                                  (append
                                   (list
                                    (cons
                                     (string->symbol
                                      (string-append name "state917"))
                                     (bv 0 (bitvector 18))))
                                   (append
                                    (list
                                     (cons
                                      (string->symbol
                                       (string-append name "state910"))
                                      (bv 0 (bitvector 1))))
                                    (append
                                     (list
                                      (cons
                                       (string->symbol
                                        (string-append name "state707"))
                                       (bv 0 (bitvector 1))))
                                     (append
                                      (list
                                       (cons
                                        (string->symbol
                                         (string-append name "state654"))
                                        (bv 0 (bitvector 1))))
                                      (append
                                       (list
                                        (cons
                                         (string->symbol
                                          (string-append name "state652"))
                                         (bv 0 (bitvector 18))))
                                       (append
                                        (list
                                         (cons
                                          (string->symbol
                                           (string-append name "state603"))
                                          (bv 0 (bitvector 1))))
                                        (append
                                         (list
                                          (cons
                                           (string->symbol
                                            (string-append name "state601"))
                                           (bv 0 (bitvector 1))))
                                         (append
                                          (list
                                           (cons
                                            (string->symbol
                                             (string-append name "state599"))
                                            (bv 0 (bitvector 1))))
                                          (append
                                           (list
                                            (cons
                                             (string->symbol
                                              (string-append name "state561"))
                                             (bv 1 (bitvector 1))))
                                           (append
                                            (list
                                             (cons
                                              (string->symbol
                                               (string-append name "state542"))
                                              (bv 0 (bitvector 1))))
                                            (append
                                             (list
                                              (cons
                                               (string->symbol
                                                (string-append
                                                 name
                                                 "state540"))
                                               (bv 0 (bitvector 1))))
                                             (append
                                              (list
                                               (cons
                                                (string->symbol
                                                 (string-append
                                                  name
                                                  "state538"))
                                                (bv 0 (bitvector 1))))
                                              (append
                                               (list
                                                (cons
                                                 (string->symbol
                                                  (string-append
                                                   name
                                                   "state527"))
                                                 (bv 0 (bitvector 18))))
                                               (append
                                                (list
                                                 (cons
                                                  (string->symbol
                                                   (string-append
                                                    name
                                                    "state503"))
                                                  (bv 1 (bitvector 1))))
                                                (append
                                                 (list
                                                  (cons
                                                   (string->symbol
                                                    (string-append
                                                     name
                                                     "state484"))
                                                   (bv 0 (bitvector 1))))
                                                 (append
                                                  (list
                                                   (cons
                                                    (string->symbol
                                                     (string-append
                                                      name
                                                      "state482"))
                                                    (bv 0 (bitvector 1))))
                                                  (append
                                                   (list
                                                    (cons
                                                     (string->symbol
                                                      (string-append
                                                       name
                                                       "state480"))
                                                     (bv 0 (bitvector 1))))
                                                   (append
                                                    (list
                                                     (cons
                                                      (string->symbol
                                                       (string-append
                                                        name
                                                        "state469"))
                                                      (bv 0 (bitvector 18))))
                                                    (append
                                                     (list
                                                      (cons
                                                       (string->symbol
                                                        (string-append
                                                         name
                                                         "state462"))
                                                       (bv 0 (bitvector 1))))
                                                     (append
                                                      (list
                                                       (cons
                                                        (string->symbol
                                                         (string-append
                                                          name
                                                          "state370"))
                                                        (bv 1 (bitvector 1))))
                                                      (append
                                                       (list
                                                        (cons
                                                         (string->symbol
                                                          (string-append
                                                           name
                                                           "state351"))
                                                         (bv 0 (bitvector 1))))
                                                       (append
                                                        (list
                                                         (cons
                                                          (string->symbol
                                                           (string-append
                                                            name
                                                            "state349"))
                                                          (bv
                                                           0
                                                           (bitvector 1))))
                                                        (append
                                                         (list
                                                          (cons
                                                           (string->symbol
                                                            (string-append
                                                             name
                                                             "state337"))
                                                           (bv
                                                            0
                                                            (bitvector 18))))
                                                         (append
                                                          (list
                                                           (cons
                                                            (string->symbol
                                                             (string-append
                                                              name
                                                              "state328"))
                                                            (bv
                                                             1
                                                             (bitvector 1))))
                                                          (append
                                                           (list
                                                            (cons
                                                             (string->symbol
                                                              (string-append
                                                               name
                                                               "state309"))
                                                             (bv
                                                              0
                                                              (bitvector 1))))
                                                           (append
                                                            (list
                                                             (cons
                                                              (string->symbol
                                                               (string-append
                                                                name
                                                                "state307"))
                                                              (bv
                                                               0
                                                               (bitvector 1))))
                                                            (append
                                                             (list
                                                              (cons
                                                               (string->symbol
                                                                (string-append
                                                                 name
                                                                 "state295"))
                                                               (bv
                                                                0
                                                                (bitvector
                                                                 36))))
                                                             (append
                                                              (list
                                                               (cons
                                                                (string->symbol
                                                                 (string-append
                                                                  name
                                                                  "state288"))
                                                                (bv
                                                                 1
                                                                 (bitvector
                                                                  1))))
                                                              (append
                                                               (list
                                                                (cons
                                                                 (string->symbol
                                                                  (string-append
                                                                   name
                                                                   "state268"))
                                                                 (bv
                                                                  0
                                                                  (bitvector
                                                                   1))))
                                                               (append
                                                                (list
                                                                 (cons
                                                                  (string->symbol
                                                                   (string-append
                                                                    name
                                                                    "state266"))
                                                                  (bv
                                                                   0
                                                                   (bitvector
                                                                    1))))
                                                                (append
                                                                 (list
                                                                  (cons
                                                                   (string->symbol
                                                                    (string-append
                                                                     name
                                                                     "state251"))
                                                                   (bv
                                                                    0
                                                                    (bitvector
                                                                     1))))
                                                                 (append
                                                                  (list
                                                                   (cons
                                                                    (string->symbol
                                                                     (string-append
                                                                      name
                                                                      "state249"))
                                                                    (bv
                                                                     0
                                                                     (bitvector
                                                                      1))))
                                                                  (append
                                                                   (list
                                                                    (cons
                                                                     (string->symbol
                                                                      (string-append
                                                                       name
                                                                       "state247"))
                                                                     (bv
                                                                      0
                                                                      (bitvector
                                                                       1))))
                                                                   (append
                                                                    (list
                                                                     (cons
                                                                      (string->symbol
                                                                       (string-append
                                                                        name
                                                                        "state238"))
                                                                      (bv
                                                                       1
                                                                       (bitvector
                                                                        1))))
                                                                    (append
                                                                     (list
                                                                      (cons
                                                                       (string->symbol
                                                                        (string-append
                                                                         name
                                                                         "state236"))
                                                                       (bv
                                                                        0
                                                                        (bitvector
                                                                         1))))
                                                                     (append
                                                                      (list
                                                                       (cons
                                                                        (string->symbol
                                                                         (string-append
                                                                          name
                                                                          "state234"))
                                                                        (bv
                                                                         0
                                                                         (bitvector
                                                                          1))))
                                                                      (append
                                                                       (list
                                                                        (cons
                                                                         (string->symbol
                                                                          (string-append
                                                                           name
                                                                           "state220"))
                                                                         (bv
                                                                          0
                                                                          (bitvector
                                                                           1))))
                                                                       (append
                                                                        (list
                                                                         (cons
                                                                          (string->symbol
                                                                           (string-append
                                                                            name
                                                                            "state218"))
                                                                          (bv
                                                                           0
                                                                           (bitvector
                                                                            1))))
                                                                        (append
                                                                         (list
                                                                          (cons
                                                                           (string->symbol
                                                                            (string-append
                                                                             name
                                                                             "state216"))
                                                                           (bv
                                                                            0
                                                                            (bitvector
                                                                             1))))
                                                                         (append
                                                                          (list
                                                                           (cons
                                                                            (string->symbol
                                                                             (string-append
                                                                              name
                                                                              "state207"))
                                                                            (bv
                                                                             1
                                                                             (bitvector
                                                                              1))))
                                                                          (append
                                                                           (list
                                                                            (cons
                                                                             (string->symbol
                                                                              (string-append
                                                                               name
                                                                               "state205"))
                                                                             (bv
                                                                              0
                                                                              (bitvector
                                                                               1))))
                                                                           (append
                                                                            (list
                                                                             (cons
                                                                              (string->symbol
                                                                               (string-append
                                                                                name
                                                                                "state203"))
                                                                              (bv
                                                                               0
                                                                               (bitvector
                                                                                1))))
                                                                            (append
                                                                             (list
                                                                              (cons
                                                                               (string->symbol
                                                                                (string-append
                                                                                 name
                                                                                 "state188"))
                                                                               (bv
                                                                                0
                                                                                (bitvector
                                                                                 1))))
                                                                             (append
                                                                              (list
                                                                               (cons
                                                                                (string->symbol
                                                                                 (string-append
                                                                                  name
                                                                                  "state186"))
                                                                                (bv
                                                                                 0
                                                                                 (bitvector
                                                                                  1))))
                                                                              (append
                                                                               (list
                                                                                (cons
                                                                                 (string->symbol
                                                                                  (string-append
                                                                                   name
                                                                                   "state184"))
                                                                                 (bv
                                                                                  0
                                                                                  (bitvector
                                                                                   1))))
                                                                               (append
                                                                                (list
                                                                                 (cons
                                                                                  (string->symbol
                                                                                   (string-append
                                                                                    name
                                                                                    "state175"))
                                                                                  (bv
                                                                                   1
                                                                                   (bitvector
                                                                                    1))))
                                                                                (append
                                                                                 (list
                                                                                  (cons
                                                                                   (string->symbol
                                                                                    (string-append
                                                                                     name
                                                                                     "state173"))
                                                                                   (bv
                                                                                    0
                                                                                    (bitvector
                                                                                     1))))
                                                                                 (append
                                                                                  (list
                                                                                   (cons
                                                                                    (string->symbol
                                                                                     (string-append
                                                                                      name
                                                                                      "state171"))
                                                                                    (bv
                                                                                     0
                                                                                     (bitvector
                                                                                      1))))
                                                                                  (append
                                                                                   (list
                                                                                    (cons
                                                                                     (string->symbol
                                                                                      (string-append
                                                                                       name
                                                                                       "state159"))
                                                                                     (bv
                                                                                      0
                                                                                      (bitvector
                                                                                       1))))
                                                                                   (append
                                                                                    (list
                                                                                     (cons
                                                                                      (string->symbol
                                                                                       (string-append
                                                                                        name
                                                                                        "state157"))
                                                                                      (bv
                                                                                       0
                                                                                       (bitvector
                                                                                        1))))
                                                                                    (append
                                                                                     (list
                                                                                      (cons
                                                                                       (string->symbol
                                                                                        (string-append
                                                                                         name
                                                                                         "state155"))
                                                                                       (bv
                                                                                        0
                                                                                        (bitvector
                                                                                         1))))
                                                                                     (append
                                                                                      (list
                                                                                       (cons
                                                                                        (string->symbol
                                                                                         (string-append
                                                                                          name
                                                                                          "state144"))
                                                                                        (bv
                                                                                         1
                                                                                         (bitvector
                                                                                          1))))
                                                                                      (append
                                                                                       (list
                                                                                        (cons
                                                                                         (string->symbol
                                                                                          (string-append
                                                                                           name
                                                                                           "state141"))
                                                                                         (bv
                                                                                          0
                                                                                          (bitvector
                                                                                           1))))
                                                                                       (append
                                                                                        (list
                                                                                         (cons
                                                                                          (string->symbol
                                                                                           (string-append
                                                                                            name
                                                                                            "state139"))
                                                                                          (bv
                                                                                           0
                                                                                           (bitvector
                                                                                            1))))
                                                                                        (append
                                                                                         (list
                                                                                          (cons
                                                                                           (string->symbol
                                                                                            (string-append
                                                                                             name
                                                                                             "state136"))
                                                                                           (bv
                                                                                            0
                                                                                            (bitvector
                                                                                             36))))
                                                                                         (list)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
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
           (btor38 C0)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state C0)))
           (btor39 C1)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state C1)))
           (btor40 C10)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state C10)))
           (btor41 C11)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state C11)))
           (btor42 C12)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state C12)))
           (btor43 C13)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state C13)))
           (btor44 C14)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state C14)))
           (btor45 C15)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state C15)))
           (btor46 C16)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state C16)))
           (btor47 C17)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state C17)))
           (btor48 C2)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state C2)))
           (btor49 C3)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state C3)))
           (btor50 C4)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state C4)))
           (btor51 C5)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state C5)))
           (btor52 C6)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state C6)))
           (btor53 C7)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state C7)))
           (btor54 C8)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state C8)))
           (btor55 C9)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state C9)))
           (btor56 (bitvector 5))
           (btor57 CAS_MATCH_REG)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state CAS_MATCH_REG)))
           (btor58 CE0)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CE0)))
           (btor59 CE1)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CE1)))
           (btor60 CE2)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CE2)))
           (btor61 CE3)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CE3)))
           (btor62 CLK0)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CLK0)))
           (btor63 CLK0_DIV)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CLK0_DIV)))
           (btor64 CLK1)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CLK1)))
           (btor65 CLK1_DIV)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CLK1_DIV)))
           (btor66 CLK2)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CLK2)))
           (btor67 CLK2_DIV)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CLK2_DIV)))
           (btor68 CLK3)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CLK3)))
           (btor69 CLK3_DIV)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CLK3_DIV)))
           (btor70 GSR)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state GSR)))
           (btor71 HIGHSPEED_CLK)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state HIGHSPEED_CLK)))
           (btor72 MULT_BYPASS)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MULT_BYPASS)))
           (btor73 REG_INPUTA_CE)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state REG_INPUTA_CE)))
           (btor74 REG_INPUTA_CLK)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state REG_INPUTA_CLK)))
           (btor75 REG_INPUTA_RST)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state REG_INPUTA_RST)))
           (btor76 REG_INPUTB_CE)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state REG_INPUTB_CE)))
           (btor77 REG_INPUTB_CLK)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state REG_INPUTB_CLK)))
           (btor78 REG_INPUTB_RST)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state REG_INPUTB_RST)))
           (btor79 REG_INPUTC_CE)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state REG_INPUTC_CE)))
           (btor80 REG_INPUTC_CLK)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state REG_INPUTC_CLK)))
           (btor81 REG_INPUTC_RST)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state REG_INPUTC_RST)))
           (btor82 REG_OUTPUT_CE)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state REG_OUTPUT_CE)))
           (btor83 REG_OUTPUT_CLK)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state REG_OUTPUT_CLK)))
           (btor84 REG_OUTPUT_RST)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state REG_OUTPUT_RST)))
           (btor85 REG_PIPELINE_CE)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state REG_PIPELINE_CE)))
           (btor86 REG_PIPELINE_CLK)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state REG_PIPELINE_CLK)))
           (btor87 REG_PIPELINE_RST)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state REG_PIPELINE_RST)))
           (btor88 RST0)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state RST0)))
           (btor89 RST1)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state RST1)))
           (btor90 RST2)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state RST2)))
           (btor91 RST3)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state RST3)))
           (btor92 SIGNEDA)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SIGNEDA)))
           (btor93 SIGNEDB)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SIGNEDB)))
           (btor94 SOURCEA)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SOURCEA)))
           (btor95 SOURCEB)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SOURCEB)))
           (btor96 SOURCEB_MODE)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SOURCEB_MODE)))
           (btor97 SRIA0)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SRIA0)))
           (btor98 SRIA1)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SRIA1)))
           (btor99 SRIA10)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SRIA10)))
           (btor100 SRIA11)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SRIA11)))
           (btor101 SRIA12)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SRIA12)))
           (btor102 SRIA13)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SRIA13)))
           (btor103 SRIA14)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SRIA14)))
           (btor104 SRIA15)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SRIA15)))
           (btor105 SRIA16)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SRIA16)))
           (btor106 SRIA17)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SRIA17)))
           (btor107 SRIA2)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SRIA2)))
           (btor108 SRIA3)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SRIA3)))
           (btor109 SRIA4)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SRIA4)))
           (btor110 SRIA5)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SRIA5)))
           (btor111 SRIA6)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SRIA6)))
           (btor112 SRIA7)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SRIA7)))
           (btor113 SRIA8)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SRIA8)))
           (btor114 SRIA9)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SRIA9)))
           (btor115 SRIB0)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SRIB0)))
           (btor116 SRIB1)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SRIB1)))
           (btor117 SRIB10)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SRIB10)))
           (btor118 SRIB11)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SRIB11)))
           (btor119 SRIB12)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SRIB12)))
           (btor120 SRIB13)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SRIB13)))
           (btor121 SRIB14)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SRIB14)))
           (btor122 SRIB15)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SRIB15)))
           (btor123 SRIB16)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SRIB16)))
           (btor124 SRIB17)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SRIB17)))
           (btor125 SRIB2)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SRIB2)))
           (btor126 SRIB3)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SRIB3)))
           (btor127 SRIB4)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SRIB4)))
           (btor128 SRIB5)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SRIB5)))
           (btor129 SRIB6)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SRIB6)))
           (btor130 SRIB7)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SRIB7)))
           (btor131 SRIB8)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SRIB8)))
           (btor132 SRIB9)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SRIB9)))
           (btor133 (bitvector 36))
           (btor134 (bv->signal (bv 0 (bitvector 36))))
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
           (btor138 (bv->signal (bv 0 (bitvector 1))))
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
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
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
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor143 (bv->signal (bv 1 (bitvector 1))))
           (btor144
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state144")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state144"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state144")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state144")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor146 (bitvector 2))
           (btor147
            (signal
             (concat (signal-value btor144) (signal-value btor68))
             (list)))
           (btor148
            (bv->signal
             (zero-extend (signal-value btor143) (bitvector 2))
             btor143))
           (btor149
            (signal
             (bool->bitvector
              (bveq (signal-value btor147) (signal-value btor148)))
             (list)))
           (btor150
            (if (bitvector->bool (signal-value btor149)) btor141 btor139))
           (btor151 (bv->signal (bv 3 (bitvector 2))))
           (btor152
            (bv->signal
             (zero-extend (signal-value btor151) (bitvector 5))
             btor151))
           (btor153
            (signal
             (bool->bitvector
              (bveq (signal-value btor69) (signal-value btor152)))
             (list)))
           (btor154
            (if (bitvector->bool (signal-value btor153)) btor150 btor68))
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
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
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
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
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
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor161
            (if (bitvector->bool (signal-value btor159)) btor157 btor155))
           (btor162 (signal (bvnot (signal-value btor153)) (list)))
           (btor163 (bitvector 3))
           (btor164 (bv->signal (bv 5 (bitvector 3))))
           (btor165
            (bv->signal
             (zero-extend (signal-value btor164) (bitvector 5))
             btor164))
           (btor166
            (signal
             (bool->bitvector
              (bveq (signal-value btor69) (signal-value btor165)))
             (list)))
           (btor167 (signal (bvnot (signal-value btor166)) (list)))
           (btor168
            (signal
             (bvand (signal-value btor162) (signal-value btor167))
             (list)))
           (btor169
            (signal
             (bvand (signal-value btor162) (signal-value btor168))
             (list)))
           (btor170
            (if (bitvector->bool (signal-value btor169)) btor161 btor154))
           (btor171
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state171")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state171"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state171")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state171")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
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
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor177
            (signal
             (concat (signal-value btor175) (signal-value btor66))
             (list)))
           (btor178
            (bv->signal
             (zero-extend (signal-value btor143) (bitvector 2))
             btor143))
           (btor179
            (signal
             (bool->bitvector
              (bveq (signal-value btor177) (signal-value btor178)))
             (list)))
           (btor180
            (if (bitvector->bool (signal-value btor179)) btor173 btor171))
           (btor181
            (bv->signal
             (zero-extend (signal-value btor151) (bitvector 5))
             btor151))
           (btor182
            (signal
             (bool->bitvector
              (bveq (signal-value btor67) (signal-value btor181)))
             (list)))
           (btor183
            (if (bitvector->bool (signal-value btor182)) btor180 btor66))
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
                          (bv 0 1))))))))
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
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor188
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state188")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state188"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state188")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state188")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor190
            (if (bitvector->bool (signal-value btor188)) btor186 btor184))
           (btor191 (signal (bvnot (signal-value btor182)) (list)))
           (btor192
            (bv->signal
             (zero-extend (signal-value btor164) (bitvector 5))
             btor164))
           (btor193
            (signal
             (bool->bitvector
              (bveq (signal-value btor67) (signal-value btor192)))
             (list)))
           (btor194 (signal (bvnot (signal-value btor193)) (list)))
           (btor195
            (signal
             (bvand (signal-value btor191) (signal-value btor194))
             (list)))
           (btor196
            (signal
             (bvand (signal-value btor191) (signal-value btor195))
             (list)))
           (btor197
            (if (bitvector->bool (signal-value btor196)) btor190 btor183))
           (btor198 (bitvector 4))
           (btor199 (bv->signal (bv 13 (bitvector 4))))
           (btor200
            (bv->signal
             (zero-extend (signal-value btor199) (bitvector 5))
             btor199))
           (btor201
            (signal
             (bool->bitvector
              (bveq (signal-value btor83) (signal-value btor200)))
             (list)))
           (btor202
            (if (bitvector->bool (signal-value btor201)) btor197 btor170))
           (btor203
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state203")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state203"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state203")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state203")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
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
                          (bv 0 1))))))))
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
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor209
            (signal
             (concat (signal-value btor207) (signal-value btor64))
             (list)))
           (btor210
            (bv->signal
             (zero-extend (signal-value btor143) (bitvector 2))
             btor143))
           (btor211
            (signal
             (bool->bitvector
              (bveq (signal-value btor209) (signal-value btor210)))
             (list)))
           (btor212
            (if (bitvector->bool (signal-value btor211)) btor205 btor203))
           (btor213
            (bv->signal
             (zero-extend (signal-value btor151) (bitvector 5))
             btor151))
           (btor214
            (signal
             (bool->bitvector
              (bveq (signal-value btor65) (signal-value btor213)))
             (list)))
           (btor215
            (if (bitvector->bool (signal-value btor214)) btor212 btor64))
           (btor216
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state216")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state216"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state216")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state216")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor218
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state218")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state218"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state218")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state218")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor220
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state220")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state220"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state220")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state220")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor222
            (if (bitvector->bool (signal-value btor220)) btor218 btor216))
           (btor223 (signal (bvnot (signal-value btor214)) (list)))
           (btor224
            (bv->signal
             (zero-extend (signal-value btor164) (bitvector 5))
             btor164))
           (btor225
            (signal
             (bool->bitvector
              (bveq (signal-value btor65) (signal-value btor224)))
             (list)))
           (btor226 (signal (bvnot (signal-value btor225)) (list)))
           (btor227
            (signal
             (bvand (signal-value btor223) (signal-value btor226))
             (list)))
           (btor228
            (signal
             (bvand (signal-value btor223) (signal-value btor227))
             (list)))
           (btor229
            (if (bitvector->bool (signal-value btor228)) btor222 btor215))
           (btor230 (bv->signal (bv 12 (bitvector 4))))
           (btor231
            (bv->signal
             (zero-extend (signal-value btor230) (bitvector 5))
             btor230))
           (btor232
            (signal
             (bool->bitvector
              (bveq (signal-value btor83) (signal-value btor231)))
             (list)))
           (btor233
            (if (bitvector->bool (signal-value btor232)) btor229 btor202))
           (btor234
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state234")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state234"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state234")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state234")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor236
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state236")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state236"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state236")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state236")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor238
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state238")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state238"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state238")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state238")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor240
            (signal
             (concat (signal-value btor238) (signal-value btor62))
             (list)))
           (btor241
            (bv->signal
             (zero-extend (signal-value btor143) (bitvector 2))
             btor143))
           (btor242
            (signal
             (bool->bitvector
              (bveq (signal-value btor240) (signal-value btor241)))
             (list)))
           (btor243
            (if (bitvector->bool (signal-value btor242)) btor236 btor234))
           (btor244
            (bv->signal
             (zero-extend (signal-value btor151) (bitvector 5))
             btor151))
           (btor245
            (signal
             (bool->bitvector
              (bveq (signal-value btor63) (signal-value btor244)))
             (list)))
           (btor246
            (if (bitvector->bool (signal-value btor245)) btor243 btor62))
           (btor247
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state247")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state247"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state247")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state247")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor249
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state249")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state249"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state249")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state249")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor251
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state251")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state251"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state251")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state251")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor253
            (if (bitvector->bool (signal-value btor251)) btor249 btor247))
           (btor254 (signal (bvnot (signal-value btor245)) (list)))
           (btor255
            (bv->signal
             (zero-extend (signal-value btor164) (bitvector 5))
             btor164))
           (btor256
            (signal
             (bool->bitvector
              (bveq (signal-value btor63) (signal-value btor255)))
             (list)))
           (btor257 (signal (bvnot (signal-value btor256)) (list)))
           (btor258
            (signal
             (bvand (signal-value btor254) (signal-value btor257))
             (list)))
           (btor259
            (signal
             (bvand (signal-value btor254) (signal-value btor258))
             (list)))
           (btor260
            (if (bitvector->bool (signal-value btor259)) btor253 btor246))
           (btor261 (bv->signal (bv 11 (bitvector 4))))
           (btor262
            (bv->signal
             (zero-extend (signal-value btor261) (bitvector 5))
             btor261))
           (btor263
            (signal
             (bool->bitvector
              (bveq (signal-value btor83) (signal-value btor262)))
             (list)))
           (btor264
            (if (bitvector->bool (signal-value btor263)) btor260 btor233))
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
           (btor266
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state266")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state266"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state266")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state266")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor268
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state268")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state268"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state268")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state268")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor270
            (if (bitvector->bool (signal-value btor268)) btor266 btor265))
           (btor271 (signal (bvnot (signal-value btor263)) (list)))
           (btor272 (signal (bvnot (signal-value btor232)) (list)))
           (btor273 (signal (bvnot (signal-value btor201)) (list)))
           (btor274 (bv->signal (bv 14 (bitvector 4))))
           (btor275
            (bv->signal
             (zero-extend (signal-value btor274) (bitvector 5))
             btor274))
           (btor276
            (signal
             (bool->bitvector
              (bveq (signal-value btor83) (signal-value btor275)))
             (list)))
           (btor277 (signal (bvnot (signal-value btor276)) (list)))
           (btor278
            (signal
             (bvand (signal-value btor273) (signal-value btor277))
             (list)))
           (btor279
            (signal
             (bvand (signal-value btor272) (signal-value btor278))
             (list)))
           (btor280
            (signal
             (bvand (signal-value btor271) (signal-value btor279))
             (list)))
           (btor281
            (signal
             (bvand (signal-value btor273) (signal-value btor280))
             (list)))
           (btor282
            (signal
             (bvand (signal-value btor272) (signal-value btor281))
             (list)))
           (btor283
            (signal
             (bvand (signal-value btor271) (signal-value btor282))
             (list)))
           (btor284
            (signal
             (bvand (signal-value btor272) (signal-value btor283))
             (list)))
           (btor285
            (signal
             (bvand (signal-value btor271) (signal-value btor284))
             (list)))
           (btor286
            (signal
             (bvand (signal-value btor271) (signal-value btor285))
             (list)))
           (btor287
            (if (bitvector->bool (signal-value btor286)) btor270 btor264))
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
             (zero-extend (signal-value btor143) (bitvector 2))
             btor143))
           (btor292
            (signal
             (bool->bitvector
              (bveq (signal-value btor290) (signal-value btor291)))
             (list)))
           (btor293
            (if (bitvector->bool (signal-value btor292)) btor136 btor135))
           (btor294
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state294")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state294"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state294")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state294")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 36))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor295
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state295")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state295"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state295")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state295")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 36))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor297
            (bv->signal
             (zero-extend (signal-value btor199) (bitvector 5))
             btor199))
           (btor298
            (signal
             (bool->bitvector
              (bveq (signal-value btor86) (signal-value btor297)))
             (list)))
           (btor299
            (if (bitvector->bool (signal-value btor298)) btor197 btor170))
           (btor300
            (bv->signal
             (zero-extend (signal-value btor230) (bitvector 5))
             btor230))
           (btor301
            (signal
             (bool->bitvector
              (bveq (signal-value btor86) (signal-value btor300)))
             (list)))
           (btor302
            (if (bitvector->bool (signal-value btor301)) btor229 btor299))
           (btor303
            (bv->signal
             (zero-extend (signal-value btor261) (bitvector 5))
             btor261))
           (btor304
            (signal
             (bool->bitvector
              (bveq (signal-value btor86) (signal-value btor303)))
             (list)))
           (btor305
            (if (bitvector->bool (signal-value btor304)) btor260 btor302))
           (btor306
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state306")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state306"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state306")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state306")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor307
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state307")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state307"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state307")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state307")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor309
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state309")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state309"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state309")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state309")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor311
            (if (bitvector->bool (signal-value btor309)) btor307 btor306))
           (btor312 (signal (bvnot (signal-value btor304)) (list)))
           (btor313 (signal (bvnot (signal-value btor301)) (list)))
           (btor314 (signal (bvnot (signal-value btor298)) (list)))
           (btor315
            (bv->signal
             (zero-extend (signal-value btor274) (bitvector 5))
             btor274))
           (btor316
            (signal
             (bool->bitvector
              (bveq (signal-value btor86) (signal-value btor315)))
             (list)))
           (btor317 (signal (bvnot (signal-value btor316)) (list)))
           (btor318
            (signal
             (bvand (signal-value btor314) (signal-value btor317))
             (list)))
           (btor319
            (signal
             (bvand (signal-value btor313) (signal-value btor318))
             (list)))
           (btor320
            (signal
             (bvand (signal-value btor312) (signal-value btor319))
             (list)))
           (btor321
            (signal
             (bvand (signal-value btor314) (signal-value btor320))
             (list)))
           (btor322
            (signal
             (bvand (signal-value btor313) (signal-value btor321))
             (list)))
           (btor323
            (signal
             (bvand (signal-value btor312) (signal-value btor322))
             (list)))
           (btor324
            (signal
             (bvand (signal-value btor313) (signal-value btor323))
             (list)))
           (btor325
            (signal
             (bvand (signal-value btor312) (signal-value btor324))
             (list)))
           (btor326
            (signal
             (bvand (signal-value btor312) (signal-value btor325))
             (list)))
           (btor327
            (if (bitvector->bool (signal-value btor326)) btor311 btor305))
           (btor328
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state328")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state328"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state328")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state328")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor330
            (signal
             (concat (signal-value btor328) (signal-value btor327))
             (list)))
           (btor331
            (bv->signal
             (zero-extend (signal-value btor143) (bitvector 2))
             btor143))
           (btor332
            (signal
             (bool->bitvector
              (bveq (signal-value btor330) (signal-value btor331)))
             (list)))
           (btor333
            (if (bitvector->bool (signal-value btor332)) btor295 btor294))
           (btor334 (bitvector 18))
           (btor335
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state335")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state335"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state335")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state335")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor336 (bv->signal (bv 0 (bitvector 18))))
           (btor337
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state337")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state337"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state337")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state337")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor339
            (bv->signal
             (zero-extend (signal-value btor199) (bitvector 5))
             btor199))
           (btor340
            (signal
             (bool->bitvector
              (bveq (signal-value btor74) (signal-value btor339)))
             (list)))
           (btor341
            (if (bitvector->bool (signal-value btor340)) btor197 btor170))
           (btor342
            (bv->signal
             (zero-extend (signal-value btor230) (bitvector 5))
             btor230))
           (btor343
            (signal
             (bool->bitvector
              (bveq (signal-value btor74) (signal-value btor342)))
             (list)))
           (btor344
            (if (bitvector->bool (signal-value btor343)) btor229 btor341))
           (btor345
            (bv->signal
             (zero-extend (signal-value btor261) (bitvector 5))
             btor261))
           (btor346
            (signal
             (bool->bitvector
              (bveq (signal-value btor74) (signal-value btor345)))
             (list)))
           (btor347
            (if (bitvector->bool (signal-value btor346)) btor260 btor344))
           (btor348
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state348")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state348"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state348")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state348")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor349
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state349")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state349"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state349")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state349")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor351
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state351")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state351"))))))
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
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor353
            (if (bitvector->bool (signal-value btor351)) btor349 btor348))
           (btor354 (signal (bvnot (signal-value btor346)) (list)))
           (btor355 (signal (bvnot (signal-value btor343)) (list)))
           (btor356 (signal (bvnot (signal-value btor340)) (list)))
           (btor357
            (bv->signal
             (zero-extend (signal-value btor274) (bitvector 5))
             btor274))
           (btor358
            (signal
             (bool->bitvector
              (bveq (signal-value btor74) (signal-value btor357)))
             (list)))
           (btor359 (signal (bvnot (signal-value btor358)) (list)))
           (btor360
            (signal
             (bvand (signal-value btor356) (signal-value btor359))
             (list)))
           (btor361
            (signal
             (bvand (signal-value btor355) (signal-value btor360))
             (list)))
           (btor362
            (signal
             (bvand (signal-value btor354) (signal-value btor361))
             (list)))
           (btor363
            (signal
             (bvand (signal-value btor356) (signal-value btor362))
             (list)))
           (btor364
            (signal
             (bvand (signal-value btor355) (signal-value btor363))
             (list)))
           (btor365
            (signal
             (bvand (signal-value btor354) (signal-value btor364))
             (list)))
           (btor366
            (signal
             (bvand (signal-value btor355) (signal-value btor365))
             (list)))
           (btor367
            (signal
             (bvand (signal-value btor354) (signal-value btor366))
             (list)))
           (btor368
            (signal
             (bvand (signal-value btor354) (signal-value btor367))
             (list)))
           (btor369
            (if (bitvector->bool (signal-value btor368)) btor353 btor347))
           (btor370
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state370")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state370"))))))
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
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor372
            (signal
             (concat (signal-value btor370) (signal-value btor369))
             (list)))
           (btor373
            (bv->signal
             (zero-extend (signal-value btor143) (bitvector 2))
             btor143))
           (btor374
            (signal
             (bool->bitvector
              (bveq (signal-value btor372) (signal-value btor373)))
             (list)))
           (btor375
            (if (bitvector->bool (signal-value btor374)) btor337 btor335))
           (btor376
            (signal (concat (signal-value btor3) (signal-value btor2)) (list)))
           (btor377
            (signal
             (concat (signal-value btor12) (signal-value btor376))
             (list)))
           (btor378
            (signal
             (concat (signal-value btor13) (signal-value btor377))
             (list)))
           (btor379
            (signal
             (concat (signal-value btor14) (signal-value btor378))
             (list)))
           (btor380 (bitvector 6))
           (btor381
            (signal
             (concat (signal-value btor15) (signal-value btor379))
             (list)))
           (btor382 (bitvector 7))
           (btor383
            (signal
             (concat (signal-value btor16) (signal-value btor381))
             (list)))
           (btor384 (bitvector 8))
           (btor385
            (signal
             (concat (signal-value btor17) (signal-value btor383))
             (list)))
           (btor386 (bitvector 9))
           (btor387
            (signal
             (concat (signal-value btor18) (signal-value btor385))
             (list)))
           (btor388 (bitvector 10))
           (btor389
            (signal
             (concat (signal-value btor19) (signal-value btor387))
             (list)))
           (btor390 (bitvector 11))
           (btor391
            (signal
             (concat (signal-value btor4) (signal-value btor389))
             (list)))
           (btor392 (bitvector 12))
           (btor393
            (signal
             (concat (signal-value btor5) (signal-value btor391))
             (list)))
           (btor394 (bitvector 13))
           (btor395
            (signal
             (concat (signal-value btor6) (signal-value btor393))
             (list)))
           (btor396 (bitvector 14))
           (btor397
            (signal
             (concat (signal-value btor7) (signal-value btor395))
             (list)))
           (btor398 (bitvector 15))
           (btor399
            (signal
             (concat (signal-value btor8) (signal-value btor397))
             (list)))
           (btor400 (bitvector 16))
           (btor401
            (signal
             (concat (signal-value btor9) (signal-value btor399))
             (list)))
           (btor402 (bitvector 17))
           (btor403
            (signal
             (concat (signal-value btor10) (signal-value btor401))
             (list)))
           (btor404
            (signal
             (concat (signal-value btor11) (signal-value btor403))
             (list)))
           (btor405
            (signal
             (concat (signal-value btor98) (signal-value btor97))
             (list)))
           (btor406
            (signal
             (concat (signal-value btor107) (signal-value btor405))
             (list)))
           (btor407
            (signal
             (concat (signal-value btor108) (signal-value btor406))
             (list)))
           (btor408
            (signal
             (concat (signal-value btor109) (signal-value btor407))
             (list)))
           (btor409
            (signal
             (concat (signal-value btor110) (signal-value btor408))
             (list)))
           (btor410
            (signal
             (concat (signal-value btor111) (signal-value btor409))
             (list)))
           (btor411
            (signal
             (concat (signal-value btor112) (signal-value btor410))
             (list)))
           (btor412
            (signal
             (concat (signal-value btor113) (signal-value btor411))
             (list)))
           (btor413
            (signal
             (concat (signal-value btor114) (signal-value btor412))
             (list)))
           (btor414
            (signal
             (concat (signal-value btor99) (signal-value btor413))
             (list)))
           (btor415
            (signal
             (concat (signal-value btor100) (signal-value btor414))
             (list)))
           (btor416
            (signal
             (concat (signal-value btor101) (signal-value btor415))
             (list)))
           (btor417
            (signal
             (concat (signal-value btor102) (signal-value btor416))
             (list)))
           (btor418
            (signal
             (concat (signal-value btor103) (signal-value btor417))
             (list)))
           (btor419
            (signal
             (concat (signal-value btor104) (signal-value btor418))
             (list)))
           (btor420
            (signal
             (concat (signal-value btor105) (signal-value btor419))
             (list)))
           (btor421
            (signal
             (concat (signal-value btor106) (signal-value btor420))
             (list)))
           (btor422
            (if (bitvector->bool (signal-value btor94)) btor421 btor404))
           (btor423
            (signal
             (apply bvor (bitvector->bits (signal-value btor74)))
             (signal-state btor74)))
           (btor424 (signal (bvnot (signal-value btor423)) (list)))
           (btor425
            (if (bitvector->bool (signal-value btor424)) btor422 btor375))
           (btor426
            (signal
             (extract 17 17 (signal-value btor425))
             (signal-state btor425)))
           (btor427
            (signal
             (extract 17 17 (signal-value btor425))
             (signal-state btor425)))
           (btor428
            (signal
             (concat (signal-value btor427) (signal-value btor426))
             (list)))
           (btor429
            (signal
             (extract 17 17 (signal-value btor425))
             (signal-state btor425)))
           (btor430
            (signal
             (concat (signal-value btor429) (signal-value btor428))
             (list)))
           (btor431
            (signal
             (extract 17 17 (signal-value btor425))
             (signal-state btor425)))
           (btor432
            (signal
             (concat (signal-value btor431) (signal-value btor430))
             (list)))
           (btor433
            (signal
             (extract 17 17 (signal-value btor425))
             (signal-state btor425)))
           (btor434
            (signal
             (concat (signal-value btor433) (signal-value btor432))
             (list)))
           (btor435
            (signal
             (extract 17 17 (signal-value btor425))
             (signal-state btor425)))
           (btor436
            (signal
             (concat (signal-value btor435) (signal-value btor434))
             (list)))
           (btor437
            (signal
             (extract 17 17 (signal-value btor425))
             (signal-state btor425)))
           (btor438
            (signal
             (concat (signal-value btor437) (signal-value btor436))
             (list)))
           (btor439
            (signal
             (extract 17 17 (signal-value btor425))
             (signal-state btor425)))
           (btor440
            (signal
             (concat (signal-value btor439) (signal-value btor438))
             (list)))
           (btor441
            (signal
             (extract 17 17 (signal-value btor425))
             (signal-state btor425)))
           (btor442
            (signal
             (concat (signal-value btor441) (signal-value btor440))
             (list)))
           (btor443
            (signal
             (extract 17 17 (signal-value btor425))
             (signal-state btor425)))
           (btor444
            (signal
             (concat (signal-value btor443) (signal-value btor442))
             (list)))
           (btor445
            (signal
             (extract 17 17 (signal-value btor425))
             (signal-state btor425)))
           (btor446
            (signal
             (concat (signal-value btor445) (signal-value btor444))
             (list)))
           (btor447
            (signal
             (extract 17 17 (signal-value btor425))
             (signal-state btor425)))
           (btor448
            (signal
             (concat (signal-value btor447) (signal-value btor446))
             (list)))
           (btor449
            (signal
             (extract 17 17 (signal-value btor425))
             (signal-state btor425)))
           (btor450
            (signal
             (concat (signal-value btor449) (signal-value btor448))
             (list)))
           (btor451
            (signal
             (extract 17 17 (signal-value btor425))
             (signal-state btor425)))
           (btor452
            (signal
             (concat (signal-value btor451) (signal-value btor450))
             (list)))
           (btor453
            (signal
             (extract 17 17 (signal-value btor425))
             (signal-state btor425)))
           (btor454
            (signal
             (concat (signal-value btor453) (signal-value btor452))
             (list)))
           (btor455
            (signal
             (extract 17 17 (signal-value btor425))
             (signal-state btor425)))
           (btor456
            (signal
             (concat (signal-value btor455) (signal-value btor454))
             (list)))
           (btor457
            (signal
             (extract 17 17 (signal-value btor425))
             (signal-state btor425)))
           (btor458
            (signal
             (concat (signal-value btor457) (signal-value btor456))
             (list)))
           (btor459
            (signal
             (extract 17 17 (signal-value btor425))
             (signal-state btor425)))
           (btor460
            (signal
             (concat (signal-value btor459) (signal-value btor458))
             (list)))
           (btor461
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state461")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state461"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state461")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state461")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor462
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state462")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state462"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state462")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state462")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor464
            (if (bitvector->bool (signal-value btor374)) btor462 btor461))
           (btor465
            (if (bitvector->bool (signal-value btor424)) btor92 btor464))
           (btor466
            (if (bitvector->bool (signal-value btor465)) btor460 btor336))
           (btor467
            (signal
             (concat (signal-value btor466) (signal-value btor425))
             (list)))
           (btor468
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state468")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state468"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state468")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state468")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor469
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state469")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state469"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state469")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state469")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor471
            (bv->signal
             (zero-extend (signal-value btor199) (bitvector 5))
             btor199))
           (btor472
            (signal
             (bool->bitvector
              (bveq (signal-value btor77) (signal-value btor471)))
             (list)))
           (btor473
            (if (bitvector->bool (signal-value btor472)) btor197 btor170))
           (btor474
            (bv->signal
             (zero-extend (signal-value btor230) (bitvector 5))
             btor230))
           (btor475
            (signal
             (bool->bitvector
              (bveq (signal-value btor77) (signal-value btor474)))
             (list)))
           (btor476
            (if (bitvector->bool (signal-value btor475)) btor229 btor473))
           (btor477
            (bv->signal
             (zero-extend (signal-value btor261) (bitvector 5))
             btor261))
           (btor478
            (signal
             (bool->bitvector
              (bveq (signal-value btor77) (signal-value btor477)))
             (list)))
           (btor479
            (if (bitvector->bool (signal-value btor478)) btor260 btor476))
           (btor480
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state480")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state480"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state480")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state480")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor482
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state482")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state482"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state482")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state482")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor484
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state484")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state484"))))))
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
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor486
            (if (bitvector->bool (signal-value btor484)) btor482 btor480))
           (btor487 (signal (bvnot (signal-value btor478)) (list)))
           (btor488 (signal (bvnot (signal-value btor475)) (list)))
           (btor489 (signal (bvnot (signal-value btor472)) (list)))
           (btor490
            (bv->signal
             (zero-extend (signal-value btor274) (bitvector 5))
             btor274))
           (btor491
            (signal
             (bool->bitvector
              (bveq (signal-value btor77) (signal-value btor490)))
             (list)))
           (btor492 (signal (bvnot (signal-value btor491)) (list)))
           (btor493
            (signal
             (bvand (signal-value btor489) (signal-value btor492))
             (list)))
           (btor494
            (signal
             (bvand (signal-value btor488) (signal-value btor493))
             (list)))
           (btor495
            (signal
             (bvand (signal-value btor487) (signal-value btor494))
             (list)))
           (btor496
            (signal
             (bvand (signal-value btor489) (signal-value btor495))
             (list)))
           (btor497
            (signal
             (bvand (signal-value btor488) (signal-value btor496))
             (list)))
           (btor498
            (signal
             (bvand (signal-value btor487) (signal-value btor497))
             (list)))
           (btor499
            (signal
             (bvand (signal-value btor488) (signal-value btor498))
             (list)))
           (btor500
            (signal
             (bvand (signal-value btor487) (signal-value btor499))
             (list)))
           (btor501
            (signal
             (bvand (signal-value btor487) (signal-value btor500))
             (list)))
           (btor502
            (if (bitvector->bool (signal-value btor501)) btor486 btor479))
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
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor505
            (signal
             (concat (signal-value btor503) (signal-value btor502))
             (list)))
           (btor506
            (bv->signal
             (zero-extend (signal-value btor143) (bitvector 2))
             btor143))
           (btor507
            (signal
             (bool->bitvector
              (bveq (signal-value btor505) (signal-value btor506)))
             (list)))
           (btor508
            (if (bitvector->bool (signal-value btor507)) btor469 btor468))
           (btor509
            (signal
             (concat (signal-value btor116) (signal-value btor115))
             (list)))
           (btor510
            (signal
             (concat (signal-value btor125) (signal-value btor509))
             (list)))
           (btor511
            (signal
             (concat (signal-value btor126) (signal-value btor510))
             (list)))
           (btor512
            (signal
             (concat (signal-value btor127) (signal-value btor511))
             (list)))
           (btor513
            (signal
             (concat (signal-value btor128) (signal-value btor512))
             (list)))
           (btor514
            (signal
             (concat (signal-value btor129) (signal-value btor513))
             (list)))
           (btor515
            (signal
             (concat (signal-value btor130) (signal-value btor514))
             (list)))
           (btor516
            (signal
             (concat (signal-value btor131) (signal-value btor515))
             (list)))
           (btor517
            (signal
             (concat (signal-value btor132) (signal-value btor516))
             (list)))
           (btor518
            (signal
             (concat (signal-value btor117) (signal-value btor517))
             (list)))
           (btor519
            (signal
             (concat (signal-value btor118) (signal-value btor518))
             (list)))
           (btor520
            (signal
             (concat (signal-value btor119) (signal-value btor519))
             (list)))
           (btor521
            (signal
             (concat (signal-value btor120) (signal-value btor520))
             (list)))
           (btor522
            (signal
             (concat (signal-value btor121) (signal-value btor521))
             (list)))
           (btor523
            (signal
             (concat (signal-value btor122) (signal-value btor522))
             (list)))
           (btor524
            (signal
             (concat (signal-value btor123) (signal-value btor523))
             (list)))
           (btor525
            (signal
             (concat (signal-value btor124) (signal-value btor524))
             (list)))
           (btor526
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state526")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state526"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state526")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state526")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor527
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state527")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state527"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state527")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state527")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor529
            (bv->signal
             (zero-extend (signal-value btor199) (bitvector 5))
             btor199))
           (btor530
            (signal
             (bool->bitvector
              (bveq (signal-value btor80) (signal-value btor529)))
             (list)))
           (btor531
            (if (bitvector->bool (signal-value btor530)) btor197 btor170))
           (btor532
            (bv->signal
             (zero-extend (signal-value btor230) (bitvector 5))
             btor230))
           (btor533
            (signal
             (bool->bitvector
              (bveq (signal-value btor80) (signal-value btor532)))
             (list)))
           (btor534
            (if (bitvector->bool (signal-value btor533)) btor229 btor531))
           (btor535
            (bv->signal
             (zero-extend (signal-value btor261) (bitvector 5))
             btor261))
           (btor536
            (signal
             (bool->bitvector
              (bveq (signal-value btor80) (signal-value btor535)))
             (list)))
           (btor537
            (if (bitvector->bool (signal-value btor536)) btor260 btor534))
           (btor538
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state538")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state538"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state538")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state538")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
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
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor544
            (if (bitvector->bool (signal-value btor542)) btor540 btor538))
           (btor545 (signal (bvnot (signal-value btor536)) (list)))
           (btor546 (signal (bvnot (signal-value btor533)) (list)))
           (btor547 (signal (bvnot (signal-value btor530)) (list)))
           (btor548
            (bv->signal
             (zero-extend (signal-value btor274) (bitvector 5))
             btor274))
           (btor549
            (signal
             (bool->bitvector
              (bveq (signal-value btor80) (signal-value btor548)))
             (list)))
           (btor550 (signal (bvnot (signal-value btor549)) (list)))
           (btor551
            (signal
             (bvand (signal-value btor547) (signal-value btor550))
             (list)))
           (btor552
            (signal
             (bvand (signal-value btor546) (signal-value btor551))
             (list)))
           (btor553
            (signal
             (bvand (signal-value btor545) (signal-value btor552))
             (list)))
           (btor554
            (signal
             (bvand (signal-value btor547) (signal-value btor553))
             (list)))
           (btor555
            (signal
             (bvand (signal-value btor546) (signal-value btor554))
             (list)))
           (btor556
            (signal
             (bvand (signal-value btor545) (signal-value btor555))
             (list)))
           (btor557
            (signal
             (bvand (signal-value btor546) (signal-value btor556))
             (list)))
           (btor558
            (signal
             (bvand (signal-value btor545) (signal-value btor557))
             (list)))
           (btor559
            (signal
             (bvand (signal-value btor545) (signal-value btor558))
             (list)))
           (btor560
            (if (bitvector->bool (signal-value btor559)) btor544 btor537))
           (btor561
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state561")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state561"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state561")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state561")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor563
            (signal
             (concat (signal-value btor561) (signal-value btor560))
             (list)))
           (btor564
            (bv->signal
             (zero-extend (signal-value btor143) (bitvector 2))
             btor143))
           (btor565
            (signal
             (bool->bitvector
              (bveq (signal-value btor563) (signal-value btor564)))
             (list)))
           (btor566
            (if (bitvector->bool (signal-value btor565)) btor527 btor526))
           (btor567
            (signal
             (concat (signal-value btor39) (signal-value btor38))
             (list)))
           (btor568
            (signal
             (concat (signal-value btor48) (signal-value btor567))
             (list)))
           (btor569
            (signal
             (concat (signal-value btor49) (signal-value btor568))
             (list)))
           (btor570
            (signal
             (concat (signal-value btor50) (signal-value btor569))
             (list)))
           (btor571
            (signal
             (concat (signal-value btor51) (signal-value btor570))
             (list)))
           (btor572
            (signal
             (concat (signal-value btor52) (signal-value btor571))
             (list)))
           (btor573
            (signal
             (concat (signal-value btor53) (signal-value btor572))
             (list)))
           (btor574
            (signal
             (concat (signal-value btor54) (signal-value btor573))
             (list)))
           (btor575
            (signal
             (concat (signal-value btor55) (signal-value btor574))
             (list)))
           (btor576
            (signal
             (concat (signal-value btor40) (signal-value btor575))
             (list)))
           (btor577
            (signal
             (concat (signal-value btor41) (signal-value btor576))
             (list)))
           (btor578
            (signal
             (concat (signal-value btor42) (signal-value btor577))
             (list)))
           (btor579
            (signal
             (concat (signal-value btor43) (signal-value btor578))
             (list)))
           (btor580
            (signal
             (concat (signal-value btor44) (signal-value btor579))
             (list)))
           (btor581
            (signal
             (concat (signal-value btor45) (signal-value btor580))
             (list)))
           (btor582
            (signal
             (concat (signal-value btor46) (signal-value btor581))
             (list)))
           (btor583
            (signal
             (concat (signal-value btor47) (signal-value btor582))
             (list)))
           (btor584
            (signal
             (apply bvor (bitvector->bits (signal-value btor80)))
             (signal-state btor80)))
           (btor585 (signal (bvnot (signal-value btor584)) (list)))
           (btor586
            (if (bitvector->bool (signal-value btor585)) btor583 btor566))
           (btor587
            (bv->signal
             (zero-extend (signal-value btor274) (bitvector 5))
             btor274))
           (btor588
            (signal
             (bool->bitvector
              (bveq (signal-value btor71) (signal-value btor587)))
             (list)))
           (btor589
            (if (bitvector->bool (signal-value btor588)) btor68 btor138))
           (btor590
            (bv->signal
             (zero-extend (signal-value btor199) (bitvector 5))
             btor199))
           (btor591
            (signal
             (bool->bitvector
              (bveq (signal-value btor71) (signal-value btor590)))
             (list)))
           (btor592
            (if (bitvector->bool (signal-value btor591)) btor66 btor589))
           (btor593
            (bv->signal
             (zero-extend (signal-value btor230) (bitvector 5))
             btor230))
           (btor594
            (signal
             (bool->bitvector
              (bveq (signal-value btor71) (signal-value btor593)))
             (list)))
           (btor595
            (if (bitvector->bool (signal-value btor594)) btor64 btor592))
           (btor596
            (bv->signal
             (zero-extend (signal-value btor261) (bitvector 5))
             btor261))
           (btor597
            (signal
             (bool->bitvector
              (bveq (signal-value btor71) (signal-value btor596)))
             (list)))
           (btor598
            (if (bitvector->bool (signal-value btor597)) btor62 btor595))
           (btor599
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state599")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state599"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state599")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state599")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor601
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state601")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state601"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state601")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state601")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor603
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state603")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state603"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state603")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state603")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor605
            (if (bitvector->bool (signal-value btor603)) btor601 btor599))
           (btor606 (signal (bvnot (signal-value btor597)) (list)))
           (btor607 (signal (bvnot (signal-value btor594)) (list)))
           (btor608 (signal (bvnot (signal-value btor591)) (list)))
           (btor609 (signal (bvnot (signal-value btor588)) (list)))
           (btor610
            (signal
             (apply bvor (bitvector->bits (signal-value btor71)))
             (signal-state btor71)))
           (btor611 (signal (bvnot (signal-value btor610)) (list)))
           (btor612 (signal (bvnot (signal-value btor611)) (list)))
           (btor613
            (signal
             (bvand (signal-value btor609) (signal-value btor612))
             (list)))
           (btor614
            (signal
             (bvand (signal-value btor608) (signal-value btor613))
             (list)))
           (btor615
            (signal
             (bvand (signal-value btor607) (signal-value btor614))
             (list)))
           (btor616
            (signal
             (bvand (signal-value btor606) (signal-value btor615))
             (list)))
           (btor617
            (if (bitvector->bool (signal-value btor616)) btor605 btor598))
           (btor618
            (if (bitvector->bool (signal-value btor617)) btor586 btor525))
           (btor619
            (if (bitvector->bool (signal-value btor95)) btor586 btor525))
           (btor620 (bv->signal (bv 9 (bitvector 4))))
           (btor621
            (bv->signal
             (zero-extend (signal-value btor620) (bitvector 5))
             btor620))
           (btor622
            (signal
             (bool->bitvector
              (bveq (signal-value btor96) (signal-value btor621)))
             (list)))
           (btor623
            (if (bitvector->bool (signal-value btor622)) btor619 btor618))
           (btor624
            (if (bitvector->bool (signal-value btor95)) btor525 btor586))
           (btor625 (bv->signal (bv 8 (bitvector 4))))
           (btor626
            (bv->signal
             (zero-extend (signal-value btor625) (bitvector 5))
             btor625))
           (btor627
            (signal
             (bool->bitvector
              (bveq (signal-value btor96) (signal-value btor626)))
             (list)))
           (btor628
            (if (bitvector->bool (signal-value btor627)) btor624 btor623))
           (btor629
            (signal
             (concat (signal-value btor21) (signal-value btor20))
             (list)))
           (btor630
            (signal
             (concat (signal-value btor30) (signal-value btor629))
             (list)))
           (btor631
            (signal
             (concat (signal-value btor31) (signal-value btor630))
             (list)))
           (btor632
            (signal
             (concat (signal-value btor32) (signal-value btor631))
             (list)))
           (btor633
            (signal
             (concat (signal-value btor33) (signal-value btor632))
             (list)))
           (btor634
            (signal
             (concat (signal-value btor34) (signal-value btor633))
             (list)))
           (btor635
            (signal
             (concat (signal-value btor35) (signal-value btor634))
             (list)))
           (btor636
            (signal
             (concat (signal-value btor36) (signal-value btor635))
             (list)))
           (btor637
            (signal
             (concat (signal-value btor37) (signal-value btor636))
             (list)))
           (btor638
            (signal
             (concat (signal-value btor22) (signal-value btor637))
             (list)))
           (btor639
            (signal
             (concat (signal-value btor23) (signal-value btor638))
             (list)))
           (btor640
            (signal
             (concat (signal-value btor24) (signal-value btor639))
             (list)))
           (btor641
            (signal
             (concat (signal-value btor25) (signal-value btor640))
             (list)))
           (btor642
            (signal
             (concat (signal-value btor26) (signal-value btor641))
             (list)))
           (btor643
            (signal
             (concat (signal-value btor27) (signal-value btor642))
             (list)))
           (btor644
            (signal
             (concat (signal-value btor28) (signal-value btor643))
             (list)))
           (btor645
            (signal
             (concat (signal-value btor29) (signal-value btor644))
             (list)))
           (btor646
            (if (bitvector->bool (signal-value btor95)) btor525 btor645))
           (btor647 (bv->signal (bv 7 (bitvector 3))))
           (btor648
            (bv->signal
             (zero-extend (signal-value btor647) (bitvector 5))
             btor647))
           (btor649
            (signal
             (bool->bitvector
              (bveq (signal-value btor96) (signal-value btor648)))
             (list)))
           (btor650
            (if (bitvector->bool (signal-value btor649)) btor646 btor628))
           (btor651
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state651")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state651"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state651")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state651")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor652
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state652")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state652"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state652")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state652")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor654
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state654")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state654"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state654")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state654")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor656
            (if (bitvector->bool (signal-value btor654)) btor652 btor651))
           (btor657 (signal (bvnot (signal-value btor649)) (list)))
           (btor658 (signal (bvnot (signal-value btor627)) (list)))
           (btor659 (signal (bvnot (signal-value btor622)) (list)))
           (btor660 (bv->signal (bv 10 (bitvector 4))))
           (btor661
            (bv->signal
             (zero-extend (signal-value btor660) (bitvector 5))
             btor660))
           (btor662
            (signal
             (bool->bitvector
              (bveq (signal-value btor96) (signal-value btor661)))
             (list)))
           (btor663 (signal (bvnot (signal-value btor662)) (list)))
           (btor664
            (signal
             (bvand (signal-value btor659) (signal-value btor663))
             (list)))
           (btor665
            (signal
             (bvand (signal-value btor658) (signal-value btor664))
             (list)))
           (btor666
            (signal
             (bvand (signal-value btor657) (signal-value btor665))
             (list)))
           (btor667
            (if (bitvector->bool (signal-value btor666)) btor656 btor650))
           (btor668
            (signal
             (apply bvor (bitvector->bits (signal-value btor77)))
             (signal-state btor77)))
           (btor669 (signal (bvnot (signal-value btor668)) (list)))
           (btor670
            (if (bitvector->bool (signal-value btor669)) btor667 btor508))
           (btor671
            (signal
             (extract 17 17 (signal-value btor670))
             (signal-state btor670)))
           (btor672
            (signal
             (extract 17 17 (signal-value btor670))
             (signal-state btor670)))
           (btor673
            (signal
             (concat (signal-value btor672) (signal-value btor671))
             (list)))
           (btor674
            (signal
             (extract 17 17 (signal-value btor670))
             (signal-state btor670)))
           (btor675
            (signal
             (concat (signal-value btor674) (signal-value btor673))
             (list)))
           (btor676
            (signal
             (extract 17 17 (signal-value btor670))
             (signal-state btor670)))
           (btor677
            (signal
             (concat (signal-value btor676) (signal-value btor675))
             (list)))
           (btor678
            (signal
             (extract 17 17 (signal-value btor670))
             (signal-state btor670)))
           (btor679
            (signal
             (concat (signal-value btor678) (signal-value btor677))
             (list)))
           (btor680
            (signal
             (extract 17 17 (signal-value btor670))
             (signal-state btor670)))
           (btor681
            (signal
             (concat (signal-value btor680) (signal-value btor679))
             (list)))
           (btor682
            (signal
             (extract 17 17 (signal-value btor670))
             (signal-state btor670)))
           (btor683
            (signal
             (concat (signal-value btor682) (signal-value btor681))
             (list)))
           (btor684
            (signal
             (extract 17 17 (signal-value btor670))
             (signal-state btor670)))
           (btor685
            (signal
             (concat (signal-value btor684) (signal-value btor683))
             (list)))
           (btor686
            (signal
             (extract 17 17 (signal-value btor670))
             (signal-state btor670)))
           (btor687
            (signal
             (concat (signal-value btor686) (signal-value btor685))
             (list)))
           (btor688
            (signal
             (extract 17 17 (signal-value btor670))
             (signal-state btor670)))
           (btor689
            (signal
             (concat (signal-value btor688) (signal-value btor687))
             (list)))
           (btor690
            (signal
             (extract 17 17 (signal-value btor670))
             (signal-state btor670)))
           (btor691
            (signal
             (concat (signal-value btor690) (signal-value btor689))
             (list)))
           (btor692
            (signal
             (extract 17 17 (signal-value btor670))
             (signal-state btor670)))
           (btor693
            (signal
             (concat (signal-value btor692) (signal-value btor691))
             (list)))
           (btor694
            (signal
             (extract 17 17 (signal-value btor670))
             (signal-state btor670)))
           (btor695
            (signal
             (concat (signal-value btor694) (signal-value btor693))
             (list)))
           (btor696
            (signal
             (extract 17 17 (signal-value btor670))
             (signal-state btor670)))
           (btor697
            (signal
             (concat (signal-value btor696) (signal-value btor695))
             (list)))
           (btor698
            (signal
             (extract 17 17 (signal-value btor670))
             (signal-state btor670)))
           (btor699
            (signal
             (concat (signal-value btor698) (signal-value btor697))
             (list)))
           (btor700
            (signal
             (extract 17 17 (signal-value btor670))
             (signal-state btor670)))
           (btor701
            (signal
             (concat (signal-value btor700) (signal-value btor699))
             (list)))
           (btor702
            (signal
             (extract 17 17 (signal-value btor670))
             (signal-state btor670)))
           (btor703
            (signal
             (concat (signal-value btor702) (signal-value btor701))
             (list)))
           (btor704
            (signal
             (extract 17 17 (signal-value btor670))
             (signal-state btor670)))
           (btor705
            (signal
             (concat (signal-value btor704) (signal-value btor703))
             (list)))
           (btor706
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state706")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state706"))))))
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
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor707
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state707")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state707"))))))
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
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor709
            (if (bitvector->bool (signal-value btor507)) btor707 btor706))
           (btor710
            (if (bitvector->bool (signal-value btor669)) btor93 btor709))
           (btor711
            (if (bitvector->bool (signal-value btor710)) btor705 btor336))
           (btor712
            (signal
             (concat (signal-value btor711) (signal-value btor670))
             (list)))
           (btor713
            (signal
             (bvmul (signal-value btor467) (signal-value btor712))
             (list)))
           (btor714
            (signal
             (apply bvor (bitvector->bits (signal-value btor467)))
             (signal-state btor467)))
           (btor715 (signal (bvnot (signal-value btor714)) (list)))
           (btor716
            (signal
             (apply bvor (bitvector->bits (signal-value btor712)))
             (signal-state btor712)))
           (btor717 (signal (bvnot (signal-value btor716)) (list)))
           (btor718
            (signal
             (bvor (signal-value btor715) (signal-value btor717))
             (list)))
           (btor719
            (if (bitvector->bool (signal-value btor718)) btor134 btor713))
           (btor720
            (signal
             (apply bvor (bitvector->bits (signal-value btor86)))
             (signal-state btor86)))
           (btor721 (signal (bvnot (signal-value btor720)) (list)))
           (btor722
            (if (bitvector->bool (signal-value btor721)) btor719 btor333))
           (btor723
            (signal
             (apply bvor (bitvector->bits (signal-value btor83)))
             (signal-state btor83)))
           (btor724 (signal (bvnot (signal-value btor723)) (list)))
           (btor725
            (if (bitvector->bool (signal-value btor724)) btor722 btor293))
           (btor726
            (bv->signal
             (zero-extend (signal-value btor164) (bitvector 5))
             btor164))
           (btor727
            (signal
             (bool->bitvector
              (bveq (signal-value btor72) (signal-value btor726)))
             (list)))
           (btor728
            (if (bitvector->bool (signal-value btor727)) btor725 btor134))
           (btor729
            (signal
             (extract 0 0 (signal-value btor728))
             (signal-state btor728)))
           (btor731
            (signal
             (extract 1 1 (signal-value btor728))
             (signal-state btor728)))
           (btor733
            (signal
             (extract 10 10 (signal-value btor728))
             (signal-state btor728)))
           (btor735
            (signal
             (extract 11 11 (signal-value btor728))
             (signal-state btor728)))
           (btor737
            (signal
             (extract 12 12 (signal-value btor728))
             (signal-state btor728)))
           (btor739
            (signal
             (extract 13 13 (signal-value btor728))
             (signal-state btor728)))
           (btor741
            (signal
             (extract 14 14 (signal-value btor728))
             (signal-state btor728)))
           (btor743
            (signal
             (extract 15 15 (signal-value btor728))
             (signal-state btor728)))
           (btor745
            (signal
             (extract 16 16 (signal-value btor728))
             (signal-state btor728)))
           (btor747
            (signal
             (extract 17 17 (signal-value btor728))
             (signal-state btor728)))
           (btor749
            (signal
             (extract 18 18 (signal-value btor728))
             (signal-state btor728)))
           (btor751
            (signal
             (extract 19 19 (signal-value btor728))
             (signal-state btor728)))
           (btor753
            (signal
             (extract 2 2 (signal-value btor728))
             (signal-state btor728)))
           (btor755
            (signal
             (extract 20 20 (signal-value btor728))
             (signal-state btor728)))
           (btor757
            (signal
             (extract 21 21 (signal-value btor728))
             (signal-state btor728)))
           (btor759
            (signal
             (extract 22 22 (signal-value btor728))
             (signal-state btor728)))
           (btor761
            (signal
             (extract 23 23 (signal-value btor728))
             (signal-state btor728)))
           (btor763
            (signal
             (extract 24 24 (signal-value btor728))
             (signal-state btor728)))
           (btor765
            (signal
             (extract 25 25 (signal-value btor728))
             (signal-state btor728)))
           (btor767
            (signal
             (extract 26 26 (signal-value btor728))
             (signal-state btor728)))
           (btor769
            (signal
             (extract 27 27 (signal-value btor728))
             (signal-state btor728)))
           (btor771
            (signal
             (extract 28 28 (signal-value btor728))
             (signal-state btor728)))
           (btor773
            (signal
             (extract 29 29 (signal-value btor728))
             (signal-state btor728)))
           (btor775
            (signal
             (extract 3 3 (signal-value btor728))
             (signal-state btor728)))
           (btor777
            (signal
             (extract 30 30 (signal-value btor728))
             (signal-state btor728)))
           (btor779
            (signal
             (extract 31 31 (signal-value btor728))
             (signal-state btor728)))
           (btor781
            (signal
             (extract 32 32 (signal-value btor728))
             (signal-state btor728)))
           (btor783
            (signal
             (extract 33 33 (signal-value btor728))
             (signal-state btor728)))
           (btor785
            (signal
             (extract 34 34 (signal-value btor728))
             (signal-state btor728)))
           (btor787
            (signal
             (extract 35 35 (signal-value btor728))
             (signal-state btor728)))
           (btor789
            (signal
             (extract 4 4 (signal-value btor728))
             (signal-state btor728)))
           (btor791
            (signal
             (extract 5 5 (signal-value btor728))
             (signal-state btor728)))
           (btor793
            (signal
             (extract 6 6 (signal-value btor728))
             (signal-state btor728)))
           (btor795
            (signal
             (extract 7 7 (signal-value btor728))
             (signal-state btor728)))
           (btor797
            (signal
             (extract 8 8 (signal-value btor728))
             (signal-state btor728)))
           (btor799
            (signal
             (extract 9 9 (signal-value btor728))
             (signal-state btor728)))
           (btor801
            (signal
             (extract 0 0 (signal-value btor425))
             (signal-state btor425)))
           (btor803
            (signal
             (extract 1 1 (signal-value btor425))
             (signal-state btor425)))
           (btor805
            (signal
             (extract 10 10 (signal-value btor425))
             (signal-state btor425)))
           (btor807
            (signal
             (extract 11 11 (signal-value btor425))
             (signal-state btor425)))
           (btor809
            (signal
             (extract 12 12 (signal-value btor425))
             (signal-state btor425)))
           (btor811
            (signal
             (extract 13 13 (signal-value btor425))
             (signal-state btor425)))
           (btor813
            (signal
             (extract 14 14 (signal-value btor425))
             (signal-state btor425)))
           (btor815
            (signal
             (extract 15 15 (signal-value btor425))
             (signal-state btor425)))
           (btor817
            (signal
             (extract 16 16 (signal-value btor425))
             (signal-state btor425)))
           (btor819
            (signal
             (extract 17 17 (signal-value btor425))
             (signal-state btor425)))
           (btor821
            (signal
             (extract 2 2 (signal-value btor425))
             (signal-state btor425)))
           (btor823
            (signal
             (extract 3 3 (signal-value btor425))
             (signal-state btor425)))
           (btor825
            (signal
             (extract 4 4 (signal-value btor425))
             (signal-state btor425)))
           (btor827
            (signal
             (extract 5 5 (signal-value btor425))
             (signal-state btor425)))
           (btor829
            (signal
             (extract 6 6 (signal-value btor425))
             (signal-state btor425)))
           (btor831
            (signal
             (extract 7 7 (signal-value btor425))
             (signal-state btor425)))
           (btor833
            (signal
             (extract 8 8 (signal-value btor425))
             (signal-state btor425)))
           (btor835
            (signal
             (extract 9 9 (signal-value btor425))
             (signal-state btor425)))
           (btor837
            (signal
             (extract 0 0 (signal-value btor670))
             (signal-state btor670)))
           (btor839
            (signal
             (extract 1 1 (signal-value btor670))
             (signal-state btor670)))
           (btor841
            (signal
             (extract 10 10 (signal-value btor670))
             (signal-state btor670)))
           (btor843
            (signal
             (extract 11 11 (signal-value btor670))
             (signal-state btor670)))
           (btor845
            (signal
             (extract 12 12 (signal-value btor670))
             (signal-state btor670)))
           (btor847
            (signal
             (extract 13 13 (signal-value btor670))
             (signal-state btor670)))
           (btor849
            (signal
             (extract 14 14 (signal-value btor670))
             (signal-state btor670)))
           (btor851
            (signal
             (extract 15 15 (signal-value btor670))
             (signal-state btor670)))
           (btor853
            (signal
             (extract 16 16 (signal-value btor670))
             (signal-state btor670)))
           (btor855
            (signal
             (extract 17 17 (signal-value btor670))
             (signal-state btor670)))
           (btor857
            (signal
             (extract 2 2 (signal-value btor670))
             (signal-state btor670)))
           (btor859
            (signal
             (extract 3 3 (signal-value btor670))
             (signal-state btor670)))
           (btor861
            (signal
             (extract 4 4 (signal-value btor670))
             (signal-state btor670)))
           (btor863
            (signal
             (extract 5 5 (signal-value btor670))
             (signal-state btor670)))
           (btor865
            (signal
             (extract 6 6 (signal-value btor670))
             (signal-state btor670)))
           (btor867
            (signal
             (extract 7 7 (signal-value btor670))
             (signal-state btor670)))
           (btor869
            (signal
             (extract 8 8 (signal-value btor670))
             (signal-state btor670)))
           (btor871
            (signal
             (extract 9 9 (signal-value btor670))
             (signal-state btor670)))
           (btor873
            (signal
             (extract 0 0 (signal-value btor586))
             (signal-state btor586)))
           (btor875
            (signal
             (extract 1 1 (signal-value btor586))
             (signal-state btor586)))
           (btor877
            (signal
             (extract 10 10 (signal-value btor586))
             (signal-state btor586)))
           (btor879
            (signal
             (extract 11 11 (signal-value btor586))
             (signal-state btor586)))
           (btor881
            (signal
             (extract 12 12 (signal-value btor586))
             (signal-state btor586)))
           (btor883
            (signal
             (extract 13 13 (signal-value btor586))
             (signal-state btor586)))
           (btor885
            (signal
             (extract 14 14 (signal-value btor586))
             (signal-state btor586)))
           (btor887
            (signal
             (extract 15 15 (signal-value btor586))
             (signal-state btor586)))
           (btor889
            (signal
             (extract 16 16 (signal-value btor586))
             (signal-state btor586)))
           (btor891
            (signal
             (extract 17 17 (signal-value btor586))
             (signal-state btor586)))
           (btor893
            (signal
             (extract 2 2 (signal-value btor586))
             (signal-state btor586)))
           (btor895
            (signal
             (extract 3 3 (signal-value btor586))
             (signal-state btor586)))
           (btor897
            (signal
             (extract 4 4 (signal-value btor586))
             (signal-state btor586)))
           (btor899
            (signal
             (extract 5 5 (signal-value btor586))
             (signal-state btor586)))
           (btor901
            (signal
             (extract 6 6 (signal-value btor586))
             (signal-state btor586)))
           (btor903
            (signal
             (extract 7 7 (signal-value btor586))
             (signal-state btor586)))
           (btor905
            (signal
             (extract 8 8 (signal-value btor586))
             (signal-state btor586)))
           (btor907
            (signal
             (extract 9 9 (signal-value btor586))
             (signal-state btor586)))
           (btor909
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state909")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state909"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state909")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state909")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor910
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state910")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state910"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state910")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state910")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor912
            (if (bitvector->bool (signal-value btor332)) btor910 btor909))
           (btor913
            (signal
             (bvor (signal-value btor465) (signal-value btor710))
             (list)))
           (btor914
            (if (bitvector->bool (signal-value btor721)) btor913 btor912))
           (btor916
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state916")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state916"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state916")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state916")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor917
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state917")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state917"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state917")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state917")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor919
            (if (bitvector->bool (signal-value btor374)) btor917 btor916))
           (btor920
            (if (bitvector->bool (signal-value btor424)) btor425 btor919))
           (btor921 (bv->signal (bv 4 (bitvector 3))))
           (btor922
            (bv->signal
             (zero-extend (signal-value btor921) (bitvector 5))
             btor921))
           (btor923
            (signal
             (bool->bitvector
              (bveq (signal-value btor57) (signal-value btor922)))
             (list)))
           (btor924
            (if (bitvector->bool (signal-value btor923)) btor425 btor920))
           (btor925
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state925")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state925"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state925")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state925")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor926
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state926")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state926"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state926")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state926")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor928
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state928")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state928"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state928")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state928")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor930
            (if (bitvector->bool (signal-value btor928)) btor926 btor925))
           (btor931 (signal (bvnot (signal-value btor923)) (list)))
           (btor932 (bv->signal (bv 22 (bitvector 5))))
           (btor933
            (signal
             (bool->bitvector
              (bveq (signal-value btor57) (signal-value btor932)))
             (list)))
           (btor934 (signal (bvnot (signal-value btor933)) (list)))
           (btor935
            (signal
             (bvand (signal-value btor931) (signal-value btor934))
             (list)))
           (btor936
            (signal
             (bvand (signal-value btor931) (signal-value btor935))
             (list)))
           (btor937
            (if (bitvector->bool (signal-value btor936)) btor930 btor924))
           (btor938
            (signal
             (extract 0 0 (signal-value btor937))
             (signal-state btor937)))
           (btor940
            (signal
             (extract 1 1 (signal-value btor937))
             (signal-state btor937)))
           (btor942
            (signal
             (extract 10 10 (signal-value btor937))
             (signal-state btor937)))
           (btor944
            (signal
             (extract 11 11 (signal-value btor937))
             (signal-state btor937)))
           (btor946
            (signal
             (extract 12 12 (signal-value btor937))
             (signal-state btor937)))
           (btor948
            (signal
             (extract 13 13 (signal-value btor937))
             (signal-state btor937)))
           (btor950
            (signal
             (extract 14 14 (signal-value btor937))
             (signal-state btor937)))
           (btor952
            (signal
             (extract 15 15 (signal-value btor937))
             (signal-state btor937)))
           (btor954
            (signal
             (extract 16 16 (signal-value btor937))
             (signal-state btor937)))
           (btor956
            (signal
             (extract 17 17 (signal-value btor937))
             (signal-state btor937)))
           (btor958
            (signal
             (extract 2 2 (signal-value btor937))
             (signal-state btor937)))
           (btor960
            (signal
             (extract 3 3 (signal-value btor937))
             (signal-state btor937)))
           (btor962
            (signal
             (extract 4 4 (signal-value btor937))
             (signal-state btor937)))
           (btor964
            (signal
             (extract 5 5 (signal-value btor937))
             (signal-state btor937)))
           (btor966
            (signal
             (extract 6 6 (signal-value btor937))
             (signal-state btor937)))
           (btor968
            (signal
             (extract 7 7 (signal-value btor937))
             (signal-state btor937)))
           (btor970
            (signal
             (extract 8 8 (signal-value btor937))
             (signal-state btor937)))
           (btor972
            (signal
             (extract 9 9 (signal-value btor937))
             (signal-state btor937)))
           (btor992
            (bv->signal
             (zero-extend (signal-value btor58) (bitvector 1))
             btor58))
           (btor993
            (bv->signal
             (zero-extend (signal-value btor59) (bitvector 1))
             btor59))
           (btor994
            (bv->signal
             (zero-extend (signal-value btor60) (bitvector 1))
             btor60))
           (btor995
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 1))
             btor61))
           (btor996
            (bv->signal
             (zero-extend (signal-value btor243) (bitvector 1))
             btor243))
           (btor997
            (bv->signal
             (zero-extend (signal-value btor260) (bitvector 1))
             btor260))
           (btor998
            (bv->signal
             (zero-extend (signal-value btor62) (bitvector 1))
             btor62))
           (btor999
            (bv->signal
             (zero-extend (signal-value btor212) (bitvector 1))
             btor212))
           (btor1000
            (bv->signal
             (zero-extend (signal-value btor229) (bitvector 1))
             btor229))
           (btor1001
            (bv->signal
             (zero-extend (signal-value btor64) (bitvector 1))
             btor64))
           (btor1002
            (bv->signal
             (zero-extend (signal-value btor180) (bitvector 1))
             btor180))
           (btor1003
            (bv->signal
             (zero-extend (signal-value btor197) (bitvector 1))
             btor197))
           (btor1004
            (bv->signal
             (zero-extend (signal-value btor66) (bitvector 1))
             btor66))
           (btor1005
            (bv->signal
             (zero-extend (signal-value btor150) (bitvector 1))
             btor150))
           (btor1006
            (bv->signal
             (zero-extend (signal-value btor170) (bitvector 1))
             btor170))
           (btor1007
            (bv->signal
             (zero-extend (signal-value btor68) (bitvector 1))
             btor68))
           (btor1008
            (bv->signal
             (zero-extend (signal-value btor88) (bitvector 1))
             btor88))
           (btor1009
            (bv->signal
             (zero-extend (signal-value btor89) (bitvector 1))
             btor89))
           (btor1010
            (bv->signal
             (zero-extend (signal-value btor90) (bitvector 1))
             btor90))
           (btor1011
            (bv->signal
             (zero-extend (signal-value btor91) (bitvector 1))
             btor91))
           (btor1012
            (bv->signal
             (zero-extend (signal-value btor404) (bitvector 18))
             btor404))
           (btor1013
            (bv->signal
             (zero-extend (signal-value btor425) (bitvector 18))
             btor425))
           (btor1014
            (bv->signal
             (zero-extend (signal-value btor919) (bitvector 18))
             btor919))
           (btor1015
            (bv->signal
             (zero-extend (signal-value btor919) (bitvector 18))
             btor919))
           (btor1016
            (bv->signal
             (zero-extend (signal-value btor920) (bitvector 18))
             btor920))
           (btor1017
            (bv->signal
             (zero-extend (signal-value btor937) (bitvector 18))
             btor937))
           (btor1018
            (bv->signal
             (zero-extend (signal-value btor467) (bitvector 36))
             btor467))
           (btor1019
            (bv->signal
             (zero-extend (signal-value btor375) (bitvector 18))
             btor375))
           (btor1020
            (bv->signal
             (zero-extend (signal-value btor375) (bitvector 18))
             btor375))
           (btor1021
            (bv->signal
             (zero-extend (signal-value btor421) (bitvector 18))
             btor421))
           (btor1022
            (bv->signal
             (zero-extend (signal-value btor422) (bitvector 18))
             btor422))
           (btor1023
            (bv->signal
             (zero-extend (signal-value btor645) (bitvector 18))
             btor645))
           (btor1024
            (bv->signal
             (zero-extend (signal-value btor670) (bitvector 18))
             btor670))
           (btor1025
            (bv->signal
             (zero-extend (signal-value btor712) (bitvector 36))
             btor712))
           (btor1026
            (bv->signal
             (zero-extend (signal-value btor508) (bitvector 18))
             btor508))
           (btor1027
            (bv->signal
             (zero-extend (signal-value btor508) (bitvector 18))
             btor508))
           (btor1028
            (bv->signal
             (zero-extend (signal-value btor525) (bitvector 18))
             btor525))
           (btor1029
            (bv->signal
             (zero-extend (signal-value btor667) (bitvector 18))
             btor667))
           (btor1030
            (bv->signal
             (zero-extend (signal-value btor583) (bitvector 18))
             btor583))
           (btor1031
            (bv->signal
             (zero-extend (signal-value btor586) (bitvector 18))
             btor586))
           (btor1032
            (bv->signal
             (zero-extend (signal-value btor566) (bitvector 18))
             btor566))
           (btor1033
            (bv->signal
             (zero-extend (signal-value btor566) (bitvector 18))
             btor566))
           (btor1034
            (bv->signal
             (zero-extend (signal-value btor617) (bitvector 1))
             btor617))
           (btor1035 (bv->signal (bv 16 (bitvector 5))))
           (btor1036
            (signal
             (bool->bitvector
              (bveq (signal-value btor73) (signal-value btor1035)))
             (list)))
           (btor1037
            (if (bitvector->bool (signal-value btor1036)) btor60 btor61))
           (btor1038 (bv->signal (bv 15 (bitvector 4))))
           (btor1039
            (bv->signal
             (zero-extend (signal-value btor1038) (bitvector 5))
             btor1038))
           (btor1040
            (signal
             (bool->bitvector
              (bveq (signal-value btor73) (signal-value btor1039)))
             (list)))
           (btor1041
            (if (bitvector->bool (signal-value btor1040)) btor59 btor1037))
           (btor1042
            (bv->signal
             (zero-extend (signal-value btor143) (bitvector 5))
             btor143))
           (btor1043
            (signal
             (bool->bitvector
              (bveq (signal-value btor73) (signal-value btor1042)))
             (list)))
           (btor1044
            (if (bitvector->bool (signal-value btor1043)) btor58 btor1041))
           (btor1045
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1045")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1045"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1045")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1045")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1046
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1046")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1046"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1046")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1046")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1048
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1048")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1048"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1048")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1048")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1050
            (if (bitvector->bool (signal-value btor1048)) btor1046 btor1045))
           (btor1051 (signal (bvnot (signal-value btor1043)) (list)))
           (btor1052 (signal (bvnot (signal-value btor1040)) (list)))
           (btor1053 (signal (bvnot (signal-value btor1036)) (list)))
           (btor1054 (bv->signal (bv 17 (bitvector 5))))
           (btor1055
            (signal
             (bool->bitvector
              (bveq (signal-value btor73) (signal-value btor1054)))
             (list)))
           (btor1056 (signal (bvnot (signal-value btor1055)) (list)))
           (btor1057
            (signal
             (bvand (signal-value btor1053) (signal-value btor1056))
             (list)))
           (btor1058
            (signal
             (bvand (signal-value btor1052) (signal-value btor1057))
             (list)))
           (btor1059
            (signal
             (bvand (signal-value btor1051) (signal-value btor1058))
             (list)))
           (btor1060
            (signal
             (bvand (signal-value btor1053) (signal-value btor1059))
             (list)))
           (btor1061
            (signal
             (bvand (signal-value btor1052) (signal-value btor1060))
             (list)))
           (btor1062
            (signal
             (bvand (signal-value btor1051) (signal-value btor1061))
             (list)))
           (btor1063
            (signal
             (bvand (signal-value btor1052) (signal-value btor1062))
             (list)))
           (btor1064
            (signal
             (bvand (signal-value btor1051) (signal-value btor1063))
             (list)))
           (btor1065
            (signal
             (bvand (signal-value btor1051) (signal-value btor1064))
             (list)))
           (btor1066
            (if (bitvector->bool (signal-value btor1065)) btor1050 btor1044))
           (btor1067
            (bv->signal
             (zero-extend (signal-value btor1066) (bitvector 1))
             btor1066))
           (btor1068
            (bv->signal
             (zero-extend (signal-value btor369) (bitvector 1))
             btor369))
           (btor1069 (bv->signal (bv 19 (bitvector 5))))
           (btor1070
            (signal
             (bool->bitvector
              (bveq (signal-value btor75) (signal-value btor1069)))
             (list)))
           (btor1071
            (if (bitvector->bool (signal-value btor1070)) btor90 btor91))
           (btor1072 (bv->signal (bv 18 (bitvector 5))))
           (btor1073
            (signal
             (bool->bitvector
              (bveq (signal-value btor75) (signal-value btor1072)))
             (list)))
           (btor1074
            (if (bitvector->bool (signal-value btor1073)) btor89 btor1071))
           (btor1075 (bv->signal (bv 2 (bitvector 2))))
           (btor1076
            (bv->signal
             (zero-extend (signal-value btor1075) (bitvector 5))
             btor1075))
           (btor1077
            (signal
             (bool->bitvector
              (bveq (signal-value btor75) (signal-value btor1076)))
             (list)))
           (btor1078
            (if (bitvector->bool (signal-value btor1077)) btor88 btor1074))
           (btor1079
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1079")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1079"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1079")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1079")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1080
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1080")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1080"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1080")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1080")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1082
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1082")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1082"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1082")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1082")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1084
            (if (bitvector->bool (signal-value btor1082)) btor1080 btor1079))
           (btor1085 (signal (bvnot (signal-value btor1077)) (list)))
           (btor1086 (signal (bvnot (signal-value btor1073)) (list)))
           (btor1087 (signal (bvnot (signal-value btor1070)) (list)))
           (btor1088 (bv->signal (bv 20 (bitvector 5))))
           (btor1089
            (signal
             (bool->bitvector
              (bveq (signal-value btor75) (signal-value btor1088)))
             (list)))
           (btor1090 (signal (bvnot (signal-value btor1089)) (list)))
           (btor1091
            (signal
             (bvand (signal-value btor1087) (signal-value btor1090))
             (list)))
           (btor1092
            (signal
             (bvand (signal-value btor1086) (signal-value btor1091))
             (list)))
           (btor1093
            (signal
             (bvand (signal-value btor1085) (signal-value btor1092))
             (list)))
           (btor1094
            (signal
             (bvand (signal-value btor1087) (signal-value btor1093))
             (list)))
           (btor1095
            (signal
             (bvand (signal-value btor1086) (signal-value btor1094))
             (list)))
           (btor1096
            (signal
             (bvand (signal-value btor1085) (signal-value btor1095))
             (list)))
           (btor1097
            (signal
             (bvand (signal-value btor1086) (signal-value btor1096))
             (list)))
           (btor1098
            (signal
             (bvand (signal-value btor1085) (signal-value btor1097))
             (list)))
           (btor1099
            (signal
             (bvand (signal-value btor1085) (signal-value btor1098))
             (list)))
           (btor1100
            (if (bitvector->bool (signal-value btor1099)) btor1084 btor1078))
           (btor1101
            (bv->signal
             (zero-extend (signal-value btor1100) (bitvector 1))
             btor1100))
           (btor1102
            (bv->signal
             (zero-extend (signal-value btor1100) (bitvector 1))
             btor1100))
           (btor1103
            (signal
             (bool->bitvector
              (bveq (signal-value btor76) (signal-value btor1035)))
             (list)))
           (btor1104
            (if (bitvector->bool (signal-value btor1103)) btor60 btor61))
           (btor1105
            (bv->signal
             (zero-extend (signal-value btor1038) (bitvector 5))
             btor1038))
           (btor1106
            (signal
             (bool->bitvector
              (bveq (signal-value btor76) (signal-value btor1105)))
             (list)))
           (btor1107
            (if (bitvector->bool (signal-value btor1106)) btor59 btor1104))
           (btor1108
            (bv->signal
             (zero-extend (signal-value btor143) (bitvector 5))
             btor143))
           (btor1109
            (signal
             (bool->bitvector
              (bveq (signal-value btor76) (signal-value btor1108)))
             (list)))
           (btor1110
            (if (bitvector->bool (signal-value btor1109)) btor58 btor1107))
           (btor1111
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1111")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1111"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1111")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1111")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1112
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1112")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1112"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1112")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1112")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1114
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1114")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1114"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1114")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1114")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1116
            (if (bitvector->bool (signal-value btor1114)) btor1112 btor1111))
           (btor1117 (signal (bvnot (signal-value btor1109)) (list)))
           (btor1118 (signal (bvnot (signal-value btor1106)) (list)))
           (btor1119 (signal (bvnot (signal-value btor1103)) (list)))
           (btor1120
            (signal
             (bool->bitvector
              (bveq (signal-value btor76) (signal-value btor1054)))
             (list)))
           (btor1121 (signal (bvnot (signal-value btor1120)) (list)))
           (btor1122
            (signal
             (bvand (signal-value btor1119) (signal-value btor1121))
             (list)))
           (btor1123
            (signal
             (bvand (signal-value btor1118) (signal-value btor1122))
             (list)))
           (btor1124
            (signal
             (bvand (signal-value btor1117) (signal-value btor1123))
             (list)))
           (btor1125
            (signal
             (bvand (signal-value btor1119) (signal-value btor1124))
             (list)))
           (btor1126
            (signal
             (bvand (signal-value btor1118) (signal-value btor1125))
             (list)))
           (btor1127
            (signal
             (bvand (signal-value btor1117) (signal-value btor1126))
             (list)))
           (btor1128
            (signal
             (bvand (signal-value btor1118) (signal-value btor1127))
             (list)))
           (btor1129
            (signal
             (bvand (signal-value btor1117) (signal-value btor1128))
             (list)))
           (btor1130
            (signal
             (bvand (signal-value btor1117) (signal-value btor1129))
             (list)))
           (btor1131
            (if (bitvector->bool (signal-value btor1130)) btor1116 btor1110))
           (btor1132
            (bv->signal
             (zero-extend (signal-value btor1131) (bitvector 1))
             btor1131))
           (btor1133
            (bv->signal
             (zero-extend (signal-value btor502) (bitvector 1))
             btor502))
           (btor1134
            (signal
             (bool->bitvector
              (bveq (signal-value btor78) (signal-value btor1069)))
             (list)))
           (btor1135
            (if (bitvector->bool (signal-value btor1134)) btor90 btor91))
           (btor1136
            (signal
             (bool->bitvector
              (bveq (signal-value btor78) (signal-value btor1072)))
             (list)))
           (btor1137
            (if (bitvector->bool (signal-value btor1136)) btor89 btor1135))
           (btor1138
            (bv->signal
             (zero-extend (signal-value btor1075) (bitvector 5))
             btor1075))
           (btor1139
            (signal
             (bool->bitvector
              (bveq (signal-value btor78) (signal-value btor1138)))
             (list)))
           (btor1140
            (if (bitvector->bool (signal-value btor1139)) btor88 btor1137))
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
           (btor1142
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1142")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1142"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1142")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1142")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1144
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1144")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1144"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1144")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1144")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1146
            (if (bitvector->bool (signal-value btor1144)) btor1142 btor1141))
           (btor1147 (signal (bvnot (signal-value btor1139)) (list)))
           (btor1148 (signal (bvnot (signal-value btor1136)) (list)))
           (btor1149 (signal (bvnot (signal-value btor1134)) (list)))
           (btor1150
            (signal
             (bool->bitvector
              (bveq (signal-value btor78) (signal-value btor1088)))
             (list)))
           (btor1151 (signal (bvnot (signal-value btor1150)) (list)))
           (btor1152
            (signal
             (bvand (signal-value btor1149) (signal-value btor1151))
             (list)))
           (btor1153
            (signal
             (bvand (signal-value btor1148) (signal-value btor1152))
             (list)))
           (btor1154
            (signal
             (bvand (signal-value btor1147) (signal-value btor1153))
             (list)))
           (btor1155
            (signal
             (bvand (signal-value btor1149) (signal-value btor1154))
             (list)))
           (btor1156
            (signal
             (bvand (signal-value btor1148) (signal-value btor1155))
             (list)))
           (btor1157
            (signal
             (bvand (signal-value btor1147) (signal-value btor1156))
             (list)))
           (btor1158
            (signal
             (bvand (signal-value btor1148) (signal-value btor1157))
             (list)))
           (btor1159
            (signal
             (bvand (signal-value btor1147) (signal-value btor1158))
             (list)))
           (btor1160
            (signal
             (bvand (signal-value btor1147) (signal-value btor1159))
             (list)))
           (btor1161
            (if (bitvector->bool (signal-value btor1160)) btor1146 btor1140))
           (btor1162
            (bv->signal
             (zero-extend (signal-value btor1161) (bitvector 1))
             btor1161))
           (btor1163
            (bv->signal
             (zero-extend (signal-value btor1161) (bitvector 1))
             btor1161))
           (btor1164
            (signal
             (bool->bitvector
              (bveq (signal-value btor79) (signal-value btor1035)))
             (list)))
           (btor1165
            (if (bitvector->bool (signal-value btor1164)) btor60 btor61))
           (btor1166
            (bv->signal
             (zero-extend (signal-value btor1038) (bitvector 5))
             btor1038))
           (btor1167
            (signal
             (bool->bitvector
              (bveq (signal-value btor79) (signal-value btor1166)))
             (list)))
           (btor1168
            (if (bitvector->bool (signal-value btor1167)) btor59 btor1165))
           (btor1169
            (bv->signal
             (zero-extend (signal-value btor143) (bitvector 5))
             btor143))
           (btor1170
            (signal
             (bool->bitvector
              (bveq (signal-value btor79) (signal-value btor1169)))
             (list)))
           (btor1171
            (if (bitvector->bool (signal-value btor1170)) btor58 btor1168))
           (btor1172
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1172")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1172"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1172")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1172")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1173
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1173")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1173"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1173")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1173")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1175
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1175")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1175"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1175")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1175")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1177
            (if (bitvector->bool (signal-value btor1175)) btor1173 btor1172))
           (btor1178 (signal (bvnot (signal-value btor1170)) (list)))
           (btor1179 (signal (bvnot (signal-value btor1167)) (list)))
           (btor1180 (signal (bvnot (signal-value btor1164)) (list)))
           (btor1181
            (signal
             (bool->bitvector
              (bveq (signal-value btor79) (signal-value btor1054)))
             (list)))
           (btor1182 (signal (bvnot (signal-value btor1181)) (list)))
           (btor1183
            (signal
             (bvand (signal-value btor1180) (signal-value btor1182))
             (list)))
           (btor1184
            (signal
             (bvand (signal-value btor1179) (signal-value btor1183))
             (list)))
           (btor1185
            (signal
             (bvand (signal-value btor1178) (signal-value btor1184))
             (list)))
           (btor1186
            (signal
             (bvand (signal-value btor1180) (signal-value btor1185))
             (list)))
           (btor1187
            (signal
             (bvand (signal-value btor1179) (signal-value btor1186))
             (list)))
           (btor1188
            (signal
             (bvand (signal-value btor1178) (signal-value btor1187))
             (list)))
           (btor1189
            (signal
             (bvand (signal-value btor1179) (signal-value btor1188))
             (list)))
           (btor1190
            (signal
             (bvand (signal-value btor1178) (signal-value btor1189))
             (list)))
           (btor1191
            (signal
             (bvand (signal-value btor1178) (signal-value btor1190))
             (list)))
           (btor1192
            (if (bitvector->bool (signal-value btor1191)) btor1177 btor1171))
           (btor1193
            (bv->signal
             (zero-extend (signal-value btor1192) (bitvector 1))
             btor1192))
           (btor1194
            (bv->signal
             (zero-extend (signal-value btor560) (bitvector 1))
             btor560))
           (btor1195
            (signal
             (bool->bitvector
              (bveq (signal-value btor81) (signal-value btor1069)))
             (list)))
           (btor1196
            (if (bitvector->bool (signal-value btor1195)) btor90 btor91))
           (btor1197
            (signal
             (bool->bitvector
              (bveq (signal-value btor81) (signal-value btor1072)))
             (list)))
           (btor1198
            (if (bitvector->bool (signal-value btor1197)) btor89 btor1196))
           (btor1199
            (bv->signal
             (zero-extend (signal-value btor1075) (bitvector 5))
             btor1075))
           (btor1200
            (signal
             (bool->bitvector
              (bveq (signal-value btor81) (signal-value btor1199)))
             (list)))
           (btor1201
            (if (bitvector->bool (signal-value btor1200)) btor88 btor1198))
           (btor1202
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1202")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1202"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1202")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1202")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1203
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1203")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1203"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1203")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1203")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1205
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1205")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1205"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1205")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1205")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1207
            (if (bitvector->bool (signal-value btor1205)) btor1203 btor1202))
           (btor1208 (signal (bvnot (signal-value btor1200)) (list)))
           (btor1209 (signal (bvnot (signal-value btor1197)) (list)))
           (btor1210 (signal (bvnot (signal-value btor1195)) (list)))
           (btor1211
            (signal
             (bool->bitvector
              (bveq (signal-value btor81) (signal-value btor1088)))
             (list)))
           (btor1212 (signal (bvnot (signal-value btor1211)) (list)))
           (btor1213
            (signal
             (bvand (signal-value btor1210) (signal-value btor1212))
             (list)))
           (btor1214
            (signal
             (bvand (signal-value btor1209) (signal-value btor1213))
             (list)))
           (btor1215
            (signal
             (bvand (signal-value btor1208) (signal-value btor1214))
             (list)))
           (btor1216
            (signal
             (bvand (signal-value btor1210) (signal-value btor1215))
             (list)))
           (btor1217
            (signal
             (bvand (signal-value btor1209) (signal-value btor1216))
             (list)))
           (btor1218
            (signal
             (bvand (signal-value btor1208) (signal-value btor1217))
             (list)))
           (btor1219
            (signal
             (bvand (signal-value btor1209) (signal-value btor1218))
             (list)))
           (btor1220
            (signal
             (bvand (signal-value btor1208) (signal-value btor1219))
             (list)))
           (btor1221
            (signal
             (bvand (signal-value btor1208) (signal-value btor1220))
             (list)))
           (btor1222
            (if (bitvector->bool (signal-value btor1221)) btor1207 btor1201))
           (btor1223
            (bv->signal
             (zero-extend (signal-value btor1222) (bitvector 1))
             btor1222))
           (btor1224
            (bv->signal
             (zero-extend (signal-value btor1222) (bitvector 1))
             btor1222))
           (btor1225
            (signal
             (bool->bitvector
              (bveq (signal-value btor82) (signal-value btor1035)))
             (list)))
           (btor1226
            (if (bitvector->bool (signal-value btor1225)) btor60 btor61))
           (btor1227
            (bv->signal
             (zero-extend (signal-value btor1038) (bitvector 5))
             btor1038))
           (btor1228
            (signal
             (bool->bitvector
              (bveq (signal-value btor82) (signal-value btor1227)))
             (list)))
           (btor1229
            (if (bitvector->bool (signal-value btor1228)) btor59 btor1226))
           (btor1230
            (bv->signal
             (zero-extend (signal-value btor143) (bitvector 5))
             btor143))
           (btor1231
            (signal
             (bool->bitvector
              (bveq (signal-value btor82) (signal-value btor1230)))
             (list)))
           (btor1232
            (if (bitvector->bool (signal-value btor1231)) btor58 btor1229))
           (btor1233
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1233")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1233"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1233")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1233")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1234
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1234")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1234"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1234")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1234")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1236
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1236")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1236"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1236")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1236")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1238
            (if (bitvector->bool (signal-value btor1236)) btor1234 btor1233))
           (btor1239 (signal (bvnot (signal-value btor1231)) (list)))
           (btor1240 (signal (bvnot (signal-value btor1228)) (list)))
           (btor1241 (signal (bvnot (signal-value btor1225)) (list)))
           (btor1242
            (signal
             (bool->bitvector
              (bveq (signal-value btor82) (signal-value btor1054)))
             (list)))
           (btor1243 (signal (bvnot (signal-value btor1242)) (list)))
           (btor1244
            (signal
             (bvand (signal-value btor1241) (signal-value btor1243))
             (list)))
           (btor1245
            (signal
             (bvand (signal-value btor1240) (signal-value btor1244))
             (list)))
           (btor1246
            (signal
             (bvand (signal-value btor1239) (signal-value btor1245))
             (list)))
           (btor1247
            (signal
             (bvand (signal-value btor1241) (signal-value btor1246))
             (list)))
           (btor1248
            (signal
             (bvand (signal-value btor1240) (signal-value btor1247))
             (list)))
           (btor1249
            (signal
             (bvand (signal-value btor1239) (signal-value btor1248))
             (list)))
           (btor1250
            (signal
             (bvand (signal-value btor1240) (signal-value btor1249))
             (list)))
           (btor1251
            (signal
             (bvand (signal-value btor1239) (signal-value btor1250))
             (list)))
           (btor1252
            (signal
             (bvand (signal-value btor1239) (signal-value btor1251))
             (list)))
           (btor1253
            (if (bitvector->bool (signal-value btor1252)) btor1238 btor1232))
           (btor1254
            (bv->signal
             (zero-extend (signal-value btor1253) (bitvector 1))
             btor1253))
           (btor1255
            (bv->signal
             (zero-extend (signal-value btor287) (bitvector 1))
             btor287))
           (btor1256
            (signal
             (bool->bitvector
              (bveq (signal-value btor84) (signal-value btor1069)))
             (list)))
           (btor1257
            (if (bitvector->bool (signal-value btor1256)) btor90 btor91))
           (btor1258
            (signal
             (bool->bitvector
              (bveq (signal-value btor84) (signal-value btor1072)))
             (list)))
           (btor1259
            (if (bitvector->bool (signal-value btor1258)) btor89 btor1257))
           (btor1260
            (bv->signal
             (zero-extend (signal-value btor1075) (bitvector 5))
             btor1075))
           (btor1261
            (signal
             (bool->bitvector
              (bveq (signal-value btor84) (signal-value btor1260)))
             (list)))
           (btor1262
            (if (bitvector->bool (signal-value btor1261)) btor88 btor1259))
           (btor1263
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1263")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1263"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1263")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1263")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1264
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1264")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1264"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1264")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1264")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1266
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1266")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1266"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1266")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1266")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1268
            (if (bitvector->bool (signal-value btor1266)) btor1264 btor1263))
           (btor1269 (signal (bvnot (signal-value btor1261)) (list)))
           (btor1270 (signal (bvnot (signal-value btor1258)) (list)))
           (btor1271 (signal (bvnot (signal-value btor1256)) (list)))
           (btor1272
            (signal
             (bool->bitvector
              (bveq (signal-value btor84) (signal-value btor1088)))
             (list)))
           (btor1273 (signal (bvnot (signal-value btor1272)) (list)))
           (btor1274
            (signal
             (bvand (signal-value btor1271) (signal-value btor1273))
             (list)))
           (btor1275
            (signal
             (bvand (signal-value btor1270) (signal-value btor1274))
             (list)))
           (btor1276
            (signal
             (bvand (signal-value btor1269) (signal-value btor1275))
             (list)))
           (btor1277
            (signal
             (bvand (signal-value btor1271) (signal-value btor1276))
             (list)))
           (btor1278
            (signal
             (bvand (signal-value btor1270) (signal-value btor1277))
             (list)))
           (btor1279
            (signal
             (bvand (signal-value btor1269) (signal-value btor1278))
             (list)))
           (btor1280
            (signal
             (bvand (signal-value btor1270) (signal-value btor1279))
             (list)))
           (btor1281
            (signal
             (bvand (signal-value btor1269) (signal-value btor1280))
             (list)))
           (btor1282
            (signal
             (bvand (signal-value btor1269) (signal-value btor1281))
             (list)))
           (btor1283
            (if (bitvector->bool (signal-value btor1282)) btor1268 btor1262))
           (btor1284
            (bv->signal
             (zero-extend (signal-value btor1283) (bitvector 1))
             btor1283))
           (btor1285
            (bv->signal
             (zero-extend (signal-value btor1283) (bitvector 1))
             btor1283))
           (btor1286
            (bv->signal
             (zero-extend (signal-value btor728) (bitvector 36))
             btor728))
           (btor1287
            (bv->signal
             (zero-extend (signal-value btor719) (bitvector 36))
             btor719))
           (btor1288
            (bv->signal
             (zero-extend (signal-value btor333) (bitvector 36))
             btor333))
           (btor1289
            (bv->signal
             (zero-extend (signal-value btor293) (bitvector 36))
             btor293))
           (btor1290
            (bv->signal
             (zero-extend (signal-value btor293) (bitvector 36))
             btor293))
           (btor1291
            (bv->signal
             (zero-extend (signal-value btor333) (bitvector 36))
             btor333))
           (btor1292
            (bv->signal
             (zero-extend (signal-value btor725) (bitvector 36))
             btor725))
           (btor1293
            (bv->signal
             (zero-extend (signal-value btor722) (bitvector 36))
             btor722))
           (btor1294
            (signal
             (bool->bitvector
              (bveq (signal-value btor85) (signal-value btor1035)))
             (list)))
           (btor1295
            (if (bitvector->bool (signal-value btor1294)) btor60 btor61))
           (btor1296
            (bv->signal
             (zero-extend (signal-value btor1038) (bitvector 5))
             btor1038))
           (btor1297
            (signal
             (bool->bitvector
              (bveq (signal-value btor85) (signal-value btor1296)))
             (list)))
           (btor1298
            (if (bitvector->bool (signal-value btor1297)) btor59 btor1295))
           (btor1299
            (bv->signal
             (zero-extend (signal-value btor143) (bitvector 5))
             btor143))
           (btor1300
            (signal
             (bool->bitvector
              (bveq (signal-value btor85) (signal-value btor1299)))
             (list)))
           (btor1301
            (if (bitvector->bool (signal-value btor1300)) btor58 btor1298))
           (btor1302
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1302")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1302"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1302")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1302")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1303
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1303")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1303"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1303")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1303")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1305
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1305")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1305"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1305")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1305")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1307
            (if (bitvector->bool (signal-value btor1305)) btor1303 btor1302))
           (btor1308 (signal (bvnot (signal-value btor1300)) (list)))
           (btor1309 (signal (bvnot (signal-value btor1297)) (list)))
           (btor1310 (signal (bvnot (signal-value btor1294)) (list)))
           (btor1311
            (signal
             (bool->bitvector
              (bveq (signal-value btor85) (signal-value btor1054)))
             (list)))
           (btor1312 (signal (bvnot (signal-value btor1311)) (list)))
           (btor1313
            (signal
             (bvand (signal-value btor1310) (signal-value btor1312))
             (list)))
           (btor1314
            (signal
             (bvand (signal-value btor1309) (signal-value btor1313))
             (list)))
           (btor1315
            (signal
             (bvand (signal-value btor1308) (signal-value btor1314))
             (list)))
           (btor1316
            (signal
             (bvand (signal-value btor1310) (signal-value btor1315))
             (list)))
           (btor1317
            (signal
             (bvand (signal-value btor1309) (signal-value btor1316))
             (list)))
           (btor1318
            (signal
             (bvand (signal-value btor1308) (signal-value btor1317))
             (list)))
           (btor1319
            (signal
             (bvand (signal-value btor1309) (signal-value btor1318))
             (list)))
           (btor1320
            (signal
             (bvand (signal-value btor1308) (signal-value btor1319))
             (list)))
           (btor1321
            (signal
             (bvand (signal-value btor1308) (signal-value btor1320))
             (list)))
           (btor1322
            (if (bitvector->bool (signal-value btor1321)) btor1307 btor1301))
           (btor1323
            (bv->signal
             (zero-extend (signal-value btor1322) (bitvector 1))
             btor1322))
           (btor1324
            (bv->signal
             (zero-extend (signal-value btor327) (bitvector 1))
             btor327))
           (btor1325
            (signal
             (bool->bitvector
              (bveq (signal-value btor87) (signal-value btor1069)))
             (list)))
           (btor1326
            (if (bitvector->bool (signal-value btor1325)) btor90 btor91))
           (btor1327
            (signal
             (bool->bitvector
              (bveq (signal-value btor87) (signal-value btor1072)))
             (list)))
           (btor1328
            (if (bitvector->bool (signal-value btor1327)) btor89 btor1326))
           (btor1329
            (bv->signal
             (zero-extend (signal-value btor1075) (bitvector 5))
             btor1075))
           (btor1330
            (signal
             (bool->bitvector
              (bveq (signal-value btor87) (signal-value btor1329)))
             (list)))
           (btor1331
            (if (bitvector->bool (signal-value btor1330)) btor88 btor1328))
           (btor1332
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1332")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1332"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1332")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1332")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1333
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1333")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1333"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1333")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1333")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1335
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1335")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1335"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1335")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1335")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1337
            (if (bitvector->bool (signal-value btor1335)) btor1333 btor1332))
           (btor1338 (signal (bvnot (signal-value btor1330)) (list)))
           (btor1339 (signal (bvnot (signal-value btor1327)) (list)))
           (btor1340 (signal (bvnot (signal-value btor1325)) (list)))
           (btor1341
            (signal
             (bool->bitvector
              (bveq (signal-value btor87) (signal-value btor1088)))
             (list)))
           (btor1342 (signal (bvnot (signal-value btor1341)) (list)))
           (btor1343
            (signal
             (bvand (signal-value btor1340) (signal-value btor1342))
             (list)))
           (btor1344
            (signal
             (bvand (signal-value btor1339) (signal-value btor1343))
             (list)))
           (btor1345
            (signal
             (bvand (signal-value btor1338) (signal-value btor1344))
             (list)))
           (btor1346
            (signal
             (bvand (signal-value btor1340) (signal-value btor1345))
             (list)))
           (btor1347
            (signal
             (bvand (signal-value btor1339) (signal-value btor1346))
             (list)))
           (btor1348
            (signal
             (bvand (signal-value btor1338) (signal-value btor1347))
             (list)))
           (btor1349
            (signal
             (bvand (signal-value btor1339) (signal-value btor1348))
             (list)))
           (btor1350
            (signal
             (bvand (signal-value btor1338) (signal-value btor1349))
             (list)))
           (btor1351
            (signal
             (bvand (signal-value btor1338) (signal-value btor1350))
             (list)))
           (btor1352
            (if (bitvector->bool (signal-value btor1351)) btor1337 btor1331))
           (btor1353
            (bv->signal
             (zero-extend (signal-value btor1352) (bitvector 1))
             btor1352))
           (btor1354
            (bv->signal
             (zero-extend (signal-value btor1352) (bitvector 1))
             btor1352))
           (btor1355
            (bv->signal
             (zero-extend (signal-value btor425) (bitvector 18))
             btor425))
           (btor1356
            (bv->signal
             (zero-extend (signal-value btor586) (bitvector 18))
             btor586))
           (btor1357
            (bv->signal
             (zero-extend (signal-value btor465) (bitvector 1))
             btor465))
           (btor1358
            (bv->signal
             (zero-extend (signal-value btor464) (bitvector 1))
             btor464))
           (btor1359
            (bv->signal
             (zero-extend (signal-value btor464) (bitvector 1))
             btor464))
           (btor1360
            (bv->signal
             (zero-extend (signal-value btor92) (bitvector 1))
             btor92))
           (btor1361
            (bv->signal
             (zero-extend (signal-value btor912) (bitvector 1))
             btor912))
           (btor1362
            (bv->signal
             (zero-extend (signal-value btor913) (bitvector 1))
             btor913))
           (btor1363
            (bv->signal
             (zero-extend (signal-value btor912) (bitvector 1))
             btor912))
           (btor1364
            (bv->signal
             (zero-extend (signal-value btor710) (bitvector 1))
             btor710))
           (btor1365
            (bv->signal
             (zero-extend (signal-value btor709) (bitvector 1))
             btor709))
           (btor1366
            (bv->signal
             (zero-extend (signal-value btor709) (bitvector 1))
             btor709))
           (btor1367
            (bv->signal
             (zero-extend (signal-value btor93) (bitvector 1))
             btor93))
           (btor1368
            (bv->signal
             (zero-extend (signal-value btor914) (bitvector 1))
             btor914))
           (btor1369
            (bv->signal
             (zero-extend (signal-value btor94) (bitvector 1))
             btor94))
           (btor1370
            (bv->signal
             (zero-extend (signal-value btor95) (bitvector 1))
             btor95))
           (btor1371
            (bv->signal
             (zero-extend (signal-value btor937) (bitvector 18))
             btor937))
           (btor1372
            (bv->signal
             (zero-extend (signal-value btor670) (bitvector 18))
             btor670))
           (btor1374
            (if (bitvector->bool (signal-value btor1253)) btor722 btor293))
           (btor1375
            (if (bitvector->bool (signal-value btor1283)) btor134 btor1374))
           (btor1378 (signal (bvnot (signal-value btor150)) (list)))
           (btor1379
            (if (bitvector->bool (signal-value btor153)) btor1378 btor150))
           (btor1384 (signal (bvnot (signal-value btor169)) (list)))
           (btor1387 (signal (bvnot (signal-value btor180)) (list)))
           (btor1388
            (if (bitvector->bool (signal-value btor182)) btor1387 btor180))
           (btor1393 (signal (bvnot (signal-value btor196)) (list)))
           (btor1396 (signal (bvnot (signal-value btor212)) (list)))
           (btor1397
            (if (bitvector->bool (signal-value btor214)) btor1396 btor212))
           (btor1402 (signal (bvnot (signal-value btor228)) (list)))
           (btor1405 (signal (bvnot (signal-value btor243)) (list)))
           (btor1406
            (if (bitvector->bool (signal-value btor245)) btor1405 btor243))
           (btor1411 (signal (bvnot (signal-value btor259)) (list)))
           (btor1415 (signal (bvnot (signal-value btor286)) (list)))
           (btor1419
            (if (bitvector->bool (signal-value btor1322)) btor719 btor333))
           (btor1420
            (if (bitvector->bool (signal-value btor1352)) btor134 btor1419))
           (btor1424 (signal (bvnot (signal-value btor326)) (list)))
           (btor1428
            (if (bitvector->bool (signal-value btor1066)) btor422 btor375))
           (btor1429
            (if (bitvector->bool (signal-value btor1100)) btor336 btor1428))
           (btor1433 (signal (bvnot (signal-value btor368)) (list)))
           (btor1437
            (if (bitvector->bool (signal-value btor1066)) btor92 btor464))
           (btor1438
            (if (bitvector->bool (signal-value btor1100)) btor138 btor1437))
           (btor1441
            (if (bitvector->bool (signal-value btor1131)) btor667 btor508))
           (btor1442
            (if (bitvector->bool (signal-value btor1161)) btor336 btor1441))
           (btor1446 (signal (bvnot (signal-value btor501)) (list)))
           (btor1450
            (if (bitvector->bool (signal-value btor1192)) btor583 btor566))
           (btor1451
            (if (bitvector->bool (signal-value btor1222)) btor336 btor1450))
           (btor1455 (signal (bvnot (signal-value btor559)) (list)))
           (btor1460 (signal (bvnot (signal-value btor616)) (list)))
           (btor1464 (signal (bvnot (signal-value btor666)) (list)))
           (btor1467
            (if (bitvector->bool (signal-value btor1131)) btor93 btor709))
           (btor1468
            (if (bitvector->bool (signal-value btor1161)) btor138 btor1467))
           (btor1471
            (if (bitvector->bool (signal-value btor1322)) btor913 btor912))
           (btor1472
            (if (bitvector->bool (signal-value btor1352)) btor138 btor1471))
           (btor1475
            (if (bitvector->bool (signal-value btor1066)) btor425 btor919))
           (btor1476
            (if (bitvector->bool (signal-value btor1100)) btor336 btor1475))
           (btor1480 (signal (bvnot (signal-value btor936)) (list)))
           (btor1484 (signal (bvnot (signal-value btor1065)) (list)))
           (btor1488 (signal (bvnot (signal-value btor1099)) (list)))
           (btor1492 (signal (bvnot (signal-value btor1130)) (list)))
           (btor1496 (signal (bvnot (signal-value btor1160)) (list)))
           (btor1500 (signal (bvnot (signal-value btor1191)) (list)))
           (btor1504 (signal (bvnot (signal-value btor1221)) (list)))
           (btor1508 (signal (bvnot (signal-value btor1252)) (list)))
           (btor1512 (signal (bvnot (signal-value btor1282)) (list)))
           (btor1516 (signal (bvnot (signal-value btor1321)) (list)))
           (btor1520 (signal (bvnot (signal-value btor1351)) (list)))
           (output-state
            (remove-duplicates
             (append
              (append
               (list
                (cons
                 (string->symbol (string-append name "state1335"))
                 (cons
                  (signal-value btor1520)
                  (if (assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1335")))
                    (add1
                     (cdr
                      (assoc-ref
                       merged-input-state-hash
                       (string->symbol (string-append name "state1335")))))
                    0))))
               (append
                (list
                 (cons
                  (string->symbol (string-append name "state1333"))
                  (cons
                   (signal-value btor1331)
                   (if (assoc-has-key?
                        merged-input-state-hash
                        (string->symbol (string-append name "state1333")))
                     (add1
                      (cdr
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1333")))))
                     0))))
                (append
                 (list
                  (cons
                   (string->symbol (string-append name "state1332"))
                   (cons
                    (signal-value btor1352)
                    (if (assoc-has-key?
                         merged-input-state-hash
                         (string->symbol (string-append name "state1332")))
                      (add1
                       (cdr
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1332")))))
                      0))))
                 (append
                  (list
                   (cons
                    (string->symbol (string-append name "state1305"))
                    (cons
                     (signal-value btor1516)
                     (if (assoc-has-key?
                          merged-input-state-hash
                          (string->symbol (string-append name "state1305")))
                       (add1
                        (cdr
                         (assoc-ref
                          merged-input-state-hash
                          (string->symbol (string-append name "state1305")))))
                       0))))
                  (append
                   (list
                    (cons
                     (string->symbol (string-append name "state1303"))
                     (cons
                      (signal-value btor1301)
                      (if (assoc-has-key?
                           merged-input-state-hash
                           (string->symbol (string-append name "state1303")))
                        (add1
                         (cdr
                          (assoc-ref
                           merged-input-state-hash
                           (string->symbol (string-append name "state1303")))))
                        0))))
                   (append
                    (list
                     (cons
                      (string->symbol (string-append name "state1302"))
                      (cons
                       (signal-value btor1322)
                       (if (assoc-has-key?
                            merged-input-state-hash
                            (string->symbol (string-append name "state1302")))
                         (add1
                          (cdr
                           (assoc-ref
                            merged-input-state-hash
                            (string->symbol
                             (string-append name "state1302")))))
                         0))))
                    (append
                     (list
                      (cons
                       (string->symbol (string-append name "state1266"))
                       (cons
                        (signal-value btor1512)
                        (if (assoc-has-key?
                             merged-input-state-hash
                             (string->symbol (string-append name "state1266")))
                          (add1
                           (cdr
                            (assoc-ref
                             merged-input-state-hash
                             (string->symbol
                              (string-append name "state1266")))))
                          0))))
                     (append
                      (list
                       (cons
                        (string->symbol (string-append name "state1264"))
                        (cons
                         (signal-value btor1262)
                         (if (assoc-has-key?
                              merged-input-state-hash
                              (string->symbol
                               (string-append name "state1264")))
                           (add1
                            (cdr
                             (assoc-ref
                              merged-input-state-hash
                              (string->symbol
                               (string-append name "state1264")))))
                           0))))
                      (append
                       (list
                        (cons
                         (string->symbol (string-append name "state1263"))
                         (cons
                          (signal-value btor1283)
                          (if (assoc-has-key?
                               merged-input-state-hash
                               (string->symbol
                                (string-append name "state1263")))
                            (add1
                             (cdr
                              (assoc-ref
                               merged-input-state-hash
                               (string->symbol
                                (string-append name "state1263")))))
                            0))))
                       (append
                        (list
                         (cons
                          (string->symbol (string-append name "state1236"))
                          (cons
                           (signal-value btor1508)
                           (if (assoc-has-key?
                                merged-input-state-hash
                                (string->symbol
                                 (string-append name "state1236")))
                             (add1
                              (cdr
                               (assoc-ref
                                merged-input-state-hash
                                (string->symbol
                                 (string-append name "state1236")))))
                             0))))
                        (append
                         (list
                          (cons
                           (string->symbol (string-append name "state1234"))
                           (cons
                            (signal-value btor1232)
                            (if (assoc-has-key?
                                 merged-input-state-hash
                                 (string->symbol
                                  (string-append name "state1234")))
                              (add1
                               (cdr
                                (assoc-ref
                                 merged-input-state-hash
                                 (string->symbol
                                  (string-append name "state1234")))))
                              0))))
                         (append
                          (list
                           (cons
                            (string->symbol (string-append name "state1233"))
                            (cons
                             (signal-value btor1253)
                             (if (assoc-has-key?
                                  merged-input-state-hash
                                  (string->symbol
                                   (string-append name "state1233")))
                               (add1
                                (cdr
                                 (assoc-ref
                                  merged-input-state-hash
                                  (string->symbol
                                   (string-append name "state1233")))))
                               0))))
                          (append
                           (list
                            (cons
                             (string->symbol (string-append name "state1205"))
                             (cons
                              (signal-value btor1504)
                              (if (assoc-has-key?
                                   merged-input-state-hash
                                   (string->symbol
                                    (string-append name "state1205")))
                                (add1
                                 (cdr
                                  (assoc-ref
                                   merged-input-state-hash
                                   (string->symbol
                                    (string-append name "state1205")))))
                                0))))
                           (append
                            (list
                             (cons
                              (string->symbol (string-append name "state1203"))
                              (cons
                               (signal-value btor1201)
                               (if (assoc-has-key?
                                    merged-input-state-hash
                                    (string->symbol
                                     (string-append name "state1203")))
                                 (add1
                                  (cdr
                                   (assoc-ref
                                    merged-input-state-hash
                                    (string->symbol
                                     (string-append name "state1203")))))
                                 0))))
                            (append
                             (list
                              (cons
                               (string->symbol
                                (string-append name "state1202"))
                               (cons
                                (signal-value btor1222)
                                (if (assoc-has-key?
                                     merged-input-state-hash
                                     (string->symbol
                                      (string-append name "state1202")))
                                  (add1
                                   (cdr
                                    (assoc-ref
                                     merged-input-state-hash
                                     (string->symbol
                                      (string-append name "state1202")))))
                                  0))))
                             (append
                              (list
                               (cons
                                (string->symbol
                                 (string-append name "state1175"))
                                (cons
                                 (signal-value btor1500)
                                 (if (assoc-has-key?
                                      merged-input-state-hash
                                      (string->symbol
                                       (string-append name "state1175")))
                                   (add1
                                    (cdr
                                     (assoc-ref
                                      merged-input-state-hash
                                      (string->symbol
                                       (string-append name "state1175")))))
                                   0))))
                              (append
                               (list
                                (cons
                                 (string->symbol
                                  (string-append name "state1173"))
                                 (cons
                                  (signal-value btor1171)
                                  (if (assoc-has-key?
                                       merged-input-state-hash
                                       (string->symbol
                                        (string-append name "state1173")))
                                    (add1
                                     (cdr
                                      (assoc-ref
                                       merged-input-state-hash
                                       (string->symbol
                                        (string-append name "state1173")))))
                                    0))))
                               (append
                                (list
                                 (cons
                                  (string->symbol
                                   (string-append name "state1172"))
                                  (cons
                                   (signal-value btor1192)
                                   (if (assoc-has-key?
                                        merged-input-state-hash
                                        (string->symbol
                                         (string-append name "state1172")))
                                     (add1
                                      (cdr
                                       (assoc-ref
                                        merged-input-state-hash
                                        (string->symbol
                                         (string-append name "state1172")))))
                                     0))))
                                (append
                                 (list
                                  (cons
                                   (string->symbol
                                    (string-append name "state1144"))
                                   (cons
                                    (signal-value btor1496)
                                    (if (assoc-has-key?
                                         merged-input-state-hash
                                         (string->symbol
                                          (string-append name "state1144")))
                                      (add1
                                       (cdr
                                        (assoc-ref
                                         merged-input-state-hash
                                         (string->symbol
                                          (string-append name "state1144")))))
                                      0))))
                                 (append
                                  (list
                                   (cons
                                    (string->symbol
                                     (string-append name "state1142"))
                                    (cons
                                     (signal-value btor1140)
                                     (if (assoc-has-key?
                                          merged-input-state-hash
                                          (string->symbol
                                           (string-append name "state1142")))
                                       (add1
                                        (cdr
                                         (assoc-ref
                                          merged-input-state-hash
                                          (string->symbol
                                           (string-append name "state1142")))))
                                       0))))
                                  (append
                                   (list
                                    (cons
                                     (string->symbol
                                      (string-append name "state1141"))
                                     (cons
                                      (signal-value btor1161)
                                      (if (assoc-has-key?
                                           merged-input-state-hash
                                           (string->symbol
                                            (string-append name "state1141")))
                                        (add1
                                         (cdr
                                          (assoc-ref
                                           merged-input-state-hash
                                           (string->symbol
                                            (string-append
                                             name
                                             "state1141")))))
                                        0))))
                                   (append
                                    (list
                                     (cons
                                      (string->symbol
                                       (string-append name "state1114"))
                                      (cons
                                       (signal-value btor1492)
                                       (if (assoc-has-key?
                                            merged-input-state-hash
                                            (string->symbol
                                             (string-append name "state1114")))
                                         (add1
                                          (cdr
                                           (assoc-ref
                                            merged-input-state-hash
                                            (string->symbol
                                             (string-append
                                              name
                                              "state1114")))))
                                         0))))
                                    (append
                                     (list
                                      (cons
                                       (string->symbol
                                        (string-append name "state1112"))
                                       (cons
                                        (signal-value btor1110)
                                        (if (assoc-has-key?
                                             merged-input-state-hash
                                             (string->symbol
                                              (string-append
                                               name
                                               "state1112")))
                                          (add1
                                           (cdr
                                            (assoc-ref
                                             merged-input-state-hash
                                             (string->symbol
                                              (string-append
                                               name
                                               "state1112")))))
                                          0))))
                                     (append
                                      (list
                                       (cons
                                        (string->symbol
                                         (string-append name "state1111"))
                                        (cons
                                         (signal-value btor1131)
                                         (if (assoc-has-key?
                                              merged-input-state-hash
                                              (string->symbol
                                               (string-append
                                                name
                                                "state1111")))
                                           (add1
                                            (cdr
                                             (assoc-ref
                                              merged-input-state-hash
                                              (string->symbol
                                               (string-append
                                                name
                                                "state1111")))))
                                           0))))
                                      (append
                                       (list
                                        (cons
                                         (string->symbol
                                          (string-append name "state1082"))
                                         (cons
                                          (signal-value btor1488)
                                          (if (assoc-has-key?
                                               merged-input-state-hash
                                               (string->symbol
                                                (string-append
                                                 name
                                                 "state1082")))
                                            (add1
                                             (cdr
                                              (assoc-ref
                                               merged-input-state-hash
                                               (string->symbol
                                                (string-append
                                                 name
                                                 "state1082")))))
                                            0))))
                                       (append
                                        (list
                                         (cons
                                          (string->symbol
                                           (string-append name "state1080"))
                                          (cons
                                           (signal-value btor1078)
                                           (if (assoc-has-key?
                                                merged-input-state-hash
                                                (string->symbol
                                                 (string-append
                                                  name
                                                  "state1080")))
                                             (add1
                                              (cdr
                                               (assoc-ref
                                                merged-input-state-hash
                                                (string->symbol
                                                 (string-append
                                                  name
                                                  "state1080")))))
                                             0))))
                                        (append
                                         (list
                                          (cons
                                           (string->symbol
                                            (string-append name "state1079"))
                                           (cons
                                            (signal-value btor1100)
                                            (if (assoc-has-key?
                                                 merged-input-state-hash
                                                 (string->symbol
                                                  (string-append
                                                   name
                                                   "state1079")))
                                              (add1
                                               (cdr
                                                (assoc-ref
                                                 merged-input-state-hash
                                                 (string->symbol
                                                  (string-append
                                                   name
                                                   "state1079")))))
                                              0))))
                                         (append
                                          (list
                                           (cons
                                            (string->symbol
                                             (string-append name "state1048"))
                                            (cons
                                             (signal-value btor1484)
                                             (if (assoc-has-key?
                                                  merged-input-state-hash
                                                  (string->symbol
                                                   (string-append
                                                    name
                                                    "state1048")))
                                               (add1
                                                (cdr
                                                 (assoc-ref
                                                  merged-input-state-hash
                                                  (string->symbol
                                                   (string-append
                                                    name
                                                    "state1048")))))
                                               0))))
                                          (append
                                           (list
                                            (cons
                                             (string->symbol
                                              (string-append name "state1046"))
                                             (cons
                                              (signal-value btor1044)
                                              (if (assoc-has-key?
                                                   merged-input-state-hash
                                                   (string->symbol
                                                    (string-append
                                                     name
                                                     "state1046")))
                                                (add1
                                                 (cdr
                                                  (assoc-ref
                                                   merged-input-state-hash
                                                   (string->symbol
                                                    (string-append
                                                     name
                                                     "state1046")))))
                                                0))))
                                           (append
                                            (list
                                             (cons
                                              (string->symbol
                                               (string-append
                                                name
                                                "state1045"))
                                              (cons
                                               (signal-value btor1066)
                                               (if (assoc-has-key?
                                                    merged-input-state-hash
                                                    (string->symbol
                                                     (string-append
                                                      name
                                                      "state1045")))
                                                 (add1
                                                  (cdr
                                                   (assoc-ref
                                                    merged-input-state-hash
                                                    (string->symbol
                                                     (string-append
                                                      name
                                                      "state1045")))))
                                                 0))))
                                            (append
                                             (list
                                              (cons
                                               (string->symbol
                                                (string-append
                                                 name
                                                 "state928"))
                                               (cons
                                                (signal-value btor1480)
                                                (if (assoc-has-key?
                                                     merged-input-state-hash
                                                     (string->symbol
                                                      (string-append
                                                       name
                                                       "state928")))
                                                  (add1
                                                   (cdr
                                                    (assoc-ref
                                                     merged-input-state-hash
                                                     (string->symbol
                                                      (string-append
                                                       name
                                                       "state928")))))
                                                  0))))
                                             (append
                                              (list
                                               (cons
                                                (string->symbol
                                                 (string-append
                                                  name
                                                  "state926"))
                                                (cons
                                                 (signal-value btor924)
                                                 (if (assoc-has-key?
                                                      merged-input-state-hash
                                                      (string->symbol
                                                       (string-append
                                                        name
                                                        "state926")))
                                                   (add1
                                                    (cdr
                                                     (assoc-ref
                                                      merged-input-state-hash
                                                      (string->symbol
                                                       (string-append
                                                        name
                                                        "state926")))))
                                                   0))))
                                              (append
                                               (list
                                                (cons
                                                 (string->symbol
                                                  (string-append
                                                   name
                                                   "state925"))
                                                 (cons
                                                  (signal-value btor937)
                                                  (if (assoc-has-key?
                                                       merged-input-state-hash
                                                       (string->symbol
                                                        (string-append
                                                         name
                                                         "state925")))
                                                    (add1
                                                     (cdr
                                                      (assoc-ref
                                                       merged-input-state-hash
                                                       (string->symbol
                                                        (string-append
                                                         name
                                                         "state925")))))
                                                    0))))
                                               (append
                                                (list
                                                 (cons
                                                  (string->symbol
                                                   (string-append
                                                    name
                                                    "state917"))
                                                  (cons
                                                   (signal-value btor1476)
                                                   (if (assoc-has-key?
                                                        merged-input-state-hash
                                                        (string->symbol
                                                         (string-append
                                                          name
                                                          "state917")))
                                                     (add1
                                                      (cdr
                                                       (assoc-ref
                                                        merged-input-state-hash
                                                        (string->symbol
                                                         (string-append
                                                          name
                                                          "state917")))))
                                                     0))))
                                                (append
                                                 (list
                                                  (cons
                                                   (string->symbol
                                                    (string-append
                                                     name
                                                     "state916"))
                                                   (cons
                                                    (signal-value btor919)
                                                    (if (assoc-has-key?
                                                         merged-input-state-hash
                                                         (string->symbol
                                                          (string-append
                                                           name
                                                           "state916")))
                                                      (add1
                                                       (cdr
                                                        (assoc-ref
                                                         merged-input-state-hash
                                                         (string->symbol
                                                          (string-append
                                                           name
                                                           "state916")))))
                                                      0))))
                                                 (append
                                                  (list
                                                   (cons
                                                    (string->symbol
                                                     (string-append
                                                      name
                                                      "state910"))
                                                    (cons
                                                     (signal-value btor1472)
                                                     (if (assoc-has-key?
                                                          merged-input-state-hash
                                                          (string->symbol
                                                           (string-append
                                                            name
                                                            "state910")))
                                                       (add1
                                                        (cdr
                                                         (assoc-ref
                                                          merged-input-state-hash
                                                          (string->symbol
                                                           (string-append
                                                            name
                                                            "state910")))))
                                                       0))))
                                                  (append
                                                   (list
                                                    (cons
                                                     (string->symbol
                                                      (string-append
                                                       name
                                                       "state909"))
                                                     (cons
                                                      (signal-value btor912)
                                                      (if (assoc-has-key?
                                                           merged-input-state-hash
                                                           (string->symbol
                                                            (string-append
                                                             name
                                                             "state909")))
                                                        (add1
                                                         (cdr
                                                          (assoc-ref
                                                           merged-input-state-hash
                                                           (string->symbol
                                                            (string-append
                                                             name
                                                             "state909")))))
                                                        0))))
                                                   (append
                                                    (list
                                                     (cons
                                                      (string->symbol
                                                       (string-append
                                                        name
                                                        "state707"))
                                                      (cons
                                                       (signal-value btor1468)
                                                       (if (assoc-has-key?
                                                            merged-input-state-hash
                                                            (string->symbol
                                                             (string-append
                                                              name
                                                              "state707")))
                                                         (add1
                                                          (cdr
                                                           (assoc-ref
                                                            merged-input-state-hash
                                                            (string->symbol
                                                             (string-append
                                                              name
                                                              "state707")))))
                                                         0))))
                                                    (append
                                                     (list
                                                      (cons
                                                       (string->symbol
                                                        (string-append
                                                         name
                                                         "state706"))
                                                       (cons
                                                        (signal-value btor709)
                                                        (if (assoc-has-key?
                                                             merged-input-state-hash
                                                             (string->symbol
                                                              (string-append
                                                               name
                                                               "state706")))
                                                          (add1
                                                           (cdr
                                                            (assoc-ref
                                                             merged-input-state-hash
                                                             (string->symbol
                                                              (string-append
                                                               name
                                                               "state706")))))
                                                          0))))
                                                     (append
                                                      (list
                                                       (cons
                                                        (string->symbol
                                                         (string-append
                                                          name
                                                          "state654"))
                                                        (cons
                                                         (signal-value
                                                          btor1464)
                                                         (if (assoc-has-key?
                                                              merged-input-state-hash
                                                              (string->symbol
                                                               (string-append
                                                                name
                                                                "state654")))
                                                           (add1
                                                            (cdr
                                                             (assoc-ref
                                                              merged-input-state-hash
                                                              (string->symbol
                                                               (string-append
                                                                name
                                                                "state654")))))
                                                           0))))
                                                      (append
                                                       (list
                                                        (cons
                                                         (string->symbol
                                                          (string-append
                                                           name
                                                           "state652"))
                                                         (cons
                                                          (signal-value
                                                           btor650)
                                                          (if (assoc-has-key?
                                                               merged-input-state-hash
                                                               (string->symbol
                                                                (string-append
                                                                 name
                                                                 "state652")))
                                                            (add1
                                                             (cdr
                                                              (assoc-ref
                                                               merged-input-state-hash
                                                               (string->symbol
                                                                (string-append
                                                                 name
                                                                 "state652")))))
                                                            0))))
                                                       (append
                                                        (list
                                                         (cons
                                                          (string->symbol
                                                           (string-append
                                                            name
                                                            "state651"))
                                                          (cons
                                                           (signal-value
                                                            btor667)
                                                           (if (assoc-has-key?
                                                                merged-input-state-hash
                                                                (string->symbol
                                                                 (string-append
                                                                  name
                                                                  "state651")))
                                                             (add1
                                                              (cdr
                                                               (assoc-ref
                                                                merged-input-state-hash
                                                                (string->symbol
                                                                 (string-append
                                                                  name
                                                                  "state651")))))
                                                             0))))
                                                        (append
                                                         (list
                                                          (cons
                                                           (string->symbol
                                                            (string-append
                                                             name
                                                             "state603"))
                                                           (cons
                                                            (signal-value
                                                             btor1460)
                                                            (if (assoc-has-key?
                                                                 merged-input-state-hash
                                                                 (string->symbol
                                                                  (string-append
                                                                   name
                                                                   "state603")))
                                                              (add1
                                                               (cdr
                                                                (assoc-ref
                                                                 merged-input-state-hash
                                                                 (string->symbol
                                                                  (string-append
                                                                   name
                                                                   "state603")))))
                                                              0))))
                                                         (append
                                                          (list
                                                           (cons
                                                            (string->symbol
                                                             (string-append
                                                              name
                                                              "state601"))
                                                            (cons
                                                             (signal-value
                                                              btor598)
                                                             (if (assoc-has-key?
                                                                  merged-input-state-hash
                                                                  (string->symbol
                                                                   (string-append
                                                                    name
                                                                    "state601")))
                                                               (add1
                                                                (cdr
                                                                 (assoc-ref
                                                                  merged-input-state-hash
                                                                  (string->symbol
                                                                   (string-append
                                                                    name
                                                                    "state601")))))
                                                               0))))
                                                          (append
                                                           (list
                                                            (cons
                                                             (string->symbol
                                                              (string-append
                                                               name
                                                               "state599"))
                                                             (cons
                                                              (signal-value
                                                               btor617)
                                                              (if (assoc-has-key?
                                                                   merged-input-state-hash
                                                                   (string->symbol
                                                                    (string-append
                                                                     name
                                                                     "state599")))
                                                                (add1
                                                                 (cdr
                                                                  (assoc-ref
                                                                   merged-input-state-hash
                                                                   (string->symbol
                                                                    (string-append
                                                                     name
                                                                     "state599")))))
                                                                0))))
                                                           (append
                                                            (list
                                                             (cons
                                                              (string->symbol
                                                               (string-append
                                                                name
                                                                "state561"))
                                                              (cons
                                                               (signal-value
                                                                btor560)
                                                               (if (assoc-has-key?
                                                                    merged-input-state-hash
                                                                    (string->symbol
                                                                     (string-append
                                                                      name
                                                                      "state561")))
                                                                 (add1
                                                                  (cdr
                                                                   (assoc-ref
                                                                    merged-input-state-hash
                                                                    (string->symbol
                                                                     (string-append
                                                                      name
                                                                      "state561")))))
                                                                 0))))
                                                            (append
                                                             (list
                                                              (cons
                                                               (string->symbol
                                                                (string-append
                                                                 name
                                                                 "state542"))
                                                               (cons
                                                                (signal-value
                                                                 btor1455)
                                                                (if (assoc-has-key?
                                                                     merged-input-state-hash
                                                                     (string->symbol
                                                                      (string-append
                                                                       name
                                                                       "state542")))
                                                                  (add1
                                                                   (cdr
                                                                    (assoc-ref
                                                                     merged-input-state-hash
                                                                     (string->symbol
                                                                      (string-append
                                                                       name
                                                                       "state542")))))
                                                                  0))))
                                                             (append
                                                              (list
                                                               (cons
                                                                (string->symbol
                                                                 (string-append
                                                                  name
                                                                  "state540"))
                                                                (cons
                                                                 (signal-value
                                                                  btor537)
                                                                 (if (assoc-has-key?
                                                                      merged-input-state-hash
                                                                      (string->symbol
                                                                       (string-append
                                                                        name
                                                                        "state540")))
                                                                   (add1
                                                                    (cdr
                                                                     (assoc-ref
                                                                      merged-input-state-hash
                                                                      (string->symbol
                                                                       (string-append
                                                                        name
                                                                        "state540")))))
                                                                   0))))
                                                              (append
                                                               (list
                                                                (cons
                                                                 (string->symbol
                                                                  (string-append
                                                                   name
                                                                   "state538"))
                                                                 (cons
                                                                  (signal-value
                                                                   btor560)
                                                                  (if (assoc-has-key?
                                                                       merged-input-state-hash
                                                                       (string->symbol
                                                                        (string-append
                                                                         name
                                                                         "state538")))
                                                                    (add1
                                                                     (cdr
                                                                      (assoc-ref
                                                                       merged-input-state-hash
                                                                       (string->symbol
                                                                        (string-append
                                                                         name
                                                                         "state538")))))
                                                                    0))))
                                                               (append
                                                                (list
                                                                 (cons
                                                                  (string->symbol
                                                                   (string-append
                                                                    name
                                                                    "state527"))
                                                                  (cons
                                                                   (signal-value
                                                                    btor1451)
                                                                   (if (assoc-has-key?
                                                                        merged-input-state-hash
                                                                        (string->symbol
                                                                         (string-append
                                                                          name
                                                                          "state527")))
                                                                     (add1
                                                                      (cdr
                                                                       (assoc-ref
                                                                        merged-input-state-hash
                                                                        (string->symbol
                                                                         (string-append
                                                                          name
                                                                          "state527")))))
                                                                     0))))
                                                                (append
                                                                 (list
                                                                  (cons
                                                                   (string->symbol
                                                                    (string-append
                                                                     name
                                                                     "state526"))
                                                                   (cons
                                                                    (signal-value
                                                                     btor566)
                                                                    (if (assoc-has-key?
                                                                         merged-input-state-hash
                                                                         (string->symbol
                                                                          (string-append
                                                                           name
                                                                           "state526")))
                                                                      (add1
                                                                       (cdr
                                                                        (assoc-ref
                                                                         merged-input-state-hash
                                                                         (string->symbol
                                                                          (string-append
                                                                           name
                                                                           "state526")))))
                                                                      0))))
                                                                 (append
                                                                  (list
                                                                   (cons
                                                                    (string->symbol
                                                                     (string-append
                                                                      name
                                                                      "state503"))
                                                                    (cons
                                                                     (signal-value
                                                                      btor502)
                                                                     (if (assoc-has-key?
                                                                          merged-input-state-hash
                                                                          (string->symbol
                                                                           (string-append
                                                                            name
                                                                            "state503")))
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
                                                                      (string-append
                                                                       name
                                                                       "state484"))
                                                                     (cons
                                                                      (signal-value
                                                                       btor1446)
                                                                      (if (assoc-has-key?
                                                                           merged-input-state-hash
                                                                           (string->symbol
                                                                            (string-append
                                                                             name
                                                                             "state484")))
                                                                        (add1
                                                                         (cdr
                                                                          (assoc-ref
                                                                           merged-input-state-hash
                                                                           (string->symbol
                                                                            (string-append
                                                                             name
                                                                             "state484")))))
                                                                        0))))
                                                                   (append
                                                                    (list
                                                                     (cons
                                                                      (string->symbol
                                                                       (string-append
                                                                        name
                                                                        "state482"))
                                                                      (cons
                                                                       (signal-value
                                                                        btor479)
                                                                       (if (assoc-has-key?
                                                                            merged-input-state-hash
                                                                            (string->symbol
                                                                             (string-append
                                                                              name
                                                                              "state482")))
                                                                         (add1
                                                                          (cdr
                                                                           (assoc-ref
                                                                            merged-input-state-hash
                                                                            (string->symbol
                                                                             (string-append
                                                                              name
                                                                              "state482")))))
                                                                         0))))
                                                                    (append
                                                                     (list
                                                                      (cons
                                                                       (string->symbol
                                                                        (string-append
                                                                         name
                                                                         "state480"))
                                                                       (cons
                                                                        (signal-value
                                                                         btor502)
                                                                        (if (assoc-has-key?
                                                                             merged-input-state-hash
                                                                             (string->symbol
                                                                              (string-append
                                                                               name
                                                                               "state480")))
                                                                          (add1
                                                                           (cdr
                                                                            (assoc-ref
                                                                             merged-input-state-hash
                                                                             (string->symbol
                                                                              (string-append
                                                                               name
                                                                               "state480")))))
                                                                          0))))
                                                                     (append
                                                                      (list
                                                                       (cons
                                                                        (string->symbol
                                                                         (string-append
                                                                          name
                                                                          "state469"))
                                                                        (cons
                                                                         (signal-value
                                                                          btor1442)
                                                                         (if (assoc-has-key?
                                                                              merged-input-state-hash
                                                                              (string->symbol
                                                                               (string-append
                                                                                name
                                                                                "state469")))
                                                                           (add1
                                                                            (cdr
                                                                             (assoc-ref
                                                                              merged-input-state-hash
                                                                              (string->symbol
                                                                               (string-append
                                                                                name
                                                                                "state469")))))
                                                                           0))))
                                                                      (append
                                                                       (list
                                                                        (cons
                                                                         (string->symbol
                                                                          (string-append
                                                                           name
                                                                           "state468"))
                                                                         (cons
                                                                          (signal-value
                                                                           btor508)
                                                                          (if (assoc-has-key?
                                                                               merged-input-state-hash
                                                                               (string->symbol
                                                                                (string-append
                                                                                 name
                                                                                 "state468")))
                                                                            (add1
                                                                             (cdr
                                                                              (assoc-ref
                                                                               merged-input-state-hash
                                                                               (string->symbol
                                                                                (string-append
                                                                                 name
                                                                                 "state468")))))
                                                                            0))))
                                                                       (append
                                                                        (list
                                                                         (cons
                                                                          (string->symbol
                                                                           (string-append
                                                                            name
                                                                            "state462"))
                                                                          (cons
                                                                           (signal-value
                                                                            btor1438)
                                                                           (if (assoc-has-key?
                                                                                merged-input-state-hash
                                                                                (string->symbol
                                                                                 (string-append
                                                                                  name
                                                                                  "state462")))
                                                                             (add1
                                                                              (cdr
                                                                               (assoc-ref
                                                                                merged-input-state-hash
                                                                                (string->symbol
                                                                                 (string-append
                                                                                  name
                                                                                  "state462")))))
                                                                             0))))
                                                                        (append
                                                                         (list
                                                                          (cons
                                                                           (string->symbol
                                                                            (string-append
                                                                             name
                                                                             "state461"))
                                                                           (cons
                                                                            (signal-value
                                                                             btor464)
                                                                            (if (assoc-has-key?
                                                                                 merged-input-state-hash
                                                                                 (string->symbol
                                                                                  (string-append
                                                                                   name
                                                                                   "state461")))
                                                                              (add1
                                                                               (cdr
                                                                                (assoc-ref
                                                                                 merged-input-state-hash
                                                                                 (string->symbol
                                                                                  (string-append
                                                                                   name
                                                                                   "state461")))))
                                                                              0))))
                                                                         (append
                                                                          (list
                                                                           (cons
                                                                            (string->symbol
                                                                             (string-append
                                                                              name
                                                                              "state370"))
                                                                            (cons
                                                                             (signal-value
                                                                              btor369)
                                                                             (if (assoc-has-key?
                                                                                  merged-input-state-hash
                                                                                  (string->symbol
                                                                                   (string-append
                                                                                    name
                                                                                    "state370")))
                                                                               (add1
                                                                                (cdr
                                                                                 (assoc-ref
                                                                                  merged-input-state-hash
                                                                                  (string->symbol
                                                                                   (string-append
                                                                                    name
                                                                                    "state370")))))
                                                                               0))))
                                                                          (append
                                                                           (list
                                                                            (cons
                                                                             (string->symbol
                                                                              (string-append
                                                                               name
                                                                               "state351"))
                                                                             (cons
                                                                              (signal-value
                                                                               btor1433)
                                                                              (if (assoc-has-key?
                                                                                   merged-input-state-hash
                                                                                   (string->symbol
                                                                                    (string-append
                                                                                     name
                                                                                     "state351")))
                                                                                (add1
                                                                                 (cdr
                                                                                  (assoc-ref
                                                                                   merged-input-state-hash
                                                                                   (string->symbol
                                                                                    (string-append
                                                                                     name
                                                                                     "state351")))))
                                                                                0))))
                                                                           (append
                                                                            (list
                                                                             (cons
                                                                              (string->symbol
                                                                               (string-append
                                                                                name
                                                                                "state349"))
                                                                              (cons
                                                                               (signal-value
                                                                                btor347)
                                                                               (if (assoc-has-key?
                                                                                    merged-input-state-hash
                                                                                    (string->symbol
                                                                                     (string-append
                                                                                      name
                                                                                      "state349")))
                                                                                 (add1
                                                                                  (cdr
                                                                                   (assoc-ref
                                                                                    merged-input-state-hash
                                                                                    (string->symbol
                                                                                     (string-append
                                                                                      name
                                                                                      "state349")))))
                                                                                 0))))
                                                                            (append
                                                                             (list
                                                                              (cons
                                                                               (string->symbol
                                                                                (string-append
                                                                                 name
                                                                                 "state348"))
                                                                               (cons
                                                                                (signal-value
                                                                                 btor369)
                                                                                (if (assoc-has-key?
                                                                                     merged-input-state-hash
                                                                                     (string->symbol
                                                                                      (string-append
                                                                                       name
                                                                                       "state348")))
                                                                                  (add1
                                                                                   (cdr
                                                                                    (assoc-ref
                                                                                     merged-input-state-hash
                                                                                     (string->symbol
                                                                                      (string-append
                                                                                       name
                                                                                       "state348")))))
                                                                                  0))))
                                                                             (append
                                                                              (list
                                                                               (cons
                                                                                (string->symbol
                                                                                 (string-append
                                                                                  name
                                                                                  "state337"))
                                                                                (cons
                                                                                 (signal-value
                                                                                  btor1429)
                                                                                 (if (assoc-has-key?
                                                                                      merged-input-state-hash
                                                                                      (string->symbol
                                                                                       (string-append
                                                                                        name
                                                                                        "state337")))
                                                                                   (add1
                                                                                    (cdr
                                                                                     (assoc-ref
                                                                                      merged-input-state-hash
                                                                                      (string->symbol
                                                                                       (string-append
                                                                                        name
                                                                                        "state337")))))
                                                                                   0))))
                                                                              (append
                                                                               (list
                                                                                (cons
                                                                                 (string->symbol
                                                                                  (string-append
                                                                                   name
                                                                                   "state335"))
                                                                                 (cons
                                                                                  (signal-value
                                                                                   btor375)
                                                                                  (if (assoc-has-key?
                                                                                       merged-input-state-hash
                                                                                       (string->symbol
                                                                                        (string-append
                                                                                         name
                                                                                         "state335")))
                                                                                    (add1
                                                                                     (cdr
                                                                                      (assoc-ref
                                                                                       merged-input-state-hash
                                                                                       (string->symbol
                                                                                        (string-append
                                                                                         name
                                                                                         "state335")))))
                                                                                    0))))
                                                                               (append
                                                                                (list
                                                                                 (cons
                                                                                  (string->symbol
                                                                                   (string-append
                                                                                    name
                                                                                    "state328"))
                                                                                  (cons
                                                                                   (signal-value
                                                                                    btor327)
                                                                                   (if (assoc-has-key?
                                                                                        merged-input-state-hash
                                                                                        (string->symbol
                                                                                         (string-append
                                                                                          name
                                                                                          "state328")))
                                                                                     (add1
                                                                                      (cdr
                                                                                       (assoc-ref
                                                                                        merged-input-state-hash
                                                                                        (string->symbol
                                                                                         (string-append
                                                                                          name
                                                                                          "state328")))))
                                                                                     0))))
                                                                                (append
                                                                                 (list
                                                                                  (cons
                                                                                   (string->symbol
                                                                                    (string-append
                                                                                     name
                                                                                     "state309"))
                                                                                   (cons
                                                                                    (signal-value
                                                                                     btor1424)
                                                                                    (if (assoc-has-key?
                                                                                         merged-input-state-hash
                                                                                         (string->symbol
                                                                                          (string-append
                                                                                           name
                                                                                           "state309")))
                                                                                      (add1
                                                                                       (cdr
                                                                                        (assoc-ref
                                                                                         merged-input-state-hash
                                                                                         (string->symbol
                                                                                          (string-append
                                                                                           name
                                                                                           "state309")))))
                                                                                      0))))
                                                                                 (append
                                                                                  (list
                                                                                   (cons
                                                                                    (string->symbol
                                                                                     (string-append
                                                                                      name
                                                                                      "state307"))
                                                                                    (cons
                                                                                     (signal-value
                                                                                      btor305)
                                                                                     (if (assoc-has-key?
                                                                                          merged-input-state-hash
                                                                                          (string->symbol
                                                                                           (string-append
                                                                                            name
                                                                                            "state307")))
                                                                                       (add1
                                                                                        (cdr
                                                                                         (assoc-ref
                                                                                          merged-input-state-hash
                                                                                          (string->symbol
                                                                                           (string-append
                                                                                            name
                                                                                            "state307")))))
                                                                                       0))))
                                                                                  (append
                                                                                   (list
                                                                                    (cons
                                                                                     (string->symbol
                                                                                      (string-append
                                                                                       name
                                                                                       "state306"))
                                                                                     (cons
                                                                                      (signal-value
                                                                                       btor327)
                                                                                      (if (assoc-has-key?
                                                                                           merged-input-state-hash
                                                                                           (string->symbol
                                                                                            (string-append
                                                                                             name
                                                                                             "state306")))
                                                                                        (add1
                                                                                         (cdr
                                                                                          (assoc-ref
                                                                                           merged-input-state-hash
                                                                                           (string->symbol
                                                                                            (string-append
                                                                                             name
                                                                                             "state306")))))
                                                                                        0))))
                                                                                   (append
                                                                                    (list
                                                                                     (cons
                                                                                      (string->symbol
                                                                                       (string-append
                                                                                        name
                                                                                        "state295"))
                                                                                      (cons
                                                                                       (signal-value
                                                                                        btor1420)
                                                                                       (if (assoc-has-key?
                                                                                            merged-input-state-hash
                                                                                            (string->symbol
                                                                                             (string-append
                                                                                              name
                                                                                              "state295")))
                                                                                         (add1
                                                                                          (cdr
                                                                                           (assoc-ref
                                                                                            merged-input-state-hash
                                                                                            (string->symbol
                                                                                             (string-append
                                                                                              name
                                                                                              "state295")))))
                                                                                         0))))
                                                                                    (append
                                                                                     (list
                                                                                      (cons
                                                                                       (string->symbol
                                                                                        (string-append
                                                                                         name
                                                                                         "state294"))
                                                                                       (cons
                                                                                        (signal-value
                                                                                         btor333)
                                                                                        (if (assoc-has-key?
                                                                                             merged-input-state-hash
                                                                                             (string->symbol
                                                                                              (string-append
                                                                                               name
                                                                                               "state294")))
                                                                                          (add1
                                                                                           (cdr
                                                                                            (assoc-ref
                                                                                             merged-input-state-hash
                                                                                             (string->symbol
                                                                                              (string-append
                                                                                               name
                                                                                               "state294")))))
                                                                                          0))))
                                                                                     (append
                                                                                      (list
                                                                                       (cons
                                                                                        (string->symbol
                                                                                         (string-append
                                                                                          name
                                                                                          "state288"))
                                                                                        (cons
                                                                                         (signal-value
                                                                                          btor287)
                                                                                         (if (assoc-has-key?
                                                                                              merged-input-state-hash
                                                                                              (string->symbol
                                                                                               (string-append
                                                                                                name
                                                                                                "state288")))
                                                                                           (add1
                                                                                            (cdr
                                                                                             (assoc-ref
                                                                                              merged-input-state-hash
                                                                                              (string->symbol
                                                                                               (string-append
                                                                                                name
                                                                                                "state288")))))
                                                                                           0))))
                                                                                      (append
                                                                                       (list
                                                                                        (cons
                                                                                         (string->symbol
                                                                                          (string-append
                                                                                           name
                                                                                           "state268"))
                                                                                         (cons
                                                                                          (signal-value
                                                                                           btor1415)
                                                                                          (if (assoc-has-key?
                                                                                               merged-input-state-hash
                                                                                               (string->symbol
                                                                                                (string-append
                                                                                                 name
                                                                                                 "state268")))
                                                                                            (add1
                                                                                             (cdr
                                                                                              (assoc-ref
                                                                                               merged-input-state-hash
                                                                                               (string->symbol
                                                                                                (string-append
                                                                                                 name
                                                                                                 "state268")))))
                                                                                            0))))
                                                                                       (append
                                                                                        (list
                                                                                         (cons
                                                                                          (string->symbol
                                                                                           (string-append
                                                                                            name
                                                                                            "state266"))
                                                                                          (cons
                                                                                           (signal-value
                                                                                            btor264)
                                                                                           (if (assoc-has-key?
                                                                                                merged-input-state-hash
                                                                                                (string->symbol
                                                                                                 (string-append
                                                                                                  name
                                                                                                  "state266")))
                                                                                             (add1
                                                                                              (cdr
                                                                                               (assoc-ref
                                                                                                merged-input-state-hash
                                                                                                (string->symbol
                                                                                                 (string-append
                                                                                                  name
                                                                                                  "state266")))))
                                                                                             0))))
                                                                                        (append
                                                                                         (list
                                                                                          (cons
                                                                                           (string->symbol
                                                                                            (string-append
                                                                                             name
                                                                                             "state265"))
                                                                                           (cons
                                                                                            (signal-value
                                                                                             btor287)
                                                                                            (if (assoc-has-key?
                                                                                                 merged-input-state-hash
                                                                                                 (string->symbol
                                                                                                  (string-append
                                                                                                   name
                                                                                                   "state265")))
                                                                                              (add1
                                                                                               (cdr
                                                                                                (assoc-ref
                                                                                                 merged-input-state-hash
                                                                                                 (string->symbol
                                                                                                  (string-append
                                                                                                   name
                                                                                                   "state265")))))
                                                                                              0))))
                                                                                         (append
                                                                                          (list
                                                                                           (cons
                                                                                            (string->symbol
                                                                                             (string-append
                                                                                              name
                                                                                              "state251"))
                                                                                            (cons
                                                                                             (signal-value
                                                                                              btor1411)
                                                                                             (if (assoc-has-key?
                                                                                                  merged-input-state-hash
                                                                                                  (string->symbol
                                                                                                   (string-append
                                                                                                    name
                                                                                                    "state251")))
                                                                                               (add1
                                                                                                (cdr
                                                                                                 (assoc-ref
                                                                                                  merged-input-state-hash
                                                                                                  (string->symbol
                                                                                                   (string-append
                                                                                                    name
                                                                                                    "state251")))))
                                                                                               0))))
                                                                                          (append
                                                                                           (list
                                                                                            (cons
                                                                                             (string->symbol
                                                                                              (string-append
                                                                                               name
                                                                                               "state249"))
                                                                                             (cons
                                                                                              (signal-value
                                                                                               btor246)
                                                                                              (if (assoc-has-key?
                                                                                                   merged-input-state-hash
                                                                                                   (string->symbol
                                                                                                    (string-append
                                                                                                     name
                                                                                                     "state249")))
                                                                                                (add1
                                                                                                 (cdr
                                                                                                  (assoc-ref
                                                                                                   merged-input-state-hash
                                                                                                   (string->symbol
                                                                                                    (string-append
                                                                                                     name
                                                                                                     "state249")))))
                                                                                                0))))
                                                                                           (append
                                                                                            (list
                                                                                             (cons
                                                                                              (string->symbol
                                                                                               (string-append
                                                                                                name
                                                                                                "state247"))
                                                                                              (cons
                                                                                               (signal-value
                                                                                                btor260)
                                                                                               (if (assoc-has-key?
                                                                                                    merged-input-state-hash
                                                                                                    (string->symbol
                                                                                                     (string-append
                                                                                                      name
                                                                                                      "state247")))
                                                                                                 (add1
                                                                                                  (cdr
                                                                                                   (assoc-ref
                                                                                                    merged-input-state-hash
                                                                                                    (string->symbol
                                                                                                     (string-append
                                                                                                      name
                                                                                                      "state247")))))
                                                                                                 0))))
                                                                                            (append
                                                                                             (list
                                                                                              (cons
                                                                                               (string->symbol
                                                                                                (string-append
                                                                                                 name
                                                                                                 "state238"))
                                                                                               (cons
                                                                                                (signal-value
                                                                                                 btor62)
                                                                                                (if (assoc-has-key?
                                                                                                     merged-input-state-hash
                                                                                                     (string->symbol
                                                                                                      (string-append
                                                                                                       name
                                                                                                       "state238")))
                                                                                                  (add1
                                                                                                   (cdr
                                                                                                    (assoc-ref
                                                                                                     merged-input-state-hash
                                                                                                     (string->symbol
                                                                                                      (string-append
                                                                                                       name
                                                                                                       "state238")))))
                                                                                                  0))))
                                                                                             (append
                                                                                              (list
                                                                                               (cons
                                                                                                (string->symbol
                                                                                                 (string-append
                                                                                                  name
                                                                                                  "state236"))
                                                                                                (cons
                                                                                                 (signal-value
                                                                                                  btor1406)
                                                                                                 (if (assoc-has-key?
                                                                                                      merged-input-state-hash
                                                                                                      (string->symbol
                                                                                                       (string-append
                                                                                                        name
                                                                                                        "state236")))
                                                                                                   (add1
                                                                                                    (cdr
                                                                                                     (assoc-ref
                                                                                                      merged-input-state-hash
                                                                                                      (string->symbol
                                                                                                       (string-append
                                                                                                        name
                                                                                                        "state236")))))
                                                                                                   0))))
                                                                                              (append
                                                                                               (list
                                                                                                (cons
                                                                                                 (string->symbol
                                                                                                  (string-append
                                                                                                   name
                                                                                                   "state234"))
                                                                                                 (cons
                                                                                                  (signal-value
                                                                                                   btor243)
                                                                                                  (if (assoc-has-key?
                                                                                                       merged-input-state-hash
                                                                                                       (string->symbol
                                                                                                        (string-append
                                                                                                         name
                                                                                                         "state234")))
                                                                                                    (add1
                                                                                                     (cdr
                                                                                                      (assoc-ref
                                                                                                       merged-input-state-hash
                                                                                                       (string->symbol
                                                                                                        (string-append
                                                                                                         name
                                                                                                         "state234")))))
                                                                                                    0))))
                                                                                               (append
                                                                                                (list
                                                                                                 (cons
                                                                                                  (string->symbol
                                                                                                   (string-append
                                                                                                    name
                                                                                                    "state220"))
                                                                                                  (cons
                                                                                                   (signal-value
                                                                                                    btor1402)
                                                                                                   (if (assoc-has-key?
                                                                                                        merged-input-state-hash
                                                                                                        (string->symbol
                                                                                                         (string-append
                                                                                                          name
                                                                                                          "state220")))
                                                                                                     (add1
                                                                                                      (cdr
                                                                                                       (assoc-ref
                                                                                                        merged-input-state-hash
                                                                                                        (string->symbol
                                                                                                         (string-append
                                                                                                          name
                                                                                                          "state220")))))
                                                                                                     0))))
                                                                                                (append
                                                                                                 (list
                                                                                                  (cons
                                                                                                   (string->symbol
                                                                                                    (string-append
                                                                                                     name
                                                                                                     "state218"))
                                                                                                   (cons
                                                                                                    (signal-value
                                                                                                     btor215)
                                                                                                    (if (assoc-has-key?
                                                                                                         merged-input-state-hash
                                                                                                         (string->symbol
                                                                                                          (string-append
                                                                                                           name
                                                                                                           "state218")))
                                                                                                      (add1
                                                                                                       (cdr
                                                                                                        (assoc-ref
                                                                                                         merged-input-state-hash
                                                                                                         (string->symbol
                                                                                                          (string-append
                                                                                                           name
                                                                                                           "state218")))))
                                                                                                      0))))
                                                                                                 (append
                                                                                                  (list
                                                                                                   (cons
                                                                                                    (string->symbol
                                                                                                     (string-append
                                                                                                      name
                                                                                                      "state216"))
                                                                                                    (cons
                                                                                                     (signal-value
                                                                                                      btor229)
                                                                                                     (if (assoc-has-key?
                                                                                                          merged-input-state-hash
                                                                                                          (string->symbol
                                                                                                           (string-append
                                                                                                            name
                                                                                                            "state216")))
                                                                                                       (add1
                                                                                                        (cdr
                                                                                                         (assoc-ref
                                                                                                          merged-input-state-hash
                                                                                                          (string->symbol
                                                                                                           (string-append
                                                                                                            name
                                                                                                            "state216")))))
                                                                                                       0))))
                                                                                                  (append
                                                                                                   (list
                                                                                                    (cons
                                                                                                     (string->symbol
                                                                                                      (string-append
                                                                                                       name
                                                                                                       "state207"))
                                                                                                     (cons
                                                                                                      (signal-value
                                                                                                       btor64)
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
                                                                                                       (string-append
                                                                                                        name
                                                                                                        "state205"))
                                                                                                      (cons
                                                                                                       (signal-value
                                                                                                        btor1397)
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
                                                                                                         "state203"))
                                                                                                       (cons
                                                                                                        (signal-value
                                                                                                         btor212)
                                                                                                        (if (assoc-has-key?
                                                                                                             merged-input-state-hash
                                                                                                             (string->symbol
                                                                                                              (string-append
                                                                                                               name
                                                                                                               "state203")))
                                                                                                          (add1
                                                                                                           (cdr
                                                                                                            (assoc-ref
                                                                                                             merged-input-state-hash
                                                                                                             (string->symbol
                                                                                                              (string-append
                                                                                                               name
                                                                                                               "state203")))))
                                                                                                          0))))
                                                                                                     (append
                                                                                                      (list
                                                                                                       (cons
                                                                                                        (string->symbol
                                                                                                         (string-append
                                                                                                          name
                                                                                                          "state188"))
                                                                                                        (cons
                                                                                                         (signal-value
                                                                                                          btor1393)
                                                                                                         (if (assoc-has-key?
                                                                                                              merged-input-state-hash
                                                                                                              (string->symbol
                                                                                                               (string-append
                                                                                                                name
                                                                                                                "state188")))
                                                                                                           (add1
                                                                                                            (cdr
                                                                                                             (assoc-ref
                                                                                                              merged-input-state-hash
                                                                                                              (string->symbol
                                                                                                               (string-append
                                                                                                                name
                                                                                                                "state188")))))
                                                                                                           0))))
                                                                                                      (append
                                                                                                       (list
                                                                                                        (cons
                                                                                                         (string->symbol
                                                                                                          (string-append
                                                                                                           name
                                                                                                           "state186"))
                                                                                                         (cons
                                                                                                          (signal-value
                                                                                                           btor183)
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
                                                                                                           (signal-value
                                                                                                            btor197)
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
                                                                                                             "state175"))
                                                                                                           (cons
                                                                                                            (signal-value
                                                                                                             btor66)
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
                                                                                                             (string-append
                                                                                                              name
                                                                                                              "state173"))
                                                                                                            (cons
                                                                                                             (signal-value
                                                                                                              btor1388)
                                                                                                             (if (assoc-has-key?
                                                                                                                  merged-input-state-hash
                                                                                                                  (string->symbol
                                                                                                                   (string-append
                                                                                                                    name
                                                                                                                    "state173")))
                                                                                                               (add1
                                                                                                                (cdr
                                                                                                                 (assoc-ref
                                                                                                                  merged-input-state-hash
                                                                                                                  (string->symbol
                                                                                                                   (string-append
                                                                                                                    name
                                                                                                                    "state173")))))
                                                                                                               0))))
                                                                                                          (append
                                                                                                           (list
                                                                                                            (cons
                                                                                                             (string->symbol
                                                                                                              (string-append
                                                                                                               name
                                                                                                               "state171"))
                                                                                                             (cons
                                                                                                              (signal-value
                                                                                                               btor180)
                                                                                                              (if (assoc-has-key?
                                                                                                                   merged-input-state-hash
                                                                                                                   (string->symbol
                                                                                                                    (string-append
                                                                                                                     name
                                                                                                                     "state171")))
                                                                                                                (add1
                                                                                                                 (cdr
                                                                                                                  (assoc-ref
                                                                                                                   merged-input-state-hash
                                                                                                                   (string->symbol
                                                                                                                    (string-append
                                                                                                                     name
                                                                                                                     "state171")))))
                                                                                                                0))))
                                                                                                           (append
                                                                                                            (list
                                                                                                             (cons
                                                                                                              (string->symbol
                                                                                                               (string-append
                                                                                                                name
                                                                                                                "state159"))
                                                                                                              (cons
                                                                                                               (signal-value
                                                                                                                btor1384)
                                                                                                               (if (assoc-has-key?
                                                                                                                    merged-input-state-hash
                                                                                                                    (string->symbol
                                                                                                                     (string-append
                                                                                                                      name
                                                                                                                      "state159")))
                                                                                                                 (add1
                                                                                                                  (cdr
                                                                                                                   (assoc-ref
                                                                                                                    merged-input-state-hash
                                                                                                                    (string->symbol
                                                                                                                     (string-append
                                                                                                                      name
                                                                                                                      "state159")))))
                                                                                                                 0))))
                                                                                                            (append
                                                                                                             (list
                                                                                                              (cons
                                                                                                               (string->symbol
                                                                                                                (string-append
                                                                                                                 name
                                                                                                                 "state157"))
                                                                                                               (cons
                                                                                                                (signal-value
                                                                                                                 btor154)
                                                                                                                (if (assoc-has-key?
                                                                                                                     merged-input-state-hash
                                                                                                                     (string->symbol
                                                                                                                      (string-append
                                                                                                                       name
                                                                                                                       "state157")))
                                                                                                                  (add1
                                                                                                                   (cdr
                                                                                                                    (assoc-ref
                                                                                                                     merged-input-state-hash
                                                                                                                     (string->symbol
                                                                                                                      (string-append
                                                                                                                       name
                                                                                                                       "state157")))))
                                                                                                                  0))))
                                                                                                             (append
                                                                                                              (list
                                                                                                               (cons
                                                                                                                (string->symbol
                                                                                                                 (string-append
                                                                                                                  name
                                                                                                                  "state155"))
                                                                                                                (cons
                                                                                                                 (signal-value
                                                                                                                  btor170)
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
                                                                                                                   "state144"))
                                                                                                                 (cons
                                                                                                                  (signal-value
                                                                                                                   btor68)
                                                                                                                  (if (assoc-has-key?
                                                                                                                       merged-input-state-hash
                                                                                                                       (string->symbol
                                                                                                                        (string-append
                                                                                                                         name
                                                                                                                         "state144")))
                                                                                                                    (add1
                                                                                                                     (cdr
                                                                                                                      (assoc-ref
                                                                                                                       merged-input-state-hash
                                                                                                                       (string->symbol
                                                                                                                        (string-append
                                                                                                                         name
                                                                                                                         "state144")))))
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
                                                                                                                    btor1379)
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
                                                                                                                     "state139"))
                                                                                                                   (cons
                                                                                                                    (signal-value
                                                                                                                     btor150)
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
                                                                                                                      "state136"))
                                                                                                                    (cons
                                                                                                                     (signal-value
                                                                                                                      btor1375)
                                                                                                                     (if (assoc-has-key?
                                                                                                                          merged-input-state-hash
                                                                                                                          (string->symbol
                                                                                                                           (string-append
                                                                                                                            name
                                                                                                                            "state136")))
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
                                                                                                                       "state135"))
                                                                                                                     (cons
                                                                                                                      (signal-value
                                                                                                                       btor293)
                                                                                                                      (if (assoc-has-key?
                                                                                                                           merged-input-state-hash
                                                                                                                           (string->symbol
                                                                                                                            (string-append
                                                                                                                             name
                                                                                                                             "state135")))
                                                                                                                        (add1
                                                                                                                         (cdr
                                                                                                                          (assoc-ref
                                                                                                                           merged-input-state-hash
                                                                                                                           (string->symbol
                                                                                                                            (string-append
                                                                                                                             name
                                                                                                                             "state135")))))
                                                                                                                        0))))
                                                                                                                   (list))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
              merged-input-state-hash)
             equal?
             #:key
             car)))
      (list
       (cons 'SROB0 (signal (signal-value btor837) output-state))
       (cons 'SROB15 (signal (signal-value btor851) output-state))
       (cons 'P31 (signal (signal-value btor779) output-state))
       (cons 'ROA0 (signal (signal-value btor801) output-state))
       (cons 'ROC4 (signal (signal-value btor897) output-state))
       (cons 'SROA8 (signal (signal-value btor970) output-state))
       (cons 'SROA9 (signal (signal-value btor972) output-state))
       (cons 'P30 (signal (signal-value btor777) output-state))
       (cons 'P18 (signal (signal-value btor749) output-state))
       (cons 'ROB2 (signal (signal-value btor857) output-state))
       (cons 'ROC9 (signal (signal-value btor907) output-state))
       (cons 'ROC15 (signal (signal-value btor887) output-state))
       (cons 'P0 (signal (signal-value btor729) output-state))
       (cons 'ROA17 (signal (signal-value btor819) output-state))
       (cons 'SROA14 (signal (signal-value btor950) output-state))
       (cons 'ROC3 (signal (signal-value btor895) output-state))
       (cons 'SROA7 (signal (signal-value btor968) output-state))
       (cons 'SROB9 (signal (signal-value btor871) output-state))
       (cons 'SROA15 (signal (signal-value btor952) output-state))
       (cons 'ROB11 (signal (signal-value btor843) output-state))
       (cons 'ROC14 (signal (signal-value btor885) output-state))
       (cons 'ROA1 (signal (signal-value btor803) output-state))
       (cons 'SROB14 (signal (signal-value btor849) output-state))
       (cons 'P1 (signal (signal-value btor731) output-state))
       (cons 'P19 (signal (signal-value btor751) output-state))
       (cons 'ROB3 (signal (signal-value btor859) output-state))
       (cons 'P2 (signal (signal-value btor753) output-state))
       (cons 'ROA15 (signal (signal-value btor815) output-state))
       (cons 'SROA12 (signal (signal-value btor946) output-state))
       (cons 'ROC11 (signal (signal-value btor879) output-state))
       (cons 'ROB4 (signal (signal-value btor861) output-state))
       (cons 'ROA9 (signal (signal-value btor835) output-state))
       (cons 'ROA2 (signal (signal-value btor821) output-state))
       (cons 'P28 (signal (signal-value btor771) output-state))
       (cons 'P11 (signal (signal-value btor735) output-state))
       (cons 'ROB12 (signal (signal-value btor845) output-state))
       (cons 'ROC7 (signal (signal-value btor903) output-state))
       (cons 'ROC13 (signal (signal-value btor883) output-state))
       (cons 'P27 (signal (signal-value btor769) output-state))
       (cons 'P8 (signal (signal-value btor797) output-state))
       (cons 'SROB13 (signal (signal-value btor847) output-state))
       (cons 'SROB8 (signal (signal-value btor869) output-state))
       (cons 'P21 (signal (signal-value btor757) output-state))
       (cons 'SROB2 (signal (signal-value btor857) output-state))
       (cons 'ROA8 (signal (signal-value btor833) output-state))
       (cons 'SROA0 (signal (signal-value btor938) output-state))
       (cons 'ROC6 (signal (signal-value btor901) output-state))
       (cons 'SROA6 (signal (signal-value btor966) output-state))
       (cons 'SROB12 (signal (signal-value btor845) output-state))
       (cons 'P29 (signal (signal-value btor773) output-state))
       (cons 'SROA13 (signal (signal-value btor948) output-state))
       (cons 'P10 (signal (signal-value btor733) output-state))
       (cons 'ROB13 (signal (signal-value btor847) output-state))
       (cons 'ROC8 (signal (signal-value btor905) output-state))
       (cons 'ROC12 (signal (signal-value btor881) output-state))
       (cons 'P26 (signal (signal-value btor767) output-state))
       (cons 'P9 (signal (signal-value btor799) output-state))
       (cons 'ROA10 (signal (signal-value btor805) output-state))
       (cons 'ROA3 (signal (signal-value btor823) output-state))
       (cons 'ROC10 (signal (signal-value btor877) output-state))
       (cons 'ROB5 (signal (signal-value btor863) output-state))
       (cons 'P3 (signal (signal-value btor775) output-state))
       (cons 'ROA16 (signal (signal-value btor817) output-state))
       (cons 'P17 (signal (signal-value btor747) output-state))
       (cons 'ROC5 (signal (signal-value btor899) output-state))
       (cons 'SROA5 (signal (signal-value btor964) output-state))
       (cons 'P16 (signal (signal-value btor745) output-state))
       (cons 'SROB7 (signal (signal-value btor867) output-state))
       (cons 'P20 (signal (signal-value btor755) output-state))
       (cons 'SROB1 (signal (signal-value btor839) output-state))
       (cons 'ROB9 (signal (signal-value btor871) output-state))
       (cons 'SROB5 (signal (signal-value btor863) output-state))
       (cons 'SROA3 (signal (signal-value btor960) output-state))
       (cons 'P34 (signal (signal-value btor785) output-state))
       (cons 'P14 (signal (signal-value btor741) output-state))
       (cons 'P22 (signal (signal-value btor759) output-state))
       (cons 'ROA7 (signal (signal-value btor831) output-state))
       (cons 'SIGNEDP (signal (signal-value btor914) output-state))
       (cons 'P7 (signal (signal-value btor795) output-state))
       (cons 'SROA11 (signal (signal-value btor944) output-state))
       (cons 'ROB15 (signal (signal-value btor851) output-state))
       (cons 'SROA17 (signal (signal-value btor956) output-state))
       (cons 'ROA14 (signal (signal-value btor813) output-state))
       (cons 'ROA6 (signal (signal-value btor829) output-state))
       (cons 'SROA4 (signal (signal-value btor962) output-state))
       (cons 'P15 (signal (signal-value btor743) output-state))
       (cons 'P23 (signal (signal-value btor761) output-state))
       (cons 'SROA16 (signal (signal-value btor954) output-state))
       (cons 'ROB8 (signal (signal-value btor869) output-state))
       (cons 'P35 (signal (signal-value btor787) output-state))
       (cons 'SROB6 (signal (signal-value btor865) output-state))
       (cons 'ROC0 (signal (signal-value btor873) output-state))
       (cons 'ROA13 (signal (signal-value btor811) output-state))
       (cons 'SROA10 (signal (signal-value btor942) output-state))
       (cons 'P6 (signal (signal-value btor793) output-state))
       (cons 'ROB14 (signal (signal-value btor849) output-state))
       (cons 'SROA1 (signal (signal-value btor940) output-state))
       (cons 'ROB17 (signal (signal-value btor855) output-state))
       (cons 'ROC16 (signal (signal-value btor889) output-state))
       (cons 'ROC1 (signal (signal-value btor875) output-state))
       (cons 'P12 (signal (signal-value btor737) output-state))
       (cons 'ROB1 (signal (signal-value btor839) output-state))
       (cons 'SROB3 (signal (signal-value btor859) output-state))
       (cons 'P24 (signal (signal-value btor763) output-state))
       (cons 'ROA12 (signal (signal-value btor809) output-state))
       (cons 'ROB7 (signal (signal-value btor867) output-state))
       (cons 'SROB16 (signal (signal-value btor853) output-state))
       (cons 'P32 (signal (signal-value btor781) output-state))
       (cons 'ROA5 (signal (signal-value btor827) output-state))
       (cons 'SROB10 (signal (signal-value btor841) output-state))
       (cons 'P5 (signal (signal-value btor791) output-state))
       (cons 'ROB16 (signal (signal-value btor853) output-state))
       (cons 'ROC2 (signal (signal-value btor893) output-state))
       (cons 'ROC17 (signal (signal-value btor891) output-state))
       (cons 'ROB10 (signal (signal-value btor841) output-state))
       (cons 'P4 (signal (signal-value btor789) output-state))
       (cons 'SROB17 (signal (signal-value btor855) output-state))
       (cons 'SROA2 (signal (signal-value btor958) output-state))
       (cons 'P33 (signal (signal-value btor783) output-state))
       (cons 'P13 (signal (signal-value btor739) output-state))
       (cons 'SROB4 (signal (signal-value btor861) output-state))
       (cons 'P25 (signal (signal-value btor765) output-state))
       (cons 'ROA11 (signal (signal-value btor807) output-state))
       (cons 'SROB11 (signal (signal-value btor843) output-state))
       (cons 'ROB0 (signal (signal-value btor837) output-state))
       (cons 'ROA4 (signal (signal-value btor825) output-state))
       (cons 'ROB6 (signal (signal-value btor865) output-state))))))
