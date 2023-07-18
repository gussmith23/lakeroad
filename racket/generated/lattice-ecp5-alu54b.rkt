;;; Generated from
;;; https://github.com/uwsampl/lakeroad-private/blob/dc6e4042af4f7a3fc0ccfe35566ee46419ba071f/lattice_ecp5/modified_ALU54B.v
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
      #:unnamed-input-872
      (unnamed-input-872
       (bv->signal (constant 'unnamed-input-872 (bitvector 55))))
      #:unnamed-input-1118
      (unnamed-input-1118
       (bv->signal (constant 'unnamed-input-1118 (bitvector 55))))
      #:unnamed-input-1364
      (unnamed-input-1364
       (bv->signal (constant 'unnamed-input-1364 (bitvector 55))))
      #:name
      (name ""))
    (let* ((merged-input-state-hash (list))
           (init-hash
            (append
             (list
              (cons
               (string->symbol (string-append name "state1983"))
               (bv 0 (bitvector 1))))
             (append
              (list
               (cons
                (string->symbol (string-append name "state1976"))
                (bv 1 (bitvector 1))))
              (append
               (list
                (cons
                 (string->symbol (string-append name "state1930"))
                 (bv 0 (bitvector 1))))
               (append
                (list
                 (cons
                  (string->symbol (string-append name "state1923"))
                  (bv 1 (bitvector 1))))
                (append
                 (list
                  (cons
                   (string->symbol (string-append name "state1905"))
                   (bv 0 (bitvector 1))))
                 (append
                  (list
                   (cons
                    (string->symbol (string-append name "state1898"))
                    (bv 1 (bitvector 1))))
                  (append
                   (list
                    (cons
                     (string->symbol (string-append name "state1671"))
                     (bv 0 (bitvector 1))))
                   (append
                    (list
                     (cons
                      (string->symbol (string-append name "state1664"))
                      (bv 1 (bitvector 1))))
                    (append
                     (list
                      (cons
                       (string->symbol (string-append name "state1124"))
                       (bv 1 (bitvector 1))))
                     (append
                      (list
                       (cons
                        (string->symbol (string-append name "state1016"))
                        (bv 0 (bitvector 1))))
                      (append
                       (list
                        (cons
                         (string->symbol (string-append name "state1009"))
                         (bv 1 (bitvector 1))))
                       (append
                        (list
                         (cons
                          (string->symbol (string-append name "state895"))
                          (bv 1 (bitvector 1))))
                        (append
                         (list
                          (cons
                           (string->symbol (string-append name "state883"))
                           (bv 0 (bitvector 1))))
                         (append
                          (list
                           (cons
                            (string->symbol (string-append name "state876"))
                            (bv 1 (bitvector 1))))
                          (append
                           (list
                            (cons
                             (string->symbol (string-append name "state844"))
                             (bv 0 (bitvector 1))))
                           (append
                            (list
                             (cons
                              (string->symbol (string-append name "state837"))
                              (bv 1 (bitvector 1))))
                            (append
                             (list
                              (cons
                               (string->symbol (string-append name "state739"))
                               (bv 0 (bitvector 1))))
                             (append
                              (list
                               (cons
                                (string->symbol
                                 (string-append name "state732"))
                                (bv 1 (bitvector 1))))
                              (append
                               (list
                                (cons
                                 (string->symbol
                                  (string-append name "state705"))
                                 (bv 1 (bitvector 1))))
                               (append
                                (list
                                 (cons
                                  (string->symbol
                                   (string-append name "state696"))
                                  (bv 0 (bitvector 1))))
                                (append
                                 (list
                                  (cons
                                   (string->symbol
                                    (string-append name "state689"))
                                   (bv 1 (bitvector 1))))
                                 (append
                                  (list
                                   (cons
                                    (string->symbol
                                     (string-append name "state680"))
                                    (bv 0 (bitvector 1))))
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
                                       (string-append name "state664"))
                                      (bv 0 (bitvector 1))))
                                    (append
                                     (list
                                      (cons
                                       (string->symbol
                                        (string-append name "state657"))
                                       (bv 1 (bitvector 1))))
                                     (append
                                      (list
                                       (cons
                                        (string->symbol
                                         (string-append name "state648"))
                                        (bv 0 (bitvector 1))))
                                      (append
                                       (list
                                        (cons
                                         (string->symbol
                                          (string-append name "state641"))
                                         (bv 1 (bitvector 1))))
                                       (append
                                        (list
                                         (cons
                                          (string->symbol
                                           (string-append name "state632"))
                                          (bv 0 (bitvector 1))))
                                        (append
                                         (list
                                          (cons
                                           (string->symbol
                                            (string-append name "state625"))
                                           (bv 1 (bitvector 1))))
                                         (append
                                          (list
                                           (cons
                                            (string->symbol
                                             (string-append name "state616"))
                                            (bv 0 (bitvector 1))))
                                          (append
                                           (list
                                            (cons
                                             (string->symbol
                                              (string-append name "state609"))
                                             (bv 1 (bitvector 1))))
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
                                                (string-append
                                                 name
                                                 "state591"))
                                               (bv 1 (bitvector 1))))
                                             (append
                                              (list
                                               (cons
                                                (string->symbol
                                                 (string-append
                                                  name
                                                  "state352"))
                                                (bv 1 (bitvector 1))))
                                              (list))))))))))))))))))))))))))))))))))))
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
           (btor12 A18)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state A18)))
           (btor13 A19)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state A19)))
           (btor14 A2)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state A2)))
           (btor15 A20)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state A20)))
           (btor16 A21)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state A21)))
           (btor17 A22)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state A22)))
           (btor18 A23)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state A23)))
           (btor19 A24)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state A24)))
           (btor20 A25)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state A25)))
           (btor21 A26)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state A26)))
           (btor22 A27)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state A27)))
           (btor23 A28)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state A28)))
           (btor24 A29)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state A29)))
           (btor25 A3)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state A3)))
           (btor26 A30)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state A30)))
           (btor27 A31)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state A31)))
           (btor28 A32)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state A32)))
           (btor29 A33)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state A33)))
           (btor30 A34)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state A34)))
           (btor31 A35)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state A35)))
           (btor32 A4)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state A4)))
           (btor33 A5)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state A5)))
           (btor34 A6)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state A6)))
           (btor35 A7)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state A7)))
           (btor36 A8)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state A8)))
           (btor37 A9)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state A9)))
           (btor38 B0)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state B0)))
           (btor39 B1)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state B1)))
           (btor40 B10)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state B10)))
           (btor41 B11)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state B11)))
           (btor42 B12)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state B12)))
           (btor43 B13)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state B13)))
           (btor44 B14)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state B14)))
           (btor45 B15)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state B15)))
           (btor46 B16)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state B16)))
           (btor47 B17)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state B17)))
           (btor48 B18)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state B18)))
           (btor49 B19)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state B19)))
           (btor50 B2)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state B2)))
           (btor51 B20)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state B20)))
           (btor52 B21)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state B21)))
           (btor53 B22)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state B22)))
           (btor54 B23)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state B23)))
           (btor55 B24)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state B24)))
           (btor56 B25)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state B25)))
           (btor57 B26)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state B26)))
           (btor58 B27)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state B27)))
           (btor59 B28)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state B28)))
           (btor60 B29)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state B29)))
           (btor61 B3)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state B3)))
           (btor62 B30)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state B30)))
           (btor63 B31)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state B31)))
           (btor64 B32)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state B32)))
           (btor65 B33)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state B33)))
           (btor66 B34)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state B34)))
           (btor67 B35)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state B35)))
           (btor68 B4)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state B4)))
           (btor69 B5)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state B5)))
           (btor70 B6)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state B6)))
           (btor71 B7)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state B7)))
           (btor72 B8)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state B8)))
           (btor73 B9)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state B9)))
           (btor74 C0)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state C0)))
           (btor75 C1)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state C1)))
           (btor76 C10)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state C10)))
           (btor77 C11)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state C11)))
           (btor78 C12)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state C12)))
           (btor79 C13)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state C13)))
           (btor80 C14)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state C14)))
           (btor81 C15)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state C15)))
           (btor82 C16)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state C16)))
           (btor83 C17)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state C17)))
           (btor84 C18)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state C18)))
           (btor85 C19)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state C19)))
           (btor86 C2)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state C2)))
           (btor87 C20)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state C20)))
           (btor88 C21)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state C21)))
           (btor89 C22)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state C22)))
           (btor90 C23)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state C23)))
           (btor91 C24)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state C24)))
           (btor92 C25)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state C25)))
           (btor93 C26)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state C26)))
           (btor94 C27)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state C27)))
           (btor95 C28)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state C28)))
           (btor96 C29)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state C29)))
           (btor97 C3)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state C3)))
           (btor98 C30)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state C30)))
           (btor99 C31)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state C31)))
           (btor100 C32)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state C32)))
           (btor101 C33)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state C33)))
           (btor102 C34)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state C34)))
           (btor103 C35)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state C35)))
           (btor104 C36)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state C36)))
           (btor105 C37)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state C37)))
           (btor106 C38)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state C38)))
           (btor107 C39)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state C39)))
           (btor108 C4)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state C4)))
           (btor109 C40)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state C40)))
           (btor110 C41)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state C41)))
           (btor111 C42)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state C42)))
           (btor112 C43)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state C43)))
           (btor113 C44)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state C44)))
           (btor114 C45)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state C45)))
           (btor115 C46)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state C46)))
           (btor116 C47)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state C47)))
           (btor117 C48)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state C48)))
           (btor118 C49)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state C49)))
           (btor119 C5)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state C5)))
           (btor120 C50)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state C50)))
           (btor121 C51)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state C51)))
           (btor122 C52)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state C52)))
           (btor123 C53)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state C53)))
           (btor124 C6)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state C6)))
           (btor125 C7)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state C7)))
           (btor126 C8)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state C8)))
           (btor127 C9)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state C9)))
           (btor128 CE0)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CE0)))
           (btor129 CE1)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CE1)))
           (btor130 CE2)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CE2)))
           (btor131 CE3)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CE3)))
           (btor132 CFB0)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CFB0)))
           (btor133 CFB1)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CFB1)))
           (btor134 CFB10)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CFB10)))
           (btor135 CFB11)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CFB11)))
           (btor136 CFB12)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CFB12)))
           (btor137 CFB13)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CFB13)))
           (btor138 CFB14)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CFB14)))
           (btor139 CFB15)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CFB15)))
           (btor140 CFB16)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CFB16)))
           (btor141 CFB17)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CFB17)))
           (btor142 CFB18)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CFB18)))
           (btor143 CFB19)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CFB19)))
           (btor144 CFB2)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CFB2)))
           (btor145 CFB20)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CFB20)))
           (btor146 CFB21)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CFB21)))
           (btor147 CFB22)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CFB22)))
           (btor148 CFB23)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CFB23)))
           (btor149 CFB24)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CFB24)))
           (btor150 CFB25)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CFB25)))
           (btor151 CFB26)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CFB26)))
           (btor152 CFB27)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CFB27)))
           (btor153 CFB28)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CFB28)))
           (btor154 CFB29)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CFB29)))
           (btor155 CFB3)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CFB3)))
           (btor156 CFB30)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CFB30)))
           (btor157 CFB31)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CFB31)))
           (btor158 CFB32)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CFB32)))
           (btor159 CFB33)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CFB33)))
           (btor160 CFB34)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CFB34)))
           (btor161 CFB35)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CFB35)))
           (btor162 CFB36)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CFB36)))
           (btor163 CFB37)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CFB37)))
           (btor164 CFB38)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CFB38)))
           (btor165 CFB39)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CFB39)))
           (btor166 CFB4)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CFB4)))
           (btor167 CFB40)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CFB40)))
           (btor168 CFB41)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CFB41)))
           (btor169 CFB42)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CFB42)))
           (btor170 CFB43)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CFB43)))
           (btor171 CFB44)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CFB44)))
           (btor172 CFB45)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CFB45)))
           (btor173 CFB46)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CFB46)))
           (btor174 CFB47)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CFB47)))
           (btor175 CFB48)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CFB48)))
           (btor176 CFB49)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CFB49)))
           (btor177 CFB5)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CFB5)))
           (btor178 CFB50)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CFB50)))
           (btor179 CFB51)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CFB51)))
           (btor180 CFB52)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CFB52)))
           (btor181 CFB53)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CFB53)))
           (btor182 CFB6)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CFB6)))
           (btor183 CFB7)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CFB7)))
           (btor184 CFB8)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CFB8)))
           (btor185 CFB9)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CFB9)))
           (btor186 CIN0)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CIN0)))
           (btor187 CIN1)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CIN1)))
           (btor188 CIN10)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CIN10)))
           (btor189 CIN11)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CIN11)))
           (btor190 CIN12)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CIN12)))
           (btor191 CIN13)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CIN13)))
           (btor192 CIN14)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CIN14)))
           (btor193 CIN15)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CIN15)))
           (btor194 CIN16)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CIN16)))
           (btor195 CIN17)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CIN17)))
           (btor196 CIN18)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CIN18)))
           (btor197 CIN19)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CIN19)))
           (btor198 CIN2)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CIN2)))
           (btor199 CIN20)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CIN20)))
           (btor200 CIN21)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CIN21)))
           (btor201 CIN22)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CIN22)))
           (btor202 CIN23)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CIN23)))
           (btor203 CIN24)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CIN24)))
           (btor204 CIN25)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CIN25)))
           (btor205 CIN26)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CIN26)))
           (btor206 CIN27)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CIN27)))
           (btor207 CIN28)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CIN28)))
           (btor208 CIN29)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CIN29)))
           (btor209 CIN3)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CIN3)))
           (btor210 CIN30)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CIN30)))
           (btor211 CIN31)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CIN31)))
           (btor212 CIN32)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CIN32)))
           (btor213 CIN33)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CIN33)))
           (btor214 CIN34)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CIN34)))
           (btor215 CIN35)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CIN35)))
           (btor216 CIN36)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CIN36)))
           (btor217 CIN37)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CIN37)))
           (btor218 CIN38)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CIN38)))
           (btor219 CIN39)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CIN39)))
           (btor220 CIN4)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CIN4)))
           (btor221 CIN40)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CIN40)))
           (btor222 CIN41)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CIN41)))
           (btor223 CIN42)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CIN42)))
           (btor224 CIN43)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CIN43)))
           (btor225 CIN44)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CIN44)))
           (btor226 CIN45)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CIN45)))
           (btor227 CIN46)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CIN46)))
           (btor228 CIN47)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CIN47)))
           (btor229 CIN48)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CIN48)))
           (btor230 CIN49)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CIN49)))
           (btor231 CIN5)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CIN5)))
           (btor232 CIN50)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CIN50)))
           (btor233 CIN51)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CIN51)))
           (btor234 CIN52)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CIN52)))
           (btor235 CIN53)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CIN53)))
           (btor236 CIN6)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CIN6)))
           (btor237 CIN7)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CIN7)))
           (btor238 CIN8)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CIN8)))
           (btor239 CIN9)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CIN9)))
           (btor240 CLK0)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CLK0)))
           (btor241 CLK1)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CLK1)))
           (btor242 CLK2)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CLK2)))
           (btor243 CLK3)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CLK3)))
           (btor244 (bitvector 5))
           (btor245 FORCE_ZERO_BARREL_SHIFT)
           (merged-input-state-hash
            (append
             merged-input-state-hash
             (signal-state FORCE_ZERO_BARREL_SHIFT)))
           (btor246 LEGACY)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state LEGACY)))
           (btor247 MA0)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MA0)))
           (btor248 MA1)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MA1)))
           (btor249 MA10)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MA10)))
           (btor250 MA11)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MA11)))
           (btor251 MA12)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MA12)))
           (btor252 MA13)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MA13)))
           (btor253 MA14)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MA14)))
           (btor254 MA15)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MA15)))
           (btor255 MA16)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MA16)))
           (btor256 MA17)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MA17)))
           (btor257 MA18)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MA18)))
           (btor258 MA19)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MA19)))
           (btor259 MA2)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MA2)))
           (btor260 MA20)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MA20)))
           (btor261 MA21)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MA21)))
           (btor262 MA22)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MA22)))
           (btor263 MA23)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MA23)))
           (btor264 MA24)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MA24)))
           (btor265 MA25)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MA25)))
           (btor266 MA26)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MA26)))
           (btor267 MA27)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MA27)))
           (btor268 MA28)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MA28)))
           (btor269 MA29)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MA29)))
           (btor270 MA3)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MA3)))
           (btor271 MA30)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MA30)))
           (btor272 MA31)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MA31)))
           (btor273 MA32)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MA32)))
           (btor274 MA33)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MA33)))
           (btor275 MA34)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MA34)))
           (btor276 MA35)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MA35)))
           (btor277 MA4)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MA4)))
           (btor278 MA5)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MA5)))
           (btor279 MA6)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MA6)))
           (btor280 MA7)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MA7)))
           (btor281 MA8)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MA8)))
           (btor282 MA9)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MA9)))
           (btor283 (bitvector 56))
           (btor284 MASK01)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MASK01)))
           (btor285 MASKPAT)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MASKPAT)))
           (btor286 MASKPAT_SOURCE)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MASKPAT_SOURCE)))
           (btor287 MB0)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MB0)))
           (btor288 MB1)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MB1)))
           (btor289 MB10)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MB10)))
           (btor290 MB11)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MB11)))
           (btor291 MB12)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MB12)))
           (btor292 MB13)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MB13)))
           (btor293 MB14)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MB14)))
           (btor294 MB15)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MB15)))
           (btor295 MB16)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MB16)))
           (btor296 MB17)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MB17)))
           (btor297 MB18)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MB18)))
           (btor298 MB19)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MB19)))
           (btor299 MB2)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MB2)))
           (btor300 MB20)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MB20)))
           (btor301 MB21)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MB21)))
           (btor302 MB22)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MB22)))
           (btor303 MB23)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MB23)))
           (btor304 MB24)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MB24)))
           (btor305 MB25)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MB25)))
           (btor306 MB26)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MB26)))
           (btor307 MB27)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MB27)))
           (btor308 MB28)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MB28)))
           (btor309 MB29)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MB29)))
           (btor310 MB3)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MB3)))
           (btor311 MB30)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MB30)))
           (btor312 MB31)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MB31)))
           (btor313 MB32)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MB32)))
           (btor314 MB33)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MB33)))
           (btor315 MB34)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MB34)))
           (btor316 MB35)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MB35)))
           (btor317 MB4)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MB4)))
           (btor318 MB5)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MB5)))
           (btor319 MB6)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MB6)))
           (btor320 MB7)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MB7)))
           (btor321 MB8)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MB8)))
           (btor322 MB9)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MB9)))
           (btor323 MCPAT)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MCPAT)))
           (btor324 MCPAT_SOURCE)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MCPAT_SOURCE)))
           (btor325 MULT9_MODE)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state MULT9_MODE)))
           (btor326 OP0)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state OP0)))
           (btor327 OP1)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state OP1)))
           (btor328 OP10)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state OP10)))
           (btor329 OP2)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state OP2)))
           (btor330 OP3)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state OP3)))
           (btor331 OP4)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state OP4)))
           (btor332 OP5)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state OP5)))
           (btor333 OP6)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state OP6)))
           (btor334 OP7)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state OP7)))
           (btor335 OP8)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state OP8)))
           (btor336 OP9)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state OP9)))
           (btor337 REG_INPUTCFB_CE)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state REG_INPUTCFB_CE)))
           (btor338 REG_INPUTCFB_CLK)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state REG_INPUTCFB_CLK)))
           (btor339 REG_INPUTCFB_RST)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state REG_INPUTCFB_RST)))
           (btor340 RNDPAT)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state RNDPAT)))
           (btor341 RST0)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state RST0)))
           (btor342 RST1)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state RST1)))
           (btor343 RST2)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state RST2)))
           (btor344 RST3)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state RST3)))
           (btor345 SIGNEDCIN)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SIGNEDCIN)))
           (btor346 SIGNEDIA)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SIGNEDIA)))
           (btor347 SIGNEDIB)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state SIGNEDIB)))
           (btor348 (bitvector 54))
           (btor349
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state349")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state349")))))
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
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state350")))))
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
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state589")))))
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
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state591")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state591")))))
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
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state596")))))
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
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state597")))))
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
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state599")))))
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
           (btor602 (bv->signal (bv 1 (bitvector 2))))
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
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state608")))))
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
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state609")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state609")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state609")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state609")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor611
            (signal
             (concat (signal-value btor240) (signal-value btor609))
             (list)))
           (btor612
            (signal
             (bool->bitvector
              (bveq (signal-value btor611) (signal-value btor373)))
             (list)))
           (btor613
            (if (bitvector->bool (signal-value btor612)) btor608 btor607))
           (btor614
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state614")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state614")))))
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
           (btor615
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state615")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state615")))))
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
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state616")))))
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
           (btor618
            (signal
             (concat (signal-value btor240) (signal-value btor616))
             (list)))
           (btor619
            (signal
             (bool->bitvector
              (bveq (signal-value btor618) (signal-value btor602)))
             (list)))
           (btor620
            (if (bitvector->bool (signal-value btor619)) btor615 btor614))
           (btor621
            (signal
             (bvxor (signal-value btor613) (signal-value btor620))
             (list)))
           (btor623
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state623")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state623")))))
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
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state624")))))
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
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state625")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state625")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state625")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state625")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor627
            (signal
             (concat (signal-value btor240) (signal-value btor625))
             (list)))
           (btor628
            (signal
             (bool->bitvector
              (bveq (signal-value btor627) (signal-value btor373)))
             (list)))
           (btor629
            (if (bitvector->bool (signal-value btor628)) btor624 btor623))
           (btor630
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state630")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state630")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state630")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state630")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor631
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state631")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state631")))))
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
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state632")))))
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
           (btor634
            (signal
             (concat (signal-value btor240) (signal-value btor632))
             (list)))
           (btor635
            (signal
             (bool->bitvector
              (bveq (signal-value btor634) (signal-value btor602)))
             (list)))
           (btor636
            (if (bitvector->bool (signal-value btor635)) btor631 btor630))
           (btor637
            (signal
             (bvxor (signal-value btor629) (signal-value btor636))
             (list)))
           (btor639
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state639")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state639")))))
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
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state640")))))
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
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state641")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state641")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state641")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state641")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor643
            (signal
             (concat (signal-value btor240) (signal-value btor641))
             (list)))
           (btor644
            (signal
             (bool->bitvector
              (bveq (signal-value btor643) (signal-value btor373)))
             (list)))
           (btor645
            (if (bitvector->bool (signal-value btor644)) btor640 btor639))
           (btor646
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state646")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state646")))))
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
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state647")))))
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
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state648")))))
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
           (btor650
            (signal
             (concat (signal-value btor240) (signal-value btor648))
             (list)))
           (btor651
            (signal
             (bool->bitvector
              (bveq (signal-value btor650) (signal-value btor602)))
             (list)))
           (btor652
            (if (bitvector->bool (signal-value btor651)) btor647 btor646))
           (btor653
            (signal
             (bvxor (signal-value btor645) (signal-value btor652))
             (list)))
           (btor655
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state655")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state655")))))
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
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor656
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state656")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state656")))))
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
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state657")))))
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
            (signal
             (concat (signal-value btor240) (signal-value btor657))
             (list)))
           (btor660
            (signal
             (bool->bitvector
              (bveq (signal-value btor659) (signal-value btor373)))
             (list)))
           (btor661
            (if (bitvector->bool (signal-value btor660)) btor656 btor655))
           (btor662
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state662")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state662")))))
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
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state663")))))
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
           (btor664
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state664")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state664")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state664")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state664")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor666
            (signal
             (concat (signal-value btor240) (signal-value btor664))
             (list)))
           (btor667
            (signal
             (bool->bitvector
              (bveq (signal-value btor666) (signal-value btor602)))
             (list)))
           (btor668
            (if (bitvector->bool (signal-value btor667)) btor663 btor662))
           (btor669
            (signal
             (bvxor (signal-value btor661) (signal-value btor668))
             (list)))
           (btor671
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state671")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state671")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state671")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state671")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor672
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state672")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state672")))))
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
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor673
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state673")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state673")))))
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
             (concat (signal-value btor240) (signal-value btor673))
             (list)))
           (btor676
            (signal
             (bool->bitvector
              (bveq (signal-value btor675) (signal-value btor373)))
             (list)))
           (btor677
            (if (bitvector->bool (signal-value btor676)) btor672 btor671))
           (btor678
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state678")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state678")))))
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
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
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
           (btor682
            (signal
             (concat (signal-value btor240) (signal-value btor680))
             (list)))
           (btor683
            (signal
             (bool->bitvector
              (bveq (signal-value btor682) (signal-value btor602)))
             (list)))
           (btor684
            (if (bitvector->bool (signal-value btor683)) btor679 btor678))
           (btor685
            (signal
             (bvxor (signal-value btor677) (signal-value btor684))
             (list)))
           (btor687
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state687")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state687")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state687")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state687")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor688
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state688")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state688")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state688")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state688")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor689
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state689")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state689")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state689")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state689")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor691
            (signal
             (concat (signal-value btor240) (signal-value btor689))
             (list)))
           (btor692
            (signal
             (bool->bitvector
              (bveq (signal-value btor691) (signal-value btor373)))
             (list)))
           (btor693
            (if (bitvector->bool (signal-value btor692)) btor688 btor687))
           (btor694
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state694")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state694")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state694")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state694")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor695
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state695")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state695")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state695")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state695")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor696
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state696")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state696")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state696")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state696")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor698
            (signal
             (concat (signal-value btor240) (signal-value btor696))
             (list)))
           (btor699
            (signal
             (bool->bitvector
              (bveq (signal-value btor698) (signal-value btor602)))
             (list)))
           (btor700
            (if (bitvector->bool (signal-value btor699)) btor695 btor694))
           (btor701
            (signal
             (bvxor (signal-value btor693) (signal-value btor700))
             (list)))
           (btor703
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state703")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state703")))))
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
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor704
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state704")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state704")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state704")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state704")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor705
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state705")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state705")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state705")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state705")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor707
            (signal
             (concat (signal-value btor240) (signal-value btor705))
             (list)))
           (btor708
            (signal
             (bool->bitvector
              (bveq (signal-value btor707) (signal-value btor373)))
             (list)))
           (btor709
            (if (bitvector->bool (signal-value btor708)) btor704 btor703))
           (btor710
            (signal
             (extract 0 0 (signal-value btor709))
             (signal-state btor709)))
           (btor712
            (signal
             (extract 1 1 (signal-value btor709))
             (signal-state btor709)))
           (btor714
            (signal
             (extract 10 10 (signal-value btor709))
             (signal-state btor709)))
           (btor716
            (signal
             (extract 11 11 (signal-value btor709))
             (signal-state btor709)))
           (btor718
            (signal
             (extract 12 12 (signal-value btor709))
             (signal-state btor709)))
           (btor720
            (signal
             (extract 13 13 (signal-value btor709))
             (signal-state btor709)))
           (btor722
            (signal
             (extract 14 14 (signal-value btor709))
             (signal-state btor709)))
           (btor724
            (signal
             (extract 15 15 (signal-value btor709))
             (signal-state btor709)))
           (btor726
            (signal
             (extract 16 16 (signal-value btor709))
             (signal-state btor709)))
           (btor728
            (signal
             (extract 17 17 (signal-value btor709))
             (signal-state btor709)))
           (btor730
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state730")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state730")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state730")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state730")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 37))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor731
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state731")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state731")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state731")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state731")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 37))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor732
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state732")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state732")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state732")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state732")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor734
            (signal
             (concat (signal-value btor240) (signal-value btor732))
             (list)))
           (btor735
            (signal
             (bool->bitvector
              (bveq (signal-value btor734) (signal-value btor373)))
             (list)))
           (btor736
            (if (bitvector->bool (signal-value btor735)) btor731 btor730))
           (btor737
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state737")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state737")))))
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
                          (bv 0 37))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor738
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state738")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state738")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state738")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state738")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 37))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor739
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state739")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state739")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state739")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state739")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor741
            (signal
             (concat (signal-value btor240) (signal-value btor739))
             (list)))
           (btor742
            (signal
             (bool->bitvector
              (bveq (signal-value btor741) (signal-value btor602)))
             (list)))
           (btor743
            (if (bitvector->bool (signal-value btor742)) btor738 btor737))
           (btor744
            (signal
             (bvxor (signal-value btor736) (signal-value btor743))
             (list)))
           (btor745
            (signal
             (extract 0 0 (signal-value btor744))
             (signal-state btor744)))
           (btor747
            (signal
             (extract 1 1 (signal-value btor744))
             (signal-state btor744)))
           (btor749
            (signal
             (extract 2 2 (signal-value btor709))
             (signal-state btor709)))
           (btor751
            (signal
             (extract 2 2 (signal-value btor744))
             (signal-state btor744)))
           (btor753
            (signal
             (extract 3 3 (signal-value btor744))
             (signal-state btor744)))
           (btor755
            (signal
             (extract 4 4 (signal-value btor744))
             (signal-state btor744)))
           (btor757
            (signal
             (extract 5 5 (signal-value btor744))
             (signal-state btor744)))
           (btor759
            (signal
             (extract 6 6 (signal-value btor744))
             (signal-state btor744)))
           (btor761
            (signal
             (extract 7 7 (signal-value btor744))
             (signal-state btor744)))
           (btor763
            (signal
             (extract 8 8 (signal-value btor744))
             (signal-state btor744)))
           (btor765
            (signal
             (extract 9 9 (signal-value btor744))
             (signal-state btor744)))
           (btor767
            (signal
             (extract 10 10 (signal-value btor744))
             (signal-state btor744)))
           (btor769
            (signal
             (extract 11 11 (signal-value btor744))
             (signal-state btor744)))
           (btor771
            (signal
             (extract 3 3 (signal-value btor709))
             (signal-state btor709)))
           (btor773
            (signal
             (extract 12 12 (signal-value btor744))
             (signal-state btor744)))
           (btor775
            (signal
             (extract 13 13 (signal-value btor744))
             (signal-state btor744)))
           (btor777
            (signal
             (extract 14 14 (signal-value btor744))
             (signal-state btor744)))
           (btor779
            (signal
             (extract 15 15 (signal-value btor744))
             (signal-state btor744)))
           (btor781
            (signal
             (extract 16 16 (signal-value btor744))
             (signal-state btor744)))
           (btor783
            (signal
             (extract 17 17 (signal-value btor744))
             (signal-state btor744)))
           (btor785
            (signal
             (extract 18 18 (signal-value btor744))
             (signal-state btor744)))
           (btor787
            (signal
             (extract 19 19 (signal-value btor744))
             (signal-state btor744)))
           (btor789
            (signal
             (extract 20 20 (signal-value btor744))
             (signal-state btor744)))
           (btor791
            (signal
             (extract 21 21 (signal-value btor744))
             (signal-state btor744)))
           (btor793
            (signal
             (extract 4 4 (signal-value btor709))
             (signal-state btor709)))
           (btor795
            (signal
             (extract 22 22 (signal-value btor744))
             (signal-state btor744)))
           (btor797
            (signal
             (extract 23 23 (signal-value btor744))
             (signal-state btor744)))
           (btor799
            (signal
             (extract 24 24 (signal-value btor744))
             (signal-state btor744)))
           (btor801
            (signal
             (extract 25 25 (signal-value btor744))
             (signal-state btor744)))
           (btor803
            (signal
             (extract 26 26 (signal-value btor744))
             (signal-state btor744)))
           (btor805
            (signal
             (extract 27 27 (signal-value btor744))
             (signal-state btor744)))
           (btor807
            (signal
             (extract 28 28 (signal-value btor744))
             (signal-state btor744)))
           (btor809
            (signal
             (extract 29 29 (signal-value btor744))
             (signal-state btor744)))
           (btor811
            (signal
             (extract 30 30 (signal-value btor744))
             (signal-state btor744)))
           (btor813
            (signal
             (extract 31 31 (signal-value btor744))
             (signal-state btor744)))
           (btor815
            (signal
             (extract 5 5 (signal-value btor709))
             (signal-state btor709)))
           (btor817
            (signal
             (extract 32 32 (signal-value btor744))
             (signal-state btor744)))
           (btor819
            (signal
             (extract 33 33 (signal-value btor744))
             (signal-state btor744)))
           (btor821
            (signal
             (extract 34 34 (signal-value btor744))
             (signal-state btor744)))
           (btor823
            (signal
             (extract 35 35 (signal-value btor744))
             (signal-state btor744)))
           (btor825
            (signal
             (extract 6 6 (signal-value btor709))
             (signal-state btor709)))
           (btor827
            (signal
             (extract 7 7 (signal-value btor709))
             (signal-state btor709)))
           (btor829
            (signal
             (extract 8 8 (signal-value btor709))
             (signal-state btor709)))
           (btor831
            (signal
             (extract 9 9 (signal-value btor709))
             (signal-state btor709)))
           (btor833
            (signal
             (bvor (signal-value btor346) (signal-value btor347))
             (list)))
           (btor835
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state835")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state835")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state835")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state835")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor836
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state836")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state836")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state836")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state836")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor837
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state837")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state837")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state837")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state837")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor839
            (signal
             (concat (signal-value btor240) (signal-value btor837))
             (list)))
           (btor840
            (signal
             (bool->bitvector
              (bveq (signal-value btor839) (signal-value btor373)))
             (list)))
           (btor841
            (if (bitvector->bool (signal-value btor840)) btor836 btor835))
           (btor842
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state842")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state842")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state842")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state842")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor843
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state843")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state843")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state843")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state843")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor844
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state844")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state844")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state844")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state844")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor846
            (signal
             (concat (signal-value btor240) (signal-value btor844))
             (list)))
           (btor847
            (signal
             (bool->bitvector
              (bveq (signal-value btor846) (signal-value btor602)))
             (list)))
           (btor848
            (if (bitvector->bool (signal-value btor847)) btor843 btor842))
           (btor849
            (signal
             (bvxor (signal-value btor841) (signal-value btor848))
             (list)))
           (btor851
            (bv->signal
             (zero-extend (signal-value btor128) (bitvector 1))
             btor128))
           (btor852
            (bv->signal
             (zero-extend (signal-value btor129) (bitvector 1))
             btor129))
           (btor853
            (bv->signal
             (zero-extend (signal-value btor130) (bitvector 1))
             btor130))
           (btor854
            (bv->signal
             (zero-extend (signal-value btor131) (bitvector 1))
             btor131))
           (btor855
            (bv->signal
             (zero-extend (signal-value btor598) (bitvector 1))
             btor598))
           (btor856
            (bv->signal
             (zero-extend (signal-value btor240) (bitvector 1))
             btor240))
           (btor857
            (bv->signal
             (zero-extend (signal-value btor240) (bitvector 1))
             btor240))
           (btor858
            (bv->signal
             (zero-extend (signal-value btor598) (bitvector 1))
             btor598))
           (btor859
            (bv->signal
             (zero-extend (signal-value btor241) (bitvector 1))
             btor241))
           (btor860
            (bv->signal
             (zero-extend (signal-value btor241) (bitvector 1))
             btor241))
           (btor861
            (bv->signal
             (zero-extend (signal-value btor598) (bitvector 1))
             btor598))
           (btor862
            (bv->signal
             (zero-extend (signal-value btor242) (bitvector 1))
             btor242))
           (btor863
            (bv->signal
             (zero-extend (signal-value btor242) (bitvector 1))
             btor242))
           (btor864
            (bv->signal
             (zero-extend (signal-value btor598) (bitvector 1))
             btor598))
           (btor865
            (bv->signal
             (zero-extend (signal-value btor243) (bitvector 1))
             btor243))
           (btor866
            (bv->signal
             (zero-extend (signal-value btor243) (bitvector 1))
             btor243))
           (btor867
            (bv->signal
             (zero-extend (signal-value btor341) (bitvector 1))
             btor341))
           (btor868
            (bv->signal
             (zero-extend (signal-value btor342) (bitvector 1))
             btor342))
           (btor869
            (bv->signal
             (zero-extend (signal-value btor343) (bitvector 1))
             btor343))
           (btor870
            (bv->signal
             (zero-extend (signal-value btor344) (bitvector 1))
             btor344))
           (btor871 (bitvector 55))
           (btor872 unnamed-input-872)
           (btor873 (bv->signal (bv 0 (bitvector 55))))
           (btor874
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state874")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state874")))))
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
                          (bv 0 7))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
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
                          (bv 0 7))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor876
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state876")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state876")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state876")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state876")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor878
            (signal
             (concat (signal-value btor240) (signal-value btor876))
             (list)))
           (btor879
            (signal
             (bool->bitvector
              (bveq (signal-value btor878) (signal-value btor373)))
             (list)))
           (btor880
            (if (bitvector->bool (signal-value btor879)) btor875 btor874))
           (btor881
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state881")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state881")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state881")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state881")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 7))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
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
                          (bv 0 7))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor883
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state883")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state883")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state883")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state883")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor885
            (signal
             (concat (signal-value btor240) (signal-value btor883))
             (list)))
           (btor886
            (signal
             (bool->bitvector
              (bveq (signal-value btor885) (signal-value btor602)))
             (list)))
           (btor887
            (if (bitvector->bool (signal-value btor886)) btor882 btor881))
           (btor888
            (signal
             (bvxor (signal-value btor880) (signal-value btor887))
             (list)))
           (btor889
            (signal
             (extract 1 0 (signal-value btor888))
             (signal-state btor888)))
           (btor890 (bv->signal (bv 3 (bitvector 2))))
           (btor891
            (signal
             (bool->bitvector
              (bveq (signal-value btor889) (signal-value btor890)))
             (list)))
           (btor892
            (if (bitvector->bool (signal-value btor891)) btor873 btor872))
           (btor893
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state893")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state893")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state893")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state893")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 27))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor894
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state894")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state894")))))
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
                          (bv 0 27))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
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
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor897
            (signal
             (concat (signal-value btor240) (signal-value btor895))
             (list)))
           (btor898
            (signal
             (bool->bitvector
              (bveq (signal-value btor897) (signal-value btor373)))
             (list)))
           (btor899
            (if (bitvector->bool (signal-value btor898)) btor894 btor893))
           (btor900
            (signal
             (extract 17 17 (signal-value btor899))
             (signal-state btor899)))
           (btor901
            (signal
             (bvand (signal-value btor833) (signal-value btor900))
             (list)))
           (btor902
            (signal (concat (signal-value btor3) (signal-value btor2)) (list)))
           (btor903
            (signal
             (concat (signal-value btor14) (signal-value btor902))
             (list)))
           (btor904
            (signal
             (concat (signal-value btor25) (signal-value btor903))
             (list)))
           (btor905
            (signal
             (concat (signal-value btor32) (signal-value btor904))
             (list)))
           (btor906
            (signal
             (concat (signal-value btor33) (signal-value btor905))
             (list)))
           (btor907
            (signal
             (concat (signal-value btor34) (signal-value btor906))
             (list)))
           (btor908
            (signal
             (concat (signal-value btor35) (signal-value btor907))
             (list)))
           (btor909
            (signal
             (concat (signal-value btor36) (signal-value btor908))
             (list)))
           (btor910
            (signal
             (concat (signal-value btor37) (signal-value btor909))
             (list)))
           (btor911
            (signal
             (concat (signal-value btor4) (signal-value btor910))
             (list)))
           (btor912
            (signal
             (concat (signal-value btor5) (signal-value btor911))
             (list)))
           (btor913
            (signal
             (concat (signal-value btor6) (signal-value btor912))
             (list)))
           (btor914
            (signal
             (concat (signal-value btor7) (signal-value btor913))
             (list)))
           (btor915
            (signal
             (concat (signal-value btor8) (signal-value btor914))
             (list)))
           (btor916
            (signal
             (concat (signal-value btor9) (signal-value btor915))
             (list)))
           (btor917
            (signal
             (concat (signal-value btor10) (signal-value btor916))
             (list)))
           (btor918
            (signal
             (concat (signal-value btor11) (signal-value btor917))
             (list)))
           (btor919
            (signal
             (concat (signal-value btor12) (signal-value btor918))
             (list)))
           (btor920
            (signal
             (concat (signal-value btor13) (signal-value btor919))
             (list)))
           (btor921
            (signal
             (concat (signal-value btor15) (signal-value btor920))
             (list)))
           (btor922
            (signal
             (concat (signal-value btor16) (signal-value btor921))
             (list)))
           (btor923
            (signal
             (concat (signal-value btor17) (signal-value btor922))
             (list)))
           (btor924
            (signal
             (concat (signal-value btor18) (signal-value btor923))
             (list)))
           (btor925
            (signal
             (concat (signal-value btor19) (signal-value btor924))
             (list)))
           (btor926
            (signal
             (concat (signal-value btor20) (signal-value btor925))
             (list)))
           (btor927
            (signal
             (concat (signal-value btor21) (signal-value btor926))
             (list)))
           (btor928
            (signal
             (concat (signal-value btor22) (signal-value btor927))
             (list)))
           (btor929
            (signal
             (concat (signal-value btor23) (signal-value btor928))
             (list)))
           (btor930
            (signal
             (concat (signal-value btor24) (signal-value btor929))
             (list)))
           (btor931
            (signal
             (concat (signal-value btor26) (signal-value btor930))
             (list)))
           (btor932
            (signal
             (concat (signal-value btor27) (signal-value btor931))
             (list)))
           (btor933
            (signal
             (concat (signal-value btor28) (signal-value btor932))
             (list)))
           (btor934
            (signal
             (concat (signal-value btor29) (signal-value btor933))
             (list)))
           (btor935
            (signal
             (concat (signal-value btor30) (signal-value btor934))
             (list)))
           (btor936
            (signal
             (concat (signal-value btor31) (signal-value btor935))
             (list)))
           (btor937
            (signal
             (extract 17 0 (signal-value btor899))
             (signal-state btor899)))
           (btor938
            (signal
             (concat (signal-value btor937) (signal-value btor936))
             (list)))
           (btor939
            (signal
             (concat (signal-value btor901) (signal-value btor938))
             (list)))
           (btor940
            (signal
             (bool->bitvector
              (bveq (signal-value btor889) (signal-value btor373)))
             (list)))
           (btor941
            (if (bitvector->bool (signal-value btor940)) btor939 btor892))
           (btor942 (bv->signal (bv 0 (bitvector 19))))
           (btor943
            (signal
             (concat (signal-value btor276) (signal-value btor276))
             (list)))
           (btor944
            (signal
             (concat (signal-value btor276) (signal-value btor943))
             (list)))
           (btor945
            (signal
             (concat (signal-value btor276) (signal-value btor944))
             (list)))
           (btor946
            (signal
             (concat (signal-value btor276) (signal-value btor945))
             (list)))
           (btor947
            (signal
             (concat (signal-value btor276) (signal-value btor946))
             (list)))
           (btor948
            (signal
             (concat (signal-value btor276) (signal-value btor947))
             (list)))
           (btor949
            (signal
             (concat (signal-value btor276) (signal-value btor948))
             (list)))
           (btor950
            (signal
             (concat (signal-value btor276) (signal-value btor949))
             (list)))
           (btor951
            (signal
             (concat (signal-value btor276) (signal-value btor950))
             (list)))
           (btor952
            (signal
             (concat (signal-value btor276) (signal-value btor951))
             (list)))
           (btor953
            (signal
             (concat (signal-value btor276) (signal-value btor952))
             (list)))
           (btor954
            (signal
             (concat (signal-value btor276) (signal-value btor953))
             (list)))
           (btor955
            (signal
             (concat (signal-value btor276) (signal-value btor954))
             (list)))
           (btor956
            (signal
             (concat (signal-value btor276) (signal-value btor955))
             (list)))
           (btor957
            (signal
             (concat (signal-value btor276) (signal-value btor956))
             (list)))
           (btor958
            (signal
             (concat (signal-value btor276) (signal-value btor957))
             (list)))
           (btor959
            (signal
             (concat (signal-value btor276) (signal-value btor958))
             (list)))
           (btor960
            (signal
             (concat (signal-value btor276) (signal-value btor959))
             (list)))
           (btor961
            (if (bitvector->bool (signal-value btor346)) btor960 btor942))
           (btor962
            (signal
             (concat (signal-value btor248) (signal-value btor247))
             (list)))
           (btor963
            (signal
             (concat (signal-value btor259) (signal-value btor962))
             (list)))
           (btor964
            (signal
             (concat (signal-value btor270) (signal-value btor963))
             (list)))
           (btor965
            (signal
             (concat (signal-value btor277) (signal-value btor964))
             (list)))
           (btor966
            (signal
             (concat (signal-value btor278) (signal-value btor965))
             (list)))
           (btor967
            (signal
             (concat (signal-value btor279) (signal-value btor966))
             (list)))
           (btor968
            (signal
             (concat (signal-value btor280) (signal-value btor967))
             (list)))
           (btor969
            (signal
             (concat (signal-value btor281) (signal-value btor968))
             (list)))
           (btor970
            (signal
             (concat (signal-value btor282) (signal-value btor969))
             (list)))
           (btor971
            (signal
             (concat (signal-value btor249) (signal-value btor970))
             (list)))
           (btor972
            (signal
             (concat (signal-value btor250) (signal-value btor971))
             (list)))
           (btor973
            (signal
             (concat (signal-value btor251) (signal-value btor972))
             (list)))
           (btor974
            (signal
             (concat (signal-value btor252) (signal-value btor973))
             (list)))
           (btor975
            (signal
             (concat (signal-value btor253) (signal-value btor974))
             (list)))
           (btor976
            (signal
             (concat (signal-value btor254) (signal-value btor975))
             (list)))
           (btor977
            (signal
             (concat (signal-value btor255) (signal-value btor976))
             (list)))
           (btor978
            (signal
             (concat (signal-value btor256) (signal-value btor977))
             (list)))
           (btor979
            (signal
             (concat (signal-value btor257) (signal-value btor978))
             (list)))
           (btor980
            (signal
             (concat (signal-value btor258) (signal-value btor979))
             (list)))
           (btor981
            (signal
             (concat (signal-value btor260) (signal-value btor980))
             (list)))
           (btor982
            (signal
             (concat (signal-value btor261) (signal-value btor981))
             (list)))
           (btor983
            (signal
             (concat (signal-value btor262) (signal-value btor982))
             (list)))
           (btor984
            (signal
             (concat (signal-value btor263) (signal-value btor983))
             (list)))
           (btor985
            (signal
             (concat (signal-value btor264) (signal-value btor984))
             (list)))
           (btor986
            (signal
             (concat (signal-value btor265) (signal-value btor985))
             (list)))
           (btor987
            (signal
             (concat (signal-value btor266) (signal-value btor986))
             (list)))
           (btor988
            (signal
             (concat (signal-value btor267) (signal-value btor987))
             (list)))
           (btor989
            (signal
             (concat (signal-value btor268) (signal-value btor988))
             (list)))
           (btor990
            (signal
             (concat (signal-value btor269) (signal-value btor989))
             (list)))
           (btor991
            (signal
             (concat (signal-value btor271) (signal-value btor990))
             (list)))
           (btor992
            (signal
             (concat (signal-value btor272) (signal-value btor991))
             (list)))
           (btor993
            (signal
             (concat (signal-value btor273) (signal-value btor992))
             (list)))
           (btor994
            (signal
             (concat (signal-value btor274) (signal-value btor993))
             (list)))
           (btor995
            (signal
             (concat (signal-value btor275) (signal-value btor994))
             (list)))
           (btor996
            (signal
             (concat (signal-value btor276) (signal-value btor995))
             (list)))
           (btor997
            (signal
             (concat (signal-value btor961) (signal-value btor996))
             (list)))
           (btor998 (bv->signal (bv 0 (bitvector 7))))
           (btor999
            (signal
             (concat (signal-value btor256) (signal-value btor256))
             (list)))
           (btor1000
            (signal
             (concat (signal-value btor256) (signal-value btor999))
             (list)))
           (btor1001
            (signal
             (concat (signal-value btor256) (signal-value btor1000))
             (list)))
           (btor1002
            (signal
             (concat (signal-value btor256) (signal-value btor1001))
             (list)))
           (btor1003
            (signal
             (concat (signal-value btor256) (signal-value btor1002))
             (list)))
           (btor1004
            (signal
             (concat (signal-value btor256) (signal-value btor1003))
             (list)))
           (btor1005
            (if (bitvector->bool (signal-value btor346)) btor1004 btor998))
           (btor1006 (bv->signal (bv 0 (bitvector 2))))
           (btor1007
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1007")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1007")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1007")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1007")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
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
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1009")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1009")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1009")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1009")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1011
            (signal
             (concat (signal-value btor240) (signal-value btor1009))
             (list)))
           (btor1012
            (signal
             (bool->bitvector
              (bveq (signal-value btor1011) (signal-value btor373)))
             (list)))
           (btor1013
            (if (bitvector->bool (signal-value btor1012)) btor1008 btor1007))
           (btor1014
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1014")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1014")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1014")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1014")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
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
           (btor1016
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1016")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1016")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1016")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1016")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1018
            (signal
             (concat (signal-value btor240) (signal-value btor1016))
             (list)))
           (btor1019
            (signal
             (bool->bitvector
              (bveq (signal-value btor1018) (signal-value btor602)))
             (list)))
           (btor1020
            (if (bitvector->bool (signal-value btor1019)) btor1015 btor1014))
           (btor1021
            (signal
             (bvxor (signal-value btor1013) (signal-value btor1020))
             (list)))
           (btor1022 (bv->signal (bv 0 (bitvector 9))))
           (btor1023
            (signal
             (concat (signal-value btor276) (signal-value btor276))
             (list)))
           (btor1024
            (signal
             (concat (signal-value btor276) (signal-value btor1023))
             (list)))
           (btor1025
            (signal
             (concat (signal-value btor276) (signal-value btor1024))
             (list)))
           (btor1026
            (signal
             (concat (signal-value btor276) (signal-value btor1025))
             (list)))
           (btor1027
            (signal
             (concat (signal-value btor276) (signal-value btor1026))
             (list)))
           (btor1028
            (signal
             (concat (signal-value btor276) (signal-value btor1027))
             (list)))
           (btor1029
            (signal
             (concat (signal-value btor276) (signal-value btor1028))
             (list)))
           (btor1030
            (signal
             (concat (signal-value btor276) (signal-value btor1029))
             (list)))
           (btor1031
            (if (bitvector->bool (signal-value btor346)) btor1030 btor1022))
           (btor1032
            (signal
             (concat (signal-value btor248) (signal-value btor247))
             (list)))
           (btor1033
            (signal
             (concat (signal-value btor259) (signal-value btor1032))
             (list)))
           (btor1034
            (signal
             (concat (signal-value btor270) (signal-value btor1033))
             (list)))
           (btor1035
            (signal
             (concat (signal-value btor277) (signal-value btor1034))
             (list)))
           (btor1036
            (signal
             (concat (signal-value btor278) (signal-value btor1035))
             (list)))
           (btor1037
            (signal
             (concat (signal-value btor279) (signal-value btor1036))
             (list)))
           (btor1038
            (signal
             (concat (signal-value btor280) (signal-value btor1037))
             (list)))
           (btor1039
            (signal
             (concat (signal-value btor281) (signal-value btor1038))
             (list)))
           (btor1040
            (signal
             (concat (signal-value btor282) (signal-value btor1039))
             (list)))
           (btor1041
            (signal
             (concat (signal-value btor249) (signal-value btor1040))
             (list)))
           (btor1042
            (signal
             (concat (signal-value btor250) (signal-value btor1041))
             (list)))
           (btor1043
            (signal
             (concat (signal-value btor251) (signal-value btor1042))
             (list)))
           (btor1044
            (signal
             (concat (signal-value btor252) (signal-value btor1043))
             (list)))
           (btor1045
            (signal
             (concat (signal-value btor253) (signal-value btor1044))
             (list)))
           (btor1046
            (signal
             (concat (signal-value btor254) (signal-value btor1045))
             (list)))
           (btor1047
            (signal
             (concat (signal-value btor255) (signal-value btor1046))
             (list)))
           (btor1048
            (signal
             (concat (signal-value btor256) (signal-value btor1047))
             (list)))
           (btor1049
            (signal
             (concat (signal-value btor1005) (signal-value btor1048))
             (list)))
           (btor1050
            (signal
             (concat (signal-value btor1006) (signal-value btor1049))
             (list)))
           (btor1051
            (signal
             (concat (signal-value btor1021) (signal-value btor1050))
             (list)))
           (btor1052
            (signal
             (concat (signal-value btor257) (signal-value btor1051))
             (list)))
           (btor1053
            (signal
             (concat (signal-value btor258) (signal-value btor1052))
             (list)))
           (btor1054
            (signal
             (concat (signal-value btor260) (signal-value btor1053))
             (list)))
           (btor1055
            (signal
             (concat (signal-value btor261) (signal-value btor1054))
             (list)))
           (btor1056
            (signal
             (concat (signal-value btor262) (signal-value btor1055))
             (list)))
           (btor1057
            (signal
             (concat (signal-value btor263) (signal-value btor1056))
             (list)))
           (btor1058
            (signal
             (concat (signal-value btor264) (signal-value btor1057))
             (list)))
           (btor1059
            (signal
             (concat (signal-value btor265) (signal-value btor1058))
             (list)))
           (btor1060
            (signal
             (concat (signal-value btor266) (signal-value btor1059))
             (list)))
           (btor1061
            (signal
             (concat (signal-value btor267) (signal-value btor1060))
             (list)))
           (btor1062
            (signal
             (concat (signal-value btor268) (signal-value btor1061))
             (list)))
           (btor1063
            (signal
             (concat (signal-value btor269) (signal-value btor1062))
             (list)))
           (btor1064
            (signal
             (concat (signal-value btor271) (signal-value btor1063))
             (list)))
           (btor1065
            (signal
             (concat (signal-value btor272) (signal-value btor1064))
             (list)))
           (btor1066
            (signal
             (concat (signal-value btor273) (signal-value btor1065))
             (list)))
           (btor1067
            (signal
             (concat (signal-value btor274) (signal-value btor1066))
             (list)))
           (btor1068
            (signal
             (concat (signal-value btor275) (signal-value btor1067))
             (list)))
           (btor1069
            (signal
             (concat (signal-value btor276) (signal-value btor1068))
             (list)))
           (btor1070
            (signal
             (concat (signal-value btor1031) (signal-value btor1069))
             (list)))
           (btor1071
            (bv->signal
             (zero-extend (signal-value btor890) (bitvector 5))
             btor890))
           (btor1072
            (signal
             (bool->bitvector
              (bveq (signal-value btor325) (signal-value btor1071)))
             (list)))
           (btor1073
            (if (bitvector->bool (signal-value btor1072)) btor1070 btor997))
           (btor1074
            (bv->signal
             (zero-extend (signal-value btor351) (bitvector 2))
             btor351))
           (btor1075
            (signal
             (bool->bitvector
              (bveq (signal-value btor889) (signal-value btor1074)))
             (list)))
           (btor1076
            (if (bitvector->bool (signal-value btor1075)) btor1073 btor941))
           (btor1077
            (signal
             (concat (signal-value btor744) (signal-value btor709))
             (list)))
           (btor1078
            (signal
             (apply bvor (bitvector->bits (signal-value btor889)))
             (signal-state btor889)))
           (btor1079 (signal (bvnot (signal-value btor1078)) (list)))
           (btor1080
            (if (bitvector->bool (signal-value btor1079)) btor1077 btor1076))
           (btor1081
            (bv->signal
             (zero-extend (signal-value btor1080) (bitvector 55))
             btor1080))
           (btor1082
            (signal (concat (signal-value btor3) (signal-value btor2)) (list)))
           (btor1083
            (signal
             (concat (signal-value btor14) (signal-value btor1082))
             (list)))
           (btor1084
            (signal
             (concat (signal-value btor25) (signal-value btor1083))
             (list)))
           (btor1085
            (signal
             (concat (signal-value btor32) (signal-value btor1084))
             (list)))
           (btor1086
            (signal
             (concat (signal-value btor33) (signal-value btor1085))
             (list)))
           (btor1087
            (signal
             (concat (signal-value btor34) (signal-value btor1086))
             (list)))
           (btor1088
            (signal
             (concat (signal-value btor35) (signal-value btor1087))
             (list)))
           (btor1089
            (signal
             (concat (signal-value btor36) (signal-value btor1088))
             (list)))
           (btor1090
            (signal
             (concat (signal-value btor37) (signal-value btor1089))
             (list)))
           (btor1091
            (signal
             (concat (signal-value btor4) (signal-value btor1090))
             (list)))
           (btor1092
            (signal
             (concat (signal-value btor5) (signal-value btor1091))
             (list)))
           (btor1093
            (signal
             (concat (signal-value btor6) (signal-value btor1092))
             (list)))
           (btor1094
            (signal
             (concat (signal-value btor7) (signal-value btor1093))
             (list)))
           (btor1095
            (signal
             (concat (signal-value btor8) (signal-value btor1094))
             (list)))
           (btor1096
            (signal
             (concat (signal-value btor9) (signal-value btor1095))
             (list)))
           (btor1097
            (signal
             (concat (signal-value btor10) (signal-value btor1096))
             (list)))
           (btor1098
            (signal
             (concat (signal-value btor11) (signal-value btor1097))
             (list)))
           (btor1099
            (signal
             (concat (signal-value btor12) (signal-value btor1098))
             (list)))
           (btor1100
            (signal
             (concat (signal-value btor13) (signal-value btor1099))
             (list)))
           (btor1101
            (signal
             (concat (signal-value btor15) (signal-value btor1100))
             (list)))
           (btor1102
            (signal
             (concat (signal-value btor16) (signal-value btor1101))
             (list)))
           (btor1103
            (signal
             (concat (signal-value btor17) (signal-value btor1102))
             (list)))
           (btor1104
            (signal
             (concat (signal-value btor18) (signal-value btor1103))
             (list)))
           (btor1105
            (signal
             (concat (signal-value btor19) (signal-value btor1104))
             (list)))
           (btor1106
            (signal
             (concat (signal-value btor20) (signal-value btor1105))
             (list)))
           (btor1107
            (signal
             (concat (signal-value btor21) (signal-value btor1106))
             (list)))
           (btor1108
            (signal
             (concat (signal-value btor22) (signal-value btor1107))
             (list)))
           (btor1109
            (signal
             (concat (signal-value btor23) (signal-value btor1108))
             (list)))
           (btor1110
            (signal
             (concat (signal-value btor24) (signal-value btor1109))
             (list)))
           (btor1111
            (signal
             (concat (signal-value btor26) (signal-value btor1110))
             (list)))
           (btor1112
            (signal
             (concat (signal-value btor27) (signal-value btor1111))
             (list)))
           (btor1113
            (signal
             (concat (signal-value btor28) (signal-value btor1112))
             (list)))
           (btor1114
            (signal
             (concat (signal-value btor29) (signal-value btor1113))
             (list)))
           (btor1115
            (signal
             (concat (signal-value btor30) (signal-value btor1114))
             (list)))
           (btor1116
            (signal
             (concat (signal-value btor31) (signal-value btor1115))
             (list)))
           (btor1117
            (bv->signal
             (zero-extend (signal-value btor1116) (bitvector 36))
             btor1116))
           (btor1118 unnamed-input-1118)
           (btor1119
            (signal
             (extract 3 2 (signal-value btor888))
             (signal-state btor888)))
           (btor1120
            (signal
             (bool->bitvector
              (bveq (signal-value btor1119) (signal-value btor890)))
             (list)))
           (btor1121
            (if (bitvector->bool (signal-value btor1120)) btor873 btor1118))
           (btor1122
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1122")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1122")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1122")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1122")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 27))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1123
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1123")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1123")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1123")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1123")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 27))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1124
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1124")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1124")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1124")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1124")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1126
            (signal
             (concat (signal-value btor240) (signal-value btor1124))
             (list)))
           (btor1127
            (signal
             (bool->bitvector
              (bveq (signal-value btor1126) (signal-value btor373)))
             (list)))
           (btor1128
            (if (bitvector->bool (signal-value btor1127)) btor1123 btor1122))
           (btor1129
            (signal
             (extract 17 17 (signal-value btor1128))
             (signal-state btor1128)))
           (btor1130
            (signal
             (bvand (signal-value btor833) (signal-value btor1129))
             (list)))
           (btor1131
            (signal
             (concat (signal-value btor39) (signal-value btor38))
             (list)))
           (btor1132
            (signal
             (concat (signal-value btor50) (signal-value btor1131))
             (list)))
           (btor1133
            (signal
             (concat (signal-value btor61) (signal-value btor1132))
             (list)))
           (btor1134
            (signal
             (concat (signal-value btor68) (signal-value btor1133))
             (list)))
           (btor1135
            (signal
             (concat (signal-value btor69) (signal-value btor1134))
             (list)))
           (btor1136
            (signal
             (concat (signal-value btor70) (signal-value btor1135))
             (list)))
           (btor1137
            (signal
             (concat (signal-value btor71) (signal-value btor1136))
             (list)))
           (btor1138
            (signal
             (concat (signal-value btor72) (signal-value btor1137))
             (list)))
           (btor1139
            (signal
             (concat (signal-value btor73) (signal-value btor1138))
             (list)))
           (btor1140
            (signal
             (concat (signal-value btor40) (signal-value btor1139))
             (list)))
           (btor1141
            (signal
             (concat (signal-value btor41) (signal-value btor1140))
             (list)))
           (btor1142
            (signal
             (concat (signal-value btor42) (signal-value btor1141))
             (list)))
           (btor1143
            (signal
             (concat (signal-value btor43) (signal-value btor1142))
             (list)))
           (btor1144
            (signal
             (concat (signal-value btor44) (signal-value btor1143))
             (list)))
           (btor1145
            (signal
             (concat (signal-value btor45) (signal-value btor1144))
             (list)))
           (btor1146
            (signal
             (concat (signal-value btor46) (signal-value btor1145))
             (list)))
           (btor1147
            (signal
             (concat (signal-value btor47) (signal-value btor1146))
             (list)))
           (btor1148
            (signal
             (concat (signal-value btor48) (signal-value btor1147))
             (list)))
           (btor1149
            (signal
             (concat (signal-value btor49) (signal-value btor1148))
             (list)))
           (btor1150
            (signal
             (concat (signal-value btor51) (signal-value btor1149))
             (list)))
           (btor1151
            (signal
             (concat (signal-value btor52) (signal-value btor1150))
             (list)))
           (btor1152
            (signal
             (concat (signal-value btor53) (signal-value btor1151))
             (list)))
           (btor1153
            (signal
             (concat (signal-value btor54) (signal-value btor1152))
             (list)))
           (btor1154
            (signal
             (concat (signal-value btor55) (signal-value btor1153))
             (list)))
           (btor1155
            (signal
             (concat (signal-value btor56) (signal-value btor1154))
             (list)))
           (btor1156
            (signal
             (concat (signal-value btor57) (signal-value btor1155))
             (list)))
           (btor1157
            (signal
             (concat (signal-value btor58) (signal-value btor1156))
             (list)))
           (btor1158
            (signal
             (concat (signal-value btor59) (signal-value btor1157))
             (list)))
           (btor1159
            (signal
             (concat (signal-value btor60) (signal-value btor1158))
             (list)))
           (btor1160
            (signal
             (concat (signal-value btor62) (signal-value btor1159))
             (list)))
           (btor1161
            (signal
             (concat (signal-value btor63) (signal-value btor1160))
             (list)))
           (btor1162
            (signal
             (concat (signal-value btor64) (signal-value btor1161))
             (list)))
           (btor1163
            (signal
             (concat (signal-value btor65) (signal-value btor1162))
             (list)))
           (btor1164
            (signal
             (concat (signal-value btor66) (signal-value btor1163))
             (list)))
           (btor1165
            (signal
             (concat (signal-value btor67) (signal-value btor1164))
             (list)))
           (btor1166
            (signal
             (extract 17 0 (signal-value btor1128))
             (signal-state btor1128)))
           (btor1167
            (signal
             (concat (signal-value btor1166) (signal-value btor1165))
             (list)))
           (btor1168
            (signal
             (concat (signal-value btor1130) (signal-value btor1167))
             (list)))
           (btor1169
            (signal
             (bool->bitvector
              (bveq (signal-value btor1119) (signal-value btor373)))
             (list)))
           (btor1170
            (if (bitvector->bool (signal-value btor1169)) btor1168 btor1121))
           (btor1171
            (signal
             (concat (signal-value btor316) (signal-value btor316))
             (list)))
           (btor1172
            (signal
             (concat (signal-value btor316) (signal-value btor1171))
             (list)))
           (btor1173
            (signal
             (concat (signal-value btor316) (signal-value btor1172))
             (list)))
           (btor1174
            (signal
             (concat (signal-value btor316) (signal-value btor1173))
             (list)))
           (btor1175
            (signal
             (concat (signal-value btor316) (signal-value btor1174))
             (list)))
           (btor1176
            (signal
             (concat (signal-value btor316) (signal-value btor1175))
             (list)))
           (btor1177
            (signal
             (concat (signal-value btor316) (signal-value btor1176))
             (list)))
           (btor1178
            (signal
             (concat (signal-value btor316) (signal-value btor1177))
             (list)))
           (btor1179
            (signal
             (concat (signal-value btor316) (signal-value btor1178))
             (list)))
           (btor1180
            (signal
             (concat (signal-value btor316) (signal-value btor1179))
             (list)))
           (btor1181
            (signal
             (concat (signal-value btor316) (signal-value btor1180))
             (list)))
           (btor1182
            (signal
             (concat (signal-value btor316) (signal-value btor1181))
             (list)))
           (btor1183
            (signal
             (concat (signal-value btor316) (signal-value btor1182))
             (list)))
           (btor1184
            (signal
             (concat (signal-value btor316) (signal-value btor1183))
             (list)))
           (btor1185
            (signal
             (concat (signal-value btor316) (signal-value btor1184))
             (list)))
           (btor1186
            (signal
             (concat (signal-value btor316) (signal-value btor1185))
             (list)))
           (btor1187
            (signal
             (concat (signal-value btor316) (signal-value btor1186))
             (list)))
           (btor1188
            (signal
             (concat (signal-value btor316) (signal-value btor1187))
             (list)))
           (btor1189
            (if (bitvector->bool (signal-value btor347)) btor1188 btor942))
           (btor1190
            (signal
             (concat (signal-value btor288) (signal-value btor287))
             (list)))
           (btor1191
            (signal
             (concat (signal-value btor299) (signal-value btor1190))
             (list)))
           (btor1192
            (signal
             (concat (signal-value btor310) (signal-value btor1191))
             (list)))
           (btor1193
            (signal
             (concat (signal-value btor317) (signal-value btor1192))
             (list)))
           (btor1194
            (signal
             (concat (signal-value btor318) (signal-value btor1193))
             (list)))
           (btor1195
            (signal
             (concat (signal-value btor319) (signal-value btor1194))
             (list)))
           (btor1196
            (signal
             (concat (signal-value btor320) (signal-value btor1195))
             (list)))
           (btor1197
            (signal
             (concat (signal-value btor321) (signal-value btor1196))
             (list)))
           (btor1198
            (signal
             (concat (signal-value btor322) (signal-value btor1197))
             (list)))
           (btor1199
            (signal
             (concat (signal-value btor289) (signal-value btor1198))
             (list)))
           (btor1200
            (signal
             (concat (signal-value btor290) (signal-value btor1199))
             (list)))
           (btor1201
            (signal
             (concat (signal-value btor291) (signal-value btor1200))
             (list)))
           (btor1202
            (signal
             (concat (signal-value btor292) (signal-value btor1201))
             (list)))
           (btor1203
            (signal
             (concat (signal-value btor293) (signal-value btor1202))
             (list)))
           (btor1204
            (signal
             (concat (signal-value btor294) (signal-value btor1203))
             (list)))
           (btor1205
            (signal
             (concat (signal-value btor295) (signal-value btor1204))
             (list)))
           (btor1206
            (signal
             (concat (signal-value btor296) (signal-value btor1205))
             (list)))
           (btor1207
            (signal
             (concat (signal-value btor297) (signal-value btor1206))
             (list)))
           (btor1208
            (signal
             (concat (signal-value btor298) (signal-value btor1207))
             (list)))
           (btor1209
            (signal
             (concat (signal-value btor300) (signal-value btor1208))
             (list)))
           (btor1210
            (signal
             (concat (signal-value btor301) (signal-value btor1209))
             (list)))
           (btor1211
            (signal
             (concat (signal-value btor302) (signal-value btor1210))
             (list)))
           (btor1212
            (signal
             (concat (signal-value btor303) (signal-value btor1211))
             (list)))
           (btor1213
            (signal
             (concat (signal-value btor304) (signal-value btor1212))
             (list)))
           (btor1214
            (signal
             (concat (signal-value btor305) (signal-value btor1213))
             (list)))
           (btor1215
            (signal
             (concat (signal-value btor306) (signal-value btor1214))
             (list)))
           (btor1216
            (signal
             (concat (signal-value btor307) (signal-value btor1215))
             (list)))
           (btor1217
            (signal
             (concat (signal-value btor308) (signal-value btor1216))
             (list)))
           (btor1218
            (signal
             (concat (signal-value btor309) (signal-value btor1217))
             (list)))
           (btor1219
            (signal
             (concat (signal-value btor311) (signal-value btor1218))
             (list)))
           (btor1220
            (signal
             (concat (signal-value btor312) (signal-value btor1219))
             (list)))
           (btor1221
            (signal
             (concat (signal-value btor313) (signal-value btor1220))
             (list)))
           (btor1222
            (signal
             (concat (signal-value btor314) (signal-value btor1221))
             (list)))
           (btor1223
            (signal
             (concat (signal-value btor315) (signal-value btor1222))
             (list)))
           (btor1224
            (signal
             (concat (signal-value btor316) (signal-value btor1223))
             (list)))
           (btor1225
            (signal
             (concat (signal-value btor1189) (signal-value btor1224))
             (list)))
           (btor1226
            (signal
             (concat (signal-value btor296) (signal-value btor296))
             (list)))
           (btor1227
            (signal
             (concat (signal-value btor296) (signal-value btor1226))
             (list)))
           (btor1228
            (signal
             (concat (signal-value btor296) (signal-value btor1227))
             (list)))
           (btor1229
            (signal
             (concat (signal-value btor296) (signal-value btor1228))
             (list)))
           (btor1230
            (signal
             (concat (signal-value btor296) (signal-value btor1229))
             (list)))
           (btor1231
            (signal
             (concat (signal-value btor296) (signal-value btor1230))
             (list)))
           (btor1232
            (if (bitvector->bool (signal-value btor347)) btor1231 btor998))
           (btor1233
            (signal
             (concat (signal-value btor316) (signal-value btor316))
             (list)))
           (btor1234
            (signal
             (concat (signal-value btor316) (signal-value btor1233))
             (list)))
           (btor1235
            (signal
             (concat (signal-value btor316) (signal-value btor1234))
             (list)))
           (btor1236
            (signal
             (concat (signal-value btor316) (signal-value btor1235))
             (list)))
           (btor1237
            (signal
             (concat (signal-value btor316) (signal-value btor1236))
             (list)))
           (btor1238
            (signal
             (concat (signal-value btor316) (signal-value btor1237))
             (list)))
           (btor1239
            (signal
             (concat (signal-value btor316) (signal-value btor1238))
             (list)))
           (btor1240
            (signal
             (concat (signal-value btor316) (signal-value btor1239))
             (list)))
           (btor1241
            (if (bitvector->bool (signal-value btor347)) btor1240 btor1022))
           (btor1242
            (signal
             (concat (signal-value btor288) (signal-value btor287))
             (list)))
           (btor1243
            (signal
             (concat (signal-value btor299) (signal-value btor1242))
             (list)))
           (btor1244
            (signal
             (concat (signal-value btor310) (signal-value btor1243))
             (list)))
           (btor1245
            (signal
             (concat (signal-value btor317) (signal-value btor1244))
             (list)))
           (btor1246
            (signal
             (concat (signal-value btor318) (signal-value btor1245))
             (list)))
           (btor1247
            (signal
             (concat (signal-value btor319) (signal-value btor1246))
             (list)))
           (btor1248
            (signal
             (concat (signal-value btor320) (signal-value btor1247))
             (list)))
           (btor1249
            (signal
             (concat (signal-value btor321) (signal-value btor1248))
             (list)))
           (btor1250
            (signal
             (concat (signal-value btor322) (signal-value btor1249))
             (list)))
           (btor1251
            (signal
             (concat (signal-value btor289) (signal-value btor1250))
             (list)))
           (btor1252
            (signal
             (concat (signal-value btor290) (signal-value btor1251))
             (list)))
           (btor1253
            (signal
             (concat (signal-value btor291) (signal-value btor1252))
             (list)))
           (btor1254
            (signal
             (concat (signal-value btor292) (signal-value btor1253))
             (list)))
           (btor1255
            (signal
             (concat (signal-value btor293) (signal-value btor1254))
             (list)))
           (btor1256
            (signal
             (concat (signal-value btor294) (signal-value btor1255))
             (list)))
           (btor1257
            (signal
             (concat (signal-value btor295) (signal-value btor1256))
             (list)))
           (btor1258
            (signal
             (concat (signal-value btor296) (signal-value btor1257))
             (list)))
           (btor1259
            (signal
             (concat (signal-value btor1232) (signal-value btor1258))
             (list)))
           (btor1260
            (signal
             (concat (signal-value btor1021) (signal-value btor1259))
             (list)))
           (btor1261
            (signal
             (concat (signal-value btor1021) (signal-value btor1260))
             (list)))
           (btor1262
            (signal
             (concat (signal-value btor598) (signal-value btor1261))
             (list)))
           (btor1263
            (signal
             (concat (signal-value btor297) (signal-value btor1262))
             (list)))
           (btor1264
            (signal
             (concat (signal-value btor298) (signal-value btor1263))
             (list)))
           (btor1265
            (signal
             (concat (signal-value btor300) (signal-value btor1264))
             (list)))
           (btor1266
            (signal
             (concat (signal-value btor301) (signal-value btor1265))
             (list)))
           (btor1267
            (signal
             (concat (signal-value btor302) (signal-value btor1266))
             (list)))
           (btor1268
            (signal
             (concat (signal-value btor303) (signal-value btor1267))
             (list)))
           (btor1269
            (signal
             (concat (signal-value btor304) (signal-value btor1268))
             (list)))
           (btor1270
            (signal
             (concat (signal-value btor305) (signal-value btor1269))
             (list)))
           (btor1271
            (signal
             (concat (signal-value btor306) (signal-value btor1270))
             (list)))
           (btor1272
            (signal
             (concat (signal-value btor307) (signal-value btor1271))
             (list)))
           (btor1273
            (signal
             (concat (signal-value btor308) (signal-value btor1272))
             (list)))
           (btor1274
            (signal
             (concat (signal-value btor309) (signal-value btor1273))
             (list)))
           (btor1275
            (signal
             (concat (signal-value btor311) (signal-value btor1274))
             (list)))
           (btor1276
            (signal
             (concat (signal-value btor312) (signal-value btor1275))
             (list)))
           (btor1277
            (signal
             (concat (signal-value btor313) (signal-value btor1276))
             (list)))
           (btor1278
            (signal
             (concat (signal-value btor314) (signal-value btor1277))
             (list)))
           (btor1279
            (signal
             (concat (signal-value btor315) (signal-value btor1278))
             (list)))
           (btor1280
            (signal
             (concat (signal-value btor316) (signal-value btor1279))
             (list)))
           (btor1281
            (signal
             (concat (signal-value btor1241) (signal-value btor1280))
             (list)))
           (btor1282
            (if (bitvector->bool (signal-value btor1072)) btor1281 btor1225))
           (btor1283
            (bv->signal
             (zero-extend (signal-value btor351) (bitvector 2))
             btor351))
           (btor1284
            (signal
             (bool->bitvector
              (bveq (signal-value btor1119) (signal-value btor1283)))
             (list)))
           (btor1285
            (if (bitvector->bool (signal-value btor1284)) btor1282 btor1170))
           (btor1286 (bv->signal (bv 0 (bitvector 18))))
           (btor1287
            (signal
             (concat (signal-value btor287) (signal-value btor1286))
             (list)))
           (btor1288
            (signal
             (concat (signal-value btor288) (signal-value btor1287))
             (list)))
           (btor1289
            (signal
             (concat (signal-value btor299) (signal-value btor1288))
             (list)))
           (btor1290
            (signal
             (concat (signal-value btor310) (signal-value btor1289))
             (list)))
           (btor1291
            (signal
             (concat (signal-value btor317) (signal-value btor1290))
             (list)))
           (btor1292
            (signal
             (concat (signal-value btor318) (signal-value btor1291))
             (list)))
           (btor1293
            (signal
             (concat (signal-value btor319) (signal-value btor1292))
             (list)))
           (btor1294
            (signal
             (concat (signal-value btor320) (signal-value btor1293))
             (list)))
           (btor1295
            (signal
             (concat (signal-value btor321) (signal-value btor1294))
             (list)))
           (btor1296
            (signal
             (concat (signal-value btor322) (signal-value btor1295))
             (list)))
           (btor1297
            (signal
             (concat (signal-value btor289) (signal-value btor1296))
             (list)))
           (btor1298
            (signal
             (concat (signal-value btor290) (signal-value btor1297))
             (list)))
           (btor1299
            (signal
             (concat (signal-value btor291) (signal-value btor1298))
             (list)))
           (btor1300
            (signal
             (concat (signal-value btor292) (signal-value btor1299))
             (list)))
           (btor1301
            (signal
             (concat (signal-value btor293) (signal-value btor1300))
             (list)))
           (btor1302
            (signal
             (concat (signal-value btor294) (signal-value btor1301))
             (list)))
           (btor1303
            (signal
             (concat (signal-value btor295) (signal-value btor1302))
             (list)))
           (btor1304
            (signal
             (concat (signal-value btor296) (signal-value btor1303))
             (list)))
           (btor1305
            (signal
             (concat (signal-value btor297) (signal-value btor1304))
             (list)))
           (btor1306
            (signal
             (concat (signal-value btor298) (signal-value btor1305))
             (list)))
           (btor1307
            (signal
             (concat (signal-value btor300) (signal-value btor1306))
             (list)))
           (btor1308
            (signal
             (concat (signal-value btor301) (signal-value btor1307))
             (list)))
           (btor1309
            (signal
             (concat (signal-value btor302) (signal-value btor1308))
             (list)))
           (btor1310
            (signal
             (concat (signal-value btor303) (signal-value btor1309))
             (list)))
           (btor1311
            (signal
             (concat (signal-value btor304) (signal-value btor1310))
             (list)))
           (btor1312
            (signal
             (concat (signal-value btor305) (signal-value btor1311))
             (list)))
           (btor1313
            (signal
             (concat (signal-value btor306) (signal-value btor1312))
             (list)))
           (btor1314
            (signal
             (concat (signal-value btor307) (signal-value btor1313))
             (list)))
           (btor1315
            (signal
             (concat (signal-value btor308) (signal-value btor1314))
             (list)))
           (btor1316
            (signal
             (concat (signal-value btor309) (signal-value btor1315))
             (list)))
           (btor1317
            (signal
             (concat (signal-value btor311) (signal-value btor1316))
             (list)))
           (btor1318
            (signal
             (concat (signal-value btor312) (signal-value btor1317))
             (list)))
           (btor1319
            (signal
             (concat (signal-value btor313) (signal-value btor1318))
             (list)))
           (btor1320
            (signal
             (concat (signal-value btor314) (signal-value btor1319))
             (list)))
           (btor1321
            (signal
             (concat (signal-value btor315) (signal-value btor1320))
             (list)))
           (btor1322
            (signal
             (concat (signal-value btor316) (signal-value btor1321))
             (list)))
           (btor1323
            (signal
             (concat (signal-value btor598) (signal-value btor1322))
             (list)))
           (btor1324
            (signal
             (apply bvor (bitvector->bits (signal-value btor1119)))
             (signal-state btor1119)))
           (btor1325 (signal (bvnot (signal-value btor1324)) (list)))
           (btor1326
            (if (bitvector->bool (signal-value btor1325)) btor1323 btor1285))
           (btor1327
            (bv->signal
             (zero-extend (signal-value btor1326) (bitvector 55))
             btor1326))
           (btor1328
            (signal
             (concat (signal-value btor39) (signal-value btor38))
             (list)))
           (btor1329
            (signal
             (concat (signal-value btor50) (signal-value btor1328))
             (list)))
           (btor1330
            (signal
             (concat (signal-value btor61) (signal-value btor1329))
             (list)))
           (btor1331
            (signal
             (concat (signal-value btor68) (signal-value btor1330))
             (list)))
           (btor1332
            (signal
             (concat (signal-value btor69) (signal-value btor1331))
             (list)))
           (btor1333
            (signal
             (concat (signal-value btor70) (signal-value btor1332))
             (list)))
           (btor1334
            (signal
             (concat (signal-value btor71) (signal-value btor1333))
             (list)))
           (btor1335
            (signal
             (concat (signal-value btor72) (signal-value btor1334))
             (list)))
           (btor1336
            (signal
             (concat (signal-value btor73) (signal-value btor1335))
             (list)))
           (btor1337
            (signal
             (concat (signal-value btor40) (signal-value btor1336))
             (list)))
           (btor1338
            (signal
             (concat (signal-value btor41) (signal-value btor1337))
             (list)))
           (btor1339
            (signal
             (concat (signal-value btor42) (signal-value btor1338))
             (list)))
           (btor1340
            (signal
             (concat (signal-value btor43) (signal-value btor1339))
             (list)))
           (btor1341
            (signal
             (concat (signal-value btor44) (signal-value btor1340))
             (list)))
           (btor1342
            (signal
             (concat (signal-value btor45) (signal-value btor1341))
             (list)))
           (btor1343
            (signal
             (concat (signal-value btor46) (signal-value btor1342))
             (list)))
           (btor1344
            (signal
             (concat (signal-value btor47) (signal-value btor1343))
             (list)))
           (btor1345
            (signal
             (concat (signal-value btor48) (signal-value btor1344))
             (list)))
           (btor1346
            (signal
             (concat (signal-value btor49) (signal-value btor1345))
             (list)))
           (btor1347
            (signal
             (concat (signal-value btor51) (signal-value btor1346))
             (list)))
           (btor1348
            (signal
             (concat (signal-value btor52) (signal-value btor1347))
             (list)))
           (btor1349
            (signal
             (concat (signal-value btor53) (signal-value btor1348))
             (list)))
           (btor1350
            (signal
             (concat (signal-value btor54) (signal-value btor1349))
             (list)))
           (btor1351
            (signal
             (concat (signal-value btor55) (signal-value btor1350))
             (list)))
           (btor1352
            (signal
             (concat (signal-value btor56) (signal-value btor1351))
             (list)))
           (btor1353
            (signal
             (concat (signal-value btor57) (signal-value btor1352))
             (list)))
           (btor1354
            (signal
             (concat (signal-value btor58) (signal-value btor1353))
             (list)))
           (btor1355
            (signal
             (concat (signal-value btor59) (signal-value btor1354))
             (list)))
           (btor1356
            (signal
             (concat (signal-value btor60) (signal-value btor1355))
             (list)))
           (btor1357
            (signal
             (concat (signal-value btor62) (signal-value btor1356))
             (list)))
           (btor1358
            (signal
             (concat (signal-value btor63) (signal-value btor1357))
             (list)))
           (btor1359
            (signal
             (concat (signal-value btor64) (signal-value btor1358))
             (list)))
           (btor1360
            (signal
             (concat (signal-value btor65) (signal-value btor1359))
             (list)))
           (btor1361
            (signal
             (concat (signal-value btor66) (signal-value btor1360))
             (list)))
           (btor1362
            (signal
             (concat (signal-value btor67) (signal-value btor1361))
             (list)))
           (btor1363
            (bv->signal
             (zero-extend (signal-value btor1362) (bitvector 36))
             btor1362))
           (btor1364 unnamed-input-1364)
           (btor1365
            (signal
             (extract 53 0 (signal-value btor340))
             (signal-state btor340)))
           (btor1366
            (bv->signal
             (zero-extend (signal-value btor351) (bitvector 54))
             btor351))
           (btor1367
            (signal
             (bvsub (signal-value btor1365) (signal-value btor1366))
             (list)))
           (btor1368
            (signal
             (concat (signal-value btor598) (signal-value btor1367))
             (list)))
           (btor1369
            (signal
             (extract 6 4 (signal-value btor888))
             (signal-state btor888)))
           (btor1370 (bv->signal (bv 7 (bitvector 3))))
           (btor1371
            (signal
             (bool->bitvector
              (bveq (signal-value btor1369) (signal-value btor1370)))
             (list)))
           (btor1372
            (if (bitvector->bool (signal-value btor1371)) btor1368 btor1364))
           (btor1373
            (signal
             (extract 53 0 (signal-value btor340))
             (signal-state btor340)))
           (btor1374
            (signal
             (concat (signal-value btor598) (signal-value btor1373))
             (list)))
           (btor1375 (bv->signal (bv 6 (bitvector 3))))
           (btor1376
            (signal
             (bool->bitvector
              (bveq (signal-value btor1369) (signal-value btor1375)))
             (list)))
           (btor1377
            (if (bitvector->bool (signal-value btor1376)) btor1374 btor1372))
           (btor1378 (bv->signal (bv 5 (bitvector 3))))
           (btor1379
            (signal
             (bool->bitvector
              (bveq (signal-value btor1369) (signal-value btor1378)))
             (list)))
           (btor1380
            (if (bitvector->bool (signal-value btor1379)) btor1077 btor1377))
           (btor1381 (bv->signal (bv 4 (bitvector 3))))
           (btor1382
            (signal
             (bool->bitvector
              (bveq (signal-value btor1369) (signal-value btor1381)))
             (list)))
           (btor1383
            (if (bitvector->bool (signal-value btor1382)) btor939 btor1380))
           (btor1384
            (signal
             (extract 26 26 (signal-value btor1128))
             (signal-state btor1128)))
           (btor1385
            (signal
             (bvand (signal-value btor1384) (signal-value btor833))
             (list)))
           (btor1386
            (signal
             (concat (signal-value btor1128) (signal-value btor899))
             (list)))
           (btor1387
            (signal
             (concat (signal-value btor1385) (signal-value btor1386))
             (list)))
           (btor1388
            (bv->signal
             (zero-extend (signal-value btor890) (bitvector 3))
             btor890))
           (btor1389
            (signal
             (bool->bitvector
              (bveq (signal-value btor1369) (signal-value btor1388)))
             (list)))
           (btor1390
            (if (bitvector->bool (signal-value btor1389)) btor1387 btor1383))
           (btor1391
            (signal
             (concat (signal-value btor187) (signal-value btor186))
             (list)))
           (btor1392
            (signal
             (concat (signal-value btor198) (signal-value btor1391))
             (list)))
           (btor1393
            (signal
             (concat (signal-value btor209) (signal-value btor1392))
             (list)))
           (btor1394
            (signal
             (concat (signal-value btor220) (signal-value btor1393))
             (list)))
           (btor1395
            (signal
             (concat (signal-value btor231) (signal-value btor1394))
             (list)))
           (btor1396
            (signal
             (concat (signal-value btor236) (signal-value btor1395))
             (list)))
           (btor1397
            (signal
             (concat (signal-value btor237) (signal-value btor1396))
             (list)))
           (btor1398
            (signal
             (concat (signal-value btor238) (signal-value btor1397))
             (list)))
           (btor1399
            (signal
             (concat (signal-value btor239) (signal-value btor1398))
             (list)))
           (btor1400
            (signal
             (concat (signal-value btor188) (signal-value btor1399))
             (list)))
           (btor1401
            (signal
             (concat (signal-value btor189) (signal-value btor1400))
             (list)))
           (btor1402
            (signal
             (concat (signal-value btor190) (signal-value btor1401))
             (list)))
           (btor1403
            (signal
             (concat (signal-value btor191) (signal-value btor1402))
             (list)))
           (btor1404
            (signal
             (concat (signal-value btor192) (signal-value btor1403))
             (list)))
           (btor1405
            (signal
             (concat (signal-value btor193) (signal-value btor1404))
             (list)))
           (btor1406
            (signal
             (concat (signal-value btor194) (signal-value btor1405))
             (list)))
           (btor1407
            (signal
             (concat (signal-value btor195) (signal-value btor1406))
             (list)))
           (btor1408
            (signal
             (concat (signal-value btor196) (signal-value btor1407))
             (list)))
           (btor1409
            (signal
             (concat (signal-value btor197) (signal-value btor1408))
             (list)))
           (btor1410
            (signal
             (concat (signal-value btor199) (signal-value btor1409))
             (list)))
           (btor1411
            (signal
             (concat (signal-value btor200) (signal-value btor1410))
             (list)))
           (btor1412
            (signal
             (concat (signal-value btor201) (signal-value btor1411))
             (list)))
           (btor1413
            (signal
             (concat (signal-value btor202) (signal-value btor1412))
             (list)))
           (btor1414
            (signal
             (concat (signal-value btor203) (signal-value btor1413))
             (list)))
           (btor1415
            (signal
             (concat (signal-value btor204) (signal-value btor1414))
             (list)))
           (btor1416
            (signal
             (concat (signal-value btor205) (signal-value btor1415))
             (list)))
           (btor1417
            (signal
             (concat (signal-value btor206) (signal-value btor1416))
             (list)))
           (btor1418
            (signal
             (concat (signal-value btor207) (signal-value btor1417))
             (list)))
           (btor1419
            (signal
             (concat (signal-value btor208) (signal-value btor1418))
             (list)))
           (btor1420
            (signal
             (concat (signal-value btor210) (signal-value btor1419))
             (list)))
           (btor1421
            (signal
             (concat (signal-value btor211) (signal-value btor1420))
             (list)))
           (btor1422
            (signal
             (concat (signal-value btor212) (signal-value btor1421))
             (list)))
           (btor1423
            (signal
             (concat (signal-value btor213) (signal-value btor1422))
             (list)))
           (btor1424
            (signal
             (concat (signal-value btor214) (signal-value btor1423))
             (list)))
           (btor1425
            (signal
             (concat (signal-value btor215) (signal-value btor1424))
             (list)))
           (btor1426
            (signal
             (concat (signal-value btor216) (signal-value btor1425))
             (list)))
           (btor1427
            (signal
             (concat (signal-value btor217) (signal-value btor1426))
             (list)))
           (btor1428
            (signal
             (concat (signal-value btor218) (signal-value btor1427))
             (list)))
           (btor1429
            (signal
             (concat (signal-value btor219) (signal-value btor1428))
             (list)))
           (btor1430
            (signal
             (concat (signal-value btor221) (signal-value btor1429))
             (list)))
           (btor1431
            (signal
             (concat (signal-value btor222) (signal-value btor1430))
             (list)))
           (btor1432
            (signal
             (concat (signal-value btor223) (signal-value btor1431))
             (list)))
           (btor1433
            (signal
             (concat (signal-value btor224) (signal-value btor1432))
             (list)))
           (btor1434
            (signal
             (concat (signal-value btor225) (signal-value btor1433))
             (list)))
           (btor1435
            (signal
             (concat (signal-value btor226) (signal-value btor1434))
             (list)))
           (btor1436
            (signal
             (concat (signal-value btor227) (signal-value btor1435))
             (list)))
           (btor1437
            (signal
             (concat (signal-value btor228) (signal-value btor1436))
             (list)))
           (btor1438
            (signal
             (concat (signal-value btor229) (signal-value btor1437))
             (list)))
           (btor1439
            (signal
             (concat (signal-value btor230) (signal-value btor1438))
             (list)))
           (btor1440
            (signal
             (concat (signal-value btor232) (signal-value btor1439))
             (list)))
           (btor1441
            (signal
             (concat (signal-value btor233) (signal-value btor1440))
             (list)))
           (btor1442
            (signal
             (concat (signal-value btor234) (signal-value btor1441))
             (list)))
           (btor1443
            (signal
             (concat (signal-value btor235) (signal-value btor1442))
             (list)))
           (btor1444
            (signal
             (concat (signal-value btor345) (signal-value btor1443))
             (list)))
           (btor1445
            (bv->signal
             (zero-extend (signal-value btor373) (bitvector 3))
             btor373))
           (btor1446
            (signal
             (bool->bitvector
              (bveq (signal-value btor1369) (signal-value btor1445)))
             (list)))
           (btor1447
            (if (bitvector->bool (signal-value btor1446)) btor1444 btor1390))
           (btor1448
            (signal
             (concat (signal-value btor235) (signal-value btor235))
             (list)))
           (btor1449
            (signal
             (concat (signal-value btor235) (signal-value btor1448))
             (list)))
           (btor1450
            (signal
             (concat (signal-value btor235) (signal-value btor1449))
             (list)))
           (btor1451
            (signal
             (concat (signal-value btor235) (signal-value btor1450))
             (list)))
           (btor1452
            (signal
             (concat (signal-value btor235) (signal-value btor1451))
             (list)))
           (btor1453
            (signal
             (concat (signal-value btor235) (signal-value btor1452))
             (list)))
           (btor1454
            (signal
             (concat (signal-value btor235) (signal-value btor1453))
             (list)))
           (btor1455
            (signal
             (concat (signal-value btor235) (signal-value btor1454))
             (list)))
           (btor1456
            (signal
             (concat (signal-value btor235) (signal-value btor1455))
             (list)))
           (btor1457
            (signal
             (concat (signal-value btor235) (signal-value btor1456))
             (list)))
           (btor1458
            (signal
             (concat (signal-value btor235) (signal-value btor1457))
             (list)))
           (btor1459
            (signal
             (concat (signal-value btor235) (signal-value btor1458))
             (list)))
           (btor1460
            (signal
             (concat (signal-value btor235) (signal-value btor1459))
             (list)))
           (btor1461
            (signal
             (concat (signal-value btor235) (signal-value btor1460))
             (list)))
           (btor1462
            (signal
             (concat (signal-value btor235) (signal-value btor1461))
             (list)))
           (btor1463
            (signal
             (concat (signal-value btor235) (signal-value btor1462))
             (list)))
           (btor1464
            (signal
             (concat (signal-value btor235) (signal-value btor1463))
             (list)))
           (btor1465
            (signal
             (concat (signal-value btor235) (signal-value btor1464))
             (list)))
           (btor1466
            (if (bitvector->bool (signal-value btor345)) btor1465 btor942))
           (btor1467
            (signal
             (concat (signal-value btor197) (signal-value btor196))
             (list)))
           (btor1468
            (signal
             (concat (signal-value btor199) (signal-value btor1467))
             (list)))
           (btor1469
            (signal
             (concat (signal-value btor200) (signal-value btor1468))
             (list)))
           (btor1470
            (signal
             (concat (signal-value btor201) (signal-value btor1469))
             (list)))
           (btor1471
            (signal
             (concat (signal-value btor202) (signal-value btor1470))
             (list)))
           (btor1472
            (signal
             (concat (signal-value btor203) (signal-value btor1471))
             (list)))
           (btor1473
            (signal
             (concat (signal-value btor204) (signal-value btor1472))
             (list)))
           (btor1474
            (signal
             (concat (signal-value btor205) (signal-value btor1473))
             (list)))
           (btor1475
            (signal
             (concat (signal-value btor206) (signal-value btor1474))
             (list)))
           (btor1476
            (signal
             (concat (signal-value btor207) (signal-value btor1475))
             (list)))
           (btor1477
            (signal
             (concat (signal-value btor208) (signal-value btor1476))
             (list)))
           (btor1478
            (signal
             (concat (signal-value btor210) (signal-value btor1477))
             (list)))
           (btor1479
            (signal
             (concat (signal-value btor211) (signal-value btor1478))
             (list)))
           (btor1480
            (signal
             (concat (signal-value btor212) (signal-value btor1479))
             (list)))
           (btor1481
            (signal
             (concat (signal-value btor213) (signal-value btor1480))
             (list)))
           (btor1482
            (signal
             (concat (signal-value btor214) (signal-value btor1481))
             (list)))
           (btor1483
            (signal
             (concat (signal-value btor215) (signal-value btor1482))
             (list)))
           (btor1484
            (signal
             (concat (signal-value btor216) (signal-value btor1483))
             (list)))
           (btor1485
            (signal
             (concat (signal-value btor217) (signal-value btor1484))
             (list)))
           (btor1486
            (signal
             (concat (signal-value btor218) (signal-value btor1485))
             (list)))
           (btor1487
            (signal
             (concat (signal-value btor219) (signal-value btor1486))
             (list)))
           (btor1488
            (signal
             (concat (signal-value btor221) (signal-value btor1487))
             (list)))
           (btor1489
            (signal
             (concat (signal-value btor222) (signal-value btor1488))
             (list)))
           (btor1490
            (signal
             (concat (signal-value btor223) (signal-value btor1489))
             (list)))
           (btor1491
            (signal
             (concat (signal-value btor224) (signal-value btor1490))
             (list)))
           (btor1492
            (signal
             (concat (signal-value btor225) (signal-value btor1491))
             (list)))
           (btor1493
            (signal
             (concat (signal-value btor226) (signal-value btor1492))
             (list)))
           (btor1494
            (signal
             (concat (signal-value btor227) (signal-value btor1493))
             (list)))
           (btor1495
            (signal
             (concat (signal-value btor228) (signal-value btor1494))
             (list)))
           (btor1496
            (signal
             (concat (signal-value btor229) (signal-value btor1495))
             (list)))
           (btor1497
            (signal
             (concat (signal-value btor230) (signal-value btor1496))
             (list)))
           (btor1498
            (signal
             (concat (signal-value btor232) (signal-value btor1497))
             (list)))
           (btor1499
            (signal
             (concat (signal-value btor233) (signal-value btor1498))
             (list)))
           (btor1500
            (signal
             (concat (signal-value btor234) (signal-value btor1499))
             (list)))
           (btor1501
            (signal
             (concat (signal-value btor235) (signal-value btor1500))
             (list)))
           (btor1502
            (signal
             (concat (signal-value btor1466) (signal-value btor1501))
             (list)))
           (btor1503
            (bv->signal
             (zero-extend (signal-value btor351) (bitvector 3))
             btor351))
           (btor1504
            (signal
             (bool->bitvector
              (bveq (signal-value btor1369) (signal-value btor1503)))
             (list)))
           (btor1505
            (if (bitvector->bool (signal-value btor1504)) btor1502 btor1447))
           (btor1506
            (signal
             (apply bvor (bitvector->bits (signal-value btor1369)))
             (signal-state btor1369)))
           (btor1507 (signal (bvnot (signal-value btor1506)) (list)))
           (btor1508
            (if (bitvector->bool (signal-value btor1507)) btor873 btor1505))
           (btor1509
            (bv->signal
             (zero-extend (signal-value btor1508) (bitvector 55))
             btor1508))
           (btor1510
            (signal
             (concat (signal-value btor75) (signal-value btor74))
             (list)))
           (btor1511
            (signal
             (concat (signal-value btor86) (signal-value btor1510))
             (list)))
           (btor1512
            (signal
             (concat (signal-value btor97) (signal-value btor1511))
             (list)))
           (btor1513
            (signal
             (concat (signal-value btor108) (signal-value btor1512))
             (list)))
           (btor1514
            (signal
             (concat (signal-value btor119) (signal-value btor1513))
             (list)))
           (btor1515
            (signal
             (concat (signal-value btor124) (signal-value btor1514))
             (list)))
           (btor1516
            (signal
             (concat (signal-value btor125) (signal-value btor1515))
             (list)))
           (btor1517
            (signal
             (concat (signal-value btor126) (signal-value btor1516))
             (list)))
           (btor1518
            (signal
             (concat (signal-value btor127) (signal-value btor1517))
             (list)))
           (btor1519
            (signal
             (concat (signal-value btor76) (signal-value btor1518))
             (list)))
           (btor1520
            (signal
             (concat (signal-value btor77) (signal-value btor1519))
             (list)))
           (btor1521
            (signal
             (concat (signal-value btor78) (signal-value btor1520))
             (list)))
           (btor1522
            (signal
             (concat (signal-value btor79) (signal-value btor1521))
             (list)))
           (btor1523
            (signal
             (concat (signal-value btor80) (signal-value btor1522))
             (list)))
           (btor1524
            (signal
             (concat (signal-value btor81) (signal-value btor1523))
             (list)))
           (btor1525
            (signal
             (concat (signal-value btor82) (signal-value btor1524))
             (list)))
           (btor1526
            (signal
             (concat (signal-value btor83) (signal-value btor1525))
             (list)))
           (btor1527
            (signal
             (concat (signal-value btor84) (signal-value btor1526))
             (list)))
           (btor1528
            (signal
             (concat (signal-value btor85) (signal-value btor1527))
             (list)))
           (btor1529
            (signal
             (concat (signal-value btor87) (signal-value btor1528))
             (list)))
           (btor1530
            (signal
             (concat (signal-value btor88) (signal-value btor1529))
             (list)))
           (btor1531
            (signal
             (concat (signal-value btor89) (signal-value btor1530))
             (list)))
           (btor1532
            (signal
             (concat (signal-value btor90) (signal-value btor1531))
             (list)))
           (btor1533
            (signal
             (concat (signal-value btor91) (signal-value btor1532))
             (list)))
           (btor1534
            (signal
             (concat (signal-value btor92) (signal-value btor1533))
             (list)))
           (btor1535
            (signal
             (concat (signal-value btor93) (signal-value btor1534))
             (list)))
           (btor1536
            (signal
             (concat (signal-value btor94) (signal-value btor1535))
             (list)))
           (btor1537
            (signal
             (concat (signal-value btor95) (signal-value btor1536))
             (list)))
           (btor1538
            (signal
             (concat (signal-value btor96) (signal-value btor1537))
             (list)))
           (btor1539
            (signal
             (concat (signal-value btor98) (signal-value btor1538))
             (list)))
           (btor1540
            (signal
             (concat (signal-value btor99) (signal-value btor1539))
             (list)))
           (btor1541
            (signal
             (concat (signal-value btor100) (signal-value btor1540))
             (list)))
           (btor1542
            (signal
             (concat (signal-value btor101) (signal-value btor1541))
             (list)))
           (btor1543
            (signal
             (concat (signal-value btor102) (signal-value btor1542))
             (list)))
           (btor1544
            (signal
             (concat (signal-value btor103) (signal-value btor1543))
             (list)))
           (btor1545
            (signal
             (concat (signal-value btor104) (signal-value btor1544))
             (list)))
           (btor1546
            (signal
             (concat (signal-value btor105) (signal-value btor1545))
             (list)))
           (btor1547
            (signal
             (concat (signal-value btor106) (signal-value btor1546))
             (list)))
           (btor1548
            (signal
             (concat (signal-value btor107) (signal-value btor1547))
             (list)))
           (btor1549
            (signal
             (concat (signal-value btor109) (signal-value btor1548))
             (list)))
           (btor1550
            (signal
             (concat (signal-value btor110) (signal-value btor1549))
             (list)))
           (btor1551
            (signal
             (concat (signal-value btor111) (signal-value btor1550))
             (list)))
           (btor1552
            (signal
             (concat (signal-value btor112) (signal-value btor1551))
             (list)))
           (btor1553
            (signal
             (concat (signal-value btor113) (signal-value btor1552))
             (list)))
           (btor1554
            (signal
             (concat (signal-value btor114) (signal-value btor1553))
             (list)))
           (btor1555
            (signal
             (concat (signal-value btor115) (signal-value btor1554))
             (list)))
           (btor1556
            (signal
             (concat (signal-value btor116) (signal-value btor1555))
             (list)))
           (btor1557
            (signal
             (concat (signal-value btor117) (signal-value btor1556))
             (list)))
           (btor1558
            (signal
             (concat (signal-value btor118) (signal-value btor1557))
             (list)))
           (btor1559
            (signal
             (concat (signal-value btor120) (signal-value btor1558))
             (list)))
           (btor1560
            (signal
             (concat (signal-value btor121) (signal-value btor1559))
             (list)))
           (btor1561
            (signal
             (concat (signal-value btor122) (signal-value btor1560))
             (list)))
           (btor1562
            (signal
             (concat (signal-value btor123) (signal-value btor1561))
             (list)))
           (btor1563
            (bv->signal
             (zero-extend (signal-value btor1562) (bitvector 54))
             btor1562))
           (btor1564
            (bv->signal
             (zero-extend (signal-value btor899) (bitvector 27))
             btor899))
           (btor1565
            (bv->signal
             (zero-extend (signal-value btor1128) (bitvector 27))
             btor1128))
           (btor1566
            (signal
             (concat (signal-value btor1128) (signal-value btor899))
             (list)))
           (btor1567
            (bv->signal
             (zero-extend (signal-value btor1566) (bitvector 54))
             btor1566))
           (btor1568
            (bv->signal
             (zero-extend (signal-value btor899) (bitvector 27))
             btor899))
           (btor1569
            (bv->signal
             (zero-extend (signal-value btor1128) (bitvector 27))
             btor1128))
           (btor1570
            (bv->signal
             (zero-extend (signal-value btor899) (bitvector 27))
             btor899))
           (btor1571
            (bv->signal
             (zero-extend (signal-value btor1128) (bitvector 27))
             btor1128))
           (btor1572 (bv->signal (bv 17 (bitvector 5))))
           (btor1573
            (signal
             (bool->bitvector
              (bveq (signal-value btor337) (signal-value btor1572)))
             (list)))
           (btor1574
            (if (bitvector->bool (signal-value btor1573)) btor131 btor128))
           (btor1575 (bv->signal (bv 16 (bitvector 5))))
           (btor1576
            (signal
             (bool->bitvector
              (bveq (signal-value btor337) (signal-value btor1575)))
             (list)))
           (btor1577
            (if (bitvector->bool (signal-value btor1576)) btor130 btor1574))
           (btor1578 (bv->signal (bv 15 (bitvector 4))))
           (btor1579
            (bv->signal
             (zero-extend (signal-value btor1578) (bitvector 5))
             btor1578))
           (btor1580
            (signal
             (bool->bitvector
              (bveq (signal-value btor337) (signal-value btor1579)))
             (list)))
           (btor1581
            (if (bitvector->bool (signal-value btor1580)) btor129 btor1577))
           (btor1582
            (bv->signal
             (zero-extend (signal-value btor351) (bitvector 5))
             btor351))
           (btor1583
            (signal
             (bool->bitvector
              (bveq (signal-value btor337) (signal-value btor1582)))
             (list)))
           (btor1584
            (if (bitvector->bool (signal-value btor1583)) btor128 btor1581))
           (btor1585
            (bv->signal
             (zero-extend (signal-value btor1584) (bitvector 1))
             btor1584))
           (btor1586
            (bv->signal
             (zero-extend (signal-value btor370) (bitvector 1))
             btor370))
           (btor1587
            (bv->signal
             (zero-extend (signal-value btor480) (bitvector 54))
             btor480))
           (btor1588
            (bv->signal
             (zero-extend (signal-value btor375) (bitvector 54))
             btor375))
           (btor1589 (bv->signal (bv 20 (bitvector 5))))
           (btor1590
            (signal
             (bool->bitvector
              (bveq (signal-value btor339) (signal-value btor1589)))
             (list)))
           (btor1591
            (if (bitvector->bool (signal-value btor1590)) btor344 btor341))
           (btor1592 (bv->signal (bv 19 (bitvector 5))))
           (btor1593
            (signal
             (bool->bitvector
              (bveq (signal-value btor339) (signal-value btor1592)))
             (list)))
           (btor1594
            (if (bitvector->bool (signal-value btor1593)) btor343 btor1591))
           (btor1595 (bv->signal (bv 18 (bitvector 5))))
           (btor1596
            (signal
             (bool->bitvector
              (bveq (signal-value btor339) (signal-value btor1595)))
             (list)))
           (btor1597
            (if (bitvector->bool (signal-value btor1596)) btor342 btor1594))
           (btor1598
            (bv->signal
             (zero-extend (signal-value btor373) (bitvector 5))
             btor373))
           (btor1599
            (signal
             (bool->bitvector
              (bveq (signal-value btor339) (signal-value btor1598)))
             (list)))
           (btor1600
            (if (bitvector->bool (signal-value btor1599)) btor341 btor1597))
           (btor1601
            (bv->signal
             (zero-extend (signal-value btor1600) (bitvector 1))
             btor1600))
           (btor1602
            (bv->signal
             (zero-extend (signal-value btor477) (bitvector 54))
             btor477))
           (btor1603
            (bv->signal
             (zero-extend (signal-value btor375) (bitvector 54))
             btor375))
           (btor1604
            (bv->signal
             (zero-extend (signal-value btor1502) (bitvector 55))
             btor1502))
           (btor1605
            (signal
             (concat (signal-value btor187) (signal-value btor186))
             (list)))
           (btor1606
            (signal
             (concat (signal-value btor198) (signal-value btor1605))
             (list)))
           (btor1607
            (signal
             (concat (signal-value btor209) (signal-value btor1606))
             (list)))
           (btor1608
            (signal
             (concat (signal-value btor220) (signal-value btor1607))
             (list)))
           (btor1609
            (signal
             (concat (signal-value btor231) (signal-value btor1608))
             (list)))
           (btor1610
            (signal
             (concat (signal-value btor236) (signal-value btor1609))
             (list)))
           (btor1611
            (signal
             (concat (signal-value btor237) (signal-value btor1610))
             (list)))
           (btor1612
            (signal
             (concat (signal-value btor238) (signal-value btor1611))
             (list)))
           (btor1613
            (signal
             (concat (signal-value btor239) (signal-value btor1612))
             (list)))
           (btor1614
            (signal
             (concat (signal-value btor188) (signal-value btor1613))
             (list)))
           (btor1615
            (signal
             (concat (signal-value btor189) (signal-value btor1614))
             (list)))
           (btor1616
            (signal
             (concat (signal-value btor190) (signal-value btor1615))
             (list)))
           (btor1617
            (signal
             (concat (signal-value btor191) (signal-value btor1616))
             (list)))
           (btor1618
            (signal
             (concat (signal-value btor192) (signal-value btor1617))
             (list)))
           (btor1619
            (signal
             (concat (signal-value btor193) (signal-value btor1618))
             (list)))
           (btor1620
            (signal
             (concat (signal-value btor194) (signal-value btor1619))
             (list)))
           (btor1621
            (signal
             (concat (signal-value btor195) (signal-value btor1620))
             (list)))
           (btor1622
            (signal
             (concat (signal-value btor196) (signal-value btor1621))
             (list)))
           (btor1623
            (signal
             (concat (signal-value btor197) (signal-value btor1622))
             (list)))
           (btor1624
            (signal
             (concat (signal-value btor199) (signal-value btor1623))
             (list)))
           (btor1625
            (signal
             (concat (signal-value btor200) (signal-value btor1624))
             (list)))
           (btor1626
            (signal
             (concat (signal-value btor201) (signal-value btor1625))
             (list)))
           (btor1627
            (signal
             (concat (signal-value btor202) (signal-value btor1626))
             (list)))
           (btor1628
            (signal
             (concat (signal-value btor203) (signal-value btor1627))
             (list)))
           (btor1629
            (signal
             (concat (signal-value btor204) (signal-value btor1628))
             (list)))
           (btor1630
            (signal
             (concat (signal-value btor205) (signal-value btor1629))
             (list)))
           (btor1631
            (signal
             (concat (signal-value btor206) (signal-value btor1630))
             (list)))
           (btor1632
            (signal
             (concat (signal-value btor207) (signal-value btor1631))
             (list)))
           (btor1633
            (signal
             (concat (signal-value btor208) (signal-value btor1632))
             (list)))
           (btor1634
            (signal
             (concat (signal-value btor210) (signal-value btor1633))
             (list)))
           (btor1635
            (signal
             (concat (signal-value btor211) (signal-value btor1634))
             (list)))
           (btor1636
            (signal
             (concat (signal-value btor212) (signal-value btor1635))
             (list)))
           (btor1637
            (signal
             (concat (signal-value btor213) (signal-value btor1636))
             (list)))
           (btor1638
            (signal
             (concat (signal-value btor214) (signal-value btor1637))
             (list)))
           (btor1639
            (signal
             (concat (signal-value btor215) (signal-value btor1638))
             (list)))
           (btor1640
            (signal
             (concat (signal-value btor216) (signal-value btor1639))
             (list)))
           (btor1641
            (signal
             (concat (signal-value btor217) (signal-value btor1640))
             (list)))
           (btor1642
            (signal
             (concat (signal-value btor218) (signal-value btor1641))
             (list)))
           (btor1643
            (signal
             (concat (signal-value btor219) (signal-value btor1642))
             (list)))
           (btor1644
            (signal
             (concat (signal-value btor221) (signal-value btor1643))
             (list)))
           (btor1645
            (signal
             (concat (signal-value btor222) (signal-value btor1644))
             (list)))
           (btor1646
            (signal
             (concat (signal-value btor223) (signal-value btor1645))
             (list)))
           (btor1647
            (signal
             (concat (signal-value btor224) (signal-value btor1646))
             (list)))
           (btor1648
            (signal
             (concat (signal-value btor225) (signal-value btor1647))
             (list)))
           (btor1649
            (signal
             (concat (signal-value btor226) (signal-value btor1648))
             (list)))
           (btor1650
            (signal
             (concat (signal-value btor227) (signal-value btor1649))
             (list)))
           (btor1651
            (signal
             (concat (signal-value btor228) (signal-value btor1650))
             (list)))
           (btor1652
            (signal
             (concat (signal-value btor229) (signal-value btor1651))
             (list)))
           (btor1653
            (signal
             (concat (signal-value btor230) (signal-value btor1652))
             (list)))
           (btor1654
            (signal
             (concat (signal-value btor232) (signal-value btor1653))
             (list)))
           (btor1655
            (signal
             (concat (signal-value btor233) (signal-value btor1654))
             (list)))
           (btor1656
            (signal
             (concat (signal-value btor234) (signal-value btor1655))
             (list)))
           (btor1657
            (signal
             (concat (signal-value btor235) (signal-value btor1656))
             (list)))
           (btor1658
            (bv->signal
             (zero-extend (signal-value btor1657) (bitvector 54))
             btor1657))
           (btor1659
            (bv->signal
             (zero-extend (signal-value btor480) (bitvector 54))
             btor480))
           (btor1660
            (signal
             (bvor (signal-value btor1326) (signal-value btor1508))
             (list)))
           (btor1661 (signal (bvnot (signal-value btor1660)) (list)))
           (btor1662
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1662")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1662")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1662")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1662")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 3))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1663
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1663")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1663")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1663")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1663")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 3))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1664
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1664")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1664")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1664")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1664")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1666
            (signal
             (concat (signal-value btor240) (signal-value btor1664))
             (list)))
           (btor1667
            (signal
             (bool->bitvector
              (bveq (signal-value btor1666) (signal-value btor373)))
             (list)))
           (btor1668
            (if (bitvector->bool (signal-value btor1667)) btor1663 btor1662))
           (btor1669
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1669")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1669")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1669")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1669")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 3))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1670
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1670")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1670")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1670")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1670")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 3))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1671
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1671")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1671")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1671")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1671")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1673
            (signal
             (concat (signal-value btor240) (signal-value btor1671))
             (list)))
           (btor1674
            (signal
             (bool->bitvector
              (bveq (signal-value btor1673) (signal-value btor602)))
             (list)))
           (btor1675
            (if (bitvector->bool (signal-value btor1674)) btor1670 btor1669))
           (btor1676
            (signal
             (bvxor (signal-value btor1668) (signal-value btor1675))
             (list)))
           (btor1677
            (signal
             (concat (signal-value btor1676) (signal-value btor1021))
             (list)))
           (btor1678
            (signal
             (bool->bitvector
              (bveq (signal-value btor1677) (signal-value btor367)))
             (list)))
           (btor1679
            (if (bitvector->bool (signal-value btor1678)) btor1661 btor873))
           (btor1680
            (bv->signal
             (zero-extend (signal-value btor890) (bitvector 4))
             btor890))
           (btor1681
            (signal
             (bool->bitvector
              (bveq (signal-value btor1677) (signal-value btor1680)))
             (list)))
           (btor1682
            (if (bitvector->bool (signal-value btor1681)) btor1660 btor1679))
           (btor1683
            (signal
             (bvand (signal-value btor1326) (signal-value btor1508))
             (list)))
           (btor1684 (bv->signal (bv 8 (bitvector 4))))
           (btor1685
            (signal
             (bool->bitvector
              (bveq (signal-value btor1677) (signal-value btor1684)))
             (list)))
           (btor1686
            (if (bitvector->bool (signal-value btor1685)) btor1683 btor1682))
           (btor1687
            (signal
             (bvxor (signal-value btor1326) (signal-value btor1508))
             (list)))
           (btor1688
            (signal
             (bool->bitvector
              (bveq (signal-value btor1677) (signal-value btor355)))
             (list)))
           (btor1689
            (if (bitvector->bool (signal-value btor1688)) btor1687 btor1686))
           (btor1690
            (signal
             ((lambda (a b) (bvnot (bvxor a b)))
              (signal-value btor1326)
              (signal-value btor1508))
             (list)))
           (btor1691
            (signal
             (bool->bitvector
              (bveq (signal-value btor1677) (signal-value btor363)))
             (list)))
           (btor1692
            (if (bitvector->bool (signal-value btor1691)) btor1690 btor1689))
           (btor1693
            (signal
             (bvsub (signal-value btor1080) (signal-value btor1326))
             (list)))
           (btor1694
            (signal
             (bvsub (signal-value btor1693) (signal-value btor1508))
             (list)))
           (btor1695
            (bv->signal
             (zero-extend (signal-value btor1370) (bitvector 4))
             btor1370))
           (btor1696
            (signal
             (bool->bitvector
              (bveq (signal-value btor1677) (signal-value btor1695)))
             (list)))
           (btor1697
            (if (bitvector->bool (signal-value btor1696)) btor1694 btor1692))
           (btor1698
            (signal
             (bvadd (signal-value btor1080) (signal-value btor1326))
             (list)))
           (btor1699
            (signal
             (bvsub (signal-value btor1698) (signal-value btor1508))
             (list)))
           (btor1700
            (bv->signal
             (zero-extend (signal-value btor1375) (bitvector 4))
             btor1375))
           (btor1701
            (signal
             (bool->bitvector
              (bveq (signal-value btor1677) (signal-value btor1700)))
             (list)))
           (btor1702
            (if (bitvector->bool (signal-value btor1701)) btor1699 btor1697))
           (btor1703
            (signal
             (bvadd (signal-value btor1693) (signal-value btor1508))
             (list)))
           (btor1704
            (bv->signal
             (zero-extend (signal-value btor1378) (bitvector 4))
             btor1378))
           (btor1705
            (signal
             (bool->bitvector
              (bveq (signal-value btor1677) (signal-value btor1704)))
             (list)))
           (btor1706
            (if (bitvector->bool (signal-value btor1705)) btor1703 btor1702))
           (btor1707
            (signal
             (bvadd (signal-value btor1698) (signal-value btor1508))
             (list)))
           (btor1708
            (bv->signal
             (zero-extend (signal-value btor1381) (bitvector 4))
             btor1381))
           (btor1709
            (signal
             (bool->bitvector
              (bveq (signal-value btor1677) (signal-value btor1708)))
             (list)))
           (btor1710
            (if (bitvector->bool (signal-value btor1709)) btor1707 btor1706))
           (btor1711 (signal (bvnot (signal-value btor1683)) (list)))
           (btor1712
            (signal
             (apply bvor (bitvector->bits (signal-value btor1677)))
             (signal-state btor1677)))
           (btor1713 (signal (bvnot (signal-value btor1712)) (list)))
           (btor1714
            (if (bitvector->bool (signal-value btor1713)) btor1711 btor1710))
           (btor1715
            (signal
             (extract 54 0 (signal-value btor284))
             (signal-state btor284)))
           (btor1716 (signal (bvnot (signal-value btor1715)) (list)))
           (btor1717
            (signal
             (bvand (signal-value btor1714) (signal-value btor1716))
             (list)))
           (btor1718
            (signal
             (apply bvor (bitvector->bits (signal-value btor1717)))
             (signal-state btor1717)))
           (btor1719 (signal (bvnot (signal-value btor1718)) (list)))
           (btor1720
            (signal
             (bvor (signal-value btor1714) (signal-value btor1715))
             (list)))
           (btor1721
            (signal
             (apply bvand (bitvector->bits (signal-value btor1720)))
             (signal-state btor1720)))
           (btor1722
            (signal
             (bvor (signal-value btor1719) (signal-value btor1721))
             (list)))
           (btor1723 (signal (bvnot (signal-value btor1722)) (list)))
           (btor1724
            (bv->signal
             (zero-extend (signal-value btor1723) (bitvector 1))
             btor1723))
           (btor1725
            (bv->signal
             (zero-extend (signal-value btor605) (bitvector 1))
             btor605))
           (btor1726
            (bv->signal
             (zero-extend (signal-value btor605) (bitvector 1))
             btor605))
           (btor1727
            (bv->signal
             (zero-extend (signal-value btor1721) (bitvector 1))
             btor1721))
           (btor1728
            (bv->signal
             (zero-extend (signal-value btor605) (bitvector 1))
             btor605))
           (btor1729
            (bv->signal
             (zero-extend (signal-value btor604) (bitvector 1))
             btor604))
           (btor1730
            (bv->signal
             (zero-extend (signal-value btor595) (bitvector 1))
             btor595))
           (btor1731
            (bv->signal
             (zero-extend (signal-value btor621) (bitvector 1))
             btor621))
           (btor1732
            (bv->signal
             (zero-extend (signal-value btor621) (bitvector 1))
             btor621))
           (btor1733
            (signal
             (extract 53 0 (signal-value btor1714))
             (signal-state btor1714)))
           (btor1734
            (signal
             (extract 53 0 (signal-value btor323))
             (signal-state btor323)))
           (btor1735 (bv->signal (bv 23 (bitvector 5))))
           (btor1736
            (signal
             (bool->bitvector
              (bveq (signal-value btor324) (signal-value btor1735)))
             (list)))
           (btor1737
            (if (bitvector->bool (signal-value btor1736)) btor1734 btor1566))
           (btor1738
            (signal
             (bvxor (signal-value btor1733) (signal-value btor1737))
             (list)))
           (btor1739 (signal (bvnot (signal-value btor1738)) (list)))
           (btor1740
            (signal
             (extract 53 0 (signal-value btor285))
             (signal-state btor285)))
           (btor1741
            (signal
             (bool->bitvector
              (bveq (signal-value btor286) (signal-value btor1735)))
             (list)))
           (btor1742
            (if (bitvector->bool (signal-value btor1741)) btor1740 btor1566))
           (btor1743
            (signal
             (bvor (signal-value btor1739) (signal-value btor1742))
             (list)))
           (btor1744
            (signal
             (apply bvand (bitvector->bits (signal-value btor1743)))
             (signal-state btor1743)))
           (btor1745
            (bv->signal
             (zero-extend (signal-value btor1744) (bitvector 1))
             btor1744))
           (btor1746
            (bv->signal
             (zero-extend (signal-value btor621) (bitvector 1))
             btor621))
           (btor1747
            (bv->signal
             (zero-extend (signal-value btor620) (bitvector 1))
             btor620))
           (btor1748
            (bv->signal
             (zero-extend (signal-value btor613) (bitvector 1))
             btor613))
           (btor1749
            (bv->signal
             (zero-extend (signal-value btor637) (bitvector 1))
             btor637))
           (btor1750
            (bv->signal
             (zero-extend (signal-value btor637) (bitvector 1))
             btor637))
           (btor1751
            (signal
             (bvor (signal-value btor1738) (signal-value btor1742))
             (list)))
           (btor1752
            (signal
             (apply bvand (bitvector->bits (signal-value btor1751)))
             (signal-state btor1751)))
           (btor1753
            (bv->signal
             (zero-extend (signal-value btor1752) (bitvector 1))
             btor1752))
           (btor1754
            (bv->signal
             (zero-extend (signal-value btor637) (bitvector 1))
             btor637))
           (btor1755
            (bv->signal
             (zero-extend (signal-value btor636) (bitvector 1))
             btor636))
           (btor1756
            (bv->signal
             (zero-extend (signal-value btor629) (bitvector 1))
             btor629))
           (btor1757
            (bv->signal
             (zero-extend (signal-value btor653) (bitvector 1))
             btor653))
           (btor1758
            (bv->signal
             (zero-extend (signal-value btor653) (bitvector 1))
             btor653))
           (btor1759
            (signal
             (apply bvor (bitvector->bits (signal-value btor1733)))
             (signal-state btor1733)))
           (btor1760 (signal (bvnot (signal-value btor1759)) (list)))
           (btor1761
            (bv->signal
             (zero-extend (signal-value btor1760) (bitvector 1))
             btor1760))
           (btor1762
            (bv->signal
             (zero-extend (signal-value btor653) (bitvector 1))
             btor653))
           (btor1763
            (bv->signal
             (zero-extend (signal-value btor652) (bitvector 1))
             btor652))
           (btor1764
            (bv->signal
             (zero-extend (signal-value btor645) (bitvector 1))
             btor645))
           (btor1765
            (bv->signal
             (zero-extend (signal-value btor669) (bitvector 1))
             btor669))
           (btor1766
            (bv->signal
             (zero-extend (signal-value btor669) (bitvector 1))
             btor669))
           (btor1767
            (bv->signal
             (zero-extend (signal-value btor1719) (bitvector 1))
             btor1719))
           (btor1768
            (bv->signal
             (zero-extend (signal-value btor669) (bitvector 1))
             btor669))
           (btor1769
            (bv->signal
             (zero-extend (signal-value btor668) (bitvector 1))
             btor668))
           (btor1770
            (bv->signal
             (zero-extend (signal-value btor661) (bitvector 1))
             btor661))
           (btor1771
            (bv->signal
             (zero-extend (signal-value btor128) (bitvector 1))
             btor128))
           (btor1772
            (bv->signal
             (zero-extend (signal-value btor240) (bitvector 1))
             btor240))
           (btor1773
            (bv->signal
             (zero-extend (signal-value btor341) (bitvector 1))
             btor341))
           (btor1774
            (bv->signal
             (zero-extend (signal-value btor128) (bitvector 1))
             btor128))
           (btor1775
            (bv->signal
             (zero-extend (signal-value btor128) (bitvector 1))
             btor128))
           (btor1776
            (bv->signal
             (zero-extend (signal-value btor240) (bitvector 1))
             btor240))
           (btor1777
            (bv->signal
             (zero-extend (signal-value btor240) (bitvector 1))
             btor240))
           (btor1778
            (bv->signal
             (zero-extend (signal-value btor341) (bitvector 1))
             btor341))
           (btor1779
            (bv->signal
             (zero-extend (signal-value btor341) (bitvector 1))
             btor341))
           (btor1780
            (signal
             (concat (signal-value btor248) (signal-value btor247))
             (list)))
           (btor1781
            (signal
             (concat (signal-value btor259) (signal-value btor1780))
             (list)))
           (btor1782
            (signal
             (concat (signal-value btor270) (signal-value btor1781))
             (list)))
           (btor1783
            (signal
             (concat (signal-value btor277) (signal-value btor1782))
             (list)))
           (btor1784
            (signal
             (concat (signal-value btor278) (signal-value btor1783))
             (list)))
           (btor1785
            (signal
             (concat (signal-value btor279) (signal-value btor1784))
             (list)))
           (btor1786
            (signal
             (concat (signal-value btor280) (signal-value btor1785))
             (list)))
           (btor1787
            (signal
             (concat (signal-value btor281) (signal-value btor1786))
             (list)))
           (btor1788
            (signal
             (concat (signal-value btor282) (signal-value btor1787))
             (list)))
           (btor1789
            (signal
             (concat (signal-value btor249) (signal-value btor1788))
             (list)))
           (btor1790
            (signal
             (concat (signal-value btor250) (signal-value btor1789))
             (list)))
           (btor1791
            (signal
             (concat (signal-value btor251) (signal-value btor1790))
             (list)))
           (btor1792
            (signal
             (concat (signal-value btor252) (signal-value btor1791))
             (list)))
           (btor1793
            (signal
             (concat (signal-value btor253) (signal-value btor1792))
             (list)))
           (btor1794
            (signal
             (concat (signal-value btor254) (signal-value btor1793))
             (list)))
           (btor1795
            (signal
             (concat (signal-value btor255) (signal-value btor1794))
             (list)))
           (btor1796
            (signal
             (concat (signal-value btor256) (signal-value btor1795))
             (list)))
           (btor1797
            (signal
             (concat (signal-value btor257) (signal-value btor1796))
             (list)))
           (btor1798
            (signal
             (concat (signal-value btor258) (signal-value btor1797))
             (list)))
           (btor1799
            (signal
             (concat (signal-value btor260) (signal-value btor1798))
             (list)))
           (btor1800
            (signal
             (concat (signal-value btor261) (signal-value btor1799))
             (list)))
           (btor1801
            (signal
             (concat (signal-value btor262) (signal-value btor1800))
             (list)))
           (btor1802
            (signal
             (concat (signal-value btor263) (signal-value btor1801))
             (list)))
           (btor1803
            (signal
             (concat (signal-value btor264) (signal-value btor1802))
             (list)))
           (btor1804
            (signal
             (concat (signal-value btor265) (signal-value btor1803))
             (list)))
           (btor1805
            (signal
             (concat (signal-value btor266) (signal-value btor1804))
             (list)))
           (btor1806
            (signal
             (concat (signal-value btor267) (signal-value btor1805))
             (list)))
           (btor1807
            (signal
             (concat (signal-value btor268) (signal-value btor1806))
             (list)))
           (btor1808
            (signal
             (concat (signal-value btor269) (signal-value btor1807))
             (list)))
           (btor1809
            (signal
             (concat (signal-value btor271) (signal-value btor1808))
             (list)))
           (btor1810
            (signal
             (concat (signal-value btor272) (signal-value btor1809))
             (list)))
           (btor1811
            (signal
             (concat (signal-value btor273) (signal-value btor1810))
             (list)))
           (btor1812
            (signal
             (concat (signal-value btor274) (signal-value btor1811))
             (list)))
           (btor1813
            (signal
             (concat (signal-value btor275) (signal-value btor1812))
             (list)))
           (btor1814
            (signal
             (concat (signal-value btor276) (signal-value btor1813))
             (list)))
           (btor1815
            (bv->signal
             (zero-extend (signal-value btor1814) (bitvector 36))
             btor1814))
           (btor1816
            (bv->signal
             (zero-extend (signal-value btor1073) (bitvector 55))
             btor1073))
           (btor1817
            (bv->signal
             (zero-extend (signal-value btor1715) (bitvector 55))
             btor1715))
           (btor1818
            (bv->signal
             (zero-extend (signal-value btor1742) (bitvector 54))
             btor1742))
           (btor1819
            (bv->signal
             (zero-extend (signal-value btor1740) (bitvector 54))
             btor1740))
           (btor1820
            (signal
             (concat (signal-value btor287) (signal-value btor1286))
             (list)))
           (btor1821
            (signal
             (concat (signal-value btor288) (signal-value btor1820))
             (list)))
           (btor1822
            (signal
             (concat (signal-value btor299) (signal-value btor1821))
             (list)))
           (btor1823
            (signal
             (concat (signal-value btor310) (signal-value btor1822))
             (list)))
           (btor1824
            (signal
             (concat (signal-value btor317) (signal-value btor1823))
             (list)))
           (btor1825
            (signal
             (concat (signal-value btor318) (signal-value btor1824))
             (list)))
           (btor1826
            (signal
             (concat (signal-value btor319) (signal-value btor1825))
             (list)))
           (btor1827
            (signal
             (concat (signal-value btor320) (signal-value btor1826))
             (list)))
           (btor1828
            (signal
             (concat (signal-value btor321) (signal-value btor1827))
             (list)))
           (btor1829
            (signal
             (concat (signal-value btor322) (signal-value btor1828))
             (list)))
           (btor1830
            (signal
             (concat (signal-value btor289) (signal-value btor1829))
             (list)))
           (btor1831
            (signal
             (concat (signal-value btor290) (signal-value btor1830))
             (list)))
           (btor1832
            (signal
             (concat (signal-value btor291) (signal-value btor1831))
             (list)))
           (btor1833
            (signal
             (concat (signal-value btor292) (signal-value btor1832))
             (list)))
           (btor1834
            (signal
             (concat (signal-value btor293) (signal-value btor1833))
             (list)))
           (btor1835
            (signal
             (concat (signal-value btor294) (signal-value btor1834))
             (list)))
           (btor1836
            (signal
             (concat (signal-value btor295) (signal-value btor1835))
             (list)))
           (btor1837
            (signal
             (concat (signal-value btor296) (signal-value btor1836))
             (list)))
           (btor1838
            (signal
             (concat (signal-value btor297) (signal-value btor1837))
             (list)))
           (btor1839
            (signal
             (concat (signal-value btor298) (signal-value btor1838))
             (list)))
           (btor1840
            (signal
             (concat (signal-value btor300) (signal-value btor1839))
             (list)))
           (btor1841
            (signal
             (concat (signal-value btor301) (signal-value btor1840))
             (list)))
           (btor1842
            (signal
             (concat (signal-value btor302) (signal-value btor1841))
             (list)))
           (btor1843
            (signal
             (concat (signal-value btor303) (signal-value btor1842))
             (list)))
           (btor1844
            (signal
             (concat (signal-value btor304) (signal-value btor1843))
             (list)))
           (btor1845
            (signal
             (concat (signal-value btor305) (signal-value btor1844))
             (list)))
           (btor1846
            (signal
             (concat (signal-value btor306) (signal-value btor1845))
             (list)))
           (btor1847
            (signal
             (concat (signal-value btor307) (signal-value btor1846))
             (list)))
           (btor1848
            (signal
             (concat (signal-value btor308) (signal-value btor1847))
             (list)))
           (btor1849
            (signal
             (concat (signal-value btor309) (signal-value btor1848))
             (list)))
           (btor1850
            (signal
             (concat (signal-value btor311) (signal-value btor1849))
             (list)))
           (btor1851
            (signal
             (concat (signal-value btor312) (signal-value btor1850))
             (list)))
           (btor1852
            (signal
             (concat (signal-value btor313) (signal-value btor1851))
             (list)))
           (btor1853
            (signal
             (concat (signal-value btor314) (signal-value btor1852))
             (list)))
           (btor1854
            (signal
             (concat (signal-value btor315) (signal-value btor1853))
             (list)))
           (btor1855
            (signal
             (concat (signal-value btor316) (signal-value btor1854))
             (list)))
           (btor1856
            (bv->signal
             (zero-extend (signal-value btor1855) (bitvector 54))
             btor1855))
           (btor1857
            (signal
             (concat (signal-value btor288) (signal-value btor287))
             (list)))
           (btor1858
            (signal
             (concat (signal-value btor299) (signal-value btor1857))
             (list)))
           (btor1859
            (signal
             (concat (signal-value btor310) (signal-value btor1858))
             (list)))
           (btor1860
            (signal
             (concat (signal-value btor317) (signal-value btor1859))
             (list)))
           (btor1861
            (signal
             (concat (signal-value btor318) (signal-value btor1860))
             (list)))
           (btor1862
            (signal
             (concat (signal-value btor319) (signal-value btor1861))
             (list)))
           (btor1863
            (signal
             (concat (signal-value btor320) (signal-value btor1862))
             (list)))
           (btor1864
            (signal
             (concat (signal-value btor321) (signal-value btor1863))
             (list)))
           (btor1865
            (signal
             (concat (signal-value btor322) (signal-value btor1864))
             (list)))
           (btor1866
            (signal
             (concat (signal-value btor289) (signal-value btor1865))
             (list)))
           (btor1867
            (signal
             (concat (signal-value btor290) (signal-value btor1866))
             (list)))
           (btor1868
            (signal
             (concat (signal-value btor291) (signal-value btor1867))
             (list)))
           (btor1869
            (signal
             (concat (signal-value btor292) (signal-value btor1868))
             (list)))
           (btor1870
            (signal
             (concat (signal-value btor293) (signal-value btor1869))
             (list)))
           (btor1871
            (signal
             (concat (signal-value btor294) (signal-value btor1870))
             (list)))
           (btor1872
            (signal
             (concat (signal-value btor295) (signal-value btor1871))
             (list)))
           (btor1873
            (signal
             (concat (signal-value btor296) (signal-value btor1872))
             (list)))
           (btor1874
            (signal
             (concat (signal-value btor297) (signal-value btor1873))
             (list)))
           (btor1875
            (signal
             (concat (signal-value btor298) (signal-value btor1874))
             (list)))
           (btor1876
            (signal
             (concat (signal-value btor300) (signal-value btor1875))
             (list)))
           (btor1877
            (signal
             (concat (signal-value btor301) (signal-value btor1876))
             (list)))
           (btor1878
            (signal
             (concat (signal-value btor302) (signal-value btor1877))
             (list)))
           (btor1879
            (signal
             (concat (signal-value btor303) (signal-value btor1878))
             (list)))
           (btor1880
            (signal
             (concat (signal-value btor304) (signal-value btor1879))
             (list)))
           (btor1881
            (signal
             (concat (signal-value btor305) (signal-value btor1880))
             (list)))
           (btor1882
            (signal
             (concat (signal-value btor306) (signal-value btor1881))
             (list)))
           (btor1883
            (signal
             (concat (signal-value btor307) (signal-value btor1882))
             (list)))
           (btor1884
            (signal
             (concat (signal-value btor308) (signal-value btor1883))
             (list)))
           (btor1885
            (signal
             (concat (signal-value btor309) (signal-value btor1884))
             (list)))
           (btor1886
            (signal
             (concat (signal-value btor311) (signal-value btor1885))
             (list)))
           (btor1887
            (signal
             (concat (signal-value btor312) (signal-value btor1886))
             (list)))
           (btor1888
            (signal
             (concat (signal-value btor313) (signal-value btor1887))
             (list)))
           (btor1889
            (signal
             (concat (signal-value btor314) (signal-value btor1888))
             (list)))
           (btor1890
            (signal
             (concat (signal-value btor315) (signal-value btor1889))
             (list)))
           (btor1891
            (signal
             (concat (signal-value btor316) (signal-value btor1890))
             (list)))
           (btor1892
            (bv->signal
             (zero-extend (signal-value btor1891) (bitvector 36))
             btor1891))
           (btor1893
            (bv->signal
             (zero-extend (signal-value btor1282) (bitvector 55))
             btor1282))
           (btor1894
            (bv->signal
             (zero-extend (signal-value btor1737) (bitvector 54))
             btor1737))
           (btor1895
            (bv->signal
             (zero-extend (signal-value btor1734) (bitvector 54))
             btor1734))
           (btor1896
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1896")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1896")))))
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
                          (bv 0 3))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1897
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1897")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1897")))))
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
                          (bv 0 3))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1898
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1898")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1898")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1898")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1898")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1900
            (signal
             (concat (signal-value btor240) (signal-value btor1898))
             (list)))
           (btor1901
            (signal
             (bool->bitvector
              (bveq (signal-value btor1900) (signal-value btor373)))
             (list)))
           (btor1902
            (if (bitvector->bool (signal-value btor1901)) btor1897 btor1896))
           (btor1903
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1903")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1903")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1903")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1903")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 3))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1904
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1904")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1904")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1904")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1904")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 3))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1905
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1905")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1905")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1905")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1905")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1907
            (signal
             (concat (signal-value btor240) (signal-value btor1905))
             (list)))
           (btor1908
            (signal
             (bool->bitvector
              (bveq (signal-value btor1907) (signal-value btor602)))
             (list)))
           (btor1909
            (if (bitvector->bool (signal-value btor1908)) btor1904 btor1903))
           (btor1910
            (signal
             (bvxor (signal-value btor1902) (signal-value btor1909))
             (list)))
           (btor1911
            (bv->signal
             (zero-extend (signal-value btor1910) (bitvector 3))
             btor1910))
           (btor1912
            (bv->signal
             (zero-extend (signal-value btor1910) (bitvector 3))
             btor1910))
           (btor1913
            (bv->signal
             (zero-extend (signal-value btor1909) (bitvector 3))
             btor1909))
           (btor1914
            (bv->signal
             (zero-extend (signal-value btor1902) (bitvector 3))
             btor1902))
           (btor1915
            (bv->signal
             (zero-extend (signal-value btor1676) (bitvector 3))
             btor1676))
           (btor1916
            (bv->signal
             (zero-extend (signal-value btor1676) (bitvector 3))
             btor1676))
           (btor1917
            (bv->signal
             (zero-extend (signal-value btor1675) (bitvector 3))
             btor1675))
           (btor1918
            (bv->signal
             (zero-extend (signal-value btor1668) (bitvector 3))
             btor1668))
           (btor1919
            (bv->signal
             (zero-extend (signal-value btor1910) (bitvector 3))
             btor1910))
           (btor1920
            (bv->signal
             (zero-extend (signal-value btor1676) (bitvector 3))
             btor1676))
           (btor1921
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1921")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1921")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1921")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1921")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1922
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1922")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1922")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1922")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1922")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1923
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1923")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1923")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1923")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1923")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1925
            (signal
             (concat (signal-value btor240) (signal-value btor1923))
             (list)))
           (btor1926
            (signal
             (bool->bitvector
              (bveq (signal-value btor1925) (signal-value btor373)))
             (list)))
           (btor1927
            (if (bitvector->bool (signal-value btor1926)) btor1922 btor1921))
           (btor1928
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1928")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1928")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1928")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1928")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1929
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1929")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1929")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1929")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1929")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1930
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1930")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1930")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1930")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1930")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1932
            (signal
             (concat (signal-value btor240) (signal-value btor1930))
             (list)))
           (btor1933
            (signal
             (bool->bitvector
              (bveq (signal-value btor1932) (signal-value btor602)))
             (list)))
           (btor1934
            (if (bitvector->bool (signal-value btor1933)) btor1929 btor1928))
           (btor1935
            (signal
             (bvxor (signal-value btor1927) (signal-value btor1934))
             (list)))
           (btor1936
            (bv->signal
             (zero-extend (signal-value btor1935) (bitvector 1))
             btor1935))
           (btor1937
            (bv->signal
             (zero-extend (signal-value btor1935) (bitvector 1))
             btor1935))
           (btor1938
            (bv->signal
             (zero-extend (signal-value btor1934) (bitvector 1))
             btor1934))
           (btor1939
            (bv->signal
             (zero-extend (signal-value btor1927) (bitvector 1))
             btor1927))
           (btor1940
            (bv->signal
             (zero-extend (signal-value btor1021) (bitvector 1))
             btor1021))
           (btor1941
            (bv->signal
             (zero-extend (signal-value btor1021) (bitvector 1))
             btor1021))
           (btor1942
            (bv->signal
             (zero-extend (signal-value btor1020) (bitvector 1))
             btor1020))
           (btor1943
            (bv->signal
             (zero-extend (signal-value btor1013) (bitvector 1))
             btor1013))
           (btor1944
            (bv->signal
             (zero-extend (signal-value btor1935) (bitvector 1))
             btor1935))
           (btor1945
            (bv->signal
             (zero-extend (signal-value btor1021) (bitvector 1))
             btor1021))
           (btor1946
            (signal
             (concat (signal-value btor327) (signal-value btor326))
             (list)))
           (btor1947
            (signal
             (concat (signal-value btor329) (signal-value btor1946))
             (list)))
           (btor1948
            (signal
             (concat (signal-value btor330) (signal-value btor1947))
             (list)))
           (btor1949
            (signal
             (concat (signal-value btor331) (signal-value btor1948))
             (list)))
           (btor1950
            (signal
             (concat (signal-value btor332) (signal-value btor1949))
             (list)))
           (btor1951
            (signal
             (concat (signal-value btor333) (signal-value btor1950))
             (list)))
           (btor1952
            (signal
             (concat (signal-value btor334) (signal-value btor1951))
             (list)))
           (btor1953
            (signal
             (concat (signal-value btor335) (signal-value btor1952))
             (list)))
           (btor1954
            (signal
             (concat (signal-value btor336) (signal-value btor1953))
             (list)))
           (btor1955
            (signal
             (concat (signal-value btor328) (signal-value btor1954))
             (list)))
           (btor1956
            (bv->signal
             (zero-extend (signal-value btor1955) (bitvector 11))
             btor1955))
           (btor1957
            (signal
             (concat (signal-value btor1021) (signal-value btor888))
             (list)))
           (btor1958
            (signal
             (concat (signal-value btor1676) (signal-value btor1957))
             (list)))
           (btor1959
            (bv->signal
             (zero-extend (signal-value btor1958) (bitvector 11))
             btor1958))
           (btor1960
            (bv->signal
             (zero-extend (signal-value btor128) (bitvector 1))
             btor128))
           (btor1961
            (bv->signal
             (zero-extend (signal-value btor240) (bitvector 1))
             btor240))
           (btor1962
            (bv->signal
             (zero-extend (signal-value btor341) (bitvector 1))
             btor341))
           (btor1963
            (bv->signal
             (zero-extend (signal-value btor128) (bitvector 1))
             btor128))
           (btor1964
            (bv->signal
             (zero-extend (signal-value btor240) (bitvector 1))
             btor240))
           (btor1965
            (bv->signal
             (zero-extend (signal-value btor341) (bitvector 1))
             btor341))
           (btor1966
            (bv->signal
             (zero-extend (signal-value btor128) (bitvector 1))
             btor128))
           (btor1967
            (bv->signal
             (zero-extend (signal-value btor240) (bitvector 1))
             btor240))
           (btor1968
            (bv->signal
             (zero-extend (signal-value btor341) (bitvector 1))
             btor341))
           (btor1969
            (bv->signal
             (zero-extend (signal-value btor128) (bitvector 1))
             btor128))
           (btor1970
            (bv->signal
             (zero-extend (signal-value btor240) (bitvector 1))
             btor240))
           (btor1971
            (bv->signal
             (zero-extend (signal-value btor341) (bitvector 1))
             btor341))
           (btor1972
            (bv->signal
             (zero-extend (signal-value btor240) (bitvector 1))
             btor240))
           (btor1973
            (bv->signal
             (zero-extend (signal-value btor240) (bitvector 1))
             btor240))
           (btor1974
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1974")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1974")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1974")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1974")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 7))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1975
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1975")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1975")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1975")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1975")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 7))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1976
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1976")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1976")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1976")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1976")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1978
            (signal
             (concat (signal-value btor240) (signal-value btor1976))
             (list)))
           (btor1979
            (signal
             (bool->bitvector
              (bveq (signal-value btor1978) (signal-value btor373)))
             (list)))
           (btor1980
            (if (bitvector->bool (signal-value btor1979)) btor1975 btor1974))
           (btor1981
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1981")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1981")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1981")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1981")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 7))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1982
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1982")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1982")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1982")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1982")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 7))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1983
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state1983")))
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state1983")))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state1983")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state1983")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1985
            (signal
             (concat (signal-value btor240) (signal-value btor1983))
             (list)))
           (btor1986
            (signal
             (bool->bitvector
              (bveq (signal-value btor1985) (signal-value btor602)))
             (list)))
           (btor1987
            (if (bitvector->bool (signal-value btor1986)) btor1982 btor1981))
           (btor1988
            (signal
             (bvxor (signal-value btor1980) (signal-value btor1987))
             (list)))
           (btor1989
            (bv->signal
             (zero-extend (signal-value btor1988) (bitvector 7))
             btor1988))
           (btor1990
            (bv->signal
             (zero-extend (signal-value btor1988) (bitvector 7))
             btor1988))
           (btor1991
            (bv->signal
             (zero-extend (signal-value btor1987) (bitvector 7))
             btor1987))
           (btor1992
            (bv->signal
             (zero-extend (signal-value btor1980) (bitvector 7))
             btor1980))
           (btor1993
            (bv->signal
             (zero-extend (signal-value btor888) (bitvector 7))
             btor888))
           (btor1994
            (bv->signal
             (zero-extend (signal-value btor888) (bitvector 7))
             btor888))
           (btor1995
            (bv->signal
             (zero-extend (signal-value btor887) (bitvector 7))
             btor887))
           (btor1996
            (bv->signal
             (zero-extend (signal-value btor880) (bitvector 7))
             btor880))
           (btor1997
            (bv->signal
             (zero-extend (signal-value btor1988) (bitvector 7))
             btor1988))
           (btor1998
            (bv->signal
             (zero-extend (signal-value btor888) (bitvector 7))
             btor888))
           (btor1999
            (bv->signal
             (zero-extend (signal-value btor128) (bitvector 1))
             btor128))
           (btor2000
            (bv->signal
             (zero-extend (signal-value btor240) (bitvector 1))
             btor240))
           (btor2001
            (bv->signal
             (zero-extend (signal-value btor341) (bitvector 1))
             btor341))
           (btor2002
            (bv->signal
             (zero-extend (signal-value btor128) (bitvector 1))
             btor128))
           (btor2003
            (bv->signal
             (zero-extend (signal-value btor240) (bitvector 1))
             btor240))
           (btor2004
            (bv->signal
             (zero-extend (signal-value btor341) (bitvector 1))
             btor341))
           (btor2005
            (bv->signal
             (zero-extend (signal-value btor685) (bitvector 1))
             btor685))
           (btor2006
            (bv->signal
             (zero-extend (signal-value btor685) (bitvector 1))
             btor685))
           (btor2007
            (signal
             (bvand (signal-value btor669) (signal-value btor1723))
             (list)))
           (btor2008
            (bv->signal
             (zero-extend (signal-value btor2007) (bitvector 1))
             btor2007))
           (btor2009
            (bv->signal
             (zero-extend (signal-value btor685) (bitvector 1))
             btor685))
           (btor2010
            (bv->signal
             (zero-extend (signal-value btor684) (bitvector 1))
             btor684))
           (btor2011
            (bv->signal
             (zero-extend (signal-value btor677) (bitvector 1))
             btor677))
           (btor2012
            (signal
             (bvand (signal-value btor346) (signal-value btor347))
             (list)))
           (btor2013 (signal (bvnot (signal-value btor2012)) (list)))
           (btor2014
            (bv->signal
             (zero-extend (signal-value btor1378) (bitvector 5))
             btor1378))
           (btor2015
            (signal
             (bool->bitvector
              (bveq (signal-value btor246) (signal-value btor2014)))
             (list)))
           (btor2016
            (if (bitvector->bool (signal-value btor2015)) btor598 btor2013))
           (btor2017
            (bv->signal
             (zero-extend (signal-value btor2016) (bitvector 1))
             btor2016))
           (btor2018
            (bv->signal
             (zero-extend (signal-value btor701) (bitvector 1))
             btor701))
           (btor2019
            (bv->signal
             (zero-extend (signal-value btor701) (bitvector 1))
             btor701))
           (btor2020 (bv->signal (bv 0 (bitvector 54))))
           (btor2021
            (signal
             (extract 53 0 (signal-value btor1080))
             (signal-state btor1080)))
           (btor2022
            (signal
             (extract 53 0 (signal-value btor1326))
             (signal-state btor1326)))
           (btor2023
            (signal
             (bvsub (signal-value btor2021) (signal-value btor2022))
             (list)))
           (btor2024
            (signal
             (extract 53 0 (signal-value btor1508))
             (signal-state btor1508)))
           (btor2025
            (signal
             (bvsub (signal-value btor2023) (signal-value btor2024))
             (list)))
           (btor2026
            (if (bitvector->bool (signal-value btor1696)) btor2025 btor2020))
           (btor2027
            (signal
             (bvadd (signal-value btor2021) (signal-value btor2022))
             (list)))
           (btor2028
            (signal
             (bvsub (signal-value btor2027) (signal-value btor2024))
             (list)))
           (btor2029
            (if (bitvector->bool (signal-value btor1701)) btor2028 btor2026))
           (btor2030
            (signal
             (bvadd (signal-value btor2023) (signal-value btor2024))
             (list)))
           (btor2031
            (if (bitvector->bool (signal-value btor1705)) btor2030 btor2029))
           (btor2032
            (signal
             (bvadd (signal-value btor2027) (signal-value btor2024))
             (list)))
           (btor2033
            (if (bitvector->bool (signal-value btor1709)) btor2032 btor2031))
           (btor2034
            (signal
             (extract 53 53 (signal-value btor2033))
             (signal-state btor2033)))
           (btor2035
            (if (bitvector->bool (signal-value btor2016)) btor2034 btor1723))
           (btor2036
            (bv->signal
             (zero-extend (signal-value btor2035) (bitvector 1))
             btor2035))
           (btor2037
            (bv->signal
             (zero-extend (signal-value btor701) (bitvector 1))
             btor701))
           (btor2038
            (bv->signal
             (zero-extend (signal-value btor700) (bitvector 1))
             btor700))
           (btor2039
            (bv->signal
             (zero-extend (signal-value btor693) (bitvector 1))
             btor693))
           (btor2040
            (bv->signal
             (zero-extend (signal-value btor1714) (bitvector 55))
             btor1714))
           (btor2041
            (bv->signal
             (zero-extend (signal-value btor2033) (bitvector 54))
             btor2033))
           (btor2042
            (bv->signal
             (zero-extend (signal-value btor709) (bitvector 18))
             btor709))
           (btor2043
            (bv->signal
             (zero-extend (signal-value btor709) (bitvector 18))
             btor709))
           (btor2044
            (bv->signal
             (zero-extend (signal-value btor709) (bitvector 18))
             btor709))
           (btor2045
            (bv->signal
             (zero-extend (signal-value btor744) (bitvector 37))
             btor744))
           (btor2046
            (bv->signal
             (zero-extend (signal-value btor744) (bitvector 37))
             btor744))
           (btor2047
            (bv->signal
             (zero-extend (signal-value btor744) (bitvector 37))
             btor744))
           (btor2048
            (bv->signal
             (zero-extend (signal-value btor743) (bitvector 37))
             btor743))
           (btor2049
            (bv->signal
             (zero-extend (signal-value btor736) (bitvector 37))
             btor736))
           (btor2050
            (bv->signal
             (zero-extend (signal-value btor1077) (bitvector 55))
             btor1077))
           (btor2051
            (bv->signal
             (zero-extend (signal-value btor1365) (bitvector 54))
             btor1365))
           (btor2052
            (bv->signal
             (zero-extend (signal-value btor1367) (bitvector 54))
             btor1367))
           (btor2053
            (bv->signal
             (zero-extend (signal-value btor346) (bitvector 1))
             btor346))
           (btor2054
            (bv->signal
             (zero-extend (signal-value btor347) (bitvector 1))
             btor347))
           (btor2055
            (bv->signal
             (zero-extend (signal-value btor2013) (bitvector 1))
             btor2013))
           (btor2056
            (bv->signal
             (zero-extend (signal-value btor345) (bitvector 1))
             btor345))
           (btor2057
            (bv->signal
             (zero-extend (signal-value btor833) (bitvector 1))
             btor833))
           (btor2058
            (bv->signal
             (zero-extend (signal-value btor849) (bitvector 1))
             btor849))
           (btor2059
            (bv->signal
             (zero-extend (signal-value btor849) (bitvector 1))
             btor849))
           (btor2060
            (signal
             (bvand (signal-value btor605) (signal-value btor1723))
             (list)))
           (btor2061
            (bv->signal
             (zero-extend (signal-value btor2060) (bitvector 1))
             btor2060))
           (btor2062
            (bv->signal
             (zero-extend (signal-value btor849) (bitvector 1))
             btor849))
           (btor2063
            (bv->signal
             (zero-extend (signal-value btor848) (bitvector 1))
             btor848))
           (btor2064
            (bv->signal
             (zero-extend (signal-value btor841) (bitvector 1))
             btor841))
           (btor2066
            (if (bitvector->bool (signal-value btor1584)) btor477 btor375))
           (btor2067
            (if (bitvector->bool (signal-value btor1600)) btor2020 btor2066))
           (btor2071
            (signal
             (bvxor (signal-value btor604) (signal-value btor1721))
             (list)))
           (btor2072
            (if (bitvector->bool (signal-value btor128)) btor2071 btor595))
           (btor2073
            (if (bitvector->bool (signal-value btor341)) btor598 btor2072))
           (btor2077
            (signal
             (bvxor (signal-value btor595) (signal-value btor1721))
             (list)))
           (btor2078
            (if (bitvector->bool (signal-value btor128)) btor2077 btor604))
           (btor2079
            (if (bitvector->bool (signal-value btor341)) btor598 btor2078))
           (btor2083
            (signal
             (bvxor (signal-value btor620) (signal-value btor1744))
             (list)))
           (btor2084
            (if (bitvector->bool (signal-value btor128)) btor2083 btor613))
           (btor2085
            (if (bitvector->bool (signal-value btor341)) btor598 btor2084))
           (btor2089
            (signal
             (bvxor (signal-value btor613) (signal-value btor1744))
             (list)))
           (btor2090
            (if (bitvector->bool (signal-value btor128)) btor2089 btor620))
           (btor2091
            (if (bitvector->bool (signal-value btor341)) btor598 btor2090))
           (btor2095
            (signal
             (bvxor (signal-value btor636) (signal-value btor1752))
             (list)))
           (btor2096
            (if (bitvector->bool (signal-value btor128)) btor2095 btor629))
           (btor2097
            (if (bitvector->bool (signal-value btor341)) btor598 btor2096))
           (btor2101
            (signal
             (bvxor (signal-value btor629) (signal-value btor1752))
             (list)))
           (btor2102
            (if (bitvector->bool (signal-value btor128)) btor2101 btor636))
           (btor2103
            (if (bitvector->bool (signal-value btor341)) btor598 btor2102))
           (btor2107
            (signal
             (bvxor (signal-value btor652) (signal-value btor1760))
             (list)))
           (btor2108
            (if (bitvector->bool (signal-value btor128)) btor2107 btor645))
           (btor2109
            (if (bitvector->bool (signal-value btor341)) btor598 btor2108))
           (btor2113
            (signal
             (bvxor (signal-value btor645) (signal-value btor1760))
             (list)))
           (btor2114
            (if (bitvector->bool (signal-value btor128)) btor2113 btor652))
           (btor2115
            (if (bitvector->bool (signal-value btor341)) btor598 btor2114))
           (btor2119
            (signal
             (bvxor (signal-value btor668) (signal-value btor1719))
             (list)))
           (btor2120
            (if (bitvector->bool (signal-value btor128)) btor2119 btor661))
           (btor2121
            (if (bitvector->bool (signal-value btor341)) btor598 btor2120))
           (btor2125
            (signal
             (bvxor (signal-value btor661) (signal-value btor1719))
             (list)))
           (btor2126
            (if (bitvector->bool (signal-value btor128)) btor2125 btor668))
           (btor2127
            (if (bitvector->bool (signal-value btor341)) btor598 btor2126))
           (btor2131
            (signal
             (bvxor (signal-value btor684) (signal-value btor2007))
             (list)))
           (btor2132
            (if (bitvector->bool (signal-value btor128)) btor2131 btor677))
           (btor2133
            (if (bitvector->bool (signal-value btor341)) btor598 btor2132))
           (btor2137
            (signal
             (bvxor (signal-value btor677) (signal-value btor2007))
             (list)))
           (btor2138
            (if (bitvector->bool (signal-value btor128)) btor2137 btor684))
           (btor2139
            (if (bitvector->bool (signal-value btor341)) btor598 btor2138))
           (btor2143
            (signal
             (bvxor (signal-value btor700) (signal-value btor2035))
             (list)))
           (btor2144
            (if (bitvector->bool (signal-value btor128)) btor2143 btor693))
           (btor2145
            (if (bitvector->bool (signal-value btor341)) btor598 btor2144))
           (btor2149
            (signal
             (bvxor (signal-value btor693) (signal-value btor2035))
             (list)))
           (btor2150
            (if (bitvector->bool (signal-value btor128)) btor2149 btor700))
           (btor2151
            (if (bitvector->bool (signal-value btor341)) btor598 btor2150))
           (btor2155
            (signal
             (extract 17 0 (signal-value btor1714))
             (signal-state btor1714)))
           (btor2156
            (if (bitvector->bool (signal-value btor128)) btor2155 btor709))
           (btor2157
            (if (bitvector->bool (signal-value btor341)) btor1286 btor2156))
           (btor2161
            (signal
             (extract 54 18 (signal-value btor1714))
             (signal-state btor1714)))
           (btor2162
            (signal
             (bvxor (signal-value btor743) (signal-value btor2161))
             (list)))
           (btor2163
            (if (bitvector->bool (signal-value btor128)) btor2162 btor736))
           (btor2164 (bv->signal (bv 0 (bitvector 37))))
           (btor2165
            (if (bitvector->bool (signal-value btor341)) btor2164 btor2163))
           (btor2169
            (signal
             (bvxor (signal-value btor736) (signal-value btor2161))
             (list)))
           (btor2170
            (if (bitvector->bool (signal-value btor128)) btor2169 btor743))
           (btor2171
            (if (bitvector->bool (signal-value btor341)) btor2164 btor2170))
           (btor2175
            (signal
             (bvxor (signal-value btor848) (signal-value btor2060))
             (list)))
           (btor2176
            (if (bitvector->bool (signal-value btor128)) btor2175 btor841))
           (btor2177
            (if (bitvector->bool (signal-value btor341)) btor598 btor2176))
           (btor2181
            (signal
             (bvxor (signal-value btor841) (signal-value btor2060))
             (list)))
           (btor2182
            (if (bitvector->bool (signal-value btor128)) btor2181 btor848))
           (btor2183
            (if (bitvector->bool (signal-value btor341)) btor598 btor2182))
           (btor2187
            (signal
             (bvxor (signal-value btor887) (signal-value btor1988))
             (list)))
           (btor2188
            (if (bitvector->bool (signal-value btor128)) btor2187 btor880))
           (btor2189
            (if (bitvector->bool (signal-value btor341)) btor998 btor2188))
           (btor2193
            (signal
             (bvxor (signal-value btor880) (signal-value btor1988))
             (list)))
           (btor2194
            (if (bitvector->bool (signal-value btor128)) btor2193 btor887))
           (btor2195
            (if (bitvector->bool (signal-value btor341)) btor998 btor2194))
           (btor2199
            (signal
             (concat (signal-value btor75) (signal-value btor74))
             (list)))
           (btor2200
            (signal
             (concat (signal-value btor86) (signal-value btor2199))
             (list)))
           (btor2201
            (signal
             (concat (signal-value btor97) (signal-value btor2200))
             (list)))
           (btor2202
            (signal
             (concat (signal-value btor108) (signal-value btor2201))
             (list)))
           (btor2203
            (signal
             (concat (signal-value btor119) (signal-value btor2202))
             (list)))
           (btor2204
            (signal
             (concat (signal-value btor124) (signal-value btor2203))
             (list)))
           (btor2205
            (signal
             (concat (signal-value btor125) (signal-value btor2204))
             (list)))
           (btor2206
            (signal
             (concat (signal-value btor126) (signal-value btor2205))
             (list)))
           (btor2207
            (signal
             (concat (signal-value btor127) (signal-value btor2206))
             (list)))
           (btor2208
            (signal
             (concat (signal-value btor76) (signal-value btor2207))
             (list)))
           (btor2209
            (signal
             (concat (signal-value btor77) (signal-value btor2208))
             (list)))
           (btor2210
            (signal
             (concat (signal-value btor78) (signal-value btor2209))
             (list)))
           (btor2211
            (signal
             (concat (signal-value btor79) (signal-value btor2210))
             (list)))
           (btor2212
            (signal
             (concat (signal-value btor80) (signal-value btor2211))
             (list)))
           (btor2213
            (signal
             (concat (signal-value btor81) (signal-value btor2212))
             (list)))
           (btor2214
            (signal
             (concat (signal-value btor82) (signal-value btor2213))
             (list)))
           (btor2215
            (signal
             (concat (signal-value btor83) (signal-value btor2214))
             (list)))
           (btor2216
            (signal
             (concat (signal-value btor84) (signal-value btor2215))
             (list)))
           (btor2217
            (signal
             (concat (signal-value btor85) (signal-value btor2216))
             (list)))
           (btor2218
            (signal
             (concat (signal-value btor87) (signal-value btor2217))
             (list)))
           (btor2219
            (signal
             (concat (signal-value btor88) (signal-value btor2218))
             (list)))
           (btor2220
            (signal
             (concat (signal-value btor89) (signal-value btor2219))
             (list)))
           (btor2221
            (signal
             (concat (signal-value btor90) (signal-value btor2220))
             (list)))
           (btor2222
            (signal
             (concat (signal-value btor91) (signal-value btor2221))
             (list)))
           (btor2223
            (signal
             (concat (signal-value btor92) (signal-value btor2222))
             (list)))
           (btor2224
            (signal
             (concat (signal-value btor93) (signal-value btor2223))
             (list)))
           (btor2225
            (if (bitvector->bool (signal-value btor128)) btor2224 btor899))
           (btor2226 (bv->signal (bv 0 (bitvector 27))))
           (btor2227
            (if (bitvector->bool (signal-value btor341)) btor2226 btor2225))
           (btor2231
            (signal
             (bvxor (signal-value btor1020) (signal-value btor1935))
             (list)))
           (btor2232
            (if (bitvector->bool (signal-value btor128)) btor2231 btor1013))
           (btor2233
            (if (bitvector->bool (signal-value btor341)) btor598 btor2232))
           (btor2237
            (signal
             (bvxor (signal-value btor1013) (signal-value btor1935))
             (list)))
           (btor2238
            (if (bitvector->bool (signal-value btor128)) btor2237 btor1020))
           (btor2239
            (if (bitvector->bool (signal-value btor341)) btor598 btor2238))
           (btor2243
            (signal
             (concat (signal-value btor95) (signal-value btor94))
             (list)))
           (btor2244
            (signal
             (concat (signal-value btor96) (signal-value btor2243))
             (list)))
           (btor2245
            (signal
             (concat (signal-value btor98) (signal-value btor2244))
             (list)))
           (btor2246
            (signal
             (concat (signal-value btor99) (signal-value btor2245))
             (list)))
           (btor2247
            (signal
             (concat (signal-value btor100) (signal-value btor2246))
             (list)))
           (btor2248
            (signal
             (concat (signal-value btor101) (signal-value btor2247))
             (list)))
           (btor2249
            (signal
             (concat (signal-value btor102) (signal-value btor2248))
             (list)))
           (btor2250
            (signal
             (concat (signal-value btor103) (signal-value btor2249))
             (list)))
           (btor2251
            (signal
             (concat (signal-value btor104) (signal-value btor2250))
             (list)))
           (btor2252
            (signal
             (concat (signal-value btor105) (signal-value btor2251))
             (list)))
           (btor2253
            (signal
             (concat (signal-value btor106) (signal-value btor2252))
             (list)))
           (btor2254
            (signal
             (concat (signal-value btor107) (signal-value btor2253))
             (list)))
           (btor2255
            (signal
             (concat (signal-value btor109) (signal-value btor2254))
             (list)))
           (btor2256
            (signal
             (concat (signal-value btor110) (signal-value btor2255))
             (list)))
           (btor2257
            (signal
             (concat (signal-value btor111) (signal-value btor2256))
             (list)))
           (btor2258
            (signal
             (concat (signal-value btor112) (signal-value btor2257))
             (list)))
           (btor2259
            (signal
             (concat (signal-value btor113) (signal-value btor2258))
             (list)))
           (btor2260
            (signal
             (concat (signal-value btor114) (signal-value btor2259))
             (list)))
           (btor2261
            (signal
             (concat (signal-value btor115) (signal-value btor2260))
             (list)))
           (btor2262
            (signal
             (concat (signal-value btor116) (signal-value btor2261))
             (list)))
           (btor2263
            (signal
             (concat (signal-value btor117) (signal-value btor2262))
             (list)))
           (btor2264
            (signal
             (concat (signal-value btor118) (signal-value btor2263))
             (list)))
           (btor2265
            (signal
             (concat (signal-value btor120) (signal-value btor2264))
             (list)))
           (btor2266
            (signal
             (concat (signal-value btor121) (signal-value btor2265))
             (list)))
           (btor2267
            (signal
             (concat (signal-value btor122) (signal-value btor2266))
             (list)))
           (btor2268
            (signal
             (concat (signal-value btor123) (signal-value btor2267))
             (list)))
           (btor2269
            (if (bitvector->bool (signal-value btor128)) btor2268 btor1128))
           (btor2270
            (if (bitvector->bool (signal-value btor341)) btor2226 btor2269))
           (btor2274
            (signal
             (bvxor (signal-value btor1675) (signal-value btor1910))
             (list)))
           (btor2275
            (if (bitvector->bool (signal-value btor128)) btor2274 btor1668))
           (btor2276 (bv->signal (bv 0 (bitvector 3))))
           (btor2277
            (if (bitvector->bool (signal-value btor341)) btor2276 btor2275))
           (btor2281
            (signal
             (bvxor (signal-value btor1668) (signal-value btor1910))
             (list)))
           (btor2282
            (if (bitvector->bool (signal-value btor128)) btor2281 btor1675))
           (btor2283
            (if (bitvector->bool (signal-value btor341)) btor2276 btor2282))
           (btor2287
            (signal
             (concat (signal-value btor336) (signal-value btor335))
             (list)))
           (btor2288
            (signal
             (concat (signal-value btor328) (signal-value btor2287))
             (list)))
           (btor2289
            (signal
             (bvxor (signal-value btor1909) (signal-value btor2288))
             (list)))
           (btor2290
            (if (bitvector->bool (signal-value btor128)) btor2289 btor1902))
           (btor2291
            (if (bitvector->bool (signal-value btor341)) btor2276 btor2290))
           (btor2295
            (signal
             (bvxor (signal-value btor1902) (signal-value btor2288))
             (list)))
           (btor2296
            (if (bitvector->bool (signal-value btor128)) btor2295 btor1909))
           (btor2297
            (if (bitvector->bool (signal-value btor341)) btor2276 btor2296))
           (btor2301
            (signal
             (bvxor (signal-value btor1934) (signal-value btor334))
             (list)))
           (btor2302
            (if (bitvector->bool (signal-value btor128)) btor2301 btor1927))
           (btor2303
            (if (bitvector->bool (signal-value btor341)) btor598 btor2302))
           (btor2307
            (signal
             (bvxor (signal-value btor1927) (signal-value btor334))
             (list)))
           (btor2308
            (if (bitvector->bool (signal-value btor128)) btor2307 btor1934))
           (btor2309
            (if (bitvector->bool (signal-value btor341)) btor598 btor2308))
           (btor2313
            (signal
             (concat (signal-value btor327) (signal-value btor326))
             (list)))
           (btor2314
            (signal
             (concat (signal-value btor329) (signal-value btor2313))
             (list)))
           (btor2315
            (signal
             (concat (signal-value btor330) (signal-value btor2314))
             (list)))
           (btor2316
            (signal
             (concat (signal-value btor331) (signal-value btor2315))
             (list)))
           (btor2317
            (signal
             (concat (signal-value btor332) (signal-value btor2316))
             (list)))
           (btor2318
            (signal
             (concat (signal-value btor333) (signal-value btor2317))
             (list)))
           (btor2319
            (signal
             (bvxor (signal-value btor1987) (signal-value btor2318))
             (list)))
           (btor2320
            (if (bitvector->bool (signal-value btor128)) btor2319 btor1980))
           (btor2321
            (if (bitvector->bool (signal-value btor341)) btor998 btor2320))
           (btor2325
            (signal
             (bvxor (signal-value btor1980) (signal-value btor2318))
             (list)))
           (btor2326
            (if (bitvector->bool (signal-value btor128)) btor2325 btor1987))
           (btor2327
            (if (bitvector->bool (signal-value btor341)) btor998 btor2326))
           (output-state
            (remove-duplicates
             (append
              (append
               (list
                (cons
                 (string->symbol (string-append name "state1983"))
                 (signal-value btor240)))
               (append
                (list
                 (cons
                  (string->symbol (string-append name "state1982"))
                  (signal-value btor2327)))
                (append
                 (list
                  (cons
                   (string->symbol (string-append name "state1981"))
                   (signal-value btor1987)))
                 (append
                  (list
                   (cons
                    (string->symbol (string-append name "state1976"))
                    (signal-value btor240)))
                  (append
                   (list
                    (cons
                     (string->symbol (string-append name "state1975"))
                     (signal-value btor2321)))
                   (append
                    (list
                     (cons
                      (string->symbol (string-append name "state1974"))
                      (signal-value btor1980)))
                    (append
                     (list
                      (cons
                       (string->symbol (string-append name "state1930"))
                       (signal-value btor240)))
                     (append
                      (list
                       (cons
                        (string->symbol (string-append name "state1929"))
                        (signal-value btor2309)))
                      (append
                       (list
                        (cons
                         (string->symbol (string-append name "state1928"))
                         (signal-value btor1934)))
                       (append
                        (list
                         (cons
                          (string->symbol (string-append name "state1923"))
                          (signal-value btor240)))
                        (append
                         (list
                          (cons
                           (string->symbol (string-append name "state1922"))
                           (signal-value btor2303)))
                         (append
                          (list
                           (cons
                            (string->symbol (string-append name "state1921"))
                            (signal-value btor1927)))
                          (append
                           (list
                            (cons
                             (string->symbol (string-append name "state1905"))
                             (signal-value btor240)))
                           (append
                            (list
                             (cons
                              (string->symbol (string-append name "state1904"))
                              (signal-value btor2297)))
                            (append
                             (list
                              (cons
                               (string->symbol
                                (string-append name "state1903"))
                               (signal-value btor1909)))
                             (append
                              (list
                               (cons
                                (string->symbol
                                 (string-append name "state1898"))
                                (signal-value btor240)))
                              (append
                               (list
                                (cons
                                 (string->symbol
                                  (string-append name "state1897"))
                                 (signal-value btor2291)))
                               (append
                                (list
                                 (cons
                                  (string->symbol
                                   (string-append name "state1896"))
                                  (signal-value btor1902)))
                                (append
                                 (list
                                  (cons
                                   (string->symbol
                                    (string-append name "state1671"))
                                   (signal-value btor240)))
                                 (append
                                  (list
                                   (cons
                                    (string->symbol
                                     (string-append name "state1670"))
                                    (signal-value btor2283)))
                                  (append
                                   (list
                                    (cons
                                     (string->symbol
                                      (string-append name "state1669"))
                                     (signal-value btor1675)))
                                   (append
                                    (list
                                     (cons
                                      (string->symbol
                                       (string-append name "state1664"))
                                      (signal-value btor240)))
                                    (append
                                     (list
                                      (cons
                                       (string->symbol
                                        (string-append name "state1663"))
                                       (signal-value btor2277)))
                                     (append
                                      (list
                                       (cons
                                        (string->symbol
                                         (string-append name "state1662"))
                                        (signal-value btor1668)))
                                      (append
                                       (list
                                        (cons
                                         (string->symbol
                                          (string-append name "state1124"))
                                         (signal-value btor240)))
                                       (append
                                        (list
                                         (cons
                                          (string->symbol
                                           (string-append name "state1123"))
                                          (signal-value btor2270)))
                                        (append
                                         (list
                                          (cons
                                           (string->symbol
                                            (string-append name "state1122"))
                                           (signal-value btor1128)))
                                         (append
                                          (list
                                           (cons
                                            (string->symbol
                                             (string-append name "state1016"))
                                            (signal-value btor240)))
                                          (append
                                           (list
                                            (cons
                                             (string->symbol
                                              (string-append name "state1015"))
                                             (signal-value btor2239)))
                                           (append
                                            (list
                                             (cons
                                              (string->symbol
                                               (string-append
                                                name
                                                "state1014"))
                                              (signal-value btor1020)))
                                            (append
                                             (list
                                              (cons
                                               (string->symbol
                                                (string-append
                                                 name
                                                 "state1009"))
                                               (signal-value btor240)))
                                             (append
                                              (list
                                               (cons
                                                (string->symbol
                                                 (string-append
                                                  name
                                                  "state1008"))
                                                (signal-value btor2233)))
                                              (append
                                               (list
                                                (cons
                                                 (string->symbol
                                                  (string-append
                                                   name
                                                   "state1007"))
                                                 (signal-value btor1013)))
                                               (append
                                                (list
                                                 (cons
                                                  (string->symbol
                                                   (string-append
                                                    name
                                                    "state895"))
                                                  (signal-value btor240)))
                                                (append
                                                 (list
                                                  (cons
                                                   (string->symbol
                                                    (string-append
                                                     name
                                                     "state894"))
                                                   (signal-value btor2227)))
                                                 (append
                                                  (list
                                                   (cons
                                                    (string->symbol
                                                     (string-append
                                                      name
                                                      "state893"))
                                                    (signal-value btor899)))
                                                  (append
                                                   (list
                                                    (cons
                                                     (string->symbol
                                                      (string-append
                                                       name
                                                       "state883"))
                                                     (signal-value btor240)))
                                                   (append
                                                    (list
                                                     (cons
                                                      (string->symbol
                                                       (string-append
                                                        name
                                                        "state882"))
                                                      (signal-value btor2195)))
                                                    (append
                                                     (list
                                                      (cons
                                                       (string->symbol
                                                        (string-append
                                                         name
                                                         "state881"))
                                                       (signal-value btor887)))
                                                     (append
                                                      (list
                                                       (cons
                                                        (string->symbol
                                                         (string-append
                                                          name
                                                          "state876"))
                                                        (signal-value
                                                         btor240)))
                                                      (append
                                                       (list
                                                        (cons
                                                         (string->symbol
                                                          (string-append
                                                           name
                                                           "state875"))
                                                         (signal-value
                                                          btor2189)))
                                                       (append
                                                        (list
                                                         (cons
                                                          (string->symbol
                                                           (string-append
                                                            name
                                                            "state874"))
                                                          (signal-value
                                                           btor880)))
                                                        (append
                                                         (list
                                                          (cons
                                                           (string->symbol
                                                            (string-append
                                                             name
                                                             "state844"))
                                                           (signal-value
                                                            btor240)))
                                                         (append
                                                          (list
                                                           (cons
                                                            (string->symbol
                                                             (string-append
                                                              name
                                                              "state843"))
                                                            (signal-value
                                                             btor2183)))
                                                          (append
                                                           (list
                                                            (cons
                                                             (string->symbol
                                                              (string-append
                                                               name
                                                               "state842"))
                                                             (signal-value
                                                              btor848)))
                                                           (append
                                                            (list
                                                             (cons
                                                              (string->symbol
                                                               (string-append
                                                                name
                                                                "state837"))
                                                              (signal-value
                                                               btor240)))
                                                            (append
                                                             (list
                                                              (cons
                                                               (string->symbol
                                                                (string-append
                                                                 name
                                                                 "state836"))
                                                               (signal-value
                                                                btor2177)))
                                                             (append
                                                              (list
                                                               (cons
                                                                (string->symbol
                                                                 (string-append
                                                                  name
                                                                  "state835"))
                                                                (signal-value
                                                                 btor841)))
                                                              (append
                                                               (list
                                                                (cons
                                                                 (string->symbol
                                                                  (string-append
                                                                   name
                                                                   "state739"))
                                                                 (signal-value
                                                                  btor240)))
                                                               (append
                                                                (list
                                                                 (cons
                                                                  (string->symbol
                                                                   (string-append
                                                                    name
                                                                    "state738"))
                                                                  (signal-value
                                                                   btor2171)))
                                                                (append
                                                                 (list
                                                                  (cons
                                                                   (string->symbol
                                                                    (string-append
                                                                     name
                                                                     "state737"))
                                                                   (signal-value
                                                                    btor743)))
                                                                 (append
                                                                  (list
                                                                   (cons
                                                                    (string->symbol
                                                                     (string-append
                                                                      name
                                                                      "state732"))
                                                                    (signal-value
                                                                     btor240)))
                                                                  (append
                                                                   (list
                                                                    (cons
                                                                     (string->symbol
                                                                      (string-append
                                                                       name
                                                                       "state731"))
                                                                     (signal-value
                                                                      btor2165)))
                                                                   (append
                                                                    (list
                                                                     (cons
                                                                      (string->symbol
                                                                       (string-append
                                                                        name
                                                                        "state730"))
                                                                      (signal-value
                                                                       btor736)))
                                                                    (append
                                                                     (list
                                                                      (cons
                                                                       (string->symbol
                                                                        (string-append
                                                                         name
                                                                         "state705"))
                                                                       (signal-value
                                                                        btor240)))
                                                                     (append
                                                                      (list
                                                                       (cons
                                                                        (string->symbol
                                                                         (string-append
                                                                          name
                                                                          "state704"))
                                                                        (signal-value
                                                                         btor2157)))
                                                                      (append
                                                                       (list
                                                                        (cons
                                                                         (string->symbol
                                                                          (string-append
                                                                           name
                                                                           "state703"))
                                                                         (signal-value
                                                                          btor709)))
                                                                       (append
                                                                        (list
                                                                         (cons
                                                                          (string->symbol
                                                                           (string-append
                                                                            name
                                                                            "state696"))
                                                                          (signal-value
                                                                           btor240)))
                                                                        (append
                                                                         (list
                                                                          (cons
                                                                           (string->symbol
                                                                            (string-append
                                                                             name
                                                                             "state695"))
                                                                           (signal-value
                                                                            btor2151)))
                                                                         (append
                                                                          (list
                                                                           (cons
                                                                            (string->symbol
                                                                             (string-append
                                                                              name
                                                                              "state694"))
                                                                            (signal-value
                                                                             btor700)))
                                                                          (append
                                                                           (list
                                                                            (cons
                                                                             (string->symbol
                                                                              (string-append
                                                                               name
                                                                               "state689"))
                                                                             (signal-value
                                                                              btor240)))
                                                                           (append
                                                                            (list
                                                                             (cons
                                                                              (string->symbol
                                                                               (string-append
                                                                                name
                                                                                "state688"))
                                                                              (signal-value
                                                                               btor2145)))
                                                                            (append
                                                                             (list
                                                                              (cons
                                                                               (string->symbol
                                                                                (string-append
                                                                                 name
                                                                                 "state687"))
                                                                               (signal-value
                                                                                btor693)))
                                                                             (append
                                                                              (list
                                                                               (cons
                                                                                (string->symbol
                                                                                 (string-append
                                                                                  name
                                                                                  "state680"))
                                                                                (signal-value
                                                                                 btor240)))
                                                                              (append
                                                                               (list
                                                                                (cons
                                                                                 (string->symbol
                                                                                  (string-append
                                                                                   name
                                                                                   "state679"))
                                                                                 (signal-value
                                                                                  btor2139)))
                                                                               (append
                                                                                (list
                                                                                 (cons
                                                                                  (string->symbol
                                                                                   (string-append
                                                                                    name
                                                                                    "state678"))
                                                                                  (signal-value
                                                                                   btor684)))
                                                                                (append
                                                                                 (list
                                                                                  (cons
                                                                                   (string->symbol
                                                                                    (string-append
                                                                                     name
                                                                                     "state673"))
                                                                                   (signal-value
                                                                                    btor240)))
                                                                                 (append
                                                                                  (list
                                                                                   (cons
                                                                                    (string->symbol
                                                                                     (string-append
                                                                                      name
                                                                                      "state672"))
                                                                                    (signal-value
                                                                                     btor2133)))
                                                                                  (append
                                                                                   (list
                                                                                    (cons
                                                                                     (string->symbol
                                                                                      (string-append
                                                                                       name
                                                                                       "state671"))
                                                                                     (signal-value
                                                                                      btor677)))
                                                                                   (append
                                                                                    (list
                                                                                     (cons
                                                                                      (string->symbol
                                                                                       (string-append
                                                                                        name
                                                                                        "state664"))
                                                                                      (signal-value
                                                                                       btor240)))
                                                                                    (append
                                                                                     (list
                                                                                      (cons
                                                                                       (string->symbol
                                                                                        (string-append
                                                                                         name
                                                                                         "state663"))
                                                                                       (signal-value
                                                                                        btor2127)))
                                                                                     (append
                                                                                      (list
                                                                                       (cons
                                                                                        (string->symbol
                                                                                         (string-append
                                                                                          name
                                                                                          "state662"))
                                                                                        (signal-value
                                                                                         btor668)))
                                                                                      (append
                                                                                       (list
                                                                                        (cons
                                                                                         (string->symbol
                                                                                          (string-append
                                                                                           name
                                                                                           "state657"))
                                                                                         (signal-value
                                                                                          btor240)))
                                                                                       (append
                                                                                        (list
                                                                                         (cons
                                                                                          (string->symbol
                                                                                           (string-append
                                                                                            name
                                                                                            "state656"))
                                                                                          (signal-value
                                                                                           btor2121)))
                                                                                        (append
                                                                                         (list
                                                                                          (cons
                                                                                           (string->symbol
                                                                                            (string-append
                                                                                             name
                                                                                             "state655"))
                                                                                           (signal-value
                                                                                            btor661)))
                                                                                         (append
                                                                                          (list
                                                                                           (cons
                                                                                            (string->symbol
                                                                                             (string-append
                                                                                              name
                                                                                              "state648"))
                                                                                            (signal-value
                                                                                             btor240)))
                                                                                          (append
                                                                                           (list
                                                                                            (cons
                                                                                             (string->symbol
                                                                                              (string-append
                                                                                               name
                                                                                               "state647"))
                                                                                             (signal-value
                                                                                              btor2115)))
                                                                                           (append
                                                                                            (list
                                                                                             (cons
                                                                                              (string->symbol
                                                                                               (string-append
                                                                                                name
                                                                                                "state646"))
                                                                                              (signal-value
                                                                                               btor652)))
                                                                                            (append
                                                                                             (list
                                                                                              (cons
                                                                                               (string->symbol
                                                                                                (string-append
                                                                                                 name
                                                                                                 "state641"))
                                                                                               (signal-value
                                                                                                btor240)))
                                                                                             (append
                                                                                              (list
                                                                                               (cons
                                                                                                (string->symbol
                                                                                                 (string-append
                                                                                                  name
                                                                                                  "state640"))
                                                                                                (signal-value
                                                                                                 btor2109)))
                                                                                              (append
                                                                                               (list
                                                                                                (cons
                                                                                                 (string->symbol
                                                                                                  (string-append
                                                                                                   name
                                                                                                   "state639"))
                                                                                                 (signal-value
                                                                                                  btor645)))
                                                                                               (append
                                                                                                (list
                                                                                                 (cons
                                                                                                  (string->symbol
                                                                                                   (string-append
                                                                                                    name
                                                                                                    "state632"))
                                                                                                  (signal-value
                                                                                                   btor240)))
                                                                                                (append
                                                                                                 (list
                                                                                                  (cons
                                                                                                   (string->symbol
                                                                                                    (string-append
                                                                                                     name
                                                                                                     "state631"))
                                                                                                   (signal-value
                                                                                                    btor2103)))
                                                                                                 (append
                                                                                                  (list
                                                                                                   (cons
                                                                                                    (string->symbol
                                                                                                     (string-append
                                                                                                      name
                                                                                                      "state630"))
                                                                                                    (signal-value
                                                                                                     btor636)))
                                                                                                  (append
                                                                                                   (list
                                                                                                    (cons
                                                                                                     (string->symbol
                                                                                                      (string-append
                                                                                                       name
                                                                                                       "state625"))
                                                                                                     (signal-value
                                                                                                      btor240)))
                                                                                                   (append
                                                                                                    (list
                                                                                                     (cons
                                                                                                      (string->symbol
                                                                                                       (string-append
                                                                                                        name
                                                                                                        "state624"))
                                                                                                      (signal-value
                                                                                                       btor2097)))
                                                                                                    (append
                                                                                                     (list
                                                                                                      (cons
                                                                                                       (string->symbol
                                                                                                        (string-append
                                                                                                         name
                                                                                                         "state623"))
                                                                                                       (signal-value
                                                                                                        btor629)))
                                                                                                     (append
                                                                                                      (list
                                                                                                       (cons
                                                                                                        (string->symbol
                                                                                                         (string-append
                                                                                                          name
                                                                                                          "state616"))
                                                                                                        (signal-value
                                                                                                         btor240)))
                                                                                                      (append
                                                                                                       (list
                                                                                                        (cons
                                                                                                         (string->symbol
                                                                                                          (string-append
                                                                                                           name
                                                                                                           "state615"))
                                                                                                         (signal-value
                                                                                                          btor2091)))
                                                                                                       (append
                                                                                                        (list
                                                                                                         (cons
                                                                                                          (string->symbol
                                                                                                           (string-append
                                                                                                            name
                                                                                                            "state614"))
                                                                                                          (signal-value
                                                                                                           btor620)))
                                                                                                        (append
                                                                                                         (list
                                                                                                          (cons
                                                                                                           (string->symbol
                                                                                                            (string-append
                                                                                                             name
                                                                                                             "state609"))
                                                                                                           (signal-value
                                                                                                            btor240)))
                                                                                                         (append
                                                                                                          (list
                                                                                                           (cons
                                                                                                            (string->symbol
                                                                                                             (string-append
                                                                                                              name
                                                                                                              "state608"))
                                                                                                            (signal-value
                                                                                                             btor2085)))
                                                                                                          (append
                                                                                                           (list
                                                                                                            (cons
                                                                                                             (string->symbol
                                                                                                              (string-append
                                                                                                               name
                                                                                                               "state607"))
                                                                                                             (signal-value
                                                                                                              btor613)))
                                                                                                           (append
                                                                                                            (list
                                                                                                             (cons
                                                                                                              (string->symbol
                                                                                                               (string-append
                                                                                                                name
                                                                                                                "state599"))
                                                                                                              (signal-value
                                                                                                               btor240)))
                                                                                                            (append
                                                                                                             (list
                                                                                                              (cons
                                                                                                               (string->symbol
                                                                                                                (string-append
                                                                                                                 name
                                                                                                                 "state597"))
                                                                                                               (signal-value
                                                                                                                btor2079)))
                                                                                                             (append
                                                                                                              (list
                                                                                                               (cons
                                                                                                                (string->symbol
                                                                                                                 (string-append
                                                                                                                  name
                                                                                                                  "state596"))
                                                                                                                (signal-value
                                                                                                                 btor604)))
                                                                                                              (append
                                                                                                               (list
                                                                                                                (cons
                                                                                                                 (string->symbol
                                                                                                                  (string-append
                                                                                                                   name
                                                                                                                   "state591"))
                                                                                                                 (signal-value
                                                                                                                  btor240)))
                                                                                                               (append
                                                                                                                (list
                                                                                                                 (cons
                                                                                                                  (string->symbol
                                                                                                                   (string-append
                                                                                                                    name
                                                                                                                    "state590"))
                                                                                                                  (signal-value
                                                                                                                   btor2073)))
                                                                                                                (append
                                                                                                                 (list
                                                                                                                  (cons
                                                                                                                   (string->symbol
                                                                                                                    (string-append
                                                                                                                     name
                                                                                                                     "state589"))
                                                                                                                   (signal-value
                                                                                                                    btor595)))
                                                                                                                 (append
                                                                                                                  (list
                                                                                                                   (cons
                                                                                                                    (string->symbol
                                                                                                                     (string-append
                                                                                                                      name
                                                                                                                      "state352"))
                                                                                                                    (signal-value
                                                                                                                     btor370)))
                                                                                                                  (append
                                                                                                                   (list
                                                                                                                    (cons
                                                                                                                     (string->symbol
                                                                                                                      (string-append
                                                                                                                       name
                                                                                                                       "state350"))
                                                                                                                     (signal-value
                                                                                                                      btor2067)))
                                                                                                                   (append
                                                                                                                    (list
                                                                                                                     (cons
                                                                                                                      (string->symbol
                                                                                                                       (string-append
                                                                                                                        name
                                                                                                                        "state349"))
                                                                                                                      (signal-value
                                                                                                                       btor375)))
                                                                                                                    (list)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
              merged-input-state-hash)
             equal?
             #:key
             car)))
      (list
       (cons 'R28 (signal (signal-value btor767) output-state))
       (cons 'EQPATB (signal (signal-value btor637) output-state))
       (cons 'CO53 (signal (signal-value btor579) output-state))
       (cons 'CO11 (signal (signal-value btor487) output-state))
       (cons 'CO17 (signal (signal-value btor499) output-state))
       (cons 'CO9 (signal (signal-value btor587) output-state))
       (cons 'R48 (signal (signal-value btor811) output-state))
       (cons 'CO45 (signal (signal-value btor561) output-state))
       (cons 'CO30 (signal (signal-value btor529) output-state))
       (cons 'R10 (signal (signal-value btor714) output-state))
       (cons 'CO28 (signal (signal-value btor523) output-state))
       (cons 'R1 (signal (signal-value btor712) output-state))
       (cons 'R47 (signal (signal-value btor809) output-state))
       (cons 'R51 (signal (signal-value btor819) output-state))
       (cons 'R34 (signal (signal-value btor781) output-state))
       (cons 'R27 (signal (signal-value btor765) output-state))
       (cons 'R17 (signal (signal-value btor728) output-state))
       (cons 'R49 (signal (signal-value btor813) output-state))
       (cons 'CO16 (signal (signal-value btor497) output-state))
       (cons 'CO44 (signal (signal-value btor559) output-state))
       (cons 'EQZM (signal (signal-value btor669) output-state))
       (cons 'R29 (signal (signal-value btor769) output-state))
       (cons 'CO52 (signal (signal-value btor577) output-state))
       (cons 'CO8 (signal (signal-value btor585) output-state))
       (cons 'R46 (signal (signal-value btor807) output-state))
       (cons 'CO10 (signal (signal-value btor485) output-state))
       (cons 'R50 (signal (signal-value btor817) output-state))
       (cons 'R26 (signal (signal-value btor763) output-state))
       (cons 'CO29 (signal (signal-value btor525) output-state))
       (cons 'R35 (signal (signal-value btor783) output-state))
       (cons 'R16 (signal (signal-value btor726) output-state))
       (cons 'CO31 (signal (signal-value btor531) output-state))
       (cons 'R11 (signal (signal-value btor716) output-state))
       (cons 'R0 (signal (signal-value btor710) output-state))
       (cons 'R3 (signal (signal-value btor771) output-state))
       (cons 'R9 (signal (signal-value btor831) output-state))
       (cons 'R36 (signal (signal-value btor785) output-state))
       (cons 'R25 (signal (signal-value btor761) output-state))
       (cons 'R12 (signal (signal-value btor718) output-state))
       (cons 'CO32 (signal (signal-value btor533) output-state))
       (cons 'R15 (signal (signal-value btor724) output-state))
       (cons 'CO13 (signal (signal-value btor491) output-state))
       (cons 'OVERUNDER (signal (signal-value btor701) output-state))
       (cons 'R45 (signal (signal-value btor805) output-state))
       (cons 'R53 (signal (signal-value btor823) output-state))
       (cons 'CO51 (signal (signal-value btor575) output-state))
       (cons 'EQPAT (signal (signal-value btor621) output-state))
       (cons 'CO15 (signal (signal-value btor495) output-state))
       (cons 'R37 (signal (signal-value btor787) output-state))
       (cons 'R13 (signal (signal-value btor720) output-state))
       (cons 'CO33 (signal (signal-value btor535) output-state))
       (cons 'R2 (signal (signal-value btor749) output-state))
       (cons 'R8 (signal (signal-value btor829) output-state))
       (cons 'CO14 (signal (signal-value btor493) output-state))
       (cons 'CO46 (signal (signal-value btor563) output-state))
       (cons 'EQOM (signal (signal-value btor605) output-state))
       (cons 'R44 (signal (signal-value btor803) output-state))
       (cons 'R14 (signal (signal-value btor722) output-state))
       (cons 'CO12 (signal (signal-value btor489) output-state))
       (cons 'R52 (signal (signal-value btor821) output-state))
       (cons 'CO50 (signal (signal-value btor573) output-state))
       (cons 'R24 (signal (signal-value btor759) output-state))
       (cons 'R42 (signal (signal-value btor799) output-state))
       (cons 'CO40 (signal (signal-value btor551) output-state))
       (cons 'CO49 (signal (signal-value btor569) output-state))
       (cons 'R33 (signal (signal-value btor779) output-state))
       (cons 'R22 (signal (signal-value btor755) output-state))
       (cons 'CO3 (signal (signal-value btor527) output-state))
       (cons 'R39 (signal (signal-value btor791) output-state))
       (cons 'CO35 (signal (signal-value btor539) output-state))
       (cons 'CO4 (signal (signal-value btor549) output-state))
       (cons 'R4 (signal (signal-value btor793) output-state))
       (cons 'UNDER (signal (signal-value btor849) output-state))
       (cons 'CO25 (signal (signal-value btor517) output-state))
       (cons 'CO21 (signal (signal-value btor509) output-state))
       (cons 'R43 (signal (signal-value btor801) output-state))
       (cons 'R32 (signal (signal-value btor777) output-state))
       (cons 'R38 (signal (signal-value btor789) output-state))
       (cons 'R23 (signal (signal-value btor757) output-state))
       (cons 'CO2 (signal (signal-value btor505) output-state))
       (cons 'CO5 (signal (signal-value btor571) output-state))
       (cons 'CO41 (signal (signal-value btor553) output-state))
       (cons 'CO48 (signal (signal-value btor567) output-state))
       (cons 'CO34 (signal (signal-value btor537) output-state))
       (cons 'CO20 (signal (signal-value btor507) output-state))
       (cons 'CO47 (signal (signal-value btor565) output-state))
       (cons 'R5 (signal (signal-value btor815) output-state))
       (cons 'R6 (signal (signal-value btor825) output-state))
       (cons 'R18 (signal (signal-value btor745) output-state))
       (cons 'CO27 (signal (signal-value btor521) output-state))
       (cons 'CO23 (signal (signal-value btor513) output-state))
       (cons 'CO39 (signal (signal-value btor547) output-state))
       (cons 'CO24 (signal (signal-value btor515) output-state))
       (cons 'R40 (signal (signal-value btor795) output-state))
       (cons 'CO36 (signal (signal-value btor541) output-state))
       (cons 'OVER (signal (signal-value btor685) output-state))
       (cons 'R20 (signal (signal-value btor751) output-state))
       (cons 'SIGNEDR (signal (signal-value btor833) output-state))
       (cons 'CO18 (signal (signal-value btor501) output-state))
       (cons 'CO42 (signal (signal-value btor555) output-state))
       (cons 'R31 (signal (signal-value btor775) output-state))
       (cons 'CO1 (signal (signal-value btor483) output-state))
       (cons 'CO6 (signal (signal-value btor581) output-state))
       (cons 'CO38 (signal (signal-value btor545) output-state))
       (cons 'CO26 (signal (signal-value btor519) output-state))
       (cons 'CO22 (signal (signal-value btor511) output-state))
       (cons 'R7 (signal (signal-value btor827) output-state))
       (cons 'R19 (signal (signal-value btor747) output-state))
       (cons 'EQZ (signal (signal-value btor653) output-state))
       (cons 'R21 (signal (signal-value btor753) output-state))
       (cons 'CO7 (signal (signal-value btor583) output-state))
       (cons 'R30 (signal (signal-value btor773) output-state))
       (cons 'CO19 (signal (signal-value btor503) output-state))
       (cons 'CO0 (signal (signal-value btor481) output-state))
       (cons 'CO43 (signal (signal-value btor557) output-state))
       (cons 'R41 (signal (signal-value btor797) output-state))
       (cons 'CO37 (signal (signal-value btor543) output-state))))))
