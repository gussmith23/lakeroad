#lang rosette/safe
    (provide (rename-out [ALU54B lattice-ecp5-alu54b] [ALU54B_initial lattice-ecp5-alu54b-initial] [ALU54B_inputs_helper lattice-ecp5-alu54b-inputs] [ALU54B_outputs_helper lattice-ecp5-alu54b-outputs]))(struct
  ALU54B_Inputs
  (SIGNEDIB
    SIGNEDIA
    SIGNEDCIN
    RST3
    RST2
    RST1
    RST0
    RNDPAT
    REG_INPUTCFB_RST
    REG_INPUTCFB_CLK
    REG_INPUTCFB_CE
    OP9
    OP8
    OP7
    OP6
    OP5
    OP4
    OP3
    OP2
    OP10
    OP1
    OP0
    MULT9_MODE
    MCPAT_SOURCE
    MCPAT
    MB9
    MB8
    MB7
    MB6
    MB5
    MB4
    MB35
    MB34
    MB33
    MB32
    MB31
    MB30
    MB3
    MB29
    MB28
    MB27
    MB26
    MB25
    MB24
    MB23
    MB22
    MB21
    MB20
    MB2
    MB19
    MB18
    MB17
    MB16
    MB15
    MB14
    MB13
    MB12
    MB11
    MB10
    MB1
    MB0
    MASKPAT_SOURCE
    MASKPAT
    MASK01
    MA9
    MA8
    MA7
    MA6
    MA5
    MA4
    MA35
    MA34
    MA33
    MA32
    MA31
    MA30
    MA3
    MA29
    MA28
    MA27
    MA26
    MA25
    MA24
    MA23
    MA22
    MA21
    MA20
    MA2
    MA19
    MA18
    MA17
    MA16
    MA15
    MA14
    MA13
    MA12
    MA11
    MA10
    MA1
    MA0
    LEGACY
    FORCE_ZERO_BARREL_SHIFT
    CLK3
    CLK2
    CLK1
    CLK0
    CIN9
    CIN8
    CIN7
    CIN6
    CIN53
    CIN52
    CIN51
    CIN50
    CIN5
    CIN49
    CIN48
    CIN47
    CIN46
    CIN45
    CIN44
    CIN43
    CIN42
    CIN41
    CIN40
    CIN4
    CIN39
    CIN38
    CIN37
    CIN36
    CIN35
    CIN34
    CIN33
    CIN32
    CIN31
    CIN30
    CIN3
    CIN29
    CIN28
    CIN27
    CIN26
    CIN25
    CIN24
    CIN23
    CIN22
    CIN21
    CIN20
    CIN2
    CIN19
    CIN18
    CIN17
    CIN16
    CIN15
    CIN14
    CIN13
    CIN12
    CIN11
    CIN10
    CIN1
    CIN0
    CFB9
    CFB8
    CFB7
    CFB6
    CFB53
    CFB52
    CFB51
    CFB50
    CFB5
    CFB49
    CFB48
    CFB47
    CFB46
    CFB45
    CFB44
    CFB43
    CFB42
    CFB41
    CFB40
    CFB4
    CFB39
    CFB38
    CFB37
    CFB36
    CFB35
    CFB34
    CFB33
    CFB32
    CFB31
    CFB30
    CFB3
    CFB29
    CFB28
    CFB27
    CFB26
    CFB25
    CFB24
    CFB23
    CFB22
    CFB21
    CFB20
    CFB2
    CFB19
    CFB18
    CFB17
    CFB16
    CFB15
    CFB14
    CFB13
    CFB12
    CFB11
    CFB10
    CFB1
    CFB0
    CE3
    CE2
    CE1
    CE0
    C9
    C8
    C7
    C6
    C53
    C52
    C51
    C50
    C5
    C49
    C48
    C47
    C46
    C45
    C44
    C43
    C42
    C41
    C40
    C4
    C39
    C38
    C37
    C36
    C35
    C34
    C33
    C32
    C31
    C30
    C3
    C29
    C28
    C27
    C26
    C25
    C24
    C23
    C22
    C21
    C20
    C2
    C19
    C18
    C17
    C16
    C15
    C14
    C13
    C12
    C11
    C10
    C1
    C0
    B9
    B8
    B7
    B6
    B5
    B4
    B35
    B34
    B33
    B32
    B31
    B30
    B3
    B29
    B28
    B27
    B26
    B25
    B24
    B23
    B22
    B21
    B20
    B2
    B19
    B18
    B17
    B16
    B15
    B14
    B13
    B12
    B11
    B10
    B1
    B0
    A9
    A8
    A7
    A6
    A5
    A4
    A35
    A34
    A33
    A32
    A31
    A30
    A3
    A29
    A28
    A27
    A26
    A25
    A24
    A23
    A22
    A21
    A20
    A2
    A19
    A18
    A17
    A16
    A15
    A14
    A13
    A12
    A11
    A10
    A1
    A0)
  #:transparent
  ; SIGNEDIB (bitvector 1)
  ; SIGNEDIA (bitvector 1)
  ; SIGNEDCIN (bitvector 1)
  ; RST3 (bitvector 1)
  ; RST2 (bitvector 1)
  ; RST1 (bitvector 1)
  ; RST0 (bitvector 1)
  ; RNDPAT (bitvector 56)
  ; REG_INPUTCFB_RST (bitvector 5)
  ; REG_INPUTCFB_CLK (bitvector 5)
  ; REG_INPUTCFB_CE (bitvector 5)
  ; OP9 (bitvector 1)
  ; OP8 (bitvector 1)
  ; OP7 (bitvector 1)
  ; OP6 (bitvector 1)
  ; OP5 (bitvector 1)
  ; OP4 (bitvector 1)
  ; OP3 (bitvector 1)
  ; OP2 (bitvector 1)
  ; OP10 (bitvector 1)
  ; OP1 (bitvector 1)
  ; OP0 (bitvector 1)
  ; MULT9_MODE (bitvector 5)
  ; MCPAT_SOURCE (bitvector 5)
  ; MCPAT (bitvector 56)
  ; MB9 (bitvector 1)
  ; MB8 (bitvector 1)
  ; MB7 (bitvector 1)
  ; MB6 (bitvector 1)
  ; MB5 (bitvector 1)
  ; MB4 (bitvector 1)
  ; MB35 (bitvector 1)
  ; MB34 (bitvector 1)
  ; MB33 (bitvector 1)
  ; MB32 (bitvector 1)
  ; MB31 (bitvector 1)
  ; MB30 (bitvector 1)
  ; MB3 (bitvector 1)
  ; MB29 (bitvector 1)
  ; MB28 (bitvector 1)
  ; MB27 (bitvector 1)
  ; MB26 (bitvector 1)
  ; MB25 (bitvector 1)
  ; MB24 (bitvector 1)
  ; MB23 (bitvector 1)
  ; MB22 (bitvector 1)
  ; MB21 (bitvector 1)
  ; MB20 (bitvector 1)
  ; MB2 (bitvector 1)
  ; MB19 (bitvector 1)
  ; MB18 (bitvector 1)
  ; MB17 (bitvector 1)
  ; MB16 (bitvector 1)
  ; MB15 (bitvector 1)
  ; MB14 (bitvector 1)
  ; MB13 (bitvector 1)
  ; MB12 (bitvector 1)
  ; MB11 (bitvector 1)
  ; MB10 (bitvector 1)
  ; MB1 (bitvector 1)
  ; MB0 (bitvector 1)
  ; MASKPAT_SOURCE (bitvector 5)
  ; MASKPAT (bitvector 56)
  ; MASK01 (bitvector 56)
  ; MA9 (bitvector 1)
  ; MA8 (bitvector 1)
  ; MA7 (bitvector 1)
  ; MA6 (bitvector 1)
  ; MA5 (bitvector 1)
  ; MA4 (bitvector 1)
  ; MA35 (bitvector 1)
  ; MA34 (bitvector 1)
  ; MA33 (bitvector 1)
  ; MA32 (bitvector 1)
  ; MA31 (bitvector 1)
  ; MA30 (bitvector 1)
  ; MA3 (bitvector 1)
  ; MA29 (bitvector 1)
  ; MA28 (bitvector 1)
  ; MA27 (bitvector 1)
  ; MA26 (bitvector 1)
  ; MA25 (bitvector 1)
  ; MA24 (bitvector 1)
  ; MA23 (bitvector 1)
  ; MA22 (bitvector 1)
  ; MA21 (bitvector 1)
  ; MA20 (bitvector 1)
  ; MA2 (bitvector 1)
  ; MA19 (bitvector 1)
  ; MA18 (bitvector 1)
  ; MA17 (bitvector 1)
  ; MA16 (bitvector 1)
  ; MA15 (bitvector 1)
  ; MA14 (bitvector 1)
  ; MA13 (bitvector 1)
  ; MA12 (bitvector 1)
  ; MA11 (bitvector 1)
  ; MA10 (bitvector 1)
  ; MA1 (bitvector 1)
  ; MA0 (bitvector 1)
  ; LEGACY (bitvector 5)
  ; FORCE_ZERO_BARREL_SHIFT (bitvector 5)
  ; CLK3 (bitvector 1)
  ; CLK2 (bitvector 1)
  ; CLK1 (bitvector 1)
  ; CLK0 (bitvector 1)
  ; CIN9 (bitvector 1)
  ; CIN8 (bitvector 1)
  ; CIN7 (bitvector 1)
  ; CIN6 (bitvector 1)
  ; CIN53 (bitvector 1)
  ; CIN52 (bitvector 1)
  ; CIN51 (bitvector 1)
  ; CIN50 (bitvector 1)
  ; CIN5 (bitvector 1)
  ; CIN49 (bitvector 1)
  ; CIN48 (bitvector 1)
  ; CIN47 (bitvector 1)
  ; CIN46 (bitvector 1)
  ; CIN45 (bitvector 1)
  ; CIN44 (bitvector 1)
  ; CIN43 (bitvector 1)
  ; CIN42 (bitvector 1)
  ; CIN41 (bitvector 1)
  ; CIN40 (bitvector 1)
  ; CIN4 (bitvector 1)
  ; CIN39 (bitvector 1)
  ; CIN38 (bitvector 1)
  ; CIN37 (bitvector 1)
  ; CIN36 (bitvector 1)
  ; CIN35 (bitvector 1)
  ; CIN34 (bitvector 1)
  ; CIN33 (bitvector 1)
  ; CIN32 (bitvector 1)
  ; CIN31 (bitvector 1)
  ; CIN30 (bitvector 1)
  ; CIN3 (bitvector 1)
  ; CIN29 (bitvector 1)
  ; CIN28 (bitvector 1)
  ; CIN27 (bitvector 1)
  ; CIN26 (bitvector 1)
  ; CIN25 (bitvector 1)
  ; CIN24 (bitvector 1)
  ; CIN23 (bitvector 1)
  ; CIN22 (bitvector 1)
  ; CIN21 (bitvector 1)
  ; CIN20 (bitvector 1)
  ; CIN2 (bitvector 1)
  ; CIN19 (bitvector 1)
  ; CIN18 (bitvector 1)
  ; CIN17 (bitvector 1)
  ; CIN16 (bitvector 1)
  ; CIN15 (bitvector 1)
  ; CIN14 (bitvector 1)
  ; CIN13 (bitvector 1)
  ; CIN12 (bitvector 1)
  ; CIN11 (bitvector 1)
  ; CIN10 (bitvector 1)
  ; CIN1 (bitvector 1)
  ; CIN0 (bitvector 1)
  ; CFB9 (bitvector 1)
  ; CFB8 (bitvector 1)
  ; CFB7 (bitvector 1)
  ; CFB6 (bitvector 1)
  ; CFB53 (bitvector 1)
  ; CFB52 (bitvector 1)
  ; CFB51 (bitvector 1)
  ; CFB50 (bitvector 1)
  ; CFB5 (bitvector 1)
  ; CFB49 (bitvector 1)
  ; CFB48 (bitvector 1)
  ; CFB47 (bitvector 1)
  ; CFB46 (bitvector 1)
  ; CFB45 (bitvector 1)
  ; CFB44 (bitvector 1)
  ; CFB43 (bitvector 1)
  ; CFB42 (bitvector 1)
  ; CFB41 (bitvector 1)
  ; CFB40 (bitvector 1)
  ; CFB4 (bitvector 1)
  ; CFB39 (bitvector 1)
  ; CFB38 (bitvector 1)
  ; CFB37 (bitvector 1)
  ; CFB36 (bitvector 1)
  ; CFB35 (bitvector 1)
  ; CFB34 (bitvector 1)
  ; CFB33 (bitvector 1)
  ; CFB32 (bitvector 1)
  ; CFB31 (bitvector 1)
  ; CFB30 (bitvector 1)
  ; CFB3 (bitvector 1)
  ; CFB29 (bitvector 1)
  ; CFB28 (bitvector 1)
  ; CFB27 (bitvector 1)
  ; CFB26 (bitvector 1)
  ; CFB25 (bitvector 1)
  ; CFB24 (bitvector 1)
  ; CFB23 (bitvector 1)
  ; CFB22 (bitvector 1)
  ; CFB21 (bitvector 1)
  ; CFB20 (bitvector 1)
  ; CFB2 (bitvector 1)
  ; CFB19 (bitvector 1)
  ; CFB18 (bitvector 1)
  ; CFB17 (bitvector 1)
  ; CFB16 (bitvector 1)
  ; CFB15 (bitvector 1)
  ; CFB14 (bitvector 1)
  ; CFB13 (bitvector 1)
  ; CFB12 (bitvector 1)
  ; CFB11 (bitvector 1)
  ; CFB10 (bitvector 1)
  ; CFB1 (bitvector 1)
  ; CFB0 (bitvector 1)
  ; CE3 (bitvector 1)
  ; CE2 (bitvector 1)
  ; CE1 (bitvector 1)
  ; CE0 (bitvector 1)
  ; C9 (bitvector 1)
  ; C8 (bitvector 1)
  ; C7 (bitvector 1)
  ; C6 (bitvector 1)
  ; C53 (bitvector 1)
  ; C52 (bitvector 1)
  ; C51 (bitvector 1)
  ; C50 (bitvector 1)
  ; C5 (bitvector 1)
  ; C49 (bitvector 1)
  ; C48 (bitvector 1)
  ; C47 (bitvector 1)
  ; C46 (bitvector 1)
  ; C45 (bitvector 1)
  ; C44 (bitvector 1)
  ; C43 (bitvector 1)
  ; C42 (bitvector 1)
  ; C41 (bitvector 1)
  ; C40 (bitvector 1)
  ; C4 (bitvector 1)
  ; C39 (bitvector 1)
  ; C38 (bitvector 1)
  ; C37 (bitvector 1)
  ; C36 (bitvector 1)
  ; C35 (bitvector 1)
  ; C34 (bitvector 1)
  ; C33 (bitvector 1)
  ; C32 (bitvector 1)
  ; C31 (bitvector 1)
  ; C30 (bitvector 1)
  ; C3 (bitvector 1)
  ; C29 (bitvector 1)
  ; C28 (bitvector 1)
  ; C27 (bitvector 1)
  ; C26 (bitvector 1)
  ; C25 (bitvector 1)
  ; C24 (bitvector 1)
  ; C23 (bitvector 1)
  ; C22 (bitvector 1)
  ; C21 (bitvector 1)
  ; C20 (bitvector 1)
  ; C2 (bitvector 1)
  ; C19 (bitvector 1)
  ; C18 (bitvector 1)
  ; C17 (bitvector 1)
  ; C16 (bitvector 1)
  ; C15 (bitvector 1)
  ; C14 (bitvector 1)
  ; C13 (bitvector 1)
  ; C12 (bitvector 1)
  ; C11 (bitvector 1)
  ; C10 (bitvector 1)
  ; C1 (bitvector 1)
  ; C0 (bitvector 1)
  ; B9 (bitvector 1)
  ; B8 (bitvector 1)
  ; B7 (bitvector 1)
  ; B6 (bitvector 1)
  ; B5 (bitvector 1)
  ; B4 (bitvector 1)
  ; B35 (bitvector 1)
  ; B34 (bitvector 1)
  ; B33 (bitvector 1)
  ; B32 (bitvector 1)
  ; B31 (bitvector 1)
  ; B30 (bitvector 1)
  ; B3 (bitvector 1)
  ; B29 (bitvector 1)
  ; B28 (bitvector 1)
  ; B27 (bitvector 1)
  ; B26 (bitvector 1)
  ; B25 (bitvector 1)
  ; B24 (bitvector 1)
  ; B23 (bitvector 1)
  ; B22 (bitvector 1)
  ; B21 (bitvector 1)
  ; B20 (bitvector 1)
  ; B2 (bitvector 1)
  ; B19 (bitvector 1)
  ; B18 (bitvector 1)
  ; B17 (bitvector 1)
  ; B16 (bitvector 1)
  ; B15 (bitvector 1)
  ; B14 (bitvector 1)
  ; B13 (bitvector 1)
  ; B12 (bitvector 1)
  ; B11 (bitvector 1)
  ; B10 (bitvector 1)
  ; B1 (bitvector 1)
  ; B0 (bitvector 1)
  ; A9 (bitvector 1)
  ; A8 (bitvector 1)
  ; A7 (bitvector 1)
  ; A6 (bitvector 1)
  ; A5 (bitvector 1)
  ; A4 (bitvector 1)
  ; A35 (bitvector 1)
  ; A34 (bitvector 1)
  ; A33 (bitvector 1)
  ; A32 (bitvector 1)
  ; A31 (bitvector 1)
  ; A30 (bitvector 1)
  ; A3 (bitvector 1)
  ; A29 (bitvector 1)
  ; A28 (bitvector 1)
  ; A27 (bitvector 1)
  ; A26 (bitvector 1)
  ; A25 (bitvector 1)
  ; A24 (bitvector 1)
  ; A23 (bitvector 1)
  ; A22 (bitvector 1)
  ; A21 (bitvector 1)
  ; A20 (bitvector 1)
  ; A2 (bitvector 1)
  ; A19 (bitvector 1)
  ; A18 (bitvector 1)
  ; A17 (bitvector 1)
  ; A16 (bitvector 1)
  ; A15 (bitvector 1)
  ; A14 (bitvector 1)
  ; A13 (bitvector 1)
  ; A12 (bitvector 1)
  ; A11 (bitvector 1)
  ; A10 (bitvector 1)
  ; A1 (bitvector 1)
  ; A0 (bitvector 1)
)
(struct
  ALU54B_Outputs
  (UNDER
    SIGNEDR
    R9
    R8
    R7
    R6
    R53
    R52
    R51
    R50
    R5
    R49
    R48
    R47
    R46
    R45
    R44
    R43
    R42
    R41
    R40
    R4
    R39
    R38
    R37
    R36
    R35
    R34
    R33
    R32
    R31
    R30
    R3
    R29
    R28
    R27
    R26
    R25
    R24
    R23
    R22
    R21
    R20
    R2
    R19
    R18
    R17
    R16
    R15
    R14
    R13
    R12
    R11
    R10
    R1
    R0
    OVERUNDER
    OVER
    EQZM
    EQZ
    EQPATB
    EQPAT
    EQOM
    CO9
    CO8
    CO7
    CO6
    CO53
    CO52
    CO51
    CO50
    CO5
    CO49
    CO48
    CO47
    CO46
    CO45
    CO44
    CO43
    CO42
    CO41
    CO40
    CO4
    CO39
    CO38
    CO37
    CO36
    CO35
    CO34
    CO33
    CO32
    CO31
    CO30
    CO3
    CO29
    CO28
    CO27
    CO26
    CO25
    CO24
    CO23
    CO22
    CO21
    CO20
    CO2
    CO19
    CO18
    CO17
    CO16
    CO15
    CO14
    CO13
    CO12
    CO11
    CO10
    CO1
    CO0)
  #:transparent
  ; UNDER (bitvector 1)
  ; SIGNEDR (bitvector 1)
  ; R9 (bitvector 1)
  ; R8 (bitvector 1)
  ; R7 (bitvector 1)
  ; R6 (bitvector 1)
  ; R53 (bitvector 1)
  ; R52 (bitvector 1)
  ; R51 (bitvector 1)
  ; R50 (bitvector 1)
  ; R5 (bitvector 1)
  ; R49 (bitvector 1)
  ; R48 (bitvector 1)
  ; R47 (bitvector 1)
  ; R46 (bitvector 1)
  ; R45 (bitvector 1)
  ; R44 (bitvector 1)
  ; R43 (bitvector 1)
  ; R42 (bitvector 1)
  ; R41 (bitvector 1)
  ; R40 (bitvector 1)
  ; R4 (bitvector 1)
  ; R39 (bitvector 1)
  ; R38 (bitvector 1)
  ; R37 (bitvector 1)
  ; R36 (bitvector 1)
  ; R35 (bitvector 1)
  ; R34 (bitvector 1)
  ; R33 (bitvector 1)
  ; R32 (bitvector 1)
  ; R31 (bitvector 1)
  ; R30 (bitvector 1)
  ; R3 (bitvector 1)
  ; R29 (bitvector 1)
  ; R28 (bitvector 1)
  ; R27 (bitvector 1)
  ; R26 (bitvector 1)
  ; R25 (bitvector 1)
  ; R24 (bitvector 1)
  ; R23 (bitvector 1)
  ; R22 (bitvector 1)
  ; R21 (bitvector 1)
  ; R20 (bitvector 1)
  ; R2 (bitvector 1)
  ; R19 (bitvector 1)
  ; R18 (bitvector 1)
  ; R17 (bitvector 1)
  ; R16 (bitvector 1)
  ; R15 (bitvector 1)
  ; R14 (bitvector 1)
  ; R13 (bitvector 1)
  ; R12 (bitvector 1)
  ; R11 (bitvector 1)
  ; R10 (bitvector 1)
  ; R1 (bitvector 1)
  ; R0 (bitvector 1)
  ; OVERUNDER (bitvector 1)
  ; OVER (bitvector 1)
  ; EQZM (bitvector 1)
  ; EQZ (bitvector 1)
  ; EQPATB (bitvector 1)
  ; EQPAT (bitvector 1)
  ; EQOM (bitvector 1)
  ; CO9 (bitvector 1)
  ; CO8 (bitvector 1)
  ; CO7 (bitvector 1)
  ; CO6 (bitvector 1)
  ; CO53 (bitvector 1)
  ; CO52 (bitvector 1)
  ; CO51 (bitvector 1)
  ; CO50 (bitvector 1)
  ; CO5 (bitvector 1)
  ; CO49 (bitvector 1)
  ; CO48 (bitvector 1)
  ; CO47 (bitvector 1)
  ; CO46 (bitvector 1)
  ; CO45 (bitvector 1)
  ; CO44 (bitvector 1)
  ; CO43 (bitvector 1)
  ; CO42 (bitvector 1)
  ; CO41 (bitvector 1)
  ; CO40 (bitvector 1)
  ; CO4 (bitvector 1)
  ; CO39 (bitvector 1)
  ; CO38 (bitvector 1)
  ; CO37 (bitvector 1)
  ; CO36 (bitvector 1)
  ; CO35 (bitvector 1)
  ; CO34 (bitvector 1)
  ; CO33 (bitvector 1)
  ; CO32 (bitvector 1)
  ; CO31 (bitvector 1)
  ; CO30 (bitvector 1)
  ; CO3 (bitvector 1)
  ; CO29 (bitvector 1)
  ; CO28 (bitvector 1)
  ; CO27 (bitvector 1)
  ; CO26 (bitvector 1)
  ; CO25 (bitvector 1)
  ; CO24 (bitvector 1)
  ; CO23 (bitvector 1)
  ; CO22 (bitvector 1)
  ; CO21 (bitvector 1)
  ; CO20 (bitvector 1)
  ; CO2 (bitvector 1)
  ; CO19 (bitvector 1)
  ; CO18 (bitvector 1)
  ; CO17 (bitvector 1)
  ; CO16 (bitvector 1)
  ; CO15 (bitvector 1)
  ; CO14 (bitvector 1)
  ; CO13 (bitvector 1)
  ; CO12 (bitvector 1)
  ; CO11 (bitvector 1)
  ; CO10 (bitvector 1)
  ; CO1 (bitvector 1)
  ; CO0 (bitvector 1)
)
(struct
  ALU54B_State
  ($auto$clk2fflogic.cc_86_sample_control_edge$1033
    $auto$clk2fflogic.cc_86_sample_control_edge$1043
    $auto$clk2fflogic.cc_102_sample_data$1029
    $auto$clk2fflogic.cc_102_sample_data$1031
    $auto$clk2fflogic.cc_102_sample_data$1039
    $auto$clk2fflogic.cc_102_sample_data$1041
    $auto$clk2fflogic.cc_86_sample_control_edge$993
    $auto$clk2fflogic.cc_86_sample_control_edge$1003
    $auto$clk2fflogic.cc_86_sample_control_edge$1013
    $auto$clk2fflogic.cc_86_sample_control_edge$1023
    $auto$clk2fflogic.cc_102_sample_data$989
    $auto$clk2fflogic.cc_102_sample_data$991
    $auto$clk2fflogic.cc_102_sample_data$999
    $auto$clk2fflogic.cc_102_sample_data$1001
    $auto$clk2fflogic.cc_102_sample_data$1009
    $auto$clk2fflogic.cc_102_sample_data$1011
    $auto$clk2fflogic.cc_102_sample_data$1019
    $auto$clk2fflogic.cc_102_sample_data$1021
    $auto$clk2fflogic.cc_86_sample_control_edge$963
    $auto$clk2fflogic.cc_86_sample_control_edge$973
    $auto$clk2fflogic.cc_102_sample_data$959
    $auto$clk2fflogic.cc_102_sample_data$961
    $auto$clk2fflogic.cc_102_sample_data$969
    $auto$clk2fflogic.cc_102_sample_data$971
    $auto$clk2fflogic.cc_86_sample_control_edge$1063
    $auto$clk2fflogic.cc_86_sample_control_edge$923
    $auto$clk2fflogic.cc_86_sample_control_edge$933
    $auto$clk2fflogic.cc_86_sample_control_edge$943
    $auto$clk2fflogic.cc_86_sample_control_edge$953
    $auto$clk2fflogic.cc_86_sample_control_edge$1053
    $auto$clk2fflogic.cc_102_sample_data$1059
    $auto$clk2fflogic.cc_102_sample_data$1061
    $auto$clk2fflogic.cc_102_sample_data$919
    $auto$clk2fflogic.cc_102_sample_data$921
    $auto$clk2fflogic.cc_102_sample_data$929
    $auto$clk2fflogic.cc_102_sample_data$931
    $auto$clk2fflogic.cc_102_sample_data$939
    $auto$clk2fflogic.cc_102_sample_data$941
    $auto$clk2fflogic.cc_102_sample_data$949
    $auto$clk2fflogic.cc_102_sample_data$951
    $auto$clk2fflogic.cc_102_sample_data$1049
    $auto$clk2fflogic.cc_102_sample_data$1051
    $auto$clk2fflogic.cc_86_sample_control_edge$893
    $auto$clk2fflogic.cc_86_sample_control_edge$903
    $auto$clk2fflogic.cc_86_sample_control_edge$983
    $auto$clk2fflogic.cc_86_sample_control_edge$793
    $auto$clk2fflogic.cc_86_sample_control_edge$873
    $auto$clk2fflogic.cc_86_sample_control_edge$803
    $auto$clk2fflogic.cc_86_sample_control_edge$883
    $auto$clk2fflogic.cc_86_sample_control_edge$783
    $auto$clk2fflogic.cc_86_sample_control_edge$863
    $auto$clk2fflogic.cc_86_sample_control_edge$743
    $auto$clk2fflogic.cc_86_sample_control_edge$823
    $auto$clk2fflogic.cc_86_sample_control_edge$733
    $auto$clk2fflogic.cc_86_sample_control_edge$813
    $auto$clk2fflogic.cc_86_sample_control_edge$763
    $auto$clk2fflogic.cc_86_sample_control_edge$843
    $auto$clk2fflogic.cc_86_sample_control_edge$773
    $auto$clk2fflogic.cc_86_sample_control_edge$853
    $auto$clk2fflogic.cc_86_sample_control_edge$753
    $auto$clk2fflogic.cc_86_sample_control_edge$833
    $auto$clk2fflogic.cc_86_sample_control_edge$913
    $auto$clk2fflogic.cc_102_sample_data$889
    $auto$clk2fflogic.cc_102_sample_data$891
    $auto$clk2fflogic.cc_102_sample_data$899
    $auto$clk2fflogic.cc_102_sample_data$901
    $auto$clk2fflogic.cc_102_sample_data$979
    $auto$clk2fflogic.cc_102_sample_data$981
    $auto$clk2fflogic.cc_102_sample_data$789
    $auto$clk2fflogic.cc_102_sample_data$791
    $auto$clk2fflogic.cc_102_sample_data$869
    $auto$clk2fflogic.cc_102_sample_data$871
    $auto$clk2fflogic.cc_102_sample_data$799
    $auto$clk2fflogic.cc_102_sample_data$801
    $auto$clk2fflogic.cc_102_sample_data$879
    $auto$clk2fflogic.cc_102_sample_data$881
    $auto$clk2fflogic.cc_102_sample_data$779
    $auto$clk2fflogic.cc_102_sample_data$781
    $auto$clk2fflogic.cc_102_sample_data$859
    $auto$clk2fflogic.cc_102_sample_data$861
    $auto$clk2fflogic.cc_102_sample_data$739
    $auto$clk2fflogic.cc_102_sample_data$741
    $auto$clk2fflogic.cc_102_sample_data$819
    $auto$clk2fflogic.cc_102_sample_data$821
    $auto$clk2fflogic.cc_102_sample_data$729
    $auto$clk2fflogic.cc_102_sample_data$731
    $auto$clk2fflogic.cc_102_sample_data$809
    $auto$clk2fflogic.cc_102_sample_data$811
    $auto$clk2fflogic.cc_102_sample_data$759
    $auto$clk2fflogic.cc_102_sample_data$761
    $auto$clk2fflogic.cc_102_sample_data$839
    $auto$clk2fflogic.cc_102_sample_data$841
    $auto$clk2fflogic.cc_102_sample_data$769
    $auto$clk2fflogic.cc_102_sample_data$771
    $auto$clk2fflogic.cc_102_sample_data$849
    $auto$clk2fflogic.cc_102_sample_data$851
    $auto$clk2fflogic.cc_102_sample_data$749
    $auto$clk2fflogic.cc_102_sample_data$751
    $auto$clk2fflogic.cc_102_sample_data$829
    $auto$clk2fflogic.cc_102_sample_data$831
    $auto$clk2fflogic.cc_102_sample_data$909
    $auto$clk2fflogic.cc_102_sample_data$911)
  #:transparent
  ; $auto$clk2fflogic.cc_86_sample_control_edge$1033 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$1043 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$1029 (bitvector 7)
  ; $auto$clk2fflogic.cc_102_sample_data$1031 (bitvector 7)
  ; $auto$clk2fflogic.cc_102_sample_data$1039 (bitvector 7)
  ; $auto$clk2fflogic.cc_102_sample_data$1041 (bitvector 7)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$993 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$1003 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$1013 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$1023 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$989 (bitvector 3)
  ; $auto$clk2fflogic.cc_102_sample_data$991 (bitvector 3)
  ; $auto$clk2fflogic.cc_102_sample_data$999 (bitvector 3)
  ; $auto$clk2fflogic.cc_102_sample_data$1001 (bitvector 3)
  ; $auto$clk2fflogic.cc_102_sample_data$1009 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$1011 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$1019 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$1021 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$963 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$973 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$959 (bitvector 7)
  ; $auto$clk2fflogic.cc_102_sample_data$961 (bitvector 7)
  ; $auto$clk2fflogic.cc_102_sample_data$969 (bitvector 7)
  ; $auto$clk2fflogic.cc_102_sample_data$971 (bitvector 7)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$1063 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$923 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$933 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$943 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$953 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$1053 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$1059 (bitvector 27)
  ; $auto$clk2fflogic.cc_102_sample_data$1061 (bitvector 27)
  ; $auto$clk2fflogic.cc_102_sample_data$919 (bitvector 3)
  ; $auto$clk2fflogic.cc_102_sample_data$921 (bitvector 3)
  ; $auto$clk2fflogic.cc_102_sample_data$929 (bitvector 3)
  ; $auto$clk2fflogic.cc_102_sample_data$931 (bitvector 3)
  ; $auto$clk2fflogic.cc_102_sample_data$939 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$941 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$949 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$951 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$1049 (bitvector 27)
  ; $auto$clk2fflogic.cc_102_sample_data$1051 (bitvector 27)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$893 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$903 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$983 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$793 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$873 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$803 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$883 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$783 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$863 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$743 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$823 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$733 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$813 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$763 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$843 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$773 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$853 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$753 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$833 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$913 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$889 (bitvector 37)
  ; $auto$clk2fflogic.cc_102_sample_data$891 (bitvector 37)
  ; $auto$clk2fflogic.cc_102_sample_data$899 (bitvector 37)
  ; $auto$clk2fflogic.cc_102_sample_data$901 (bitvector 37)
  ; $auto$clk2fflogic.cc_102_sample_data$979 (bitvector 54)
  ; $auto$clk2fflogic.cc_102_sample_data$981 (bitvector 54)
  ; $auto$clk2fflogic.cc_102_sample_data$789 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$791 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$869 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$871 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$799 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$801 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$879 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$881 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$779 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$781 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$859 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$861 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$739 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$741 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$819 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$821 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$729 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$731 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$809 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$811 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$759 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$761 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$839 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$841 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$769 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$771 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$849 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$851 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$749 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$751 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$829 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$831 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$909 (bitvector 18)
  ; $auto$clk2fflogic.cc_102_sample_data$911 (bitvector 18)
)
(define
  (ALU54B_inputs_helper inputs)
  (ALU54B_Inputs
    (let
      (
        (assoc-result
          (assoc "SIGNEDIB" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "SIGNEDIA" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "SIGNEDCIN" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "RST3" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "RST2" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "RST1" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "RST0" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "RNDPAT" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "REG_INPUTCFB_RST" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "REG_INPUTCFB_CLK" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "REG_INPUTCFB_CE" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "OP9" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "OP8" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "OP7" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "OP6" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "OP5" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "OP4" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "OP3" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "OP2" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "OP10" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "OP1" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "OP0" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MULT9_MODE" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MCPAT_SOURCE" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MCPAT" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MB9" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MB8" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MB7" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MB6" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MB5" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MB4" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MB35" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MB34" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MB33" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MB32" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MB31" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MB30" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MB3" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MB29" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MB28" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MB27" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MB26" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MB25" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MB24" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MB23" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MB22" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MB21" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MB20" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MB2" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MB19" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MB18" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MB17" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MB16" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MB15" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MB14" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MB13" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MB12" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MB11" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MB10" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MB1" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MB0" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MASKPAT_SOURCE" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MASKPAT" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MASK01" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MA9" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MA8" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MA7" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MA6" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MA5" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MA4" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MA35" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MA34" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MA33" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MA32" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MA31" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MA30" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MA3" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MA29" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MA28" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MA27" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MA26" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MA25" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MA24" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MA23" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MA22" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MA21" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MA20" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MA2" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MA19" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MA18" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MA17" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MA16" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MA15" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MA14" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MA13" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MA12" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MA11" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MA10" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MA1" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MA0" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "LEGACY" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "FORCE_ZERO_BARREL_SHIFT" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CLK3" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CLK2" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CLK1" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CLK0" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CIN9" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CIN8" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CIN7" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CIN6" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CIN53" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CIN52" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CIN51" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CIN50" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CIN5" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CIN49" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CIN48" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CIN47" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CIN46" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CIN45" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CIN44" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CIN43" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CIN42" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CIN41" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CIN40" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CIN4" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CIN39" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CIN38" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CIN37" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CIN36" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CIN35" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CIN34" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CIN33" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CIN32" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CIN31" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CIN30" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CIN3" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CIN29" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CIN28" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CIN27" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CIN26" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CIN25" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CIN24" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CIN23" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CIN22" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CIN21" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CIN20" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CIN2" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CIN19" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CIN18" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CIN17" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CIN16" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CIN15" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CIN14" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CIN13" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CIN12" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CIN11" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CIN10" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CIN1" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CIN0" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CFB9" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CFB8" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CFB7" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CFB6" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CFB53" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CFB52" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CFB51" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CFB50" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CFB5" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CFB49" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CFB48" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CFB47" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CFB46" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CFB45" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CFB44" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CFB43" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CFB42" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CFB41" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CFB40" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CFB4" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CFB39" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CFB38" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CFB37" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CFB36" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CFB35" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CFB34" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CFB33" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CFB32" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CFB31" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CFB30" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CFB3" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CFB29" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CFB28" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CFB27" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CFB26" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CFB25" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CFB24" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CFB23" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CFB22" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CFB21" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CFB20" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CFB2" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CFB19" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CFB18" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CFB17" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CFB16" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CFB15" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CFB14" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CFB13" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CFB12" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CFB11" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CFB10" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CFB1" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CFB0" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CE3" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CE2" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CE1" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CE0" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "C9" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "C8" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "C7" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "C6" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "C53" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "C52" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "C51" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "C50" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "C5" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "C49" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "C48" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "C47" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "C46" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "C45" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "C44" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "C43" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "C42" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "C41" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "C40" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "C4" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "C39" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "C38" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "C37" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "C36" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "C35" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "C34" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "C33" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "C32" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "C31" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "C30" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "C3" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "C29" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "C28" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "C27" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "C26" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "C25" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "C24" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "C23" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "C22" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "C21" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "C20" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "C2" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "C19" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "C18" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "C17" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "C16" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "C15" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "C14" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "C13" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "C12" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "C11" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "C10" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "C1" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "C0" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "B9" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "B8" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "B7" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "B6" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "B5" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "B4" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "B35" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "B34" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "B33" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "B32" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "B31" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "B30" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "B3" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "B29" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "B28" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "B27" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "B26" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "B25" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "B24" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "B23" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "B22" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "B21" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "B20" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "B2" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "B19" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "B18" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "B17" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "B16" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "B15" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "B14" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "B13" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "B12" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "B11" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "B10" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "B1" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "B0" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "A9" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "A8" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "A7" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "A6" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "A5" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "A4" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "A35" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "A34" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "A33" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "A32" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "A31" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "A30" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "A3" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "A29" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "A28" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "A27" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "A26" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "A25" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "A24" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "A23" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "A22" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "A21" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "A20" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "A2" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "A19" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "A18" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "A17" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "A16" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "A15" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "A14" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "A13" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "A12" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "A11" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "A10" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "A1" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "A0" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))))
(define
  (ALU54B_outputs_helper outputs)
  (list
    (cons "UNDER" (ALU54B_Outputs-UNDER outputs))
    (cons "SIGNEDR" (ALU54B_Outputs-SIGNEDR outputs))
    (cons "R9" (ALU54B_Outputs-R9 outputs))
    (cons "R8" (ALU54B_Outputs-R8 outputs))
    (cons "R7" (ALU54B_Outputs-R7 outputs))
    (cons "R6" (ALU54B_Outputs-R6 outputs))
    (cons "R53" (ALU54B_Outputs-R53 outputs))
    (cons "R52" (ALU54B_Outputs-R52 outputs))
    (cons "R51" (ALU54B_Outputs-R51 outputs))
    (cons "R50" (ALU54B_Outputs-R50 outputs))
    (cons "R5" (ALU54B_Outputs-R5 outputs))
    (cons "R49" (ALU54B_Outputs-R49 outputs))
    (cons "R48" (ALU54B_Outputs-R48 outputs))
    (cons "R47" (ALU54B_Outputs-R47 outputs))
    (cons "R46" (ALU54B_Outputs-R46 outputs))
    (cons "R45" (ALU54B_Outputs-R45 outputs))
    (cons "R44" (ALU54B_Outputs-R44 outputs))
    (cons "R43" (ALU54B_Outputs-R43 outputs))
    (cons "R42" (ALU54B_Outputs-R42 outputs))
    (cons "R41" (ALU54B_Outputs-R41 outputs))
    (cons "R40" (ALU54B_Outputs-R40 outputs))
    (cons "R4" (ALU54B_Outputs-R4 outputs))
    (cons "R39" (ALU54B_Outputs-R39 outputs))
    (cons "R38" (ALU54B_Outputs-R38 outputs))
    (cons "R37" (ALU54B_Outputs-R37 outputs))
    (cons "R36" (ALU54B_Outputs-R36 outputs))
    (cons "R35" (ALU54B_Outputs-R35 outputs))
    (cons "R34" (ALU54B_Outputs-R34 outputs))
    (cons "R33" (ALU54B_Outputs-R33 outputs))
    (cons "R32" (ALU54B_Outputs-R32 outputs))
    (cons "R31" (ALU54B_Outputs-R31 outputs))
    (cons "R30" (ALU54B_Outputs-R30 outputs))
    (cons "R3" (ALU54B_Outputs-R3 outputs))
    (cons "R29" (ALU54B_Outputs-R29 outputs))
    (cons "R28" (ALU54B_Outputs-R28 outputs))
    (cons "R27" (ALU54B_Outputs-R27 outputs))
    (cons "R26" (ALU54B_Outputs-R26 outputs))
    (cons "R25" (ALU54B_Outputs-R25 outputs))
    (cons "R24" (ALU54B_Outputs-R24 outputs))
    (cons "R23" (ALU54B_Outputs-R23 outputs))
    (cons "R22" (ALU54B_Outputs-R22 outputs))
    (cons "R21" (ALU54B_Outputs-R21 outputs))
    (cons "R20" (ALU54B_Outputs-R20 outputs))
    (cons "R2" (ALU54B_Outputs-R2 outputs))
    (cons "R19" (ALU54B_Outputs-R19 outputs))
    (cons "R18" (ALU54B_Outputs-R18 outputs))
    (cons "R17" (ALU54B_Outputs-R17 outputs))
    (cons "R16" (ALU54B_Outputs-R16 outputs))
    (cons "R15" (ALU54B_Outputs-R15 outputs))
    (cons "R14" (ALU54B_Outputs-R14 outputs))
    (cons "R13" (ALU54B_Outputs-R13 outputs))
    (cons "R12" (ALU54B_Outputs-R12 outputs))
    (cons "R11" (ALU54B_Outputs-R11 outputs))
    (cons "R10" (ALU54B_Outputs-R10 outputs))
    (cons "R1" (ALU54B_Outputs-R1 outputs))
    (cons "R0" (ALU54B_Outputs-R0 outputs))
    (cons "OVERUNDER" (ALU54B_Outputs-OVERUNDER outputs))
    (cons "OVER" (ALU54B_Outputs-OVER outputs))
    (cons "EQZM" (ALU54B_Outputs-EQZM outputs))
    (cons "EQZ" (ALU54B_Outputs-EQZ outputs))
    (cons "EQPATB" (ALU54B_Outputs-EQPATB outputs))
    (cons "EQPAT" (ALU54B_Outputs-EQPAT outputs))
    (cons "EQOM" (ALU54B_Outputs-EQOM outputs))
    (cons "CO9" (ALU54B_Outputs-CO9 outputs))
    (cons "CO8" (ALU54B_Outputs-CO8 outputs))
    (cons "CO7" (ALU54B_Outputs-CO7 outputs))
    (cons "CO6" (ALU54B_Outputs-CO6 outputs))
    (cons "CO53" (ALU54B_Outputs-CO53 outputs))
    (cons "CO52" (ALU54B_Outputs-CO52 outputs))
    (cons "CO51" (ALU54B_Outputs-CO51 outputs))
    (cons "CO50" (ALU54B_Outputs-CO50 outputs))
    (cons "CO5" (ALU54B_Outputs-CO5 outputs))
    (cons "CO49" (ALU54B_Outputs-CO49 outputs))
    (cons "CO48" (ALU54B_Outputs-CO48 outputs))
    (cons "CO47" (ALU54B_Outputs-CO47 outputs))
    (cons "CO46" (ALU54B_Outputs-CO46 outputs))
    (cons "CO45" (ALU54B_Outputs-CO45 outputs))
    (cons "CO44" (ALU54B_Outputs-CO44 outputs))
    (cons "CO43" (ALU54B_Outputs-CO43 outputs))
    (cons "CO42" (ALU54B_Outputs-CO42 outputs))
    (cons "CO41" (ALU54B_Outputs-CO41 outputs))
    (cons "CO40" (ALU54B_Outputs-CO40 outputs))
    (cons "CO4" (ALU54B_Outputs-CO4 outputs))
    (cons "CO39" (ALU54B_Outputs-CO39 outputs))
    (cons "CO38" (ALU54B_Outputs-CO38 outputs))
    (cons "CO37" (ALU54B_Outputs-CO37 outputs))
    (cons "CO36" (ALU54B_Outputs-CO36 outputs))
    (cons "CO35" (ALU54B_Outputs-CO35 outputs))
    (cons "CO34" (ALU54B_Outputs-CO34 outputs))
    (cons "CO33" (ALU54B_Outputs-CO33 outputs))
    (cons "CO32" (ALU54B_Outputs-CO32 outputs))
    (cons "CO31" (ALU54B_Outputs-CO31 outputs))
    (cons "CO30" (ALU54B_Outputs-CO30 outputs))
    (cons "CO3" (ALU54B_Outputs-CO3 outputs))
    (cons "CO29" (ALU54B_Outputs-CO29 outputs))
    (cons "CO28" (ALU54B_Outputs-CO28 outputs))
    (cons "CO27" (ALU54B_Outputs-CO27 outputs))
    (cons "CO26" (ALU54B_Outputs-CO26 outputs))
    (cons "CO25" (ALU54B_Outputs-CO25 outputs))
    (cons "CO24" (ALU54B_Outputs-CO24 outputs))
    (cons "CO23" (ALU54B_Outputs-CO23 outputs))
    (cons "CO22" (ALU54B_Outputs-CO22 outputs))
    (cons "CO21" (ALU54B_Outputs-CO21 outputs))
    (cons "CO20" (ALU54B_Outputs-CO20 outputs))
    (cons "CO2" (ALU54B_Outputs-CO2 outputs))
    (cons "CO19" (ALU54B_Outputs-CO19 outputs))
    (cons "CO18" (ALU54B_Outputs-CO18 outputs))
    (cons "CO17" (ALU54B_Outputs-CO17 outputs))
    (cons "CO16" (ALU54B_Outputs-CO16 outputs))
    (cons "CO15" (ALU54B_Outputs-CO15 outputs))
    (cons "CO14" (ALU54B_Outputs-CO14 outputs))
    (cons "CO13" (ALU54B_Outputs-CO13 outputs))
    (cons "CO12" (ALU54B_Outputs-CO12 outputs))
    (cons "CO11" (ALU54B_Outputs-CO11 outputs))
    (cons "CO10" (ALU54B_Outputs-CO10 outputs))
    (cons "CO1" (ALU54B_Outputs-CO1 outputs))
    (cons "CO0" (ALU54B_Outputs-CO0 outputs))))
(define (ALU54B inputs state)
  (let ((CLK0 (ALU54B_Inputs-CLK0 inputs))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$1029$_Q
      (ALU54B_State-$auto$clk2fflogic.cc_102_sample_data$1029 state))) ; (bitvector 7)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$1031$_Q
      (ALU54B_State-$auto$clk2fflogic.cc_102_sample_data$1031 state))) ; (bitvector 7)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_CLK0_sampled$1032
      (ALU54B_State-$auto$clk2fflogic.cc_86_sample_control_edge$1033 state))) ; (bitvector 1)
  (let
    ((n4
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_CLK0_sampled$1032
        CLK0))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$1034$_Y
      (bool->bitvector (bveq n4 (bv #b10 2))))) ; (bitvector 1)
  (let
    ((opin_sig_0_sync_neg
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$1034$_Y)
        $auto$clk2fflogic.cc_102_sample_data$1031$_Q
        $auto$clk2fflogic.cc_102_sample_data$1029$_Q))) ; (bitvector 7)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$1039$_Q
      (ALU54B_State-$auto$clk2fflogic.cc_102_sample_data$1039 state))) ; (bitvector 7)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$1041$_Q
      (ALU54B_State-$auto$clk2fflogic.cc_102_sample_data$1041 state))) ; (bitvector 7)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_CLK0_sampled$1042
      (ALU54B_State-$auto$clk2fflogic.cc_86_sample_control_edge$1043 state))) ; (bitvector 1)
  (let
    ((n11
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_CLK0_sampled$1042
        CLK0))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$1044$_Y
      (bool->bitvector (bveq n11 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((opin_sig_0_sync_pos
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$1044$_Y)
        $auto$clk2fflogic.cc_102_sample_data$1041$_Q
        $auto$clk2fflogic.cc_102_sample_data$1039$_Q))) ; (bitvector 7)
  (let ((OP0 (ALU54B_Inputs-OP0 inputs))) ; (bitvector 1)
  (let ((OP1 (ALU54B_Inputs-OP1 inputs))) ; (bitvector 1)
  (let ((n17 (concat OP1 OP0))) ; (bitvector 2)
  (let ((OP2 (ALU54B_Inputs-OP2 inputs))) ; (bitvector 1)
  (let ((n19 (concat OP2 n17))) ; (bitvector 3)
  (let ((OP3 (ALU54B_Inputs-OP3 inputs))) ; (bitvector 1)
  (let ((n21 (concat OP3 n19))) ; (bitvector 4)
  (let ((OP4 (ALU54B_Inputs-OP4 inputs))) ; (bitvector 1)
  (let ((n23 (concat OP4 n21))) ; (bitvector 5)
  (let ((OP5 (ALU54B_Inputs-OP5 inputs))) ; (bitvector 1)
  (let ((n25 (concat OP5 n23))) ; (bitvector 6)
  (let ((OP6 (ALU54B_Inputs-OP6 inputs))) ; (bitvector 1)
  (let ((n27 (concat OP6 n25))) ; (bitvector 7)
  (let
    (($xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_1556$65_Y
      (bvxor opin_sig_0_sync_pos n27))) ; (bitvector 7)
  (let ((CE0 (ALU54B_Inputs-CE0 inputs))) ; (bitvector 1)
  (let
    (($procmux$567$_Y
      (if
        (bitvector->bool CE0)
        $xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_1556$65_Y
        opin_sig_0_sync_neg))) ; (bitvector 7)
  (let ((RST0 (ALU54B_Inputs-RST0 inputs))) ; (bitvector 1)
  (let
    (($0_opin_sig_0_sync_neg_6_0_
      (if (bitvector->bool RST0) (bv #b0000000 7) $procmux$567$_Y))) ; (bitvector 7)
  (let
    (($xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_1549$61_Y
      (bvxor opin_sig_0_sync_neg n27))) ; (bitvector 7)
  (let
    (($procmux$572$_Y
      (if
        (bitvector->bool CE0)
        $xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_1549$61_Y
        opin_sig_0_sync_pos))) ; (bitvector 7)
  (let
    (($0_opin_sig_0_sync_pos_6_0_
      (if (bitvector->bool RST0) (bv #b0000000 7) $procmux$572$_Y))) ; (bitvector 7)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$989$_Q
      (ALU54B_State-$auto$clk2fflogic.cc_102_sample_data$989 state))) ; (bitvector 3)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$991$_Q
      (ALU54B_State-$auto$clk2fflogic.cc_102_sample_data$991 state))) ; (bitvector 3)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_CLK0_sampled$992
      (ALU54B_State-$auto$clk2fflogic.cc_86_sample_control_edge$993 state))) ; (bitvector 1)
  (let
    ((n40
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_CLK0_sampled$992
        CLK0))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$994$_Y
      (bool->bitvector (bveq n40 (bv #b10 2))))) ; (bitvector 1)
  (let
    ((op10_sig_0_sync_neg
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$994$_Y)
        $auto$clk2fflogic.cc_102_sample_data$991$_Q
        $auto$clk2fflogic.cc_102_sample_data$989$_Q))) ; (bitvector 3)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$999$_Q
      (ALU54B_State-$auto$clk2fflogic.cc_102_sample_data$999 state))) ; (bitvector 3)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$1001$_Q
      (ALU54B_State-$auto$clk2fflogic.cc_102_sample_data$1001 state))) ; (bitvector 3)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_CLK0_sampled$1002
      (ALU54B_State-$auto$clk2fflogic.cc_86_sample_control_edge$1003 state))) ; (bitvector 1)
  (let
    ((n46
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_CLK0_sampled$1002
        CLK0))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$1004$_Y
      (bool->bitvector (bveq n46 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((op10_sig_0_sync_pos
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$1004$_Y)
        $auto$clk2fflogic.cc_102_sample_data$1001$_Q
        $auto$clk2fflogic.cc_102_sample_data$999$_Q))) ; (bitvector 3)
  (let ((OP8 (ALU54B_Inputs-OP8 inputs))) ; (bitvector 1)
  (let ((OP9 (ALU54B_Inputs-OP9 inputs))) ; (bitvector 1)
  (let ((n51 (concat OP9 OP8))) ; (bitvector 2)
  (let ((OP10 (ALU54B_Inputs-OP10 inputs))) ; (bitvector 1)
  (let ((n53 (concat OP10 n51))) ; (bitvector 3)
  (let
    (($xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_1605$83_Y
      (bvxor op10_sig_0_sync_pos n53))) ; (bitvector 3)
  (let
    (($procmux$547$_Y
      (if
        (bitvector->bool CE0)
        $xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_1605$83_Y
        op10_sig_0_sync_neg))) ; (bitvector 3)
  (let
    (($0_op10_sig_0_sync_neg_2_0_
      (if (bitvector->bool RST0) (bv #b000 3) $procmux$547$_Y))) ; (bitvector 3)
  (let
    (($xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_1598$79_Y
      (bvxor op10_sig_0_sync_neg n53))) ; (bitvector 3)
  (let
    (($procmux$552$_Y
      (if
        (bitvector->bool CE0)
        $xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_1598$79_Y
        op10_sig_0_sync_pos))) ; (bitvector 3)
  (let
    (($0_op10_sig_0_sync_pos_2_0_
      (if (bitvector->bool RST0) (bv #b000 3) $procmux$552$_Y))) ; (bitvector 3)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$1009$_Q
      (ALU54B_State-$auto$clk2fflogic.cc_102_sample_data$1009 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$1011$_Q
      (ALU54B_State-$auto$clk2fflogic.cc_102_sample_data$1011 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_CLK0_sampled$1012
      (ALU54B_State-$auto$clk2fflogic.cc_86_sample_control_edge$1013 state))) ; (bitvector 1)
  (let
    ((n64
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_CLK0_sampled$1012
        CLK0))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$1014$_Y
      (bool->bitvector (bveq n64 (bv #b10 2))))) ; (bitvector 1)
  (let
    ((op7_sig_0_sync_neg
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$1014$_Y)
        $auto$clk2fflogic.cc_102_sample_data$1011$_Q
        $auto$clk2fflogic.cc_102_sample_data$1009$_Q))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$1019$_Q
      (ALU54B_State-$auto$clk2fflogic.cc_102_sample_data$1019 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$1021$_Q
      (ALU54B_State-$auto$clk2fflogic.cc_102_sample_data$1021 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_CLK0_sampled$1022
      (ALU54B_State-$auto$clk2fflogic.cc_86_sample_control_edge$1023 state))) ; (bitvector 1)
  (let
    ((n70
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_CLK0_sampled$1022
        CLK0))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$1024$_Y
      (bool->bitvector (bveq n70 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((op7_sig_0_sync_pos
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$1024$_Y)
        $auto$clk2fflogic.cc_102_sample_data$1021$_Q
        $auto$clk2fflogic.cc_102_sample_data$1019$_Q))) ; (bitvector 1)
  (let ((OP7 (ALU54B_Inputs-OP7 inputs))) ; (bitvector 1)
  (let
    (($xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_1580$74_Y
      (bvxor op7_sig_0_sync_pos OP7))) ; (bitvector 1)
  (let
    (($procmux$557$_Y
      (if
        (bitvector->bool CE0)
        $xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_1580$74_Y
        op7_sig_0_sync_neg))) ; (bitvector 1)
  (let
    (($0_op7_sig_0_sync_neg_0_0_
      (if (bitvector->bool RST0) (bv #b0 1) $procmux$557$_Y))) ; (bitvector 1)
  (let
    (($xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_1573$70_Y
      (bvxor op7_sig_0_sync_neg OP7))) ; (bitvector 1)
  (let
    (($procmux$562$_Y
      (if
        (bitvector->bool CE0)
        $xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_1573$70_Y
        op7_sig_0_sync_pos))) ; (bitvector 1)
  (let
    (($0_op7_sig_0_sync_pos_0_0_
      (if (bitvector->bool RST0) (bv #b0 1) $procmux$562$_Y))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$959$_Q
      (ALU54B_State-$auto$clk2fflogic.cc_102_sample_data$959 state))) ; (bitvector 7)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$961$_Q
      (ALU54B_State-$auto$clk2fflogic.cc_102_sample_data$961 state))) ; (bitvector 7)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_CLK0_sampled$962
      (ALU54B_State-$auto$clk2fflogic.cc_86_sample_control_edge$963 state))) ; (bitvector 1)
  (let
    ((n84
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_CLK0_sampled$962
        CLK0))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$964$_Y
      (bool->bitvector (bveq n84 (bv #b10 2))))) ; (bitvector 1)
  (let
    ((opin_sig_1_sync_neg
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$964$_Y)
        $auto$clk2fflogic.cc_102_sample_data$961$_Q
        $auto$clk2fflogic.cc_102_sample_data$959$_Q))) ; (bitvector 7)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$969$_Q
      (ALU54B_State-$auto$clk2fflogic.cc_102_sample_data$969 state))) ; (bitvector 7)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$971$_Q
      (ALU54B_State-$auto$clk2fflogic.cc_102_sample_data$971 state))) ; (bitvector 7)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_CLK0_sampled$972
      (ALU54B_State-$auto$clk2fflogic.cc_86_sample_control_edge$973 state))) ; (bitvector 1)
  (let
    ((n90
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_CLK0_sampled$972
        CLK0))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$974$_Y
      (bool->bitvector (bveq n90 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((opin_sig_1_sync_pos
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$974$_Y)
        $auto$clk2fflogic.cc_102_sample_data$971$_Q
        $auto$clk2fflogic.cc_102_sample_data$969$_Q))) ; (bitvector 7)
  (let
    (($xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_1559$66$_Y
      (bvxor opin_sig_0_sync_pos opin_sig_0_sync_neg))) ; (bitvector 7)
  (let
    (($xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_1708$104_Y
      (bvxor
        opin_sig_1_sync_pos
        $xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_1559$66$_Y))) ; (bitvector 7)
  (let
    (($procmux$527$_Y
      (if
        (bitvector->bool CE0)
        $xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_1708$104_Y
        opin_sig_1_sync_neg))) ; (bitvector 7)
  (let
    (($0_opin_sig_1_sync_neg_6_0_
      (if (bitvector->bool RST0) (bv #b0000000 7) $procmux$527$_Y))) ; (bitvector 7)
  (let
    (($xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_1701$100_Y
      (bvxor
        opin_sig_1_sync_neg
        $xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_1559$66$_Y))) ; (bitvector 7)
  (let
    (($procmux$532$_Y
      (if
        (bitvector->bool CE0)
        $xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_1701$100_Y
        opin_sig_1_sync_pos))) ; (bitvector 7)
  (let
    (($0_opin_sig_1_sync_pos_6_0_
      (if (bitvector->bool RST0) (bv #b0000000 7) $procmux$532$_Y))) ; (bitvector 7)
  (let
    (($auto$clk2fflogic.cc_95_sample_data$_c_sig_sync0_sampled$1058
      (ALU54B_State-$auto$clk2fflogic.cc_102_sample_data$1059 state))) ; (bitvector 27)
  (let
    (($auto$clk2fflogic.cc_95_sample_data$$0_c_sig_sync0_26_0__sampled$1060
      (ALU54B_State-$auto$clk2fflogic.cc_102_sample_data$1061 state))) ; (bitvector 27)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_CLK0_sampled$1062
      (ALU54B_State-$auto$clk2fflogic.cc_86_sample_control_edge$1063 state))) ; (bitvector 1)
  (let
    ((n103
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_CLK0_sampled$1062
        CLK0))) ; (bitvector 2)
  (let
    (($auto$rtlil.cc_2974_Eqx$1065 (bool->bitvector (bveq n103 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((c_sig_sync0
      (if
        (bitvector->bool $auto$rtlil.cc_2974_Eqx$1065)
        $auto$clk2fflogic.cc_95_sample_data$$0_c_sig_sync0_26_0__sampled$1060
        $auto$clk2fflogic.cc_95_sample_data$_c_sig_sync0_sampled$1058))) ; (bitvector 27)
  (let ((C0 (ALU54B_Inputs-C0 inputs))) ; (bitvector 1)
  (let ((C1 (ALU54B_Inputs-C1 inputs))) ; (bitvector 1)
  (let ((n108 (concat C1 C0))) ; (bitvector 2)
  (let ((C2 (ALU54B_Inputs-C2 inputs))) ; (bitvector 1)
  (let ((n110 (concat C2 n108))) ; (bitvector 3)
  (let ((C3 (ALU54B_Inputs-C3 inputs))) ; (bitvector 1)
  (let ((n112 (concat C3 n110))) ; (bitvector 4)
  (let ((C4 (ALU54B_Inputs-C4 inputs))) ; (bitvector 1)
  (let ((n114 (concat C4 n112))) ; (bitvector 5)
  (let ((C5 (ALU54B_Inputs-C5 inputs))) ; (bitvector 1)
  (let ((n116 (concat C5 n114))) ; (bitvector 6)
  (let ((C6 (ALU54B_Inputs-C6 inputs))) ; (bitvector 1)
  (let ((n118 (concat C6 n116))) ; (bitvector 7)
  (let ((C7 (ALU54B_Inputs-C7 inputs))) ; (bitvector 1)
  (let ((n120 (concat C7 n118))) ; (bitvector 8)
  (let ((C8 (ALU54B_Inputs-C8 inputs))) ; (bitvector 1)
  (let ((n122 (concat C8 n120))) ; (bitvector 9)
  (let ((C9 (ALU54B_Inputs-C9 inputs))) ; (bitvector 1)
  (let ((n124 (concat C9 n122))) ; (bitvector 10)
  (let ((C10 (ALU54B_Inputs-C10 inputs))) ; (bitvector 1)
  (let ((n126 (concat C10 n124))) ; (bitvector 11)
  (let ((C11 (ALU54B_Inputs-C11 inputs))) ; (bitvector 1)
  (let ((n128 (concat C11 n126))) ; (bitvector 12)
  (let ((C12 (ALU54B_Inputs-C12 inputs))) ; (bitvector 1)
  (let ((n130 (concat C12 n128))) ; (bitvector 13)
  (let ((C13 (ALU54B_Inputs-C13 inputs))) ; (bitvector 1)
  (let ((n132 (concat C13 n130))) ; (bitvector 14)
  (let ((C14 (ALU54B_Inputs-C14 inputs))) ; (bitvector 1)
  (let ((n134 (concat C14 n132))) ; (bitvector 15)
  (let ((C15 (ALU54B_Inputs-C15 inputs))) ; (bitvector 1)
  (let ((n136 (concat C15 n134))) ; (bitvector 16)
  (let ((C16 (ALU54B_Inputs-C16 inputs))) ; (bitvector 1)
  (let ((n138 (concat C16 n136))) ; (bitvector 17)
  (let ((C17 (ALU54B_Inputs-C17 inputs))) ; (bitvector 1)
  (let ((n140 (concat C17 n138))) ; (bitvector 18)
  (let ((C18 (ALU54B_Inputs-C18 inputs))) ; (bitvector 1)
  (let ((n142 (concat C18 n140))) ; (bitvector 19)
  (let ((C19 (ALU54B_Inputs-C19 inputs))) ; (bitvector 1)
  (let ((n144 (concat C19 n142))) ; (bitvector 20)
  (let ((C20 (ALU54B_Inputs-C20 inputs))) ; (bitvector 1)
  (let ((n146 (concat C20 n144))) ; (bitvector 21)
  (let ((C21 (ALU54B_Inputs-C21 inputs))) ; (bitvector 1)
  (let ((n148 (concat C21 n146))) ; (bitvector 22)
  (let ((C22 (ALU54B_Inputs-C22 inputs))) ; (bitvector 1)
  (let ((n150 (concat C22 n148))) ; (bitvector 23)
  (let ((C23 (ALU54B_Inputs-C23 inputs))) ; (bitvector 1)
  (let ((n152 (concat C23 n150))) ; (bitvector 24)
  (let ((C24 (ALU54B_Inputs-C24 inputs))) ; (bitvector 1)
  (let ((n154 (concat C24 n152))) ; (bitvector 25)
  (let ((C25 (ALU54B_Inputs-C25 inputs))) ; (bitvector 1)
  (let ((n156 (concat C25 n154))) ; (bitvector 26)
  (let ((C26 (ALU54B_Inputs-C26 inputs))) ; (bitvector 1)
  (let ((n158 (concat C26 n156))) ; (bitvector 27)
  (let (($procmux$584$_Y (if (bitvector->bool CE0) n158 c_sig_sync0))) ; (bitvector 27)
  (let
    (($0_c_sig_sync0_26_0_
      (if
        (bitvector->bool RST0)
        (bv #b000000000000000000000000000 27)
        $procmux$584$_Y))) ; (bitvector 27)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$919$_Q
      (ALU54B_State-$auto$clk2fflogic.cc_102_sample_data$919 state))) ; (bitvector 3)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$921$_Q
      (ALU54B_State-$auto$clk2fflogic.cc_102_sample_data$921 state))) ; (bitvector 3)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_CLK0_sampled$922
      (ALU54B_State-$auto$clk2fflogic.cc_86_sample_control_edge$923 state))) ; (bitvector 1)
  (let
    ((n165
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_CLK0_sampled$922
        CLK0))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$924$_Y
      (bool->bitvector (bveq n165 (bv #b10 2))))) ; (bitvector 1)
  (let
    ((op10_sig_1_sync_neg
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$924$_Y)
        $auto$clk2fflogic.cc_102_sample_data$921$_Q
        $auto$clk2fflogic.cc_102_sample_data$919$_Q))) ; (bitvector 3)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$929$_Q
      (ALU54B_State-$auto$clk2fflogic.cc_102_sample_data$929 state))) ; (bitvector 3)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$931$_Q
      (ALU54B_State-$auto$clk2fflogic.cc_102_sample_data$931 state))) ; (bitvector 3)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_CLK0_sampled$932
      (ALU54B_State-$auto$clk2fflogic.cc_86_sample_control_edge$933 state))) ; (bitvector 1)
  (let
    ((n171
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_CLK0_sampled$932
        CLK0))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$934$_Y
      (bool->bitvector (bveq n171 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((op10_sig_1_sync_pos
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$934$_Y)
        $auto$clk2fflogic.cc_102_sample_data$931$_Q
        $auto$clk2fflogic.cc_102_sample_data$929$_Q))) ; (bitvector 3)
  (let
    (($xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_1608$84$_Y
      (bvxor op10_sig_0_sync_pos op10_sig_0_sync_neg))) ; (bitvector 3)
  (let
    (($xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_1758$122_Y
      (bvxor
        op10_sig_1_sync_pos
        $xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_1608$84$_Y))) ; (bitvector 3)
  (let
    (($procmux$507$_Y
      (if
        (bitvector->bool CE0)
        $xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_1758$122_Y
        op10_sig_1_sync_neg))) ; (bitvector 3)
  (let
    (($0_op10_sig_1_sync_neg_2_0_
      (if (bitvector->bool RST0) (bv #b000 3) $procmux$507$_Y))) ; (bitvector 3)
  (let
    (($xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_1751$118_Y
      (bvxor
        op10_sig_1_sync_neg
        $xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_1608$84$_Y))) ; (bitvector 3)
  (let
    (($procmux$512$_Y
      (if
        (bitvector->bool CE0)
        $xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_1751$118_Y
        op10_sig_1_sync_pos))) ; (bitvector 3)
  (let
    (($0_op10_sig_1_sync_pos_2_0_
      (if (bitvector->bool RST0) (bv #b000 3) $procmux$512$_Y))) ; (bitvector 3)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$939$_Q
      (ALU54B_State-$auto$clk2fflogic.cc_102_sample_data$939 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$941$_Q
      (ALU54B_State-$auto$clk2fflogic.cc_102_sample_data$941 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_CLK0_sampled$942
      (ALU54B_State-$auto$clk2fflogic.cc_86_sample_control_edge$943 state))) ; (bitvector 1)
  (let
    ((n184
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_CLK0_sampled$942
        CLK0))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$944$_Y
      (bool->bitvector (bveq n184 (bv #b10 2))))) ; (bitvector 1)
  (let
    ((op7_sig_1_sync_neg
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$944$_Y)
        $auto$clk2fflogic.cc_102_sample_data$941$_Q
        $auto$clk2fflogic.cc_102_sample_data$939$_Q))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$949$_Q
      (ALU54B_State-$auto$clk2fflogic.cc_102_sample_data$949 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$951$_Q
      (ALU54B_State-$auto$clk2fflogic.cc_102_sample_data$951 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_CLK0_sampled$952
      (ALU54B_State-$auto$clk2fflogic.cc_86_sample_control_edge$953 state))) ; (bitvector 1)
  (let
    ((n190
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_CLK0_sampled$952
        CLK0))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$954$_Y
      (bool->bitvector (bveq n190 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((op7_sig_1_sync_pos
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$954$_Y)
        $auto$clk2fflogic.cc_102_sample_data$951$_Q
        $auto$clk2fflogic.cc_102_sample_data$949$_Q))) ; (bitvector 1)
  (let
    (($xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_1583$75$_Y
      (bvxor op7_sig_0_sync_pos op7_sig_0_sync_neg))) ; (bitvector 1)
  (let
    (($xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_1733$113_Y
      (bvxor
        op7_sig_1_sync_pos
        $xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_1583$75$_Y))) ; (bitvector 1)
  (let
    (($procmux$517$_Y
      (if
        (bitvector->bool CE0)
        $xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_1733$113_Y
        op7_sig_1_sync_neg))) ; (bitvector 1)
  (let
    (($0_op7_sig_1_sync_neg_0_0_
      (if (bitvector->bool RST0) (bv #b0 1) $procmux$517$_Y))) ; (bitvector 1)
  (let
    (($xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_1726$109_Y
      (bvxor
        op7_sig_1_sync_neg
        $xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_1583$75$_Y))) ; (bitvector 1)
  (let
    (($procmux$522$_Y
      (if
        (bitvector->bool CE0)
        $xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_1726$109_Y
        op7_sig_1_sync_pos))) ; (bitvector 1)
  (let
    (($0_op7_sig_1_sync_pos_0_0_
      (if (bitvector->bool RST0) (bv #b0 1) $procmux$522$_Y))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$1049$_Q
      (ALU54B_State-$auto$clk2fflogic.cc_102_sample_data$1049 state))) ; (bitvector 27)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$1051$_Q
      (ALU54B_State-$auto$clk2fflogic.cc_102_sample_data$1051 state))) ; (bitvector 27)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_CLK0_sampled$1052
      (ALU54B_State-$auto$clk2fflogic.cc_86_sample_control_edge$1053 state))) ; (bitvector 1)
  (let
    ((n203
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_CLK0_sampled$1052
        CLK0))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$1054$_Y
      (bool->bitvector (bveq n203 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((c_sig_sync1
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$1054$_Y)
        $auto$clk2fflogic.cc_102_sample_data$1051$_Q
        $auto$clk2fflogic.cc_102_sample_data$1049$_Q))) ; (bitvector 27)
  (let ((C27 (ALU54B_Inputs-C27 inputs))) ; (bitvector 1)
  (let ((C28 (ALU54B_Inputs-C28 inputs))) ; (bitvector 1)
  (let ((n208 (concat C28 C27))) ; (bitvector 2)
  (let ((C29 (ALU54B_Inputs-C29 inputs))) ; (bitvector 1)
  (let ((n210 (concat C29 n208))) ; (bitvector 3)
  (let ((C30 (ALU54B_Inputs-C30 inputs))) ; (bitvector 1)
  (let ((n212 (concat C30 n210))) ; (bitvector 4)
  (let ((C31 (ALU54B_Inputs-C31 inputs))) ; (bitvector 1)
  (let ((n214 (concat C31 n212))) ; (bitvector 5)
  (let ((C32 (ALU54B_Inputs-C32 inputs))) ; (bitvector 1)
  (let ((n216 (concat C32 n214))) ; (bitvector 6)
  (let ((C33 (ALU54B_Inputs-C33 inputs))) ; (bitvector 1)
  (let ((n218 (concat C33 n216))) ; (bitvector 7)
  (let ((C34 (ALU54B_Inputs-C34 inputs))) ; (bitvector 1)
  (let ((n220 (concat C34 n218))) ; (bitvector 8)
  (let ((C35 (ALU54B_Inputs-C35 inputs))) ; (bitvector 1)
  (let ((n222 (concat C35 n220))) ; (bitvector 9)
  (let ((C36 (ALU54B_Inputs-C36 inputs))) ; (bitvector 1)
  (let ((n224 (concat C36 n222))) ; (bitvector 10)
  (let ((C37 (ALU54B_Inputs-C37 inputs))) ; (bitvector 1)
  (let ((n226 (concat C37 n224))) ; (bitvector 11)
  (let ((C38 (ALU54B_Inputs-C38 inputs))) ; (bitvector 1)
  (let ((n228 (concat C38 n226))) ; (bitvector 12)
  (let ((C39 (ALU54B_Inputs-C39 inputs))) ; (bitvector 1)
  (let ((n230 (concat C39 n228))) ; (bitvector 13)
  (let ((C40 (ALU54B_Inputs-C40 inputs))) ; (bitvector 1)
  (let ((n232 (concat C40 n230))) ; (bitvector 14)
  (let ((C41 (ALU54B_Inputs-C41 inputs))) ; (bitvector 1)
  (let ((n234 (concat C41 n232))) ; (bitvector 15)
  (let ((C42 (ALU54B_Inputs-C42 inputs))) ; (bitvector 1)
  (let ((n236 (concat C42 n234))) ; (bitvector 16)
  (let ((C43 (ALU54B_Inputs-C43 inputs))) ; (bitvector 1)
  (let ((n238 (concat C43 n236))) ; (bitvector 17)
  (let ((C44 (ALU54B_Inputs-C44 inputs))) ; (bitvector 1)
  (let ((n240 (concat C44 n238))) ; (bitvector 18)
  (let ((C45 (ALU54B_Inputs-C45 inputs))) ; (bitvector 1)
  (let ((n242 (concat C45 n240))) ; (bitvector 19)
  (let ((C46 (ALU54B_Inputs-C46 inputs))) ; (bitvector 1)
  (let ((n244 (concat C46 n242))) ; (bitvector 20)
  (let ((C47 (ALU54B_Inputs-C47 inputs))) ; (bitvector 1)
  (let ((n246 (concat C47 n244))) ; (bitvector 21)
  (let ((C48 (ALU54B_Inputs-C48 inputs))) ; (bitvector 1)
  (let ((n248 (concat C48 n246))) ; (bitvector 22)
  (let ((C49 (ALU54B_Inputs-C49 inputs))) ; (bitvector 1)
  (let ((n250 (concat C49 n248))) ; (bitvector 23)
  (let ((C50 (ALU54B_Inputs-C50 inputs))) ; (bitvector 1)
  (let ((n252 (concat C50 n250))) ; (bitvector 24)
  (let ((C51 (ALU54B_Inputs-C51 inputs))) ; (bitvector 1)
  (let ((n254 (concat C51 n252))) ; (bitvector 25)
  (let ((C52 (ALU54B_Inputs-C52 inputs))) ; (bitvector 1)
  (let ((n256 (concat C52 n254))) ; (bitvector 26)
  (let ((C53 (ALU54B_Inputs-C53 inputs))) ; (bitvector 1)
  (let ((n258 (concat C53 n256))) ; (bitvector 27)
  (let (($procmux$577$_Y (if (bitvector->bool CE0) n258 c_sig_sync1))) ; (bitvector 27)
  (let
    (($0_c_sig_sync1_26_0_
      (if
        (bitvector->bool RST0)
        (bv #b000000000000000000000000000 27)
        $procmux$577$_Y))) ; (bitvector 27)
  (let ((CLK3 (ALU54B_Inputs-CLK3 inputs))) ; (bitvector 1)
  (let ((REG_INPUTCFB_CLK (ALU54B_Inputs-REG_INPUTCFB_CLK inputs))) ; (bitvector 5)
  (let ((n264 (zero-extend (bv #b1110 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_1462$35$_Y
      (bool->bitvector (bveq REG_INPUTCFB_CLK n264)))) ; (bitvector 1)
  (let
    (($procmux$652$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_1462$35$_Y)
        CLK3
        CLK0))) ; (bitvector 1)
  (let ((CLK2 (ALU54B_Inputs-CLK2 inputs))) ; (bitvector 1)
  (let ((n269 (zero-extend (bv #b1101 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_1461$34$_Y
      (bool->bitvector (bveq REG_INPUTCFB_CLK n269)))) ; (bitvector 1)
  (let
    (($procmux$664$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_1461$34$_Y)
        CLK2
        $procmux$652$_Y))) ; (bitvector 1)
  (let ((CLK1 (ALU54B_Inputs-CLK1 inputs))) ; (bitvector 1)
  (let ((n274 (zero-extend (bv #b1100 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_1460$33$_Y
      (bool->bitvector (bveq REG_INPUTCFB_CLK n274)))) ; (bitvector 1)
  (let
    (($procmux$673$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_1460$33$_Y)
        CLK1
        $procmux$664$_Y))) ; (bitvector 1)
  (let ((n278 (zero-extend (bv #b1011 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_1459$32$_Y
      (bool->bitvector (bveq REG_INPUTCFB_CLK n278)))) ; (bitvector 1)
  (let
    ((cfb_clk_sig
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_1459$32$_Y)
        CLK0
        $procmux$673$_Y))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$889$_Q
      (ALU54B_State-$auto$clk2fflogic.cc_102_sample_data$889 state))) ; (bitvector 37)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$891$_Q
      (ALU54B_State-$auto$clk2fflogic.cc_102_sample_data$891 state))) ; (bitvector 37)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_CLK0_sampled$892
      (ALU54B_State-$auto$clk2fflogic.cc_86_sample_control_edge$893 state))) ; (bitvector 1)
  (let
    ((n284
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_CLK0_sampled$892
        CLK0))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$894$_Y
      (bool->bitvector (bveq n284 (bv #b10 2))))) ; (bitvector 1)
  (let
    ((r_out_msb_sync_neg
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$894$_Y)
        $auto$clk2fflogic.cc_102_sample_data$891$_Q
        $auto$clk2fflogic.cc_102_sample_data$889$_Q))) ; (bitvector 37)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$899$_Q
      (ALU54B_State-$auto$clk2fflogic.cc_102_sample_data$899 state))) ; (bitvector 37)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$901$_Q
      (ALU54B_State-$auto$clk2fflogic.cc_102_sample_data$901 state))) ; (bitvector 37)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_CLK0_sampled$902
      (ALU54B_State-$auto$clk2fflogic.cc_86_sample_control_edge$903 state))) ; (bitvector 1)
  (let
    ((n290
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_CLK0_sampled$902
        CLK0))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$904$_Y
      (bool->bitvector (bveq n290 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((r_out_msb_sync_pos
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$904$_Y)
        $auto$clk2fflogic.cc_102_sample_data$901$_Q
        $auto$clk2fflogic.cc_102_sample_data$899$_Q))) ; (bitvector 37)
  (let ((B0 (ALU54B_Inputs-B0 inputs))) ; (bitvector 1)
  (let
    ((n296
      (concat
        B0
        (bv #b0000000000000000000000000000000000000000000000000000000 55)))) ; (bitvector 56)
  (let ((B1 (ALU54B_Inputs-B1 inputs))) ; (bitvector 1)
  (let ((n298 (concat B1 n296))) ; (bitvector 57)
  (let ((B2 (ALU54B_Inputs-B2 inputs))) ; (bitvector 1)
  (let ((n300 (concat B2 n298))) ; (bitvector 58)
  (let ((B3 (ALU54B_Inputs-B3 inputs))) ; (bitvector 1)
  (let ((n302 (concat B3 n300))) ; (bitvector 59)
  (let ((B4 (ALU54B_Inputs-B4 inputs))) ; (bitvector 1)
  (let ((n304 (concat B4 n302))) ; (bitvector 60)
  (let ((B5 (ALU54B_Inputs-B5 inputs))) ; (bitvector 1)
  (let ((n306 (concat B5 n304))) ; (bitvector 61)
  (let ((B6 (ALU54B_Inputs-B6 inputs))) ; (bitvector 1)
  (let ((n308 (concat B6 n306))) ; (bitvector 62)
  (let ((B7 (ALU54B_Inputs-B7 inputs))) ; (bitvector 1)
  (let ((n310 (concat B7 n308))) ; (bitvector 63)
  (let ((B8 (ALU54B_Inputs-B8 inputs))) ; (bitvector 1)
  (let ((n312 (concat B8 n310))) ; (bitvector 64)
  (let ((B9 (ALU54B_Inputs-B9 inputs))) ; (bitvector 1)
  (let ((n314 (concat B9 n312))) ; (bitvector 65)
  (let ((B10 (ALU54B_Inputs-B10 inputs))) ; (bitvector 1)
  (let ((n316 (concat B10 n314))) ; (bitvector 66)
  (let ((B11 (ALU54B_Inputs-B11 inputs))) ; (bitvector 1)
  (let ((n318 (concat B11 n316))) ; (bitvector 67)
  (let ((B12 (ALU54B_Inputs-B12 inputs))) ; (bitvector 1)
  (let ((n320 (concat B12 n318))) ; (bitvector 68)
  (let ((B13 (ALU54B_Inputs-B13 inputs))) ; (bitvector 1)
  (let ((n322 (concat B13 n320))) ; (bitvector 69)
  (let ((B14 (ALU54B_Inputs-B14 inputs))) ; (bitvector 1)
  (let ((n324 (concat B14 n322))) ; (bitvector 70)
  (let ((B15 (ALU54B_Inputs-B15 inputs))) ; (bitvector 1)
  (let ((n326 (concat B15 n324))) ; (bitvector 71)
  (let ((B16 (ALU54B_Inputs-B16 inputs))) ; (bitvector 1)
  (let ((n328 (concat B16 n326))) ; (bitvector 72)
  (let ((B17 (ALU54B_Inputs-B17 inputs))) ; (bitvector 1)
  (let ((n330 (concat B17 n328))) ; (bitvector 73)
  (let ((B18 (ALU54B_Inputs-B18 inputs))) ; (bitvector 1)
  (let ((n332 (concat B18 n330))) ; (bitvector 74)
  (let ((B19 (ALU54B_Inputs-B19 inputs))) ; (bitvector 1)
  (let ((n334 (concat B19 n332))) ; (bitvector 75)
  (let ((B20 (ALU54B_Inputs-B20 inputs))) ; (bitvector 1)
  (let ((n336 (concat B20 n334))) ; (bitvector 76)
  (let ((B21 (ALU54B_Inputs-B21 inputs))) ; (bitvector 1)
  (let ((n338 (concat B21 n336))) ; (bitvector 77)
  (let ((B22 (ALU54B_Inputs-B22 inputs))) ; (bitvector 1)
  (let ((n340 (concat B22 n338))) ; (bitvector 78)
  (let ((B23 (ALU54B_Inputs-B23 inputs))) ; (bitvector 1)
  (let ((n342 (concat B23 n340))) ; (bitvector 79)
  (let ((B24 (ALU54B_Inputs-B24 inputs))) ; (bitvector 1)
  (let ((n344 (concat B24 n342))) ; (bitvector 80)
  (let ((B25 (ALU54B_Inputs-B25 inputs))) ; (bitvector 1)
  (let ((n346 (concat B25 n344))) ; (bitvector 81)
  (let ((B26 (ALU54B_Inputs-B26 inputs))) ; (bitvector 1)
  (let ((n348 (concat B26 n346))) ; (bitvector 82)
  (let ((B27 (ALU54B_Inputs-B27 inputs))) ; (bitvector 1)
  (let ((n350 (concat B27 n348))) ; (bitvector 83)
  (let ((B28 (ALU54B_Inputs-B28 inputs))) ; (bitvector 1)
  (let ((n352 (concat B28 n350))) ; (bitvector 84)
  (let ((B29 (ALU54B_Inputs-B29 inputs))) ; (bitvector 1)
  (let ((n354 (concat B29 n352))) ; (bitvector 85)
  (let ((B30 (ALU54B_Inputs-B30 inputs))) ; (bitvector 1)
  (let ((n356 (concat B30 n354))) ; (bitvector 86)
  (let ((B31 (ALU54B_Inputs-B31 inputs))) ; (bitvector 1)
  (let ((n358 (concat B31 n356))) ; (bitvector 87)
  (let ((B32 (ALU54B_Inputs-B32 inputs))) ; (bitvector 1)
  (let ((n360 (concat B32 n358))) ; (bitvector 88)
  (let ((B33 (ALU54B_Inputs-B33 inputs))) ; (bitvector 1)
  (let ((n362 (concat B33 n360))) ; (bitvector 89)
  (let ((B34 (ALU54B_Inputs-B34 inputs))) ; (bitvector 1)
  (let ((n364 (concat B34 n362))) ; (bitvector 90)
  (let ((B35 (ALU54B_Inputs-B35 inputs))) ; (bitvector 1)
  (let ((n366 (concat B35 n364))) ; (bitvector 91)
  (let ((n367 (extract 17 0 c_sig_sync1))) ; (bitvector 18)
  (let ((n368 (concat n367 n366))) ; (bitvector 109)
  (let ((SIGNEDIA (ALU54B_Inputs-SIGNEDIA inputs))) ; (bitvector 1)
  (let ((SIGNEDIB (ALU54B_Inputs-SIGNEDIB inputs))) ; (bitvector 1)
  (let ((signedr_sig (bvor SIGNEDIA SIGNEDIB))) ; (bitvector 1)
  (let ((n372 (extract 17 17 c_sig_sync1))) ; (bitvector 1)
  (let
    (($and$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_1963$142$_Y
      (bvand signedr_sig n372))) ; (bitvector 1)
  (let
    ((n374
      (concat
        $and$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_1963$142$_Y
        n368))) ; (bitvector 110)
  (let ((MB0 (ALU54B_Inputs-MB0 inputs))) ; (bitvector 1)
  (let ((MB1 (ALU54B_Inputs-MB1 inputs))) ; (bitvector 1)
  (let ((n377 (concat MB1 MB0))) ; (bitvector 2)
  (let ((MB2 (ALU54B_Inputs-MB2 inputs))) ; (bitvector 1)
  (let ((n379 (concat MB2 n377))) ; (bitvector 3)
  (let ((MB3 (ALU54B_Inputs-MB3 inputs))) ; (bitvector 1)
  (let ((n381 (concat MB3 n379))) ; (bitvector 4)
  (let ((MB4 (ALU54B_Inputs-MB4 inputs))) ; (bitvector 1)
  (let ((n383 (concat MB4 n381))) ; (bitvector 5)
  (let ((MB5 (ALU54B_Inputs-MB5 inputs))) ; (bitvector 1)
  (let ((n385 (concat MB5 n383))) ; (bitvector 6)
  (let ((MB6 (ALU54B_Inputs-MB6 inputs))) ; (bitvector 1)
  (let ((n387 (concat MB6 n385))) ; (bitvector 7)
  (let ((MB7 (ALU54B_Inputs-MB7 inputs))) ; (bitvector 1)
  (let ((n389 (concat MB7 n387))) ; (bitvector 8)
  (let ((MB8 (ALU54B_Inputs-MB8 inputs))) ; (bitvector 1)
  (let ((n391 (concat MB8 n389))) ; (bitvector 9)
  (let ((MB9 (ALU54B_Inputs-MB9 inputs))) ; (bitvector 1)
  (let ((n393 (concat MB9 n391))) ; (bitvector 10)
  (let ((MB10 (ALU54B_Inputs-MB10 inputs))) ; (bitvector 1)
  (let ((n395 (concat MB10 n393))) ; (bitvector 11)
  (let ((MB11 (ALU54B_Inputs-MB11 inputs))) ; (bitvector 1)
  (let ((n397 (concat MB11 n395))) ; (bitvector 12)
  (let ((MB12 (ALU54B_Inputs-MB12 inputs))) ; (bitvector 1)
  (let ((n399 (concat MB12 n397))) ; (bitvector 13)
  (let ((MB13 (ALU54B_Inputs-MB13 inputs))) ; (bitvector 1)
  (let ((n401 (concat MB13 n399))) ; (bitvector 14)
  (let ((MB14 (ALU54B_Inputs-MB14 inputs))) ; (bitvector 1)
  (let ((n403 (concat MB14 n401))) ; (bitvector 15)
  (let ((MB15 (ALU54B_Inputs-MB15 inputs))) ; (bitvector 1)
  (let ((n405 (concat MB15 n403))) ; (bitvector 16)
  (let ((MB16 (ALU54B_Inputs-MB16 inputs))) ; (bitvector 1)
  (let ((n407 (concat MB16 n405))) ; (bitvector 17)
  (let ((MB17 (ALU54B_Inputs-MB17 inputs))) ; (bitvector 1)
  (let ((n409 (concat MB17 n407))) ; (bitvector 18)
  (let ((MB18 (ALU54B_Inputs-MB18 inputs))) ; (bitvector 1)
  (let ((n411 (concat MB18 n409))) ; (bitvector 19)
  (let ((MB19 (ALU54B_Inputs-MB19 inputs))) ; (bitvector 1)
  (let ((n413 (concat MB19 n411))) ; (bitvector 20)
  (let ((MB20 (ALU54B_Inputs-MB20 inputs))) ; (bitvector 1)
  (let ((n415 (concat MB20 n413))) ; (bitvector 21)
  (let ((MB21 (ALU54B_Inputs-MB21 inputs))) ; (bitvector 1)
  (let ((n417 (concat MB21 n415))) ; (bitvector 22)
  (let ((MB22 (ALU54B_Inputs-MB22 inputs))) ; (bitvector 1)
  (let ((n419 (concat MB22 n417))) ; (bitvector 23)
  (let ((MB23 (ALU54B_Inputs-MB23 inputs))) ; (bitvector 1)
  (let ((n421 (concat MB23 n419))) ; (bitvector 24)
  (let ((MB24 (ALU54B_Inputs-MB24 inputs))) ; (bitvector 1)
  (let ((n423 (concat MB24 n421))) ; (bitvector 25)
  (let ((MB25 (ALU54B_Inputs-MB25 inputs))) ; (bitvector 1)
  (let ((n425 (concat MB25 n423))) ; (bitvector 26)
  (let ((MB26 (ALU54B_Inputs-MB26 inputs))) ; (bitvector 1)
  (let ((n427 (concat MB26 n425))) ; (bitvector 27)
  (let ((MB27 (ALU54B_Inputs-MB27 inputs))) ; (bitvector 1)
  (let ((n429 (concat MB27 n427))) ; (bitvector 28)
  (let ((MB28 (ALU54B_Inputs-MB28 inputs))) ; (bitvector 1)
  (let ((n431 (concat MB28 n429))) ; (bitvector 29)
  (let ((MB29 (ALU54B_Inputs-MB29 inputs))) ; (bitvector 1)
  (let ((n433 (concat MB29 n431))) ; (bitvector 30)
  (let ((MB30 (ALU54B_Inputs-MB30 inputs))) ; (bitvector 1)
  (let ((n435 (concat MB30 n433))) ; (bitvector 31)
  (let ((MB31 (ALU54B_Inputs-MB31 inputs))) ; (bitvector 1)
  (let ((n437 (concat MB31 n435))) ; (bitvector 32)
  (let ((MB32 (ALU54B_Inputs-MB32 inputs))) ; (bitvector 1)
  (let ((n439 (concat MB32 n437))) ; (bitvector 33)
  (let ((MB33 (ALU54B_Inputs-MB33 inputs))) ; (bitvector 1)
  (let ((n441 (concat MB33 n439))) ; (bitvector 34)
  (let ((MB34 (ALU54B_Inputs-MB34 inputs))) ; (bitvector 1)
  (let ((n443 (concat MB34 n441))) ; (bitvector 35)
  (let ((MB35 (ALU54B_Inputs-MB35 inputs))) ; (bitvector 1)
  (let ((n445 (concat MB35 n443))) ; (bitvector 36)
  (let ((n447 (concat MB35 MB35))) ; (bitvector 2)
  (let ((n448 (concat MB35 n447))) ; (bitvector 3)
  (let ((n449 (concat MB35 n448))) ; (bitvector 4)
  (let ((n450 (concat MB35 n449))) ; (bitvector 5)
  (let ((n451 (concat MB35 n450))) ; (bitvector 6)
  (let ((n452 (concat MB35 n451))) ; (bitvector 7)
  (let ((n453 (concat MB35 n452))) ; (bitvector 8)
  (let ((n454 (concat MB35 n453))) ; (bitvector 9)
  (let ((n455 (concat MB35 n454))) ; (bitvector 10)
  (let ((n456 (concat MB35 n455))) ; (bitvector 11)
  (let ((n457 (concat MB35 n456))) ; (bitvector 12)
  (let ((n458 (concat MB35 n457))) ; (bitvector 13)
  (let ((n459 (concat MB35 n458))) ; (bitvector 14)
  (let ((n460 (concat MB35 n459))) ; (bitvector 15)
  (let ((n461 (concat MB35 n460))) ; (bitvector 16)
  (let ((n462 (concat MB35 n461))) ; (bitvector 17)
  (let ((n463 (concat MB35 n462))) ; (bitvector 18)
  (let ((n464 (concat MB35 n463))) ; (bitvector 19)
  (let
    (($procmux$416$_Y
      (if (bitvector->bool SIGNEDIB) n464 (bv #b0000000000000000000 19)))) ; (bitvector 19)
  (let ((n466 (concat $procmux$416$_Y n445))) ; (bitvector 55)
  (let ((n467 (concat MB1 MB0))) ; (bitvector 2)
  (let ((n468 (concat MB2 n467))) ; (bitvector 3)
  (let ((n469 (concat MB3 n468))) ; (bitvector 4)
  (let ((n470 (concat MB4 n469))) ; (bitvector 5)
  (let ((n471 (concat MB5 n470))) ; (bitvector 6)
  (let ((n472 (concat MB6 n471))) ; (bitvector 7)
  (let ((n473 (concat MB7 n472))) ; (bitvector 8)
  (let ((n474 (concat MB8 n473))) ; (bitvector 9)
  (let ((n475 (concat MB9 n474))) ; (bitvector 10)
  (let ((n476 (concat MB10 n475))) ; (bitvector 11)
  (let ((n477 (concat MB11 n476))) ; (bitvector 12)
  (let ((n478 (concat MB12 n477))) ; (bitvector 13)
  (let ((n479 (concat MB13 n478))) ; (bitvector 14)
  (let ((n480 (concat MB14 n479))) ; (bitvector 15)
  (let ((n481 (concat MB15 n480))) ; (bitvector 16)
  (let ((n482 (concat MB16 n481))) ; (bitvector 17)
  (let ((n483 (concat MB17 n482))) ; (bitvector 18)
  (let ((n484 (concat MB17 MB17))) ; (bitvector 2)
  (let ((n485 (concat MB17 n484))) ; (bitvector 3)
  (let ((n486 (concat MB17 n485))) ; (bitvector 4)
  (let ((n487 (concat MB17 n486))) ; (bitvector 5)
  (let ((n488 (concat MB17 n487))) ; (bitvector 6)
  (let ((n489 (concat MB17 n488))) ; (bitvector 7)
  (let
    (($procmux$449$_Y (if (bitvector->bool SIGNEDIB) n489 (bv #b0000000 7)))) ; (bitvector 7)
  (let ((n491 (concat $procmux$449$_Y n483))) ; (bitvector 25)
  (let ((op7_sig_gen_1 (bvxor op7_sig_1_sync_pos op7_sig_1_sync_neg))) ; (bitvector 1)
  (let ((n493 (concat op7_sig_gen_1 n491))) ; (bitvector 26)
  (let ((n494 (concat op7_sig_gen_1 n493))) ; (bitvector 27)
  (let ((n495 (concat (bv #b0 1) n494))) ; (bitvector 28)
  (let ((n496 (concat MB18 n495))) ; (bitvector 29)
  (let ((n497 (concat MB19 n496))) ; (bitvector 30)
  (let ((n498 (concat MB20 n497))) ; (bitvector 31)
  (let ((n499 (concat MB21 n498))) ; (bitvector 32)
  (let ((n500 (concat MB22 n499))) ; (bitvector 33)
  (let ((n501 (concat MB23 n500))) ; (bitvector 34)
  (let ((n502 (concat MB24 n501))) ; (bitvector 35)
  (let ((n503 (concat MB25 n502))) ; (bitvector 36)
  (let ((n504 (concat MB26 n503))) ; (bitvector 37)
  (let ((n505 (concat MB27 n504))) ; (bitvector 38)
  (let ((n506 (concat MB28 n505))) ; (bitvector 39)
  (let ((n507 (concat MB29 n506))) ; (bitvector 40)
  (let ((n508 (concat MB30 n507))) ; (bitvector 41)
  (let ((n509 (concat MB31 n508))) ; (bitvector 42)
  (let ((n510 (concat MB32 n509))) ; (bitvector 43)
  (let ((n511 (concat MB33 n510))) ; (bitvector 44)
  (let ((n512 (concat MB34 n511))) ; (bitvector 45)
  (let ((n513 (concat MB35 n512))) ; (bitvector 46)
  (let ((n515 (concat MB35 MB35))) ; (bitvector 2)
  (let ((n516 (concat MB35 n515))) ; (bitvector 3)
  (let ((n517 (concat MB35 n516))) ; (bitvector 4)
  (let ((n518 (concat MB35 n517))) ; (bitvector 5)
  (let ((n519 (concat MB35 n518))) ; (bitvector 6)
  (let ((n520 (concat MB35 n519))) ; (bitvector 7)
  (let ((n521 (concat MB35 n520))) ; (bitvector 8)
  (let ((n522 (concat MB35 n521))) ; (bitvector 9)
  (let
    (($procmux$428$_Y (if (bitvector->bool SIGNEDIB) n522 (bv #b000000000 9)))) ; (bitvector 9)
  (let ((n524 (concat $procmux$428$_Y n513))) ; (bitvector 55)
  (let ((MULT9_MODE (ALU54B_Inputs-MULT9_MODE inputs))) ; (bitvector 5)
  (let ((n527 (zero-extend (bv #b11 2) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_1808$130$_Y
      (bool->bitvector (bveq MULT9_MODE n527)))) ; (bitvector 1)
  (let
    ((mb_sig_m
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_1808$130$_Y)
        n524
        n466))) ; (bitvector 55)
  (let ((n530 (concat mb_sig_m n374))) ; (bitvector 165)
  (let ((n532 (concat (bv #b000000000000000000 18) n530))) ; (bitvector 183)
  (let ((n533 (concat MB0 n532))) ; (bitvector 184)
  (let ((n534 (concat MB1 n533))) ; (bitvector 185)
  (let ((n535 (concat MB2 n534))) ; (bitvector 186)
  (let ((n536 (concat MB3 n535))) ; (bitvector 187)
  (let ((n537 (concat MB4 n536))) ; (bitvector 188)
  (let ((n538 (concat MB5 n537))) ; (bitvector 189)
  (let ((n539 (concat MB6 n538))) ; (bitvector 190)
  (let ((n540 (concat MB7 n539))) ; (bitvector 191)
  (let ((n541 (concat MB8 n540))) ; (bitvector 192)
  (let ((n542 (concat MB9 n541))) ; (bitvector 193)
  (let ((n543 (concat MB10 n542))) ; (bitvector 194)
  (let ((n544 (concat MB11 n543))) ; (bitvector 195)
  (let ((n545 (concat MB12 n544))) ; (bitvector 196)
  (let ((n546 (concat MB13 n545))) ; (bitvector 197)
  (let ((n547 (concat MB14 n546))) ; (bitvector 198)
  (let ((n548 (concat MB15 n547))) ; (bitvector 199)
  (let ((n549 (concat MB16 n548))) ; (bitvector 200)
  (let ((n550 (concat MB17 n549))) ; (bitvector 201)
  (let ((n551 (concat MB18 n550))) ; (bitvector 202)
  (let ((n552 (concat MB19 n551))) ; (bitvector 203)
  (let ((n553 (concat MB20 n552))) ; (bitvector 204)
  (let ((n554 (concat MB21 n553))) ; (bitvector 205)
  (let ((n555 (concat MB22 n554))) ; (bitvector 206)
  (let ((n556 (concat MB23 n555))) ; (bitvector 207)
  (let ((n557 (concat MB24 n556))) ; (bitvector 208)
  (let ((n558 (concat MB25 n557))) ; (bitvector 209)
  (let ((n559 (concat MB26 n558))) ; (bitvector 210)
  (let ((n560 (concat MB27 n559))) ; (bitvector 211)
  (let ((n561 (concat MB28 n560))) ; (bitvector 212)
  (let ((n562 (concat MB29 n561))) ; (bitvector 213)
  (let ((n563 (concat MB30 n562))) ; (bitvector 214)
  (let ((n564 (concat MB31 n563))) ; (bitvector 215)
  (let ((n565 (concat MB32 n564))) ; (bitvector 216)
  (let ((n566 (concat MB33 n565))) ; (bitvector 217)
  (let ((n567 (concat MB34 n566))) ; (bitvector 218)
  (let ((n568 (concat MB35 n567))) ; (bitvector 219)
  (let ((n569 (concat (bv #b0 1) n568))) ; (bitvector 220)
  (let ((n570 (extract 54 0 n569))) ; (bitvector 55)
  (let ((opin_sig_1_reg (bvxor opin_sig_1_sync_pos opin_sig_1_sync_neg))) ; (bitvector 7)
  (let ((n572 (extract 3 2 opin_sig_1_reg))) ; (bitvector 2)
  (let (($procmux$406_CMP (bool->bitvector (bveq n572 (bv #b11 2))))) ; (bitvector 1)
  (let (($procmux$407_CMP (bool->bitvector (bveq n572 (bv #b10 2))))) ; (bitvector 1)
  (let ((n575 (concat $procmux$407_CMP $procmux$406_CMP))) ; (bitvector 2)
  (let ((n577 (zero-extend (bv #b1 1) (bitvector 2)))) ; (bitvector 2)
  (let (($procmux$408_CMP (bool->bitvector (bveq n572 n577)))) ; (bitvector 1)
  (let ((n579 (concat $procmux$408_CMP n575))) ; (bitvector 3)
  (let ((n580 (apply bvor (bitvector->bits n572)))) ; (bitvector 1)
  (let (($procmux$409_CMP (bvnot n580))) ; (bitvector 1)
  (let ((n582 (concat $procmux$409_CMP n579))) ; (bitvector 4)
  (let ((n583 (extract 0 0 n582))) ; (bitvector 1)
  (let
    ((n584
      (if
        (bitvector->bool n583)
        n570
        (bv #b0000000000000000000000000000000000000000000000000000000 55)))) ; (bitvector 55)
  (let ((n585 (extract 109 55 n569))) ; (bitvector 55)
  (let ((n586 (extract 1 1 n582))) ; (bitvector 1)
  (let ((n587 (if (bitvector->bool n586) n585 n584))) ; (bitvector 55)
  (let ((n588 (extract 164 110 n569))) ; (bitvector 55)
  (let ((n589 (extract 2 2 n582))) ; (bitvector 1)
  (let ((n590 (if (bitvector->bool n589) n588 n587))) ; (bitvector 55)
  (let ((n591 (extract 219 165 n569))) ; (bitvector 55)
  (let ((n592 (extract 3 3 n582))) ; (bitvector 1)
  (let ((b_mux (if (bitvector->bool n592) n591 n590))) ; (bitvector 55)
  (let ((RNDPAT (ALU54B_Inputs-RNDPAT inputs))) ; (bitvector 56)
  (let ((n595 (extract 53 0 RNDPAT))) ; (bitvector 54)
  (let ((n596 (zero-extend (bv #b1 1) (bitvector 54)))) ; (bitvector 54)
  (let ((rnd_pattern_m1 (bvsub n595 n596))) ; (bitvector 54)
  (let ((n598 (concat (bv #b0 1) rnd_pattern_m1))) ; (bitvector 55)
  (let ((n599 (concat n595 n598))) ; (bitvector 109)
  (let ((n600 (concat (bv #b0 1) n599))) ; (bitvector 110)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$909$_Q
      (ALU54B_State-$auto$clk2fflogic.cc_102_sample_data$909 state))) ; (bitvector 18)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$911$_Q
      (ALU54B_State-$auto$clk2fflogic.cc_102_sample_data$911 state))) ; (bitvector 18)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_CLK0_sampled$912
      (ALU54B_State-$auto$clk2fflogic.cc_86_sample_control_edge$913 state))) ; (bitvector 1)
  (let
    ((n604
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_CLK0_sampled$912
        CLK0))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$914$_Y
      (bool->bitvector (bveq n604 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((r_out_lsb_sync
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$914$_Y)
        $auto$clk2fflogic.cc_102_sample_data$911$_Q
        $auto$clk2fflogic.cc_102_sample_data$909$_Q))) ; (bitvector 18)
  (let ((n607 (concat r_out_lsb_sync n600))) ; (bitvector 128)
  (let ((r_out_msb (bvxor r_out_msb_sync_pos r_out_msb_sync_neg))) ; (bitvector 37)
  (let ((n609 (concat r_out_msb n607))) ; (bitvector 165)
  (let ((A0 (ALU54B_Inputs-A0 inputs))) ; (bitvector 1)
  (let ((n611 (concat A0 n609))) ; (bitvector 166)
  (let ((A1 (ALU54B_Inputs-A1 inputs))) ; (bitvector 1)
  (let ((n613 (concat A1 n611))) ; (bitvector 167)
  (let ((A2 (ALU54B_Inputs-A2 inputs))) ; (bitvector 1)
  (let ((n615 (concat A2 n613))) ; (bitvector 168)
  (let ((A3 (ALU54B_Inputs-A3 inputs))) ; (bitvector 1)
  (let ((n617 (concat A3 n615))) ; (bitvector 169)
  (let ((A4 (ALU54B_Inputs-A4 inputs))) ; (bitvector 1)
  (let ((n619 (concat A4 n617))) ; (bitvector 170)
  (let ((A5 (ALU54B_Inputs-A5 inputs))) ; (bitvector 1)
  (let ((n621 (concat A5 n619))) ; (bitvector 171)
  (let ((A6 (ALU54B_Inputs-A6 inputs))) ; (bitvector 1)
  (let ((n623 (concat A6 n621))) ; (bitvector 172)
  (let ((A7 (ALU54B_Inputs-A7 inputs))) ; (bitvector 1)
  (let ((n625 (concat A7 n623))) ; (bitvector 173)
  (let ((A8 (ALU54B_Inputs-A8 inputs))) ; (bitvector 1)
  (let ((n627 (concat A8 n625))) ; (bitvector 174)
  (let ((A9 (ALU54B_Inputs-A9 inputs))) ; (bitvector 1)
  (let ((n629 (concat A9 n627))) ; (bitvector 175)
  (let ((A10 (ALU54B_Inputs-A10 inputs))) ; (bitvector 1)
  (let ((n631 (concat A10 n629))) ; (bitvector 176)
  (let ((A11 (ALU54B_Inputs-A11 inputs))) ; (bitvector 1)
  (let ((n633 (concat A11 n631))) ; (bitvector 177)
  (let ((A12 (ALU54B_Inputs-A12 inputs))) ; (bitvector 1)
  (let ((n635 (concat A12 n633))) ; (bitvector 178)
  (let ((A13 (ALU54B_Inputs-A13 inputs))) ; (bitvector 1)
  (let ((n637 (concat A13 n635))) ; (bitvector 179)
  (let ((A14 (ALU54B_Inputs-A14 inputs))) ; (bitvector 1)
  (let ((n639 (concat A14 n637))) ; (bitvector 180)
  (let ((A15 (ALU54B_Inputs-A15 inputs))) ; (bitvector 1)
  (let ((n641 (concat A15 n639))) ; (bitvector 181)
  (let ((A16 (ALU54B_Inputs-A16 inputs))) ; (bitvector 1)
  (let ((n643 (concat A16 n641))) ; (bitvector 182)
  (let ((A17 (ALU54B_Inputs-A17 inputs))) ; (bitvector 1)
  (let ((n645 (concat A17 n643))) ; (bitvector 183)
  (let ((A18 (ALU54B_Inputs-A18 inputs))) ; (bitvector 1)
  (let ((n647 (concat A18 n645))) ; (bitvector 184)
  (let ((A19 (ALU54B_Inputs-A19 inputs))) ; (bitvector 1)
  (let ((n649 (concat A19 n647))) ; (bitvector 185)
  (let ((A20 (ALU54B_Inputs-A20 inputs))) ; (bitvector 1)
  (let ((n651 (concat A20 n649))) ; (bitvector 186)
  (let ((A21 (ALU54B_Inputs-A21 inputs))) ; (bitvector 1)
  (let ((n653 (concat A21 n651))) ; (bitvector 187)
  (let ((A22 (ALU54B_Inputs-A22 inputs))) ; (bitvector 1)
  (let ((n655 (concat A22 n653))) ; (bitvector 188)
  (let ((A23 (ALU54B_Inputs-A23 inputs))) ; (bitvector 1)
  (let ((n657 (concat A23 n655))) ; (bitvector 189)
  (let ((A24 (ALU54B_Inputs-A24 inputs))) ; (bitvector 1)
  (let ((n659 (concat A24 n657))) ; (bitvector 190)
  (let ((A25 (ALU54B_Inputs-A25 inputs))) ; (bitvector 1)
  (let ((n661 (concat A25 n659))) ; (bitvector 191)
  (let ((A26 (ALU54B_Inputs-A26 inputs))) ; (bitvector 1)
  (let ((n663 (concat A26 n661))) ; (bitvector 192)
  (let ((A27 (ALU54B_Inputs-A27 inputs))) ; (bitvector 1)
  (let ((n665 (concat A27 n663))) ; (bitvector 193)
  (let ((A28 (ALU54B_Inputs-A28 inputs))) ; (bitvector 1)
  (let ((n667 (concat A28 n665))) ; (bitvector 194)
  (let ((A29 (ALU54B_Inputs-A29 inputs))) ; (bitvector 1)
  (let ((n669 (concat A29 n667))) ; (bitvector 195)
  (let ((A30 (ALU54B_Inputs-A30 inputs))) ; (bitvector 1)
  (let ((n671 (concat A30 n669))) ; (bitvector 196)
  (let ((A31 (ALU54B_Inputs-A31 inputs))) ; (bitvector 1)
  (let ((n673 (concat A31 n671))) ; (bitvector 197)
  (let ((A32 (ALU54B_Inputs-A32 inputs))) ; (bitvector 1)
  (let ((n675 (concat A32 n673))) ; (bitvector 198)
  (let ((A33 (ALU54B_Inputs-A33 inputs))) ; (bitvector 1)
  (let ((n677 (concat A33 n675))) ; (bitvector 199)
  (let ((A34 (ALU54B_Inputs-A34 inputs))) ; (bitvector 1)
  (let ((n679 (concat A34 n677))) ; (bitvector 200)
  (let ((A35 (ALU54B_Inputs-A35 inputs))) ; (bitvector 1)
  (let ((n681 (concat A35 n679))) ; (bitvector 201)
  (let ((n682 (extract 17 0 c_sig_sync0))) ; (bitvector 18)
  (let ((n683 (concat n682 n681))) ; (bitvector 219)
  (let ((n684 (extract 17 17 c_sig_sync0))) ; (bitvector 1)
  (let
    (($and$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_1952$140$_Y
      (bvand signedr_sig n684))) ; (bitvector 1)
  (let
    ((n686
      (concat
        $and$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_1952$140$_Y
        n683))) ; (bitvector 220)
  (let ((n687 (concat c_sig_sync0 n686))) ; (bitvector 247)
  (let ((n688 (concat c_sig_sync1 n687))) ; (bitvector 274)
  (let ((n689 (extract 26 26 c_sig_sync1))) ; (bitvector 1)
  (let
    (($and$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2003$146$_Y
      (bvand n689 signedr_sig))) ; (bitvector 1)
  (let
    ((n691
      (concat
        $and$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2003$146$_Y
        n688))) ; (bitvector 275)
  (let ((CIN0 (ALU54B_Inputs-CIN0 inputs))) ; (bitvector 1)
  (let ((n693 (concat CIN0 n691))) ; (bitvector 276)
  (let ((CIN1 (ALU54B_Inputs-CIN1 inputs))) ; (bitvector 1)
  (let ((n695 (concat CIN1 n693))) ; (bitvector 277)
  (let ((CIN2 (ALU54B_Inputs-CIN2 inputs))) ; (bitvector 1)
  (let ((n697 (concat CIN2 n695))) ; (bitvector 278)
  (let ((CIN3 (ALU54B_Inputs-CIN3 inputs))) ; (bitvector 1)
  (let ((n699 (concat CIN3 n697))) ; (bitvector 279)
  (let ((CIN4 (ALU54B_Inputs-CIN4 inputs))) ; (bitvector 1)
  (let ((n701 (concat CIN4 n699))) ; (bitvector 280)
  (let ((CIN5 (ALU54B_Inputs-CIN5 inputs))) ; (bitvector 1)
  (let ((n703 (concat CIN5 n701))) ; (bitvector 281)
  (let ((CIN6 (ALU54B_Inputs-CIN6 inputs))) ; (bitvector 1)
  (let ((n705 (concat CIN6 n703))) ; (bitvector 282)
  (let ((CIN7 (ALU54B_Inputs-CIN7 inputs))) ; (bitvector 1)
  (let ((n707 (concat CIN7 n705))) ; (bitvector 283)
  (let ((CIN8 (ALU54B_Inputs-CIN8 inputs))) ; (bitvector 1)
  (let ((n709 (concat CIN8 n707))) ; (bitvector 284)
  (let ((CIN9 (ALU54B_Inputs-CIN9 inputs))) ; (bitvector 1)
  (let ((n711 (concat CIN9 n709))) ; (bitvector 285)
  (let ((CIN10 (ALU54B_Inputs-CIN10 inputs))) ; (bitvector 1)
  (let ((n713 (concat CIN10 n711))) ; (bitvector 286)
  (let ((CIN11 (ALU54B_Inputs-CIN11 inputs))) ; (bitvector 1)
  (let ((n715 (concat CIN11 n713))) ; (bitvector 287)
  (let ((CIN12 (ALU54B_Inputs-CIN12 inputs))) ; (bitvector 1)
  (let ((n717 (concat CIN12 n715))) ; (bitvector 288)
  (let ((CIN13 (ALU54B_Inputs-CIN13 inputs))) ; (bitvector 1)
  (let ((n719 (concat CIN13 n717))) ; (bitvector 289)
  (let ((CIN14 (ALU54B_Inputs-CIN14 inputs))) ; (bitvector 1)
  (let ((n721 (concat CIN14 n719))) ; (bitvector 290)
  (let ((CIN15 (ALU54B_Inputs-CIN15 inputs))) ; (bitvector 1)
  (let ((n723 (concat CIN15 n721))) ; (bitvector 291)
  (let ((CIN16 (ALU54B_Inputs-CIN16 inputs))) ; (bitvector 1)
  (let ((n725 (concat CIN16 n723))) ; (bitvector 292)
  (let ((CIN17 (ALU54B_Inputs-CIN17 inputs))) ; (bitvector 1)
  (let ((n727 (concat CIN17 n725))) ; (bitvector 293)
  (let ((CIN18 (ALU54B_Inputs-CIN18 inputs))) ; (bitvector 1)
  (let ((n729 (concat CIN18 n727))) ; (bitvector 294)
  (let ((CIN19 (ALU54B_Inputs-CIN19 inputs))) ; (bitvector 1)
  (let ((n731 (concat CIN19 n729))) ; (bitvector 295)
  (let ((CIN20 (ALU54B_Inputs-CIN20 inputs))) ; (bitvector 1)
  (let ((n733 (concat CIN20 n731))) ; (bitvector 296)
  (let ((CIN21 (ALU54B_Inputs-CIN21 inputs))) ; (bitvector 1)
  (let ((n735 (concat CIN21 n733))) ; (bitvector 297)
  (let ((CIN22 (ALU54B_Inputs-CIN22 inputs))) ; (bitvector 1)
  (let ((n737 (concat CIN22 n735))) ; (bitvector 298)
  (let ((CIN23 (ALU54B_Inputs-CIN23 inputs))) ; (bitvector 1)
  (let ((n739 (concat CIN23 n737))) ; (bitvector 299)
  (let ((CIN24 (ALU54B_Inputs-CIN24 inputs))) ; (bitvector 1)
  (let ((n741 (concat CIN24 n739))) ; (bitvector 300)
  (let ((CIN25 (ALU54B_Inputs-CIN25 inputs))) ; (bitvector 1)
  (let ((n743 (concat CIN25 n741))) ; (bitvector 301)
  (let ((CIN26 (ALU54B_Inputs-CIN26 inputs))) ; (bitvector 1)
  (let ((n745 (concat CIN26 n743))) ; (bitvector 302)
  (let ((CIN27 (ALU54B_Inputs-CIN27 inputs))) ; (bitvector 1)
  (let ((n747 (concat CIN27 n745))) ; (bitvector 303)
  (let ((CIN28 (ALU54B_Inputs-CIN28 inputs))) ; (bitvector 1)
  (let ((n749 (concat CIN28 n747))) ; (bitvector 304)
  (let ((CIN29 (ALU54B_Inputs-CIN29 inputs))) ; (bitvector 1)
  (let ((n751 (concat CIN29 n749))) ; (bitvector 305)
  (let ((CIN30 (ALU54B_Inputs-CIN30 inputs))) ; (bitvector 1)
  (let ((n753 (concat CIN30 n751))) ; (bitvector 306)
  (let ((CIN31 (ALU54B_Inputs-CIN31 inputs))) ; (bitvector 1)
  (let ((n755 (concat CIN31 n753))) ; (bitvector 307)
  (let ((CIN32 (ALU54B_Inputs-CIN32 inputs))) ; (bitvector 1)
  (let ((n757 (concat CIN32 n755))) ; (bitvector 308)
  (let ((CIN33 (ALU54B_Inputs-CIN33 inputs))) ; (bitvector 1)
  (let ((n759 (concat CIN33 n757))) ; (bitvector 309)
  (let ((CIN34 (ALU54B_Inputs-CIN34 inputs))) ; (bitvector 1)
  (let ((n761 (concat CIN34 n759))) ; (bitvector 310)
  (let ((CIN35 (ALU54B_Inputs-CIN35 inputs))) ; (bitvector 1)
  (let ((n763 (concat CIN35 n761))) ; (bitvector 311)
  (let ((CIN36 (ALU54B_Inputs-CIN36 inputs))) ; (bitvector 1)
  (let ((n765 (concat CIN36 n763))) ; (bitvector 312)
  (let ((CIN37 (ALU54B_Inputs-CIN37 inputs))) ; (bitvector 1)
  (let ((n767 (concat CIN37 n765))) ; (bitvector 313)
  (let ((CIN38 (ALU54B_Inputs-CIN38 inputs))) ; (bitvector 1)
  (let ((n769 (concat CIN38 n767))) ; (bitvector 314)
  (let ((CIN39 (ALU54B_Inputs-CIN39 inputs))) ; (bitvector 1)
  (let ((n771 (concat CIN39 n769))) ; (bitvector 315)
  (let ((CIN40 (ALU54B_Inputs-CIN40 inputs))) ; (bitvector 1)
  (let ((n773 (concat CIN40 n771))) ; (bitvector 316)
  (let ((CIN41 (ALU54B_Inputs-CIN41 inputs))) ; (bitvector 1)
  (let ((n775 (concat CIN41 n773))) ; (bitvector 317)
  (let ((CIN42 (ALU54B_Inputs-CIN42 inputs))) ; (bitvector 1)
  (let ((n777 (concat CIN42 n775))) ; (bitvector 318)
  (let ((CIN43 (ALU54B_Inputs-CIN43 inputs))) ; (bitvector 1)
  (let ((n779 (concat CIN43 n777))) ; (bitvector 319)
  (let ((CIN44 (ALU54B_Inputs-CIN44 inputs))) ; (bitvector 1)
  (let ((n781 (concat CIN44 n779))) ; (bitvector 320)
  (let ((CIN45 (ALU54B_Inputs-CIN45 inputs))) ; (bitvector 1)
  (let ((n783 (concat CIN45 n781))) ; (bitvector 321)
  (let ((CIN46 (ALU54B_Inputs-CIN46 inputs))) ; (bitvector 1)
  (let ((n785 (concat CIN46 n783))) ; (bitvector 322)
  (let ((CIN47 (ALU54B_Inputs-CIN47 inputs))) ; (bitvector 1)
  (let ((n787 (concat CIN47 n785))) ; (bitvector 323)
  (let ((CIN48 (ALU54B_Inputs-CIN48 inputs))) ; (bitvector 1)
  (let ((n789 (concat CIN48 n787))) ; (bitvector 324)
  (let ((CIN49 (ALU54B_Inputs-CIN49 inputs))) ; (bitvector 1)
  (let ((n791 (concat CIN49 n789))) ; (bitvector 325)
  (let ((CIN50 (ALU54B_Inputs-CIN50 inputs))) ; (bitvector 1)
  (let ((n793 (concat CIN50 n791))) ; (bitvector 326)
  (let ((CIN51 (ALU54B_Inputs-CIN51 inputs))) ; (bitvector 1)
  (let ((n795 (concat CIN51 n793))) ; (bitvector 327)
  (let ((CIN52 (ALU54B_Inputs-CIN52 inputs))) ; (bitvector 1)
  (let ((n797 (concat CIN52 n795))) ; (bitvector 328)
  (let ((CIN53 (ALU54B_Inputs-CIN53 inputs))) ; (bitvector 1)
  (let ((n799 (concat CIN53 n797))) ; (bitvector 329)
  (let ((SIGNEDCIN (ALU54B_Inputs-SIGNEDCIN inputs))) ; (bitvector 1)
  (let ((n801 (concat SIGNEDCIN n799))) ; (bitvector 330)
  (let ((n802 (concat CIN18 n801))) ; (bitvector 331)
  (let ((n803 (concat CIN19 n802))) ; (bitvector 332)
  (let ((n804 (concat CIN20 n803))) ; (bitvector 333)
  (let ((n805 (concat CIN21 n804))) ; (bitvector 334)
  (let ((n806 (concat CIN22 n805))) ; (bitvector 335)
  (let ((n807 (concat CIN23 n806))) ; (bitvector 336)
  (let ((n808 (concat CIN24 n807))) ; (bitvector 337)
  (let ((n809 (concat CIN25 n808))) ; (bitvector 338)
  (let ((n810 (concat CIN26 n809))) ; (bitvector 339)
  (let ((n811 (concat CIN27 n810))) ; (bitvector 340)
  (let ((n812 (concat CIN28 n811))) ; (bitvector 341)
  (let ((n813 (concat CIN29 n812))) ; (bitvector 342)
  (let ((n814 (concat CIN30 n813))) ; (bitvector 343)
  (let ((n815 (concat CIN31 n814))) ; (bitvector 344)
  (let ((n816 (concat CIN32 n815))) ; (bitvector 345)
  (let ((n817 (concat CIN33 n816))) ; (bitvector 346)
  (let ((n818 (concat CIN34 n817))) ; (bitvector 347)
  (let ((n819 (concat CIN35 n818))) ; (bitvector 348)
  (let ((n820 (concat CIN36 n819))) ; (bitvector 349)
  (let ((n821 (concat CIN37 n820))) ; (bitvector 350)
  (let ((n822 (concat CIN38 n821))) ; (bitvector 351)
  (let ((n823 (concat CIN39 n822))) ; (bitvector 352)
  (let ((n824 (concat CIN40 n823))) ; (bitvector 353)
  (let ((n825 (concat CIN41 n824))) ; (bitvector 354)
  (let ((n826 (concat CIN42 n825))) ; (bitvector 355)
  (let ((n827 (concat CIN43 n826))) ; (bitvector 356)
  (let ((n828 (concat CIN44 n827))) ; (bitvector 357)
  (let ((n829 (concat CIN45 n828))) ; (bitvector 358)
  (let ((n830 (concat CIN46 n829))) ; (bitvector 359)
  (let ((n831 (concat CIN47 n830))) ; (bitvector 360)
  (let ((n832 (concat CIN48 n831))) ; (bitvector 361)
  (let ((n833 (concat CIN49 n832))) ; (bitvector 362)
  (let ((n834 (concat CIN50 n833))) ; (bitvector 363)
  (let ((n835 (concat CIN51 n834))) ; (bitvector 364)
  (let ((n836 (concat CIN52 n835))) ; (bitvector 365)
  (let ((n837 (concat CIN53 n836))) ; (bitvector 366)
  (let ((n838 (concat CIN19 CIN18))) ; (bitvector 2)
  (let ((n839 (concat CIN20 n838))) ; (bitvector 3)
  (let ((n840 (concat CIN21 n839))) ; (bitvector 4)
  (let ((n841 (concat CIN22 n840))) ; (bitvector 5)
  (let ((n842 (concat CIN23 n841))) ; (bitvector 6)
  (let ((n843 (concat CIN24 n842))) ; (bitvector 7)
  (let ((n844 (concat CIN25 n843))) ; (bitvector 8)
  (let ((n845 (concat CIN26 n844))) ; (bitvector 9)
  (let ((n846 (concat CIN27 n845))) ; (bitvector 10)
  (let ((n847 (concat CIN28 n846))) ; (bitvector 11)
  (let ((n848 (concat CIN29 n847))) ; (bitvector 12)
  (let ((n849 (concat CIN30 n848))) ; (bitvector 13)
  (let ((n850 (concat CIN31 n849))) ; (bitvector 14)
  (let ((n851 (concat CIN32 n850))) ; (bitvector 15)
  (let ((n852 (concat CIN33 n851))) ; (bitvector 16)
  (let ((n853 (concat CIN34 n852))) ; (bitvector 17)
  (let ((n854 (concat CIN35 n853))) ; (bitvector 18)
  (let ((n855 (concat CIN36 n854))) ; (bitvector 19)
  (let ((n856 (concat CIN37 n855))) ; (bitvector 20)
  (let ((n857 (concat CIN38 n856))) ; (bitvector 21)
  (let ((n858 (concat CIN39 n857))) ; (bitvector 22)
  (let ((n859 (concat CIN40 n858))) ; (bitvector 23)
  (let ((n860 (concat CIN41 n859))) ; (bitvector 24)
  (let ((n861 (concat CIN42 n860))) ; (bitvector 25)
  (let ((n862 (concat CIN43 n861))) ; (bitvector 26)
  (let ((n863 (concat CIN44 n862))) ; (bitvector 27)
  (let ((n864 (concat CIN45 n863))) ; (bitvector 28)
  (let ((n865 (concat CIN46 n864))) ; (bitvector 29)
  (let ((n866 (concat CIN47 n865))) ; (bitvector 30)
  (let ((n867 (concat CIN48 n866))) ; (bitvector 31)
  (let ((n868 (concat CIN49 n867))) ; (bitvector 32)
  (let ((n869 (concat CIN50 n868))) ; (bitvector 33)
  (let ((n870 (concat CIN51 n869))) ; (bitvector 34)
  (let ((n871 (concat CIN52 n870))) ; (bitvector 35)
  (let ((n872 (concat CIN53 n871))) ; (bitvector 36)
  (let ((n873 (concat CIN53 CIN53))) ; (bitvector 2)
  (let ((n874 (concat CIN53 n873))) ; (bitvector 3)
  (let ((n875 (concat CIN53 n874))) ; (bitvector 4)
  (let ((n876 (concat CIN53 n875))) ; (bitvector 5)
  (let ((n877 (concat CIN53 n876))) ; (bitvector 6)
  (let ((n878 (concat CIN53 n877))) ; (bitvector 7)
  (let ((n879 (concat CIN53 n878))) ; (bitvector 8)
  (let ((n880 (concat CIN53 n879))) ; (bitvector 9)
  (let ((n881 (concat CIN53 n880))) ; (bitvector 10)
  (let ((n882 (concat CIN53 n881))) ; (bitvector 11)
  (let ((n883 (concat CIN53 n882))) ; (bitvector 12)
  (let ((n884 (concat CIN53 n883))) ; (bitvector 13)
  (let ((n885 (concat CIN53 n884))) ; (bitvector 14)
  (let ((n886 (concat CIN53 n885))) ; (bitvector 15)
  (let ((n887 (concat CIN53 n886))) ; (bitvector 16)
  (let ((n888 (concat CIN53 n887))) ; (bitvector 17)
  (let ((n889 (concat CIN53 n888))) ; (bitvector 18)
  (let ((n890 (concat CIN53 n889))) ; (bitvector 19)
  (let
    (($procmux$401$_Y
      (if (bitvector->bool SIGNEDCIN) n890 (bv #b0000000000000000000 19)))) ; (bitvector 19)
  (let ((cin_shift_sig (concat $procmux$401$_Y n872))) ; (bitvector 55)
  (let ((n893 (extract 54 36 cin_shift_sig))) ; (bitvector 19)
  (let ((n894 (concat n893 n837))) ; (bitvector 385)
  (let
    ((n895
      (concat
        (bv #b0000000000000000000000000000000000000000000000000000000 55)
        n894))) ; (bitvector 440)
  (let ((n896 (extract 54 0 n895))) ; (bitvector 55)
  (let ((n897 (extract 6 4 opin_sig_1_reg))) ; (bitvector 3)
  (let (($procmux$392_CMP (bool->bitvector (bveq n897 (bv #b111 3))))) ; (bitvector 1)
  (let (($procmux$393_CMP (bool->bitvector (bveq n897 (bv #b110 3))))) ; (bitvector 1)
  (let ((n902 (concat $procmux$393_CMP $procmux$392_CMP))) ; (bitvector 2)
  (let (($procmux$394_CMP (bool->bitvector (bveq n897 (bv #b101 3))))) ; (bitvector 1)
  (let ((n905 (concat $procmux$394_CMP n902))) ; (bitvector 3)
  (let (($procmux$395_CMP (bool->bitvector (bveq n897 (bv #b100 3))))) ; (bitvector 1)
  (let ((n908 (concat $procmux$395_CMP n905))) ; (bitvector 4)
  (let ((n909 (zero-extend (bv #b11 2) (bitvector 3)))) ; (bitvector 3)
  (let (($procmux$396_CMP (bool->bitvector (bveq n897 n909)))) ; (bitvector 1)
  (let ((n911 (concat $procmux$396_CMP n908))) ; (bitvector 5)
  (let ((n912 (zero-extend (bv #b10 2) (bitvector 3)))) ; (bitvector 3)
  (let (($procmux$397_CMP (bool->bitvector (bveq n897 n912)))) ; (bitvector 1)
  (let ((n914 (concat $procmux$397_CMP n911))) ; (bitvector 6)
  (let ((n915 (zero-extend (bv #b1 1) (bitvector 3)))) ; (bitvector 3)
  (let (($procmux$398_CMP (bool->bitvector (bveq n897 n915)))) ; (bitvector 1)
  (let ((n917 (concat $procmux$398_CMP n914))) ; (bitvector 7)
  (let ((n918 (apply bvor (bitvector->bits n897)))) ; (bitvector 1)
  (let (($procmux$399_CMP (bvnot n918))) ; (bitvector 1)
  (let ((n920 (concat $procmux$399_CMP n917))) ; (bitvector 8)
  (let ((n921 (extract 0 0 n920))) ; (bitvector 1)
  (let
    ((n922
      (if
        (bitvector->bool n921)
        n896
        (bv #b0000000000000000000000000000000000000000000000000000000 55)))) ; (bitvector 55)
  (let ((n923 (extract 109 55 n895))) ; (bitvector 55)
  (let ((n924 (extract 1 1 n920))) ; (bitvector 1)
  (let ((n925 (if (bitvector->bool n924) n923 n922))) ; (bitvector 55)
  (let ((n926 (extract 164 110 n895))) ; (bitvector 55)
  (let ((n927 (extract 2 2 n920))) ; (bitvector 1)
  (let ((n928 (if (bitvector->bool n927) n926 n925))) ; (bitvector 55)
  (let ((n929 (extract 219 165 n895))) ; (bitvector 55)
  (let ((n930 (extract 3 3 n920))) ; (bitvector 1)
  (let ((n931 (if (bitvector->bool n930) n929 n928))) ; (bitvector 55)
  (let ((n932 (extract 274 220 n895))) ; (bitvector 55)
  (let ((n933 (extract 4 4 n920))) ; (bitvector 1)
  (let ((n934 (if (bitvector->bool n933) n932 n931))) ; (bitvector 55)
  (let ((n935 (extract 329 275 n895))) ; (bitvector 55)
  (let ((n936 (extract 5 5 n920))) ; (bitvector 1)
  (let ((n937 (if (bitvector->bool n936) n935 n934))) ; (bitvector 55)
  (let ((n938 (extract 384 330 n895))) ; (bitvector 55)
  (let ((n939 (extract 6 6 n920))) ; (bitvector 1)
  (let ((n940 (if (bitvector->bool n939) n938 n937))) ; (bitvector 55)
  (let ((n941 (extract 439 385 n895))) ; (bitvector 55)
  (let ((n942 (extract 7 7 n920))) ; (bitvector 1)
  (let ((c_mux (if (bitvector->bool n942) n941 n940))) ; (bitvector 55)
  (let
    (($or$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2047$170_Y
      (bvor b_mux c_mux))) ; (bitvector 55)
  (let
    (($not$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2051$172$_Y
      (bvnot
        $or$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2047$170_Y))) ; (bitvector 55)
  (let
    ((n946
      (concat
        $or$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2047$170_Y
        $not$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2051$172$_Y))) ; (bitvector 110)
  (let
    (($and$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2015$149$_Y
      (bvand b_mux c_mux))) ; (bitvector 55)
  (let
    ((n948
      (concat
        $and$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2015$149$_Y
        n946))) ; (bitvector 165)
  (let
    (($xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2039$168_Y
      (bvxor b_mux c_mux))) ; (bitvector 55)
  (let
    ((n950
      (concat
        $xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2039$168_Y
        n948))) ; (bitvector 220)
  (let ((n951 (bvxor b_mux c_mux))) ; (bitvector 55)
  (let
    (($xnor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2035$167_Y
      (bvnot n951))) ; (bitvector 55)
  (let
    ((n953
      (concat
        $xnor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2035$167_Y
        n950))) ; (bitvector 275)
  (let
    ((n954
      (concat
        A0
        (bv #b0000000000000000000000000000000000000000000000000000000 55)))) ; (bitvector 56)
  (let ((n955 (concat A1 n954))) ; (bitvector 57)
  (let ((n956 (concat A2 n955))) ; (bitvector 58)
  (let ((n957 (concat A3 n956))) ; (bitvector 59)
  (let ((n958 (concat A4 n957))) ; (bitvector 60)
  (let ((n959 (concat A5 n958))) ; (bitvector 61)
  (let ((n960 (concat A6 n959))) ; (bitvector 62)
  (let ((n961 (concat A7 n960))) ; (bitvector 63)
  (let ((n962 (concat A8 n961))) ; (bitvector 64)
  (let ((n963 (concat A9 n962))) ; (bitvector 65)
  (let ((n964 (concat A10 n963))) ; (bitvector 66)
  (let ((n965 (concat A11 n964))) ; (bitvector 67)
  (let ((n966 (concat A12 n965))) ; (bitvector 68)
  (let ((n967 (concat A13 n966))) ; (bitvector 69)
  (let ((n968 (concat A14 n967))) ; (bitvector 70)
  (let ((n969 (concat A15 n968))) ; (bitvector 71)
  (let ((n970 (concat A16 n969))) ; (bitvector 72)
  (let ((n971 (concat A17 n970))) ; (bitvector 73)
  (let ((n972 (concat A18 n971))) ; (bitvector 74)
  (let ((n973 (concat A19 n972))) ; (bitvector 75)
  (let ((n974 (concat A20 n973))) ; (bitvector 76)
  (let ((n975 (concat A21 n974))) ; (bitvector 77)
  (let ((n976 (concat A22 n975))) ; (bitvector 78)
  (let ((n977 (concat A23 n976))) ; (bitvector 79)
  (let ((n978 (concat A24 n977))) ; (bitvector 80)
  (let ((n979 (concat A25 n978))) ; (bitvector 81)
  (let ((n980 (concat A26 n979))) ; (bitvector 82)
  (let ((n981 (concat A27 n980))) ; (bitvector 83)
  (let ((n982 (concat A28 n981))) ; (bitvector 84)
  (let ((n983 (concat A29 n982))) ; (bitvector 85)
  (let ((n984 (concat A30 n983))) ; (bitvector 86)
  (let ((n985 (concat A31 n984))) ; (bitvector 87)
  (let ((n986 (concat A32 n985))) ; (bitvector 88)
  (let ((n987 (concat A33 n986))) ; (bitvector 89)
  (let ((n988 (concat A34 n987))) ; (bitvector 90)
  (let ((n989 (concat A35 n988))) ; (bitvector 91)
  (let ((n990 (concat n682 n989))) ; (bitvector 109)
  (let
    ((n991
      (concat
        $and$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_1952$140$_Y
        n990))) ; (bitvector 110)
  (let ((MA0 (ALU54B_Inputs-MA0 inputs))) ; (bitvector 1)
  (let ((MA1 (ALU54B_Inputs-MA1 inputs))) ; (bitvector 1)
  (let ((n994 (concat MA1 MA0))) ; (bitvector 2)
  (let ((MA2 (ALU54B_Inputs-MA2 inputs))) ; (bitvector 1)
  (let ((n996 (concat MA2 n994))) ; (bitvector 3)
  (let ((MA3 (ALU54B_Inputs-MA3 inputs))) ; (bitvector 1)
  (let ((n998 (concat MA3 n996))) ; (bitvector 4)
  (let ((MA4 (ALU54B_Inputs-MA4 inputs))) ; (bitvector 1)
  (let ((n1000 (concat MA4 n998))) ; (bitvector 5)
  (let ((MA5 (ALU54B_Inputs-MA5 inputs))) ; (bitvector 1)
  (let ((n1002 (concat MA5 n1000))) ; (bitvector 6)
  (let ((MA6 (ALU54B_Inputs-MA6 inputs))) ; (bitvector 1)
  (let ((n1004 (concat MA6 n1002))) ; (bitvector 7)
  (let ((MA7 (ALU54B_Inputs-MA7 inputs))) ; (bitvector 1)
  (let ((n1006 (concat MA7 n1004))) ; (bitvector 8)
  (let ((MA8 (ALU54B_Inputs-MA8 inputs))) ; (bitvector 1)
  (let ((n1008 (concat MA8 n1006))) ; (bitvector 9)
  (let ((MA9 (ALU54B_Inputs-MA9 inputs))) ; (bitvector 1)
  (let ((n1010 (concat MA9 n1008))) ; (bitvector 10)
  (let ((MA10 (ALU54B_Inputs-MA10 inputs))) ; (bitvector 1)
  (let ((n1012 (concat MA10 n1010))) ; (bitvector 11)
  (let ((MA11 (ALU54B_Inputs-MA11 inputs))) ; (bitvector 1)
  (let ((n1014 (concat MA11 n1012))) ; (bitvector 12)
  (let ((MA12 (ALU54B_Inputs-MA12 inputs))) ; (bitvector 1)
  (let ((n1016 (concat MA12 n1014))) ; (bitvector 13)
  (let ((MA13 (ALU54B_Inputs-MA13 inputs))) ; (bitvector 1)
  (let ((n1018 (concat MA13 n1016))) ; (bitvector 14)
  (let ((MA14 (ALU54B_Inputs-MA14 inputs))) ; (bitvector 1)
  (let ((n1020 (concat MA14 n1018))) ; (bitvector 15)
  (let ((MA15 (ALU54B_Inputs-MA15 inputs))) ; (bitvector 1)
  (let ((n1022 (concat MA15 n1020))) ; (bitvector 16)
  (let ((MA16 (ALU54B_Inputs-MA16 inputs))) ; (bitvector 1)
  (let ((n1024 (concat MA16 n1022))) ; (bitvector 17)
  (let ((MA17 (ALU54B_Inputs-MA17 inputs))) ; (bitvector 1)
  (let ((n1026 (concat MA17 n1024))) ; (bitvector 18)
  (let ((MA18 (ALU54B_Inputs-MA18 inputs))) ; (bitvector 1)
  (let ((n1028 (concat MA18 n1026))) ; (bitvector 19)
  (let ((MA19 (ALU54B_Inputs-MA19 inputs))) ; (bitvector 1)
  (let ((n1030 (concat MA19 n1028))) ; (bitvector 20)
  (let ((MA20 (ALU54B_Inputs-MA20 inputs))) ; (bitvector 1)
  (let ((n1032 (concat MA20 n1030))) ; (bitvector 21)
  (let ((MA21 (ALU54B_Inputs-MA21 inputs))) ; (bitvector 1)
  (let ((n1034 (concat MA21 n1032))) ; (bitvector 22)
  (let ((MA22 (ALU54B_Inputs-MA22 inputs))) ; (bitvector 1)
  (let ((n1036 (concat MA22 n1034))) ; (bitvector 23)
  (let ((MA23 (ALU54B_Inputs-MA23 inputs))) ; (bitvector 1)
  (let ((n1038 (concat MA23 n1036))) ; (bitvector 24)
  (let ((MA24 (ALU54B_Inputs-MA24 inputs))) ; (bitvector 1)
  (let ((n1040 (concat MA24 n1038))) ; (bitvector 25)
  (let ((MA25 (ALU54B_Inputs-MA25 inputs))) ; (bitvector 1)
  (let ((n1042 (concat MA25 n1040))) ; (bitvector 26)
  (let ((MA26 (ALU54B_Inputs-MA26 inputs))) ; (bitvector 1)
  (let ((n1044 (concat MA26 n1042))) ; (bitvector 27)
  (let ((MA27 (ALU54B_Inputs-MA27 inputs))) ; (bitvector 1)
  (let ((n1046 (concat MA27 n1044))) ; (bitvector 28)
  (let ((MA28 (ALU54B_Inputs-MA28 inputs))) ; (bitvector 1)
  (let ((n1048 (concat MA28 n1046))) ; (bitvector 29)
  (let ((MA29 (ALU54B_Inputs-MA29 inputs))) ; (bitvector 1)
  (let ((n1050 (concat MA29 n1048))) ; (bitvector 30)
  (let ((MA30 (ALU54B_Inputs-MA30 inputs))) ; (bitvector 1)
  (let ((n1052 (concat MA30 n1050))) ; (bitvector 31)
  (let ((MA31 (ALU54B_Inputs-MA31 inputs))) ; (bitvector 1)
  (let ((n1054 (concat MA31 n1052))) ; (bitvector 32)
  (let ((MA32 (ALU54B_Inputs-MA32 inputs))) ; (bitvector 1)
  (let ((n1056 (concat MA32 n1054))) ; (bitvector 33)
  (let ((MA33 (ALU54B_Inputs-MA33 inputs))) ; (bitvector 1)
  (let ((n1058 (concat MA33 n1056))) ; (bitvector 34)
  (let ((MA34 (ALU54B_Inputs-MA34 inputs))) ; (bitvector 1)
  (let ((n1060 (concat MA34 n1058))) ; (bitvector 35)
  (let ((MA35 (ALU54B_Inputs-MA35 inputs))) ; (bitvector 1)
  (let ((n1062 (concat MA35 n1060))) ; (bitvector 36)
  (let ((n1063 (concat MA35 MA35))) ; (bitvector 2)
  (let ((n1064 (concat MA35 n1063))) ; (bitvector 3)
  (let ((n1065 (concat MA35 n1064))) ; (bitvector 4)
  (let ((n1066 (concat MA35 n1065))) ; (bitvector 5)
  (let ((n1067 (concat MA35 n1066))) ; (bitvector 6)
  (let ((n1068 (concat MA35 n1067))) ; (bitvector 7)
  (let ((n1069 (concat MA35 n1068))) ; (bitvector 8)
  (let ((n1070 (concat MA35 n1069))) ; (bitvector 9)
  (let ((n1071 (concat MA35 n1070))) ; (bitvector 10)
  (let ((n1072 (concat MA35 n1071))) ; (bitvector 11)
  (let ((n1073 (concat MA35 n1072))) ; (bitvector 12)
  (let ((n1074 (concat MA35 n1073))) ; (bitvector 13)
  (let ((n1075 (concat MA35 n1074))) ; (bitvector 14)
  (let ((n1076 (concat MA35 n1075))) ; (bitvector 15)
  (let ((n1077 (concat MA35 n1076))) ; (bitvector 16)
  (let ((n1078 (concat MA35 n1077))) ; (bitvector 17)
  (let ((n1079 (concat MA35 n1078))) ; (bitvector 18)
  (let ((n1080 (concat MA35 n1079))) ; (bitvector 19)
  (let
    (($procmux$462$_Y
      (if (bitvector->bool SIGNEDIA) n1080 (bv #b0000000000000000000 19)))) ; (bitvector 19)
  (let ((n1082 (concat $procmux$462$_Y n1062))) ; (bitvector 55)
  (let ((n1083 (concat MA1 MA0))) ; (bitvector 2)
  (let ((n1084 (concat MA2 n1083))) ; (bitvector 3)
  (let ((n1085 (concat MA3 n1084))) ; (bitvector 4)
  (let ((n1086 (concat MA4 n1085))) ; (bitvector 5)
  (let ((n1087 (concat MA5 n1086))) ; (bitvector 6)
  (let ((n1088 (concat MA6 n1087))) ; (bitvector 7)
  (let ((n1089 (concat MA7 n1088))) ; (bitvector 8)
  (let ((n1090 (concat MA8 n1089))) ; (bitvector 9)
  (let ((n1091 (concat MA9 n1090))) ; (bitvector 10)
  (let ((n1092 (concat MA10 n1091))) ; (bitvector 11)
  (let ((n1093 (concat MA11 n1092))) ; (bitvector 12)
  (let ((n1094 (concat MA12 n1093))) ; (bitvector 13)
  (let ((n1095 (concat MA13 n1094))) ; (bitvector 14)
  (let ((n1096 (concat MA14 n1095))) ; (bitvector 15)
  (let ((n1097 (concat MA15 n1096))) ; (bitvector 16)
  (let ((n1098 (concat MA16 n1097))) ; (bitvector 17)
  (let ((n1099 (concat MA17 n1098))) ; (bitvector 18)
  (let ((n1100 (concat MA17 MA17))) ; (bitvector 2)
  (let ((n1101 (concat MA17 n1100))) ; (bitvector 3)
  (let ((n1102 (concat MA17 n1101))) ; (bitvector 4)
  (let ((n1103 (concat MA17 n1102))) ; (bitvector 5)
  (let ((n1104 (concat MA17 n1103))) ; (bitvector 6)
  (let ((n1105 (concat MA17 n1104))) ; (bitvector 7)
  (let
    (($procmux$489$_Y (if (bitvector->bool SIGNEDIA) n1105 (bv #b0000000 7)))) ; (bitvector 7)
  (let ((n1107 (concat $procmux$489$_Y n1099))) ; (bitvector 25)
  (let ((n1109 (concat (bv #b00 2) n1107))) ; (bitvector 27)
  (let ((n1110 (concat op7_sig_gen_1 n1109))) ; (bitvector 28)
  (let ((n1111 (concat MA18 n1110))) ; (bitvector 29)
  (let ((n1112 (concat MA19 n1111))) ; (bitvector 30)
  (let ((n1113 (concat MA20 n1112))) ; (bitvector 31)
  (let ((n1114 (concat MA21 n1113))) ; (bitvector 32)
  (let ((n1115 (concat MA22 n1114))) ; (bitvector 33)
  (let ((n1116 (concat MA23 n1115))) ; (bitvector 34)
  (let ((n1117 (concat MA24 n1116))) ; (bitvector 35)
  (let ((n1118 (concat MA25 n1117))) ; (bitvector 36)
  (let ((n1119 (concat MA26 n1118))) ; (bitvector 37)
  (let ((n1120 (concat MA27 n1119))) ; (bitvector 38)
  (let ((n1121 (concat MA28 n1120))) ; (bitvector 39)
  (let ((n1122 (concat MA29 n1121))) ; (bitvector 40)
  (let ((n1123 (concat MA30 n1122))) ; (bitvector 41)
  (let ((n1124 (concat MA31 n1123))) ; (bitvector 42)
  (let ((n1125 (concat MA32 n1124))) ; (bitvector 43)
  (let ((n1126 (concat MA33 n1125))) ; (bitvector 44)
  (let ((n1127 (concat MA34 n1126))) ; (bitvector 45)
  (let ((n1128 (concat MA35 n1127))) ; (bitvector 46)
  (let ((n1129 (concat MA35 MA35))) ; (bitvector 2)
  (let ((n1130 (concat MA35 n1129))) ; (bitvector 3)
  (let ((n1131 (concat MA35 n1130))) ; (bitvector 4)
  (let ((n1132 (concat MA35 n1131))) ; (bitvector 5)
  (let ((n1133 (concat MA35 n1132))) ; (bitvector 6)
  (let ((n1134 (concat MA35 n1133))) ; (bitvector 7)
  (let ((n1135 (concat MA35 n1134))) ; (bitvector 8)
  (let ((n1136 (concat MA35 n1135))) ; (bitvector 9)
  (let
    (($procmux$495$_Y (if (bitvector->bool SIGNEDIA) n1136 (bv #b000000000 9)))) ; (bitvector 9)
  (let ((n1138 (concat $procmux$495$_Y n1128))) ; (bitvector 55)
  (let
    ((ma_sig_m
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_1808$130$_Y)
        n1138
        n1082))) ; (bitvector 55)
  (let ((n1140 (concat ma_sig_m n991))) ; (bitvector 165)
  (let ((n1141 (concat r_out_lsb_sync n1140))) ; (bitvector 183)
  (let ((n1142 (concat r_out_msb n1141))) ; (bitvector 220)
  (let ((n1143 (extract 54 0 n1142))) ; (bitvector 55)
  (let ((n1144 (extract 1 0 opin_sig_1_reg))) ; (bitvector 2)
  (let (($procmux$411_CMP (bool->bitvector (bveq n1144 (bv #b11 2))))) ; (bitvector 1)
  (let (($procmux$412_CMP (bool->bitvector (bveq n1144 (bv #b10 2))))) ; (bitvector 1)
  (let ((n1147 (concat $procmux$412_CMP $procmux$411_CMP))) ; (bitvector 2)
  (let ((n1148 (zero-extend (bv #b1 1) (bitvector 2)))) ; (bitvector 2)
  (let (($procmux$413_CMP (bool->bitvector (bveq n1144 n1148)))) ; (bitvector 1)
  (let ((n1150 (concat $procmux$413_CMP n1147))) ; (bitvector 3)
  (let ((n1151 (apply bvor (bitvector->bits n1144)))) ; (bitvector 1)
  (let (($procmux$414_CMP (bvnot n1151))) ; (bitvector 1)
  (let ((n1153 (concat $procmux$414_CMP n1150))) ; (bitvector 4)
  (let ((n1154 (extract 0 0 n1153))) ; (bitvector 1)
  (let
    ((n1155
      (if
        (bitvector->bool n1154)
        n1143
        (bv #b0000000000000000000000000000000000000000000000000000000 55)))) ; (bitvector 55)
  (let ((n1156 (extract 109 55 n1142))) ; (bitvector 55)
  (let ((n1157 (extract 1 1 n1153))) ; (bitvector 1)
  (let ((n1158 (if (bitvector->bool n1157) n1156 n1155))) ; (bitvector 55)
  (let ((n1159 (extract 164 110 n1142))) ; (bitvector 55)
  (let ((n1160 (extract 2 2 n1153))) ; (bitvector 1)
  (let ((n1161 (if (bitvector->bool n1160) n1159 n1158))) ; (bitvector 55)
  (let ((n1162 (extract 219 165 n1142))) ; (bitvector 55)
  (let ((n1163 (extract 3 3 n1153))) ; (bitvector 1)
  (let ((a_mux (if (bitvector->bool n1163) n1162 n1161))) ; (bitvector 55)
  (let
    (($sub$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2023$155_Y
      (bvsub a_mux b_mux))) ; (bitvector 55)
  (let
    (($sub$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2031$164_Y
      (bvsub
        $sub$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2023$155_Y
        c_mux))) ; (bitvector 55)
  (let
    ((n1167
      (concat
        $sub$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2031$164_Y
        n953))) ; (bitvector 330)
  (let
    (($add$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2019$151_Y
      (bvadd a_mux b_mux))) ; (bitvector 55)
  (let
    (($sub$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2027$160_Y
      (bvsub
        $add$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2019$151_Y
        c_mux))) ; (bitvector 55)
  (let
    ((n1170
      (concat
        $sub$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2027$160_Y
        n1167))) ; (bitvector 385)
  (let
    (($add$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2023$156$_Y
      (bvadd
        $sub$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2023$155_Y
        c_mux))) ; (bitvector 55)
  (let
    ((n1172
      (concat
        $add$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2023$156$_Y
        n1170))) ; (bitvector 440)
  (let
    (($add$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2019$152$_Y
      (bvadd
        $add$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2019$151_Y
        c_mux))) ; (bitvector 55)
  (let
    ((n1174
      (concat
        $add$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2019$152$_Y
        n1172))) ; (bitvector 495)
  (let
    (($not$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2015$150$_Y
      (bvnot
        $and$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2015$149$_Y))) ; (bitvector 55)
  (let
    ((n1176
      (concat
        $not$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2015$150$_Y
        n1174))) ; (bitvector 550)
  (let ((n1177 (extract 54 0 n1176))) ; (bitvector 55)
  (let ((op10_sig_1_reg (bvxor op10_sig_1_sync_pos op10_sig_1_sync_neg))) ; (bitvector 3)
  (let ((n1179 (concat op10_sig_1_reg op7_sig_gen_1))) ; (bitvector 4)
  (let (($procmux$381_CMP (bool->bitvector (bveq n1179 (bv #b1011 4))))) ; (bitvector 1)
  (let ((n1181 (zero-extend (bv #b11 2) (bitvector 4)))) ; (bitvector 4)
  (let (($procmux$382_CMP (bool->bitvector (bveq n1179 n1181)))) ; (bitvector 1)
  (let ((n1183 (concat $procmux$382_CMP $procmux$381_CMP))) ; (bitvector 2)
  (let (($procmux$383_CMP (bool->bitvector (bveq n1179 (bv #b1000 4))))) ; (bitvector 1)
  (let ((n1186 (concat $procmux$383_CMP n1183))) ; (bitvector 3)
  (let (($procmux$384_CMP (bool->bitvector (bveq n1179 (bv #b1110 4))))) ; (bitvector 1)
  (let ((n1188 (concat $procmux$384_CMP n1186))) ; (bitvector 4)
  (let (($procmux$385_CMP (bool->bitvector (bveq n1179 (bv #b1100 4))))) ; (bitvector 1)
  (let ((n1190 (concat $procmux$385_CMP n1188))) ; (bitvector 5)
  (let ((n1191 (zero-extend (bv #b111 3) (bitvector 4)))) ; (bitvector 4)
  (let (($procmux$375_CMP (bool->bitvector (bveq n1179 n1191)))) ; (bitvector 1)
  (let ((n1193 (concat $procmux$375_CMP n1190))) ; (bitvector 6)
  (let ((n1194 (zero-extend (bv #b110 3) (bitvector 4)))) ; (bitvector 4)
  (let (($procmux$376_CMP (bool->bitvector (bveq n1179 n1194)))) ; (bitvector 1)
  (let ((n1196 (concat $procmux$376_CMP n1193))) ; (bitvector 7)
  (let ((n1197 (zero-extend (bv #b101 3) (bitvector 4)))) ; (bitvector 4)
  (let (($procmux$377_CMP (bool->bitvector (bveq n1179 n1197)))) ; (bitvector 1)
  (let ((n1199 (concat $procmux$377_CMP n1196))) ; (bitvector 8)
  (let ((n1200 (zero-extend (bv #b100 3) (bitvector 4)))) ; (bitvector 4)
  (let (($procmux$378_CMP (bool->bitvector (bveq n1179 n1200)))) ; (bitvector 1)
  (let ((n1202 (concat $procmux$378_CMP n1199))) ; (bitvector 9)
  (let ((n1203 (apply bvor (bitvector->bits n1179)))) ; (bitvector 1)
  (let (($procmux$390_CMP (bvnot n1203))) ; (bitvector 1)
  (let ((n1205 (concat $procmux$390_CMP n1202))) ; (bitvector 10)
  (let ((n1206 (extract 0 0 n1205))) ; (bitvector 1)
  (let
    ((n1207
      (if
        (bitvector->bool n1206)
        n1177
        (bv #b0000000000000000000000000000000000000000000000000000000 55)))) ; (bitvector 55)
  (let ((n1208 (extract 109 55 n1176))) ; (bitvector 55)
  (let ((n1209 (extract 1 1 n1205))) ; (bitvector 1)
  (let ((n1210 (if (bitvector->bool n1209) n1208 n1207))) ; (bitvector 55)
  (let ((n1211 (extract 164 110 n1176))) ; (bitvector 55)
  (let ((n1212 (extract 2 2 n1205))) ; (bitvector 1)
  (let ((n1213 (if (bitvector->bool n1212) n1211 n1210))) ; (bitvector 55)
  (let ((n1214 (extract 219 165 n1176))) ; (bitvector 55)
  (let ((n1215 (extract 3 3 n1205))) ; (bitvector 1)
  (let ((n1216 (if (bitvector->bool n1215) n1214 n1213))) ; (bitvector 55)
  (let ((n1217 (extract 274 220 n1176))) ; (bitvector 55)
  (let ((n1218 (extract 4 4 n1205))) ; (bitvector 1)
  (let ((n1219 (if (bitvector->bool n1218) n1217 n1216))) ; (bitvector 55)
  (let ((n1220 (extract 329 275 n1176))) ; (bitvector 55)
  (let ((n1221 (extract 5 5 n1205))) ; (bitvector 1)
  (let ((n1222 (if (bitvector->bool n1221) n1220 n1219))) ; (bitvector 55)
  (let ((n1223 (extract 384 330 n1176))) ; (bitvector 55)
  (let ((n1224 (extract 6 6 n1205))) ; (bitvector 1)
  (let ((n1225 (if (bitvector->bool n1224) n1223 n1222))) ; (bitvector 55)
  (let ((n1226 (extract 439 385 n1176))) ; (bitvector 55)
  (let ((n1227 (extract 7 7 n1205))) ; (bitvector 1)
  (let ((n1228 (if (bitvector->bool n1227) n1226 n1225))) ; (bitvector 55)
  (let ((n1229 (extract 494 440 n1176))) ; (bitvector 55)
  (let ((n1230 (extract 8 8 n1205))) ; (bitvector 1)
  (let ((n1231 (if (bitvector->bool n1230) n1229 n1228))) ; (bitvector 55)
  (let ((n1232 (extract 549 495 n1176))) ; (bitvector 55)
  (let ((n1233 (extract 9 9 n1205))) ; (bitvector 1)
  (let ((r_out (if (bitvector->bool n1233) n1232 n1231))) ; (bitvector 55)
  (let ((n1235 (extract 54 18 r_out))) ; (bitvector 37)
  (let
    (($xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2105$187_Y
      (bvxor r_out_msb_sync_pos n1235))) ; (bitvector 37)
  (let
    (($procmux$351$_Y
      (if
        (bitvector->bool CE0)
        $xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2105$187_Y
        r_out_msb_sync_neg))) ; (bitvector 37)
  (let
    (($0_r_out_msb_sync_neg_36_0_
      (if
        (bitvector->bool RST0)
        (bv #b0000000000000000000000000000000000000 37)
        $procmux$351$_Y))) ; (bitvector 37)
  (let
    (($xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2098$183_Y
      (bvxor r_out_msb_sync_neg n1235))) ; (bitvector 37)
  (let
    (($procmux$356$_Y
      (if
        (bitvector->bool CE0)
        $xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2098$183_Y
        r_out_msb_sync_pos))) ; (bitvector 37)
  (let
    (($0_r_out_msb_sync_pos_36_0_
      (if
        (bitvector->bool RST0)
        (bv #b0000000000000000000000000000000000000 37)
        $procmux$356$_Y))) ; (bitvector 37)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$979$_Q
      (ALU54B_State-$auto$clk2fflogic.cc_102_sample_data$979 state))) ; (bitvector 54)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$981$_Q
      (ALU54B_State-$auto$clk2fflogic.cc_102_sample_data$981 state))) ; (bitvector 54)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_cfb_clk_sig_sampled$982
      (ALU54B_State-$auto$clk2fflogic.cc_86_sample_control_edge$983 state))) ; (bitvector 1)
  (let
    ((n1246
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_cfb_clk_sig_sampled$982
        cfb_clk_sig))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$984$_Y
      (bool->bitvector (bveq n1246 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((cfb_sync
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$984$_Y)
        $auto$clk2fflogic.cc_102_sample_data$981$_Q
        $auto$clk2fflogic.cc_102_sample_data$979$_Q))) ; (bitvector 54)
  (let ((CFB0 (ALU54B_Inputs-CFB0 inputs))) ; (bitvector 1)
  (let ((CFB1 (ALU54B_Inputs-CFB1 inputs))) ; (bitvector 1)
  (let ((n1251 (concat CFB1 CFB0))) ; (bitvector 2)
  (let ((CFB2 (ALU54B_Inputs-CFB2 inputs))) ; (bitvector 1)
  (let ((n1253 (concat CFB2 n1251))) ; (bitvector 3)
  (let ((CFB3 (ALU54B_Inputs-CFB3 inputs))) ; (bitvector 1)
  (let ((n1255 (concat CFB3 n1253))) ; (bitvector 4)
  (let ((CFB4 (ALU54B_Inputs-CFB4 inputs))) ; (bitvector 1)
  (let ((n1257 (concat CFB4 n1255))) ; (bitvector 5)
  (let ((CFB5 (ALU54B_Inputs-CFB5 inputs))) ; (bitvector 1)
  (let ((n1259 (concat CFB5 n1257))) ; (bitvector 6)
  (let ((CFB6 (ALU54B_Inputs-CFB6 inputs))) ; (bitvector 1)
  (let ((n1261 (concat CFB6 n1259))) ; (bitvector 7)
  (let ((CFB7 (ALU54B_Inputs-CFB7 inputs))) ; (bitvector 1)
  (let ((n1263 (concat CFB7 n1261))) ; (bitvector 8)
  (let ((CFB8 (ALU54B_Inputs-CFB8 inputs))) ; (bitvector 1)
  (let ((n1265 (concat CFB8 n1263))) ; (bitvector 9)
  (let ((CFB9 (ALU54B_Inputs-CFB9 inputs))) ; (bitvector 1)
  (let ((n1267 (concat CFB9 n1265))) ; (bitvector 10)
  (let ((CFB10 (ALU54B_Inputs-CFB10 inputs))) ; (bitvector 1)
  (let ((n1269 (concat CFB10 n1267))) ; (bitvector 11)
  (let ((CFB11 (ALU54B_Inputs-CFB11 inputs))) ; (bitvector 1)
  (let ((n1271 (concat CFB11 n1269))) ; (bitvector 12)
  (let ((CFB12 (ALU54B_Inputs-CFB12 inputs))) ; (bitvector 1)
  (let ((n1273 (concat CFB12 n1271))) ; (bitvector 13)
  (let ((CFB13 (ALU54B_Inputs-CFB13 inputs))) ; (bitvector 1)
  (let ((n1275 (concat CFB13 n1273))) ; (bitvector 14)
  (let ((CFB14 (ALU54B_Inputs-CFB14 inputs))) ; (bitvector 1)
  (let ((n1277 (concat CFB14 n1275))) ; (bitvector 15)
  (let ((CFB15 (ALU54B_Inputs-CFB15 inputs))) ; (bitvector 1)
  (let ((n1279 (concat CFB15 n1277))) ; (bitvector 16)
  (let ((CFB16 (ALU54B_Inputs-CFB16 inputs))) ; (bitvector 1)
  (let ((n1281 (concat CFB16 n1279))) ; (bitvector 17)
  (let ((CFB17 (ALU54B_Inputs-CFB17 inputs))) ; (bitvector 1)
  (let ((n1283 (concat CFB17 n1281))) ; (bitvector 18)
  (let ((CFB18 (ALU54B_Inputs-CFB18 inputs))) ; (bitvector 1)
  (let ((n1285 (concat CFB18 n1283))) ; (bitvector 19)
  (let ((CFB19 (ALU54B_Inputs-CFB19 inputs))) ; (bitvector 1)
  (let ((n1287 (concat CFB19 n1285))) ; (bitvector 20)
  (let ((CFB20 (ALU54B_Inputs-CFB20 inputs))) ; (bitvector 1)
  (let ((n1289 (concat CFB20 n1287))) ; (bitvector 21)
  (let ((CFB21 (ALU54B_Inputs-CFB21 inputs))) ; (bitvector 1)
  (let ((n1291 (concat CFB21 n1289))) ; (bitvector 22)
  (let ((CFB22 (ALU54B_Inputs-CFB22 inputs))) ; (bitvector 1)
  (let ((n1293 (concat CFB22 n1291))) ; (bitvector 23)
  (let ((CFB23 (ALU54B_Inputs-CFB23 inputs))) ; (bitvector 1)
  (let ((n1295 (concat CFB23 n1293))) ; (bitvector 24)
  (let ((CFB24 (ALU54B_Inputs-CFB24 inputs))) ; (bitvector 1)
  (let ((n1297 (concat CFB24 n1295))) ; (bitvector 25)
  (let ((CFB25 (ALU54B_Inputs-CFB25 inputs))) ; (bitvector 1)
  (let ((n1299 (concat CFB25 n1297))) ; (bitvector 26)
  (let ((CFB26 (ALU54B_Inputs-CFB26 inputs))) ; (bitvector 1)
  (let ((n1301 (concat CFB26 n1299))) ; (bitvector 27)
  (let ((CFB27 (ALU54B_Inputs-CFB27 inputs))) ; (bitvector 1)
  (let ((n1303 (concat CFB27 n1301))) ; (bitvector 28)
  (let ((CFB28 (ALU54B_Inputs-CFB28 inputs))) ; (bitvector 1)
  (let ((n1305 (concat CFB28 n1303))) ; (bitvector 29)
  (let ((CFB29 (ALU54B_Inputs-CFB29 inputs))) ; (bitvector 1)
  (let ((n1307 (concat CFB29 n1305))) ; (bitvector 30)
  (let ((CFB30 (ALU54B_Inputs-CFB30 inputs))) ; (bitvector 1)
  (let ((n1309 (concat CFB30 n1307))) ; (bitvector 31)
  (let ((CFB31 (ALU54B_Inputs-CFB31 inputs))) ; (bitvector 1)
  (let ((n1311 (concat CFB31 n1309))) ; (bitvector 32)
  (let ((CFB32 (ALU54B_Inputs-CFB32 inputs))) ; (bitvector 1)
  (let ((n1313 (concat CFB32 n1311))) ; (bitvector 33)
  (let ((CFB33 (ALU54B_Inputs-CFB33 inputs))) ; (bitvector 1)
  (let ((n1315 (concat CFB33 n1313))) ; (bitvector 34)
  (let ((CFB34 (ALU54B_Inputs-CFB34 inputs))) ; (bitvector 1)
  (let ((n1317 (concat CFB34 n1315))) ; (bitvector 35)
  (let ((CFB35 (ALU54B_Inputs-CFB35 inputs))) ; (bitvector 1)
  (let ((n1319 (concat CFB35 n1317))) ; (bitvector 36)
  (let ((CFB36 (ALU54B_Inputs-CFB36 inputs))) ; (bitvector 1)
  (let ((n1321 (concat CFB36 n1319))) ; (bitvector 37)
  (let ((CFB37 (ALU54B_Inputs-CFB37 inputs))) ; (bitvector 1)
  (let ((n1323 (concat CFB37 n1321))) ; (bitvector 38)
  (let ((CFB38 (ALU54B_Inputs-CFB38 inputs))) ; (bitvector 1)
  (let ((n1325 (concat CFB38 n1323))) ; (bitvector 39)
  (let ((CFB39 (ALU54B_Inputs-CFB39 inputs))) ; (bitvector 1)
  (let ((n1327 (concat CFB39 n1325))) ; (bitvector 40)
  (let ((CFB40 (ALU54B_Inputs-CFB40 inputs))) ; (bitvector 1)
  (let ((n1329 (concat CFB40 n1327))) ; (bitvector 41)
  (let ((CFB41 (ALU54B_Inputs-CFB41 inputs))) ; (bitvector 1)
  (let ((n1331 (concat CFB41 n1329))) ; (bitvector 42)
  (let ((CFB42 (ALU54B_Inputs-CFB42 inputs))) ; (bitvector 1)
  (let ((n1333 (concat CFB42 n1331))) ; (bitvector 43)
  (let ((CFB43 (ALU54B_Inputs-CFB43 inputs))) ; (bitvector 1)
  (let ((n1335 (concat CFB43 n1333))) ; (bitvector 44)
  (let ((CFB44 (ALU54B_Inputs-CFB44 inputs))) ; (bitvector 1)
  (let ((n1337 (concat CFB44 n1335))) ; (bitvector 45)
  (let ((CFB45 (ALU54B_Inputs-CFB45 inputs))) ; (bitvector 1)
  (let ((n1339 (concat CFB45 n1337))) ; (bitvector 46)
  (let ((CFB46 (ALU54B_Inputs-CFB46 inputs))) ; (bitvector 1)
  (let ((n1341 (concat CFB46 n1339))) ; (bitvector 47)
  (let ((CFB47 (ALU54B_Inputs-CFB47 inputs))) ; (bitvector 1)
  (let ((n1343 (concat CFB47 n1341))) ; (bitvector 48)
  (let ((CFB48 (ALU54B_Inputs-CFB48 inputs))) ; (bitvector 1)
  (let ((n1345 (concat CFB48 n1343))) ; (bitvector 49)
  (let ((CFB49 (ALU54B_Inputs-CFB49 inputs))) ; (bitvector 1)
  (let ((n1347 (concat CFB49 n1345))) ; (bitvector 50)
  (let ((CFB50 (ALU54B_Inputs-CFB50 inputs))) ; (bitvector 1)
  (let ((n1349 (concat CFB50 n1347))) ; (bitvector 51)
  (let ((CFB51 (ALU54B_Inputs-CFB51 inputs))) ; (bitvector 1)
  (let ((n1351 (concat CFB51 n1349))) ; (bitvector 52)
  (let ((CFB52 (ALU54B_Inputs-CFB52 inputs))) ; (bitvector 1)
  (let ((n1353 (concat CFB52 n1351))) ; (bitvector 53)
  (let ((CFB53 (ALU54B_Inputs-CFB53 inputs))) ; (bitvector 1)
  (let ((n1355 (concat CFB53 n1353))) ; (bitvector 54)
  (let ((CE3 (ALU54B_Inputs-CE3 inputs))) ; (bitvector 1)
  (let ((REG_INPUTCFB_CE (ALU54B_Inputs-REG_INPUTCFB_CE inputs))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_1470$40$_Y
      (bool->bitvector (bveq REG_INPUTCFB_CE (bv #b10001 5))))) ; (bitvector 1)
  (let
    (($procmux$622$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_1470$40$_Y)
        CE3
        CE0))) ; (bitvector 1)
  (let ((CE2 (ALU54B_Inputs-CE2 inputs))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_1469$39$_Y
      (bool->bitvector (bveq REG_INPUTCFB_CE (bv #b10000 5))))) ; (bitvector 1)
  (let
    (($procmux$634$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_1469$39$_Y)
        CE2
        $procmux$622$_Y))) ; (bitvector 1)
  (let ((CE1 (ALU54B_Inputs-CE1 inputs))) ; (bitvector 1)
  (let ((n1367 (zero-extend (bv #b1111 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_1468$38$_Y
      (bool->bitvector (bveq REG_INPUTCFB_CE n1367)))) ; (bitvector 1)
  (let
    (($procmux$643$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_1468$38$_Y)
        CE1
        $procmux$634$_Y))) ; (bitvector 1)
  (let ((n1370 (zero-extend (bv #b1 1) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_1467$37$_Y
      (bool->bitvector (bveq REG_INPUTCFB_CE n1370)))) ; (bitvector 1)
  (let
    ((cfb_ce_sig
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_1467$37$_Y)
        CE0
        $procmux$643$_Y))) ; (bitvector 1)
  (let (($procmux$540$_Y (if (bitvector->bool cfb_ce_sig) n1355 cfb_sync))) ; (bitvector 54)
  (let ((RST3 (ALU54B_Inputs-RST3 inputs))) ; (bitvector 1)
  (let ((REG_INPUTCFB_RST (ALU54B_Inputs-REG_INPUTCFB_RST inputs))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_1478$45$_Y
      (bool->bitvector (bveq REG_INPUTCFB_RST (bv #b10100 5))))) ; (bitvector 1)
  (let
    (($procmux$592$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_1478$45$_Y)
        RST3
        RST0))) ; (bitvector 1)
  (let ((RST2 (ALU54B_Inputs-RST2 inputs))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_1477$44$_Y
      (bool->bitvector (bveq REG_INPUTCFB_RST (bv #b10011 5))))) ; (bitvector 1)
  (let
    (($procmux$604$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_1477$44$_Y)
        RST2
        $procmux$592$_Y))) ; (bitvector 1)
  (let ((RST1 (ALU54B_Inputs-RST1 inputs))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_1476$43$_Y
      (bool->bitvector (bveq REG_INPUTCFB_RST (bv #b10010 5))))) ; (bitvector 1)
  (let
    (($procmux$613$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_1476$43$_Y)
        RST1
        $procmux$604$_Y))) ; (bitvector 1)
  (let ((n1388 (zero-extend (bv #b10 2) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_1475$42$_Y
      (bool->bitvector (bveq REG_INPUTCFB_RST n1388)))) ; (bitvector 1)
  (let
    ((cfb_rst_sig
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_1475$42$_Y)
        RST0
        $procmux$613$_Y))) ; (bitvector 1)
  (let
    (($0_cfb_sync_53_0_
      (if
        (bitvector->bool cfb_rst_sig)
        (bv #b000000000000000000000000000000000000000000000000000000 54)
        $procmux$540$_Y))) ; (bitvector 54)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$789$_Q
      (ALU54B_State-$auto$clk2fflogic.cc_102_sample_data$789 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$791$_Q
      (ALU54B_State-$auto$clk2fflogic.cc_102_sample_data$791 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_CLK0_sampled$792
      (ALU54B_State-$auto$clk2fflogic.cc_86_sample_control_edge$793 state))) ; (bitvector 1)
  (let
    ((n1395
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_CLK0_sampled$792
        CLK0))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$794$_Y
      (bool->bitvector (bveq n1395 (bv #b10 2))))) ; (bitvector 1)
  (let
    ((under_sync_neg
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$794$_Y)
        $auto$clk2fflogic.cc_102_sample_data$791$_Q
        $auto$clk2fflogic.cc_102_sample_data$789$_Q))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$869$_Q
      (ALU54B_State-$auto$clk2fflogic.cc_102_sample_data$869 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$871$_Q
      (ALU54B_State-$auto$clk2fflogic.cc_102_sample_data$871 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_CLK0_sampled$872
      (ALU54B_State-$auto$clk2fflogic.cc_86_sample_control_edge$873 state))) ; (bitvector 1)
  (let
    ((n1401
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_CLK0_sampled$872
        CLK0))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$874$_Y
      (bool->bitvector (bveq n1401 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((under_sync_pos
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$874$_Y)
        $auto$clk2fflogic.cc_102_sample_data$871$_Q
        $auto$clk2fflogic.cc_102_sample_data$869$_Q))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$829$_Q
      (ALU54B_State-$auto$clk2fflogic.cc_102_sample_data$829 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$831$_Q
      (ALU54B_State-$auto$clk2fflogic.cc_102_sample_data$831 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_CLK0_sampled$832
      (ALU54B_State-$auto$clk2fflogic.cc_86_sample_control_edge$833 state))) ; (bitvector 1)
  (let
    ((n1407
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_CLK0_sampled$832
        CLK0))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$834$_Y
      (bool->bitvector (bveq n1407 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((eqom_sync_pos
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$834$_Y)
        $auto$clk2fflogic.cc_102_sample_data$831$_Q
        $auto$clk2fflogic.cc_102_sample_data$829$_Q))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$749$_Q
      (ALU54B_State-$auto$clk2fflogic.cc_102_sample_data$749 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$751$_Q
      (ALU54B_State-$auto$clk2fflogic.cc_102_sample_data$751 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_CLK0_sampled$752
      (ALU54B_State-$auto$clk2fflogic.cc_86_sample_control_edge$753 state))) ; (bitvector 1)
  (let
    ((n1413
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_CLK0_sampled$752
        CLK0))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$754$_Y
      (bool->bitvector (bveq n1413 (bv #b10 2))))) ; (bitvector 1)
  (let
    ((eqom_sync_neg
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$754$_Y)
        $auto$clk2fflogic.cc_102_sample_data$751$_Q
        $auto$clk2fflogic.cc_102_sample_data$749$_Q))) ; (bitvector 1)
  (let ((eqom_gen (bvxor eqom_sync_pos eqom_sync_neg))) ; (bitvector 1)
  (let ((MASK01 (ALU54B_Inputs-MASK01 inputs))) ; (bitvector 56)
  (let ((n1418 (extract 54 0 MASK01))) ; (bitvector 55)
  (let
    (($not$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2125$193_Y
      (bvnot n1418))) ; (bitvector 55)
  (let
    (($and$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2125$194$_Y
      (bvand
        r_out
        $not$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2125$193_Y))) ; (bitvector 55)
  (let
    (($reduce_or$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2125$195_Y
      (apply
        bvor
        (bitvector->bits
          $and$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2125$194$_Y)))) ; (bitvector 1)
  (let
    (($not$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2125$196$_Y
      (bvnot
        $reduce_or$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2125$195_Y))) ; (bitvector 1)
  (let
    (($or$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2129$200$_Y
      (bvor r_out n1418))) ; (bitvector 55)
  (let
    ((eqom_sig
      (apply
        bvand
        (bitvector->bits
          $or$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2129$200$_Y)))) ; (bitvector 1)
  (let
    (($or$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2150$213_Y
      (bvor
        $not$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2125$196$_Y
        eqom_sig))) ; (bitvector 1)
  (let
    ((eqnor_sig
      (bvnot
        $or$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2150$213_Y))) ; (bitvector 1)
  (let
    (($and$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2152$216$_Y
      (bvand eqom_gen eqnor_sig))) ; (bitvector 1)
  (let
    (($xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2250$244_Y
      (bvxor
        under_sync_pos
        $and$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2152$216$_Y))) ; (bitvector 1)
  (let
    (($procmux$264$_Y
      (if
        (bitvector->bool CE0)
        $xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2250$244_Y
        under_sync_neg))) ; (bitvector 1)
  (let
    (($0_under_sync_neg_0_0_
      (if (bitvector->bool RST0) (bv #b0 1) $procmux$264$_Y))) ; (bitvector 1)
  (let
    (($xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2229$233_Y
      (bvxor
        under_sync_neg
        $and$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2152$216$_Y))) ; (bitvector 1)
  (let
    (($procmux$304$_Y
      (if
        (bitvector->bool CE0)
        $xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2229$233_Y
        under_sync_pos))) ; (bitvector 1)
  (let
    (($0_under_sync_pos_0_0_
      (if (bitvector->bool RST0) (bv #b0 1) $procmux$304$_Y))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$799$_Q
      (ALU54B_State-$auto$clk2fflogic.cc_102_sample_data$799 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$801$_Q
      (ALU54B_State-$auto$clk2fflogic.cc_102_sample_data$801 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_CLK0_sampled$802
      (ALU54B_State-$auto$clk2fflogic.cc_86_sample_control_edge$803 state))) ; (bitvector 1)
  (let
    ((n1437
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_CLK0_sampled$802
        CLK0))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$804$_Y
      (bool->bitvector (bveq n1437 (bv #b10 2))))) ; (bitvector 1)
  (let
    ((overunder_sync_neg
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$804$_Y)
        $auto$clk2fflogic.cc_102_sample_data$801$_Q
        $auto$clk2fflogic.cc_102_sample_data$799$_Q))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$879$_Q
      (ALU54B_State-$auto$clk2fflogic.cc_102_sample_data$879 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$881$_Q
      (ALU54B_State-$auto$clk2fflogic.cc_102_sample_data$881 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_CLK0_sampled$882
      (ALU54B_State-$auto$clk2fflogic.cc_86_sample_control_edge$883 state))) ; (bitvector 1)
  (let
    ((n1443
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_CLK0_sampled$882
        CLK0))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$884$_Y
      (bool->bitvector (bveq n1443 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((overunder_sync_pos
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$884$_Y)
        $auto$clk2fflogic.cc_102_sample_data$881$_Q
        $auto$clk2fflogic.cc_102_sample_data$879$_Q))) ; (bitvector 1)
  (let ((n1446 (extract 53 0 a_mux))) ; (bitvector 54)
  (let ((n1447 (extract 53 0 b_mux))) ; (bitvector 54)
  (let
    (($sub$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2024$157_Y
      (bvsub n1446 n1447))) ; (bitvector 54)
  (let ((n1449 (extract 53 0 c_mux))) ; (bitvector 54)
  (let
    (($sub$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2032$166_Y
      (bvsub
        $sub$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2024$157_Y
        n1449))) ; (bitvector 54)
  (let ((n1451 (extract 53 0 a_mux))) ; (bitvector 54)
  (let ((n1452 (extract 53 0 b_mux))) ; (bitvector 54)
  (let
    (($add$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2020$153$_Y
      (bvadd n1451 n1452))) ; (bitvector 54)
  (let
    (($sub$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2028$162_Y
      (bvsub
        $add$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2020$153$_Y
        n1449))) ; (bitvector 54)
  (let
    ((n1455
      (concat
        $sub$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2028$162_Y
        $sub$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2032$166_Y))) ; (bitvector 108)
  (let ((n1456 (extract 53 0 c_mux))) ; (bitvector 54)
  (let
    (($add$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2024$158$_Y
      (bvadd
        $sub$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2024$157_Y
        n1456))) ; (bitvector 54)
  (let
    ((n1458
      (concat
        $add$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2024$158$_Y
        n1455))) ; (bitvector 162)
  (let
    (($add$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2020$154$_Y
      (bvadd
        $add$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2020$153$_Y
        n1456))) ; (bitvector 54)
  (let
    ((n1460
      (concat
        $add$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2020$154$_Y
        n1458))) ; (bitvector 216)
  (let ((n1461 (extract 53 0 n1460))) ; (bitvector 54)
  (let ((n1462 (concat $procmux$376_CMP $procmux$375_CMP))) ; (bitvector 2)
  (let ((n1463 (concat $procmux$377_CMP n1462))) ; (bitvector 3)
  (let ((n1464 (concat $procmux$378_CMP n1463))) ; (bitvector 4)
  (let ((n1465 (extract 0 0 n1464))) ; (bitvector 1)
  (let
    ((n1466
      (if
        (bitvector->bool n1465)
        n1461
        (bv #b000000000000000000000000000000000000000000000000000000 54)))) ; (bitvector 54)
  (let ((n1467 (extract 107 54 n1460))) ; (bitvector 54)
  (let ((n1468 (extract 1 1 n1464))) ; (bitvector 1)
  (let ((n1469 (if (bitvector->bool n1468) n1467 n1466))) ; (bitvector 54)
  (let ((n1470 (extract 161 108 n1460))) ; (bitvector 54)
  (let ((n1471 (extract 2 2 n1464))) ; (bitvector 1)
  (let ((n1472 (if (bitvector->bool n1471) n1470 n1469))) ; (bitvector 54)
  (let ((n1473 (extract 215 162 n1460))) ; (bitvector 54)
  (let ((n1474 (extract 3 3 n1464))) ; (bitvector 1)
  (let ((r_out1 (if (bitvector->bool n1474) n1473 n1472))) ; (bitvector 54)
  (let ((n1476 (extract 53 53 r_out1))) ; (bitvector 1)
  (let
    (($and$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2153$217$_Y
      (bvand SIGNEDIA SIGNEDIB))) ; (bitvector 1)
  (let
    (($not$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2153$218$_Y
      (bvnot
        $and$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2153$217$_Y))) ; (bitvector 1)
  (let ((LEGACY (ALU54B_Inputs-LEGACY inputs))) ; (bitvector 5)
  (let ((n1480 (zero-extend (bv #b101 3) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2157$221$_Y
      (bool->bitvector (bveq LEGACY n1480)))) ; (bitvector 1)
  (let
    ((over_under_sel
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2157$221$_Y)
        (bv #b0 1)
        $not$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2153$218$_Y))) ; (bitvector 1)
  (let
    (($procmux$340$_Y (if (bitvector->bool over_under_sel) n1476 eqnor_sig))) ; (bitvector 1)
  (let
    (($xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2251$245_Y
      (bvxor overunder_sync_pos $procmux$340$_Y))) ; (bitvector 1)
  (let
    (($procmux$259$_Y
      (if
        (bitvector->bool CE0)
        $xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2251$245_Y
        overunder_sync_neg))) ; (bitvector 1)
  (let
    (($0_overunder_sync_neg_0_0_
      (if (bitvector->bool RST0) (bv #b0 1) $procmux$259$_Y))) ; (bitvector 1)
  (let
    (($xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2230$234_Y
      (bvxor overunder_sync_neg $procmux$340$_Y))) ; (bitvector 1)
  (let
    (($procmux$299$_Y
      (if
        (bitvector->bool CE0)
        $xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2230$234_Y
        overunder_sync_pos))) ; (bitvector 1)
  (let
    (($0_overunder_sync_pos_0_0_
      (if (bitvector->bool RST0) (bv #b0 1) $procmux$299$_Y))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$779$_Q
      (ALU54B_State-$auto$clk2fflogic.cc_102_sample_data$779 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$781$_Q
      (ALU54B_State-$auto$clk2fflogic.cc_102_sample_data$781 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_CLK0_sampled$782
      (ALU54B_State-$auto$clk2fflogic.cc_86_sample_control_edge$783 state))) ; (bitvector 1)
  (let
    ((n1493
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_CLK0_sampled$782
        CLK0))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$784$_Y
      (bool->bitvector (bveq n1493 (bv #b10 2))))) ; (bitvector 1)
  (let
    ((over_sync_neg
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$784$_Y)
        $auto$clk2fflogic.cc_102_sample_data$781$_Q
        $auto$clk2fflogic.cc_102_sample_data$779$_Q))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$859$_Q
      (ALU54B_State-$auto$clk2fflogic.cc_102_sample_data$859 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$861$_Q
      (ALU54B_State-$auto$clk2fflogic.cc_102_sample_data$861 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_CLK0_sampled$862
      (ALU54B_State-$auto$clk2fflogic.cc_86_sample_control_edge$863 state))) ; (bitvector 1)
  (let
    ((n1499
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_CLK0_sampled$862
        CLK0))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$864$_Y
      (bool->bitvector (bveq n1499 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((over_sync_pos
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$864$_Y)
        $auto$clk2fflogic.cc_102_sample_data$861$_Q
        $auto$clk2fflogic.cc_102_sample_data$859$_Q))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$819$_Q
      (ALU54B_State-$auto$clk2fflogic.cc_102_sample_data$819 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$821$_Q
      (ALU54B_State-$auto$clk2fflogic.cc_102_sample_data$821 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_CLK0_sampled$822
      (ALU54B_State-$auto$clk2fflogic.cc_86_sample_control_edge$823 state))) ; (bitvector 1)
  (let
    ((n1505
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_CLK0_sampled$822
        CLK0))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$824$_Y
      (bool->bitvector (bveq n1505 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((eqzm_sync_pos
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$824$_Y)
        $auto$clk2fflogic.cc_102_sample_data$821$_Q
        $auto$clk2fflogic.cc_102_sample_data$819$_Q))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$739$_Q
      (ALU54B_State-$auto$clk2fflogic.cc_102_sample_data$739 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$741$_Q
      (ALU54B_State-$auto$clk2fflogic.cc_102_sample_data$741 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_CLK0_sampled$742
      (ALU54B_State-$auto$clk2fflogic.cc_86_sample_control_edge$743 state))) ; (bitvector 1)
  (let
    ((n1511
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_CLK0_sampled$742
        CLK0))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$744$_Y
      (bool->bitvector (bveq n1511 (bv #b10 2))))) ; (bitvector 1)
  (let
    ((eqzm_sync_neg
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$744$_Y)
        $auto$clk2fflogic.cc_102_sample_data$741$_Q
        $auto$clk2fflogic.cc_102_sample_data$739$_Q))) ; (bitvector 1)
  (let ((eqzm_gen (bvxor eqzm_sync_pos eqzm_sync_neg))) ; (bitvector 1)
  (let
    (($and$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2151$215$_Y
      (bvand eqzm_gen eqnor_sig))) ; (bitvector 1)
  (let
    (($xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2249$243_Y
      (bvxor
        over_sync_pos
        $and$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2151$215$_Y))) ; (bitvector 1)
  (let
    (($procmux$269$_Y
      (if
        (bitvector->bool CE0)
        $xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2249$243_Y
        over_sync_neg))) ; (bitvector 1)
  (let
    (($0_over_sync_neg_0_0_
      (if (bitvector->bool RST0) (bv #b0 1) $procmux$269$_Y))) ; (bitvector 1)
  (let
    (($xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2228$232_Y
      (bvxor
        over_sync_neg
        $and$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2151$215$_Y))) ; (bitvector 1)
  (let
    (($procmux$309$_Y
      (if
        (bitvector->bool CE0)
        $xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2228$232_Y
        over_sync_pos))) ; (bitvector 1)
  (let
    (($0_over_sync_pos_0_0_
      (if (bitvector->bool RST0) (bv #b0 1) $procmux$309$_Y))) ; (bitvector 1)
  (let
    (($xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2245$239_Y
      (bvxor
        eqzm_sync_pos
        $not$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2125$196$_Y))) ; (bitvector 1)
  (let
    (($procmux$289$_Y
      (if
        (bitvector->bool CE0)
        $xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2245$239_Y
        eqzm_sync_neg))) ; (bitvector 1)
  (let
    (($0_eqzm_sync_neg_0_0_
      (if (bitvector->bool RST0) (bv #b0 1) $procmux$289$_Y))) ; (bitvector 1)
  (let
    (($xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2224$228_Y
      (bvxor
        eqzm_sync_neg
        $not$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2125$196$_Y))) ; (bitvector 1)
  (let
    (($procmux$329$_Y
      (if
        (bitvector->bool CE0)
        $xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2224$228_Y
        eqzm_sync_pos))) ; (bitvector 1)
  (let
    (($0_eqzm_sync_pos_0_0_
      (if (bitvector->bool RST0) (bv #b0 1) $procmux$329$_Y))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$729$_Q
      (ALU54B_State-$auto$clk2fflogic.cc_102_sample_data$729 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$731$_Q
      (ALU54B_State-$auto$clk2fflogic.cc_102_sample_data$731 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_CLK0_sampled$732
      (ALU54B_State-$auto$clk2fflogic.cc_86_sample_control_edge$733 state))) ; (bitvector 1)
  (let
    ((n1531
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_CLK0_sampled$732
        CLK0))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$734$_Y
      (bool->bitvector (bveq n1531 (bv #b10 2))))) ; (bitvector 1)
  (let
    ((eqz_sync_neg
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$734$_Y)
        $auto$clk2fflogic.cc_102_sample_data$731$_Q
        $auto$clk2fflogic.cc_102_sample_data$729$_Q))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$809$_Q
      (ALU54B_State-$auto$clk2fflogic.cc_102_sample_data$809 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$811$_Q
      (ALU54B_State-$auto$clk2fflogic.cc_102_sample_data$811 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_CLK0_sampled$812
      (ALU54B_State-$auto$clk2fflogic.cc_86_sample_control_edge$813 state))) ; (bitvector 1)
  (let
    ((n1537
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_CLK0_sampled$812
        CLK0))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$814$_Y
      (bool->bitvector (bveq n1537 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((eqz_sync_pos
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$814$_Y)
        $auto$clk2fflogic.cc_102_sample_data$811$_Q
        $auto$clk2fflogic.cc_102_sample_data$809$_Q))) ; (bitvector 1)
  (let ((n1540 (extract 53 0 r_out))) ; (bitvector 54)
  (let
    (($reduce_or$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2124$191_Y
      (apply bvor (bitvector->bits n1540)))) ; (bitvector 1)
  (let
    (($logic_not$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2124$192$_Y
      (bvnot
        $reduce_or$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2124$191_Y))) ; (bitvector 1)
  (let
    (($xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2244$238_Y
      (bvxor
        eqz_sync_pos
        $logic_not$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2124$192$_Y))) ; (bitvector 1)
  (let
    (($procmux$294$_Y
      (if
        (bitvector->bool CE0)
        $xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2244$238_Y
        eqz_sync_neg))) ; (bitvector 1)
  (let
    (($0_eqz_sync_neg_0_0_
      (if (bitvector->bool RST0) (bv #b0 1) $procmux$294$_Y))) ; (bitvector 1)
  (let
    (($xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2223$227_Y
      (bvxor
        eqz_sync_neg
        $logic_not$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2124$192$_Y))) ; (bitvector 1)
  (let
    (($procmux$334$_Y
      (if
        (bitvector->bool CE0)
        $xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2223$227_Y
        eqz_sync_pos))) ; (bitvector 1)
  (let
    (($0_eqz_sync_pos_0_0_
      (if (bitvector->bool RST0) (bv #b0 1) $procmux$334$_Y))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$759$_Q
      (ALU54B_State-$auto$clk2fflogic.cc_102_sample_data$759 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$761$_Q
      (ALU54B_State-$auto$clk2fflogic.cc_102_sample_data$761 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_CLK0_sampled$762
      (ALU54B_State-$auto$clk2fflogic.cc_86_sample_control_edge$763 state))) ; (bitvector 1)
  (let
    ((n1552
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_CLK0_sampled$762
        CLK0))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$764$_Y
      (bool->bitvector (bveq n1552 (bv #b10 2))))) ; (bitvector 1)
  (let
    ((eqpatb_sync_neg
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$764$_Y)
        $auto$clk2fflogic.cc_102_sample_data$761$_Q
        $auto$clk2fflogic.cc_102_sample_data$759$_Q))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$839$_Q
      (ALU54B_State-$auto$clk2fflogic.cc_102_sample_data$839 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$841$_Q
      (ALU54B_State-$auto$clk2fflogic.cc_102_sample_data$841 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_CLK0_sampled$842
      (ALU54B_State-$auto$clk2fflogic.cc_86_sample_control_edge$843 state))) ; (bitvector 1)
  (let
    ((n1558
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_CLK0_sampled$842
        CLK0))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$844$_Y
      (bool->bitvector (bveq n1558 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((eqpatb_sync_pos
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$844$_Y)
        $auto$clk2fflogic.cc_102_sample_data$841$_Q
        $auto$clk2fflogic.cc_102_sample_data$839$_Q))) ; (bitvector 1)
  (let ((n1561 (concat c_sig_sync1 c_sig_sync0))) ; (bitvector 54)
  (let ((MCPAT (ALU54B_Inputs-MCPAT inputs))) ; (bitvector 56)
  (let ((n1563 (extract 53 0 MCPAT))) ; (bitvector 54)
  (let ((MCPAT_SOURCE (ALU54B_Inputs-MCPAT_SOURCE inputs))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2132$203$_Y
      (bool->bitvector (bveq MCPAT_SOURCE (bv #b10111 5))))) ; (bitvector 1)
  (let
    (($procmux$349$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2132$203$_Y)
        n1563
        n1561))) ; (bitvector 54)
  (let
    (($xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2147$206_Y
      (bvxor n1540 $procmux$349$_Y))) ; (bitvector 54)
  (let ((MASKPAT (ALU54B_Inputs-MASKPAT inputs))) ; (bitvector 56)
  (let ((n1570 (extract 53 0 MASKPAT))) ; (bitvector 54)
  (let ((MASKPAT_SOURCE (ALU54B_Inputs-MASKPAT_SOURCE inputs))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2140$205$_Y
      (bool->bitvector (bveq MASKPAT_SOURCE (bv #b10111 5))))) ; (bitvector 1)
  (let
    ((maskpat_sel
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2140$205$_Y)
        n1570
        n1561))) ; (bitvector 54)
  (let
    (($or$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2147$207$_Y
      (bvor
        $xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2147$206_Y
        maskpat_sel))) ; (bitvector 54)
  (let
    (($reduce_and$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2147$208$_Y
      (apply
        bvand
        (bitvector->bits
          $or$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2147$207$_Y)))) ; (bitvector 1)
  (let
    (($xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2247$241_Y
      (bvxor
        eqpatb_sync_pos
        $reduce_and$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2147$208$_Y))) ; (bitvector 1)
  (let
    (($procmux$279$_Y
      (if
        (bitvector->bool CE0)
        $xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2247$241_Y
        eqpatb_sync_neg))) ; (bitvector 1)
  (let
    (($0_eqpatb_sync_neg_0_0_
      (if (bitvector->bool RST0) (bv #b0 1) $procmux$279$_Y))) ; (bitvector 1)
  (let
    (($xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2226$230_Y
      (bvxor
        eqpatb_sync_neg
        $reduce_and$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2147$208$_Y))) ; (bitvector 1)
  (let
    (($procmux$319$_Y
      (if
        (bitvector->bool CE0)
        $xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2226$230_Y
        eqpatb_sync_pos))) ; (bitvector 1)
  (let
    (($0_eqpatb_sync_pos_0_0_
      (if (bitvector->bool RST0) (bv #b0 1) $procmux$319$_Y))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$769$_Q
      (ALU54B_State-$auto$clk2fflogic.cc_102_sample_data$769 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$771$_Q
      (ALU54B_State-$auto$clk2fflogic.cc_102_sample_data$771 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_CLK0_sampled$772
      (ALU54B_State-$auto$clk2fflogic.cc_86_sample_control_edge$773 state))) ; (bitvector 1)
  (let
    ((n1585
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_CLK0_sampled$772
        CLK0))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$774$_Y
      (bool->bitvector (bveq n1585 (bv #b10 2))))) ; (bitvector 1)
  (let
    ((eqpat_sync_neg
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$774$_Y)
        $auto$clk2fflogic.cc_102_sample_data$771$_Q
        $auto$clk2fflogic.cc_102_sample_data$769$_Q))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$849$_Q
      (ALU54B_State-$auto$clk2fflogic.cc_102_sample_data$849 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$851$_Q
      (ALU54B_State-$auto$clk2fflogic.cc_102_sample_data$851 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_CLK0_sampled$852
      (ALU54B_State-$auto$clk2fflogic.cc_86_sample_control_edge$853 state))) ; (bitvector 1)
  (let
    ((n1591
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_CLK0_sampled$852
        CLK0))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$854$_Y
      (bool->bitvector (bveq n1591 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((eqpat_sync_pos
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$854$_Y)
        $auto$clk2fflogic.cc_102_sample_data$851$_Q
        $auto$clk2fflogic.cc_102_sample_data$849$_Q))) ; (bitvector 1)
  (let
    (($not$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2148$210$_Y
      (bvnot
        $xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2147$206_Y))) ; (bitvector 54)
  (let
    (($or$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2148$211$_Y
      (bvor
        $not$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2148$210$_Y
        maskpat_sel))) ; (bitvector 54)
  (let
    (($reduce_and$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2148$212$_Y
      (apply
        bvand
        (bitvector->bits
          $or$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2148$211$_Y)))) ; (bitvector 1)
  (let
    (($xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2248$242_Y
      (bvxor
        eqpat_sync_pos
        $reduce_and$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2148$212$_Y))) ; (bitvector 1)
  (let
    (($procmux$274$_Y
      (if
        (bitvector->bool CE0)
        $xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2248$242_Y
        eqpat_sync_neg))) ; (bitvector 1)
  (let
    (($0_eqpat_sync_neg_0_0_
      (if (bitvector->bool RST0) (bv #b0 1) $procmux$274$_Y))) ; (bitvector 1)
  (let
    (($xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2227$231_Y
      (bvxor
        eqpat_sync_neg
        $reduce_and$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2148$212$_Y))) ; (bitvector 1)
  (let
    (($procmux$314$_Y
      (if
        (bitvector->bool CE0)
        $xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2227$231_Y
        eqpat_sync_pos))) ; (bitvector 1)
  (let
    (($0_eqpat_sync_pos_0_0_
      (if (bitvector->bool RST0) (bv #b0 1) $procmux$314$_Y))) ; (bitvector 1)
  (let
    (($xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2246$240_Y
      (bvxor eqom_sync_pos eqom_sig))) ; (bitvector 1)
  (let
    (($procmux$284$_Y
      (if
        (bitvector->bool CE0)
        $xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2246$240_Y
        eqom_sync_neg))) ; (bitvector 1)
  (let
    (($0_eqom_sync_neg_0_0_
      (if (bitvector->bool RST0) (bv #b0 1) $procmux$284$_Y))) ; (bitvector 1)
  (let
    (($xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2225$229_Y
      (bvxor eqom_sync_neg eqom_sig))) ; (bitvector 1)
  (let
    (($procmux$324$_Y
      (if
        (bitvector->bool CE0)
        $xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_2225$229_Y
        eqom_sync_pos))) ; (bitvector 1)
  (let
    (($0_eqom_sync_pos_0_0_
      (if (bitvector->bool RST0) (bv #b0 1) $procmux$324$_Y))) ; (bitvector 1)
  (let ((n1609 (extract 17 0 r_out))) ; (bitvector 18)
  (let (($procmux$361$_Y (if (bitvector->bool CE0) n1609 r_out_lsb_sync))) ; (bitvector 18)
  (let
    (($0_r_out_lsb_sync_17_0_
      (if (bitvector->bool RST0) (bv #b000000000000000000 18) $procmux$361$_Y))) ; (bitvector 18)
  (let ((UNDER (bvxor under_sync_pos under_sync_neg))) ; (bitvector 1)
  (let ((R9 (extract 9 9 r_out_lsb_sync))) ; (bitvector 1)
  (let ((R8 (extract 8 8 r_out_lsb_sync))) ; (bitvector 1)
  (let ((R7 (extract 7 7 r_out_lsb_sync))) ; (bitvector 1)
  (let ((R6 (extract 6 6 r_out_lsb_sync))) ; (bitvector 1)
  (let ((R53 (extract 35 35 r_out_msb))) ; (bitvector 1)
  (let ((R52 (extract 34 34 r_out_msb))) ; (bitvector 1)
  (let ((R51 (extract 33 33 r_out_msb))) ; (bitvector 1)
  (let ((R50 (extract 32 32 r_out_msb))) ; (bitvector 1)
  (let ((R5 (extract 5 5 r_out_lsb_sync))) ; (bitvector 1)
  (let ((R49 (extract 31 31 r_out_msb))) ; (bitvector 1)
  (let ((R48 (extract 30 30 r_out_msb))) ; (bitvector 1)
  (let ((R47 (extract 29 29 r_out_msb))) ; (bitvector 1)
  (let ((R46 (extract 28 28 r_out_msb))) ; (bitvector 1)
  (let ((R45 (extract 27 27 r_out_msb))) ; (bitvector 1)
  (let ((R44 (extract 26 26 r_out_msb))) ; (bitvector 1)
  (let ((R43 (extract 25 25 r_out_msb))) ; (bitvector 1)
  (let ((R42 (extract 24 24 r_out_msb))) ; (bitvector 1)
  (let ((R41 (extract 23 23 r_out_msb))) ; (bitvector 1)
  (let ((R40 (extract 22 22 r_out_msb))) ; (bitvector 1)
  (let ((R4 (extract 4 4 r_out_lsb_sync))) ; (bitvector 1)
  (let ((R39 (extract 21 21 r_out_msb))) ; (bitvector 1)
  (let ((R38 (extract 20 20 r_out_msb))) ; (bitvector 1)
  (let ((R37 (extract 19 19 r_out_msb))) ; (bitvector 1)
  (let ((R36 (extract 18 18 r_out_msb))) ; (bitvector 1)
  (let ((R35 (extract 17 17 r_out_msb))) ; (bitvector 1)
  (let ((R34 (extract 16 16 r_out_msb))) ; (bitvector 1)
  (let ((R33 (extract 15 15 r_out_msb))) ; (bitvector 1)
  (let ((R32 (extract 14 14 r_out_msb))) ; (bitvector 1)
  (let ((R31 (extract 13 13 r_out_msb))) ; (bitvector 1)
  (let ((R30 (extract 12 12 r_out_msb))) ; (bitvector 1)
  (let ((R3 (extract 3 3 r_out_lsb_sync))) ; (bitvector 1)
  (let ((R29 (extract 11 11 r_out_msb))) ; (bitvector 1)
  (let ((R28 (extract 10 10 r_out_msb))) ; (bitvector 1)
  (let ((R27 (extract 9 9 r_out_msb))) ; (bitvector 1)
  (let ((R26 (extract 8 8 r_out_msb))) ; (bitvector 1)
  (let ((R25 (extract 7 7 r_out_msb))) ; (bitvector 1)
  (let ((R24 (extract 6 6 r_out_msb))) ; (bitvector 1)
  (let ((R23 (extract 5 5 r_out_msb))) ; (bitvector 1)
  (let ((R22 (extract 4 4 r_out_msb))) ; (bitvector 1)
  (let ((R21 (extract 3 3 r_out_msb))) ; (bitvector 1)
  (let ((R20 (extract 2 2 r_out_msb))) ; (bitvector 1)
  (let ((R2 (extract 2 2 r_out_lsb_sync))) ; (bitvector 1)
  (let ((R19 (extract 1 1 r_out_msb))) ; (bitvector 1)
  (let ((R18 (extract 0 0 r_out_msb))) ; (bitvector 1)
  (let ((R17 (extract 17 17 r_out_lsb_sync))) ; (bitvector 1)
  (let ((R16 (extract 16 16 r_out_lsb_sync))) ; (bitvector 1)
  (let ((R15 (extract 15 15 r_out_lsb_sync))) ; (bitvector 1)
  (let ((R14 (extract 14 14 r_out_lsb_sync))) ; (bitvector 1)
  (let ((R13 (extract 13 13 r_out_lsb_sync))) ; (bitvector 1)
  (let ((R12 (extract 12 12 r_out_lsb_sync))) ; (bitvector 1)
  (let ((R11 (extract 11 11 r_out_lsb_sync))) ; (bitvector 1)
  (let ((R10 (extract 10 10 r_out_lsb_sync))) ; (bitvector 1)
  (let ((R1 (extract 1 1 r_out_lsb_sync))) ; (bitvector 1)
  (let ((R0 (extract 0 0 r_out_lsb_sync))) ; (bitvector 1)
  (let ((OVERUNDER (bvxor overunder_sync_pos overunder_sync_neg))) ; (bitvector 1)
  (let ((OVER (bvxor over_sync_pos over_sync_neg))) ; (bitvector 1)
  (let ((EQZ (bvxor eqz_sync_pos eqz_sync_neg))) ; (bitvector 1)
  (let ((EQPATB (bvxor eqpatb_sync_pos eqpatb_sync_neg))) ; (bitvector 1)
  (let ((EQPAT (bvxor eqpat_sync_pos eqpat_sync_neg))) ; (bitvector 1)
  (let ((n1672 (apply bvor (bitvector->bits REG_INPUTCFB_CLK)))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_1655$93$_Y
      (bvnot n1672))) ; (bitvector 1)
  (let
    (($procmux$538$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_modified_ALU54B.v_1655$93$_Y)
        n1355
        cfb_sync))) ; (bitvector 54)
  (let ((CO9 (extract 9 9 $procmux$538$_Y))) ; (bitvector 1)
  (let ((CO8 (extract 8 8 $procmux$538$_Y))) ; (bitvector 1)
  (let ((CO7 (extract 7 7 $procmux$538$_Y))) ; (bitvector 1)
  (let ((CO6 (extract 6 6 $procmux$538$_Y))) ; (bitvector 1)
  (let ((CO53 (extract 53 53 $procmux$538$_Y))) ; (bitvector 1)
  (let ((CO52 (extract 52 52 $procmux$538$_Y))) ; (bitvector 1)
  (let ((CO51 (extract 51 51 $procmux$538$_Y))) ; (bitvector 1)
  (let ((CO50 (extract 50 50 $procmux$538$_Y))) ; (bitvector 1)
  (let ((CO5 (extract 5 5 $procmux$538$_Y))) ; (bitvector 1)
  (let ((CO49 (extract 49 49 $procmux$538$_Y))) ; (bitvector 1)
  (let ((CO48 (extract 48 48 $procmux$538$_Y))) ; (bitvector 1)
  (let ((CO47 (extract 47 47 $procmux$538$_Y))) ; (bitvector 1)
  (let ((CO46 (extract 46 46 $procmux$538$_Y))) ; (bitvector 1)
  (let ((CO45 (extract 45 45 $procmux$538$_Y))) ; (bitvector 1)
  (let ((CO44 (extract 44 44 $procmux$538$_Y))) ; (bitvector 1)
  (let ((CO43 (extract 43 43 $procmux$538$_Y))) ; (bitvector 1)
  (let ((CO42 (extract 42 42 $procmux$538$_Y))) ; (bitvector 1)
  (let ((CO41 (extract 41 41 $procmux$538$_Y))) ; (bitvector 1)
  (let ((CO40 (extract 40 40 $procmux$538$_Y))) ; (bitvector 1)
  (let ((CO4 (extract 4 4 $procmux$538$_Y))) ; (bitvector 1)
  (let ((CO39 (extract 39 39 $procmux$538$_Y))) ; (bitvector 1)
  (let ((CO38 (extract 38 38 $procmux$538$_Y))) ; (bitvector 1)
  (let ((CO37 (extract 37 37 $procmux$538$_Y))) ; (bitvector 1)
  (let ((CO36 (extract 36 36 $procmux$538$_Y))) ; (bitvector 1)
  (let ((CO35 (extract 35 35 $procmux$538$_Y))) ; (bitvector 1)
  (let ((CO34 (extract 34 34 $procmux$538$_Y))) ; (bitvector 1)
  (let ((CO33 (extract 33 33 $procmux$538$_Y))) ; (bitvector 1)
  (let ((CO32 (extract 32 32 $procmux$538$_Y))) ; (bitvector 1)
  (let ((CO31 (extract 31 31 $procmux$538$_Y))) ; (bitvector 1)
  (let ((CO30 (extract 30 30 $procmux$538$_Y))) ; (bitvector 1)
  (let ((CO3 (extract 3 3 $procmux$538$_Y))) ; (bitvector 1)
  (let ((CO29 (extract 29 29 $procmux$538$_Y))) ; (bitvector 1)
  (let ((CO28 (extract 28 28 $procmux$538$_Y))) ; (bitvector 1)
  (let ((CO27 (extract 27 27 $procmux$538$_Y))) ; (bitvector 1)
  (let ((CO26 (extract 26 26 $procmux$538$_Y))) ; (bitvector 1)
  (let ((CO25 (extract 25 25 $procmux$538$_Y))) ; (bitvector 1)
  (let ((CO24 (extract 24 24 $procmux$538$_Y))) ; (bitvector 1)
  (let ((CO23 (extract 23 23 $procmux$538$_Y))) ; (bitvector 1)
  (let ((CO22 (extract 22 22 $procmux$538$_Y))) ; (bitvector 1)
  (let ((CO21 (extract 21 21 $procmux$538$_Y))) ; (bitvector 1)
  (let ((CO20 (extract 20 20 $procmux$538$_Y))) ; (bitvector 1)
  (let ((CO2 (extract 2 2 $procmux$538$_Y))) ; (bitvector 1)
  (let ((CO19 (extract 19 19 $procmux$538$_Y))) ; (bitvector 1)
  (let ((CO18 (extract 18 18 $procmux$538$_Y))) ; (bitvector 1)
  (let ((CO17 (extract 17 17 $procmux$538$_Y))) ; (bitvector 1)
  (let ((CO16 (extract 16 16 $procmux$538$_Y))) ; (bitvector 1)
  (let ((CO15 (extract 15 15 $procmux$538$_Y))) ; (bitvector 1)
  (let ((CO14 (extract 14 14 $procmux$538$_Y))) ; (bitvector 1)
  (let ((CO13 (extract 13 13 $procmux$538$_Y))) ; (bitvector 1)
  (let ((CO12 (extract 12 12 $procmux$538$_Y))) ; (bitvector 1)
  (let ((CO11 (extract 11 11 $procmux$538$_Y))) ; (bitvector 1)
  (let ((CO10 (extract 10 10 $procmux$538$_Y))) ; (bitvector 1)
  (let ((CO1 (extract 1 1 $procmux$538$_Y))) ; (bitvector 1)
  (let ((CO0 (extract 0 0 $procmux$538$_Y))) ; (bitvector 1)
  (cons
    (ALU54B_Outputs
      UNDER ; UNDER
      signedr_sig ; SIGNEDR
      R9 ; R9
      R8 ; R8
      R7 ; R7
      R6 ; R6
      R53 ; R53
      R52 ; R52
      R51 ; R51
      R50 ; R50
      R5 ; R5
      R49 ; R49
      R48 ; R48
      R47 ; R47
      R46 ; R46
      R45 ; R45
      R44 ; R44
      R43 ; R43
      R42 ; R42
      R41 ; R41
      R40 ; R40
      R4 ; R4
      R39 ; R39
      R38 ; R38
      R37 ; R37
      R36 ; R36
      R35 ; R35
      R34 ; R34
      R33 ; R33
      R32 ; R32
      R31 ; R31
      R30 ; R30
      R3 ; R3
      R29 ; R29
      R28 ; R28
      R27 ; R27
      R26 ; R26
      R25 ; R25
      R24 ; R24
      R23 ; R23
      R22 ; R22
      R21 ; R21
      R20 ; R20
      R2 ; R2
      R19 ; R19
      R18 ; R18
      R17 ; R17
      R16 ; R16
      R15 ; R15
      R14 ; R14
      R13 ; R13
      R12 ; R12
      R11 ; R11
      R10 ; R10
      R1 ; R1
      R0 ; R0
      OVERUNDER ; OVERUNDER
      OVER ; OVER
      eqzm_gen ; EQZM
      EQZ ; EQZ
      EQPATB ; EQPATB
      EQPAT ; EQPAT
      eqom_gen ; EQOM
      CO9 ; CO9
      CO8 ; CO8
      CO7 ; CO7
      CO6 ; CO6
      CO53 ; CO53
      CO52 ; CO52
      CO51 ; CO51
      CO50 ; CO50
      CO5 ; CO5
      CO49 ; CO49
      CO48 ; CO48
      CO47 ; CO47
      CO46 ; CO46
      CO45 ; CO45
      CO44 ; CO44
      CO43 ; CO43
      CO42 ; CO42
      CO41 ; CO41
      CO40 ; CO40
      CO4 ; CO4
      CO39 ; CO39
      CO38 ; CO38
      CO37 ; CO37
      CO36 ; CO36
      CO35 ; CO35
      CO34 ; CO34
      CO33 ; CO33
      CO32 ; CO32
      CO31 ; CO31
      CO30 ; CO30
      CO3 ; CO3
      CO29 ; CO29
      CO28 ; CO28
      CO27 ; CO27
      CO26 ; CO26
      CO25 ; CO25
      CO24 ; CO24
      CO23 ; CO23
      CO22 ; CO22
      CO21 ; CO21
      CO20 ; CO20
      CO2 ; CO2
      CO19 ; CO19
      CO18 ; CO18
      CO17 ; CO17
      CO16 ; CO16
      CO15 ; CO15
      CO14 ; CO14
      CO13 ; CO13
      CO12 ; CO12
      CO11 ; CO11
      CO10 ; CO10
      CO1 ; CO1
      CO0 ; CO0
    )
    (ALU54B_State
      CLK0 ; $auto$clk2fflogic.cc:86:sample_control_edge$1033
      CLK0 ; $auto$clk2fflogic.cc:86:sample_control_edge$1043
      opin_sig_0_sync_neg ; $auto$clk2fflogic.cc:102:sample_data$1029
      $0_opin_sig_0_sync_neg_6_0_ ; $auto$clk2fflogic.cc:102:sample_data$1031
      opin_sig_0_sync_pos ; $auto$clk2fflogic.cc:102:sample_data$1039
      $0_opin_sig_0_sync_pos_6_0_ ; $auto$clk2fflogic.cc:102:sample_data$1041
      CLK0 ; $auto$clk2fflogic.cc:86:sample_control_edge$993
      CLK0 ; $auto$clk2fflogic.cc:86:sample_control_edge$1003
      CLK0 ; $auto$clk2fflogic.cc:86:sample_control_edge$1013
      CLK0 ; $auto$clk2fflogic.cc:86:sample_control_edge$1023
      op10_sig_0_sync_neg ; $auto$clk2fflogic.cc:102:sample_data$989
      $0_op10_sig_0_sync_neg_2_0_ ; $auto$clk2fflogic.cc:102:sample_data$991
      op10_sig_0_sync_pos ; $auto$clk2fflogic.cc:102:sample_data$999
      $0_op10_sig_0_sync_pos_2_0_ ; $auto$clk2fflogic.cc:102:sample_data$1001
      op7_sig_0_sync_neg ; $auto$clk2fflogic.cc:102:sample_data$1009
      $0_op7_sig_0_sync_neg_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$1011
      op7_sig_0_sync_pos ; $auto$clk2fflogic.cc:102:sample_data$1019
      $0_op7_sig_0_sync_pos_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$1021
      CLK0 ; $auto$clk2fflogic.cc:86:sample_control_edge$963
      CLK0 ; $auto$clk2fflogic.cc:86:sample_control_edge$973
      opin_sig_1_sync_neg ; $auto$clk2fflogic.cc:102:sample_data$959
      $0_opin_sig_1_sync_neg_6_0_ ; $auto$clk2fflogic.cc:102:sample_data$961
      opin_sig_1_sync_pos ; $auto$clk2fflogic.cc:102:sample_data$969
      $0_opin_sig_1_sync_pos_6_0_ ; $auto$clk2fflogic.cc:102:sample_data$971
      CLK0 ; $auto$clk2fflogic.cc:86:sample_control_edge$1063
      CLK0 ; $auto$clk2fflogic.cc:86:sample_control_edge$923
      CLK0 ; $auto$clk2fflogic.cc:86:sample_control_edge$933
      CLK0 ; $auto$clk2fflogic.cc:86:sample_control_edge$943
      CLK0 ; $auto$clk2fflogic.cc:86:sample_control_edge$953
      CLK0 ; $auto$clk2fflogic.cc:86:sample_control_edge$1053
      c_sig_sync0 ; $auto$clk2fflogic.cc:102:sample_data$1059
      $0_c_sig_sync0_26_0_ ; $auto$clk2fflogic.cc:102:sample_data$1061
      op10_sig_1_sync_neg ; $auto$clk2fflogic.cc:102:sample_data$919
      $0_op10_sig_1_sync_neg_2_0_ ; $auto$clk2fflogic.cc:102:sample_data$921
      op10_sig_1_sync_pos ; $auto$clk2fflogic.cc:102:sample_data$929
      $0_op10_sig_1_sync_pos_2_0_ ; $auto$clk2fflogic.cc:102:sample_data$931
      op7_sig_1_sync_neg ; $auto$clk2fflogic.cc:102:sample_data$939
      $0_op7_sig_1_sync_neg_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$941
      op7_sig_1_sync_pos ; $auto$clk2fflogic.cc:102:sample_data$949
      $0_op7_sig_1_sync_pos_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$951
      c_sig_sync1 ; $auto$clk2fflogic.cc:102:sample_data$1049
      $0_c_sig_sync1_26_0_ ; $auto$clk2fflogic.cc:102:sample_data$1051
      CLK0 ; $auto$clk2fflogic.cc:86:sample_control_edge$893
      CLK0 ; $auto$clk2fflogic.cc:86:sample_control_edge$903
      cfb_clk_sig ; $auto$clk2fflogic.cc:86:sample_control_edge$983
      CLK0 ; $auto$clk2fflogic.cc:86:sample_control_edge$793
      CLK0 ; $auto$clk2fflogic.cc:86:sample_control_edge$873
      CLK0 ; $auto$clk2fflogic.cc:86:sample_control_edge$803
      CLK0 ; $auto$clk2fflogic.cc:86:sample_control_edge$883
      CLK0 ; $auto$clk2fflogic.cc:86:sample_control_edge$783
      CLK0 ; $auto$clk2fflogic.cc:86:sample_control_edge$863
      CLK0 ; $auto$clk2fflogic.cc:86:sample_control_edge$743
      CLK0 ; $auto$clk2fflogic.cc:86:sample_control_edge$823
      CLK0 ; $auto$clk2fflogic.cc:86:sample_control_edge$733
      CLK0 ; $auto$clk2fflogic.cc:86:sample_control_edge$813
      CLK0 ; $auto$clk2fflogic.cc:86:sample_control_edge$763
      CLK0 ; $auto$clk2fflogic.cc:86:sample_control_edge$843
      CLK0 ; $auto$clk2fflogic.cc:86:sample_control_edge$773
      CLK0 ; $auto$clk2fflogic.cc:86:sample_control_edge$853
      CLK0 ; $auto$clk2fflogic.cc:86:sample_control_edge$753
      CLK0 ; $auto$clk2fflogic.cc:86:sample_control_edge$833
      CLK0 ; $auto$clk2fflogic.cc:86:sample_control_edge$913
      r_out_msb_sync_neg ; $auto$clk2fflogic.cc:102:sample_data$889
      $0_r_out_msb_sync_neg_36_0_ ; $auto$clk2fflogic.cc:102:sample_data$891
      r_out_msb_sync_pos ; $auto$clk2fflogic.cc:102:sample_data$899
      $0_r_out_msb_sync_pos_36_0_ ; $auto$clk2fflogic.cc:102:sample_data$901
      cfb_sync ; $auto$clk2fflogic.cc:102:sample_data$979
      $0_cfb_sync_53_0_ ; $auto$clk2fflogic.cc:102:sample_data$981
      under_sync_neg ; $auto$clk2fflogic.cc:102:sample_data$789
      $0_under_sync_neg_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$791
      under_sync_pos ; $auto$clk2fflogic.cc:102:sample_data$869
      $0_under_sync_pos_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$871
      overunder_sync_neg ; $auto$clk2fflogic.cc:102:sample_data$799
      $0_overunder_sync_neg_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$801
      overunder_sync_pos ; $auto$clk2fflogic.cc:102:sample_data$879
      $0_overunder_sync_pos_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$881
      over_sync_neg ; $auto$clk2fflogic.cc:102:sample_data$779
      $0_over_sync_neg_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$781
      over_sync_pos ; $auto$clk2fflogic.cc:102:sample_data$859
      $0_over_sync_pos_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$861
      eqzm_sync_neg ; $auto$clk2fflogic.cc:102:sample_data$739
      $0_eqzm_sync_neg_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$741
      eqzm_sync_pos ; $auto$clk2fflogic.cc:102:sample_data$819
      $0_eqzm_sync_pos_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$821
      eqz_sync_neg ; $auto$clk2fflogic.cc:102:sample_data$729
      $0_eqz_sync_neg_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$731
      eqz_sync_pos ; $auto$clk2fflogic.cc:102:sample_data$809
      $0_eqz_sync_pos_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$811
      eqpatb_sync_neg ; $auto$clk2fflogic.cc:102:sample_data$759
      $0_eqpatb_sync_neg_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$761
      eqpatb_sync_pos ; $auto$clk2fflogic.cc:102:sample_data$839
      $0_eqpatb_sync_pos_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$841
      eqpat_sync_neg ; $auto$clk2fflogic.cc:102:sample_data$769
      $0_eqpat_sync_neg_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$771
      eqpat_sync_pos ; $auto$clk2fflogic.cc:102:sample_data$849
      $0_eqpat_sync_pos_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$851
      eqom_sync_neg ; $auto$clk2fflogic.cc:102:sample_data$749
      $0_eqom_sync_neg_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$751
      eqom_sync_pos ; $auto$clk2fflogic.cc:102:sample_data$829
      $0_eqom_sync_pos_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$831
      r_out_lsb_sync ; $auto$clk2fflogic.cc:102:sample_data$909
      $0_r_out_lsb_sync_17_0_ ; $auto$clk2fflogic.cc:102:sample_data$911
    ))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
  ))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
  ))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
  ))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
  ))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
  ))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
  ))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
  ))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
  ))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
  ))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
  ))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
  ))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
  ))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
  ))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
  ))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
  ))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
  ))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
  ))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
  ))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
  ))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
  ))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
  ))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(define ALU54B_initial
  (ALU54B_State
    (bv #b0 1)
    (bv #b1 1)
    (bv #b0000000 7)
    (bv #b0000000 7)
    (bv #b0000000 7)
    (bv #b0000000 7)
    (bv #b0 1)
    (bv #b1 1)
    (bv #b0 1)
    (bv #b1 1)
    (bv #b000 3)
    (bv #b000 3)
    (bv #b000 3)
    (bv #b000 3)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b1 1)
    (bv #b0000000 7)
    (bv #b0000000 7)
    (bv #b0000000 7)
    (bv #b0000000 7)
    (bv #b1 1)
    (bv #b0 1)
    (bv #b1 1)
    (bv #b0 1)
    (bv #b1 1)
    (bv #b1 1)
    (bv #b000000000000000000000000000 27)
    (bv #b000000000000000000000000000 27)
    (bv #b000 3)
    (bv #b000 3)
    (bv #b000 3)
    (bv #b000 3)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b000000000000000000000000000 27)
    (bv #b000000000000000000000000000 27)
    (bv #b0 1)
    (bv #b1 1)
    (bv #b1 1)
    (bv #b0 1)
    (bv #b1 1)
    (bv #b0 1)
    (bv #b1 1)
    (bv #b0 1)
    (bv #b1 1)
    (bv #b0 1)
    (bv #b1 1)
    (bv #b0 1)
    (bv #b1 1)
    (bv #b0 1)
    (bv #b1 1)
    (bv #b0 1)
    (bv #b1 1)
    (bv #b0 1)
    (bv #b1 1)
    (bv #b1 1)
    (bv #b0000000000000000000000000000000000000 37)
    (bv #b0000000000000000000000000000000000000 37)
    (bv #b0000000000000000000000000000000000000 37)
    (bv #b0000000000000000000000000000000000000 37)
    (bv #b000000000000000000000000000000000000000000000000000000 54)
    (bv #b000000000000000000000000000000000000000000000000000000 54)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b000000000000000000 18)
    (bv #b000000000000000000 18)))
