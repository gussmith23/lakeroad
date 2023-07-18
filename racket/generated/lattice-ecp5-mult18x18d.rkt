;;; Imported with
;;; $LAKEROAD_DIR/bin/verilog_to_racket.py \
;;;   --infile lakeroad-private/lattice_ecp5/MULT18X18D_modified_for_racket_import.v \
;;;   --top MULT18X18D \ 
;;;   --function-name lattice-ecp5-mult18x18d > lakeroad/racket/generated/lattice-ecp5-mult18x18d.rkt
;;;
;;; With this version of the file:
;;; https://github.com/uwsampl/lakeroad-private/blob/94fe92dca31d22a6c8918a981fddbce3fcb27e35/lattice_ecp5/MULT18X18D_modified_for_racket_import.v

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
               (string->symbol (string-append name "state898"))
               (bv 1 (bitvector 1))))
             (append
              (list
               (cons
                (string->symbol (string-append name "state887"))
                (bv 1 (bitvector 1))))
              (append
               (list
                (cons
                 (string->symbol (string-append name "state681"))
                 (bv 1 (bitvector 1))))
               (append
                (list
                 (cons
                  (string->symbol (string-append name "state565"))
                  (bv 0 (bitvector 1))))
                (append
                 (list
                  (cons
                   (string->symbol (string-append name "state512"))
                   (bv 0 (bitvector 1))))
                 (append
                  (list
                   (cons
                    (string->symbol (string-append name "state510"))
                    (bv 1 (bitvector 1))))
                  (append
                   (list
                    (cons
                     (string->symbol (string-append name "state457"))
                     (bv 0 (bitvector 1))))
                   (append
                    (list
                     (cons
                      (string->symbol (string-append name "state455"))
                      (bv 1 (bitvector 1))))
                    (append
                     (list
                      (cons
                       (string->symbol (string-append name "state445"))
                       (bv 1 (bitvector 1))))
                     (append
                      (list
                       (cons
                        (string->symbol (string-append name "state318"))
                        (bv 1 (bitvector 1))))
                      (append
                       (list
                        (cons
                         (string->symbol (string-append name "state281"))
                         (bv 1 (bitvector 1))))
                       (append
                        (list
                         (cons
                          (string->symbol (string-append name "state234"))
                          (bv 1 (bitvector 1))))
                        (append
                         (list
                          (cons
                           (string->symbol (string-append name "state232"))
                           (bv 0 (bitvector 1))))
                         (append
                          (list
                           (cons
                            (string->symbol (string-append name "state230"))
                            (bv 0 (bitvector 1))))
                          (append
                           (list
                            (cons
                             (string->symbol (string-append name "state228"))
                             (bv 0 (bitvector 1))))
                           (append
                            (list
                             (cons
                              (string->symbol (string-append name "state206"))
                              (bv 1 (bitvector 1))))
                            (append
                             (list
                              (cons
                               (string->symbol (string-append name "state204"))
                               (bv 0 (bitvector 1))))
                             (append
                              (list
                               (cons
                                (string->symbol
                                 (string-append name "state202"))
                                (bv 0 (bitvector 1))))
                              (append
                               (list
                                (cons
                                 (string->symbol
                                  (string-append name "state200"))
                                 (bv 0 (bitvector 1))))
                               (append
                                (list
                                 (cons
                                  (string->symbol
                                   (string-append name "state177"))
                                  (bv 1 (bitvector 1))))
                                (append
                                 (list
                                  (cons
                                   (string->symbol
                                    (string-append name "state175"))
                                   (bv 0 (bitvector 1))))
                                 (append
                                  (list
                                   (cons
                                    (string->symbol
                                     (string-append name "state173"))
                                    (bv 0 (bitvector 1))))
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
                                       (string-append name "state148"))
                                      (bv 1 (bitvector 1))))
                                    (append
                                     (list
                                      (cons
                                       (string->symbol
                                        (string-append name "state146"))
                                       (bv 0 (bitvector 1))))
                                     (append
                                      (list
                                       (cons
                                        (string->symbol
                                         (string-append name "state144"))
                                        (bv 0 (bitvector 1))))
                                      (append
                                       (list
                                        (cons
                                         (string->symbol
                                          (string-append name "state142"))
                                         (bv 0 (bitvector 1))))
                                       (append
                                        (list
                                         (cons
                                          (string->symbol
                                           (string-append name "state138"))
                                          (bv 1 (bitvector 1))))
                                        (list))))))))))))))))))))))))))))))
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
           (btor140
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state140")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state140")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state140")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state140")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor141 (bv->signal (bv 0 (bitvector 1))))
           (btor142
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state142")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state142")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state142")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state142")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor144
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state144")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state144")))))
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
           (btor146
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state146")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state146")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state146")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state146")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor148
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state148")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state148")))))
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
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor150 (bitvector 2))
           (btor151
            (signal
             (concat (signal-value btor68) (signal-value btor148))
             (list)))
           (btor152 (bv->signal (bv 2 (bitvector 2))))
           (btor153
            (signal
             (bool->bitvector
              (bveq (signal-value btor151) (signal-value btor152)))
             (list)))
           (btor154
            (if (bitvector->bool (signal-value btor153)) btor146 btor144))
           (btor155 (bv->signal (bv 3 (bitvector 2))))
           (btor156
            (bv->signal
             (zero-extend (signal-value btor155) (bitvector 5))
             btor155))
           (btor157
            (signal
             (bool->bitvector
              (bveq (signal-value btor69) (signal-value btor156)))
             (list)))
           (btor158
            (if (bitvector->bool (signal-value btor157)) btor154 btor68))
           (btor159 (signal (bvnot (signal-value btor157)) (list)))
           (btor160 (bitvector 3))
           (btor161 (bv->signal (bv 5 (bitvector 3))))
           (btor162
            (bv->signal
             (zero-extend (signal-value btor161) (bitvector 5))
             btor161))
           (btor163
            (signal
             (bool->bitvector
              (bveq (signal-value btor69) (signal-value btor162)))
             (list)))
           (btor164 (signal (bvnot (signal-value btor163)) (list)))
           (btor165
            (signal
             (bvand (signal-value btor159) (signal-value btor164))
             (list)))
           (btor166
            (signal
             (bvand (signal-value btor159) (signal-value btor165))
             (list)))
           (btor167
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state167")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state167")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state167")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state167")))))
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
             (bvand (signal-value btor166) (signal-value btor167))
             (list)))
           (btor169 (signal (bvnot (signal-value btor168)) (list)))
           (btor170
            (if (bitvector->bool (signal-value btor169)) btor158 btor142))
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
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state175")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state175")))))
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
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state177")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state177")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state177")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state177")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor179
            (signal
             (concat (signal-value btor66) (signal-value btor177))
             (list)))
           (btor180
            (signal
             (bool->bitvector
              (bveq (signal-value btor179) (signal-value btor152)))
             (list)))
           (btor181
            (if (bitvector->bool (signal-value btor180)) btor175 btor173))
           (btor182
            (bv->signal
             (zero-extend (signal-value btor155) (bitvector 5))
             btor155))
           (btor183
            (signal
             (bool->bitvector
              (bveq (signal-value btor67) (signal-value btor182)))
             (list)))
           (btor184
            (if (bitvector->bool (signal-value btor183)) btor181 btor66))
           (btor185 (signal (bvnot (signal-value btor183)) (list)))
           (btor186
            (bv->signal
             (zero-extend (signal-value btor161) (bitvector 5))
             btor161))
           (btor187
            (signal
             (bool->bitvector
              (bveq (signal-value btor67) (signal-value btor186)))
             (list)))
           (btor188 (signal (bvnot (signal-value btor187)) (list)))
           (btor189
            (signal
             (bvand (signal-value btor185) (signal-value btor188))
             (list)))
           (btor190
            (signal
             (bvand (signal-value btor185) (signal-value btor189))
             (list)))
           (btor191
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state191")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state191")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state191")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state191")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor192
            (signal
             (bvand (signal-value btor190) (signal-value btor191))
             (list)))
           (btor193 (signal (bvnot (signal-value btor192)) (list)))
           (btor194
            (if (bitvector->bool (signal-value btor193)) btor184 btor171))
           (btor195 (bitvector 4))
           (btor196 (bv->signal (bv 13 (bitvector 4))))
           (btor197
            (bv->signal
             (zero-extend (signal-value btor196) (bitvector 5))
             btor196))
           (btor198
            (signal
             (bool->bitvector
              (bveq (signal-value btor83) (signal-value btor197)))
             (list)))
           (btor199
            (if (bitvector->bool (signal-value btor198)) btor194 btor170))
           (btor200
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state200")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state200")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state200")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state200")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor202
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state202")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state202")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state202")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state202")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor204
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state204")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state204")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state204")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state204")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor206
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state206")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state206")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state206")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state206")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor208
            (signal
             (concat (signal-value btor64) (signal-value btor206))
             (list)))
           (btor209
            (signal
             (bool->bitvector
              (bveq (signal-value btor208) (signal-value btor152)))
             (list)))
           (btor210
            (if (bitvector->bool (signal-value btor209)) btor204 btor202))
           (btor211
            (bv->signal
             (zero-extend (signal-value btor155) (bitvector 5))
             btor155))
           (btor212
            (signal
             (bool->bitvector
              (bveq (signal-value btor65) (signal-value btor211)))
             (list)))
           (btor213
            (if (bitvector->bool (signal-value btor212)) btor210 btor64))
           (btor214 (signal (bvnot (signal-value btor212)) (list)))
           (btor215
            (bv->signal
             (zero-extend (signal-value btor161) (bitvector 5))
             btor161))
           (btor216
            (signal
             (bool->bitvector
              (bveq (signal-value btor65) (signal-value btor215)))
             (list)))
           (btor217 (signal (bvnot (signal-value btor216)) (list)))
           (btor218
            (signal
             (bvand (signal-value btor214) (signal-value btor217))
             (list)))
           (btor219
            (signal
             (bvand (signal-value btor214) (signal-value btor218))
             (list)))
           (btor220
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state220")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state220")))))
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
           (btor221
            (signal
             (bvand (signal-value btor219) (signal-value btor220))
             (list)))
           (btor222 (signal (bvnot (signal-value btor221)) (list)))
           (btor223
            (if (bitvector->bool (signal-value btor222)) btor213 btor200))
           (btor224 (bv->signal (bv 12 (bitvector 4))))
           (btor225
            (bv->signal
             (zero-extend (signal-value btor224) (bitvector 5))
             btor224))
           (btor226
            (signal
             (bool->bitvector
              (bveq (signal-value btor83) (signal-value btor225)))
             (list)))
           (btor227
            (if (bitvector->bool (signal-value btor226)) btor223 btor199))
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
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state230")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state230")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state230")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state230")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor232
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state232")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state232")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state232")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state232")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor234
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state234")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state234")))))
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
            (signal
             (concat (signal-value btor62) (signal-value btor234))
             (list)))
           (btor237
            (signal
             (bool->bitvector
              (bveq (signal-value btor236) (signal-value btor152)))
             (list)))
           (btor238
            (if (bitvector->bool (signal-value btor237)) btor232 btor230))
           (btor239
            (bv->signal
             (zero-extend (signal-value btor155) (bitvector 5))
             btor155))
           (btor240
            (signal
             (bool->bitvector
              (bveq (signal-value btor63) (signal-value btor239)))
             (list)))
           (btor241
            (if (bitvector->bool (signal-value btor240)) btor238 btor62))
           (btor242 (signal (bvnot (signal-value btor240)) (list)))
           (btor243
            (bv->signal
             (zero-extend (signal-value btor161) (bitvector 5))
             btor161))
           (btor244
            (signal
             (bool->bitvector
              (bveq (signal-value btor63) (signal-value btor243)))
             (list)))
           (btor245 (signal (bvnot (signal-value btor244)) (list)))
           (btor246
            (signal
             (bvand (signal-value btor242) (signal-value btor245))
             (list)))
           (btor247
            (signal
             (bvand (signal-value btor242) (signal-value btor246))
             (list)))
           (btor248
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state248")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state248")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state248")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state248")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor249
            (signal
             (bvand (signal-value btor247) (signal-value btor248))
             (list)))
           (btor250 (signal (bvnot (signal-value btor249)) (list)))
           (btor251
            (if (bitvector->bool (signal-value btor250)) btor241 btor228))
           (btor252 (bv->signal (bv 11 (bitvector 4))))
           (btor253
            (bv->signal
             (zero-extend (signal-value btor252) (bitvector 5))
             btor252))
           (btor254
            (signal
             (bool->bitvector
              (bveq (signal-value btor83) (signal-value btor253)))
             (list)))
           (btor255
            (if (bitvector->bool (signal-value btor254)) btor251 btor227))
           (btor256 (signal (bvnot (signal-value btor254)) (list)))
           (btor257 (signal (bvnot (signal-value btor226)) (list)))
           (btor258 (signal (bvnot (signal-value btor198)) (list)))
           (btor259 (bv->signal (bv 14 (bitvector 4))))
           (btor260
            (bv->signal
             (zero-extend (signal-value btor259) (bitvector 5))
             btor259))
           (btor261
            (signal
             (bool->bitvector
              (bveq (signal-value btor83) (signal-value btor260)))
             (list)))
           (btor262 (signal (bvnot (signal-value btor261)) (list)))
           (btor263
            (signal
             (bvand (signal-value btor258) (signal-value btor262))
             (list)))
           (btor264
            (signal
             (bvand (signal-value btor257) (signal-value btor263))
             (list)))
           (btor265
            (signal
             (bvand (signal-value btor256) (signal-value btor264))
             (list)))
           (btor266
            (signal
             (bvand (signal-value btor258) (signal-value btor265))
             (list)))
           (btor267
            (signal
             (bvand (signal-value btor257) (signal-value btor266))
             (list)))
           (btor268
            (signal
             (bvand (signal-value btor256) (signal-value btor267))
             (list)))
           (btor269
            (signal
             (bvand (signal-value btor257) (signal-value btor268))
             (list)))
           (btor270
            (signal
             (bvand (signal-value btor256) (signal-value btor269))
             (list)))
           (btor271
            (signal
             (bvand (signal-value btor256) (signal-value btor270))
             (list)))
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
           (btor273
            (signal
             (bvand (signal-value btor271) (signal-value btor272))
             (list)))
           (btor274 (signal (bvnot (signal-value btor273)) (list)))
           (btor275
            (if (bitvector->bool (signal-value btor274)) btor255 btor140))
           (btor276
            (signal
             (concat (signal-value btor275) (signal-value btor138))
             (list)))
           (btor277
            (signal
             (bool->bitvector
              (bveq (signal-value btor276) (signal-value btor152)))
             (list)))
           (btor278
            (if (bitvector->bool (signal-value btor277)) btor136 btor135))
           (btor279
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state279")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state279")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state279")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state279")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 36))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor280
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state280")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state280")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state280")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state280")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 36))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor281
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state281")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state281")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state281")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state281")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor283
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state283")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state283")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state283")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state283")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor284
            (bv->signal
             (zero-extend (signal-value btor196) (bitvector 5))
             btor196))
           (btor285
            (signal
             (bool->bitvector
              (bveq (signal-value btor86) (signal-value btor284)))
             (list)))
           (btor286
            (if (bitvector->bool (signal-value btor285)) btor194 btor170))
           (btor287
            (bv->signal
             (zero-extend (signal-value btor224) (bitvector 5))
             btor224))
           (btor288
            (signal
             (bool->bitvector
              (bveq (signal-value btor86) (signal-value btor287)))
             (list)))
           (btor289
            (if (bitvector->bool (signal-value btor288)) btor223 btor286))
           (btor290
            (bv->signal
             (zero-extend (signal-value btor252) (bitvector 5))
             btor252))
           (btor291
            (signal
             (bool->bitvector
              (bveq (signal-value btor86) (signal-value btor290)))
             (list)))
           (btor292
            (if (bitvector->bool (signal-value btor291)) btor251 btor289))
           (btor293 (signal (bvnot (signal-value btor291)) (list)))
           (btor294 (signal (bvnot (signal-value btor288)) (list)))
           (btor295 (signal (bvnot (signal-value btor285)) (list)))
           (btor296
            (bv->signal
             (zero-extend (signal-value btor259) (bitvector 5))
             btor259))
           (btor297
            (signal
             (bool->bitvector
              (bveq (signal-value btor86) (signal-value btor296)))
             (list)))
           (btor298 (signal (bvnot (signal-value btor297)) (list)))
           (btor299
            (signal
             (bvand (signal-value btor295) (signal-value btor298))
             (list)))
           (btor300
            (signal
             (bvand (signal-value btor294) (signal-value btor299))
             (list)))
           (btor301
            (signal
             (bvand (signal-value btor293) (signal-value btor300))
             (list)))
           (btor302
            (signal
             (bvand (signal-value btor295) (signal-value btor301))
             (list)))
           (btor303
            (signal
             (bvand (signal-value btor294) (signal-value btor302))
             (list)))
           (btor304
            (signal
             (bvand (signal-value btor293) (signal-value btor303))
             (list)))
           (btor305
            (signal
             (bvand (signal-value btor294) (signal-value btor304))
             (list)))
           (btor306
            (signal
             (bvand (signal-value btor293) (signal-value btor305))
             (list)))
           (btor307
            (signal
             (bvand (signal-value btor293) (signal-value btor306))
             (list)))
           (btor308
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state308")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state308")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state308")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state308")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor309
            (signal
             (bvand (signal-value btor307) (signal-value btor308))
             (list)))
           (btor310 (signal (bvnot (signal-value btor309)) (list)))
           (btor311
            (if (bitvector->bool (signal-value btor310)) btor292 btor283))
           (btor312
            (signal
             (concat (signal-value btor311) (signal-value btor281))
             (list)))
           (btor313
            (signal
             (bool->bitvector
              (bveq (signal-value btor312) (signal-value btor152)))
             (list)))
           (btor314
            (if (bitvector->bool (signal-value btor313)) btor280 btor279))
           (btor315 (bitvector 18))
           (btor316
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state316")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state316")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state316")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state316")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor317
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state317")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state317")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state317")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state317")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor318
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state318")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state318")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state318")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state318")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor320
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state320")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state320")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state320")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state320")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor321
            (bv->signal
             (zero-extend (signal-value btor196) (bitvector 5))
             btor196))
           (btor322
            (signal
             (bool->bitvector
              (bveq (signal-value btor74) (signal-value btor321)))
             (list)))
           (btor323
            (if (bitvector->bool (signal-value btor322)) btor194 btor170))
           (btor324
            (bv->signal
             (zero-extend (signal-value btor224) (bitvector 5))
             btor224))
           (btor325
            (signal
             (bool->bitvector
              (bveq (signal-value btor74) (signal-value btor324)))
             (list)))
           (btor326
            (if (bitvector->bool (signal-value btor325)) btor223 btor323))
           (btor327
            (bv->signal
             (zero-extend (signal-value btor252) (bitvector 5))
             btor252))
           (btor328
            (signal
             (bool->bitvector
              (bveq (signal-value btor74) (signal-value btor327)))
             (list)))
           (btor329
            (if (bitvector->bool (signal-value btor328)) btor251 btor326))
           (btor330 (signal (bvnot (signal-value btor328)) (list)))
           (btor331 (signal (bvnot (signal-value btor325)) (list)))
           (btor332 (signal (bvnot (signal-value btor322)) (list)))
           (btor333
            (bv->signal
             (zero-extend (signal-value btor259) (bitvector 5))
             btor259))
           (btor334
            (signal
             (bool->bitvector
              (bveq (signal-value btor74) (signal-value btor333)))
             (list)))
           (btor335 (signal (bvnot (signal-value btor334)) (list)))
           (btor336
            (signal
             (bvand (signal-value btor332) (signal-value btor335))
             (list)))
           (btor337
            (signal
             (bvand (signal-value btor331) (signal-value btor336))
             (list)))
           (btor338
            (signal
             (bvand (signal-value btor330) (signal-value btor337))
             (list)))
           (btor339
            (signal
             (bvand (signal-value btor332) (signal-value btor338))
             (list)))
           (btor340
            (signal
             (bvand (signal-value btor331) (signal-value btor339))
             (list)))
           (btor341
            (signal
             (bvand (signal-value btor330) (signal-value btor340))
             (list)))
           (btor342
            (signal
             (bvand (signal-value btor331) (signal-value btor341))
             (list)))
           (btor343
            (signal
             (bvand (signal-value btor330) (signal-value btor342))
             (list)))
           (btor344
            (signal
             (bvand (signal-value btor330) (signal-value btor343))
             (list)))
           (btor345
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state345")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state345")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state345")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state345")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor346
            (signal
             (bvand (signal-value btor344) (signal-value btor345))
             (list)))
           (btor347 (signal (bvnot (signal-value btor346)) (list)))
           (btor348
            (if (bitvector->bool (signal-value btor347)) btor329 btor320))
           (btor349
            (signal
             (concat (signal-value btor348) (signal-value btor318))
             (list)))
           (btor350
            (signal
             (bool->bitvector
              (bveq (signal-value btor349) (signal-value btor152)))
             (list)))
           (btor351
            (if (bitvector->bool (signal-value btor350)) btor317 btor316))
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
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor353
            (signal (concat (signal-value btor3) (signal-value btor2)) (list)))
           (btor354
            (signal
             (concat (signal-value btor12) (signal-value btor353))
             (list)))
           (btor355
            (signal
             (concat (signal-value btor13) (signal-value btor354))
             (list)))
           (btor356
            (signal
             (concat (signal-value btor14) (signal-value btor355))
             (list)))
           (btor357 (bitvector 6))
           (btor358
            (signal
             (concat (signal-value btor15) (signal-value btor356))
             (list)))
           (btor359 (bitvector 7))
           (btor360
            (signal
             (concat (signal-value btor16) (signal-value btor358))
             (list)))
           (btor361 (bitvector 8))
           (btor362
            (signal
             (concat (signal-value btor17) (signal-value btor360))
             (list)))
           (btor363 (bitvector 9))
           (btor364
            (signal
             (concat (signal-value btor18) (signal-value btor362))
             (list)))
           (btor365 (bitvector 10))
           (btor366
            (signal
             (concat (signal-value btor19) (signal-value btor364))
             (list)))
           (btor367 (bitvector 11))
           (btor368
            (signal
             (concat (signal-value btor4) (signal-value btor366))
             (list)))
           (btor369 (bitvector 12))
           (btor370
            (signal
             (concat (signal-value btor5) (signal-value btor368))
             (list)))
           (btor371 (bitvector 13))
           (btor372
            (signal
             (concat (signal-value btor6) (signal-value btor370))
             (list)))
           (btor373 (bitvector 14))
           (btor374
            (signal
             (concat (signal-value btor7) (signal-value btor372))
             (list)))
           (btor375 (bitvector 15))
           (btor376
            (signal
             (concat (signal-value btor8) (signal-value btor374))
             (list)))
           (btor377 (bitvector 16))
           (btor378
            (signal
             (concat (signal-value btor9) (signal-value btor376))
             (list)))
           (btor379 (bitvector 17))
           (btor380
            (signal
             (concat (signal-value btor10) (signal-value btor378))
             (list)))
           (btor381
            (signal
             (concat (signal-value btor11) (signal-value btor380))
             (list)))
           (btor382
            (signal
             (concat (signal-value btor98) (signal-value btor97))
             (list)))
           (btor383
            (signal
             (concat (signal-value btor107) (signal-value btor382))
             (list)))
           (btor384
            (signal
             (concat (signal-value btor108) (signal-value btor383))
             (list)))
           (btor385
            (signal
             (concat (signal-value btor109) (signal-value btor384))
             (list)))
           (btor386
            (signal
             (concat (signal-value btor110) (signal-value btor385))
             (list)))
           (btor387
            (signal
             (concat (signal-value btor111) (signal-value btor386))
             (list)))
           (btor388
            (signal
             (concat (signal-value btor112) (signal-value btor387))
             (list)))
           (btor389
            (signal
             (concat (signal-value btor113) (signal-value btor388))
             (list)))
           (btor390
            (signal
             (concat (signal-value btor114) (signal-value btor389))
             (list)))
           (btor391
            (signal
             (concat (signal-value btor99) (signal-value btor390))
             (list)))
           (btor392
            (signal
             (concat (signal-value btor100) (signal-value btor391))
             (list)))
           (btor393
            (signal
             (concat (signal-value btor101) (signal-value btor392))
             (list)))
           (btor394
            (signal
             (concat (signal-value btor102) (signal-value btor393))
             (list)))
           (btor395
            (signal
             (concat (signal-value btor103) (signal-value btor394))
             (list)))
           (btor396
            (signal
             (concat (signal-value btor104) (signal-value btor395))
             (list)))
           (btor397
            (signal
             (concat (signal-value btor105) (signal-value btor396))
             (list)))
           (btor398
            (signal
             (concat (signal-value btor106) (signal-value btor397))
             (list)))
           (btor399
            (if (bitvector->bool (signal-value btor94)) btor398 btor381))
           (btor400
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state400")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state400")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state400")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state400")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor401
            (signal
             (bvand (signal-value btor141) (signal-value btor400))
             (list)))
           (btor402 (signal (bvnot (signal-value btor401)) (list)))
           (btor403
            (if (bitvector->bool (signal-value btor402)) btor399 btor352))
           (btor404
            (signal
             (apply bvor (bitvector->bits (signal-value btor74)))
             (signal-state btor74)))
           (btor405 (signal (bvnot (signal-value btor404)) (list)))
           (btor406
            (if (bitvector->bool (signal-value btor405)) btor403 btor351))
           (btor407 (bv->signal (bv 0 (bitvector 18))))
           (btor408
            (signal
             (extract 17 17 (signal-value btor406))
             (signal-state btor406)))
           (btor409
            (signal
             (extract 17 17 (signal-value btor406))
             (signal-state btor406)))
           (btor410
            (signal
             (concat (signal-value btor409) (signal-value btor408))
             (list)))
           (btor411
            (signal
             (extract 17 17 (signal-value btor406))
             (signal-state btor406)))
           (btor412
            (signal
             (concat (signal-value btor411) (signal-value btor410))
             (list)))
           (btor413
            (signal
             (extract 17 17 (signal-value btor406))
             (signal-state btor406)))
           (btor414
            (signal
             (concat (signal-value btor413) (signal-value btor412))
             (list)))
           (btor415
            (signal
             (extract 17 17 (signal-value btor406))
             (signal-state btor406)))
           (btor416
            (signal
             (concat (signal-value btor415) (signal-value btor414))
             (list)))
           (btor417
            (signal
             (extract 17 17 (signal-value btor406))
             (signal-state btor406)))
           (btor418
            (signal
             (concat (signal-value btor417) (signal-value btor416))
             (list)))
           (btor419
            (signal
             (extract 17 17 (signal-value btor406))
             (signal-state btor406)))
           (btor420
            (signal
             (concat (signal-value btor419) (signal-value btor418))
             (list)))
           (btor421
            (signal
             (extract 17 17 (signal-value btor406))
             (signal-state btor406)))
           (btor422
            (signal
             (concat (signal-value btor421) (signal-value btor420))
             (list)))
           (btor423
            (signal
             (extract 17 17 (signal-value btor406))
             (signal-state btor406)))
           (btor424
            (signal
             (concat (signal-value btor423) (signal-value btor422))
             (list)))
           (btor425
            (signal
             (extract 17 17 (signal-value btor406))
             (signal-state btor406)))
           (btor426
            (signal
             (concat (signal-value btor425) (signal-value btor424))
             (list)))
           (btor427
            (signal
             (extract 17 17 (signal-value btor406))
             (signal-state btor406)))
           (btor428
            (signal
             (concat (signal-value btor427) (signal-value btor426))
             (list)))
           (btor429
            (signal
             (extract 17 17 (signal-value btor406))
             (signal-state btor406)))
           (btor430
            (signal
             (concat (signal-value btor429) (signal-value btor428))
             (list)))
           (btor431
            (signal
             (extract 17 17 (signal-value btor406))
             (signal-state btor406)))
           (btor432
            (signal
             (concat (signal-value btor431) (signal-value btor430))
             (list)))
           (btor433
            (signal
             (extract 17 17 (signal-value btor406))
             (signal-state btor406)))
           (btor434
            (signal
             (concat (signal-value btor433) (signal-value btor432))
             (list)))
           (btor435
            (signal
             (extract 17 17 (signal-value btor406))
             (signal-state btor406)))
           (btor436
            (signal
             (concat (signal-value btor435) (signal-value btor434))
             (list)))
           (btor437
            (signal
             (extract 17 17 (signal-value btor406))
             (signal-state btor406)))
           (btor438
            (signal
             (concat (signal-value btor437) (signal-value btor436))
             (list)))
           (btor439
            (signal
             (extract 17 17 (signal-value btor406))
             (signal-state btor406)))
           (btor440
            (signal
             (concat (signal-value btor439) (signal-value btor438))
             (list)))
           (btor441
            (signal
             (extract 17 17 (signal-value btor406))
             (signal-state btor406)))
           (btor442
            (signal
             (concat (signal-value btor441) (signal-value btor440))
             (list)))
           (btor443
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state443")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state443")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state443")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state443")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor444
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state444")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state444")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state444")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state444")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor445
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state445")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state445")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state445")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state445")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor447
            (signal
             (concat (signal-value btor348) (signal-value btor445))
             (list)))
           (btor448
            (signal
             (bool->bitvector
              (bveq (signal-value btor447) (signal-value btor152)))
             (list)))
           (btor449
            (if (bitvector->bool (signal-value btor448)) btor444 btor443))
           (btor450
            (if (bitvector->bool (signal-value btor405)) btor92 btor449))
           (btor451
            (if (bitvector->bool (signal-value btor450)) btor442 btor407))
           (btor452
            (signal
             (concat (signal-value btor451) (signal-value btor406))
             (list)))
           (btor453
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state453")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state453")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state453")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state453")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor454
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state454")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state454")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state454")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state454")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor455
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state455")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state455")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state455")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state455")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor457
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state457")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state457")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state457")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state457")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor459
            (bv->signal
             (zero-extend (signal-value btor196) (bitvector 5))
             btor196))
           (btor460
            (signal
             (bool->bitvector
              (bveq (signal-value btor77) (signal-value btor459)))
             (list)))
           (btor461
            (if (bitvector->bool (signal-value btor460)) btor194 btor170))
           (btor462
            (bv->signal
             (zero-extend (signal-value btor224) (bitvector 5))
             btor224))
           (btor463
            (signal
             (bool->bitvector
              (bveq (signal-value btor77) (signal-value btor462)))
             (list)))
           (btor464
            (if (bitvector->bool (signal-value btor463)) btor223 btor461))
           (btor465
            (bv->signal
             (zero-extend (signal-value btor252) (bitvector 5))
             btor252))
           (btor466
            (signal
             (bool->bitvector
              (bveq (signal-value btor77) (signal-value btor465)))
             (list)))
           (btor467
            (if (bitvector->bool (signal-value btor466)) btor251 btor464))
           (btor468 (signal (bvnot (signal-value btor466)) (list)))
           (btor469 (signal (bvnot (signal-value btor463)) (list)))
           (btor470 (signal (bvnot (signal-value btor460)) (list)))
           (btor471
            (bv->signal
             (zero-extend (signal-value btor259) (bitvector 5))
             btor259))
           (btor472
            (signal
             (bool->bitvector
              (bveq (signal-value btor77) (signal-value btor471)))
             (list)))
           (btor473 (signal (bvnot (signal-value btor472)) (list)))
           (btor474
            (signal
             (bvand (signal-value btor470) (signal-value btor473))
             (list)))
           (btor475
            (signal
             (bvand (signal-value btor469) (signal-value btor474))
             (list)))
           (btor476
            (signal
             (bvand (signal-value btor468) (signal-value btor475))
             (list)))
           (btor477
            (signal
             (bvand (signal-value btor470) (signal-value btor476))
             (list)))
           (btor478
            (signal
             (bvand (signal-value btor469) (signal-value btor477))
             (list)))
           (btor479
            (signal
             (bvand (signal-value btor468) (signal-value btor478))
             (list)))
           (btor480
            (signal
             (bvand (signal-value btor469) (signal-value btor479))
             (list)))
           (btor481
            (signal
             (bvand (signal-value btor468) (signal-value btor480))
             (list)))
           (btor482
            (signal
             (bvand (signal-value btor468) (signal-value btor481))
             (list)))
           (btor483
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state483")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state483")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state483")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state483")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor484
            (signal
             (bvand (signal-value btor482) (signal-value btor483))
             (list)))
           (btor485 (signal (bvnot (signal-value btor484)) (list)))
           (btor486
            (if (bitvector->bool (signal-value btor485)) btor467 btor457))
           (btor487
            (signal
             (concat (signal-value btor486) (signal-value btor455))
             (list)))
           (btor488
            (signal
             (bool->bitvector
              (bveq (signal-value btor487) (signal-value btor152)))
             (list)))
           (btor489
            (if (bitvector->bool (signal-value btor488)) btor454 btor453))
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
            (signal
             (concat (signal-value btor116) (signal-value btor115))
             (list)))
           (btor492
            (signal
             (concat (signal-value btor125) (signal-value btor491))
             (list)))
           (btor493
            (signal
             (concat (signal-value btor126) (signal-value btor492))
             (list)))
           (btor494
            (signal
             (concat (signal-value btor127) (signal-value btor493))
             (list)))
           (btor495
            (signal
             (concat (signal-value btor128) (signal-value btor494))
             (list)))
           (btor496
            (signal
             (concat (signal-value btor129) (signal-value btor495))
             (list)))
           (btor497
            (signal
             (concat (signal-value btor130) (signal-value btor496))
             (list)))
           (btor498
            (signal
             (concat (signal-value btor131) (signal-value btor497))
             (list)))
           (btor499
            (signal
             (concat (signal-value btor132) (signal-value btor498))
             (list)))
           (btor500
            (signal
             (concat (signal-value btor117) (signal-value btor499))
             (list)))
           (btor501
            (signal
             (concat (signal-value btor118) (signal-value btor500))
             (list)))
           (btor502
            (signal
             (concat (signal-value btor119) (signal-value btor501))
             (list)))
           (btor503
            (signal
             (concat (signal-value btor120) (signal-value btor502))
             (list)))
           (btor504
            (signal
             (concat (signal-value btor121) (signal-value btor503))
             (list)))
           (btor505
            (signal
             (concat (signal-value btor122) (signal-value btor504))
             (list)))
           (btor506
            (signal
             (concat (signal-value btor123) (signal-value btor505))
             (list)))
           (btor507
            (signal
             (concat (signal-value btor124) (signal-value btor506))
             (list)))
           (btor508
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state508")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state508")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state508")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state508")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor509
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state509")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state509")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state509")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state509")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor510
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state510")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state510")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state510")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state510")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor512
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state512")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state512")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state512")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state512")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor514
            (bv->signal
             (zero-extend (signal-value btor196) (bitvector 5))
             btor196))
           (btor515
            (signal
             (bool->bitvector
              (bveq (signal-value btor80) (signal-value btor514)))
             (list)))
           (btor516
            (if (bitvector->bool (signal-value btor515)) btor194 btor170))
           (btor517
            (bv->signal
             (zero-extend (signal-value btor224) (bitvector 5))
             btor224))
           (btor518
            (signal
             (bool->bitvector
              (bveq (signal-value btor80) (signal-value btor517)))
             (list)))
           (btor519
            (if (bitvector->bool (signal-value btor518)) btor223 btor516))
           (btor520
            (bv->signal
             (zero-extend (signal-value btor252) (bitvector 5))
             btor252))
           (btor521
            (signal
             (bool->bitvector
              (bveq (signal-value btor80) (signal-value btor520)))
             (list)))
           (btor522
            (if (bitvector->bool (signal-value btor521)) btor251 btor519))
           (btor523 (signal (bvnot (signal-value btor521)) (list)))
           (btor524 (signal (bvnot (signal-value btor518)) (list)))
           (btor525 (signal (bvnot (signal-value btor515)) (list)))
           (btor526
            (bv->signal
             (zero-extend (signal-value btor259) (bitvector 5))
             btor259))
           (btor527
            (signal
             (bool->bitvector
              (bveq (signal-value btor80) (signal-value btor526)))
             (list)))
           (btor528 (signal (bvnot (signal-value btor527)) (list)))
           (btor529
            (signal
             (bvand (signal-value btor525) (signal-value btor528))
             (list)))
           (btor530
            (signal
             (bvand (signal-value btor524) (signal-value btor529))
             (list)))
           (btor531
            (signal
             (bvand (signal-value btor523) (signal-value btor530))
             (list)))
           (btor532
            (signal
             (bvand (signal-value btor525) (signal-value btor531))
             (list)))
           (btor533
            (signal
             (bvand (signal-value btor524) (signal-value btor532))
             (list)))
           (btor534
            (signal
             (bvand (signal-value btor523) (signal-value btor533))
             (list)))
           (btor535
            (signal
             (bvand (signal-value btor524) (signal-value btor534))
             (list)))
           (btor536
            (signal
             (bvand (signal-value btor523) (signal-value btor535))
             (list)))
           (btor537
            (signal
             (bvand (signal-value btor523) (signal-value btor536))
             (list)))
           (btor538
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state538")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state538")))))
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
           (btor539
            (signal
             (bvand (signal-value btor537) (signal-value btor538))
             (list)))
           (btor540 (signal (bvnot (signal-value btor539)) (list)))
           (btor541
            (if (bitvector->bool (signal-value btor540)) btor522 btor512))
           (btor542
            (signal
             (concat (signal-value btor541) (signal-value btor510))
             (list)))
           (btor543
            (signal
             (bool->bitvector
              (bveq (signal-value btor542) (signal-value btor152)))
             (list)))
           (btor544
            (if (bitvector->bool (signal-value btor543)) btor509 btor508))
           (btor545
            (signal
             (concat (signal-value btor39) (signal-value btor38))
             (list)))
           (btor546
            (signal
             (concat (signal-value btor48) (signal-value btor545))
             (list)))
           (btor547
            (signal
             (concat (signal-value btor49) (signal-value btor546))
             (list)))
           (btor548
            (signal
             (concat (signal-value btor50) (signal-value btor547))
             (list)))
           (btor549
            (signal
             (concat (signal-value btor51) (signal-value btor548))
             (list)))
           (btor550
            (signal
             (concat (signal-value btor52) (signal-value btor549))
             (list)))
           (btor551
            (signal
             (concat (signal-value btor53) (signal-value btor550))
             (list)))
           (btor552
            (signal
             (concat (signal-value btor54) (signal-value btor551))
             (list)))
           (btor553
            (signal
             (concat (signal-value btor55) (signal-value btor552))
             (list)))
           (btor554
            (signal
             (concat (signal-value btor40) (signal-value btor553))
             (list)))
           (btor555
            (signal
             (concat (signal-value btor41) (signal-value btor554))
             (list)))
           (btor556
            (signal
             (concat (signal-value btor42) (signal-value btor555))
             (list)))
           (btor557
            (signal
             (concat (signal-value btor43) (signal-value btor556))
             (list)))
           (btor558
            (signal
             (concat (signal-value btor44) (signal-value btor557))
             (list)))
           (btor559
            (signal
             (concat (signal-value btor45) (signal-value btor558))
             (list)))
           (btor560
            (signal
             (concat (signal-value btor46) (signal-value btor559))
             (list)))
           (btor561
            (signal
             (concat (signal-value btor47) (signal-value btor560))
             (list)))
           (btor562
            (signal
             (apply bvor (bitvector->bits (signal-value btor80)))
             (signal-state btor80)))
           (btor563 (signal (bvnot (signal-value btor562)) (list)))
           (btor564
            (if (bitvector->bool (signal-value btor563)) btor561 btor544))
           (btor565
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state565")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state565")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state565")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state565")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor567
            (bv->signal
             (zero-extend (signal-value btor259) (bitvector 5))
             btor259))
           (btor568
            (signal
             (bool->bitvector
              (bveq (signal-value btor71) (signal-value btor567)))
             (list)))
           (btor569
            (if (bitvector->bool (signal-value btor568)) btor68 btor141))
           (btor570
            (bv->signal
             (zero-extend (signal-value btor196) (bitvector 5))
             btor196))
           (btor571
            (signal
             (bool->bitvector
              (bveq (signal-value btor71) (signal-value btor570)))
             (list)))
           (btor572
            (if (bitvector->bool (signal-value btor571)) btor66 btor569))
           (btor573
            (bv->signal
             (zero-extend (signal-value btor224) (bitvector 5))
             btor224))
           (btor574
            (signal
             (bool->bitvector
              (bveq (signal-value btor71) (signal-value btor573)))
             (list)))
           (btor575
            (if (bitvector->bool (signal-value btor574)) btor64 btor572))
           (btor576
            (bv->signal
             (zero-extend (signal-value btor252) (bitvector 5))
             btor252))
           (btor577
            (signal
             (bool->bitvector
              (bveq (signal-value btor71) (signal-value btor576)))
             (list)))
           (btor578
            (if (bitvector->bool (signal-value btor577)) btor62 btor575))
           (btor579 (signal (bvnot (signal-value btor577)) (list)))
           (btor580 (signal (bvnot (signal-value btor574)) (list)))
           (btor581 (signal (bvnot (signal-value btor571)) (list)))
           (btor582 (signal (bvnot (signal-value btor568)) (list)))
           (btor583
            (signal
             (apply bvor (bitvector->bits (signal-value btor71)))
             (signal-state btor71)))
           (btor584 (signal (bvnot (signal-value btor583)) (list)))
           (btor585 (signal (bvnot (signal-value btor584)) (list)))
           (btor586
            (signal
             (bvand (signal-value btor582) (signal-value btor585))
             (list)))
           (btor587
            (signal
             (bvand (signal-value btor581) (signal-value btor586))
             (list)))
           (btor588
            (signal
             (bvand (signal-value btor580) (signal-value btor587))
             (list)))
           (btor589
            (signal
             (bvand (signal-value btor579) (signal-value btor588))
             (list)))
           (btor590
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state590")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state590")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state590")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state590")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor591
            (signal
             (bvand (signal-value btor589) (signal-value btor590))
             (list)))
           (btor592 (signal (bvnot (signal-value btor591)) (list)))
           (btor593
            (if (bitvector->bool (signal-value btor592)) btor578 btor565))
           (btor594
            (if (bitvector->bool (signal-value btor593)) btor564 btor507))
           (btor595
            (if (bitvector->bool (signal-value btor95)) btor564 btor507))
           (btor596 (bv->signal (bv 9 (bitvector 4))))
           (btor597
            (bv->signal
             (zero-extend (signal-value btor596) (bitvector 5))
             btor596))
           (btor598
            (signal
             (bool->bitvector
              (bveq (signal-value btor96) (signal-value btor597)))
             (list)))
           (btor599
            (if (bitvector->bool (signal-value btor598)) btor595 btor594))
           (btor600
            (if (bitvector->bool (signal-value btor95)) btor507 btor564))
           (btor601 (bv->signal (bv 8 (bitvector 4))))
           (btor602
            (bv->signal
             (zero-extend (signal-value btor601) (bitvector 5))
             btor601))
           (btor603
            (signal
             (bool->bitvector
              (bveq (signal-value btor96) (signal-value btor602)))
             (list)))
           (btor604
            (if (bitvector->bool (signal-value btor603)) btor600 btor599))
           (btor605
            (signal
             (concat (signal-value btor21) (signal-value btor20))
             (list)))
           (btor606
            (signal
             (concat (signal-value btor30) (signal-value btor605))
             (list)))
           (btor607
            (signal
             (concat (signal-value btor31) (signal-value btor606))
             (list)))
           (btor608
            (signal
             (concat (signal-value btor32) (signal-value btor607))
             (list)))
           (btor609
            (signal
             (concat (signal-value btor33) (signal-value btor608))
             (list)))
           (btor610
            (signal
             (concat (signal-value btor34) (signal-value btor609))
             (list)))
           (btor611
            (signal
             (concat (signal-value btor35) (signal-value btor610))
             (list)))
           (btor612
            (signal
             (concat (signal-value btor36) (signal-value btor611))
             (list)))
           (btor613
            (signal
             (concat (signal-value btor37) (signal-value btor612))
             (list)))
           (btor614
            (signal
             (concat (signal-value btor22) (signal-value btor613))
             (list)))
           (btor615
            (signal
             (concat (signal-value btor23) (signal-value btor614))
             (list)))
           (btor616
            (signal
             (concat (signal-value btor24) (signal-value btor615))
             (list)))
           (btor617
            (signal
             (concat (signal-value btor25) (signal-value btor616))
             (list)))
           (btor618
            (signal
             (concat (signal-value btor26) (signal-value btor617))
             (list)))
           (btor619
            (signal
             (concat (signal-value btor27) (signal-value btor618))
             (list)))
           (btor620
            (signal
             (concat (signal-value btor28) (signal-value btor619))
             (list)))
           (btor621
            (signal
             (concat (signal-value btor29) (signal-value btor620))
             (list)))
           (btor622
            (if (bitvector->bool (signal-value btor95)) btor507 btor621))
           (btor623 (bv->signal (bv 7 (bitvector 3))))
           (btor624
            (bv->signal
             (zero-extend (signal-value btor623) (bitvector 5))
             btor623))
           (btor625
            (signal
             (bool->bitvector
              (bveq (signal-value btor96) (signal-value btor624)))
             (list)))
           (btor626
            (if (bitvector->bool (signal-value btor625)) btor622 btor604))
           (btor627 (signal (bvnot (signal-value btor625)) (list)))
           (btor628 (signal (bvnot (signal-value btor603)) (list)))
           (btor629 (signal (bvnot (signal-value btor598)) (list)))
           (btor630 (bv->signal (bv 10 (bitvector 4))))
           (btor631
            (bv->signal
             (zero-extend (signal-value btor630) (bitvector 5))
             btor630))
           (btor632
            (signal
             (bool->bitvector
              (bveq (signal-value btor96) (signal-value btor631)))
             (list)))
           (btor633 (signal (bvnot (signal-value btor632)) (list)))
           (btor634
            (signal
             (bvand (signal-value btor629) (signal-value btor633))
             (list)))
           (btor635
            (signal
             (bvand (signal-value btor628) (signal-value btor634))
             (list)))
           (btor636
            (signal
             (bvand (signal-value btor627) (signal-value btor635))
             (list)))
           (btor637
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state637")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state637")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state637")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state637")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor638
            (signal
             (bvand (signal-value btor636) (signal-value btor637))
             (list)))
           (btor639 (signal (bvnot (signal-value btor638)) (list)))
           (btor640
            (if (bitvector->bool (signal-value btor639)) btor626 btor490))
           (btor641
            (signal
             (apply bvor (bitvector->bits (signal-value btor77)))
             (signal-state btor77)))
           (btor642 (signal (bvnot (signal-value btor641)) (list)))
           (btor643
            (if (bitvector->bool (signal-value btor642)) btor640 btor489))
           (btor644
            (signal
             (extract 17 17 (signal-value btor643))
             (signal-state btor643)))
           (btor645
            (signal
             (extract 17 17 (signal-value btor643))
             (signal-state btor643)))
           (btor646
            (signal
             (concat (signal-value btor645) (signal-value btor644))
             (list)))
           (btor647
            (signal
             (extract 17 17 (signal-value btor643))
             (signal-state btor643)))
           (btor648
            (signal
             (concat (signal-value btor647) (signal-value btor646))
             (list)))
           (btor649
            (signal
             (extract 17 17 (signal-value btor643))
             (signal-state btor643)))
           (btor650
            (signal
             (concat (signal-value btor649) (signal-value btor648))
             (list)))
           (btor651
            (signal
             (extract 17 17 (signal-value btor643))
             (signal-state btor643)))
           (btor652
            (signal
             (concat (signal-value btor651) (signal-value btor650))
             (list)))
           (btor653
            (signal
             (extract 17 17 (signal-value btor643))
             (signal-state btor643)))
           (btor654
            (signal
             (concat (signal-value btor653) (signal-value btor652))
             (list)))
           (btor655
            (signal
             (extract 17 17 (signal-value btor643))
             (signal-state btor643)))
           (btor656
            (signal
             (concat (signal-value btor655) (signal-value btor654))
             (list)))
           (btor657
            (signal
             (extract 17 17 (signal-value btor643))
             (signal-state btor643)))
           (btor658
            (signal
             (concat (signal-value btor657) (signal-value btor656))
             (list)))
           (btor659
            (signal
             (extract 17 17 (signal-value btor643))
             (signal-state btor643)))
           (btor660
            (signal
             (concat (signal-value btor659) (signal-value btor658))
             (list)))
           (btor661
            (signal
             (extract 17 17 (signal-value btor643))
             (signal-state btor643)))
           (btor662
            (signal
             (concat (signal-value btor661) (signal-value btor660))
             (list)))
           (btor663
            (signal
             (extract 17 17 (signal-value btor643))
             (signal-state btor643)))
           (btor664
            (signal
             (concat (signal-value btor663) (signal-value btor662))
             (list)))
           (btor665
            (signal
             (extract 17 17 (signal-value btor643))
             (signal-state btor643)))
           (btor666
            (signal
             (concat (signal-value btor665) (signal-value btor664))
             (list)))
           (btor667
            (signal
             (extract 17 17 (signal-value btor643))
             (signal-state btor643)))
           (btor668
            (signal
             (concat (signal-value btor667) (signal-value btor666))
             (list)))
           (btor669
            (signal
             (extract 17 17 (signal-value btor643))
             (signal-state btor643)))
           (btor670
            (signal
             (concat (signal-value btor669) (signal-value btor668))
             (list)))
           (btor671
            (signal
             (extract 17 17 (signal-value btor643))
             (signal-state btor643)))
           (btor672
            (signal
             (concat (signal-value btor671) (signal-value btor670))
             (list)))
           (btor673
            (signal
             (extract 17 17 (signal-value btor643))
             (signal-state btor643)))
           (btor674
            (signal
             (concat (signal-value btor673) (signal-value btor672))
             (list)))
           (btor675
            (signal
             (extract 17 17 (signal-value btor643))
             (signal-state btor643)))
           (btor676
            (signal
             (concat (signal-value btor675) (signal-value btor674))
             (list)))
           (btor677
            (signal
             (extract 17 17 (signal-value btor643))
             (signal-state btor643)))
           (btor678
            (signal
             (concat (signal-value btor677) (signal-value btor676))
             (list)))
           (btor679
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state679")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state679")))))
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
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor680
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state680")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state680")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state680")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state680")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor681
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state681")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state681")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state681")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state681")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor683
            (signal
             (concat (signal-value btor486) (signal-value btor681))
             (list)))
           (btor684
            (signal
             (bool->bitvector
              (bveq (signal-value btor683) (signal-value btor152)))
             (list)))
           (btor685
            (if (bitvector->bool (signal-value btor684)) btor680 btor679))
           (btor686
            (if (bitvector->bool (signal-value btor642)) btor93 btor685))
           (btor687
            (if (bitvector->bool (signal-value btor686)) btor678 btor407))
           (btor688
            (signal
             (concat (signal-value btor687) (signal-value btor643))
             (list)))
           (btor689
            (signal
             (bvmul (signal-value btor452) (signal-value btor688))
             (list)))
           (btor690
            (signal
             (apply bvor (bitvector->bits (signal-value btor452)))
             (signal-state btor452)))
           (btor691 (signal (bvnot (signal-value btor690)) (list)))
           (btor692
            (signal
             (apply bvor (bitvector->bits (signal-value btor688)))
             (signal-state btor688)))
           (btor693 (signal (bvnot (signal-value btor692)) (list)))
           (btor694
            (signal
             (bvor (signal-value btor691) (signal-value btor693))
             (list)))
           (btor695
            (if (bitvector->bool (signal-value btor694)) btor134 btor689))
           (btor696
            (signal
             (apply bvor (bitvector->bits (signal-value btor86)))
             (signal-state btor86)))
           (btor697 (signal (bvnot (signal-value btor696)) (list)))
           (btor698
            (if (bitvector->bool (signal-value btor697)) btor695 btor314))
           (btor699
            (signal
             (apply bvor (bitvector->bits (signal-value btor83)))
             (signal-state btor83)))
           (btor700 (signal (bvnot (signal-value btor699)) (list)))
           (btor701
            (if (bitvector->bool (signal-value btor700)) btor698 btor278))
           (btor702
            (bv->signal
             (zero-extend (signal-value btor161) (bitvector 5))
             btor161))
           (btor703
            (signal
             (bool->bitvector
              (bveq (signal-value btor72) (signal-value btor702)))
             (list)))
           (btor704
            (if (bitvector->bool (signal-value btor703)) btor701 btor134))
           (btor705
            (signal
             (extract 0 0 (signal-value btor704))
             (signal-state btor704)))
           (btor707
            (signal
             (extract 1 1 (signal-value btor704))
             (signal-state btor704)))
           (btor709
            (signal
             (extract 10 10 (signal-value btor704))
             (signal-state btor704)))
           (btor711
            (signal
             (extract 11 11 (signal-value btor704))
             (signal-state btor704)))
           (btor713
            (signal
             (extract 12 12 (signal-value btor704))
             (signal-state btor704)))
           (btor715
            (signal
             (extract 13 13 (signal-value btor704))
             (signal-state btor704)))
           (btor717
            (signal
             (extract 14 14 (signal-value btor704))
             (signal-state btor704)))
           (btor719
            (signal
             (extract 15 15 (signal-value btor704))
             (signal-state btor704)))
           (btor721
            (signal
             (extract 16 16 (signal-value btor704))
             (signal-state btor704)))
           (btor723
            (signal
             (extract 17 17 (signal-value btor704))
             (signal-state btor704)))
           (btor725
            (signal
             (extract 18 18 (signal-value btor704))
             (signal-state btor704)))
           (btor727
            (signal
             (extract 19 19 (signal-value btor704))
             (signal-state btor704)))
           (btor729
            (signal
             (extract 2 2 (signal-value btor704))
             (signal-state btor704)))
           (btor731
            (signal
             (extract 20 20 (signal-value btor704))
             (signal-state btor704)))
           (btor733
            (signal
             (extract 21 21 (signal-value btor704))
             (signal-state btor704)))
           (btor735
            (signal
             (extract 22 22 (signal-value btor704))
             (signal-state btor704)))
           (btor737
            (signal
             (extract 23 23 (signal-value btor704))
             (signal-state btor704)))
           (btor739
            (signal
             (extract 24 24 (signal-value btor704))
             (signal-state btor704)))
           (btor741
            (signal
             (extract 25 25 (signal-value btor704))
             (signal-state btor704)))
           (btor743
            (signal
             (extract 26 26 (signal-value btor704))
             (signal-state btor704)))
           (btor745
            (signal
             (extract 27 27 (signal-value btor704))
             (signal-state btor704)))
           (btor747
            (signal
             (extract 28 28 (signal-value btor704))
             (signal-state btor704)))
           (btor749
            (signal
             (extract 29 29 (signal-value btor704))
             (signal-state btor704)))
           (btor751
            (signal
             (extract 3 3 (signal-value btor704))
             (signal-state btor704)))
           (btor753
            (signal
             (extract 30 30 (signal-value btor704))
             (signal-state btor704)))
           (btor755
            (signal
             (extract 31 31 (signal-value btor704))
             (signal-state btor704)))
           (btor757
            (signal
             (extract 32 32 (signal-value btor704))
             (signal-state btor704)))
           (btor759
            (signal
             (extract 33 33 (signal-value btor704))
             (signal-state btor704)))
           (btor761
            (signal
             (extract 34 34 (signal-value btor704))
             (signal-state btor704)))
           (btor763
            (signal
             (extract 35 35 (signal-value btor704))
             (signal-state btor704)))
           (btor765
            (signal
             (extract 4 4 (signal-value btor704))
             (signal-state btor704)))
           (btor767
            (signal
             (extract 5 5 (signal-value btor704))
             (signal-state btor704)))
           (btor769
            (signal
             (extract 6 6 (signal-value btor704))
             (signal-state btor704)))
           (btor771
            (signal
             (extract 7 7 (signal-value btor704))
             (signal-state btor704)))
           (btor773
            (signal
             (extract 8 8 (signal-value btor704))
             (signal-state btor704)))
           (btor775
            (signal
             (extract 9 9 (signal-value btor704))
             (signal-state btor704)))
           (btor777
            (signal
             (extract 0 0 (signal-value btor406))
             (signal-state btor406)))
           (btor779
            (signal
             (extract 1 1 (signal-value btor406))
             (signal-state btor406)))
           (btor781
            (signal
             (extract 10 10 (signal-value btor406))
             (signal-state btor406)))
           (btor783
            (signal
             (extract 11 11 (signal-value btor406))
             (signal-state btor406)))
           (btor785
            (signal
             (extract 12 12 (signal-value btor406))
             (signal-state btor406)))
           (btor787
            (signal
             (extract 13 13 (signal-value btor406))
             (signal-state btor406)))
           (btor789
            (signal
             (extract 14 14 (signal-value btor406))
             (signal-state btor406)))
           (btor791
            (signal
             (extract 15 15 (signal-value btor406))
             (signal-state btor406)))
           (btor793
            (signal
             (extract 16 16 (signal-value btor406))
             (signal-state btor406)))
           (btor795
            (signal
             (extract 17 17 (signal-value btor406))
             (signal-state btor406)))
           (btor797
            (signal
             (extract 2 2 (signal-value btor406))
             (signal-state btor406)))
           (btor799
            (signal
             (extract 3 3 (signal-value btor406))
             (signal-state btor406)))
           (btor801
            (signal
             (extract 4 4 (signal-value btor406))
             (signal-state btor406)))
           (btor803
            (signal
             (extract 5 5 (signal-value btor406))
             (signal-state btor406)))
           (btor805
            (signal
             (extract 6 6 (signal-value btor406))
             (signal-state btor406)))
           (btor807
            (signal
             (extract 7 7 (signal-value btor406))
             (signal-state btor406)))
           (btor809
            (signal
             (extract 8 8 (signal-value btor406))
             (signal-state btor406)))
           (btor811
            (signal
             (extract 9 9 (signal-value btor406))
             (signal-state btor406)))
           (btor813
            (signal
             (extract 0 0 (signal-value btor643))
             (signal-state btor643)))
           (btor815
            (signal
             (extract 1 1 (signal-value btor643))
             (signal-state btor643)))
           (btor817
            (signal
             (extract 10 10 (signal-value btor643))
             (signal-state btor643)))
           (btor819
            (signal
             (extract 11 11 (signal-value btor643))
             (signal-state btor643)))
           (btor821
            (signal
             (extract 12 12 (signal-value btor643))
             (signal-state btor643)))
           (btor823
            (signal
             (extract 13 13 (signal-value btor643))
             (signal-state btor643)))
           (btor825
            (signal
             (extract 14 14 (signal-value btor643))
             (signal-state btor643)))
           (btor827
            (signal
             (extract 15 15 (signal-value btor643))
             (signal-state btor643)))
           (btor829
            (signal
             (extract 16 16 (signal-value btor643))
             (signal-state btor643)))
           (btor831
            (signal
             (extract 17 17 (signal-value btor643))
             (signal-state btor643)))
           (btor833
            (signal
             (extract 2 2 (signal-value btor643))
             (signal-state btor643)))
           (btor835
            (signal
             (extract 3 3 (signal-value btor643))
             (signal-state btor643)))
           (btor837
            (signal
             (extract 4 4 (signal-value btor643))
             (signal-state btor643)))
           (btor839
            (signal
             (extract 5 5 (signal-value btor643))
             (signal-state btor643)))
           (btor841
            (signal
             (extract 6 6 (signal-value btor643))
             (signal-state btor643)))
           (btor843
            (signal
             (extract 7 7 (signal-value btor643))
             (signal-state btor643)))
           (btor845
            (signal
             (extract 8 8 (signal-value btor643))
             (signal-state btor643)))
           (btor847
            (signal
             (extract 9 9 (signal-value btor643))
             (signal-state btor643)))
           (btor849
            (signal
             (extract 0 0 (signal-value btor564))
             (signal-state btor564)))
           (btor851
            (signal
             (extract 1 1 (signal-value btor564))
             (signal-state btor564)))
           (btor853
            (signal
             (extract 10 10 (signal-value btor564))
             (signal-state btor564)))
           (btor855
            (signal
             (extract 11 11 (signal-value btor564))
             (signal-state btor564)))
           (btor857
            (signal
             (extract 12 12 (signal-value btor564))
             (signal-state btor564)))
           (btor859
            (signal
             (extract 13 13 (signal-value btor564))
             (signal-state btor564)))
           (btor861
            (signal
             (extract 14 14 (signal-value btor564))
             (signal-state btor564)))
           (btor863
            (signal
             (extract 15 15 (signal-value btor564))
             (signal-state btor564)))
           (btor865
            (signal
             (extract 16 16 (signal-value btor564))
             (signal-state btor564)))
           (btor867
            (signal
             (extract 17 17 (signal-value btor564))
             (signal-state btor564)))
           (btor869
            (signal
             (extract 2 2 (signal-value btor564))
             (signal-state btor564)))
           (btor871
            (signal
             (extract 3 3 (signal-value btor564))
             (signal-state btor564)))
           (btor873
            (signal
             (extract 4 4 (signal-value btor564))
             (signal-state btor564)))
           (btor875
            (signal
             (extract 5 5 (signal-value btor564))
             (signal-state btor564)))
           (btor877
            (signal
             (extract 6 6 (signal-value btor564))
             (signal-state btor564)))
           (btor879
            (signal
             (extract 7 7 (signal-value btor564))
             (signal-state btor564)))
           (btor881
            (signal
             (extract 8 8 (signal-value btor564))
             (signal-state btor564)))
           (btor883
            (signal
             (extract 9 9 (signal-value btor564))
             (signal-state btor564)))
           (btor885
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state885")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state885")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state885")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state885")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor886
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state886")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state886")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state886")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state886")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor887
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state887")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state887")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state887")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state887")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor889
            (signal
             (concat (signal-value btor311) (signal-value btor887))
             (list)))
           (btor890
            (signal
             (bool->bitvector
              (bveq (signal-value btor889) (signal-value btor152)))
             (list)))
           (btor891
            (if (bitvector->bool (signal-value btor890)) btor886 btor885))
           (btor892
            (signal
             (bvor (signal-value btor450) (signal-value btor686))
             (list)))
           (btor893
            (if (bitvector->bool (signal-value btor697)) btor892 btor891))
           (btor895
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state895")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state895")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state895")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state895")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor896
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state896")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state896")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state896")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state896")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor897
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state897")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state897")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state897")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state897")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor898
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state898")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state898")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state898")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state898")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor900
            (signal
             (concat (signal-value btor348) (signal-value btor898))
             (list)))
           (btor901
            (signal
             (bool->bitvector
              (bveq (signal-value btor900) (signal-value btor152)))
             (list)))
           (btor902
            (if (bitvector->bool (signal-value btor901)) btor897 btor896))
           (btor903
            (if (bitvector->bool (signal-value btor405)) btor406 btor902))
           (btor904 (bv->signal (bv 4 (bitvector 3))))
           (btor905
            (bv->signal
             (zero-extend (signal-value btor904) (bitvector 5))
             btor904))
           (btor906
            (signal
             (bool->bitvector
              (bveq (signal-value btor57) (signal-value btor905)))
             (list)))
           (btor907
            (if (bitvector->bool (signal-value btor906)) btor406 btor903))
           (btor908 (signal (bvnot (signal-value btor906)) (list)))
           (btor909 (bv->signal (bv 22 (bitvector 5))))
           (btor910
            (signal
             (bool->bitvector
              (bveq (signal-value btor57) (signal-value btor909)))
             (list)))
           (btor911 (signal (bvnot (signal-value btor910)) (list)))
           (btor912
            (signal
             (bvand (signal-value btor908) (signal-value btor911))
             (list)))
           (btor913
            (signal
             (bvand (signal-value btor908) (signal-value btor912))
             (list)))
           (btor914
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state914")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state914")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state914")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state914")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor915
            (signal
             (bvand (signal-value btor913) (signal-value btor914))
             (list)))
           (btor916 (signal (bvnot (signal-value btor915)) (list)))
           (btor917
            (if (bitvector->bool (signal-value btor916)) btor907 btor895))
           (btor918
            (signal
             (extract 0 0 (signal-value btor917))
             (signal-state btor917)))
           (btor920
            (signal
             (extract 1 1 (signal-value btor917))
             (signal-state btor917)))
           (btor922
            (signal
             (extract 10 10 (signal-value btor917))
             (signal-state btor917)))
           (btor924
            (signal
             (extract 11 11 (signal-value btor917))
             (signal-state btor917)))
           (btor926
            (signal
             (extract 12 12 (signal-value btor917))
             (signal-state btor917)))
           (btor928
            (signal
             (extract 13 13 (signal-value btor917))
             (signal-state btor917)))
           (btor930
            (signal
             (extract 14 14 (signal-value btor917))
             (signal-state btor917)))
           (btor932
            (signal
             (extract 15 15 (signal-value btor917))
             (signal-state btor917)))
           (btor934
            (signal
             (extract 16 16 (signal-value btor917))
             (signal-state btor917)))
           (btor936
            (signal
             (extract 17 17 (signal-value btor917))
             (signal-state btor917)))
           (btor938
            (signal
             (extract 2 2 (signal-value btor917))
             (signal-state btor917)))
           (btor940
            (signal
             (extract 3 3 (signal-value btor917))
             (signal-state btor917)))
           (btor942
            (signal
             (extract 4 4 (signal-value btor917))
             (signal-state btor917)))
           (btor944
            (signal
             (extract 5 5 (signal-value btor917))
             (signal-state btor917)))
           (btor946
            (signal
             (extract 6 6 (signal-value btor917))
             (signal-state btor917)))
           (btor948
            (signal
             (extract 7 7 (signal-value btor917))
             (signal-state btor917)))
           (btor950
            (signal
             (extract 8 8 (signal-value btor917))
             (signal-state btor917)))
           (btor952
            (signal
             (extract 9 9 (signal-value btor917))
             (signal-state btor917)))
           (btor972
            (bv->signal
             (zero-extend (signal-value btor58) (bitvector 1))
             btor58))
           (btor973
            (bv->signal
             (zero-extend (signal-value btor59) (bitvector 1))
             btor59))
           (btor974
            (bv->signal
             (zero-extend (signal-value btor60) (bitvector 1))
             btor60))
           (btor975
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 1))
             btor61))
           (btor976
            (bv->signal
             (zero-extend (signal-value btor238) (bitvector 1))
             btor238))
           (btor977
            (bv->signal
             (zero-extend (signal-value btor251) (bitvector 1))
             btor251))
           (btor978
            (bv->signal
             (zero-extend (signal-value btor62) (bitvector 1))
             btor62))
           (btor979
            (bv->signal
             (zero-extend (signal-value btor210) (bitvector 1))
             btor210))
           (btor980
            (bv->signal
             (zero-extend (signal-value btor223) (bitvector 1))
             btor223))
           (btor981
            (bv->signal
             (zero-extend (signal-value btor64) (bitvector 1))
             btor64))
           (btor982
            (bv->signal
             (zero-extend (signal-value btor181) (bitvector 1))
             btor181))
           (btor983
            (bv->signal
             (zero-extend (signal-value btor194) (bitvector 1))
             btor194))
           (btor984
            (bv->signal
             (zero-extend (signal-value btor66) (bitvector 1))
             btor66))
           (btor985
            (bv->signal
             (zero-extend (signal-value btor154) (bitvector 1))
             btor154))
           (btor986
            (bv->signal
             (zero-extend (signal-value btor170) (bitvector 1))
             btor170))
           (btor987
            (bv->signal
             (zero-extend (signal-value btor68) (bitvector 1))
             btor68))
           (btor988
            (bv->signal
             (zero-extend (signal-value btor88) (bitvector 1))
             btor88))
           (btor989
            (bv->signal
             (zero-extend (signal-value btor89) (bitvector 1))
             btor89))
           (btor990
            (bv->signal
             (zero-extend (signal-value btor90) (bitvector 1))
             btor90))
           (btor991
            (bv->signal
             (zero-extend (signal-value btor91) (bitvector 1))
             btor91))
           (btor992
            (bv->signal
             (zero-extend (signal-value btor381) (bitvector 18))
             btor381))
           (btor993
            (bv->signal
             (zero-extend (signal-value btor406) (bitvector 18))
             btor406))
           (btor994
            (bv->signal
             (zero-extend (signal-value btor902) (bitvector 18))
             btor902))
           (btor995
            (bv->signal
             (zero-extend (signal-value btor902) (bitvector 18))
             btor902))
           (btor996
            (bv->signal
             (zero-extend (signal-value btor903) (bitvector 18))
             btor903))
           (btor997
            (bv->signal
             (zero-extend (signal-value btor917) (bitvector 18))
             btor917))
           (btor998
            (bv->signal
             (zero-extend (signal-value btor452) (bitvector 36))
             btor452))
           (btor999
            (bv->signal
             (zero-extend (signal-value btor351) (bitvector 18))
             btor351))
           (btor1000
            (bv->signal
             (zero-extend (signal-value btor351) (bitvector 18))
             btor351))
           (btor1001
            (bv->signal
             (zero-extend (signal-value btor398) (bitvector 18))
             btor398))
           (btor1002
            (bv->signal
             (zero-extend (signal-value btor403) (bitvector 18))
             btor403))
           (btor1003
            (bv->signal
             (zero-extend (signal-value btor621) (bitvector 18))
             btor621))
           (btor1004
            (bv->signal
             (zero-extend (signal-value btor643) (bitvector 18))
             btor643))
           (btor1005
            (bv->signal
             (zero-extend (signal-value btor688) (bitvector 36))
             btor688))
           (btor1006
            (bv->signal
             (zero-extend (signal-value btor489) (bitvector 18))
             btor489))
           (btor1007
            (bv->signal
             (zero-extend (signal-value btor489) (bitvector 18))
             btor489))
           (btor1008
            (bv->signal
             (zero-extend (signal-value btor507) (bitvector 18))
             btor507))
           (btor1009
            (bv->signal
             (zero-extend (signal-value btor640) (bitvector 18))
             btor640))
           (btor1010
            (bv->signal
             (zero-extend (signal-value btor561) (bitvector 18))
             btor561))
           (btor1011
            (bv->signal
             (zero-extend (signal-value btor564) (bitvector 18))
             btor564))
           (btor1012
            (bv->signal
             (zero-extend (signal-value btor544) (bitvector 18))
             btor544))
           (btor1013
            (bv->signal
             (zero-extend (signal-value btor544) (bitvector 18))
             btor544))
           (btor1014
            (bv->signal
             (zero-extend (signal-value btor593) (bitvector 1))
             btor593))
           (btor1015
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1015")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1015")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1015")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1015")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1016 (bv->signal (bv 16 (bitvector 5))))
           (btor1017
            (signal
             (bool->bitvector
              (bveq (signal-value btor73) (signal-value btor1016)))
             (list)))
           (btor1018
            (if (bitvector->bool (signal-value btor1017)) btor60 btor61))
           (btor1019 (bv->signal (bv 15 (bitvector 4))))
           (btor1020
            (bv->signal
             (zero-extend (signal-value btor1019) (bitvector 5))
             btor1019))
           (btor1021
            (signal
             (bool->bitvector
              (bveq (signal-value btor73) (signal-value btor1020)))
             (list)))
           (btor1022
            (if (bitvector->bool (signal-value btor1021)) btor59 btor1018))
           (btor1023
            (bv->signal
             (zero-extend (signal-value btor137) (bitvector 5))
             btor137))
           (btor1024
            (signal
             (bool->bitvector
              (bveq (signal-value btor73) (signal-value btor1023)))
             (list)))
           (btor1025
            (if (bitvector->bool (signal-value btor1024)) btor58 btor1022))
           (btor1026 (signal (bvnot (signal-value btor1024)) (list)))
           (btor1027 (signal (bvnot (signal-value btor1021)) (list)))
           (btor1028 (signal (bvnot (signal-value btor1017)) (list)))
           (btor1029 (bv->signal (bv 17 (bitvector 5))))
           (btor1030
            (signal
             (bool->bitvector
              (bveq (signal-value btor73) (signal-value btor1029)))
             (list)))
           (btor1031 (signal (bvnot (signal-value btor1030)) (list)))
           (btor1032
            (signal
             (bvand (signal-value btor1028) (signal-value btor1031))
             (list)))
           (btor1033
            (signal
             (bvand (signal-value btor1027) (signal-value btor1032))
             (list)))
           (btor1034
            (signal
             (bvand (signal-value btor1026) (signal-value btor1033))
             (list)))
           (btor1035
            (signal
             (bvand (signal-value btor1028) (signal-value btor1034))
             (list)))
           (btor1036
            (signal
             (bvand (signal-value btor1027) (signal-value btor1035))
             (list)))
           (btor1037
            (signal
             (bvand (signal-value btor1026) (signal-value btor1036))
             (list)))
           (btor1038
            (signal
             (bvand (signal-value btor1027) (signal-value btor1037))
             (list)))
           (btor1039
            (signal
             (bvand (signal-value btor1026) (signal-value btor1038))
             (list)))
           (btor1040
            (signal
             (bvand (signal-value btor1026) (signal-value btor1039))
             (list)))
           (btor1041
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1041")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1041")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1041")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1041")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1042
            (signal
             (bvand (signal-value btor1040) (signal-value btor1041))
             (list)))
           (btor1043 (signal (bvnot (signal-value btor1042)) (list)))
           (btor1044
            (if (bitvector->bool (signal-value btor1043)) btor1025 btor1015))
           (btor1045
            (bv->signal
             (zero-extend (signal-value btor1044) (bitvector 1))
             btor1044))
           (btor1046
            (bv->signal
             (zero-extend (signal-value btor348) (bitvector 1))
             btor348))
           (btor1047
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1047")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1047")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1047")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1047")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1048 (bv->signal (bv 19 (bitvector 5))))
           (btor1049
            (signal
             (bool->bitvector
              (bveq (signal-value btor75) (signal-value btor1048)))
             (list)))
           (btor1050
            (if (bitvector->bool (signal-value btor1049)) btor90 btor91))
           (btor1051 (bv->signal (bv 18 (bitvector 5))))
           (btor1052
            (signal
             (bool->bitvector
              (bveq (signal-value btor75) (signal-value btor1051)))
             (list)))
           (btor1053
            (if (bitvector->bool (signal-value btor1052)) btor89 btor1050))
           (btor1054
            (bv->signal
             (zero-extend (signal-value btor152) (bitvector 5))
             btor152))
           (btor1055
            (signal
             (bool->bitvector
              (bveq (signal-value btor75) (signal-value btor1054)))
             (list)))
           (btor1056
            (if (bitvector->bool (signal-value btor1055)) btor88 btor1053))
           (btor1057 (signal (bvnot (signal-value btor1055)) (list)))
           (btor1058 (signal (bvnot (signal-value btor1052)) (list)))
           (btor1059 (signal (bvnot (signal-value btor1049)) (list)))
           (btor1060 (bv->signal (bv 20 (bitvector 5))))
           (btor1061
            (signal
             (bool->bitvector
              (bveq (signal-value btor75) (signal-value btor1060)))
             (list)))
           (btor1062 (signal (bvnot (signal-value btor1061)) (list)))
           (btor1063
            (signal
             (bvand (signal-value btor1059) (signal-value btor1062))
             (list)))
           (btor1064
            (signal
             (bvand (signal-value btor1058) (signal-value btor1063))
             (list)))
           (btor1065
            (signal
             (bvand (signal-value btor1057) (signal-value btor1064))
             (list)))
           (btor1066
            (signal
             (bvand (signal-value btor1059) (signal-value btor1065))
             (list)))
           (btor1067
            (signal
             (bvand (signal-value btor1058) (signal-value btor1066))
             (list)))
           (btor1068
            (signal
             (bvand (signal-value btor1057) (signal-value btor1067))
             (list)))
           (btor1069
            (signal
             (bvand (signal-value btor1058) (signal-value btor1068))
             (list)))
           (btor1070
            (signal
             (bvand (signal-value btor1057) (signal-value btor1069))
             (list)))
           (btor1071
            (signal
             (bvand (signal-value btor1057) (signal-value btor1070))
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
            (signal
             (bvand (signal-value btor1071) (signal-value btor1072))
             (list)))
           (btor1074 (signal (bvnot (signal-value btor1073)) (list)))
           (btor1075
            (if (bitvector->bool (signal-value btor1074)) btor1056 btor1047))
           (btor1076
            (bv->signal
             (zero-extend (signal-value btor1075) (bitvector 1))
             btor1075))
           (btor1077
            (bv->signal
             (zero-extend (signal-value btor1075) (bitvector 1))
             btor1075))
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
           (btor1079
            (signal
             (bool->bitvector
              (bveq (signal-value btor76) (signal-value btor1016)))
             (list)))
           (btor1080
            (if (bitvector->bool (signal-value btor1079)) btor60 btor61))
           (btor1081
            (bv->signal
             (zero-extend (signal-value btor1019) (bitvector 5))
             btor1019))
           (btor1082
            (signal
             (bool->bitvector
              (bveq (signal-value btor76) (signal-value btor1081)))
             (list)))
           (btor1083
            (if (bitvector->bool (signal-value btor1082)) btor59 btor1080))
           (btor1084
            (bv->signal
             (zero-extend (signal-value btor137) (bitvector 5))
             btor137))
           (btor1085
            (signal
             (bool->bitvector
              (bveq (signal-value btor76) (signal-value btor1084)))
             (list)))
           (btor1086
            (if (bitvector->bool (signal-value btor1085)) btor58 btor1083))
           (btor1087 (signal (bvnot (signal-value btor1085)) (list)))
           (btor1088 (signal (bvnot (signal-value btor1082)) (list)))
           (btor1089 (signal (bvnot (signal-value btor1079)) (list)))
           (btor1090
            (signal
             (bool->bitvector
              (bveq (signal-value btor76) (signal-value btor1029)))
             (list)))
           (btor1091 (signal (bvnot (signal-value btor1090)) (list)))
           (btor1092
            (signal
             (bvand (signal-value btor1089) (signal-value btor1091))
             (list)))
           (btor1093
            (signal
             (bvand (signal-value btor1088) (signal-value btor1092))
             (list)))
           (btor1094
            (signal
             (bvand (signal-value btor1087) (signal-value btor1093))
             (list)))
           (btor1095
            (signal
             (bvand (signal-value btor1089) (signal-value btor1094))
             (list)))
           (btor1096
            (signal
             (bvand (signal-value btor1088) (signal-value btor1095))
             (list)))
           (btor1097
            (signal
             (bvand (signal-value btor1087) (signal-value btor1096))
             (list)))
           (btor1098
            (signal
             (bvand (signal-value btor1088) (signal-value btor1097))
             (list)))
           (btor1099
            (signal
             (bvand (signal-value btor1087) (signal-value btor1098))
             (list)))
           (btor1100
            (signal
             (bvand (signal-value btor1087) (signal-value btor1099))
             (list)))
           (btor1101
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1101")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1101")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1101")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1101")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1102
            (signal
             (bvand (signal-value btor1100) (signal-value btor1101))
             (list)))
           (btor1103 (signal (bvnot (signal-value btor1102)) (list)))
           (btor1104
            (if (bitvector->bool (signal-value btor1103)) btor1086 btor1078))
           (btor1105
            (bv->signal
             (zero-extend (signal-value btor1104) (bitvector 1))
             btor1104))
           (btor1106
            (bv->signal
             (zero-extend (signal-value btor486) (bitvector 1))
             btor486))
           (btor1107
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1107")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1107")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1107")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1107")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1108
            (signal
             (bool->bitvector
              (bveq (signal-value btor78) (signal-value btor1048)))
             (list)))
           (btor1109
            (if (bitvector->bool (signal-value btor1108)) btor90 btor91))
           (btor1110
            (signal
             (bool->bitvector
              (bveq (signal-value btor78) (signal-value btor1051)))
             (list)))
           (btor1111
            (if (bitvector->bool (signal-value btor1110)) btor89 btor1109))
           (btor1112
            (bv->signal
             (zero-extend (signal-value btor152) (bitvector 5))
             btor152))
           (btor1113
            (signal
             (bool->bitvector
              (bveq (signal-value btor78) (signal-value btor1112)))
             (list)))
           (btor1114
            (if (bitvector->bool (signal-value btor1113)) btor88 btor1111))
           (btor1115 (signal (bvnot (signal-value btor1113)) (list)))
           (btor1116 (signal (bvnot (signal-value btor1110)) (list)))
           (btor1117 (signal (bvnot (signal-value btor1108)) (list)))
           (btor1118
            (signal
             (bool->bitvector
              (bveq (signal-value btor78) (signal-value btor1060)))
             (list)))
           (btor1119 (signal (bvnot (signal-value btor1118)) (list)))
           (btor1120
            (signal
             (bvand (signal-value btor1117) (signal-value btor1119))
             (list)))
           (btor1121
            (signal
             (bvand (signal-value btor1116) (signal-value btor1120))
             (list)))
           (btor1122
            (signal
             (bvand (signal-value btor1115) (signal-value btor1121))
             (list)))
           (btor1123
            (signal
             (bvand (signal-value btor1117) (signal-value btor1122))
             (list)))
           (btor1124
            (signal
             (bvand (signal-value btor1116) (signal-value btor1123))
             (list)))
           (btor1125
            (signal
             (bvand (signal-value btor1115) (signal-value btor1124))
             (list)))
           (btor1126
            (signal
             (bvand (signal-value btor1116) (signal-value btor1125))
             (list)))
           (btor1127
            (signal
             (bvand (signal-value btor1115) (signal-value btor1126))
             (list)))
           (btor1128
            (signal
             (bvand (signal-value btor1115) (signal-value btor1127))
             (list)))
           (btor1129
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1129")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1129")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1129")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1129")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1130
            (signal
             (bvand (signal-value btor1128) (signal-value btor1129))
             (list)))
           (btor1131 (signal (bvnot (signal-value btor1130)) (list)))
           (btor1132
            (if (bitvector->bool (signal-value btor1131)) btor1114 btor1107))
           (btor1133
            (bv->signal
             (zero-extend (signal-value btor1132) (bitvector 1))
             btor1132))
           (btor1134
            (bv->signal
             (zero-extend (signal-value btor1132) (bitvector 1))
             btor1132))
           (btor1135
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1135")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1135")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1135")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1135")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1136
            (signal
             (bool->bitvector
              (bveq (signal-value btor79) (signal-value btor1016)))
             (list)))
           (btor1137
            (if (bitvector->bool (signal-value btor1136)) btor60 btor61))
           (btor1138
            (bv->signal
             (zero-extend (signal-value btor1019) (bitvector 5))
             btor1019))
           (btor1139
            (signal
             (bool->bitvector
              (bveq (signal-value btor79) (signal-value btor1138)))
             (list)))
           (btor1140
            (if (bitvector->bool (signal-value btor1139)) btor59 btor1137))
           (btor1141
            (bv->signal
             (zero-extend (signal-value btor137) (bitvector 5))
             btor137))
           (btor1142
            (signal
             (bool->bitvector
              (bveq (signal-value btor79) (signal-value btor1141)))
             (list)))
           (btor1143
            (if (bitvector->bool (signal-value btor1142)) btor58 btor1140))
           (btor1144 (signal (bvnot (signal-value btor1142)) (list)))
           (btor1145 (signal (bvnot (signal-value btor1139)) (list)))
           (btor1146 (signal (bvnot (signal-value btor1136)) (list)))
           (btor1147
            (signal
             (bool->bitvector
              (bveq (signal-value btor79) (signal-value btor1029)))
             (list)))
           (btor1148 (signal (bvnot (signal-value btor1147)) (list)))
           (btor1149
            (signal
             (bvand (signal-value btor1146) (signal-value btor1148))
             (list)))
           (btor1150
            (signal
             (bvand (signal-value btor1145) (signal-value btor1149))
             (list)))
           (btor1151
            (signal
             (bvand (signal-value btor1144) (signal-value btor1150))
             (list)))
           (btor1152
            (signal
             (bvand (signal-value btor1146) (signal-value btor1151))
             (list)))
           (btor1153
            (signal
             (bvand (signal-value btor1145) (signal-value btor1152))
             (list)))
           (btor1154
            (signal
             (bvand (signal-value btor1144) (signal-value btor1153))
             (list)))
           (btor1155
            (signal
             (bvand (signal-value btor1145) (signal-value btor1154))
             (list)))
           (btor1156
            (signal
             (bvand (signal-value btor1144) (signal-value btor1155))
             (list)))
           (btor1157
            (signal
             (bvand (signal-value btor1144) (signal-value btor1156))
             (list)))
           (btor1158
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1158")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1158")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1158")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1158")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1159
            (signal
             (bvand (signal-value btor1157) (signal-value btor1158))
             (list)))
           (btor1160 (signal (bvnot (signal-value btor1159)) (list)))
           (btor1161
            (if (bitvector->bool (signal-value btor1160)) btor1143 btor1135))
           (btor1162
            (bv->signal
             (zero-extend (signal-value btor1161) (bitvector 1))
             btor1161))
           (btor1163
            (bv->signal
             (zero-extend (signal-value btor541) (bitvector 1))
             btor541))
           (btor1164
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1164")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1164")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1164")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1164")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1165
            (signal
             (bool->bitvector
              (bveq (signal-value btor81) (signal-value btor1048)))
             (list)))
           (btor1166
            (if (bitvector->bool (signal-value btor1165)) btor90 btor91))
           (btor1167
            (signal
             (bool->bitvector
              (bveq (signal-value btor81) (signal-value btor1051)))
             (list)))
           (btor1168
            (if (bitvector->bool (signal-value btor1167)) btor89 btor1166))
           (btor1169
            (bv->signal
             (zero-extend (signal-value btor152) (bitvector 5))
             btor152))
           (btor1170
            (signal
             (bool->bitvector
              (bveq (signal-value btor81) (signal-value btor1169)))
             (list)))
           (btor1171
            (if (bitvector->bool (signal-value btor1170)) btor88 btor1168))
           (btor1172 (signal (bvnot (signal-value btor1170)) (list)))
           (btor1173 (signal (bvnot (signal-value btor1167)) (list)))
           (btor1174 (signal (bvnot (signal-value btor1165)) (list)))
           (btor1175
            (signal
             (bool->bitvector
              (bveq (signal-value btor81) (signal-value btor1060)))
             (list)))
           (btor1176 (signal (bvnot (signal-value btor1175)) (list)))
           (btor1177
            (signal
             (bvand (signal-value btor1174) (signal-value btor1176))
             (list)))
           (btor1178
            (signal
             (bvand (signal-value btor1173) (signal-value btor1177))
             (list)))
           (btor1179
            (signal
             (bvand (signal-value btor1172) (signal-value btor1178))
             (list)))
           (btor1180
            (signal
             (bvand (signal-value btor1174) (signal-value btor1179))
             (list)))
           (btor1181
            (signal
             (bvand (signal-value btor1173) (signal-value btor1180))
             (list)))
           (btor1182
            (signal
             (bvand (signal-value btor1172) (signal-value btor1181))
             (list)))
           (btor1183
            (signal
             (bvand (signal-value btor1173) (signal-value btor1182))
             (list)))
           (btor1184
            (signal
             (bvand (signal-value btor1172) (signal-value btor1183))
             (list)))
           (btor1185
            (signal
             (bvand (signal-value btor1172) (signal-value btor1184))
             (list)))
           (btor1186
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1186")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1186")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1186")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1186")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1187
            (signal
             (bvand (signal-value btor1185) (signal-value btor1186))
             (list)))
           (btor1188 (signal (bvnot (signal-value btor1187)) (list)))
           (btor1189
            (if (bitvector->bool (signal-value btor1188)) btor1171 btor1164))
           (btor1190
            (bv->signal
             (zero-extend (signal-value btor1189) (bitvector 1))
             btor1189))
           (btor1191
            (bv->signal
             (zero-extend (signal-value btor1189) (bitvector 1))
             btor1189))
           (btor1192
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1192")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1192")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1192")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1192")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1193
            (signal
             (bool->bitvector
              (bveq (signal-value btor82) (signal-value btor1016)))
             (list)))
           (btor1194
            (if (bitvector->bool (signal-value btor1193)) btor60 btor61))
           (btor1195
            (bv->signal
             (zero-extend (signal-value btor1019) (bitvector 5))
             btor1019))
           (btor1196
            (signal
             (bool->bitvector
              (bveq (signal-value btor82) (signal-value btor1195)))
             (list)))
           (btor1197
            (if (bitvector->bool (signal-value btor1196)) btor59 btor1194))
           (btor1198
            (bv->signal
             (zero-extend (signal-value btor137) (bitvector 5))
             btor137))
           (btor1199
            (signal
             (bool->bitvector
              (bveq (signal-value btor82) (signal-value btor1198)))
             (list)))
           (btor1200
            (if (bitvector->bool (signal-value btor1199)) btor58 btor1197))
           (btor1201 (signal (bvnot (signal-value btor1199)) (list)))
           (btor1202 (signal (bvnot (signal-value btor1196)) (list)))
           (btor1203 (signal (bvnot (signal-value btor1193)) (list)))
           (btor1204
            (signal
             (bool->bitvector
              (bveq (signal-value btor82) (signal-value btor1029)))
             (list)))
           (btor1205 (signal (bvnot (signal-value btor1204)) (list)))
           (btor1206
            (signal
             (bvand (signal-value btor1203) (signal-value btor1205))
             (list)))
           (btor1207
            (signal
             (bvand (signal-value btor1202) (signal-value btor1206))
             (list)))
           (btor1208
            (signal
             (bvand (signal-value btor1201) (signal-value btor1207))
             (list)))
           (btor1209
            (signal
             (bvand (signal-value btor1203) (signal-value btor1208))
             (list)))
           (btor1210
            (signal
             (bvand (signal-value btor1202) (signal-value btor1209))
             (list)))
           (btor1211
            (signal
             (bvand (signal-value btor1201) (signal-value btor1210))
             (list)))
           (btor1212
            (signal
             (bvand (signal-value btor1202) (signal-value btor1211))
             (list)))
           (btor1213
            (signal
             (bvand (signal-value btor1201) (signal-value btor1212))
             (list)))
           (btor1214
            (signal
             (bvand (signal-value btor1201) (signal-value btor1213))
             (list)))
           (btor1215
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1215")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1215")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1215")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1215")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1216
            (signal
             (bvand (signal-value btor1214) (signal-value btor1215))
             (list)))
           (btor1217 (signal (bvnot (signal-value btor1216)) (list)))
           (btor1218
            (if (bitvector->bool (signal-value btor1217)) btor1200 btor1192))
           (btor1219
            (bv->signal
             (zero-extend (signal-value btor1218) (bitvector 1))
             btor1218))
           (btor1220
            (bv->signal
             (zero-extend (signal-value btor275) (bitvector 1))
             btor275))
           (btor1221
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1221")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1221")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1221")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1221")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1222
            (signal
             (bool->bitvector
              (bveq (signal-value btor84) (signal-value btor1048)))
             (list)))
           (btor1223
            (if (bitvector->bool (signal-value btor1222)) btor90 btor91))
           (btor1224
            (signal
             (bool->bitvector
              (bveq (signal-value btor84) (signal-value btor1051)))
             (list)))
           (btor1225
            (if (bitvector->bool (signal-value btor1224)) btor89 btor1223))
           (btor1226
            (bv->signal
             (zero-extend (signal-value btor152) (bitvector 5))
             btor152))
           (btor1227
            (signal
             (bool->bitvector
              (bveq (signal-value btor84) (signal-value btor1226)))
             (list)))
           (btor1228
            (if (bitvector->bool (signal-value btor1227)) btor88 btor1225))
           (btor1229 (signal (bvnot (signal-value btor1227)) (list)))
           (btor1230 (signal (bvnot (signal-value btor1224)) (list)))
           (btor1231 (signal (bvnot (signal-value btor1222)) (list)))
           (btor1232
            (signal
             (bool->bitvector
              (bveq (signal-value btor84) (signal-value btor1060)))
             (list)))
           (btor1233 (signal (bvnot (signal-value btor1232)) (list)))
           (btor1234
            (signal
             (bvand (signal-value btor1231) (signal-value btor1233))
             (list)))
           (btor1235
            (signal
             (bvand (signal-value btor1230) (signal-value btor1234))
             (list)))
           (btor1236
            (signal
             (bvand (signal-value btor1229) (signal-value btor1235))
             (list)))
           (btor1237
            (signal
             (bvand (signal-value btor1231) (signal-value btor1236))
             (list)))
           (btor1238
            (signal
             (bvand (signal-value btor1230) (signal-value btor1237))
             (list)))
           (btor1239
            (signal
             (bvand (signal-value btor1229) (signal-value btor1238))
             (list)))
           (btor1240
            (signal
             (bvand (signal-value btor1230) (signal-value btor1239))
             (list)))
           (btor1241
            (signal
             (bvand (signal-value btor1229) (signal-value btor1240))
             (list)))
           (btor1242
            (signal
             (bvand (signal-value btor1229) (signal-value btor1241))
             (list)))
           (btor1243
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1243")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1243")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1243")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1243")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1244
            (signal
             (bvand (signal-value btor1242) (signal-value btor1243))
             (list)))
           (btor1245 (signal (bvnot (signal-value btor1244)) (list)))
           (btor1246
            (if (bitvector->bool (signal-value btor1245)) btor1228 btor1221))
           (btor1247
            (bv->signal
             (zero-extend (signal-value btor1246) (bitvector 1))
             btor1246))
           (btor1248
            (bv->signal
             (zero-extend (signal-value btor1246) (bitvector 1))
             btor1246))
           (btor1249
            (bv->signal
             (zero-extend (signal-value btor704) (bitvector 36))
             btor704))
           (btor1250
            (bv->signal
             (zero-extend (signal-value btor695) (bitvector 36))
             btor695))
           (btor1251
            (bv->signal
             (zero-extend (signal-value btor314) (bitvector 36))
             btor314))
           (btor1252
            (bv->signal
             (zero-extend (signal-value btor278) (bitvector 36))
             btor278))
           (btor1253
            (bv->signal
             (zero-extend (signal-value btor278) (bitvector 36))
             btor278))
           (btor1254
            (bv->signal
             (zero-extend (signal-value btor314) (bitvector 36))
             btor314))
           (btor1255
            (bv->signal
             (zero-extend (signal-value btor701) (bitvector 36))
             btor701))
           (btor1256
            (bv->signal
             (zero-extend (signal-value btor698) (bitvector 36))
             btor698))
           (btor1257
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1257")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1257")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1257")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1257")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1258
            (signal
             (bool->bitvector
              (bveq (signal-value btor85) (signal-value btor1016)))
             (list)))
           (btor1259
            (if (bitvector->bool (signal-value btor1258)) btor60 btor61))
           (btor1260
            (bv->signal
             (zero-extend (signal-value btor1019) (bitvector 5))
             btor1019))
           (btor1261
            (signal
             (bool->bitvector
              (bveq (signal-value btor85) (signal-value btor1260)))
             (list)))
           (btor1262
            (if (bitvector->bool (signal-value btor1261)) btor59 btor1259))
           (btor1263
            (bv->signal
             (zero-extend (signal-value btor137) (bitvector 5))
             btor137))
           (btor1264
            (signal
             (bool->bitvector
              (bveq (signal-value btor85) (signal-value btor1263)))
             (list)))
           (btor1265
            (if (bitvector->bool (signal-value btor1264)) btor58 btor1262))
           (btor1266 (signal (bvnot (signal-value btor1264)) (list)))
           (btor1267 (signal (bvnot (signal-value btor1261)) (list)))
           (btor1268 (signal (bvnot (signal-value btor1258)) (list)))
           (btor1269
            (signal
             (bool->bitvector
              (bveq (signal-value btor85) (signal-value btor1029)))
             (list)))
           (btor1270 (signal (bvnot (signal-value btor1269)) (list)))
           (btor1271
            (signal
             (bvand (signal-value btor1268) (signal-value btor1270))
             (list)))
           (btor1272
            (signal
             (bvand (signal-value btor1267) (signal-value btor1271))
             (list)))
           (btor1273
            (signal
             (bvand (signal-value btor1266) (signal-value btor1272))
             (list)))
           (btor1274
            (signal
             (bvand (signal-value btor1268) (signal-value btor1273))
             (list)))
           (btor1275
            (signal
             (bvand (signal-value btor1267) (signal-value btor1274))
             (list)))
           (btor1276
            (signal
             (bvand (signal-value btor1266) (signal-value btor1275))
             (list)))
           (btor1277
            (signal
             (bvand (signal-value btor1267) (signal-value btor1276))
             (list)))
           (btor1278
            (signal
             (bvand (signal-value btor1266) (signal-value btor1277))
             (list)))
           (btor1279
            (signal
             (bvand (signal-value btor1266) (signal-value btor1278))
             (list)))
           (btor1280
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1280")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1280")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1280")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1280")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1281
            (signal
             (bvand (signal-value btor1279) (signal-value btor1280))
             (list)))
           (btor1282 (signal (bvnot (signal-value btor1281)) (list)))
           (btor1283
            (if (bitvector->bool (signal-value btor1282)) btor1265 btor1257))
           (btor1284
            (bv->signal
             (zero-extend (signal-value btor1283) (bitvector 1))
             btor1283))
           (btor1285
            (bv->signal
             (zero-extend (signal-value btor311) (bitvector 1))
             btor311))
           (btor1286
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1286")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1286")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1286")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1286")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1287
            (signal
             (bool->bitvector
              (bveq (signal-value btor87) (signal-value btor1048)))
             (list)))
           (btor1288
            (if (bitvector->bool (signal-value btor1287)) btor90 btor91))
           (btor1289
            (signal
             (bool->bitvector
              (bveq (signal-value btor87) (signal-value btor1051)))
             (list)))
           (btor1290
            (if (bitvector->bool (signal-value btor1289)) btor89 btor1288))
           (btor1291
            (bv->signal
             (zero-extend (signal-value btor152) (bitvector 5))
             btor152))
           (btor1292
            (signal
             (bool->bitvector
              (bveq (signal-value btor87) (signal-value btor1291)))
             (list)))
           (btor1293
            (if (bitvector->bool (signal-value btor1292)) btor88 btor1290))
           (btor1294 (signal (bvnot (signal-value btor1292)) (list)))
           (btor1295 (signal (bvnot (signal-value btor1289)) (list)))
           (btor1296 (signal (bvnot (signal-value btor1287)) (list)))
           (btor1297
            (signal
             (bool->bitvector
              (bveq (signal-value btor87) (signal-value btor1060)))
             (list)))
           (btor1298 (signal (bvnot (signal-value btor1297)) (list)))
           (btor1299
            (signal
             (bvand (signal-value btor1296) (signal-value btor1298))
             (list)))
           (btor1300
            (signal
             (bvand (signal-value btor1295) (signal-value btor1299))
             (list)))
           (btor1301
            (signal
             (bvand (signal-value btor1294) (signal-value btor1300))
             (list)))
           (btor1302
            (signal
             (bvand (signal-value btor1296) (signal-value btor1301))
             (list)))
           (btor1303
            (signal
             (bvand (signal-value btor1295) (signal-value btor1302))
             (list)))
           (btor1304
            (signal
             (bvand (signal-value btor1294) (signal-value btor1303))
             (list)))
           (btor1305
            (signal
             (bvand (signal-value btor1295) (signal-value btor1304))
             (list)))
           (btor1306
            (signal
             (bvand (signal-value btor1294) (signal-value btor1305))
             (list)))
           (btor1307
            (signal
             (bvand (signal-value btor1294) (signal-value btor1306))
             (list)))
           (btor1308
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1308")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1308")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1308")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1308")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1309
            (signal
             (bvand (signal-value btor1307) (signal-value btor1308))
             (list)))
           (btor1310 (signal (bvnot (signal-value btor1309)) (list)))
           (btor1311
            (if (bitvector->bool (signal-value btor1310)) btor1293 btor1286))
           (btor1312
            (bv->signal
             (zero-extend (signal-value btor1311) (bitvector 1))
             btor1311))
           (btor1313
            (bv->signal
             (zero-extend (signal-value btor1311) (bitvector 1))
             btor1311))
           (btor1314
            (bv->signal
             (zero-extend (signal-value btor406) (bitvector 18))
             btor406))
           (btor1315
            (bv->signal
             (zero-extend (signal-value btor564) (bitvector 18))
             btor564))
           (btor1316
            (bv->signal
             (zero-extend (signal-value btor450) (bitvector 1))
             btor450))
           (btor1317
            (bv->signal
             (zero-extend (signal-value btor449) (bitvector 1))
             btor449))
           (btor1318
            (bv->signal
             (zero-extend (signal-value btor449) (bitvector 1))
             btor449))
           (btor1319
            (bv->signal
             (zero-extend (signal-value btor92) (bitvector 1))
             btor92))
           (btor1320
            (bv->signal
             (zero-extend (signal-value btor891) (bitvector 1))
             btor891))
           (btor1321
            (bv->signal
             (zero-extend (signal-value btor892) (bitvector 1))
             btor892))
           (btor1322
            (bv->signal
             (zero-extend (signal-value btor891) (bitvector 1))
             btor891))
           (btor1323
            (bv->signal
             (zero-extend (signal-value btor686) (bitvector 1))
             btor686))
           (btor1324
            (bv->signal
             (zero-extend (signal-value btor685) (bitvector 1))
             btor685))
           (btor1325
            (bv->signal
             (zero-extend (signal-value btor685) (bitvector 1))
             btor685))
           (btor1326
            (bv->signal
             (zero-extend (signal-value btor93) (bitvector 1))
             btor93))
           (btor1327
            (bv->signal
             (zero-extend (signal-value btor893) (bitvector 1))
             btor893))
           (btor1328
            (bv->signal
             (zero-extend (signal-value btor94) (bitvector 1))
             btor94))
           (btor1329
            (bv->signal
             (zero-extend (signal-value btor95) (bitvector 1))
             btor95))
           (btor1330
            (bv->signal
             (zero-extend (signal-value btor917) (bitvector 18))
             btor917))
           (btor1331
            (bv->signal
             (zero-extend (signal-value btor643) (bitvector 18))
             btor643))
           (btor1333
            (if (bitvector->bool (signal-value btor1218)) btor698 btor278))
           (btor1334
            (if (bitvector->bool (signal-value btor1246)) btor134 btor1333))
           (btor1340 (signal (bvnot (signal-value btor154)) (list)))
           (btor1341
            (if (bitvector->bool (signal-value btor157)) btor1340 btor154))
           (btor1347 (signal (bvnot (signal-value btor181)) (list)))
           (btor1348
            (if (bitvector->bool (signal-value btor183)) btor1347 btor181))
           (btor1354 (signal (bvnot (signal-value btor210)) (list)))
           (btor1355
            (if (bitvector->bool (signal-value btor212)) btor1354 btor210))
           (btor1361 (signal (bvnot (signal-value btor238)) (list)))
           (btor1362
            (if (bitvector->bool (signal-value btor240)) btor1361 btor238))
           (btor1368
            (if (bitvector->bool (signal-value btor1283)) btor695 btor314))
           (btor1369
            (if (bitvector->bool (signal-value btor1311)) btor134 btor1368))
           (btor1375
            (if (bitvector->bool (signal-value btor1044)) btor403 btor351))
           (btor1376
            (if (bitvector->bool (signal-value btor1075)) btor407 btor1375))
           (btor1384
            (if (bitvector->bool (signal-value btor1044)) btor92 btor449))
           (btor1385
            (if (bitvector->bool (signal-value btor1075)) btor141 btor1384))
           (btor1389
            (if (bitvector->bool (signal-value btor1104)) btor640 btor489))
           (btor1390
            (if (bitvector->bool (signal-value btor1132)) btor407 btor1389))
           (btor1397
            (if (bitvector->bool (signal-value btor1161)) btor561 btor544))
           (btor1398
            (if (bitvector->bool (signal-value btor1189)) btor407 btor1397))
           (btor1407
            (if (bitvector->bool (signal-value btor1104)) btor93 btor685))
           (btor1408
            (if (bitvector->bool (signal-value btor1132)) btor141 btor1407))
           (btor1412
            (if (bitvector->bool (signal-value btor1283)) btor892 btor891))
           (btor1413
            (if (bitvector->bool (signal-value btor1311)) btor141 btor1412))
           (btor1418
            (if (bitvector->bool (signal-value btor1044)) btor406 btor902))
           (btor1419
            (if (bitvector->bool (signal-value btor1075)) btor407 btor1418))
           (output-state
            (remove-duplicates
             (append
              (append
               (list
                (cons
                 (string->symbol (string-append name "state1308"))
                 (signal-value btor1307)))
               (append
                (list
                 (cons
                  (string->symbol (string-append name "state1286"))
                  (signal-value btor1311)))
                (append
                 (list
                  (cons
                   (string->symbol (string-append name "state1280"))
                   (signal-value btor1279)))
                 (append
                  (list
                   (cons
                    (string->symbol (string-append name "state1257"))
                    (signal-value btor1283)))
                  (append
                   (list
                    (cons
                     (string->symbol (string-append name "state1243"))
                     (signal-value btor1242)))
                   (append
                    (list
                     (cons
                      (string->symbol (string-append name "state1221"))
                      (signal-value btor1246)))
                    (append
                     (list
                      (cons
                       (string->symbol (string-append name "state1215"))
                       (signal-value btor1214)))
                     (append
                      (list
                       (cons
                        (string->symbol (string-append name "state1192"))
                        (signal-value btor1218)))
                      (append
                       (list
                        (cons
                         (string->symbol (string-append name "state1186"))
                         (signal-value btor1185)))
                       (append
                        (list
                         (cons
                          (string->symbol (string-append name "state1164"))
                          (signal-value btor1189)))
                        (append
                         (list
                          (cons
                           (string->symbol (string-append name "state1158"))
                           (signal-value btor1157)))
                         (append
                          (list
                           (cons
                            (string->symbol (string-append name "state1135"))
                            (signal-value btor1161)))
                          (append
                           (list
                            (cons
                             (string->symbol (string-append name "state1129"))
                             (signal-value btor1128)))
                           (append
                            (list
                             (cons
                              (string->symbol (string-append name "state1107"))
                              (signal-value btor1132)))
                            (append
                             (list
                              (cons
                               (string->symbol
                                (string-append name "state1101"))
                               (signal-value btor1100)))
                             (append
                              (list
                               (cons
                                (string->symbol
                                 (string-append name "state1078"))
                                (signal-value btor1104)))
                              (append
                               (list
                                (cons
                                 (string->symbol
                                  (string-append name "state1072"))
                                 (signal-value btor1071)))
                               (append
                                (list
                                 (cons
                                  (string->symbol
                                   (string-append name "state1047"))
                                  (signal-value btor1075)))
                                (append
                                 (list
                                  (cons
                                   (string->symbol
                                    (string-append name "state1041"))
                                   (signal-value btor1040)))
                                 (append
                                  (list
                                   (cons
                                    (string->symbol
                                     (string-append name "state1015"))
                                    (signal-value btor1044)))
                                  (append
                                   (list
                                    (cons
                                     (string->symbol
                                      (string-append name "state914"))
                                     (signal-value btor913)))
                                   (append
                                    (list
                                     (cons
                                      (string->symbol
                                       (string-append name "state898"))
                                      (signal-value btor348)))
                                    (append
                                     (list
                                      (cons
                                       (string->symbol
                                        (string-append name "state897"))
                                       (signal-value btor1419)))
                                     (append
                                      (list
                                       (cons
                                        (string->symbol
                                         (string-append name "state896"))
                                        (signal-value btor902)))
                                      (append
                                       (list
                                        (cons
                                         (string->symbol
                                          (string-append name "state895"))
                                         (signal-value btor917)))
                                       (append
                                        (list
                                         (cons
                                          (string->symbol
                                           (string-append name "state887"))
                                          (signal-value btor311)))
                                        (append
                                         (list
                                          (cons
                                           (string->symbol
                                            (string-append name "state886"))
                                           (signal-value btor1413)))
                                         (append
                                          (list
                                           (cons
                                            (string->symbol
                                             (string-append name "state885"))
                                            (signal-value btor891)))
                                          (append
                                           (list
                                            (cons
                                             (string->symbol
                                              (string-append name "state681"))
                                             (signal-value btor486)))
                                           (append
                                            (list
                                             (cons
                                              (string->symbol
                                               (string-append name "state680"))
                                              (signal-value btor1408)))
                                            (append
                                             (list
                                              (cons
                                               (string->symbol
                                                (string-append
                                                 name
                                                 "state679"))
                                               (signal-value btor685)))
                                             (append
                                              (list
                                               (cons
                                                (string->symbol
                                                 (string-append
                                                  name
                                                  "state637"))
                                                (signal-value btor636)))
                                              (append
                                               (list
                                                (cons
                                                 (string->symbol
                                                  (string-append
                                                   name
                                                   "state590"))
                                                 (signal-value btor589)))
                                               (append
                                                (list
                                                 (cons
                                                  (string->symbol
                                                   (string-append
                                                    name
                                                    "state565"))
                                                  (signal-value btor593)))
                                                (append
                                                 (list
                                                  (cons
                                                   (string->symbol
                                                    (string-append
                                                     name
                                                     "state538"))
                                                   (signal-value btor537)))
                                                 (append
                                                  (list
                                                   (cons
                                                    (string->symbol
                                                     (string-append
                                                      name
                                                      "state512"))
                                                    (signal-value btor541)))
                                                  (append
                                                   (list
                                                    (cons
                                                     (string->symbol
                                                      (string-append
                                                       name
                                                       "state510"))
                                                     (signal-value btor541)))
                                                   (append
                                                    (list
                                                     (cons
                                                      (string->symbol
                                                       (string-append
                                                        name
                                                        "state509"))
                                                      (signal-value btor1398)))
                                                    (append
                                                     (list
                                                      (cons
                                                       (string->symbol
                                                        (string-append
                                                         name
                                                         "state508"))
                                                       (signal-value btor544)))
                                                     (append
                                                      (list
                                                       (cons
                                                        (string->symbol
                                                         (string-append
                                                          name
                                                          "state490"))
                                                        (signal-value
                                                         btor640)))
                                                      (append
                                                       (list
                                                        (cons
                                                         (string->symbol
                                                          (string-append
                                                           name
                                                           "state483"))
                                                         (signal-value
                                                          btor482)))
                                                       (append
                                                        (list
                                                         (cons
                                                          (string->symbol
                                                           (string-append
                                                            name
                                                            "state457"))
                                                          (signal-value
                                                           btor486)))
                                                        (append
                                                         (list
                                                          (cons
                                                           (string->symbol
                                                            (string-append
                                                             name
                                                             "state455"))
                                                           (signal-value
                                                            btor486)))
                                                         (append
                                                          (list
                                                           (cons
                                                            (string->symbol
                                                             (string-append
                                                              name
                                                              "state454"))
                                                            (signal-value
                                                             btor1390)))
                                                          (append
                                                           (list
                                                            (cons
                                                             (string->symbol
                                                              (string-append
                                                               name
                                                               "state453"))
                                                             (signal-value
                                                              btor489)))
                                                           (append
                                                            (list
                                                             (cons
                                                              (string->symbol
                                                               (string-append
                                                                name
                                                                "state445"))
                                                              (signal-value
                                                               btor348)))
                                                            (append
                                                             (list
                                                              (cons
                                                               (string->symbol
                                                                (string-append
                                                                 name
                                                                 "state444"))
                                                               (signal-value
                                                                btor1385)))
                                                             (append
                                                              (list
                                                               (cons
                                                                (string->symbol
                                                                 (string-append
                                                                  name
                                                                  "state443"))
                                                                (signal-value
                                                                 btor449)))
                                                              (append
                                                               (list
                                                                (cons
                                                                 (string->symbol
                                                                  (string-append
                                                                   name
                                                                   "state400"))
                                                                 (signal-value
                                                                  btor141)))
                                                               (append
                                                                (list
                                                                 (cons
                                                                  (string->symbol
                                                                   (string-append
                                                                    name
                                                                    "state352"))
                                                                  (signal-value
                                                                   btor403)))
                                                                (append
                                                                 (list
                                                                  (cons
                                                                   (string->symbol
                                                                    (string-append
                                                                     name
                                                                     "state345"))
                                                                   (signal-value
                                                                    btor344)))
                                                                 (append
                                                                  (list
                                                                   (cons
                                                                    (string->symbol
                                                                     (string-append
                                                                      name
                                                                      "state320"))
                                                                    (signal-value
                                                                     btor348)))
                                                                  (append
                                                                   (list
                                                                    (cons
                                                                     (string->symbol
                                                                      (string-append
                                                                       name
                                                                       "state318"))
                                                                     (signal-value
                                                                      btor348)))
                                                                   (append
                                                                    (list
                                                                     (cons
                                                                      (string->symbol
                                                                       (string-append
                                                                        name
                                                                        "state317"))
                                                                      (signal-value
                                                                       btor1376)))
                                                                    (append
                                                                     (list
                                                                      (cons
                                                                       (string->symbol
                                                                        (string-append
                                                                         name
                                                                         "state316"))
                                                                       (signal-value
                                                                        btor351)))
                                                                     (append
                                                                      (list
                                                                       (cons
                                                                        (string->symbol
                                                                         (string-append
                                                                          name
                                                                          "state308"))
                                                                        (signal-value
                                                                         btor307)))
                                                                      (append
                                                                       (list
                                                                        (cons
                                                                         (string->symbol
                                                                          (string-append
                                                                           name
                                                                           "state283"))
                                                                         (signal-value
                                                                          btor311)))
                                                                       (append
                                                                        (list
                                                                         (cons
                                                                          (string->symbol
                                                                           (string-append
                                                                            name
                                                                            "state281"))
                                                                          (signal-value
                                                                           btor311)))
                                                                        (append
                                                                         (list
                                                                          (cons
                                                                           (string->symbol
                                                                            (string-append
                                                                             name
                                                                             "state280"))
                                                                           (signal-value
                                                                            btor1369)))
                                                                         (append
                                                                          (list
                                                                           (cons
                                                                            (string->symbol
                                                                             (string-append
                                                                              name
                                                                              "state279"))
                                                                            (signal-value
                                                                             btor314)))
                                                                          (append
                                                                           (list
                                                                            (cons
                                                                             (string->symbol
                                                                              (string-append
                                                                               name
                                                                               "state272"))
                                                                             (signal-value
                                                                              btor271)))
                                                                           (append
                                                                            (list
                                                                             (cons
                                                                              (string->symbol
                                                                               (string-append
                                                                                name
                                                                                "state248"))
                                                                              (signal-value
                                                                               btor247)))
                                                                            (append
                                                                             (list
                                                                              (cons
                                                                               (string->symbol
                                                                                (string-append
                                                                                 name
                                                                                 "state234"))
                                                                               (signal-value
                                                                                btor62)))
                                                                             (append
                                                                              (list
                                                                               (cons
                                                                                (string->symbol
                                                                                 (string-append
                                                                                  name
                                                                                  "state232"))
                                                                                (signal-value
                                                                                 btor1362)))
                                                                              (append
                                                                               (list
                                                                                (cons
                                                                                 (string->symbol
                                                                                  (string-append
                                                                                   name
                                                                                   "state230"))
                                                                                 (signal-value
                                                                                  btor238)))
                                                                               (append
                                                                                (list
                                                                                 (cons
                                                                                  (string->symbol
                                                                                   (string-append
                                                                                    name
                                                                                    "state228"))
                                                                                  (signal-value
                                                                                   btor251)))
                                                                                (append
                                                                                 (list
                                                                                  (cons
                                                                                   (string->symbol
                                                                                    (string-append
                                                                                     name
                                                                                     "state220"))
                                                                                   (signal-value
                                                                                    btor219)))
                                                                                 (append
                                                                                  (list
                                                                                   (cons
                                                                                    (string->symbol
                                                                                     (string-append
                                                                                      name
                                                                                      "state206"))
                                                                                    (signal-value
                                                                                     btor64)))
                                                                                  (append
                                                                                   (list
                                                                                    (cons
                                                                                     (string->symbol
                                                                                      (string-append
                                                                                       name
                                                                                       "state204"))
                                                                                     (signal-value
                                                                                      btor1355)))
                                                                                   (append
                                                                                    (list
                                                                                     (cons
                                                                                      (string->symbol
                                                                                       (string-append
                                                                                        name
                                                                                        "state202"))
                                                                                      (signal-value
                                                                                       btor210)))
                                                                                    (append
                                                                                     (list
                                                                                      (cons
                                                                                       (string->symbol
                                                                                        (string-append
                                                                                         name
                                                                                         "state200"))
                                                                                       (signal-value
                                                                                        btor223)))
                                                                                     (append
                                                                                      (list
                                                                                       (cons
                                                                                        (string->symbol
                                                                                         (string-append
                                                                                          name
                                                                                          "state191"))
                                                                                        (signal-value
                                                                                         btor190)))
                                                                                      (append
                                                                                       (list
                                                                                        (cons
                                                                                         (string->symbol
                                                                                          (string-append
                                                                                           name
                                                                                           "state177"))
                                                                                         (signal-value
                                                                                          btor66)))
                                                                                       (append
                                                                                        (list
                                                                                         (cons
                                                                                          (string->symbol
                                                                                           (string-append
                                                                                            name
                                                                                            "state175"))
                                                                                          (signal-value
                                                                                           btor1348)))
                                                                                        (append
                                                                                         (list
                                                                                          (cons
                                                                                           (string->symbol
                                                                                            (string-append
                                                                                             name
                                                                                             "state173"))
                                                                                           (signal-value
                                                                                            btor181)))
                                                                                         (append
                                                                                          (list
                                                                                           (cons
                                                                                            (string->symbol
                                                                                             (string-append
                                                                                              name
                                                                                              "state171"))
                                                                                            (signal-value
                                                                                             btor194)))
                                                                                          (append
                                                                                           (list
                                                                                            (cons
                                                                                             (string->symbol
                                                                                              (string-append
                                                                                               name
                                                                                               "state167"))
                                                                                             (signal-value
                                                                                              btor166)))
                                                                                           (append
                                                                                            (list
                                                                                             (cons
                                                                                              (string->symbol
                                                                                               (string-append
                                                                                                name
                                                                                                "state148"))
                                                                                              (signal-value
                                                                                               btor68)))
                                                                                            (append
                                                                                             (list
                                                                                              (cons
                                                                                               (string->symbol
                                                                                                (string-append
                                                                                                 name
                                                                                                 "state146"))
                                                                                               (signal-value
                                                                                                btor1341)))
                                                                                             (append
                                                                                              (list
                                                                                               (cons
                                                                                                (string->symbol
                                                                                                 (string-append
                                                                                                  name
                                                                                                  "state144"))
                                                                                                (signal-value
                                                                                                 btor154)))
                                                                                              (append
                                                                                               (list
                                                                                                (cons
                                                                                                 (string->symbol
                                                                                                  (string-append
                                                                                                   name
                                                                                                   "state142"))
                                                                                                 (signal-value
                                                                                                  btor170)))
                                                                                               (append
                                                                                                (list
                                                                                                 (cons
                                                                                                  (string->symbol
                                                                                                   (string-append
                                                                                                    name
                                                                                                    "state140"))
                                                                                                  (signal-value
                                                                                                   btor275)))
                                                                                                (append
                                                                                                 (list
                                                                                                  (cons
                                                                                                   (string->symbol
                                                                                                    (string-append
                                                                                                     name
                                                                                                     "state138"))
                                                                                                   (signal-value
                                                                                                    btor275)))
                                                                                                 (append
                                                                                                  (list
                                                                                                   (cons
                                                                                                    (string->symbol
                                                                                                     (string-append
                                                                                                      name
                                                                                                      "state136"))
                                                                                                    (signal-value
                                                                                                     btor1334)))
                                                                                                  (append
                                                                                                   (list
                                                                                                    (cons
                                                                                                     (string->symbol
                                                                                                      (string-append
                                                                                                       name
                                                                                                       "state135"))
                                                                                                     (signal-value
                                                                                                      btor278)))
                                                                                                   (list))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
              merged-input-state-hash)
             equal?
             #:key
             car)))
      (list
       (cons 'SROB0 (signal (signal-value btor813) output-state))
       (cons 'SROB15 (signal (signal-value btor827) output-state))
       (cons 'P31 (signal (signal-value btor755) output-state))
       (cons 'ROA0 (signal (signal-value btor777) output-state))
       (cons 'ROC4 (signal (signal-value btor873) output-state))
       (cons 'SROA8 (signal (signal-value btor950) output-state))
       (cons 'SROA9 (signal (signal-value btor952) output-state))
       (cons 'P30 (signal (signal-value btor753) output-state))
       (cons 'P18 (signal (signal-value btor725) output-state))
       (cons 'ROB2 (signal (signal-value btor833) output-state))
       (cons 'ROC9 (signal (signal-value btor883) output-state))
       (cons 'ROC15 (signal (signal-value btor863) output-state))
       (cons 'P0 (signal (signal-value btor705) output-state))
       (cons 'ROA17 (signal (signal-value btor795) output-state))
       (cons 'SROA14 (signal (signal-value btor930) output-state))
       (cons 'ROC3 (signal (signal-value btor871) output-state))
       (cons 'SROA7 (signal (signal-value btor948) output-state))
       (cons 'SROB9 (signal (signal-value btor847) output-state))
       (cons 'SROA15 (signal (signal-value btor932) output-state))
       (cons 'ROB11 (signal (signal-value btor819) output-state))
       (cons 'ROC14 (signal (signal-value btor861) output-state))
       (cons 'ROA1 (signal (signal-value btor779) output-state))
       (cons 'SROB14 (signal (signal-value btor825) output-state))
       (cons 'P1 (signal (signal-value btor707) output-state))
       (cons 'P19 (signal (signal-value btor727) output-state))
       (cons 'ROB3 (signal (signal-value btor835) output-state))
       (cons 'P2 (signal (signal-value btor729) output-state))
       (cons 'ROA15 (signal (signal-value btor791) output-state))
       (cons 'SROA12 (signal (signal-value btor926) output-state))
       (cons 'ROC11 (signal (signal-value btor855) output-state))
       (cons 'ROB4 (signal (signal-value btor837) output-state))
       (cons 'ROA9 (signal (signal-value btor811) output-state))
       (cons 'ROA2 (signal (signal-value btor797) output-state))
       (cons 'P28 (signal (signal-value btor747) output-state))
       (cons 'P11 (signal (signal-value btor711) output-state))
       (cons 'ROB12 (signal (signal-value btor821) output-state))
       (cons 'ROC7 (signal (signal-value btor879) output-state))
       (cons 'ROC13 (signal (signal-value btor859) output-state))
       (cons 'P27 (signal (signal-value btor745) output-state))
       (cons 'P8 (signal (signal-value btor773) output-state))
       (cons 'SROB13 (signal (signal-value btor823) output-state))
       (cons 'SROB8 (signal (signal-value btor845) output-state))
       (cons 'P21 (signal (signal-value btor733) output-state))
       (cons 'SROB2 (signal (signal-value btor833) output-state))
       (cons 'ROA8 (signal (signal-value btor809) output-state))
       (cons 'SROA0 (signal (signal-value btor918) output-state))
       (cons 'ROC6 (signal (signal-value btor877) output-state))
       (cons 'SROA6 (signal (signal-value btor946) output-state))
       (cons 'SROB12 (signal (signal-value btor821) output-state))
       (cons 'P29 (signal (signal-value btor749) output-state))
       (cons 'SROA13 (signal (signal-value btor928) output-state))
       (cons 'P10 (signal (signal-value btor709) output-state))
       (cons 'ROB13 (signal (signal-value btor823) output-state))
       (cons 'ROC8 (signal (signal-value btor881) output-state))
       (cons 'ROC12 (signal (signal-value btor857) output-state))
       (cons 'P26 (signal (signal-value btor743) output-state))
       (cons 'P9 (signal (signal-value btor775) output-state))
       (cons 'ROA10 (signal (signal-value btor781) output-state))
       (cons 'ROA3 (signal (signal-value btor799) output-state))
       (cons 'ROC10 (signal (signal-value btor853) output-state))
       (cons 'ROB5 (signal (signal-value btor839) output-state))
       (cons 'P3 (signal (signal-value btor751) output-state))
       (cons 'ROA16 (signal (signal-value btor793) output-state))
       (cons 'P17 (signal (signal-value btor723) output-state))
       (cons 'ROC5 (signal (signal-value btor875) output-state))
       (cons 'SROA5 (signal (signal-value btor944) output-state))
       (cons 'P16 (signal (signal-value btor721) output-state))
       (cons 'SROB7 (signal (signal-value btor843) output-state))
       (cons 'P20 (signal (signal-value btor731) output-state))
       (cons 'SROB1 (signal (signal-value btor815) output-state))
       (cons 'ROB9 (signal (signal-value btor847) output-state))
       (cons 'SROB5 (signal (signal-value btor839) output-state))
       (cons 'SROA3 (signal (signal-value btor940) output-state))
       (cons 'P34 (signal (signal-value btor761) output-state))
       (cons 'P14 (signal (signal-value btor717) output-state))
       (cons 'P22 (signal (signal-value btor735) output-state))
       (cons 'ROA7 (signal (signal-value btor807) output-state))
       (cons 'SIGNEDP (signal (signal-value btor893) output-state))
       (cons 'P7 (signal (signal-value btor771) output-state))
       (cons 'SROA11 (signal (signal-value btor924) output-state))
       (cons 'ROB15 (signal (signal-value btor827) output-state))
       (cons 'SROA17 (signal (signal-value btor936) output-state))
       (cons 'ROA14 (signal (signal-value btor789) output-state))
       (cons 'ROA6 (signal (signal-value btor805) output-state))
       (cons 'SROA4 (signal (signal-value btor942) output-state))
       (cons 'P15 (signal (signal-value btor719) output-state))
       (cons 'P23 (signal (signal-value btor737) output-state))
       (cons 'SROA16 (signal (signal-value btor934) output-state))
       (cons 'ROB8 (signal (signal-value btor845) output-state))
       (cons 'P35 (signal (signal-value btor763) output-state))
       (cons 'SROB6 (signal (signal-value btor841) output-state))
       (cons 'ROC0 (signal (signal-value btor849) output-state))
       (cons 'ROA13 (signal (signal-value btor787) output-state))
       (cons 'SROA10 (signal (signal-value btor922) output-state))
       (cons 'P6 (signal (signal-value btor769) output-state))
       (cons 'ROB14 (signal (signal-value btor825) output-state))
       (cons 'SROA1 (signal (signal-value btor920) output-state))
       (cons 'ROB17 (signal (signal-value btor831) output-state))
       (cons 'ROC16 (signal (signal-value btor865) output-state))
       (cons 'ROC1 (signal (signal-value btor851) output-state))
       (cons 'P12 (signal (signal-value btor713) output-state))
       (cons 'ROB1 (signal (signal-value btor815) output-state))
       (cons 'SROB3 (signal (signal-value btor835) output-state))
       (cons 'P24 (signal (signal-value btor739) output-state))
       (cons 'ROA12 (signal (signal-value btor785) output-state))
       (cons 'ROB7 (signal (signal-value btor843) output-state))
       (cons 'SROB16 (signal (signal-value btor829) output-state))
       (cons 'P32 (signal (signal-value btor757) output-state))
       (cons 'ROA5 (signal (signal-value btor803) output-state))
       (cons 'SROB10 (signal (signal-value btor817) output-state))
       (cons 'P5 (signal (signal-value btor767) output-state))
       (cons 'ROB16 (signal (signal-value btor829) output-state))
       (cons 'ROC2 (signal (signal-value btor869) output-state))
       (cons 'ROC17 (signal (signal-value btor867) output-state))
       (cons 'ROB10 (signal (signal-value btor817) output-state))
       (cons 'P4 (signal (signal-value btor765) output-state))
       (cons 'SROB17 (signal (signal-value btor831) output-state))
       (cons 'SROA2 (signal (signal-value btor938) output-state))
       (cons 'P33 (signal (signal-value btor759) output-state))
       (cons 'P13 (signal (signal-value btor715) output-state))
       (cons 'SROB4 (signal (signal-value btor837) output-state))
       (cons 'P25 (signal (signal-value btor741) output-state))
       (cons 'ROA11 (signal (signal-value btor783) output-state))
       (cons 'SROB11 (signal (signal-value btor819) output-state))
       (cons 'ROB0 (signal (signal-value btor813) output-state))
       (cons 'ROA4 (signal (signal-value btor801) output-state))
       (cons 'ROB6 (signal (signal-value btor841) output-state))))))
