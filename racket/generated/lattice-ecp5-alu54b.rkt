#lang racket/base
(provide lattice-ecp5-alu54b)
(require "../signal.rkt")
(require rosette)
(define lattice-ecp5-alu54b
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
      #:CFB0
      (CFB0 (bv->signal (constant 'CFB0 (bitvector 1))))
      #:CFB1
      (CFB1 (bv->signal (constant 'CFB1 (bitvector 1))))
      #:CFB10
      (CFB10 (bv->signal (constant 'CFB10 (bitvector 1))))
      #:CFB11
      (CFB11 (bv->signal (constant 'CFB11 (bitvector 1))))
      #:CFB12
      (CFB12 (bv->signal (constant 'CFB12 (bitvector 1))))
      #:CFB13
      (CFB13 (bv->signal (constant 'CFB13 (bitvector 1))))
      #:CFB14
      (CFB14 (bv->signal (constant 'CFB14 (bitvector 1))))
      #:CFB15
      (CFB15 (bv->signal (constant 'CFB15 (bitvector 1))))
      #:CFB16
      (CFB16 (bv->signal (constant 'CFB16 (bitvector 1))))
      #:CFB17
      (CFB17 (bv->signal (constant 'CFB17 (bitvector 1))))
      #:CFB18
      (CFB18 (bv->signal (constant 'CFB18 (bitvector 1))))
      #:CFB19
      (CFB19 (bv->signal (constant 'CFB19 (bitvector 1))))
      #:CFB2
      (CFB2 (bv->signal (constant 'CFB2 (bitvector 1))))
      #:CFB20
      (CFB20 (bv->signal (constant 'CFB20 (bitvector 1))))
      #:CFB21
      (CFB21 (bv->signal (constant 'CFB21 (bitvector 1))))
      #:CFB22
      (CFB22 (bv->signal (constant 'CFB22 (bitvector 1))))
      #:CFB23
      (CFB23 (bv->signal (constant 'CFB23 (bitvector 1))))
      #:CFB24
      (CFB24 (bv->signal (constant 'CFB24 (bitvector 1))))
      #:CFB25
      (CFB25 (bv->signal (constant 'CFB25 (bitvector 1))))
      #:CFB26
      (CFB26 (bv->signal (constant 'CFB26 (bitvector 1))))
      #:CFB27
      (CFB27 (bv->signal (constant 'CFB27 (bitvector 1))))
      #:CFB28
      (CFB28 (bv->signal (constant 'CFB28 (bitvector 1))))
      #:CFB29
      (CFB29 (bv->signal (constant 'CFB29 (bitvector 1))))
      #:CFB3
      (CFB3 (bv->signal (constant 'CFB3 (bitvector 1))))
      #:CFB30
      (CFB30 (bv->signal (constant 'CFB30 (bitvector 1))))
      #:CFB31
      (CFB31 (bv->signal (constant 'CFB31 (bitvector 1))))
      #:CFB32
      (CFB32 (bv->signal (constant 'CFB32 (bitvector 1))))
      #:CFB33
      (CFB33 (bv->signal (constant 'CFB33 (bitvector 1))))
      #:CFB34
      (CFB34 (bv->signal (constant 'CFB34 (bitvector 1))))
      #:CFB35
      (CFB35 (bv->signal (constant 'CFB35 (bitvector 1))))
      #:CFB36
      (CFB36 (bv->signal (constant 'CFB36 (bitvector 1))))
      #:CFB37
      (CFB37 (bv->signal (constant 'CFB37 (bitvector 1))))
      #:CFB38
      (CFB38 (bv->signal (constant 'CFB38 (bitvector 1))))
      #:CFB39
      (CFB39 (bv->signal (constant 'CFB39 (bitvector 1))))
      #:CFB4
      (CFB4 (bv->signal (constant 'CFB4 (bitvector 1))))
      #:CFB40
      (CFB40 (bv->signal (constant 'CFB40 (bitvector 1))))
      #:CFB41
      (CFB41 (bv->signal (constant 'CFB41 (bitvector 1))))
      #:CFB42
      (CFB42 (bv->signal (constant 'CFB42 (bitvector 1))))
      #:CFB43
      (CFB43 (bv->signal (constant 'CFB43 (bitvector 1))))
      #:CFB44
      (CFB44 (bv->signal (constant 'CFB44 (bitvector 1))))
      #:CFB45
      (CFB45 (bv->signal (constant 'CFB45 (bitvector 1))))
      #:CFB46
      (CFB46 (bv->signal (constant 'CFB46 (bitvector 1))))
      #:CFB47
      (CFB47 (bv->signal (constant 'CFB47 (bitvector 1))))
      #:CFB48
      (CFB48 (bv->signal (constant 'CFB48 (bitvector 1))))
      #:CFB49
      (CFB49 (bv->signal (constant 'CFB49 (bitvector 1))))
      #:CFB5
      (CFB5 (bv->signal (constant 'CFB5 (bitvector 1))))
      #:CFB50
      (CFB50 (bv->signal (constant 'CFB50 (bitvector 1))))
      #:CFB51
      (CFB51 (bv->signal (constant 'CFB51 (bitvector 1))))
      #:CFB52
      (CFB52 (bv->signal (constant 'CFB52 (bitvector 1))))
      #:CFB53
      (CFB53 (bv->signal (constant 'CFB53 (bitvector 1))))
      #:CFB6
      (CFB6 (bv->signal (constant 'CFB6 (bitvector 1))))
      #:CFB7
      (CFB7 (bv->signal (constant 'CFB7 (bitvector 1))))
      #:CFB8
      (CFB8 (bv->signal (constant 'CFB8 (bitvector 1))))
      #:CFB9
      (CFB9 (bv->signal (constant 'CFB9 (bitvector 1))))
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
      #:FORCE_ZERO_BARREL_SHIFT
      (FORCE_ZERO_BARREL_SHIFT
       (bv->signal (constant 'FORCE_ZERO_BARREL_SHIFT (bitvector 5))))
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
      #:REG_INPUTCFB_CE
      (REG_INPUTCFB_CE (bv->signal (constant 'REG_INPUTCFB_CE (bitvector 5))))
      #:REG_INPUTCFB_CLK
      (REG_INPUTCFB_CLK
       (bv->signal (constant 'REG_INPUTCFB_CLK (bitvector 5))))
      #:REG_INPUTCFB_RST
      (REG_INPUTCFB_RST
       (bv->signal (constant 'REG_INPUTCFB_RST (bitvector 5))))
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
               (string->symbol (string-append name "state1901"))
               (bv 0 (bitvector 7))))
             (append
              (list
               (cons
                (string->symbol (string-append name "state1897"))
                (bv 0 (bitvector 7))))
              (append
               (list
                (cons
                 (string->symbol (string-append name "state1854"))
                 (bv 0 (bitvector 1))))
               (append
                (list
                 (cons
                  (string->symbol (string-append name "state1850"))
                  (bv 0 (bitvector 1))))
                (append
                 (list
                  (cons
                   (string->symbol (string-append name "state1835"))
                   (bv 0 (bitvector 3))))
                 (append
                  (list
                   (cons
                    (string->symbol (string-append name "state1831"))
                    (bv 0 (bitvector 3))))
                  (append
                   (list
                    (cons
                     (string->symbol (string-append name "state1599"))
                     (bv 0 (bitvector 3))))
                   (append
                    (list
                     (cons
                      (string->symbol (string-append name "state1595"))
                      (bv 0 (bitvector 3))))
                    (append
                     (list
                      (cons
                       (string->symbol (string-append name "state1211"))
                       (bv 0 (bitvector 27))))
                     (append
                      (list
                       (cons
                        (string->symbol (string-append name "state971"))
                        (bv 0 (bitvector 27))))
                      (append
                       (list
                        (cons
                         (string->symbol (string-append name "state961"))
                         (bv 0 (bitvector 7))))
                       (append
                        (list
                         (cons
                          (string->symbol (string-append name "state957"))
                          (bv 0 (bitvector 7))))
                        (append
                         (list
                          (cons
                           (string->symbol (string-append name "state899"))
                           (bv 0 (bitvector 1))))
                         (append
                          (list
                           (cons
                            (string->symbol (string-append name "state895"))
                            (bv 0 (bitvector 1))))
                          (append
                           (list
                            (cons
                             (string->symbol (string-append name "state802"))
                             (bv 0 (bitvector 1))))
                           (append
                            (list
                             (cons
                              (string->symbol (string-append name "state798"))
                              (bv 0 (bitvector 1))))
                            (append
                             (list
                              (cons
                               (string->symbol (string-append name "state703"))
                               (bv 0 (bitvector 37))))
                             (append
                              (list
                               (cons
                                (string->symbol
                                 (string-append name "state699"))
                                (bv 0 (bitvector 37))))
                              (append
                               (list
                                (cons
                                 (string->symbol
                                  (string-append name "state674"))
                                 (bv 0 (bitvector 18))))
                               (append
                                (list
                                 (cons
                                  (string->symbol
                                   (string-append name "state667"))
                                  (bv 0 (bitvector 1))))
                                (append
                                 (list
                                  (cons
                                   (string->symbol
                                    (string-append name "state663"))
                                   (bv 0 (bitvector 1))))
                                 (append
                                  (list
                                   (cons
                                    (string->symbol
                                     (string-append name "state657"))
                                    (bv 0 (bitvector 1))))
                                  (append
                                   (list
                                    (cons
                                     (string->symbol
                                      (string-append name "state653"))
                                     (bv 0 (bitvector 1))))
                                   (append
                                    (list
                                     (cons
                                      (string->symbol
                                       (string-append name "state647"))
                                      (bv 0 (bitvector 1))))
                                    (append
                                     (list
                                      (cons
                                       (string->symbol
                                        (string-append name "state643"))
                                       (bv 0 (bitvector 1))))
                                     (append
                                      (list
                                       (cons
                                        (string->symbol
                                         (string-append name "state637"))
                                        (bv 0 (bitvector 1))))
                                      (append
                                       (list
                                        (cons
                                         (string->symbol
                                          (string-append name "state633"))
                                         (bv 0 (bitvector 1))))
                                       (append
                                        (list
                                         (cons
                                          (string->symbol
                                           (string-append name "state627"))
                                          (bv 0 (bitvector 1))))
                                        (append
                                         (list
                                          (cons
                                           (string->symbol
                                            (string-append name "state623"))
                                           (bv 0 (bitvector 1))))
                                         (append
                                          (list
                                           (cons
                                            (string->symbol
                                             (string-append name "state617"))
                                            (bv 0 (bitvector 1))))
                                          (append
                                           (list
                                            (cons
                                             (string->symbol
                                              (string-append name "state613"))
                                             (bv 0 (bitvector 1))))
                                           (append
                                            (list
                                             (cons
                                              (string->symbol
                                               (string-append name "state604"))
                                              (bv 0 (bitvector 1))))
                                            (append
                                             (list
                                              (cons
                                               (string->symbol
                                                (string-append
                                                 name
                                                 "state602"))
                                               (bv 0 (bitvector 1))))
                                             (append
                                              (list
                                               (cons
                                                (string->symbol
                                                 (string-append
                                                  name
                                                  "state595"))
                                                (bv 1 (bitvector 1))))
                                              (append
                                               (list
                                                (cons
                                                 (string->symbol
                                                  (string-append
                                                   name
                                                   "state593"))
                                                 (bv 0 (bitvector 1))))
                                               (append
                                                (list
                                                 (cons
                                                  (string->symbol
                                                   (string-append
                                                    name
                                                    "state371"))
                                                  (bv 1 (bitvector 1))))
                                                (append
                                                 (list
                                                  (cons
                                                   (string->symbol
                                                    (string-append
                                                     name
                                                     "state351"))
                                                   (bv 0 (bitvector 54))))
                                                 (list)))))))))))))))))))))))))))))))))))))))
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
           (btor132 CFB0)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CFB0)))
           (btor133 CFB1)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CFB1)))
           (btor134 CFB10)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CFB10)))
           (btor135 CFB11)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CFB11)))
           (btor136 CFB12)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CFB12)))
           (btor137 CFB13)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CFB13)))
           (btor138 CFB14)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CFB14)))
           (btor139 CFB15)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CFB15)))
           (btor140 CFB16)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CFB16)))
           (btor141 CFB17)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CFB17)))
           (btor142 CFB18)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CFB18)))
           (btor143 CFB19)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CFB19)))
           (btor144 CFB2)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CFB2)))
           (btor145 CFB20)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CFB20)))
           (btor146 CFB21)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CFB21)))
           (btor147 CFB22)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CFB22)))
           (btor148 CFB23)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CFB23)))
           (btor149 CFB24)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CFB24)))
           (btor150 CFB25)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CFB25)))
           (btor151 CFB26)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CFB26)))
           (btor152 CFB27)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CFB27)))
           (btor153 CFB28)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CFB28)))
           (btor154 CFB29)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CFB29)))
           (btor155 CFB3)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CFB3)))
           (btor156 CFB30)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CFB30)))
           (btor157 CFB31)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CFB31)))
           (btor158 CFB32)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CFB32)))
           (btor159 CFB33)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CFB33)))
           (btor160 CFB34)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CFB34)))
           (btor161 CFB35)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CFB35)))
           (btor162 CFB36)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CFB36)))
           (btor163 CFB37)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CFB37)))
           (btor164 CFB38)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CFB38)))
           (btor165 CFB39)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CFB39)))
           (btor166 CFB4)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CFB4)))
           (btor167 CFB40)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CFB40)))
           (btor168 CFB41)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CFB41)))
           (btor169 CFB42)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CFB42)))
           (btor170 CFB43)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CFB43)))
           (btor171 CFB44)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CFB44)))
           (btor172 CFB45)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CFB45)))
           (btor173 CFB46)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CFB46)))
           (btor174 CFB47)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CFB47)))
           (btor175 CFB48)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CFB48)))
           (btor176 CFB49)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CFB49)))
           (btor177 CFB5)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CFB5)))
           (btor178 CFB50)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CFB50)))
           (btor179 CFB51)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CFB51)))
           (btor180 CFB52)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CFB52)))
           (btor181 CFB53)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CFB53)))
           (btor182 CFB6)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CFB6)))
           (btor183 CFB7)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CFB7)))
           (btor184 CFB8)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CFB8)))
           (btor185 CFB9)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CFB9)))
           (btor186 CIN0)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN0)))
           (btor187 CIN1)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN1)))
           (btor188 CIN10)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN10)))
           (btor189 CIN11)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN11)))
           (btor190 CIN12)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN12)))
           (btor191 CIN13)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN13)))
           (btor192 CIN14)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN14)))
           (btor193 CIN15)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN15)))
           (btor194 CIN16)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN16)))
           (btor195 CIN17)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN17)))
           (btor196 CIN18)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN18)))
           (btor197 CIN19)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN19)))
           (btor198 CIN2)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN2)))
           (btor199 CIN20)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN20)))
           (btor200 CIN21)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN21)))
           (btor201 CIN22)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN22)))
           (btor202 CIN23)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN23)))
           (btor203 CIN24)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN24)))
           (btor204 CIN25)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN25)))
           (btor205 CIN26)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN26)))
           (btor206 CIN27)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN27)))
           (btor207 CIN28)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN28)))
           (btor208 CIN29)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN29)))
           (btor209 CIN3)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN3)))
           (btor210 CIN30)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN30)))
           (btor211 CIN31)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN31)))
           (btor212 CIN32)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN32)))
           (btor213 CIN33)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN33)))
           (btor214 CIN34)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN34)))
           (btor215 CIN35)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN35)))
           (btor216 CIN36)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN36)))
           (btor217 CIN37)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN37)))
           (btor218 CIN38)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN38)))
           (btor219 CIN39)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN39)))
           (btor220 CIN4)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN4)))
           (btor221 CIN40)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN40)))
           (btor222 CIN41)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN41)))
           (btor223 CIN42)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN42)))
           (btor224 CIN43)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN43)))
           (btor225 CIN44)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN44)))
           (btor226 CIN45)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN45)))
           (btor227 CIN46)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN46)))
           (btor228 CIN47)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN47)))
           (btor229 CIN48)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN48)))
           (btor230 CIN49)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN49)))
           (btor231 CIN5)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN5)))
           (btor232 CIN50)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN50)))
           (btor233 CIN51)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN51)))
           (btor234 CIN52)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN52)))
           (btor235 CIN53)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN53)))
           (btor236 CIN6)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN6)))
           (btor237 CIN7)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN7)))
           (btor238 CIN8)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN8)))
           (btor239 CIN9)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CIN9)))
           (btor240 CLK0)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CLK0)))
           (btor241 CLK1)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CLK1)))
           (btor242 CLK2)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CLK2)))
           (btor243 CLK3)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CLK3)))
           (btor244 (bitvector 5))
           (btor245 FORCE_ZERO_BARREL_SHIFT)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state FORCE_ZERO_BARREL_SHIFT)))
           (btor246 LEGACY)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state LEGACY)))
           (btor247 MA0)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MA0)))
           (btor248 MA1)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MA1)))
           (btor249 MA10)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MA10)))
           (btor250 MA11)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MA11)))
           (btor251 MA12)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MA12)))
           (btor252 MA13)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MA13)))
           (btor253 MA14)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MA14)))
           (btor254 MA15)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MA15)))
           (btor255 MA16)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MA16)))
           (btor256 MA17)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MA17)))
           (btor257 MA18)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MA18)))
           (btor258 MA19)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MA19)))
           (btor259 MA2)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MA2)))
           (btor260 MA20)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MA20)))
           (btor261 MA21)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MA21)))
           (btor262 MA22)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MA22)))
           (btor263 MA23)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MA23)))
           (btor264 MA24)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MA24)))
           (btor265 MA25)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MA25)))
           (btor266 MA26)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MA26)))
           (btor267 MA27)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MA27)))
           (btor268 MA28)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MA28)))
           (btor269 MA29)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MA29)))
           (btor270 MA3)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MA3)))
           (btor271 MA30)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MA30)))
           (btor272 MA31)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MA31)))
           (btor273 MA32)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MA32)))
           (btor274 MA33)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MA33)))
           (btor275 MA34)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MA34)))
           (btor276 MA35)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MA35)))
           (btor277 MA4)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MA4)))
           (btor278 MA5)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MA5)))
           (btor279 MA6)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MA6)))
           (btor280 MA7)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MA7)))
           (btor281 MA8)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MA8)))
           (btor282 MA9)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MA9)))
           (btor283 (bitvector 56))
           (btor284 MASK01)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MASK01)))
           (btor285 MASKPAT)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MASKPAT)))
           (btor286 MASKPAT_SOURCE)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state MASKPAT_SOURCE)))
           (btor287 MB0)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MB0)))
           (btor288 MB1)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MB1)))
           (btor289 MB10)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MB10)))
           (btor290 MB11)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MB11)))
           (btor291 MB12)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MB12)))
           (btor292 MB13)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MB13)))
           (btor293 MB14)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MB14)))
           (btor294 MB15)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MB15)))
           (btor295 MB16)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MB16)))
           (btor296 MB17)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MB17)))
           (btor297 MB18)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MB18)))
           (btor298 MB19)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MB19)))
           (btor299 MB2)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MB2)))
           (btor300 MB20)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MB20)))
           (btor301 MB21)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MB21)))
           (btor302 MB22)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MB22)))
           (btor303 MB23)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MB23)))
           (btor304 MB24)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MB24)))
           (btor305 MB25)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MB25)))
           (btor306 MB26)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MB26)))
           (btor307 MB27)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MB27)))
           (btor308 MB28)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MB28)))
           (btor309 MB29)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MB29)))
           (btor310 MB3)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MB3)))
           (btor311 MB30)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MB30)))
           (btor312 MB31)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MB31)))
           (btor313 MB32)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MB32)))
           (btor314 MB33)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MB33)))
           (btor315 MB34)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MB34)))
           (btor316 MB35)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MB35)))
           (btor317 MB4)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MB4)))
           (btor318 MB5)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MB5)))
           (btor319 MB6)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MB6)))
           (btor320 MB7)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MB7)))
           (btor321 MB8)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MB8)))
           (btor322 MB9)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MB9)))
           (btor323 MCPAT)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MCPAT)))
           (btor324 MCPAT_SOURCE)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MCPAT_SOURCE)))
           (btor325 MULT9_MODE)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state MULT9_MODE)))
           (btor326 OP0)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state OP0)))
           (btor327 OP1)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state OP1)))
           (btor328 OP10)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state OP10)))
           (btor329 OP2)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state OP2)))
           (btor330 OP3)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state OP3)))
           (btor331 OP4)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state OP4)))
           (btor332 OP5)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state OP5)))
           (btor333 OP6)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state OP6)))
           (btor334 OP7)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state OP7)))
           (btor335 OP8)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state OP8)))
           (btor336 OP9)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state OP9)))
           (btor337 REG_INPUTCFB_CE)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state REG_INPUTCFB_CE)))
           (btor338 REG_INPUTCFB_CLK)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state REG_INPUTCFB_CLK)))
           (btor339 REG_INPUTCFB_RST)
           (merged-input-state-hash
            (merge-states
             merged-input-state-hash
             (signal-state REG_INPUTCFB_RST)))
           (btor340 RNDPAT)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state RNDPAT)))
           (btor341 RST0)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state RST0)))
           (btor342 RST1)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state RST1)))
           (btor343 RST2)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state RST2)))
           (btor344 RST3)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state RST3)))
           (btor345 SIGNEDCIN)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SIGNEDCIN)))
           (btor346 SIGNEDIA)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SIGNEDIA)))
           (btor347 SIGNEDIB)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state SIGNEDIB)))
           (btor348 (bitvector 54))
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
                          (bv 0 54))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor350 (bv->signal (bv 0 (bitvector 54))))
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
                          (bv 0 54))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor353 (bitvector 4))
           (btor354 (bv->signal (bv 14 (bitvector 4))))
           (btor355
            (bv->signal
             (zero-extend (signal-value btor354) (bitvector 5))
             btor354))
           (btor356
            (signal
             (bool->bitvector
              (bveq (signal-value btor338) (signal-value btor355)))
             (list)))
           (btor357
            (if (bitvector->bool (signal-value btor356)) btor243 btor240))
           (btor358 (bv->signal (bv 13 (bitvector 4))))
           (btor359
            (bv->signal
             (zero-extend (signal-value btor358) (bitvector 5))
             btor358))
           (btor360
            (signal
             (bool->bitvector
              (bveq (signal-value btor338) (signal-value btor359)))
             (list)))
           (btor361
            (if (bitvector->bool (signal-value btor360)) btor242 btor357))
           (btor362 (bv->signal (bv 12 (bitvector 4))))
           (btor363
            (bv->signal
             (zero-extend (signal-value btor362) (bitvector 5))
             btor362))
           (btor364
            (signal
             (bool->bitvector
              (bveq (signal-value btor338) (signal-value btor363)))
             (list)))
           (btor365
            (if (bitvector->bool (signal-value btor364)) btor241 btor361))
           (btor366 (bv->signal (bv 11 (bitvector 4))))
           (btor367
            (bv->signal
             (zero-extend (signal-value btor366) (bitvector 5))
             btor366))
           (btor368
            (signal
             (bool->bitvector
              (bveq (signal-value btor338) (signal-value btor367)))
             (list)))
           (btor369
            (if (bitvector->bool (signal-value btor368)) btor240 btor365))
           (btor370 (bv->signal (bv 1 (bitvector 1))))
           (btor371
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state371")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state371"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state371")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state371")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor373 (bitvector 2))
           (btor374
            (signal
             (concat (signal-value btor371) (signal-value btor369))
             (list)))
           (btor375
            (bv->signal
             (zero-extend (signal-value btor370) (bitvector 2))
             btor370))
           (btor376
            (signal
             (bool->bitvector
              (bveq (signal-value btor374) (signal-value btor375)))
             (list)))
           (btor377
            (if (bitvector->bool (signal-value btor376)) btor351 btor349))
           (btor378
            (signal
             (concat (signal-value btor133) (signal-value btor132))
             (list)))
           (btor379 (bitvector 3))
           (btor380
            (signal
             (concat (signal-value btor144) (signal-value btor378))
             (list)))
           (btor381
            (signal
             (concat (signal-value btor155) (signal-value btor380))
             (list)))
           (btor382
            (signal
             (concat (signal-value btor166) (signal-value btor381))
             (list)))
           (btor383 (bitvector 6))
           (btor384
            (signal
             (concat (signal-value btor177) (signal-value btor382))
             (list)))
           (btor385 (bitvector 7))
           (btor386
            (signal
             (concat (signal-value btor182) (signal-value btor384))
             (list)))
           (btor387 (bitvector 8))
           (btor388
            (signal
             (concat (signal-value btor183) (signal-value btor386))
             (list)))
           (btor389 (bitvector 9))
           (btor390
            (signal
             (concat (signal-value btor184) (signal-value btor388))
             (list)))
           (btor391 (bitvector 10))
           (btor392
            (signal
             (concat (signal-value btor185) (signal-value btor390))
             (list)))
           (btor393 (bitvector 11))
           (btor394
            (signal
             (concat (signal-value btor134) (signal-value btor392))
             (list)))
           (btor395 (bitvector 12))
           (btor396
            (signal
             (concat (signal-value btor135) (signal-value btor394))
             (list)))
           (btor397 (bitvector 13))
           (btor398
            (signal
             (concat (signal-value btor136) (signal-value btor396))
             (list)))
           (btor399 (bitvector 14))
           (btor400
            (signal
             (concat (signal-value btor137) (signal-value btor398))
             (list)))
           (btor401 (bitvector 15))
           (btor402
            (signal
             (concat (signal-value btor138) (signal-value btor400))
             (list)))
           (btor403 (bitvector 16))
           (btor404
            (signal
             (concat (signal-value btor139) (signal-value btor402))
             (list)))
           (btor405 (bitvector 17))
           (btor406
            (signal
             (concat (signal-value btor140) (signal-value btor404))
             (list)))
           (btor407 (bitvector 18))
           (btor408
            (signal
             (concat (signal-value btor141) (signal-value btor406))
             (list)))
           (btor409 (bitvector 19))
           (btor410
            (signal
             (concat (signal-value btor142) (signal-value btor408))
             (list)))
           (btor411 (bitvector 20))
           (btor412
            (signal
             (concat (signal-value btor143) (signal-value btor410))
             (list)))
           (btor413 (bitvector 21))
           (btor414
            (signal
             (concat (signal-value btor145) (signal-value btor412))
             (list)))
           (btor415 (bitvector 22))
           (btor416
            (signal
             (concat (signal-value btor146) (signal-value btor414))
             (list)))
           (btor417 (bitvector 23))
           (btor418
            (signal
             (concat (signal-value btor147) (signal-value btor416))
             (list)))
           (btor419 (bitvector 24))
           (btor420
            (signal
             (concat (signal-value btor148) (signal-value btor418))
             (list)))
           (btor421 (bitvector 25))
           (btor422
            (signal
             (concat (signal-value btor149) (signal-value btor420))
             (list)))
           (btor423 (bitvector 26))
           (btor424
            (signal
             (concat (signal-value btor150) (signal-value btor422))
             (list)))
           (btor425 (bitvector 27))
           (btor426
            (signal
             (concat (signal-value btor151) (signal-value btor424))
             (list)))
           (btor427 (bitvector 28))
           (btor428
            (signal
             (concat (signal-value btor152) (signal-value btor426))
             (list)))
           (btor429 (bitvector 29))
           (btor430
            (signal
             (concat (signal-value btor153) (signal-value btor428))
             (list)))
           (btor431 (bitvector 30))
           (btor432
            (signal
             (concat (signal-value btor154) (signal-value btor430))
             (list)))
           (btor433 (bitvector 31))
           (btor434
            (signal
             (concat (signal-value btor156) (signal-value btor432))
             (list)))
           (btor435 (bitvector 32))
           (btor436
            (signal
             (concat (signal-value btor157) (signal-value btor434))
             (list)))
           (btor437 (bitvector 33))
           (btor438
            (signal
             (concat (signal-value btor158) (signal-value btor436))
             (list)))
           (btor439 (bitvector 34))
           (btor440
            (signal
             (concat (signal-value btor159) (signal-value btor438))
             (list)))
           (btor441 (bitvector 35))
           (btor442
            (signal
             (concat (signal-value btor160) (signal-value btor440))
             (list)))
           (btor443 (bitvector 36))
           (btor444
            (signal
             (concat (signal-value btor161) (signal-value btor442))
             (list)))
           (btor445 (bitvector 37))
           (btor446
            (signal
             (concat (signal-value btor162) (signal-value btor444))
             (list)))
           (btor447 (bitvector 38))
           (btor448
            (signal
             (concat (signal-value btor163) (signal-value btor446))
             (list)))
           (btor449 (bitvector 39))
           (btor450
            (signal
             (concat (signal-value btor164) (signal-value btor448))
             (list)))
           (btor451 (bitvector 40))
           (btor452
            (signal
             (concat (signal-value btor165) (signal-value btor450))
             (list)))
           (btor453 (bitvector 41))
           (btor454
            (signal
             (concat (signal-value btor167) (signal-value btor452))
             (list)))
           (btor455 (bitvector 42))
           (btor456
            (signal
             (concat (signal-value btor168) (signal-value btor454))
             (list)))
           (btor457 (bitvector 43))
           (btor458
            (signal
             (concat (signal-value btor169) (signal-value btor456))
             (list)))
           (btor459 (bitvector 44))
           (btor460
            (signal
             (concat (signal-value btor170) (signal-value btor458))
             (list)))
           (btor461 (bitvector 45))
           (btor462
            (signal
             (concat (signal-value btor171) (signal-value btor460))
             (list)))
           (btor463 (bitvector 46))
           (btor464
            (signal
             (concat (signal-value btor172) (signal-value btor462))
             (list)))
           (btor465 (bitvector 47))
           (btor466
            (signal
             (concat (signal-value btor173) (signal-value btor464))
             (list)))
           (btor467 (bitvector 48))
           (btor468
            (signal
             (concat (signal-value btor174) (signal-value btor466))
             (list)))
           (btor469 (bitvector 49))
           (btor470
            (signal
             (concat (signal-value btor175) (signal-value btor468))
             (list)))
           (btor471 (bitvector 50))
           (btor472
            (signal
             (concat (signal-value btor176) (signal-value btor470))
             (list)))
           (btor473 (bitvector 51))
           (btor474
            (signal
             (concat (signal-value btor178) (signal-value btor472))
             (list)))
           (btor475 (bitvector 52))
           (btor476
            (signal
             (concat (signal-value btor179) (signal-value btor474))
             (list)))
           (btor477 (bitvector 53))
           (btor478
            (signal
             (concat (signal-value btor180) (signal-value btor476))
             (list)))
           (btor479
            (signal
             (concat (signal-value btor181) (signal-value btor478))
             (list)))
           (btor480
            (signal
             (apply bvor (bitvector->bits (signal-value btor338)))
             (signal-state btor338)))
           (btor481 (signal (bvnot (signal-value btor480)) (list)))
           (btor482
            (if (bitvector->bool (signal-value btor481)) btor479 btor377))
           (btor483
            (signal
             (extract 0 0 (signal-value btor482))
             (signal-state btor482)))
           (btor485
            (signal
             (extract 1 1 (signal-value btor482))
             (signal-state btor482)))
           (btor487
            (signal
             (extract 10 10 (signal-value btor482))
             (signal-state btor482)))
           (btor489
            (signal
             (extract 11 11 (signal-value btor482))
             (signal-state btor482)))
           (btor491
            (signal
             (extract 12 12 (signal-value btor482))
             (signal-state btor482)))
           (btor493
            (signal
             (extract 13 13 (signal-value btor482))
             (signal-state btor482)))
           (btor495
            (signal
             (extract 14 14 (signal-value btor482))
             (signal-state btor482)))
           (btor497
            (signal
             (extract 15 15 (signal-value btor482))
             (signal-state btor482)))
           (btor499
            (signal
             (extract 16 16 (signal-value btor482))
             (signal-state btor482)))
           (btor501
            (signal
             (extract 17 17 (signal-value btor482))
             (signal-state btor482)))
           (btor503
            (signal
             (extract 18 18 (signal-value btor482))
             (signal-state btor482)))
           (btor505
            (signal
             (extract 19 19 (signal-value btor482))
             (signal-state btor482)))
           (btor507
            (signal
             (extract 2 2 (signal-value btor482))
             (signal-state btor482)))
           (btor509
            (signal
             (extract 20 20 (signal-value btor482))
             (signal-state btor482)))
           (btor511
            (signal
             (extract 21 21 (signal-value btor482))
             (signal-state btor482)))
           (btor513
            (signal
             (extract 22 22 (signal-value btor482))
             (signal-state btor482)))
           (btor515
            (signal
             (extract 23 23 (signal-value btor482))
             (signal-state btor482)))
           (btor517
            (signal
             (extract 24 24 (signal-value btor482))
             (signal-state btor482)))
           (btor519
            (signal
             (extract 25 25 (signal-value btor482))
             (signal-state btor482)))
           (btor521
            (signal
             (extract 26 26 (signal-value btor482))
             (signal-state btor482)))
           (btor523
            (signal
             (extract 27 27 (signal-value btor482))
             (signal-state btor482)))
           (btor525
            (signal
             (extract 28 28 (signal-value btor482))
             (signal-state btor482)))
           (btor527
            (signal
             (extract 29 29 (signal-value btor482))
             (signal-state btor482)))
           (btor529
            (signal
             (extract 3 3 (signal-value btor482))
             (signal-state btor482)))
           (btor531
            (signal
             (extract 30 30 (signal-value btor482))
             (signal-state btor482)))
           (btor533
            (signal
             (extract 31 31 (signal-value btor482))
             (signal-state btor482)))
           (btor535
            (signal
             (extract 32 32 (signal-value btor482))
             (signal-state btor482)))
           (btor537
            (signal
             (extract 33 33 (signal-value btor482))
             (signal-state btor482)))
           (btor539
            (signal
             (extract 34 34 (signal-value btor482))
             (signal-state btor482)))
           (btor541
            (signal
             (extract 35 35 (signal-value btor482))
             (signal-state btor482)))
           (btor543
            (signal
             (extract 36 36 (signal-value btor482))
             (signal-state btor482)))
           (btor545
            (signal
             (extract 37 37 (signal-value btor482))
             (signal-state btor482)))
           (btor547
            (signal
             (extract 38 38 (signal-value btor482))
             (signal-state btor482)))
           (btor549
            (signal
             (extract 39 39 (signal-value btor482))
             (signal-state btor482)))
           (btor551
            (signal
             (extract 4 4 (signal-value btor482))
             (signal-state btor482)))
           (btor553
            (signal
             (extract 40 40 (signal-value btor482))
             (signal-state btor482)))
           (btor555
            (signal
             (extract 41 41 (signal-value btor482))
             (signal-state btor482)))
           (btor557
            (signal
             (extract 42 42 (signal-value btor482))
             (signal-state btor482)))
           (btor559
            (signal
             (extract 43 43 (signal-value btor482))
             (signal-state btor482)))
           (btor561
            (signal
             (extract 44 44 (signal-value btor482))
             (signal-state btor482)))
           (btor563
            (signal
             (extract 45 45 (signal-value btor482))
             (signal-state btor482)))
           (btor565
            (signal
             (extract 46 46 (signal-value btor482))
             (signal-state btor482)))
           (btor567
            (signal
             (extract 47 47 (signal-value btor482))
             (signal-state btor482)))
           (btor569
            (signal
             (extract 48 48 (signal-value btor482))
             (signal-state btor482)))
           (btor571
            (signal
             (extract 49 49 (signal-value btor482))
             (signal-state btor482)))
           (btor573
            (signal
             (extract 5 5 (signal-value btor482))
             (signal-state btor482)))
           (btor575
            (signal
             (extract 50 50 (signal-value btor482))
             (signal-state btor482)))
           (btor577
            (signal
             (extract 51 51 (signal-value btor482))
             (signal-state btor482)))
           (btor579
            (signal
             (extract 52 52 (signal-value btor482))
             (signal-state btor482)))
           (btor581
            (signal
             (extract 53 53 (signal-value btor482))
             (signal-state btor482)))
           (btor583
            (signal
             (extract 6 6 (signal-value btor482))
             (signal-state btor482)))
           (btor585
            (signal
             (extract 7 7 (signal-value btor482))
             (signal-state btor482)))
           (btor587
            (signal
             (extract 8 8 (signal-value btor482))
             (signal-state btor482)))
           (btor589
            (signal
             (extract 9 9 (signal-value btor482))
             (signal-state btor482)))
           (btor591
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state591")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state591"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state591")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state591")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor592 (bv->signal (bv 0 (bitvector 1))))
           (btor593
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state593")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state593"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state593")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state593")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor595
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state595")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state595"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state595")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state595")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor597
            (signal
             (concat (signal-value btor595) (signal-value btor240))
             (list)))
           (btor598
            (bv->signal
             (zero-extend (signal-value btor370) (bitvector 2))
             btor370))
           (btor599
            (signal
             (bool->bitvector
              (bveq (signal-value btor597) (signal-value btor598)))
             (list)))
           (btor600
            (if (bitvector->bool (signal-value btor599)) btor593 btor591))
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
           (btor602
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state602")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state602"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state602")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state602")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor604
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state604")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state604"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state604")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state604")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor606
            (signal
             (concat (signal-value btor604) (signal-value btor240))
             (list)))
           (btor607 (bv->signal (bv 2 (bitvector 2))))
           (btor608
            (signal
             (bool->bitvector
              (bveq (signal-value btor606) (signal-value btor607)))
             (list)))
           (btor609
            (if (bitvector->bool (signal-value btor608)) btor602 btor601))
           (btor610
            (signal
             (bvxor (signal-value btor600) (signal-value btor609))
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
           (btor613
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state613")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state613"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state613")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state613")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor615
            (if (bitvector->bool (signal-value btor599)) btor613 btor612))
           (btor616
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state616")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state616"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state616")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state616")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor617
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state617")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state617"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state617")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state617")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor619
            (if (bitvector->bool (signal-value btor608)) btor617 btor616))
           (btor620
            (signal
             (bvxor (signal-value btor615) (signal-value btor619))
             (list)))
           (btor622
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state622")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state622"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state622")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state622")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor623
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state623")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state623"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state623")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state623")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor625
            (if (bitvector->bool (signal-value btor599)) btor623 btor622))
           (btor626
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state626")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state626"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state626")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state626")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
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
            (if (bitvector->bool (signal-value btor608)) btor627 btor626))
           (btor630
            (signal
             (bvxor (signal-value btor625) (signal-value btor629))
             (list)))
           (btor632
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state632")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state632"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state632")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state632")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor633
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state633")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state633"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state633")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state633")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor635
            (if (bitvector->bool (signal-value btor599)) btor633 btor632))
           (btor636
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state636")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state636"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state636")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state636")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor637
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state637")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state637"))))))
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
           (btor639
            (if (bitvector->bool (signal-value btor608)) btor637 btor636))
           (btor640
            (signal
             (bvxor (signal-value btor635) (signal-value btor639))
             (list)))
           (btor642
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state642")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state642"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state642")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state642")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor643
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state643")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state643"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state643")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state643")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor645
            (if (bitvector->bool (signal-value btor599)) btor643 btor642))
           (btor646
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state646")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state646"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state646")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state646")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor647
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state647")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state647"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state647")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state647")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor649
            (if (bitvector->bool (signal-value btor608)) btor647 btor646))
           (btor650
            (signal
             (bvxor (signal-value btor645) (signal-value btor649))
             (list)))
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
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor653
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state653")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state653"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state653")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state653")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor655
            (if (bitvector->bool (signal-value btor599)) btor653 btor652))
           (btor656
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state656")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state656"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state656")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state656")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
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
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor659
            (if (bitvector->bool (signal-value btor608)) btor657 btor656))
           (btor660
            (signal
             (bvxor (signal-value btor655) (signal-value btor659))
             (list)))
           (btor662
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state662")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state662"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state662")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state662")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor663
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state663")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state663"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state663")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state663")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor665
            (if (bitvector->bool (signal-value btor599)) btor663 btor662))
           (btor666
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state666")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state666"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state666")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state666")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor667
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state667")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state667"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state667")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state667")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor669
            (if (bitvector->bool (signal-value btor608)) btor667 btor666))
           (btor670
            (signal
             (bvxor (signal-value btor665) (signal-value btor669))
             (list)))
           (btor672
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state672")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state672"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state672")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state672")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor673 (bv->signal (bv 0 (bitvector 18))))
           (btor674
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state674")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state674"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state674")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state674")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor676
            (if (bitvector->bool (signal-value btor599)) btor674 btor672))
           (btor677
            (signal
             (extract 0 0 (signal-value btor676))
             (signal-state btor676)))
           (btor679
            (signal
             (extract 1 1 (signal-value btor676))
             (signal-state btor676)))
           (btor681
            (signal
             (extract 10 10 (signal-value btor676))
             (signal-state btor676)))
           (btor683
            (signal
             (extract 11 11 (signal-value btor676))
             (signal-state btor676)))
           (btor685
            (signal
             (extract 12 12 (signal-value btor676))
             (signal-state btor676)))
           (btor687
            (signal
             (extract 13 13 (signal-value btor676))
             (signal-state btor676)))
           (btor689
            (signal
             (extract 14 14 (signal-value btor676))
             (signal-state btor676)))
           (btor691
            (signal
             (extract 15 15 (signal-value btor676))
             (signal-state btor676)))
           (btor693
            (signal
             (extract 16 16 (signal-value btor676))
             (signal-state btor676)))
           (btor695
            (signal
             (extract 17 17 (signal-value btor676))
             (signal-state btor676)))
           (btor697
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state697")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state697"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state697")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state697")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 37))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor698 (bv->signal (bv 0 (bitvector 37))))
           (btor699
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state699")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state699"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state699")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state699")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 37))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor701
            (if (bitvector->bool (signal-value btor599)) btor699 btor697))
           (btor702
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state702")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state702"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state702")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state702")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 37))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor703
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state703")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state703"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state703")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state703")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 37))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor705
            (if (bitvector->bool (signal-value btor608)) btor703 btor702))
           (btor706
            (signal
             (bvxor (signal-value btor701) (signal-value btor705))
             (list)))
           (btor707
            (signal
             (extract 0 0 (signal-value btor706))
             (signal-state btor706)))
           (btor709
            (signal
             (extract 1 1 (signal-value btor706))
             (signal-state btor706)))
           (btor711
            (signal
             (extract 2 2 (signal-value btor676))
             (signal-state btor676)))
           (btor713
            (signal
             (extract 2 2 (signal-value btor706))
             (signal-state btor706)))
           (btor715
            (signal
             (extract 3 3 (signal-value btor706))
             (signal-state btor706)))
           (btor717
            (signal
             (extract 4 4 (signal-value btor706))
             (signal-state btor706)))
           (btor719
            (signal
             (extract 5 5 (signal-value btor706))
             (signal-state btor706)))
           (btor721
            (signal
             (extract 6 6 (signal-value btor706))
             (signal-state btor706)))
           (btor723
            (signal
             (extract 7 7 (signal-value btor706))
             (signal-state btor706)))
           (btor725
            (signal
             (extract 8 8 (signal-value btor706))
             (signal-state btor706)))
           (btor727
            (signal
             (extract 9 9 (signal-value btor706))
             (signal-state btor706)))
           (btor729
            (signal
             (extract 10 10 (signal-value btor706))
             (signal-state btor706)))
           (btor731
            (signal
             (extract 11 11 (signal-value btor706))
             (signal-state btor706)))
           (btor733
            (signal
             (extract 3 3 (signal-value btor676))
             (signal-state btor676)))
           (btor735
            (signal
             (extract 12 12 (signal-value btor706))
             (signal-state btor706)))
           (btor737
            (signal
             (extract 13 13 (signal-value btor706))
             (signal-state btor706)))
           (btor739
            (signal
             (extract 14 14 (signal-value btor706))
             (signal-state btor706)))
           (btor741
            (signal
             (extract 15 15 (signal-value btor706))
             (signal-state btor706)))
           (btor743
            (signal
             (extract 16 16 (signal-value btor706))
             (signal-state btor706)))
           (btor745
            (signal
             (extract 17 17 (signal-value btor706))
             (signal-state btor706)))
           (btor747
            (signal
             (extract 18 18 (signal-value btor706))
             (signal-state btor706)))
           (btor749
            (signal
             (extract 19 19 (signal-value btor706))
             (signal-state btor706)))
           (btor751
            (signal
             (extract 20 20 (signal-value btor706))
             (signal-state btor706)))
           (btor753
            (signal
             (extract 21 21 (signal-value btor706))
             (signal-state btor706)))
           (btor755
            (signal
             (extract 4 4 (signal-value btor676))
             (signal-state btor676)))
           (btor757
            (signal
             (extract 22 22 (signal-value btor706))
             (signal-state btor706)))
           (btor759
            (signal
             (extract 23 23 (signal-value btor706))
             (signal-state btor706)))
           (btor761
            (signal
             (extract 24 24 (signal-value btor706))
             (signal-state btor706)))
           (btor763
            (signal
             (extract 25 25 (signal-value btor706))
             (signal-state btor706)))
           (btor765
            (signal
             (extract 26 26 (signal-value btor706))
             (signal-state btor706)))
           (btor767
            (signal
             (extract 27 27 (signal-value btor706))
             (signal-state btor706)))
           (btor769
            (signal
             (extract 28 28 (signal-value btor706))
             (signal-state btor706)))
           (btor771
            (signal
             (extract 29 29 (signal-value btor706))
             (signal-state btor706)))
           (btor773
            (signal
             (extract 30 30 (signal-value btor706))
             (signal-state btor706)))
           (btor775
            (signal
             (extract 31 31 (signal-value btor706))
             (signal-state btor706)))
           (btor777
            (signal
             (extract 5 5 (signal-value btor676))
             (signal-state btor676)))
           (btor779
            (signal
             (extract 32 32 (signal-value btor706))
             (signal-state btor706)))
           (btor781
            (signal
             (extract 33 33 (signal-value btor706))
             (signal-state btor706)))
           (btor783
            (signal
             (extract 34 34 (signal-value btor706))
             (signal-state btor706)))
           (btor785
            (signal
             (extract 35 35 (signal-value btor706))
             (signal-state btor706)))
           (btor787
            (signal
             (extract 6 6 (signal-value btor676))
             (signal-state btor676)))
           (btor789
            (signal
             (extract 7 7 (signal-value btor676))
             (signal-state btor676)))
           (btor791
            (signal
             (extract 8 8 (signal-value btor676))
             (signal-state btor676)))
           (btor793
            (signal
             (extract 9 9 (signal-value btor676))
             (signal-state btor676)))
           (btor795
            (signal
             (bvor (signal-value btor346) (signal-value btor347))
             (list)))
           (btor797
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state797")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state797"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state797")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state797")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor798
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state798")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state798"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state798")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state798")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor800
            (if (bitvector->bool (signal-value btor599)) btor798 btor797))
           (btor801
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state801")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state801"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state801")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state801")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor802
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state802")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state802"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state802")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state802")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor804
            (if (bitvector->bool (signal-value btor608)) btor802 btor801))
           (btor805
            (signal
             (bvxor (signal-value btor800) (signal-value btor804))
             (list)))
           (btor807
            (bv->signal
             (zero-extend (signal-value btor128) (bitvector 1))
             btor128))
           (btor808
            (bv->signal
             (zero-extend (signal-value btor129) (bitvector 1))
             btor129))
           (btor809
            (bv->signal
             (zero-extend (signal-value btor130) (bitvector 1))
             btor130))
           (btor810
            (bv->signal
             (zero-extend (signal-value btor131) (bitvector 1))
             btor131))
           (btor811
            (bv->signal
             (zero-extend (signal-value btor592) (bitvector 1))
             btor592))
           (btor812
            (bv->signal
             (zero-extend (signal-value btor240) (bitvector 1))
             btor240))
           (btor813
            (bv->signal
             (zero-extend (signal-value btor240) (bitvector 1))
             btor240))
           (btor814
            (bv->signal
             (zero-extend (signal-value btor592) (bitvector 1))
             btor592))
           (btor815
            (bv->signal
             (zero-extend (signal-value btor241) (bitvector 1))
             btor241))
           (btor816
            (bv->signal
             (zero-extend (signal-value btor241) (bitvector 1))
             btor241))
           (btor817
            (bv->signal
             (zero-extend (signal-value btor592) (bitvector 1))
             btor592))
           (btor818
            (bv->signal
             (zero-extend (signal-value btor242) (bitvector 1))
             btor242))
           (btor819
            (bv->signal
             (zero-extend (signal-value btor242) (bitvector 1))
             btor242))
           (btor820
            (bv->signal
             (zero-extend (signal-value btor592) (bitvector 1))
             btor592))
           (btor821
            (bv->signal
             (zero-extend (signal-value btor243) (bitvector 1))
             btor243))
           (btor822
            (bv->signal
             (zero-extend (signal-value btor243) (bitvector 1))
             btor243))
           (btor823
            (bv->signal
             (zero-extend (signal-value btor341) (bitvector 1))
             btor341))
           (btor824
            (bv->signal
             (zero-extend (signal-value btor342) (bitvector 1))
             btor342))
           (btor825
            (bv->signal
             (zero-extend (signal-value btor343) (bitvector 1))
             btor343))
           (btor826
            (bv->signal
             (zero-extend (signal-value btor344) (bitvector 1))
             btor344))
           (btor827 (bitvector 55))
           (btor828
            (signal
             (concat (signal-value btor706) (signal-value btor676))
             (list)))
           (btor829 (bv->signal (bv 0 (bitvector 19))))
           (btor830
            (signal
             (concat (signal-value btor276) (signal-value btor276))
             (list)))
           (btor831
            (signal
             (concat (signal-value btor276) (signal-value btor830))
             (list)))
           (btor832
            (signal
             (concat (signal-value btor276) (signal-value btor831))
             (list)))
           (btor833
            (signal
             (concat (signal-value btor276) (signal-value btor832))
             (list)))
           (btor834
            (signal
             (concat (signal-value btor276) (signal-value btor833))
             (list)))
           (btor835
            (signal
             (concat (signal-value btor276) (signal-value btor834))
             (list)))
           (btor836
            (signal
             (concat (signal-value btor276) (signal-value btor835))
             (list)))
           (btor837
            (signal
             (concat (signal-value btor276) (signal-value btor836))
             (list)))
           (btor838
            (signal
             (concat (signal-value btor276) (signal-value btor837))
             (list)))
           (btor839
            (signal
             (concat (signal-value btor276) (signal-value btor838))
             (list)))
           (btor840
            (signal
             (concat (signal-value btor276) (signal-value btor839))
             (list)))
           (btor841
            (signal
             (concat (signal-value btor276) (signal-value btor840))
             (list)))
           (btor842
            (signal
             (concat (signal-value btor276) (signal-value btor841))
             (list)))
           (btor843
            (signal
             (concat (signal-value btor276) (signal-value btor842))
             (list)))
           (btor844
            (signal
             (concat (signal-value btor276) (signal-value btor843))
             (list)))
           (btor845
            (signal
             (concat (signal-value btor276) (signal-value btor844))
             (list)))
           (btor846
            (signal
             (concat (signal-value btor276) (signal-value btor845))
             (list)))
           (btor847
            (signal
             (concat (signal-value btor276) (signal-value btor846))
             (list)))
           (btor848
            (if (bitvector->bool (signal-value btor346)) btor847 btor829))
           (btor849
            (signal
             (concat (signal-value btor248) (signal-value btor247))
             (list)))
           (btor850
            (signal
             (concat (signal-value btor259) (signal-value btor849))
             (list)))
           (btor851
            (signal
             (concat (signal-value btor270) (signal-value btor850))
             (list)))
           (btor852
            (signal
             (concat (signal-value btor277) (signal-value btor851))
             (list)))
           (btor853
            (signal
             (concat (signal-value btor278) (signal-value btor852))
             (list)))
           (btor854
            (signal
             (concat (signal-value btor279) (signal-value btor853))
             (list)))
           (btor855
            (signal
             (concat (signal-value btor280) (signal-value btor854))
             (list)))
           (btor856
            (signal
             (concat (signal-value btor281) (signal-value btor855))
             (list)))
           (btor857
            (signal
             (concat (signal-value btor282) (signal-value btor856))
             (list)))
           (btor858
            (signal
             (concat (signal-value btor249) (signal-value btor857))
             (list)))
           (btor859
            (signal
             (concat (signal-value btor250) (signal-value btor858))
             (list)))
           (btor860
            (signal
             (concat (signal-value btor251) (signal-value btor859))
             (list)))
           (btor861
            (signal
             (concat (signal-value btor252) (signal-value btor860))
             (list)))
           (btor862
            (signal
             (concat (signal-value btor253) (signal-value btor861))
             (list)))
           (btor863
            (signal
             (concat (signal-value btor254) (signal-value btor862))
             (list)))
           (btor864
            (signal
             (concat (signal-value btor255) (signal-value btor863))
             (list)))
           (btor865
            (signal
             (concat (signal-value btor256) (signal-value btor864))
             (list)))
           (btor866
            (signal
             (concat (signal-value btor257) (signal-value btor865))
             (list)))
           (btor867
            (signal
             (concat (signal-value btor258) (signal-value btor866))
             (list)))
           (btor868
            (signal
             (concat (signal-value btor260) (signal-value btor867))
             (list)))
           (btor869
            (signal
             (concat (signal-value btor261) (signal-value btor868))
             (list)))
           (btor870
            (signal
             (concat (signal-value btor262) (signal-value btor869))
             (list)))
           (btor871
            (signal
             (concat (signal-value btor263) (signal-value btor870))
             (list)))
           (btor872
            (signal
             (concat (signal-value btor264) (signal-value btor871))
             (list)))
           (btor873
            (signal
             (concat (signal-value btor265) (signal-value btor872))
             (list)))
           (btor874
            (signal
             (concat (signal-value btor266) (signal-value btor873))
             (list)))
           (btor875
            (signal
             (concat (signal-value btor267) (signal-value btor874))
             (list)))
           (btor876
            (signal
             (concat (signal-value btor268) (signal-value btor875))
             (list)))
           (btor877
            (signal
             (concat (signal-value btor269) (signal-value btor876))
             (list)))
           (btor878
            (signal
             (concat (signal-value btor271) (signal-value btor877))
             (list)))
           (btor879
            (signal
             (concat (signal-value btor272) (signal-value btor878))
             (list)))
           (btor880
            (signal
             (concat (signal-value btor273) (signal-value btor879))
             (list)))
           (btor881
            (signal
             (concat (signal-value btor274) (signal-value btor880))
             (list)))
           (btor882
            (signal
             (concat (signal-value btor275) (signal-value btor881))
             (list)))
           (btor883
            (signal
             (concat (signal-value btor276) (signal-value btor882))
             (list)))
           (btor884
            (signal
             (concat (signal-value btor848) (signal-value btor883))
             (list)))
           (btor885 (bv->signal (bv 0 (bitvector 7))))
           (btor886
            (signal
             (concat (signal-value btor256) (signal-value btor256))
             (list)))
           (btor887
            (signal
             (concat (signal-value btor256) (signal-value btor886))
             (list)))
           (btor888
            (signal
             (concat (signal-value btor256) (signal-value btor887))
             (list)))
           (btor889
            (signal
             (concat (signal-value btor256) (signal-value btor888))
             (list)))
           (btor890
            (signal
             (concat (signal-value btor256) (signal-value btor889))
             (list)))
           (btor891
            (signal
             (concat (signal-value btor256) (signal-value btor890))
             (list)))
           (btor892
            (if (bitvector->bool (signal-value btor346)) btor891 btor885))
           (btor893 (bv->signal (bv 0 (bitvector 2))))
           (btor894
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state894")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state894"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state894")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state894")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor895
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state895")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state895"))))))
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
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor897
            (if (bitvector->bool (signal-value btor599)) btor895 btor894))
           (btor898
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state898")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state898"))))))
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
           (btor899
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state899")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state899"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state899")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state899")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor901
            (if (bitvector->bool (signal-value btor608)) btor899 btor898))
           (btor902
            (signal
             (bvxor (signal-value btor897) (signal-value btor901))
             (list)))
           (btor903 (bv->signal (bv 0 (bitvector 9))))
           (btor904
            (signal
             (concat (signal-value btor276) (signal-value btor276))
             (list)))
           (btor905
            (signal
             (concat (signal-value btor276) (signal-value btor904))
             (list)))
           (btor906
            (signal
             (concat (signal-value btor276) (signal-value btor905))
             (list)))
           (btor907
            (signal
             (concat (signal-value btor276) (signal-value btor906))
             (list)))
           (btor908
            (signal
             (concat (signal-value btor276) (signal-value btor907))
             (list)))
           (btor909
            (signal
             (concat (signal-value btor276) (signal-value btor908))
             (list)))
           (btor910
            (signal
             (concat (signal-value btor276) (signal-value btor909))
             (list)))
           (btor911
            (signal
             (concat (signal-value btor276) (signal-value btor910))
             (list)))
           (btor912
            (if (bitvector->bool (signal-value btor346)) btor911 btor903))
           (btor913
            (signal
             (concat (signal-value btor248) (signal-value btor247))
             (list)))
           (btor914
            (signal
             (concat (signal-value btor259) (signal-value btor913))
             (list)))
           (btor915
            (signal
             (concat (signal-value btor270) (signal-value btor914))
             (list)))
           (btor916
            (signal
             (concat (signal-value btor277) (signal-value btor915))
             (list)))
           (btor917
            (signal
             (concat (signal-value btor278) (signal-value btor916))
             (list)))
           (btor918
            (signal
             (concat (signal-value btor279) (signal-value btor917))
             (list)))
           (btor919
            (signal
             (concat (signal-value btor280) (signal-value btor918))
             (list)))
           (btor920
            (signal
             (concat (signal-value btor281) (signal-value btor919))
             (list)))
           (btor921
            (signal
             (concat (signal-value btor282) (signal-value btor920))
             (list)))
           (btor922
            (signal
             (concat (signal-value btor249) (signal-value btor921))
             (list)))
           (btor923
            (signal
             (concat (signal-value btor250) (signal-value btor922))
             (list)))
           (btor924
            (signal
             (concat (signal-value btor251) (signal-value btor923))
             (list)))
           (btor925
            (signal
             (concat (signal-value btor252) (signal-value btor924))
             (list)))
           (btor926
            (signal
             (concat (signal-value btor253) (signal-value btor925))
             (list)))
           (btor927
            (signal
             (concat (signal-value btor254) (signal-value btor926))
             (list)))
           (btor928
            (signal
             (concat (signal-value btor255) (signal-value btor927))
             (list)))
           (btor929
            (signal
             (concat (signal-value btor256) (signal-value btor928))
             (list)))
           (btor930
            (signal
             (concat (signal-value btor892) (signal-value btor929))
             (list)))
           (btor931
            (signal
             (concat (signal-value btor893) (signal-value btor930))
             (list)))
           (btor932
            (signal
             (concat (signal-value btor902) (signal-value btor931))
             (list)))
           (btor933
            (signal
             (concat (signal-value btor257) (signal-value btor932))
             (list)))
           (btor934
            (signal
             (concat (signal-value btor258) (signal-value btor933))
             (list)))
           (btor935
            (signal
             (concat (signal-value btor260) (signal-value btor934))
             (list)))
           (btor936
            (signal
             (concat (signal-value btor261) (signal-value btor935))
             (list)))
           (btor937
            (signal
             (concat (signal-value btor262) (signal-value btor936))
             (list)))
           (btor938
            (signal
             (concat (signal-value btor263) (signal-value btor937))
             (list)))
           (btor939
            (signal
             (concat (signal-value btor264) (signal-value btor938))
             (list)))
           (btor940
            (signal
             (concat (signal-value btor265) (signal-value btor939))
             (list)))
           (btor941
            (signal
             (concat (signal-value btor266) (signal-value btor940))
             (list)))
           (btor942
            (signal
             (concat (signal-value btor267) (signal-value btor941))
             (list)))
           (btor943
            (signal
             (concat (signal-value btor268) (signal-value btor942))
             (list)))
           (btor944
            (signal
             (concat (signal-value btor269) (signal-value btor943))
             (list)))
           (btor945
            (signal
             (concat (signal-value btor271) (signal-value btor944))
             (list)))
           (btor946
            (signal
             (concat (signal-value btor272) (signal-value btor945))
             (list)))
           (btor947
            (signal
             (concat (signal-value btor273) (signal-value btor946))
             (list)))
           (btor948
            (signal
             (concat (signal-value btor274) (signal-value btor947))
             (list)))
           (btor949
            (signal
             (concat (signal-value btor275) (signal-value btor948))
             (list)))
           (btor950
            (signal
             (concat (signal-value btor276) (signal-value btor949))
             (list)))
           (btor951
            (signal
             (concat (signal-value btor912) (signal-value btor950))
             (list)))
           (btor952 (bv->signal (bv 3 (bitvector 2))))
           (btor953
            (bv->signal
             (zero-extend (signal-value btor952) (bitvector 5))
             btor952))
           (btor954
            (signal
             (bool->bitvector
              (bveq (signal-value btor325) (signal-value btor953)))
             (list)))
           (btor955
            (if (bitvector->bool (signal-value btor954)) btor951 btor884))
           (btor956
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state956")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state956"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state956")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state956")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 7))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor957
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state957")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state957"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state957")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state957")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 7))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor959
            (if (bitvector->bool (signal-value btor599)) btor957 btor956))
           (btor960
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state960")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state960"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state960")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state960")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 7))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor961
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state961")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state961"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state961")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state961")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 7))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor963
            (if (bitvector->bool (signal-value btor608)) btor961 btor960))
           (btor964
            (signal
             (bvxor (signal-value btor959) (signal-value btor963))
             (list)))
           (btor965
            (signal
             (extract 1 0 (signal-value btor964))
             (signal-state btor964)))
           (btor966
            (bv->signal
             (zero-extend (signal-value btor370) (bitvector 2))
             btor370))
           (btor967
            (signal
             (bool->bitvector
              (bveq (signal-value btor965) (signal-value btor966)))
             (list)))
           (btor968
            (if (bitvector->bool (signal-value btor967)) btor955 btor828))
           (btor969
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state969")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state969"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state969")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state969")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 27))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor970 (bv->signal (bv 0 (bitvector 27))))
           (btor971
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state971")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state971"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state971")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state971")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 27))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor973
            (if (bitvector->bool (signal-value btor599)) btor971 btor969))
           (btor974
            (signal
             (extract 17 17 (signal-value btor973))
             (signal-state btor973)))
           (btor975
            (signal
             (bvand (signal-value btor795) (signal-value btor974))
             (list)))
           (btor976
            (signal (concat (signal-value btor3) (signal-value btor2)) (list)))
           (btor977
            (signal
             (concat (signal-value btor14) (signal-value btor976))
             (list)))
           (btor978
            (signal
             (concat (signal-value btor25) (signal-value btor977))
             (list)))
           (btor979
            (signal
             (concat (signal-value btor32) (signal-value btor978))
             (list)))
           (btor980
            (signal
             (concat (signal-value btor33) (signal-value btor979))
             (list)))
           (btor981
            (signal
             (concat (signal-value btor34) (signal-value btor980))
             (list)))
           (btor982
            (signal
             (concat (signal-value btor35) (signal-value btor981))
             (list)))
           (btor983
            (signal
             (concat (signal-value btor36) (signal-value btor982))
             (list)))
           (btor984
            (signal
             (concat (signal-value btor37) (signal-value btor983))
             (list)))
           (btor985
            (signal
             (concat (signal-value btor4) (signal-value btor984))
             (list)))
           (btor986
            (signal
             (concat (signal-value btor5) (signal-value btor985))
             (list)))
           (btor987
            (signal
             (concat (signal-value btor6) (signal-value btor986))
             (list)))
           (btor988
            (signal
             (concat (signal-value btor7) (signal-value btor987))
             (list)))
           (btor989
            (signal
             (concat (signal-value btor8) (signal-value btor988))
             (list)))
           (btor990
            (signal
             (concat (signal-value btor9) (signal-value btor989))
             (list)))
           (btor991
            (signal
             (concat (signal-value btor10) (signal-value btor990))
             (list)))
           (btor992
            (signal
             (concat (signal-value btor11) (signal-value btor991))
             (list)))
           (btor993
            (signal
             (concat (signal-value btor12) (signal-value btor992))
             (list)))
           (btor994
            (signal
             (concat (signal-value btor13) (signal-value btor993))
             (list)))
           (btor995
            (signal
             (concat (signal-value btor15) (signal-value btor994))
             (list)))
           (btor996
            (signal
             (concat (signal-value btor16) (signal-value btor995))
             (list)))
           (btor997
            (signal
             (concat (signal-value btor17) (signal-value btor996))
             (list)))
           (btor998
            (signal
             (concat (signal-value btor18) (signal-value btor997))
             (list)))
           (btor999
            (signal
             (concat (signal-value btor19) (signal-value btor998))
             (list)))
           (btor1000
            (signal
             (concat (signal-value btor20) (signal-value btor999))
             (list)))
           (btor1001
            (signal
             (concat (signal-value btor21) (signal-value btor1000))
             (list)))
           (btor1002
            (signal
             (concat (signal-value btor22) (signal-value btor1001))
             (list)))
           (btor1003
            (signal
             (concat (signal-value btor23) (signal-value btor1002))
             (list)))
           (btor1004
            (signal
             (concat (signal-value btor24) (signal-value btor1003))
             (list)))
           (btor1005
            (signal
             (concat (signal-value btor26) (signal-value btor1004))
             (list)))
           (btor1006
            (signal
             (concat (signal-value btor27) (signal-value btor1005))
             (list)))
           (btor1007
            (signal
             (concat (signal-value btor28) (signal-value btor1006))
             (list)))
           (btor1008
            (signal
             (concat (signal-value btor29) (signal-value btor1007))
             (list)))
           (btor1009
            (signal
             (concat (signal-value btor30) (signal-value btor1008))
             (list)))
           (btor1010
            (signal
             (concat (signal-value btor31) (signal-value btor1009))
             (list)))
           (btor1011
            (signal
             (extract 17 0 (signal-value btor973))
             (signal-state btor973)))
           (btor1012
            (signal
             (concat (signal-value btor1011) (signal-value btor1010))
             (list)))
           (btor1013
            (signal
             (concat (signal-value btor975) (signal-value btor1012))
             (list)))
           (btor1014 (bv->signal (bv 0 (bitvector 55))))
           (btor1015
            (signal
             (bool->bitvector
              (bveq (signal-value btor965) (signal-value btor952)))
             (list)))
           (btor1016
            (if (bitvector->bool (signal-value btor1015)) btor1014 btor1013))
           (btor1017
            (signal
             (bool->bitvector
              (bveq (signal-value btor965) (signal-value btor607)))
             (list)))
           (btor1018
            (signal
             (bvor (signal-value btor1017) (signal-value btor1015))
             (list)))
           (btor1019
            (if (bitvector->bool (signal-value btor1018)) btor1016 btor968))
           (btor1020
            (bv->signal
             (zero-extend (signal-value btor1019) (bitvector 55))
             btor1019))
           (btor1021
            (signal (concat (signal-value btor3) (signal-value btor2)) (list)))
           (btor1022
            (signal
             (concat (signal-value btor14) (signal-value btor1021))
             (list)))
           (btor1023
            (signal
             (concat (signal-value btor25) (signal-value btor1022))
             (list)))
           (btor1024
            (signal
             (concat (signal-value btor32) (signal-value btor1023))
             (list)))
           (btor1025
            (signal
             (concat (signal-value btor33) (signal-value btor1024))
             (list)))
           (btor1026
            (signal
             (concat (signal-value btor34) (signal-value btor1025))
             (list)))
           (btor1027
            (signal
             (concat (signal-value btor35) (signal-value btor1026))
             (list)))
           (btor1028
            (signal
             (concat (signal-value btor36) (signal-value btor1027))
             (list)))
           (btor1029
            (signal
             (concat (signal-value btor37) (signal-value btor1028))
             (list)))
           (btor1030
            (signal
             (concat (signal-value btor4) (signal-value btor1029))
             (list)))
           (btor1031
            (signal
             (concat (signal-value btor5) (signal-value btor1030))
             (list)))
           (btor1032
            (signal
             (concat (signal-value btor6) (signal-value btor1031))
             (list)))
           (btor1033
            (signal
             (concat (signal-value btor7) (signal-value btor1032))
             (list)))
           (btor1034
            (signal
             (concat (signal-value btor8) (signal-value btor1033))
             (list)))
           (btor1035
            (signal
             (concat (signal-value btor9) (signal-value btor1034))
             (list)))
           (btor1036
            (signal
             (concat (signal-value btor10) (signal-value btor1035))
             (list)))
           (btor1037
            (signal
             (concat (signal-value btor11) (signal-value btor1036))
             (list)))
           (btor1038
            (signal
             (concat (signal-value btor12) (signal-value btor1037))
             (list)))
           (btor1039
            (signal
             (concat (signal-value btor13) (signal-value btor1038))
             (list)))
           (btor1040
            (signal
             (concat (signal-value btor15) (signal-value btor1039))
             (list)))
           (btor1041
            (signal
             (concat (signal-value btor16) (signal-value btor1040))
             (list)))
           (btor1042
            (signal
             (concat (signal-value btor17) (signal-value btor1041))
             (list)))
           (btor1043
            (signal
             (concat (signal-value btor18) (signal-value btor1042))
             (list)))
           (btor1044
            (signal
             (concat (signal-value btor19) (signal-value btor1043))
             (list)))
           (btor1045
            (signal
             (concat (signal-value btor20) (signal-value btor1044))
             (list)))
           (btor1046
            (signal
             (concat (signal-value btor21) (signal-value btor1045))
             (list)))
           (btor1047
            (signal
             (concat (signal-value btor22) (signal-value btor1046))
             (list)))
           (btor1048
            (signal
             (concat (signal-value btor23) (signal-value btor1047))
             (list)))
           (btor1049
            (signal
             (concat (signal-value btor24) (signal-value btor1048))
             (list)))
           (btor1050
            (signal
             (concat (signal-value btor26) (signal-value btor1049))
             (list)))
           (btor1051
            (signal
             (concat (signal-value btor27) (signal-value btor1050))
             (list)))
           (btor1052
            (signal
             (concat (signal-value btor28) (signal-value btor1051))
             (list)))
           (btor1053
            (signal
             (concat (signal-value btor29) (signal-value btor1052))
             (list)))
           (btor1054
            (signal
             (concat (signal-value btor30) (signal-value btor1053))
             (list)))
           (btor1055
            (signal
             (concat (signal-value btor31) (signal-value btor1054))
             (list)))
           (btor1056
            (bv->signal
             (zero-extend (signal-value btor1055) (bitvector 36))
             btor1055))
           (btor1057
            (signal
             (concat (signal-value btor287) (signal-value btor673))
             (list)))
           (btor1058
            (signal
             (concat (signal-value btor288) (signal-value btor1057))
             (list)))
           (btor1059
            (signal
             (concat (signal-value btor299) (signal-value btor1058))
             (list)))
           (btor1060
            (signal
             (concat (signal-value btor310) (signal-value btor1059))
             (list)))
           (btor1061
            (signal
             (concat (signal-value btor317) (signal-value btor1060))
             (list)))
           (btor1062
            (signal
             (concat (signal-value btor318) (signal-value btor1061))
             (list)))
           (btor1063
            (signal
             (concat (signal-value btor319) (signal-value btor1062))
             (list)))
           (btor1064
            (signal
             (concat (signal-value btor320) (signal-value btor1063))
             (list)))
           (btor1065
            (signal
             (concat (signal-value btor321) (signal-value btor1064))
             (list)))
           (btor1066
            (signal
             (concat (signal-value btor322) (signal-value btor1065))
             (list)))
           (btor1067
            (signal
             (concat (signal-value btor289) (signal-value btor1066))
             (list)))
           (btor1068
            (signal
             (concat (signal-value btor290) (signal-value btor1067))
             (list)))
           (btor1069
            (signal
             (concat (signal-value btor291) (signal-value btor1068))
             (list)))
           (btor1070
            (signal
             (concat (signal-value btor292) (signal-value btor1069))
             (list)))
           (btor1071
            (signal
             (concat (signal-value btor293) (signal-value btor1070))
             (list)))
           (btor1072
            (signal
             (concat (signal-value btor294) (signal-value btor1071))
             (list)))
           (btor1073
            (signal
             (concat (signal-value btor295) (signal-value btor1072))
             (list)))
           (btor1074
            (signal
             (concat (signal-value btor296) (signal-value btor1073))
             (list)))
           (btor1075
            (signal
             (concat (signal-value btor297) (signal-value btor1074))
             (list)))
           (btor1076
            (signal
             (concat (signal-value btor298) (signal-value btor1075))
             (list)))
           (btor1077
            (signal
             (concat (signal-value btor300) (signal-value btor1076))
             (list)))
           (btor1078
            (signal
             (concat (signal-value btor301) (signal-value btor1077))
             (list)))
           (btor1079
            (signal
             (concat (signal-value btor302) (signal-value btor1078))
             (list)))
           (btor1080
            (signal
             (concat (signal-value btor303) (signal-value btor1079))
             (list)))
           (btor1081
            (signal
             (concat (signal-value btor304) (signal-value btor1080))
             (list)))
           (btor1082
            (signal
             (concat (signal-value btor305) (signal-value btor1081))
             (list)))
           (btor1083
            (signal
             (concat (signal-value btor306) (signal-value btor1082))
             (list)))
           (btor1084
            (signal
             (concat (signal-value btor307) (signal-value btor1083))
             (list)))
           (btor1085
            (signal
             (concat (signal-value btor308) (signal-value btor1084))
             (list)))
           (btor1086
            (signal
             (concat (signal-value btor309) (signal-value btor1085))
             (list)))
           (btor1087
            (signal
             (concat (signal-value btor311) (signal-value btor1086))
             (list)))
           (btor1088
            (signal
             (concat (signal-value btor312) (signal-value btor1087))
             (list)))
           (btor1089
            (signal
             (concat (signal-value btor313) (signal-value btor1088))
             (list)))
           (btor1090
            (signal
             (concat (signal-value btor314) (signal-value btor1089))
             (list)))
           (btor1091
            (signal
             (concat (signal-value btor315) (signal-value btor1090))
             (list)))
           (btor1092
            (signal
             (concat (signal-value btor316) (signal-value btor1091))
             (list)))
           (btor1093
            (signal
             (concat (signal-value btor592) (signal-value btor1092))
             (list)))
           (btor1094
            (signal
             (concat (signal-value btor316) (signal-value btor316))
             (list)))
           (btor1095
            (signal
             (concat (signal-value btor316) (signal-value btor1094))
             (list)))
           (btor1096
            (signal
             (concat (signal-value btor316) (signal-value btor1095))
             (list)))
           (btor1097
            (signal
             (concat (signal-value btor316) (signal-value btor1096))
             (list)))
           (btor1098
            (signal
             (concat (signal-value btor316) (signal-value btor1097))
             (list)))
           (btor1099
            (signal
             (concat (signal-value btor316) (signal-value btor1098))
             (list)))
           (btor1100
            (signal
             (concat (signal-value btor316) (signal-value btor1099))
             (list)))
           (btor1101
            (signal
             (concat (signal-value btor316) (signal-value btor1100))
             (list)))
           (btor1102
            (signal
             (concat (signal-value btor316) (signal-value btor1101))
             (list)))
           (btor1103
            (signal
             (concat (signal-value btor316) (signal-value btor1102))
             (list)))
           (btor1104
            (signal
             (concat (signal-value btor316) (signal-value btor1103))
             (list)))
           (btor1105
            (signal
             (concat (signal-value btor316) (signal-value btor1104))
             (list)))
           (btor1106
            (signal
             (concat (signal-value btor316) (signal-value btor1105))
             (list)))
           (btor1107
            (signal
             (concat (signal-value btor316) (signal-value btor1106))
             (list)))
           (btor1108
            (signal
             (concat (signal-value btor316) (signal-value btor1107))
             (list)))
           (btor1109
            (signal
             (concat (signal-value btor316) (signal-value btor1108))
             (list)))
           (btor1110
            (signal
             (concat (signal-value btor316) (signal-value btor1109))
             (list)))
           (btor1111
            (signal
             (concat (signal-value btor316) (signal-value btor1110))
             (list)))
           (btor1112
            (if (bitvector->bool (signal-value btor347)) btor1111 btor829))
           (btor1113
            (signal
             (concat (signal-value btor288) (signal-value btor287))
             (list)))
           (btor1114
            (signal
             (concat (signal-value btor299) (signal-value btor1113))
             (list)))
           (btor1115
            (signal
             (concat (signal-value btor310) (signal-value btor1114))
             (list)))
           (btor1116
            (signal
             (concat (signal-value btor317) (signal-value btor1115))
             (list)))
           (btor1117
            (signal
             (concat (signal-value btor318) (signal-value btor1116))
             (list)))
           (btor1118
            (signal
             (concat (signal-value btor319) (signal-value btor1117))
             (list)))
           (btor1119
            (signal
             (concat (signal-value btor320) (signal-value btor1118))
             (list)))
           (btor1120
            (signal
             (concat (signal-value btor321) (signal-value btor1119))
             (list)))
           (btor1121
            (signal
             (concat (signal-value btor322) (signal-value btor1120))
             (list)))
           (btor1122
            (signal
             (concat (signal-value btor289) (signal-value btor1121))
             (list)))
           (btor1123
            (signal
             (concat (signal-value btor290) (signal-value btor1122))
             (list)))
           (btor1124
            (signal
             (concat (signal-value btor291) (signal-value btor1123))
             (list)))
           (btor1125
            (signal
             (concat (signal-value btor292) (signal-value btor1124))
             (list)))
           (btor1126
            (signal
             (concat (signal-value btor293) (signal-value btor1125))
             (list)))
           (btor1127
            (signal
             (concat (signal-value btor294) (signal-value btor1126))
             (list)))
           (btor1128
            (signal
             (concat (signal-value btor295) (signal-value btor1127))
             (list)))
           (btor1129
            (signal
             (concat (signal-value btor296) (signal-value btor1128))
             (list)))
           (btor1130
            (signal
             (concat (signal-value btor297) (signal-value btor1129))
             (list)))
           (btor1131
            (signal
             (concat (signal-value btor298) (signal-value btor1130))
             (list)))
           (btor1132
            (signal
             (concat (signal-value btor300) (signal-value btor1131))
             (list)))
           (btor1133
            (signal
             (concat (signal-value btor301) (signal-value btor1132))
             (list)))
           (btor1134
            (signal
             (concat (signal-value btor302) (signal-value btor1133))
             (list)))
           (btor1135
            (signal
             (concat (signal-value btor303) (signal-value btor1134))
             (list)))
           (btor1136
            (signal
             (concat (signal-value btor304) (signal-value btor1135))
             (list)))
           (btor1137
            (signal
             (concat (signal-value btor305) (signal-value btor1136))
             (list)))
           (btor1138
            (signal
             (concat (signal-value btor306) (signal-value btor1137))
             (list)))
           (btor1139
            (signal
             (concat (signal-value btor307) (signal-value btor1138))
             (list)))
           (btor1140
            (signal
             (concat (signal-value btor308) (signal-value btor1139))
             (list)))
           (btor1141
            (signal
             (concat (signal-value btor309) (signal-value btor1140))
             (list)))
           (btor1142
            (signal
             (concat (signal-value btor311) (signal-value btor1141))
             (list)))
           (btor1143
            (signal
             (concat (signal-value btor312) (signal-value btor1142))
             (list)))
           (btor1144
            (signal
             (concat (signal-value btor313) (signal-value btor1143))
             (list)))
           (btor1145
            (signal
             (concat (signal-value btor314) (signal-value btor1144))
             (list)))
           (btor1146
            (signal
             (concat (signal-value btor315) (signal-value btor1145))
             (list)))
           (btor1147
            (signal
             (concat (signal-value btor316) (signal-value btor1146))
             (list)))
           (btor1148
            (signal
             (concat (signal-value btor1112) (signal-value btor1147))
             (list)))
           (btor1149
            (signal
             (concat (signal-value btor296) (signal-value btor296))
             (list)))
           (btor1150
            (signal
             (concat (signal-value btor296) (signal-value btor1149))
             (list)))
           (btor1151
            (signal
             (concat (signal-value btor296) (signal-value btor1150))
             (list)))
           (btor1152
            (signal
             (concat (signal-value btor296) (signal-value btor1151))
             (list)))
           (btor1153
            (signal
             (concat (signal-value btor296) (signal-value btor1152))
             (list)))
           (btor1154
            (signal
             (concat (signal-value btor296) (signal-value btor1153))
             (list)))
           (btor1155
            (if (bitvector->bool (signal-value btor347)) btor1154 btor885))
           (btor1156
            (signal
             (concat (signal-value btor316) (signal-value btor316))
             (list)))
           (btor1157
            (signal
             (concat (signal-value btor316) (signal-value btor1156))
             (list)))
           (btor1158
            (signal
             (concat (signal-value btor316) (signal-value btor1157))
             (list)))
           (btor1159
            (signal
             (concat (signal-value btor316) (signal-value btor1158))
             (list)))
           (btor1160
            (signal
             (concat (signal-value btor316) (signal-value btor1159))
             (list)))
           (btor1161
            (signal
             (concat (signal-value btor316) (signal-value btor1160))
             (list)))
           (btor1162
            (signal
             (concat (signal-value btor316) (signal-value btor1161))
             (list)))
           (btor1163
            (signal
             (concat (signal-value btor316) (signal-value btor1162))
             (list)))
           (btor1164
            (if (bitvector->bool (signal-value btor347)) btor1163 btor903))
           (btor1165
            (signal
             (concat (signal-value btor288) (signal-value btor287))
             (list)))
           (btor1166
            (signal
             (concat (signal-value btor299) (signal-value btor1165))
             (list)))
           (btor1167
            (signal
             (concat (signal-value btor310) (signal-value btor1166))
             (list)))
           (btor1168
            (signal
             (concat (signal-value btor317) (signal-value btor1167))
             (list)))
           (btor1169
            (signal
             (concat (signal-value btor318) (signal-value btor1168))
             (list)))
           (btor1170
            (signal
             (concat (signal-value btor319) (signal-value btor1169))
             (list)))
           (btor1171
            (signal
             (concat (signal-value btor320) (signal-value btor1170))
             (list)))
           (btor1172
            (signal
             (concat (signal-value btor321) (signal-value btor1171))
             (list)))
           (btor1173
            (signal
             (concat (signal-value btor322) (signal-value btor1172))
             (list)))
           (btor1174
            (signal
             (concat (signal-value btor289) (signal-value btor1173))
             (list)))
           (btor1175
            (signal
             (concat (signal-value btor290) (signal-value btor1174))
             (list)))
           (btor1176
            (signal
             (concat (signal-value btor291) (signal-value btor1175))
             (list)))
           (btor1177
            (signal
             (concat (signal-value btor292) (signal-value btor1176))
             (list)))
           (btor1178
            (signal
             (concat (signal-value btor293) (signal-value btor1177))
             (list)))
           (btor1179
            (signal
             (concat (signal-value btor294) (signal-value btor1178))
             (list)))
           (btor1180
            (signal
             (concat (signal-value btor295) (signal-value btor1179))
             (list)))
           (btor1181
            (signal
             (concat (signal-value btor296) (signal-value btor1180))
             (list)))
           (btor1182
            (signal
             (concat (signal-value btor1155) (signal-value btor1181))
             (list)))
           (btor1183
            (signal
             (concat (signal-value btor902) (signal-value btor1182))
             (list)))
           (btor1184
            (signal
             (concat (signal-value btor902) (signal-value btor1183))
             (list)))
           (btor1185
            (signal
             (concat (signal-value btor592) (signal-value btor1184))
             (list)))
           (btor1186
            (signal
             (concat (signal-value btor297) (signal-value btor1185))
             (list)))
           (btor1187
            (signal
             (concat (signal-value btor298) (signal-value btor1186))
             (list)))
           (btor1188
            (signal
             (concat (signal-value btor300) (signal-value btor1187))
             (list)))
           (btor1189
            (signal
             (concat (signal-value btor301) (signal-value btor1188))
             (list)))
           (btor1190
            (signal
             (concat (signal-value btor302) (signal-value btor1189))
             (list)))
           (btor1191
            (signal
             (concat (signal-value btor303) (signal-value btor1190))
             (list)))
           (btor1192
            (signal
             (concat (signal-value btor304) (signal-value btor1191))
             (list)))
           (btor1193
            (signal
             (concat (signal-value btor305) (signal-value btor1192))
             (list)))
           (btor1194
            (signal
             (concat (signal-value btor306) (signal-value btor1193))
             (list)))
           (btor1195
            (signal
             (concat (signal-value btor307) (signal-value btor1194))
             (list)))
           (btor1196
            (signal
             (concat (signal-value btor308) (signal-value btor1195))
             (list)))
           (btor1197
            (signal
             (concat (signal-value btor309) (signal-value btor1196))
             (list)))
           (btor1198
            (signal
             (concat (signal-value btor311) (signal-value btor1197))
             (list)))
           (btor1199
            (signal
             (concat (signal-value btor312) (signal-value btor1198))
             (list)))
           (btor1200
            (signal
             (concat (signal-value btor313) (signal-value btor1199))
             (list)))
           (btor1201
            (signal
             (concat (signal-value btor314) (signal-value btor1200))
             (list)))
           (btor1202
            (signal
             (concat (signal-value btor315) (signal-value btor1201))
             (list)))
           (btor1203
            (signal
             (concat (signal-value btor316) (signal-value btor1202))
             (list)))
           (btor1204
            (signal
             (concat (signal-value btor1164) (signal-value btor1203))
             (list)))
           (btor1205
            (if (bitvector->bool (signal-value btor954)) btor1204 btor1148))
           (btor1206
            (signal
             (extract 3 2 (signal-value btor964))
             (signal-state btor964)))
           (btor1207
            (bv->signal
             (zero-extend (signal-value btor370) (bitvector 2))
             btor370))
           (btor1208
            (signal
             (bool->bitvector
              (bveq (signal-value btor1206) (signal-value btor1207)))
             (list)))
           (btor1209
            (if (bitvector->bool (signal-value btor1208)) btor1205 btor1093))
           (btor1210
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1210")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1210"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1210")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1210")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 27))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1211
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1211")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1211"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1211")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1211")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 27))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1213
            (if (bitvector->bool (signal-value btor599)) btor1211 btor1210))
           (btor1214
            (signal
             (extract 17 17 (signal-value btor1213))
             (signal-state btor1213)))
           (btor1215
            (signal
             (bvand (signal-value btor795) (signal-value btor1214))
             (list)))
           (btor1216
            (signal
             (concat (signal-value btor39) (signal-value btor38))
             (list)))
           (btor1217
            (signal
             (concat (signal-value btor50) (signal-value btor1216))
             (list)))
           (btor1218
            (signal
             (concat (signal-value btor61) (signal-value btor1217))
             (list)))
           (btor1219
            (signal
             (concat (signal-value btor68) (signal-value btor1218))
             (list)))
           (btor1220
            (signal
             (concat (signal-value btor69) (signal-value btor1219))
             (list)))
           (btor1221
            (signal
             (concat (signal-value btor70) (signal-value btor1220))
             (list)))
           (btor1222
            (signal
             (concat (signal-value btor71) (signal-value btor1221))
             (list)))
           (btor1223
            (signal
             (concat (signal-value btor72) (signal-value btor1222))
             (list)))
           (btor1224
            (signal
             (concat (signal-value btor73) (signal-value btor1223))
             (list)))
           (btor1225
            (signal
             (concat (signal-value btor40) (signal-value btor1224))
             (list)))
           (btor1226
            (signal
             (concat (signal-value btor41) (signal-value btor1225))
             (list)))
           (btor1227
            (signal
             (concat (signal-value btor42) (signal-value btor1226))
             (list)))
           (btor1228
            (signal
             (concat (signal-value btor43) (signal-value btor1227))
             (list)))
           (btor1229
            (signal
             (concat (signal-value btor44) (signal-value btor1228))
             (list)))
           (btor1230
            (signal
             (concat (signal-value btor45) (signal-value btor1229))
             (list)))
           (btor1231
            (signal
             (concat (signal-value btor46) (signal-value btor1230))
             (list)))
           (btor1232
            (signal
             (concat (signal-value btor47) (signal-value btor1231))
             (list)))
           (btor1233
            (signal
             (concat (signal-value btor48) (signal-value btor1232))
             (list)))
           (btor1234
            (signal
             (concat (signal-value btor49) (signal-value btor1233))
             (list)))
           (btor1235
            (signal
             (concat (signal-value btor51) (signal-value btor1234))
             (list)))
           (btor1236
            (signal
             (concat (signal-value btor52) (signal-value btor1235))
             (list)))
           (btor1237
            (signal
             (concat (signal-value btor53) (signal-value btor1236))
             (list)))
           (btor1238
            (signal
             (concat (signal-value btor54) (signal-value btor1237))
             (list)))
           (btor1239
            (signal
             (concat (signal-value btor55) (signal-value btor1238))
             (list)))
           (btor1240
            (signal
             (concat (signal-value btor56) (signal-value btor1239))
             (list)))
           (btor1241
            (signal
             (concat (signal-value btor57) (signal-value btor1240))
             (list)))
           (btor1242
            (signal
             (concat (signal-value btor58) (signal-value btor1241))
             (list)))
           (btor1243
            (signal
             (concat (signal-value btor59) (signal-value btor1242))
             (list)))
           (btor1244
            (signal
             (concat (signal-value btor60) (signal-value btor1243))
             (list)))
           (btor1245
            (signal
             (concat (signal-value btor62) (signal-value btor1244))
             (list)))
           (btor1246
            (signal
             (concat (signal-value btor63) (signal-value btor1245))
             (list)))
           (btor1247
            (signal
             (concat (signal-value btor64) (signal-value btor1246))
             (list)))
           (btor1248
            (signal
             (concat (signal-value btor65) (signal-value btor1247))
             (list)))
           (btor1249
            (signal
             (concat (signal-value btor66) (signal-value btor1248))
             (list)))
           (btor1250
            (signal
             (concat (signal-value btor67) (signal-value btor1249))
             (list)))
           (btor1251
            (signal
             (extract 17 0 (signal-value btor1213))
             (signal-state btor1213)))
           (btor1252
            (signal
             (concat (signal-value btor1251) (signal-value btor1250))
             (list)))
           (btor1253
            (signal
             (concat (signal-value btor1215) (signal-value btor1252))
             (list)))
           (btor1254
            (signal
             (bool->bitvector
              (bveq (signal-value btor1206) (signal-value btor952)))
             (list)))
           (btor1255
            (if (bitvector->bool (signal-value btor1254)) btor1014 btor1253))
           (btor1256
            (signal
             (bool->bitvector
              (bveq (signal-value btor1206) (signal-value btor607)))
             (list)))
           (btor1257
            (signal
             (bvor (signal-value btor1256) (signal-value btor1254))
             (list)))
           (btor1258
            (if (bitvector->bool (signal-value btor1257)) btor1255 btor1209))
           (btor1259
            (bv->signal
             (zero-extend (signal-value btor1258) (bitvector 55))
             btor1258))
           (btor1260
            (signal
             (concat (signal-value btor39) (signal-value btor38))
             (list)))
           (btor1261
            (signal
             (concat (signal-value btor50) (signal-value btor1260))
             (list)))
           (btor1262
            (signal
             (concat (signal-value btor61) (signal-value btor1261))
             (list)))
           (btor1263
            (signal
             (concat (signal-value btor68) (signal-value btor1262))
             (list)))
           (btor1264
            (signal
             (concat (signal-value btor69) (signal-value btor1263))
             (list)))
           (btor1265
            (signal
             (concat (signal-value btor70) (signal-value btor1264))
             (list)))
           (btor1266
            (signal
             (concat (signal-value btor71) (signal-value btor1265))
             (list)))
           (btor1267
            (signal
             (concat (signal-value btor72) (signal-value btor1266))
             (list)))
           (btor1268
            (signal
             (concat (signal-value btor73) (signal-value btor1267))
             (list)))
           (btor1269
            (signal
             (concat (signal-value btor40) (signal-value btor1268))
             (list)))
           (btor1270
            (signal
             (concat (signal-value btor41) (signal-value btor1269))
             (list)))
           (btor1271
            (signal
             (concat (signal-value btor42) (signal-value btor1270))
             (list)))
           (btor1272
            (signal
             (concat (signal-value btor43) (signal-value btor1271))
             (list)))
           (btor1273
            (signal
             (concat (signal-value btor44) (signal-value btor1272))
             (list)))
           (btor1274
            (signal
             (concat (signal-value btor45) (signal-value btor1273))
             (list)))
           (btor1275
            (signal
             (concat (signal-value btor46) (signal-value btor1274))
             (list)))
           (btor1276
            (signal
             (concat (signal-value btor47) (signal-value btor1275))
             (list)))
           (btor1277
            (signal
             (concat (signal-value btor48) (signal-value btor1276))
             (list)))
           (btor1278
            (signal
             (concat (signal-value btor49) (signal-value btor1277))
             (list)))
           (btor1279
            (signal
             (concat (signal-value btor51) (signal-value btor1278))
             (list)))
           (btor1280
            (signal
             (concat (signal-value btor52) (signal-value btor1279))
             (list)))
           (btor1281
            (signal
             (concat (signal-value btor53) (signal-value btor1280))
             (list)))
           (btor1282
            (signal
             (concat (signal-value btor54) (signal-value btor1281))
             (list)))
           (btor1283
            (signal
             (concat (signal-value btor55) (signal-value btor1282))
             (list)))
           (btor1284
            (signal
             (concat (signal-value btor56) (signal-value btor1283))
             (list)))
           (btor1285
            (signal
             (concat (signal-value btor57) (signal-value btor1284))
             (list)))
           (btor1286
            (signal
             (concat (signal-value btor58) (signal-value btor1285))
             (list)))
           (btor1287
            (signal
             (concat (signal-value btor59) (signal-value btor1286))
             (list)))
           (btor1288
            (signal
             (concat (signal-value btor60) (signal-value btor1287))
             (list)))
           (btor1289
            (signal
             (concat (signal-value btor62) (signal-value btor1288))
             (list)))
           (btor1290
            (signal
             (concat (signal-value btor63) (signal-value btor1289))
             (list)))
           (btor1291
            (signal
             (concat (signal-value btor64) (signal-value btor1290))
             (list)))
           (btor1292
            (signal
             (concat (signal-value btor65) (signal-value btor1291))
             (list)))
           (btor1293
            (signal
             (concat (signal-value btor66) (signal-value btor1292))
             (list)))
           (btor1294
            (signal
             (concat (signal-value btor67) (signal-value btor1293))
             (list)))
           (btor1295
            (bv->signal
             (zero-extend (signal-value btor1294) (bitvector 36))
             btor1294))
           (btor1296
            (signal
             (concat (signal-value btor235) (signal-value btor235))
             (list)))
           (btor1297
            (signal
             (concat (signal-value btor235) (signal-value btor1296))
             (list)))
           (btor1298
            (signal
             (concat (signal-value btor235) (signal-value btor1297))
             (list)))
           (btor1299
            (signal
             (concat (signal-value btor235) (signal-value btor1298))
             (list)))
           (btor1300
            (signal
             (concat (signal-value btor235) (signal-value btor1299))
             (list)))
           (btor1301
            (signal
             (concat (signal-value btor235) (signal-value btor1300))
             (list)))
           (btor1302
            (signal
             (concat (signal-value btor235) (signal-value btor1301))
             (list)))
           (btor1303
            (signal
             (concat (signal-value btor235) (signal-value btor1302))
             (list)))
           (btor1304
            (signal
             (concat (signal-value btor235) (signal-value btor1303))
             (list)))
           (btor1305
            (signal
             (concat (signal-value btor235) (signal-value btor1304))
             (list)))
           (btor1306
            (signal
             (concat (signal-value btor235) (signal-value btor1305))
             (list)))
           (btor1307
            (signal
             (concat (signal-value btor235) (signal-value btor1306))
             (list)))
           (btor1308
            (signal
             (concat (signal-value btor235) (signal-value btor1307))
             (list)))
           (btor1309
            (signal
             (concat (signal-value btor235) (signal-value btor1308))
             (list)))
           (btor1310
            (signal
             (concat (signal-value btor235) (signal-value btor1309))
             (list)))
           (btor1311
            (signal
             (concat (signal-value btor235) (signal-value btor1310))
             (list)))
           (btor1312
            (signal
             (concat (signal-value btor235) (signal-value btor1311))
             (list)))
           (btor1313
            (signal
             (concat (signal-value btor235) (signal-value btor1312))
             (list)))
           (btor1314
            (if (bitvector->bool (signal-value btor345)) btor1313 btor829))
           (btor1315
            (signal
             (concat (signal-value btor197) (signal-value btor196))
             (list)))
           (btor1316
            (signal
             (concat (signal-value btor199) (signal-value btor1315))
             (list)))
           (btor1317
            (signal
             (concat (signal-value btor200) (signal-value btor1316))
             (list)))
           (btor1318
            (signal
             (concat (signal-value btor201) (signal-value btor1317))
             (list)))
           (btor1319
            (signal
             (concat (signal-value btor202) (signal-value btor1318))
             (list)))
           (btor1320
            (signal
             (concat (signal-value btor203) (signal-value btor1319))
             (list)))
           (btor1321
            (signal
             (concat (signal-value btor204) (signal-value btor1320))
             (list)))
           (btor1322
            (signal
             (concat (signal-value btor205) (signal-value btor1321))
             (list)))
           (btor1323
            (signal
             (concat (signal-value btor206) (signal-value btor1322))
             (list)))
           (btor1324
            (signal
             (concat (signal-value btor207) (signal-value btor1323))
             (list)))
           (btor1325
            (signal
             (concat (signal-value btor208) (signal-value btor1324))
             (list)))
           (btor1326
            (signal
             (concat (signal-value btor210) (signal-value btor1325))
             (list)))
           (btor1327
            (signal
             (concat (signal-value btor211) (signal-value btor1326))
             (list)))
           (btor1328
            (signal
             (concat (signal-value btor212) (signal-value btor1327))
             (list)))
           (btor1329
            (signal
             (concat (signal-value btor213) (signal-value btor1328))
             (list)))
           (btor1330
            (signal
             (concat (signal-value btor214) (signal-value btor1329))
             (list)))
           (btor1331
            (signal
             (concat (signal-value btor215) (signal-value btor1330))
             (list)))
           (btor1332
            (signal
             (concat (signal-value btor216) (signal-value btor1331))
             (list)))
           (btor1333
            (signal
             (concat (signal-value btor217) (signal-value btor1332))
             (list)))
           (btor1334
            (signal
             (concat (signal-value btor218) (signal-value btor1333))
             (list)))
           (btor1335
            (signal
             (concat (signal-value btor219) (signal-value btor1334))
             (list)))
           (btor1336
            (signal
             (concat (signal-value btor221) (signal-value btor1335))
             (list)))
           (btor1337
            (signal
             (concat (signal-value btor222) (signal-value btor1336))
             (list)))
           (btor1338
            (signal
             (concat (signal-value btor223) (signal-value btor1337))
             (list)))
           (btor1339
            (signal
             (concat (signal-value btor224) (signal-value btor1338))
             (list)))
           (btor1340
            (signal
             (concat (signal-value btor225) (signal-value btor1339))
             (list)))
           (btor1341
            (signal
             (concat (signal-value btor226) (signal-value btor1340))
             (list)))
           (btor1342
            (signal
             (concat (signal-value btor227) (signal-value btor1341))
             (list)))
           (btor1343
            (signal
             (concat (signal-value btor228) (signal-value btor1342))
             (list)))
           (btor1344
            (signal
             (concat (signal-value btor229) (signal-value btor1343))
             (list)))
           (btor1345
            (signal
             (concat (signal-value btor230) (signal-value btor1344))
             (list)))
           (btor1346
            (signal
             (concat (signal-value btor232) (signal-value btor1345))
             (list)))
           (btor1347
            (signal
             (concat (signal-value btor233) (signal-value btor1346))
             (list)))
           (btor1348
            (signal
             (concat (signal-value btor234) (signal-value btor1347))
             (list)))
           (btor1349
            (signal
             (concat (signal-value btor235) (signal-value btor1348))
             (list)))
           (btor1350
            (signal
             (concat (signal-value btor1314) (signal-value btor1349))
             (list)))
           (btor1351
            (signal
             (extract 6 4 (signal-value btor964))
             (signal-state btor964)))
           (btor1352
            (bv->signal
             (zero-extend (signal-value btor370) (bitvector 3))
             btor370))
           (btor1353
            (signal
             (bool->bitvector
              (bveq (signal-value btor1351) (signal-value btor1352)))
             (list)))
           (btor1354
            (if (bitvector->bool (signal-value btor1353)) btor1350 btor1014))
           (btor1355
            (signal
             (concat (signal-value btor187) (signal-value btor186))
             (list)))
           (btor1356
            (signal
             (concat (signal-value btor198) (signal-value btor1355))
             (list)))
           (btor1357
            (signal
             (concat (signal-value btor209) (signal-value btor1356))
             (list)))
           (btor1358
            (signal
             (concat (signal-value btor220) (signal-value btor1357))
             (list)))
           (btor1359
            (signal
             (concat (signal-value btor231) (signal-value btor1358))
             (list)))
           (btor1360
            (signal
             (concat (signal-value btor236) (signal-value btor1359))
             (list)))
           (btor1361
            (signal
             (concat (signal-value btor237) (signal-value btor1360))
             (list)))
           (btor1362
            (signal
             (concat (signal-value btor238) (signal-value btor1361))
             (list)))
           (btor1363
            (signal
             (concat (signal-value btor239) (signal-value btor1362))
             (list)))
           (btor1364
            (signal
             (concat (signal-value btor188) (signal-value btor1363))
             (list)))
           (btor1365
            (signal
             (concat (signal-value btor189) (signal-value btor1364))
             (list)))
           (btor1366
            (signal
             (concat (signal-value btor190) (signal-value btor1365))
             (list)))
           (btor1367
            (signal
             (concat (signal-value btor191) (signal-value btor1366))
             (list)))
           (btor1368
            (signal
             (concat (signal-value btor192) (signal-value btor1367))
             (list)))
           (btor1369
            (signal
             (concat (signal-value btor193) (signal-value btor1368))
             (list)))
           (btor1370
            (signal
             (concat (signal-value btor194) (signal-value btor1369))
             (list)))
           (btor1371
            (signal
             (concat (signal-value btor195) (signal-value btor1370))
             (list)))
           (btor1372
            (signal
             (concat (signal-value btor196) (signal-value btor1371))
             (list)))
           (btor1373
            (signal
             (concat (signal-value btor197) (signal-value btor1372))
             (list)))
           (btor1374
            (signal
             (concat (signal-value btor199) (signal-value btor1373))
             (list)))
           (btor1375
            (signal
             (concat (signal-value btor200) (signal-value btor1374))
             (list)))
           (btor1376
            (signal
             (concat (signal-value btor201) (signal-value btor1375))
             (list)))
           (btor1377
            (signal
             (concat (signal-value btor202) (signal-value btor1376))
             (list)))
           (btor1378
            (signal
             (concat (signal-value btor203) (signal-value btor1377))
             (list)))
           (btor1379
            (signal
             (concat (signal-value btor204) (signal-value btor1378))
             (list)))
           (btor1380
            (signal
             (concat (signal-value btor205) (signal-value btor1379))
             (list)))
           (btor1381
            (signal
             (concat (signal-value btor206) (signal-value btor1380))
             (list)))
           (btor1382
            (signal
             (concat (signal-value btor207) (signal-value btor1381))
             (list)))
           (btor1383
            (signal
             (concat (signal-value btor208) (signal-value btor1382))
             (list)))
           (btor1384
            (signal
             (concat (signal-value btor210) (signal-value btor1383))
             (list)))
           (btor1385
            (signal
             (concat (signal-value btor211) (signal-value btor1384))
             (list)))
           (btor1386
            (signal
             (concat (signal-value btor212) (signal-value btor1385))
             (list)))
           (btor1387
            (signal
             (concat (signal-value btor213) (signal-value btor1386))
             (list)))
           (btor1388
            (signal
             (concat (signal-value btor214) (signal-value btor1387))
             (list)))
           (btor1389
            (signal
             (concat (signal-value btor215) (signal-value btor1388))
             (list)))
           (btor1390
            (signal
             (concat (signal-value btor216) (signal-value btor1389))
             (list)))
           (btor1391
            (signal
             (concat (signal-value btor217) (signal-value btor1390))
             (list)))
           (btor1392
            (signal
             (concat (signal-value btor218) (signal-value btor1391))
             (list)))
           (btor1393
            (signal
             (concat (signal-value btor219) (signal-value btor1392))
             (list)))
           (btor1394
            (signal
             (concat (signal-value btor221) (signal-value btor1393))
             (list)))
           (btor1395
            (signal
             (concat (signal-value btor222) (signal-value btor1394))
             (list)))
           (btor1396
            (signal
             (concat (signal-value btor223) (signal-value btor1395))
             (list)))
           (btor1397
            (signal
             (concat (signal-value btor224) (signal-value btor1396))
             (list)))
           (btor1398
            (signal
             (concat (signal-value btor225) (signal-value btor1397))
             (list)))
           (btor1399
            (signal
             (concat (signal-value btor226) (signal-value btor1398))
             (list)))
           (btor1400
            (signal
             (concat (signal-value btor227) (signal-value btor1399))
             (list)))
           (btor1401
            (signal
             (concat (signal-value btor228) (signal-value btor1400))
             (list)))
           (btor1402
            (signal
             (concat (signal-value btor229) (signal-value btor1401))
             (list)))
           (btor1403
            (signal
             (concat (signal-value btor230) (signal-value btor1402))
             (list)))
           (btor1404
            (signal
             (concat (signal-value btor232) (signal-value btor1403))
             (list)))
           (btor1405
            (signal
             (concat (signal-value btor233) (signal-value btor1404))
             (list)))
           (btor1406
            (signal
             (concat (signal-value btor234) (signal-value btor1405))
             (list)))
           (btor1407
            (signal
             (concat (signal-value btor235) (signal-value btor1406))
             (list)))
           (btor1408
            (signal
             (concat (signal-value btor345) (signal-value btor1407))
             (list)))
           (btor1409
            (signal
             (extract 26 26 (signal-value btor1213))
             (signal-state btor1213)))
           (btor1410
            (signal
             (bvand (signal-value btor1409) (signal-value btor795))
             (list)))
           (btor1411
            (signal
             (concat (signal-value btor1213) (signal-value btor973))
             (list)))
           (btor1412
            (signal
             (concat (signal-value btor1410) (signal-value btor1411))
             (list)))
           (btor1413
            (bv->signal
             (zero-extend (signal-value btor952) (bitvector 3))
             btor952))
           (btor1414
            (signal
             (bool->bitvector
              (bveq (signal-value btor1351) (signal-value btor1413)))
             (list)))
           (btor1415
            (if (bitvector->bool (signal-value btor1414)) btor1412 btor1408))
           (btor1416
            (bv->signal
             (zero-extend (signal-value btor607) (bitvector 3))
             btor607))
           (btor1417
            (signal
             (bool->bitvector
              (bveq (signal-value btor1351) (signal-value btor1416)))
             (list)))
           (btor1418
            (signal
             (bvor (signal-value btor1417) (signal-value btor1414))
             (list)))
           (btor1419
            (if (bitvector->bool (signal-value btor1418)) btor1415 btor1354))
           (btor1420 (bv->signal (bv 5 (bitvector 3))))
           (btor1421
            (signal
             (bool->bitvector
              (bveq (signal-value btor1351) (signal-value btor1420)))
             (list)))
           (btor1422
            (if (bitvector->bool (signal-value btor1421)) btor828 btor1013))
           (btor1423
            (signal
             (extract 53 0 (signal-value btor340))
             (signal-state btor340)))
           (btor1424
            (bv->signal
             (zero-extend (signal-value btor370) (bitvector 54))
             btor370))
           (btor1425
            (signal
             (bvsub (signal-value btor1423) (signal-value btor1424))
             (list)))
           (btor1426 (bv->signal (bv 7 (bitvector 3))))
           (btor1427
            (signal
             (bool->bitvector
              (bveq (signal-value btor1351) (signal-value btor1426)))
             (list)))
           (btor1428
            (if (bitvector->bool (signal-value btor1427)) btor1425 btor1423))
           (btor1429
            (signal
             (concat (signal-value btor592) (signal-value btor1428))
             (list)))
           (btor1430 (bv->signal (bv 6 (bitvector 3))))
           (btor1431
            (signal
             (bool->bitvector
              (bveq (signal-value btor1351) (signal-value btor1430)))
             (list)))
           (btor1432
            (signal
             (bvor (signal-value btor1431) (signal-value btor1427))
             (list)))
           (btor1433
            (if (bitvector->bool (signal-value btor1432)) btor1429 btor1422))
           (btor1434 (bv->signal (bv 4 (bitvector 3))))
           (btor1435
            (signal
             (bool->bitvector
              (bveq (signal-value btor1351) (signal-value btor1434)))
             (list)))
           (btor1436
            (signal
             (concat (signal-value btor1435) (signal-value btor1421))
             (list)))
           (btor1437
            (signal
             (concat (signal-value btor1432) (signal-value btor1436))
             (list)))
           (btor1438
            (signal
             (apply bvor (bitvector->bits (signal-value btor1437)))
             (signal-state btor1437)))
           (btor1439
            (if (bitvector->bool (signal-value btor1438)) btor1433 btor1419))
           (btor1440
            (bv->signal
             (zero-extend (signal-value btor1439) (bitvector 55))
             btor1439))
           (btor1441
            (signal
             (concat (signal-value btor75) (signal-value btor74))
             (list)))
           (btor1442
            (signal
             (concat (signal-value btor86) (signal-value btor1441))
             (list)))
           (btor1443
            (signal
             (concat (signal-value btor97) (signal-value btor1442))
             (list)))
           (btor1444
            (signal
             (concat (signal-value btor108) (signal-value btor1443))
             (list)))
           (btor1445
            (signal
             (concat (signal-value btor119) (signal-value btor1444))
             (list)))
           (btor1446
            (signal
             (concat (signal-value btor124) (signal-value btor1445))
             (list)))
           (btor1447
            (signal
             (concat (signal-value btor125) (signal-value btor1446))
             (list)))
           (btor1448
            (signal
             (concat (signal-value btor126) (signal-value btor1447))
             (list)))
           (btor1449
            (signal
             (concat (signal-value btor127) (signal-value btor1448))
             (list)))
           (btor1450
            (signal
             (concat (signal-value btor76) (signal-value btor1449))
             (list)))
           (btor1451
            (signal
             (concat (signal-value btor77) (signal-value btor1450))
             (list)))
           (btor1452
            (signal
             (concat (signal-value btor78) (signal-value btor1451))
             (list)))
           (btor1453
            (signal
             (concat (signal-value btor79) (signal-value btor1452))
             (list)))
           (btor1454
            (signal
             (concat (signal-value btor80) (signal-value btor1453))
             (list)))
           (btor1455
            (signal
             (concat (signal-value btor81) (signal-value btor1454))
             (list)))
           (btor1456
            (signal
             (concat (signal-value btor82) (signal-value btor1455))
             (list)))
           (btor1457
            (signal
             (concat (signal-value btor83) (signal-value btor1456))
             (list)))
           (btor1458
            (signal
             (concat (signal-value btor84) (signal-value btor1457))
             (list)))
           (btor1459
            (signal
             (concat (signal-value btor85) (signal-value btor1458))
             (list)))
           (btor1460
            (signal
             (concat (signal-value btor87) (signal-value btor1459))
             (list)))
           (btor1461
            (signal
             (concat (signal-value btor88) (signal-value btor1460))
             (list)))
           (btor1462
            (signal
             (concat (signal-value btor89) (signal-value btor1461))
             (list)))
           (btor1463
            (signal
             (concat (signal-value btor90) (signal-value btor1462))
             (list)))
           (btor1464
            (signal
             (concat (signal-value btor91) (signal-value btor1463))
             (list)))
           (btor1465
            (signal
             (concat (signal-value btor92) (signal-value btor1464))
             (list)))
           (btor1466
            (signal
             (concat (signal-value btor93) (signal-value btor1465))
             (list)))
           (btor1467
            (signal
             (concat (signal-value btor94) (signal-value btor1466))
             (list)))
           (btor1468
            (signal
             (concat (signal-value btor95) (signal-value btor1467))
             (list)))
           (btor1469
            (signal
             (concat (signal-value btor96) (signal-value btor1468))
             (list)))
           (btor1470
            (signal
             (concat (signal-value btor98) (signal-value btor1469))
             (list)))
           (btor1471
            (signal
             (concat (signal-value btor99) (signal-value btor1470))
             (list)))
           (btor1472
            (signal
             (concat (signal-value btor100) (signal-value btor1471))
             (list)))
           (btor1473
            (signal
             (concat (signal-value btor101) (signal-value btor1472))
             (list)))
           (btor1474
            (signal
             (concat (signal-value btor102) (signal-value btor1473))
             (list)))
           (btor1475
            (signal
             (concat (signal-value btor103) (signal-value btor1474))
             (list)))
           (btor1476
            (signal
             (concat (signal-value btor104) (signal-value btor1475))
             (list)))
           (btor1477
            (signal
             (concat (signal-value btor105) (signal-value btor1476))
             (list)))
           (btor1478
            (signal
             (concat (signal-value btor106) (signal-value btor1477))
             (list)))
           (btor1479
            (signal
             (concat (signal-value btor107) (signal-value btor1478))
             (list)))
           (btor1480
            (signal
             (concat (signal-value btor109) (signal-value btor1479))
             (list)))
           (btor1481
            (signal
             (concat (signal-value btor110) (signal-value btor1480))
             (list)))
           (btor1482
            (signal
             (concat (signal-value btor111) (signal-value btor1481))
             (list)))
           (btor1483
            (signal
             (concat (signal-value btor112) (signal-value btor1482))
             (list)))
           (btor1484
            (signal
             (concat (signal-value btor113) (signal-value btor1483))
             (list)))
           (btor1485
            (signal
             (concat (signal-value btor114) (signal-value btor1484))
             (list)))
           (btor1486
            (signal
             (concat (signal-value btor115) (signal-value btor1485))
             (list)))
           (btor1487
            (signal
             (concat (signal-value btor116) (signal-value btor1486))
             (list)))
           (btor1488
            (signal
             (concat (signal-value btor117) (signal-value btor1487))
             (list)))
           (btor1489
            (signal
             (concat (signal-value btor118) (signal-value btor1488))
             (list)))
           (btor1490
            (signal
             (concat (signal-value btor120) (signal-value btor1489))
             (list)))
           (btor1491
            (signal
             (concat (signal-value btor121) (signal-value btor1490))
             (list)))
           (btor1492
            (signal
             (concat (signal-value btor122) (signal-value btor1491))
             (list)))
           (btor1493
            (signal
             (concat (signal-value btor123) (signal-value btor1492))
             (list)))
           (btor1494
            (bv->signal
             (zero-extend (signal-value btor1493) (bitvector 54))
             btor1493))
           (btor1495
            (bv->signal
             (zero-extend (signal-value btor973) (bitvector 27))
             btor973))
           (btor1496
            (bv->signal
             (zero-extend (signal-value btor1213) (bitvector 27))
             btor1213))
           (btor1497
            (signal
             (concat (signal-value btor1213) (signal-value btor973))
             (list)))
           (btor1498
            (bv->signal
             (zero-extend (signal-value btor1497) (bitvector 54))
             btor1497))
           (btor1499
            (bv->signal
             (zero-extend (signal-value btor973) (bitvector 27))
             btor973))
           (btor1500
            (bv->signal
             (zero-extend (signal-value btor1213) (bitvector 27))
             btor1213))
           (btor1501
            (bv->signal
             (zero-extend (signal-value btor973) (bitvector 27))
             btor973))
           (btor1502
            (bv->signal
             (zero-extend (signal-value btor1213) (bitvector 27))
             btor1213))
           (btor1503 (bv->signal (bv 17 (bitvector 5))))
           (btor1504
            (signal
             (bool->bitvector
              (bveq (signal-value btor337) (signal-value btor1503)))
             (list)))
           (btor1505
            (if (bitvector->bool (signal-value btor1504)) btor131 btor128))
           (btor1506 (bv->signal (bv 16 (bitvector 5))))
           (btor1507
            (signal
             (bool->bitvector
              (bveq (signal-value btor337) (signal-value btor1506)))
             (list)))
           (btor1508
            (if (bitvector->bool (signal-value btor1507)) btor130 btor1505))
           (btor1509 (bv->signal (bv 15 (bitvector 4))))
           (btor1510
            (bv->signal
             (zero-extend (signal-value btor1509) (bitvector 5))
             btor1509))
           (btor1511
            (signal
             (bool->bitvector
              (bveq (signal-value btor337) (signal-value btor1510)))
             (list)))
           (btor1512
            (if (bitvector->bool (signal-value btor1511)) btor129 btor1508))
           (btor1513
            (bv->signal
             (zero-extend (signal-value btor370) (bitvector 5))
             btor370))
           (btor1514
            (signal
             (bool->bitvector
              (bveq (signal-value btor337) (signal-value btor1513)))
             (list)))
           (btor1515
            (if (bitvector->bool (signal-value btor1514)) btor128 btor1512))
           (btor1516
            (bv->signal
             (zero-extend (signal-value btor1515) (bitvector 1))
             btor1515))
           (btor1517
            (bv->signal
             (zero-extend (signal-value btor369) (bitvector 1))
             btor369))
           (btor1518
            (bv->signal
             (zero-extend (signal-value btor482) (bitvector 54))
             btor482))
           (btor1519
            (bv->signal
             (zero-extend (signal-value btor377) (bitvector 54))
             btor377))
           (btor1520 (bv->signal (bv 20 (bitvector 5))))
           (btor1521
            (signal
             (bool->bitvector
              (bveq (signal-value btor339) (signal-value btor1520)))
             (list)))
           (btor1522
            (if (bitvector->bool (signal-value btor1521)) btor344 btor341))
           (btor1523 (bv->signal (bv 19 (bitvector 5))))
           (btor1524
            (signal
             (bool->bitvector
              (bveq (signal-value btor339) (signal-value btor1523)))
             (list)))
           (btor1525
            (if (bitvector->bool (signal-value btor1524)) btor343 btor1522))
           (btor1526 (bv->signal (bv 18 (bitvector 5))))
           (btor1527
            (signal
             (bool->bitvector
              (bveq (signal-value btor339) (signal-value btor1526)))
             (list)))
           (btor1528
            (if (bitvector->bool (signal-value btor1527)) btor342 btor1525))
           (btor1529
            (bv->signal
             (zero-extend (signal-value btor607) (bitvector 5))
             btor607))
           (btor1530
            (signal
             (bool->bitvector
              (bveq (signal-value btor339) (signal-value btor1529)))
             (list)))
           (btor1531
            (if (bitvector->bool (signal-value btor1530)) btor341 btor1528))
           (btor1532
            (bv->signal
             (zero-extend (signal-value btor1531) (bitvector 1))
             btor1531))
           (btor1533
            (bv->signal
             (zero-extend (signal-value btor479) (bitvector 54))
             btor479))
           (btor1534
            (bv->signal
             (zero-extend (signal-value btor377) (bitvector 54))
             btor377))
           (btor1535
            (bv->signal
             (zero-extend (signal-value btor1350) (bitvector 55))
             btor1350))
           (btor1536
            (signal
             (concat (signal-value btor187) (signal-value btor186))
             (list)))
           (btor1537
            (signal
             (concat (signal-value btor198) (signal-value btor1536))
             (list)))
           (btor1538
            (signal
             (concat (signal-value btor209) (signal-value btor1537))
             (list)))
           (btor1539
            (signal
             (concat (signal-value btor220) (signal-value btor1538))
             (list)))
           (btor1540
            (signal
             (concat (signal-value btor231) (signal-value btor1539))
             (list)))
           (btor1541
            (signal
             (concat (signal-value btor236) (signal-value btor1540))
             (list)))
           (btor1542
            (signal
             (concat (signal-value btor237) (signal-value btor1541))
             (list)))
           (btor1543
            (signal
             (concat (signal-value btor238) (signal-value btor1542))
             (list)))
           (btor1544
            (signal
             (concat (signal-value btor239) (signal-value btor1543))
             (list)))
           (btor1545
            (signal
             (concat (signal-value btor188) (signal-value btor1544))
             (list)))
           (btor1546
            (signal
             (concat (signal-value btor189) (signal-value btor1545))
             (list)))
           (btor1547
            (signal
             (concat (signal-value btor190) (signal-value btor1546))
             (list)))
           (btor1548
            (signal
             (concat (signal-value btor191) (signal-value btor1547))
             (list)))
           (btor1549
            (signal
             (concat (signal-value btor192) (signal-value btor1548))
             (list)))
           (btor1550
            (signal
             (concat (signal-value btor193) (signal-value btor1549))
             (list)))
           (btor1551
            (signal
             (concat (signal-value btor194) (signal-value btor1550))
             (list)))
           (btor1552
            (signal
             (concat (signal-value btor195) (signal-value btor1551))
             (list)))
           (btor1553
            (signal
             (concat (signal-value btor196) (signal-value btor1552))
             (list)))
           (btor1554
            (signal
             (concat (signal-value btor197) (signal-value btor1553))
             (list)))
           (btor1555
            (signal
             (concat (signal-value btor199) (signal-value btor1554))
             (list)))
           (btor1556
            (signal
             (concat (signal-value btor200) (signal-value btor1555))
             (list)))
           (btor1557
            (signal
             (concat (signal-value btor201) (signal-value btor1556))
             (list)))
           (btor1558
            (signal
             (concat (signal-value btor202) (signal-value btor1557))
             (list)))
           (btor1559
            (signal
             (concat (signal-value btor203) (signal-value btor1558))
             (list)))
           (btor1560
            (signal
             (concat (signal-value btor204) (signal-value btor1559))
             (list)))
           (btor1561
            (signal
             (concat (signal-value btor205) (signal-value btor1560))
             (list)))
           (btor1562
            (signal
             (concat (signal-value btor206) (signal-value btor1561))
             (list)))
           (btor1563
            (signal
             (concat (signal-value btor207) (signal-value btor1562))
             (list)))
           (btor1564
            (signal
             (concat (signal-value btor208) (signal-value btor1563))
             (list)))
           (btor1565
            (signal
             (concat (signal-value btor210) (signal-value btor1564))
             (list)))
           (btor1566
            (signal
             (concat (signal-value btor211) (signal-value btor1565))
             (list)))
           (btor1567
            (signal
             (concat (signal-value btor212) (signal-value btor1566))
             (list)))
           (btor1568
            (signal
             (concat (signal-value btor213) (signal-value btor1567))
             (list)))
           (btor1569
            (signal
             (concat (signal-value btor214) (signal-value btor1568))
             (list)))
           (btor1570
            (signal
             (concat (signal-value btor215) (signal-value btor1569))
             (list)))
           (btor1571
            (signal
             (concat (signal-value btor216) (signal-value btor1570))
             (list)))
           (btor1572
            (signal
             (concat (signal-value btor217) (signal-value btor1571))
             (list)))
           (btor1573
            (signal
             (concat (signal-value btor218) (signal-value btor1572))
             (list)))
           (btor1574
            (signal
             (concat (signal-value btor219) (signal-value btor1573))
             (list)))
           (btor1575
            (signal
             (concat (signal-value btor221) (signal-value btor1574))
             (list)))
           (btor1576
            (signal
             (concat (signal-value btor222) (signal-value btor1575))
             (list)))
           (btor1577
            (signal
             (concat (signal-value btor223) (signal-value btor1576))
             (list)))
           (btor1578
            (signal
             (concat (signal-value btor224) (signal-value btor1577))
             (list)))
           (btor1579
            (signal
             (concat (signal-value btor225) (signal-value btor1578))
             (list)))
           (btor1580
            (signal
             (concat (signal-value btor226) (signal-value btor1579))
             (list)))
           (btor1581
            (signal
             (concat (signal-value btor227) (signal-value btor1580))
             (list)))
           (btor1582
            (signal
             (concat (signal-value btor228) (signal-value btor1581))
             (list)))
           (btor1583
            (signal
             (concat (signal-value btor229) (signal-value btor1582))
             (list)))
           (btor1584
            (signal
             (concat (signal-value btor230) (signal-value btor1583))
             (list)))
           (btor1585
            (signal
             (concat (signal-value btor232) (signal-value btor1584))
             (list)))
           (btor1586
            (signal
             (concat (signal-value btor233) (signal-value btor1585))
             (list)))
           (btor1587
            (signal
             (concat (signal-value btor234) (signal-value btor1586))
             (list)))
           (btor1588
            (signal
             (concat (signal-value btor235) (signal-value btor1587))
             (list)))
           (btor1589
            (bv->signal
             (zero-extend (signal-value btor1588) (bitvector 54))
             btor1588))
           (btor1590
            (bv->signal
             (zero-extend (signal-value btor482) (bitvector 54))
             btor482))
           (btor1591
            (signal
             (bvand (signal-value btor1258) (signal-value btor1439))
             (list)))
           (btor1592 (signal (bvnot (signal-value btor1591)) (list)))
           (btor1593
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1593")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1593"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1593")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1593")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 3))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1594 (bv->signal (bv 0 (bitvector 3))))
           (btor1595
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1595")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1595"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1595")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1595")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 3))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1597
            (if (bitvector->bool (signal-value btor599)) btor1595 btor1593))
           (btor1598
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1598")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1598"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1598")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1598")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 3))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1599
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1599")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1599"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1599")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1599")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 3))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1601
            (if (bitvector->bool (signal-value btor608)) btor1599 btor1598))
           (btor1602
            (signal
             (bvxor (signal-value btor1597) (signal-value btor1601))
             (list)))
           (btor1603
            (signal
             (concat (signal-value btor1602) (signal-value btor902))
             (list)))
           (btor1604
            (signal
             (apply bvor (bitvector->bits (signal-value btor1603)))
             (signal-state btor1603)))
           (btor1605 (signal (bvnot (signal-value btor1604)) (list)))
           (btor1606
            (if (bitvector->bool (signal-value btor1605)) btor1592 btor1014))
           (btor1607
            (signal
             (bvadd (signal-value btor1019) (signal-value btor1258))
             (list)))
           (btor1608
            (signal
             (bvadd (signal-value btor1607) (signal-value btor1439))
             (list)))
           (btor1609
            (bv->signal
             (zero-extend (signal-value btor1434) (bitvector 4))
             btor1434))
           (btor1610
            (signal
             (bool->bitvector
              (bveq (signal-value btor1603) (signal-value btor1609)))
             (list)))
           (btor1611
            (if (bitvector->bool (signal-value btor1610)) btor1608 btor1606))
           (btor1612
            (signal
             (bvsub (signal-value btor1019) (signal-value btor1258))
             (list)))
           (btor1613
            (signal
             (bvadd (signal-value btor1612) (signal-value btor1439))
             (list)))
           (btor1614
            (signal
             (bvsub (signal-value btor1607) (signal-value btor1439))
             (list)))
           (btor1615
            (bv->signal
             (zero-extend (signal-value btor1430) (bitvector 4))
             btor1430))
           (btor1616
            (signal
             (bool->bitvector
              (bveq (signal-value btor1603) (signal-value btor1615)))
             (list)))
           (btor1617
            (if (bitvector->bool (signal-value btor1616)) btor1614 btor1613))
           (btor1618
            (signal
             (bvsub (signal-value btor1612) (signal-value btor1439))
             (list)))
           (btor1619
            (bv->signal
             (zero-extend (signal-value btor1426) (bitvector 4))
             btor1426))
           (btor1620
            (signal
             (bool->bitvector
              (bveq (signal-value btor1603) (signal-value btor1619)))
             (list)))
           (btor1621
            (if (bitvector->bool (signal-value btor1620)) btor1618 btor1617))
           (btor1622
            (bv->signal
             (zero-extend (signal-value btor1420) (bitvector 4))
             btor1420))
           (btor1623
            (signal
             (bool->bitvector
              (bveq (signal-value btor1603) (signal-value btor1622)))
             (list)))
           (btor1624
            (signal
             (concat (signal-value btor1616) (signal-value btor1620))
             (list)))
           (btor1625
            (signal
             (concat (signal-value btor1623) (signal-value btor1624))
             (list)))
           (btor1626
            (signal
             (apply bvor (bitvector->bits (signal-value btor1625)))
             (signal-state btor1625)))
           (btor1627
            (if (bitvector->bool (signal-value btor1626)) btor1621 btor1611))
           (btor1628
            (signal
             ((lambda (a b) (bvnot (bvxor a b)))
              (signal-value btor1258)
              (signal-value btor1439))
             (list)))
           (btor1629
            (signal
             (bvxor (signal-value btor1258) (signal-value btor1439))
             (list)))
           (btor1630
            (signal
             (bool->bitvector
              (bveq (signal-value btor1603) (signal-value btor354)))
             (list)))
           (btor1631
            (if (bitvector->bool (signal-value btor1630)) btor1629 btor1628))
           (btor1632 (bv->signal (bv 8 (bitvector 4))))
           (btor1633
            (signal
             (bool->bitvector
              (bveq (signal-value btor1603) (signal-value btor1632)))
             (list)))
           (btor1634
            (if (bitvector->bool (signal-value btor1633)) btor1591 btor1631))
           (btor1635
            (signal
             (bvor (signal-value btor1258) (signal-value btor1439))
             (list)))
           (btor1636 (signal (bvnot (signal-value btor1635)) (list)))
           (btor1637
            (signal
             (bool->bitvector
              (bveq (signal-value btor1603) (signal-value btor366)))
             (list)))
           (btor1638
            (if (bitvector->bool (signal-value btor1637)) btor1636 btor1635))
           (btor1639
            (bv->signal
             (zero-extend (signal-value btor952) (bitvector 4))
             btor952))
           (btor1640
            (signal
             (bool->bitvector
              (bveq (signal-value btor1603) (signal-value btor1639)))
             (list)))
           (btor1641
            (signal
             (bvor (signal-value btor1640) (signal-value btor1637))
             (list)))
           (btor1642
            (if (bitvector->bool (signal-value btor1641)) btor1638 btor1634))
           (btor1643
            (signal
             (bool->bitvector
              (bveq (signal-value btor1603) (signal-value btor362)))
             (list)))
           (btor1644
            (signal
             (concat (signal-value btor1630) (signal-value btor1633))
             (list)))
           (btor1645
            (signal
             (concat (signal-value btor1643) (signal-value btor1644))
             (list)))
           (btor1646
            (signal
             (concat (signal-value btor1641) (signal-value btor1645))
             (list)))
           (btor1647
            (signal
             (apply bvor (bitvector->bits (signal-value btor1646)))
             (signal-state btor1646)))
           (btor1648
            (if (bitvector->bool (signal-value btor1647)) btor1642 btor1627))
           (btor1649
            (signal
             (extract 54 0 (signal-value btor284))
             (signal-state btor284)))
           (btor1650 (signal (bvnot (signal-value btor1649)) (list)))
           (btor1651
            (signal
             (bvand (signal-value btor1648) (signal-value btor1650))
             (list)))
           (btor1652
            (signal
             (apply bvor (bitvector->bits (signal-value btor1651)))
             (signal-state btor1651)))
           (btor1653 (signal (bvnot (signal-value btor1652)) (list)))
           (btor1654
            (signal
             (bvor (signal-value btor1648) (signal-value btor1649))
             (list)))
           (btor1655
            (signal
             (apply bvand (bitvector->bits (signal-value btor1654)))
             (signal-state btor1654)))
           (btor1656
            (signal
             (bvor (signal-value btor1653) (signal-value btor1655))
             (list)))
           (btor1657 (signal (bvnot (signal-value btor1656)) (list)))
           (btor1658
            (bv->signal
             (zero-extend (signal-value btor1657) (bitvector 1))
             btor1657))
           (btor1659
            (bv->signal
             (zero-extend (signal-value btor610) (bitvector 1))
             btor610))
           (btor1660
            (bv->signal
             (zero-extend (signal-value btor610) (bitvector 1))
             btor610))
           (btor1661
            (bv->signal
             (zero-extend (signal-value btor1655) (bitvector 1))
             btor1655))
           (btor1662
            (bv->signal
             (zero-extend (signal-value btor610) (bitvector 1))
             btor610))
           (btor1663
            (bv->signal
             (zero-extend (signal-value btor609) (bitvector 1))
             btor609))
           (btor1664
            (bv->signal
             (zero-extend (signal-value btor600) (bitvector 1))
             btor600))
           (btor1665
            (bv->signal
             (zero-extend (signal-value btor620) (bitvector 1))
             btor620))
           (btor1666
            (bv->signal
             (zero-extend (signal-value btor620) (bitvector 1))
             btor620))
           (btor1667
            (signal
             (extract 53 0 (signal-value btor1648))
             (signal-state btor1648)))
           (btor1668
            (signal
             (extract 53 0 (signal-value btor323))
             (signal-state btor323)))
           (btor1669 (bv->signal (bv 23 (bitvector 5))))
           (btor1670
            (signal
             (bool->bitvector
              (bveq (signal-value btor324) (signal-value btor1669)))
             (list)))
           (btor1671
            (if (bitvector->bool (signal-value btor1670)) btor1668 btor1497))
           (btor1672
            (signal
             (bvxor (signal-value btor1667) (signal-value btor1671))
             (list)))
           (btor1673 (signal (bvnot (signal-value btor1672)) (list)))
           (btor1674
            (signal
             (extract 53 0 (signal-value btor285))
             (signal-state btor285)))
           (btor1675
            (signal
             (bool->bitvector
              (bveq (signal-value btor286) (signal-value btor1669)))
             (list)))
           (btor1676
            (if (bitvector->bool (signal-value btor1675)) btor1674 btor1497))
           (btor1677
            (signal
             (bvor (signal-value btor1673) (signal-value btor1676))
             (list)))
           (btor1678
            (signal
             (apply bvand (bitvector->bits (signal-value btor1677)))
             (signal-state btor1677)))
           (btor1679
            (bv->signal
             (zero-extend (signal-value btor1678) (bitvector 1))
             btor1678))
           (btor1680
            (bv->signal
             (zero-extend (signal-value btor620) (bitvector 1))
             btor620))
           (btor1681
            (bv->signal
             (zero-extend (signal-value btor619) (bitvector 1))
             btor619))
           (btor1682
            (bv->signal
             (zero-extend (signal-value btor615) (bitvector 1))
             btor615))
           (btor1683
            (bv->signal
             (zero-extend (signal-value btor630) (bitvector 1))
             btor630))
           (btor1684
            (bv->signal
             (zero-extend (signal-value btor630) (bitvector 1))
             btor630))
           (btor1685
            (signal
             (bvor (signal-value btor1672) (signal-value btor1676))
             (list)))
           (btor1686
            (signal
             (apply bvand (bitvector->bits (signal-value btor1685)))
             (signal-state btor1685)))
           (btor1687
            (bv->signal
             (zero-extend (signal-value btor1686) (bitvector 1))
             btor1686))
           (btor1688
            (bv->signal
             (zero-extend (signal-value btor630) (bitvector 1))
             btor630))
           (btor1689
            (bv->signal
             (zero-extend (signal-value btor629) (bitvector 1))
             btor629))
           (btor1690
            (bv->signal
             (zero-extend (signal-value btor625) (bitvector 1))
             btor625))
           (btor1691
            (bv->signal
             (zero-extend (signal-value btor640) (bitvector 1))
             btor640))
           (btor1692
            (bv->signal
             (zero-extend (signal-value btor640) (bitvector 1))
             btor640))
           (btor1693
            (signal
             (apply bvor (bitvector->bits (signal-value btor1667)))
             (signal-state btor1667)))
           (btor1694 (signal (bvnot (signal-value btor1693)) (list)))
           (btor1695
            (bv->signal
             (zero-extend (signal-value btor1694) (bitvector 1))
             btor1694))
           (btor1696
            (bv->signal
             (zero-extend (signal-value btor640) (bitvector 1))
             btor640))
           (btor1697
            (bv->signal
             (zero-extend (signal-value btor639) (bitvector 1))
             btor639))
           (btor1698
            (bv->signal
             (zero-extend (signal-value btor635) (bitvector 1))
             btor635))
           (btor1699
            (bv->signal
             (zero-extend (signal-value btor650) (bitvector 1))
             btor650))
           (btor1700
            (bv->signal
             (zero-extend (signal-value btor650) (bitvector 1))
             btor650))
           (btor1701
            (bv->signal
             (zero-extend (signal-value btor1653) (bitvector 1))
             btor1653))
           (btor1702
            (bv->signal
             (zero-extend (signal-value btor650) (bitvector 1))
             btor650))
           (btor1703
            (bv->signal
             (zero-extend (signal-value btor649) (bitvector 1))
             btor649))
           (btor1704
            (bv->signal
             (zero-extend (signal-value btor645) (bitvector 1))
             btor645))
           (btor1705
            (bv->signal
             (zero-extend (signal-value btor128) (bitvector 1))
             btor128))
           (btor1706
            (bv->signal
             (zero-extend (signal-value btor240) (bitvector 1))
             btor240))
           (btor1707
            (bv->signal
             (zero-extend (signal-value btor341) (bitvector 1))
             btor341))
           (btor1708
            (bv->signal
             (zero-extend (signal-value btor128) (bitvector 1))
             btor128))
           (btor1709
            (bv->signal
             (zero-extend (signal-value btor128) (bitvector 1))
             btor128))
           (btor1710
            (bv->signal
             (zero-extend (signal-value btor240) (bitvector 1))
             btor240))
           (btor1711
            (bv->signal
             (zero-extend (signal-value btor240) (bitvector 1))
             btor240))
           (btor1712
            (bv->signal
             (zero-extend (signal-value btor341) (bitvector 1))
             btor341))
           (btor1713
            (bv->signal
             (zero-extend (signal-value btor341) (bitvector 1))
             btor341))
           (btor1714
            (signal
             (concat (signal-value btor248) (signal-value btor247))
             (list)))
           (btor1715
            (signal
             (concat (signal-value btor259) (signal-value btor1714))
             (list)))
           (btor1716
            (signal
             (concat (signal-value btor270) (signal-value btor1715))
             (list)))
           (btor1717
            (signal
             (concat (signal-value btor277) (signal-value btor1716))
             (list)))
           (btor1718
            (signal
             (concat (signal-value btor278) (signal-value btor1717))
             (list)))
           (btor1719
            (signal
             (concat (signal-value btor279) (signal-value btor1718))
             (list)))
           (btor1720
            (signal
             (concat (signal-value btor280) (signal-value btor1719))
             (list)))
           (btor1721
            (signal
             (concat (signal-value btor281) (signal-value btor1720))
             (list)))
           (btor1722
            (signal
             (concat (signal-value btor282) (signal-value btor1721))
             (list)))
           (btor1723
            (signal
             (concat (signal-value btor249) (signal-value btor1722))
             (list)))
           (btor1724
            (signal
             (concat (signal-value btor250) (signal-value btor1723))
             (list)))
           (btor1725
            (signal
             (concat (signal-value btor251) (signal-value btor1724))
             (list)))
           (btor1726
            (signal
             (concat (signal-value btor252) (signal-value btor1725))
             (list)))
           (btor1727
            (signal
             (concat (signal-value btor253) (signal-value btor1726))
             (list)))
           (btor1728
            (signal
             (concat (signal-value btor254) (signal-value btor1727))
             (list)))
           (btor1729
            (signal
             (concat (signal-value btor255) (signal-value btor1728))
             (list)))
           (btor1730
            (signal
             (concat (signal-value btor256) (signal-value btor1729))
             (list)))
           (btor1731
            (signal
             (concat (signal-value btor257) (signal-value btor1730))
             (list)))
           (btor1732
            (signal
             (concat (signal-value btor258) (signal-value btor1731))
             (list)))
           (btor1733
            (signal
             (concat (signal-value btor260) (signal-value btor1732))
             (list)))
           (btor1734
            (signal
             (concat (signal-value btor261) (signal-value btor1733))
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
             (concat (signal-value btor268) (signal-value btor1740))
             (list)))
           (btor1742
            (signal
             (concat (signal-value btor269) (signal-value btor1741))
             (list)))
           (btor1743
            (signal
             (concat (signal-value btor271) (signal-value btor1742))
             (list)))
           (btor1744
            (signal
             (concat (signal-value btor272) (signal-value btor1743))
             (list)))
           (btor1745
            (signal
             (concat (signal-value btor273) (signal-value btor1744))
             (list)))
           (btor1746
            (signal
             (concat (signal-value btor274) (signal-value btor1745))
             (list)))
           (btor1747
            (signal
             (concat (signal-value btor275) (signal-value btor1746))
             (list)))
           (btor1748
            (signal
             (concat (signal-value btor276) (signal-value btor1747))
             (list)))
           (btor1749
            (bv->signal
             (zero-extend (signal-value btor1748) (bitvector 36))
             btor1748))
           (btor1750
            (bv->signal
             (zero-extend (signal-value btor955) (bitvector 55))
             btor955))
           (btor1751
            (bv->signal
             (zero-extend (signal-value btor1649) (bitvector 55))
             btor1649))
           (btor1752
            (bv->signal
             (zero-extend (signal-value btor1676) (bitvector 54))
             btor1676))
           (btor1753
            (bv->signal
             (zero-extend (signal-value btor1674) (bitvector 54))
             btor1674))
           (btor1754
            (signal
             (concat (signal-value btor287) (signal-value btor673))
             (list)))
           (btor1755
            (signal
             (concat (signal-value btor288) (signal-value btor1754))
             (list)))
           (btor1756
            (signal
             (concat (signal-value btor299) (signal-value btor1755))
             (list)))
           (btor1757
            (signal
             (concat (signal-value btor310) (signal-value btor1756))
             (list)))
           (btor1758
            (signal
             (concat (signal-value btor317) (signal-value btor1757))
             (list)))
           (btor1759
            (signal
             (concat (signal-value btor318) (signal-value btor1758))
             (list)))
           (btor1760
            (signal
             (concat (signal-value btor319) (signal-value btor1759))
             (list)))
           (btor1761
            (signal
             (concat (signal-value btor320) (signal-value btor1760))
             (list)))
           (btor1762
            (signal
             (concat (signal-value btor321) (signal-value btor1761))
             (list)))
           (btor1763
            (signal
             (concat (signal-value btor322) (signal-value btor1762))
             (list)))
           (btor1764
            (signal
             (concat (signal-value btor289) (signal-value btor1763))
             (list)))
           (btor1765
            (signal
             (concat (signal-value btor290) (signal-value btor1764))
             (list)))
           (btor1766
            (signal
             (concat (signal-value btor291) (signal-value btor1765))
             (list)))
           (btor1767
            (signal
             (concat (signal-value btor292) (signal-value btor1766))
             (list)))
           (btor1768
            (signal
             (concat (signal-value btor293) (signal-value btor1767))
             (list)))
           (btor1769
            (signal
             (concat (signal-value btor294) (signal-value btor1768))
             (list)))
           (btor1770
            (signal
             (concat (signal-value btor295) (signal-value btor1769))
             (list)))
           (btor1771
            (signal
             (concat (signal-value btor296) (signal-value btor1770))
             (list)))
           (btor1772
            (signal
             (concat (signal-value btor297) (signal-value btor1771))
             (list)))
           (btor1773
            (signal
             (concat (signal-value btor298) (signal-value btor1772))
             (list)))
           (btor1774
            (signal
             (concat (signal-value btor300) (signal-value btor1773))
             (list)))
           (btor1775
            (signal
             (concat (signal-value btor301) (signal-value btor1774))
             (list)))
           (btor1776
            (signal
             (concat (signal-value btor302) (signal-value btor1775))
             (list)))
           (btor1777
            (signal
             (concat (signal-value btor303) (signal-value btor1776))
             (list)))
           (btor1778
            (signal
             (concat (signal-value btor304) (signal-value btor1777))
             (list)))
           (btor1779
            (signal
             (concat (signal-value btor305) (signal-value btor1778))
             (list)))
           (btor1780
            (signal
             (concat (signal-value btor306) (signal-value btor1779))
             (list)))
           (btor1781
            (signal
             (concat (signal-value btor307) (signal-value btor1780))
             (list)))
           (btor1782
            (signal
             (concat (signal-value btor308) (signal-value btor1781))
             (list)))
           (btor1783
            (signal
             (concat (signal-value btor309) (signal-value btor1782))
             (list)))
           (btor1784
            (signal
             (concat (signal-value btor311) (signal-value btor1783))
             (list)))
           (btor1785
            (signal
             (concat (signal-value btor312) (signal-value btor1784))
             (list)))
           (btor1786
            (signal
             (concat (signal-value btor313) (signal-value btor1785))
             (list)))
           (btor1787
            (signal
             (concat (signal-value btor314) (signal-value btor1786))
             (list)))
           (btor1788
            (signal
             (concat (signal-value btor315) (signal-value btor1787))
             (list)))
           (btor1789
            (signal
             (concat (signal-value btor316) (signal-value btor1788))
             (list)))
           (btor1790
            (bv->signal
             (zero-extend (signal-value btor1789) (bitvector 54))
             btor1789))
           (btor1791
            (signal
             (concat (signal-value btor288) (signal-value btor287))
             (list)))
           (btor1792
            (signal
             (concat (signal-value btor299) (signal-value btor1791))
             (list)))
           (btor1793
            (signal
             (concat (signal-value btor310) (signal-value btor1792))
             (list)))
           (btor1794
            (signal
             (concat (signal-value btor317) (signal-value btor1793))
             (list)))
           (btor1795
            (signal
             (concat (signal-value btor318) (signal-value btor1794))
             (list)))
           (btor1796
            (signal
             (concat (signal-value btor319) (signal-value btor1795))
             (list)))
           (btor1797
            (signal
             (concat (signal-value btor320) (signal-value btor1796))
             (list)))
           (btor1798
            (signal
             (concat (signal-value btor321) (signal-value btor1797))
             (list)))
           (btor1799
            (signal
             (concat (signal-value btor322) (signal-value btor1798))
             (list)))
           (btor1800
            (signal
             (concat (signal-value btor289) (signal-value btor1799))
             (list)))
           (btor1801
            (signal
             (concat (signal-value btor290) (signal-value btor1800))
             (list)))
           (btor1802
            (signal
             (concat (signal-value btor291) (signal-value btor1801))
             (list)))
           (btor1803
            (signal
             (concat (signal-value btor292) (signal-value btor1802))
             (list)))
           (btor1804
            (signal
             (concat (signal-value btor293) (signal-value btor1803))
             (list)))
           (btor1805
            (signal
             (concat (signal-value btor294) (signal-value btor1804))
             (list)))
           (btor1806
            (signal
             (concat (signal-value btor295) (signal-value btor1805))
             (list)))
           (btor1807
            (signal
             (concat (signal-value btor296) (signal-value btor1806))
             (list)))
           (btor1808
            (signal
             (concat (signal-value btor297) (signal-value btor1807))
             (list)))
           (btor1809
            (signal
             (concat (signal-value btor298) (signal-value btor1808))
             (list)))
           (btor1810
            (signal
             (concat (signal-value btor300) (signal-value btor1809))
             (list)))
           (btor1811
            (signal
             (concat (signal-value btor301) (signal-value btor1810))
             (list)))
           (btor1812
            (signal
             (concat (signal-value btor302) (signal-value btor1811))
             (list)))
           (btor1813
            (signal
             (concat (signal-value btor303) (signal-value btor1812))
             (list)))
           (btor1814
            (signal
             (concat (signal-value btor304) (signal-value btor1813))
             (list)))
           (btor1815
            (signal
             (concat (signal-value btor305) (signal-value btor1814))
             (list)))
           (btor1816
            (signal
             (concat (signal-value btor306) (signal-value btor1815))
             (list)))
           (btor1817
            (signal
             (concat (signal-value btor307) (signal-value btor1816))
             (list)))
           (btor1818
            (signal
             (concat (signal-value btor308) (signal-value btor1817))
             (list)))
           (btor1819
            (signal
             (concat (signal-value btor309) (signal-value btor1818))
             (list)))
           (btor1820
            (signal
             (concat (signal-value btor311) (signal-value btor1819))
             (list)))
           (btor1821
            (signal
             (concat (signal-value btor312) (signal-value btor1820))
             (list)))
           (btor1822
            (signal
             (concat (signal-value btor313) (signal-value btor1821))
             (list)))
           (btor1823
            (signal
             (concat (signal-value btor314) (signal-value btor1822))
             (list)))
           (btor1824
            (signal
             (concat (signal-value btor315) (signal-value btor1823))
             (list)))
           (btor1825
            (signal
             (concat (signal-value btor316) (signal-value btor1824))
             (list)))
           (btor1826
            (bv->signal
             (zero-extend (signal-value btor1825) (bitvector 36))
             btor1825))
           (btor1827
            (bv->signal
             (zero-extend (signal-value btor1205) (bitvector 55))
             btor1205))
           (btor1828
            (bv->signal
             (zero-extend (signal-value btor1671) (bitvector 54))
             btor1671))
           (btor1829
            (bv->signal
             (zero-extend (signal-value btor1668) (bitvector 54))
             btor1668))
           (btor1830
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1830")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1830"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1830")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1830")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 3))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1831
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1831")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1831"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1831")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1831")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 3))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1833
            (if (bitvector->bool (signal-value btor599)) btor1831 btor1830))
           (btor1834
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1834")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1834"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1834")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1834")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 3))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1835
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1835")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1835"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1835")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1835")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 3))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1837
            (if (bitvector->bool (signal-value btor608)) btor1835 btor1834))
           (btor1838
            (signal
             (bvxor (signal-value btor1833) (signal-value btor1837))
             (list)))
           (btor1839
            (bv->signal
             (zero-extend (signal-value btor1838) (bitvector 3))
             btor1838))
           (btor1840
            (bv->signal
             (zero-extend (signal-value btor1838) (bitvector 3))
             btor1838))
           (btor1841
            (bv->signal
             (zero-extend (signal-value btor1837) (bitvector 3))
             btor1837))
           (btor1842
            (bv->signal
             (zero-extend (signal-value btor1833) (bitvector 3))
             btor1833))
           (btor1843
            (bv->signal
             (zero-extend (signal-value btor1602) (bitvector 3))
             btor1602))
           (btor1844
            (bv->signal
             (zero-extend (signal-value btor1602) (bitvector 3))
             btor1602))
           (btor1845
            (bv->signal
             (zero-extend (signal-value btor1601) (bitvector 3))
             btor1601))
           (btor1846
            (bv->signal
             (zero-extend (signal-value btor1597) (bitvector 3))
             btor1597))
           (btor1847
            (bv->signal
             (zero-extend (signal-value btor1838) (bitvector 3))
             btor1838))
           (btor1848
            (bv->signal
             (zero-extend (signal-value btor1602) (bitvector 3))
             btor1602))
           (btor1849
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1849")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1849"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1849")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1849")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1850
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1850")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1850"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1850")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1850")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1852
            (if (bitvector->bool (signal-value btor599)) btor1850 btor1849))
           (btor1853
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1853")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1853"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1853")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1853")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1854
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1854")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1854"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1854")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1854")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1856
            (if (bitvector->bool (signal-value btor608)) btor1854 btor1853))
           (btor1857
            (signal
             (bvxor (signal-value btor1852) (signal-value btor1856))
             (list)))
           (btor1858
            (bv->signal
             (zero-extend (signal-value btor1857) (bitvector 1))
             btor1857))
           (btor1859
            (bv->signal
             (zero-extend (signal-value btor1857) (bitvector 1))
             btor1857))
           (btor1860
            (bv->signal
             (zero-extend (signal-value btor1856) (bitvector 1))
             btor1856))
           (btor1861
            (bv->signal
             (zero-extend (signal-value btor1852) (bitvector 1))
             btor1852))
           (btor1862
            (bv->signal
             (zero-extend (signal-value btor902) (bitvector 1))
             btor902))
           (btor1863
            (bv->signal
             (zero-extend (signal-value btor902) (bitvector 1))
             btor902))
           (btor1864
            (bv->signal
             (zero-extend (signal-value btor901) (bitvector 1))
             btor901))
           (btor1865
            (bv->signal
             (zero-extend (signal-value btor897) (bitvector 1))
             btor897))
           (btor1866
            (bv->signal
             (zero-extend (signal-value btor1857) (bitvector 1))
             btor1857))
           (btor1867
            (bv->signal
             (zero-extend (signal-value btor902) (bitvector 1))
             btor902))
           (btor1868
            (signal
             (concat (signal-value btor327) (signal-value btor326))
             (list)))
           (btor1869
            (signal
             (concat (signal-value btor329) (signal-value btor1868))
             (list)))
           (btor1870
            (signal
             (concat (signal-value btor330) (signal-value btor1869))
             (list)))
           (btor1871
            (signal
             (concat (signal-value btor331) (signal-value btor1870))
             (list)))
           (btor1872
            (signal
             (concat (signal-value btor332) (signal-value btor1871))
             (list)))
           (btor1873
            (signal
             (concat (signal-value btor333) (signal-value btor1872))
             (list)))
           (btor1874
            (signal
             (concat (signal-value btor334) (signal-value btor1873))
             (list)))
           (btor1875
            (signal
             (concat (signal-value btor335) (signal-value btor1874))
             (list)))
           (btor1876
            (signal
             (concat (signal-value btor336) (signal-value btor1875))
             (list)))
           (btor1877
            (signal
             (concat (signal-value btor328) (signal-value btor1876))
             (list)))
           (btor1878
            (bv->signal
             (zero-extend (signal-value btor1877) (bitvector 11))
             btor1877))
           (btor1879
            (signal
             (concat (signal-value btor902) (signal-value btor964))
             (list)))
           (btor1880
            (signal
             (concat (signal-value btor1602) (signal-value btor1879))
             (list)))
           (btor1881
            (bv->signal
             (zero-extend (signal-value btor1880) (bitvector 11))
             btor1880))
           (btor1882
            (bv->signal
             (zero-extend (signal-value btor128) (bitvector 1))
             btor128))
           (btor1883
            (bv->signal
             (zero-extend (signal-value btor240) (bitvector 1))
             btor240))
           (btor1884
            (bv->signal
             (zero-extend (signal-value btor341) (bitvector 1))
             btor341))
           (btor1885
            (bv->signal
             (zero-extend (signal-value btor128) (bitvector 1))
             btor128))
           (btor1886
            (bv->signal
             (zero-extend (signal-value btor240) (bitvector 1))
             btor240))
           (btor1887
            (bv->signal
             (zero-extend (signal-value btor341) (bitvector 1))
             btor341))
           (btor1888
            (bv->signal
             (zero-extend (signal-value btor128) (bitvector 1))
             btor128))
           (btor1889
            (bv->signal
             (zero-extend (signal-value btor240) (bitvector 1))
             btor240))
           (btor1890
            (bv->signal
             (zero-extend (signal-value btor341) (bitvector 1))
             btor341))
           (btor1891
            (bv->signal
             (zero-extend (signal-value btor128) (bitvector 1))
             btor128))
           (btor1892
            (bv->signal
             (zero-extend (signal-value btor240) (bitvector 1))
             btor240))
           (btor1893
            (bv->signal
             (zero-extend (signal-value btor341) (bitvector 1))
             btor341))
           (btor1894
            (bv->signal
             (zero-extend (signal-value btor240) (bitvector 1))
             btor240))
           (btor1895
            (bv->signal
             (zero-extend (signal-value btor240) (bitvector 1))
             btor240))
           (btor1896
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1896")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1896"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1896")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1896")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 7))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1897
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1897")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1897"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1897")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1897")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 7))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1899
            (if (bitvector->bool (signal-value btor599)) btor1897 btor1896))
           (btor1900
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1900")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1900"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1900")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1900")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 7))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1901
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1901")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1901"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1901")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1901")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 7))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1903
            (if (bitvector->bool (signal-value btor608)) btor1901 btor1900))
           (btor1904
            (signal
             (bvxor (signal-value btor1899) (signal-value btor1903))
             (list)))
           (btor1905
            (bv->signal
             (zero-extend (signal-value btor1904) (bitvector 7))
             btor1904))
           (btor1906
            (bv->signal
             (zero-extend (signal-value btor1904) (bitvector 7))
             btor1904))
           (btor1907
            (bv->signal
             (zero-extend (signal-value btor1903) (bitvector 7))
             btor1903))
           (btor1908
            (bv->signal
             (zero-extend (signal-value btor1899) (bitvector 7))
             btor1899))
           (btor1909
            (bv->signal
             (zero-extend (signal-value btor964) (bitvector 7))
             btor964))
           (btor1910
            (bv->signal
             (zero-extend (signal-value btor964) (bitvector 7))
             btor964))
           (btor1911
            (bv->signal
             (zero-extend (signal-value btor963) (bitvector 7))
             btor963))
           (btor1912
            (bv->signal
             (zero-extend (signal-value btor959) (bitvector 7))
             btor959))
           (btor1913
            (bv->signal
             (zero-extend (signal-value btor1904) (bitvector 7))
             btor1904))
           (btor1914
            (bv->signal
             (zero-extend (signal-value btor964) (bitvector 7))
             btor964))
           (btor1915
            (bv->signal
             (zero-extend (signal-value btor128) (bitvector 1))
             btor128))
           (btor1916
            (bv->signal
             (zero-extend (signal-value btor240) (bitvector 1))
             btor240))
           (btor1917
            (bv->signal
             (zero-extend (signal-value btor341) (bitvector 1))
             btor341))
           (btor1918
            (bv->signal
             (zero-extend (signal-value btor128) (bitvector 1))
             btor128))
           (btor1919
            (bv->signal
             (zero-extend (signal-value btor240) (bitvector 1))
             btor240))
           (btor1920
            (bv->signal
             (zero-extend (signal-value btor341) (bitvector 1))
             btor341))
           (btor1921
            (bv->signal
             (zero-extend (signal-value btor660) (bitvector 1))
             btor660))
           (btor1922
            (bv->signal
             (zero-extend (signal-value btor660) (bitvector 1))
             btor660))
           (btor1923
            (signal
             (bvand (signal-value btor650) (signal-value btor1657))
             (list)))
           (btor1924
            (bv->signal
             (zero-extend (signal-value btor1923) (bitvector 1))
             btor1923))
           (btor1925
            (bv->signal
             (zero-extend (signal-value btor660) (bitvector 1))
             btor660))
           (btor1926
            (bv->signal
             (zero-extend (signal-value btor659) (bitvector 1))
             btor659))
           (btor1927
            (bv->signal
             (zero-extend (signal-value btor655) (bitvector 1))
             btor655))
           (btor1928
            (signal
             (bvand (signal-value btor346) (signal-value btor347))
             (list)))
           (btor1929 (signal (bvnot (signal-value btor1928)) (list)))
           (btor1930
            (bv->signal
             (zero-extend (signal-value btor1420) (bitvector 5))
             btor1420))
           (btor1931
            (signal
             (bool->bitvector
              (bveq (signal-value btor246) (signal-value btor1930)))
             (list)))
           (btor1932
            (if (bitvector->bool (signal-value btor1931)) btor592 btor1929))
           (btor1933
            (bv->signal
             (zero-extend (signal-value btor1932) (bitvector 1))
             btor1932))
           (btor1934
            (bv->signal
             (zero-extend (signal-value btor670) (bitvector 1))
             btor670))
           (btor1935
            (bv->signal
             (zero-extend (signal-value btor670) (bitvector 1))
             btor670))
           (btor1936
            (signal
             (extract 53 0 (signal-value btor1019))
             (signal-state btor1019)))
           (btor1937
            (signal
             (extract 53 0 (signal-value btor1258))
             (signal-state btor1258)))
           (btor1938
            (signal
             (bvadd (signal-value btor1936) (signal-value btor1937))
             (list)))
           (btor1939
            (signal
             (extract 53 0 (signal-value btor1439))
             (signal-state btor1439)))
           (btor1940
            (signal
             (bvadd (signal-value btor1938) (signal-value btor1939))
             (list)))
           (btor1941
            (if (bitvector->bool (signal-value btor1610)) btor1940 btor350))
           (btor1942
            (signal
             (bvsub (signal-value btor1936) (signal-value btor1937))
             (list)))
           (btor1943
            (signal
             (bvadd (signal-value btor1942) (signal-value btor1939))
             (list)))
           (btor1944
            (if (bitvector->bool (signal-value btor1623)) btor1943 btor1941))
           (btor1945
            (signal
             (bvsub (signal-value btor1938) (signal-value btor1939))
             (list)))
           (btor1946
            (signal
             (bvsub (signal-value btor1942) (signal-value btor1939))
             (list)))
           (btor1947
            (if (bitvector->bool (signal-value btor1620)) btor1946 btor1945))
           (btor1948
            (signal
             (bvor (signal-value btor1616) (signal-value btor1620))
             (list)))
           (btor1949
            (if (bitvector->bool (signal-value btor1948)) btor1947 btor1944))
           (btor1950
            (signal
             (extract 53 53 (signal-value btor1949))
             (signal-state btor1949)))
           (btor1951
            (if (bitvector->bool (signal-value btor1932)) btor1950 btor1657))
           (btor1952
            (bv->signal
             (zero-extend (signal-value btor1951) (bitvector 1))
             btor1951))
           (btor1953
            (bv->signal
             (zero-extend (signal-value btor670) (bitvector 1))
             btor670))
           (btor1954
            (bv->signal
             (zero-extend (signal-value btor669) (bitvector 1))
             btor669))
           (btor1955
            (bv->signal
             (zero-extend (signal-value btor665) (bitvector 1))
             btor665))
           (btor1956
            (bv->signal
             (zero-extend (signal-value btor1648) (bitvector 55))
             btor1648))
           (btor1957
            (bv->signal
             (zero-extend (signal-value btor1949) (bitvector 54))
             btor1949))
           (btor1958
            (bv->signal
             (zero-extend (signal-value btor676) (bitvector 18))
             btor676))
           (btor1959
            (bv->signal
             (zero-extend (signal-value btor676) (bitvector 18))
             btor676))
           (btor1960
            (bv->signal
             (zero-extend (signal-value btor676) (bitvector 18))
             btor676))
           (btor1961
            (bv->signal
             (zero-extend (signal-value btor706) (bitvector 37))
             btor706))
           (btor1962
            (bv->signal
             (zero-extend (signal-value btor706) (bitvector 37))
             btor706))
           (btor1963
            (bv->signal
             (zero-extend (signal-value btor706) (bitvector 37))
             btor706))
           (btor1964
            (bv->signal
             (zero-extend (signal-value btor705) (bitvector 37))
             btor705))
           (btor1965
            (bv->signal
             (zero-extend (signal-value btor701) (bitvector 37))
             btor701))
           (btor1966
            (bv->signal
             (zero-extend (signal-value btor828) (bitvector 55))
             btor828))
           (btor1967
            (bv->signal
             (zero-extend (signal-value btor1423) (bitvector 54))
             btor1423))
           (btor1968
            (bv->signal
             (zero-extend (signal-value btor1425) (bitvector 54))
             btor1425))
           (btor1969
            (bv->signal
             (zero-extend (signal-value btor346) (bitvector 1))
             btor346))
           (btor1970
            (bv->signal
             (zero-extend (signal-value btor347) (bitvector 1))
             btor347))
           (btor1971
            (bv->signal
             (zero-extend (signal-value btor1929) (bitvector 1))
             btor1929))
           (btor1972
            (bv->signal
             (zero-extend (signal-value btor345) (bitvector 1))
             btor345))
           (btor1973
            (bv->signal
             (zero-extend (signal-value btor795) (bitvector 1))
             btor795))
           (btor1974
            (bv->signal
             (zero-extend (signal-value btor805) (bitvector 1))
             btor805))
           (btor1975
            (bv->signal
             (zero-extend (signal-value btor805) (bitvector 1))
             btor805))
           (btor1976
            (signal
             (bvand (signal-value btor610) (signal-value btor1657))
             (list)))
           (btor1977
            (bv->signal
             (zero-extend (signal-value btor1976) (bitvector 1))
             btor1976))
           (btor1978
            (bv->signal
             (zero-extend (signal-value btor805) (bitvector 1))
             btor805))
           (btor1979
            (bv->signal
             (zero-extend (signal-value btor804) (bitvector 1))
             btor804))
           (btor1980
            (bv->signal
             (zero-extend (signal-value btor800) (bitvector 1))
             btor800))
           (btor1982
            (if (bitvector->bool (signal-value btor1515)) btor479 btor377))
           (btor1983
            (if (bitvector->bool (signal-value btor1531)) btor350 btor1982))
           (btor1987
            (signal
             (bvxor (signal-value btor609) (signal-value btor1655))
             (list)))
           (btor1988
            (if (bitvector->bool (signal-value btor128)) btor1987 btor600))
           (btor1989
            (if (bitvector->bool (signal-value btor341)) btor592 btor1988))
           (btor1993
            (signal
             (bvxor (signal-value btor600) (signal-value btor1655))
             (list)))
           (btor1994
            (if (bitvector->bool (signal-value btor128)) btor1993 btor609))
           (btor1995
            (if (bitvector->bool (signal-value btor341)) btor592 btor1994))
           (btor1999
            (signal
             (bvxor (signal-value btor619) (signal-value btor1678))
             (list)))
           (btor2000
            (if (bitvector->bool (signal-value btor128)) btor1999 btor615))
           (btor2001
            (if (bitvector->bool (signal-value btor341)) btor592 btor2000))
           (btor2004
            (signal
             (bvxor (signal-value btor615) (signal-value btor1678))
             (list)))
           (btor2005
            (if (bitvector->bool (signal-value btor128)) btor2004 btor619))
           (btor2006
            (if (bitvector->bool (signal-value btor341)) btor592 btor2005))
           (btor2009
            (signal
             (bvxor (signal-value btor629) (signal-value btor1686))
             (list)))
           (btor2010
            (if (bitvector->bool (signal-value btor128)) btor2009 btor625))
           (btor2011
            (if (bitvector->bool (signal-value btor341)) btor592 btor2010))
           (btor2014
            (signal
             (bvxor (signal-value btor625) (signal-value btor1686))
             (list)))
           (btor2015
            (if (bitvector->bool (signal-value btor128)) btor2014 btor629))
           (btor2016
            (if (bitvector->bool (signal-value btor341)) btor592 btor2015))
           (btor2019
            (signal
             (bvxor (signal-value btor639) (signal-value btor1694))
             (list)))
           (btor2020
            (if (bitvector->bool (signal-value btor128)) btor2019 btor635))
           (btor2021
            (if (bitvector->bool (signal-value btor341)) btor592 btor2020))
           (btor2024
            (signal
             (bvxor (signal-value btor635) (signal-value btor1694))
             (list)))
           (btor2025
            (if (bitvector->bool (signal-value btor128)) btor2024 btor639))
           (btor2026
            (if (bitvector->bool (signal-value btor341)) btor592 btor2025))
           (btor2029
            (signal
             (bvxor (signal-value btor649) (signal-value btor1653))
             (list)))
           (btor2030
            (if (bitvector->bool (signal-value btor128)) btor2029 btor645))
           (btor2031
            (if (bitvector->bool (signal-value btor341)) btor592 btor2030))
           (btor2034
            (signal
             (bvxor (signal-value btor645) (signal-value btor1653))
             (list)))
           (btor2035
            (if (bitvector->bool (signal-value btor128)) btor2034 btor649))
           (btor2036
            (if (bitvector->bool (signal-value btor341)) btor592 btor2035))
           (btor2039
            (signal
             (bvxor (signal-value btor659) (signal-value btor1923))
             (list)))
           (btor2040
            (if (bitvector->bool (signal-value btor128)) btor2039 btor655))
           (btor2041
            (if (bitvector->bool (signal-value btor341)) btor592 btor2040))
           (btor2044
            (signal
             (bvxor (signal-value btor655) (signal-value btor1923))
             (list)))
           (btor2045
            (if (bitvector->bool (signal-value btor128)) btor2044 btor659))
           (btor2046
            (if (bitvector->bool (signal-value btor341)) btor592 btor2045))
           (btor2049
            (signal
             (bvxor (signal-value btor669) (signal-value btor1951))
             (list)))
           (btor2050
            (if (bitvector->bool (signal-value btor128)) btor2049 btor665))
           (btor2051
            (if (bitvector->bool (signal-value btor341)) btor592 btor2050))
           (btor2054
            (signal
             (bvxor (signal-value btor665) (signal-value btor1951))
             (list)))
           (btor2055
            (if (bitvector->bool (signal-value btor128)) btor2054 btor669))
           (btor2056
            (if (bitvector->bool (signal-value btor341)) btor592 btor2055))
           (btor2059
            (signal
             (extract 17 0 (signal-value btor1648))
             (signal-state btor1648)))
           (btor2060
            (if (bitvector->bool (signal-value btor128)) btor2059 btor676))
           (btor2061
            (if (bitvector->bool (signal-value btor341)) btor673 btor2060))
           (btor2064
            (signal
             (extract 54 18 (signal-value btor1648))
             (signal-state btor1648)))
           (btor2065
            (signal
             (bvxor (signal-value btor705) (signal-value btor2064))
             (list)))
           (btor2066
            (if (bitvector->bool (signal-value btor128)) btor2065 btor701))
           (btor2067
            (if (bitvector->bool (signal-value btor341)) btor698 btor2066))
           (btor2070
            (signal
             (bvxor (signal-value btor701) (signal-value btor2064))
             (list)))
           (btor2071
            (if (bitvector->bool (signal-value btor128)) btor2070 btor705))
           (btor2072
            (if (bitvector->bool (signal-value btor341)) btor698 btor2071))
           (btor2075
            (signal
             (bvxor (signal-value btor804) (signal-value btor1976))
             (list)))
           (btor2076
            (if (bitvector->bool (signal-value btor128)) btor2075 btor800))
           (btor2077
            (if (bitvector->bool (signal-value btor341)) btor592 btor2076))
           (btor2080
            (signal
             (bvxor (signal-value btor800) (signal-value btor1976))
             (list)))
           (btor2081
            (if (bitvector->bool (signal-value btor128)) btor2080 btor804))
           (btor2082
            (if (bitvector->bool (signal-value btor341)) btor592 btor2081))
           (btor2085
            (signal
             (bvxor (signal-value btor901) (signal-value btor1857))
             (list)))
           (btor2086
            (if (bitvector->bool (signal-value btor128)) btor2085 btor897))
           (btor2087
            (if (bitvector->bool (signal-value btor341)) btor592 btor2086))
           (btor2090
            (signal
             (bvxor (signal-value btor897) (signal-value btor1857))
             (list)))
           (btor2091
            (if (bitvector->bool (signal-value btor128)) btor2090 btor901))
           (btor2092
            (if (bitvector->bool (signal-value btor341)) btor592 btor2091))
           (btor2095
            (signal
             (bvxor (signal-value btor963) (signal-value btor1904))
             (list)))
           (btor2096
            (if (bitvector->bool (signal-value btor128)) btor2095 btor959))
           (btor2097
            (if (bitvector->bool (signal-value btor341)) btor885 btor2096))
           (btor2100
            (signal
             (bvxor (signal-value btor959) (signal-value btor1904))
             (list)))
           (btor2101
            (if (bitvector->bool (signal-value btor128)) btor2100 btor963))
           (btor2102
            (if (bitvector->bool (signal-value btor341)) btor885 btor2101))
           (btor2105
            (signal
             (concat (signal-value btor75) (signal-value btor74))
             (list)))
           (btor2106
            (signal
             (concat (signal-value btor86) (signal-value btor2105))
             (list)))
           (btor2107
            (signal
             (concat (signal-value btor97) (signal-value btor2106))
             (list)))
           (btor2108
            (signal
             (concat (signal-value btor108) (signal-value btor2107))
             (list)))
           (btor2109
            (signal
             (concat (signal-value btor119) (signal-value btor2108))
             (list)))
           (btor2110
            (signal
             (concat (signal-value btor124) (signal-value btor2109))
             (list)))
           (btor2111
            (signal
             (concat (signal-value btor125) (signal-value btor2110))
             (list)))
           (btor2112
            (signal
             (concat (signal-value btor126) (signal-value btor2111))
             (list)))
           (btor2113
            (signal
             (concat (signal-value btor127) (signal-value btor2112))
             (list)))
           (btor2114
            (signal
             (concat (signal-value btor76) (signal-value btor2113))
             (list)))
           (btor2115
            (signal
             (concat (signal-value btor77) (signal-value btor2114))
             (list)))
           (btor2116
            (signal
             (concat (signal-value btor78) (signal-value btor2115))
             (list)))
           (btor2117
            (signal
             (concat (signal-value btor79) (signal-value btor2116))
             (list)))
           (btor2118
            (signal
             (concat (signal-value btor80) (signal-value btor2117))
             (list)))
           (btor2119
            (signal
             (concat (signal-value btor81) (signal-value btor2118))
             (list)))
           (btor2120
            (signal
             (concat (signal-value btor82) (signal-value btor2119))
             (list)))
           (btor2121
            (signal
             (concat (signal-value btor83) (signal-value btor2120))
             (list)))
           (btor2122
            (signal
             (concat (signal-value btor84) (signal-value btor2121))
             (list)))
           (btor2123
            (signal
             (concat (signal-value btor85) (signal-value btor2122))
             (list)))
           (btor2124
            (signal
             (concat (signal-value btor87) (signal-value btor2123))
             (list)))
           (btor2125
            (signal
             (concat (signal-value btor88) (signal-value btor2124))
             (list)))
           (btor2126
            (signal
             (concat (signal-value btor89) (signal-value btor2125))
             (list)))
           (btor2127
            (signal
             (concat (signal-value btor90) (signal-value btor2126))
             (list)))
           (btor2128
            (signal
             (concat (signal-value btor91) (signal-value btor2127))
             (list)))
           (btor2129
            (signal
             (concat (signal-value btor92) (signal-value btor2128))
             (list)))
           (btor2130
            (signal
             (concat (signal-value btor93) (signal-value btor2129))
             (list)))
           (btor2131
            (if (bitvector->bool (signal-value btor128)) btor2130 btor973))
           (btor2132
            (if (bitvector->bool (signal-value btor341)) btor970 btor2131))
           (btor2135
            (signal
             (concat (signal-value btor95) (signal-value btor94))
             (list)))
           (btor2136
            (signal
             (concat (signal-value btor96) (signal-value btor2135))
             (list)))
           (btor2137
            (signal
             (concat (signal-value btor98) (signal-value btor2136))
             (list)))
           (btor2138
            (signal
             (concat (signal-value btor99) (signal-value btor2137))
             (list)))
           (btor2139
            (signal
             (concat (signal-value btor100) (signal-value btor2138))
             (list)))
           (btor2140
            (signal
             (concat (signal-value btor101) (signal-value btor2139))
             (list)))
           (btor2141
            (signal
             (concat (signal-value btor102) (signal-value btor2140))
             (list)))
           (btor2142
            (signal
             (concat (signal-value btor103) (signal-value btor2141))
             (list)))
           (btor2143
            (signal
             (concat (signal-value btor104) (signal-value btor2142))
             (list)))
           (btor2144
            (signal
             (concat (signal-value btor105) (signal-value btor2143))
             (list)))
           (btor2145
            (signal
             (concat (signal-value btor106) (signal-value btor2144))
             (list)))
           (btor2146
            (signal
             (concat (signal-value btor107) (signal-value btor2145))
             (list)))
           (btor2147
            (signal
             (concat (signal-value btor109) (signal-value btor2146))
             (list)))
           (btor2148
            (signal
             (concat (signal-value btor110) (signal-value btor2147))
             (list)))
           (btor2149
            (signal
             (concat (signal-value btor111) (signal-value btor2148))
             (list)))
           (btor2150
            (signal
             (concat (signal-value btor112) (signal-value btor2149))
             (list)))
           (btor2151
            (signal
             (concat (signal-value btor113) (signal-value btor2150))
             (list)))
           (btor2152
            (signal
             (concat (signal-value btor114) (signal-value btor2151))
             (list)))
           (btor2153
            (signal
             (concat (signal-value btor115) (signal-value btor2152))
             (list)))
           (btor2154
            (signal
             (concat (signal-value btor116) (signal-value btor2153))
             (list)))
           (btor2155
            (signal
             (concat (signal-value btor117) (signal-value btor2154))
             (list)))
           (btor2156
            (signal
             (concat (signal-value btor118) (signal-value btor2155))
             (list)))
           (btor2157
            (signal
             (concat (signal-value btor120) (signal-value btor2156))
             (list)))
           (btor2158
            (signal
             (concat (signal-value btor121) (signal-value btor2157))
             (list)))
           (btor2159
            (signal
             (concat (signal-value btor122) (signal-value btor2158))
             (list)))
           (btor2160
            (signal
             (concat (signal-value btor123) (signal-value btor2159))
             (list)))
           (btor2161
            (if (bitvector->bool (signal-value btor128)) btor2160 btor1213))
           (btor2162
            (if (bitvector->bool (signal-value btor341)) btor970 btor2161))
           (btor2165
            (signal
             (bvxor (signal-value btor1601) (signal-value btor1838))
             (list)))
           (btor2166
            (if (bitvector->bool (signal-value btor128)) btor2165 btor1597))
           (btor2167
            (if (bitvector->bool (signal-value btor341)) btor1594 btor2166))
           (btor2170
            (signal
             (bvxor (signal-value btor1597) (signal-value btor1838))
             (list)))
           (btor2171
            (if (bitvector->bool (signal-value btor128)) btor2170 btor1601))
           (btor2172
            (if (bitvector->bool (signal-value btor341)) btor1594 btor2171))
           (btor2175
            (signal
             (concat (signal-value btor336) (signal-value btor335))
             (list)))
           (btor2176
            (signal
             (concat (signal-value btor328) (signal-value btor2175))
             (list)))
           (btor2177
            (signal
             (bvxor (signal-value btor1837) (signal-value btor2176))
             (list)))
           (btor2178
            (if (bitvector->bool (signal-value btor128)) btor2177 btor1833))
           (btor2179
            (if (bitvector->bool (signal-value btor341)) btor1594 btor2178))
           (btor2182
            (signal
             (bvxor (signal-value btor1833) (signal-value btor2176))
             (list)))
           (btor2183
            (if (bitvector->bool (signal-value btor128)) btor2182 btor1837))
           (btor2184
            (if (bitvector->bool (signal-value btor341)) btor1594 btor2183))
           (btor2187
            (signal
             (bvxor (signal-value btor1856) (signal-value btor334))
             (list)))
           (btor2188
            (if (bitvector->bool (signal-value btor128)) btor2187 btor1852))
           (btor2189
            (if (bitvector->bool (signal-value btor341)) btor592 btor2188))
           (btor2192
            (signal
             (bvxor (signal-value btor1852) (signal-value btor334))
             (list)))
           (btor2193
            (if (bitvector->bool (signal-value btor128)) btor2192 btor1856))
           (btor2194
            (if (bitvector->bool (signal-value btor341)) btor592 btor2193))
           (btor2197
            (signal
             (concat (signal-value btor327) (signal-value btor326))
             (list)))
           (btor2198
            (signal
             (concat (signal-value btor329) (signal-value btor2197))
             (list)))
           (btor2199
            (signal
             (concat (signal-value btor330) (signal-value btor2198))
             (list)))
           (btor2200
            (signal
             (concat (signal-value btor331) (signal-value btor2199))
             (list)))
           (btor2201
            (signal
             (concat (signal-value btor332) (signal-value btor2200))
             (list)))
           (btor2202
            (signal
             (concat (signal-value btor333) (signal-value btor2201))
             (list)))
           (btor2203
            (signal
             (bvxor (signal-value btor1903) (signal-value btor2202))
             (list)))
           (btor2204
            (if (bitvector->bool (signal-value btor128)) btor2203 btor1899))
           (btor2205
            (if (bitvector->bool (signal-value btor341)) btor885 btor2204))
           (btor2208
            (signal
             (bvxor (signal-value btor1899) (signal-value btor2202))
             (list)))
           (btor2209
            (if (bitvector->bool (signal-value btor128)) btor2208 btor1903))
           (btor2210
            (if (bitvector->bool (signal-value btor341)) btor885 btor2209))
           (output-state
            (remove-duplicates
             (append
              (append
               (list
                (cons
                 (string->symbol (string-append name "state1901"))
                 (cons
                  (signal-value btor2210)
                  (if (assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1901")))
                    (add1
                     (cdr
                      (assoc-ref
                       merged-input-state-hash
                       (string->symbol (string-append name "state1901")))))
                    0))))
               (append
                (list
                 (cons
                  (string->symbol (string-append name "state1900"))
                  (cons
                   (signal-value btor1903)
                   (if (assoc-has-key?
                        merged-input-state-hash
                        (string->symbol (string-append name "state1900")))
                     (add1
                      (cdr
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1900")))))
                     0))))
                (append
                 (list
                  (cons
                   (string->symbol (string-append name "state1897"))
                   (cons
                    (signal-value btor2205)
                    (if (assoc-has-key?
                         merged-input-state-hash
                         (string->symbol (string-append name "state1897")))
                      (add1
                       (cdr
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1897")))))
                      0))))
                 (append
                  (list
                   (cons
                    (string->symbol (string-append name "state1896"))
                    (cons
                     (signal-value btor1899)
                     (if (assoc-has-key?
                          merged-input-state-hash
                          (string->symbol (string-append name "state1896")))
                       (add1
                        (cdr
                         (assoc-ref
                          merged-input-state-hash
                          (string->symbol (string-append name "state1896")))))
                       0))))
                  (append
                   (list
                    (cons
                     (string->symbol (string-append name "state1854"))
                     (cons
                      (signal-value btor2194)
                      (if (assoc-has-key?
                           merged-input-state-hash
                           (string->symbol (string-append name "state1854")))
                        (add1
                         (cdr
                          (assoc-ref
                           merged-input-state-hash
                           (string->symbol (string-append name "state1854")))))
                        0))))
                   (append
                    (list
                     (cons
                      (string->symbol (string-append name "state1853"))
                      (cons
                       (signal-value btor1856)
                       (if (assoc-has-key?
                            merged-input-state-hash
                            (string->symbol (string-append name "state1853")))
                         (add1
                          (cdr
                           (assoc-ref
                            merged-input-state-hash
                            (string->symbol
                             (string-append name "state1853")))))
                         0))))
                    (append
                     (list
                      (cons
                       (string->symbol (string-append name "state1850"))
                       (cons
                        (signal-value btor2189)
                        (if (assoc-has-key?
                             merged-input-state-hash
                             (string->symbol (string-append name "state1850")))
                          (add1
                           (cdr
                            (assoc-ref
                             merged-input-state-hash
                             (string->symbol
                              (string-append name "state1850")))))
                          0))))
                     (append
                      (list
                       (cons
                        (string->symbol (string-append name "state1849"))
                        (cons
                         (signal-value btor1852)
                         (if (assoc-has-key?
                              merged-input-state-hash
                              (string->symbol
                               (string-append name "state1849")))
                           (add1
                            (cdr
                             (assoc-ref
                              merged-input-state-hash
                              (string->symbol
                               (string-append name "state1849")))))
                           0))))
                      (append
                       (list
                        (cons
                         (string->symbol (string-append name "state1835"))
                         (cons
                          (signal-value btor2184)
                          (if (assoc-has-key?
                               merged-input-state-hash
                               (string->symbol
                                (string-append name "state1835")))
                            (add1
                             (cdr
                              (assoc-ref
                               merged-input-state-hash
                               (string->symbol
                                (string-append name "state1835")))))
                            0))))
                       (append
                        (list
                         (cons
                          (string->symbol (string-append name "state1834"))
                          (cons
                           (signal-value btor1837)
                           (if (assoc-has-key?
                                merged-input-state-hash
                                (string->symbol
                                 (string-append name "state1834")))
                             (add1
                              (cdr
                               (assoc-ref
                                merged-input-state-hash
                                (string->symbol
                                 (string-append name "state1834")))))
                             0))))
                        (append
                         (list
                          (cons
                           (string->symbol (string-append name "state1831"))
                           (cons
                            (signal-value btor2179)
                            (if (assoc-has-key?
                                 merged-input-state-hash
                                 (string->symbol
                                  (string-append name "state1831")))
                              (add1
                               (cdr
                                (assoc-ref
                                 merged-input-state-hash
                                 (string->symbol
                                  (string-append name "state1831")))))
                              0))))
                         (append
                          (list
                           (cons
                            (string->symbol (string-append name "state1830"))
                            (cons
                             (signal-value btor1833)
                             (if (assoc-has-key?
                                  merged-input-state-hash
                                  (string->symbol
                                   (string-append name "state1830")))
                               (add1
                                (cdr
                                 (assoc-ref
                                  merged-input-state-hash
                                  (string->symbol
                                   (string-append name "state1830")))))
                               0))))
                          (append
                           (list
                            (cons
                             (string->symbol (string-append name "state1599"))
                             (cons
                              (signal-value btor2172)
                              (if (assoc-has-key?
                                   merged-input-state-hash
                                   (string->symbol
                                    (string-append name "state1599")))
                                (add1
                                 (cdr
                                  (assoc-ref
                                   merged-input-state-hash
                                   (string->symbol
                                    (string-append name "state1599")))))
                                0))))
                           (append
                            (list
                             (cons
                              (string->symbol (string-append name "state1598"))
                              (cons
                               (signal-value btor1601)
                               (if (assoc-has-key?
                                    merged-input-state-hash
                                    (string->symbol
                                     (string-append name "state1598")))
                                 (add1
                                  (cdr
                                   (assoc-ref
                                    merged-input-state-hash
                                    (string->symbol
                                     (string-append name "state1598")))))
                                 0))))
                            (append
                             (list
                              (cons
                               (string->symbol
                                (string-append name "state1595"))
                               (cons
                                (signal-value btor2167)
                                (if (assoc-has-key?
                                     merged-input-state-hash
                                     (string->symbol
                                      (string-append name "state1595")))
                                  (add1
                                   (cdr
                                    (assoc-ref
                                     merged-input-state-hash
                                     (string->symbol
                                      (string-append name "state1595")))))
                                  0))))
                             (append
                              (list
                               (cons
                                (string->symbol
                                 (string-append name "state1593"))
                                (cons
                                 (signal-value btor1597)
                                 (if (assoc-has-key?
                                      merged-input-state-hash
                                      (string->symbol
                                       (string-append name "state1593")))
                                   (add1
                                    (cdr
                                     (assoc-ref
                                      merged-input-state-hash
                                      (string->symbol
                                       (string-append name "state1593")))))
                                   0))))
                              (append
                               (list
                                (cons
                                 (string->symbol
                                  (string-append name "state1211"))
                                 (cons
                                  (signal-value btor2162)
                                  (if (assoc-has-key?
                                       merged-input-state-hash
                                       (string->symbol
                                        (string-append name "state1211")))
                                    (add1
                                     (cdr
                                      (assoc-ref
                                       merged-input-state-hash
                                       (string->symbol
                                        (string-append name "state1211")))))
                                    0))))
                               (append
                                (list
                                 (cons
                                  (string->symbol
                                   (string-append name "state1210"))
                                  (cons
                                   (signal-value btor1213)
                                   (if (assoc-has-key?
                                        merged-input-state-hash
                                        (string->symbol
                                         (string-append name "state1210")))
                                     (add1
                                      (cdr
                                       (assoc-ref
                                        merged-input-state-hash
                                        (string->symbol
                                         (string-append name "state1210")))))
                                     0))))
                                (append
                                 (list
                                  (cons
                                   (string->symbol
                                    (string-append name "state971"))
                                   (cons
                                    (signal-value btor2132)
                                    (if (assoc-has-key?
                                         merged-input-state-hash
                                         (string->symbol
                                          (string-append name "state971")))
                                      (add1
                                       (cdr
                                        (assoc-ref
                                         merged-input-state-hash
                                         (string->symbol
                                          (string-append name "state971")))))
                                      0))))
                                 (append
                                  (list
                                   (cons
                                    (string->symbol
                                     (string-append name "state969"))
                                    (cons
                                     (signal-value btor973)
                                     (if (assoc-has-key?
                                          merged-input-state-hash
                                          (string->symbol
                                           (string-append name "state969")))
                                       (add1
                                        (cdr
                                         (assoc-ref
                                          merged-input-state-hash
                                          (string->symbol
                                           (string-append name "state969")))))
                                       0))))
                                  (append
                                   (list
                                    (cons
                                     (string->symbol
                                      (string-append name "state961"))
                                     (cons
                                      (signal-value btor2102)
                                      (if (assoc-has-key?
                                           merged-input-state-hash
                                           (string->symbol
                                            (string-append name "state961")))
                                        (add1
                                         (cdr
                                          (assoc-ref
                                           merged-input-state-hash
                                           (string->symbol
                                            (string-append name "state961")))))
                                        0))))
                                   (append
                                    (list
                                     (cons
                                      (string->symbol
                                       (string-append name "state960"))
                                      (cons
                                       (signal-value btor963)
                                       (if (assoc-has-key?
                                            merged-input-state-hash
                                            (string->symbol
                                             (string-append name "state960")))
                                         (add1
                                          (cdr
                                           (assoc-ref
                                            merged-input-state-hash
                                            (string->symbol
                                             (string-append
                                              name
                                              "state960")))))
                                         0))))
                                    (append
                                     (list
                                      (cons
                                       (string->symbol
                                        (string-append name "state957"))
                                       (cons
                                        (signal-value btor2097)
                                        (if (assoc-has-key?
                                             merged-input-state-hash
                                             (string->symbol
                                              (string-append name "state957")))
                                          (add1
                                           (cdr
                                            (assoc-ref
                                             merged-input-state-hash
                                             (string->symbol
                                              (string-append
                                               name
                                               "state957")))))
                                          0))))
                                     (append
                                      (list
                                       (cons
                                        (string->symbol
                                         (string-append name "state956"))
                                        (cons
                                         (signal-value btor959)
                                         (if (assoc-has-key?
                                              merged-input-state-hash
                                              (string->symbol
                                               (string-append
                                                name
                                                "state956")))
                                           (add1
                                            (cdr
                                             (assoc-ref
                                              merged-input-state-hash
                                              (string->symbol
                                               (string-append
                                                name
                                                "state956")))))
                                           0))))
                                      (append
                                       (list
                                        (cons
                                         (string->symbol
                                          (string-append name "state899"))
                                         (cons
                                          (signal-value btor2092)
                                          (if (assoc-has-key?
                                               merged-input-state-hash
                                               (string->symbol
                                                (string-append
                                                 name
                                                 "state899")))
                                            (add1
                                             (cdr
                                              (assoc-ref
                                               merged-input-state-hash
                                               (string->symbol
                                                (string-append
                                                 name
                                                 "state899")))))
                                            0))))
                                       (append
                                        (list
                                         (cons
                                          (string->symbol
                                           (string-append name "state898"))
                                          (cons
                                           (signal-value btor901)
                                           (if (assoc-has-key?
                                                merged-input-state-hash
                                                (string->symbol
                                                 (string-append
                                                  name
                                                  "state898")))
                                             (add1
                                              (cdr
                                               (assoc-ref
                                                merged-input-state-hash
                                                (string->symbol
                                                 (string-append
                                                  name
                                                  "state898")))))
                                             0))))
                                        (append
                                         (list
                                          (cons
                                           (string->symbol
                                            (string-append name "state895"))
                                           (cons
                                            (signal-value btor2087)
                                            (if (assoc-has-key?
                                                 merged-input-state-hash
                                                 (string->symbol
                                                  (string-append
                                                   name
                                                   "state895")))
                                              (add1
                                               (cdr
                                                (assoc-ref
                                                 merged-input-state-hash
                                                 (string->symbol
                                                  (string-append
                                                   name
                                                   "state895")))))
                                              0))))
                                         (append
                                          (list
                                           (cons
                                            (string->symbol
                                             (string-append name "state894"))
                                            (cons
                                             (signal-value btor897)
                                             (if (assoc-has-key?
                                                  merged-input-state-hash
                                                  (string->symbol
                                                   (string-append
                                                    name
                                                    "state894")))
                                               (add1
                                                (cdr
                                                 (assoc-ref
                                                  merged-input-state-hash
                                                  (string->symbol
                                                   (string-append
                                                    name
                                                    "state894")))))
                                               0))))
                                          (append
                                           (list
                                            (cons
                                             (string->symbol
                                              (string-append name "state802"))
                                             (cons
                                              (signal-value btor2082)
                                              (if (assoc-has-key?
                                                   merged-input-state-hash
                                                   (string->symbol
                                                    (string-append
                                                     name
                                                     "state802")))
                                                (add1
                                                 (cdr
                                                  (assoc-ref
                                                   merged-input-state-hash
                                                   (string->symbol
                                                    (string-append
                                                     name
                                                     "state802")))))
                                                0))))
                                           (append
                                            (list
                                             (cons
                                              (string->symbol
                                               (string-append name "state801"))
                                              (cons
                                               (signal-value btor804)
                                               (if (assoc-has-key?
                                                    merged-input-state-hash
                                                    (string->symbol
                                                     (string-append
                                                      name
                                                      "state801")))
                                                 (add1
                                                  (cdr
                                                   (assoc-ref
                                                    merged-input-state-hash
                                                    (string->symbol
                                                     (string-append
                                                      name
                                                      "state801")))))
                                                 0))))
                                            (append
                                             (list
                                              (cons
                                               (string->symbol
                                                (string-append
                                                 name
                                                 "state798"))
                                               (cons
                                                (signal-value btor2077)
                                                (if (assoc-has-key?
                                                     merged-input-state-hash
                                                     (string->symbol
                                                      (string-append
                                                       name
                                                       "state798")))
                                                  (add1
                                                   (cdr
                                                    (assoc-ref
                                                     merged-input-state-hash
                                                     (string->symbol
                                                      (string-append
                                                       name
                                                       "state798")))))
                                                  0))))
                                             (append
                                              (list
                                               (cons
                                                (string->symbol
                                                 (string-append
                                                  name
                                                  "state797"))
                                                (cons
                                                 (signal-value btor800)
                                                 (if (assoc-has-key?
                                                      merged-input-state-hash
                                                      (string->symbol
                                                       (string-append
                                                        name
                                                        "state797")))
                                                   (add1
                                                    (cdr
                                                     (assoc-ref
                                                      merged-input-state-hash
                                                      (string->symbol
                                                       (string-append
                                                        name
                                                        "state797")))))
                                                   0))))
                                              (append
                                               (list
                                                (cons
                                                 (string->symbol
                                                  (string-append
                                                   name
                                                   "state703"))
                                                 (cons
                                                  (signal-value btor2072)
                                                  (if (assoc-has-key?
                                                       merged-input-state-hash
                                                       (string->symbol
                                                        (string-append
                                                         name
                                                         "state703")))
                                                    (add1
                                                     (cdr
                                                      (assoc-ref
                                                       merged-input-state-hash
                                                       (string->symbol
                                                        (string-append
                                                         name
                                                         "state703")))))
                                                    0))))
                                               (append
                                                (list
                                                 (cons
                                                  (string->symbol
                                                   (string-append
                                                    name
                                                    "state702"))
                                                  (cons
                                                   (signal-value btor705)
                                                   (if (assoc-has-key?
                                                        merged-input-state-hash
                                                        (string->symbol
                                                         (string-append
                                                          name
                                                          "state702")))
                                                     (add1
                                                      (cdr
                                                       (assoc-ref
                                                        merged-input-state-hash
                                                        (string->symbol
                                                         (string-append
                                                          name
                                                          "state702")))))
                                                     0))))
                                                (append
                                                 (list
                                                  (cons
                                                   (string->symbol
                                                    (string-append
                                                     name
                                                     "state699"))
                                                   (cons
                                                    (signal-value btor2067)
                                                    (if (assoc-has-key?
                                                         merged-input-state-hash
                                                         (string->symbol
                                                          (string-append
                                                           name
                                                           "state699")))
                                                      (add1
                                                       (cdr
                                                        (assoc-ref
                                                         merged-input-state-hash
                                                         (string->symbol
                                                          (string-append
                                                           name
                                                           "state699")))))
                                                      0))))
                                                 (append
                                                  (list
                                                   (cons
                                                    (string->symbol
                                                     (string-append
                                                      name
                                                      "state697"))
                                                    (cons
                                                     (signal-value btor701)
                                                     (if (assoc-has-key?
                                                          merged-input-state-hash
                                                          (string->symbol
                                                           (string-append
                                                            name
                                                            "state697")))
                                                       (add1
                                                        (cdr
                                                         (assoc-ref
                                                          merged-input-state-hash
                                                          (string->symbol
                                                           (string-append
                                                            name
                                                            "state697")))))
                                                       0))))
                                                  (append
                                                   (list
                                                    (cons
                                                     (string->symbol
                                                      (string-append
                                                       name
                                                       "state674"))
                                                     (cons
                                                      (signal-value btor2061)
                                                      (if (assoc-has-key?
                                                           merged-input-state-hash
                                                           (string->symbol
                                                            (string-append
                                                             name
                                                             "state674")))
                                                        (add1
                                                         (cdr
                                                          (assoc-ref
                                                           merged-input-state-hash
                                                           (string->symbol
                                                            (string-append
                                                             name
                                                             "state674")))))
                                                        0))))
                                                   (append
                                                    (list
                                                     (cons
                                                      (string->symbol
                                                       (string-append
                                                        name
                                                        "state672"))
                                                      (cons
                                                       (signal-value btor676)
                                                       (if (assoc-has-key?
                                                            merged-input-state-hash
                                                            (string->symbol
                                                             (string-append
                                                              name
                                                              "state672")))
                                                         (add1
                                                          (cdr
                                                           (assoc-ref
                                                            merged-input-state-hash
                                                            (string->symbol
                                                             (string-append
                                                              name
                                                              "state672")))))
                                                         0))))
                                                    (append
                                                     (list
                                                      (cons
                                                       (string->symbol
                                                        (string-append
                                                         name
                                                         "state667"))
                                                       (cons
                                                        (signal-value btor2056)
                                                        (if (assoc-has-key?
                                                             merged-input-state-hash
                                                             (string->symbol
                                                              (string-append
                                                               name
                                                               "state667")))
                                                          (add1
                                                           (cdr
                                                            (assoc-ref
                                                             merged-input-state-hash
                                                             (string->symbol
                                                              (string-append
                                                               name
                                                               "state667")))))
                                                          0))))
                                                     (append
                                                      (list
                                                       (cons
                                                        (string->symbol
                                                         (string-append
                                                          name
                                                          "state666"))
                                                        (cons
                                                         (signal-value btor669)
                                                         (if (assoc-has-key?
                                                              merged-input-state-hash
                                                              (string->symbol
                                                               (string-append
                                                                name
                                                                "state666")))
                                                           (add1
                                                            (cdr
                                                             (assoc-ref
                                                              merged-input-state-hash
                                                              (string->symbol
                                                               (string-append
                                                                name
                                                                "state666")))))
                                                           0))))
                                                      (append
                                                       (list
                                                        (cons
                                                         (string->symbol
                                                          (string-append
                                                           name
                                                           "state663"))
                                                         (cons
                                                          (signal-value
                                                           btor2051)
                                                          (if (assoc-has-key?
                                                               merged-input-state-hash
                                                               (string->symbol
                                                                (string-append
                                                                 name
                                                                 "state663")))
                                                            (add1
                                                             (cdr
                                                              (assoc-ref
                                                               merged-input-state-hash
                                                               (string->symbol
                                                                (string-append
                                                                 name
                                                                 "state663")))))
                                                            0))))
                                                       (append
                                                        (list
                                                         (cons
                                                          (string->symbol
                                                           (string-append
                                                            name
                                                            "state662"))
                                                          (cons
                                                           (signal-value
                                                            btor665)
                                                           (if (assoc-has-key?
                                                                merged-input-state-hash
                                                                (string->symbol
                                                                 (string-append
                                                                  name
                                                                  "state662")))
                                                             (add1
                                                              (cdr
                                                               (assoc-ref
                                                                merged-input-state-hash
                                                                (string->symbol
                                                                 (string-append
                                                                  name
                                                                  "state662")))))
                                                             0))))
                                                        (append
                                                         (list
                                                          (cons
                                                           (string->symbol
                                                            (string-append
                                                             name
                                                             "state657"))
                                                           (cons
                                                            (signal-value
                                                             btor2046)
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
                                                              "state656"))
                                                            (cons
                                                             (signal-value
                                                              btor659)
                                                             (if (assoc-has-key?
                                                                  merged-input-state-hash
                                                                  (string->symbol
                                                                   (string-append
                                                                    name
                                                                    "state656")))
                                                               (add1
                                                                (cdr
                                                                 (assoc-ref
                                                                  merged-input-state-hash
                                                                  (string->symbol
                                                                   (string-append
                                                                    name
                                                                    "state656")))))
                                                               0))))
                                                          (append
                                                           (list
                                                            (cons
                                                             (string->symbol
                                                              (string-append
                                                               name
                                                               "state653"))
                                                             (cons
                                                              (signal-value
                                                               btor2041)
                                                              (if (assoc-has-key?
                                                                   merged-input-state-hash
                                                                   (string->symbol
                                                                    (string-append
                                                                     name
                                                                     "state653")))
                                                                (add1
                                                                 (cdr
                                                                  (assoc-ref
                                                                   merged-input-state-hash
                                                                   (string->symbol
                                                                    (string-append
                                                                     name
                                                                     "state653")))))
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
                                                                btor655)
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
                                                                 "state647"))
                                                               (cons
                                                                (signal-value
                                                                 btor2036)
                                                                (if (assoc-has-key?
                                                                     merged-input-state-hash
                                                                     (string->symbol
                                                                      (string-append
                                                                       name
                                                                       "state647")))
                                                                  (add1
                                                                   (cdr
                                                                    (assoc-ref
                                                                     merged-input-state-hash
                                                                     (string->symbol
                                                                      (string-append
                                                                       name
                                                                       "state647")))))
                                                                  0))))
                                                             (append
                                                              (list
                                                               (cons
                                                                (string->symbol
                                                                 (string-append
                                                                  name
                                                                  "state646"))
                                                                (cons
                                                                 (signal-value
                                                                  btor649)
                                                                 (if (assoc-has-key?
                                                                      merged-input-state-hash
                                                                      (string->symbol
                                                                       (string-append
                                                                        name
                                                                        "state646")))
                                                                   (add1
                                                                    (cdr
                                                                     (assoc-ref
                                                                      merged-input-state-hash
                                                                      (string->symbol
                                                                       (string-append
                                                                        name
                                                                        "state646")))))
                                                                   0))))
                                                              (append
                                                               (list
                                                                (cons
                                                                 (string->symbol
                                                                  (string-append
                                                                   name
                                                                   "state643"))
                                                                 (cons
                                                                  (signal-value
                                                                   btor2031)
                                                                  (if (assoc-has-key?
                                                                       merged-input-state-hash
                                                                       (string->symbol
                                                                        (string-append
                                                                         name
                                                                         "state643")))
                                                                    (add1
                                                                     (cdr
                                                                      (assoc-ref
                                                                       merged-input-state-hash
                                                                       (string->symbol
                                                                        (string-append
                                                                         name
                                                                         "state643")))))
                                                                    0))))
                                                               (append
                                                                (list
                                                                 (cons
                                                                  (string->symbol
                                                                   (string-append
                                                                    name
                                                                    "state642"))
                                                                  (cons
                                                                   (signal-value
                                                                    btor645)
                                                                   (if (assoc-has-key?
                                                                        merged-input-state-hash
                                                                        (string->symbol
                                                                         (string-append
                                                                          name
                                                                          "state642")))
                                                                     (add1
                                                                      (cdr
                                                                       (assoc-ref
                                                                        merged-input-state-hash
                                                                        (string->symbol
                                                                         (string-append
                                                                          name
                                                                          "state642")))))
                                                                     0))))
                                                                (append
                                                                 (list
                                                                  (cons
                                                                   (string->symbol
                                                                    (string-append
                                                                     name
                                                                     "state637"))
                                                                   (cons
                                                                    (signal-value
                                                                     btor2026)
                                                                    (if (assoc-has-key?
                                                                         merged-input-state-hash
                                                                         (string->symbol
                                                                          (string-append
                                                                           name
                                                                           "state637")))
                                                                      (add1
                                                                       (cdr
                                                                        (assoc-ref
                                                                         merged-input-state-hash
                                                                         (string->symbol
                                                                          (string-append
                                                                           name
                                                                           "state637")))))
                                                                      0))))
                                                                 (append
                                                                  (list
                                                                   (cons
                                                                    (string->symbol
                                                                     (string-append
                                                                      name
                                                                      "state636"))
                                                                    (cons
                                                                     (signal-value
                                                                      btor639)
                                                                     (if (assoc-has-key?
                                                                          merged-input-state-hash
                                                                          (string->symbol
                                                                           (string-append
                                                                            name
                                                                            "state636")))
                                                                       (add1
                                                                        (cdr
                                                                         (assoc-ref
                                                                          merged-input-state-hash
                                                                          (string->symbol
                                                                           (string-append
                                                                            name
                                                                            "state636")))))
                                                                       0))))
                                                                  (append
                                                                   (list
                                                                    (cons
                                                                     (string->symbol
                                                                      (string-append
                                                                       name
                                                                       "state633"))
                                                                     (cons
                                                                      (signal-value
                                                                       btor2021)
                                                                      (if (assoc-has-key?
                                                                           merged-input-state-hash
                                                                           (string->symbol
                                                                            (string-append
                                                                             name
                                                                             "state633")))
                                                                        (add1
                                                                         (cdr
                                                                          (assoc-ref
                                                                           merged-input-state-hash
                                                                           (string->symbol
                                                                            (string-append
                                                                             name
                                                                             "state633")))))
                                                                        0))))
                                                                   (append
                                                                    (list
                                                                     (cons
                                                                      (string->symbol
                                                                       (string-append
                                                                        name
                                                                        "state632"))
                                                                      (cons
                                                                       (signal-value
                                                                        btor635)
                                                                       (if (assoc-has-key?
                                                                            merged-input-state-hash
                                                                            (string->symbol
                                                                             (string-append
                                                                              name
                                                                              "state632")))
                                                                         (add1
                                                                          (cdr
                                                                           (assoc-ref
                                                                            merged-input-state-hash
                                                                            (string->symbol
                                                                             (string-append
                                                                              name
                                                                              "state632")))))
                                                                         0))))
                                                                    (append
                                                                     (list
                                                                      (cons
                                                                       (string->symbol
                                                                        (string-append
                                                                         name
                                                                         "state627"))
                                                                       (cons
                                                                        (signal-value
                                                                         btor2016)
                                                                        (if (assoc-has-key?
                                                                             merged-input-state-hash
                                                                             (string->symbol
                                                                              (string-append
                                                                               name
                                                                               "state627")))
                                                                          (add1
                                                                           (cdr
                                                                            (assoc-ref
                                                                             merged-input-state-hash
                                                                             (string->symbol
                                                                              (string-append
                                                                               name
                                                                               "state627")))))
                                                                          0))))
                                                                     (append
                                                                      (list
                                                                       (cons
                                                                        (string->symbol
                                                                         (string-append
                                                                          name
                                                                          "state626"))
                                                                        (cons
                                                                         (signal-value
                                                                          btor629)
                                                                         (if (assoc-has-key?
                                                                              merged-input-state-hash
                                                                              (string->symbol
                                                                               (string-append
                                                                                name
                                                                                "state626")))
                                                                           (add1
                                                                            (cdr
                                                                             (assoc-ref
                                                                              merged-input-state-hash
                                                                              (string->symbol
                                                                               (string-append
                                                                                name
                                                                                "state626")))))
                                                                           0))))
                                                                      (append
                                                                       (list
                                                                        (cons
                                                                         (string->symbol
                                                                          (string-append
                                                                           name
                                                                           "state623"))
                                                                         (cons
                                                                          (signal-value
                                                                           btor2011)
                                                                          (if (assoc-has-key?
                                                                               merged-input-state-hash
                                                                               (string->symbol
                                                                                (string-append
                                                                                 name
                                                                                 "state623")))
                                                                            (add1
                                                                             (cdr
                                                                              (assoc-ref
                                                                               merged-input-state-hash
                                                                               (string->symbol
                                                                                (string-append
                                                                                 name
                                                                                 "state623")))))
                                                                            0))))
                                                                       (append
                                                                        (list
                                                                         (cons
                                                                          (string->symbol
                                                                           (string-append
                                                                            name
                                                                            "state622"))
                                                                          (cons
                                                                           (signal-value
                                                                            btor625)
                                                                           (if (assoc-has-key?
                                                                                merged-input-state-hash
                                                                                (string->symbol
                                                                                 (string-append
                                                                                  name
                                                                                  "state622")))
                                                                             (add1
                                                                              (cdr
                                                                               (assoc-ref
                                                                                merged-input-state-hash
                                                                                (string->symbol
                                                                                 (string-append
                                                                                  name
                                                                                  "state622")))))
                                                                             0))))
                                                                        (append
                                                                         (list
                                                                          (cons
                                                                           (string->symbol
                                                                            (string-append
                                                                             name
                                                                             "state617"))
                                                                           (cons
                                                                            (signal-value
                                                                             btor2006)
                                                                            (if (assoc-has-key?
                                                                                 merged-input-state-hash
                                                                                 (string->symbol
                                                                                  (string-append
                                                                                   name
                                                                                   "state617")))
                                                                              (add1
                                                                               (cdr
                                                                                (assoc-ref
                                                                                 merged-input-state-hash
                                                                                 (string->symbol
                                                                                  (string-append
                                                                                   name
                                                                                   "state617")))))
                                                                              0))))
                                                                         (append
                                                                          (list
                                                                           (cons
                                                                            (string->symbol
                                                                             (string-append
                                                                              name
                                                                              "state616"))
                                                                            (cons
                                                                             (signal-value
                                                                              btor619)
                                                                             (if (assoc-has-key?
                                                                                  merged-input-state-hash
                                                                                  (string->symbol
                                                                                   (string-append
                                                                                    name
                                                                                    "state616")))
                                                                               (add1
                                                                                (cdr
                                                                                 (assoc-ref
                                                                                  merged-input-state-hash
                                                                                  (string->symbol
                                                                                   (string-append
                                                                                    name
                                                                                    "state616")))))
                                                                               0))))
                                                                          (append
                                                                           (list
                                                                            (cons
                                                                             (string->symbol
                                                                              (string-append
                                                                               name
                                                                               "state613"))
                                                                             (cons
                                                                              (signal-value
                                                                               btor2001)
                                                                              (if (assoc-has-key?
                                                                                   merged-input-state-hash
                                                                                   (string->symbol
                                                                                    (string-append
                                                                                     name
                                                                                     "state613")))
                                                                                (add1
                                                                                 (cdr
                                                                                  (assoc-ref
                                                                                   merged-input-state-hash
                                                                                   (string->symbol
                                                                                    (string-append
                                                                                     name
                                                                                     "state613")))))
                                                                                0))))
                                                                           (append
                                                                            (list
                                                                             (cons
                                                                              (string->symbol
                                                                               (string-append
                                                                                name
                                                                                "state612"))
                                                                              (cons
                                                                               (signal-value
                                                                                btor615)
                                                                               (if (assoc-has-key?
                                                                                    merged-input-state-hash
                                                                                    (string->symbol
                                                                                     (string-append
                                                                                      name
                                                                                      "state612")))
                                                                                 (add1
                                                                                  (cdr
                                                                                   (assoc-ref
                                                                                    merged-input-state-hash
                                                                                    (string->symbol
                                                                                     (string-append
                                                                                      name
                                                                                      "state612")))))
                                                                                 0))))
                                                                            (append
                                                                             (list
                                                                              (cons
                                                                               (string->symbol
                                                                                (string-append
                                                                                 name
                                                                                 "state604"))
                                                                               (cons
                                                                                (signal-value
                                                                                 btor240)
                                                                                (if (assoc-has-key?
                                                                                     merged-input-state-hash
                                                                                     (string->symbol
                                                                                      (string-append
                                                                                       name
                                                                                       "state604")))
                                                                                  (add1
                                                                                   (cdr
                                                                                    (assoc-ref
                                                                                     merged-input-state-hash
                                                                                     (string->symbol
                                                                                      (string-append
                                                                                       name
                                                                                       "state604")))))
                                                                                  0))))
                                                                             (append
                                                                              (list
                                                                               (cons
                                                                                (string->symbol
                                                                                 (string-append
                                                                                  name
                                                                                  "state602"))
                                                                                (cons
                                                                                 (signal-value
                                                                                  btor1995)
                                                                                 (if (assoc-has-key?
                                                                                      merged-input-state-hash
                                                                                      (string->symbol
                                                                                       (string-append
                                                                                        name
                                                                                        "state602")))
                                                                                   (add1
                                                                                    (cdr
                                                                                     (assoc-ref
                                                                                      merged-input-state-hash
                                                                                      (string->symbol
                                                                                       (string-append
                                                                                        name
                                                                                        "state602")))))
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
                                                                                   btor609)
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
                                                                                    "state595"))
                                                                                  (cons
                                                                                   (signal-value
                                                                                    btor240)
                                                                                   (if (assoc-has-key?
                                                                                        merged-input-state-hash
                                                                                        (string->symbol
                                                                                         (string-append
                                                                                          name
                                                                                          "state595")))
                                                                                     (add1
                                                                                      (cdr
                                                                                       (assoc-ref
                                                                                        merged-input-state-hash
                                                                                        (string->symbol
                                                                                         (string-append
                                                                                          name
                                                                                          "state595")))))
                                                                                     0))))
                                                                                (append
                                                                                 (list
                                                                                  (cons
                                                                                   (string->symbol
                                                                                    (string-append
                                                                                     name
                                                                                     "state593"))
                                                                                   (cons
                                                                                    (signal-value
                                                                                     btor1989)
                                                                                    (if (assoc-has-key?
                                                                                         merged-input-state-hash
                                                                                         (string->symbol
                                                                                          (string-append
                                                                                           name
                                                                                           "state593")))
                                                                                      (add1
                                                                                       (cdr
                                                                                        (assoc-ref
                                                                                         merged-input-state-hash
                                                                                         (string->symbol
                                                                                          (string-append
                                                                                           name
                                                                                           "state593")))))
                                                                                      0))))
                                                                                 (append
                                                                                  (list
                                                                                   (cons
                                                                                    (string->symbol
                                                                                     (string-append
                                                                                      name
                                                                                      "state591"))
                                                                                    (cons
                                                                                     (signal-value
                                                                                      btor600)
                                                                                     (if (assoc-has-key?
                                                                                          merged-input-state-hash
                                                                                          (string->symbol
                                                                                           (string-append
                                                                                            name
                                                                                            "state591")))
                                                                                       (add1
                                                                                        (cdr
                                                                                         (assoc-ref
                                                                                          merged-input-state-hash
                                                                                          (string->symbol
                                                                                           (string-append
                                                                                            name
                                                                                            "state591")))))
                                                                                       0))))
                                                                                  (append
                                                                                   (list
                                                                                    (cons
                                                                                     (string->symbol
                                                                                      (string-append
                                                                                       name
                                                                                       "state371"))
                                                                                     (cons
                                                                                      (signal-value
                                                                                       btor369)
                                                                                      (if (assoc-has-key?
                                                                                           merged-input-state-hash
                                                                                           (string->symbol
                                                                                            (string-append
                                                                                             name
                                                                                             "state371")))
                                                                                        (add1
                                                                                         (cdr
                                                                                          (assoc-ref
                                                                                           merged-input-state-hash
                                                                                           (string->symbol
                                                                                            (string-append
                                                                                             name
                                                                                             "state371")))))
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
                                                                                        btor1983)
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
                                                                                         btor377)
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
                                                                                     (list))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
              merged-input-state-hash)
             equal?
             #:key
             car)))
      (list
       (cons 'R28 (signal (signal-value btor729) output-state))
       (cons 'EQPATB (signal (signal-value btor630) output-state))
       (cons 'CO53 (signal (signal-value btor581) output-state))
       (cons 'CO11 (signal (signal-value btor489) output-state))
       (cons 'CO17 (signal (signal-value btor501) output-state))
       (cons 'CO9 (signal (signal-value btor589) output-state))
       (cons 'R48 (signal (signal-value btor773) output-state))
       (cons 'CO45 (signal (signal-value btor563) output-state))
       (cons 'CO30 (signal (signal-value btor531) output-state))
       (cons 'R10 (signal (signal-value btor681) output-state))
       (cons 'CO28 (signal (signal-value btor525) output-state))
       (cons 'R1 (signal (signal-value btor679) output-state))
       (cons 'R47 (signal (signal-value btor771) output-state))
       (cons 'R51 (signal (signal-value btor781) output-state))
       (cons 'R34 (signal (signal-value btor743) output-state))
       (cons 'R27 (signal (signal-value btor727) output-state))
       (cons 'R17 (signal (signal-value btor695) output-state))
       (cons 'R49 (signal (signal-value btor775) output-state))
       (cons 'CO16 (signal (signal-value btor499) output-state))
       (cons 'CO44 (signal (signal-value btor561) output-state))
       (cons 'EQZM (signal (signal-value btor650) output-state))
       (cons 'R29 (signal (signal-value btor731) output-state))
       (cons 'CO52 (signal (signal-value btor579) output-state))
       (cons 'CO8 (signal (signal-value btor587) output-state))
       (cons 'R46 (signal (signal-value btor769) output-state))
       (cons 'CO10 (signal (signal-value btor487) output-state))
       (cons 'R50 (signal (signal-value btor779) output-state))
       (cons 'R26 (signal (signal-value btor725) output-state))
       (cons 'CO29 (signal (signal-value btor527) output-state))
       (cons 'R35 (signal (signal-value btor745) output-state))
       (cons 'R16 (signal (signal-value btor693) output-state))
       (cons 'CO31 (signal (signal-value btor533) output-state))
       (cons 'R11 (signal (signal-value btor683) output-state))
       (cons 'R0 (signal (signal-value btor677) output-state))
       (cons 'R3 (signal (signal-value btor733) output-state))
       (cons 'R9 (signal (signal-value btor793) output-state))
       (cons 'R36 (signal (signal-value btor747) output-state))
       (cons 'R25 (signal (signal-value btor723) output-state))
       (cons 'R12 (signal (signal-value btor685) output-state))
       (cons 'CO32 (signal (signal-value btor535) output-state))
       (cons 'R15 (signal (signal-value btor691) output-state))
       (cons 'CO13 (signal (signal-value btor493) output-state))
       (cons 'OVERUNDER (signal (signal-value btor670) output-state))
       (cons 'R45 (signal (signal-value btor767) output-state))
       (cons 'R53 (signal (signal-value btor785) output-state))
       (cons 'CO51 (signal (signal-value btor577) output-state))
       (cons 'EQPAT (signal (signal-value btor620) output-state))
       (cons 'CO15 (signal (signal-value btor497) output-state))
       (cons 'R37 (signal (signal-value btor749) output-state))
       (cons 'R13 (signal (signal-value btor687) output-state))
       (cons 'CO33 (signal (signal-value btor537) output-state))
       (cons 'R2 (signal (signal-value btor711) output-state))
       (cons 'R8 (signal (signal-value btor791) output-state))
       (cons 'CO14 (signal (signal-value btor495) output-state))
       (cons 'CO46 (signal (signal-value btor565) output-state))
       (cons 'EQOM (signal (signal-value btor610) output-state))
       (cons 'R44 (signal (signal-value btor765) output-state))
       (cons 'R14 (signal (signal-value btor689) output-state))
       (cons 'CO12 (signal (signal-value btor491) output-state))
       (cons 'R52 (signal (signal-value btor783) output-state))
       (cons 'CO50 (signal (signal-value btor575) output-state))
       (cons 'R24 (signal (signal-value btor721) output-state))
       (cons 'R42 (signal (signal-value btor761) output-state))
       (cons 'CO40 (signal (signal-value btor553) output-state))
       (cons 'CO49 (signal (signal-value btor571) output-state))
       (cons 'R33 (signal (signal-value btor741) output-state))
       (cons 'R22 (signal (signal-value btor717) output-state))
       (cons 'CO3 (signal (signal-value btor529) output-state))
       (cons 'R39 (signal (signal-value btor753) output-state))
       (cons 'CO35 (signal (signal-value btor541) output-state))
       (cons 'CO4 (signal (signal-value btor551) output-state))
       (cons 'R4 (signal (signal-value btor755) output-state))
       (cons 'UNDER (signal (signal-value btor805) output-state))
       (cons 'CO25 (signal (signal-value btor519) output-state))
       (cons 'CO21 (signal (signal-value btor511) output-state))
       (cons 'R43 (signal (signal-value btor763) output-state))
       (cons 'R32 (signal (signal-value btor739) output-state))
       (cons 'R38 (signal (signal-value btor751) output-state))
       (cons 'R23 (signal (signal-value btor719) output-state))
       (cons 'CO2 (signal (signal-value btor507) output-state))
       (cons 'CO5 (signal (signal-value btor573) output-state))
       (cons 'CO41 (signal (signal-value btor555) output-state))
       (cons 'CO48 (signal (signal-value btor569) output-state))
       (cons 'CO34 (signal (signal-value btor539) output-state))
       (cons 'CO20 (signal (signal-value btor509) output-state))
       (cons 'CO47 (signal (signal-value btor567) output-state))
       (cons 'R5 (signal (signal-value btor777) output-state))
       (cons 'R6 (signal (signal-value btor787) output-state))
       (cons 'R18 (signal (signal-value btor707) output-state))
       (cons 'CO27 (signal (signal-value btor523) output-state))
       (cons 'CO23 (signal (signal-value btor515) output-state))
       (cons 'CO39 (signal (signal-value btor549) output-state))
       (cons 'CO24 (signal (signal-value btor517) output-state))
       (cons 'R40 (signal (signal-value btor757) output-state))
       (cons 'CO36 (signal (signal-value btor543) output-state))
       (cons 'OVER (signal (signal-value btor660) output-state))
       (cons 'R20 (signal (signal-value btor713) output-state))
       (cons 'SIGNEDR (signal (signal-value btor795) output-state))
       (cons 'CO18 (signal (signal-value btor503) output-state))
       (cons 'CO42 (signal (signal-value btor557) output-state))
       (cons 'R31 (signal (signal-value btor737) output-state))
       (cons 'CO1 (signal (signal-value btor485) output-state))
       (cons 'CO6 (signal (signal-value btor583) output-state))
       (cons 'CO38 (signal (signal-value btor547) output-state))
       (cons 'CO26 (signal (signal-value btor521) output-state))
       (cons 'CO22 (signal (signal-value btor513) output-state))
       (cons 'R7 (signal (signal-value btor789) output-state))
       (cons 'R19 (signal (signal-value btor709) output-state))
       (cons 'EQZ (signal (signal-value btor640) output-state))
       (cons 'R21 (signal (signal-value btor715) output-state))
       (cons 'CO7 (signal (signal-value btor585) output-state))
       (cons 'R30 (signal (signal-value btor735) output-state))
       (cons 'CO19 (signal (signal-value btor505) output-state))
       (cons 'CO0 (signal (signal-value btor483) output-state))
       (cons 'CO43 (signal (signal-value btor559) output-state))
       (cons 'R41 (signal (signal-value btor759) output-state))
       (cons 'CO37 (signal (signal-value btor545) output-state))))))
