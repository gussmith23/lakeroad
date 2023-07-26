;;; Imported with
;;; $LAKEROAD_DIR/bin/verilog_to_racket.py \
;;;   --infile lakeroad-private/lattice_ecp5/MULT18X18D_modified_for_racket_import.v \
;;;   --top MULT18X18D \ 
;;;   --function-name lattice-ecp5-mult18x18d > lakeroad/racket/generated/lattice-ecp5-mult18x18d.rkt
;;;
;;; With this version of the file:
;;; https://github.com/uwsampl/lakeroad-private/blob/c997532dbca31ff4b6fce2af04b3ada3abb1bf0c/lattice_ecp5/MULT18X18D_modified_for_racket_import.v

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
               (string->symbol (string-append name "state558"))
               (bv 0 (bitvector 1))))
             (append
              (list
               (cons
                (string->symbol (string-append name "state503"))
                (bv 0 (bitvector 1))))
              (append
               (list
                (cons
                 (string->symbol (string-append name "state492"))
                 (bv 1 (bitvector 1))))
               (append
                (list
                 (cons
                  (string->symbol (string-append name "state450"))
                  (bv 0 (bitvector 1))))
                (append
                 (list
                  (cons
                   (string->symbol (string-append name "state439"))
                   (bv 1 (bitvector 1))))
                 (append
                  (list
                   (cons
                    (string->symbol (string-append name "state312"))
                    (bv 1 (bitvector 1))))
                  (append
                   (list
                    (cons
                     (string->symbol (string-append name "state276"))
                     (bv 1 (bitvector 1))))
                   (append
                    (list
                     (cons
                      (string->symbol (string-append name "state236"))
                      (bv 0 (bitvector 1))))
                    (append
                     (list
                      (cons
                       (string->symbol (string-append name "state228"))
                       (bv 1 (bitvector 1))))
                     (append
                      (list
                       (cons
                        (string->symbol (string-append name "state226"))
                        (bv 0 (bitvector 1))))
                      (append
                       (list
                        (cons
                         (string->symbol (string-append name "state224"))
                         (bv 0 (bitvector 1))))
                       (append
                        (list
                         (cons
                          (string->symbol (string-append name "state209"))
                          (bv 0 (bitvector 1))))
                        (append
                         (list
                          (cons
                           (string->symbol (string-append name "state201"))
                           (bv 1 (bitvector 1))))
                         (append
                          (list
                           (cons
                            (string->symbol (string-append name "state199"))
                            (bv 0 (bitvector 1))))
                          (append
                           (list
                            (cons
                             (string->symbol (string-append name "state197"))
                             (bv 0 (bitvector 1))))
                           (append
                            (list
                             (cons
                              (string->symbol (string-append name "state181"))
                              (bv 0 (bitvector 1))))
                            (append
                             (list
                              (cons
                               (string->symbol (string-append name "state173"))
                               (bv 1 (bitvector 1))))
                             (append
                              (list
                               (cons
                                (string->symbol
                                 (string-append name "state171"))
                                (bv 0 (bitvector 1))))
                              (append
                               (list
                                (cons
                                 (string->symbol
                                  (string-append name "state169"))
                                 (bv 0 (bitvector 1))))
                               (append
                                (list
                                 (cons
                                  (string->symbol
                                   (string-append name "state156"))
                                  (bv 0 (bitvector 1))))
                                (append
                                 (list
                                  (cons
                                   (string->symbol
                                    (string-append name "state145"))
                                   (bv 1 (bitvector 1))))
                                 (append
                                  (list
                                   (cons
                                    (string->symbol
                                     (string-append name "state143"))
                                    (bv 0 (bitvector 1))))
                                  (append
                                   (list
                                    (cons
                                     (string->symbol
                                      (string-append name "state141"))
                                     (bv 0 (bitvector 1))))
                                   (append
                                    (list
                                     (cons
                                      (string->symbol
                                       (string-append name "state138"))
                                      (bv 1 (bitvector 1))))
                                    (list))))))))))))))))))))))))))
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
           (btor38 C0)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state C0)))
           (btor39 C1)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state C1)))
           (btor40 C10)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state C10)))
           (btor41 C11)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state C11)))
           (btor42 C12)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state C12)))
           (btor43 C13)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state C13)))
           (btor44 C14)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state C14)))
           (btor45 C15)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state C15)))
           (btor46 C16)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state C16)))
           (btor47 C17)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state C17)))
           (btor48 C2)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state C2)))
           (btor49 C3)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state C3)))
           (btor50 C4)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state C4)))
           (btor51 C5)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state C5)))
           (btor52 C6)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state C6)))
           (btor53 C7)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state C7)))
           (btor54 C8)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state C8)))
           (btor55 C9)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state C9)))
           (btor56 (bitvector 5))
           (btor57 CAS_MATCH_REG)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CAS_MATCH_REG)))
           (btor58 CE0)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CE0)))
           (btor59 CE1)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CE1)))
           (btor60 CE2)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CE2)))
           (btor61 CE3)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CE3)))
           (btor62 CLK0)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CLK0)))
           (btor63 CLK0_DIV)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CLK0_DIV)))
           (btor64 CLK1)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CLK1)))
           (btor65 CLK1_DIV)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CLK1_DIV)))
           (btor66 CLK2)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CLK2)))
           (btor67 CLK2_DIV)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CLK2_DIV)))
           (btor68 CLK3)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CLK3)))
           (btor69 CLK3_DIV)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CLK3_DIV)))
           (btor70 GSR)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state GSR)))
           (btor71 HIGHSPEED_CLK)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state HIGHSPEED_CLK)))
           (btor72 MULT_BYPASS)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MULT_BYPASS)))
           (btor73 REG_INPUTA_CE)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state REG_INPUTA_CE)))
           (btor74 REG_INPUTA_CLK)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state REG_INPUTA_CLK)))
           (btor75 REG_INPUTA_RST)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state REG_INPUTA_RST)))
           (btor76 REG_INPUTB_CE)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state REG_INPUTB_CE)))
           (btor77 REG_INPUTB_CLK)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state REG_INPUTB_CLK)))
           (btor78 REG_INPUTB_RST)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state REG_INPUTB_RST)))
           (btor79 REG_INPUTC_CE)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state REG_INPUTC_CE)))
           (btor80 REG_INPUTC_CLK)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state REG_INPUTC_CLK)))
           (btor81 REG_INPUTC_RST)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state REG_INPUTC_RST)))
           (btor82 REG_OUTPUT_CE)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state REG_OUTPUT_CE)))
           (btor83 REG_OUTPUT_CLK)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state REG_OUTPUT_CLK)))
           (btor84 REG_OUTPUT_RST)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state REG_OUTPUT_RST)))
           (btor85 REG_PIPELINE_CE)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state REG_PIPELINE_CE)))
           (btor86 REG_PIPELINE_CLK)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state REG_PIPELINE_CLK)))
           (btor87 REG_PIPELINE_RST)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state REG_PIPELINE_RST)))
           (btor88 RST0)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state RST0)))
           (btor89 RST1)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state RST1)))
           (btor90 RST2)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state RST2)))
           (btor91 RST3)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state RST3)))
           (btor92 SIGNEDA)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SIGNEDA)))
           (btor93 SIGNEDB)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SIGNEDB)))
           (btor94 SOURCEA)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SOURCEA)))
           (btor95 SOURCEB)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SOURCEB)))
           (btor96 SOURCEB_MODE)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SOURCEB_MODE)))
           (btor97 SRIA0)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SRIA0)))
           (btor98 SRIA1)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SRIA1)))
           (btor99 SRIA10)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SRIA10)))
           (btor100 SRIA11)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SRIA11)))
           (btor101 SRIA12)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SRIA12)))
           (btor102 SRIA13)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SRIA13)))
           (btor103 SRIA14)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SRIA14)))
           (btor104 SRIA15)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SRIA15)))
           (btor105 SRIA16)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SRIA16)))
           (btor106 SRIA17)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SRIA17)))
           (btor107 SRIA2)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SRIA2)))
           (btor108 SRIA3)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SRIA3)))
           (btor109 SRIA4)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SRIA4)))
           (btor110 SRIA5)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SRIA5)))
           (btor111 SRIA6)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SRIA6)))
           (btor112 SRIA7)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SRIA7)))
           (btor113 SRIA8)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SRIA8)))
           (btor114 SRIA9)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SRIA9)))
           (btor115 SRIB0)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SRIB0)))
           (btor116 SRIB1)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SRIB1)))
           (btor117 SRIB10)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SRIB10)))
           (btor118 SRIB11)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SRIB11)))
           (btor119 SRIB12)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SRIB12)))
           (btor120 SRIB13)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SRIB13)))
           (btor121 SRIB14)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SRIB14)))
           (btor122 SRIB15)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SRIB15)))
           (btor123 SRIB16)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SRIB16)))
           (btor124 SRIB17)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SRIB17)))
           (btor125 SRIB2)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SRIB2)))
           (btor126 SRIB3)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SRIB3)))
           (btor127 SRIB4)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SRIB4)))
           (btor128 SRIB5)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SRIB5)))
           (btor129 SRIB6)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SRIB6)))
           (btor130 SRIB7)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SRIB7)))
           (btor131 SRIB8)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SRIB8)))
           (btor132 SRIB9)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SRIB9)))
           (btor133 (bitvector 36))
           (btor134 (bv->signal (bv 0 (bitvector 36))))
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
                          (bv 0 36))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor137 (bv->signal (bv 1 (bitvector 1))))
           (btor138
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state138")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state138")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state138")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state138")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor140 (bv->signal (bv 0 (bitvector 1))))
           (btor141
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state141")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state141")))))
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
           (btor143
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state143")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state143")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state143")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state143")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor145
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state145")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state145")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state145")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state145")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor147 (bitvector 2))
           (btor148
            (signal
             (concat (signal-value btor68) (signal-value btor145))
             (list)))
           (btor149 (bv->signal (bv 2 (bitvector 2))))
           (btor150
            (signal
             (bool->bitvector
              (bveq (signal-value btor148) (signal-value btor149)))
             (list)))
           (btor151
            (if (bitvector->bool (signal-value btor150)) btor143 btor141))
           (btor152 (bv->signal (bv 3 (bitvector 2))))
           (btor153
            (bv->signal
             (zero-extend (signal-value btor152) (bitvector 5))
             btor152))
           (btor154
            (signal
             (bool->bitvector
              (bveq (signal-value btor69) (signal-value btor153)))
             (list)))
           (btor155
            (if (bitvector->bool (signal-value btor154)) btor151 btor68))
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
           (btor158 (signal (bvnot (signal-value btor154)) (list)))
           (btor159 (bitvector 3))
           (btor160 (bv->signal (bv 5 (bitvector 3))))
           (btor161
            (bv->signal
             (zero-extend (signal-value btor160) (bitvector 5))
             btor160))
           (btor162
            (signal
             (bool->bitvector
              (bveq (signal-value btor69) (signal-value btor161)))
             (list)))
           (btor163 (signal (bvnot (signal-value btor162)) (list)))
           (btor164
            (signal
             (bvand (signal-value btor158) (signal-value btor163))
             (list)))
           (btor165
            (signal
             (bvand (signal-value btor158) (signal-value btor164))
             (list)))
           (btor166
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state166")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state166")))))
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
           (btor167
            (signal
             (bvand (signal-value btor165) (signal-value btor166))
             (list)))
           (btor168
            (if (bitvector->bool (signal-value btor167)) btor156 btor155))
           (btor169
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state169")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state169")))))
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
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state171")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state171")))))
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
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state173")))))
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
             (concat (signal-value btor66) (signal-value btor173))
             (list)))
           (btor176
            (signal
             (bool->bitvector
              (bveq (signal-value btor175) (signal-value btor149)))
             (list)))
           (btor177
            (if (bitvector->bool (signal-value btor176)) btor171 btor169))
           (btor178
            (bv->signal
             (zero-extend (signal-value btor152) (bitvector 5))
             btor152))
           (btor179
            (signal
             (bool->bitvector
              (bveq (signal-value btor67) (signal-value btor178)))
             (list)))
           (btor180
            (if (bitvector->bool (signal-value btor179)) btor177 btor66))
           (btor181
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state181")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state181")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state181")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state181")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor183 (signal (bvnot (signal-value btor179)) (list)))
           (btor184
            (bv->signal
             (zero-extend (signal-value btor160) (bitvector 5))
             btor160))
           (btor185
            (signal
             (bool->bitvector
              (bveq (signal-value btor67) (signal-value btor184)))
             (list)))
           (btor186 (signal (bvnot (signal-value btor185)) (list)))
           (btor187
            (signal
             (bvand (signal-value btor183) (signal-value btor186))
             (list)))
           (btor188
            (signal
             (bvand (signal-value btor183) (signal-value btor187))
             (list)))
           (btor189
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state189")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state189")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state189")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state189")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor190
            (signal
             (bvand (signal-value btor188) (signal-value btor189))
             (list)))
           (btor191
            (if (bitvector->bool (signal-value btor190)) btor181 btor180))
           (btor192 (bitvector 4))
           (btor193 (bv->signal (bv 13 (bitvector 4))))
           (btor194
            (bv->signal
             (zero-extend (signal-value btor193) (bitvector 5))
             btor193))
           (btor195
            (signal
             (bool->bitvector
              (bveq (signal-value btor83) (signal-value btor194)))
             (list)))
           (btor196
            (if (bitvector->bool (signal-value btor195)) btor191 btor168))
           (btor197
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state197")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state197")))))
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
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor199
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state199")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state199")))))
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
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor201
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state201")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state201")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state201")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state201")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor203
            (signal
             (concat (signal-value btor64) (signal-value btor201))
             (list)))
           (btor204
            (signal
             (bool->bitvector
              (bveq (signal-value btor203) (signal-value btor149)))
             (list)))
           (btor205
            (if (bitvector->bool (signal-value btor204)) btor199 btor197))
           (btor206
            (bv->signal
             (zero-extend (signal-value btor152) (bitvector 5))
             btor152))
           (btor207
            (signal
             (bool->bitvector
              (bveq (signal-value btor65) (signal-value btor206)))
             (list)))
           (btor208
            (if (bitvector->bool (signal-value btor207)) btor205 btor64))
           (btor209
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state209")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state209")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state209")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state209")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor211 (signal (bvnot (signal-value btor207)) (list)))
           (btor212
            (bv->signal
             (zero-extend (signal-value btor160) (bitvector 5))
             btor160))
           (btor213
            (signal
             (bool->bitvector
              (bveq (signal-value btor65) (signal-value btor212)))
             (list)))
           (btor214 (signal (bvnot (signal-value btor213)) (list)))
           (btor215
            (signal
             (bvand (signal-value btor211) (signal-value btor214))
             (list)))
           (btor216
            (signal
             (bvand (signal-value btor211) (signal-value btor215))
             (list)))
           (btor217
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state217")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state217")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state217")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state217")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor218
            (signal
             (bvand (signal-value btor216) (signal-value btor217))
             (list)))
           (btor219
            (if (bitvector->bool (signal-value btor218)) btor209 btor208))
           (btor220 (bv->signal (bv 12 (bitvector 4))))
           (btor221
            (bv->signal
             (zero-extend (signal-value btor220) (bitvector 5))
             btor220))
           (btor222
            (signal
             (bool->bitvector
              (bveq (signal-value btor83) (signal-value btor221)))
             (list)))
           (btor223
            (if (bitvector->bool (signal-value btor222)) btor219 btor196))
           (btor224
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state224")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state224")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state224")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state224")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor226
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state226")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state226")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state226")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state226")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor228
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state228")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state228")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state228")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state228")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor230
            (signal
             (concat (signal-value btor62) (signal-value btor228))
             (list)))
           (btor231
            (signal
             (bool->bitvector
              (bveq (signal-value btor230) (signal-value btor149)))
             (list)))
           (btor232
            (if (bitvector->bool (signal-value btor231)) btor226 btor224))
           (btor233
            (bv->signal
             (zero-extend (signal-value btor152) (bitvector 5))
             btor152))
           (btor234
            (signal
             (bool->bitvector
              (bveq (signal-value btor63) (signal-value btor233)))
             (list)))
           (btor235
            (if (bitvector->bool (signal-value btor234)) btor232 btor62))
           (btor236
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state236")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state236")))))
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
           (btor238 (signal (bvnot (signal-value btor234)) (list)))
           (btor239
            (bv->signal
             (zero-extend (signal-value btor160) (bitvector 5))
             btor160))
           (btor240
            (signal
             (bool->bitvector
              (bveq (signal-value btor63) (signal-value btor239)))
             (list)))
           (btor241 (signal (bvnot (signal-value btor240)) (list)))
           (btor242
            (signal
             (bvand (signal-value btor238) (signal-value btor241))
             (list)))
           (btor243
            (signal
             (bvand (signal-value btor238) (signal-value btor242))
             (list)))
           (btor244
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state244")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state244")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state244")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state244")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor245
            (signal
             (bvand (signal-value btor243) (signal-value btor244))
             (list)))
           (btor246
            (if (bitvector->bool (signal-value btor245)) btor236 btor235))
           (btor247 (bv->signal (bv 11 (bitvector 4))))
           (btor248
            (bv->signal
             (zero-extend (signal-value btor247) (bitvector 5))
             btor247))
           (btor249
            (signal
             (bool->bitvector
              (bveq (signal-value btor83) (signal-value btor248)))
             (list)))
           (btor250
            (if (bitvector->bool (signal-value btor249)) btor246 btor223))
           (btor251
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state251")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state251")))))
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
           (btor252 (signal (bvnot (signal-value btor249)) (list)))
           (btor253 (signal (bvnot (signal-value btor222)) (list)))
           (btor254 (signal (bvnot (signal-value btor195)) (list)))
           (btor255 (bv->signal (bv 14 (bitvector 4))))
           (btor256
            (bv->signal
             (zero-extend (signal-value btor255) (bitvector 5))
             btor255))
           (btor257
            (signal
             (bool->bitvector
              (bveq (signal-value btor83) (signal-value btor256)))
             (list)))
           (btor258 (signal (bvnot (signal-value btor257)) (list)))
           (btor259
            (signal
             (bvand (signal-value btor254) (signal-value btor258))
             (list)))
           (btor260
            (signal
             (bvand (signal-value btor253) (signal-value btor259))
             (list)))
           (btor261
            (signal
             (bvand (signal-value btor252) (signal-value btor260))
             (list)))
           (btor262
            (signal
             (bvand (signal-value btor254) (signal-value btor261))
             (list)))
           (btor263
            (signal
             (bvand (signal-value btor253) (signal-value btor262))
             (list)))
           (btor264
            (signal
             (bvand (signal-value btor252) (signal-value btor263))
             (list)))
           (btor265
            (signal
             (bvand (signal-value btor253) (signal-value btor264))
             (list)))
           (btor266
            (signal
             (bvand (signal-value btor252) (signal-value btor265))
             (list)))
           (btor267
            (signal
             (bvand (signal-value btor252) (signal-value btor266))
             (list)))
           (btor268
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state268")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state268")))))
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
           (btor269
            (signal
             (bvand (signal-value btor267) (signal-value btor268))
             (list)))
           (btor270
            (if (bitvector->bool (signal-value btor269)) btor251 btor250))
           (btor271
            (signal
             (concat (signal-value btor270) (signal-value btor138))
             (list)))
           (btor272
            (signal
             (bool->bitvector
              (bveq (signal-value btor271) (signal-value btor149)))
             (list)))
           (btor273
            (if (bitvector->bool (signal-value btor272)) btor136 btor135))
           (btor274
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state274")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state274")))))
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
                          (bv 0 36))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor275
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state275")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state275")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state275")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state275")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 36))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor276
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state276")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state276")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state276")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state276")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor278
            (bv->signal
             (zero-extend (signal-value btor193) (bitvector 5))
             btor193))
           (btor279
            (signal
             (bool->bitvector
              (bveq (signal-value btor86) (signal-value btor278)))
             (list)))
           (btor280
            (if (bitvector->bool (signal-value btor279)) btor191 btor168))
           (btor281
            (bv->signal
             (zero-extend (signal-value btor220) (bitvector 5))
             btor220))
           (btor282
            (signal
             (bool->bitvector
              (bveq (signal-value btor86) (signal-value btor281)))
             (list)))
           (btor283
            (if (bitvector->bool (signal-value btor282)) btor219 btor280))
           (btor284
            (bv->signal
             (zero-extend (signal-value btor247) (bitvector 5))
             btor247))
           (btor285
            (signal
             (bool->bitvector
              (bveq (signal-value btor86) (signal-value btor284)))
             (list)))
           (btor286
            (if (bitvector->bool (signal-value btor285)) btor246 btor283))
           (btor287
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state287")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state287")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state287")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state287")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor288 (signal (bvnot (signal-value btor285)) (list)))
           (btor289 (signal (bvnot (signal-value btor282)) (list)))
           (btor290 (signal (bvnot (signal-value btor279)) (list)))
           (btor291
            (bv->signal
             (zero-extend (signal-value btor255) (bitvector 5))
             btor255))
           (btor292
            (signal
             (bool->bitvector
              (bveq (signal-value btor86) (signal-value btor291)))
             (list)))
           (btor293 (signal (bvnot (signal-value btor292)) (list)))
           (btor294
            (signal
             (bvand (signal-value btor290) (signal-value btor293))
             (list)))
           (btor295
            (signal
             (bvand (signal-value btor289) (signal-value btor294))
             (list)))
           (btor296
            (signal
             (bvand (signal-value btor288) (signal-value btor295))
             (list)))
           (btor297
            (signal
             (bvand (signal-value btor290) (signal-value btor296))
             (list)))
           (btor298
            (signal
             (bvand (signal-value btor289) (signal-value btor297))
             (list)))
           (btor299
            (signal
             (bvand (signal-value btor288) (signal-value btor298))
             (list)))
           (btor300
            (signal
             (bvand (signal-value btor289) (signal-value btor299))
             (list)))
           (btor301
            (signal
             (bvand (signal-value btor288) (signal-value btor300))
             (list)))
           (btor302
            (signal
             (bvand (signal-value btor288) (signal-value btor301))
             (list)))
           (btor303
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state303")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state303")))))
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
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor304
            (signal
             (bvand (signal-value btor302) (signal-value btor303))
             (list)))
           (btor305
            (if (bitvector->bool (signal-value btor304)) btor287 btor286))
           (btor306
            (signal
             (concat (signal-value btor305) (signal-value btor276))
             (list)))
           (btor307
            (signal
             (bool->bitvector
              (bveq (signal-value btor306) (signal-value btor149)))
             (list)))
           (btor308
            (if (bitvector->bool (signal-value btor307)) btor275 btor274))
           (btor309 (bitvector 18))
           (btor310
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state310")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state310")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state310")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state310")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor311
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state311")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state311")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state311")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state311")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor312
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state312")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state312")))))
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
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor314
            (bv->signal
             (zero-extend (signal-value btor193) (bitvector 5))
             btor193))
           (btor315
            (signal
             (bool->bitvector
              (bveq (signal-value btor74) (signal-value btor314)))
             (list)))
           (btor316
            (if (bitvector->bool (signal-value btor315)) btor191 btor168))
           (btor317
            (bv->signal
             (zero-extend (signal-value btor220) (bitvector 5))
             btor220))
           (btor318
            (signal
             (bool->bitvector
              (bveq (signal-value btor74) (signal-value btor317)))
             (list)))
           (btor319
            (if (bitvector->bool (signal-value btor318)) btor219 btor316))
           (btor320
            (bv->signal
             (zero-extend (signal-value btor247) (bitvector 5))
             btor247))
           (btor321
            (signal
             (bool->bitvector
              (bveq (signal-value btor74) (signal-value btor320)))
             (list)))
           (btor322
            (if (bitvector->bool (signal-value btor321)) btor246 btor319))
           (btor323
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state323")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state323")))))
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
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor324 (signal (bvnot (signal-value btor321)) (list)))
           (btor325 (signal (bvnot (signal-value btor318)) (list)))
           (btor326 (signal (bvnot (signal-value btor315)) (list)))
           (btor327
            (bv->signal
             (zero-extend (signal-value btor255) (bitvector 5))
             btor255))
           (btor328
            (signal
             (bool->bitvector
              (bveq (signal-value btor74) (signal-value btor327)))
             (list)))
           (btor329 (signal (bvnot (signal-value btor328)) (list)))
           (btor330
            (signal
             (bvand (signal-value btor326) (signal-value btor329))
             (list)))
           (btor331
            (signal
             (bvand (signal-value btor325) (signal-value btor330))
             (list)))
           (btor332
            (signal
             (bvand (signal-value btor324) (signal-value btor331))
             (list)))
           (btor333
            (signal
             (bvand (signal-value btor326) (signal-value btor332))
             (list)))
           (btor334
            (signal
             (bvand (signal-value btor325) (signal-value btor333))
             (list)))
           (btor335
            (signal
             (bvand (signal-value btor324) (signal-value btor334))
             (list)))
           (btor336
            (signal
             (bvand (signal-value btor325) (signal-value btor335))
             (list)))
           (btor337
            (signal
             (bvand (signal-value btor324) (signal-value btor336))
             (list)))
           (btor338
            (signal
             (bvand (signal-value btor324) (signal-value btor337))
             (list)))
           (btor339
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state339")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state339")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state339")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state339")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor340
            (signal
             (bvand (signal-value btor338) (signal-value btor339))
             (list)))
           (btor341
            (if (bitvector->bool (signal-value btor340)) btor323 btor322))
           (btor342
            (signal
             (concat (signal-value btor341) (signal-value btor312))
             (list)))
           (btor343
            (signal
             (bool->bitvector
              (bveq (signal-value btor342) (signal-value btor149)))
             (list)))
           (btor344
            (if (bitvector->bool (signal-value btor343)) btor311 btor310))
           (btor345
            (signal (concat (signal-value btor3) (signal-value btor2)) (list)))
           (btor346
            (signal
             (concat (signal-value btor12) (signal-value btor345))
             (list)))
           (btor347
            (signal
             (concat (signal-value btor13) (signal-value btor346))
             (list)))
           (btor348
            (signal
             (concat (signal-value btor14) (signal-value btor347))
             (list)))
           (btor349 (bitvector 6))
           (btor350
            (signal
             (concat (signal-value btor15) (signal-value btor348))
             (list)))
           (btor351 (bitvector 7))
           (btor352
            (signal
             (concat (signal-value btor16) (signal-value btor350))
             (list)))
           (btor353 (bitvector 8))
           (btor354
            (signal
             (concat (signal-value btor17) (signal-value btor352))
             (list)))
           (btor355 (bitvector 9))
           (btor356
            (signal
             (concat (signal-value btor18) (signal-value btor354))
             (list)))
           (btor357 (bitvector 10))
           (btor358
            (signal
             (concat (signal-value btor19) (signal-value btor356))
             (list)))
           (btor359 (bitvector 11))
           (btor360
            (signal
             (concat (signal-value btor4) (signal-value btor358))
             (list)))
           (btor361 (bitvector 12))
           (btor362
            (signal
             (concat (signal-value btor5) (signal-value btor360))
             (list)))
           (btor363 (bitvector 13))
           (btor364
            (signal
             (concat (signal-value btor6) (signal-value btor362))
             (list)))
           (btor365 (bitvector 14))
           (btor366
            (signal
             (concat (signal-value btor7) (signal-value btor364))
             (list)))
           (btor367 (bitvector 15))
           (btor368
            (signal
             (concat (signal-value btor8) (signal-value btor366))
             (list)))
           (btor369 (bitvector 16))
           (btor370
            (signal
             (concat (signal-value btor9) (signal-value btor368))
             (list)))
           (btor371 (bitvector 17))
           (btor372
            (signal
             (concat (signal-value btor10) (signal-value btor370))
             (list)))
           (btor373
            (signal
             (concat (signal-value btor11) (signal-value btor372))
             (list)))
           (btor374
            (signal
             (concat (signal-value btor98) (signal-value btor97))
             (list)))
           (btor375
            (signal
             (concat (signal-value btor107) (signal-value btor374))
             (list)))
           (btor376
            (signal
             (concat (signal-value btor108) (signal-value btor375))
             (list)))
           (btor377
            (signal
             (concat (signal-value btor109) (signal-value btor376))
             (list)))
           (btor378
            (signal
             (concat (signal-value btor110) (signal-value btor377))
             (list)))
           (btor379
            (signal
             (concat (signal-value btor111) (signal-value btor378))
             (list)))
           (btor380
            (signal
             (concat (signal-value btor112) (signal-value btor379))
             (list)))
           (btor381
            (signal
             (concat (signal-value btor113) (signal-value btor380))
             (list)))
           (btor382
            (signal
             (concat (signal-value btor114) (signal-value btor381))
             (list)))
           (btor383
            (signal
             (concat (signal-value btor99) (signal-value btor382))
             (list)))
           (btor384
            (signal
             (concat (signal-value btor100) (signal-value btor383))
             (list)))
           (btor385
            (signal
             (concat (signal-value btor101) (signal-value btor384))
             (list)))
           (btor386
            (signal
             (concat (signal-value btor102) (signal-value btor385))
             (list)))
           (btor387
            (signal
             (concat (signal-value btor103) (signal-value btor386))
             (list)))
           (btor388
            (signal
             (concat (signal-value btor104) (signal-value btor387))
             (list)))
           (btor389
            (signal
             (concat (signal-value btor105) (signal-value btor388))
             (list)))
           (btor390
            (signal
             (concat (signal-value btor106) (signal-value btor389))
             (list)))
           (btor391
            (if (bitvector->bool (signal-value btor94)) btor390 btor373))
           (btor392
            (signal
             (apply bvor (bitvector->bits (signal-value btor74)))
             (signal-state btor74)))
           (btor393 (signal (bvnot (signal-value btor392)) (list)))
           (btor394
            (if (bitvector->bool (signal-value btor393)) btor391 btor344))
           (btor395 (bv->signal (bv 0 (bitvector 18))))
           (btor396
            (signal
             (extract 17 17 (signal-value btor394))
             (signal-state btor394)))
           (btor397
            (signal
             (extract 17 17 (signal-value btor394))
             (signal-state btor394)))
           (btor398
            (signal
             (concat (signal-value btor397) (signal-value btor396))
             (list)))
           (btor399
            (signal
             (extract 17 17 (signal-value btor394))
             (signal-state btor394)))
           (btor400
            (signal
             (concat (signal-value btor399) (signal-value btor398))
             (list)))
           (btor401
            (signal
             (extract 17 17 (signal-value btor394))
             (signal-state btor394)))
           (btor402
            (signal
             (concat (signal-value btor401) (signal-value btor400))
             (list)))
           (btor403
            (signal
             (extract 17 17 (signal-value btor394))
             (signal-state btor394)))
           (btor404
            (signal
             (concat (signal-value btor403) (signal-value btor402))
             (list)))
           (btor405
            (signal
             (extract 17 17 (signal-value btor394))
             (signal-state btor394)))
           (btor406
            (signal
             (concat (signal-value btor405) (signal-value btor404))
             (list)))
           (btor407
            (signal
             (extract 17 17 (signal-value btor394))
             (signal-state btor394)))
           (btor408
            (signal
             (concat (signal-value btor407) (signal-value btor406))
             (list)))
           (btor409
            (signal
             (extract 17 17 (signal-value btor394))
             (signal-state btor394)))
           (btor410
            (signal
             (concat (signal-value btor409) (signal-value btor408))
             (list)))
           (btor411
            (signal
             (extract 17 17 (signal-value btor394))
             (signal-state btor394)))
           (btor412
            (signal
             (concat (signal-value btor411) (signal-value btor410))
             (list)))
           (btor413
            (signal
             (extract 17 17 (signal-value btor394))
             (signal-state btor394)))
           (btor414
            (signal
             (concat (signal-value btor413) (signal-value btor412))
             (list)))
           (btor415
            (signal
             (extract 17 17 (signal-value btor394))
             (signal-state btor394)))
           (btor416
            (signal
             (concat (signal-value btor415) (signal-value btor414))
             (list)))
           (btor417
            (signal
             (extract 17 17 (signal-value btor394))
             (signal-state btor394)))
           (btor418
            (signal
             (concat (signal-value btor417) (signal-value btor416))
             (list)))
           (btor419
            (signal
             (extract 17 17 (signal-value btor394))
             (signal-state btor394)))
           (btor420
            (signal
             (concat (signal-value btor419) (signal-value btor418))
             (list)))
           (btor421
            (signal
             (extract 17 17 (signal-value btor394))
             (signal-state btor394)))
           (btor422
            (signal
             (concat (signal-value btor421) (signal-value btor420))
             (list)))
           (btor423
            (signal
             (extract 17 17 (signal-value btor394))
             (signal-state btor394)))
           (btor424
            (signal
             (concat (signal-value btor423) (signal-value btor422))
             (list)))
           (btor425
            (signal
             (extract 17 17 (signal-value btor394))
             (signal-state btor394)))
           (btor426
            (signal
             (concat (signal-value btor425) (signal-value btor424))
             (list)))
           (btor427
            (signal
             (extract 17 17 (signal-value btor394))
             (signal-state btor394)))
           (btor428
            (signal
             (concat (signal-value btor427) (signal-value btor426))
             (list)))
           (btor429
            (signal
             (extract 17 17 (signal-value btor394))
             (signal-state btor394)))
           (btor430
            (signal
             (concat (signal-value btor429) (signal-value btor428))
             (list)))
           (btor431
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state431")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state431")))))
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
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor432
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state432")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state432")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state432")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state432")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor433
            (if (bitvector->bool (signal-value btor343)) btor432 btor431))
           (btor434
            (if (bitvector->bool (signal-value btor393)) btor92 btor433))
           (btor435
            (if (bitvector->bool (signal-value btor434)) btor430 btor395))
           (btor436
            (signal
             (concat (signal-value btor435) (signal-value btor394))
             (list)))
           (btor437
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state437")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state437")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state437")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state437")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor438
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state438")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state438")))))
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
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor439
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state439")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state439")))))
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
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor441
            (bv->signal
             (zero-extend (signal-value btor193) (bitvector 5))
             btor193))
           (btor442
            (signal
             (bool->bitvector
              (bveq (signal-value btor77) (signal-value btor441)))
             (list)))
           (btor443
            (if (bitvector->bool (signal-value btor442)) btor191 btor168))
           (btor444
            (bv->signal
             (zero-extend (signal-value btor220) (bitvector 5))
             btor220))
           (btor445
            (signal
             (bool->bitvector
              (bveq (signal-value btor77) (signal-value btor444)))
             (list)))
           (btor446
            (if (bitvector->bool (signal-value btor445)) btor219 btor443))
           (btor447
            (bv->signal
             (zero-extend (signal-value btor247) (bitvector 5))
             btor247))
           (btor448
            (signal
             (bool->bitvector
              (bveq (signal-value btor77) (signal-value btor447)))
             (list)))
           (btor449
            (if (bitvector->bool (signal-value btor448)) btor246 btor446))
           (btor450
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state450")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state450")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state450")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state450")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor452 (signal (bvnot (signal-value btor448)) (list)))
           (btor453 (signal (bvnot (signal-value btor445)) (list)))
           (btor454 (signal (bvnot (signal-value btor442)) (list)))
           (btor455
            (bv->signal
             (zero-extend (signal-value btor255) (bitvector 5))
             btor255))
           (btor456
            (signal
             (bool->bitvector
              (bveq (signal-value btor77) (signal-value btor455)))
             (list)))
           (btor457 (signal (bvnot (signal-value btor456)) (list)))
           (btor458
            (signal
             (bvand (signal-value btor454) (signal-value btor457))
             (list)))
           (btor459
            (signal
             (bvand (signal-value btor453) (signal-value btor458))
             (list)))
           (btor460
            (signal
             (bvand (signal-value btor452) (signal-value btor459))
             (list)))
           (btor461
            (signal
             (bvand (signal-value btor454) (signal-value btor460))
             (list)))
           (btor462
            (signal
             (bvand (signal-value btor453) (signal-value btor461))
             (list)))
           (btor463
            (signal
             (bvand (signal-value btor452) (signal-value btor462))
             (list)))
           (btor464
            (signal
             (bvand (signal-value btor453) (signal-value btor463))
             (list)))
           (btor465
            (signal
             (bvand (signal-value btor452) (signal-value btor464))
             (list)))
           (btor466
            (signal
             (bvand (signal-value btor452) (signal-value btor465))
             (list)))
           (btor467
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state467")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state467")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state467")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state467")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor468
            (signal
             (bvand (signal-value btor466) (signal-value btor467))
             (list)))
           (btor469
            (if (bitvector->bool (signal-value btor468)) btor450 btor449))
           (btor470
            (signal
             (concat (signal-value btor469) (signal-value btor439))
             (list)))
           (btor471
            (signal
             (bool->bitvector
              (bveq (signal-value btor470) (signal-value btor149)))
             (list)))
           (btor472
            (if (bitvector->bool (signal-value btor471)) btor438 btor437))
           (btor473
            (signal
             (concat (signal-value btor116) (signal-value btor115))
             (list)))
           (btor474
            (signal
             (concat (signal-value btor125) (signal-value btor473))
             (list)))
           (btor475
            (signal
             (concat (signal-value btor126) (signal-value btor474))
             (list)))
           (btor476
            (signal
             (concat (signal-value btor127) (signal-value btor475))
             (list)))
           (btor477
            (signal
             (concat (signal-value btor128) (signal-value btor476))
             (list)))
           (btor478
            (signal
             (concat (signal-value btor129) (signal-value btor477))
             (list)))
           (btor479
            (signal
             (concat (signal-value btor130) (signal-value btor478))
             (list)))
           (btor480
            (signal
             (concat (signal-value btor131) (signal-value btor479))
             (list)))
           (btor481
            (signal
             (concat (signal-value btor132) (signal-value btor480))
             (list)))
           (btor482
            (signal
             (concat (signal-value btor117) (signal-value btor481))
             (list)))
           (btor483
            (signal
             (concat (signal-value btor118) (signal-value btor482))
             (list)))
           (btor484
            (signal
             (concat (signal-value btor119) (signal-value btor483))
             (list)))
           (btor485
            (signal
             (concat (signal-value btor120) (signal-value btor484))
             (list)))
           (btor486
            (signal
             (concat (signal-value btor121) (signal-value btor485))
             (list)))
           (btor487
            (signal
             (concat (signal-value btor122) (signal-value btor486))
             (list)))
           (btor488
            (signal
             (concat (signal-value btor123) (signal-value btor487))
             (list)))
           (btor489
            (signal
             (concat (signal-value btor124) (signal-value btor488))
             (list)))
           (btor490
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state490")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state490")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state490")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state490")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor491
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state491")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state491")))))
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
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor492
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state492")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state492")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state492")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state492")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor494
            (bv->signal
             (zero-extend (signal-value btor193) (bitvector 5))
             btor193))
           (btor495
            (signal
             (bool->bitvector
              (bveq (signal-value btor80) (signal-value btor494)))
             (list)))
           (btor496
            (if (bitvector->bool (signal-value btor495)) btor191 btor168))
           (btor497
            (bv->signal
             (zero-extend (signal-value btor220) (bitvector 5))
             btor220))
           (btor498
            (signal
             (bool->bitvector
              (bveq (signal-value btor80) (signal-value btor497)))
             (list)))
           (btor499
            (if (bitvector->bool (signal-value btor498)) btor219 btor496))
           (btor500
            (bv->signal
             (zero-extend (signal-value btor247) (bitvector 5))
             btor247))
           (btor501
            (signal
             (bool->bitvector
              (bveq (signal-value btor80) (signal-value btor500)))
             (list)))
           (btor502
            (if (bitvector->bool (signal-value btor501)) btor246 btor499))
           (btor503
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state503")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state503")))))
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
           (btor505 (signal (bvnot (signal-value btor501)) (list)))
           (btor506 (signal (bvnot (signal-value btor498)) (list)))
           (btor507 (signal (bvnot (signal-value btor495)) (list)))
           (btor508
            (bv->signal
             (zero-extend (signal-value btor255) (bitvector 5))
             btor255))
           (btor509
            (signal
             (bool->bitvector
              (bveq (signal-value btor80) (signal-value btor508)))
             (list)))
           (btor510 (signal (bvnot (signal-value btor509)) (list)))
           (btor511
            (signal
             (bvand (signal-value btor507) (signal-value btor510))
             (list)))
           (btor512
            (signal
             (bvand (signal-value btor506) (signal-value btor511))
             (list)))
           (btor513
            (signal
             (bvand (signal-value btor505) (signal-value btor512))
             (list)))
           (btor514
            (signal
             (bvand (signal-value btor507) (signal-value btor513))
             (list)))
           (btor515
            (signal
             (bvand (signal-value btor506) (signal-value btor514))
             (list)))
           (btor516
            (signal
             (bvand (signal-value btor505) (signal-value btor515))
             (list)))
           (btor517
            (signal
             (bvand (signal-value btor506) (signal-value btor516))
             (list)))
           (btor518
            (signal
             (bvand (signal-value btor505) (signal-value btor517))
             (list)))
           (btor519
            (signal
             (bvand (signal-value btor505) (signal-value btor518))
             (list)))
           (btor520
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state520")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state520")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state520")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state520")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor521
            (signal
             (bvand (signal-value btor519) (signal-value btor520))
             (list)))
           (btor522
            (if (bitvector->bool (signal-value btor521)) btor503 btor502))
           (btor523
            (signal
             (concat (signal-value btor522) (signal-value btor492))
             (list)))
           (btor524
            (signal
             (bool->bitvector
              (bveq (signal-value btor523) (signal-value btor149)))
             (list)))
           (btor525
            (if (bitvector->bool (signal-value btor524)) btor491 btor490))
           (btor526
            (signal
             (concat (signal-value btor39) (signal-value btor38))
             (list)))
           (btor527
            (signal
             (concat (signal-value btor48) (signal-value btor526))
             (list)))
           (btor528
            (signal
             (concat (signal-value btor49) (signal-value btor527))
             (list)))
           (btor529
            (signal
             (concat (signal-value btor50) (signal-value btor528))
             (list)))
           (btor530
            (signal
             (concat (signal-value btor51) (signal-value btor529))
             (list)))
           (btor531
            (signal
             (concat (signal-value btor52) (signal-value btor530))
             (list)))
           (btor532
            (signal
             (concat (signal-value btor53) (signal-value btor531))
             (list)))
           (btor533
            (signal
             (concat (signal-value btor54) (signal-value btor532))
             (list)))
           (btor534
            (signal
             (concat (signal-value btor55) (signal-value btor533))
             (list)))
           (btor535
            (signal
             (concat (signal-value btor40) (signal-value btor534))
             (list)))
           (btor536
            (signal
             (concat (signal-value btor41) (signal-value btor535))
             (list)))
           (btor537
            (signal
             (concat (signal-value btor42) (signal-value btor536))
             (list)))
           (btor538
            (signal
             (concat (signal-value btor43) (signal-value btor537))
             (list)))
           (btor539
            (signal
             (concat (signal-value btor44) (signal-value btor538))
             (list)))
           (btor540
            (signal
             (concat (signal-value btor45) (signal-value btor539))
             (list)))
           (btor541
            (signal
             (concat (signal-value btor46) (signal-value btor540))
             (list)))
           (btor542
            (signal
             (concat (signal-value btor47) (signal-value btor541))
             (list)))
           (btor543
            (signal
             (apply bvor (bitvector->bits (signal-value btor80)))
             (signal-state btor80)))
           (btor544 (signal (bvnot (signal-value btor543)) (list)))
           (btor545
            (if (bitvector->bool (signal-value btor544)) btor542 btor525))
           (btor546
            (bv->signal
             (zero-extend (signal-value btor255) (bitvector 5))
             btor255))
           (btor547
            (signal
             (bool->bitvector
              (bveq (signal-value btor71) (signal-value btor546)))
             (list)))
           (btor548
            (if (bitvector->bool (signal-value btor547)) btor68 btor140))
           (btor549
            (bv->signal
             (zero-extend (signal-value btor193) (bitvector 5))
             btor193))
           (btor550
            (signal
             (bool->bitvector
              (bveq (signal-value btor71) (signal-value btor549)))
             (list)))
           (btor551
            (if (bitvector->bool (signal-value btor550)) btor66 btor548))
           (btor552
            (bv->signal
             (zero-extend (signal-value btor220) (bitvector 5))
             btor220))
           (btor553
            (signal
             (bool->bitvector
              (bveq (signal-value btor71) (signal-value btor552)))
             (list)))
           (btor554
            (if (bitvector->bool (signal-value btor553)) btor64 btor551))
           (btor555
            (bv->signal
             (zero-extend (signal-value btor247) (bitvector 5))
             btor247))
           (btor556
            (signal
             (bool->bitvector
              (bveq (signal-value btor71) (signal-value btor555)))
             (list)))
           (btor557
            (if (bitvector->bool (signal-value btor556)) btor62 btor554))
           (btor558
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state558")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state558")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state558")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state558")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor560 (signal (bvnot (signal-value btor556)) (list)))
           (btor561 (signal (bvnot (signal-value btor553)) (list)))
           (btor562 (signal (bvnot (signal-value btor550)) (list)))
           (btor563 (signal (bvnot (signal-value btor547)) (list)))
           (btor564
            (signal
             (apply bvor (bitvector->bits (signal-value btor71)))
             (signal-state btor71)))
           (btor565 (signal (bvnot (signal-value btor564)) (list)))
           (btor566 (signal (bvnot (signal-value btor565)) (list)))
           (btor567
            (signal
             (bvand (signal-value btor563) (signal-value btor566))
             (list)))
           (btor568
            (signal
             (bvand (signal-value btor562) (signal-value btor567))
             (list)))
           (btor569
            (signal
             (bvand (signal-value btor561) (signal-value btor568))
             (list)))
           (btor570
            (signal
             (bvand (signal-value btor560) (signal-value btor569))
             (list)))
           (btor571
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state571")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state571")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state571")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state571")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor572
            (signal
             (bvand (signal-value btor570) (signal-value btor571))
             (list)))
           (btor573
            (if (bitvector->bool (signal-value btor572)) btor558 btor557))
           (btor574
            (if (bitvector->bool (signal-value btor573)) btor545 btor489))
           (btor575
            (if (bitvector->bool (signal-value btor95)) btor545 btor489))
           (btor576 (bv->signal (bv 9 (bitvector 4))))
           (btor577
            (bv->signal
             (zero-extend (signal-value btor576) (bitvector 5))
             btor576))
           (btor578
            (signal
             (bool->bitvector
              (bveq (signal-value btor96) (signal-value btor577)))
             (list)))
           (btor579
            (if (bitvector->bool (signal-value btor578)) btor575 btor574))
           (btor580
            (if (bitvector->bool (signal-value btor95)) btor489 btor545))
           (btor581 (bv->signal (bv 8 (bitvector 4))))
           (btor582
            (bv->signal
             (zero-extend (signal-value btor581) (bitvector 5))
             btor581))
           (btor583
            (signal
             (bool->bitvector
              (bveq (signal-value btor96) (signal-value btor582)))
             (list)))
           (btor584
            (if (bitvector->bool (signal-value btor583)) btor580 btor579))
           (btor585
            (signal
             (concat (signal-value btor21) (signal-value btor20))
             (list)))
           (btor586
            (signal
             (concat (signal-value btor30) (signal-value btor585))
             (list)))
           (btor587
            (signal
             (concat (signal-value btor31) (signal-value btor586))
             (list)))
           (btor588
            (signal
             (concat (signal-value btor32) (signal-value btor587))
             (list)))
           (btor589
            (signal
             (concat (signal-value btor33) (signal-value btor588))
             (list)))
           (btor590
            (signal
             (concat (signal-value btor34) (signal-value btor589))
             (list)))
           (btor591
            (signal
             (concat (signal-value btor35) (signal-value btor590))
             (list)))
           (btor592
            (signal
             (concat (signal-value btor36) (signal-value btor591))
             (list)))
           (btor593
            (signal
             (concat (signal-value btor37) (signal-value btor592))
             (list)))
           (btor594
            (signal
             (concat (signal-value btor22) (signal-value btor593))
             (list)))
           (btor595
            (signal
             (concat (signal-value btor23) (signal-value btor594))
             (list)))
           (btor596
            (signal
             (concat (signal-value btor24) (signal-value btor595))
             (list)))
           (btor597
            (signal
             (concat (signal-value btor25) (signal-value btor596))
             (list)))
           (btor598
            (signal
             (concat (signal-value btor26) (signal-value btor597))
             (list)))
           (btor599
            (signal
             (concat (signal-value btor27) (signal-value btor598))
             (list)))
           (btor600
            (signal
             (concat (signal-value btor28) (signal-value btor599))
             (list)))
           (btor601
            (signal
             (concat (signal-value btor29) (signal-value btor600))
             (list)))
           (btor602
            (if (bitvector->bool (signal-value btor95)) btor489 btor601))
           (btor603 (bv->signal (bv 7 (bitvector 3))))
           (btor604
            (bv->signal
             (zero-extend (signal-value btor603) (bitvector 5))
             btor603))
           (btor605
            (signal
             (bool->bitvector
              (bveq (signal-value btor96) (signal-value btor604)))
             (list)))
           (btor606
            (if (bitvector->bool (signal-value btor605)) btor602 btor584))
           (btor607
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state607")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state607")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state607")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state607")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor608 (signal (bvnot (signal-value btor605)) (list)))
           (btor609 (signal (bvnot (signal-value btor583)) (list)))
           (btor610 (signal (bvnot (signal-value btor578)) (list)))
           (btor611 (bv->signal (bv 10 (bitvector 4))))
           (btor612
            (bv->signal
             (zero-extend (signal-value btor611) (bitvector 5))
             btor611))
           (btor613
            (signal
             (bool->bitvector
              (bveq (signal-value btor96) (signal-value btor612)))
             (list)))
           (btor614 (signal (bvnot (signal-value btor613)) (list)))
           (btor615
            (signal
             (bvand (signal-value btor610) (signal-value btor614))
             (list)))
           (btor616
            (signal
             (bvand (signal-value btor609) (signal-value btor615))
             (list)))
           (btor617
            (signal
             (bvand (signal-value btor608) (signal-value btor616))
             (list)))
           (btor618
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state618")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state618")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state618")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state618")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor619
            (signal
             (bvand (signal-value btor617) (signal-value btor618))
             (list)))
           (btor620
            (if (bitvector->bool (signal-value btor619)) btor607 btor606))
           (btor621
            (signal
             (apply bvor (bitvector->bits (signal-value btor77)))
             (signal-state btor77)))
           (btor622 (signal (bvnot (signal-value btor621)) (list)))
           (btor623
            (if (bitvector->bool (signal-value btor622)) btor620 btor472))
           (btor624
            (signal
             (extract 17 17 (signal-value btor623))
             (signal-state btor623)))
           (btor625
            (signal
             (extract 17 17 (signal-value btor623))
             (signal-state btor623)))
           (btor626
            (signal
             (concat (signal-value btor625) (signal-value btor624))
             (list)))
           (btor627
            (signal
             (extract 17 17 (signal-value btor623))
             (signal-state btor623)))
           (btor628
            (signal
             (concat (signal-value btor627) (signal-value btor626))
             (list)))
           (btor629
            (signal
             (extract 17 17 (signal-value btor623))
             (signal-state btor623)))
           (btor630
            (signal
             (concat (signal-value btor629) (signal-value btor628))
             (list)))
           (btor631
            (signal
             (extract 17 17 (signal-value btor623))
             (signal-state btor623)))
           (btor632
            (signal
             (concat (signal-value btor631) (signal-value btor630))
             (list)))
           (btor633
            (signal
             (extract 17 17 (signal-value btor623))
             (signal-state btor623)))
           (btor634
            (signal
             (concat (signal-value btor633) (signal-value btor632))
             (list)))
           (btor635
            (signal
             (extract 17 17 (signal-value btor623))
             (signal-state btor623)))
           (btor636
            (signal
             (concat (signal-value btor635) (signal-value btor634))
             (list)))
           (btor637
            (signal
             (extract 17 17 (signal-value btor623))
             (signal-state btor623)))
           (btor638
            (signal
             (concat (signal-value btor637) (signal-value btor636))
             (list)))
           (btor639
            (signal
             (extract 17 17 (signal-value btor623))
             (signal-state btor623)))
           (btor640
            (signal
             (concat (signal-value btor639) (signal-value btor638))
             (list)))
           (btor641
            (signal
             (extract 17 17 (signal-value btor623))
             (signal-state btor623)))
           (btor642
            (signal
             (concat (signal-value btor641) (signal-value btor640))
             (list)))
           (btor643
            (signal
             (extract 17 17 (signal-value btor623))
             (signal-state btor623)))
           (btor644
            (signal
             (concat (signal-value btor643) (signal-value btor642))
             (list)))
           (btor645
            (signal
             (extract 17 17 (signal-value btor623))
             (signal-state btor623)))
           (btor646
            (signal
             (concat (signal-value btor645) (signal-value btor644))
             (list)))
           (btor647
            (signal
             (extract 17 17 (signal-value btor623))
             (signal-state btor623)))
           (btor648
            (signal
             (concat (signal-value btor647) (signal-value btor646))
             (list)))
           (btor649
            (signal
             (extract 17 17 (signal-value btor623))
             (signal-state btor623)))
           (btor650
            (signal
             (concat (signal-value btor649) (signal-value btor648))
             (list)))
           (btor651
            (signal
             (extract 17 17 (signal-value btor623))
             (signal-state btor623)))
           (btor652
            (signal
             (concat (signal-value btor651) (signal-value btor650))
             (list)))
           (btor653
            (signal
             (extract 17 17 (signal-value btor623))
             (signal-state btor623)))
           (btor654
            (signal
             (concat (signal-value btor653) (signal-value btor652))
             (list)))
           (btor655
            (signal
             (extract 17 17 (signal-value btor623))
             (signal-state btor623)))
           (btor656
            (signal
             (concat (signal-value btor655) (signal-value btor654))
             (list)))
           (btor657
            (signal
             (extract 17 17 (signal-value btor623))
             (signal-state btor623)))
           (btor658
            (signal
             (concat (signal-value btor657) (signal-value btor656))
             (list)))
           (btor659
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state659")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state659")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state659")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state659")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor660
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state660")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state660")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state660")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state660")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor661
            (if (bitvector->bool (signal-value btor471)) btor660 btor659))
           (btor662
            (if (bitvector->bool (signal-value btor622)) btor93 btor661))
           (btor663
            (if (bitvector->bool (signal-value btor662)) btor658 btor395))
           (btor664
            (signal
             (concat (signal-value btor663) (signal-value btor623))
             (list)))
           (btor665
            (signal
             (bvmul (signal-value btor436) (signal-value btor664))
             (list)))
           (btor666
            (signal
             (apply bvor (bitvector->bits (signal-value btor436)))
             (signal-state btor436)))
           (btor667 (signal (bvnot (signal-value btor666)) (list)))
           (btor668
            (signal
             (apply bvor (bitvector->bits (signal-value btor664)))
             (signal-state btor664)))
           (btor669 (signal (bvnot (signal-value btor668)) (list)))
           (btor670
            (signal
             (bvor (signal-value btor667) (signal-value btor669))
             (list)))
           (btor671
            (if (bitvector->bool (signal-value btor670)) btor134 btor665))
           (btor672
            (signal
             (apply bvor (bitvector->bits (signal-value btor86)))
             (signal-state btor86)))
           (btor673 (signal (bvnot (signal-value btor672)) (list)))
           (btor674
            (if (bitvector->bool (signal-value btor673)) btor671 btor308))
           (btor675
            (signal
             (apply bvor (bitvector->bits (signal-value btor83)))
             (signal-state btor83)))
           (btor676 (signal (bvnot (signal-value btor675)) (list)))
           (btor677
            (if (bitvector->bool (signal-value btor676)) btor674 btor273))
           (btor678
            (bv->signal
             (zero-extend (signal-value btor160) (bitvector 5))
             btor160))
           (btor679
            (signal
             (bool->bitvector
              (bveq (signal-value btor72) (signal-value btor678)))
             (list)))
           (btor680
            (if (bitvector->bool (signal-value btor679)) btor677 btor134))
           (btor681
            (signal
             (extract 0 0 (signal-value btor680))
             (signal-state btor680)))
           (btor683
            (signal
             (extract 1 1 (signal-value btor680))
             (signal-state btor680)))
           (btor685
            (signal
             (extract 10 10 (signal-value btor680))
             (signal-state btor680)))
           (btor687
            (signal
             (extract 11 11 (signal-value btor680))
             (signal-state btor680)))
           (btor689
            (signal
             (extract 12 12 (signal-value btor680))
             (signal-state btor680)))
           (btor691
            (signal
             (extract 13 13 (signal-value btor680))
             (signal-state btor680)))
           (btor693
            (signal
             (extract 14 14 (signal-value btor680))
             (signal-state btor680)))
           (btor695
            (signal
             (extract 15 15 (signal-value btor680))
             (signal-state btor680)))
           (btor697
            (signal
             (extract 16 16 (signal-value btor680))
             (signal-state btor680)))
           (btor699
            (signal
             (extract 17 17 (signal-value btor680))
             (signal-state btor680)))
           (btor701
            (signal
             (extract 18 18 (signal-value btor680))
             (signal-state btor680)))
           (btor703
            (signal
             (extract 19 19 (signal-value btor680))
             (signal-state btor680)))
           (btor705
            (signal
             (extract 2 2 (signal-value btor680))
             (signal-state btor680)))
           (btor707
            (signal
             (extract 20 20 (signal-value btor680))
             (signal-state btor680)))
           (btor709
            (signal
             (extract 21 21 (signal-value btor680))
             (signal-state btor680)))
           (btor711
            (signal
             (extract 22 22 (signal-value btor680))
             (signal-state btor680)))
           (btor713
            (signal
             (extract 23 23 (signal-value btor680))
             (signal-state btor680)))
           (btor715
            (signal
             (extract 24 24 (signal-value btor680))
             (signal-state btor680)))
           (btor717
            (signal
             (extract 25 25 (signal-value btor680))
             (signal-state btor680)))
           (btor719
            (signal
             (extract 26 26 (signal-value btor680))
             (signal-state btor680)))
           (btor721
            (signal
             (extract 27 27 (signal-value btor680))
             (signal-state btor680)))
           (btor723
            (signal
             (extract 28 28 (signal-value btor680))
             (signal-state btor680)))
           (btor725
            (signal
             (extract 29 29 (signal-value btor680))
             (signal-state btor680)))
           (btor727
            (signal
             (extract 3 3 (signal-value btor680))
             (signal-state btor680)))
           (btor729
            (signal
             (extract 30 30 (signal-value btor680))
             (signal-state btor680)))
           (btor731
            (signal
             (extract 31 31 (signal-value btor680))
             (signal-state btor680)))
           (btor733
            (signal
             (extract 32 32 (signal-value btor680))
             (signal-state btor680)))
           (btor735
            (signal
             (extract 33 33 (signal-value btor680))
             (signal-state btor680)))
           (btor737
            (signal
             (extract 34 34 (signal-value btor680))
             (signal-state btor680)))
           (btor739
            (signal
             (extract 35 35 (signal-value btor680))
             (signal-state btor680)))
           (btor741
            (signal
             (extract 4 4 (signal-value btor680))
             (signal-state btor680)))
           (btor743
            (signal
             (extract 5 5 (signal-value btor680))
             (signal-state btor680)))
           (btor745
            (signal
             (extract 6 6 (signal-value btor680))
             (signal-state btor680)))
           (btor747
            (signal
             (extract 7 7 (signal-value btor680))
             (signal-state btor680)))
           (btor749
            (signal
             (extract 8 8 (signal-value btor680))
             (signal-state btor680)))
           (btor751
            (signal
             (extract 9 9 (signal-value btor680))
             (signal-state btor680)))
           (btor753
            (signal
             (extract 0 0 (signal-value btor394))
             (signal-state btor394)))
           (btor755
            (signal
             (extract 1 1 (signal-value btor394))
             (signal-state btor394)))
           (btor757
            (signal
             (extract 10 10 (signal-value btor394))
             (signal-state btor394)))
           (btor759
            (signal
             (extract 11 11 (signal-value btor394))
             (signal-state btor394)))
           (btor761
            (signal
             (extract 12 12 (signal-value btor394))
             (signal-state btor394)))
           (btor763
            (signal
             (extract 13 13 (signal-value btor394))
             (signal-state btor394)))
           (btor765
            (signal
             (extract 14 14 (signal-value btor394))
             (signal-state btor394)))
           (btor767
            (signal
             (extract 15 15 (signal-value btor394))
             (signal-state btor394)))
           (btor769
            (signal
             (extract 16 16 (signal-value btor394))
             (signal-state btor394)))
           (btor771
            (signal
             (extract 17 17 (signal-value btor394))
             (signal-state btor394)))
           (btor773
            (signal
             (extract 2 2 (signal-value btor394))
             (signal-state btor394)))
           (btor775
            (signal
             (extract 3 3 (signal-value btor394))
             (signal-state btor394)))
           (btor777
            (signal
             (extract 4 4 (signal-value btor394))
             (signal-state btor394)))
           (btor779
            (signal
             (extract 5 5 (signal-value btor394))
             (signal-state btor394)))
           (btor781
            (signal
             (extract 6 6 (signal-value btor394))
             (signal-state btor394)))
           (btor783
            (signal
             (extract 7 7 (signal-value btor394))
             (signal-state btor394)))
           (btor785
            (signal
             (extract 8 8 (signal-value btor394))
             (signal-state btor394)))
           (btor787
            (signal
             (extract 9 9 (signal-value btor394))
             (signal-state btor394)))
           (btor789
            (signal
             (extract 0 0 (signal-value btor623))
             (signal-state btor623)))
           (btor791
            (signal
             (extract 1 1 (signal-value btor623))
             (signal-state btor623)))
           (btor793
            (signal
             (extract 10 10 (signal-value btor623))
             (signal-state btor623)))
           (btor795
            (signal
             (extract 11 11 (signal-value btor623))
             (signal-state btor623)))
           (btor797
            (signal
             (extract 12 12 (signal-value btor623))
             (signal-state btor623)))
           (btor799
            (signal
             (extract 13 13 (signal-value btor623))
             (signal-state btor623)))
           (btor801
            (signal
             (extract 14 14 (signal-value btor623))
             (signal-state btor623)))
           (btor803
            (signal
             (extract 15 15 (signal-value btor623))
             (signal-state btor623)))
           (btor805
            (signal
             (extract 16 16 (signal-value btor623))
             (signal-state btor623)))
           (btor807
            (signal
             (extract 17 17 (signal-value btor623))
             (signal-state btor623)))
           (btor809
            (signal
             (extract 2 2 (signal-value btor623))
             (signal-state btor623)))
           (btor811
            (signal
             (extract 3 3 (signal-value btor623))
             (signal-state btor623)))
           (btor813
            (signal
             (extract 4 4 (signal-value btor623))
             (signal-state btor623)))
           (btor815
            (signal
             (extract 5 5 (signal-value btor623))
             (signal-state btor623)))
           (btor817
            (signal
             (extract 6 6 (signal-value btor623))
             (signal-state btor623)))
           (btor819
            (signal
             (extract 7 7 (signal-value btor623))
             (signal-state btor623)))
           (btor821
            (signal
             (extract 8 8 (signal-value btor623))
             (signal-state btor623)))
           (btor823
            (signal
             (extract 9 9 (signal-value btor623))
             (signal-state btor623)))
           (btor825
            (signal
             (extract 0 0 (signal-value btor545))
             (signal-state btor545)))
           (btor827
            (signal
             (extract 1 1 (signal-value btor545))
             (signal-state btor545)))
           (btor829
            (signal
             (extract 10 10 (signal-value btor545))
             (signal-state btor545)))
           (btor831
            (signal
             (extract 11 11 (signal-value btor545))
             (signal-state btor545)))
           (btor833
            (signal
             (extract 12 12 (signal-value btor545))
             (signal-state btor545)))
           (btor835
            (signal
             (extract 13 13 (signal-value btor545))
             (signal-state btor545)))
           (btor837
            (signal
             (extract 14 14 (signal-value btor545))
             (signal-state btor545)))
           (btor839
            (signal
             (extract 15 15 (signal-value btor545))
             (signal-state btor545)))
           (btor841
            (signal
             (extract 16 16 (signal-value btor545))
             (signal-state btor545)))
           (btor843
            (signal
             (extract 17 17 (signal-value btor545))
             (signal-state btor545)))
           (btor845
            (signal
             (extract 2 2 (signal-value btor545))
             (signal-state btor545)))
           (btor847
            (signal
             (extract 3 3 (signal-value btor545))
             (signal-state btor545)))
           (btor849
            (signal
             (extract 4 4 (signal-value btor545))
             (signal-state btor545)))
           (btor851
            (signal
             (extract 5 5 (signal-value btor545))
             (signal-state btor545)))
           (btor853
            (signal
             (extract 6 6 (signal-value btor545))
             (signal-state btor545)))
           (btor855
            (signal
             (extract 7 7 (signal-value btor545))
             (signal-state btor545)))
           (btor857
            (signal
             (extract 8 8 (signal-value btor545))
             (signal-state btor545)))
           (btor859
            (signal
             (extract 9 9 (signal-value btor545))
             (signal-state btor545)))
           (btor861
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state861")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state861")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state861")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state861")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor862
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state862")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state862")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state862")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state862")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor863
            (if (bitvector->bool (signal-value btor307)) btor862 btor861))
           (btor864
            (signal
             (bvor (signal-value btor434) (signal-value btor662))
             (list)))
           (btor865
            (if (bitvector->bool (signal-value btor673)) btor864 btor863))
           (btor867
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state867")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state867")))))
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
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor868
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state868")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state868")))))
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
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor869
            (if (bitvector->bool (signal-value btor343)) btor868 btor867))
           (btor870
            (if (bitvector->bool (signal-value btor393)) btor394 btor869))
           (btor871 (bv->signal (bv 4 (bitvector 3))))
           (btor872
            (bv->signal
             (zero-extend (signal-value btor871) (bitvector 5))
             btor871))
           (btor873
            (signal
             (bool->bitvector
              (bveq (signal-value btor57) (signal-value btor872)))
             (list)))
           (btor874
            (if (bitvector->bool (signal-value btor873)) btor394 btor870))
           (btor875
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state875")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state875")))))
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
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor876 (signal (bvnot (signal-value btor873)) (list)))
           (btor877 (bv->signal (bv 22 (bitvector 5))))
           (btor878
            (signal
             (bool->bitvector
              (bveq (signal-value btor57) (signal-value btor877)))
             (list)))
           (btor879 (signal (bvnot (signal-value btor878)) (list)))
           (btor880
            (signal
             (bvand (signal-value btor876) (signal-value btor879))
             (list)))
           (btor881
            (signal
             (bvand (signal-value btor876) (signal-value btor880))
             (list)))
           (btor882
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state882")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state882")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state882")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state882")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor883
            (signal
             (bvand (signal-value btor881) (signal-value btor882))
             (list)))
           (btor884
            (if (bitvector->bool (signal-value btor883)) btor875 btor874))
           (btor885
            (signal
             (extract 0 0 (signal-value btor884))
             (signal-state btor884)))
           (btor887
            (signal
             (extract 1 1 (signal-value btor884))
             (signal-state btor884)))
           (btor889
            (signal
             (extract 10 10 (signal-value btor884))
             (signal-state btor884)))
           (btor891
            (signal
             (extract 11 11 (signal-value btor884))
             (signal-state btor884)))
           (btor893
            (signal
             (extract 12 12 (signal-value btor884))
             (signal-state btor884)))
           (btor895
            (signal
             (extract 13 13 (signal-value btor884))
             (signal-state btor884)))
           (btor897
            (signal
             (extract 14 14 (signal-value btor884))
             (signal-state btor884)))
           (btor899
            (signal
             (extract 15 15 (signal-value btor884))
             (signal-state btor884)))
           (btor901
            (signal
             (extract 16 16 (signal-value btor884))
             (signal-state btor884)))
           (btor903
            (signal
             (extract 17 17 (signal-value btor884))
             (signal-state btor884)))
           (btor905
            (signal
             (extract 2 2 (signal-value btor884))
             (signal-state btor884)))
           (btor907
            (signal
             (extract 3 3 (signal-value btor884))
             (signal-state btor884)))
           (btor909
            (signal
             (extract 4 4 (signal-value btor884))
             (signal-state btor884)))
           (btor911
            (signal
             (extract 5 5 (signal-value btor884))
             (signal-state btor884)))
           (btor913
            (signal
             (extract 6 6 (signal-value btor884))
             (signal-state btor884)))
           (btor915
            (signal
             (extract 7 7 (signal-value btor884))
             (signal-state btor884)))
           (btor917
            (signal
             (extract 8 8 (signal-value btor884))
             (signal-state btor884)))
           (btor919
            (signal
             (extract 9 9 (signal-value btor884))
             (signal-state btor884)))
           (btor939
            (bv->signal
             (zero-extend (signal-value btor58) (bitvector 1))
             btor58))
           (btor940
            (bv->signal
             (zero-extend (signal-value btor59) (bitvector 1))
             btor59))
           (btor941
            (bv->signal
             (zero-extend (signal-value btor60) (bitvector 1))
             btor60))
           (btor942
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 1))
             btor61))
           (btor943
            (bv->signal
             (zero-extend (signal-value btor232) (bitvector 1))
             btor232))
           (btor944
            (bv->signal
             (zero-extend (signal-value btor246) (bitvector 1))
             btor246))
           (btor945
            (bv->signal
             (zero-extend (signal-value btor62) (bitvector 1))
             btor62))
           (btor946
            (bv->signal
             (zero-extend (signal-value btor205) (bitvector 1))
             btor205))
           (btor947
            (bv->signal
             (zero-extend (signal-value btor219) (bitvector 1))
             btor219))
           (btor948
            (bv->signal
             (zero-extend (signal-value btor64) (bitvector 1))
             btor64))
           (btor949
            (bv->signal
             (zero-extend (signal-value btor177) (bitvector 1))
             btor177))
           (btor950
            (bv->signal
             (zero-extend (signal-value btor191) (bitvector 1))
             btor191))
           (btor951
            (bv->signal
             (zero-extend (signal-value btor66) (bitvector 1))
             btor66))
           (btor952
            (bv->signal
             (zero-extend (signal-value btor151) (bitvector 1))
             btor151))
           (btor953
            (bv->signal
             (zero-extend (signal-value btor168) (bitvector 1))
             btor168))
           (btor954
            (bv->signal
             (zero-extend (signal-value btor68) (bitvector 1))
             btor68))
           (btor955
            (bv->signal
             (zero-extend (signal-value btor88) (bitvector 1))
             btor88))
           (btor956
            (bv->signal
             (zero-extend (signal-value btor89) (bitvector 1))
             btor89))
           (btor957
            (bv->signal
             (zero-extend (signal-value btor90) (bitvector 1))
             btor90))
           (btor958
            (bv->signal
             (zero-extend (signal-value btor91) (bitvector 1))
             btor91))
           (btor959
            (bv->signal
             (zero-extend (signal-value btor373) (bitvector 18))
             btor373))
           (btor960
            (bv->signal
             (zero-extend (signal-value btor394) (bitvector 18))
             btor394))
           (btor961
            (bv->signal
             (zero-extend (signal-value btor869) (bitvector 18))
             btor869))
           (btor962
            (bv->signal
             (zero-extend (signal-value btor869) (bitvector 18))
             btor869))
           (btor963
            (bv->signal
             (zero-extend (signal-value btor870) (bitvector 18))
             btor870))
           (btor964
            (bv->signal
             (zero-extend (signal-value btor884) (bitvector 18))
             btor884))
           (btor965
            (bv->signal
             (zero-extend (signal-value btor436) (bitvector 36))
             btor436))
           (btor966
            (bv->signal
             (zero-extend (signal-value btor344) (bitvector 18))
             btor344))
           (btor967
            (bv->signal
             (zero-extend (signal-value btor344) (bitvector 18))
             btor344))
           (btor968
            (bv->signal
             (zero-extend (signal-value btor390) (bitvector 18))
             btor390))
           (btor969
            (bv->signal
             (zero-extend (signal-value btor391) (bitvector 18))
             btor391))
           (btor970
            (bv->signal
             (zero-extend (signal-value btor601) (bitvector 18))
             btor601))
           (btor971
            (bv->signal
             (zero-extend (signal-value btor623) (bitvector 18))
             btor623))
           (btor972
            (bv->signal
             (zero-extend (signal-value btor664) (bitvector 36))
             btor664))
           (btor973
            (bv->signal
             (zero-extend (signal-value btor472) (bitvector 18))
             btor472))
           (btor974
            (bv->signal
             (zero-extend (signal-value btor472) (bitvector 18))
             btor472))
           (btor975
            (bv->signal
             (zero-extend (signal-value btor489) (bitvector 18))
             btor489))
           (btor976
            (bv->signal
             (zero-extend (signal-value btor620) (bitvector 18))
             btor620))
           (btor977
            (bv->signal
             (zero-extend (signal-value btor542) (bitvector 18))
             btor542))
           (btor978
            (bv->signal
             (zero-extend (signal-value btor545) (bitvector 18))
             btor545))
           (btor979
            (bv->signal
             (zero-extend (signal-value btor525) (bitvector 18))
             btor525))
           (btor980
            (bv->signal
             (zero-extend (signal-value btor525) (bitvector 18))
             btor525))
           (btor981
            (bv->signal
             (zero-extend (signal-value btor573) (bitvector 1))
             btor573))
           (btor982 (bv->signal (bv 16 (bitvector 5))))
           (btor983
            (signal
             (bool->bitvector
              (bveq (signal-value btor73) (signal-value btor982)))
             (list)))
           (btor984
            (if (bitvector->bool (signal-value btor983)) btor60 btor61))
           (btor985 (bv->signal (bv 15 (bitvector 4))))
           (btor986
            (bv->signal
             (zero-extend (signal-value btor985) (bitvector 5))
             btor985))
           (btor987
            (signal
             (bool->bitvector
              (bveq (signal-value btor73) (signal-value btor986)))
             (list)))
           (btor988
            (if (bitvector->bool (signal-value btor987)) btor59 btor984))
           (btor989
            (bv->signal
             (zero-extend (signal-value btor137) (bitvector 5))
             btor137))
           (btor990
            (signal
             (bool->bitvector
              (bveq (signal-value btor73) (signal-value btor989)))
             (list)))
           (btor991
            (if (bitvector->bool (signal-value btor990)) btor58 btor988))
           (btor992
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state992")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state992")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state992")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state992")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor993 (signal (bvnot (signal-value btor990)) (list)))
           (btor994 (signal (bvnot (signal-value btor987)) (list)))
           (btor995 (signal (bvnot (signal-value btor983)) (list)))
           (btor996 (bv->signal (bv 17 (bitvector 5))))
           (btor997
            (signal
             (bool->bitvector
              (bveq (signal-value btor73) (signal-value btor996)))
             (list)))
           (btor998 (signal (bvnot (signal-value btor997)) (list)))
           (btor999
            (signal
             (bvand (signal-value btor995) (signal-value btor998))
             (list)))
           (btor1000
            (signal
             (bvand (signal-value btor994) (signal-value btor999))
             (list)))
           (btor1001
            (signal
             (bvand (signal-value btor993) (signal-value btor1000))
             (list)))
           (btor1002
            (signal
             (bvand (signal-value btor995) (signal-value btor1001))
             (list)))
           (btor1003
            (signal
             (bvand (signal-value btor994) (signal-value btor1002))
             (list)))
           (btor1004
            (signal
             (bvand (signal-value btor993) (signal-value btor1003))
             (list)))
           (btor1005
            (signal
             (bvand (signal-value btor994) (signal-value btor1004))
             (list)))
           (btor1006
            (signal
             (bvand (signal-value btor993) (signal-value btor1005))
             (list)))
           (btor1007
            (signal
             (bvand (signal-value btor993) (signal-value btor1006))
             (list)))
           (btor1008
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1008")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1008")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1008")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1008")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1009
            (signal
             (bvand (signal-value btor1007) (signal-value btor1008))
             (list)))
           (btor1010
            (if (bitvector->bool (signal-value btor1009)) btor992 btor991))
           (btor1011
            (bv->signal
             (zero-extend (signal-value btor1010) (bitvector 1))
             btor1010))
           (btor1012
            (bv->signal
             (zero-extend (signal-value btor341) (bitvector 1))
             btor341))
           (btor1013 (bv->signal (bv 19 (bitvector 5))))
           (btor1014
            (signal
             (bool->bitvector
              (bveq (signal-value btor75) (signal-value btor1013)))
             (list)))
           (btor1015
            (if (bitvector->bool (signal-value btor1014)) btor90 btor91))
           (btor1016 (bv->signal (bv 18 (bitvector 5))))
           (btor1017
            (signal
             (bool->bitvector
              (bveq (signal-value btor75) (signal-value btor1016)))
             (list)))
           (btor1018
            (if (bitvector->bool (signal-value btor1017)) btor89 btor1015))
           (btor1019
            (bv->signal
             (zero-extend (signal-value btor149) (bitvector 5))
             btor149))
           (btor1020
            (signal
             (bool->bitvector
              (bveq (signal-value btor75) (signal-value btor1019)))
             (list)))
           (btor1021
            (if (bitvector->bool (signal-value btor1020)) btor88 btor1018))
           (btor1022
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1022")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1022")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1022")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1022")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1023 (signal (bvnot (signal-value btor1020)) (list)))
           (btor1024 (signal (bvnot (signal-value btor1017)) (list)))
           (btor1025 (signal (bvnot (signal-value btor1014)) (list)))
           (btor1026 (bv->signal (bv 20 (bitvector 5))))
           (btor1027
            (signal
             (bool->bitvector
              (bveq (signal-value btor75) (signal-value btor1026)))
             (list)))
           (btor1028 (signal (bvnot (signal-value btor1027)) (list)))
           (btor1029
            (signal
             (bvand (signal-value btor1025) (signal-value btor1028))
             (list)))
           (btor1030
            (signal
             (bvand (signal-value btor1024) (signal-value btor1029))
             (list)))
           (btor1031
            (signal
             (bvand (signal-value btor1023) (signal-value btor1030))
             (list)))
           (btor1032
            (signal
             (bvand (signal-value btor1025) (signal-value btor1031))
             (list)))
           (btor1033
            (signal
             (bvand (signal-value btor1024) (signal-value btor1032))
             (list)))
           (btor1034
            (signal
             (bvand (signal-value btor1023) (signal-value btor1033))
             (list)))
           (btor1035
            (signal
             (bvand (signal-value btor1024) (signal-value btor1034))
             (list)))
           (btor1036
            (signal
             (bvand (signal-value btor1023) (signal-value btor1035))
             (list)))
           (btor1037
            (signal
             (bvand (signal-value btor1023) (signal-value btor1036))
             (list)))
           (btor1038
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1038")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1038")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1038")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1038")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1039
            (signal
             (bvand (signal-value btor1037) (signal-value btor1038))
             (list)))
           (btor1040
            (if (bitvector->bool (signal-value btor1039)) btor1022 btor1021))
           (btor1041
            (bv->signal
             (zero-extend (signal-value btor1040) (bitvector 1))
             btor1040))
           (btor1042
            (bv->signal
             (zero-extend (signal-value btor1040) (bitvector 1))
             btor1040))
           (btor1043
            (signal
             (bool->bitvector
              (bveq (signal-value btor76) (signal-value btor982)))
             (list)))
           (btor1044
            (if (bitvector->bool (signal-value btor1043)) btor60 btor61))
           (btor1045
            (bv->signal
             (zero-extend (signal-value btor985) (bitvector 5))
             btor985))
           (btor1046
            (signal
             (bool->bitvector
              (bveq (signal-value btor76) (signal-value btor1045)))
             (list)))
           (btor1047
            (if (bitvector->bool (signal-value btor1046)) btor59 btor1044))
           (btor1048
            (bv->signal
             (zero-extend (signal-value btor137) (bitvector 5))
             btor137))
           (btor1049
            (signal
             (bool->bitvector
              (bveq (signal-value btor76) (signal-value btor1048)))
             (list)))
           (btor1050
            (if (bitvector->bool (signal-value btor1049)) btor58 btor1047))
           (btor1051
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1051")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1051")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1051")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1051")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1052 (signal (bvnot (signal-value btor1049)) (list)))
           (btor1053 (signal (bvnot (signal-value btor1046)) (list)))
           (btor1054 (signal (bvnot (signal-value btor1043)) (list)))
           (btor1055
            (signal
             (bool->bitvector
              (bveq (signal-value btor76) (signal-value btor996)))
             (list)))
           (btor1056 (signal (bvnot (signal-value btor1055)) (list)))
           (btor1057
            (signal
             (bvand (signal-value btor1054) (signal-value btor1056))
             (list)))
           (btor1058
            (signal
             (bvand (signal-value btor1053) (signal-value btor1057))
             (list)))
           (btor1059
            (signal
             (bvand (signal-value btor1052) (signal-value btor1058))
             (list)))
           (btor1060
            (signal
             (bvand (signal-value btor1054) (signal-value btor1059))
             (list)))
           (btor1061
            (signal
             (bvand (signal-value btor1053) (signal-value btor1060))
             (list)))
           (btor1062
            (signal
             (bvand (signal-value btor1052) (signal-value btor1061))
             (list)))
           (btor1063
            (signal
             (bvand (signal-value btor1053) (signal-value btor1062))
             (list)))
           (btor1064
            (signal
             (bvand (signal-value btor1052) (signal-value btor1063))
             (list)))
           (btor1065
            (signal
             (bvand (signal-value btor1052) (signal-value btor1064))
             (list)))
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
            (signal
             (bvand (signal-value btor1065) (signal-value btor1066))
             (list)))
           (btor1068
            (if (bitvector->bool (signal-value btor1067)) btor1051 btor1050))
           (btor1069
            (bv->signal
             (zero-extend (signal-value btor1068) (bitvector 1))
             btor1068))
           (btor1070
            (bv->signal
             (zero-extend (signal-value btor469) (bitvector 1))
             btor469))
           (btor1071
            (signal
             (bool->bitvector
              (bveq (signal-value btor78) (signal-value btor1013)))
             (list)))
           (btor1072
            (if (bitvector->bool (signal-value btor1071)) btor90 btor91))
           (btor1073
            (signal
             (bool->bitvector
              (bveq (signal-value btor78) (signal-value btor1016)))
             (list)))
           (btor1074
            (if (bitvector->bool (signal-value btor1073)) btor89 btor1072))
           (btor1075
            (bv->signal
             (zero-extend (signal-value btor149) (bitvector 5))
             btor149))
           (btor1076
            (signal
             (bool->bitvector
              (bveq (signal-value btor78) (signal-value btor1075)))
             (list)))
           (btor1077
            (if (bitvector->bool (signal-value btor1076)) btor88 btor1074))
           (btor1078
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1078")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1078")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1078")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1078")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1079 (signal (bvnot (signal-value btor1076)) (list)))
           (btor1080 (signal (bvnot (signal-value btor1073)) (list)))
           (btor1081 (signal (bvnot (signal-value btor1071)) (list)))
           (btor1082
            (signal
             (bool->bitvector
              (bveq (signal-value btor78) (signal-value btor1026)))
             (list)))
           (btor1083 (signal (bvnot (signal-value btor1082)) (list)))
           (btor1084
            (signal
             (bvand (signal-value btor1081) (signal-value btor1083))
             (list)))
           (btor1085
            (signal
             (bvand (signal-value btor1080) (signal-value btor1084))
             (list)))
           (btor1086
            (signal
             (bvand (signal-value btor1079) (signal-value btor1085))
             (list)))
           (btor1087
            (signal
             (bvand (signal-value btor1081) (signal-value btor1086))
             (list)))
           (btor1088
            (signal
             (bvand (signal-value btor1080) (signal-value btor1087))
             (list)))
           (btor1089
            (signal
             (bvand (signal-value btor1079) (signal-value btor1088))
             (list)))
           (btor1090
            (signal
             (bvand (signal-value btor1080) (signal-value btor1089))
             (list)))
           (btor1091
            (signal
             (bvand (signal-value btor1079) (signal-value btor1090))
             (list)))
           (btor1092
            (signal
             (bvand (signal-value btor1079) (signal-value btor1091))
             (list)))
           (btor1093
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1093")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1093")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1093")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1093")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1094
            (signal
             (bvand (signal-value btor1092) (signal-value btor1093))
             (list)))
           (btor1095
            (if (bitvector->bool (signal-value btor1094)) btor1078 btor1077))
           (btor1096
            (bv->signal
             (zero-extend (signal-value btor1095) (bitvector 1))
             btor1095))
           (btor1097
            (bv->signal
             (zero-extend (signal-value btor1095) (bitvector 1))
             btor1095))
           (btor1098
            (signal
             (bool->bitvector
              (bveq (signal-value btor79) (signal-value btor982)))
             (list)))
           (btor1099
            (if (bitvector->bool (signal-value btor1098)) btor60 btor61))
           (btor1100
            (bv->signal
             (zero-extend (signal-value btor985) (bitvector 5))
             btor985))
           (btor1101
            (signal
             (bool->bitvector
              (bveq (signal-value btor79) (signal-value btor1100)))
             (list)))
           (btor1102
            (if (bitvector->bool (signal-value btor1101)) btor59 btor1099))
           (btor1103
            (bv->signal
             (zero-extend (signal-value btor137) (bitvector 5))
             btor137))
           (btor1104
            (signal
             (bool->bitvector
              (bveq (signal-value btor79) (signal-value btor1103)))
             (list)))
           (btor1105
            (if (bitvector->bool (signal-value btor1104)) btor58 btor1102))
           (btor1106
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1106")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1106")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1106")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1106")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1107 (signal (bvnot (signal-value btor1104)) (list)))
           (btor1108 (signal (bvnot (signal-value btor1101)) (list)))
           (btor1109 (signal (bvnot (signal-value btor1098)) (list)))
           (btor1110
            (signal
             (bool->bitvector
              (bveq (signal-value btor79) (signal-value btor996)))
             (list)))
           (btor1111 (signal (bvnot (signal-value btor1110)) (list)))
           (btor1112
            (signal
             (bvand (signal-value btor1109) (signal-value btor1111))
             (list)))
           (btor1113
            (signal
             (bvand (signal-value btor1108) (signal-value btor1112))
             (list)))
           (btor1114
            (signal
             (bvand (signal-value btor1107) (signal-value btor1113))
             (list)))
           (btor1115
            (signal
             (bvand (signal-value btor1109) (signal-value btor1114))
             (list)))
           (btor1116
            (signal
             (bvand (signal-value btor1108) (signal-value btor1115))
             (list)))
           (btor1117
            (signal
             (bvand (signal-value btor1107) (signal-value btor1116))
             (list)))
           (btor1118
            (signal
             (bvand (signal-value btor1108) (signal-value btor1117))
             (list)))
           (btor1119
            (signal
             (bvand (signal-value btor1107) (signal-value btor1118))
             (list)))
           (btor1120
            (signal
             (bvand (signal-value btor1107) (signal-value btor1119))
             (list)))
           (btor1121
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1121")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1121")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1121")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1121")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1122
            (signal
             (bvand (signal-value btor1120) (signal-value btor1121))
             (list)))
           (btor1123
            (if (bitvector->bool (signal-value btor1122)) btor1106 btor1105))
           (btor1124
            (bv->signal
             (zero-extend (signal-value btor1123) (bitvector 1))
             btor1123))
           (btor1125
            (bv->signal
             (zero-extend (signal-value btor522) (bitvector 1))
             btor522))
           (btor1126
            (signal
             (bool->bitvector
              (bveq (signal-value btor81) (signal-value btor1013)))
             (list)))
           (btor1127
            (if (bitvector->bool (signal-value btor1126)) btor90 btor91))
           (btor1128
            (signal
             (bool->bitvector
              (bveq (signal-value btor81) (signal-value btor1016)))
             (list)))
           (btor1129
            (if (bitvector->bool (signal-value btor1128)) btor89 btor1127))
           (btor1130
            (bv->signal
             (zero-extend (signal-value btor149) (bitvector 5))
             btor149))
           (btor1131
            (signal
             (bool->bitvector
              (bveq (signal-value btor81) (signal-value btor1130)))
             (list)))
           (btor1132
            (if (bitvector->bool (signal-value btor1131)) btor88 btor1129))
           (btor1133
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1133")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1133")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1133")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1133")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1134 (signal (bvnot (signal-value btor1131)) (list)))
           (btor1135 (signal (bvnot (signal-value btor1128)) (list)))
           (btor1136 (signal (bvnot (signal-value btor1126)) (list)))
           (btor1137
            (signal
             (bool->bitvector
              (bveq (signal-value btor81) (signal-value btor1026)))
             (list)))
           (btor1138 (signal (bvnot (signal-value btor1137)) (list)))
           (btor1139
            (signal
             (bvand (signal-value btor1136) (signal-value btor1138))
             (list)))
           (btor1140
            (signal
             (bvand (signal-value btor1135) (signal-value btor1139))
             (list)))
           (btor1141
            (signal
             (bvand (signal-value btor1134) (signal-value btor1140))
             (list)))
           (btor1142
            (signal
             (bvand (signal-value btor1136) (signal-value btor1141))
             (list)))
           (btor1143
            (signal
             (bvand (signal-value btor1135) (signal-value btor1142))
             (list)))
           (btor1144
            (signal
             (bvand (signal-value btor1134) (signal-value btor1143))
             (list)))
           (btor1145
            (signal
             (bvand (signal-value btor1135) (signal-value btor1144))
             (list)))
           (btor1146
            (signal
             (bvand (signal-value btor1134) (signal-value btor1145))
             (list)))
           (btor1147
            (signal
             (bvand (signal-value btor1134) (signal-value btor1146))
             (list)))
           (btor1148
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1148")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1148")))))
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
            (signal
             (bvand (signal-value btor1147) (signal-value btor1148))
             (list)))
           (btor1150
            (if (bitvector->bool (signal-value btor1149)) btor1133 btor1132))
           (btor1151
            (bv->signal
             (zero-extend (signal-value btor1150) (bitvector 1))
             btor1150))
           (btor1152
            (bv->signal
             (zero-extend (signal-value btor1150) (bitvector 1))
             btor1150))
           (btor1153
            (signal
             (bool->bitvector
              (bveq (signal-value btor82) (signal-value btor982)))
             (list)))
           (btor1154
            (if (bitvector->bool (signal-value btor1153)) btor60 btor61))
           (btor1155
            (bv->signal
             (zero-extend (signal-value btor985) (bitvector 5))
             btor985))
           (btor1156
            (signal
             (bool->bitvector
              (bveq (signal-value btor82) (signal-value btor1155)))
             (list)))
           (btor1157
            (if (bitvector->bool (signal-value btor1156)) btor59 btor1154))
           (btor1158
            (bv->signal
             (zero-extend (signal-value btor137) (bitvector 5))
             btor137))
           (btor1159
            (signal
             (bool->bitvector
              (bveq (signal-value btor82) (signal-value btor1158)))
             (list)))
           (btor1160
            (if (bitvector->bool (signal-value btor1159)) btor58 btor1157))
           (btor1161
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1161")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1161")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1161")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1161")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1162 (signal (bvnot (signal-value btor1159)) (list)))
           (btor1163 (signal (bvnot (signal-value btor1156)) (list)))
           (btor1164 (signal (bvnot (signal-value btor1153)) (list)))
           (btor1165
            (signal
             (bool->bitvector
              (bveq (signal-value btor82) (signal-value btor996)))
             (list)))
           (btor1166 (signal (bvnot (signal-value btor1165)) (list)))
           (btor1167
            (signal
             (bvand (signal-value btor1164) (signal-value btor1166))
             (list)))
           (btor1168
            (signal
             (bvand (signal-value btor1163) (signal-value btor1167))
             (list)))
           (btor1169
            (signal
             (bvand (signal-value btor1162) (signal-value btor1168))
             (list)))
           (btor1170
            (signal
             (bvand (signal-value btor1164) (signal-value btor1169))
             (list)))
           (btor1171
            (signal
             (bvand (signal-value btor1163) (signal-value btor1170))
             (list)))
           (btor1172
            (signal
             (bvand (signal-value btor1162) (signal-value btor1171))
             (list)))
           (btor1173
            (signal
             (bvand (signal-value btor1163) (signal-value btor1172))
             (list)))
           (btor1174
            (signal
             (bvand (signal-value btor1162) (signal-value btor1173))
             (list)))
           (btor1175
            (signal
             (bvand (signal-value btor1162) (signal-value btor1174))
             (list)))
           (btor1176
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1176")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1176")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1176")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1176")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1177
            (signal
             (bvand (signal-value btor1175) (signal-value btor1176))
             (list)))
           (btor1178
            (if (bitvector->bool (signal-value btor1177)) btor1161 btor1160))
           (btor1179
            (bv->signal
             (zero-extend (signal-value btor1178) (bitvector 1))
             btor1178))
           (btor1180
            (bv->signal
             (zero-extend (signal-value btor270) (bitvector 1))
             btor270))
           (btor1181
            (signal
             (bool->bitvector
              (bveq (signal-value btor84) (signal-value btor1013)))
             (list)))
           (btor1182
            (if (bitvector->bool (signal-value btor1181)) btor90 btor91))
           (btor1183
            (signal
             (bool->bitvector
              (bveq (signal-value btor84) (signal-value btor1016)))
             (list)))
           (btor1184
            (if (bitvector->bool (signal-value btor1183)) btor89 btor1182))
           (btor1185
            (bv->signal
             (zero-extend (signal-value btor149) (bitvector 5))
             btor149))
           (btor1186
            (signal
             (bool->bitvector
              (bveq (signal-value btor84) (signal-value btor1185)))
             (list)))
           (btor1187
            (if (bitvector->bool (signal-value btor1186)) btor88 btor1184))
           (btor1188
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1188")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1188")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1188")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1188")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1189 (signal (bvnot (signal-value btor1186)) (list)))
           (btor1190 (signal (bvnot (signal-value btor1183)) (list)))
           (btor1191 (signal (bvnot (signal-value btor1181)) (list)))
           (btor1192
            (signal
             (bool->bitvector
              (bveq (signal-value btor84) (signal-value btor1026)))
             (list)))
           (btor1193 (signal (bvnot (signal-value btor1192)) (list)))
           (btor1194
            (signal
             (bvand (signal-value btor1191) (signal-value btor1193))
             (list)))
           (btor1195
            (signal
             (bvand (signal-value btor1190) (signal-value btor1194))
             (list)))
           (btor1196
            (signal
             (bvand (signal-value btor1189) (signal-value btor1195))
             (list)))
           (btor1197
            (signal
             (bvand (signal-value btor1191) (signal-value btor1196))
             (list)))
           (btor1198
            (signal
             (bvand (signal-value btor1190) (signal-value btor1197))
             (list)))
           (btor1199
            (signal
             (bvand (signal-value btor1189) (signal-value btor1198))
             (list)))
           (btor1200
            (signal
             (bvand (signal-value btor1190) (signal-value btor1199))
             (list)))
           (btor1201
            (signal
             (bvand (signal-value btor1189) (signal-value btor1200))
             (list)))
           (btor1202
            (signal
             (bvand (signal-value btor1189) (signal-value btor1201))
             (list)))
           (btor1203
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1203")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1203")))))
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
           (btor1204
            (signal
             (bvand (signal-value btor1202) (signal-value btor1203))
             (list)))
           (btor1205
            (if (bitvector->bool (signal-value btor1204)) btor1188 btor1187))
           (btor1206
            (bv->signal
             (zero-extend (signal-value btor1205) (bitvector 1))
             btor1205))
           (btor1207
            (bv->signal
             (zero-extend (signal-value btor1205) (bitvector 1))
             btor1205))
           (btor1208
            (bv->signal
             (zero-extend (signal-value btor680) (bitvector 36))
             btor680))
           (btor1209
            (bv->signal
             (zero-extend (signal-value btor671) (bitvector 36))
             btor671))
           (btor1210
            (bv->signal
             (zero-extend (signal-value btor308) (bitvector 36))
             btor308))
           (btor1211
            (bv->signal
             (zero-extend (signal-value btor273) (bitvector 36))
             btor273))
           (btor1212
            (bv->signal
             (zero-extend (signal-value btor273) (bitvector 36))
             btor273))
           (btor1213
            (bv->signal
             (zero-extend (signal-value btor308) (bitvector 36))
             btor308))
           (btor1214
            (bv->signal
             (zero-extend (signal-value btor677) (bitvector 36))
             btor677))
           (btor1215
            (bv->signal
             (zero-extend (signal-value btor674) (bitvector 36))
             btor674))
           (btor1216
            (signal
             (bool->bitvector
              (bveq (signal-value btor85) (signal-value btor982)))
             (list)))
           (btor1217
            (if (bitvector->bool (signal-value btor1216)) btor60 btor61))
           (btor1218
            (bv->signal
             (zero-extend (signal-value btor985) (bitvector 5))
             btor985))
           (btor1219
            (signal
             (bool->bitvector
              (bveq (signal-value btor85) (signal-value btor1218)))
             (list)))
           (btor1220
            (if (bitvector->bool (signal-value btor1219)) btor59 btor1217))
           (btor1221
            (bv->signal
             (zero-extend (signal-value btor137) (bitvector 5))
             btor137))
           (btor1222
            (signal
             (bool->bitvector
              (bveq (signal-value btor85) (signal-value btor1221)))
             (list)))
           (btor1223
            (if (bitvector->bool (signal-value btor1222)) btor58 btor1220))
           (btor1224
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1224")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1224")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1224")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1224")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1225 (signal (bvnot (signal-value btor1222)) (list)))
           (btor1226 (signal (bvnot (signal-value btor1219)) (list)))
           (btor1227 (signal (bvnot (signal-value btor1216)) (list)))
           (btor1228
            (signal
             (bool->bitvector
              (bveq (signal-value btor85) (signal-value btor996)))
             (list)))
           (btor1229 (signal (bvnot (signal-value btor1228)) (list)))
           (btor1230
            (signal
             (bvand (signal-value btor1227) (signal-value btor1229))
             (list)))
           (btor1231
            (signal
             (bvand (signal-value btor1226) (signal-value btor1230))
             (list)))
           (btor1232
            (signal
             (bvand (signal-value btor1225) (signal-value btor1231))
             (list)))
           (btor1233
            (signal
             (bvand (signal-value btor1227) (signal-value btor1232))
             (list)))
           (btor1234
            (signal
             (bvand (signal-value btor1226) (signal-value btor1233))
             (list)))
           (btor1235
            (signal
             (bvand (signal-value btor1225) (signal-value btor1234))
             (list)))
           (btor1236
            (signal
             (bvand (signal-value btor1226) (signal-value btor1235))
             (list)))
           (btor1237
            (signal
             (bvand (signal-value btor1225) (signal-value btor1236))
             (list)))
           (btor1238
            (signal
             (bvand (signal-value btor1225) (signal-value btor1237))
             (list)))
           (btor1239
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1239")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1239")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1239")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1239")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1240
            (signal
             (bvand (signal-value btor1238) (signal-value btor1239))
             (list)))
           (btor1241
            (if (bitvector->bool (signal-value btor1240)) btor1224 btor1223))
           (btor1242
            (bv->signal
             (zero-extend (signal-value btor1241) (bitvector 1))
             btor1241))
           (btor1243
            (bv->signal
             (zero-extend (signal-value btor305) (bitvector 1))
             btor305))
           (btor1244
            (signal
             (bool->bitvector
              (bveq (signal-value btor87) (signal-value btor1013)))
             (list)))
           (btor1245
            (if (bitvector->bool (signal-value btor1244)) btor90 btor91))
           (btor1246
            (signal
             (bool->bitvector
              (bveq (signal-value btor87) (signal-value btor1016)))
             (list)))
           (btor1247
            (if (bitvector->bool (signal-value btor1246)) btor89 btor1245))
           (btor1248
            (bv->signal
             (zero-extend (signal-value btor149) (bitvector 5))
             btor149))
           (btor1249
            (signal
             (bool->bitvector
              (bveq (signal-value btor87) (signal-value btor1248)))
             (list)))
           (btor1250
            (if (bitvector->bool (signal-value btor1249)) btor88 btor1247))
           (btor1251
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1251")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1251")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1251")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1251")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1252 (signal (bvnot (signal-value btor1249)) (list)))
           (btor1253 (signal (bvnot (signal-value btor1246)) (list)))
           (btor1254 (signal (bvnot (signal-value btor1244)) (list)))
           (btor1255
            (signal
             (bool->bitvector
              (bveq (signal-value btor87) (signal-value btor1026)))
             (list)))
           (btor1256 (signal (bvnot (signal-value btor1255)) (list)))
           (btor1257
            (signal
             (bvand (signal-value btor1254) (signal-value btor1256))
             (list)))
           (btor1258
            (signal
             (bvand (signal-value btor1253) (signal-value btor1257))
             (list)))
           (btor1259
            (signal
             (bvand (signal-value btor1252) (signal-value btor1258))
             (list)))
           (btor1260
            (signal
             (bvand (signal-value btor1254) (signal-value btor1259))
             (list)))
           (btor1261
            (signal
             (bvand (signal-value btor1253) (signal-value btor1260))
             (list)))
           (btor1262
            (signal
             (bvand (signal-value btor1252) (signal-value btor1261))
             (list)))
           (btor1263
            (signal
             (bvand (signal-value btor1253) (signal-value btor1262))
             (list)))
           (btor1264
            (signal
             (bvand (signal-value btor1252) (signal-value btor1263))
             (list)))
           (btor1265
            (signal
             (bvand (signal-value btor1252) (signal-value btor1264))
             (list)))
           (btor1266
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1266")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1266")))))
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
           (btor1267
            (signal
             (bvand (signal-value btor1265) (signal-value btor1266))
             (list)))
           (btor1268
            (if (bitvector->bool (signal-value btor1267)) btor1251 btor1250))
           (btor1269
            (bv->signal
             (zero-extend (signal-value btor1268) (bitvector 1))
             btor1268))
           (btor1270
            (bv->signal
             (zero-extend (signal-value btor1268) (bitvector 1))
             btor1268))
           (btor1271
            (bv->signal
             (zero-extend (signal-value btor394) (bitvector 18))
             btor394))
           (btor1272
            (bv->signal
             (zero-extend (signal-value btor545) (bitvector 18))
             btor545))
           (btor1273
            (bv->signal
             (zero-extend (signal-value btor434) (bitvector 1))
             btor434))
           (btor1274
            (bv->signal
             (zero-extend (signal-value btor433) (bitvector 1))
             btor433))
           (btor1275
            (bv->signal
             (zero-extend (signal-value btor433) (bitvector 1))
             btor433))
           (btor1276
            (bv->signal
             (zero-extend (signal-value btor92) (bitvector 1))
             btor92))
           (btor1277
            (bv->signal
             (zero-extend (signal-value btor863) (bitvector 1))
             btor863))
           (btor1278
            (bv->signal
             (zero-extend (signal-value btor864) (bitvector 1))
             btor864))
           (btor1279
            (bv->signal
             (zero-extend (signal-value btor863) (bitvector 1))
             btor863))
           (btor1280
            (bv->signal
             (zero-extend (signal-value btor662) (bitvector 1))
             btor662))
           (btor1281
            (bv->signal
             (zero-extend (signal-value btor661) (bitvector 1))
             btor661))
           (btor1282
            (bv->signal
             (zero-extend (signal-value btor661) (bitvector 1))
             btor661))
           (btor1283
            (bv->signal
             (zero-extend (signal-value btor93) (bitvector 1))
             btor93))
           (btor1284
            (bv->signal
             (zero-extend (signal-value btor865) (bitvector 1))
             btor865))
           (btor1285
            (bv->signal
             (zero-extend (signal-value btor94) (bitvector 1))
             btor94))
           (btor1286
            (bv->signal
             (zero-extend (signal-value btor95) (bitvector 1))
             btor95))
           (btor1287
            (bv->signal
             (zero-extend (signal-value btor884) (bitvector 18))
             btor884))
           (btor1288
            (bv->signal
             (zero-extend (signal-value btor623) (bitvector 18))
             btor623))
           (btor1290
            (if (bitvector->bool (signal-value btor1178)) btor674 btor273))
           (btor1291
            (if (bitvector->bool (signal-value btor1205)) btor134 btor1290))
           (btor1295 (signal (bvnot (signal-value btor151)) (list)))
           (btor1296
            (if (bitvector->bool (signal-value btor154)) btor1295 btor151))
           (btor1302 (signal (bvnot (signal-value btor177)) (list)))
           (btor1303
            (if (bitvector->bool (signal-value btor179)) btor1302 btor177))
           (btor1309 (signal (bvnot (signal-value btor205)) (list)))
           (btor1310
            (if (bitvector->bool (signal-value btor207)) btor1309 btor205))
           (btor1316 (signal (bvnot (signal-value btor232)) (list)))
           (btor1317
            (if (bitvector->bool (signal-value btor234)) btor1316 btor232))
           (btor1325
            (if (bitvector->bool (signal-value btor1241)) btor671 btor308))
           (btor1326
            (if (bitvector->bool (signal-value btor1268)) btor134 btor1325))
           (btor1332
            (if (bitvector->bool (signal-value btor1010)) btor391 btor344))
           (btor1333
            (if (bitvector->bool (signal-value btor1040)) btor395 btor1332))
           (btor1339
            (if (bitvector->bool (signal-value btor1010)) btor92 btor433))
           (btor1340
            (if (bitvector->bool (signal-value btor1040)) btor140 btor1339))
           (btor1343
            (if (bitvector->bool (signal-value btor1068)) btor620 btor472))
           (btor1344
            (if (bitvector->bool (signal-value btor1095)) btor395 btor1343))
           (btor1350
            (if (bitvector->bool (signal-value btor1123)) btor542 btor525))
           (btor1351
            (if (bitvector->bool (signal-value btor1150)) btor395 btor1350))
           (btor1361
            (if (bitvector->bool (signal-value btor1068)) btor93 btor661))
           (btor1362
            (if (bitvector->bool (signal-value btor1095)) btor140 btor1361))
           (btor1365
            (if (bitvector->bool (signal-value btor1241)) btor864 btor863))
           (btor1366
            (if (bitvector->bool (signal-value btor1268)) btor140 btor1365))
           (btor1369
            (if (bitvector->bool (signal-value btor1010)) btor394 btor869))
           (btor1370
            (if (bitvector->bool (signal-value btor1040)) btor395 btor1369))
           (output-state
            (remove-duplicates
             (append
              (append
               (list
                (cons
                 (string->symbol (string-append name "state1266"))
                 (signal-value btor1265)))
               (append
                (list
                 (cons
                  (string->symbol (string-append name "state1251"))
                  (signal-value btor1268)))
                (append
                 (list
                  (cons
                   (string->symbol (string-append name "state1239"))
                   (signal-value btor1238)))
                 (append
                  (list
                   (cons
                    (string->symbol (string-append name "state1224"))
                    (signal-value btor1241)))
                  (append
                   (list
                    (cons
                     (string->symbol (string-append name "state1203"))
                     (signal-value btor1202)))
                   (append
                    (list
                     (cons
                      (string->symbol (string-append name "state1188"))
                      (signal-value btor1205)))
                    (append
                     (list
                      (cons
                       (string->symbol (string-append name "state1176"))
                       (signal-value btor1175)))
                     (append
                      (list
                       (cons
                        (string->symbol (string-append name "state1161"))
                        (signal-value btor1178)))
                      (append
                       (list
                        (cons
                         (string->symbol (string-append name "state1148"))
                         (signal-value btor1147)))
                       (append
                        (list
                         (cons
                          (string->symbol (string-append name "state1133"))
                          (signal-value btor1150)))
                        (append
                         (list
                          (cons
                           (string->symbol (string-append name "state1121"))
                           (signal-value btor1120)))
                         (append
                          (list
                           (cons
                            (string->symbol (string-append name "state1106"))
                            (signal-value btor1123)))
                          (append
                           (list
                            (cons
                             (string->symbol (string-append name "state1093"))
                             (signal-value btor1092)))
                           (append
                            (list
                             (cons
                              (string->symbol (string-append name "state1078"))
                              (signal-value btor1095)))
                            (append
                             (list
                              (cons
                               (string->symbol
                                (string-append name "state1066"))
                               (signal-value btor1065)))
                             (append
                              (list
                               (cons
                                (string->symbol
                                 (string-append name "state1051"))
                                (signal-value btor1068)))
                              (append
                               (list
                                (cons
                                 (string->symbol
                                  (string-append name "state1038"))
                                 (signal-value btor1037)))
                               (append
                                (list
                                 (cons
                                  (string->symbol
                                   (string-append name "state1022"))
                                  (signal-value btor1040)))
                                (append
                                 (list
                                  (cons
                                   (string->symbol
                                    (string-append name "state1008"))
                                   (signal-value btor1007)))
                                 (append
                                  (list
                                   (cons
                                    (string->symbol
                                     (string-append name "state992"))
                                    (signal-value btor1010)))
                                  (append
                                   (list
                                    (cons
                                     (string->symbol
                                      (string-append name "state882"))
                                     (signal-value btor881)))
                                   (append
                                    (list
                                     (cons
                                      (string->symbol
                                       (string-append name "state875"))
                                      (signal-value btor884)))
                                    (append
                                     (list
                                      (cons
                                       (string->symbol
                                        (string-append name "state868"))
                                       (signal-value btor1370)))
                                     (append
                                      (list
                                       (cons
                                        (string->symbol
                                         (string-append name "state867"))
                                        (signal-value btor869)))
                                      (append
                                       (list
                                        (cons
                                         (string->symbol
                                          (string-append name "state862"))
                                         (signal-value btor1366)))
                                       (append
                                        (list
                                         (cons
                                          (string->symbol
                                           (string-append name "state861"))
                                          (signal-value btor863)))
                                        (append
                                         (list
                                          (cons
                                           (string->symbol
                                            (string-append name "state660"))
                                           (signal-value btor1362)))
                                         (append
                                          (list
                                           (cons
                                            (string->symbol
                                             (string-append name "state659"))
                                            (signal-value btor661)))
                                          (append
                                           (list
                                            (cons
                                             (string->symbol
                                              (string-append name "state618"))
                                             (signal-value btor617)))
                                           (append
                                            (list
                                             (cons
                                              (string->symbol
                                               (string-append name "state607"))
                                              (signal-value btor620)))
                                            (append
                                             (list
                                              (cons
                                               (string->symbol
                                                (string-append
                                                 name
                                                 "state571"))
                                               (signal-value btor570)))
                                             (append
                                              (list
                                               (cons
                                                (string->symbol
                                                 (string-append
                                                  name
                                                  "state558"))
                                                (signal-value btor573)))
                                              (append
                                               (list
                                                (cons
                                                 (string->symbol
                                                  (string-append
                                                   name
                                                   "state520"))
                                                 (signal-value btor519)))
                                               (append
                                                (list
                                                 (cons
                                                  (string->symbol
                                                   (string-append
                                                    name
                                                    "state503"))
                                                  (signal-value btor522)))
                                                (append
                                                 (list
                                                  (cons
                                                   (string->symbol
                                                    (string-append
                                                     name
                                                     "state492"))
                                                   (signal-value btor522)))
                                                 (append
                                                  (list
                                                   (cons
                                                    (string->symbol
                                                     (string-append
                                                      name
                                                      "state491"))
                                                    (signal-value btor1351)))
                                                  (append
                                                   (list
                                                    (cons
                                                     (string->symbol
                                                      (string-append
                                                       name
                                                       "state490"))
                                                     (signal-value btor525)))
                                                   (append
                                                    (list
                                                     (cons
                                                      (string->symbol
                                                       (string-append
                                                        name
                                                        "state467"))
                                                      (signal-value btor466)))
                                                    (append
                                                     (list
                                                      (cons
                                                       (string->symbol
                                                        (string-append
                                                         name
                                                         "state450"))
                                                       (signal-value btor469)))
                                                     (append
                                                      (list
                                                       (cons
                                                        (string->symbol
                                                         (string-append
                                                          name
                                                          "state439"))
                                                        (signal-value
                                                         btor469)))
                                                      (append
                                                       (list
                                                        (cons
                                                         (string->symbol
                                                          (string-append
                                                           name
                                                           "state438"))
                                                         (signal-value
                                                          btor1344)))
                                                       (append
                                                        (list
                                                         (cons
                                                          (string->symbol
                                                           (string-append
                                                            name
                                                            "state437"))
                                                          (signal-value
                                                           btor472)))
                                                        (append
                                                         (list
                                                          (cons
                                                           (string->symbol
                                                            (string-append
                                                             name
                                                             "state432"))
                                                           (signal-value
                                                            btor1340)))
                                                         (append
                                                          (list
                                                           (cons
                                                            (string->symbol
                                                             (string-append
                                                              name
                                                              "state431"))
                                                            (signal-value
                                                             btor433)))
                                                          (append
                                                           (list
                                                            (cons
                                                             (string->symbol
                                                              (string-append
                                                               name
                                                               "state339"))
                                                             (signal-value
                                                              btor338)))
                                                           (append
                                                            (list
                                                             (cons
                                                              (string->symbol
                                                               (string-append
                                                                name
                                                                "state323"))
                                                              (signal-value
                                                               btor341)))
                                                            (append
                                                             (list
                                                              (cons
                                                               (string->symbol
                                                                (string-append
                                                                 name
                                                                 "state312"))
                                                               (signal-value
                                                                btor341)))
                                                             (append
                                                              (list
                                                               (cons
                                                                (string->symbol
                                                                 (string-append
                                                                  name
                                                                  "state311"))
                                                                (signal-value
                                                                 btor1333)))
                                                              (append
                                                               (list
                                                                (cons
                                                                 (string->symbol
                                                                  (string-append
                                                                   name
                                                                   "state310"))
                                                                 (signal-value
                                                                  btor344)))
                                                               (append
                                                                (list
                                                                 (cons
                                                                  (string->symbol
                                                                   (string-append
                                                                    name
                                                                    "state303"))
                                                                  (signal-value
                                                                   btor302)))
                                                                (append
                                                                 (list
                                                                  (cons
                                                                   (string->symbol
                                                                    (string-append
                                                                     name
                                                                     "state287"))
                                                                   (signal-value
                                                                    btor305)))
                                                                 (append
                                                                  (list
                                                                   (cons
                                                                    (string->symbol
                                                                     (string-append
                                                                      name
                                                                      "state276"))
                                                                    (signal-value
                                                                     btor305)))
                                                                  (append
                                                                   (list
                                                                    (cons
                                                                     (string->symbol
                                                                      (string-append
                                                                       name
                                                                       "state275"))
                                                                     (signal-value
                                                                      btor1326)))
                                                                   (append
                                                                    (list
                                                                     (cons
                                                                      (string->symbol
                                                                       (string-append
                                                                        name
                                                                        "state274"))
                                                                      (signal-value
                                                                       btor308)))
                                                                    (append
                                                                     (list
                                                                      (cons
                                                                       (string->symbol
                                                                        (string-append
                                                                         name
                                                                         "state268"))
                                                                       (signal-value
                                                                        btor267)))
                                                                     (append
                                                                      (list
                                                                       (cons
                                                                        (string->symbol
                                                                         (string-append
                                                                          name
                                                                          "state251"))
                                                                        (signal-value
                                                                         btor270)))
                                                                      (append
                                                                       (list
                                                                        (cons
                                                                         (string->symbol
                                                                          (string-append
                                                                           name
                                                                           "state244"))
                                                                         (signal-value
                                                                          btor243)))
                                                                       (append
                                                                        (list
                                                                         (cons
                                                                          (string->symbol
                                                                           (string-append
                                                                            name
                                                                            "state236"))
                                                                          (signal-value
                                                                           btor246)))
                                                                        (append
                                                                         (list
                                                                          (cons
                                                                           (string->symbol
                                                                            (string-append
                                                                             name
                                                                             "state228"))
                                                                           (signal-value
                                                                            btor62)))
                                                                         (append
                                                                          (list
                                                                           (cons
                                                                            (string->symbol
                                                                             (string-append
                                                                              name
                                                                              "state226"))
                                                                            (signal-value
                                                                             btor1317)))
                                                                          (append
                                                                           (list
                                                                            (cons
                                                                             (string->symbol
                                                                              (string-append
                                                                               name
                                                                               "state224"))
                                                                             (signal-value
                                                                              btor232)))
                                                                           (append
                                                                            (list
                                                                             (cons
                                                                              (string->symbol
                                                                               (string-append
                                                                                name
                                                                                "state217"))
                                                                              (signal-value
                                                                               btor216)))
                                                                            (append
                                                                             (list
                                                                              (cons
                                                                               (string->symbol
                                                                                (string-append
                                                                                 name
                                                                                 "state209"))
                                                                               (signal-value
                                                                                btor219)))
                                                                             (append
                                                                              (list
                                                                               (cons
                                                                                (string->symbol
                                                                                 (string-append
                                                                                  name
                                                                                  "state201"))
                                                                                (signal-value
                                                                                 btor64)))
                                                                              (append
                                                                               (list
                                                                                (cons
                                                                                 (string->symbol
                                                                                  (string-append
                                                                                   name
                                                                                   "state199"))
                                                                                 (signal-value
                                                                                  btor1310)))
                                                                               (append
                                                                                (list
                                                                                 (cons
                                                                                  (string->symbol
                                                                                   (string-append
                                                                                    name
                                                                                    "state197"))
                                                                                  (signal-value
                                                                                   btor205)))
                                                                                (append
                                                                                 (list
                                                                                  (cons
                                                                                   (string->symbol
                                                                                    (string-append
                                                                                     name
                                                                                     "state189"))
                                                                                   (signal-value
                                                                                    btor188)))
                                                                                 (append
                                                                                  (list
                                                                                   (cons
                                                                                    (string->symbol
                                                                                     (string-append
                                                                                      name
                                                                                      "state181"))
                                                                                    (signal-value
                                                                                     btor191)))
                                                                                  (append
                                                                                   (list
                                                                                    (cons
                                                                                     (string->symbol
                                                                                      (string-append
                                                                                       name
                                                                                       "state173"))
                                                                                     (signal-value
                                                                                      btor66)))
                                                                                   (append
                                                                                    (list
                                                                                     (cons
                                                                                      (string->symbol
                                                                                       (string-append
                                                                                        name
                                                                                        "state171"))
                                                                                      (signal-value
                                                                                       btor1303)))
                                                                                    (append
                                                                                     (list
                                                                                      (cons
                                                                                       (string->symbol
                                                                                        (string-append
                                                                                         name
                                                                                         "state169"))
                                                                                       (signal-value
                                                                                        btor177)))
                                                                                     (append
                                                                                      (list
                                                                                       (cons
                                                                                        (string->symbol
                                                                                         (string-append
                                                                                          name
                                                                                          "state166"))
                                                                                        (signal-value
                                                                                         btor165)))
                                                                                      (append
                                                                                       (list
                                                                                        (cons
                                                                                         (string->symbol
                                                                                          (string-append
                                                                                           name
                                                                                           "state156"))
                                                                                         (signal-value
                                                                                          btor168)))
                                                                                       (append
                                                                                        (list
                                                                                         (cons
                                                                                          (string->symbol
                                                                                           (string-append
                                                                                            name
                                                                                            "state145"))
                                                                                          (signal-value
                                                                                           btor68)))
                                                                                        (append
                                                                                         (list
                                                                                          (cons
                                                                                           (string->symbol
                                                                                            (string-append
                                                                                             name
                                                                                             "state143"))
                                                                                           (signal-value
                                                                                            btor1296)))
                                                                                         (append
                                                                                          (list
                                                                                           (cons
                                                                                            (string->symbol
                                                                                             (string-append
                                                                                              name
                                                                                              "state141"))
                                                                                            (signal-value
                                                                                             btor151)))
                                                                                          (append
                                                                                           (list
                                                                                            (cons
                                                                                             (string->symbol
                                                                                              (string-append
                                                                                               name
                                                                                               "state138"))
                                                                                             (signal-value
                                                                                              btor270)))
                                                                                           (append
                                                                                            (list
                                                                                             (cons
                                                                                              (string->symbol
                                                                                               (string-append
                                                                                                name
                                                                                                "state136"))
                                                                                              (signal-value
                                                                                               btor1291)))
                                                                                            (append
                                                                                             (list
                                                                                              (cons
                                                                                               (string->symbol
                                                                                                (string-append
                                                                                                 name
                                                                                                 "state135"))
                                                                                               (signal-value
                                                                                                btor273)))
                                                                                             (list))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
              merged-input-state-hash)
             equal?
             #:key
             car)))
      (list
       (cons 'SROB0 (signal (signal-value btor789) output-state))
       (cons 'SROB15 (signal (signal-value btor803) output-state))
       (cons 'P31 (signal (signal-value btor731) output-state))
       (cons 'ROA0 (signal (signal-value btor753) output-state))
       (cons 'ROC4 (signal (signal-value btor849) output-state))
       (cons 'SROA8 (signal (signal-value btor917) output-state))
       (cons 'SROA9 (signal (signal-value btor919) output-state))
       (cons 'P30 (signal (signal-value btor729) output-state))
       (cons 'P18 (signal (signal-value btor701) output-state))
       (cons 'ROB2 (signal (signal-value btor809) output-state))
       (cons 'ROC9 (signal (signal-value btor859) output-state))
       (cons 'ROC15 (signal (signal-value btor839) output-state))
       (cons 'P0 (signal (signal-value btor681) output-state))
       (cons 'ROA17 (signal (signal-value btor771) output-state))
       (cons 'SROA14 (signal (signal-value btor897) output-state))
       (cons 'ROC3 (signal (signal-value btor847) output-state))
       (cons 'SROA7 (signal (signal-value btor915) output-state))
       (cons 'SROB9 (signal (signal-value btor823) output-state))
       (cons 'SROA15 (signal (signal-value btor899) output-state))
       (cons 'ROB11 (signal (signal-value btor795) output-state))
       (cons 'ROC14 (signal (signal-value btor837) output-state))
       (cons 'ROA1 (signal (signal-value btor755) output-state))
       (cons 'SROB14 (signal (signal-value btor801) output-state))
       (cons 'P1 (signal (signal-value btor683) output-state))
       (cons 'P19 (signal (signal-value btor703) output-state))
       (cons 'ROB3 (signal (signal-value btor811) output-state))
       (cons 'P2 (signal (signal-value btor705) output-state))
       (cons 'ROA15 (signal (signal-value btor767) output-state))
       (cons 'SROA12 (signal (signal-value btor893) output-state))
       (cons 'ROC11 (signal (signal-value btor831) output-state))
       (cons 'ROB4 (signal (signal-value btor813) output-state))
       (cons 'ROA9 (signal (signal-value btor787) output-state))
       (cons 'ROA2 (signal (signal-value btor773) output-state))
       (cons 'P28 (signal (signal-value btor723) output-state))
       (cons 'P11 (signal (signal-value btor687) output-state))
       (cons 'ROB12 (signal (signal-value btor797) output-state))
       (cons 'ROC7 (signal (signal-value btor855) output-state))
       (cons 'ROC13 (signal (signal-value btor835) output-state))
       (cons 'P27 (signal (signal-value btor721) output-state))
       (cons 'P8 (signal (signal-value btor749) output-state))
       (cons 'SROB13 (signal (signal-value btor799) output-state))
       (cons 'SROB8 (signal (signal-value btor821) output-state))
       (cons 'P21 (signal (signal-value btor709) output-state))
       (cons 'SROB2 (signal (signal-value btor809) output-state))
       (cons 'ROA8 (signal (signal-value btor785) output-state))
       (cons 'SROA0 (signal (signal-value btor885) output-state))
       (cons 'ROC6 (signal (signal-value btor853) output-state))
       (cons 'SROA6 (signal (signal-value btor913) output-state))
       (cons 'SROB12 (signal (signal-value btor797) output-state))
       (cons 'P29 (signal (signal-value btor725) output-state))
       (cons 'SROA13 (signal (signal-value btor895) output-state))
       (cons 'P10 (signal (signal-value btor685) output-state))
       (cons 'ROB13 (signal (signal-value btor799) output-state))
       (cons 'ROC8 (signal (signal-value btor857) output-state))
       (cons 'ROC12 (signal (signal-value btor833) output-state))
       (cons 'P26 (signal (signal-value btor719) output-state))
       (cons 'P9 (signal (signal-value btor751) output-state))
       (cons 'ROA10 (signal (signal-value btor757) output-state))
       (cons 'ROA3 (signal (signal-value btor775) output-state))
       (cons 'ROC10 (signal (signal-value btor829) output-state))
       (cons 'ROB5 (signal (signal-value btor815) output-state))
       (cons 'P3 (signal (signal-value btor727) output-state))
       (cons 'ROA16 (signal (signal-value btor769) output-state))
       (cons 'P17 (signal (signal-value btor699) output-state))
       (cons 'ROC5 (signal (signal-value btor851) output-state))
       (cons 'SROA5 (signal (signal-value btor911) output-state))
       (cons 'P16 (signal (signal-value btor697) output-state))
       (cons 'SROB7 (signal (signal-value btor819) output-state))
       (cons 'P20 (signal (signal-value btor707) output-state))
       (cons 'SROB1 (signal (signal-value btor791) output-state))
       (cons 'ROB9 (signal (signal-value btor823) output-state))
       (cons 'SROB5 (signal (signal-value btor815) output-state))
       (cons 'SROA3 (signal (signal-value btor907) output-state))
       (cons 'P34 (signal (signal-value btor737) output-state))
       (cons 'P14 (signal (signal-value btor693) output-state))
       (cons 'P22 (signal (signal-value btor711) output-state))
       (cons 'ROA7 (signal (signal-value btor783) output-state))
       (cons 'SIGNEDP (signal (signal-value btor865) output-state))
       (cons 'P7 (signal (signal-value btor747) output-state))
       (cons 'SROA11 (signal (signal-value btor891) output-state))
       (cons 'ROB15 (signal (signal-value btor803) output-state))
       (cons 'SROA17 (signal (signal-value btor903) output-state))
       (cons 'ROA14 (signal (signal-value btor765) output-state))
       (cons 'ROA6 (signal (signal-value btor781) output-state))
       (cons 'SROA4 (signal (signal-value btor909) output-state))
       (cons 'P15 (signal (signal-value btor695) output-state))
       (cons 'P23 (signal (signal-value btor713) output-state))
       (cons 'SROA16 (signal (signal-value btor901) output-state))
       (cons 'ROB8 (signal (signal-value btor821) output-state))
       (cons 'P35 (signal (signal-value btor739) output-state))
       (cons 'SROB6 (signal (signal-value btor817) output-state))
       (cons 'ROC0 (signal (signal-value btor825) output-state))
       (cons 'ROA13 (signal (signal-value btor763) output-state))
       (cons 'SROA10 (signal (signal-value btor889) output-state))
       (cons 'P6 (signal (signal-value btor745) output-state))
       (cons 'ROB14 (signal (signal-value btor801) output-state))
       (cons 'SROA1 (signal (signal-value btor887) output-state))
       (cons 'ROB17 (signal (signal-value btor807) output-state))
       (cons 'ROC16 (signal (signal-value btor841) output-state))
       (cons 'ROC1 (signal (signal-value btor827) output-state))
       (cons 'P12 (signal (signal-value btor689) output-state))
       (cons 'ROB1 (signal (signal-value btor791) output-state))
       (cons 'SROB3 (signal (signal-value btor811) output-state))
       (cons 'P24 (signal (signal-value btor715) output-state))
       (cons 'ROA12 (signal (signal-value btor761) output-state))
       (cons 'ROB7 (signal (signal-value btor819) output-state))
       (cons 'SROB16 (signal (signal-value btor805) output-state))
       (cons 'P32 (signal (signal-value btor733) output-state))
       (cons 'ROA5 (signal (signal-value btor779) output-state))
       (cons 'SROB10 (signal (signal-value btor793) output-state))
       (cons 'P5 (signal (signal-value btor743) output-state))
       (cons 'ROB16 (signal (signal-value btor805) output-state))
       (cons 'ROC2 (signal (signal-value btor845) output-state))
       (cons 'ROC17 (signal (signal-value btor843) output-state))
       (cons 'ROB10 (signal (signal-value btor793) output-state))
       (cons 'P4 (signal (signal-value btor741) output-state))
       (cons 'SROB17 (signal (signal-value btor807) output-state))
       (cons 'SROA2 (signal (signal-value btor905) output-state))
       (cons 'P33 (signal (signal-value btor735) output-state))
       (cons 'P13 (signal (signal-value btor691) output-state))
       (cons 'SROB4 (signal (signal-value btor813) output-state))
       (cons 'P25 (signal (signal-value btor717) output-state))
       (cons 'ROA11 (signal (signal-value btor759) output-state))
       (cons 'SROB11 (signal (signal-value btor795) output-state))
       (cons 'ROB0 (signal (signal-value btor789) output-state))
       (cons 'ROA4 (signal (signal-value btor777) output-state))
       (cons 'ROB6 (signal (signal-value btor817) output-state))))))
