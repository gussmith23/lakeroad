;;; Generated from
;;; https://github.com/uwsampl/lakeroad-private/blob/c997532dbca31ff4b6fce2af04b3ada3abb1bf0c/lattice_ecp5/modified_ALU54B.v
;;; via
;;;
;;; $LAKEROAD_DIR/bin/verilog_to_racket.py \  
;;;   --infile /Users/gus/lakeroad-private/lattice_ecp5/modified_ALU54B.v \
;;;   --top ALU54B \
;;;   --function-name lattice-ecp5-alu54b > ~/lakeroad/racket/generated/lattice-ecp5-alu54b.rkt
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
               (string->symbol (string-append name "state599"))
               (bv 0 (bitvector 1))))
             (append
              (list
               (cons
                (string->symbol (string-append name "state591"))
                (bv 1 (bitvector 1))))
              (append
               (list
                (cons
                 (string->symbol (string-append name "state352"))
                 (bv 1 (bitvector 1))))
               (list)))))
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
                          (bv 0 54))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor351 (bv->signal (bv 1 (bitvector 1))))
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
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor354 (bitvector 4))
           (btor355 (bv->signal (bv 14 (bitvector 4))))
           (btor356
            (bv->signal
             (zero-extend (signal-value btor355) (bitvector 5))
             btor355))
           (btor357
            (signal
             (bool->bitvector
              (bveq (signal-value btor338) (signal-value btor356)))
             (list)))
           (btor358
            (if (bitvector->bool (signal-value btor357)) btor243 btor240))
           (btor359 (bv->signal (bv 13 (bitvector 4))))
           (btor360
            (bv->signal
             (zero-extend (signal-value btor359) (bitvector 5))
             btor359))
           (btor361
            (signal
             (bool->bitvector
              (bveq (signal-value btor338) (signal-value btor360)))
             (list)))
           (btor362
            (if (bitvector->bool (signal-value btor361)) btor242 btor358))
           (btor363 (bv->signal (bv 12 (bitvector 4))))
           (btor364
            (bv->signal
             (zero-extend (signal-value btor363) (bitvector 5))
             btor363))
           (btor365
            (signal
             (bool->bitvector
              (bveq (signal-value btor338) (signal-value btor364)))
             (list)))
           (btor366
            (if (bitvector->bool (signal-value btor365)) btor241 btor362))
           (btor367 (bv->signal (bv 11 (bitvector 4))))
           (btor368
            (bv->signal
             (zero-extend (signal-value btor367) (bitvector 5))
             btor367))
           (btor369
            (signal
             (bool->bitvector
              (bveq (signal-value btor338) (signal-value btor368)))
             (list)))
           (btor370
            (if (bitvector->bool (signal-value btor369)) btor240 btor366))
           (btor371 (bitvector 2))
           (btor372
            (signal
             (concat (signal-value btor370) (signal-value btor352))
             (list)))
           (btor373 (bv->signal (bv 2 (bitvector 2))))
           (btor374
            (signal
             (bool->bitvector
              (bveq (signal-value btor372) (signal-value btor373)))
             (list)))
           (btor375
            (if (bitvector->bool (signal-value btor374)) btor350 btor349))
           (btor376
            (signal
             (concat (signal-value btor133) (signal-value btor132))
             (list)))
           (btor377 (bitvector 3))
           (btor378
            (signal
             (concat (signal-value btor144) (signal-value btor376))
             (list)))
           (btor379
            (signal
             (concat (signal-value btor155) (signal-value btor378))
             (list)))
           (btor380
            (signal
             (concat (signal-value btor166) (signal-value btor379))
             (list)))
           (btor381 (bitvector 6))
           (btor382
            (signal
             (concat (signal-value btor177) (signal-value btor380))
             (list)))
           (btor383 (bitvector 7))
           (btor384
            (signal
             (concat (signal-value btor182) (signal-value btor382))
             (list)))
           (btor385 (bitvector 8))
           (btor386
            (signal
             (concat (signal-value btor183) (signal-value btor384))
             (list)))
           (btor387 (bitvector 9))
           (btor388
            (signal
             (concat (signal-value btor184) (signal-value btor386))
             (list)))
           (btor389 (bitvector 10))
           (btor390
            (signal
             (concat (signal-value btor185) (signal-value btor388))
             (list)))
           (btor391 (bitvector 11))
           (btor392
            (signal
             (concat (signal-value btor134) (signal-value btor390))
             (list)))
           (btor393 (bitvector 12))
           (btor394
            (signal
             (concat (signal-value btor135) (signal-value btor392))
             (list)))
           (btor395 (bitvector 13))
           (btor396
            (signal
             (concat (signal-value btor136) (signal-value btor394))
             (list)))
           (btor397 (bitvector 14))
           (btor398
            (signal
             (concat (signal-value btor137) (signal-value btor396))
             (list)))
           (btor399 (bitvector 15))
           (btor400
            (signal
             (concat (signal-value btor138) (signal-value btor398))
             (list)))
           (btor401 (bitvector 16))
           (btor402
            (signal
             (concat (signal-value btor139) (signal-value btor400))
             (list)))
           (btor403 (bitvector 17))
           (btor404
            (signal
             (concat (signal-value btor140) (signal-value btor402))
             (list)))
           (btor405 (bitvector 18))
           (btor406
            (signal
             (concat (signal-value btor141) (signal-value btor404))
             (list)))
           (btor407 (bitvector 19))
           (btor408
            (signal
             (concat (signal-value btor142) (signal-value btor406))
             (list)))
           (btor409 (bitvector 20))
           (btor410
            (signal
             (concat (signal-value btor143) (signal-value btor408))
             (list)))
           (btor411 (bitvector 21))
           (btor412
            (signal
             (concat (signal-value btor145) (signal-value btor410))
             (list)))
           (btor413 (bitvector 22))
           (btor414
            (signal
             (concat (signal-value btor146) (signal-value btor412))
             (list)))
           (btor415 (bitvector 23))
           (btor416
            (signal
             (concat (signal-value btor147) (signal-value btor414))
             (list)))
           (btor417 (bitvector 24))
           (btor418
            (signal
             (concat (signal-value btor148) (signal-value btor416))
             (list)))
           (btor419 (bitvector 25))
           (btor420
            (signal
             (concat (signal-value btor149) (signal-value btor418))
             (list)))
           (btor421 (bitvector 26))
           (btor422
            (signal
             (concat (signal-value btor150) (signal-value btor420))
             (list)))
           (btor423 (bitvector 27))
           (btor424
            (signal
             (concat (signal-value btor151) (signal-value btor422))
             (list)))
           (btor425 (bitvector 28))
           (btor426
            (signal
             (concat (signal-value btor152) (signal-value btor424))
             (list)))
           (btor427 (bitvector 29))
           (btor428
            (signal
             (concat (signal-value btor153) (signal-value btor426))
             (list)))
           (btor429 (bitvector 30))
           (btor430
            (signal
             (concat (signal-value btor154) (signal-value btor428))
             (list)))
           (btor431 (bitvector 31))
           (btor432
            (signal
             (concat (signal-value btor156) (signal-value btor430))
             (list)))
           (btor433 (bitvector 32))
           (btor434
            (signal
             (concat (signal-value btor157) (signal-value btor432))
             (list)))
           (btor435 (bitvector 33))
           (btor436
            (signal
             (concat (signal-value btor158) (signal-value btor434))
             (list)))
           (btor437 (bitvector 34))
           (btor438
            (signal
             (concat (signal-value btor159) (signal-value btor436))
             (list)))
           (btor439 (bitvector 35))
           (btor440
            (signal
             (concat (signal-value btor160) (signal-value btor438))
             (list)))
           (btor441 (bitvector 36))
           (btor442
            (signal
             (concat (signal-value btor161) (signal-value btor440))
             (list)))
           (btor443 (bitvector 37))
           (btor444
            (signal
             (concat (signal-value btor162) (signal-value btor442))
             (list)))
           (btor445 (bitvector 38))
           (btor446
            (signal
             (concat (signal-value btor163) (signal-value btor444))
             (list)))
           (btor447 (bitvector 39))
           (btor448
            (signal
             (concat (signal-value btor164) (signal-value btor446))
             (list)))
           (btor449 (bitvector 40))
           (btor450
            (signal
             (concat (signal-value btor165) (signal-value btor448))
             (list)))
           (btor451 (bitvector 41))
           (btor452
            (signal
             (concat (signal-value btor167) (signal-value btor450))
             (list)))
           (btor453 (bitvector 42))
           (btor454
            (signal
             (concat (signal-value btor168) (signal-value btor452))
             (list)))
           (btor455 (bitvector 43))
           (btor456
            (signal
             (concat (signal-value btor169) (signal-value btor454))
             (list)))
           (btor457 (bitvector 44))
           (btor458
            (signal
             (concat (signal-value btor170) (signal-value btor456))
             (list)))
           (btor459 (bitvector 45))
           (btor460
            (signal
             (concat (signal-value btor171) (signal-value btor458))
             (list)))
           (btor461 (bitvector 46))
           (btor462
            (signal
             (concat (signal-value btor172) (signal-value btor460))
             (list)))
           (btor463 (bitvector 47))
           (btor464
            (signal
             (concat (signal-value btor173) (signal-value btor462))
             (list)))
           (btor465 (bitvector 48))
           (btor466
            (signal
             (concat (signal-value btor174) (signal-value btor464))
             (list)))
           (btor467 (bitvector 49))
           (btor468
            (signal
             (concat (signal-value btor175) (signal-value btor466))
             (list)))
           (btor469 (bitvector 50))
           (btor470
            (signal
             (concat (signal-value btor176) (signal-value btor468))
             (list)))
           (btor471 (bitvector 51))
           (btor472
            (signal
             (concat (signal-value btor178) (signal-value btor470))
             (list)))
           (btor473 (bitvector 52))
           (btor474
            (signal
             (concat (signal-value btor179) (signal-value btor472))
             (list)))
           (btor475 (bitvector 53))
           (btor476
            (signal
             (concat (signal-value btor180) (signal-value btor474))
             (list)))
           (btor477
            (signal
             (concat (signal-value btor181) (signal-value btor476))
             (list)))
           (btor478
            (signal
             (apply bvor (bitvector->bits (signal-value btor338)))
             (signal-state btor338)))
           (btor479 (signal (bvnot (signal-value btor478)) (list)))
           (btor480
            (if (bitvector->bool (signal-value btor479)) btor477 btor375))
           (btor481
            (signal
             (extract 0 0 (signal-value btor480))
             (signal-state btor480)))
           (btor483
            (signal
             (extract 1 1 (signal-value btor480))
             (signal-state btor480)))
           (btor485
            (signal
             (extract 10 10 (signal-value btor480))
             (signal-state btor480)))
           (btor487
            (signal
             (extract 11 11 (signal-value btor480))
             (signal-state btor480)))
           (btor489
            (signal
             (extract 12 12 (signal-value btor480))
             (signal-state btor480)))
           (btor491
            (signal
             (extract 13 13 (signal-value btor480))
             (signal-state btor480)))
           (btor493
            (signal
             (extract 14 14 (signal-value btor480))
             (signal-state btor480)))
           (btor495
            (signal
             (extract 15 15 (signal-value btor480))
             (signal-state btor480)))
           (btor497
            (signal
             (extract 16 16 (signal-value btor480))
             (signal-state btor480)))
           (btor499
            (signal
             (extract 17 17 (signal-value btor480))
             (signal-state btor480)))
           (btor501
            (signal
             (extract 18 18 (signal-value btor480))
             (signal-state btor480)))
           (btor503
            (signal
             (extract 19 19 (signal-value btor480))
             (signal-state btor480)))
           (btor505
            (signal
             (extract 2 2 (signal-value btor480))
             (signal-state btor480)))
           (btor507
            (signal
             (extract 20 20 (signal-value btor480))
             (signal-state btor480)))
           (btor509
            (signal
             (extract 21 21 (signal-value btor480))
             (signal-state btor480)))
           (btor511
            (signal
             (extract 22 22 (signal-value btor480))
             (signal-state btor480)))
           (btor513
            (signal
             (extract 23 23 (signal-value btor480))
             (signal-state btor480)))
           (btor515
            (signal
             (extract 24 24 (signal-value btor480))
             (signal-state btor480)))
           (btor517
            (signal
             (extract 25 25 (signal-value btor480))
             (signal-state btor480)))
           (btor519
            (signal
             (extract 26 26 (signal-value btor480))
             (signal-state btor480)))
           (btor521
            (signal
             (extract 27 27 (signal-value btor480))
             (signal-state btor480)))
           (btor523
            (signal
             (extract 28 28 (signal-value btor480))
             (signal-state btor480)))
           (btor525
            (signal
             (extract 29 29 (signal-value btor480))
             (signal-state btor480)))
           (btor527
            (signal
             (extract 3 3 (signal-value btor480))
             (signal-state btor480)))
           (btor529
            (signal
             (extract 30 30 (signal-value btor480))
             (signal-state btor480)))
           (btor531
            (signal
             (extract 31 31 (signal-value btor480))
             (signal-state btor480)))
           (btor533
            (signal
             (extract 32 32 (signal-value btor480))
             (signal-state btor480)))
           (btor535
            (signal
             (extract 33 33 (signal-value btor480))
             (signal-state btor480)))
           (btor537
            (signal
             (extract 34 34 (signal-value btor480))
             (signal-state btor480)))
           (btor539
            (signal
             (extract 35 35 (signal-value btor480))
             (signal-state btor480)))
           (btor541
            (signal
             (extract 36 36 (signal-value btor480))
             (signal-state btor480)))
           (btor543
            (signal
             (extract 37 37 (signal-value btor480))
             (signal-state btor480)))
           (btor545
            (signal
             (extract 38 38 (signal-value btor480))
             (signal-state btor480)))
           (btor547
            (signal
             (extract 39 39 (signal-value btor480))
             (signal-state btor480)))
           (btor549
            (signal
             (extract 4 4 (signal-value btor480))
             (signal-state btor480)))
           (btor551
            (signal
             (extract 40 40 (signal-value btor480))
             (signal-state btor480)))
           (btor553
            (signal
             (extract 41 41 (signal-value btor480))
             (signal-state btor480)))
           (btor555
            (signal
             (extract 42 42 (signal-value btor480))
             (signal-state btor480)))
           (btor557
            (signal
             (extract 43 43 (signal-value btor480))
             (signal-state btor480)))
           (btor559
            (signal
             (extract 44 44 (signal-value btor480))
             (signal-state btor480)))
           (btor561
            (signal
             (extract 45 45 (signal-value btor480))
             (signal-state btor480)))
           (btor563
            (signal
             (extract 46 46 (signal-value btor480))
             (signal-state btor480)))
           (btor565
            (signal
             (extract 47 47 (signal-value btor480))
             (signal-state btor480)))
           (btor567
            (signal
             (extract 48 48 (signal-value btor480))
             (signal-state btor480)))
           (btor569
            (signal
             (extract 49 49 (signal-value btor480))
             (signal-state btor480)))
           (btor571
            (signal
             (extract 5 5 (signal-value btor480))
             (signal-state btor480)))
           (btor573
            (signal
             (extract 50 50 (signal-value btor480))
             (signal-state btor480)))
           (btor575
            (signal
             (extract 51 51 (signal-value btor480))
             (signal-state btor480)))
           (btor577
            (signal
             (extract 52 52 (signal-value btor480))
             (signal-state btor480)))
           (btor579
            (signal
             (extract 53 53 (signal-value btor480))
             (signal-state btor480)))
           (btor581
            (signal
             (extract 6 6 (signal-value btor480))
             (signal-state btor480)))
           (btor583
            (signal
             (extract 7 7 (signal-value btor480))
             (signal-state btor480)))
           (btor585
            (signal
             (extract 8 8 (signal-value btor480))
             (signal-state btor480)))
           (btor587
            (signal
             (extract 9 9 (signal-value btor480))
             (signal-state btor480)))
           (btor589
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state589")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state589"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state589")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state589")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor590
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state590")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state590"))))))
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
           (btor593
            (signal
             (concat (signal-value btor240) (signal-value btor591))
             (list)))
           (btor594
            (signal
             (bool->bitvector
              (bveq (signal-value btor593) (signal-value btor373)))
             (list)))
           (btor595
            (if (bitvector->bool (signal-value btor594)) btor590 btor589))
           (btor596
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state596")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state596"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state596")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state596")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor597
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state597")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state597"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state597")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state597")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor598 (bv->signal (bv 0 (bitvector 1))))
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
            (signal
             (concat (signal-value btor240) (signal-value btor599))
             (list)))
           (btor602
            (bv->signal
             (zero-extend (signal-value btor351) (bitvector 2))
             btor351))
           (btor603
            (signal
             (bool->bitvector
              (bveq (signal-value btor601) (signal-value btor602)))
             (list)))
           (btor604
            (if (bitvector->bool (signal-value btor603)) btor597 btor596))
           (btor605
            (signal
             (bvxor (signal-value btor595) (signal-value btor604))
             (list)))
           (btor607
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state607")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state607"))))))
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
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor608
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state608")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state608"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state608")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state608")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor609
            (if (bitvector->bool (signal-value btor594)) btor608 btor607))
           (btor610
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state610")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state610"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state610")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state610")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor611
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state611")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state611"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state611")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state611")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor612
            (if (bitvector->bool (signal-value btor603)) btor611 btor610))
           (btor613
            (signal
             (bvxor (signal-value btor609) (signal-value btor612))
             (list)))
           (btor615
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state615")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state615"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state615")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state615")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
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
            (if (bitvector->bool (signal-value btor594)) btor616 btor615))
           (btor618
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state618")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state618"))))))
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
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state619")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state619"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state619")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state619")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor620
            (if (bitvector->bool (signal-value btor603)) btor619 btor618))
           (btor621
            (signal
             (bvxor (signal-value btor617) (signal-value btor620))
             (list)))
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
           (btor624
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state624")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state624"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state624")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state624")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor625
            (if (bitvector->bool (signal-value btor594)) btor624 btor623))
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
           (btor628
            (if (bitvector->bool (signal-value btor603)) btor627 btor626))
           (btor629
            (signal
             (bvxor (signal-value btor625) (signal-value btor628))
             (list)))
           (btor631
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state631")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state631"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state631")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state631")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
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
            (if (bitvector->bool (signal-value btor594)) btor632 btor631))
           (btor634
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state634")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state634"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state634")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state634")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
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
           (btor636
            (if (bitvector->bool (signal-value btor603)) btor635 btor634))
           (btor637
            (signal
             (bvxor (signal-value btor633) (signal-value btor636))
             (list)))
           (btor639
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state639")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state639"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state639")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state639")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor640
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state640")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state640"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state640")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state640")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor641
            (if (bitvector->bool (signal-value btor594)) btor640 btor639))
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
           (btor644
            (if (bitvector->bool (signal-value btor603)) btor643 btor642))
           (btor645
            (signal
             (bvxor (signal-value btor641) (signal-value btor644))
             (list)))
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
           (btor648
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state648")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state648"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state648")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state648")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor649
            (if (bitvector->bool (signal-value btor594)) btor648 btor647))
           (btor650
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state650")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state650"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state650")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state650")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
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
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor652
            (if (bitvector->bool (signal-value btor603)) btor651 btor650))
           (btor653
            (signal
             (bvxor (signal-value btor649) (signal-value btor652))
             (list)))
           (btor655
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state655")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state655"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state655")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state655")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
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
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor657
            (if (bitvector->bool (signal-value btor594)) btor656 btor655))
           (btor658
            (signal
             (extract 0 0 (signal-value btor657))
             (signal-state btor657)))
           (btor660
            (signal
             (extract 1 1 (signal-value btor657))
             (signal-state btor657)))
           (btor662
            (signal
             (extract 10 10 (signal-value btor657))
             (signal-state btor657)))
           (btor664
            (signal
             (extract 11 11 (signal-value btor657))
             (signal-state btor657)))
           (btor666
            (signal
             (extract 12 12 (signal-value btor657))
             (signal-state btor657)))
           (btor668
            (signal
             (extract 13 13 (signal-value btor657))
             (signal-state btor657)))
           (btor670
            (signal
             (extract 14 14 (signal-value btor657))
             (signal-state btor657)))
           (btor672
            (signal
             (extract 15 15 (signal-value btor657))
             (signal-state btor657)))
           (btor674
            (signal
             (extract 16 16 (signal-value btor657))
             (signal-state btor657)))
           (btor676
            (signal
             (extract 17 17 (signal-value btor657))
             (signal-state btor657)))
           (btor678
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state678")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state678"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state678")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state678")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 37))))))))
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
                          (bv 0 37))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor680
            (if (bitvector->bool (signal-value btor594)) btor679 btor678))
           (btor681
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state681")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state681"))))))
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
                          (bv 0 37))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor682
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state682")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state682"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state682")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state682")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 37))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor683
            (if (bitvector->bool (signal-value btor603)) btor682 btor681))
           (btor684
            (signal
             (bvxor (signal-value btor680) (signal-value btor683))
             (list)))
           (btor685
            (signal
             (extract 0 0 (signal-value btor684))
             (signal-state btor684)))
           (btor687
            (signal
             (extract 1 1 (signal-value btor684))
             (signal-state btor684)))
           (btor689
            (signal
             (extract 2 2 (signal-value btor657))
             (signal-state btor657)))
           (btor691
            (signal
             (extract 2 2 (signal-value btor684))
             (signal-state btor684)))
           (btor693
            (signal
             (extract 3 3 (signal-value btor684))
             (signal-state btor684)))
           (btor695
            (signal
             (extract 4 4 (signal-value btor684))
             (signal-state btor684)))
           (btor697
            (signal
             (extract 5 5 (signal-value btor684))
             (signal-state btor684)))
           (btor699
            (signal
             (extract 6 6 (signal-value btor684))
             (signal-state btor684)))
           (btor701
            (signal
             (extract 7 7 (signal-value btor684))
             (signal-state btor684)))
           (btor703
            (signal
             (extract 8 8 (signal-value btor684))
             (signal-state btor684)))
           (btor705
            (signal
             (extract 9 9 (signal-value btor684))
             (signal-state btor684)))
           (btor707
            (signal
             (extract 10 10 (signal-value btor684))
             (signal-state btor684)))
           (btor709
            (signal
             (extract 11 11 (signal-value btor684))
             (signal-state btor684)))
           (btor711
            (signal
             (extract 3 3 (signal-value btor657))
             (signal-state btor657)))
           (btor713
            (signal
             (extract 12 12 (signal-value btor684))
             (signal-state btor684)))
           (btor715
            (signal
             (extract 13 13 (signal-value btor684))
             (signal-state btor684)))
           (btor717
            (signal
             (extract 14 14 (signal-value btor684))
             (signal-state btor684)))
           (btor719
            (signal
             (extract 15 15 (signal-value btor684))
             (signal-state btor684)))
           (btor721
            (signal
             (extract 16 16 (signal-value btor684))
             (signal-state btor684)))
           (btor723
            (signal
             (extract 17 17 (signal-value btor684))
             (signal-state btor684)))
           (btor725
            (signal
             (extract 18 18 (signal-value btor684))
             (signal-state btor684)))
           (btor727
            (signal
             (extract 19 19 (signal-value btor684))
             (signal-state btor684)))
           (btor729
            (signal
             (extract 20 20 (signal-value btor684))
             (signal-state btor684)))
           (btor731
            (signal
             (extract 21 21 (signal-value btor684))
             (signal-state btor684)))
           (btor733
            (signal
             (extract 4 4 (signal-value btor657))
             (signal-state btor657)))
           (btor735
            (signal
             (extract 22 22 (signal-value btor684))
             (signal-state btor684)))
           (btor737
            (signal
             (extract 23 23 (signal-value btor684))
             (signal-state btor684)))
           (btor739
            (signal
             (extract 24 24 (signal-value btor684))
             (signal-state btor684)))
           (btor741
            (signal
             (extract 25 25 (signal-value btor684))
             (signal-state btor684)))
           (btor743
            (signal
             (extract 26 26 (signal-value btor684))
             (signal-state btor684)))
           (btor745
            (signal
             (extract 27 27 (signal-value btor684))
             (signal-state btor684)))
           (btor747
            (signal
             (extract 28 28 (signal-value btor684))
             (signal-state btor684)))
           (btor749
            (signal
             (extract 29 29 (signal-value btor684))
             (signal-state btor684)))
           (btor751
            (signal
             (extract 30 30 (signal-value btor684))
             (signal-state btor684)))
           (btor753
            (signal
             (extract 31 31 (signal-value btor684))
             (signal-state btor684)))
           (btor755
            (signal
             (extract 5 5 (signal-value btor657))
             (signal-state btor657)))
           (btor757
            (signal
             (extract 32 32 (signal-value btor684))
             (signal-state btor684)))
           (btor759
            (signal
             (extract 33 33 (signal-value btor684))
             (signal-state btor684)))
           (btor761
            (signal
             (extract 34 34 (signal-value btor684))
             (signal-state btor684)))
           (btor763
            (signal
             (extract 35 35 (signal-value btor684))
             (signal-state btor684)))
           (btor765
            (signal
             (extract 6 6 (signal-value btor657))
             (signal-state btor657)))
           (btor767
            (signal
             (extract 7 7 (signal-value btor657))
             (signal-state btor657)))
           (btor769
            (signal
             (extract 8 8 (signal-value btor657))
             (signal-state btor657)))
           (btor771
            (signal
             (extract 9 9 (signal-value btor657))
             (signal-state btor657)))
           (btor773
            (signal
             (bvor (signal-value btor346) (signal-value btor347))
             (list)))
           (btor775
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state775")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state775"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state775")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state775")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor776
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state776")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state776"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state776")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state776")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor777
            (if (bitvector->bool (signal-value btor594)) btor776 btor775))
           (btor778
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state778")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state778"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state778")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state778")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor779
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state779")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state779"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state779")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state779")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor780
            (if (bitvector->bool (signal-value btor603)) btor779 btor778))
           (btor781
            (signal
             (bvxor (signal-value btor777) (signal-value btor780))
             (list)))
           (btor783
            (bv->signal
             (zero-extend (signal-value btor128) (bitvector 1))
             btor128))
           (btor784
            (bv->signal
             (zero-extend (signal-value btor129) (bitvector 1))
             btor129))
           (btor785
            (bv->signal
             (zero-extend (signal-value btor130) (bitvector 1))
             btor130))
           (btor786
            (bv->signal
             (zero-extend (signal-value btor131) (bitvector 1))
             btor131))
           (btor787
            (bv->signal
             (zero-extend (signal-value btor598) (bitvector 1))
             btor598))
           (btor788
            (bv->signal
             (zero-extend (signal-value btor240) (bitvector 1))
             btor240))
           (btor789
            (bv->signal
             (zero-extend (signal-value btor240) (bitvector 1))
             btor240))
           (btor790
            (bv->signal
             (zero-extend (signal-value btor598) (bitvector 1))
             btor598))
           (btor791
            (bv->signal
             (zero-extend (signal-value btor241) (bitvector 1))
             btor241))
           (btor792
            (bv->signal
             (zero-extend (signal-value btor241) (bitvector 1))
             btor241))
           (btor793
            (bv->signal
             (zero-extend (signal-value btor598) (bitvector 1))
             btor598))
           (btor794
            (bv->signal
             (zero-extend (signal-value btor242) (bitvector 1))
             btor242))
           (btor795
            (bv->signal
             (zero-extend (signal-value btor242) (bitvector 1))
             btor242))
           (btor796
            (bv->signal
             (zero-extend (signal-value btor598) (bitvector 1))
             btor598))
           (btor797
            (bv->signal
             (zero-extend (signal-value btor243) (bitvector 1))
             btor243))
           (btor798
            (bv->signal
             (zero-extend (signal-value btor243) (bitvector 1))
             btor243))
           (btor799
            (bv->signal
             (zero-extend (signal-value btor341) (bitvector 1))
             btor341))
           (btor800
            (bv->signal
             (zero-extend (signal-value btor342) (bitvector 1))
             btor342))
           (btor801
            (bv->signal
             (zero-extend (signal-value btor343) (bitvector 1))
             btor343))
           (btor802
            (bv->signal
             (zero-extend (signal-value btor344) (bitvector 1))
             btor344))
           (btor803 (bitvector 55))
           (btor804
            (signal
             (concat (signal-value btor684) (signal-value btor657))
             (list)))
           (btor805 (bv->signal (bv 0 (bitvector 19))))
           (btor806
            (signal
             (concat (signal-value btor276) (signal-value btor276))
             (list)))
           (btor807
            (signal
             (concat (signal-value btor276) (signal-value btor806))
             (list)))
           (btor808
            (signal
             (concat (signal-value btor276) (signal-value btor807))
             (list)))
           (btor809
            (signal
             (concat (signal-value btor276) (signal-value btor808))
             (list)))
           (btor810
            (signal
             (concat (signal-value btor276) (signal-value btor809))
             (list)))
           (btor811
            (signal
             (concat (signal-value btor276) (signal-value btor810))
             (list)))
           (btor812
            (signal
             (concat (signal-value btor276) (signal-value btor811))
             (list)))
           (btor813
            (signal
             (concat (signal-value btor276) (signal-value btor812))
             (list)))
           (btor814
            (signal
             (concat (signal-value btor276) (signal-value btor813))
             (list)))
           (btor815
            (signal
             (concat (signal-value btor276) (signal-value btor814))
             (list)))
           (btor816
            (signal
             (concat (signal-value btor276) (signal-value btor815))
             (list)))
           (btor817
            (signal
             (concat (signal-value btor276) (signal-value btor816))
             (list)))
           (btor818
            (signal
             (concat (signal-value btor276) (signal-value btor817))
             (list)))
           (btor819
            (signal
             (concat (signal-value btor276) (signal-value btor818))
             (list)))
           (btor820
            (signal
             (concat (signal-value btor276) (signal-value btor819))
             (list)))
           (btor821
            (signal
             (concat (signal-value btor276) (signal-value btor820))
             (list)))
           (btor822
            (signal
             (concat (signal-value btor276) (signal-value btor821))
             (list)))
           (btor823
            (signal
             (concat (signal-value btor276) (signal-value btor822))
             (list)))
           (btor824
            (if (bitvector->bool (signal-value btor346)) btor823 btor805))
           (btor825
            (signal
             (concat (signal-value btor248) (signal-value btor247))
             (list)))
           (btor826
            (signal
             (concat (signal-value btor259) (signal-value btor825))
             (list)))
           (btor827
            (signal
             (concat (signal-value btor270) (signal-value btor826))
             (list)))
           (btor828
            (signal
             (concat (signal-value btor277) (signal-value btor827))
             (list)))
           (btor829
            (signal
             (concat (signal-value btor278) (signal-value btor828))
             (list)))
           (btor830
            (signal
             (concat (signal-value btor279) (signal-value btor829))
             (list)))
           (btor831
            (signal
             (concat (signal-value btor280) (signal-value btor830))
             (list)))
           (btor832
            (signal
             (concat (signal-value btor281) (signal-value btor831))
             (list)))
           (btor833
            (signal
             (concat (signal-value btor282) (signal-value btor832))
             (list)))
           (btor834
            (signal
             (concat (signal-value btor249) (signal-value btor833))
             (list)))
           (btor835
            (signal
             (concat (signal-value btor250) (signal-value btor834))
             (list)))
           (btor836
            (signal
             (concat (signal-value btor251) (signal-value btor835))
             (list)))
           (btor837
            (signal
             (concat (signal-value btor252) (signal-value btor836))
             (list)))
           (btor838
            (signal
             (concat (signal-value btor253) (signal-value btor837))
             (list)))
           (btor839
            (signal
             (concat (signal-value btor254) (signal-value btor838))
             (list)))
           (btor840
            (signal
             (concat (signal-value btor255) (signal-value btor839))
             (list)))
           (btor841
            (signal
             (concat (signal-value btor256) (signal-value btor840))
             (list)))
           (btor842
            (signal
             (concat (signal-value btor257) (signal-value btor841))
             (list)))
           (btor843
            (signal
             (concat (signal-value btor258) (signal-value btor842))
             (list)))
           (btor844
            (signal
             (concat (signal-value btor260) (signal-value btor843))
             (list)))
           (btor845
            (signal
             (concat (signal-value btor261) (signal-value btor844))
             (list)))
           (btor846
            (signal
             (concat (signal-value btor262) (signal-value btor845))
             (list)))
           (btor847
            (signal
             (concat (signal-value btor263) (signal-value btor846))
             (list)))
           (btor848
            (signal
             (concat (signal-value btor264) (signal-value btor847))
             (list)))
           (btor849
            (signal
             (concat (signal-value btor265) (signal-value btor848))
             (list)))
           (btor850
            (signal
             (concat (signal-value btor266) (signal-value btor849))
             (list)))
           (btor851
            (signal
             (concat (signal-value btor267) (signal-value btor850))
             (list)))
           (btor852
            (signal
             (concat (signal-value btor268) (signal-value btor851))
             (list)))
           (btor853
            (signal
             (concat (signal-value btor269) (signal-value btor852))
             (list)))
           (btor854
            (signal
             (concat (signal-value btor271) (signal-value btor853))
             (list)))
           (btor855
            (signal
             (concat (signal-value btor272) (signal-value btor854))
             (list)))
           (btor856
            (signal
             (concat (signal-value btor273) (signal-value btor855))
             (list)))
           (btor857
            (signal
             (concat (signal-value btor274) (signal-value btor856))
             (list)))
           (btor858
            (signal
             (concat (signal-value btor275) (signal-value btor857))
             (list)))
           (btor859
            (signal
             (concat (signal-value btor276) (signal-value btor858))
             (list)))
           (btor860
            (signal
             (concat (signal-value btor824) (signal-value btor859))
             (list)))
           (btor861 (bv->signal (bv 0 (bitvector 7))))
           (btor862
            (signal
             (concat (signal-value btor256) (signal-value btor256))
             (list)))
           (btor863
            (signal
             (concat (signal-value btor256) (signal-value btor862))
             (list)))
           (btor864
            (signal
             (concat (signal-value btor256) (signal-value btor863))
             (list)))
           (btor865
            (signal
             (concat (signal-value btor256) (signal-value btor864))
             (list)))
           (btor866
            (signal
             (concat (signal-value btor256) (signal-value btor865))
             (list)))
           (btor867
            (signal
             (concat (signal-value btor256) (signal-value btor866))
             (list)))
           (btor868
            (if (bitvector->bool (signal-value btor346)) btor867 btor861))
           (btor869 (bv->signal (bv 0 (bitvector 2))))
           (btor870
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state870")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state870"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state870")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state870")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor871
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state871")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state871"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state871")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state871")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor872
            (if (bitvector->bool (signal-value btor594)) btor871 btor870))
           (btor873
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state873")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state873"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state873")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state873")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor874
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state874")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state874"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state874")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state874")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor875
            (if (bitvector->bool (signal-value btor603)) btor874 btor873))
           (btor876
            (signal
             (bvxor (signal-value btor872) (signal-value btor875))
             (list)))
           (btor877 (bv->signal (bv 0 (bitvector 9))))
           (btor878
            (signal
             (concat (signal-value btor276) (signal-value btor276))
             (list)))
           (btor879
            (signal
             (concat (signal-value btor276) (signal-value btor878))
             (list)))
           (btor880
            (signal
             (concat (signal-value btor276) (signal-value btor879))
             (list)))
           (btor881
            (signal
             (concat (signal-value btor276) (signal-value btor880))
             (list)))
           (btor882
            (signal
             (concat (signal-value btor276) (signal-value btor881))
             (list)))
           (btor883
            (signal
             (concat (signal-value btor276) (signal-value btor882))
             (list)))
           (btor884
            (signal
             (concat (signal-value btor276) (signal-value btor883))
             (list)))
           (btor885
            (signal
             (concat (signal-value btor276) (signal-value btor884))
             (list)))
           (btor886
            (if (bitvector->bool (signal-value btor346)) btor885 btor877))
           (btor887
            (signal
             (concat (signal-value btor248) (signal-value btor247))
             (list)))
           (btor888
            (signal
             (concat (signal-value btor259) (signal-value btor887))
             (list)))
           (btor889
            (signal
             (concat (signal-value btor270) (signal-value btor888))
             (list)))
           (btor890
            (signal
             (concat (signal-value btor277) (signal-value btor889))
             (list)))
           (btor891
            (signal
             (concat (signal-value btor278) (signal-value btor890))
             (list)))
           (btor892
            (signal
             (concat (signal-value btor279) (signal-value btor891))
             (list)))
           (btor893
            (signal
             (concat (signal-value btor280) (signal-value btor892))
             (list)))
           (btor894
            (signal
             (concat (signal-value btor281) (signal-value btor893))
             (list)))
           (btor895
            (signal
             (concat (signal-value btor282) (signal-value btor894))
             (list)))
           (btor896
            (signal
             (concat (signal-value btor249) (signal-value btor895))
             (list)))
           (btor897
            (signal
             (concat (signal-value btor250) (signal-value btor896))
             (list)))
           (btor898
            (signal
             (concat (signal-value btor251) (signal-value btor897))
             (list)))
           (btor899
            (signal
             (concat (signal-value btor252) (signal-value btor898))
             (list)))
           (btor900
            (signal
             (concat (signal-value btor253) (signal-value btor899))
             (list)))
           (btor901
            (signal
             (concat (signal-value btor254) (signal-value btor900))
             (list)))
           (btor902
            (signal
             (concat (signal-value btor255) (signal-value btor901))
             (list)))
           (btor903
            (signal
             (concat (signal-value btor256) (signal-value btor902))
             (list)))
           (btor904
            (signal
             (concat (signal-value btor868) (signal-value btor903))
             (list)))
           (btor905
            (signal
             (concat (signal-value btor869) (signal-value btor904))
             (list)))
           (btor906
            (signal
             (concat (signal-value btor876) (signal-value btor905))
             (list)))
           (btor907
            (signal
             (concat (signal-value btor257) (signal-value btor906))
             (list)))
           (btor908
            (signal
             (concat (signal-value btor258) (signal-value btor907))
             (list)))
           (btor909
            (signal
             (concat (signal-value btor260) (signal-value btor908))
             (list)))
           (btor910
            (signal
             (concat (signal-value btor261) (signal-value btor909))
             (list)))
           (btor911
            (signal
             (concat (signal-value btor262) (signal-value btor910))
             (list)))
           (btor912
            (signal
             (concat (signal-value btor263) (signal-value btor911))
             (list)))
           (btor913
            (signal
             (concat (signal-value btor264) (signal-value btor912))
             (list)))
           (btor914
            (signal
             (concat (signal-value btor265) (signal-value btor913))
             (list)))
           (btor915
            (signal
             (concat (signal-value btor266) (signal-value btor914))
             (list)))
           (btor916
            (signal
             (concat (signal-value btor267) (signal-value btor915))
             (list)))
           (btor917
            (signal
             (concat (signal-value btor268) (signal-value btor916))
             (list)))
           (btor918
            (signal
             (concat (signal-value btor269) (signal-value btor917))
             (list)))
           (btor919
            (signal
             (concat (signal-value btor271) (signal-value btor918))
             (list)))
           (btor920
            (signal
             (concat (signal-value btor272) (signal-value btor919))
             (list)))
           (btor921
            (signal
             (concat (signal-value btor273) (signal-value btor920))
             (list)))
           (btor922
            (signal
             (concat (signal-value btor274) (signal-value btor921))
             (list)))
           (btor923
            (signal
             (concat (signal-value btor275) (signal-value btor922))
             (list)))
           (btor924
            (signal
             (concat (signal-value btor276) (signal-value btor923))
             (list)))
           (btor925
            (signal
             (concat (signal-value btor886) (signal-value btor924))
             (list)))
           (btor926 (bv->signal (bv 3 (bitvector 2))))
           (btor927
            (bv->signal
             (zero-extend (signal-value btor926) (bitvector 5))
             btor926))
           (btor928
            (signal
             (bool->bitvector
              (bveq (signal-value btor325) (signal-value btor927)))
             (list)))
           (btor929
            (if (bitvector->bool (signal-value btor928)) btor925 btor860))
           (btor930
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state930")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state930"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state930")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state930")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 7))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor931
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state931")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state931"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state931")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state931")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 7))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor932
            (if (bitvector->bool (signal-value btor594)) btor931 btor930))
           (btor933
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state933")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state933"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state933")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state933")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 7))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor934
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state934")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state934"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state934")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state934")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 7))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor935
            (if (bitvector->bool (signal-value btor603)) btor934 btor933))
           (btor936
            (signal
             (bvxor (signal-value btor932) (signal-value btor935))
             (list)))
           (btor937
            (signal
             (extract 1 0 (signal-value btor936))
             (signal-state btor936)))
           (btor938
            (bv->signal
             (zero-extend (signal-value btor351) (bitvector 2))
             btor351))
           (btor939
            (signal
             (bool->bitvector
              (bveq (signal-value btor937) (signal-value btor938)))
             (list)))
           (btor940
            (if (bitvector->bool (signal-value btor939)) btor929 btor804))
           (btor941
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state941")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state941"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state941")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state941")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 27))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor942
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state942")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state942"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state942")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state942")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 27))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor943
            (if (bitvector->bool (signal-value btor594)) btor942 btor941))
           (btor944
            (signal
             (extract 17 17 (signal-value btor943))
             (signal-state btor943)))
           (btor945
            (signal
             (bvand (signal-value btor773) (signal-value btor944))
             (list)))
           (btor946
            (signal (concat (signal-value btor3) (signal-value btor2)) (list)))
           (btor947
            (signal
             (concat (signal-value btor14) (signal-value btor946))
             (list)))
           (btor948
            (signal
             (concat (signal-value btor25) (signal-value btor947))
             (list)))
           (btor949
            (signal
             (concat (signal-value btor32) (signal-value btor948))
             (list)))
           (btor950
            (signal
             (concat (signal-value btor33) (signal-value btor949))
             (list)))
           (btor951
            (signal
             (concat (signal-value btor34) (signal-value btor950))
             (list)))
           (btor952
            (signal
             (concat (signal-value btor35) (signal-value btor951))
             (list)))
           (btor953
            (signal
             (concat (signal-value btor36) (signal-value btor952))
             (list)))
           (btor954
            (signal
             (concat (signal-value btor37) (signal-value btor953))
             (list)))
           (btor955
            (signal
             (concat (signal-value btor4) (signal-value btor954))
             (list)))
           (btor956
            (signal
             (concat (signal-value btor5) (signal-value btor955))
             (list)))
           (btor957
            (signal
             (concat (signal-value btor6) (signal-value btor956))
             (list)))
           (btor958
            (signal
             (concat (signal-value btor7) (signal-value btor957))
             (list)))
           (btor959
            (signal
             (concat (signal-value btor8) (signal-value btor958))
             (list)))
           (btor960
            (signal
             (concat (signal-value btor9) (signal-value btor959))
             (list)))
           (btor961
            (signal
             (concat (signal-value btor10) (signal-value btor960))
             (list)))
           (btor962
            (signal
             (concat (signal-value btor11) (signal-value btor961))
             (list)))
           (btor963
            (signal
             (concat (signal-value btor12) (signal-value btor962))
             (list)))
           (btor964
            (signal
             (concat (signal-value btor13) (signal-value btor963))
             (list)))
           (btor965
            (signal
             (concat (signal-value btor15) (signal-value btor964))
             (list)))
           (btor966
            (signal
             (concat (signal-value btor16) (signal-value btor965))
             (list)))
           (btor967
            (signal
             (concat (signal-value btor17) (signal-value btor966))
             (list)))
           (btor968
            (signal
             (concat (signal-value btor18) (signal-value btor967))
             (list)))
           (btor969
            (signal
             (concat (signal-value btor19) (signal-value btor968))
             (list)))
           (btor970
            (signal
             (concat (signal-value btor20) (signal-value btor969))
             (list)))
           (btor971
            (signal
             (concat (signal-value btor21) (signal-value btor970))
             (list)))
           (btor972
            (signal
             (concat (signal-value btor22) (signal-value btor971))
             (list)))
           (btor973
            (signal
             (concat (signal-value btor23) (signal-value btor972))
             (list)))
           (btor974
            (signal
             (concat (signal-value btor24) (signal-value btor973))
             (list)))
           (btor975
            (signal
             (concat (signal-value btor26) (signal-value btor974))
             (list)))
           (btor976
            (signal
             (concat (signal-value btor27) (signal-value btor975))
             (list)))
           (btor977
            (signal
             (concat (signal-value btor28) (signal-value btor976))
             (list)))
           (btor978
            (signal
             (concat (signal-value btor29) (signal-value btor977))
             (list)))
           (btor979
            (signal
             (concat (signal-value btor30) (signal-value btor978))
             (list)))
           (btor980
            (signal
             (concat (signal-value btor31) (signal-value btor979))
             (list)))
           (btor981
            (signal
             (extract 17 0 (signal-value btor943))
             (signal-state btor943)))
           (btor982
            (signal
             (concat (signal-value btor981) (signal-value btor980))
             (list)))
           (btor983
            (signal
             (concat (signal-value btor945) (signal-value btor982))
             (list)))
           (btor984 (bv->signal (bv 0 (bitvector 55))))
           (btor985
            (signal
             (bool->bitvector
              (bveq (signal-value btor937) (signal-value btor926)))
             (list)))
           (btor986
            (if (bitvector->bool (signal-value btor985)) btor984 btor983))
           (btor987
            (signal
             (bool->bitvector
              (bveq (signal-value btor937) (signal-value btor373)))
             (list)))
           (btor988
            (signal
             (bvor (signal-value btor987) (signal-value btor985))
             (list)))
           (btor989
            (if (bitvector->bool (signal-value btor988)) btor986 btor940))
           (btor990
            (bv->signal
             (zero-extend (signal-value btor989) (bitvector 55))
             btor989))
           (btor991
            (signal (concat (signal-value btor3) (signal-value btor2)) (list)))
           (btor992
            (signal
             (concat (signal-value btor14) (signal-value btor991))
             (list)))
           (btor993
            (signal
             (concat (signal-value btor25) (signal-value btor992))
             (list)))
           (btor994
            (signal
             (concat (signal-value btor32) (signal-value btor993))
             (list)))
           (btor995
            (signal
             (concat (signal-value btor33) (signal-value btor994))
             (list)))
           (btor996
            (signal
             (concat (signal-value btor34) (signal-value btor995))
             (list)))
           (btor997
            (signal
             (concat (signal-value btor35) (signal-value btor996))
             (list)))
           (btor998
            (signal
             (concat (signal-value btor36) (signal-value btor997))
             (list)))
           (btor999
            (signal
             (concat (signal-value btor37) (signal-value btor998))
             (list)))
           (btor1000
            (signal
             (concat (signal-value btor4) (signal-value btor999))
             (list)))
           (btor1001
            (signal
             (concat (signal-value btor5) (signal-value btor1000))
             (list)))
           (btor1002
            (signal
             (concat (signal-value btor6) (signal-value btor1001))
             (list)))
           (btor1003
            (signal
             (concat (signal-value btor7) (signal-value btor1002))
             (list)))
           (btor1004
            (signal
             (concat (signal-value btor8) (signal-value btor1003))
             (list)))
           (btor1005
            (signal
             (concat (signal-value btor9) (signal-value btor1004))
             (list)))
           (btor1006
            (signal
             (concat (signal-value btor10) (signal-value btor1005))
             (list)))
           (btor1007
            (signal
             (concat (signal-value btor11) (signal-value btor1006))
             (list)))
           (btor1008
            (signal
             (concat (signal-value btor12) (signal-value btor1007))
             (list)))
           (btor1009
            (signal
             (concat (signal-value btor13) (signal-value btor1008))
             (list)))
           (btor1010
            (signal
             (concat (signal-value btor15) (signal-value btor1009))
             (list)))
           (btor1011
            (signal
             (concat (signal-value btor16) (signal-value btor1010))
             (list)))
           (btor1012
            (signal
             (concat (signal-value btor17) (signal-value btor1011))
             (list)))
           (btor1013
            (signal
             (concat (signal-value btor18) (signal-value btor1012))
             (list)))
           (btor1014
            (signal
             (concat (signal-value btor19) (signal-value btor1013))
             (list)))
           (btor1015
            (signal
             (concat (signal-value btor20) (signal-value btor1014))
             (list)))
           (btor1016
            (signal
             (concat (signal-value btor21) (signal-value btor1015))
             (list)))
           (btor1017
            (signal
             (concat (signal-value btor22) (signal-value btor1016))
             (list)))
           (btor1018
            (signal
             (concat (signal-value btor23) (signal-value btor1017))
             (list)))
           (btor1019
            (signal
             (concat (signal-value btor24) (signal-value btor1018))
             (list)))
           (btor1020
            (signal
             (concat (signal-value btor26) (signal-value btor1019))
             (list)))
           (btor1021
            (signal
             (concat (signal-value btor27) (signal-value btor1020))
             (list)))
           (btor1022
            (signal
             (concat (signal-value btor28) (signal-value btor1021))
             (list)))
           (btor1023
            (signal
             (concat (signal-value btor29) (signal-value btor1022))
             (list)))
           (btor1024
            (signal
             (concat (signal-value btor30) (signal-value btor1023))
             (list)))
           (btor1025
            (signal
             (concat (signal-value btor31) (signal-value btor1024))
             (list)))
           (btor1026
            (bv->signal
             (zero-extend (signal-value btor1025) (bitvector 36))
             btor1025))
           (btor1027 (bv->signal (bv 0 (bitvector 18))))
           (btor1028
            (signal
             (concat (signal-value btor287) (signal-value btor1027))
             (list)))
           (btor1029
            (signal
             (concat (signal-value btor288) (signal-value btor1028))
             (list)))
           (btor1030
            (signal
             (concat (signal-value btor299) (signal-value btor1029))
             (list)))
           (btor1031
            (signal
             (concat (signal-value btor310) (signal-value btor1030))
             (list)))
           (btor1032
            (signal
             (concat (signal-value btor317) (signal-value btor1031))
             (list)))
           (btor1033
            (signal
             (concat (signal-value btor318) (signal-value btor1032))
             (list)))
           (btor1034
            (signal
             (concat (signal-value btor319) (signal-value btor1033))
             (list)))
           (btor1035
            (signal
             (concat (signal-value btor320) (signal-value btor1034))
             (list)))
           (btor1036
            (signal
             (concat (signal-value btor321) (signal-value btor1035))
             (list)))
           (btor1037
            (signal
             (concat (signal-value btor322) (signal-value btor1036))
             (list)))
           (btor1038
            (signal
             (concat (signal-value btor289) (signal-value btor1037))
             (list)))
           (btor1039
            (signal
             (concat (signal-value btor290) (signal-value btor1038))
             (list)))
           (btor1040
            (signal
             (concat (signal-value btor291) (signal-value btor1039))
             (list)))
           (btor1041
            (signal
             (concat (signal-value btor292) (signal-value btor1040))
             (list)))
           (btor1042
            (signal
             (concat (signal-value btor293) (signal-value btor1041))
             (list)))
           (btor1043
            (signal
             (concat (signal-value btor294) (signal-value btor1042))
             (list)))
           (btor1044
            (signal
             (concat (signal-value btor295) (signal-value btor1043))
             (list)))
           (btor1045
            (signal
             (concat (signal-value btor296) (signal-value btor1044))
             (list)))
           (btor1046
            (signal
             (concat (signal-value btor297) (signal-value btor1045))
             (list)))
           (btor1047
            (signal
             (concat (signal-value btor298) (signal-value btor1046))
             (list)))
           (btor1048
            (signal
             (concat (signal-value btor300) (signal-value btor1047))
             (list)))
           (btor1049
            (signal
             (concat (signal-value btor301) (signal-value btor1048))
             (list)))
           (btor1050
            (signal
             (concat (signal-value btor302) (signal-value btor1049))
             (list)))
           (btor1051
            (signal
             (concat (signal-value btor303) (signal-value btor1050))
             (list)))
           (btor1052
            (signal
             (concat (signal-value btor304) (signal-value btor1051))
             (list)))
           (btor1053
            (signal
             (concat (signal-value btor305) (signal-value btor1052))
             (list)))
           (btor1054
            (signal
             (concat (signal-value btor306) (signal-value btor1053))
             (list)))
           (btor1055
            (signal
             (concat (signal-value btor307) (signal-value btor1054))
             (list)))
           (btor1056
            (signal
             (concat (signal-value btor308) (signal-value btor1055))
             (list)))
           (btor1057
            (signal
             (concat (signal-value btor309) (signal-value btor1056))
             (list)))
           (btor1058
            (signal
             (concat (signal-value btor311) (signal-value btor1057))
             (list)))
           (btor1059
            (signal
             (concat (signal-value btor312) (signal-value btor1058))
             (list)))
           (btor1060
            (signal
             (concat (signal-value btor313) (signal-value btor1059))
             (list)))
           (btor1061
            (signal
             (concat (signal-value btor314) (signal-value btor1060))
             (list)))
           (btor1062
            (signal
             (concat (signal-value btor315) (signal-value btor1061))
             (list)))
           (btor1063
            (signal
             (concat (signal-value btor316) (signal-value btor1062))
             (list)))
           (btor1064
            (signal
             (concat (signal-value btor598) (signal-value btor1063))
             (list)))
           (btor1065
            (signal
             (concat (signal-value btor316) (signal-value btor316))
             (list)))
           (btor1066
            (signal
             (concat (signal-value btor316) (signal-value btor1065))
             (list)))
           (btor1067
            (signal
             (concat (signal-value btor316) (signal-value btor1066))
             (list)))
           (btor1068
            (signal
             (concat (signal-value btor316) (signal-value btor1067))
             (list)))
           (btor1069
            (signal
             (concat (signal-value btor316) (signal-value btor1068))
             (list)))
           (btor1070
            (signal
             (concat (signal-value btor316) (signal-value btor1069))
             (list)))
           (btor1071
            (signal
             (concat (signal-value btor316) (signal-value btor1070))
             (list)))
           (btor1072
            (signal
             (concat (signal-value btor316) (signal-value btor1071))
             (list)))
           (btor1073
            (signal
             (concat (signal-value btor316) (signal-value btor1072))
             (list)))
           (btor1074
            (signal
             (concat (signal-value btor316) (signal-value btor1073))
             (list)))
           (btor1075
            (signal
             (concat (signal-value btor316) (signal-value btor1074))
             (list)))
           (btor1076
            (signal
             (concat (signal-value btor316) (signal-value btor1075))
             (list)))
           (btor1077
            (signal
             (concat (signal-value btor316) (signal-value btor1076))
             (list)))
           (btor1078
            (signal
             (concat (signal-value btor316) (signal-value btor1077))
             (list)))
           (btor1079
            (signal
             (concat (signal-value btor316) (signal-value btor1078))
             (list)))
           (btor1080
            (signal
             (concat (signal-value btor316) (signal-value btor1079))
             (list)))
           (btor1081
            (signal
             (concat (signal-value btor316) (signal-value btor1080))
             (list)))
           (btor1082
            (signal
             (concat (signal-value btor316) (signal-value btor1081))
             (list)))
           (btor1083
            (if (bitvector->bool (signal-value btor347)) btor1082 btor805))
           (btor1084
            (signal
             (concat (signal-value btor288) (signal-value btor287))
             (list)))
           (btor1085
            (signal
             (concat (signal-value btor299) (signal-value btor1084))
             (list)))
           (btor1086
            (signal
             (concat (signal-value btor310) (signal-value btor1085))
             (list)))
           (btor1087
            (signal
             (concat (signal-value btor317) (signal-value btor1086))
             (list)))
           (btor1088
            (signal
             (concat (signal-value btor318) (signal-value btor1087))
             (list)))
           (btor1089
            (signal
             (concat (signal-value btor319) (signal-value btor1088))
             (list)))
           (btor1090
            (signal
             (concat (signal-value btor320) (signal-value btor1089))
             (list)))
           (btor1091
            (signal
             (concat (signal-value btor321) (signal-value btor1090))
             (list)))
           (btor1092
            (signal
             (concat (signal-value btor322) (signal-value btor1091))
             (list)))
           (btor1093
            (signal
             (concat (signal-value btor289) (signal-value btor1092))
             (list)))
           (btor1094
            (signal
             (concat (signal-value btor290) (signal-value btor1093))
             (list)))
           (btor1095
            (signal
             (concat (signal-value btor291) (signal-value btor1094))
             (list)))
           (btor1096
            (signal
             (concat (signal-value btor292) (signal-value btor1095))
             (list)))
           (btor1097
            (signal
             (concat (signal-value btor293) (signal-value btor1096))
             (list)))
           (btor1098
            (signal
             (concat (signal-value btor294) (signal-value btor1097))
             (list)))
           (btor1099
            (signal
             (concat (signal-value btor295) (signal-value btor1098))
             (list)))
           (btor1100
            (signal
             (concat (signal-value btor296) (signal-value btor1099))
             (list)))
           (btor1101
            (signal
             (concat (signal-value btor297) (signal-value btor1100))
             (list)))
           (btor1102
            (signal
             (concat (signal-value btor298) (signal-value btor1101))
             (list)))
           (btor1103
            (signal
             (concat (signal-value btor300) (signal-value btor1102))
             (list)))
           (btor1104
            (signal
             (concat (signal-value btor301) (signal-value btor1103))
             (list)))
           (btor1105
            (signal
             (concat (signal-value btor302) (signal-value btor1104))
             (list)))
           (btor1106
            (signal
             (concat (signal-value btor303) (signal-value btor1105))
             (list)))
           (btor1107
            (signal
             (concat (signal-value btor304) (signal-value btor1106))
             (list)))
           (btor1108
            (signal
             (concat (signal-value btor305) (signal-value btor1107))
             (list)))
           (btor1109
            (signal
             (concat (signal-value btor306) (signal-value btor1108))
             (list)))
           (btor1110
            (signal
             (concat (signal-value btor307) (signal-value btor1109))
             (list)))
           (btor1111
            (signal
             (concat (signal-value btor308) (signal-value btor1110))
             (list)))
           (btor1112
            (signal
             (concat (signal-value btor309) (signal-value btor1111))
             (list)))
           (btor1113
            (signal
             (concat (signal-value btor311) (signal-value btor1112))
             (list)))
           (btor1114
            (signal
             (concat (signal-value btor312) (signal-value btor1113))
             (list)))
           (btor1115
            (signal
             (concat (signal-value btor313) (signal-value btor1114))
             (list)))
           (btor1116
            (signal
             (concat (signal-value btor314) (signal-value btor1115))
             (list)))
           (btor1117
            (signal
             (concat (signal-value btor315) (signal-value btor1116))
             (list)))
           (btor1118
            (signal
             (concat (signal-value btor316) (signal-value btor1117))
             (list)))
           (btor1119
            (signal
             (concat (signal-value btor1083) (signal-value btor1118))
             (list)))
           (btor1120
            (signal
             (concat (signal-value btor296) (signal-value btor296))
             (list)))
           (btor1121
            (signal
             (concat (signal-value btor296) (signal-value btor1120))
             (list)))
           (btor1122
            (signal
             (concat (signal-value btor296) (signal-value btor1121))
             (list)))
           (btor1123
            (signal
             (concat (signal-value btor296) (signal-value btor1122))
             (list)))
           (btor1124
            (signal
             (concat (signal-value btor296) (signal-value btor1123))
             (list)))
           (btor1125
            (signal
             (concat (signal-value btor296) (signal-value btor1124))
             (list)))
           (btor1126
            (if (bitvector->bool (signal-value btor347)) btor1125 btor861))
           (btor1127
            (signal
             (concat (signal-value btor316) (signal-value btor316))
             (list)))
           (btor1128
            (signal
             (concat (signal-value btor316) (signal-value btor1127))
             (list)))
           (btor1129
            (signal
             (concat (signal-value btor316) (signal-value btor1128))
             (list)))
           (btor1130
            (signal
             (concat (signal-value btor316) (signal-value btor1129))
             (list)))
           (btor1131
            (signal
             (concat (signal-value btor316) (signal-value btor1130))
             (list)))
           (btor1132
            (signal
             (concat (signal-value btor316) (signal-value btor1131))
             (list)))
           (btor1133
            (signal
             (concat (signal-value btor316) (signal-value btor1132))
             (list)))
           (btor1134
            (signal
             (concat (signal-value btor316) (signal-value btor1133))
             (list)))
           (btor1135
            (if (bitvector->bool (signal-value btor347)) btor1134 btor877))
           (btor1136
            (signal
             (concat (signal-value btor288) (signal-value btor287))
             (list)))
           (btor1137
            (signal
             (concat (signal-value btor299) (signal-value btor1136))
             (list)))
           (btor1138
            (signal
             (concat (signal-value btor310) (signal-value btor1137))
             (list)))
           (btor1139
            (signal
             (concat (signal-value btor317) (signal-value btor1138))
             (list)))
           (btor1140
            (signal
             (concat (signal-value btor318) (signal-value btor1139))
             (list)))
           (btor1141
            (signal
             (concat (signal-value btor319) (signal-value btor1140))
             (list)))
           (btor1142
            (signal
             (concat (signal-value btor320) (signal-value btor1141))
             (list)))
           (btor1143
            (signal
             (concat (signal-value btor321) (signal-value btor1142))
             (list)))
           (btor1144
            (signal
             (concat (signal-value btor322) (signal-value btor1143))
             (list)))
           (btor1145
            (signal
             (concat (signal-value btor289) (signal-value btor1144))
             (list)))
           (btor1146
            (signal
             (concat (signal-value btor290) (signal-value btor1145))
             (list)))
           (btor1147
            (signal
             (concat (signal-value btor291) (signal-value btor1146))
             (list)))
           (btor1148
            (signal
             (concat (signal-value btor292) (signal-value btor1147))
             (list)))
           (btor1149
            (signal
             (concat (signal-value btor293) (signal-value btor1148))
             (list)))
           (btor1150
            (signal
             (concat (signal-value btor294) (signal-value btor1149))
             (list)))
           (btor1151
            (signal
             (concat (signal-value btor295) (signal-value btor1150))
             (list)))
           (btor1152
            (signal
             (concat (signal-value btor296) (signal-value btor1151))
             (list)))
           (btor1153
            (signal
             (concat (signal-value btor1126) (signal-value btor1152))
             (list)))
           (btor1154
            (signal
             (concat (signal-value btor876) (signal-value btor1153))
             (list)))
           (btor1155
            (signal
             (concat (signal-value btor876) (signal-value btor1154))
             (list)))
           (btor1156
            (signal
             (concat (signal-value btor598) (signal-value btor1155))
             (list)))
           (btor1157
            (signal
             (concat (signal-value btor297) (signal-value btor1156))
             (list)))
           (btor1158
            (signal
             (concat (signal-value btor298) (signal-value btor1157))
             (list)))
           (btor1159
            (signal
             (concat (signal-value btor300) (signal-value btor1158))
             (list)))
           (btor1160
            (signal
             (concat (signal-value btor301) (signal-value btor1159))
             (list)))
           (btor1161
            (signal
             (concat (signal-value btor302) (signal-value btor1160))
             (list)))
           (btor1162
            (signal
             (concat (signal-value btor303) (signal-value btor1161))
             (list)))
           (btor1163
            (signal
             (concat (signal-value btor304) (signal-value btor1162))
             (list)))
           (btor1164
            (signal
             (concat (signal-value btor305) (signal-value btor1163))
             (list)))
           (btor1165
            (signal
             (concat (signal-value btor306) (signal-value btor1164))
             (list)))
           (btor1166
            (signal
             (concat (signal-value btor307) (signal-value btor1165))
             (list)))
           (btor1167
            (signal
             (concat (signal-value btor308) (signal-value btor1166))
             (list)))
           (btor1168
            (signal
             (concat (signal-value btor309) (signal-value btor1167))
             (list)))
           (btor1169
            (signal
             (concat (signal-value btor311) (signal-value btor1168))
             (list)))
           (btor1170
            (signal
             (concat (signal-value btor312) (signal-value btor1169))
             (list)))
           (btor1171
            (signal
             (concat (signal-value btor313) (signal-value btor1170))
             (list)))
           (btor1172
            (signal
             (concat (signal-value btor314) (signal-value btor1171))
             (list)))
           (btor1173
            (signal
             (concat (signal-value btor315) (signal-value btor1172))
             (list)))
           (btor1174
            (signal
             (concat (signal-value btor316) (signal-value btor1173))
             (list)))
           (btor1175
            (signal
             (concat (signal-value btor1135) (signal-value btor1174))
             (list)))
           (btor1176
            (if (bitvector->bool (signal-value btor928)) btor1175 btor1119))
           (btor1177
            (signal
             (extract 3 2 (signal-value btor936))
             (signal-state btor936)))
           (btor1178
            (bv->signal
             (zero-extend (signal-value btor351) (bitvector 2))
             btor351))
           (btor1179
            (signal
             (bool->bitvector
              (bveq (signal-value btor1177) (signal-value btor1178)))
             (list)))
           (btor1180
            (if (bitvector->bool (signal-value btor1179)) btor1176 btor1064))
           (btor1181
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1181")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1181"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1181")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1181")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 27))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1182
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1182")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1182"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1182")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1182")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 27))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1183
            (if (bitvector->bool (signal-value btor594)) btor1182 btor1181))
           (btor1184
            (signal
             (extract 17 17 (signal-value btor1183))
             (signal-state btor1183)))
           (btor1185
            (signal
             (bvand (signal-value btor773) (signal-value btor1184))
             (list)))
           (btor1186
            (signal
             (concat (signal-value btor39) (signal-value btor38))
             (list)))
           (btor1187
            (signal
             (concat (signal-value btor50) (signal-value btor1186))
             (list)))
           (btor1188
            (signal
             (concat (signal-value btor61) (signal-value btor1187))
             (list)))
           (btor1189
            (signal
             (concat (signal-value btor68) (signal-value btor1188))
             (list)))
           (btor1190
            (signal
             (concat (signal-value btor69) (signal-value btor1189))
             (list)))
           (btor1191
            (signal
             (concat (signal-value btor70) (signal-value btor1190))
             (list)))
           (btor1192
            (signal
             (concat (signal-value btor71) (signal-value btor1191))
             (list)))
           (btor1193
            (signal
             (concat (signal-value btor72) (signal-value btor1192))
             (list)))
           (btor1194
            (signal
             (concat (signal-value btor73) (signal-value btor1193))
             (list)))
           (btor1195
            (signal
             (concat (signal-value btor40) (signal-value btor1194))
             (list)))
           (btor1196
            (signal
             (concat (signal-value btor41) (signal-value btor1195))
             (list)))
           (btor1197
            (signal
             (concat (signal-value btor42) (signal-value btor1196))
             (list)))
           (btor1198
            (signal
             (concat (signal-value btor43) (signal-value btor1197))
             (list)))
           (btor1199
            (signal
             (concat (signal-value btor44) (signal-value btor1198))
             (list)))
           (btor1200
            (signal
             (concat (signal-value btor45) (signal-value btor1199))
             (list)))
           (btor1201
            (signal
             (concat (signal-value btor46) (signal-value btor1200))
             (list)))
           (btor1202
            (signal
             (concat (signal-value btor47) (signal-value btor1201))
             (list)))
           (btor1203
            (signal
             (concat (signal-value btor48) (signal-value btor1202))
             (list)))
           (btor1204
            (signal
             (concat (signal-value btor49) (signal-value btor1203))
             (list)))
           (btor1205
            (signal
             (concat (signal-value btor51) (signal-value btor1204))
             (list)))
           (btor1206
            (signal
             (concat (signal-value btor52) (signal-value btor1205))
             (list)))
           (btor1207
            (signal
             (concat (signal-value btor53) (signal-value btor1206))
             (list)))
           (btor1208
            (signal
             (concat (signal-value btor54) (signal-value btor1207))
             (list)))
           (btor1209
            (signal
             (concat (signal-value btor55) (signal-value btor1208))
             (list)))
           (btor1210
            (signal
             (concat (signal-value btor56) (signal-value btor1209))
             (list)))
           (btor1211
            (signal
             (concat (signal-value btor57) (signal-value btor1210))
             (list)))
           (btor1212
            (signal
             (concat (signal-value btor58) (signal-value btor1211))
             (list)))
           (btor1213
            (signal
             (concat (signal-value btor59) (signal-value btor1212))
             (list)))
           (btor1214
            (signal
             (concat (signal-value btor60) (signal-value btor1213))
             (list)))
           (btor1215
            (signal
             (concat (signal-value btor62) (signal-value btor1214))
             (list)))
           (btor1216
            (signal
             (concat (signal-value btor63) (signal-value btor1215))
             (list)))
           (btor1217
            (signal
             (concat (signal-value btor64) (signal-value btor1216))
             (list)))
           (btor1218
            (signal
             (concat (signal-value btor65) (signal-value btor1217))
             (list)))
           (btor1219
            (signal
             (concat (signal-value btor66) (signal-value btor1218))
             (list)))
           (btor1220
            (signal
             (concat (signal-value btor67) (signal-value btor1219))
             (list)))
           (btor1221
            (signal
             (extract 17 0 (signal-value btor1183))
             (signal-state btor1183)))
           (btor1222
            (signal
             (concat (signal-value btor1221) (signal-value btor1220))
             (list)))
           (btor1223
            (signal
             (concat (signal-value btor1185) (signal-value btor1222))
             (list)))
           (btor1224
            (signal
             (bool->bitvector
              (bveq (signal-value btor1177) (signal-value btor926)))
             (list)))
           (btor1225
            (if (bitvector->bool (signal-value btor1224)) btor984 btor1223))
           (btor1226
            (signal
             (bool->bitvector
              (bveq (signal-value btor1177) (signal-value btor373)))
             (list)))
           (btor1227
            (signal
             (bvor (signal-value btor1226) (signal-value btor1224))
             (list)))
           (btor1228
            (if (bitvector->bool (signal-value btor1227)) btor1225 btor1180))
           (btor1229
            (bv->signal
             (zero-extend (signal-value btor1228) (bitvector 55))
             btor1228))
           (btor1230
            (signal
             (concat (signal-value btor39) (signal-value btor38))
             (list)))
           (btor1231
            (signal
             (concat (signal-value btor50) (signal-value btor1230))
             (list)))
           (btor1232
            (signal
             (concat (signal-value btor61) (signal-value btor1231))
             (list)))
           (btor1233
            (signal
             (concat (signal-value btor68) (signal-value btor1232))
             (list)))
           (btor1234
            (signal
             (concat (signal-value btor69) (signal-value btor1233))
             (list)))
           (btor1235
            (signal
             (concat (signal-value btor70) (signal-value btor1234))
             (list)))
           (btor1236
            (signal
             (concat (signal-value btor71) (signal-value btor1235))
             (list)))
           (btor1237
            (signal
             (concat (signal-value btor72) (signal-value btor1236))
             (list)))
           (btor1238
            (signal
             (concat (signal-value btor73) (signal-value btor1237))
             (list)))
           (btor1239
            (signal
             (concat (signal-value btor40) (signal-value btor1238))
             (list)))
           (btor1240
            (signal
             (concat (signal-value btor41) (signal-value btor1239))
             (list)))
           (btor1241
            (signal
             (concat (signal-value btor42) (signal-value btor1240))
             (list)))
           (btor1242
            (signal
             (concat (signal-value btor43) (signal-value btor1241))
             (list)))
           (btor1243
            (signal
             (concat (signal-value btor44) (signal-value btor1242))
             (list)))
           (btor1244
            (signal
             (concat (signal-value btor45) (signal-value btor1243))
             (list)))
           (btor1245
            (signal
             (concat (signal-value btor46) (signal-value btor1244))
             (list)))
           (btor1246
            (signal
             (concat (signal-value btor47) (signal-value btor1245))
             (list)))
           (btor1247
            (signal
             (concat (signal-value btor48) (signal-value btor1246))
             (list)))
           (btor1248
            (signal
             (concat (signal-value btor49) (signal-value btor1247))
             (list)))
           (btor1249
            (signal
             (concat (signal-value btor51) (signal-value btor1248))
             (list)))
           (btor1250
            (signal
             (concat (signal-value btor52) (signal-value btor1249))
             (list)))
           (btor1251
            (signal
             (concat (signal-value btor53) (signal-value btor1250))
             (list)))
           (btor1252
            (signal
             (concat (signal-value btor54) (signal-value btor1251))
             (list)))
           (btor1253
            (signal
             (concat (signal-value btor55) (signal-value btor1252))
             (list)))
           (btor1254
            (signal
             (concat (signal-value btor56) (signal-value btor1253))
             (list)))
           (btor1255
            (signal
             (concat (signal-value btor57) (signal-value btor1254))
             (list)))
           (btor1256
            (signal
             (concat (signal-value btor58) (signal-value btor1255))
             (list)))
           (btor1257
            (signal
             (concat (signal-value btor59) (signal-value btor1256))
             (list)))
           (btor1258
            (signal
             (concat (signal-value btor60) (signal-value btor1257))
             (list)))
           (btor1259
            (signal
             (concat (signal-value btor62) (signal-value btor1258))
             (list)))
           (btor1260
            (signal
             (concat (signal-value btor63) (signal-value btor1259))
             (list)))
           (btor1261
            (signal
             (concat (signal-value btor64) (signal-value btor1260))
             (list)))
           (btor1262
            (signal
             (concat (signal-value btor65) (signal-value btor1261))
             (list)))
           (btor1263
            (signal
             (concat (signal-value btor66) (signal-value btor1262))
             (list)))
           (btor1264
            (signal
             (concat (signal-value btor67) (signal-value btor1263))
             (list)))
           (btor1265
            (bv->signal
             (zero-extend (signal-value btor1264) (bitvector 36))
             btor1264))
           (btor1266
            (signal
             (concat (signal-value btor235) (signal-value btor235))
             (list)))
           (btor1267
            (signal
             (concat (signal-value btor235) (signal-value btor1266))
             (list)))
           (btor1268
            (signal
             (concat (signal-value btor235) (signal-value btor1267))
             (list)))
           (btor1269
            (signal
             (concat (signal-value btor235) (signal-value btor1268))
             (list)))
           (btor1270
            (signal
             (concat (signal-value btor235) (signal-value btor1269))
             (list)))
           (btor1271
            (signal
             (concat (signal-value btor235) (signal-value btor1270))
             (list)))
           (btor1272
            (signal
             (concat (signal-value btor235) (signal-value btor1271))
             (list)))
           (btor1273
            (signal
             (concat (signal-value btor235) (signal-value btor1272))
             (list)))
           (btor1274
            (signal
             (concat (signal-value btor235) (signal-value btor1273))
             (list)))
           (btor1275
            (signal
             (concat (signal-value btor235) (signal-value btor1274))
             (list)))
           (btor1276
            (signal
             (concat (signal-value btor235) (signal-value btor1275))
             (list)))
           (btor1277
            (signal
             (concat (signal-value btor235) (signal-value btor1276))
             (list)))
           (btor1278
            (signal
             (concat (signal-value btor235) (signal-value btor1277))
             (list)))
           (btor1279
            (signal
             (concat (signal-value btor235) (signal-value btor1278))
             (list)))
           (btor1280
            (signal
             (concat (signal-value btor235) (signal-value btor1279))
             (list)))
           (btor1281
            (signal
             (concat (signal-value btor235) (signal-value btor1280))
             (list)))
           (btor1282
            (signal
             (concat (signal-value btor235) (signal-value btor1281))
             (list)))
           (btor1283
            (signal
             (concat (signal-value btor235) (signal-value btor1282))
             (list)))
           (btor1284
            (if (bitvector->bool (signal-value btor345)) btor1283 btor805))
           (btor1285
            (signal
             (concat (signal-value btor197) (signal-value btor196))
             (list)))
           (btor1286
            (signal
             (concat (signal-value btor199) (signal-value btor1285))
             (list)))
           (btor1287
            (signal
             (concat (signal-value btor200) (signal-value btor1286))
             (list)))
           (btor1288
            (signal
             (concat (signal-value btor201) (signal-value btor1287))
             (list)))
           (btor1289
            (signal
             (concat (signal-value btor202) (signal-value btor1288))
             (list)))
           (btor1290
            (signal
             (concat (signal-value btor203) (signal-value btor1289))
             (list)))
           (btor1291
            (signal
             (concat (signal-value btor204) (signal-value btor1290))
             (list)))
           (btor1292
            (signal
             (concat (signal-value btor205) (signal-value btor1291))
             (list)))
           (btor1293
            (signal
             (concat (signal-value btor206) (signal-value btor1292))
             (list)))
           (btor1294
            (signal
             (concat (signal-value btor207) (signal-value btor1293))
             (list)))
           (btor1295
            (signal
             (concat (signal-value btor208) (signal-value btor1294))
             (list)))
           (btor1296
            (signal
             (concat (signal-value btor210) (signal-value btor1295))
             (list)))
           (btor1297
            (signal
             (concat (signal-value btor211) (signal-value btor1296))
             (list)))
           (btor1298
            (signal
             (concat (signal-value btor212) (signal-value btor1297))
             (list)))
           (btor1299
            (signal
             (concat (signal-value btor213) (signal-value btor1298))
             (list)))
           (btor1300
            (signal
             (concat (signal-value btor214) (signal-value btor1299))
             (list)))
           (btor1301
            (signal
             (concat (signal-value btor215) (signal-value btor1300))
             (list)))
           (btor1302
            (signal
             (concat (signal-value btor216) (signal-value btor1301))
             (list)))
           (btor1303
            (signal
             (concat (signal-value btor217) (signal-value btor1302))
             (list)))
           (btor1304
            (signal
             (concat (signal-value btor218) (signal-value btor1303))
             (list)))
           (btor1305
            (signal
             (concat (signal-value btor219) (signal-value btor1304))
             (list)))
           (btor1306
            (signal
             (concat (signal-value btor221) (signal-value btor1305))
             (list)))
           (btor1307
            (signal
             (concat (signal-value btor222) (signal-value btor1306))
             (list)))
           (btor1308
            (signal
             (concat (signal-value btor223) (signal-value btor1307))
             (list)))
           (btor1309
            (signal
             (concat (signal-value btor224) (signal-value btor1308))
             (list)))
           (btor1310
            (signal
             (concat (signal-value btor225) (signal-value btor1309))
             (list)))
           (btor1311
            (signal
             (concat (signal-value btor226) (signal-value btor1310))
             (list)))
           (btor1312
            (signal
             (concat (signal-value btor227) (signal-value btor1311))
             (list)))
           (btor1313
            (signal
             (concat (signal-value btor228) (signal-value btor1312))
             (list)))
           (btor1314
            (signal
             (concat (signal-value btor229) (signal-value btor1313))
             (list)))
           (btor1315
            (signal
             (concat (signal-value btor230) (signal-value btor1314))
             (list)))
           (btor1316
            (signal
             (concat (signal-value btor232) (signal-value btor1315))
             (list)))
           (btor1317
            (signal
             (concat (signal-value btor233) (signal-value btor1316))
             (list)))
           (btor1318
            (signal
             (concat (signal-value btor234) (signal-value btor1317))
             (list)))
           (btor1319
            (signal
             (concat (signal-value btor235) (signal-value btor1318))
             (list)))
           (btor1320
            (signal
             (concat (signal-value btor1284) (signal-value btor1319))
             (list)))
           (btor1321
            (signal
             (extract 6 4 (signal-value btor936))
             (signal-state btor936)))
           (btor1322
            (bv->signal
             (zero-extend (signal-value btor351) (bitvector 3))
             btor351))
           (btor1323
            (signal
             (bool->bitvector
              (bveq (signal-value btor1321) (signal-value btor1322)))
             (list)))
           (btor1324
            (if (bitvector->bool (signal-value btor1323)) btor1320 btor984))
           (btor1325
            (signal
             (concat (signal-value btor187) (signal-value btor186))
             (list)))
           (btor1326
            (signal
             (concat (signal-value btor198) (signal-value btor1325))
             (list)))
           (btor1327
            (signal
             (concat (signal-value btor209) (signal-value btor1326))
             (list)))
           (btor1328
            (signal
             (concat (signal-value btor220) (signal-value btor1327))
             (list)))
           (btor1329
            (signal
             (concat (signal-value btor231) (signal-value btor1328))
             (list)))
           (btor1330
            (signal
             (concat (signal-value btor236) (signal-value btor1329))
             (list)))
           (btor1331
            (signal
             (concat (signal-value btor237) (signal-value btor1330))
             (list)))
           (btor1332
            (signal
             (concat (signal-value btor238) (signal-value btor1331))
             (list)))
           (btor1333
            (signal
             (concat (signal-value btor239) (signal-value btor1332))
             (list)))
           (btor1334
            (signal
             (concat (signal-value btor188) (signal-value btor1333))
             (list)))
           (btor1335
            (signal
             (concat (signal-value btor189) (signal-value btor1334))
             (list)))
           (btor1336
            (signal
             (concat (signal-value btor190) (signal-value btor1335))
             (list)))
           (btor1337
            (signal
             (concat (signal-value btor191) (signal-value btor1336))
             (list)))
           (btor1338
            (signal
             (concat (signal-value btor192) (signal-value btor1337))
             (list)))
           (btor1339
            (signal
             (concat (signal-value btor193) (signal-value btor1338))
             (list)))
           (btor1340
            (signal
             (concat (signal-value btor194) (signal-value btor1339))
             (list)))
           (btor1341
            (signal
             (concat (signal-value btor195) (signal-value btor1340))
             (list)))
           (btor1342
            (signal
             (concat (signal-value btor196) (signal-value btor1341))
             (list)))
           (btor1343
            (signal
             (concat (signal-value btor197) (signal-value btor1342))
             (list)))
           (btor1344
            (signal
             (concat (signal-value btor199) (signal-value btor1343))
             (list)))
           (btor1345
            (signal
             (concat (signal-value btor200) (signal-value btor1344))
             (list)))
           (btor1346
            (signal
             (concat (signal-value btor201) (signal-value btor1345))
             (list)))
           (btor1347
            (signal
             (concat (signal-value btor202) (signal-value btor1346))
             (list)))
           (btor1348
            (signal
             (concat (signal-value btor203) (signal-value btor1347))
             (list)))
           (btor1349
            (signal
             (concat (signal-value btor204) (signal-value btor1348))
             (list)))
           (btor1350
            (signal
             (concat (signal-value btor205) (signal-value btor1349))
             (list)))
           (btor1351
            (signal
             (concat (signal-value btor206) (signal-value btor1350))
             (list)))
           (btor1352
            (signal
             (concat (signal-value btor207) (signal-value btor1351))
             (list)))
           (btor1353
            (signal
             (concat (signal-value btor208) (signal-value btor1352))
             (list)))
           (btor1354
            (signal
             (concat (signal-value btor210) (signal-value btor1353))
             (list)))
           (btor1355
            (signal
             (concat (signal-value btor211) (signal-value btor1354))
             (list)))
           (btor1356
            (signal
             (concat (signal-value btor212) (signal-value btor1355))
             (list)))
           (btor1357
            (signal
             (concat (signal-value btor213) (signal-value btor1356))
             (list)))
           (btor1358
            (signal
             (concat (signal-value btor214) (signal-value btor1357))
             (list)))
           (btor1359
            (signal
             (concat (signal-value btor215) (signal-value btor1358))
             (list)))
           (btor1360
            (signal
             (concat (signal-value btor216) (signal-value btor1359))
             (list)))
           (btor1361
            (signal
             (concat (signal-value btor217) (signal-value btor1360))
             (list)))
           (btor1362
            (signal
             (concat (signal-value btor218) (signal-value btor1361))
             (list)))
           (btor1363
            (signal
             (concat (signal-value btor219) (signal-value btor1362))
             (list)))
           (btor1364
            (signal
             (concat (signal-value btor221) (signal-value btor1363))
             (list)))
           (btor1365
            (signal
             (concat (signal-value btor222) (signal-value btor1364))
             (list)))
           (btor1366
            (signal
             (concat (signal-value btor223) (signal-value btor1365))
             (list)))
           (btor1367
            (signal
             (concat (signal-value btor224) (signal-value btor1366))
             (list)))
           (btor1368
            (signal
             (concat (signal-value btor225) (signal-value btor1367))
             (list)))
           (btor1369
            (signal
             (concat (signal-value btor226) (signal-value btor1368))
             (list)))
           (btor1370
            (signal
             (concat (signal-value btor227) (signal-value btor1369))
             (list)))
           (btor1371
            (signal
             (concat (signal-value btor228) (signal-value btor1370))
             (list)))
           (btor1372
            (signal
             (concat (signal-value btor229) (signal-value btor1371))
             (list)))
           (btor1373
            (signal
             (concat (signal-value btor230) (signal-value btor1372))
             (list)))
           (btor1374
            (signal
             (concat (signal-value btor232) (signal-value btor1373))
             (list)))
           (btor1375
            (signal
             (concat (signal-value btor233) (signal-value btor1374))
             (list)))
           (btor1376
            (signal
             (concat (signal-value btor234) (signal-value btor1375))
             (list)))
           (btor1377
            (signal
             (concat (signal-value btor235) (signal-value btor1376))
             (list)))
           (btor1378
            (signal
             (concat (signal-value btor345) (signal-value btor1377))
             (list)))
           (btor1379
            (signal
             (extract 26 26 (signal-value btor1183))
             (signal-state btor1183)))
           (btor1380
            (signal
             (bvand (signal-value btor1379) (signal-value btor773))
             (list)))
           (btor1381
            (signal
             (concat (signal-value btor1183) (signal-value btor943))
             (list)))
           (btor1382
            (signal
             (concat (signal-value btor1380) (signal-value btor1381))
             (list)))
           (btor1383
            (bv->signal
             (zero-extend (signal-value btor926) (bitvector 3))
             btor926))
           (btor1384
            (signal
             (bool->bitvector
              (bveq (signal-value btor1321) (signal-value btor1383)))
             (list)))
           (btor1385
            (if (bitvector->bool (signal-value btor1384)) btor1382 btor1378))
           (btor1386
            (bv->signal
             (zero-extend (signal-value btor373) (bitvector 3))
             btor373))
           (btor1387
            (signal
             (bool->bitvector
              (bveq (signal-value btor1321) (signal-value btor1386)))
             (list)))
           (btor1388
            (signal
             (bvor (signal-value btor1387) (signal-value btor1384))
             (list)))
           (btor1389
            (if (bitvector->bool (signal-value btor1388)) btor1385 btor1324))
           (btor1390 (bv->signal (bv 5 (bitvector 3))))
           (btor1391
            (signal
             (bool->bitvector
              (bveq (signal-value btor1321) (signal-value btor1390)))
             (list)))
           (btor1392
            (if (bitvector->bool (signal-value btor1391)) btor804 btor983))
           (btor1393
            (signal
             (extract 53 0 (signal-value btor340))
             (signal-state btor340)))
           (btor1394
            (bv->signal
             (zero-extend (signal-value btor351) (bitvector 54))
             btor351))
           (btor1395
            (signal
             (bvsub (signal-value btor1393) (signal-value btor1394))
             (list)))
           (btor1396 (bv->signal (bv 7 (bitvector 3))))
           (btor1397
            (signal
             (bool->bitvector
              (bveq (signal-value btor1321) (signal-value btor1396)))
             (list)))
           (btor1398
            (if (bitvector->bool (signal-value btor1397)) btor1395 btor1393))
           (btor1399
            (signal
             (concat (signal-value btor598) (signal-value btor1398))
             (list)))
           (btor1400 (bv->signal (bv 6 (bitvector 3))))
           (btor1401
            (signal
             (bool->bitvector
              (bveq (signal-value btor1321) (signal-value btor1400)))
             (list)))
           (btor1402
            (signal
             (bvor (signal-value btor1401) (signal-value btor1397))
             (list)))
           (btor1403
            (if (bitvector->bool (signal-value btor1402)) btor1399 btor1392))
           (btor1404 (bv->signal (bv 4 (bitvector 3))))
           (btor1405
            (signal
             (bool->bitvector
              (bveq (signal-value btor1321) (signal-value btor1404)))
             (list)))
           (btor1406
            (signal
             (concat (signal-value btor1405) (signal-value btor1391))
             (list)))
           (btor1407
            (signal
             (concat (signal-value btor1402) (signal-value btor1406))
             (list)))
           (btor1408
            (signal
             (apply bvor (bitvector->bits (signal-value btor1407)))
             (signal-state btor1407)))
           (btor1409
            (if (bitvector->bool (signal-value btor1408)) btor1403 btor1389))
           (btor1410
            (bv->signal
             (zero-extend (signal-value btor1409) (bitvector 55))
             btor1409))
           (btor1411
            (signal
             (concat (signal-value btor75) (signal-value btor74))
             (list)))
           (btor1412
            (signal
             (concat (signal-value btor86) (signal-value btor1411))
             (list)))
           (btor1413
            (signal
             (concat (signal-value btor97) (signal-value btor1412))
             (list)))
           (btor1414
            (signal
             (concat (signal-value btor108) (signal-value btor1413))
             (list)))
           (btor1415
            (signal
             (concat (signal-value btor119) (signal-value btor1414))
             (list)))
           (btor1416
            (signal
             (concat (signal-value btor124) (signal-value btor1415))
             (list)))
           (btor1417
            (signal
             (concat (signal-value btor125) (signal-value btor1416))
             (list)))
           (btor1418
            (signal
             (concat (signal-value btor126) (signal-value btor1417))
             (list)))
           (btor1419
            (signal
             (concat (signal-value btor127) (signal-value btor1418))
             (list)))
           (btor1420
            (signal
             (concat (signal-value btor76) (signal-value btor1419))
             (list)))
           (btor1421
            (signal
             (concat (signal-value btor77) (signal-value btor1420))
             (list)))
           (btor1422
            (signal
             (concat (signal-value btor78) (signal-value btor1421))
             (list)))
           (btor1423
            (signal
             (concat (signal-value btor79) (signal-value btor1422))
             (list)))
           (btor1424
            (signal
             (concat (signal-value btor80) (signal-value btor1423))
             (list)))
           (btor1425
            (signal
             (concat (signal-value btor81) (signal-value btor1424))
             (list)))
           (btor1426
            (signal
             (concat (signal-value btor82) (signal-value btor1425))
             (list)))
           (btor1427
            (signal
             (concat (signal-value btor83) (signal-value btor1426))
             (list)))
           (btor1428
            (signal
             (concat (signal-value btor84) (signal-value btor1427))
             (list)))
           (btor1429
            (signal
             (concat (signal-value btor85) (signal-value btor1428))
             (list)))
           (btor1430
            (signal
             (concat (signal-value btor87) (signal-value btor1429))
             (list)))
           (btor1431
            (signal
             (concat (signal-value btor88) (signal-value btor1430))
             (list)))
           (btor1432
            (signal
             (concat (signal-value btor89) (signal-value btor1431))
             (list)))
           (btor1433
            (signal
             (concat (signal-value btor90) (signal-value btor1432))
             (list)))
           (btor1434
            (signal
             (concat (signal-value btor91) (signal-value btor1433))
             (list)))
           (btor1435
            (signal
             (concat (signal-value btor92) (signal-value btor1434))
             (list)))
           (btor1436
            (signal
             (concat (signal-value btor93) (signal-value btor1435))
             (list)))
           (btor1437
            (signal
             (concat (signal-value btor94) (signal-value btor1436))
             (list)))
           (btor1438
            (signal
             (concat (signal-value btor95) (signal-value btor1437))
             (list)))
           (btor1439
            (signal
             (concat (signal-value btor96) (signal-value btor1438))
             (list)))
           (btor1440
            (signal
             (concat (signal-value btor98) (signal-value btor1439))
             (list)))
           (btor1441
            (signal
             (concat (signal-value btor99) (signal-value btor1440))
             (list)))
           (btor1442
            (signal
             (concat (signal-value btor100) (signal-value btor1441))
             (list)))
           (btor1443
            (signal
             (concat (signal-value btor101) (signal-value btor1442))
             (list)))
           (btor1444
            (signal
             (concat (signal-value btor102) (signal-value btor1443))
             (list)))
           (btor1445
            (signal
             (concat (signal-value btor103) (signal-value btor1444))
             (list)))
           (btor1446
            (signal
             (concat (signal-value btor104) (signal-value btor1445))
             (list)))
           (btor1447
            (signal
             (concat (signal-value btor105) (signal-value btor1446))
             (list)))
           (btor1448
            (signal
             (concat (signal-value btor106) (signal-value btor1447))
             (list)))
           (btor1449
            (signal
             (concat (signal-value btor107) (signal-value btor1448))
             (list)))
           (btor1450
            (signal
             (concat (signal-value btor109) (signal-value btor1449))
             (list)))
           (btor1451
            (signal
             (concat (signal-value btor110) (signal-value btor1450))
             (list)))
           (btor1452
            (signal
             (concat (signal-value btor111) (signal-value btor1451))
             (list)))
           (btor1453
            (signal
             (concat (signal-value btor112) (signal-value btor1452))
             (list)))
           (btor1454
            (signal
             (concat (signal-value btor113) (signal-value btor1453))
             (list)))
           (btor1455
            (signal
             (concat (signal-value btor114) (signal-value btor1454))
             (list)))
           (btor1456
            (signal
             (concat (signal-value btor115) (signal-value btor1455))
             (list)))
           (btor1457
            (signal
             (concat (signal-value btor116) (signal-value btor1456))
             (list)))
           (btor1458
            (signal
             (concat (signal-value btor117) (signal-value btor1457))
             (list)))
           (btor1459
            (signal
             (concat (signal-value btor118) (signal-value btor1458))
             (list)))
           (btor1460
            (signal
             (concat (signal-value btor120) (signal-value btor1459))
             (list)))
           (btor1461
            (signal
             (concat (signal-value btor121) (signal-value btor1460))
             (list)))
           (btor1462
            (signal
             (concat (signal-value btor122) (signal-value btor1461))
             (list)))
           (btor1463
            (signal
             (concat (signal-value btor123) (signal-value btor1462))
             (list)))
           (btor1464
            (bv->signal
             (zero-extend (signal-value btor1463) (bitvector 54))
             btor1463))
           (btor1465
            (bv->signal
             (zero-extend (signal-value btor943) (bitvector 27))
             btor943))
           (btor1466
            (bv->signal
             (zero-extend (signal-value btor1183) (bitvector 27))
             btor1183))
           (btor1467
            (signal
             (concat (signal-value btor1183) (signal-value btor943))
             (list)))
           (btor1468
            (bv->signal
             (zero-extend (signal-value btor1467) (bitvector 54))
             btor1467))
           (btor1469
            (bv->signal
             (zero-extend (signal-value btor943) (bitvector 27))
             btor943))
           (btor1470
            (bv->signal
             (zero-extend (signal-value btor1183) (bitvector 27))
             btor1183))
           (btor1471
            (bv->signal
             (zero-extend (signal-value btor943) (bitvector 27))
             btor943))
           (btor1472
            (bv->signal
             (zero-extend (signal-value btor1183) (bitvector 27))
             btor1183))
           (btor1473 (bv->signal (bv 17 (bitvector 5))))
           (btor1474
            (signal
             (bool->bitvector
              (bveq (signal-value btor337) (signal-value btor1473)))
             (list)))
           (btor1475
            (if (bitvector->bool (signal-value btor1474)) btor131 btor128))
           (btor1476 (bv->signal (bv 16 (bitvector 5))))
           (btor1477
            (signal
             (bool->bitvector
              (bveq (signal-value btor337) (signal-value btor1476)))
             (list)))
           (btor1478
            (if (bitvector->bool (signal-value btor1477)) btor130 btor1475))
           (btor1479 (bv->signal (bv 15 (bitvector 4))))
           (btor1480
            (bv->signal
             (zero-extend (signal-value btor1479) (bitvector 5))
             btor1479))
           (btor1481
            (signal
             (bool->bitvector
              (bveq (signal-value btor337) (signal-value btor1480)))
             (list)))
           (btor1482
            (if (bitvector->bool (signal-value btor1481)) btor129 btor1478))
           (btor1483
            (bv->signal
             (zero-extend (signal-value btor351) (bitvector 5))
             btor351))
           (btor1484
            (signal
             (bool->bitvector
              (bveq (signal-value btor337) (signal-value btor1483)))
             (list)))
           (btor1485
            (if (bitvector->bool (signal-value btor1484)) btor128 btor1482))
           (btor1486
            (bv->signal
             (zero-extend (signal-value btor1485) (bitvector 1))
             btor1485))
           (btor1487
            (bv->signal
             (zero-extend (signal-value btor370) (bitvector 1))
             btor370))
           (btor1488
            (bv->signal
             (zero-extend (signal-value btor480) (bitvector 54))
             btor480))
           (btor1489
            (bv->signal
             (zero-extend (signal-value btor375) (bitvector 54))
             btor375))
           (btor1490 (bv->signal (bv 20 (bitvector 5))))
           (btor1491
            (signal
             (bool->bitvector
              (bveq (signal-value btor339) (signal-value btor1490)))
             (list)))
           (btor1492
            (if (bitvector->bool (signal-value btor1491)) btor344 btor341))
           (btor1493 (bv->signal (bv 19 (bitvector 5))))
           (btor1494
            (signal
             (bool->bitvector
              (bveq (signal-value btor339) (signal-value btor1493)))
             (list)))
           (btor1495
            (if (bitvector->bool (signal-value btor1494)) btor343 btor1492))
           (btor1496 (bv->signal (bv 18 (bitvector 5))))
           (btor1497
            (signal
             (bool->bitvector
              (bveq (signal-value btor339) (signal-value btor1496)))
             (list)))
           (btor1498
            (if (bitvector->bool (signal-value btor1497)) btor342 btor1495))
           (btor1499
            (bv->signal
             (zero-extend (signal-value btor373) (bitvector 5))
             btor373))
           (btor1500
            (signal
             (bool->bitvector
              (bveq (signal-value btor339) (signal-value btor1499)))
             (list)))
           (btor1501
            (if (bitvector->bool (signal-value btor1500)) btor341 btor1498))
           (btor1502
            (bv->signal
             (zero-extend (signal-value btor1501) (bitvector 1))
             btor1501))
           (btor1503
            (bv->signal
             (zero-extend (signal-value btor477) (bitvector 54))
             btor477))
           (btor1504
            (bv->signal
             (zero-extend (signal-value btor375) (bitvector 54))
             btor375))
           (btor1505
            (bv->signal
             (zero-extend (signal-value btor1320) (bitvector 55))
             btor1320))
           (btor1506
            (signal
             (concat (signal-value btor187) (signal-value btor186))
             (list)))
           (btor1507
            (signal
             (concat (signal-value btor198) (signal-value btor1506))
             (list)))
           (btor1508
            (signal
             (concat (signal-value btor209) (signal-value btor1507))
             (list)))
           (btor1509
            (signal
             (concat (signal-value btor220) (signal-value btor1508))
             (list)))
           (btor1510
            (signal
             (concat (signal-value btor231) (signal-value btor1509))
             (list)))
           (btor1511
            (signal
             (concat (signal-value btor236) (signal-value btor1510))
             (list)))
           (btor1512
            (signal
             (concat (signal-value btor237) (signal-value btor1511))
             (list)))
           (btor1513
            (signal
             (concat (signal-value btor238) (signal-value btor1512))
             (list)))
           (btor1514
            (signal
             (concat (signal-value btor239) (signal-value btor1513))
             (list)))
           (btor1515
            (signal
             (concat (signal-value btor188) (signal-value btor1514))
             (list)))
           (btor1516
            (signal
             (concat (signal-value btor189) (signal-value btor1515))
             (list)))
           (btor1517
            (signal
             (concat (signal-value btor190) (signal-value btor1516))
             (list)))
           (btor1518
            (signal
             (concat (signal-value btor191) (signal-value btor1517))
             (list)))
           (btor1519
            (signal
             (concat (signal-value btor192) (signal-value btor1518))
             (list)))
           (btor1520
            (signal
             (concat (signal-value btor193) (signal-value btor1519))
             (list)))
           (btor1521
            (signal
             (concat (signal-value btor194) (signal-value btor1520))
             (list)))
           (btor1522
            (signal
             (concat (signal-value btor195) (signal-value btor1521))
             (list)))
           (btor1523
            (signal
             (concat (signal-value btor196) (signal-value btor1522))
             (list)))
           (btor1524
            (signal
             (concat (signal-value btor197) (signal-value btor1523))
             (list)))
           (btor1525
            (signal
             (concat (signal-value btor199) (signal-value btor1524))
             (list)))
           (btor1526
            (signal
             (concat (signal-value btor200) (signal-value btor1525))
             (list)))
           (btor1527
            (signal
             (concat (signal-value btor201) (signal-value btor1526))
             (list)))
           (btor1528
            (signal
             (concat (signal-value btor202) (signal-value btor1527))
             (list)))
           (btor1529
            (signal
             (concat (signal-value btor203) (signal-value btor1528))
             (list)))
           (btor1530
            (signal
             (concat (signal-value btor204) (signal-value btor1529))
             (list)))
           (btor1531
            (signal
             (concat (signal-value btor205) (signal-value btor1530))
             (list)))
           (btor1532
            (signal
             (concat (signal-value btor206) (signal-value btor1531))
             (list)))
           (btor1533
            (signal
             (concat (signal-value btor207) (signal-value btor1532))
             (list)))
           (btor1534
            (signal
             (concat (signal-value btor208) (signal-value btor1533))
             (list)))
           (btor1535
            (signal
             (concat (signal-value btor210) (signal-value btor1534))
             (list)))
           (btor1536
            (signal
             (concat (signal-value btor211) (signal-value btor1535))
             (list)))
           (btor1537
            (signal
             (concat (signal-value btor212) (signal-value btor1536))
             (list)))
           (btor1538
            (signal
             (concat (signal-value btor213) (signal-value btor1537))
             (list)))
           (btor1539
            (signal
             (concat (signal-value btor214) (signal-value btor1538))
             (list)))
           (btor1540
            (signal
             (concat (signal-value btor215) (signal-value btor1539))
             (list)))
           (btor1541
            (signal
             (concat (signal-value btor216) (signal-value btor1540))
             (list)))
           (btor1542
            (signal
             (concat (signal-value btor217) (signal-value btor1541))
             (list)))
           (btor1543
            (signal
             (concat (signal-value btor218) (signal-value btor1542))
             (list)))
           (btor1544
            (signal
             (concat (signal-value btor219) (signal-value btor1543))
             (list)))
           (btor1545
            (signal
             (concat (signal-value btor221) (signal-value btor1544))
             (list)))
           (btor1546
            (signal
             (concat (signal-value btor222) (signal-value btor1545))
             (list)))
           (btor1547
            (signal
             (concat (signal-value btor223) (signal-value btor1546))
             (list)))
           (btor1548
            (signal
             (concat (signal-value btor224) (signal-value btor1547))
             (list)))
           (btor1549
            (signal
             (concat (signal-value btor225) (signal-value btor1548))
             (list)))
           (btor1550
            (signal
             (concat (signal-value btor226) (signal-value btor1549))
             (list)))
           (btor1551
            (signal
             (concat (signal-value btor227) (signal-value btor1550))
             (list)))
           (btor1552
            (signal
             (concat (signal-value btor228) (signal-value btor1551))
             (list)))
           (btor1553
            (signal
             (concat (signal-value btor229) (signal-value btor1552))
             (list)))
           (btor1554
            (signal
             (concat (signal-value btor230) (signal-value btor1553))
             (list)))
           (btor1555
            (signal
             (concat (signal-value btor232) (signal-value btor1554))
             (list)))
           (btor1556
            (signal
             (concat (signal-value btor233) (signal-value btor1555))
             (list)))
           (btor1557
            (signal
             (concat (signal-value btor234) (signal-value btor1556))
             (list)))
           (btor1558
            (signal
             (concat (signal-value btor235) (signal-value btor1557))
             (list)))
           (btor1559
            (bv->signal
             (zero-extend (signal-value btor1558) (bitvector 54))
             btor1558))
           (btor1560
            (bv->signal
             (zero-extend (signal-value btor480) (bitvector 54))
             btor480))
           (btor1561
            (signal
             (bvand (signal-value btor1228) (signal-value btor1409))
             (list)))
           (btor1562 (signal (bvnot (signal-value btor1561)) (list)))
           (btor1563
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1563")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1563"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1563")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1563")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 3))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1564
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1564")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1564"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1564")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1564")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 3))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1565
            (if (bitvector->bool (signal-value btor594)) btor1564 btor1563))
           (btor1566
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1566")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1566"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1566")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1566")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 3))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1567
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1567")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1567"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1567")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1567")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 3))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1568
            (if (bitvector->bool (signal-value btor603)) btor1567 btor1566))
           (btor1569
            (signal
             (bvxor (signal-value btor1565) (signal-value btor1568))
             (list)))
           (btor1570
            (signal
             (concat (signal-value btor1569) (signal-value btor876))
             (list)))
           (btor1571
            (signal
             (apply bvor (bitvector->bits (signal-value btor1570)))
             (signal-state btor1570)))
           (btor1572 (signal (bvnot (signal-value btor1571)) (list)))
           (btor1573
            (if (bitvector->bool (signal-value btor1572)) btor1562 btor984))
           (btor1574
            (signal
             (bvadd (signal-value btor989) (signal-value btor1228))
             (list)))
           (btor1575
            (signal
             (bvadd (signal-value btor1574) (signal-value btor1409))
             (list)))
           (btor1576
            (bv->signal
             (zero-extend (signal-value btor1404) (bitvector 4))
             btor1404))
           (btor1577
            (signal
             (bool->bitvector
              (bveq (signal-value btor1570) (signal-value btor1576)))
             (list)))
           (btor1578
            (if (bitvector->bool (signal-value btor1577)) btor1575 btor1573))
           (btor1579
            (signal
             (bvsub (signal-value btor989) (signal-value btor1228))
             (list)))
           (btor1580
            (signal
             (bvadd (signal-value btor1579) (signal-value btor1409))
             (list)))
           (btor1581
            (signal
             (bvsub (signal-value btor1574) (signal-value btor1409))
             (list)))
           (btor1582
            (bv->signal
             (zero-extend (signal-value btor1400) (bitvector 4))
             btor1400))
           (btor1583
            (signal
             (bool->bitvector
              (bveq (signal-value btor1570) (signal-value btor1582)))
             (list)))
           (btor1584
            (if (bitvector->bool (signal-value btor1583)) btor1581 btor1580))
           (btor1585
            (signal
             (bvsub (signal-value btor1579) (signal-value btor1409))
             (list)))
           (btor1586
            (bv->signal
             (zero-extend (signal-value btor1396) (bitvector 4))
             btor1396))
           (btor1587
            (signal
             (bool->bitvector
              (bveq (signal-value btor1570) (signal-value btor1586)))
             (list)))
           (btor1588
            (if (bitvector->bool (signal-value btor1587)) btor1585 btor1584))
           (btor1589
            (bv->signal
             (zero-extend (signal-value btor1390) (bitvector 4))
             btor1390))
           (btor1590
            (signal
             (bool->bitvector
              (bveq (signal-value btor1570) (signal-value btor1589)))
             (list)))
           (btor1591
            (signal
             (concat (signal-value btor1583) (signal-value btor1587))
             (list)))
           (btor1592
            (signal
             (concat (signal-value btor1590) (signal-value btor1591))
             (list)))
           (btor1593
            (signal
             (apply bvor (bitvector->bits (signal-value btor1592)))
             (signal-state btor1592)))
           (btor1594
            (if (bitvector->bool (signal-value btor1593)) btor1588 btor1578))
           (btor1595
            (signal
             ((lambda (a b) (bvnot (bvxor a b)))
              (signal-value btor1228)
              (signal-value btor1409))
             (list)))
           (btor1596
            (signal
             (bvxor (signal-value btor1228) (signal-value btor1409))
             (list)))
           (btor1597
            (signal
             (bool->bitvector
              (bveq (signal-value btor1570) (signal-value btor355)))
             (list)))
           (btor1598
            (if (bitvector->bool (signal-value btor1597)) btor1596 btor1595))
           (btor1599 (bv->signal (bv 8 (bitvector 4))))
           (btor1600
            (signal
             (bool->bitvector
              (bveq (signal-value btor1570) (signal-value btor1599)))
             (list)))
           (btor1601
            (if (bitvector->bool (signal-value btor1600)) btor1561 btor1598))
           (btor1602
            (signal
             (bvor (signal-value btor1228) (signal-value btor1409))
             (list)))
           (btor1603 (signal (bvnot (signal-value btor1602)) (list)))
           (btor1604
            (signal
             (bool->bitvector
              (bveq (signal-value btor1570) (signal-value btor367)))
             (list)))
           (btor1605
            (if (bitvector->bool (signal-value btor1604)) btor1603 btor1602))
           (btor1606
            (bv->signal
             (zero-extend (signal-value btor926) (bitvector 4))
             btor926))
           (btor1607
            (signal
             (bool->bitvector
              (bveq (signal-value btor1570) (signal-value btor1606)))
             (list)))
           (btor1608
            (signal
             (bvor (signal-value btor1607) (signal-value btor1604))
             (list)))
           (btor1609
            (if (bitvector->bool (signal-value btor1608)) btor1605 btor1601))
           (btor1610
            (signal
             (bool->bitvector
              (bveq (signal-value btor1570) (signal-value btor363)))
             (list)))
           (btor1611
            (signal
             (concat (signal-value btor1597) (signal-value btor1600))
             (list)))
           (btor1612
            (signal
             (concat (signal-value btor1610) (signal-value btor1611))
             (list)))
           (btor1613
            (signal
             (concat (signal-value btor1608) (signal-value btor1612))
             (list)))
           (btor1614
            (signal
             (apply bvor (bitvector->bits (signal-value btor1613)))
             (signal-state btor1613)))
           (btor1615
            (if (bitvector->bool (signal-value btor1614)) btor1609 btor1594))
           (btor1616
            (signal
             (extract 54 0 (signal-value btor284))
             (signal-state btor284)))
           (btor1617 (signal (bvnot (signal-value btor1616)) (list)))
           (btor1618
            (signal
             (bvand (signal-value btor1615) (signal-value btor1617))
             (list)))
           (btor1619
            (signal
             (apply bvor (bitvector->bits (signal-value btor1618)))
             (signal-state btor1618)))
           (btor1620 (signal (bvnot (signal-value btor1619)) (list)))
           (btor1621
            (signal
             (bvor (signal-value btor1615) (signal-value btor1616))
             (list)))
           (btor1622
            (signal
             (apply bvand (bitvector->bits (signal-value btor1621)))
             (signal-state btor1621)))
           (btor1623
            (signal
             (bvor (signal-value btor1620) (signal-value btor1622))
             (list)))
           (btor1624 (signal (bvnot (signal-value btor1623)) (list)))
           (btor1625
            (bv->signal
             (zero-extend (signal-value btor1624) (bitvector 1))
             btor1624))
           (btor1626
            (bv->signal
             (zero-extend (signal-value btor605) (bitvector 1))
             btor605))
           (btor1627
            (bv->signal
             (zero-extend (signal-value btor605) (bitvector 1))
             btor605))
           (btor1628
            (bv->signal
             (zero-extend (signal-value btor1622) (bitvector 1))
             btor1622))
           (btor1629
            (bv->signal
             (zero-extend (signal-value btor605) (bitvector 1))
             btor605))
           (btor1630
            (bv->signal
             (zero-extend (signal-value btor604) (bitvector 1))
             btor604))
           (btor1631
            (bv->signal
             (zero-extend (signal-value btor595) (bitvector 1))
             btor595))
           (btor1632
            (bv->signal
             (zero-extend (signal-value btor613) (bitvector 1))
             btor613))
           (btor1633
            (bv->signal
             (zero-extend (signal-value btor613) (bitvector 1))
             btor613))
           (btor1634
            (signal
             (extract 53 0 (signal-value btor1615))
             (signal-state btor1615)))
           (btor1635
            (signal
             (extract 53 0 (signal-value btor323))
             (signal-state btor323)))
           (btor1636 (bv->signal (bv 23 (bitvector 5))))
           (btor1637
            (signal
             (bool->bitvector
              (bveq (signal-value btor324) (signal-value btor1636)))
             (list)))
           (btor1638
            (if (bitvector->bool (signal-value btor1637)) btor1635 btor1467))
           (btor1639
            (signal
             (bvxor (signal-value btor1634) (signal-value btor1638))
             (list)))
           (btor1640 (signal (bvnot (signal-value btor1639)) (list)))
           (btor1641
            (signal
             (extract 53 0 (signal-value btor285))
             (signal-state btor285)))
           (btor1642
            (signal
             (bool->bitvector
              (bveq (signal-value btor286) (signal-value btor1636)))
             (list)))
           (btor1643
            (if (bitvector->bool (signal-value btor1642)) btor1641 btor1467))
           (btor1644
            (signal
             (bvor (signal-value btor1640) (signal-value btor1643))
             (list)))
           (btor1645
            (signal
             (apply bvand (bitvector->bits (signal-value btor1644)))
             (signal-state btor1644)))
           (btor1646
            (bv->signal
             (zero-extend (signal-value btor1645) (bitvector 1))
             btor1645))
           (btor1647
            (bv->signal
             (zero-extend (signal-value btor613) (bitvector 1))
             btor613))
           (btor1648
            (bv->signal
             (zero-extend (signal-value btor612) (bitvector 1))
             btor612))
           (btor1649
            (bv->signal
             (zero-extend (signal-value btor609) (bitvector 1))
             btor609))
           (btor1650
            (bv->signal
             (zero-extend (signal-value btor621) (bitvector 1))
             btor621))
           (btor1651
            (bv->signal
             (zero-extend (signal-value btor621) (bitvector 1))
             btor621))
           (btor1652
            (signal
             (bvor (signal-value btor1639) (signal-value btor1643))
             (list)))
           (btor1653
            (signal
             (apply bvand (bitvector->bits (signal-value btor1652)))
             (signal-state btor1652)))
           (btor1654
            (bv->signal
             (zero-extend (signal-value btor1653) (bitvector 1))
             btor1653))
           (btor1655
            (bv->signal
             (zero-extend (signal-value btor621) (bitvector 1))
             btor621))
           (btor1656
            (bv->signal
             (zero-extend (signal-value btor620) (bitvector 1))
             btor620))
           (btor1657
            (bv->signal
             (zero-extend (signal-value btor617) (bitvector 1))
             btor617))
           (btor1658
            (bv->signal
             (zero-extend (signal-value btor629) (bitvector 1))
             btor629))
           (btor1659
            (bv->signal
             (zero-extend (signal-value btor629) (bitvector 1))
             btor629))
           (btor1660
            (signal
             (apply bvor (bitvector->bits (signal-value btor1634)))
             (signal-state btor1634)))
           (btor1661 (signal (bvnot (signal-value btor1660)) (list)))
           (btor1662
            (bv->signal
             (zero-extend (signal-value btor1661) (bitvector 1))
             btor1661))
           (btor1663
            (bv->signal
             (zero-extend (signal-value btor629) (bitvector 1))
             btor629))
           (btor1664
            (bv->signal
             (zero-extend (signal-value btor628) (bitvector 1))
             btor628))
           (btor1665
            (bv->signal
             (zero-extend (signal-value btor625) (bitvector 1))
             btor625))
           (btor1666
            (bv->signal
             (zero-extend (signal-value btor637) (bitvector 1))
             btor637))
           (btor1667
            (bv->signal
             (zero-extend (signal-value btor637) (bitvector 1))
             btor637))
           (btor1668
            (bv->signal
             (zero-extend (signal-value btor1620) (bitvector 1))
             btor1620))
           (btor1669
            (bv->signal
             (zero-extend (signal-value btor637) (bitvector 1))
             btor637))
           (btor1670
            (bv->signal
             (zero-extend (signal-value btor636) (bitvector 1))
             btor636))
           (btor1671
            (bv->signal
             (zero-extend (signal-value btor633) (bitvector 1))
             btor633))
           (btor1672
            (bv->signal
             (zero-extend (signal-value btor128) (bitvector 1))
             btor128))
           (btor1673
            (bv->signal
             (zero-extend (signal-value btor240) (bitvector 1))
             btor240))
           (btor1674
            (bv->signal
             (zero-extend (signal-value btor341) (bitvector 1))
             btor341))
           (btor1675
            (bv->signal
             (zero-extend (signal-value btor128) (bitvector 1))
             btor128))
           (btor1676
            (bv->signal
             (zero-extend (signal-value btor128) (bitvector 1))
             btor128))
           (btor1677
            (bv->signal
             (zero-extend (signal-value btor240) (bitvector 1))
             btor240))
           (btor1678
            (bv->signal
             (zero-extend (signal-value btor240) (bitvector 1))
             btor240))
           (btor1679
            (bv->signal
             (zero-extend (signal-value btor341) (bitvector 1))
             btor341))
           (btor1680
            (bv->signal
             (zero-extend (signal-value btor341) (bitvector 1))
             btor341))
           (btor1681
            (signal
             (concat (signal-value btor248) (signal-value btor247))
             (list)))
           (btor1682
            (signal
             (concat (signal-value btor259) (signal-value btor1681))
             (list)))
           (btor1683
            (signal
             (concat (signal-value btor270) (signal-value btor1682))
             (list)))
           (btor1684
            (signal
             (concat (signal-value btor277) (signal-value btor1683))
             (list)))
           (btor1685
            (signal
             (concat (signal-value btor278) (signal-value btor1684))
             (list)))
           (btor1686
            (signal
             (concat (signal-value btor279) (signal-value btor1685))
             (list)))
           (btor1687
            (signal
             (concat (signal-value btor280) (signal-value btor1686))
             (list)))
           (btor1688
            (signal
             (concat (signal-value btor281) (signal-value btor1687))
             (list)))
           (btor1689
            (signal
             (concat (signal-value btor282) (signal-value btor1688))
             (list)))
           (btor1690
            (signal
             (concat (signal-value btor249) (signal-value btor1689))
             (list)))
           (btor1691
            (signal
             (concat (signal-value btor250) (signal-value btor1690))
             (list)))
           (btor1692
            (signal
             (concat (signal-value btor251) (signal-value btor1691))
             (list)))
           (btor1693
            (signal
             (concat (signal-value btor252) (signal-value btor1692))
             (list)))
           (btor1694
            (signal
             (concat (signal-value btor253) (signal-value btor1693))
             (list)))
           (btor1695
            (signal
             (concat (signal-value btor254) (signal-value btor1694))
             (list)))
           (btor1696
            (signal
             (concat (signal-value btor255) (signal-value btor1695))
             (list)))
           (btor1697
            (signal
             (concat (signal-value btor256) (signal-value btor1696))
             (list)))
           (btor1698
            (signal
             (concat (signal-value btor257) (signal-value btor1697))
             (list)))
           (btor1699
            (signal
             (concat (signal-value btor258) (signal-value btor1698))
             (list)))
           (btor1700
            (signal
             (concat (signal-value btor260) (signal-value btor1699))
             (list)))
           (btor1701
            (signal
             (concat (signal-value btor261) (signal-value btor1700))
             (list)))
           (btor1702
            (signal
             (concat (signal-value btor262) (signal-value btor1701))
             (list)))
           (btor1703
            (signal
             (concat (signal-value btor263) (signal-value btor1702))
             (list)))
           (btor1704
            (signal
             (concat (signal-value btor264) (signal-value btor1703))
             (list)))
           (btor1705
            (signal
             (concat (signal-value btor265) (signal-value btor1704))
             (list)))
           (btor1706
            (signal
             (concat (signal-value btor266) (signal-value btor1705))
             (list)))
           (btor1707
            (signal
             (concat (signal-value btor267) (signal-value btor1706))
             (list)))
           (btor1708
            (signal
             (concat (signal-value btor268) (signal-value btor1707))
             (list)))
           (btor1709
            (signal
             (concat (signal-value btor269) (signal-value btor1708))
             (list)))
           (btor1710
            (signal
             (concat (signal-value btor271) (signal-value btor1709))
             (list)))
           (btor1711
            (signal
             (concat (signal-value btor272) (signal-value btor1710))
             (list)))
           (btor1712
            (signal
             (concat (signal-value btor273) (signal-value btor1711))
             (list)))
           (btor1713
            (signal
             (concat (signal-value btor274) (signal-value btor1712))
             (list)))
           (btor1714
            (signal
             (concat (signal-value btor275) (signal-value btor1713))
             (list)))
           (btor1715
            (signal
             (concat (signal-value btor276) (signal-value btor1714))
             (list)))
           (btor1716
            (bv->signal
             (zero-extend (signal-value btor1715) (bitvector 36))
             btor1715))
           (btor1717
            (bv->signal
             (zero-extend (signal-value btor929) (bitvector 55))
             btor929))
           (btor1718
            (bv->signal
             (zero-extend (signal-value btor1616) (bitvector 55))
             btor1616))
           (btor1719
            (bv->signal
             (zero-extend (signal-value btor1643) (bitvector 54))
             btor1643))
           (btor1720
            (bv->signal
             (zero-extend (signal-value btor1641) (bitvector 54))
             btor1641))
           (btor1721
            (signal
             (concat (signal-value btor287) (signal-value btor1027))
             (list)))
           (btor1722
            (signal
             (concat (signal-value btor288) (signal-value btor1721))
             (list)))
           (btor1723
            (signal
             (concat (signal-value btor299) (signal-value btor1722))
             (list)))
           (btor1724
            (signal
             (concat (signal-value btor310) (signal-value btor1723))
             (list)))
           (btor1725
            (signal
             (concat (signal-value btor317) (signal-value btor1724))
             (list)))
           (btor1726
            (signal
             (concat (signal-value btor318) (signal-value btor1725))
             (list)))
           (btor1727
            (signal
             (concat (signal-value btor319) (signal-value btor1726))
             (list)))
           (btor1728
            (signal
             (concat (signal-value btor320) (signal-value btor1727))
             (list)))
           (btor1729
            (signal
             (concat (signal-value btor321) (signal-value btor1728))
             (list)))
           (btor1730
            (signal
             (concat (signal-value btor322) (signal-value btor1729))
             (list)))
           (btor1731
            (signal
             (concat (signal-value btor289) (signal-value btor1730))
             (list)))
           (btor1732
            (signal
             (concat (signal-value btor290) (signal-value btor1731))
             (list)))
           (btor1733
            (signal
             (concat (signal-value btor291) (signal-value btor1732))
             (list)))
           (btor1734
            (signal
             (concat (signal-value btor292) (signal-value btor1733))
             (list)))
           (btor1735
            (signal
             (concat (signal-value btor293) (signal-value btor1734))
             (list)))
           (btor1736
            (signal
             (concat (signal-value btor294) (signal-value btor1735))
             (list)))
           (btor1737
            (signal
             (concat (signal-value btor295) (signal-value btor1736))
             (list)))
           (btor1738
            (signal
             (concat (signal-value btor296) (signal-value btor1737))
             (list)))
           (btor1739
            (signal
             (concat (signal-value btor297) (signal-value btor1738))
             (list)))
           (btor1740
            (signal
             (concat (signal-value btor298) (signal-value btor1739))
             (list)))
           (btor1741
            (signal
             (concat (signal-value btor300) (signal-value btor1740))
             (list)))
           (btor1742
            (signal
             (concat (signal-value btor301) (signal-value btor1741))
             (list)))
           (btor1743
            (signal
             (concat (signal-value btor302) (signal-value btor1742))
             (list)))
           (btor1744
            (signal
             (concat (signal-value btor303) (signal-value btor1743))
             (list)))
           (btor1745
            (signal
             (concat (signal-value btor304) (signal-value btor1744))
             (list)))
           (btor1746
            (signal
             (concat (signal-value btor305) (signal-value btor1745))
             (list)))
           (btor1747
            (signal
             (concat (signal-value btor306) (signal-value btor1746))
             (list)))
           (btor1748
            (signal
             (concat (signal-value btor307) (signal-value btor1747))
             (list)))
           (btor1749
            (signal
             (concat (signal-value btor308) (signal-value btor1748))
             (list)))
           (btor1750
            (signal
             (concat (signal-value btor309) (signal-value btor1749))
             (list)))
           (btor1751
            (signal
             (concat (signal-value btor311) (signal-value btor1750))
             (list)))
           (btor1752
            (signal
             (concat (signal-value btor312) (signal-value btor1751))
             (list)))
           (btor1753
            (signal
             (concat (signal-value btor313) (signal-value btor1752))
             (list)))
           (btor1754
            (signal
             (concat (signal-value btor314) (signal-value btor1753))
             (list)))
           (btor1755
            (signal
             (concat (signal-value btor315) (signal-value btor1754))
             (list)))
           (btor1756
            (signal
             (concat (signal-value btor316) (signal-value btor1755))
             (list)))
           (btor1757
            (bv->signal
             (zero-extend (signal-value btor1756) (bitvector 54))
             btor1756))
           (btor1758
            (signal
             (concat (signal-value btor288) (signal-value btor287))
             (list)))
           (btor1759
            (signal
             (concat (signal-value btor299) (signal-value btor1758))
             (list)))
           (btor1760
            (signal
             (concat (signal-value btor310) (signal-value btor1759))
             (list)))
           (btor1761
            (signal
             (concat (signal-value btor317) (signal-value btor1760))
             (list)))
           (btor1762
            (signal
             (concat (signal-value btor318) (signal-value btor1761))
             (list)))
           (btor1763
            (signal
             (concat (signal-value btor319) (signal-value btor1762))
             (list)))
           (btor1764
            (signal
             (concat (signal-value btor320) (signal-value btor1763))
             (list)))
           (btor1765
            (signal
             (concat (signal-value btor321) (signal-value btor1764))
             (list)))
           (btor1766
            (signal
             (concat (signal-value btor322) (signal-value btor1765))
             (list)))
           (btor1767
            (signal
             (concat (signal-value btor289) (signal-value btor1766))
             (list)))
           (btor1768
            (signal
             (concat (signal-value btor290) (signal-value btor1767))
             (list)))
           (btor1769
            (signal
             (concat (signal-value btor291) (signal-value btor1768))
             (list)))
           (btor1770
            (signal
             (concat (signal-value btor292) (signal-value btor1769))
             (list)))
           (btor1771
            (signal
             (concat (signal-value btor293) (signal-value btor1770))
             (list)))
           (btor1772
            (signal
             (concat (signal-value btor294) (signal-value btor1771))
             (list)))
           (btor1773
            (signal
             (concat (signal-value btor295) (signal-value btor1772))
             (list)))
           (btor1774
            (signal
             (concat (signal-value btor296) (signal-value btor1773))
             (list)))
           (btor1775
            (signal
             (concat (signal-value btor297) (signal-value btor1774))
             (list)))
           (btor1776
            (signal
             (concat (signal-value btor298) (signal-value btor1775))
             (list)))
           (btor1777
            (signal
             (concat (signal-value btor300) (signal-value btor1776))
             (list)))
           (btor1778
            (signal
             (concat (signal-value btor301) (signal-value btor1777))
             (list)))
           (btor1779
            (signal
             (concat (signal-value btor302) (signal-value btor1778))
             (list)))
           (btor1780
            (signal
             (concat (signal-value btor303) (signal-value btor1779))
             (list)))
           (btor1781
            (signal
             (concat (signal-value btor304) (signal-value btor1780))
             (list)))
           (btor1782
            (signal
             (concat (signal-value btor305) (signal-value btor1781))
             (list)))
           (btor1783
            (signal
             (concat (signal-value btor306) (signal-value btor1782))
             (list)))
           (btor1784
            (signal
             (concat (signal-value btor307) (signal-value btor1783))
             (list)))
           (btor1785
            (signal
             (concat (signal-value btor308) (signal-value btor1784))
             (list)))
           (btor1786
            (signal
             (concat (signal-value btor309) (signal-value btor1785))
             (list)))
           (btor1787
            (signal
             (concat (signal-value btor311) (signal-value btor1786))
             (list)))
           (btor1788
            (signal
             (concat (signal-value btor312) (signal-value btor1787))
             (list)))
           (btor1789
            (signal
             (concat (signal-value btor313) (signal-value btor1788))
             (list)))
           (btor1790
            (signal
             (concat (signal-value btor314) (signal-value btor1789))
             (list)))
           (btor1791
            (signal
             (concat (signal-value btor315) (signal-value btor1790))
             (list)))
           (btor1792
            (signal
             (concat (signal-value btor316) (signal-value btor1791))
             (list)))
           (btor1793
            (bv->signal
             (zero-extend (signal-value btor1792) (bitvector 36))
             btor1792))
           (btor1794
            (bv->signal
             (zero-extend (signal-value btor1176) (bitvector 55))
             btor1176))
           (btor1795
            (bv->signal
             (zero-extend (signal-value btor1638) (bitvector 54))
             btor1638))
           (btor1796
            (bv->signal
             (zero-extend (signal-value btor1635) (bitvector 54))
             btor1635))
           (btor1797
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1797")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1797"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1797")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1797")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 3))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1798
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1798")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1798"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1798")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1798")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 3))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1799
            (if (bitvector->bool (signal-value btor594)) btor1798 btor1797))
           (btor1800
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1800")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1800"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1800")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1800")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 3))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1801
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1801")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1801"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1801")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1801")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 3))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1802
            (if (bitvector->bool (signal-value btor603)) btor1801 btor1800))
           (btor1803
            (signal
             (bvxor (signal-value btor1799) (signal-value btor1802))
             (list)))
           (btor1804
            (bv->signal
             (zero-extend (signal-value btor1803) (bitvector 3))
             btor1803))
           (btor1805
            (bv->signal
             (zero-extend (signal-value btor1803) (bitvector 3))
             btor1803))
           (btor1806
            (bv->signal
             (zero-extend (signal-value btor1802) (bitvector 3))
             btor1802))
           (btor1807
            (bv->signal
             (zero-extend (signal-value btor1799) (bitvector 3))
             btor1799))
           (btor1808
            (bv->signal
             (zero-extend (signal-value btor1569) (bitvector 3))
             btor1569))
           (btor1809
            (bv->signal
             (zero-extend (signal-value btor1569) (bitvector 3))
             btor1569))
           (btor1810
            (bv->signal
             (zero-extend (signal-value btor1568) (bitvector 3))
             btor1568))
           (btor1811
            (bv->signal
             (zero-extend (signal-value btor1565) (bitvector 3))
             btor1565))
           (btor1812
            (bv->signal
             (zero-extend (signal-value btor1803) (bitvector 3))
             btor1803))
           (btor1813
            (bv->signal
             (zero-extend (signal-value btor1569) (bitvector 3))
             btor1569))
           (btor1814
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1814")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1814"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1814")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1814")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1815
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1815")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1815"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1815")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1815")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1816
            (if (bitvector->bool (signal-value btor594)) btor1815 btor1814))
           (btor1817
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1817")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1817"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1817")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1817")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1818
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1818")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1818"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1818")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1818")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1819
            (if (bitvector->bool (signal-value btor603)) btor1818 btor1817))
           (btor1820
            (signal
             (bvxor (signal-value btor1816) (signal-value btor1819))
             (list)))
           (btor1821
            (bv->signal
             (zero-extend (signal-value btor1820) (bitvector 1))
             btor1820))
           (btor1822
            (bv->signal
             (zero-extend (signal-value btor1820) (bitvector 1))
             btor1820))
           (btor1823
            (bv->signal
             (zero-extend (signal-value btor1819) (bitvector 1))
             btor1819))
           (btor1824
            (bv->signal
             (zero-extend (signal-value btor1816) (bitvector 1))
             btor1816))
           (btor1825
            (bv->signal
             (zero-extend (signal-value btor876) (bitvector 1))
             btor876))
           (btor1826
            (bv->signal
             (zero-extend (signal-value btor876) (bitvector 1))
             btor876))
           (btor1827
            (bv->signal
             (zero-extend (signal-value btor875) (bitvector 1))
             btor875))
           (btor1828
            (bv->signal
             (zero-extend (signal-value btor872) (bitvector 1))
             btor872))
           (btor1829
            (bv->signal
             (zero-extend (signal-value btor1820) (bitvector 1))
             btor1820))
           (btor1830
            (bv->signal
             (zero-extend (signal-value btor876) (bitvector 1))
             btor876))
           (btor1831
            (signal
             (concat (signal-value btor327) (signal-value btor326))
             (list)))
           (btor1832
            (signal
             (concat (signal-value btor329) (signal-value btor1831))
             (list)))
           (btor1833
            (signal
             (concat (signal-value btor330) (signal-value btor1832))
             (list)))
           (btor1834
            (signal
             (concat (signal-value btor331) (signal-value btor1833))
             (list)))
           (btor1835
            (signal
             (concat (signal-value btor332) (signal-value btor1834))
             (list)))
           (btor1836
            (signal
             (concat (signal-value btor333) (signal-value btor1835))
             (list)))
           (btor1837
            (signal
             (concat (signal-value btor334) (signal-value btor1836))
             (list)))
           (btor1838
            (signal
             (concat (signal-value btor335) (signal-value btor1837))
             (list)))
           (btor1839
            (signal
             (concat (signal-value btor336) (signal-value btor1838))
             (list)))
           (btor1840
            (signal
             (concat (signal-value btor328) (signal-value btor1839))
             (list)))
           (btor1841
            (bv->signal
             (zero-extend (signal-value btor1840) (bitvector 11))
             btor1840))
           (btor1842
            (signal
             (concat (signal-value btor876) (signal-value btor936))
             (list)))
           (btor1843
            (signal
             (concat (signal-value btor1569) (signal-value btor1842))
             (list)))
           (btor1844
            (bv->signal
             (zero-extend (signal-value btor1843) (bitvector 11))
             btor1843))
           (btor1845
            (bv->signal
             (zero-extend (signal-value btor128) (bitvector 1))
             btor128))
           (btor1846
            (bv->signal
             (zero-extend (signal-value btor240) (bitvector 1))
             btor240))
           (btor1847
            (bv->signal
             (zero-extend (signal-value btor341) (bitvector 1))
             btor341))
           (btor1848
            (bv->signal
             (zero-extend (signal-value btor128) (bitvector 1))
             btor128))
           (btor1849
            (bv->signal
             (zero-extend (signal-value btor240) (bitvector 1))
             btor240))
           (btor1850
            (bv->signal
             (zero-extend (signal-value btor341) (bitvector 1))
             btor341))
           (btor1851
            (bv->signal
             (zero-extend (signal-value btor128) (bitvector 1))
             btor128))
           (btor1852
            (bv->signal
             (zero-extend (signal-value btor240) (bitvector 1))
             btor240))
           (btor1853
            (bv->signal
             (zero-extend (signal-value btor341) (bitvector 1))
             btor341))
           (btor1854
            (bv->signal
             (zero-extend (signal-value btor128) (bitvector 1))
             btor128))
           (btor1855
            (bv->signal
             (zero-extend (signal-value btor240) (bitvector 1))
             btor240))
           (btor1856
            (bv->signal
             (zero-extend (signal-value btor341) (bitvector 1))
             btor341))
           (btor1857
            (bv->signal
             (zero-extend (signal-value btor240) (bitvector 1))
             btor240))
           (btor1858
            (bv->signal
             (zero-extend (signal-value btor240) (bitvector 1))
             btor240))
           (btor1859
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1859")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1859"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1859")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1859")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 7))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1860
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1860")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1860"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1860")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1860")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 7))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1861
            (if (bitvector->bool (signal-value btor594)) btor1860 btor1859))
           (btor1862
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1862")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1862"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1862")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1862")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 7))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1863
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1863")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1863"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1863")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1863")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 7))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1864
            (if (bitvector->bool (signal-value btor603)) btor1863 btor1862))
           (btor1865
            (signal
             (bvxor (signal-value btor1861) (signal-value btor1864))
             (list)))
           (btor1866
            (bv->signal
             (zero-extend (signal-value btor1865) (bitvector 7))
             btor1865))
           (btor1867
            (bv->signal
             (zero-extend (signal-value btor1865) (bitvector 7))
             btor1865))
           (btor1868
            (bv->signal
             (zero-extend (signal-value btor1864) (bitvector 7))
             btor1864))
           (btor1869
            (bv->signal
             (zero-extend (signal-value btor1861) (bitvector 7))
             btor1861))
           (btor1870
            (bv->signal
             (zero-extend (signal-value btor936) (bitvector 7))
             btor936))
           (btor1871
            (bv->signal
             (zero-extend (signal-value btor936) (bitvector 7))
             btor936))
           (btor1872
            (bv->signal
             (zero-extend (signal-value btor935) (bitvector 7))
             btor935))
           (btor1873
            (bv->signal
             (zero-extend (signal-value btor932) (bitvector 7))
             btor932))
           (btor1874
            (bv->signal
             (zero-extend (signal-value btor1865) (bitvector 7))
             btor1865))
           (btor1875
            (bv->signal
             (zero-extend (signal-value btor936) (bitvector 7))
             btor936))
           (btor1876
            (bv->signal
             (zero-extend (signal-value btor128) (bitvector 1))
             btor128))
           (btor1877
            (bv->signal
             (zero-extend (signal-value btor240) (bitvector 1))
             btor240))
           (btor1878
            (bv->signal
             (zero-extend (signal-value btor341) (bitvector 1))
             btor341))
           (btor1879
            (bv->signal
             (zero-extend (signal-value btor128) (bitvector 1))
             btor128))
           (btor1880
            (bv->signal
             (zero-extend (signal-value btor240) (bitvector 1))
             btor240))
           (btor1881
            (bv->signal
             (zero-extend (signal-value btor341) (bitvector 1))
             btor341))
           (btor1882
            (bv->signal
             (zero-extend (signal-value btor645) (bitvector 1))
             btor645))
           (btor1883
            (bv->signal
             (zero-extend (signal-value btor645) (bitvector 1))
             btor645))
           (btor1884
            (signal
             (bvand (signal-value btor637) (signal-value btor1624))
             (list)))
           (btor1885
            (bv->signal
             (zero-extend (signal-value btor1884) (bitvector 1))
             btor1884))
           (btor1886
            (bv->signal
             (zero-extend (signal-value btor645) (bitvector 1))
             btor645))
           (btor1887
            (bv->signal
             (zero-extend (signal-value btor644) (bitvector 1))
             btor644))
           (btor1888
            (bv->signal
             (zero-extend (signal-value btor641) (bitvector 1))
             btor641))
           (btor1889
            (signal
             (bvand (signal-value btor346) (signal-value btor347))
             (list)))
           (btor1890 (signal (bvnot (signal-value btor1889)) (list)))
           (btor1891
            (bv->signal
             (zero-extend (signal-value btor1390) (bitvector 5))
             btor1390))
           (btor1892
            (signal
             (bool->bitvector
              (bveq (signal-value btor246) (signal-value btor1891)))
             (list)))
           (btor1893
            (if (bitvector->bool (signal-value btor1892)) btor598 btor1890))
           (btor1894
            (bv->signal
             (zero-extend (signal-value btor1893) (bitvector 1))
             btor1893))
           (btor1895
            (bv->signal
             (zero-extend (signal-value btor653) (bitvector 1))
             btor653))
           (btor1896
            (bv->signal
             (zero-extend (signal-value btor653) (bitvector 1))
             btor653))
           (btor1897 (bv->signal (bv 0 (bitvector 54))))
           (btor1898
            (signal
             (extract 53 0 (signal-value btor989))
             (signal-state btor989)))
           (btor1899
            (signal
             (extract 53 0 (signal-value btor1228))
             (signal-state btor1228)))
           (btor1900
            (signal
             (bvadd (signal-value btor1898) (signal-value btor1899))
             (list)))
           (btor1901
            (signal
             (extract 53 0 (signal-value btor1409))
             (signal-state btor1409)))
           (btor1902
            (signal
             (bvadd (signal-value btor1900) (signal-value btor1901))
             (list)))
           (btor1903
            (if (bitvector->bool (signal-value btor1577)) btor1902 btor1897))
           (btor1904
            (signal
             (bvsub (signal-value btor1898) (signal-value btor1899))
             (list)))
           (btor1905
            (signal
             (bvadd (signal-value btor1904) (signal-value btor1901))
             (list)))
           (btor1906
            (if (bitvector->bool (signal-value btor1590)) btor1905 btor1903))
           (btor1907
            (signal
             (bvsub (signal-value btor1900) (signal-value btor1901))
             (list)))
           (btor1908
            (signal
             (bvsub (signal-value btor1904) (signal-value btor1901))
             (list)))
           (btor1909
            (if (bitvector->bool (signal-value btor1587)) btor1908 btor1907))
           (btor1910
            (signal
             (bvor (signal-value btor1583) (signal-value btor1587))
             (list)))
           (btor1911
            (if (bitvector->bool (signal-value btor1910)) btor1909 btor1906))
           (btor1912
            (signal
             (extract 53 53 (signal-value btor1911))
             (signal-state btor1911)))
           (btor1913
            (if (bitvector->bool (signal-value btor1893)) btor1912 btor1624))
           (btor1914
            (bv->signal
             (zero-extend (signal-value btor1913) (bitvector 1))
             btor1913))
           (btor1915
            (bv->signal
             (zero-extend (signal-value btor653) (bitvector 1))
             btor653))
           (btor1916
            (bv->signal
             (zero-extend (signal-value btor652) (bitvector 1))
             btor652))
           (btor1917
            (bv->signal
             (zero-extend (signal-value btor649) (bitvector 1))
             btor649))
           (btor1918
            (bv->signal
             (zero-extend (signal-value btor1615) (bitvector 55))
             btor1615))
           (btor1919
            (bv->signal
             (zero-extend (signal-value btor1911) (bitvector 54))
             btor1911))
           (btor1920
            (bv->signal
             (zero-extend (signal-value btor657) (bitvector 18))
             btor657))
           (btor1921
            (bv->signal
             (zero-extend (signal-value btor657) (bitvector 18))
             btor657))
           (btor1922
            (bv->signal
             (zero-extend (signal-value btor657) (bitvector 18))
             btor657))
           (btor1923
            (bv->signal
             (zero-extend (signal-value btor684) (bitvector 37))
             btor684))
           (btor1924
            (bv->signal
             (zero-extend (signal-value btor684) (bitvector 37))
             btor684))
           (btor1925
            (bv->signal
             (zero-extend (signal-value btor684) (bitvector 37))
             btor684))
           (btor1926
            (bv->signal
             (zero-extend (signal-value btor683) (bitvector 37))
             btor683))
           (btor1927
            (bv->signal
             (zero-extend (signal-value btor680) (bitvector 37))
             btor680))
           (btor1928
            (bv->signal
             (zero-extend (signal-value btor804) (bitvector 55))
             btor804))
           (btor1929
            (bv->signal
             (zero-extend (signal-value btor1393) (bitvector 54))
             btor1393))
           (btor1930
            (bv->signal
             (zero-extend (signal-value btor1395) (bitvector 54))
             btor1395))
           (btor1931
            (bv->signal
             (zero-extend (signal-value btor346) (bitvector 1))
             btor346))
           (btor1932
            (bv->signal
             (zero-extend (signal-value btor347) (bitvector 1))
             btor347))
           (btor1933
            (bv->signal
             (zero-extend (signal-value btor1890) (bitvector 1))
             btor1890))
           (btor1934
            (bv->signal
             (zero-extend (signal-value btor345) (bitvector 1))
             btor345))
           (btor1935
            (bv->signal
             (zero-extend (signal-value btor773) (bitvector 1))
             btor773))
           (btor1936
            (bv->signal
             (zero-extend (signal-value btor781) (bitvector 1))
             btor781))
           (btor1937
            (bv->signal
             (zero-extend (signal-value btor781) (bitvector 1))
             btor781))
           (btor1938
            (signal
             (bvand (signal-value btor605) (signal-value btor1624))
             (list)))
           (btor1939
            (bv->signal
             (zero-extend (signal-value btor1938) (bitvector 1))
             btor1938))
           (btor1940
            (bv->signal
             (zero-extend (signal-value btor781) (bitvector 1))
             btor781))
           (btor1941
            (bv->signal
             (zero-extend (signal-value btor780) (bitvector 1))
             btor780))
           (btor1942
            (bv->signal
             (zero-extend (signal-value btor777) (bitvector 1))
             btor777))
           (btor1944
            (if (bitvector->bool (signal-value btor1485)) btor477 btor375))
           (btor1945
            (if (bitvector->bool (signal-value btor1501)) btor1897 btor1944))
           (btor1949
            (signal
             (bvxor (signal-value btor604) (signal-value btor1622))
             (list)))
           (btor1950
            (if (bitvector->bool (signal-value btor128)) btor1949 btor595))
           (btor1951
            (if (bitvector->bool (signal-value btor341)) btor598 btor1950))
           (btor1955
            (signal
             (bvxor (signal-value btor595) (signal-value btor1622))
             (list)))
           (btor1956
            (if (bitvector->bool (signal-value btor128)) btor1955 btor604))
           (btor1957
            (if (bitvector->bool (signal-value btor341)) btor598 btor1956))
           (btor1961
            (signal
             (bvxor (signal-value btor612) (signal-value btor1645))
             (list)))
           (btor1962
            (if (bitvector->bool (signal-value btor128)) btor1961 btor609))
           (btor1963
            (if (bitvector->bool (signal-value btor341)) btor598 btor1962))
           (btor1966
            (signal
             (bvxor (signal-value btor609) (signal-value btor1645))
             (list)))
           (btor1967
            (if (bitvector->bool (signal-value btor128)) btor1966 btor612))
           (btor1968
            (if (bitvector->bool (signal-value btor341)) btor598 btor1967))
           (btor1971
            (signal
             (bvxor (signal-value btor620) (signal-value btor1653))
             (list)))
           (btor1972
            (if (bitvector->bool (signal-value btor128)) btor1971 btor617))
           (btor1973
            (if (bitvector->bool (signal-value btor341)) btor598 btor1972))
           (btor1976
            (signal
             (bvxor (signal-value btor617) (signal-value btor1653))
             (list)))
           (btor1977
            (if (bitvector->bool (signal-value btor128)) btor1976 btor620))
           (btor1978
            (if (bitvector->bool (signal-value btor341)) btor598 btor1977))
           (btor1981
            (signal
             (bvxor (signal-value btor628) (signal-value btor1661))
             (list)))
           (btor1982
            (if (bitvector->bool (signal-value btor128)) btor1981 btor625))
           (btor1983
            (if (bitvector->bool (signal-value btor341)) btor598 btor1982))
           (btor1986
            (signal
             (bvxor (signal-value btor625) (signal-value btor1661))
             (list)))
           (btor1987
            (if (bitvector->bool (signal-value btor128)) btor1986 btor628))
           (btor1988
            (if (bitvector->bool (signal-value btor341)) btor598 btor1987))
           (btor1991
            (signal
             (bvxor (signal-value btor636) (signal-value btor1620))
             (list)))
           (btor1992
            (if (bitvector->bool (signal-value btor128)) btor1991 btor633))
           (btor1993
            (if (bitvector->bool (signal-value btor341)) btor598 btor1992))
           (btor1996
            (signal
             (bvxor (signal-value btor633) (signal-value btor1620))
             (list)))
           (btor1997
            (if (bitvector->bool (signal-value btor128)) btor1996 btor636))
           (btor1998
            (if (bitvector->bool (signal-value btor341)) btor598 btor1997))
           (btor2001
            (signal
             (bvxor (signal-value btor644) (signal-value btor1884))
             (list)))
           (btor2002
            (if (bitvector->bool (signal-value btor128)) btor2001 btor641))
           (btor2003
            (if (bitvector->bool (signal-value btor341)) btor598 btor2002))
           (btor2006
            (signal
             (bvxor (signal-value btor641) (signal-value btor1884))
             (list)))
           (btor2007
            (if (bitvector->bool (signal-value btor128)) btor2006 btor644))
           (btor2008
            (if (bitvector->bool (signal-value btor341)) btor598 btor2007))
           (btor2011
            (signal
             (bvxor (signal-value btor652) (signal-value btor1913))
             (list)))
           (btor2012
            (if (bitvector->bool (signal-value btor128)) btor2011 btor649))
           (btor2013
            (if (bitvector->bool (signal-value btor341)) btor598 btor2012))
           (btor2016
            (signal
             (bvxor (signal-value btor649) (signal-value btor1913))
             (list)))
           (btor2017
            (if (bitvector->bool (signal-value btor128)) btor2016 btor652))
           (btor2018
            (if (bitvector->bool (signal-value btor341)) btor598 btor2017))
           (btor2021
            (signal
             (extract 17 0 (signal-value btor1615))
             (signal-state btor1615)))
           (btor2022
            (if (bitvector->bool (signal-value btor128)) btor2021 btor657))
           (btor2023
            (if (bitvector->bool (signal-value btor341)) btor1027 btor2022))
           (btor2026
            (signal
             (extract 54 18 (signal-value btor1615))
             (signal-state btor1615)))
           (btor2027
            (signal
             (bvxor (signal-value btor683) (signal-value btor2026))
             (list)))
           (btor2028
            (if (bitvector->bool (signal-value btor128)) btor2027 btor680))
           (btor2029 (bv->signal (bv 0 (bitvector 37))))
           (btor2030
            (if (bitvector->bool (signal-value btor341)) btor2029 btor2028))
           (btor2033
            (signal
             (bvxor (signal-value btor680) (signal-value btor2026))
             (list)))
           (btor2034
            (if (bitvector->bool (signal-value btor128)) btor2033 btor683))
           (btor2035
            (if (bitvector->bool (signal-value btor341)) btor2029 btor2034))
           (btor2038
            (signal
             (bvxor (signal-value btor780) (signal-value btor1938))
             (list)))
           (btor2039
            (if (bitvector->bool (signal-value btor128)) btor2038 btor777))
           (btor2040
            (if (bitvector->bool (signal-value btor341)) btor598 btor2039))
           (btor2043
            (signal
             (bvxor (signal-value btor777) (signal-value btor1938))
             (list)))
           (btor2044
            (if (bitvector->bool (signal-value btor128)) btor2043 btor780))
           (btor2045
            (if (bitvector->bool (signal-value btor341)) btor598 btor2044))
           (btor2048
            (signal
             (bvxor (signal-value btor875) (signal-value btor1820))
             (list)))
           (btor2049
            (if (bitvector->bool (signal-value btor128)) btor2048 btor872))
           (btor2050
            (if (bitvector->bool (signal-value btor341)) btor598 btor2049))
           (btor2053
            (signal
             (bvxor (signal-value btor872) (signal-value btor1820))
             (list)))
           (btor2054
            (if (bitvector->bool (signal-value btor128)) btor2053 btor875))
           (btor2055
            (if (bitvector->bool (signal-value btor341)) btor598 btor2054))
           (btor2058
            (signal
             (bvxor (signal-value btor935) (signal-value btor1865))
             (list)))
           (btor2059
            (if (bitvector->bool (signal-value btor128)) btor2058 btor932))
           (btor2060
            (if (bitvector->bool (signal-value btor341)) btor861 btor2059))
           (btor2063
            (signal
             (bvxor (signal-value btor932) (signal-value btor1865))
             (list)))
           (btor2064
            (if (bitvector->bool (signal-value btor128)) btor2063 btor935))
           (btor2065
            (if (bitvector->bool (signal-value btor341)) btor861 btor2064))
           (btor2068
            (signal
             (concat (signal-value btor75) (signal-value btor74))
             (list)))
           (btor2069
            (signal
             (concat (signal-value btor86) (signal-value btor2068))
             (list)))
           (btor2070
            (signal
             (concat (signal-value btor97) (signal-value btor2069))
             (list)))
           (btor2071
            (signal
             (concat (signal-value btor108) (signal-value btor2070))
             (list)))
           (btor2072
            (signal
             (concat (signal-value btor119) (signal-value btor2071))
             (list)))
           (btor2073
            (signal
             (concat (signal-value btor124) (signal-value btor2072))
             (list)))
           (btor2074
            (signal
             (concat (signal-value btor125) (signal-value btor2073))
             (list)))
           (btor2075
            (signal
             (concat (signal-value btor126) (signal-value btor2074))
             (list)))
           (btor2076
            (signal
             (concat (signal-value btor127) (signal-value btor2075))
             (list)))
           (btor2077
            (signal
             (concat (signal-value btor76) (signal-value btor2076))
             (list)))
           (btor2078
            (signal
             (concat (signal-value btor77) (signal-value btor2077))
             (list)))
           (btor2079
            (signal
             (concat (signal-value btor78) (signal-value btor2078))
             (list)))
           (btor2080
            (signal
             (concat (signal-value btor79) (signal-value btor2079))
             (list)))
           (btor2081
            (signal
             (concat (signal-value btor80) (signal-value btor2080))
             (list)))
           (btor2082
            (signal
             (concat (signal-value btor81) (signal-value btor2081))
             (list)))
           (btor2083
            (signal
             (concat (signal-value btor82) (signal-value btor2082))
             (list)))
           (btor2084
            (signal
             (concat (signal-value btor83) (signal-value btor2083))
             (list)))
           (btor2085
            (signal
             (concat (signal-value btor84) (signal-value btor2084))
             (list)))
           (btor2086
            (signal
             (concat (signal-value btor85) (signal-value btor2085))
             (list)))
           (btor2087
            (signal
             (concat (signal-value btor87) (signal-value btor2086))
             (list)))
           (btor2088
            (signal
             (concat (signal-value btor88) (signal-value btor2087))
             (list)))
           (btor2089
            (signal
             (concat (signal-value btor89) (signal-value btor2088))
             (list)))
           (btor2090
            (signal
             (concat (signal-value btor90) (signal-value btor2089))
             (list)))
           (btor2091
            (signal
             (concat (signal-value btor91) (signal-value btor2090))
             (list)))
           (btor2092
            (signal
             (concat (signal-value btor92) (signal-value btor2091))
             (list)))
           (btor2093
            (signal
             (concat (signal-value btor93) (signal-value btor2092))
             (list)))
           (btor2094
            (if (bitvector->bool (signal-value btor128)) btor2093 btor943))
           (btor2095 (bv->signal (bv 0 (bitvector 27))))
           (btor2096
            (if (bitvector->bool (signal-value btor341)) btor2095 btor2094))
           (btor2099
            (signal
             (concat (signal-value btor95) (signal-value btor94))
             (list)))
           (btor2100
            (signal
             (concat (signal-value btor96) (signal-value btor2099))
             (list)))
           (btor2101
            (signal
             (concat (signal-value btor98) (signal-value btor2100))
             (list)))
           (btor2102
            (signal
             (concat (signal-value btor99) (signal-value btor2101))
             (list)))
           (btor2103
            (signal
             (concat (signal-value btor100) (signal-value btor2102))
             (list)))
           (btor2104
            (signal
             (concat (signal-value btor101) (signal-value btor2103))
             (list)))
           (btor2105
            (signal
             (concat (signal-value btor102) (signal-value btor2104))
             (list)))
           (btor2106
            (signal
             (concat (signal-value btor103) (signal-value btor2105))
             (list)))
           (btor2107
            (signal
             (concat (signal-value btor104) (signal-value btor2106))
             (list)))
           (btor2108
            (signal
             (concat (signal-value btor105) (signal-value btor2107))
             (list)))
           (btor2109
            (signal
             (concat (signal-value btor106) (signal-value btor2108))
             (list)))
           (btor2110
            (signal
             (concat (signal-value btor107) (signal-value btor2109))
             (list)))
           (btor2111
            (signal
             (concat (signal-value btor109) (signal-value btor2110))
             (list)))
           (btor2112
            (signal
             (concat (signal-value btor110) (signal-value btor2111))
             (list)))
           (btor2113
            (signal
             (concat (signal-value btor111) (signal-value btor2112))
             (list)))
           (btor2114
            (signal
             (concat (signal-value btor112) (signal-value btor2113))
             (list)))
           (btor2115
            (signal
             (concat (signal-value btor113) (signal-value btor2114))
             (list)))
           (btor2116
            (signal
             (concat (signal-value btor114) (signal-value btor2115))
             (list)))
           (btor2117
            (signal
             (concat (signal-value btor115) (signal-value btor2116))
             (list)))
           (btor2118
            (signal
             (concat (signal-value btor116) (signal-value btor2117))
             (list)))
           (btor2119
            (signal
             (concat (signal-value btor117) (signal-value btor2118))
             (list)))
           (btor2120
            (signal
             (concat (signal-value btor118) (signal-value btor2119))
             (list)))
           (btor2121
            (signal
             (concat (signal-value btor120) (signal-value btor2120))
             (list)))
           (btor2122
            (signal
             (concat (signal-value btor121) (signal-value btor2121))
             (list)))
           (btor2123
            (signal
             (concat (signal-value btor122) (signal-value btor2122))
             (list)))
           (btor2124
            (signal
             (concat (signal-value btor123) (signal-value btor2123))
             (list)))
           (btor2125
            (if (bitvector->bool (signal-value btor128)) btor2124 btor1183))
           (btor2126
            (if (bitvector->bool (signal-value btor341)) btor2095 btor2125))
           (btor2129
            (signal
             (bvxor (signal-value btor1568) (signal-value btor1803))
             (list)))
           (btor2130
            (if (bitvector->bool (signal-value btor128)) btor2129 btor1565))
           (btor2131 (bv->signal (bv 0 (bitvector 3))))
           (btor2132
            (if (bitvector->bool (signal-value btor341)) btor2131 btor2130))
           (btor2135
            (signal
             (bvxor (signal-value btor1565) (signal-value btor1803))
             (list)))
           (btor2136
            (if (bitvector->bool (signal-value btor128)) btor2135 btor1568))
           (btor2137
            (if (bitvector->bool (signal-value btor341)) btor2131 btor2136))
           (btor2140
            (signal
             (concat (signal-value btor336) (signal-value btor335))
             (list)))
           (btor2141
            (signal
             (concat (signal-value btor328) (signal-value btor2140))
             (list)))
           (btor2142
            (signal
             (bvxor (signal-value btor1802) (signal-value btor2141))
             (list)))
           (btor2143
            (if (bitvector->bool (signal-value btor128)) btor2142 btor1799))
           (btor2144
            (if (bitvector->bool (signal-value btor341)) btor2131 btor2143))
           (btor2147
            (signal
             (bvxor (signal-value btor1799) (signal-value btor2141))
             (list)))
           (btor2148
            (if (bitvector->bool (signal-value btor128)) btor2147 btor1802))
           (btor2149
            (if (bitvector->bool (signal-value btor341)) btor2131 btor2148))
           (btor2152
            (signal
             (bvxor (signal-value btor1819) (signal-value btor334))
             (list)))
           (btor2153
            (if (bitvector->bool (signal-value btor128)) btor2152 btor1816))
           (btor2154
            (if (bitvector->bool (signal-value btor341)) btor598 btor2153))
           (btor2157
            (signal
             (bvxor (signal-value btor1816) (signal-value btor334))
             (list)))
           (btor2158
            (if (bitvector->bool (signal-value btor128)) btor2157 btor1819))
           (btor2159
            (if (bitvector->bool (signal-value btor341)) btor598 btor2158))
           (btor2162
            (signal
             (concat (signal-value btor327) (signal-value btor326))
             (list)))
           (btor2163
            (signal
             (concat (signal-value btor329) (signal-value btor2162))
             (list)))
           (btor2164
            (signal
             (concat (signal-value btor330) (signal-value btor2163))
             (list)))
           (btor2165
            (signal
             (concat (signal-value btor331) (signal-value btor2164))
             (list)))
           (btor2166
            (signal
             (concat (signal-value btor332) (signal-value btor2165))
             (list)))
           (btor2167
            (signal
             (concat (signal-value btor333) (signal-value btor2166))
             (list)))
           (btor2168
            (signal
             (bvxor (signal-value btor1864) (signal-value btor2167))
             (list)))
           (btor2169
            (if (bitvector->bool (signal-value btor128)) btor2168 btor1861))
           (btor2170
            (if (bitvector->bool (signal-value btor341)) btor861 btor2169))
           (btor2173
            (signal
             (bvxor (signal-value btor1861) (signal-value btor2167))
             (list)))
           (btor2174
            (if (bitvector->bool (signal-value btor128)) btor2173 btor1864))
           (btor2175
            (if (bitvector->bool (signal-value btor341)) btor861 btor2174))
           (output-state
            (remove-duplicates
             (append
              (append
               (list
                (cons
                 (string->symbol (string-append name "state1863"))
                 (cons
                  (signal-value btor2175)
                  (if (assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1863")))
                    (add1
                     (cdr
                      (assoc-ref
                       merged-input-state-hash
                       (string->symbol (string-append name "state1863")))))
                    0))))
               (append
                (list
                 (cons
                  (string->symbol (string-append name "state1862"))
                  (cons
                   (signal-value btor1864)
                   (if (assoc-has-key?
                        merged-input-state-hash
                        (string->symbol (string-append name "state1862")))
                     (add1
                      (cdr
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1862")))))
                     0))))
                (append
                 (list
                  (cons
                   (string->symbol (string-append name "state1860"))
                   (cons
                    (signal-value btor2170)
                    (if (assoc-has-key?
                         merged-input-state-hash
                         (string->symbol (string-append name "state1860")))
                      (add1
                       (cdr
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state1860")))))
                      0))))
                 (append
                  (list
                   (cons
                    (string->symbol (string-append name "state1859"))
                    (cons
                     (signal-value btor1861)
                     (if (assoc-has-key?
                          merged-input-state-hash
                          (string->symbol (string-append name "state1859")))
                       (add1
                        (cdr
                         (assoc-ref
                          merged-input-state-hash
                          (string->symbol (string-append name "state1859")))))
                       0))))
                  (append
                   (list
                    (cons
                     (string->symbol (string-append name "state1818"))
                     (cons
                      (signal-value btor2159)
                      (if (assoc-has-key?
                           merged-input-state-hash
                           (string->symbol (string-append name "state1818")))
                        (add1
                         (cdr
                          (assoc-ref
                           merged-input-state-hash
                           (string->symbol (string-append name "state1818")))))
                        0))))
                   (append
                    (list
                     (cons
                      (string->symbol (string-append name "state1817"))
                      (cons
                       (signal-value btor1819)
                       (if (assoc-has-key?
                            merged-input-state-hash
                            (string->symbol (string-append name "state1817")))
                         (add1
                          (cdr
                           (assoc-ref
                            merged-input-state-hash
                            (string->symbol
                             (string-append name "state1817")))))
                         0))))
                    (append
                     (list
                      (cons
                       (string->symbol (string-append name "state1815"))
                       (cons
                        (signal-value btor2154)
                        (if (assoc-has-key?
                             merged-input-state-hash
                             (string->symbol (string-append name "state1815")))
                          (add1
                           (cdr
                            (assoc-ref
                             merged-input-state-hash
                             (string->symbol
                              (string-append name "state1815")))))
                          0))))
                     (append
                      (list
                       (cons
                        (string->symbol (string-append name "state1814"))
                        (cons
                         (signal-value btor1816)
                         (if (assoc-has-key?
                              merged-input-state-hash
                              (string->symbol
                               (string-append name "state1814")))
                           (add1
                            (cdr
                             (assoc-ref
                              merged-input-state-hash
                              (string->symbol
                               (string-append name "state1814")))))
                           0))))
                      (append
                       (list
                        (cons
                         (string->symbol (string-append name "state1801"))
                         (cons
                          (signal-value btor2149)
                          (if (assoc-has-key?
                               merged-input-state-hash
                               (string->symbol
                                (string-append name "state1801")))
                            (add1
                             (cdr
                              (assoc-ref
                               merged-input-state-hash
                               (string->symbol
                                (string-append name "state1801")))))
                            0))))
                       (append
                        (list
                         (cons
                          (string->symbol (string-append name "state1800"))
                          (cons
                           (signal-value btor1802)
                           (if (assoc-has-key?
                                merged-input-state-hash
                                (string->symbol
                                 (string-append name "state1800")))
                             (add1
                              (cdr
                               (assoc-ref
                                merged-input-state-hash
                                (string->symbol
                                 (string-append name "state1800")))))
                             0))))
                        (append
                         (list
                          (cons
                           (string->symbol (string-append name "state1798"))
                           (cons
                            (signal-value btor2144)
                            (if (assoc-has-key?
                                 merged-input-state-hash
                                 (string->symbol
                                  (string-append name "state1798")))
                              (add1
                               (cdr
                                (assoc-ref
                                 merged-input-state-hash
                                 (string->symbol
                                  (string-append name "state1798")))))
                              0))))
                         (append
                          (list
                           (cons
                            (string->symbol (string-append name "state1797"))
                            (cons
                             (signal-value btor1799)
                             (if (assoc-has-key?
                                  merged-input-state-hash
                                  (string->symbol
                                   (string-append name "state1797")))
                               (add1
                                (cdr
                                 (assoc-ref
                                  merged-input-state-hash
                                  (string->symbol
                                   (string-append name "state1797")))))
                               0))))
                          (append
                           (list
                            (cons
                             (string->symbol (string-append name "state1567"))
                             (cons
                              (signal-value btor2137)
                              (if (assoc-has-key?
                                   merged-input-state-hash
                                   (string->symbol
                                    (string-append name "state1567")))
                                (add1
                                 (cdr
                                  (assoc-ref
                                   merged-input-state-hash
                                   (string->symbol
                                    (string-append name "state1567")))))
                                0))))
                           (append
                            (list
                             (cons
                              (string->symbol (string-append name "state1566"))
                              (cons
                               (signal-value btor1568)
                               (if (assoc-has-key?
                                    merged-input-state-hash
                                    (string->symbol
                                     (string-append name "state1566")))
                                 (add1
                                  (cdr
                                   (assoc-ref
                                    merged-input-state-hash
                                    (string->symbol
                                     (string-append name "state1566")))))
                                 0))))
                            (append
                             (list
                              (cons
                               (string->symbol
                                (string-append name "state1564"))
                               (cons
                                (signal-value btor2132)
                                (if (assoc-has-key?
                                     merged-input-state-hash
                                     (string->symbol
                                      (string-append name "state1564")))
                                  (add1
                                   (cdr
                                    (assoc-ref
                                     merged-input-state-hash
                                     (string->symbol
                                      (string-append name "state1564")))))
                                  0))))
                             (append
                              (list
                               (cons
                                (string->symbol
                                 (string-append name "state1563"))
                                (cons
                                 (signal-value btor1565)
                                 (if (assoc-has-key?
                                      merged-input-state-hash
                                      (string->symbol
                                       (string-append name "state1563")))
                                   (add1
                                    (cdr
                                     (assoc-ref
                                      merged-input-state-hash
                                      (string->symbol
                                       (string-append name "state1563")))))
                                   0))))
                              (append
                               (list
                                (cons
                                 (string->symbol
                                  (string-append name "state1182"))
                                 (cons
                                  (signal-value btor2126)
                                  (if (assoc-has-key?
                                       merged-input-state-hash
                                       (string->symbol
                                        (string-append name "state1182")))
                                    (add1
                                     (cdr
                                      (assoc-ref
                                       merged-input-state-hash
                                       (string->symbol
                                        (string-append name "state1182")))))
                                    0))))
                               (append
                                (list
                                 (cons
                                  (string->symbol
                                   (string-append name "state1181"))
                                  (cons
                                   (signal-value btor1183)
                                   (if (assoc-has-key?
                                        merged-input-state-hash
                                        (string->symbol
                                         (string-append name "state1181")))
                                     (add1
                                      (cdr
                                       (assoc-ref
                                        merged-input-state-hash
                                        (string->symbol
                                         (string-append name "state1181")))))
                                     0))))
                                (append
                                 (list
                                  (cons
                                   (string->symbol
                                    (string-append name "state942"))
                                   (cons
                                    (signal-value btor2096)
                                    (if (assoc-has-key?
                                         merged-input-state-hash
                                         (string->symbol
                                          (string-append name "state942")))
                                      (add1
                                       (cdr
                                        (assoc-ref
                                         merged-input-state-hash
                                         (string->symbol
                                          (string-append name "state942")))))
                                      0))))
                                 (append
                                  (list
                                   (cons
                                    (string->symbol
                                     (string-append name "state941"))
                                    (cons
                                     (signal-value btor943)
                                     (if (assoc-has-key?
                                          merged-input-state-hash
                                          (string->symbol
                                           (string-append name "state941")))
                                       (add1
                                        (cdr
                                         (assoc-ref
                                          merged-input-state-hash
                                          (string->symbol
                                           (string-append name "state941")))))
                                       0))))
                                  (append
                                   (list
                                    (cons
                                     (string->symbol
                                      (string-append name "state934"))
                                     (cons
                                      (signal-value btor2065)
                                      (if (assoc-has-key?
                                           merged-input-state-hash
                                           (string->symbol
                                            (string-append name "state934")))
                                        (add1
                                         (cdr
                                          (assoc-ref
                                           merged-input-state-hash
                                           (string->symbol
                                            (string-append name "state934")))))
                                        0))))
                                   (append
                                    (list
                                     (cons
                                      (string->symbol
                                       (string-append name "state933"))
                                      (cons
                                       (signal-value btor935)
                                       (if (assoc-has-key?
                                            merged-input-state-hash
                                            (string->symbol
                                             (string-append name "state933")))
                                         (add1
                                          (cdr
                                           (assoc-ref
                                            merged-input-state-hash
                                            (string->symbol
                                             (string-append
                                              name
                                              "state933")))))
                                         0))))
                                    (append
                                     (list
                                      (cons
                                       (string->symbol
                                        (string-append name "state931"))
                                       (cons
                                        (signal-value btor2060)
                                        (if (assoc-has-key?
                                             merged-input-state-hash
                                             (string->symbol
                                              (string-append name "state931")))
                                          (add1
                                           (cdr
                                            (assoc-ref
                                             merged-input-state-hash
                                             (string->symbol
                                              (string-append
                                               name
                                               "state931")))))
                                          0))))
                                     (append
                                      (list
                                       (cons
                                        (string->symbol
                                         (string-append name "state930"))
                                        (cons
                                         (signal-value btor932)
                                         (if (assoc-has-key?
                                              merged-input-state-hash
                                              (string->symbol
                                               (string-append
                                                name
                                                "state930")))
                                           (add1
                                            (cdr
                                             (assoc-ref
                                              merged-input-state-hash
                                              (string->symbol
                                               (string-append
                                                name
                                                "state930")))))
                                           0))))
                                      (append
                                       (list
                                        (cons
                                         (string->symbol
                                          (string-append name "state874"))
                                         (cons
                                          (signal-value btor2055)
                                          (if (assoc-has-key?
                                               merged-input-state-hash
                                               (string->symbol
                                                (string-append
                                                 name
                                                 "state874")))
                                            (add1
                                             (cdr
                                              (assoc-ref
                                               merged-input-state-hash
                                               (string->symbol
                                                (string-append
                                                 name
                                                 "state874")))))
                                            0))))
                                       (append
                                        (list
                                         (cons
                                          (string->symbol
                                           (string-append name "state873"))
                                          (cons
                                           (signal-value btor875)
                                           (if (assoc-has-key?
                                                merged-input-state-hash
                                                (string->symbol
                                                 (string-append
                                                  name
                                                  "state873")))
                                             (add1
                                              (cdr
                                               (assoc-ref
                                                merged-input-state-hash
                                                (string->symbol
                                                 (string-append
                                                  name
                                                  "state873")))))
                                             0))))
                                        (append
                                         (list
                                          (cons
                                           (string->symbol
                                            (string-append name "state871"))
                                           (cons
                                            (signal-value btor2050)
                                            (if (assoc-has-key?
                                                 merged-input-state-hash
                                                 (string->symbol
                                                  (string-append
                                                   name
                                                   "state871")))
                                              (add1
                                               (cdr
                                                (assoc-ref
                                                 merged-input-state-hash
                                                 (string->symbol
                                                  (string-append
                                                   name
                                                   "state871")))))
                                              0))))
                                         (append
                                          (list
                                           (cons
                                            (string->symbol
                                             (string-append name "state870"))
                                            (cons
                                             (signal-value btor872)
                                             (if (assoc-has-key?
                                                  merged-input-state-hash
                                                  (string->symbol
                                                   (string-append
                                                    name
                                                    "state870")))
                                               (add1
                                                (cdr
                                                 (assoc-ref
                                                  merged-input-state-hash
                                                  (string->symbol
                                                   (string-append
                                                    name
                                                    "state870")))))
                                               0))))
                                          (append
                                           (list
                                            (cons
                                             (string->symbol
                                              (string-append name "state779"))
                                             (cons
                                              (signal-value btor2045)
                                              (if (assoc-has-key?
                                                   merged-input-state-hash
                                                   (string->symbol
                                                    (string-append
                                                     name
                                                     "state779")))
                                                (add1
                                                 (cdr
                                                  (assoc-ref
                                                   merged-input-state-hash
                                                   (string->symbol
                                                    (string-append
                                                     name
                                                     "state779")))))
                                                0))))
                                           (append
                                            (list
                                             (cons
                                              (string->symbol
                                               (string-append name "state778"))
                                              (cons
                                               (signal-value btor780)
                                               (if (assoc-has-key?
                                                    merged-input-state-hash
                                                    (string->symbol
                                                     (string-append
                                                      name
                                                      "state778")))
                                                 (add1
                                                  (cdr
                                                   (assoc-ref
                                                    merged-input-state-hash
                                                    (string->symbol
                                                     (string-append
                                                      name
                                                      "state778")))))
                                                 0))))
                                            (append
                                             (list
                                              (cons
                                               (string->symbol
                                                (string-append
                                                 name
                                                 "state776"))
                                               (cons
                                                (signal-value btor2040)
                                                (if (assoc-has-key?
                                                     merged-input-state-hash
                                                     (string->symbol
                                                      (string-append
                                                       name
                                                       "state776")))
                                                  (add1
                                                   (cdr
                                                    (assoc-ref
                                                     merged-input-state-hash
                                                     (string->symbol
                                                      (string-append
                                                       name
                                                       "state776")))))
                                                  0))))
                                             (append
                                              (list
                                               (cons
                                                (string->symbol
                                                 (string-append
                                                  name
                                                  "state775"))
                                                (cons
                                                 (signal-value btor777)
                                                 (if (assoc-has-key?
                                                      merged-input-state-hash
                                                      (string->symbol
                                                       (string-append
                                                        name
                                                        "state775")))
                                                   (add1
                                                    (cdr
                                                     (assoc-ref
                                                      merged-input-state-hash
                                                      (string->symbol
                                                       (string-append
                                                        name
                                                        "state775")))))
                                                   0))))
                                              (append
                                               (list
                                                (cons
                                                 (string->symbol
                                                  (string-append
                                                   name
                                                   "state682"))
                                                 (cons
                                                  (signal-value btor2035)
                                                  (if (assoc-has-key?
                                                       merged-input-state-hash
                                                       (string->symbol
                                                        (string-append
                                                         name
                                                         "state682")))
                                                    (add1
                                                     (cdr
                                                      (assoc-ref
                                                       merged-input-state-hash
                                                       (string->symbol
                                                        (string-append
                                                         name
                                                         "state682")))))
                                                    0))))
                                               (append
                                                (list
                                                 (cons
                                                  (string->symbol
                                                   (string-append
                                                    name
                                                    "state681"))
                                                  (cons
                                                   (signal-value btor683)
                                                   (if (assoc-has-key?
                                                        merged-input-state-hash
                                                        (string->symbol
                                                         (string-append
                                                          name
                                                          "state681")))
                                                     (add1
                                                      (cdr
                                                       (assoc-ref
                                                        merged-input-state-hash
                                                        (string->symbol
                                                         (string-append
                                                          name
                                                          "state681")))))
                                                     0))))
                                                (append
                                                 (list
                                                  (cons
                                                   (string->symbol
                                                    (string-append
                                                     name
                                                     "state679"))
                                                   (cons
                                                    (signal-value btor2030)
                                                    (if (assoc-has-key?
                                                         merged-input-state-hash
                                                         (string->symbol
                                                          (string-append
                                                           name
                                                           "state679")))
                                                      (add1
                                                       (cdr
                                                        (assoc-ref
                                                         merged-input-state-hash
                                                         (string->symbol
                                                          (string-append
                                                           name
                                                           "state679")))))
                                                      0))))
                                                 (append
                                                  (list
                                                   (cons
                                                    (string->symbol
                                                     (string-append
                                                      name
                                                      "state678"))
                                                    (cons
                                                     (signal-value btor680)
                                                     (if (assoc-has-key?
                                                          merged-input-state-hash
                                                          (string->symbol
                                                           (string-append
                                                            name
                                                            "state678")))
                                                       (add1
                                                        (cdr
                                                         (assoc-ref
                                                          merged-input-state-hash
                                                          (string->symbol
                                                           (string-append
                                                            name
                                                            "state678")))))
                                                       0))))
                                                  (append
                                                   (list
                                                    (cons
                                                     (string->symbol
                                                      (string-append
                                                       name
                                                       "state656"))
                                                     (cons
                                                      (signal-value btor2023)
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
                                                        "state655"))
                                                      (cons
                                                       (signal-value btor657)
                                                       (if (assoc-has-key?
                                                            merged-input-state-hash
                                                            (string->symbol
                                                             (string-append
                                                              name
                                                              "state655")))
                                                         (add1
                                                          (cdr
                                                           (assoc-ref
                                                            merged-input-state-hash
                                                            (string->symbol
                                                             (string-append
                                                              name
                                                              "state655")))))
                                                         0))))
                                                    (append
                                                     (list
                                                      (cons
                                                       (string->symbol
                                                        (string-append
                                                         name
                                                         "state651"))
                                                       (cons
                                                        (signal-value btor2018)
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
                                                          "state650"))
                                                        (cons
                                                         (signal-value btor652)
                                                         (if (assoc-has-key?
                                                              merged-input-state-hash
                                                              (string->symbol
                                                               (string-append
                                                                name
                                                                "state650")))
                                                           (add1
                                                            (cdr
                                                             (assoc-ref
                                                              merged-input-state-hash
                                                              (string->symbol
                                                               (string-append
                                                                name
                                                                "state650")))))
                                                           0))))
                                                      (append
                                                       (list
                                                        (cons
                                                         (string->symbol
                                                          (string-append
                                                           name
                                                           "state648"))
                                                         (cons
                                                          (signal-value
                                                           btor2013)
                                                          (if (assoc-has-key?
                                                               merged-input-state-hash
                                                               (string->symbol
                                                                (string-append
                                                                 name
                                                                 "state648")))
                                                            (add1
                                                             (cdr
                                                              (assoc-ref
                                                               merged-input-state-hash
                                                               (string->symbol
                                                                (string-append
                                                                 name
                                                                 "state648")))))
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
                                                            btor649)
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
                                                             "state643"))
                                                           (cons
                                                            (signal-value
                                                             btor2008)
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
                                                              btor644)
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
                                                               "state640"))
                                                             (cons
                                                              (signal-value
                                                               btor2003)
                                                              (if (assoc-has-key?
                                                                   merged-input-state-hash
                                                                   (string->symbol
                                                                    (string-append
                                                                     name
                                                                     "state640")))
                                                                (add1
                                                                 (cdr
                                                                  (assoc-ref
                                                                   merged-input-state-hash
                                                                   (string->symbol
                                                                    (string-append
                                                                     name
                                                                     "state640")))))
                                                                0))))
                                                           (append
                                                            (list
                                                             (cons
                                                              (string->symbol
                                                               (string-append
                                                                name
                                                                "state639"))
                                                              (cons
                                                               (signal-value
                                                                btor641)
                                                               (if (assoc-has-key?
                                                                    merged-input-state-hash
                                                                    (string->symbol
                                                                     (string-append
                                                                      name
                                                                      "state639")))
                                                                 (add1
                                                                  (cdr
                                                                   (assoc-ref
                                                                    merged-input-state-hash
                                                                    (string->symbol
                                                                     (string-append
                                                                      name
                                                                      "state639")))))
                                                                 0))))
                                                            (append
                                                             (list
                                                              (cons
                                                               (string->symbol
                                                                (string-append
                                                                 name
                                                                 "state635"))
                                                               (cons
                                                                (signal-value
                                                                 btor1998)
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
                                                                  "state634"))
                                                                (cons
                                                                 (signal-value
                                                                  btor636)
                                                                 (if (assoc-has-key?
                                                                      merged-input-state-hash
                                                                      (string->symbol
                                                                       (string-append
                                                                        name
                                                                        "state634")))
                                                                   (add1
                                                                    (cdr
                                                                     (assoc-ref
                                                                      merged-input-state-hash
                                                                      (string->symbol
                                                                       (string-append
                                                                        name
                                                                        "state634")))))
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
                                                                   btor1993)
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
                                                                    "state631"))
                                                                  (cons
                                                                   (signal-value
                                                                    btor633)
                                                                   (if (assoc-has-key?
                                                                        merged-input-state-hash
                                                                        (string->symbol
                                                                         (string-append
                                                                          name
                                                                          "state631")))
                                                                     (add1
                                                                      (cdr
                                                                       (assoc-ref
                                                                        merged-input-state-hash
                                                                        (string->symbol
                                                                         (string-append
                                                                          name
                                                                          "state631")))))
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
                                                                     btor1988)
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
                                                                      btor628)
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
                                                                       "state624"))
                                                                     (cons
                                                                      (signal-value
                                                                       btor1983)
                                                                      (if (assoc-has-key?
                                                                           merged-input-state-hash
                                                                           (string->symbol
                                                                            (string-append
                                                                             name
                                                                             "state624")))
                                                                        (add1
                                                                         (cdr
                                                                          (assoc-ref
                                                                           merged-input-state-hash
                                                                           (string->symbol
                                                                            (string-append
                                                                             name
                                                                             "state624")))))
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
                                                                        btor625)
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
                                                                         "state619"))
                                                                       (cons
                                                                        (signal-value
                                                                         btor1978)
                                                                        (if (assoc-has-key?
                                                                             merged-input-state-hash
                                                                             (string->symbol
                                                                              (string-append
                                                                               name
                                                                               "state619")))
                                                                          (add1
                                                                           (cdr
                                                                            (assoc-ref
                                                                             merged-input-state-hash
                                                                             (string->symbol
                                                                              (string-append
                                                                               name
                                                                               "state619")))))
                                                                          0))))
                                                                     (append
                                                                      (list
                                                                       (cons
                                                                        (string->symbol
                                                                         (string-append
                                                                          name
                                                                          "state618"))
                                                                        (cons
                                                                         (signal-value
                                                                          btor620)
                                                                         (if (assoc-has-key?
                                                                              merged-input-state-hash
                                                                              (string->symbol
                                                                               (string-append
                                                                                name
                                                                                "state618")))
                                                                           (add1
                                                                            (cdr
                                                                             (assoc-ref
                                                                              merged-input-state-hash
                                                                              (string->symbol
                                                                               (string-append
                                                                                name
                                                                                "state618")))))
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
                                                                           btor1973)
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
                                                                            "state615"))
                                                                          (cons
                                                                           (signal-value
                                                                            btor617)
                                                                           (if (assoc-has-key?
                                                                                merged-input-state-hash
                                                                                (string->symbol
                                                                                 (string-append
                                                                                  name
                                                                                  "state615")))
                                                                             (add1
                                                                              (cdr
                                                                               (assoc-ref
                                                                                merged-input-state-hash
                                                                                (string->symbol
                                                                                 (string-append
                                                                                  name
                                                                                  "state615")))))
                                                                             0))))
                                                                        (append
                                                                         (list
                                                                          (cons
                                                                           (string->symbol
                                                                            (string-append
                                                                             name
                                                                             "state611"))
                                                                           (cons
                                                                            (signal-value
                                                                             btor1968)
                                                                            (if (assoc-has-key?
                                                                                 merged-input-state-hash
                                                                                 (string->symbol
                                                                                  (string-append
                                                                                   name
                                                                                   "state611")))
                                                                              (add1
                                                                               (cdr
                                                                                (assoc-ref
                                                                                 merged-input-state-hash
                                                                                 (string->symbol
                                                                                  (string-append
                                                                                   name
                                                                                   "state611")))))
                                                                              0))))
                                                                         (append
                                                                          (list
                                                                           (cons
                                                                            (string->symbol
                                                                             (string-append
                                                                              name
                                                                              "state610"))
                                                                            (cons
                                                                             (signal-value
                                                                              btor612)
                                                                             (if (assoc-has-key?
                                                                                  merged-input-state-hash
                                                                                  (string->symbol
                                                                                   (string-append
                                                                                    name
                                                                                    "state610")))
                                                                               (add1
                                                                                (cdr
                                                                                 (assoc-ref
                                                                                  merged-input-state-hash
                                                                                  (string->symbol
                                                                                   (string-append
                                                                                    name
                                                                                    "state610")))))
                                                                               0))))
                                                                          (append
                                                                           (list
                                                                            (cons
                                                                             (string->symbol
                                                                              (string-append
                                                                               name
                                                                               "state608"))
                                                                             (cons
                                                                              (signal-value
                                                                               btor1963)
                                                                              (if (assoc-has-key?
                                                                                   merged-input-state-hash
                                                                                   (string->symbol
                                                                                    (string-append
                                                                                     name
                                                                                     "state608")))
                                                                                (add1
                                                                                 (cdr
                                                                                  (assoc-ref
                                                                                   merged-input-state-hash
                                                                                   (string->symbol
                                                                                    (string-append
                                                                                     name
                                                                                     "state608")))))
                                                                                0))))
                                                                           (append
                                                                            (list
                                                                             (cons
                                                                              (string->symbol
                                                                               (string-append
                                                                                name
                                                                                "state607"))
                                                                              (cons
                                                                               (signal-value
                                                                                btor609)
                                                                               (if (assoc-has-key?
                                                                                    merged-input-state-hash
                                                                                    (string->symbol
                                                                                     (string-append
                                                                                      name
                                                                                      "state607")))
                                                                                 (add1
                                                                                  (cdr
                                                                                   (assoc-ref
                                                                                    merged-input-state-hash
                                                                                    (string->symbol
                                                                                     (string-append
                                                                                      name
                                                                                      "state607")))))
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
                                                                                 btor240)
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
                                                                                  "state597"))
                                                                                (cons
                                                                                 (signal-value
                                                                                  btor1957)
                                                                                 (if (assoc-has-key?
                                                                                      merged-input-state-hash
                                                                                      (string->symbol
                                                                                       (string-append
                                                                                        name
                                                                                        "state597")))
                                                                                   (add1
                                                                                    (cdr
                                                                                     (assoc-ref
                                                                                      merged-input-state-hash
                                                                                      (string->symbol
                                                                                       (string-append
                                                                                        name
                                                                                        "state597")))))
                                                                                   0))))
                                                                              (append
                                                                               (list
                                                                                (cons
                                                                                 (string->symbol
                                                                                  (string-append
                                                                                   name
                                                                                   "state596"))
                                                                                 (cons
                                                                                  (signal-value
                                                                                   btor604)
                                                                                  (if (assoc-has-key?
                                                                                       merged-input-state-hash
                                                                                       (string->symbol
                                                                                        (string-append
                                                                                         name
                                                                                         "state596")))
                                                                                    (add1
                                                                                     (cdr
                                                                                      (assoc-ref
                                                                                       merged-input-state-hash
                                                                                       (string->symbol
                                                                                        (string-append
                                                                                         name
                                                                                         "state596")))))
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
                                                                                    btor240)
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
                                                                                     "state590"))
                                                                                   (cons
                                                                                    (signal-value
                                                                                     btor1951)
                                                                                    (if (assoc-has-key?
                                                                                         merged-input-state-hash
                                                                                         (string->symbol
                                                                                          (string-append
                                                                                           name
                                                                                           "state590")))
                                                                                      (add1
                                                                                       (cdr
                                                                                        (assoc-ref
                                                                                         merged-input-state-hash
                                                                                         (string->symbol
                                                                                          (string-append
                                                                                           name
                                                                                           "state590")))))
                                                                                      0))))
                                                                                 (append
                                                                                  (list
                                                                                   (cons
                                                                                    (string->symbol
                                                                                     (string-append
                                                                                      name
                                                                                      "state589"))
                                                                                    (cons
                                                                                     (signal-value
                                                                                      btor595)
                                                                                     (if (assoc-has-key?
                                                                                          merged-input-state-hash
                                                                                          (string->symbol
                                                                                           (string-append
                                                                                            name
                                                                                            "state589")))
                                                                                       (add1
                                                                                        (cdr
                                                                                         (assoc-ref
                                                                                          merged-input-state-hash
                                                                                          (string->symbol
                                                                                           (string-append
                                                                                            name
                                                                                            "state589")))))
                                                                                       0))))
                                                                                  (append
                                                                                   (list
                                                                                    (cons
                                                                                     (string->symbol
                                                                                      (string-append
                                                                                       name
                                                                                       "state352"))
                                                                                     (cons
                                                                                      (signal-value
                                                                                       btor370)
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
                                                                                       (string-append
                                                                                        name
                                                                                        "state350"))
                                                                                      (cons
                                                                                       (signal-value
                                                                                        btor1945)
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
                                                                                        (string-append
                                                                                         name
                                                                                         "state349"))
                                                                                       (cons
                                                                                        (signal-value
                                                                                         btor375)
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
       (cons 'R28 (signal (signal-value btor707) output-state))
       (cons 'EQPATB (signal (signal-value btor621) output-state))
       (cons 'CO53 (signal (signal-value btor579) output-state))
       (cons 'CO11 (signal (signal-value btor487) output-state))
       (cons 'CO17 (signal (signal-value btor499) output-state))
       (cons 'CO9 (signal (signal-value btor587) output-state))
       (cons 'R48 (signal (signal-value btor751) output-state))
       (cons 'CO45 (signal (signal-value btor561) output-state))
       (cons 'CO30 (signal (signal-value btor529) output-state))
       (cons 'R10 (signal (signal-value btor662) output-state))
       (cons 'CO28 (signal (signal-value btor523) output-state))
       (cons 'R1 (signal (signal-value btor660) output-state))
       (cons 'R47 (signal (signal-value btor749) output-state))
       (cons 'R51 (signal (signal-value btor759) output-state))
       (cons 'R34 (signal (signal-value btor721) output-state))
       (cons 'R27 (signal (signal-value btor705) output-state))
       (cons 'R17 (signal (signal-value btor676) output-state))
       (cons 'R49 (signal (signal-value btor753) output-state))
       (cons 'CO16 (signal (signal-value btor497) output-state))
       (cons 'CO44 (signal (signal-value btor559) output-state))
       (cons 'EQZM (signal (signal-value btor637) output-state))
       (cons 'R29 (signal (signal-value btor709) output-state))
       (cons 'CO52 (signal (signal-value btor577) output-state))
       (cons 'CO8 (signal (signal-value btor585) output-state))
       (cons 'R46 (signal (signal-value btor747) output-state))
       (cons 'CO10 (signal (signal-value btor485) output-state))
       (cons 'R50 (signal (signal-value btor757) output-state))
       (cons 'R26 (signal (signal-value btor703) output-state))
       (cons 'CO29 (signal (signal-value btor525) output-state))
       (cons 'R35 (signal (signal-value btor723) output-state))
       (cons 'R16 (signal (signal-value btor674) output-state))
       (cons 'CO31 (signal (signal-value btor531) output-state))
       (cons 'R11 (signal (signal-value btor664) output-state))
       (cons 'R0 (signal (signal-value btor658) output-state))
       (cons 'R3 (signal (signal-value btor711) output-state))
       (cons 'R9 (signal (signal-value btor771) output-state))
       (cons 'R36 (signal (signal-value btor725) output-state))
       (cons 'R25 (signal (signal-value btor701) output-state))
       (cons 'R12 (signal (signal-value btor666) output-state))
       (cons 'CO32 (signal (signal-value btor533) output-state))
       (cons 'R15 (signal (signal-value btor672) output-state))
       (cons 'CO13 (signal (signal-value btor491) output-state))
       (cons 'OVERUNDER (signal (signal-value btor653) output-state))
       (cons 'R45 (signal (signal-value btor745) output-state))
       (cons 'R53 (signal (signal-value btor763) output-state))
       (cons 'CO51 (signal (signal-value btor575) output-state))
       (cons 'EQPAT (signal (signal-value btor613) output-state))
       (cons 'CO15 (signal (signal-value btor495) output-state))
       (cons 'R37 (signal (signal-value btor727) output-state))
       (cons 'R13 (signal (signal-value btor668) output-state))
       (cons 'CO33 (signal (signal-value btor535) output-state))
       (cons 'R2 (signal (signal-value btor689) output-state))
       (cons 'R8 (signal (signal-value btor769) output-state))
       (cons 'CO14 (signal (signal-value btor493) output-state))
       (cons 'CO46 (signal (signal-value btor563) output-state))
       (cons 'EQOM (signal (signal-value btor605) output-state))
       (cons 'R44 (signal (signal-value btor743) output-state))
       (cons 'R14 (signal (signal-value btor670) output-state))
       (cons 'CO12 (signal (signal-value btor489) output-state))
       (cons 'R52 (signal (signal-value btor761) output-state))
       (cons 'CO50 (signal (signal-value btor573) output-state))
       (cons 'R24 (signal (signal-value btor699) output-state))
       (cons 'R42 (signal (signal-value btor739) output-state))
       (cons 'CO40 (signal (signal-value btor551) output-state))
       (cons 'CO49 (signal (signal-value btor569) output-state))
       (cons 'R33 (signal (signal-value btor719) output-state))
       (cons 'R22 (signal (signal-value btor695) output-state))
       (cons 'CO3 (signal (signal-value btor527) output-state))
       (cons 'R39 (signal (signal-value btor731) output-state))
       (cons 'CO35 (signal (signal-value btor539) output-state))
       (cons 'CO4 (signal (signal-value btor549) output-state))
       (cons 'R4 (signal (signal-value btor733) output-state))
       (cons 'UNDER (signal (signal-value btor781) output-state))
       (cons 'CO25 (signal (signal-value btor517) output-state))
       (cons 'CO21 (signal (signal-value btor509) output-state))
       (cons 'R43 (signal (signal-value btor741) output-state))
       (cons 'R32 (signal (signal-value btor717) output-state))
       (cons 'R38 (signal (signal-value btor729) output-state))
       (cons 'R23 (signal (signal-value btor697) output-state))
       (cons 'CO2 (signal (signal-value btor505) output-state))
       (cons 'CO5 (signal (signal-value btor571) output-state))
       (cons 'CO41 (signal (signal-value btor553) output-state))
       (cons 'CO48 (signal (signal-value btor567) output-state))
       (cons 'CO34 (signal (signal-value btor537) output-state))
       (cons 'CO20 (signal (signal-value btor507) output-state))
       (cons 'CO47 (signal (signal-value btor565) output-state))
       (cons 'R5 (signal (signal-value btor755) output-state))
       (cons 'R6 (signal (signal-value btor765) output-state))
       (cons 'R18 (signal (signal-value btor685) output-state))
       (cons 'CO27 (signal (signal-value btor521) output-state))
       (cons 'CO23 (signal (signal-value btor513) output-state))
       (cons 'CO39 (signal (signal-value btor547) output-state))
       (cons 'CO24 (signal (signal-value btor515) output-state))
       (cons 'R40 (signal (signal-value btor735) output-state))
       (cons 'CO36 (signal (signal-value btor541) output-state))
       (cons 'OVER (signal (signal-value btor645) output-state))
       (cons 'R20 (signal (signal-value btor691) output-state))
       (cons 'SIGNEDR (signal (signal-value btor773) output-state))
       (cons 'CO18 (signal (signal-value btor501) output-state))
       (cons 'CO42 (signal (signal-value btor555) output-state))
       (cons 'R31 (signal (signal-value btor715) output-state))
       (cons 'CO1 (signal (signal-value btor483) output-state))
       (cons 'CO6 (signal (signal-value btor581) output-state))
       (cons 'CO38 (signal (signal-value btor545) output-state))
       (cons 'CO26 (signal (signal-value btor519) output-state))
       (cons 'CO22 (signal (signal-value btor511) output-state))
       (cons 'R7 (signal (signal-value btor767) output-state))
       (cons 'R19 (signal (signal-value btor687) output-state))
       (cons 'EQZ (signal (signal-value btor629) output-state))
       (cons 'R21 (signal (signal-value btor693) output-state))
       (cons 'CO7 (signal (signal-value btor583) output-state))
       (cons 'R30 (signal (signal-value btor713) output-state))
       (cons 'CO19 (signal (signal-value btor503) output-state))
       (cons 'CO0 (signal (signal-value btor481) output-state))
       (cons 'CO43 (signal (signal-value btor557) output-state))
       (cons 'R41 (signal (signal-value btor737) output-state))
       (cons 'CO37 (signal (signal-value btor543) output-state))))))
