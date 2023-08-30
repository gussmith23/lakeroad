#lang racket/base
(provide lattice-ecp5-alu54a)
(require "../signal.rkt")
(require rosette)
(define lattice-ecp5-alu54a
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
      #:A18
      (A18 (bv->signal (constant 'A18 (bitvector 1))))
      #:A19
      (A19 (bv->signal (constant 'A19 (bitvector 1))))
      #:A2
      (A2 (bv->signal (constant 'A2 (bitvector 1))))
      #:A20
      (A20 (bv->signal (constant 'A20 (bitvector 1))))
      #:A21
      (A21 (bv->signal (constant 'A21 (bitvector 1))))
      #:A22
      (A22 (bv->signal (constant 'A22 (bitvector 1))))
      #:A23
      (A23 (bv->signal (constant 'A23 (bitvector 1))))
      #:A24
      (A24 (bv->signal (constant 'A24 (bitvector 1))))
      #:A25
      (A25 (bv->signal (constant 'A25 (bitvector 1))))
      #:A26
      (A26 (bv->signal (constant 'A26 (bitvector 1))))
      #:A27
      (A27 (bv->signal (constant 'A27 (bitvector 1))))
      #:A28
      (A28 (bv->signal (constant 'A28 (bitvector 1))))
      #:A29
      (A29 (bv->signal (constant 'A29 (bitvector 1))))
      #:A3
      (A3 (bv->signal (constant 'A3 (bitvector 1))))
      #:A30
      (A30 (bv->signal (constant 'A30 (bitvector 1))))
      #:A31
      (A31 (bv->signal (constant 'A31 (bitvector 1))))
      #:A32
      (A32 (bv->signal (constant 'A32 (bitvector 1))))
      #:A33
      (A33 (bv->signal (constant 'A33 (bitvector 1))))
      #:A34
      (A34 (bv->signal (constant 'A34 (bitvector 1))))
      #:A35
      (A35 (bv->signal (constant 'A35 (bitvector 1))))
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
      #:B18
      (B18 (bv->signal (constant 'B18 (bitvector 1))))
      #:B19
      (B19 (bv->signal (constant 'B19 (bitvector 1))))
      #:B2
      (B2 (bv->signal (constant 'B2 (bitvector 1))))
      #:B20
      (B20 (bv->signal (constant 'B20 (bitvector 1))))
      #:B21
      (B21 (bv->signal (constant 'B21 (bitvector 1))))
      #:B22
      (B22 (bv->signal (constant 'B22 (bitvector 1))))
      #:B23
      (B23 (bv->signal (constant 'B23 (bitvector 1))))
      #:B24
      (B24 (bv->signal (constant 'B24 (bitvector 1))))
      #:B25
      (B25 (bv->signal (constant 'B25 (bitvector 1))))
      #:B26
      (B26 (bv->signal (constant 'B26 (bitvector 1))))
      #:B27
      (B27 (bv->signal (constant 'B27 (bitvector 1))))
      #:B28
      (B28 (bv->signal (constant 'B28 (bitvector 1))))
      #:B29
      (B29 (bv->signal (constant 'B29 (bitvector 1))))
      #:B3
      (B3 (bv->signal (constant 'B3 (bitvector 1))))
      #:B30
      (B30 (bv->signal (constant 'B30 (bitvector 1))))
      #:B31
      (B31 (bv->signal (constant 'B31 (bitvector 1))))
      #:B32
      (B32 (bv->signal (constant 'B32 (bitvector 1))))
      #:B33
      (B33 (bv->signal (constant 'B33 (bitvector 1))))
      #:B34
      (B34 (bv->signal (constant 'B34 (bitvector 1))))
      #:B35
      (B35 (bv->signal (constant 'B35 (bitvector 1))))
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
      #:C18
      (C18 (bv->signal (constant 'C18 (bitvector 1))))
      #:C19
      (C19 (bv->signal (constant 'C19 (bitvector 1))))
      #:C2
      (C2 (bv->signal (constant 'C2 (bitvector 1))))
      #:C20
      (C20 (bv->signal (constant 'C20 (bitvector 1))))
      #:C21
      (C21 (bv->signal (constant 'C21 (bitvector 1))))
      #:C22
      (C22 (bv->signal (constant 'C22 (bitvector 1))))
      #:C23
      (C23 (bv->signal (constant 'C23 (bitvector 1))))
      #:C24
      (C24 (bv->signal (constant 'C24 (bitvector 1))))
      #:C25
      (C25 (bv->signal (constant 'C25 (bitvector 1))))
      #:C26
      (C26 (bv->signal (constant 'C26 (bitvector 1))))
      #:C27
      (C27 (bv->signal (constant 'C27 (bitvector 1))))
      #:C28
      (C28 (bv->signal (constant 'C28 (bitvector 1))))
      #:C29
      (C29 (bv->signal (constant 'C29 (bitvector 1))))
      #:C3
      (C3 (bv->signal (constant 'C3 (bitvector 1))))
      #:C30
      (C30 (bv->signal (constant 'C30 (bitvector 1))))
      #:C31
      (C31 (bv->signal (constant 'C31 (bitvector 1))))
      #:C32
      (C32 (bv->signal (constant 'C32 (bitvector 1))))
      #:C33
      (C33 (bv->signal (constant 'C33 (bitvector 1))))
      #:C34
      (C34 (bv->signal (constant 'C34 (bitvector 1))))
      #:C35
      (C35 (bv->signal (constant 'C35 (bitvector 1))))
      #:C36
      (C36 (bv->signal (constant 'C36 (bitvector 1))))
      #:C37
      (C37 (bv->signal (constant 'C37 (bitvector 1))))
      #:C38
      (C38 (bv->signal (constant 'C38 (bitvector 1))))
      #:C39
      (C39 (bv->signal (constant 'C39 (bitvector 1))))
      #:C4
      (C4 (bv->signal (constant 'C4 (bitvector 1))))
      #:C40
      (C40 (bv->signal (constant 'C40 (bitvector 1))))
      #:C41
      (C41 (bv->signal (constant 'C41 (bitvector 1))))
      #:C42
      (C42 (bv->signal (constant 'C42 (bitvector 1))))
      #:C43
      (C43 (bv->signal (constant 'C43 (bitvector 1))))
      #:C44
      (C44 (bv->signal (constant 'C44 (bitvector 1))))
      #:C45
      (C45 (bv->signal (constant 'C45 (bitvector 1))))
      #:C46
      (C46 (bv->signal (constant 'C46 (bitvector 1))))
      #:C47
      (C47 (bv->signal (constant 'C47 (bitvector 1))))
      #:C48
      (C48 (bv->signal (constant 'C48 (bitvector 1))))
      #:C49
      (C49 (bv->signal (constant 'C49 (bitvector 1))))
      #:C5
      (C5 (bv->signal (constant 'C5 (bitvector 1))))
      #:C50
      (C50 (bv->signal (constant 'C50 (bitvector 1))))
      #:C51
      (C51 (bv->signal (constant 'C51 (bitvector 1))))
      #:C52
      (C52 (bv->signal (constant 'C52 (bitvector 1))))
      #:C53
      (C53 (bv->signal (constant 'C53 (bitvector 1))))
      #:C6
      (C6 (bv->signal (constant 'C6 (bitvector 1))))
      #:C7
      (C7 (bv->signal (constant 'C7 (bitvector 1))))
      #:C8
      (C8 (bv->signal (constant 'C8 (bitvector 1))))
      #:C9
      (C9 (bv->signal (constant 'C9 (bitvector 1))))
      #:CE0
      (CE0 (bv->signal (constant 'CE0 (bitvector 1))))
      #:CE1
      (CE1 (bv->signal (constant 'CE1 (bitvector 1))))
      #:CE2
      (CE2 (bv->signal (constant 'CE2 (bitvector 1))))
      #:CE3
      (CE3 (bv->signal (constant 'CE3 (bitvector 1))))
      #:CIN0
      (CIN0 (bv->signal (constant 'CIN0 (bitvector 1))))
      #:CIN1
      (CIN1 (bv->signal (constant 'CIN1 (bitvector 1))))
      #:CIN10
      (CIN10 (bv->signal (constant 'CIN10 (bitvector 1))))
      #:CIN11
      (CIN11 (bv->signal (constant 'CIN11 (bitvector 1))))
      #:CIN12
      (CIN12 (bv->signal (constant 'CIN12 (bitvector 1))))
      #:CIN13
      (CIN13 (bv->signal (constant 'CIN13 (bitvector 1))))
      #:CIN14
      (CIN14 (bv->signal (constant 'CIN14 (bitvector 1))))
      #:CIN15
      (CIN15 (bv->signal (constant 'CIN15 (bitvector 1))))
      #:CIN16
      (CIN16 (bv->signal (constant 'CIN16 (bitvector 1))))
      #:CIN17
      (CIN17 (bv->signal (constant 'CIN17 (bitvector 1))))
      #:CIN18
      (CIN18 (bv->signal (constant 'CIN18 (bitvector 1))))
      #:CIN19
      (CIN19 (bv->signal (constant 'CIN19 (bitvector 1))))
      #:CIN2
      (CIN2 (bv->signal (constant 'CIN2 (bitvector 1))))
      #:CIN20
      (CIN20 (bv->signal (constant 'CIN20 (bitvector 1))))
      #:CIN21
      (CIN21 (bv->signal (constant 'CIN21 (bitvector 1))))
      #:CIN22
      (CIN22 (bv->signal (constant 'CIN22 (bitvector 1))))
      #:CIN23
      (CIN23 (bv->signal (constant 'CIN23 (bitvector 1))))
      #:CIN24
      (CIN24 (bv->signal (constant 'CIN24 (bitvector 1))))
      #:CIN25
      (CIN25 (bv->signal (constant 'CIN25 (bitvector 1))))
      #:CIN26
      (CIN26 (bv->signal (constant 'CIN26 (bitvector 1))))
      #:CIN27
      (CIN27 (bv->signal (constant 'CIN27 (bitvector 1))))
      #:CIN28
      (CIN28 (bv->signal (constant 'CIN28 (bitvector 1))))
      #:CIN29
      (CIN29 (bv->signal (constant 'CIN29 (bitvector 1))))
      #:CIN3
      (CIN3 (bv->signal (constant 'CIN3 (bitvector 1))))
      #:CIN30
      (CIN30 (bv->signal (constant 'CIN30 (bitvector 1))))
      #:CIN31
      (CIN31 (bv->signal (constant 'CIN31 (bitvector 1))))
      #:CIN32
      (CIN32 (bv->signal (constant 'CIN32 (bitvector 1))))
      #:CIN33
      (CIN33 (bv->signal (constant 'CIN33 (bitvector 1))))
      #:CIN34
      (CIN34 (bv->signal (constant 'CIN34 (bitvector 1))))
      #:CIN35
      (CIN35 (bv->signal (constant 'CIN35 (bitvector 1))))
      #:CIN36
      (CIN36 (bv->signal (constant 'CIN36 (bitvector 1))))
      #:CIN37
      (CIN37 (bv->signal (constant 'CIN37 (bitvector 1))))
      #:CIN38
      (CIN38 (bv->signal (constant 'CIN38 (bitvector 1))))
      #:CIN39
      (CIN39 (bv->signal (constant 'CIN39 (bitvector 1))))
      #:CIN4
      (CIN4 (bv->signal (constant 'CIN4 (bitvector 1))))
      #:CIN40
      (CIN40 (bv->signal (constant 'CIN40 (bitvector 1))))
      #:CIN41
      (CIN41 (bv->signal (constant 'CIN41 (bitvector 1))))
      #:CIN42
      (CIN42 (bv->signal (constant 'CIN42 (bitvector 1))))
      #:CIN43
      (CIN43 (bv->signal (constant 'CIN43 (bitvector 1))))
      #:CIN44
      (CIN44 (bv->signal (constant 'CIN44 (bitvector 1))))
      #:CIN45
      (CIN45 (bv->signal (constant 'CIN45 (bitvector 1))))
      #:CIN46
      (CIN46 (bv->signal (constant 'CIN46 (bitvector 1))))
      #:CIN47
      (CIN47 (bv->signal (constant 'CIN47 (bitvector 1))))
      #:CIN48
      (CIN48 (bv->signal (constant 'CIN48 (bitvector 1))))
      #:CIN49
      (CIN49 (bv->signal (constant 'CIN49 (bitvector 1))))
      #:CIN5
      (CIN5 (bv->signal (constant 'CIN5 (bitvector 1))))
      #:CIN50
      (CIN50 (bv->signal (constant 'CIN50 (bitvector 1))))
      #:CIN51
      (CIN51 (bv->signal (constant 'CIN51 (bitvector 1))))
      #:CIN52
      (CIN52 (bv->signal (constant 'CIN52 (bitvector 1))))
      #:CIN53
      (CIN53 (bv->signal (constant 'CIN53 (bitvector 1))))
      #:CIN6
      (CIN6 (bv->signal (constant 'CIN6 (bitvector 1))))
      #:CIN7
      (CIN7 (bv->signal (constant 'CIN7 (bitvector 1))))
      #:CIN8
      (CIN8 (bv->signal (constant 'CIN8 (bitvector 1))))
      #:CIN9
      (CIN9 (bv->signal (constant 'CIN9 (bitvector 1))))
      #:CLK0
      (CLK0 (bv->signal (constant 'CLK0 (bitvector 1))))
      #:CLK1
      (CLK1 (bv->signal (constant 'CLK1 (bitvector 1))))
      #:CLK2
      (CLK2 (bv->signal (constant 'CLK2 (bitvector 1))))
      #:CLK3
      (CLK3 (bv->signal (constant 'CLK3 (bitvector 1))))
      #:LEGACY
      (LEGACY (bv->signal (constant 'LEGACY (bitvector 5))))
      #:MA0
      (MA0 (bv->signal (constant 'MA0 (bitvector 1))))
      #:MA1
      (MA1 (bv->signal (constant 'MA1 (bitvector 1))))
      #:MA10
      (MA10 (bv->signal (constant 'MA10 (bitvector 1))))
      #:MA11
      (MA11 (bv->signal (constant 'MA11 (bitvector 1))))
      #:MA12
      (MA12 (bv->signal (constant 'MA12 (bitvector 1))))
      #:MA13
      (MA13 (bv->signal (constant 'MA13 (bitvector 1))))
      #:MA14
      (MA14 (bv->signal (constant 'MA14 (bitvector 1))))
      #:MA15
      (MA15 (bv->signal (constant 'MA15 (bitvector 1))))
      #:MA16
      (MA16 (bv->signal (constant 'MA16 (bitvector 1))))
      #:MA17
      (MA17 (bv->signal (constant 'MA17 (bitvector 1))))
      #:MA18
      (MA18 (bv->signal (constant 'MA18 (bitvector 1))))
      #:MA19
      (MA19 (bv->signal (constant 'MA19 (bitvector 1))))
      #:MA2
      (MA2 (bv->signal (constant 'MA2 (bitvector 1))))
      #:MA20
      (MA20 (bv->signal (constant 'MA20 (bitvector 1))))
      #:MA21
      (MA21 (bv->signal (constant 'MA21 (bitvector 1))))
      #:MA22
      (MA22 (bv->signal (constant 'MA22 (bitvector 1))))
      #:MA23
      (MA23 (bv->signal (constant 'MA23 (bitvector 1))))
      #:MA24
      (MA24 (bv->signal (constant 'MA24 (bitvector 1))))
      #:MA25
      (MA25 (bv->signal (constant 'MA25 (bitvector 1))))
      #:MA26
      (MA26 (bv->signal (constant 'MA26 (bitvector 1))))
      #:MA27
      (MA27 (bv->signal (constant 'MA27 (bitvector 1))))
      #:MA28
      (MA28 (bv->signal (constant 'MA28 (bitvector 1))))
      #:MA29
      (MA29 (bv->signal (constant 'MA29 (bitvector 1))))
      #:MA3
      (MA3 (bv->signal (constant 'MA3 (bitvector 1))))
      #:MA30
      (MA30 (bv->signal (constant 'MA30 (bitvector 1))))
      #:MA31
      (MA31 (bv->signal (constant 'MA31 (bitvector 1))))
      #:MA32
      (MA32 (bv->signal (constant 'MA32 (bitvector 1))))
      #:MA33
      (MA33 (bv->signal (constant 'MA33 (bitvector 1))))
      #:MA34
      (MA34 (bv->signal (constant 'MA34 (bitvector 1))))
      #:MA35
      (MA35 (bv->signal (constant 'MA35 (bitvector 1))))
      #:MA4
      (MA4 (bv->signal (constant 'MA4 (bitvector 1))))
      #:MA5
      (MA5 (bv->signal (constant 'MA5 (bitvector 1))))
      #:MA6
      (MA6 (bv->signal (constant 'MA6 (bitvector 1))))
      #:MA7
      (MA7 (bv->signal (constant 'MA7 (bitvector 1))))
      #:MA8
      (MA8 (bv->signal (constant 'MA8 (bitvector 1))))
      #:MA9
      (MA9 (bv->signal (constant 'MA9 (bitvector 1))))
      #:MASK01
      (MASK01 (bv->signal (constant 'MASK01 (bitvector 56))))
      #:MASKPAT
      (MASKPAT (bv->signal (constant 'MASKPAT (bitvector 56))))
      #:MASKPAT_SOURCE
      (MASKPAT_SOURCE (bv->signal (constant 'MASKPAT_SOURCE (bitvector 5))))
      #:MB0
      (MB0 (bv->signal (constant 'MB0 (bitvector 1))))
      #:MB1
      (MB1 (bv->signal (constant 'MB1 (bitvector 1))))
      #:MB10
      (MB10 (bv->signal (constant 'MB10 (bitvector 1))))
      #:MB11
      (MB11 (bv->signal (constant 'MB11 (bitvector 1))))
      #:MB12
      (MB12 (bv->signal (constant 'MB12 (bitvector 1))))
      #:MB13
      (MB13 (bv->signal (constant 'MB13 (bitvector 1))))
      #:MB14
      (MB14 (bv->signal (constant 'MB14 (bitvector 1))))
      #:MB15
      (MB15 (bv->signal (constant 'MB15 (bitvector 1))))
      #:MB16
      (MB16 (bv->signal (constant 'MB16 (bitvector 1))))
      #:MB17
      (MB17 (bv->signal (constant 'MB17 (bitvector 1))))
      #:MB18
      (MB18 (bv->signal (constant 'MB18 (bitvector 1))))
      #:MB19
      (MB19 (bv->signal (constant 'MB19 (bitvector 1))))
      #:MB2
      (MB2 (bv->signal (constant 'MB2 (bitvector 1))))
      #:MB20
      (MB20 (bv->signal (constant 'MB20 (bitvector 1))))
      #:MB21
      (MB21 (bv->signal (constant 'MB21 (bitvector 1))))
      #:MB22
      (MB22 (bv->signal (constant 'MB22 (bitvector 1))))
      #:MB23
      (MB23 (bv->signal (constant 'MB23 (bitvector 1))))
      #:MB24
      (MB24 (bv->signal (constant 'MB24 (bitvector 1))))
      #:MB25
      (MB25 (bv->signal (constant 'MB25 (bitvector 1))))
      #:MB26
      (MB26 (bv->signal (constant 'MB26 (bitvector 1))))
      #:MB27
      (MB27 (bv->signal (constant 'MB27 (bitvector 1))))
      #:MB28
      (MB28 (bv->signal (constant 'MB28 (bitvector 1))))
      #:MB29
      (MB29 (bv->signal (constant 'MB29 (bitvector 1))))
      #:MB3
      (MB3 (bv->signal (constant 'MB3 (bitvector 1))))
      #:MB30
      (MB30 (bv->signal (constant 'MB30 (bitvector 1))))
      #:MB31
      (MB31 (bv->signal (constant 'MB31 (bitvector 1))))
      #:MB32
      (MB32 (bv->signal (constant 'MB32 (bitvector 1))))
      #:MB33
      (MB33 (bv->signal (constant 'MB33 (bitvector 1))))
      #:MB34
      (MB34 (bv->signal (constant 'MB34 (bitvector 1))))
      #:MB35
      (MB35 (bv->signal (constant 'MB35 (bitvector 1))))
      #:MB4
      (MB4 (bv->signal (constant 'MB4 (bitvector 1))))
      #:MB5
      (MB5 (bv->signal (constant 'MB5 (bitvector 1))))
      #:MB6
      (MB6 (bv->signal (constant 'MB6 (bitvector 1))))
      #:MB7
      (MB7 (bv->signal (constant 'MB7 (bitvector 1))))
      #:MB8
      (MB8 (bv->signal (constant 'MB8 (bitvector 1))))
      #:MB9
      (MB9 (bv->signal (constant 'MB9 (bitvector 1))))
      #:MCPAT
      (MCPAT (bv->signal (constant 'MCPAT (bitvector 56))))
      #:MCPAT_SOURCE
      (MCPAT_SOURCE (bv->signal (constant 'MCPAT_SOURCE (bitvector 5))))
      #:MULT9_MODE
      (MULT9_MODE (bv->signal (constant 'MULT9_MODE (bitvector 5))))
      #:OP0
      (OP0 (bv->signal (constant 'OP0 (bitvector 1))))
      #:OP1
      (OP1 (bv->signal (constant 'OP1 (bitvector 1))))
      #:OP10
      (OP10 (bv->signal (constant 'OP10 (bitvector 1))))
      #:OP2
      (OP2 (bv->signal (constant 'OP2 (bitvector 1))))
      #:OP3
      (OP3 (bv->signal (constant 'OP3 (bitvector 1))))
      #:OP4
      (OP4 (bv->signal (constant 'OP4 (bitvector 1))))
      #:OP5
      (OP5 (bv->signal (constant 'OP5 (bitvector 1))))
      #:OP6
      (OP6 (bv->signal (constant 'OP6 (bitvector 1))))
      #:OP7
      (OP7 (bv->signal (constant 'OP7 (bitvector 1))))
      #:OP8
      (OP8 (bv->signal (constant 'OP8 (bitvector 1))))
      #:OP9
      (OP9 (bv->signal (constant 'OP9 (bitvector 1))))
      #:REG_FLAG_CE
      (REG_FLAG_CE (bv->signal (constant 'REG_FLAG_CE (bitvector 5))))
      #:REG_FLAG_CLK
      (REG_FLAG_CLK (bv->signal (constant 'REG_FLAG_CLK (bitvector 5))))
      #:REG_FLAG_RST
      (REG_FLAG_RST (bv->signal (constant 'REG_FLAG_RST (bitvector 5))))
      #:REG_INPUTC0_CE
      (REG_INPUTC0_CE (bv->signal (constant 'REG_INPUTC0_CE (bitvector 5))))
      #:REG_INPUTC0_CLK
      (REG_INPUTC0_CLK (bv->signal (constant 'REG_INPUTC0_CLK (bitvector 5))))
      #:REG_INPUTC0_RST
      (REG_INPUTC0_RST (bv->signal (constant 'REG_INPUTC0_RST (bitvector 5))))
      #:REG_INPUTC1_CE
      (REG_INPUTC1_CE (bv->signal (constant 'REG_INPUTC1_CE (bitvector 5))))
      #:REG_INPUTC1_CLK
      (REG_INPUTC1_CLK (bv->signal (constant 'REG_INPUTC1_CLK (bitvector 5))))
      #:REG_INPUTC1_RST
      (REG_INPUTC1_RST (bv->signal (constant 'REG_INPUTC1_RST (bitvector 5))))
      #:REG_OPCODEIN_0_CE
      (REG_OPCODEIN_0_CE
       (bv->signal (constant 'REG_OPCODEIN_0_CE (bitvector 5))))
      #:REG_OPCODEIN_0_CLK
      (REG_OPCODEIN_0_CLK
       (bv->signal (constant 'REG_OPCODEIN_0_CLK (bitvector 5))))
      #:REG_OPCODEIN_0_RST
      (REG_OPCODEIN_0_RST
       (bv->signal (constant 'REG_OPCODEIN_0_RST (bitvector 5))))
      #:REG_OPCODEIN_1_CE
      (REG_OPCODEIN_1_CE
       (bv->signal (constant 'REG_OPCODEIN_1_CE (bitvector 5))))
      #:REG_OPCODEIN_1_CLK
      (REG_OPCODEIN_1_CLK
       (bv->signal (constant 'REG_OPCODEIN_1_CLK (bitvector 5))))
      #:REG_OPCODEIN_1_RST
      (REG_OPCODEIN_1_RST
       (bv->signal (constant 'REG_OPCODEIN_1_RST (bitvector 5))))
      #:REG_OPCODEOP0_0_CE
      (REG_OPCODEOP0_0_CE
       (bv->signal (constant 'REG_OPCODEOP0_0_CE (bitvector 5))))
      #:REG_OPCODEOP0_0_CLK
      (REG_OPCODEOP0_0_CLK
       (bv->signal (constant 'REG_OPCODEOP0_0_CLK (bitvector 5))))
      #:REG_OPCODEOP0_0_RST
      (REG_OPCODEOP0_0_RST
       (bv->signal (constant 'REG_OPCODEOP0_0_RST (bitvector 5))))
      #:REG_OPCODEOP0_1_CE
      (REG_OPCODEOP0_1_CE
       (bv->signal (constant 'REG_OPCODEOP0_1_CE (bitvector 5))))
      #:REG_OPCODEOP0_1_CLK
      (REG_OPCODEOP0_1_CLK
       (bv->signal (constant 'REG_OPCODEOP0_1_CLK (bitvector 5))))
      #:REG_OPCODEOP0_1_RST
      (REG_OPCODEOP0_1_RST
       (bv->signal (constant 'REG_OPCODEOP0_1_RST (bitvector 5))))
      #:REG_OPCODEOP1_0_CLK
      (REG_OPCODEOP1_0_CLK
       (bv->signal (constant 'REG_OPCODEOP1_0_CLK (bitvector 5))))
      #:REG_OPCODEOP1_1_CLK
      (REG_OPCODEOP1_1_CLK
       (bv->signal (constant 'REG_OPCODEOP1_1_CLK (bitvector 5))))
      #:REG_OUTPUT0_CE
      (REG_OUTPUT0_CE (bv->signal (constant 'REG_OUTPUT0_CE (bitvector 5))))
      #:REG_OUTPUT0_CLK
      (REG_OUTPUT0_CLK (bv->signal (constant 'REG_OUTPUT0_CLK (bitvector 5))))
      #:REG_OUTPUT0_RST
      (REG_OUTPUT0_RST (bv->signal (constant 'REG_OUTPUT0_RST (bitvector 5))))
      #:REG_OUTPUT1_CE
      (REG_OUTPUT1_CE (bv->signal (constant 'REG_OUTPUT1_CE (bitvector 5))))
      #:REG_OUTPUT1_CLK
      (REG_OUTPUT1_CLK (bv->signal (constant 'REG_OUTPUT1_CLK (bitvector 5))))
      #:REG_OUTPUT1_RST
      (REG_OUTPUT1_RST (bv->signal (constant 'REG_OUTPUT1_RST (bitvector 5))))
      #:RNDPAT
      (RNDPAT (bv->signal (constant 'RNDPAT (bitvector 56))))
      #:RST0
      (RST0 (bv->signal (constant 'RST0 (bitvector 1))))
      #:RST1
      (RST1 (bv->signal (constant 'RST1 (bitvector 1))))
      #:RST2
      (RST2 (bv->signal (constant 'RST2 (bitvector 1))))
      #:RST3
      (RST3 (bv->signal (constant 'RST3 (bitvector 1))))
      #:SIGNEDCIN
      (SIGNEDCIN (bv->signal (constant 'SIGNEDCIN (bitvector 1))))
      #:SIGNEDIA
      (SIGNEDIA (bv->signal (constant 'SIGNEDIA (bitvector 1))))
      #:SIGNEDIB
      (SIGNEDIB (bv->signal (constant 'SIGNEDIB (bitvector 1))))
      #:name
      (name ""))
    (let* ((merged-input-state-hash (list))
           (init-hash
            (append
             (list
              (cons
               (string->symbol (string-append name "state1442"))
               (bv 0 (bitvector 1))))
             (append
              (list
               (cons
                (string->symbol (string-append name "state1343"))
                (bv 1 (bitvector 1))))
              (append
               (list
                (cons
                 (string->symbol (string-append name "state1329"))
                 (bv 0 (bitvector 36))))
               (append
                (list
                 (cons
                  (string->symbol (string-append name "state1297"))
                  (bv 1 (bitvector 1))))
                (append
                 (list
                  (cons
                   (string->symbol (string-append name "state1283"))
                   (bv 0 (bitvector 18))))
                 (append
                  (list
                   (cons
                    (string->symbol (string-append name "state1247"))
                    (bv 0 (bitvector 1))))
                  (append
                   (list
                    (cons
                     (string->symbol (string-append name "state1238"))
                     (bv 0 (bitvector 1))))
                   (append
                    (list
                     (cons
                      (string->symbol (string-append name "state1229"))
                      (bv 0 (bitvector 1))))
                    (append
                     (list
                      (cons
                       (string->symbol (string-append name "state1221"))
                       (bv 0 (bitvector 1))))
                     (append
                      (list
                       (cons
                        (string->symbol (string-append name "state1213"))
                        (bv 0 (bitvector 1))))
                      (append
                       (list
                        (cons
                         (string->symbol (string-append name "state1196"))
                         (bv 0 (bitvector 1))))
                       (append
                        (list
                         (cons
                          (string->symbol (string-append name "state1011"))
                          (bv 1 (bitvector 1))))
                        (append
                         (list
                          (cons
                           (string->symbol (string-append name "state997"))
                           (bv 0 (bitvector 3))))
                         (append
                          (list
                           (cons
                            (string->symbol (string-append name "state990"))
                            (bv 1 (bitvector 1))))
                          (append
                           (list
                            (cons
                             (string->symbol (string-append name "state976"))
                             (bv 0 (bitvector 3))))
                           (append
                            (list
                             (cons
                              (string->symbol (string-append name "state877"))
                              (bv 1 (bitvector 1))))
                            (append
                             (list
                              (cons
                               (string->symbol (string-append name "state863"))
                               (bv 0 (bitvector 27))))
                             (append
                              (list
                               (cons
                                (string->symbol
                                 (string-append name "state673"))
                                (bv 1 (bitvector 1))))
                              (append
                               (list
                                (cons
                                 (string->symbol
                                  (string-append name "state659"))
                                 (bv 0 (bitvector 27))))
                               (append
                                (list
                                 (cons
                                  (string->symbol
                                   (string-append name "state635"))
                                  (bv 1 (bitvector 1))))
                                (append
                                 (list
                                  (cons
                                   (string->symbol
                                    (string-append name "state621"))
                                   (bv 0 (bitvector 7))))
                                 (append
                                  (list
                                   (cons
                                    (string->symbol
                                     (string-append name "state614"))
                                    (bv 1 (bitvector 1))))
                                  (append
                                   (list
                                    (cons
                                     (string->symbol
                                      (string-append name "state600"))
                                     (bv 0 (bitvector 7))))
                                   (append
                                    (list
                                     (cons
                                      (string->symbol
                                       (string-append name "state534"))
                                      (bv 1 (bitvector 1))))
                                    (append
                                     (list
                                      (cons
                                       (string->symbol
                                        (string-append name "state520"))
                                       (bv 0 (bitvector 1))))
                                     (append
                                      (list
                                       (cons
                                        (string->symbol
                                         (string-append name "state513"))
                                        (bv 1 (bitvector 1))))
                                      (append
                                       (list
                                        (cons
                                         (string->symbol
                                          (string-append name "state499"))
                                         (bv 0 (bitvector 1))))
                                       (append
                                        (list
                                         (cons
                                          (string->symbol
                                           (string-append name "state341"))
                                          (bv 1 (bitvector 1))))
                                        (append
                                         (list
                                          (cons
                                           (string->symbol
                                            (string-append name "state321"))
                                           (bv 0 (bitvector 1))))
                                         (list)))))))))))))))))))))))))))))))
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
           (btor12 A18)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state A18)))
           (btor13 A19)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state A19)))
           (btor14 A2)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state A2)))
           (btor15 A20)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state A20)))
           (btor16 A21)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state A21)))
           (btor17 A22)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state A22)))
           (btor18 A23)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state A23)))
           (btor19 A24)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state A24)))
           (btor20 A25)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state A25)))
           (btor21 A26)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state A26)))
           (btor22 A27)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state A27)))
           (btor23 A28)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state A28)))
           (btor24 A29)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state A29)))
           (btor25 A3)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state A3)))
           (btor26 A30)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state A30)))
           (btor27 A31)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state A31)))
           (btor28 A32)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state A32)))
           (btor29 A33)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state A33)))
           (btor30 A34)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state A34)))
           (btor31 A35)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state A35)))
           (btor32 A4)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state A4)))
           (btor33 A5)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state A5)))
           (btor34 A6)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state A6)))
           (btor35 A7)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state A7)))
           (btor36 A8)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state A8)))
           (btor37 A9)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state A9)))
           (btor38 B0)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state B0)))
           (btor39 B1)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state B1)))
           (btor40 B10)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state B10)))
           (btor41 B11)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state B11)))
           (btor42 B12)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state B12)))
           (btor43 B13)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state B13)))
           (btor44 B14)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state B14)))
           (btor45 B15)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state B15)))
           (btor46 B16)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state B16)))
           (btor47 B17)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state B17)))
           (btor48 B18)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state B18)))
           (btor49 B19)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state B19)))
           (btor50 B2)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state B2)))
           (btor51 B20)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state B20)))
           (btor52 B21)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state B21)))
           (btor53 B22)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state B22)))
           (btor54 B23)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state B23)))
           (btor55 B24)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state B24)))
           (btor56 B25)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state B25)))
           (btor57 B26)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state B26)))
           (btor58 B27)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state B27)))
           (btor59 B28)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state B28)))
           (btor60 B29)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state B29)))
           (btor61 B3)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state B3)))
           (btor62 B30)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state B30)))
           (btor63 B31)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state B31)))
           (btor64 B32)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state B32)))
           (btor65 B33)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state B33)))
           (btor66 B34)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state B34)))
           (btor67 B35)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state B35)))
           (btor68 B4)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state B4)))
           (btor69 B5)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state B5)))
           (btor70 B6)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state B6)))
           (btor71 B7)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state B7)))
           (btor72 B8)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state B8)))
           (btor73 B9)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state B9)))
           (btor74 C0)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state C0)))
           (btor75 C1)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state C1)))
           (btor76 C10)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state C10)))
           (btor77 C11)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state C11)))
           (btor78 C12)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state C12)))
           (btor79 C13)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state C13)))
           (btor80 C14)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state C14)))
           (btor81 C15)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state C15)))
           (btor82 C16)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state C16)))
           (btor83 C17)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state C17)))
           (btor84 C18)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state C18)))
           (btor85 C19)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state C19)))
           (btor86 C2)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state C2)))
           (btor87 C20)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state C20)))
           (btor88 C21)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state C21)))
           (btor89 C22)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state C22)))
           (btor90 C23)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state C23)))
           (btor91 C24)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state C24)))
           (btor92 C25)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state C25)))
           (btor93 C26)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state C26)))
           (btor94 C27)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state C27)))
           (btor95 C28)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state C28)))
           (btor96 C29)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state C29)))
           (btor97 C3)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state C3)))
           (btor98 C30)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state C30)))
           (btor99 C31)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state C31)))
           (btor100 C32)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state C32)))
           (btor101 C33)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state C33)))
           (btor102 C34)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state C34)))
           (btor103 C35)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state C35)))
           (btor104 C36)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state C36)))
           (btor105 C37)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state C37)))
           (btor106 C38)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state C38)))
           (btor107 C39)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state C39)))
           (btor108 C4)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state C4)))
           (btor109 C40)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state C40)))
           (btor110 C41)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state C41)))
           (btor111 C42)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state C42)))
           (btor112 C43)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state C43)))
           (btor113 C44)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state C44)))
           (btor114 C45)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state C45)))
           (btor115 C46)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state C46)))
           (btor116 C47)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state C47)))
           (btor117 C48)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state C48)))
           (btor118 C49)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state C49)))
           (btor119 C5)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state C5)))
           (btor120 C50)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state C50)))
           (btor121 C51)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state C51)))
           (btor122 C52)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state C52)))
           (btor123 C53)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state C53)))
           (btor124 C6)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state C6)))
           (btor125 C7)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state C7)))
           (btor126 C8)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state C8)))
           (btor127 C9)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state C9)))
           (btor128 CE0)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CE0)))
           (btor129 CE1)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CE1)))
           (btor130 CE2)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CE2)))
           (btor131 CE3)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CE3)))
           (btor132 CIN0)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN0)))
           (btor133 CIN1)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN1)))
           (btor134 CIN10)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN10)))
           (btor135 CIN11)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN11)))
           (btor136 CIN12)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN12)))
           (btor137 CIN13)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN13)))
           (btor138 CIN14)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN14)))
           (btor139 CIN15)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN15)))
           (btor140 CIN16)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN16)))
           (btor141 CIN17)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN17)))
           (btor142 CIN18)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN18)))
           (btor143 CIN19)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN19)))
           (btor144 CIN2)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN2)))
           (btor145 CIN20)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN20)))
           (btor146 CIN21)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN21)))
           (btor147 CIN22)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN22)))
           (btor148 CIN23)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN23)))
           (btor149 CIN24)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN24)))
           (btor150 CIN25)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN25)))
           (btor151 CIN26)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN26)))
           (btor152 CIN27)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN27)))
           (btor153 CIN28)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN28)))
           (btor154 CIN29)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN29)))
           (btor155 CIN3)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN3)))
           (btor156 CIN30)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN30)))
           (btor157 CIN31)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN31)))
           (btor158 CIN32)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN32)))
           (btor159 CIN33)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN33)))
           (btor160 CIN34)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN34)))
           (btor161 CIN35)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN35)))
           (btor162 CIN36)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN36)))
           (btor163 CIN37)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN37)))
           (btor164 CIN38)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN38)))
           (btor165 CIN39)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN39)))
           (btor166 CIN4)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN4)))
           (btor167 CIN40)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN40)))
           (btor168 CIN41)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN41)))
           (btor169 CIN42)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN42)))
           (btor170 CIN43)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN43)))
           (btor171 CIN44)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN44)))
           (btor172 CIN45)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN45)))
           (btor173 CIN46)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN46)))
           (btor174 CIN47)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN47)))
           (btor175 CIN48)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN48)))
           (btor176 CIN49)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN49)))
           (btor177 CIN5)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN5)))
           (btor178 CIN50)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN50)))
           (btor179 CIN51)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN51)))
           (btor180 CIN52)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN52)))
           (btor181 CIN53)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN53)))
           (btor182 CIN6)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN6)))
           (btor183 CIN7)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN7)))
           (btor184 CIN8)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN8)))
           (btor185 CIN9)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN9)))
           (btor186 CLK0)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CLK0)))
           (btor187 CLK1)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CLK1)))
           (btor188 CLK2)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CLK2)))
           (btor189 CLK3)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CLK3)))
           (btor190 (bitvector 5))
           (btor191 LEGACY)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state LEGACY)))
           (btor192 MA0)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MA0)))
           (btor193 MA1)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MA1)))
           (btor194 MA10)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MA10)))
           (btor195 MA11)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MA11)))
           (btor196 MA12)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MA12)))
           (btor197 MA13)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MA13)))
           (btor198 MA14)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MA14)))
           (btor199 MA15)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MA15)))
           (btor200 MA16)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MA16)))
           (btor201 MA17)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MA17)))
           (btor202 MA18)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MA18)))
           (btor203 MA19)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MA19)))
           (btor204 MA2)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MA2)))
           (btor205 MA20)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MA20)))
           (btor206 MA21)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MA21)))
           (btor207 MA22)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MA22)))
           (btor208 MA23)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MA23)))
           (btor209 MA24)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MA24)))
           (btor210 MA25)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MA25)))
           (btor211 MA26)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MA26)))
           (btor212 MA27)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MA27)))
           (btor213 MA28)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MA28)))
           (btor214 MA29)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MA29)))
           (btor215 MA3)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MA3)))
           (btor216 MA30)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MA30)))
           (btor217 MA31)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MA31)))
           (btor218 MA32)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MA32)))
           (btor219 MA33)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MA33)))
           (btor220 MA34)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MA34)))
           (btor221 MA35)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MA35)))
           (btor222 MA4)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MA4)))
           (btor223 MA5)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MA5)))
           (btor224 MA6)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MA6)))
           (btor225 MA7)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MA7)))
           (btor226 MA8)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MA8)))
           (btor227 MA9)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MA9)))
           (btor228 (bitvector 56))
           (btor229 MASK01)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MASK01)))
           (btor230 MASKPAT)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MASKPAT)))
           (btor231 MASKPAT_SOURCE)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state MASKPAT_SOURCE)))
           (btor232 MB0)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MB0)))
           (btor233 MB1)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MB1)))
           (btor234 MB10)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MB10)))
           (btor235 MB11)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MB11)))
           (btor236 MB12)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MB12)))
           (btor237 MB13)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MB13)))
           (btor238 MB14)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MB14)))
           (btor239 MB15)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MB15)))
           (btor240 MB16)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MB16)))
           (btor241 MB17)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MB17)))
           (btor242 MB18)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MB18)))
           (btor243 MB19)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MB19)))
           (btor244 MB2)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MB2)))
           (btor245 MB20)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MB20)))
           (btor246 MB21)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MB21)))
           (btor247 MB22)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MB22)))
           (btor248 MB23)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MB23)))
           (btor249 MB24)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MB24)))
           (btor250 MB25)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MB25)))
           (btor251 MB26)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MB26)))
           (btor252 MB27)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MB27)))
           (btor253 MB28)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MB28)))
           (btor254 MB29)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MB29)))
           (btor255 MB3)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MB3)))
           (btor256 MB30)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MB30)))
           (btor257 MB31)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MB31)))
           (btor258 MB32)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MB32)))
           (btor259 MB33)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MB33)))
           (btor260 MB34)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MB34)))
           (btor261 MB35)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MB35)))
           (btor262 MB4)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MB4)))
           (btor263 MB5)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MB5)))
           (btor264 MB6)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MB6)))
           (btor265 MB7)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MB7)))
           (btor266 MB8)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MB8)))
           (btor267 MB9)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MB9)))
           (btor268 MCPAT)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MCPAT)))
           (btor269 MCPAT_SOURCE)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MCPAT_SOURCE)))
           (btor270 MULT9_MODE)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MULT9_MODE)))
           (btor271 OP0)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state OP0)))
           (btor272 OP1)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state OP1)))
           (btor273 OP10)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state OP10)))
           (btor274 OP2)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state OP2)))
           (btor275 OP3)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state OP3)))
           (btor276 OP4)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state OP4)))
           (btor277 OP5)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state OP5)))
           (btor278 OP6)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state OP6)))
           (btor279 OP7)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state OP7)))
           (btor280 OP8)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state OP8)))
           (btor281 OP9)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state OP9)))
           (btor282 REG_FLAG_CE)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state REG_FLAG_CE)))
           (btor283 REG_FLAG_CLK)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state REG_FLAG_CLK)))
           (btor284 REG_FLAG_RST)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state REG_FLAG_RST)))
           (btor285 REG_INPUTC0_CE)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state REG_INPUTC0_CE)))
           (btor286 REG_INPUTC0_CLK)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state REG_INPUTC0_CLK)))
           (btor287 REG_INPUTC0_RST)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state REG_INPUTC0_RST)))
           (btor288 REG_INPUTC1_CE)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state REG_INPUTC1_CE)))
           (btor289 REG_INPUTC1_CLK)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state REG_INPUTC1_CLK)))
           (btor290 REG_INPUTC1_RST)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state REG_INPUTC1_RST)))
           (btor291 REG_OPCODEIN_0_CE)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state REG_OPCODEIN_0_CE)))
           (btor292 REG_OPCODEIN_0_CLK)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state REG_OPCODEIN_0_CLK)))
           (btor293 REG_OPCODEIN_0_RST)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state REG_OPCODEIN_0_RST)))
           (btor294 REG_OPCODEIN_1_CE)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state REG_OPCODEIN_1_CE)))
           (btor295 REG_OPCODEIN_1_CLK)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state REG_OPCODEIN_1_CLK)))
           (btor296 REG_OPCODEIN_1_RST)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state REG_OPCODEIN_1_RST)))
           (btor297 REG_OPCODEOP0_0_CE)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state REG_OPCODEOP0_0_CE)))
           (btor298 REG_OPCODEOP0_0_CLK)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state REG_OPCODEOP0_0_CLK)))
           (btor299 REG_OPCODEOP0_0_RST)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state REG_OPCODEOP0_0_RST)))
           (btor300 REG_OPCODEOP0_1_CE)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state REG_OPCODEOP0_1_CE)))
           (btor301 REG_OPCODEOP0_1_CLK)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state REG_OPCODEOP0_1_CLK)))
           (btor302 REG_OPCODEOP0_1_RST)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state REG_OPCODEOP0_1_RST)))
           (btor303 REG_OPCODEOP1_0_CLK)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state REG_OPCODEOP1_0_CLK)))
           (btor304 REG_OPCODEOP1_1_CLK)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state REG_OPCODEOP1_1_CLK)))
           (btor305 REG_OUTPUT0_CE)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state REG_OUTPUT0_CE)))
           (btor306 REG_OUTPUT0_CLK)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state REG_OUTPUT0_CLK)))
           (btor307 REG_OUTPUT0_RST)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state REG_OUTPUT0_RST)))
           (btor308 REG_OUTPUT1_CE)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state REG_OUTPUT1_CE)))
           (btor309 REG_OUTPUT1_CLK)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state REG_OUTPUT1_CLK)))
           (btor310 REG_OUTPUT1_RST)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state REG_OUTPUT1_RST)))
           (btor311 RNDPAT)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state RNDPAT)))
           (btor312 RST0)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state RST0)))
           (btor313 RST1)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state RST1)))
           (btor314 RST2)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state RST2)))
           (btor315 RST3)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state RST3)))
           (btor316 SIGNEDCIN)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SIGNEDCIN)))
           (btor317 SIGNEDIA)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SIGNEDIA)))
           (btor318 SIGNEDIB)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SIGNEDIB)))
           (btor319
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state319")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state319"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state319")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state319")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor320 (bv->signal (bv 0 (bitvector 1))))
           (btor321
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state321")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state321"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state321")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state321")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor323 (bitvector 4))
           (btor324 (bv->signal (bv 14 (bitvector 4))))
           (btor325
            (bv->signal
             (zero-extend (signal-value btor324) (bitvector 5))
             btor324))
           (btor326
            (signal
             (bool->bitvector
              (bveq (signal-value btor283) (signal-value btor325)))
             (list)))
           (btor327
            (if (bitvector->bool (signal-value btor326)) btor189 btor186))
           (btor328 (bv->signal (bv 13 (bitvector 4))))
           (btor329
            (bv->signal
             (zero-extend (signal-value btor328) (bitvector 5))
             btor328))
           (btor330
            (signal
             (bool->bitvector
              (bveq (signal-value btor283) (signal-value btor329)))
             (list)))
           (btor331
            (if (bitvector->bool (signal-value btor330)) btor188 btor327))
           (btor332 (bv->signal (bv 12 (bitvector 4))))
           (btor333
            (bv->signal
             (zero-extend (signal-value btor332) (bitvector 5))
             btor332))
           (btor334
            (signal
             (bool->bitvector
              (bveq (signal-value btor283) (signal-value btor333)))
             (list)))
           (btor335
            (if (bitvector->bool (signal-value btor334)) btor187 btor331))
           (btor336 (bv->signal (bv 11 (bitvector 4))))
           (btor337
            (bv->signal
             (zero-extend (signal-value btor336) (bitvector 5))
             btor336))
           (btor338
            (signal
             (bool->bitvector
              (bveq (signal-value btor283) (signal-value btor337)))
             (list)))
           (btor339
            (if (bitvector->bool (signal-value btor338)) btor186 btor335))
           (btor340 (bv->signal (bv 1 (bitvector 1))))
           (btor341
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state341")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state341"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state341")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state341")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor343 (bitvector 2))
           (btor344
            (signal
             (concat (signal-value btor341) (signal-value btor339))
             (list)))
           (btor345
            (bv->signal
             (zero-extend (signal-value btor340) (bitvector 2))
             btor340))
           (btor346
            (signal
             (bool->bitvector
              (bveq (signal-value btor344) (signal-value btor345)))
             (list)))
           (btor347
            (if (bitvector->bool (signal-value btor346)) btor321 btor319))
           (btor348 (bitvector 54))
           (btor349 (bv->signal (bv 0 (bitvector 54))))
           (btor350 (bitvector 18))
           (btor351 (bv->signal (bv 0 (bitvector 18))))
           (btor352 (bitvector 19))
           (btor353
            (signal
             (concat (signal-value btor232) (signal-value btor351))
             (list)))
           (btor354 (bitvector 20))
           (btor355
            (signal
             (concat (signal-value btor233) (signal-value btor353))
             (list)))
           (btor356 (bitvector 21))
           (btor357
            (signal
             (concat (signal-value btor244) (signal-value btor355))
             (list)))
           (btor358 (bitvector 22))
           (btor359
            (signal
             (concat (signal-value btor255) (signal-value btor357))
             (list)))
           (btor360 (bitvector 23))
           (btor361
            (signal
             (concat (signal-value btor262) (signal-value btor359))
             (list)))
           (btor362 (bitvector 24))
           (btor363
            (signal
             (concat (signal-value btor263) (signal-value btor361))
             (list)))
           (btor364 (bitvector 25))
           (btor365
            (signal
             (concat (signal-value btor264) (signal-value btor363))
             (list)))
           (btor366 (bitvector 26))
           (btor367
            (signal
             (concat (signal-value btor265) (signal-value btor365))
             (list)))
           (btor368 (bitvector 27))
           (btor369
            (signal
             (concat (signal-value btor266) (signal-value btor367))
             (list)))
           (btor370 (bitvector 28))
           (btor371
            (signal
             (concat (signal-value btor267) (signal-value btor369))
             (list)))
           (btor372 (bitvector 29))
           (btor373
            (signal
             (concat (signal-value btor234) (signal-value btor371))
             (list)))
           (btor374 (bitvector 30))
           (btor375
            (signal
             (concat (signal-value btor235) (signal-value btor373))
             (list)))
           (btor376 (bitvector 31))
           (btor377
            (signal
             (concat (signal-value btor236) (signal-value btor375))
             (list)))
           (btor378 (bitvector 32))
           (btor379
            (signal
             (concat (signal-value btor237) (signal-value btor377))
             (list)))
           (btor380 (bitvector 33))
           (btor381
            (signal
             (concat (signal-value btor238) (signal-value btor379))
             (list)))
           (btor382 (bitvector 34))
           (btor383
            (signal
             (concat (signal-value btor239) (signal-value btor381))
             (list)))
           (btor384 (bitvector 35))
           (btor385
            (signal
             (concat (signal-value btor240) (signal-value btor383))
             (list)))
           (btor386 (bitvector 36))
           (btor387
            (signal
             (concat (signal-value btor241) (signal-value btor385))
             (list)))
           (btor388 (bitvector 37))
           (btor389
            (signal
             (concat (signal-value btor242) (signal-value btor387))
             (list)))
           (btor390 (bitvector 38))
           (btor391
            (signal
             (concat (signal-value btor243) (signal-value btor389))
             (list)))
           (btor392 (bitvector 39))
           (btor393
            (signal
             (concat (signal-value btor245) (signal-value btor391))
             (list)))
           (btor394 (bitvector 40))
           (btor395
            (signal
             (concat (signal-value btor246) (signal-value btor393))
             (list)))
           (btor396 (bitvector 41))
           (btor397
            (signal
             (concat (signal-value btor247) (signal-value btor395))
             (list)))
           (btor398 (bitvector 42))
           (btor399
            (signal
             (concat (signal-value btor248) (signal-value btor397))
             (list)))
           (btor400 (bitvector 43))
           (btor401
            (signal
             (concat (signal-value btor249) (signal-value btor399))
             (list)))
           (btor402 (bitvector 44))
           (btor403
            (signal
             (concat (signal-value btor250) (signal-value btor401))
             (list)))
           (btor404 (bitvector 45))
           (btor405
            (signal
             (concat (signal-value btor251) (signal-value btor403))
             (list)))
           (btor406 (bitvector 46))
           (btor407
            (signal
             (concat (signal-value btor252) (signal-value btor405))
             (list)))
           (btor408 (bitvector 47))
           (btor409
            (signal
             (concat (signal-value btor253) (signal-value btor407))
             (list)))
           (btor410 (bitvector 48))
           (btor411
            (signal
             (concat (signal-value btor254) (signal-value btor409))
             (list)))
           (btor412 (bitvector 49))
           (btor413
            (signal
             (concat (signal-value btor256) (signal-value btor411))
             (list)))
           (btor414 (bitvector 50))
           (btor415
            (signal
             (concat (signal-value btor257) (signal-value btor413))
             (list)))
           (btor416 (bitvector 51))
           (btor417
            (signal
             (concat (signal-value btor258) (signal-value btor415))
             (list)))
           (btor418 (bitvector 52))
           (btor419
            (signal
             (concat (signal-value btor259) (signal-value btor417))
             (list)))
           (btor420 (bitvector 53))
           (btor421
            (signal
             (concat (signal-value btor260) (signal-value btor419))
             (list)))
           (btor422
            (signal
             (concat (signal-value btor261) (signal-value btor421))
             (list)))
           (btor423
            (signal
             (concat (signal-value btor261) (signal-value btor261))
             (list)))
           (btor424 (bitvector 3))
           (btor425
            (signal
             (concat (signal-value btor261) (signal-value btor423))
             (list)))
           (btor426
            (signal
             (concat (signal-value btor261) (signal-value btor425))
             (list)))
           (btor427
            (signal
             (concat (signal-value btor261) (signal-value btor426))
             (list)))
           (btor428 (bitvector 6))
           (btor429
            (signal
             (concat (signal-value btor261) (signal-value btor427))
             (list)))
           (btor430 (bitvector 7))
           (btor431
            (signal
             (concat (signal-value btor261) (signal-value btor429))
             (list)))
           (btor432 (bitvector 8))
           (btor433
            (signal
             (concat (signal-value btor261) (signal-value btor431))
             (list)))
           (btor434 (bitvector 9))
           (btor435
            (signal
             (concat (signal-value btor261) (signal-value btor433))
             (list)))
           (btor436 (bitvector 10))
           (btor437
            (signal
             (concat (signal-value btor261) (signal-value btor435))
             (list)))
           (btor438 (bitvector 11))
           (btor439
            (signal
             (concat (signal-value btor261) (signal-value btor437))
             (list)))
           (btor440 (bitvector 12))
           (btor441
            (signal
             (concat (signal-value btor261) (signal-value btor439))
             (list)))
           (btor442 (bitvector 13))
           (btor443
            (signal
             (concat (signal-value btor261) (signal-value btor441))
             (list)))
           (btor444 (bitvector 14))
           (btor445
            (signal
             (concat (signal-value btor261) (signal-value btor443))
             (list)))
           (btor446 (bitvector 15))
           (btor447
            (signal
             (concat (signal-value btor261) (signal-value btor445))
             (list)))
           (btor448 (bitvector 16))
           (btor449
            (signal
             (concat (signal-value btor261) (signal-value btor447))
             (list)))
           (btor450 (bitvector 17))
           (btor451
            (signal
             (concat (signal-value btor261) (signal-value btor449))
             (list)))
           (btor452
            (signal
             (concat (signal-value btor261) (signal-value btor451))
             (list)))
           (btor453
            (if (bitvector->bool (signal-value btor318)) btor452 btor351))
           (btor454
            (signal
             (concat (signal-value btor233) (signal-value btor232))
             (list)))
           (btor455
            (signal
             (concat (signal-value btor244) (signal-value btor454))
             (list)))
           (btor456
            (signal
             (concat (signal-value btor255) (signal-value btor455))
             (list)))
           (btor457
            (signal
             (concat (signal-value btor262) (signal-value btor456))
             (list)))
           (btor458
            (signal
             (concat (signal-value btor263) (signal-value btor457))
             (list)))
           (btor459
            (signal
             (concat (signal-value btor264) (signal-value btor458))
             (list)))
           (btor460
            (signal
             (concat (signal-value btor265) (signal-value btor459))
             (list)))
           (btor461
            (signal
             (concat (signal-value btor266) (signal-value btor460))
             (list)))
           (btor462
            (signal
             (concat (signal-value btor267) (signal-value btor461))
             (list)))
           (btor463
            (signal
             (concat (signal-value btor234) (signal-value btor462))
             (list)))
           (btor464
            (signal
             (concat (signal-value btor235) (signal-value btor463))
             (list)))
           (btor465
            (signal
             (concat (signal-value btor236) (signal-value btor464))
             (list)))
           (btor466
            (signal
             (concat (signal-value btor237) (signal-value btor465))
             (list)))
           (btor467
            (signal
             (concat (signal-value btor238) (signal-value btor466))
             (list)))
           (btor468
            (signal
             (concat (signal-value btor239) (signal-value btor467))
             (list)))
           (btor469
            (signal
             (concat (signal-value btor240) (signal-value btor468))
             (list)))
           (btor470
            (signal
             (concat (signal-value btor241) (signal-value btor469))
             (list)))
           (btor471
            (signal
             (concat (signal-value btor242) (signal-value btor470))
             (list)))
           (btor472
            (signal
             (concat (signal-value btor243) (signal-value btor471))
             (list)))
           (btor473
            (signal
             (concat (signal-value btor245) (signal-value btor472))
             (list)))
           (btor474
            (signal
             (concat (signal-value btor246) (signal-value btor473))
             (list)))
           (btor475
            (signal
             (concat (signal-value btor247) (signal-value btor474))
             (list)))
           (btor476
            (signal
             (concat (signal-value btor248) (signal-value btor475))
             (list)))
           (btor477
            (signal
             (concat (signal-value btor249) (signal-value btor476))
             (list)))
           (btor478
            (signal
             (concat (signal-value btor250) (signal-value btor477))
             (list)))
           (btor479
            (signal
             (concat (signal-value btor251) (signal-value btor478))
             (list)))
           (btor480
            (signal
             (concat (signal-value btor252) (signal-value btor479))
             (list)))
           (btor481
            (signal
             (concat (signal-value btor253) (signal-value btor480))
             (list)))
           (btor482
            (signal
             (concat (signal-value btor254) (signal-value btor481))
             (list)))
           (btor483
            (signal
             (concat (signal-value btor256) (signal-value btor482))
             (list)))
           (btor484
            (signal
             (concat (signal-value btor257) (signal-value btor483))
             (list)))
           (btor485
            (signal
             (concat (signal-value btor258) (signal-value btor484))
             (list)))
           (btor486
            (signal
             (concat (signal-value btor259) (signal-value btor485))
             (list)))
           (btor487
            (signal
             (concat (signal-value btor260) (signal-value btor486))
             (list)))
           (btor488
            (signal
             (concat (signal-value btor261) (signal-value btor487))
             (list)))
           (btor489
            (signal
             (concat (signal-value btor453) (signal-value btor488))
             (list)))
           (btor490 (bv->signal (bv 0 (bitvector 7))))
           (btor491
            (signal
             (concat (signal-value btor241) (signal-value btor241))
             (list)))
           (btor492
            (signal
             (concat (signal-value btor241) (signal-value btor491))
             (list)))
           (btor493
            (signal
             (concat (signal-value btor241) (signal-value btor492))
             (list)))
           (btor494
            (signal
             (concat (signal-value btor241) (signal-value btor493))
             (list)))
           (btor495
            (signal
             (concat (signal-value btor241) (signal-value btor494))
             (list)))
           (btor496
            (signal
             (concat (signal-value btor241) (signal-value btor495))
             (list)))
           (btor497
            (if (bitvector->bool (signal-value btor318)) btor496 btor490))
           (btor498
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state498")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state498"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state498")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state498")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor499
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state499")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state499"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state499")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state499")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor501
            (bv->signal
             (zero-extend (signal-value btor324) (bitvector 5))
             btor324))
           (btor502
            (signal
             (bool->bitvector
              (bveq (signal-value btor301) (signal-value btor501)))
             (list)))
           (btor503
            (if (bitvector->bool (signal-value btor502)) btor189 btor186))
           (btor504
            (bv->signal
             (zero-extend (signal-value btor328) (bitvector 5))
             btor328))
           (btor505
            (signal
             (bool->bitvector
              (bveq (signal-value btor301) (signal-value btor504)))
             (list)))
           (btor506
            (if (bitvector->bool (signal-value btor505)) btor188 btor503))
           (btor507
            (bv->signal
             (zero-extend (signal-value btor332) (bitvector 5))
             btor332))
           (btor508
            (signal
             (bool->bitvector
              (bveq (signal-value btor301) (signal-value btor507)))
             (list)))
           (btor509
            (if (bitvector->bool (signal-value btor508)) btor187 btor506))
           (btor510
            (bv->signal
             (zero-extend (signal-value btor336) (bitvector 5))
             btor336))
           (btor511
            (signal
             (bool->bitvector
              (bveq (signal-value btor301) (signal-value btor510)))
             (list)))
           (btor512
            (if (bitvector->bool (signal-value btor511)) btor186 btor509))
           (btor513
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state513")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state513"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state513")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state513")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor515
            (signal
             (concat (signal-value btor513) (signal-value btor512))
             (list)))
           (btor516
            (bv->signal
             (zero-extend (signal-value btor340) (bitvector 2))
             btor340))
           (btor517
            (signal
             (bool->bitvector
              (bveq (signal-value btor515) (signal-value btor516)))
             (list)))
           (btor518
            (if (bitvector->bool (signal-value btor517)) btor499 btor498))
           (btor519
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state519")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state519"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state519")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state519")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor520
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state520")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state520"))))))
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
           (btor522
            (bv->signal
             (zero-extend (signal-value btor324) (bitvector 5))
             btor324))
           (btor523
            (signal
             (bool->bitvector
              (bveq (signal-value btor298) (signal-value btor522)))
             (list)))
           (btor524
            (if (bitvector->bool (signal-value btor523)) btor189 btor186))
           (btor525
            (bv->signal
             (zero-extend (signal-value btor328) (bitvector 5))
             btor328))
           (btor526
            (signal
             (bool->bitvector
              (bveq (signal-value btor298) (signal-value btor525)))
             (list)))
           (btor527
            (if (bitvector->bool (signal-value btor526)) btor188 btor524))
           (btor528
            (bv->signal
             (zero-extend (signal-value btor332) (bitvector 5))
             btor332))
           (btor529
            (signal
             (bool->bitvector
              (bveq (signal-value btor298) (signal-value btor528)))
             (list)))
           (btor530
            (if (bitvector->bool (signal-value btor529)) btor187 btor527))
           (btor531
            (bv->signal
             (zero-extend (signal-value btor336) (bitvector 5))
             btor336))
           (btor532
            (signal
             (bool->bitvector
              (bveq (signal-value btor298) (signal-value btor531)))
             (list)))
           (btor533
            (if (bitvector->bool (signal-value btor532)) btor186 btor530))
           (btor534
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state534")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state534"))))))
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
           (btor536
            (signal
             (concat (signal-value btor534) (signal-value btor533))
             (list)))
           (btor537
            (bv->signal
             (zero-extend (signal-value btor340) (bitvector 2))
             btor340))
           (btor538
            (signal
             (bool->bitvector
              (bveq (signal-value btor536) (signal-value btor537)))
             (list)))
           (btor539
            (if (bitvector->bool (signal-value btor538)) btor520 btor519))
           (btor540
            (signal
             (apply bvor (bitvector->bits (signal-value btor298)))
             (signal-state btor298)))
           (btor541 (signal (bvnot (signal-value btor540)) (list)))
           (btor542
            (if (bitvector->bool (signal-value btor541)) btor279 btor539))
           (btor543
            (signal
             (apply bvor (bitvector->bits (signal-value btor301)))
             (signal-state btor301)))
           (btor544 (signal (bvnot (signal-value btor543)) (list)))
           (btor545
            (if (bitvector->bool (signal-value btor544)) btor542 btor518))
           (btor546 (bv->signal (bv 0 (bitvector 8))))
           (btor547
            (signal
             (concat (signal-value btor261) (signal-value btor261))
             (list)))
           (btor548
            (signal
             (concat (signal-value btor261) (signal-value btor547))
             (list)))
           (btor549
            (signal
             (concat (signal-value btor261) (signal-value btor548))
             (list)))
           (btor550
            (signal
             (concat (signal-value btor261) (signal-value btor549))
             (list)))
           (btor551
            (signal
             (concat (signal-value btor261) (signal-value btor550))
             (list)))
           (btor552
            (signal
             (concat (signal-value btor261) (signal-value btor551))
             (list)))
           (btor553
            (signal
             (concat (signal-value btor261) (signal-value btor552))
             (list)))
           (btor554
            (if (bitvector->bool (signal-value btor318)) btor553 btor546))
           (btor555
            (signal
             (concat (signal-value btor233) (signal-value btor232))
             (list)))
           (btor556
            (signal
             (concat (signal-value btor244) (signal-value btor555))
             (list)))
           (btor557
            (signal
             (concat (signal-value btor255) (signal-value btor556))
             (list)))
           (btor558
            (signal
             (concat (signal-value btor262) (signal-value btor557))
             (list)))
           (btor559
            (signal
             (concat (signal-value btor263) (signal-value btor558))
             (list)))
           (btor560
            (signal
             (concat (signal-value btor264) (signal-value btor559))
             (list)))
           (btor561
            (signal
             (concat (signal-value btor265) (signal-value btor560))
             (list)))
           (btor562
            (signal
             (concat (signal-value btor266) (signal-value btor561))
             (list)))
           (btor563
            (signal
             (concat (signal-value btor267) (signal-value btor562))
             (list)))
           (btor564
            (signal
             (concat (signal-value btor234) (signal-value btor563))
             (list)))
           (btor565
            (signal
             (concat (signal-value btor235) (signal-value btor564))
             (list)))
           (btor566
            (signal
             (concat (signal-value btor236) (signal-value btor565))
             (list)))
           (btor567
            (signal
             (concat (signal-value btor237) (signal-value btor566))
             (list)))
           (btor568
            (signal
             (concat (signal-value btor238) (signal-value btor567))
             (list)))
           (btor569
            (signal
             (concat (signal-value btor239) (signal-value btor568))
             (list)))
           (btor570
            (signal
             (concat (signal-value btor240) (signal-value btor569))
             (list)))
           (btor571
            (signal
             (concat (signal-value btor241) (signal-value btor570))
             (list)))
           (btor572
            (signal
             (concat (signal-value btor497) (signal-value btor571))
             (list)))
           (btor573
            (signal
             (concat (signal-value btor545) (signal-value btor572))
             (list)))
           (btor574
            (signal
             (concat (signal-value btor545) (signal-value btor573))
             (list)))
           (btor575
            (signal
             (concat (signal-value btor320) (signal-value btor574))
             (list)))
           (btor576
            (signal
             (concat (signal-value btor242) (signal-value btor575))
             (list)))
           (btor577
            (signal
             (concat (signal-value btor243) (signal-value btor576))
             (list)))
           (btor578
            (signal
             (concat (signal-value btor245) (signal-value btor577))
             (list)))
           (btor579
            (signal
             (concat (signal-value btor246) (signal-value btor578))
             (list)))
           (btor580
            (signal
             (concat (signal-value btor247) (signal-value btor579))
             (list)))
           (btor581
            (signal
             (concat (signal-value btor248) (signal-value btor580))
             (list)))
           (btor582
            (signal
             (concat (signal-value btor249) (signal-value btor581))
             (list)))
           (btor583
            (signal
             (concat (signal-value btor250) (signal-value btor582))
             (list)))
           (btor584
            (signal
             (concat (signal-value btor251) (signal-value btor583))
             (list)))
           (btor585
            (signal
             (concat (signal-value btor252) (signal-value btor584))
             (list)))
           (btor586
            (signal
             (concat (signal-value btor253) (signal-value btor585))
             (list)))
           (btor587
            (signal
             (concat (signal-value btor254) (signal-value btor586))
             (list)))
           (btor588
            (signal
             (concat (signal-value btor256) (signal-value btor587))
             (list)))
           (btor589
            (signal
             (concat (signal-value btor257) (signal-value btor588))
             (list)))
           (btor590
            (signal
             (concat (signal-value btor258) (signal-value btor589))
             (list)))
           (btor591
            (signal
             (concat (signal-value btor259) (signal-value btor590))
             (list)))
           (btor592
            (signal
             (concat (signal-value btor260) (signal-value btor591))
             (list)))
           (btor593
            (signal
             (concat (signal-value btor261) (signal-value btor592))
             (list)))
           (btor594
            (signal
             (concat (signal-value btor554) (signal-value btor593))
             (list)))
           (btor595 (bv->signal (bv 3 (bitvector 2))))
           (btor596
            (bv->signal
             (zero-extend (signal-value btor595) (bitvector 5))
             btor595))
           (btor597
            (signal
             (bool->bitvector
              (bveq (signal-value btor270) (signal-value btor596)))
             (list)))
           (btor598
            (if (bitvector->bool (signal-value btor597)) btor594 btor489))
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
                          (bv 0 7))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor600
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state600")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state600"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state600")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state600")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 7))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor602
            (bv->signal
             (zero-extend (signal-value btor324) (bitvector 5))
             btor324))
           (btor603
            (signal
             (bool->bitvector
              (bveq (signal-value btor295) (signal-value btor602)))
             (list)))
           (btor604
            (if (bitvector->bool (signal-value btor603)) btor189 btor186))
           (btor605
            (bv->signal
             (zero-extend (signal-value btor328) (bitvector 5))
             btor328))
           (btor606
            (signal
             (bool->bitvector
              (bveq (signal-value btor295) (signal-value btor605)))
             (list)))
           (btor607
            (if (bitvector->bool (signal-value btor606)) btor188 btor604))
           (btor608
            (bv->signal
             (zero-extend (signal-value btor332) (bitvector 5))
             btor332))
           (btor609
            (signal
             (bool->bitvector
              (bveq (signal-value btor295) (signal-value btor608)))
             (list)))
           (btor610
            (if (bitvector->bool (signal-value btor609)) btor187 btor607))
           (btor611
            (bv->signal
             (zero-extend (signal-value btor336) (bitvector 5))
             btor336))
           (btor612
            (signal
             (bool->bitvector
              (bveq (signal-value btor295) (signal-value btor611)))
             (list)))
           (btor613
            (if (bitvector->bool (signal-value btor612)) btor186 btor610))
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
            (signal
             (concat (signal-value btor614) (signal-value btor613))
             (list)))
           (btor617
            (bv->signal
             (zero-extend (signal-value btor340) (bitvector 2))
             btor340))
           (btor618
            (signal
             (bool->bitvector
              (bveq (signal-value btor616) (signal-value btor617)))
             (list)))
           (btor619
            (if (bitvector->bool (signal-value btor618)) btor600 btor599))
           (btor620
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state620")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state620"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state620")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state620")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 7))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor621
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state621")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state621"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state621")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state621")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 7))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor623
            (bv->signal
             (zero-extend (signal-value btor324) (bitvector 5))
             btor324))
           (btor624
            (signal
             (bool->bitvector
              (bveq (signal-value btor292) (signal-value btor623)))
             (list)))
           (btor625
            (if (bitvector->bool (signal-value btor624)) btor189 btor186))
           (btor626
            (bv->signal
             (zero-extend (signal-value btor328) (bitvector 5))
             btor328))
           (btor627
            (signal
             (bool->bitvector
              (bveq (signal-value btor292) (signal-value btor626)))
             (list)))
           (btor628
            (if (bitvector->bool (signal-value btor627)) btor188 btor625))
           (btor629
            (bv->signal
             (zero-extend (signal-value btor332) (bitvector 5))
             btor332))
           (btor630
            (signal
             (bool->bitvector
              (bveq (signal-value btor292) (signal-value btor629)))
             (list)))
           (btor631
            (if (bitvector->bool (signal-value btor630)) btor187 btor628))
           (btor632
            (bv->signal
             (zero-extend (signal-value btor336) (bitvector 5))
             btor336))
           (btor633
            (signal
             (bool->bitvector
              (bveq (signal-value btor292) (signal-value btor632)))
             (list)))
           (btor634
            (if (bitvector->bool (signal-value btor633)) btor186 btor631))
           (btor635
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state635")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state635"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state635")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state635")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor637
            (signal
             (concat (signal-value btor635) (signal-value btor634))
             (list)))
           (btor638
            (bv->signal
             (zero-extend (signal-value btor340) (bitvector 2))
             btor340))
           (btor639
            (signal
             (bool->bitvector
              (bveq (signal-value btor637) (signal-value btor638)))
             (list)))
           (btor640
            (if (bitvector->bool (signal-value btor639)) btor621 btor620))
           (btor641
            (signal
             (concat (signal-value btor272) (signal-value btor271))
             (list)))
           (btor642
            (signal
             (concat (signal-value btor274) (signal-value btor641))
             (list)))
           (btor643
            (signal
             (concat (signal-value btor275) (signal-value btor642))
             (list)))
           (btor644
            (signal
             (concat (signal-value btor276) (signal-value btor643))
             (list)))
           (btor645
            (signal
             (concat (signal-value btor277) (signal-value btor644))
             (list)))
           (btor646
            (signal
             (concat (signal-value btor278) (signal-value btor645))
             (list)))
           (btor647
            (signal
             (apply bvor (bitvector->bits (signal-value btor292)))
             (signal-state btor292)))
           (btor648 (signal (bvnot (signal-value btor647)) (list)))
           (btor649
            (if (bitvector->bool (signal-value btor648)) btor646 btor640))
           (btor650
            (signal
             (apply bvor (bitvector->bits (signal-value btor295)))
             (signal-state btor295)))
           (btor651 (signal (bvnot (signal-value btor650)) (list)))
           (btor652
            (if (bitvector->bool (signal-value btor651)) btor649 btor619))
           (btor653
            (signal
             (extract 3 2 (signal-value btor652))
             (signal-state btor652)))
           (btor654
            (bv->signal
             (zero-extend (signal-value btor340) (bitvector 2))
             btor340))
           (btor655
            (signal
             (bool->bitvector
              (bveq (signal-value btor653) (signal-value btor654)))
             (list)))
           (btor656
            (if (bitvector->bool (signal-value btor655)) btor598 btor422))
           (btor657
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state657")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state657"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state657")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state657")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 27))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor658 (bv->signal (bv 0 (bitvector 27))))
           (btor659
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state659")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state659"))))))
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
                          (bv 0 27))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor661
            (bv->signal
             (zero-extend (signal-value btor324) (bitvector 5))
             btor324))
           (btor662
            (signal
             (bool->bitvector
              (bveq (signal-value btor289) (signal-value btor661)))
             (list)))
           (btor663
            (if (bitvector->bool (signal-value btor662)) btor189 btor186))
           (btor664
            (bv->signal
             (zero-extend (signal-value btor328) (bitvector 5))
             btor328))
           (btor665
            (signal
             (bool->bitvector
              (bveq (signal-value btor289) (signal-value btor664)))
             (list)))
           (btor666
            (if (bitvector->bool (signal-value btor665)) btor188 btor663))
           (btor667
            (bv->signal
             (zero-extend (signal-value btor332) (bitvector 5))
             btor332))
           (btor668
            (signal
             (bool->bitvector
              (bveq (signal-value btor289) (signal-value btor667)))
             (list)))
           (btor669
            (if (bitvector->bool (signal-value btor668)) btor187 btor666))
           (btor670
            (bv->signal
             (zero-extend (signal-value btor336) (bitvector 5))
             btor336))
           (btor671
            (signal
             (bool->bitvector
              (bveq (signal-value btor289) (signal-value btor670)))
             (list)))
           (btor672
            (if (bitvector->bool (signal-value btor671)) btor186 btor669))
           (btor673
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state673")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state673"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state673")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state673")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor675
            (signal
             (concat (signal-value btor673) (signal-value btor672))
             (list)))
           (btor676
            (bv->signal
             (zero-extend (signal-value btor340) (bitvector 2))
             btor340))
           (btor677
            (signal
             (bool->bitvector
              (bveq (signal-value btor675) (signal-value btor676)))
             (list)))
           (btor678
            (if (bitvector->bool (signal-value btor677)) btor659 btor657))
           (btor679
            (signal
             (concat (signal-value btor95) (signal-value btor94))
             (list)))
           (btor680
            (signal
             (concat (signal-value btor96) (signal-value btor679))
             (list)))
           (btor681
            (signal
             (concat (signal-value btor98) (signal-value btor680))
             (list)))
           (btor682
            (signal
             (concat (signal-value btor99) (signal-value btor681))
             (list)))
           (btor683
            (signal
             (concat (signal-value btor100) (signal-value btor682))
             (list)))
           (btor684
            (signal
             (concat (signal-value btor101) (signal-value btor683))
             (list)))
           (btor685
            (signal
             (concat (signal-value btor102) (signal-value btor684))
             (list)))
           (btor686
            (signal
             (concat (signal-value btor103) (signal-value btor685))
             (list)))
           (btor687
            (signal
             (concat (signal-value btor104) (signal-value btor686))
             (list)))
           (btor688
            (signal
             (concat (signal-value btor105) (signal-value btor687))
             (list)))
           (btor689
            (signal
             (concat (signal-value btor106) (signal-value btor688))
             (list)))
           (btor690
            (signal
             (concat (signal-value btor107) (signal-value btor689))
             (list)))
           (btor691
            (signal
             (concat (signal-value btor109) (signal-value btor690))
             (list)))
           (btor692
            (signal
             (concat (signal-value btor110) (signal-value btor691))
             (list)))
           (btor693
            (signal
             (concat (signal-value btor111) (signal-value btor692))
             (list)))
           (btor694
            (signal
             (concat (signal-value btor112) (signal-value btor693))
             (list)))
           (btor695
            (signal
             (concat (signal-value btor113) (signal-value btor694))
             (list)))
           (btor696
            (signal
             (concat (signal-value btor114) (signal-value btor695))
             (list)))
           (btor697
            (signal
             (concat (signal-value btor115) (signal-value btor696))
             (list)))
           (btor698
            (signal
             (concat (signal-value btor116) (signal-value btor697))
             (list)))
           (btor699
            (signal
             (concat (signal-value btor117) (signal-value btor698))
             (list)))
           (btor700
            (signal
             (concat (signal-value btor118) (signal-value btor699))
             (list)))
           (btor701
            (signal
             (concat (signal-value btor120) (signal-value btor700))
             (list)))
           (btor702
            (signal
             (concat (signal-value btor121) (signal-value btor701))
             (list)))
           (btor703
            (signal
             (concat (signal-value btor122) (signal-value btor702))
             (list)))
           (btor704
            (signal
             (concat (signal-value btor123) (signal-value btor703))
             (list)))
           (btor705
            (signal
             (apply bvor (bitvector->bits (signal-value btor289)))
             (signal-state btor289)))
           (btor706 (signal (bvnot (signal-value btor705)) (list)))
           (btor707
            (if (bitvector->bool (signal-value btor706)) btor704 btor678))
           (btor708
            (signal
             (concat (signal-value btor39) (signal-value btor38))
             (list)))
           (btor709
            (signal
             (concat (signal-value btor50) (signal-value btor708))
             (list)))
           (btor710
            (signal
             (concat (signal-value btor61) (signal-value btor709))
             (list)))
           (btor711
            (signal
             (concat (signal-value btor68) (signal-value btor710))
             (list)))
           (btor712
            (signal
             (concat (signal-value btor69) (signal-value btor711))
             (list)))
           (btor713
            (signal
             (concat (signal-value btor70) (signal-value btor712))
             (list)))
           (btor714
            (signal
             (concat (signal-value btor71) (signal-value btor713))
             (list)))
           (btor715
            (signal
             (concat (signal-value btor72) (signal-value btor714))
             (list)))
           (btor716
            (signal
             (concat (signal-value btor73) (signal-value btor715))
             (list)))
           (btor717
            (signal
             (concat (signal-value btor40) (signal-value btor716))
             (list)))
           (btor718
            (signal
             (concat (signal-value btor41) (signal-value btor717))
             (list)))
           (btor719
            (signal
             (concat (signal-value btor42) (signal-value btor718))
             (list)))
           (btor720
            (signal
             (concat (signal-value btor43) (signal-value btor719))
             (list)))
           (btor721
            (signal
             (concat (signal-value btor44) (signal-value btor720))
             (list)))
           (btor722
            (signal
             (concat (signal-value btor45) (signal-value btor721))
             (list)))
           (btor723
            (signal
             (concat (signal-value btor46) (signal-value btor722))
             (list)))
           (btor724
            (signal
             (concat (signal-value btor47) (signal-value btor723))
             (list)))
           (btor725
            (signal
             (concat (signal-value btor48) (signal-value btor724))
             (list)))
           (btor726
            (signal
             (concat (signal-value btor49) (signal-value btor725))
             (list)))
           (btor727
            (signal
             (concat (signal-value btor51) (signal-value btor726))
             (list)))
           (btor728
            (signal
             (concat (signal-value btor52) (signal-value btor727))
             (list)))
           (btor729
            (signal
             (concat (signal-value btor53) (signal-value btor728))
             (list)))
           (btor730
            (signal
             (concat (signal-value btor54) (signal-value btor729))
             (list)))
           (btor731
            (signal
             (concat (signal-value btor55) (signal-value btor730))
             (list)))
           (btor732
            (signal
             (concat (signal-value btor56) (signal-value btor731))
             (list)))
           (btor733
            (signal
             (concat (signal-value btor57) (signal-value btor732))
             (list)))
           (btor734
            (signal
             (concat (signal-value btor58) (signal-value btor733))
             (list)))
           (btor735
            (signal
             (concat (signal-value btor59) (signal-value btor734))
             (list)))
           (btor736
            (signal
             (concat (signal-value btor60) (signal-value btor735))
             (list)))
           (btor737
            (signal
             (concat (signal-value btor62) (signal-value btor736))
             (list)))
           (btor738
            (signal
             (concat (signal-value btor63) (signal-value btor737))
             (list)))
           (btor739
            (signal
             (concat (signal-value btor64) (signal-value btor738))
             (list)))
           (btor740
            (signal
             (concat (signal-value btor65) (signal-value btor739))
             (list)))
           (btor741
            (signal
             (concat (signal-value btor66) (signal-value btor740))
             (list)))
           (btor742
            (signal
             (concat (signal-value btor67) (signal-value btor741))
             (list)))
           (btor743
            (signal
             (extract 17 0 (signal-value btor707))
             (signal-state btor707)))
           (btor744
            (signal
             (concat (signal-value btor743) (signal-value btor742))
             (list)))
           (btor745
            (signal
             (bool->bitvector
              (bveq (signal-value btor653) (signal-value btor595)))
             (list)))
           (btor746
            (if (bitvector->bool (signal-value btor745)) btor349 btor744))
           (btor747 (bv->signal (bv 2 (bitvector 2))))
           (btor748
            (signal
             (bool->bitvector
              (bveq (signal-value btor653) (signal-value btor747)))
             (list)))
           (btor749
            (signal
             (bvor (signal-value btor748) (signal-value btor745))
             (list)))
           (btor750
            (if (bitvector->bool (signal-value btor749)) btor746 btor656))
           (btor751
            (signal
             (concat (signal-value btor181) (signal-value btor181))
             (list)))
           (btor752
            (signal
             (concat (signal-value btor181) (signal-value btor751))
             (list)))
           (btor753
            (signal
             (concat (signal-value btor181) (signal-value btor752))
             (list)))
           (btor754
            (signal
             (concat (signal-value btor181) (signal-value btor753))
             (list)))
           (btor755
            (signal
             (concat (signal-value btor181) (signal-value btor754))
             (list)))
           (btor756
            (signal
             (concat (signal-value btor181) (signal-value btor755))
             (list)))
           (btor757
            (signal
             (concat (signal-value btor181) (signal-value btor756))
             (list)))
           (btor758
            (signal
             (concat (signal-value btor181) (signal-value btor757))
             (list)))
           (btor759
            (signal
             (concat (signal-value btor181) (signal-value btor758))
             (list)))
           (btor760
            (signal
             (concat (signal-value btor181) (signal-value btor759))
             (list)))
           (btor761
            (signal
             (concat (signal-value btor181) (signal-value btor760))
             (list)))
           (btor762
            (signal
             (concat (signal-value btor181) (signal-value btor761))
             (list)))
           (btor763
            (signal
             (concat (signal-value btor181) (signal-value btor762))
             (list)))
           (btor764
            (signal
             (concat (signal-value btor181) (signal-value btor763))
             (list)))
           (btor765
            (signal
             (concat (signal-value btor181) (signal-value btor764))
             (list)))
           (btor766
            (signal
             (concat (signal-value btor181) (signal-value btor765))
             (list)))
           (btor767
            (signal
             (concat (signal-value btor181) (signal-value btor766))
             (list)))
           (btor768
            (if (bitvector->bool (signal-value btor316)) btor767 btor351))
           (btor769
            (signal
             (concat (signal-value btor143) (signal-value btor142))
             (list)))
           (btor770
            (signal
             (concat (signal-value btor145) (signal-value btor769))
             (list)))
           (btor771
            (signal
             (concat (signal-value btor146) (signal-value btor770))
             (list)))
           (btor772
            (signal
             (concat (signal-value btor147) (signal-value btor771))
             (list)))
           (btor773
            (signal
             (concat (signal-value btor148) (signal-value btor772))
             (list)))
           (btor774
            (signal
             (concat (signal-value btor149) (signal-value btor773))
             (list)))
           (btor775
            (signal
             (concat (signal-value btor150) (signal-value btor774))
             (list)))
           (btor776
            (signal
             (concat (signal-value btor151) (signal-value btor775))
             (list)))
           (btor777
            (signal
             (concat (signal-value btor152) (signal-value btor776))
             (list)))
           (btor778
            (signal
             (concat (signal-value btor153) (signal-value btor777))
             (list)))
           (btor779
            (signal
             (concat (signal-value btor154) (signal-value btor778))
             (list)))
           (btor780
            (signal
             (concat (signal-value btor156) (signal-value btor779))
             (list)))
           (btor781
            (signal
             (concat (signal-value btor157) (signal-value btor780))
             (list)))
           (btor782
            (signal
             (concat (signal-value btor158) (signal-value btor781))
             (list)))
           (btor783
            (signal
             (concat (signal-value btor159) (signal-value btor782))
             (list)))
           (btor784
            (signal
             (concat (signal-value btor160) (signal-value btor783))
             (list)))
           (btor785
            (signal
             (concat (signal-value btor161) (signal-value btor784))
             (list)))
           (btor786
            (signal
             (concat (signal-value btor162) (signal-value btor785))
             (list)))
           (btor787
            (signal
             (concat (signal-value btor163) (signal-value btor786))
             (list)))
           (btor788
            (signal
             (concat (signal-value btor164) (signal-value btor787))
             (list)))
           (btor789
            (signal
             (concat (signal-value btor165) (signal-value btor788))
             (list)))
           (btor790
            (signal
             (concat (signal-value btor167) (signal-value btor789))
             (list)))
           (btor791
            (signal
             (concat (signal-value btor168) (signal-value btor790))
             (list)))
           (btor792
            (signal
             (concat (signal-value btor169) (signal-value btor791))
             (list)))
           (btor793
            (signal
             (concat (signal-value btor170) (signal-value btor792))
             (list)))
           (btor794
            (signal
             (concat (signal-value btor171) (signal-value btor793))
             (list)))
           (btor795
            (signal
             (concat (signal-value btor172) (signal-value btor794))
             (list)))
           (btor796
            (signal
             (concat (signal-value btor173) (signal-value btor795))
             (list)))
           (btor797
            (signal
             (concat (signal-value btor174) (signal-value btor796))
             (list)))
           (btor798
            (signal
             (concat (signal-value btor175) (signal-value btor797))
             (list)))
           (btor799
            (signal
             (concat (signal-value btor176) (signal-value btor798))
             (list)))
           (btor800
            (signal
             (concat (signal-value btor178) (signal-value btor799))
             (list)))
           (btor801
            (signal
             (concat (signal-value btor179) (signal-value btor800))
             (list)))
           (btor802
            (signal
             (concat (signal-value btor180) (signal-value btor801))
             (list)))
           (btor803
            (signal
             (concat (signal-value btor181) (signal-value btor802))
             (list)))
           (btor804
            (signal
             (concat (signal-value btor768) (signal-value btor803))
             (list)))
           (btor805
            (signal
             (extract 6 4 (signal-value btor652))
             (signal-state btor652)))
           (btor806
            (bv->signal
             (zero-extend (signal-value btor340) (bitvector 3))
             btor340))
           (btor807
            (signal
             (bool->bitvector
              (bveq (signal-value btor805) (signal-value btor806)))
             (list)))
           (btor808
            (if (bitvector->bool (signal-value btor807)) btor804 btor349))
           (btor809
            (signal
             (concat (signal-value btor133) (signal-value btor132))
             (list)))
           (btor810
            (signal
             (concat (signal-value btor144) (signal-value btor809))
             (list)))
           (btor811
            (signal
             (concat (signal-value btor155) (signal-value btor810))
             (list)))
           (btor812
            (signal
             (concat (signal-value btor166) (signal-value btor811))
             (list)))
           (btor813
            (signal
             (concat (signal-value btor177) (signal-value btor812))
             (list)))
           (btor814
            (signal
             (concat (signal-value btor182) (signal-value btor813))
             (list)))
           (btor815
            (signal
             (concat (signal-value btor183) (signal-value btor814))
             (list)))
           (btor816
            (signal
             (concat (signal-value btor184) (signal-value btor815))
             (list)))
           (btor817
            (signal
             (concat (signal-value btor185) (signal-value btor816))
             (list)))
           (btor818
            (signal
             (concat (signal-value btor134) (signal-value btor817))
             (list)))
           (btor819
            (signal
             (concat (signal-value btor135) (signal-value btor818))
             (list)))
           (btor820
            (signal
             (concat (signal-value btor136) (signal-value btor819))
             (list)))
           (btor821
            (signal
             (concat (signal-value btor137) (signal-value btor820))
             (list)))
           (btor822
            (signal
             (concat (signal-value btor138) (signal-value btor821))
             (list)))
           (btor823
            (signal
             (concat (signal-value btor139) (signal-value btor822))
             (list)))
           (btor824
            (signal
             (concat (signal-value btor140) (signal-value btor823))
             (list)))
           (btor825
            (signal
             (concat (signal-value btor141) (signal-value btor824))
             (list)))
           (btor826
            (signal
             (concat (signal-value btor142) (signal-value btor825))
             (list)))
           (btor827
            (signal
             (concat (signal-value btor143) (signal-value btor826))
             (list)))
           (btor828
            (signal
             (concat (signal-value btor145) (signal-value btor827))
             (list)))
           (btor829
            (signal
             (concat (signal-value btor146) (signal-value btor828))
             (list)))
           (btor830
            (signal
             (concat (signal-value btor147) (signal-value btor829))
             (list)))
           (btor831
            (signal
             (concat (signal-value btor148) (signal-value btor830))
             (list)))
           (btor832
            (signal
             (concat (signal-value btor149) (signal-value btor831))
             (list)))
           (btor833
            (signal
             (concat (signal-value btor150) (signal-value btor832))
             (list)))
           (btor834
            (signal
             (concat (signal-value btor151) (signal-value btor833))
             (list)))
           (btor835
            (signal
             (concat (signal-value btor152) (signal-value btor834))
             (list)))
           (btor836
            (signal
             (concat (signal-value btor153) (signal-value btor835))
             (list)))
           (btor837
            (signal
             (concat (signal-value btor154) (signal-value btor836))
             (list)))
           (btor838
            (signal
             (concat (signal-value btor156) (signal-value btor837))
             (list)))
           (btor839
            (signal
             (concat (signal-value btor157) (signal-value btor838))
             (list)))
           (btor840
            (signal
             (concat (signal-value btor158) (signal-value btor839))
             (list)))
           (btor841
            (signal
             (concat (signal-value btor159) (signal-value btor840))
             (list)))
           (btor842
            (signal
             (concat (signal-value btor160) (signal-value btor841))
             (list)))
           (btor843
            (signal
             (concat (signal-value btor161) (signal-value btor842))
             (list)))
           (btor844
            (signal
             (concat (signal-value btor162) (signal-value btor843))
             (list)))
           (btor845
            (signal
             (concat (signal-value btor163) (signal-value btor844))
             (list)))
           (btor846
            (signal
             (concat (signal-value btor164) (signal-value btor845))
             (list)))
           (btor847
            (signal
             (concat (signal-value btor165) (signal-value btor846))
             (list)))
           (btor848
            (signal
             (concat (signal-value btor167) (signal-value btor847))
             (list)))
           (btor849
            (signal
             (concat (signal-value btor168) (signal-value btor848))
             (list)))
           (btor850
            (signal
             (concat (signal-value btor169) (signal-value btor849))
             (list)))
           (btor851
            (signal
             (concat (signal-value btor170) (signal-value btor850))
             (list)))
           (btor852
            (signal
             (concat (signal-value btor171) (signal-value btor851))
             (list)))
           (btor853
            (signal
             (concat (signal-value btor172) (signal-value btor852))
             (list)))
           (btor854
            (signal
             (concat (signal-value btor173) (signal-value btor853))
             (list)))
           (btor855
            (signal
             (concat (signal-value btor174) (signal-value btor854))
             (list)))
           (btor856
            (signal
             (concat (signal-value btor175) (signal-value btor855))
             (list)))
           (btor857
            (signal
             (concat (signal-value btor176) (signal-value btor856))
             (list)))
           (btor858
            (signal
             (concat (signal-value btor178) (signal-value btor857))
             (list)))
           (btor859
            (signal
             (concat (signal-value btor179) (signal-value btor858))
             (list)))
           (btor860
            (signal
             (concat (signal-value btor180) (signal-value btor859))
             (list)))
           (btor861
            (signal
             (concat (signal-value btor181) (signal-value btor860))
             (list)))
           (btor862
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state862")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state862"))))))
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
                          (bv 0 27))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor863
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state863")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state863"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state863")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state863")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 27))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor865
            (bv->signal
             (zero-extend (signal-value btor324) (bitvector 5))
             btor324))
           (btor866
            (signal
             (bool->bitvector
              (bveq (signal-value btor286) (signal-value btor865)))
             (list)))
           (btor867
            (if (bitvector->bool (signal-value btor866)) btor189 btor186))
           (btor868
            (bv->signal
             (zero-extend (signal-value btor328) (bitvector 5))
             btor328))
           (btor869
            (signal
             (bool->bitvector
              (bveq (signal-value btor286) (signal-value btor868)))
             (list)))
           (btor870
            (if (bitvector->bool (signal-value btor869)) btor188 btor867))
           (btor871
            (bv->signal
             (zero-extend (signal-value btor332) (bitvector 5))
             btor332))
           (btor872
            (signal
             (bool->bitvector
              (bveq (signal-value btor286) (signal-value btor871)))
             (list)))
           (btor873
            (if (bitvector->bool (signal-value btor872)) btor187 btor870))
           (btor874
            (bv->signal
             (zero-extend (signal-value btor336) (bitvector 5))
             btor336))
           (btor875
            (signal
             (bool->bitvector
              (bveq (signal-value btor286) (signal-value btor874)))
             (list)))
           (btor876
            (if (bitvector->bool (signal-value btor875)) btor186 btor873))
           (btor877
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state877")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state877"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state877")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state877")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor879
            (signal
             (concat (signal-value btor877) (signal-value btor876))
             (list)))
           (btor880
            (bv->signal
             (zero-extend (signal-value btor340) (bitvector 2))
             btor340))
           (btor881
            (signal
             (bool->bitvector
              (bveq (signal-value btor879) (signal-value btor880)))
             (list)))
           (btor882
            (if (bitvector->bool (signal-value btor881)) btor863 btor862))
           (btor883
            (signal
             (concat (signal-value btor75) (signal-value btor74))
             (list)))
           (btor884
            (signal
             (concat (signal-value btor86) (signal-value btor883))
             (list)))
           (btor885
            (signal
             (concat (signal-value btor97) (signal-value btor884))
             (list)))
           (btor886
            (signal
             (concat (signal-value btor108) (signal-value btor885))
             (list)))
           (btor887
            (signal
             (concat (signal-value btor119) (signal-value btor886))
             (list)))
           (btor888
            (signal
             (concat (signal-value btor124) (signal-value btor887))
             (list)))
           (btor889
            (signal
             (concat (signal-value btor125) (signal-value btor888))
             (list)))
           (btor890
            (signal
             (concat (signal-value btor126) (signal-value btor889))
             (list)))
           (btor891
            (signal
             (concat (signal-value btor127) (signal-value btor890))
             (list)))
           (btor892
            (signal
             (concat (signal-value btor76) (signal-value btor891))
             (list)))
           (btor893
            (signal
             (concat (signal-value btor77) (signal-value btor892))
             (list)))
           (btor894
            (signal
             (concat (signal-value btor78) (signal-value btor893))
             (list)))
           (btor895
            (signal
             (concat (signal-value btor79) (signal-value btor894))
             (list)))
           (btor896
            (signal
             (concat (signal-value btor80) (signal-value btor895))
             (list)))
           (btor897
            (signal
             (concat (signal-value btor81) (signal-value btor896))
             (list)))
           (btor898
            (signal
             (concat (signal-value btor82) (signal-value btor897))
             (list)))
           (btor899
            (signal
             (concat (signal-value btor83) (signal-value btor898))
             (list)))
           (btor900
            (signal
             (concat (signal-value btor84) (signal-value btor899))
             (list)))
           (btor901
            (signal
             (concat (signal-value btor85) (signal-value btor900))
             (list)))
           (btor902
            (signal
             (concat (signal-value btor87) (signal-value btor901))
             (list)))
           (btor903
            (signal
             (concat (signal-value btor88) (signal-value btor902))
             (list)))
           (btor904
            (signal
             (concat (signal-value btor89) (signal-value btor903))
             (list)))
           (btor905
            (signal
             (concat (signal-value btor90) (signal-value btor904))
             (list)))
           (btor906
            (signal
             (concat (signal-value btor91) (signal-value btor905))
             (list)))
           (btor907
            (signal
             (concat (signal-value btor92) (signal-value btor906))
             (list)))
           (btor908
            (signal
             (concat (signal-value btor93) (signal-value btor907))
             (list)))
           (btor909
            (signal
             (apply bvor (bitvector->bits (signal-value btor286)))
             (signal-state btor286)))
           (btor910 (signal (bvnot (signal-value btor909)) (list)))
           (btor911
            (if (bitvector->bool (signal-value btor910)) btor908 btor882))
           (btor912
            (signal
             (concat (signal-value btor707) (signal-value btor911))
             (list)))
           (btor913
            (bv->signal
             (zero-extend (signal-value btor595) (bitvector 3))
             btor595))
           (btor914
            (signal
             (bool->bitvector
              (bveq (signal-value btor805) (signal-value btor913)))
             (list)))
           (btor915
            (if (bitvector->bool (signal-value btor914)) btor912 btor861))
           (btor916
            (bv->signal
             (zero-extend (signal-value btor747) (bitvector 3))
             btor747))
           (btor917
            (signal
             (bool->bitvector
              (bveq (signal-value btor805) (signal-value btor916)))
             (list)))
           (btor918
            (signal
             (bvor (signal-value btor917) (signal-value btor914))
             (list)))
           (btor919
            (if (bitvector->bool (signal-value btor918)) btor915 btor808))
           (btor920
            (signal (concat (signal-value btor3) (signal-value btor2)) (list)))
           (btor921
            (signal
             (concat (signal-value btor14) (signal-value btor920))
             (list)))
           (btor922
            (signal
             (concat (signal-value btor25) (signal-value btor921))
             (list)))
           (btor923
            (signal
             (concat (signal-value btor32) (signal-value btor922))
             (list)))
           (btor924
            (signal
             (concat (signal-value btor33) (signal-value btor923))
             (list)))
           (btor925
            (signal
             (concat (signal-value btor34) (signal-value btor924))
             (list)))
           (btor926
            (signal
             (concat (signal-value btor35) (signal-value btor925))
             (list)))
           (btor927
            (signal
             (concat (signal-value btor36) (signal-value btor926))
             (list)))
           (btor928
            (signal
             (concat (signal-value btor37) (signal-value btor927))
             (list)))
           (btor929
            (signal
             (concat (signal-value btor4) (signal-value btor928))
             (list)))
           (btor930
            (signal
             (concat (signal-value btor5) (signal-value btor929))
             (list)))
           (btor931
            (signal
             (concat (signal-value btor6) (signal-value btor930))
             (list)))
           (btor932
            (signal
             (concat (signal-value btor7) (signal-value btor931))
             (list)))
           (btor933
            (signal
             (concat (signal-value btor8) (signal-value btor932))
             (list)))
           (btor934
            (signal
             (concat (signal-value btor9) (signal-value btor933))
             (list)))
           (btor935
            (signal
             (concat (signal-value btor10) (signal-value btor934))
             (list)))
           (btor936
            (signal
             (concat (signal-value btor11) (signal-value btor935))
             (list)))
           (btor937
            (signal
             (concat (signal-value btor12) (signal-value btor936))
             (list)))
           (btor938
            (signal
             (concat (signal-value btor13) (signal-value btor937))
             (list)))
           (btor939
            (signal
             (concat (signal-value btor15) (signal-value btor938))
             (list)))
           (btor940
            (signal
             (concat (signal-value btor16) (signal-value btor939))
             (list)))
           (btor941
            (signal
             (concat (signal-value btor17) (signal-value btor940))
             (list)))
           (btor942
            (signal
             (concat (signal-value btor18) (signal-value btor941))
             (list)))
           (btor943
            (signal
             (concat (signal-value btor19) (signal-value btor942))
             (list)))
           (btor944
            (signal
             (concat (signal-value btor20) (signal-value btor943))
             (list)))
           (btor945
            (signal
             (concat (signal-value btor21) (signal-value btor944))
             (list)))
           (btor946
            (signal
             (concat (signal-value btor22) (signal-value btor945))
             (list)))
           (btor947
            (signal
             (concat (signal-value btor23) (signal-value btor946))
             (list)))
           (btor948
            (signal
             (concat (signal-value btor24) (signal-value btor947))
             (list)))
           (btor949
            (signal
             (concat (signal-value btor26) (signal-value btor948))
             (list)))
           (btor950
            (signal
             (concat (signal-value btor27) (signal-value btor949))
             (list)))
           (btor951
            (signal
             (concat (signal-value btor28) (signal-value btor950))
             (list)))
           (btor952
            (signal
             (concat (signal-value btor29) (signal-value btor951))
             (list)))
           (btor953
            (signal
             (concat (signal-value btor30) (signal-value btor952))
             (list)))
           (btor954
            (signal
             (concat (signal-value btor31) (signal-value btor953))
             (list)))
           (btor955
            (signal
             (extract 17 0 (signal-value btor911))
             (signal-state btor911)))
           (btor956
            (signal
             (concat (signal-value btor955) (signal-value btor954))
             (list)))
           (btor957
            (signal
             (extract 53 0 (signal-value btor311))
             (signal-state btor311)))
           (btor958 (bv->signal (bv 6 (bitvector 3))))
           (btor959
            (signal
             (bool->bitvector
              (bveq (signal-value btor805) (signal-value btor958)))
             (list)))
           (btor960
            (if (bitvector->bool (signal-value btor959)) btor957 btor956))
           (btor961
            (bv->signal
             (zero-extend (signal-value btor340) (bitvector 54))
             btor340))
           (btor962
            (signal
             (bvsub (signal-value btor957) (signal-value btor961))
             (list)))
           (btor963 (bv->signal (bv 7 (bitvector 3))))
           (btor964
            (signal
             (bool->bitvector
              (bveq (signal-value btor805) (signal-value btor963)))
             (list)))
           (btor965
            (if (bitvector->bool (signal-value btor964)) btor962 btor960))
           (btor966 (bv->signal (bv 4 (bitvector 3))))
           (btor967
            (signal
             (bool->bitvector
              (bveq (signal-value btor805) (signal-value btor966)))
             (list)))
           (btor968
            (signal
             (concat (signal-value btor959) (signal-value btor964))
             (list)))
           (btor969
            (signal
             (concat (signal-value btor967) (signal-value btor968))
             (list)))
           (btor970
            (signal
             (apply bvor (bitvector->bits (signal-value btor969)))
             (signal-state btor969)))
           (btor971
            (if (bitvector->bool (signal-value btor970)) btor965 btor919))
           (btor972
            (signal
             (bvand (signal-value btor750) (signal-value btor971))
             (list)))
           (btor973 (signal (bvnot (signal-value btor972)) (list)))
           (btor974
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state974")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state974"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state974")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state974")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 3))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor975 (bv->signal (bv 0 (bitvector 3))))
           (btor976
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state976")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state976"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state976")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state976")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 3))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor978
            (bv->signal
             (zero-extend (signal-value btor324) (bitvector 5))
             btor324))
           (btor979
            (signal
             (bool->bitvector
              (bveq (signal-value btor304) (signal-value btor978)))
             (list)))
           (btor980
            (if (bitvector->bool (signal-value btor979)) btor189 btor186))
           (btor981
            (bv->signal
             (zero-extend (signal-value btor328) (bitvector 5))
             btor328))
           (btor982
            (signal
             (bool->bitvector
              (bveq (signal-value btor304) (signal-value btor981)))
             (list)))
           (btor983
            (if (bitvector->bool (signal-value btor982)) btor188 btor980))
           (btor984
            (bv->signal
             (zero-extend (signal-value btor332) (bitvector 5))
             btor332))
           (btor985
            (signal
             (bool->bitvector
              (bveq (signal-value btor304) (signal-value btor984)))
             (list)))
           (btor986
            (if (bitvector->bool (signal-value btor985)) btor187 btor983))
           (btor987
            (bv->signal
             (zero-extend (signal-value btor336) (bitvector 5))
             btor336))
           (btor988
            (signal
             (bool->bitvector
              (bveq (signal-value btor304) (signal-value btor987)))
             (list)))
           (btor989
            (if (bitvector->bool (signal-value btor988)) btor186 btor986))
           (btor990
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state990")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state990"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state990")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state990")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor992
            (signal
             (concat (signal-value btor990) (signal-value btor989))
             (list)))
           (btor993
            (bv->signal
             (zero-extend (signal-value btor340) (bitvector 2))
             btor340))
           (btor994
            (signal
             (bool->bitvector
              (bveq (signal-value btor992) (signal-value btor993)))
             (list)))
           (btor995
            (if (bitvector->bool (signal-value btor994)) btor976 btor974))
           (btor996
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state996")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state996"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state996")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state996")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 3))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor997
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state997")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state997"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state997")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state997")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 3))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor999
            (bv->signal
             (zero-extend (signal-value btor324) (bitvector 5))
             btor324))
           (btor1000
            (signal
             (bool->bitvector
              (bveq (signal-value btor303) (signal-value btor999)))
             (list)))
           (btor1001
            (if (bitvector->bool (signal-value btor1000)) btor189 btor186))
           (btor1002
            (bv->signal
             (zero-extend (signal-value btor328) (bitvector 5))
             btor328))
           (btor1003
            (signal
             (bool->bitvector
              (bveq (signal-value btor303) (signal-value btor1002)))
             (list)))
           (btor1004
            (if (bitvector->bool (signal-value btor1003)) btor188 btor1001))
           (btor1005
            (bv->signal
             (zero-extend (signal-value btor332) (bitvector 5))
             btor332))
           (btor1006
            (signal
             (bool->bitvector
              (bveq (signal-value btor303) (signal-value btor1005)))
             (list)))
           (btor1007
            (if (bitvector->bool (signal-value btor1006)) btor187 btor1004))
           (btor1008
            (bv->signal
             (zero-extend (signal-value btor336) (bitvector 5))
             btor336))
           (btor1009
            (signal
             (bool->bitvector
              (bveq (signal-value btor303) (signal-value btor1008)))
             (list)))
           (btor1010
            (if (bitvector->bool (signal-value btor1009)) btor186 btor1007))
           (btor1011
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1011")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1011"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1011")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1011")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1013
            (signal
             (concat (signal-value btor1011) (signal-value btor1010))
             (list)))
           (btor1014
            (bv->signal
             (zero-extend (signal-value btor340) (bitvector 2))
             btor340))
           (btor1015
            (signal
             (bool->bitvector
              (bveq (signal-value btor1013) (signal-value btor1014)))
             (list)))
           (btor1016
            (if (bitvector->bool (signal-value btor1015)) btor997 btor996))
           (btor1017
            (signal
             (concat (signal-value btor281) (signal-value btor280))
             (list)))
           (btor1018
            (signal
             (concat (signal-value btor273) (signal-value btor1017))
             (list)))
           (btor1019
            (signal
             (apply bvor (bitvector->bits (signal-value btor303)))
             (signal-state btor303)))
           (btor1020 (signal (bvnot (signal-value btor1019)) (list)))
           (btor1021
            (if (bitvector->bool (signal-value btor1020)) btor1018 btor1016))
           (btor1022
            (signal
             (apply bvor (bitvector->bits (signal-value btor304)))
             (signal-state btor304)))
           (btor1023 (signal (bvnot (signal-value btor1022)) (list)))
           (btor1024
            (if (bitvector->bool (signal-value btor1023)) btor1021 btor995))
           (btor1025
            (signal
             (concat (signal-value btor1024) (signal-value btor545))
             (list)))
           (btor1026
            (signal
             (apply bvor (bitvector->bits (signal-value btor1025)))
             (signal-state btor1025)))
           (btor1027 (signal (bvnot (signal-value btor1026)) (list)))
           (btor1028
            (if (bitvector->bool (signal-value btor1027)) btor973 btor349))
           (btor1029
            (signal
             (concat (signal-value btor221) (signal-value btor221))
             (list)))
           (btor1030
            (signal
             (concat (signal-value btor221) (signal-value btor1029))
             (list)))
           (btor1031
            (signal
             (concat (signal-value btor221) (signal-value btor1030))
             (list)))
           (btor1032
            (signal
             (concat (signal-value btor221) (signal-value btor1031))
             (list)))
           (btor1033
            (signal
             (concat (signal-value btor221) (signal-value btor1032))
             (list)))
           (btor1034
            (signal
             (concat (signal-value btor221) (signal-value btor1033))
             (list)))
           (btor1035
            (signal
             (concat (signal-value btor221) (signal-value btor1034))
             (list)))
           (btor1036
            (signal
             (concat (signal-value btor221) (signal-value btor1035))
             (list)))
           (btor1037
            (signal
             (concat (signal-value btor221) (signal-value btor1036))
             (list)))
           (btor1038
            (signal
             (concat (signal-value btor221) (signal-value btor1037))
             (list)))
           (btor1039
            (signal
             (concat (signal-value btor221) (signal-value btor1038))
             (list)))
           (btor1040
            (signal
             (concat (signal-value btor221) (signal-value btor1039))
             (list)))
           (btor1041
            (signal
             (concat (signal-value btor221) (signal-value btor1040))
             (list)))
           (btor1042
            (signal
             (concat (signal-value btor221) (signal-value btor1041))
             (list)))
           (btor1043
            (signal
             (concat (signal-value btor221) (signal-value btor1042))
             (list)))
           (btor1044
            (signal
             (concat (signal-value btor221) (signal-value btor1043))
             (list)))
           (btor1045
            (signal
             (concat (signal-value btor221) (signal-value btor1044))
             (list)))
           (btor1046
            (if (bitvector->bool (signal-value btor317)) btor1045 btor351))
           (btor1047
            (signal
             (concat (signal-value btor193) (signal-value btor192))
             (list)))
           (btor1048
            (signal
             (concat (signal-value btor204) (signal-value btor1047))
             (list)))
           (btor1049
            (signal
             (concat (signal-value btor215) (signal-value btor1048))
             (list)))
           (btor1050
            (signal
             (concat (signal-value btor222) (signal-value btor1049))
             (list)))
           (btor1051
            (signal
             (concat (signal-value btor223) (signal-value btor1050))
             (list)))
           (btor1052
            (signal
             (concat (signal-value btor224) (signal-value btor1051))
             (list)))
           (btor1053
            (signal
             (concat (signal-value btor225) (signal-value btor1052))
             (list)))
           (btor1054
            (signal
             (concat (signal-value btor226) (signal-value btor1053))
             (list)))
           (btor1055
            (signal
             (concat (signal-value btor227) (signal-value btor1054))
             (list)))
           (btor1056
            (signal
             (concat (signal-value btor194) (signal-value btor1055))
             (list)))
           (btor1057
            (signal
             (concat (signal-value btor195) (signal-value btor1056))
             (list)))
           (btor1058
            (signal
             (concat (signal-value btor196) (signal-value btor1057))
             (list)))
           (btor1059
            (signal
             (concat (signal-value btor197) (signal-value btor1058))
             (list)))
           (btor1060
            (signal
             (concat (signal-value btor198) (signal-value btor1059))
             (list)))
           (btor1061
            (signal
             (concat (signal-value btor199) (signal-value btor1060))
             (list)))
           (btor1062
            (signal
             (concat (signal-value btor200) (signal-value btor1061))
             (list)))
           (btor1063
            (signal
             (concat (signal-value btor201) (signal-value btor1062))
             (list)))
           (btor1064
            (signal
             (concat (signal-value btor202) (signal-value btor1063))
             (list)))
           (btor1065
            (signal
             (concat (signal-value btor203) (signal-value btor1064))
             (list)))
           (btor1066
            (signal
             (concat (signal-value btor205) (signal-value btor1065))
             (list)))
           (btor1067
            (signal
             (concat (signal-value btor206) (signal-value btor1066))
             (list)))
           (btor1068
            (signal
             (concat (signal-value btor207) (signal-value btor1067))
             (list)))
           (btor1069
            (signal
             (concat (signal-value btor208) (signal-value btor1068))
             (list)))
           (btor1070
            (signal
             (concat (signal-value btor209) (signal-value btor1069))
             (list)))
           (btor1071
            (signal
             (concat (signal-value btor210) (signal-value btor1070))
             (list)))
           (btor1072
            (signal
             (concat (signal-value btor211) (signal-value btor1071))
             (list)))
           (btor1073
            (signal
             (concat (signal-value btor212) (signal-value btor1072))
             (list)))
           (btor1074
            (signal
             (concat (signal-value btor213) (signal-value btor1073))
             (list)))
           (btor1075
            (signal
             (concat (signal-value btor214) (signal-value btor1074))
             (list)))
           (btor1076
            (signal
             (concat (signal-value btor216) (signal-value btor1075))
             (list)))
           (btor1077
            (signal
             (concat (signal-value btor217) (signal-value btor1076))
             (list)))
           (btor1078
            (signal
             (concat (signal-value btor218) (signal-value btor1077))
             (list)))
           (btor1079
            (signal
             (concat (signal-value btor219) (signal-value btor1078))
             (list)))
           (btor1080
            (signal
             (concat (signal-value btor220) (signal-value btor1079))
             (list)))
           (btor1081
            (signal
             (concat (signal-value btor221) (signal-value btor1080))
             (list)))
           (btor1082
            (signal
             (concat (signal-value btor1046) (signal-value btor1081))
             (list)))
           (btor1083
            (signal
             (concat (signal-value btor201) (signal-value btor201))
             (list)))
           (btor1084
            (signal
             (concat (signal-value btor201) (signal-value btor1083))
             (list)))
           (btor1085
            (signal
             (concat (signal-value btor201) (signal-value btor1084))
             (list)))
           (btor1086
            (signal
             (concat (signal-value btor201) (signal-value btor1085))
             (list)))
           (btor1087
            (signal
             (concat (signal-value btor201) (signal-value btor1086))
             (list)))
           (btor1088
            (signal
             (concat (signal-value btor201) (signal-value btor1087))
             (list)))
           (btor1089
            (if (bitvector->bool (signal-value btor317)) btor1088 btor490))
           (btor1090 (bv->signal (bv 0 (bitvector 2))))
           (btor1091
            (signal
             (concat (signal-value btor221) (signal-value btor221))
             (list)))
           (btor1092
            (signal
             (concat (signal-value btor221) (signal-value btor1091))
             (list)))
           (btor1093
            (signal
             (concat (signal-value btor221) (signal-value btor1092))
             (list)))
           (btor1094
            (signal
             (concat (signal-value btor221) (signal-value btor1093))
             (list)))
           (btor1095
            (signal
             (concat (signal-value btor221) (signal-value btor1094))
             (list)))
           (btor1096
            (signal
             (concat (signal-value btor221) (signal-value btor1095))
             (list)))
           (btor1097
            (signal
             (concat (signal-value btor221) (signal-value btor1096))
             (list)))
           (btor1098
            (if (bitvector->bool (signal-value btor317)) btor1097 btor546))
           (btor1099
            (signal
             (concat (signal-value btor193) (signal-value btor192))
             (list)))
           (btor1100
            (signal
             (concat (signal-value btor204) (signal-value btor1099))
             (list)))
           (btor1101
            (signal
             (concat (signal-value btor215) (signal-value btor1100))
             (list)))
           (btor1102
            (signal
             (concat (signal-value btor222) (signal-value btor1101))
             (list)))
           (btor1103
            (signal
             (concat (signal-value btor223) (signal-value btor1102))
             (list)))
           (btor1104
            (signal
             (concat (signal-value btor224) (signal-value btor1103))
             (list)))
           (btor1105
            (signal
             (concat (signal-value btor225) (signal-value btor1104))
             (list)))
           (btor1106
            (signal
             (concat (signal-value btor226) (signal-value btor1105))
             (list)))
           (btor1107
            (signal
             (concat (signal-value btor227) (signal-value btor1106))
             (list)))
           (btor1108
            (signal
             (concat (signal-value btor194) (signal-value btor1107))
             (list)))
           (btor1109
            (signal
             (concat (signal-value btor195) (signal-value btor1108))
             (list)))
           (btor1110
            (signal
             (concat (signal-value btor196) (signal-value btor1109))
             (list)))
           (btor1111
            (signal
             (concat (signal-value btor197) (signal-value btor1110))
             (list)))
           (btor1112
            (signal
             (concat (signal-value btor198) (signal-value btor1111))
             (list)))
           (btor1113
            (signal
             (concat (signal-value btor199) (signal-value btor1112))
             (list)))
           (btor1114
            (signal
             (concat (signal-value btor200) (signal-value btor1113))
             (list)))
           (btor1115
            (signal
             (concat (signal-value btor201) (signal-value btor1114))
             (list)))
           (btor1116
            (signal
             (concat (signal-value btor1089) (signal-value btor1115))
             (list)))
           (btor1117
            (signal
             (concat (signal-value btor1090) (signal-value btor1116))
             (list)))
           (btor1118
            (signal
             (concat (signal-value btor545) (signal-value btor1117))
             (list)))
           (btor1119
            (signal
             (concat (signal-value btor202) (signal-value btor1118))
             (list)))
           (btor1120
            (signal
             (concat (signal-value btor203) (signal-value btor1119))
             (list)))
           (btor1121
            (signal
             (concat (signal-value btor205) (signal-value btor1120))
             (list)))
           (btor1122
            (signal
             (concat (signal-value btor206) (signal-value btor1121))
             (list)))
           (btor1123
            (signal
             (concat (signal-value btor207) (signal-value btor1122))
             (list)))
           (btor1124
            (signal
             (concat (signal-value btor208) (signal-value btor1123))
             (list)))
           (btor1125
            (signal
             (concat (signal-value btor209) (signal-value btor1124))
             (list)))
           (btor1126
            (signal
             (concat (signal-value btor210) (signal-value btor1125))
             (list)))
           (btor1127
            (signal
             (concat (signal-value btor211) (signal-value btor1126))
             (list)))
           (btor1128
            (signal
             (concat (signal-value btor212) (signal-value btor1127))
             (list)))
           (btor1129
            (signal
             (concat (signal-value btor213) (signal-value btor1128))
             (list)))
           (btor1130
            (signal
             (concat (signal-value btor214) (signal-value btor1129))
             (list)))
           (btor1131
            (signal
             (concat (signal-value btor216) (signal-value btor1130))
             (list)))
           (btor1132
            (signal
             (concat (signal-value btor217) (signal-value btor1131))
             (list)))
           (btor1133
            (signal
             (concat (signal-value btor218) (signal-value btor1132))
             (list)))
           (btor1134
            (signal
             (concat (signal-value btor219) (signal-value btor1133))
             (list)))
           (btor1135
            (signal
             (concat (signal-value btor220) (signal-value btor1134))
             (list)))
           (btor1136
            (signal
             (concat (signal-value btor221) (signal-value btor1135))
             (list)))
           (btor1137
            (signal
             (concat (signal-value btor1098) (signal-value btor1136))
             (list)))
           (btor1138
            (if (bitvector->bool (signal-value btor597)) btor1137 btor1082))
           (btor1139
            (signal
             (extract 1 0 (signal-value btor652))
             (signal-state btor652)))
           (btor1140
            (bv->signal
             (zero-extend (signal-value btor340) (bitvector 2))
             btor340))
           (btor1141
            (signal
             (bool->bitvector
              (bveq (signal-value btor1139) (signal-value btor1140)))
             (list)))
           (btor1142
            (if (bitvector->bool (signal-value btor1141)) btor1138 btor349))
           (btor1143
            (signal
             (bool->bitvector
              (bveq (signal-value btor1139) (signal-value btor747)))
             (list)))
           (btor1144
            (if (bitvector->bool (signal-value btor1143)) btor956 btor1142))
           (btor1145
            (signal
             (bvadd (signal-value btor1144) (signal-value btor750))
             (list)))
           (btor1146
            (signal
             (bvadd (signal-value btor1145) (signal-value btor971))
             (list)))
           (btor1147
            (bv->signal
             (zero-extend (signal-value btor966) (bitvector 4))
             btor966))
           (btor1148
            (signal
             (bool->bitvector
              (bveq (signal-value btor1025) (signal-value btor1147)))
             (list)))
           (btor1149
            (if (bitvector->bool (signal-value btor1148)) btor1146 btor1028))
           (btor1150
            (signal
             (bvsub (signal-value btor1144) (signal-value btor750))
             (list)))
           (btor1151
            (signal
             (bvadd (signal-value btor1150) (signal-value btor971))
             (list)))
           (btor1152
            (signal
             (bvsub (signal-value btor1145) (signal-value btor971))
             (list)))
           (btor1153
            (bv->signal
             (zero-extend (signal-value btor958) (bitvector 4))
             btor958))
           (btor1154
            (signal
             (bool->bitvector
              (bveq (signal-value btor1025) (signal-value btor1153)))
             (list)))
           (btor1155
            (if (bitvector->bool (signal-value btor1154)) btor1152 btor1151))
           (btor1156
            (signal
             (bvsub (signal-value btor1150) (signal-value btor971))
             (list)))
           (btor1157
            (bv->signal
             (zero-extend (signal-value btor963) (bitvector 4))
             btor963))
           (btor1158
            (signal
             (bool->bitvector
              (bveq (signal-value btor1025) (signal-value btor1157)))
             (list)))
           (btor1159
            (if (bitvector->bool (signal-value btor1158)) btor1156 btor1155))
           (btor1160 (bv->signal (bv 5 (bitvector 3))))
           (btor1161
            (bv->signal
             (zero-extend (signal-value btor1160) (bitvector 4))
             btor1160))
           (btor1162
            (signal
             (bool->bitvector
              (bveq (signal-value btor1025) (signal-value btor1161)))
             (list)))
           (btor1163
            (signal
             (concat (signal-value btor1154) (signal-value btor1158))
             (list)))
           (btor1164
            (signal
             (concat (signal-value btor1162) (signal-value btor1163))
             (list)))
           (btor1165
            (signal
             (apply bvor (bitvector->bits (signal-value btor1164)))
             (signal-state btor1164)))
           (btor1166
            (if (bitvector->bool (signal-value btor1165)) btor1159 btor1149))
           (btor1167
            (signal
             ((lambda (a b) (bvnot (bvxor a b)))
              (signal-value btor750)
              (signal-value btor971))
             (list)))
           (btor1168
            (signal
             (bvxor (signal-value btor750) (signal-value btor971))
             (list)))
           (btor1169
            (signal
             (bool->bitvector
              (bveq (signal-value btor1025) (signal-value btor324)))
             (list)))
           (btor1170
            (if (bitvector->bool (signal-value btor1169)) btor1168 btor1167))
           (btor1171 (bv->signal (bv 8 (bitvector 4))))
           (btor1172
            (signal
             (bool->bitvector
              (bveq (signal-value btor1025) (signal-value btor1171)))
             (list)))
           (btor1173
            (if (bitvector->bool (signal-value btor1172)) btor972 btor1170))
           (btor1174
            (signal
             (bvor (signal-value btor750) (signal-value btor971))
             (list)))
           (btor1175 (signal (bvnot (signal-value btor1174)) (list)))
           (btor1176
            (signal
             (bool->bitvector
              (bveq (signal-value btor1025) (signal-value btor336)))
             (list)))
           (btor1177
            (if (bitvector->bool (signal-value btor1176)) btor1175 btor1174))
           (btor1178
            (bv->signal
             (zero-extend (signal-value btor595) (bitvector 4))
             btor595))
           (btor1179
            (signal
             (bool->bitvector
              (bveq (signal-value btor1025) (signal-value btor1178)))
             (list)))
           (btor1180
            (signal
             (bvor (signal-value btor1179) (signal-value btor1176))
             (list)))
           (btor1181
            (if (bitvector->bool (signal-value btor1180)) btor1177 btor1173))
           (btor1182
            (signal
             (bool->bitvector
              (bveq (signal-value btor1025) (signal-value btor332)))
             (list)))
           (btor1183
            (signal
             (concat (signal-value btor1169) (signal-value btor1172))
             (list)))
           (btor1184
            (signal
             (concat (signal-value btor1182) (signal-value btor1183))
             (list)))
           (btor1185
            (signal
             (concat (signal-value btor1180) (signal-value btor1184))
             (list)))
           (btor1186
            (signal
             (apply bvor (bitvector->bits (signal-value btor1185)))
             (signal-state btor1185)))
           (btor1187
            (if (bitvector->bool (signal-value btor1186)) btor1181 btor1166))
           (btor1188
            (signal
             (extract 53 0 (signal-value btor229))
             (signal-state btor229)))
           (btor1189
            (signal
             (bvor (signal-value btor1187) (signal-value btor1188))
             (list)))
           (btor1190
            (signal
             (apply bvand (bitvector->bits (signal-value btor1189)))
             (signal-state btor1189)))
           (btor1191
            (signal
             (apply bvor (bitvector->bits (signal-value btor309)))
             (signal-state btor309)))
           (btor1192 (signal (bvnot (signal-value btor1191)) (list)))
           (btor1193
            (if (bitvector->bool (signal-value btor1192)) btor1190 btor347))
           (btor1195
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1195")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1195"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1195")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1195")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1196
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1196")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1196"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1196")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1196")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1198
            (if (bitvector->bool (signal-value btor346)) btor1196 btor1195))
           (btor1199
            (signal
             (extract 53 0 (signal-value btor268))
             (signal-state btor268)))
           (btor1200 (bv->signal (bv 23 (bitvector 5))))
           (btor1201
            (signal
             (bool->bitvector
              (bveq (signal-value btor269) (signal-value btor1200)))
             (list)))
           (btor1202
            (if (bitvector->bool (signal-value btor1201)) btor1199 btor912))
           (btor1203
            (signal
             (bvxor (signal-value btor1187) (signal-value btor1202))
             (list)))
           (btor1204 (signal (bvnot (signal-value btor1203)) (list)))
           (btor1205
            (signal
             (extract 53 0 (signal-value btor230))
             (signal-state btor230)))
           (btor1206
            (signal
             (bool->bitvector
              (bveq (signal-value btor231) (signal-value btor1200)))
             (list)))
           (btor1207
            (if (bitvector->bool (signal-value btor1206)) btor1205 btor912))
           (btor1208
            (signal
             (bvor (signal-value btor1204) (signal-value btor1207))
             (list)))
           (btor1209
            (signal
             (apply bvand (bitvector->bits (signal-value btor1208)))
             (signal-state btor1208)))
           (btor1210
            (if (bitvector->bool (signal-value btor1192)) btor1209 btor1198))
           (btor1212
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1212")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1212"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1212")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1212")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1213
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1213")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1213"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1213")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1213")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1215
            (if (bitvector->bool (signal-value btor346)) btor1213 btor1212))
           (btor1216
            (signal
             (bvor (signal-value btor1203) (signal-value btor1207))
             (list)))
           (btor1217
            (signal
             (apply bvand (bitvector->bits (signal-value btor1216)))
             (signal-state btor1216)))
           (btor1218
            (if (bitvector->bool (signal-value btor1192)) btor1217 btor1215))
           (btor1220
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1220")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1220"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1220")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1220")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1221
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1221")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1221"))))))
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
           (btor1223
            (if (bitvector->bool (signal-value btor346)) btor1221 btor1220))
           (btor1224
            (signal
             (apply bvor (bitvector->bits (signal-value btor1187)))
             (signal-state btor1187)))
           (btor1225 (signal (bvnot (signal-value btor1224)) (list)))
           (btor1226
            (if (bitvector->bool (signal-value btor1192)) btor1225 btor1223))
           (btor1228
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1228")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1228"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1228")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1228")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1229
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1229")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1229"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1229")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1229")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1231
            (if (bitvector->bool (signal-value btor346)) btor1229 btor1228))
           (btor1232 (signal (bvnot (signal-value btor1187)) (list)))
           (btor1233
            (signal
             (bvor (signal-value btor1232) (signal-value btor1188))
             (list)))
           (btor1234
            (signal
             (apply bvand (bitvector->bits (signal-value btor1233)))
             (signal-state btor1233)))
           (btor1235
            (if (bitvector->bool (signal-value btor1192)) btor1234 btor1231))
           (btor1237
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1237")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1237"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1237")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1237")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1238
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1238")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1238"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1238")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1238")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1240
            (if (bitvector->bool (signal-value btor346)) btor1238 btor1237))
           (btor1241
            (signal
             (bvor (signal-value btor1234) (signal-value btor1190))
             (list)))
           (btor1242 (signal (bvnot (signal-value btor1241)) (list)))
           (btor1243
            (signal
             (bvand (signal-value btor1235) (signal-value btor1242))
             (list)))
           (btor1244
            (if (bitvector->bool (signal-value btor1192)) btor1243 btor1240))
           (btor1246
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1246")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1246"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1246")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1246")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1247
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1247")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1247"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1247")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1247")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1249
            (if (bitvector->bool (signal-value btor346)) btor1247 btor1246))
           (btor1250 (bv->signal (bv 0 (bitvector 53))))
           (btor1251
            (signal
             (extract 51 0 (signal-value btor1144))
             (signal-state btor1144)))
           (btor1252
            (bv->signal
             (zero-extend (signal-value btor1251) (bitvector 53))
             btor1251))
           (btor1253
            (signal
             (extract 51 0 (signal-value btor750))
             (signal-state btor750)))
           (btor1254
            (bv->signal
             (zero-extend (signal-value btor1253) (bitvector 53))
             btor1253))
           (btor1255
            (signal
             (bvadd (signal-value btor1252) (signal-value btor1254))
             (list)))
           (btor1256
            (signal
             (extract 51 0 (signal-value btor971))
             (signal-state btor971)))
           (btor1257
            (bv->signal
             (zero-extend (signal-value btor1256) (bitvector 53))
             btor1256))
           (btor1258
            (signal
             (bvadd (signal-value btor1255) (signal-value btor1257))
             (list)))
           (btor1259
            (if (bitvector->bool (signal-value btor1148)) btor1258 btor1250))
           (btor1260
            (bv->signal
             (zero-extend (signal-value btor1251) (bitvector 53))
             btor1251))
           (btor1261
            (bv->signal
             (zero-extend (signal-value btor1253) (bitvector 53))
             btor1253))
           (btor1262
            (signal
             (bvsub (signal-value btor1260) (signal-value btor1261))
             (list)))
           (btor1263
            (bv->signal
             (zero-extend (signal-value btor1256) (bitvector 53))
             btor1256))
           (btor1264
            (signal
             (bvadd (signal-value btor1262) (signal-value btor1263))
             (list)))
           (btor1265
            (if (bitvector->bool (signal-value btor1162)) btor1264 btor1259))
           (btor1266
            (bv->signal
             (zero-extend (signal-value btor1256) (bitvector 53))
             btor1256))
           (btor1267
            (signal
             (bvsub (signal-value btor1255) (signal-value btor1266))
             (list)))
           (btor1268
            (bv->signal
             (zero-extend (signal-value btor1256) (bitvector 53))
             btor1256))
           (btor1269
            (signal
             (bvsub (signal-value btor1262) (signal-value btor1268))
             (list)))
           (btor1270
            (if (bitvector->bool (signal-value btor1158)) btor1269 btor1267))
           (btor1271
            (signal
             (bvor (signal-value btor1154) (signal-value btor1158))
             (list)))
           (btor1272
            (if (bitvector->bool (signal-value btor1271)) btor1270 btor1265))
           (btor1273
            (signal
             (extract 52 52 (signal-value btor1272))
             (signal-state btor1272)))
           (btor1274
            (signal
             (bvand (signal-value btor317) (signal-value btor318))
             (list)))
           (btor1275 (signal (bvnot (signal-value btor1274)) (list)))
           (btor1276
            (bv->signal
             (zero-extend (signal-value btor1160) (bitvector 5))
             btor1160))
           (btor1277
            (signal
             (bool->bitvector
              (bveq (signal-value btor191) (signal-value btor1276)))
             (list)))
           (btor1278
            (if (bitvector->bool (signal-value btor1277)) btor320 btor1275))
           (btor1279
            (if (bitvector->bool (signal-value btor1278)) btor1273 btor1242))
           (btor1280
            (if (bitvector->bool (signal-value btor1192)) btor1279 btor1249))
           (btor1282
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1282")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1282"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1282")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1282")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1283
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1283")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1283"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1283")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1283")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1285
            (bv->signal
             (zero-extend (signal-value btor324) (bitvector 5))
             btor324))
           (btor1286
            (signal
             (bool->bitvector
              (bveq (signal-value btor306) (signal-value btor1285)))
             (list)))
           (btor1287
            (if (bitvector->bool (signal-value btor1286)) btor189 btor186))
           (btor1288
            (bv->signal
             (zero-extend (signal-value btor328) (bitvector 5))
             btor328))
           (btor1289
            (signal
             (bool->bitvector
              (bveq (signal-value btor306) (signal-value btor1288)))
             (list)))
           (btor1290
            (if (bitvector->bool (signal-value btor1289)) btor188 btor1287))
           (btor1291
            (bv->signal
             (zero-extend (signal-value btor332) (bitvector 5))
             btor332))
           (btor1292
            (signal
             (bool->bitvector
              (bveq (signal-value btor306) (signal-value btor1291)))
             (list)))
           (btor1293
            (if (bitvector->bool (signal-value btor1292)) btor187 btor1290))
           (btor1294
            (bv->signal
             (zero-extend (signal-value btor336) (bitvector 5))
             btor336))
           (btor1295
            (signal
             (bool->bitvector
              (bveq (signal-value btor306) (signal-value btor1294)))
             (list)))
           (btor1296
            (if (bitvector->bool (signal-value btor1295)) btor186 btor1293))
           (btor1297
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1297")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1297"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1297")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1297")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1299
            (signal
             (concat (signal-value btor1297) (signal-value btor1296))
             (list)))
           (btor1300
            (bv->signal
             (zero-extend (signal-value btor340) (bitvector 2))
             btor340))
           (btor1301
            (signal
             (bool->bitvector
              (bveq (signal-value btor1299) (signal-value btor1300)))
             (list)))
           (btor1302
            (if (bitvector->bool (signal-value btor1301)) btor1283 btor1282))
           (btor1303
            (signal
             (extract 17 0 (signal-value btor1187))
             (signal-state btor1187)))
           (btor1304
            (signal
             (apply bvor (bitvector->bits (signal-value btor306)))
             (signal-state btor306)))
           (btor1305 (signal (bvnot (signal-value btor1304)) (list)))
           (btor1306
            (if (bitvector->bool (signal-value btor1305)) btor1303 btor1302))
           (btor1307
            (signal
             (extract 0 0 (signal-value btor1306))
             (signal-state btor1306)))
           (btor1309
            (signal
             (extract 1 1 (signal-value btor1306))
             (signal-state btor1306)))
           (btor1311
            (signal
             (extract 10 10 (signal-value btor1306))
             (signal-state btor1306)))
           (btor1313
            (signal
             (extract 11 11 (signal-value btor1306))
             (signal-state btor1306)))
           (btor1315
            (signal
             (extract 12 12 (signal-value btor1306))
             (signal-state btor1306)))
           (btor1317
            (signal
             (extract 13 13 (signal-value btor1306))
             (signal-state btor1306)))
           (btor1319
            (signal
             (extract 14 14 (signal-value btor1306))
             (signal-state btor1306)))
           (btor1321
            (signal
             (extract 15 15 (signal-value btor1306))
             (signal-state btor1306)))
           (btor1323
            (signal
             (extract 16 16 (signal-value btor1306))
             (signal-state btor1306)))
           (btor1325
            (signal
             (extract 17 17 (signal-value btor1306))
             (signal-state btor1306)))
           (btor1327
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1327")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1327"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1327")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1327")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 36))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1328 (bv->signal (bv 0 (bitvector 36))))
           (btor1329
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1329")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1329"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1329")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1329")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 36))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1331
            (bv->signal
             (zero-extend (signal-value btor324) (bitvector 5))
             btor324))
           (btor1332
            (signal
             (bool->bitvector
              (bveq (signal-value btor309) (signal-value btor1331)))
             (list)))
           (btor1333
            (if (bitvector->bool (signal-value btor1332)) btor189 btor186))
           (btor1334
            (bv->signal
             (zero-extend (signal-value btor328) (bitvector 5))
             btor328))
           (btor1335
            (signal
             (bool->bitvector
              (bveq (signal-value btor309) (signal-value btor1334)))
             (list)))
           (btor1336
            (if (bitvector->bool (signal-value btor1335)) btor188 btor1333))
           (btor1337
            (bv->signal
             (zero-extend (signal-value btor332) (bitvector 5))
             btor332))
           (btor1338
            (signal
             (bool->bitvector
              (bveq (signal-value btor309) (signal-value btor1337)))
             (list)))
           (btor1339
            (if (bitvector->bool (signal-value btor1338)) btor187 btor1336))
           (btor1340
            (bv->signal
             (zero-extend (signal-value btor336) (bitvector 5))
             btor336))
           (btor1341
            (signal
             (bool->bitvector
              (bveq (signal-value btor309) (signal-value btor1340)))
             (list)))
           (btor1342
            (if (bitvector->bool (signal-value btor1341)) btor186 btor1339))
           (btor1343
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1343")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1343"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1343")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1343")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1345
            (signal
             (concat (signal-value btor1343) (signal-value btor1342))
             (list)))
           (btor1346
            (bv->signal
             (zero-extend (signal-value btor340) (bitvector 2))
             btor340))
           (btor1347
            (signal
             (bool->bitvector
              (bveq (signal-value btor1345) (signal-value btor1346)))
             (list)))
           (btor1348
            (if (bitvector->bool (signal-value btor1347)) btor1329 btor1327))
           (btor1349
            (signal
             (extract 53 18 (signal-value btor1187))
             (signal-state btor1187)))
           (btor1350
            (if (bitvector->bool (signal-value btor1192)) btor1349 btor1348))
           (btor1351
            (signal
             (extract 0 0 (signal-value btor1350))
             (signal-state btor1350)))
           (btor1353
            (signal
             (extract 1 1 (signal-value btor1350))
             (signal-state btor1350)))
           (btor1355
            (signal
             (extract 2 2 (signal-value btor1306))
             (signal-state btor1306)))
           (btor1357
            (signal
             (extract 2 2 (signal-value btor1350))
             (signal-state btor1350)))
           (btor1359
            (signal
             (extract 3 3 (signal-value btor1350))
             (signal-state btor1350)))
           (btor1361
            (signal
             (extract 4 4 (signal-value btor1350))
             (signal-state btor1350)))
           (btor1363
            (signal
             (extract 5 5 (signal-value btor1350))
             (signal-state btor1350)))
           (btor1365
            (signal
             (extract 6 6 (signal-value btor1350))
             (signal-state btor1350)))
           (btor1367
            (signal
             (extract 7 7 (signal-value btor1350))
             (signal-state btor1350)))
           (btor1369
            (signal
             (extract 8 8 (signal-value btor1350))
             (signal-state btor1350)))
           (btor1371
            (signal
             (extract 9 9 (signal-value btor1350))
             (signal-state btor1350)))
           (btor1373
            (signal
             (extract 10 10 (signal-value btor1350))
             (signal-state btor1350)))
           (btor1375
            (signal
             (extract 11 11 (signal-value btor1350))
             (signal-state btor1350)))
           (btor1377
            (signal
             (extract 3 3 (signal-value btor1306))
             (signal-state btor1306)))
           (btor1379
            (signal
             (extract 12 12 (signal-value btor1350))
             (signal-state btor1350)))
           (btor1381
            (signal
             (extract 13 13 (signal-value btor1350))
             (signal-state btor1350)))
           (btor1383
            (signal
             (extract 14 14 (signal-value btor1350))
             (signal-state btor1350)))
           (btor1385
            (signal
             (extract 15 15 (signal-value btor1350))
             (signal-state btor1350)))
           (btor1387
            (signal
             (extract 16 16 (signal-value btor1350))
             (signal-state btor1350)))
           (btor1389
            (signal
             (extract 17 17 (signal-value btor1350))
             (signal-state btor1350)))
           (btor1391
            (signal
             (extract 18 18 (signal-value btor1350))
             (signal-state btor1350)))
           (btor1393
            (signal
             (extract 19 19 (signal-value btor1350))
             (signal-state btor1350)))
           (btor1395
            (signal
             (extract 20 20 (signal-value btor1350))
             (signal-state btor1350)))
           (btor1397
            (signal
             (extract 21 21 (signal-value btor1350))
             (signal-state btor1350)))
           (btor1399
            (signal
             (extract 4 4 (signal-value btor1306))
             (signal-state btor1306)))
           (btor1401
            (signal
             (extract 22 22 (signal-value btor1350))
             (signal-state btor1350)))
           (btor1403
            (signal
             (extract 23 23 (signal-value btor1350))
             (signal-state btor1350)))
           (btor1405
            (signal
             (extract 24 24 (signal-value btor1350))
             (signal-state btor1350)))
           (btor1407
            (signal
             (extract 25 25 (signal-value btor1350))
             (signal-state btor1350)))
           (btor1409
            (signal
             (extract 26 26 (signal-value btor1350))
             (signal-state btor1350)))
           (btor1411
            (signal
             (extract 27 27 (signal-value btor1350))
             (signal-state btor1350)))
           (btor1413
            (signal
             (extract 28 28 (signal-value btor1350))
             (signal-state btor1350)))
           (btor1415
            (signal
             (extract 29 29 (signal-value btor1350))
             (signal-state btor1350)))
           (btor1417
            (signal
             (extract 30 30 (signal-value btor1350))
             (signal-state btor1350)))
           (btor1419
            (signal
             (extract 31 31 (signal-value btor1350))
             (signal-state btor1350)))
           (btor1421
            (signal
             (extract 5 5 (signal-value btor1306))
             (signal-state btor1306)))
           (btor1423
            (signal
             (extract 32 32 (signal-value btor1350))
             (signal-state btor1350)))
           (btor1425
            (signal
             (extract 33 33 (signal-value btor1350))
             (signal-state btor1350)))
           (btor1427
            (signal
             (extract 34 34 (signal-value btor1350))
             (signal-state btor1350)))
           (btor1429
            (signal
             (extract 35 35 (signal-value btor1350))
             (signal-state btor1350)))
           (btor1431
            (signal
             (extract 6 6 (signal-value btor1306))
             (signal-state btor1306)))
           (btor1433
            (signal
             (extract 7 7 (signal-value btor1306))
             (signal-state btor1306)))
           (btor1435
            (signal
             (extract 8 8 (signal-value btor1306))
             (signal-state btor1306)))
           (btor1437
            (signal
             (extract 9 9 (signal-value btor1306))
             (signal-state btor1306)))
           (btor1439
            (signal
             (bvor (signal-value btor317) (signal-value btor318))
             (list)))
           (btor1441
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1441")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1441"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1441")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1441")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1442
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1442")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1442"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1442")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1442")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1444
            (if (bitvector->bool (signal-value btor346)) btor1442 btor1441))
           (btor1445
            (signal
             (bvand (signal-value btor1193) (signal-value btor1242))
             (list)))
           (btor1446
            (if (bitvector->bool (signal-value btor1192)) btor1445 btor1444))
           (btor1448
            (bv->signal
             (zero-extend (signal-value btor128) (bitvector 1))
             btor128))
           (btor1449
            (bv->signal
             (zero-extend (signal-value btor129) (bitvector 1))
             btor129))
           (btor1450
            (bv->signal
             (zero-extend (signal-value btor130) (bitvector 1))
             btor130))
           (btor1451
            (bv->signal
             (zero-extend (signal-value btor131) (bitvector 1))
             btor131))
           (btor1452
            (bv->signal
             (zero-extend (signal-value btor186) (bitvector 1))
             btor186))
           (btor1453
            (bv->signal
             (zero-extend (signal-value btor187) (bitvector 1))
             btor187))
           (btor1454
            (bv->signal
             (zero-extend (signal-value btor188) (bitvector 1))
             btor188))
           (btor1455
            (bv->signal
             (zero-extend (signal-value btor189) (bitvector 1))
             btor189))
           (btor1456
            (bv->signal
             (zero-extend (signal-value btor312) (bitvector 1))
             btor312))
           (btor1457
            (bv->signal
             (zero-extend (signal-value btor313) (bitvector 1))
             btor313))
           (btor1458
            (bv->signal
             (zero-extend (signal-value btor314) (bitvector 1))
             btor314))
           (btor1459
            (bv->signal
             (zero-extend (signal-value btor315) (bitvector 1))
             btor315))
           (btor1460
            (bv->signal
             (zero-extend (signal-value btor1144) (bitvector 54))
             btor1144))
           (btor1461
            (signal (concat (signal-value btor3) (signal-value btor2)) (list)))
           (btor1462
            (signal
             (concat (signal-value btor14) (signal-value btor1461))
             (list)))
           (btor1463
            (signal
             (concat (signal-value btor25) (signal-value btor1462))
             (list)))
           (btor1464
            (signal
             (concat (signal-value btor32) (signal-value btor1463))
             (list)))
           (btor1465
            (signal
             (concat (signal-value btor33) (signal-value btor1464))
             (list)))
           (btor1466
            (signal
             (concat (signal-value btor34) (signal-value btor1465))
             (list)))
           (btor1467
            (signal
             (concat (signal-value btor35) (signal-value btor1466))
             (list)))
           (btor1468
            (signal
             (concat (signal-value btor36) (signal-value btor1467))
             (list)))
           (btor1469
            (signal
             (concat (signal-value btor37) (signal-value btor1468))
             (list)))
           (btor1470
            (signal
             (concat (signal-value btor4) (signal-value btor1469))
             (list)))
           (btor1471
            (signal
             (concat (signal-value btor5) (signal-value btor1470))
             (list)))
           (btor1472
            (signal
             (concat (signal-value btor6) (signal-value btor1471))
             (list)))
           (btor1473
            (signal
             (concat (signal-value btor7) (signal-value btor1472))
             (list)))
           (btor1474
            (signal
             (concat (signal-value btor8) (signal-value btor1473))
             (list)))
           (btor1475
            (signal
             (concat (signal-value btor9) (signal-value btor1474))
             (list)))
           (btor1476
            (signal
             (concat (signal-value btor10) (signal-value btor1475))
             (list)))
           (btor1477
            (signal
             (concat (signal-value btor11) (signal-value btor1476))
             (list)))
           (btor1478
            (signal
             (concat (signal-value btor12) (signal-value btor1477))
             (list)))
           (btor1479
            (signal
             (concat (signal-value btor13) (signal-value btor1478))
             (list)))
           (btor1480
            (signal
             (concat (signal-value btor15) (signal-value btor1479))
             (list)))
           (btor1481
            (signal
             (concat (signal-value btor16) (signal-value btor1480))
             (list)))
           (btor1482
            (signal
             (concat (signal-value btor17) (signal-value btor1481))
             (list)))
           (btor1483
            (signal
             (concat (signal-value btor18) (signal-value btor1482))
             (list)))
           (btor1484
            (signal
             (concat (signal-value btor19) (signal-value btor1483))
             (list)))
           (btor1485
            (signal
             (concat (signal-value btor20) (signal-value btor1484))
             (list)))
           (btor1486
            (signal
             (concat (signal-value btor21) (signal-value btor1485))
             (list)))
           (btor1487
            (signal
             (concat (signal-value btor22) (signal-value btor1486))
             (list)))
           (btor1488
            (signal
             (concat (signal-value btor23) (signal-value btor1487))
             (list)))
           (btor1489
            (signal
             (concat (signal-value btor24) (signal-value btor1488))
             (list)))
           (btor1490
            (signal
             (concat (signal-value btor26) (signal-value btor1489))
             (list)))
           (btor1491
            (signal
             (concat (signal-value btor27) (signal-value btor1490))
             (list)))
           (btor1492
            (signal
             (concat (signal-value btor28) (signal-value btor1491))
             (list)))
           (btor1493
            (signal
             (concat (signal-value btor29) (signal-value btor1492))
             (list)))
           (btor1494
            (signal
             (concat (signal-value btor30) (signal-value btor1493))
             (list)))
           (btor1495
            (signal
             (concat (signal-value btor31) (signal-value btor1494))
             (list)))
           (btor1496
            (bv->signal
             (zero-extend (signal-value btor1495) (bitvector 36))
             btor1495))
           (btor1497
            (bv->signal
             (zero-extend (signal-value btor750) (bitvector 54))
             btor750))
           (btor1498
            (signal
             (concat (signal-value btor39) (signal-value btor38))
             (list)))
           (btor1499
            (signal
             (concat (signal-value btor50) (signal-value btor1498))
             (list)))
           (btor1500
            (signal
             (concat (signal-value btor61) (signal-value btor1499))
             (list)))
           (btor1501
            (signal
             (concat (signal-value btor68) (signal-value btor1500))
             (list)))
           (btor1502
            (signal
             (concat (signal-value btor69) (signal-value btor1501))
             (list)))
           (btor1503
            (signal
             (concat (signal-value btor70) (signal-value btor1502))
             (list)))
           (btor1504
            (signal
             (concat (signal-value btor71) (signal-value btor1503))
             (list)))
           (btor1505
            (signal
             (concat (signal-value btor72) (signal-value btor1504))
             (list)))
           (btor1506
            (signal
             (concat (signal-value btor73) (signal-value btor1505))
             (list)))
           (btor1507
            (signal
             (concat (signal-value btor40) (signal-value btor1506))
             (list)))
           (btor1508
            (signal
             (concat (signal-value btor41) (signal-value btor1507))
             (list)))
           (btor1509
            (signal
             (concat (signal-value btor42) (signal-value btor1508))
             (list)))
           (btor1510
            (signal
             (concat (signal-value btor43) (signal-value btor1509))
             (list)))
           (btor1511
            (signal
             (concat (signal-value btor44) (signal-value btor1510))
             (list)))
           (btor1512
            (signal
             (concat (signal-value btor45) (signal-value btor1511))
             (list)))
           (btor1513
            (signal
             (concat (signal-value btor46) (signal-value btor1512))
             (list)))
           (btor1514
            (signal
             (concat (signal-value btor47) (signal-value btor1513))
             (list)))
           (btor1515
            (signal
             (concat (signal-value btor48) (signal-value btor1514))
             (list)))
           (btor1516
            (signal
             (concat (signal-value btor49) (signal-value btor1515))
             (list)))
           (btor1517
            (signal
             (concat (signal-value btor51) (signal-value btor1516))
             (list)))
           (btor1518
            (signal
             (concat (signal-value btor52) (signal-value btor1517))
             (list)))
           (btor1519
            (signal
             (concat (signal-value btor53) (signal-value btor1518))
             (list)))
           (btor1520
            (signal
             (concat (signal-value btor54) (signal-value btor1519))
             (list)))
           (btor1521
            (signal
             (concat (signal-value btor55) (signal-value btor1520))
             (list)))
           (btor1522
            (signal
             (concat (signal-value btor56) (signal-value btor1521))
             (list)))
           (btor1523
            (signal
             (concat (signal-value btor57) (signal-value btor1522))
             (list)))
           (btor1524
            (signal
             (concat (signal-value btor58) (signal-value btor1523))
             (list)))
           (btor1525
            (signal
             (concat (signal-value btor59) (signal-value btor1524))
             (list)))
           (btor1526
            (signal
             (concat (signal-value btor60) (signal-value btor1525))
             (list)))
           (btor1527
            (signal
             (concat (signal-value btor62) (signal-value btor1526))
             (list)))
           (btor1528
            (signal
             (concat (signal-value btor63) (signal-value btor1527))
             (list)))
           (btor1529
            (signal
             (concat (signal-value btor64) (signal-value btor1528))
             (list)))
           (btor1530
            (signal
             (concat (signal-value btor65) (signal-value btor1529))
             (list)))
           (btor1531
            (signal
             (concat (signal-value btor66) (signal-value btor1530))
             (list)))
           (btor1532
            (signal
             (concat (signal-value btor67) (signal-value btor1531))
             (list)))
           (btor1533
            (bv->signal
             (zero-extend (signal-value btor1532) (bitvector 36))
             btor1532))
           (btor1534
            (bv->signal
             (zero-extend (signal-value btor971) (bitvector 54))
             btor971))
           (btor1535
            (signal
             (concat (signal-value btor75) (signal-value btor74))
             (list)))
           (btor1536
            (signal
             (concat (signal-value btor86) (signal-value btor1535))
             (list)))
           (btor1537
            (signal
             (concat (signal-value btor97) (signal-value btor1536))
             (list)))
           (btor1538
            (signal
             (concat (signal-value btor108) (signal-value btor1537))
             (list)))
           (btor1539
            (signal
             (concat (signal-value btor119) (signal-value btor1538))
             (list)))
           (btor1540
            (signal
             (concat (signal-value btor124) (signal-value btor1539))
             (list)))
           (btor1541
            (signal
             (concat (signal-value btor125) (signal-value btor1540))
             (list)))
           (btor1542
            (signal
             (concat (signal-value btor126) (signal-value btor1541))
             (list)))
           (btor1543
            (signal
             (concat (signal-value btor127) (signal-value btor1542))
             (list)))
           (btor1544
            (signal
             (concat (signal-value btor76) (signal-value btor1543))
             (list)))
           (btor1545
            (signal
             (concat (signal-value btor77) (signal-value btor1544))
             (list)))
           (btor1546
            (signal
             (concat (signal-value btor78) (signal-value btor1545))
             (list)))
           (btor1547
            (signal
             (concat (signal-value btor79) (signal-value btor1546))
             (list)))
           (btor1548
            (signal
             (concat (signal-value btor80) (signal-value btor1547))
             (list)))
           (btor1549
            (signal
             (concat (signal-value btor81) (signal-value btor1548))
             (list)))
           (btor1550
            (signal
             (concat (signal-value btor82) (signal-value btor1549))
             (list)))
           (btor1551
            (signal
             (concat (signal-value btor83) (signal-value btor1550))
             (list)))
           (btor1552
            (signal
             (concat (signal-value btor84) (signal-value btor1551))
             (list)))
           (btor1553
            (signal
             (concat (signal-value btor85) (signal-value btor1552))
             (list)))
           (btor1554
            (signal
             (concat (signal-value btor87) (signal-value btor1553))
             (list)))
           (btor1555
            (signal
             (concat (signal-value btor88) (signal-value btor1554))
             (list)))
           (btor1556
            (signal
             (concat (signal-value btor89) (signal-value btor1555))
             (list)))
           (btor1557
            (signal
             (concat (signal-value btor90) (signal-value btor1556))
             (list)))
           (btor1558
            (signal
             (concat (signal-value btor91) (signal-value btor1557))
             (list)))
           (btor1559
            (signal
             (concat (signal-value btor92) (signal-value btor1558))
             (list)))
           (btor1560
            (signal
             (concat (signal-value btor93) (signal-value btor1559))
             (list)))
           (btor1561
            (signal
             (concat (signal-value btor94) (signal-value btor1560))
             (list)))
           (btor1562
            (signal
             (concat (signal-value btor95) (signal-value btor1561))
             (list)))
           (btor1563
            (signal
             (concat (signal-value btor96) (signal-value btor1562))
             (list)))
           (btor1564
            (signal
             (concat (signal-value btor98) (signal-value btor1563))
             (list)))
           (btor1565
            (signal
             (concat (signal-value btor99) (signal-value btor1564))
             (list)))
           (btor1566
            (signal
             (concat (signal-value btor100) (signal-value btor1565))
             (list)))
           (btor1567
            (signal
             (concat (signal-value btor101) (signal-value btor1566))
             (list)))
           (btor1568
            (signal
             (concat (signal-value btor102) (signal-value btor1567))
             (list)))
           (btor1569
            (signal
             (concat (signal-value btor103) (signal-value btor1568))
             (list)))
           (btor1570
            (signal
             (concat (signal-value btor104) (signal-value btor1569))
             (list)))
           (btor1571
            (signal
             (concat (signal-value btor105) (signal-value btor1570))
             (list)))
           (btor1572
            (signal
             (concat (signal-value btor106) (signal-value btor1571))
             (list)))
           (btor1573
            (signal
             (concat (signal-value btor107) (signal-value btor1572))
             (list)))
           (btor1574
            (signal
             (concat (signal-value btor109) (signal-value btor1573))
             (list)))
           (btor1575
            (signal
             (concat (signal-value btor110) (signal-value btor1574))
             (list)))
           (btor1576
            (signal
             (concat (signal-value btor111) (signal-value btor1575))
             (list)))
           (btor1577
            (signal
             (concat (signal-value btor112) (signal-value btor1576))
             (list)))
           (btor1578
            (signal
             (concat (signal-value btor113) (signal-value btor1577))
             (list)))
           (btor1579
            (signal
             (concat (signal-value btor114) (signal-value btor1578))
             (list)))
           (btor1580
            (signal
             (concat (signal-value btor115) (signal-value btor1579))
             (list)))
           (btor1581
            (signal
             (concat (signal-value btor116) (signal-value btor1580))
             (list)))
           (btor1582
            (signal
             (concat (signal-value btor117) (signal-value btor1581))
             (list)))
           (btor1583
            (signal
             (concat (signal-value btor118) (signal-value btor1582))
             (list)))
           (btor1584
            (signal
             (concat (signal-value btor120) (signal-value btor1583))
             (list)))
           (btor1585
            (signal
             (concat (signal-value btor121) (signal-value btor1584))
             (list)))
           (btor1586
            (signal
             (concat (signal-value btor122) (signal-value btor1585))
             (list)))
           (btor1587
            (signal
             (concat (signal-value btor123) (signal-value btor1586))
             (list)))
           (btor1588
            (bv->signal
             (zero-extend (signal-value btor1587) (bitvector 54))
             btor1587))
           (btor1589
            (bv->signal
             (zero-extend (signal-value btor911) (bitvector 27))
             btor911))
           (btor1590
            (bv->signal
             (zero-extend (signal-value btor707) (bitvector 27))
             btor707))
           (btor1591
            (bv->signal
             (zero-extend (signal-value btor912) (bitvector 54))
             btor912))
           (btor1592
            (bv->signal
             (zero-extend (signal-value btor882) (bitvector 27))
             btor882))
           (btor1593
            (bv->signal
             (zero-extend (signal-value btor678) (bitvector 27))
             btor678))
           (btor1594
            (bv->signal
             (zero-extend (signal-value btor882) (bitvector 27))
             btor882))
           (btor1595
            (bv->signal
             (zero-extend (signal-value btor678) (bitvector 27))
             btor678))
           (btor1596
            (bv->signal
             (zero-extend (signal-value btor804) (bitvector 54))
             btor804))
           (btor1597
            (bv->signal
             (zero-extend (signal-value btor861) (bitvector 54))
             btor861))
           (btor1598
            (bv->signal
             (zero-extend (signal-value btor1242) (bitvector 1))
             btor1242))
           (btor1599
            (bv->signal
             (zero-extend (signal-value btor1193) (bitvector 1))
             btor1193))
           (btor1600
            (bv->signal
             (zero-extend (signal-value btor347) (bitvector 1))
             btor347))
           (btor1601
            (bv->signal
             (zero-extend (signal-value btor1190) (bitvector 1))
             btor1190))
           (btor1602
            (bv->signal
             (zero-extend (signal-value btor347) (bitvector 1))
             btor347))
           (btor1603
            (bv->signal
             (zero-extend (signal-value btor1210) (bitvector 1))
             btor1210))
           (btor1604
            (bv->signal
             (zero-extend (signal-value btor1198) (bitvector 1))
             btor1198))
           (btor1605
            (bv->signal
             (zero-extend (signal-value btor1209) (bitvector 1))
             btor1209))
           (btor1606
            (bv->signal
             (zero-extend (signal-value btor1198) (bitvector 1))
             btor1198))
           (btor1607
            (bv->signal
             (zero-extend (signal-value btor1218) (bitvector 1))
             btor1218))
           (btor1608
            (bv->signal
             (zero-extend (signal-value btor1215) (bitvector 1))
             btor1215))
           (btor1609
            (bv->signal
             (zero-extend (signal-value btor1217) (bitvector 1))
             btor1217))
           (btor1610
            (bv->signal
             (zero-extend (signal-value btor1215) (bitvector 1))
             btor1215))
           (btor1611
            (bv->signal
             (zero-extend (signal-value btor1226) (bitvector 1))
             btor1226))
           (btor1612
            (bv->signal
             (zero-extend (signal-value btor1223) (bitvector 1))
             btor1223))
           (btor1613
            (bv->signal
             (zero-extend (signal-value btor1225) (bitvector 1))
             btor1225))
           (btor1614
            (bv->signal
             (zero-extend (signal-value btor1223) (bitvector 1))
             btor1223))
           (btor1615
            (bv->signal
             (zero-extend (signal-value btor1235) (bitvector 1))
             btor1235))
           (btor1616
            (bv->signal
             (zero-extend (signal-value btor1231) (bitvector 1))
             btor1231))
           (btor1617
            (bv->signal
             (zero-extend (signal-value btor1234) (bitvector 1))
             btor1234))
           (btor1618
            (bv->signal
             (zero-extend (signal-value btor1231) (bitvector 1))
             btor1231))
           (btor1619 (bv->signal (bv 17 (bitvector 5))))
           (btor1620
            (signal
             (bool->bitvector
              (bveq (signal-value btor282) (signal-value btor1619)))
             (list)))
           (btor1621
            (if (bitvector->bool (signal-value btor1620)) btor131 btor128))
           (btor1622 (bv->signal (bv 16 (bitvector 5))))
           (btor1623
            (signal
             (bool->bitvector
              (bveq (signal-value btor282) (signal-value btor1622)))
             (list)))
           (btor1624
            (if (bitvector->bool (signal-value btor1623)) btor130 btor1621))
           (btor1625 (bv->signal (bv 15 (bitvector 4))))
           (btor1626
            (bv->signal
             (zero-extend (signal-value btor1625) (bitvector 5))
             btor1625))
           (btor1627
            (signal
             (bool->bitvector
              (bveq (signal-value btor282) (signal-value btor1626)))
             (list)))
           (btor1628
            (if (bitvector->bool (signal-value btor1627)) btor129 btor1624))
           (btor1629
            (bv->signal
             (zero-extend (signal-value btor340) (bitvector 5))
             btor340))
           (btor1630
            (signal
             (bool->bitvector
              (bveq (signal-value btor282) (signal-value btor1629)))
             (list)))
           (btor1631
            (if (bitvector->bool (signal-value btor1630)) btor128 btor1628))
           (btor1632
            (bv->signal
             (zero-extend (signal-value btor1631) (bitvector 1))
             btor1631))
           (btor1633
            (bv->signal
             (zero-extend (signal-value btor339) (bitvector 1))
             btor339))
           (btor1634 (bv->signal (bv 20 (bitvector 5))))
           (btor1635
            (signal
             (bool->bitvector
              (bveq (signal-value btor284) (signal-value btor1634)))
             (list)))
           (btor1636
            (if (bitvector->bool (signal-value btor1635)) btor315 btor312))
           (btor1637 (bv->signal (bv 19 (bitvector 5))))
           (btor1638
            (signal
             (bool->bitvector
              (bveq (signal-value btor284) (signal-value btor1637)))
             (list)))
           (btor1639
            (if (bitvector->bool (signal-value btor1638)) btor314 btor1636))
           (btor1640 (bv->signal (bv 18 (bitvector 5))))
           (btor1641
            (signal
             (bool->bitvector
              (bveq (signal-value btor284) (signal-value btor1640)))
             (list)))
           (btor1642
            (if (bitvector->bool (signal-value btor1641)) btor313 btor1639))
           (btor1643
            (bv->signal
             (zero-extend (signal-value btor747) (bitvector 5))
             btor747))
           (btor1644
            (signal
             (bool->bitvector
              (bveq (signal-value btor284) (signal-value btor1643)))
             (list)))
           (btor1645
            (if (bitvector->bool (signal-value btor1644)) btor312 btor1642))
           (btor1646
            (bv->signal
             (zero-extend (signal-value btor1645) (bitvector 1))
             btor1645))
           (btor1647
            (signal
             (bool->bitvector
              (bveq (signal-value btor285) (signal-value btor1619)))
             (list)))
           (btor1648
            (if (bitvector->bool (signal-value btor1647)) btor131 btor128))
           (btor1649
            (signal
             (bool->bitvector
              (bveq (signal-value btor285) (signal-value btor1622)))
             (list)))
           (btor1650
            (if (bitvector->bool (signal-value btor1649)) btor130 btor1648))
           (btor1651
            (bv->signal
             (zero-extend (signal-value btor1625) (bitvector 5))
             btor1625))
           (btor1652
            (signal
             (bool->bitvector
              (bveq (signal-value btor285) (signal-value btor1651)))
             (list)))
           (btor1653
            (if (bitvector->bool (signal-value btor1652)) btor129 btor1650))
           (btor1654
            (bv->signal
             (zero-extend (signal-value btor340) (bitvector 5))
             btor340))
           (btor1655
            (signal
             (bool->bitvector
              (bveq (signal-value btor285) (signal-value btor1654)))
             (list)))
           (btor1656
            (if (bitvector->bool (signal-value btor1655)) btor128 btor1653))
           (btor1657
            (bv->signal
             (zero-extend (signal-value btor1656) (bitvector 1))
             btor1656))
           (btor1658
            (signal
             (bool->bitvector
              (bveq (signal-value btor288) (signal-value btor1619)))
             (list)))
           (btor1659
            (if (bitvector->bool (signal-value btor1658)) btor131 btor128))
           (btor1660
            (signal
             (bool->bitvector
              (bveq (signal-value btor288) (signal-value btor1622)))
             (list)))
           (btor1661
            (if (bitvector->bool (signal-value btor1660)) btor130 btor1659))
           (btor1662
            (bv->signal
             (zero-extend (signal-value btor1625) (bitvector 5))
             btor1625))
           (btor1663
            (signal
             (bool->bitvector
              (bveq (signal-value btor288) (signal-value btor1662)))
             (list)))
           (btor1664
            (if (bitvector->bool (signal-value btor1663)) btor129 btor1661))
           (btor1665
            (bv->signal
             (zero-extend (signal-value btor340) (bitvector 5))
             btor340))
           (btor1666
            (signal
             (bool->bitvector
              (bveq (signal-value btor288) (signal-value btor1665)))
             (list)))
           (btor1667
            (if (bitvector->bool (signal-value btor1666)) btor128 btor1664))
           (btor1668
            (bv->signal
             (zero-extend (signal-value btor1667) (bitvector 1))
             btor1667))
           (btor1669
            (bv->signal
             (zero-extend (signal-value btor876) (bitvector 1))
             btor876))
           (btor1670
            (bv->signal
             (zero-extend (signal-value btor672) (bitvector 1))
             btor672))
           (btor1671
            (signal
             (bool->bitvector
              (bveq (signal-value btor287) (signal-value btor1634)))
             (list)))
           (btor1672
            (if (bitvector->bool (signal-value btor1671)) btor315 btor312))
           (btor1673
            (signal
             (bool->bitvector
              (bveq (signal-value btor287) (signal-value btor1637)))
             (list)))
           (btor1674
            (if (bitvector->bool (signal-value btor1673)) btor314 btor1672))
           (btor1675
            (signal
             (bool->bitvector
              (bveq (signal-value btor287) (signal-value btor1640)))
             (list)))
           (btor1676
            (if (bitvector->bool (signal-value btor1675)) btor313 btor1674))
           (btor1677
            (bv->signal
             (zero-extend (signal-value btor747) (bitvector 5))
             btor747))
           (btor1678
            (signal
             (bool->bitvector
              (bveq (signal-value btor287) (signal-value btor1677)))
             (list)))
           (btor1679
            (if (bitvector->bool (signal-value btor1678)) btor312 btor1676))
           (btor1680
            (bv->signal
             (zero-extend (signal-value btor1679) (bitvector 1))
             btor1679))
           (btor1681
            (signal
             (bool->bitvector
              (bveq (signal-value btor290) (signal-value btor1634)))
             (list)))
           (btor1682
            (if (bitvector->bool (signal-value btor1681)) btor315 btor312))
           (btor1683
            (signal
             (bool->bitvector
              (bveq (signal-value btor290) (signal-value btor1637)))
             (list)))
           (btor1684
            (if (bitvector->bool (signal-value btor1683)) btor314 btor1682))
           (btor1685
            (signal
             (bool->bitvector
              (bveq (signal-value btor290) (signal-value btor1640)))
             (list)))
           (btor1686
            (if (bitvector->bool (signal-value btor1685)) btor313 btor1684))
           (btor1687
            (bv->signal
             (zero-extend (signal-value btor747) (bitvector 5))
             btor747))
           (btor1688
            (signal
             (bool->bitvector
              (bveq (signal-value btor290) (signal-value btor1687)))
             (list)))
           (btor1689
            (if (bitvector->bool (signal-value btor1688)) btor312 btor1686))
           (btor1690
            (bv->signal
             (zero-extend (signal-value btor1689) (bitvector 1))
             btor1689))
           (btor1691
            (signal
             (concat (signal-value btor193) (signal-value btor192))
             (list)))
           (btor1692
            (signal
             (concat (signal-value btor204) (signal-value btor1691))
             (list)))
           (btor1693
            (signal
             (concat (signal-value btor215) (signal-value btor1692))
             (list)))
           (btor1694
            (signal
             (concat (signal-value btor222) (signal-value btor1693))
             (list)))
           (btor1695
            (signal
             (concat (signal-value btor223) (signal-value btor1694))
             (list)))
           (btor1696
            (signal
             (concat (signal-value btor224) (signal-value btor1695))
             (list)))
           (btor1697
            (signal
             (concat (signal-value btor225) (signal-value btor1696))
             (list)))
           (btor1698
            (signal
             (concat (signal-value btor226) (signal-value btor1697))
             (list)))
           (btor1699
            (signal
             (concat (signal-value btor227) (signal-value btor1698))
             (list)))
           (btor1700
            (signal
             (concat (signal-value btor194) (signal-value btor1699))
             (list)))
           (btor1701
            (signal
             (concat (signal-value btor195) (signal-value btor1700))
             (list)))
           (btor1702
            (signal
             (concat (signal-value btor196) (signal-value btor1701))
             (list)))
           (btor1703
            (signal
             (concat (signal-value btor197) (signal-value btor1702))
             (list)))
           (btor1704
            (signal
             (concat (signal-value btor198) (signal-value btor1703))
             (list)))
           (btor1705
            (signal
             (concat (signal-value btor199) (signal-value btor1704))
             (list)))
           (btor1706
            (signal
             (concat (signal-value btor200) (signal-value btor1705))
             (list)))
           (btor1707
            (signal
             (concat (signal-value btor201) (signal-value btor1706))
             (list)))
           (btor1708
            (signal
             (concat (signal-value btor202) (signal-value btor1707))
             (list)))
           (btor1709
            (signal
             (concat (signal-value btor203) (signal-value btor1708))
             (list)))
           (btor1710
            (signal
             (concat (signal-value btor205) (signal-value btor1709))
             (list)))
           (btor1711
            (signal
             (concat (signal-value btor206) (signal-value btor1710))
             (list)))
           (btor1712
            (signal
             (concat (signal-value btor207) (signal-value btor1711))
             (list)))
           (btor1713
            (signal
             (concat (signal-value btor208) (signal-value btor1712))
             (list)))
           (btor1714
            (signal
             (concat (signal-value btor209) (signal-value btor1713))
             (list)))
           (btor1715
            (signal
             (concat (signal-value btor210) (signal-value btor1714))
             (list)))
           (btor1716
            (signal
             (concat (signal-value btor211) (signal-value btor1715))
             (list)))
           (btor1717
            (signal
             (concat (signal-value btor212) (signal-value btor1716))
             (list)))
           (btor1718
            (signal
             (concat (signal-value btor213) (signal-value btor1717))
             (list)))
           (btor1719
            (signal
             (concat (signal-value btor214) (signal-value btor1718))
             (list)))
           (btor1720
            (signal
             (concat (signal-value btor216) (signal-value btor1719))
             (list)))
           (btor1721
            (signal
             (concat (signal-value btor217) (signal-value btor1720))
             (list)))
           (btor1722
            (signal
             (concat (signal-value btor218) (signal-value btor1721))
             (list)))
           (btor1723
            (signal
             (concat (signal-value btor219) (signal-value btor1722))
             (list)))
           (btor1724
            (signal
             (concat (signal-value btor220) (signal-value btor1723))
             (list)))
           (btor1725
            (signal
             (concat (signal-value btor221) (signal-value btor1724))
             (list)))
           (btor1726
            (bv->signal
             (zero-extend (signal-value btor1725) (bitvector 36))
             btor1725))
           (btor1727
            (bv->signal
             (zero-extend (signal-value btor1138) (bitvector 54))
             btor1138))
           (btor1728
            (bv->signal
             (zero-extend (signal-value btor1188) (bitvector 54))
             btor1188))
           (btor1729
            (bv->signal
             (zero-extend (signal-value btor1207) (bitvector 54))
             btor1207))
           (btor1730
            (bv->signal
             (zero-extend (signal-value btor1205) (bitvector 54))
             btor1205))
           (btor1731
            (bv->signal
             (zero-extend (signal-value btor422) (bitvector 54))
             btor422))
           (btor1732
            (signal
             (concat (signal-value btor233) (signal-value btor232))
             (list)))
           (btor1733
            (signal
             (concat (signal-value btor244) (signal-value btor1732))
             (list)))
           (btor1734
            (signal
             (concat (signal-value btor255) (signal-value btor1733))
             (list)))
           (btor1735
            (signal
             (concat (signal-value btor262) (signal-value btor1734))
             (list)))
           (btor1736
            (signal
             (concat (signal-value btor263) (signal-value btor1735))
             (list)))
           (btor1737
            (signal
             (concat (signal-value btor264) (signal-value btor1736))
             (list)))
           (btor1738
            (signal
             (concat (signal-value btor265) (signal-value btor1737))
             (list)))
           (btor1739
            (signal
             (concat (signal-value btor266) (signal-value btor1738))
             (list)))
           (btor1740
            (signal
             (concat (signal-value btor267) (signal-value btor1739))
             (list)))
           (btor1741
            (signal
             (concat (signal-value btor234) (signal-value btor1740))
             (list)))
           (btor1742
            (signal
             (concat (signal-value btor235) (signal-value btor1741))
             (list)))
           (btor1743
            (signal
             (concat (signal-value btor236) (signal-value btor1742))
             (list)))
           (btor1744
            (signal
             (concat (signal-value btor237) (signal-value btor1743))
             (list)))
           (btor1745
            (signal
             (concat (signal-value btor238) (signal-value btor1744))
             (list)))
           (btor1746
            (signal
             (concat (signal-value btor239) (signal-value btor1745))
             (list)))
           (btor1747
            (signal
             (concat (signal-value btor240) (signal-value btor1746))
             (list)))
           (btor1748
            (signal
             (concat (signal-value btor241) (signal-value btor1747))
             (list)))
           (btor1749
            (signal
             (concat (signal-value btor242) (signal-value btor1748))
             (list)))
           (btor1750
            (signal
             (concat (signal-value btor243) (signal-value btor1749))
             (list)))
           (btor1751
            (signal
             (concat (signal-value btor245) (signal-value btor1750))
             (list)))
           (btor1752
            (signal
             (concat (signal-value btor246) (signal-value btor1751))
             (list)))
           (btor1753
            (signal
             (concat (signal-value btor247) (signal-value btor1752))
             (list)))
           (btor1754
            (signal
             (concat (signal-value btor248) (signal-value btor1753))
             (list)))
           (btor1755
            (signal
             (concat (signal-value btor249) (signal-value btor1754))
             (list)))
           (btor1756
            (signal
             (concat (signal-value btor250) (signal-value btor1755))
             (list)))
           (btor1757
            (signal
             (concat (signal-value btor251) (signal-value btor1756))
             (list)))
           (btor1758
            (signal
             (concat (signal-value btor252) (signal-value btor1757))
             (list)))
           (btor1759
            (signal
             (concat (signal-value btor253) (signal-value btor1758))
             (list)))
           (btor1760
            (signal
             (concat (signal-value btor254) (signal-value btor1759))
             (list)))
           (btor1761
            (signal
             (concat (signal-value btor256) (signal-value btor1760))
             (list)))
           (btor1762
            (signal
             (concat (signal-value btor257) (signal-value btor1761))
             (list)))
           (btor1763
            (signal
             (concat (signal-value btor258) (signal-value btor1762))
             (list)))
           (btor1764
            (signal
             (concat (signal-value btor259) (signal-value btor1763))
             (list)))
           (btor1765
            (signal
             (concat (signal-value btor260) (signal-value btor1764))
             (list)))
           (btor1766
            (signal
             (concat (signal-value btor261) (signal-value btor1765))
             (list)))
           (btor1767
            (bv->signal
             (zero-extend (signal-value btor1766) (bitvector 36))
             btor1766))
           (btor1768
            (bv->signal
             (zero-extend (signal-value btor598) (bitvector 54))
             btor598))
           (btor1769
            (bv->signal
             (zero-extend (signal-value btor1202) (bitvector 54))
             btor1202))
           (btor1770
            (bv->signal
             (zero-extend (signal-value btor1199) (bitvector 54))
             btor1199))
           (btor1771
            (bv->signal
             (zero-extend (signal-value btor1016) (bitvector 3))
             btor1016))
           (btor1772
            (bv->signal
             (zero-extend (signal-value btor1016) (bitvector 3))
             btor1016))
           (btor1773
            (bv->signal
             (zero-extend (signal-value btor995) (bitvector 3))
             btor995))
           (btor1774
            (bv->signal
             (zero-extend (signal-value btor995) (bitvector 3))
             btor995))
           (btor1775
            (bv->signal
             (zero-extend (signal-value btor1021) (bitvector 3))
             btor1021))
           (btor1776
            (bv->signal
             (zero-extend (signal-value btor1024) (bitvector 3))
             btor1024))
           (btor1777
            (bv->signal
             (zero-extend (signal-value btor539) (bitvector 1))
             btor539))
           (btor1778
            (bv->signal
             (zero-extend (signal-value btor539) (bitvector 1))
             btor539))
           (btor1779
            (bv->signal
             (zero-extend (signal-value btor518) (bitvector 1))
             btor518))
           (btor1780
            (bv->signal
             (zero-extend (signal-value btor518) (bitvector 1))
             btor518))
           (btor1781
            (bv->signal
             (zero-extend (signal-value btor542) (bitvector 1))
             btor542))
           (btor1782
            (bv->signal
             (zero-extend (signal-value btor545) (bitvector 1))
             btor545))
           (btor1783
            (signal
             (concat (signal-value btor272) (signal-value btor271))
             (list)))
           (btor1784
            (signal
             (concat (signal-value btor274) (signal-value btor1783))
             (list)))
           (btor1785
            (signal
             (concat (signal-value btor275) (signal-value btor1784))
             (list)))
           (btor1786
            (signal
             (concat (signal-value btor276) (signal-value btor1785))
             (list)))
           (btor1787
            (signal
             (concat (signal-value btor277) (signal-value btor1786))
             (list)))
           (btor1788
            (signal
             (concat (signal-value btor278) (signal-value btor1787))
             (list)))
           (btor1789
            (signal
             (concat (signal-value btor279) (signal-value btor1788))
             (list)))
           (btor1790
            (signal
             (concat (signal-value btor280) (signal-value btor1789))
             (list)))
           (btor1791
            (signal
             (concat (signal-value btor281) (signal-value btor1790))
             (list)))
           (btor1792
            (signal
             (concat (signal-value btor273) (signal-value btor1791))
             (list)))
           (btor1793
            (bv->signal
             (zero-extend (signal-value btor1792) (bitvector 11))
             btor1792))
           (btor1794
            (signal
             (concat (signal-value btor545) (signal-value btor652))
             (list)))
           (btor1795
            (signal
             (concat (signal-value btor1024) (signal-value btor1794))
             (list)))
           (btor1796
            (bv->signal
             (zero-extend (signal-value btor1795) (bitvector 11))
             btor1795))
           (btor1797
            (signal
             (bool->bitvector
              (bveq (signal-value btor291) (signal-value btor1619)))
             (list)))
           (btor1798
            (if (bitvector->bool (signal-value btor1797)) btor131 btor128))
           (btor1799
            (signal
             (bool->bitvector
              (bveq (signal-value btor291) (signal-value btor1622)))
             (list)))
           (btor1800
            (if (bitvector->bool (signal-value btor1799)) btor130 btor1798))
           (btor1801
            (bv->signal
             (zero-extend (signal-value btor1625) (bitvector 5))
             btor1625))
           (btor1802
            (signal
             (bool->bitvector
              (bveq (signal-value btor291) (signal-value btor1801)))
             (list)))
           (btor1803
            (if (bitvector->bool (signal-value btor1802)) btor129 btor1800))
           (btor1804
            (bv->signal
             (zero-extend (signal-value btor340) (bitvector 5))
             btor340))
           (btor1805
            (signal
             (bool->bitvector
              (bveq (signal-value btor291) (signal-value btor1804)))
             (list)))
           (btor1806
            (if (bitvector->bool (signal-value btor1805)) btor128 btor1803))
           (btor1807
            (bv->signal
             (zero-extend (signal-value btor1806) (bitvector 1))
             btor1806))
           (btor1808
            (bv->signal
             (zero-extend (signal-value btor634) (bitvector 1))
             btor634))
           (btor1809
            (signal
             (bool->bitvector
              (bveq (signal-value btor293) (signal-value btor1634)))
             (list)))
           (btor1810
            (if (bitvector->bool (signal-value btor1809)) btor315 btor312))
           (btor1811
            (signal
             (bool->bitvector
              (bveq (signal-value btor293) (signal-value btor1637)))
             (list)))
           (btor1812
            (if (bitvector->bool (signal-value btor1811)) btor314 btor1810))
           (btor1813
            (signal
             (bool->bitvector
              (bveq (signal-value btor293) (signal-value btor1640)))
             (list)))
           (btor1814
            (if (bitvector->bool (signal-value btor1813)) btor313 btor1812))
           (btor1815
            (bv->signal
             (zero-extend (signal-value btor747) (bitvector 5))
             btor747))
           (btor1816
            (signal
             (bool->bitvector
              (bveq (signal-value btor293) (signal-value btor1815)))
             (list)))
           (btor1817
            (if (bitvector->bool (signal-value btor1816)) btor312 btor1814))
           (btor1818
            (bv->signal
             (zero-extend (signal-value btor1817) (bitvector 1))
             btor1817))
           (btor1819
            (signal
             (bool->bitvector
              (bveq (signal-value btor294) (signal-value btor1619)))
             (list)))
           (btor1820
            (if (bitvector->bool (signal-value btor1819)) btor131 btor128))
           (btor1821
            (signal
             (bool->bitvector
              (bveq (signal-value btor294) (signal-value btor1622)))
             (list)))
           (btor1822
            (if (bitvector->bool (signal-value btor1821)) btor130 btor1820))
           (btor1823
            (bv->signal
             (zero-extend (signal-value btor1625) (bitvector 5))
             btor1625))
           (btor1824
            (signal
             (bool->bitvector
              (bveq (signal-value btor294) (signal-value btor1823)))
             (list)))
           (btor1825
            (if (bitvector->bool (signal-value btor1824)) btor129 btor1822))
           (btor1826
            (bv->signal
             (zero-extend (signal-value btor340) (bitvector 5))
             btor340))
           (btor1827
            (signal
             (bool->bitvector
              (bveq (signal-value btor294) (signal-value btor1826)))
             (list)))
           (btor1828
            (if (bitvector->bool (signal-value btor1827)) btor128 btor1825))
           (btor1829
            (bv->signal
             (zero-extend (signal-value btor1828) (bitvector 1))
             btor1828))
           (btor1830
            (bv->signal
             (zero-extend (signal-value btor613) (bitvector 1))
             btor613))
           (btor1831
            (signal
             (bool->bitvector
              (bveq (signal-value btor296) (signal-value btor1634)))
             (list)))
           (btor1832
            (if (bitvector->bool (signal-value btor1831)) btor315 btor312))
           (btor1833
            (signal
             (bool->bitvector
              (bveq (signal-value btor296) (signal-value btor1637)))
             (list)))
           (btor1834
            (if (bitvector->bool (signal-value btor1833)) btor314 btor1832))
           (btor1835
            (signal
             (bool->bitvector
              (bveq (signal-value btor296) (signal-value btor1640)))
             (list)))
           (btor1836
            (if (bitvector->bool (signal-value btor1835)) btor313 btor1834))
           (btor1837
            (bv->signal
             (zero-extend (signal-value btor747) (bitvector 5))
             btor747))
           (btor1838
            (signal
             (bool->bitvector
              (bveq (signal-value btor296) (signal-value btor1837)))
             (list)))
           (btor1839
            (if (bitvector->bool (signal-value btor1838)) btor312 btor1836))
           (btor1840
            (bv->signal
             (zero-extend (signal-value btor1839) (bitvector 1))
             btor1839))
           (btor1841
            (signal
             (bool->bitvector
              (bveq (signal-value btor297) (signal-value btor1619)))
             (list)))
           (btor1842
            (if (bitvector->bool (signal-value btor1841)) btor131 btor128))
           (btor1843
            (signal
             (bool->bitvector
              (bveq (signal-value btor297) (signal-value btor1622)))
             (list)))
           (btor1844
            (if (bitvector->bool (signal-value btor1843)) btor130 btor1842))
           (btor1845
            (bv->signal
             (zero-extend (signal-value btor1625) (bitvector 5))
             btor1625))
           (btor1846
            (signal
             (bool->bitvector
              (bveq (signal-value btor297) (signal-value btor1845)))
             (list)))
           (btor1847
            (if (bitvector->bool (signal-value btor1846)) btor129 btor1844))
           (btor1848
            (bv->signal
             (zero-extend (signal-value btor340) (bitvector 5))
             btor340))
           (btor1849
            (signal
             (bool->bitvector
              (bveq (signal-value btor297) (signal-value btor1848)))
             (list)))
           (btor1850
            (if (bitvector->bool (signal-value btor1849)) btor128 btor1847))
           (btor1851
            (bv->signal
             (zero-extend (signal-value btor1850) (bitvector 1))
             btor1850))
           (btor1852
            (bv->signal
             (zero-extend (signal-value btor533) (bitvector 1))
             btor533))
           (btor1853
            (signal
             (bool->bitvector
              (bveq (signal-value btor299) (signal-value btor1634)))
             (list)))
           (btor1854
            (if (bitvector->bool (signal-value btor1853)) btor315 btor312))
           (btor1855
            (signal
             (bool->bitvector
              (bveq (signal-value btor299) (signal-value btor1637)))
             (list)))
           (btor1856
            (if (bitvector->bool (signal-value btor1855)) btor314 btor1854))
           (btor1857
            (signal
             (bool->bitvector
              (bveq (signal-value btor299) (signal-value btor1640)))
             (list)))
           (btor1858
            (if (bitvector->bool (signal-value btor1857)) btor313 btor1856))
           (btor1859
            (bv->signal
             (zero-extend (signal-value btor747) (bitvector 5))
             btor747))
           (btor1860
            (signal
             (bool->bitvector
              (bveq (signal-value btor299) (signal-value btor1859)))
             (list)))
           (btor1861
            (if (bitvector->bool (signal-value btor1860)) btor312 btor1858))
           (btor1862
            (bv->signal
             (zero-extend (signal-value btor1861) (bitvector 1))
             btor1861))
           (btor1863
            (signal
             (bool->bitvector
              (bveq (signal-value btor300) (signal-value btor1619)))
             (list)))
           (btor1864
            (if (bitvector->bool (signal-value btor1863)) btor131 btor128))
           (btor1865
            (signal
             (bool->bitvector
              (bveq (signal-value btor300) (signal-value btor1622)))
             (list)))
           (btor1866
            (if (bitvector->bool (signal-value btor1865)) btor130 btor1864))
           (btor1867
            (bv->signal
             (zero-extend (signal-value btor1625) (bitvector 5))
             btor1625))
           (btor1868
            (signal
             (bool->bitvector
              (bveq (signal-value btor300) (signal-value btor1867)))
             (list)))
           (btor1869
            (if (bitvector->bool (signal-value btor1868)) btor129 btor1866))
           (btor1870
            (bv->signal
             (zero-extend (signal-value btor340) (bitvector 5))
             btor340))
           (btor1871
            (signal
             (bool->bitvector
              (bveq (signal-value btor300) (signal-value btor1870)))
             (list)))
           (btor1872
            (if (bitvector->bool (signal-value btor1871)) btor128 btor1869))
           (btor1873
            (bv->signal
             (zero-extend (signal-value btor1872) (bitvector 1))
             btor1872))
           (btor1874
            (bv->signal
             (zero-extend (signal-value btor512) (bitvector 1))
             btor512))
           (btor1875
            (signal
             (bool->bitvector
              (bveq (signal-value btor302) (signal-value btor1634)))
             (list)))
           (btor1876
            (if (bitvector->bool (signal-value btor1875)) btor315 btor312))
           (btor1877
            (signal
             (bool->bitvector
              (bveq (signal-value btor302) (signal-value btor1637)))
             (list)))
           (btor1878
            (if (bitvector->bool (signal-value btor1877)) btor314 btor1876))
           (btor1879
            (signal
             (bool->bitvector
              (bveq (signal-value btor302) (signal-value btor1640)))
             (list)))
           (btor1880
            (if (bitvector->bool (signal-value btor1879)) btor313 btor1878))
           (btor1881
            (bv->signal
             (zero-extend (signal-value btor747) (bitvector 5))
             btor747))
           (btor1882
            (signal
             (bool->bitvector
              (bveq (signal-value btor302) (signal-value btor1881)))
             (list)))
           (btor1883
            (if (bitvector->bool (signal-value btor1882)) btor312 btor1880))
           (btor1884
            (bv->signal
             (zero-extend (signal-value btor1883) (bitvector 1))
             btor1883))
           (btor1885
            (bv->signal
             (zero-extend (signal-value btor1010) (bitvector 1))
             btor1010))
           (btor1886
            (bv->signal
             (zero-extend (signal-value btor989) (bitvector 1))
             btor989))
           (btor1887
            (bv->signal
             (zero-extend (signal-value btor640) (bitvector 7))
             btor640))
           (btor1888
            (bv->signal
             (zero-extend (signal-value btor640) (bitvector 7))
             btor640))
           (btor1889
            (bv->signal
             (zero-extend (signal-value btor619) (bitvector 7))
             btor619))
           (btor1890
            (bv->signal
             (zero-extend (signal-value btor619) (bitvector 7))
             btor619))
           (btor1891
            (bv->signal
             (zero-extend (signal-value btor649) (bitvector 7))
             btor649))
           (btor1892
            (bv->signal
             (zero-extend (signal-value btor652) (bitvector 7))
             btor652))
           (btor1893
            (signal
             (bool->bitvector
              (bveq (signal-value btor305) (signal-value btor1619)))
             (list)))
           (btor1894
            (if (bitvector->bool (signal-value btor1893)) btor131 btor128))
           (btor1895
            (signal
             (bool->bitvector
              (bveq (signal-value btor305) (signal-value btor1622)))
             (list)))
           (btor1896
            (if (bitvector->bool (signal-value btor1895)) btor130 btor1894))
           (btor1897
            (bv->signal
             (zero-extend (signal-value btor1625) (bitvector 5))
             btor1625))
           (btor1898
            (signal
             (bool->bitvector
              (bveq (signal-value btor305) (signal-value btor1897)))
             (list)))
           (btor1899
            (if (bitvector->bool (signal-value btor1898)) btor129 btor1896))
           (btor1900
            (bv->signal
             (zero-extend (signal-value btor340) (bitvector 5))
             btor340))
           (btor1901
            (signal
             (bool->bitvector
              (bveq (signal-value btor305) (signal-value btor1900)))
             (list)))
           (btor1902
            (if (bitvector->bool (signal-value btor1901)) btor128 btor1899))
           (btor1903
            (bv->signal
             (zero-extend (signal-value btor1902) (bitvector 1))
             btor1902))
           (btor1904
            (bv->signal
             (zero-extend (signal-value btor1296) (bitvector 1))
             btor1296))
           (btor1905
            (signal
             (bool->bitvector
              (bveq (signal-value btor307) (signal-value btor1634)))
             (list)))
           (btor1906
            (if (bitvector->bool (signal-value btor1905)) btor315 btor312))
           (btor1907
            (signal
             (bool->bitvector
              (bveq (signal-value btor307) (signal-value btor1637)))
             (list)))
           (btor1908
            (if (bitvector->bool (signal-value btor1907)) btor314 btor1906))
           (btor1909
            (signal
             (bool->bitvector
              (bveq (signal-value btor307) (signal-value btor1640)))
             (list)))
           (btor1910
            (if (bitvector->bool (signal-value btor1909)) btor313 btor1908))
           (btor1911
            (bv->signal
             (zero-extend (signal-value btor747) (bitvector 5))
             btor747))
           (btor1912
            (signal
             (bool->bitvector
              (bveq (signal-value btor307) (signal-value btor1911)))
             (list)))
           (btor1913
            (if (bitvector->bool (signal-value btor1912)) btor312 btor1910))
           (btor1914
            (bv->signal
             (zero-extend (signal-value btor1913) (bitvector 1))
             btor1913))
           (btor1915
            (signal
             (bool->bitvector
              (bveq (signal-value btor308) (signal-value btor1619)))
             (list)))
           (btor1916
            (if (bitvector->bool (signal-value btor1915)) btor131 btor128))
           (btor1917
            (signal
             (bool->bitvector
              (bveq (signal-value btor308) (signal-value btor1622)))
             (list)))
           (btor1918
            (if (bitvector->bool (signal-value btor1917)) btor130 btor1916))
           (btor1919
            (bv->signal
             (zero-extend (signal-value btor1625) (bitvector 5))
             btor1625))
           (btor1920
            (signal
             (bool->bitvector
              (bveq (signal-value btor308) (signal-value btor1919)))
             (list)))
           (btor1921
            (if (bitvector->bool (signal-value btor1920)) btor129 btor1918))
           (btor1922
            (bv->signal
             (zero-extend (signal-value btor340) (bitvector 5))
             btor340))
           (btor1923
            (signal
             (bool->bitvector
              (bveq (signal-value btor308) (signal-value btor1922)))
             (list)))
           (btor1924
            (if (bitvector->bool (signal-value btor1923)) btor128 btor1921))
           (btor1925
            (bv->signal
             (zero-extend (signal-value btor1924) (bitvector 1))
             btor1924))
           (btor1926
            (bv->signal
             (zero-extend (signal-value btor1342) (bitvector 1))
             btor1342))
           (btor1927
            (signal
             (bool->bitvector
              (bveq (signal-value btor310) (signal-value btor1634)))
             (list)))
           (btor1928
            (if (bitvector->bool (signal-value btor1927)) btor315 btor312))
           (btor1929
            (signal
             (bool->bitvector
              (bveq (signal-value btor310) (signal-value btor1637)))
             (list)))
           (btor1930
            (if (bitvector->bool (signal-value btor1929)) btor314 btor1928))
           (btor1931
            (signal
             (bool->bitvector
              (bveq (signal-value btor310) (signal-value btor1640)))
             (list)))
           (btor1932
            (if (bitvector->bool (signal-value btor1931)) btor313 btor1930))
           (btor1933
            (bv->signal
             (zero-extend (signal-value btor747) (bitvector 5))
             btor747))
           (btor1934
            (signal
             (bool->bitvector
              (bveq (signal-value btor310) (signal-value btor1933)))
             (list)))
           (btor1935
            (if (bitvector->bool (signal-value btor1934)) btor312 btor1932))
           (btor1936
            (bv->signal
             (zero-extend (signal-value btor1935) (bitvector 1))
             btor1935))
           (btor1937
            (bv->signal
             (zero-extend (signal-value btor1244) (bitvector 1))
             btor1244))
           (btor1938
            (bv->signal
             (zero-extend (signal-value btor1240) (bitvector 1))
             btor1240))
           (btor1939
            (bv->signal
             (zero-extend (signal-value btor1243) (bitvector 1))
             btor1243))
           (btor1940
            (bv->signal
             (zero-extend (signal-value btor1240) (bitvector 1))
             btor1240))
           (btor1941
            (bv->signal
             (zero-extend (signal-value btor1278) (bitvector 1))
             btor1278))
           (btor1942
            (bv->signal
             (zero-extend (signal-value btor1280) (bitvector 1))
             btor1280))
           (btor1943
            (bv->signal
             (zero-extend (signal-value btor1249) (bitvector 1))
             btor1249))
           (btor1944
            (bv->signal
             (zero-extend (signal-value btor1279) (bitvector 1))
             btor1279))
           (btor1945
            (bv->signal
             (zero-extend (signal-value btor1249) (bitvector 1))
             btor1249))
           (btor1946
            (bv->signal
             (zero-extend (signal-value btor1187) (bitvector 54))
             btor1187))
           (btor1947
            (bv->signal
             (zero-extend (signal-value btor1272) (bitvector 53))
             btor1272))
           (btor1948
            (bv->signal
             (zero-extend (signal-value btor1302) (bitvector 18))
             btor1302))
           (btor1949
            (bv->signal
             (zero-extend (signal-value btor1306) (bitvector 18))
             btor1306))
           (btor1950
            (bv->signal
             (zero-extend (signal-value btor1302) (bitvector 18))
             btor1302))
           (btor1951
            (bv->signal
             (zero-extend (signal-value btor1348) (bitvector 36))
             btor1348))
           (btor1952
            (bv->signal
             (zero-extend (signal-value btor1350) (bitvector 36))
             btor1350))
           (btor1953
            (bv->signal
             (zero-extend (signal-value btor1348) (bitvector 36))
             btor1348))
           (btor1954
            (signal
             (concat (signal-value btor1350) (signal-value btor1306))
             (list)))
           (btor1955
            (bv->signal
             (zero-extend (signal-value btor1954) (bitvector 54))
             btor1954))
           (btor1956
            (bv->signal
             (zero-extend (signal-value btor957) (bitvector 54))
             btor957))
           (btor1957
            (bv->signal
             (zero-extend (signal-value btor962) (bitvector 54))
             btor962))
           (btor1958
            (bv->signal
             (zero-extend (signal-value btor317) (bitvector 1))
             btor317))
           (btor1959
            (bv->signal
             (zero-extend (signal-value btor318) (bitvector 1))
             btor318))
           (btor1960
            (bv->signal
             (zero-extend (signal-value btor1275) (bitvector 1))
             btor1275))
           (btor1961
            (bv->signal
             (zero-extend (signal-value btor316) (bitvector 1))
             btor316))
           (btor1962
            (bv->signal
             (zero-extend (signal-value btor1439) (bitvector 1))
             btor1439))
           (btor1963
            (bv->signal
             (zero-extend (signal-value btor1446) (bitvector 1))
             btor1446))
           (btor1964
            (bv->signal
             (zero-extend (signal-value btor1444) (bitvector 1))
             btor1444))
           (btor1965
            (bv->signal
             (zero-extend (signal-value btor1445) (bitvector 1))
             btor1445))
           (btor1966
            (bv->signal
             (zero-extend (signal-value btor1444) (bitvector 1))
             btor1444))
           (btor1968
            (if (bitvector->bool (signal-value btor1631)) btor1190 btor347))
           (btor1969
            (if (bitvector->bool (signal-value btor1645)) btor320 btor1968))
           (btor1973
            (if (bitvector->bool (signal-value btor1872)) btor542 btor518))
           (btor1974
            (if (bitvector->bool (signal-value btor1883)) btor320 btor1973))
           (btor1978
            (if (bitvector->bool (signal-value btor1850)) btor279 btor539))
           (btor1979
            (if (bitvector->bool (signal-value btor1861)) btor320 btor1978))
           (btor1983
            (if (bitvector->bool (signal-value btor1828)) btor649 btor619))
           (btor1984
            (if (bitvector->bool (signal-value btor1839)) btor490 btor1983))
           (btor1988
            (if (bitvector->bool (signal-value btor1806)) btor646 btor640))
           (btor1989
            (if (bitvector->bool (signal-value btor1817)) btor490 btor1988))
           (btor1993
            (if (bitvector->bool (signal-value btor1667)) btor704 btor678))
           (btor1994
            (if (bitvector->bool (signal-value btor1689)) btor658 btor1993))
           (btor1998
            (if (bitvector->bool (signal-value btor1656)) btor908 btor882))
           (btor1999
            (if (bitvector->bool (signal-value btor1679)) btor658 btor1998))
           (btor2003
            (if (bitvector->bool (signal-value btor1872)) btor1021 btor995))
           (btor2004
            (if (bitvector->bool (signal-value btor1883)) btor975 btor2003))
           (btor2008
            (if (bitvector->bool (signal-value btor1850)) btor1018 btor1016))
           (btor2009
            (if (bitvector->bool (signal-value btor1861)) btor975 btor2008))
           (btor2013
            (if (bitvector->bool (signal-value btor1631)) btor1209 btor1198))
           (btor2014
            (if (bitvector->bool (signal-value btor1645)) btor320 btor2013))
           (btor2017
            (if (bitvector->bool (signal-value btor1631)) btor1217 btor1215))
           (btor2018
            (if (bitvector->bool (signal-value btor1645)) btor320 btor2017))
           (btor2021
            (if (bitvector->bool (signal-value btor1631)) btor1225 btor1223))
           (btor2022
            (if (bitvector->bool (signal-value btor1645)) btor320 btor2021))
           (btor2025
            (if (bitvector->bool (signal-value btor1631)) btor1234 btor1231))
           (btor2026
            (if (bitvector->bool (signal-value btor1645)) btor320 btor2025))
           (btor2029
            (if (bitvector->bool (signal-value btor1631)) btor1243 btor1240))
           (btor2030
            (if (bitvector->bool (signal-value btor1645)) btor320 btor2029))
           (btor2033
            (if (bitvector->bool (signal-value btor1631)) btor1279 btor1249))
           (btor2034
            (if (bitvector->bool (signal-value btor1645)) btor320 btor2033))
           (btor2037
            (if (bitvector->bool (signal-value btor1902)) btor1303 btor1302))
           (btor2038
            (if (bitvector->bool (signal-value btor1913)) btor351 btor2037))
           (btor2042
            (if (bitvector->bool (signal-value btor1924)) btor1349 btor1348))
           (btor2043
            (if (bitvector->bool (signal-value btor1935)) btor1328 btor2042))
           (btor2047
            (if (bitvector->bool (signal-value btor1631)) btor1445 btor1444))
           (btor2048
            (if (bitvector->bool (signal-value btor1645)) btor320 btor2047))
           (output-state
            (remove-duplicates
             (append
              (append
               (list
                (cons
                 (string->symbol (string-append name "state1442"))
                 (cons
                  (signal-value btor2048)
                  (if (assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1442")))
                    (add1
                     (cdr
                      (assoc-ref
                       merged-input-state-hash
                       (string->symbol (string-append name "state1442")))))
                    0))))
               (append
                (list
                 (cons
                  (string->symbol (string-append name "state1441"))
                  (cons
                   (signal-value btor1444)
                   (if (assoc-has-key?
                        merged-input-state-hash
                        (string->symbol (string-append name "state1441")))
                     (add1
                      (cdr
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1441")))))
                     0))))
                (append
                 (list
                  (cons
                   (string->symbol (string-append name "state1343"))
                   (cons
                    (signal-value btor1342)
                    (if (assoc-has-key?
                         merged-input-state-hash
                         (string->symbol (string-append name "state1343")))
                      (add1
                       (cdr
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1343")))))
                      0))))
                 (append
                  (list
                   (cons
                    (string->symbol (string-append name "state1329"))
                    (cons
                     (signal-value btor2043)
                     (if (assoc-has-key?
                          merged-input-state-hash
                          (string->symbol (string-append name "state1329")))
                       (add1
                        (cdr
                         (assoc-ref
                          merged-input-state-hash
                          (string->symbol (string-append name "state1329")))))
                       0))))
                  (append
                   (list
                    (cons
                     (string->symbol (string-append name "state1327"))
                     (cons
                      (signal-value btor1348)
                      (if (assoc-has-key?
                           merged-input-state-hash
                           (string->symbol (string-append name "state1327")))
                        (add1
                         (cdr
                          (assoc-ref
                           merged-input-state-hash
                           (string->symbol (string-append name "state1327")))))
                        0))))
                   (append
                    (list
                     (cons
                      (string->symbol (string-append name "state1297"))
                      (cons
                       (signal-value btor1296)
                       (if (assoc-has-key?
                            merged-input-state-hash
                            (string->symbol (string-append name "state1297")))
                         (add1
                          (cdr
                           (assoc-ref
                            merged-input-state-hash
                            (string->symbol
                             (string-append name "state1297")))))
                         0))))
                    (append
                     (list
                      (cons
                       (string->symbol (string-append name "state1283"))
                       (cons
                        (signal-value btor2038)
                        (if (assoc-has-key?
                             merged-input-state-hash
                             (string->symbol (string-append name "state1283")))
                          (add1
                           (cdr
                            (assoc-ref
                             merged-input-state-hash
                             (string->symbol
                              (string-append name "state1283")))))
                          0))))
                     (append
                      (list
                       (cons
                        (string->symbol (string-append name "state1282"))
                        (cons
                         (signal-value btor1302)
                         (if (assoc-has-key?
                              merged-input-state-hash
                              (string->symbol
                               (string-append name "state1282")))
                           (add1
                            (cdr
                             (assoc-ref
                              merged-input-state-hash
                              (string->symbol
                               (string-append name "state1282")))))
                           0))))
                      (append
                       (list
                        (cons
                         (string->symbol (string-append name "state1247"))
                         (cons
                          (signal-value btor2034)
                          (if (assoc-has-key?
                               merged-input-state-hash
                               (string->symbol
                                (string-append name "state1247")))
                            (add1
                             (cdr
                              (assoc-ref
                               merged-input-state-hash
                               (string->symbol
                                (string-append name "state1247")))))
                            0))))
                       (append
                        (list
                         (cons
                          (string->symbol (string-append name "state1246"))
                          (cons
                           (signal-value btor1249)
                           (if (assoc-has-key?
                                merged-input-state-hash
                                (string->symbol
                                 (string-append name "state1246")))
                             (add1
                              (cdr
                               (assoc-ref
                                merged-input-state-hash
                                (string->symbol
                                 (string-append name "state1246")))))
                             0))))
                        (append
                         (list
                          (cons
                           (string->symbol (string-append name "state1238"))
                           (cons
                            (signal-value btor2030)
                            (if (assoc-has-key?
                                 merged-input-state-hash
                                 (string->symbol
                                  (string-append name "state1238")))
                              (add1
                               (cdr
                                (assoc-ref
                                 merged-input-state-hash
                                 (string->symbol
                                  (string-append name "state1238")))))
                              0))))
                         (append
                          (list
                           (cons
                            (string->symbol (string-append name "state1237"))
                            (cons
                             (signal-value btor1240)
                             (if (assoc-has-key?
                                  merged-input-state-hash
                                  (string->symbol
                                   (string-append name "state1237")))
                               (add1
                                (cdr
                                 (assoc-ref
                                  merged-input-state-hash
                                  (string->symbol
                                   (string-append name "state1237")))))
                               0))))
                          (append
                           (list
                            (cons
                             (string->symbol (string-append name "state1229"))
                             (cons
                              (signal-value btor2026)
                              (if (assoc-has-key?
                                   merged-input-state-hash
                                   (string->symbol
                                    (string-append name "state1229")))
                                (add1
                                 (cdr
                                  (assoc-ref
                                   merged-input-state-hash
                                   (string->symbol
                                    (string-append name "state1229")))))
                                0))))
                           (append
                            (list
                             (cons
                              (string->symbol (string-append name "state1228"))
                              (cons
                               (signal-value btor1231)
                               (if (assoc-has-key?
                                    merged-input-state-hash
                                    (string->symbol
                                     (string-append name "state1228")))
                                 (add1
                                  (cdr
                                   (assoc-ref
                                    merged-input-state-hash
                                    (string->symbol
                                     (string-append name "state1228")))))
                                 0))))
                            (append
                             (list
                              (cons
                               (string->symbol
                                (string-append name "state1221"))
                               (cons
                                (signal-value btor2022)
                                (if (assoc-has-key?
                                     merged-input-state-hash
                                     (string->symbol
                                      (string-append name "state1221")))
                                  (add1
                                   (cdr
                                    (assoc-ref
                                     merged-input-state-hash
                                     (string->symbol
                                      (string-append name "state1221")))))
                                  0))))
                             (append
                              (list
                               (cons
                                (string->symbol
                                 (string-append name "state1220"))
                                (cons
                                 (signal-value btor1223)
                                 (if (assoc-has-key?
                                      merged-input-state-hash
                                      (string->symbol
                                       (string-append name "state1220")))
                                   (add1
                                    (cdr
                                     (assoc-ref
                                      merged-input-state-hash
                                      (string->symbol
                                       (string-append name "state1220")))))
                                   0))))
                              (append
                               (list
                                (cons
                                 (string->symbol
                                  (string-append name "state1213"))
                                 (cons
                                  (signal-value btor2018)
                                  (if (assoc-has-key?
                                       merged-input-state-hash
                                       (string->symbol
                                        (string-append name "state1213")))
                                    (add1
                                     (cdr
                                      (assoc-ref
                                       merged-input-state-hash
                                       (string->symbol
                                        (string-append name "state1213")))))
                                    0))))
                               (append
                                (list
                                 (cons
                                  (string->symbol
                                   (string-append name "state1212"))
                                  (cons
                                   (signal-value btor1215)
                                   (if (assoc-has-key?
                                        merged-input-state-hash
                                        (string->symbol
                                         (string-append name "state1212")))
                                     (add1
                                      (cdr
                                       (assoc-ref
                                        merged-input-state-hash
                                        (string->symbol
                                         (string-append name "state1212")))))
                                     0))))
                                (append
                                 (list
                                  (cons
                                   (string->symbol
                                    (string-append name "state1196"))
                                   (cons
                                    (signal-value btor2014)
                                    (if (assoc-has-key?
                                         merged-input-state-hash
                                         (string->symbol
                                          (string-append name "state1196")))
                                      (add1
                                       (cdr
                                        (assoc-ref
                                         merged-input-state-hash
                                         (string->symbol
                                          (string-append name "state1196")))))
                                      0))))
                                 (append
                                  (list
                                   (cons
                                    (string->symbol
                                     (string-append name "state1195"))
                                    (cons
                                     (signal-value btor1198)
                                     (if (assoc-has-key?
                                          merged-input-state-hash
                                          (string->symbol
                                           (string-append name "state1195")))
                                       (add1
                                        (cdr
                                         (assoc-ref
                                          merged-input-state-hash
                                          (string->symbol
                                           (string-append name "state1195")))))
                                       0))))
                                  (append
                                   (list
                                    (cons
                                     (string->symbol
                                      (string-append name "state1011"))
                                     (cons
                                      (signal-value btor1010)
                                      (if (assoc-has-key?
                                           merged-input-state-hash
                                           (string->symbol
                                            (string-append name "state1011")))
                                        (add1
                                         (cdr
                                          (assoc-ref
                                           merged-input-state-hash
                                           (string->symbol
                                            (string-append
                                             name
                                             "state1011")))))
                                        0))))
                                   (append
                                    (list
                                     (cons
                                      (string->symbol
                                       (string-append name "state997"))
                                      (cons
                                       (signal-value btor2009)
                                       (if (assoc-has-key?
                                            merged-input-state-hash
                                            (string->symbol
                                             (string-append name "state997")))
                                         (add1
                                          (cdr
                                           (assoc-ref
                                            merged-input-state-hash
                                            (string->symbol
                                             (string-append
                                              name
                                              "state997")))))
                                         0))))
                                    (append
                                     (list
                                      (cons
                                       (string->symbol
                                        (string-append name "state996"))
                                       (cons
                                        (signal-value btor1016)
                                        (if (assoc-has-key?
                                             merged-input-state-hash
                                             (string->symbol
                                              (string-append name "state996")))
                                          (add1
                                           (cdr
                                            (assoc-ref
                                             merged-input-state-hash
                                             (string->symbol
                                              (string-append
                                               name
                                               "state996")))))
                                          0))))
                                     (append
                                      (list
                                       (cons
                                        (string->symbol
                                         (string-append name "state990"))
                                        (cons
                                         (signal-value btor989)
                                         (if (assoc-has-key?
                                              merged-input-state-hash
                                              (string->symbol
                                               (string-append
                                                name
                                                "state990")))
                                           (add1
                                            (cdr
                                             (assoc-ref
                                              merged-input-state-hash
                                              (string->symbol
                                               (string-append
                                                name
                                                "state990")))))
                                           0))))
                                      (append
                                       (list
                                        (cons
                                         (string->symbol
                                          (string-append name "state976"))
                                         (cons
                                          (signal-value btor2004)
                                          (if (assoc-has-key?
                                               merged-input-state-hash
                                               (string->symbol
                                                (string-append
                                                 name
                                                 "state976")))
                                            (add1
                                             (cdr
                                              (assoc-ref
                                               merged-input-state-hash
                                               (string->symbol
                                                (string-append
                                                 name
                                                 "state976")))))
                                            0))))
                                       (append
                                        (list
                                         (cons
                                          (string->symbol
                                           (string-append name "state974"))
                                          (cons
                                           (signal-value btor995)
                                           (if (assoc-has-key?
                                                merged-input-state-hash
                                                (string->symbol
                                                 (string-append
                                                  name
                                                  "state974")))
                                             (add1
                                              (cdr
                                               (assoc-ref
                                                merged-input-state-hash
                                                (string->symbol
                                                 (string-append
                                                  name
                                                  "state974")))))
                                             0))))
                                        (append
                                         (list
                                          (cons
                                           (string->symbol
                                            (string-append name "state877"))
                                           (cons
                                            (signal-value btor876)
                                            (if (assoc-has-key?
                                                 merged-input-state-hash
                                                 (string->symbol
                                                  (string-append
                                                   name
                                                   "state877")))
                                              (add1
                                               (cdr
                                                (assoc-ref
                                                 merged-input-state-hash
                                                 (string->symbol
                                                  (string-append
                                                   name
                                                   "state877")))))
                                              0))))
                                         (append
                                          (list
                                           (cons
                                            (string->symbol
                                             (string-append name "state863"))
                                            (cons
                                             (signal-value btor1999)
                                             (if (assoc-has-key?
                                                  merged-input-state-hash
                                                  (string->symbol
                                                   (string-append
                                                    name
                                                    "state863")))
                                               (add1
                                                (cdr
                                                 (assoc-ref
                                                  merged-input-state-hash
                                                  (string->symbol
                                                   (string-append
                                                    name
                                                    "state863")))))
                                               0))))
                                          (append
                                           (list
                                            (cons
                                             (string->symbol
                                              (string-append name "state862"))
                                             (cons
                                              (signal-value btor882)
                                              (if (assoc-has-key?
                                                   merged-input-state-hash
                                                   (string->symbol
                                                    (string-append
                                                     name
                                                     "state862")))
                                                (add1
                                                 (cdr
                                                  (assoc-ref
                                                   merged-input-state-hash
                                                   (string->symbol
                                                    (string-append
                                                     name
                                                     "state862")))))
                                                0))))
                                           (append
                                            (list
                                             (cons
                                              (string->symbol
                                               (string-append name "state673"))
                                              (cons
                                               (signal-value btor672)
                                               (if (assoc-has-key?
                                                    merged-input-state-hash
                                                    (string->symbol
                                                     (string-append
                                                      name
                                                      "state673")))
                                                 (add1
                                                  (cdr
                                                   (assoc-ref
                                                    merged-input-state-hash
                                                    (string->symbol
                                                     (string-append
                                                      name
                                                      "state673")))))
                                                 0))))
                                            (append
                                             (list
                                              (cons
                                               (string->symbol
                                                (string-append
                                                 name
                                                 "state659"))
                                               (cons
                                                (signal-value btor1994)
                                                (if (assoc-has-key?
                                                     merged-input-state-hash
                                                     (string->symbol
                                                      (string-append
                                                       name
                                                       "state659")))
                                                  (add1
                                                   (cdr
                                                    (assoc-ref
                                                     merged-input-state-hash
                                                     (string->symbol
                                                      (string-append
                                                       name
                                                       "state659")))))
                                                  0))))
                                             (append
                                              (list
                                               (cons
                                                (string->symbol
                                                 (string-append
                                                  name
                                                  "state657"))
                                                (cons
                                                 (signal-value btor678)
                                                 (if (assoc-has-key?
                                                      merged-input-state-hash
                                                      (string->symbol
                                                       (string-append
                                                        name
                                                        "state657")))
                                                   (add1
                                                    (cdr
                                                     (assoc-ref
                                                      merged-input-state-hash
                                                      (string->symbol
                                                       (string-append
                                                        name
                                                        "state657")))))
                                                   0))))
                                              (append
                                               (list
                                                (cons
                                                 (string->symbol
                                                  (string-append
                                                   name
                                                   "state635"))
                                                 (cons
                                                  (signal-value btor634)
                                                  (if (assoc-has-key?
                                                       merged-input-state-hash
                                                       (string->symbol
                                                        (string-append
                                                         name
                                                         "state635")))
                                                    (add1
                                                     (cdr
                                                      (assoc-ref
                                                       merged-input-state-hash
                                                       (string->symbol
                                                        (string-append
                                                         name
                                                         "state635")))))
                                                    0))))
                                               (append
                                                (list
                                                 (cons
                                                  (string->symbol
                                                   (string-append
                                                    name
                                                    "state621"))
                                                  (cons
                                                   (signal-value btor1989)
                                                   (if (assoc-has-key?
                                                        merged-input-state-hash
                                                        (string->symbol
                                                         (string-append
                                                          name
                                                          "state621")))
                                                     (add1
                                                      (cdr
                                                       (assoc-ref
                                                        merged-input-state-hash
                                                        (string->symbol
                                                         (string-append
                                                          name
                                                          "state621")))))
                                                     0))))
                                                (append
                                                 (list
                                                  (cons
                                                   (string->symbol
                                                    (string-append
                                                     name
                                                     "state620"))
                                                   (cons
                                                    (signal-value btor640)
                                                    (if (assoc-has-key?
                                                         merged-input-state-hash
                                                         (string->symbol
                                                          (string-append
                                                           name
                                                           "state620")))
                                                      (add1
                                                       (cdr
                                                        (assoc-ref
                                                         merged-input-state-hash
                                                         (string->symbol
                                                          (string-append
                                                           name
                                                           "state620")))))
                                                      0))))
                                                 (append
                                                  (list
                                                   (cons
                                                    (string->symbol
                                                     (string-append
                                                      name
                                                      "state614"))
                                                    (cons
                                                     (signal-value btor613)
                                                     (if (assoc-has-key?
                                                          merged-input-state-hash
                                                          (string->symbol
                                                           (string-append
                                                            name
                                                            "state614")))
                                                       (add1
                                                        (cdr
                                                         (assoc-ref
                                                          merged-input-state-hash
                                                          (string->symbol
                                                           (string-append
                                                            name
                                                            "state614")))))
                                                       0))))
                                                  (append
                                                   (list
                                                    (cons
                                                     (string->symbol
                                                      (string-append
                                                       name
                                                       "state600"))
                                                     (cons
                                                      (signal-value btor1984)
                                                      (if (assoc-has-key?
                                                           merged-input-state-hash
                                                           (string->symbol
                                                            (string-append
                                                             name
                                                             "state600")))
                                                        (add1
                                                         (cdr
                                                          (assoc-ref
                                                           merged-input-state-hash
                                                           (string->symbol
                                                            (string-append
                                                             name
                                                             "state600")))))
                                                        0))))
                                                   (append
                                                    (list
                                                     (cons
                                                      (string->symbol
                                                       (string-append
                                                        name
                                                        "state599"))
                                                      (cons
                                                       (signal-value btor619)
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
                                                         "state534"))
                                                       (cons
                                                        (signal-value btor533)
                                                        (if (assoc-has-key?
                                                             merged-input-state-hash
                                                             (string->symbol
                                                              (string-append
                                                               name
                                                               "state534")))
                                                          (add1
                                                           (cdr
                                                            (assoc-ref
                                                             merged-input-state-hash
                                                             (string->symbol
                                                              (string-append
                                                               name
                                                               "state534")))))
                                                          0))))
                                                     (append
                                                      (list
                                                       (cons
                                                        (string->symbol
                                                         (string-append
                                                          name
                                                          "state520"))
                                                        (cons
                                                         (signal-value
                                                          btor1979)
                                                         (if (assoc-has-key?
                                                              merged-input-state-hash
                                                              (string->symbol
                                                               (string-append
                                                                name
                                                                "state520")))
                                                           (add1
                                                            (cdr
                                                             (assoc-ref
                                                              merged-input-state-hash
                                                              (string->symbol
                                                               (string-append
                                                                name
                                                                "state520")))))
                                                           0))))
                                                      (append
                                                       (list
                                                        (cons
                                                         (string->symbol
                                                          (string-append
                                                           name
                                                           "state519"))
                                                         (cons
                                                          (signal-value
                                                           btor539)
                                                          (if (assoc-has-key?
                                                               merged-input-state-hash
                                                               (string->symbol
                                                                (string-append
                                                                 name
                                                                 "state519")))
                                                            (add1
                                                             (cdr
                                                              (assoc-ref
                                                               merged-input-state-hash
                                                               (string->symbol
                                                                (string-append
                                                                 name
                                                                 "state519")))))
                                                            0))))
                                                       (append
                                                        (list
                                                         (cons
                                                          (string->symbol
                                                           (string-append
                                                            name
                                                            "state513"))
                                                          (cons
                                                           (signal-value
                                                            btor512)
                                                           (if (assoc-has-key?
                                                                merged-input-state-hash
                                                                (string->symbol
                                                                 (string-append
                                                                  name
                                                                  "state513")))
                                                             (add1
                                                              (cdr
                                                               (assoc-ref
                                                                merged-input-state-hash
                                                                (string->symbol
                                                                 (string-append
                                                                  name
                                                                  "state513")))))
                                                             0))))
                                                        (append
                                                         (list
                                                          (cons
                                                           (string->symbol
                                                            (string-append
                                                             name
                                                             "state499"))
                                                           (cons
                                                            (signal-value
                                                             btor1974)
                                                            (if (assoc-has-key?
                                                                 merged-input-state-hash
                                                                 (string->symbol
                                                                  (string-append
                                                                   name
                                                                   "state499")))
                                                              (add1
                                                               (cdr
                                                                (assoc-ref
                                                                 merged-input-state-hash
                                                                 (string->symbol
                                                                  (string-append
                                                                   name
                                                                   "state499")))))
                                                              0))))
                                                         (append
                                                          (list
                                                           (cons
                                                            (string->symbol
                                                             (string-append
                                                              name
                                                              "state498"))
                                                            (cons
                                                             (signal-value
                                                              btor518)
                                                             (if (assoc-has-key?
                                                                  merged-input-state-hash
                                                                  (string->symbol
                                                                   (string-append
                                                                    name
                                                                    "state498")))
                                                               (add1
                                                                (cdr
                                                                 (assoc-ref
                                                                  merged-input-state-hash
                                                                  (string->symbol
                                                                   (string-append
                                                                    name
                                                                    "state498")))))
                                                               0))))
                                                          (append
                                                           (list
                                                            (cons
                                                             (string->symbol
                                                              (string-append
                                                               name
                                                               "state341"))
                                                             (cons
                                                              (signal-value
                                                               btor339)
                                                              (if (assoc-has-key?
                                                                   merged-input-state-hash
                                                                   (string->symbol
                                                                    (string-append
                                                                     name
                                                                     "state341")))
                                                                (add1
                                                                 (cdr
                                                                  (assoc-ref
                                                                   merged-input-state-hash
                                                                   (string->symbol
                                                                    (string-append
                                                                     name
                                                                     "state341")))))
                                                                0))))
                                                           (append
                                                            (list
                                                             (cons
                                                              (string->symbol
                                                               (string-append
                                                                name
                                                                "state321"))
                                                              (cons
                                                               (signal-value
                                                                btor1969)
                                                               (if (assoc-has-key?
                                                                    merged-input-state-hash
                                                                    (string->symbol
                                                                     (string-append
                                                                      name
                                                                      "state321")))
                                                                 (add1
                                                                  (cdr
                                                                   (assoc-ref
                                                                    merged-input-state-hash
                                                                    (string->symbol
                                                                     (string-append
                                                                      name
                                                                      "state321")))))
                                                                 0))))
                                                            (append
                                                             (list
                                                              (cons
                                                               (string->symbol
                                                                (string-append
                                                                 name
                                                                 "state319"))
                                                               (cons
                                                                (signal-value
                                                                 btor347)
                                                                (if (assoc-has-key?
                                                                     merged-input-state-hash
                                                                     (string->symbol
                                                                      (string-append
                                                                       name
                                                                       "state319")))
                                                                  (add1
                                                                   (cdr
                                                                    (assoc-ref
                                                                     merged-input-state-hash
                                                                     (string->symbol
                                                                      (string-append
                                                                       name
                                                                       "state319")))))
                                                                  0))))
                                                             (list))))))))))))))))))))))))))))))))))))))))))))))))
              merged-input-state-hash)
             equal?
             #:key
             car)))
      (list
       (cons 'EQPATB (signal (signal-value btor1218) output-state))
       (cons 'R28 (signal (signal-value btor1373) output-state))
       (cons 'R42 (signal (signal-value btor1405) output-state))
       (cons 'R33 (signal (signal-value btor1385) output-state))
       (cons 'R22 (signal (signal-value btor1361) output-state))
       (cons 'R48 (signal (signal-value btor1417) output-state))
       (cons 'R39 (signal (signal-value btor1397) output-state))
       (cons 'R10 (signal (signal-value btor1311) output-state))
       (cons 'R1 (signal (signal-value btor1309) output-state))
       (cons 'R4 (signal (signal-value btor1399) output-state))
       (cons 'R47 (signal (signal-value btor1415) output-state))
       (cons 'R51 (signal (signal-value btor1425) output-state))
       (cons 'UNDER (signal (signal-value btor1446) output-state))
       (cons 'R34 (signal (signal-value btor1387) output-state))
       (cons 'R17 (signal (signal-value btor1325) output-state))
       (cons 'R27 (signal (signal-value btor1371) output-state))
       (cons 'R49 (signal (signal-value btor1419) output-state))
       (cons 'R43 (signal (signal-value btor1407) output-state))
       (cons 'R32 (signal (signal-value btor1383) output-state))
       (cons 'EQZM (signal (signal-value btor1235) output-state))
       (cons 'R38 (signal (signal-value btor1395) output-state))
       (cons 'R23 (signal (signal-value btor1363) output-state))
       (cons 'R29 (signal (signal-value btor1375) output-state))
       (cons 'R46 (signal (signal-value btor1413) output-state))
       (cons 'R50 (signal (signal-value btor1423) output-state))
       (cons 'R26 (signal (signal-value btor1369) output-state))
       (cons 'R35 (signal (signal-value btor1389) output-state))
       (cons 'R16 (signal (signal-value btor1323) output-state))
       (cons 'R11 (signal (signal-value btor1313) output-state))
       (cons 'R5 (signal (signal-value btor1421) output-state))
       (cons 'R0 (signal (signal-value btor1307) output-state))
       (cons 'R3 (signal (signal-value btor1377) output-state))
       (cons 'R6 (signal (signal-value btor1431) output-state))
       (cons 'R18 (signal (signal-value btor1351) output-state))
       (cons 'R9 (signal (signal-value btor1437) output-state))
       (cons 'R36 (signal (signal-value btor1391) output-state))
       (cons 'R25 (signal (signal-value btor1367) output-state))
       (cons 'R12 (signal (signal-value btor1315) output-state))
       (cons 'R15 (signal (signal-value btor1321) output-state))
       (cons 'OVERUNDER (signal (signal-value btor1280) output-state))
       (cons 'R40 (signal (signal-value btor1401) output-state))
       (cons 'R45 (signal (signal-value btor1411) output-state))
       (cons 'OVER (signal (signal-value btor1244) output-state))
       (cons 'R53 (signal (signal-value btor1429) output-state))
       (cons 'R20 (signal (signal-value btor1357) output-state))
       (cons 'SIGNEDR (signal (signal-value btor1439) output-state))
       (cons 'EQPAT (signal (signal-value btor1210) output-state))
       (cons 'R31 (signal (signal-value btor1381) output-state))
       (cons 'R37 (signal (signal-value btor1393) output-state))
       (cons 'R13 (signal (signal-value btor1317) output-state))
       (cons 'R7 (signal (signal-value btor1433) output-state))
       (cons 'EQZ (signal (signal-value btor1226) output-state))
       (cons 'R19 (signal (signal-value btor1353) output-state))
       (cons 'R2 (signal (signal-value btor1355) output-state))
       (cons 'R8 (signal (signal-value btor1435) output-state))
       (cons 'R21 (signal (signal-value btor1359) output-state))
       (cons 'R30 (signal (signal-value btor1379) output-state))
       (cons 'EQOM (signal (signal-value btor1193) output-state))
       (cons 'R44 (signal (signal-value btor1409) output-state))
       (cons 'R14 (signal (signal-value btor1319) output-state))
       (cons 'R52 (signal (signal-value btor1427) output-state))
       (cons 'R41 (signal (signal-value btor1403) output-state))
       (cons 'R24 (signal (signal-value btor1365) output-state))))))
