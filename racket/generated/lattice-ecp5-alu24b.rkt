#lang racket/base
(provide lattice-ecp5-alu24b)
(require "../signal.rkt")
(require rosette)
(require racket/hash)
(define lattice-ecp5-alu24b
  (λ (#:CE0 (CE0 (bv->signal (constant 'CE0 (bitvector 1))))
      #:CE1 (CE1 (bv->signal (constant 'CE1 (bitvector 1))))
      #:CE2 (CE2 (bv->signal (constant 'CE2 (bitvector 1))))
      #:CE3 (CE3 (bv->signal (constant 'CE3 (bitvector 1))))
      #:CFB0 (CFB0 (bv->signal (constant 'CFB0 (bitvector 1))))
      #:CFB1 (CFB1 (bv->signal (constant 'CFB1 (bitvector 1))))
      #:CFB10 (CFB10 (bv->signal (constant 'CFB10 (bitvector 1))))
      #:CFB11 (CFB11 (bv->signal (constant 'CFB11 (bitvector 1))))
      #:CFB12 (CFB12 (bv->signal (constant 'CFB12 (bitvector 1))))
      #:CFB13 (CFB13 (bv->signal (constant 'CFB13 (bitvector 1))))
      #:CFB14 (CFB14 (bv->signal (constant 'CFB14 (bitvector 1))))
      #:CFB15 (CFB15 (bv->signal (constant 'CFB15 (bitvector 1))))
      #:CFB16 (CFB16 (bv->signal (constant 'CFB16 (bitvector 1))))
      #:CFB17 (CFB17 (bv->signal (constant 'CFB17 (bitvector 1))))
      #:CFB18 (CFB18 (bv->signal (constant 'CFB18 (bitvector 1))))
      #:CFB19 (CFB19 (bv->signal (constant 'CFB19 (bitvector 1))))
      #:CFB2 (CFB2 (bv->signal (constant 'CFB2 (bitvector 1))))
      #:CFB20 (CFB20 (bv->signal (constant 'CFB20 (bitvector 1))))
      #:CFB21 (CFB21 (bv->signal (constant 'CFB21 (bitvector 1))))
      #:CFB22 (CFB22 (bv->signal (constant 'CFB22 (bitvector 1))))
      #:CFB23 (CFB23 (bv->signal (constant 'CFB23 (bitvector 1))))
      #:CFB3 (CFB3 (bv->signal (constant 'CFB3 (bitvector 1))))
      #:CFB4 (CFB4 (bv->signal (constant 'CFB4 (bitvector 1))))
      #:CFB5 (CFB5 (bv->signal (constant 'CFB5 (bitvector 1))))
      #:CFB6 (CFB6 (bv->signal (constant 'CFB6 (bitvector 1))))
      #:CFB7 (CFB7 (bv->signal (constant 'CFB7 (bitvector 1))))
      #:CFB8 (CFB8 (bv->signal (constant 'CFB8 (bitvector 1))))
      #:CFB9 (CFB9 (bv->signal (constant 'CFB9 (bitvector 1))))
      #:CIN0 (CIN0 (bv->signal (constant 'CIN0 (bitvector 1))))
      #:CIN1 (CIN1 (bv->signal (constant 'CIN1 (bitvector 1))))
      #:CIN10 (CIN10 (bv->signal (constant 'CIN10 (bitvector 1))))
      #:CIN11 (CIN11 (bv->signal (constant 'CIN11 (bitvector 1))))
      #:CIN12 (CIN12 (bv->signal (constant 'CIN12 (bitvector 1))))
      #:CIN13 (CIN13 (bv->signal (constant 'CIN13 (bitvector 1))))
      #:CIN14 (CIN14 (bv->signal (constant 'CIN14 (bitvector 1))))
      #:CIN15 (CIN15 (bv->signal (constant 'CIN15 (bitvector 1))))
      #:CIN16 (CIN16 (bv->signal (constant 'CIN16 (bitvector 1))))
      #:CIN17 (CIN17 (bv->signal (constant 'CIN17 (bitvector 1))))
      #:CIN18 (CIN18 (bv->signal (constant 'CIN18 (bitvector 1))))
      #:CIN19 (CIN19 (bv->signal (constant 'CIN19 (bitvector 1))))
      #:CIN2 (CIN2 (bv->signal (constant 'CIN2 (bitvector 1))))
      #:CIN20 (CIN20 (bv->signal (constant 'CIN20 (bitvector 1))))
      #:CIN21 (CIN21 (bv->signal (constant 'CIN21 (bitvector 1))))
      #:CIN22 (CIN22 (bv->signal (constant 'CIN22 (bitvector 1))))
      #:CIN23 (CIN23 (bv->signal (constant 'CIN23 (bitvector 1))))
      #:CIN3 (CIN3 (bv->signal (constant 'CIN3 (bitvector 1))))
      #:CIN4 (CIN4 (bv->signal (constant 'CIN4 (bitvector 1))))
      #:CIN5 (CIN5 (bv->signal (constant 'CIN5 (bitvector 1))))
      #:CIN6 (CIN6 (bv->signal (constant 'CIN6 (bitvector 1))))
      #:CIN7 (CIN7 (bv->signal (constant 'CIN7 (bitvector 1))))
      #:CIN8 (CIN8 (bv->signal (constant 'CIN8 (bitvector 1))))
      #:CIN9 (CIN9 (bv->signal (constant 'CIN9 (bitvector 1))))
      #:CLK0 (CLK0 (bv->signal (constant 'CLK0 (bitvector 1))))
      #:CLK0_DIV (CLK0_DIV (bv->signal (constant 'CLK0_DIV (bitvector 5))))
      #:CLK1 (CLK1 (bv->signal (constant 'CLK1 (bitvector 1))))
      #:CLK1_DIV (CLK1_DIV (bv->signal (constant 'CLK1_DIV (bitvector 5))))
      #:CLK2 (CLK2 (bv->signal (constant 'CLK2 (bitvector 1))))
      #:CLK2_DIV (CLK2_DIV (bv->signal (constant 'CLK2_DIV (bitvector 5))))
      #:CLK3 (CLK3 (bv->signal (constant 'CLK3 (bitvector 1))))
      #:CLK3_DIV (CLK3_DIV (bv->signal (constant 'CLK3_DIV (bitvector 5))))
      #:GSR (GSR (bv->signal (constant 'GSR (bitvector 5))))
      #:MA0 (MA0 (bv->signal (constant 'MA0 (bitvector 1))))
      #:MA1 (MA1 (bv->signal (constant 'MA1 (bitvector 1))))
      #:MA10 (MA10 (bv->signal (constant 'MA10 (bitvector 1))))
      #:MA11 (MA11 (bv->signal (constant 'MA11 (bitvector 1))))
      #:MA12 (MA12 (bv->signal (constant 'MA12 (bitvector 1))))
      #:MA13 (MA13 (bv->signal (constant 'MA13 (bitvector 1))))
      #:MA14 (MA14 (bv->signal (constant 'MA14 (bitvector 1))))
      #:MA15 (MA15 (bv->signal (constant 'MA15 (bitvector 1))))
      #:MA16 (MA16 (bv->signal (constant 'MA16 (bitvector 1))))
      #:MA17 (MA17 (bv->signal (constant 'MA17 (bitvector 1))))
      #:MA2 (MA2 (bv->signal (constant 'MA2 (bitvector 1))))
      #:MA3 (MA3 (bv->signal (constant 'MA3 (bitvector 1))))
      #:MA4 (MA4 (bv->signal (constant 'MA4 (bitvector 1))))
      #:MA5 (MA5 (bv->signal (constant 'MA5 (bitvector 1))))
      #:MA6 (MA6 (bv->signal (constant 'MA6 (bitvector 1))))
      #:MA7 (MA7 (bv->signal (constant 'MA7 (bitvector 1))))
      #:MA8 (MA8 (bv->signal (constant 'MA8 (bitvector 1))))
      #:MA9 (MA9 (bv->signal (constant 'MA9 (bitvector 1))))
      #:MB0 (MB0 (bv->signal (constant 'MB0 (bitvector 1))))
      #:MB1 (MB1 (bv->signal (constant 'MB1 (bitvector 1))))
      #:MB10 (MB10 (bv->signal (constant 'MB10 (bitvector 1))))
      #:MB11 (MB11 (bv->signal (constant 'MB11 (bitvector 1))))
      #:MB12 (MB12 (bv->signal (constant 'MB12 (bitvector 1))))
      #:MB13 (MB13 (bv->signal (constant 'MB13 (bitvector 1))))
      #:MB14 (MB14 (bv->signal (constant 'MB14 (bitvector 1))))
      #:MB15 (MB15 (bv->signal (constant 'MB15 (bitvector 1))))
      #:MB16 (MB16 (bv->signal (constant 'MB16 (bitvector 1))))
      #:MB17 (MB17 (bv->signal (constant 'MB17 (bitvector 1))))
      #:MB2 (MB2 (bv->signal (constant 'MB2 (bitvector 1))))
      #:MB3 (MB3 (bv->signal (constant 'MB3 (bitvector 1))))
      #:MB4 (MB4 (bv->signal (constant 'MB4 (bitvector 1))))
      #:MB5 (MB5 (bv->signal (constant 'MB5 (bitvector 1))))
      #:MB6 (MB6 (bv->signal (constant 'MB6 (bitvector 1))))
      #:MB7 (MB7 (bv->signal (constant 'MB7 (bitvector 1))))
      #:MB8 (MB8 (bv->signal (constant 'MB8 (bitvector 1))))
      #:MB9 (MB9 (bv->signal (constant 'MB9 (bitvector 1))))
      #:OPADDNSUB (OPADDNSUB (bv->signal (constant 'OPADDNSUB (bitvector 1))))
      #:OPCINSEL (OPCINSEL (bv->signal (constant 'OPCINSEL (bitvector 1))))
      #:REG_INPUTCFB_CE (REG_INPUTCFB_CE (bv->signal (constant 'REG_INPUTCFB_CE (bitvector 5))))
      #:REG_INPUTCFB_CLK (REG_INPUTCFB_CLK (bv->signal (constant 'REG_INPUTCFB_CLK (bitvector 5))))
      #:REG_INPUTCFB_RST (REG_INPUTCFB_RST (bv->signal (constant 'REG_INPUTCFB_RST (bitvector 5))))
      #:REG_OPCODE_0_CE (REG_OPCODE_0_CE (bv->signal (constant 'REG_OPCODE_0_CE (bitvector 5))))
      #:REG_OPCODE_0_CLK (REG_OPCODE_0_CLK (bv->signal (constant 'REG_OPCODE_0_CLK (bitvector 5))))
      #:REG_OPCODE_0_RST (REG_OPCODE_0_RST (bv->signal (constant 'REG_OPCODE_0_RST (bitvector 5))))
      #:REG_OPCODE_1_CE (REG_OPCODE_1_CE (bv->signal (constant 'REG_OPCODE_1_CE (bitvector 5))))
      #:REG_OPCODE_1_CLK (REG_OPCODE_1_CLK (bv->signal (constant 'REG_OPCODE_1_CLK (bitvector 5))))
      #:REG_OPCODE_1_RST (REG_OPCODE_1_RST (bv->signal (constant 'REG_OPCODE_1_RST (bitvector 5))))
      #:REG_OUTPUT_CE (REG_OUTPUT_CE (bv->signal (constant 'REG_OUTPUT_CE (bitvector 5))))
      #:REG_OUTPUT_CLK (REG_OUTPUT_CLK (bv->signal (constant 'REG_OUTPUT_CLK (bitvector 5))))
      #:REG_OUTPUT_RST (REG_OUTPUT_RST (bv->signal (constant 'REG_OUTPUT_RST (bitvector 5))))
      #:RESETMODE (RESETMODE (bv->signal (constant 'RESETMODE (bitvector 5))))
      #:RST0 (RST0 (bv->signal (constant 'RST0 (bitvector 1))))
      #:RST1 (RST1 (bv->signal (constant 'RST1 (bitvector 1))))
      #:RST2 (RST2 (bv->signal (constant 'RST2 (bitvector 1))))
      #:RST3 (RST3 (bv->signal (constant 'RST3 (bitvector 1))))
      #:SIGNEDIA (SIGNEDIA (bv->signal (constant 'SIGNEDIA (bitvector 1))))
      #:SIGNEDIB (SIGNEDIB (bv->signal (constant 'SIGNEDIB (bitvector 1))))
      #:unnamed-input-218
      (unnamed-input-218 (bv->signal (constant 'unnamed-input-218 (bitvector 24)))))
    (let* ([merged-input-state-hash (hash)]
           [init-hash (hash)]
           [btor1 (bitvector 1)]
           [btor2 CE0]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CE0))]
           [btor3 CE1]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CE1))]
           [btor4 CE2]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CE2))]
           [btor5 CE3]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CE3))]
           [btor6 CFB0]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CFB0))]
           [btor7 CFB1]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CFB1))]
           [btor8 CFB10]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CFB10))]
           [btor9 CFB11]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CFB11))]
           [btor10 CFB12]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CFB12))]
           [btor11 CFB13]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CFB13))]
           [btor12 CFB14]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CFB14))]
           [btor13 CFB15]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CFB15))]
           [btor14 CFB16]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CFB16))]
           [btor15 CFB17]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CFB17))]
           [btor16 CFB18]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CFB18))]
           [btor17 CFB19]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CFB19))]
           [btor18 CFB2]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CFB2))]
           [btor19 CFB20]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CFB20))]
           [btor20 CFB21]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CFB21))]
           [btor21 CFB22]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CFB22))]
           [btor22 CFB23]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CFB23))]
           [btor23 CFB3]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CFB3))]
           [btor24 CFB4]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CFB4))]
           [btor25 CFB5]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CFB5))]
           [btor26 CFB6]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CFB6))]
           [btor27 CFB7]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CFB7))]
           [btor28 CFB8]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CFB8))]
           [btor29 CFB9]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CFB9))]
           [btor30 CIN0]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CIN0))]
           [btor31 CIN1]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CIN1))]
           [btor32 CIN10]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CIN10))]
           [btor33 CIN11]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CIN11))]
           [btor34 CIN12]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CIN12))]
           [btor35 CIN13]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CIN13))]
           [btor36 CIN14]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CIN14))]
           [btor37 CIN15]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CIN15))]
           [btor38 CIN16]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CIN16))]
           [btor39 CIN17]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CIN17))]
           [btor40 CIN18]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CIN18))]
           [btor41 CIN19]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CIN19))]
           [btor42 CIN2]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CIN2))]
           [btor43 CIN20]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CIN20))]
           [btor44 CIN21]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CIN21))]
           [btor45 CIN22]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CIN22))]
           [btor46 CIN23]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CIN23))]
           [btor47 CIN3]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CIN3))]
           [btor48 CIN4]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CIN4))]
           [btor49 CIN5]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CIN5))]
           [btor50 CIN6]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CIN6))]
           [btor51 CIN7]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CIN7))]
           [btor52 CIN8]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CIN8))]
           [btor53 CIN9]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CIN9))]
           [btor54 CLK0]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CLK0))]
           [btor55 (bitvector 5)]
           [btor56 CLK0_DIV]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CLK0_DIV))]
           [btor57 CLK1]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CLK1))]
           [btor58 CLK1_DIV]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CLK1_DIV))]
           [btor59 CLK2]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CLK2))]
           [btor60 CLK2_DIV]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CLK2_DIV))]
           [btor61 CLK3]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CLK3))]
           [btor62 CLK3_DIV]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CLK3_DIV))]
           [btor63 GSR]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state GSR))]
           [btor64 MA0]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state MA0))]
           [btor65 MA1]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state MA1))]
           [btor66 MA10]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state MA10))]
           [btor67 MA11]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state MA11))]
           [btor68 MA12]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state MA12))]
           [btor69 MA13]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state MA13))]
           [btor70 MA14]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state MA14))]
           [btor71 MA15]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state MA15))]
           [btor72 MA16]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state MA16))]
           [btor73 MA17]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state MA17))]
           [btor74 MA2]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state MA2))]
           [btor75 MA3]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state MA3))]
           [btor76 MA4]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state MA4))]
           [btor77 MA5]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state MA5))]
           [btor78 MA6]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state MA6))]
           [btor79 MA7]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state MA7))]
           [btor80 MA8]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state MA8))]
           [btor81 MA9]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state MA9))]
           [btor82 MB0]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state MB0))]
           [btor83 MB1]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state MB1))]
           [btor84 MB10]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state MB10))]
           [btor85 MB11]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state MB11))]
           [btor86 MB12]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state MB12))]
           [btor87 MB13]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state MB13))]
           [btor88 MB14]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state MB14))]
           [btor89 MB15]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state MB15))]
           [btor90 MB16]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state MB16))]
           [btor91 MB17]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state MB17))]
           [btor92 MB2]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state MB2))]
           [btor93 MB3]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state MB3))]
           [btor94 MB4]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state MB4))]
           [btor95 MB5]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state MB5))]
           [btor96 MB6]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state MB6))]
           [btor97 MB7]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state MB7))]
           [btor98 MB8]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state MB8))]
           [btor99 MB9]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state MB9))]
           [btor100 OPADDNSUB]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state OPADDNSUB))]
           [btor101 OPCINSEL]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state OPCINSEL))]
           [btor102 REG_INPUTCFB_CE]
           [merged-input-state-hash (hash-union merged-input-state-hash
                                                (signal-state REG_INPUTCFB_CE))]
           [btor103 REG_INPUTCFB_CLK]
           [merged-input-state-hash (hash-union merged-input-state-hash
                                                (signal-state REG_INPUTCFB_CLK))]
           [btor104 REG_INPUTCFB_RST]
           [merged-input-state-hash (hash-union merged-input-state-hash
                                                (signal-state REG_INPUTCFB_RST))]
           [btor105 REG_OPCODE_0_CE]
           [merged-input-state-hash (hash-union merged-input-state-hash
                                                (signal-state REG_OPCODE_0_CE))]
           [btor106 REG_OPCODE_0_CLK]
           [merged-input-state-hash (hash-union merged-input-state-hash
                                                (signal-state REG_OPCODE_0_CLK))]
           [btor107 REG_OPCODE_0_RST]
           [merged-input-state-hash (hash-union merged-input-state-hash
                                                (signal-state REG_OPCODE_0_RST))]
           [btor108 REG_OPCODE_1_CE]
           [merged-input-state-hash (hash-union merged-input-state-hash
                                                (signal-state REG_OPCODE_1_CE))]
           [btor109 REG_OPCODE_1_CLK]
           [merged-input-state-hash (hash-union merged-input-state-hash
                                                (signal-state REG_OPCODE_1_CLK))]
           [btor110 REG_OPCODE_1_RST]
           [merged-input-state-hash (hash-union merged-input-state-hash
                                                (signal-state REG_OPCODE_1_RST))]
           [btor111 REG_OUTPUT_CE]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state REG_OUTPUT_CE))]
           [btor112 REG_OUTPUT_CLK]
           [merged-input-state-hash (hash-union merged-input-state-hash
                                                (signal-state REG_OUTPUT_CLK))]
           [btor113 REG_OUTPUT_RST]
           [merged-input-state-hash (hash-union merged-input-state-hash
                                                (signal-state REG_OUTPUT_RST))]
           [btor114 RESETMODE]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state RESETMODE))]
           [btor115 RST0]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state RST0))]
           [btor116 RST1]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state RST1))]
           [btor117 RST2]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state RST2))]
           [btor118 RST3]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state RST3))]
           [btor119 SIGNEDIA]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state SIGNEDIA))]
           [btor120 SIGNEDIB]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state SIGNEDIB))]
           [btor121 (bitvector 24)]
           [btor122 (bv->signal (bv 0 (bitvector 24)))]
           [btor123 (bitvector 2)]
           [btor124 (signal (concat (signal-value btor7) (signal-value btor6))
                            (merge-state (list btor7 btor6)))]
           [btor125 (bitvector 3)]
           [btor126 (signal (concat (signal-value btor18) (signal-value btor124))
                            (merge-state (list btor18 btor124)))]
           [btor127 (bitvector 4)]
           [btor128 (signal (concat (signal-value btor23) (signal-value btor126))
                            (merge-state (list btor23 btor126)))]
           [btor129 (signal (concat (signal-value btor24) (signal-value btor128))
                            (merge-state (list btor24 btor128)))]
           [btor130 (bitvector 6)]
           [btor131 (signal (concat (signal-value btor25) (signal-value btor129))
                            (merge-state (list btor25 btor129)))]
           [btor132 (bitvector 7)]
           [btor133 (signal (concat (signal-value btor26) (signal-value btor131))
                            (merge-state (list btor26 btor131)))]
           [btor134 (bitvector 8)]
           [btor135 (signal (concat (signal-value btor27) (signal-value btor133))
                            (merge-state (list btor27 btor133)))]
           [btor136 (bitvector 9)]
           [btor137 (signal (concat (signal-value btor28) (signal-value btor135))
                            (merge-state (list btor28 btor135)))]
           [btor138 (bitvector 10)]
           [btor139 (signal (concat (signal-value btor29) (signal-value btor137))
                            (merge-state (list btor29 btor137)))]
           [btor140 (bitvector 11)]
           [btor141 (signal (concat (signal-value btor8) (signal-value btor139))
                            (merge-state (list btor8 btor139)))]
           [btor142 (bitvector 12)]
           [btor143 (signal (concat (signal-value btor9) (signal-value btor141))
                            (merge-state (list btor9 btor141)))]
           [btor144 (bitvector 13)]
           [btor145 (signal (concat (signal-value btor10) (signal-value btor143))
                            (merge-state (list btor10 btor143)))]
           [btor146 (bitvector 14)]
           [btor147 (signal (concat (signal-value btor11) (signal-value btor145))
                            (merge-state (list btor11 btor145)))]
           [btor148 (bitvector 15)]
           [btor149 (signal (concat (signal-value btor12) (signal-value btor147))
                            (merge-state (list btor12 btor147)))]
           [btor150 (bitvector 16)]
           [btor151 (signal (concat (signal-value btor13) (signal-value btor149))
                            (merge-state (list btor13 btor149)))]
           [btor152 (bitvector 17)]
           [btor153 (signal (concat (signal-value btor14) (signal-value btor151))
                            (merge-state (list btor14 btor151)))]
           [btor154 (bitvector 18)]
           [btor155 (signal (concat (signal-value btor15) (signal-value btor153))
                            (merge-state (list btor15 btor153)))]
           [btor156 (bitvector 19)]
           [btor157 (signal (concat (signal-value btor16) (signal-value btor155))
                            (merge-state (list btor16 btor155)))]
           [btor158 (bitvector 20)]
           [btor159 (signal (concat (signal-value btor17) (signal-value btor157))
                            (merge-state (list btor17 btor157)))]
           [btor160 (bitvector 21)]
           [btor161 (signal (concat (signal-value btor19) (signal-value btor159))
                            (merge-state (list btor19 btor159)))]
           [btor162 (bitvector 22)]
           [btor163 (signal (concat (signal-value btor20) (signal-value btor161))
                            (merge-state (list btor20 btor161)))]
           [btor164 (bitvector 23)]
           [btor165 (signal (concat (signal-value btor21) (signal-value btor163))
                            (merge-state (list btor21 btor163)))]
           [btor166 (signal (concat (signal-value btor22) (signal-value btor165))
                            (merge-state (list btor22 btor165)))]
           [btor167 (signal (apply bvor (bitvector->bits (signal-value btor103)))
                            (signal-state btor103))]
           [btor168 (signal (bvnot (signal-value btor167)) (merge-state (list btor167)))]
           [btor169 (if (bitvector->bool (signal-value btor168)) btor166 btor122)]
           [btor170 (signal (extract 0 0 (signal-value btor169)) (signal-state btor169))]
           [btor172 (signal (extract 1 1 (signal-value btor169)) (signal-state btor169))]
           [btor174 (signal (extract 10 10 (signal-value btor169)) (signal-state btor169))]
           [btor176 (signal (extract 11 11 (signal-value btor169)) (signal-state btor169))]
           [btor178 (signal (extract 12 12 (signal-value btor169)) (signal-state btor169))]
           [btor180 (signal (extract 13 13 (signal-value btor169)) (signal-state btor169))]
           [btor182 (signal (extract 14 14 (signal-value btor169)) (signal-state btor169))]
           [btor184 (signal (extract 15 15 (signal-value btor169)) (signal-state btor169))]
           [btor186 (signal (extract 16 16 (signal-value btor169)) (signal-state btor169))]
           [btor188 (signal (extract 17 17 (signal-value btor169)) (signal-state btor169))]
           [btor190 (signal (extract 18 18 (signal-value btor169)) (signal-state btor169))]
           [btor192 (signal (extract 19 19 (signal-value btor169)) (signal-state btor169))]
           [btor194 (signal (extract 2 2 (signal-value btor169)) (signal-state btor169))]
           [btor196 (signal (extract 20 20 (signal-value btor169)) (signal-state btor169))]
           [btor198 (signal (extract 21 21 (signal-value btor169)) (signal-state btor169))]
           [btor200 (signal (extract 22 22 (signal-value btor169)) (signal-state btor169))]
           [btor202 (signal (extract 23 23 (signal-value btor169)) (signal-state btor169))]
           [btor204 (signal (extract 3 3 (signal-value btor169)) (signal-state btor169))]
           [btor206 (signal (extract 4 4 (signal-value btor169)) (signal-state btor169))]
           [btor208 (signal (extract 5 5 (signal-value btor169)) (signal-state btor169))]
           [btor210 (signal (extract 6 6 (signal-value btor169)) (signal-state btor169))]
           [btor212 (signal (extract 7 7 (signal-value btor169)) (signal-state btor169))]
           [btor214 (signal (extract 8 8 (signal-value btor169)) (signal-state btor169))]
           [btor216 (signal (extract 9 9 (signal-value btor169)) (signal-state btor169))]
           [btor218 unnamed-input-218]
           [btor219 (bv->signal (bv 0 (bitvector 6)))]
           [btor220 (signal (concat (signal-value btor73) (signal-value btor73))
                            (merge-state (list btor73 btor73)))]
           [btor221 (signal (concat (signal-value btor73) (signal-value btor220))
                            (merge-state (list btor73 btor220)))]
           [btor222 (signal (concat (signal-value btor73) (signal-value btor221))
                            (merge-state (list btor73 btor221)))]
           [btor223 (signal (concat (signal-value btor73) (signal-value btor222))
                            (merge-state (list btor73 btor222)))]
           [btor224 (signal (concat (signal-value btor73) (signal-value btor223))
                            (merge-state (list btor73 btor223)))]
           [btor225 (if (bitvector->bool (signal-value btor119)) btor224 btor219)]
           [btor226 (signal (concat (signal-value btor65) (signal-value btor64))
                            (merge-state (list btor65 btor64)))]
           [btor227 (signal (concat (signal-value btor74) (signal-value btor226))
                            (merge-state (list btor74 btor226)))]
           [btor228 (signal (concat (signal-value btor75) (signal-value btor227))
                            (merge-state (list btor75 btor227)))]
           [btor229 (signal (concat (signal-value btor76) (signal-value btor228))
                            (merge-state (list btor76 btor228)))]
           [btor230 (signal (concat (signal-value btor77) (signal-value btor229))
                            (merge-state (list btor77 btor229)))]
           [btor231 (signal (concat (signal-value btor78) (signal-value btor230))
                            (merge-state (list btor78 btor230)))]
           [btor232 (signal (concat (signal-value btor79) (signal-value btor231))
                            (merge-state (list btor79 btor231)))]
           [btor233 (signal (concat (signal-value btor80) (signal-value btor232))
                            (merge-state (list btor80 btor232)))]
           [btor234 (signal (concat (signal-value btor81) (signal-value btor233))
                            (merge-state (list btor81 btor233)))]
           [btor235 (signal (concat (signal-value btor66) (signal-value btor234))
                            (merge-state (list btor66 btor234)))]
           [btor236 (signal (concat (signal-value btor67) (signal-value btor235))
                            (merge-state (list btor67 btor235)))]
           [btor237 (signal (concat (signal-value btor68) (signal-value btor236))
                            (merge-state (list btor68 btor236)))]
           [btor238 (signal (concat (signal-value btor69) (signal-value btor237))
                            (merge-state (list btor69 btor237)))]
           [btor239 (signal (concat (signal-value btor70) (signal-value btor238))
                            (merge-state (list btor70 btor238)))]
           [btor240 (signal (concat (signal-value btor71) (signal-value btor239))
                            (merge-state (list btor71 btor239)))]
           [btor241 (signal (concat (signal-value btor72) (signal-value btor240))
                            (merge-state (list btor72 btor240)))]
           [btor242 (signal (concat (signal-value btor73) (signal-value btor241))
                            (merge-state (list btor73 btor241)))]
           [btor243 (signal (concat (signal-value btor225) (signal-value btor242))
                            (merge-state (list btor225 btor242)))]
           [btor244 (signal (concat (signal-value btor91) (signal-value btor91))
                            (merge-state (list btor91 btor91)))]
           [btor245 (signal (concat (signal-value btor91) (signal-value btor244))
                            (merge-state (list btor91 btor244)))]
           [btor246 (signal (concat (signal-value btor91) (signal-value btor245))
                            (merge-state (list btor91 btor245)))]
           [btor247 (signal (concat (signal-value btor91) (signal-value btor246))
                            (merge-state (list btor91 btor246)))]
           [btor248 (signal (concat (signal-value btor91) (signal-value btor247))
                            (merge-state (list btor91 btor247)))]
           [btor249 (if (bitvector->bool (signal-value btor120)) btor248 btor219)]
           [btor250 (signal (concat (signal-value btor83) (signal-value btor82))
                            (merge-state (list btor83 btor82)))]
           [btor251 (signal (concat (signal-value btor92) (signal-value btor250))
                            (merge-state (list btor92 btor250)))]
           [btor252 (signal (concat (signal-value btor93) (signal-value btor251))
                            (merge-state (list btor93 btor251)))]
           [btor253 (signal (concat (signal-value btor94) (signal-value btor252))
                            (merge-state (list btor94 btor252)))]
           [btor254 (signal (concat (signal-value btor95) (signal-value btor253))
                            (merge-state (list btor95 btor253)))]
           [btor255 (signal (concat (signal-value btor96) (signal-value btor254))
                            (merge-state (list btor96 btor254)))]
           [btor256 (signal (concat (signal-value btor97) (signal-value btor255))
                            (merge-state (list btor97 btor255)))]
           [btor257 (signal (concat (signal-value btor98) (signal-value btor256))
                            (merge-state (list btor98 btor256)))]
           [btor258 (signal (concat (signal-value btor99) (signal-value btor257))
                            (merge-state (list btor99 btor257)))]
           [btor259 (signal (concat (signal-value btor84) (signal-value btor258))
                            (merge-state (list btor84 btor258)))]
           [btor260 (signal (concat (signal-value btor85) (signal-value btor259))
                            (merge-state (list btor85 btor259)))]
           [btor261 (signal (concat (signal-value btor86) (signal-value btor260))
                            (merge-state (list btor86 btor260)))]
           [btor262 (signal (concat (signal-value btor87) (signal-value btor261))
                            (merge-state (list btor87 btor261)))]
           [btor263 (signal (concat (signal-value btor88) (signal-value btor262))
                            (merge-state (list btor88 btor262)))]
           [btor264 (signal (concat (signal-value btor89) (signal-value btor263))
                            (merge-state (list btor89 btor263)))]
           [btor265 (signal (concat (signal-value btor90) (signal-value btor264))
                            (merge-state (list btor90 btor264)))]
           [btor266 (signal (concat (signal-value btor91) (signal-value btor265))
                            (merge-state (list btor91 btor265)))]
           [btor267 (signal (concat (signal-value btor249) (signal-value btor266))
                            (merge-state (list btor249 btor266)))]
           [btor268 (signal (bvsub (signal-value btor243) (signal-value btor267))
                            (merge-state (list btor243 btor267)))]
           [btor269 (signal (concat (signal-value btor31) (signal-value btor30))
                            (merge-state (list btor31 btor30)))]
           [btor270 (signal (concat (signal-value btor42) (signal-value btor269))
                            (merge-state (list btor42 btor269)))]
           [btor271 (signal (concat (signal-value btor47) (signal-value btor270))
                            (merge-state (list btor47 btor270)))]
           [btor272 (signal (concat (signal-value btor48) (signal-value btor271))
                            (merge-state (list btor48 btor271)))]
           [btor273 (signal (concat (signal-value btor49) (signal-value btor272))
                            (merge-state (list btor49 btor272)))]
           [btor274 (signal (concat (signal-value btor50) (signal-value btor273))
                            (merge-state (list btor50 btor273)))]
           [btor275 (signal (concat (signal-value btor51) (signal-value btor274))
                            (merge-state (list btor51 btor274)))]
           [btor276 (signal (concat (signal-value btor52) (signal-value btor275))
                            (merge-state (list btor52 btor275)))]
           [btor277 (signal (concat (signal-value btor53) (signal-value btor276))
                            (merge-state (list btor53 btor276)))]
           [btor278 (signal (concat (signal-value btor32) (signal-value btor277))
                            (merge-state (list btor32 btor277)))]
           [btor279 (signal (concat (signal-value btor33) (signal-value btor278))
                            (merge-state (list btor33 btor278)))]
           [btor280 (signal (concat (signal-value btor34) (signal-value btor279))
                            (merge-state (list btor34 btor279)))]
           [btor281 (signal (concat (signal-value btor35) (signal-value btor280))
                            (merge-state (list btor35 btor280)))]
           [btor282 (signal (concat (signal-value btor36) (signal-value btor281))
                            (merge-state (list btor36 btor281)))]
           [btor283 (signal (concat (signal-value btor37) (signal-value btor282))
                            (merge-state (list btor37 btor282)))]
           [btor284 (signal (concat (signal-value btor38) (signal-value btor283))
                            (merge-state (list btor38 btor283)))]
           [btor285 (signal (concat (signal-value btor39) (signal-value btor284))
                            (merge-state (list btor39 btor284)))]
           [btor286 (signal (concat (signal-value btor40) (signal-value btor285))
                            (merge-state (list btor40 btor285)))]
           [btor287 (signal (concat (signal-value btor41) (signal-value btor286))
                            (merge-state (list btor41 btor286)))]
           [btor288 (signal (concat (signal-value btor43) (signal-value btor287))
                            (merge-state (list btor43 btor287)))]
           [btor289 (signal (concat (signal-value btor44) (signal-value btor288))
                            (merge-state (list btor44 btor288)))]
           [btor290 (signal (concat (signal-value btor45) (signal-value btor289))
                            (merge-state (list btor45 btor289)))]
           [btor291 (signal (concat (signal-value btor46) (signal-value btor290))
                            (merge-state (list btor46 btor290)))]
           [btor292 (bv->signal (bv 0 (bitvector 1)))]
           [btor293 (signal (apply bvor (bitvector->bits (signal-value btor106)))
                            (signal-state btor106))]
           [btor294 (signal (bvnot (signal-value btor293)) (merge-state (list btor293)))]
           [btor295 (if (bitvector->bool (signal-value btor294)) btor101 btor292)]
           [btor296 (signal (apply bvor (bitvector->bits (signal-value btor109)))
                            (signal-state btor109))]
           [btor297 (signal (bvnot (signal-value btor296)) (merge-state (list btor296)))]
           [btor298 (if (bitvector->bool (signal-value btor297)) btor295 btor292)]
           [btor299 (if (bitvector->bool (signal-value btor298)) btor291 btor122)]
           [btor300 (signal (bvadd (signal-value btor268) (signal-value btor299))
                            (merge-state (list btor268 btor299)))]
           [btor301 (if (bitvector->bool (signal-value btor294)) btor100 btor292)]
           [btor302 (if (bitvector->bool (signal-value btor297)) btor301 btor292)]
           [btor303 (if (bitvector->bool (signal-value btor302)) btor300 btor218)]
           [btor304 (signal (bvadd (signal-value btor243) (signal-value btor267))
                            (merge-state (list btor243 btor267)))]
           [btor305 (signal (bvadd (signal-value btor304) (signal-value btor299))
                            (merge-state (list btor304 btor299)))]
           [btor306 (signal (bvnot (signal-value btor302)) (merge-state (list btor302)))]
           [btor307 (if (bitvector->bool (signal-value btor306)) btor305 btor303)]
           [btor308 (signal (apply bvor (bitvector->bits (signal-value btor112)))
                            (signal-state btor112))]
           [btor309 (signal (bvnot (signal-value btor308)) (merge-state (list btor308)))]
           [btor310 (if (bitvector->bool (signal-value btor309)) btor307 btor122)]
           [btor311 (signal (extract 0 0 (signal-value btor310)) (signal-state btor310))]
           [btor313 (signal (extract 1 1 (signal-value btor310)) (signal-state btor310))]
           [btor315 (signal (extract 10 10 (signal-value btor310)) (signal-state btor310))]
           [btor317 (signal (extract 11 11 (signal-value btor310)) (signal-state btor310))]
           [btor319 (signal (extract 12 12 (signal-value btor310)) (signal-state btor310))]
           [btor321 (signal (extract 13 13 (signal-value btor310)) (signal-state btor310))]
           [btor323 (signal (extract 14 14 (signal-value btor310)) (signal-state btor310))]
           [btor325 (signal (extract 15 15 (signal-value btor310)) (signal-state btor310))]
           [btor327 (signal (extract 16 16 (signal-value btor310)) (signal-state btor310))]
           [btor329 (signal (extract 17 17 (signal-value btor310)) (signal-state btor310))]
           [btor331 (signal (extract 18 18 (signal-value btor310)) (signal-state btor310))]
           [btor333 (signal (extract 19 19 (signal-value btor310)) (signal-state btor310))]
           [btor335 (signal (extract 2 2 (signal-value btor310)) (signal-state btor310))]
           [btor337 (signal (extract 20 20 (signal-value btor310)) (signal-state btor310))]
           [btor339 (signal (extract 21 21 (signal-value btor310)) (signal-state btor310))]
           [btor341 (signal (extract 22 22 (signal-value btor310)) (signal-state btor310))]
           [btor343 (signal (extract 23 23 (signal-value btor310)) (signal-state btor310))]
           [btor345 (signal (extract 3 3 (signal-value btor310)) (signal-state btor310))]
           [btor347 (signal (extract 4 4 (signal-value btor310)) (signal-state btor310))]
           [btor349 (signal (extract 5 5 (signal-value btor310)) (signal-state btor310))]
           [btor351 (signal (extract 6 6 (signal-value btor310)) (signal-state btor310))]
           [btor353 (signal (extract 7 7 (signal-value btor310)) (signal-state btor310))]
           [btor355 (signal (extract 8 8 (signal-value btor310)) (signal-state btor310))]
           [btor357 (signal (extract 9 9 (signal-value btor310)) (signal-state btor310))]
           [btor359 (bv->signal (zero-extend (signal-value btor2) (bitvector 1)) btor2)]
           [btor360 (bv->signal (zero-extend (signal-value btor3) (bitvector 1)) btor3)]
           [btor361 (bv->signal (zero-extend (signal-value btor4) (bitvector 1)) btor4)]
           [btor362 (bv->signal (zero-extend (signal-value btor5) (bitvector 1)) btor5)]
           [btor363 (bv->signal (zero-extend (signal-value btor54) (bitvector 1)) btor54)]
           [btor364 (bv->signal (zero-extend (signal-value btor57) (bitvector 1)) btor57)]
           [btor365 (bv->signal (zero-extend (signal-value btor59) (bitvector 1)) btor59)]
           [btor366 (bv->signal (zero-extend (signal-value btor61) (bitvector 1)) btor61)]
           [btor367 (bv->signal (zero-extend (signal-value btor115) (bitvector 1)) btor115)]
           [btor368 (bv->signal (zero-extend (signal-value btor116) (bitvector 1)) btor116)]
           [btor369 (bv->signal (zero-extend (signal-value btor117) (bitvector 1)) btor117)]
           [btor370 (bv->signal (zero-extend (signal-value btor118) (bitvector 1)) btor118)]
           [btor371 (bv->signal (zero-extend (signal-value btor100) (bitvector 1)) btor100)]
           [btor372 (bv->signal (zero-extend (signal-value btor301) (bitvector 1)) btor301)]
           [btor373 (bv->signal (zero-extend (signal-value btor292) (bitvector 1)) btor292)]
           [btor374 (bv->signal (zero-extend (signal-value btor302) (bitvector 1)) btor302)]
           [btor375 (bv->signal (zero-extend (signal-value btor292) (bitvector 1)) btor292)]
           [btor376 (bv->signal (zero-extend (signal-value btor299) (bitvector 24)) btor299)]
           [btor377 (bv->signal (zero-extend (signal-value btor169) (bitvector 24)) btor169)]
           [btor378 (bv->signal (zero-extend (signal-value btor122) (bitvector 24)) btor122)]
           [btor379 (bv->signal (zero-extend (signal-value btor166) (bitvector 24)) btor166)]
           [btor380 (bv->signal (zero-extend (signal-value btor291) (bitvector 24)) btor291)]
           [btor381 (bv->signal (zero-extend (signal-value btor101) (bitvector 1)) btor101)]
           [btor382 (bv->signal (zero-extend (signal-value btor295) (bitvector 1)) btor295)]
           [btor383 (bv->signal (zero-extend (signal-value btor292) (bitvector 1)) btor292)]
           [btor384 (bv->signal (zero-extend (signal-value btor298) (bitvector 1)) btor298)]
           [btor385 (bv->signal (zero-extend (signal-value btor292) (bitvector 1)) btor292)]
           [btor386 (bv->signal (zero-extend (signal-value btor169) (bitvector 24)) btor169)]
           [btor387 (signal (concat (signal-value btor65) (signal-value btor64))
                            (merge-state (list btor65 btor64)))]
           [btor388 (signal (concat (signal-value btor74) (signal-value btor387))
                            (merge-state (list btor74 btor387)))]
           [btor389 (signal (concat (signal-value btor75) (signal-value btor388))
                            (merge-state (list btor75 btor388)))]
           [btor390 (signal (concat (signal-value btor76) (signal-value btor389))
                            (merge-state (list btor76 btor389)))]
           [btor391 (signal (concat (signal-value btor77) (signal-value btor390))
                            (merge-state (list btor77 btor390)))]
           [btor392 (signal (concat (signal-value btor78) (signal-value btor391))
                            (merge-state (list btor78 btor391)))]
           [btor393 (signal (concat (signal-value btor79) (signal-value btor392))
                            (merge-state (list btor79 btor392)))]
           [btor394 (signal (concat (signal-value btor80) (signal-value btor393))
                            (merge-state (list btor80 btor393)))]
           [btor395 (signal (concat (signal-value btor81) (signal-value btor394))
                            (merge-state (list btor81 btor394)))]
           [btor396 (signal (concat (signal-value btor66) (signal-value btor395))
                            (merge-state (list btor66 btor395)))]
           [btor397 (signal (concat (signal-value btor67) (signal-value btor396))
                            (merge-state (list btor67 btor396)))]
           [btor398 (signal (concat (signal-value btor68) (signal-value btor397))
                            (merge-state (list btor68 btor397)))]
           [btor399 (signal (concat (signal-value btor69) (signal-value btor398))
                            (merge-state (list btor69 btor398)))]
           [btor400 (signal (concat (signal-value btor70) (signal-value btor399))
                            (merge-state (list btor70 btor399)))]
           [btor401 (signal (concat (signal-value btor71) (signal-value btor400))
                            (merge-state (list btor71 btor400)))]
           [btor402 (signal (concat (signal-value btor72) (signal-value btor401))
                            (merge-state (list btor72 btor401)))]
           [btor403 (signal (concat (signal-value btor73) (signal-value btor402))
                            (merge-state (list btor73 btor402)))]
           [btor404 (bv->signal (zero-extend (signal-value btor403) (bitvector 18)) btor403)]
           [btor405 (bv->signal (zero-extend (signal-value btor243) (bitvector 24)) btor243)]
           [btor406 (signal (concat (signal-value btor83) (signal-value btor82))
                            (merge-state (list btor83 btor82)))]
           [btor407 (signal (concat (signal-value btor92) (signal-value btor406))
                            (merge-state (list btor92 btor406)))]
           [btor408 (signal (concat (signal-value btor93) (signal-value btor407))
                            (merge-state (list btor93 btor407)))]
           [btor409 (signal (concat (signal-value btor94) (signal-value btor408))
                            (merge-state (list btor94 btor408)))]
           [btor410 (signal (concat (signal-value btor95) (signal-value btor409))
                            (merge-state (list btor95 btor409)))]
           [btor411 (signal (concat (signal-value btor96) (signal-value btor410))
                            (merge-state (list btor96 btor410)))]
           [btor412 (signal (concat (signal-value btor97) (signal-value btor411))
                            (merge-state (list btor97 btor411)))]
           [btor413 (signal (concat (signal-value btor98) (signal-value btor412))
                            (merge-state (list btor98 btor412)))]
           [btor414 (signal (concat (signal-value btor99) (signal-value btor413))
                            (merge-state (list btor99 btor413)))]
           [btor415 (signal (concat (signal-value btor84) (signal-value btor414))
                            (merge-state (list btor84 btor414)))]
           [btor416 (signal (concat (signal-value btor85) (signal-value btor415))
                            (merge-state (list btor85 btor415)))]
           [btor417 (signal (concat (signal-value btor86) (signal-value btor416))
                            (merge-state (list btor86 btor416)))]
           [btor418 (signal (concat (signal-value btor87) (signal-value btor417))
                            (merge-state (list btor87 btor417)))]
           [btor419 (signal (concat (signal-value btor88) (signal-value btor418))
                            (merge-state (list btor88 btor418)))]
           [btor420 (signal (concat (signal-value btor89) (signal-value btor419))
                            (merge-state (list btor89 btor419)))]
           [btor421 (signal (concat (signal-value btor90) (signal-value btor420))
                            (merge-state (list btor90 btor420)))]
           [btor422 (signal (concat (signal-value btor91) (signal-value btor421))
                            (merge-state (list btor91 btor421)))]
           [btor423 (bv->signal (zero-extend (signal-value btor422) (bitvector 18)) btor422)]
           [btor424 (bv->signal (zero-extend (signal-value btor267) (bitvector 24)) btor267)]
           [btor425 (bv->signal (zero-extend (signal-value btor307) (bitvector 24)) btor307)]
           [btor426 (bv->signal (zero-extend (signal-value btor310) (bitvector 24)) btor310)]
           [btor427 (bv->signal (zero-extend (signal-value btor122) (bitvector 24)) btor122)]
           [btor428 (bv->signal (zero-extend (signal-value btor310) (bitvector 24)) btor310)]
           [btor429 (bv->signal (zero-extend (signal-value btor119) (bitvector 1)) btor119)]
           [btor430 (bv->signal (zero-extend (signal-value btor120) (bitvector 1)) btor120)])
      (make-immutable-hash (list (cons 'CO11 (signal (signal-value btor176) (hash)))
                                 (cons 'R22 (signal (signal-value btor341) (hash)))
                                 (cons 'CO17 (signal (signal-value btor188) (hash)))
                                 (cons 'CO3 (signal (signal-value btor204) (hash)))
                                 (cons 'CO9 (signal (signal-value btor216) (hash)))
                                 (cons 'R10 (signal (signal-value btor315) (hash)))
                                 (cons 'CO4 (signal (signal-value btor206) (hash)))
                                 (cons 'R1 (signal (signal-value btor313) (hash)))
                                 (cons 'R4 (signal (signal-value btor347) (hash)))
                                 (cons 'R17 (signal (signal-value btor329) (hash)))
                                 (cons 'CO21 (signal (signal-value btor198) (hash)))
                                 (cons 'CO16 (signal (signal-value btor186) (hash)))
                                 (cons 'R23 (signal (signal-value btor343) (hash)))
                                 (cons 'CO2 (signal (signal-value btor194) (hash)))
                                 (cons 'CO5 (signal (signal-value btor208) (hash)))
                                 (cons 'CO8 (signal (signal-value btor214) (hash)))
                                 (cons 'CO10 (signal (signal-value btor174) (hash)))
                                 (cons 'R16 (signal (signal-value btor327) (hash)))
                                 (cons 'CO20 (signal (signal-value btor196) (hash)))
                                 (cons 'R11 (signal (signal-value btor317) (hash)))
                                 (cons 'R5 (signal (signal-value btor349) (hash)))
                                 (cons 'R0 (signal (signal-value btor311) (hash)))
                                 (cons 'R3 (signal (signal-value btor345) (hash)))
                                 (cons 'R6 (signal (signal-value btor351) (hash)))
                                 (cons 'R18 (signal (signal-value btor331) (hash)))
                                 (cons 'R9 (signal (signal-value btor357) (hash)))
                                 (cons 'CO23 (signal (signal-value btor202) (hash)))
                                 (cons 'R12 (signal (signal-value btor319) (hash)))
                                 (cons 'CO13 (signal (signal-value btor180) (hash)))
                                 (cons 'R15 (signal (signal-value btor325) (hash)))
                                 (cons 'R20 (signal (signal-value btor337) (hash)))
                                 (cons 'CO18 (signal (signal-value btor190) (hash)))
                                 (cons 'CO1 (signal (signal-value btor172) (hash)))
                                 (cons 'CO15 (signal (signal-value btor184) (hash)))
                                 (cons 'CO6 (signal (signal-value btor210) (hash)))
                                 (cons 'CO22 (signal (signal-value btor200) (hash)))
                                 (cons 'R13 (signal (signal-value btor321) (hash)))
                                 (cons 'R7 (signal (signal-value btor353) (hash)))
                                 (cons 'R19 (signal (signal-value btor333) (hash)))
                                 (cons 'R2 (signal (signal-value btor335) (hash)))
                                 (cons 'R8 (signal (signal-value btor355) (hash)))
                                 (cons 'R21 (signal (signal-value btor339) (hash)))
                                 (cons 'CO7 (signal (signal-value btor212) (hash)))
                                 (cons 'CO14 (signal (signal-value btor182) (hash)))
                                 (cons 'CO19 (signal (signal-value btor192) (hash)))
                                 (cons 'CO0 (signal (signal-value btor170) (hash)))
                                 (cons 'CO12 (signal (signal-value btor178) (hash)))
                                 (cons 'R14 (signal (signal-value btor323) (hash))))))))
