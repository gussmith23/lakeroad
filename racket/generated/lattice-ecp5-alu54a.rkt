#lang rosette/safe
    (provide (rename-out [ALU54A lattice-ecp5-alu54a] [ALU54A_initial lattice-ecp5-alu54a-initial] [ALU54A_inputs_helper lattice-ecp5-alu54a-inputs] [ALU54A_outputs_helper lattice-ecp5-alu54a-outputs]))(struct
  ALU54A_Inputs
  (SIGNEDIB
    SIGNEDIA
    SIGNEDCIN
    RST3
    RST2
    RST1
    RST0
    RNDPAT
    REG_OUTPUT1_RST
    REG_OUTPUT1_CLK
    REG_OUTPUT1_CE
    REG_OUTPUT0_RST
    REG_OUTPUT0_CLK
    REG_OUTPUT0_CE
    REG_OPCODEOP1_1_CLK
    REG_OPCODEOP1_0_CLK
    REG_OPCODEOP0_1_RST
    REG_OPCODEOP0_1_CLK
    REG_OPCODEOP0_1_CE
    REG_OPCODEOP0_0_RST
    REG_OPCODEOP0_0_CLK
    REG_OPCODEOP0_0_CE
    REG_OPCODEIN_1_RST
    REG_OPCODEIN_1_CLK
    REG_OPCODEIN_1_CE
    REG_OPCODEIN_0_RST
    REG_OPCODEIN_0_CLK
    REG_OPCODEIN_0_CE
    REG_INPUTC1_RST
    REG_INPUTC1_CLK
    REG_INPUTC1_CE
    REG_INPUTC0_RST
    REG_INPUTC0_CLK
    REG_INPUTC0_CE
    REG_FLAG_RST
    REG_FLAG_CLK
    REG_FLAG_CE
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
  ; REG_OUTPUT1_RST (bitvector 5)
  ; REG_OUTPUT1_CLK (bitvector 5)
  ; REG_OUTPUT1_CE (bitvector 5)
  ; REG_OUTPUT0_RST (bitvector 5)
  ; REG_OUTPUT0_CLK (bitvector 5)
  ; REG_OUTPUT0_CE (bitvector 5)
  ; REG_OPCODEOP1_1_CLK (bitvector 5)
  ; REG_OPCODEOP1_0_CLK (bitvector 5)
  ; REG_OPCODEOP0_1_RST (bitvector 5)
  ; REG_OPCODEOP0_1_CLK (bitvector 5)
  ; REG_OPCODEOP0_1_CE (bitvector 5)
  ; REG_OPCODEOP0_0_RST (bitvector 5)
  ; REG_OPCODEOP0_0_CLK (bitvector 5)
  ; REG_OPCODEOP0_0_CE (bitvector 5)
  ; REG_OPCODEIN_1_RST (bitvector 5)
  ; REG_OPCODEIN_1_CLK (bitvector 5)
  ; REG_OPCODEIN_1_CE (bitvector 5)
  ; REG_OPCODEIN_0_RST (bitvector 5)
  ; REG_OPCODEIN_0_CLK (bitvector 5)
  ; REG_OPCODEIN_0_CE (bitvector 5)
  ; REG_INPUTC1_RST (bitvector 5)
  ; REG_INPUTC1_CLK (bitvector 5)
  ; REG_INPUTC1_CE (bitvector 5)
  ; REG_INPUTC0_RST (bitvector 5)
  ; REG_INPUTC0_CLK (bitvector 5)
  ; REG_INPUTC0_CE (bitvector 5)
  ; REG_FLAG_RST (bitvector 5)
  ; REG_FLAG_CLK (bitvector 5)
  ; REG_FLAG_CE (bitvector 5)
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
  ALU54A_Outputs
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
    EQOM)
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
)
(struct
  ALU54A_State
  ($auto$clk2fflogic.cc_86_sample_control_edge$1739
    $auto$clk2fflogic.cc_86_sample_control_edge$1709
    $auto$clk2fflogic.cc_102_sample_data$1735
    $auto$clk2fflogic.cc_102_sample_data$1737
    $auto$clk2fflogic.cc_86_sample_control_edge$1719
    $auto$clk2fflogic.cc_86_sample_control_edge$1729
    $auto$clk2fflogic.cc_102_sample_data$1705
    $auto$clk2fflogic.cc_102_sample_data$1707
    $auto$clk2fflogic.cc_86_sample_control_edge$1759
    $auto$clk2fflogic.cc_86_sample_control_edge$1749
    $auto$clk2fflogic.cc_86_sample_control_edge$1689
    $auto$clk2fflogic.cc_86_sample_control_edge$1699
    $auto$clk2fflogic.cc_102_sample_data$1715
    $auto$clk2fflogic.cc_102_sample_data$1717
    $auto$clk2fflogic.cc_102_sample_data$1725
    $auto$clk2fflogic.cc_102_sample_data$1727
    $auto$clk2fflogic.cc_102_sample_data$1755
    $auto$clk2fflogic.cc_102_sample_data$1757
    $auto$clk2fflogic.cc_102_sample_data$1745
    $auto$clk2fflogic.cc_102_sample_data$1747
    $auto$clk2fflogic.cc_102_sample_data$1685
    $auto$clk2fflogic.cc_102_sample_data$1687
    $auto$clk2fflogic.cc_102_sample_data$1695
    $auto$clk2fflogic.cc_102_sample_data$1697
    $auto$clk2fflogic.cc_86_sample_control_edge$1669
    $auto$clk2fflogic.cc_86_sample_control_edge$1679
    $auto$clk2fflogic.cc_86_sample_control_edge$1649
    $auto$clk2fflogic.cc_86_sample_control_edge$1659
    $auto$clk2fflogic.cc_86_sample_control_edge$1639
    $auto$clk2fflogic.cc_86_sample_control_edge$1599
    $auto$clk2fflogic.cc_86_sample_control_edge$1589
    $auto$clk2fflogic.cc_86_sample_control_edge$1619
    $auto$clk2fflogic.cc_86_sample_control_edge$1629
    $auto$clk2fflogic.cc_86_sample_control_edge$1609
    $auto$clk2fflogic.cc_102_sample_data$1665
    $auto$clk2fflogic.cc_102_sample_data$1667
    $auto$clk2fflogic.cc_102_sample_data$1675
    $auto$clk2fflogic.cc_102_sample_data$1677
    $auto$clk2fflogic.cc_102_sample_data$1645
    $auto$clk2fflogic.cc_102_sample_data$1647
    $auto$clk2fflogic.cc_102_sample_data$1655
    $auto$clk2fflogic.cc_102_sample_data$1657
    $auto$clk2fflogic.cc_102_sample_data$1635
    $auto$clk2fflogic.cc_102_sample_data$1637
    $auto$clk2fflogic.cc_102_sample_data$1595
    $auto$clk2fflogic.cc_102_sample_data$1597
    $auto$clk2fflogic.cc_102_sample_data$1585
    $auto$clk2fflogic.cc_102_sample_data$1587
    $auto$clk2fflogic.cc_102_sample_data$1615
    $auto$clk2fflogic.cc_102_sample_data$1617
    $auto$clk2fflogic.cc_102_sample_data$1625
    $auto$clk2fflogic.cc_102_sample_data$1627
    $auto$clk2fflogic.cc_102_sample_data$1605
    $auto$clk2fflogic.cc_102_sample_data$1607)
  #:transparent
  ; $auto$clk2fflogic.cc_86_sample_control_edge$1739 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$1709 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$1735 (bitvector 7)
  ; $auto$clk2fflogic.cc_102_sample_data$1737 (bitvector 7)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$1719 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$1729 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$1705 (bitvector 7)
  ; $auto$clk2fflogic.cc_102_sample_data$1707 (bitvector 7)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$1759 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$1749 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$1689 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$1699 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$1715 (bitvector 3)
  ; $auto$clk2fflogic.cc_102_sample_data$1717 (bitvector 3)
  ; $auto$clk2fflogic.cc_102_sample_data$1725 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$1727 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$1755 (bitvector 27)
  ; $auto$clk2fflogic.cc_102_sample_data$1757 (bitvector 27)
  ; $auto$clk2fflogic.cc_102_sample_data$1745 (bitvector 27)
  ; $auto$clk2fflogic.cc_102_sample_data$1747 (bitvector 27)
  ; $auto$clk2fflogic.cc_102_sample_data$1685 (bitvector 3)
  ; $auto$clk2fflogic.cc_102_sample_data$1687 (bitvector 3)
  ; $auto$clk2fflogic.cc_102_sample_data$1695 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$1697 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$1669 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$1679 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$1649 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$1659 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$1639 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$1599 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$1589 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$1619 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$1629 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$1609 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$1665 (bitvector 36)
  ; $auto$clk2fflogic.cc_102_sample_data$1667 (bitvector 36)
  ; $auto$clk2fflogic.cc_102_sample_data$1675 (bitvector 18)
  ; $auto$clk2fflogic.cc_102_sample_data$1677 (bitvector 18)
  ; $auto$clk2fflogic.cc_102_sample_data$1645 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$1647 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$1655 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$1657 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$1635 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$1637 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$1595 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$1597 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$1585 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$1587 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$1615 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$1617 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$1625 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$1627 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$1605 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$1607 (bitvector 1)
)
(define
  (ALU54A_inputs_helper inputs)
  (ALU54A_Inputs
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
          (assoc "REG_OUTPUT1_RST" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "REG_OUTPUT1_CLK" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "REG_OUTPUT1_CE" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "REG_OUTPUT0_RST" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "REG_OUTPUT0_CLK" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "REG_OUTPUT0_CE" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "REG_OPCODEOP1_1_CLK" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "REG_OPCODEOP1_0_CLK" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "REG_OPCODEOP0_1_RST" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "REG_OPCODEOP0_1_CLK" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "REG_OPCODEOP0_1_CE" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "REG_OPCODEOP0_0_RST" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "REG_OPCODEOP0_0_CLK" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "REG_OPCODEOP0_0_CE" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "REG_OPCODEIN_1_RST" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "REG_OPCODEIN_1_CLK" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "REG_OPCODEIN_1_CE" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "REG_OPCODEIN_0_RST" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "REG_OPCODEIN_0_CLK" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "REG_OPCODEIN_0_CE" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "REG_INPUTC1_RST" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "REG_INPUTC1_CLK" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "REG_INPUTC1_CE" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "REG_INPUTC0_RST" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "REG_INPUTC0_CLK" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "REG_INPUTC0_CE" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "REG_FLAG_RST" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "REG_FLAG_CLK" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "REG_FLAG_CE" inputs)))
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
  (ALU54A_outputs_helper outputs)
  (list
    (cons "UNDER" (ALU54A_Outputs-UNDER outputs))
    (cons "SIGNEDR" (ALU54A_Outputs-SIGNEDR outputs))
    (cons "R9" (ALU54A_Outputs-R9 outputs))
    (cons "R8" (ALU54A_Outputs-R8 outputs))
    (cons "R7" (ALU54A_Outputs-R7 outputs))
    (cons "R6" (ALU54A_Outputs-R6 outputs))
    (cons "R53" (ALU54A_Outputs-R53 outputs))
    (cons "R52" (ALU54A_Outputs-R52 outputs))
    (cons "R51" (ALU54A_Outputs-R51 outputs))
    (cons "R50" (ALU54A_Outputs-R50 outputs))
    (cons "R5" (ALU54A_Outputs-R5 outputs))
    (cons "R49" (ALU54A_Outputs-R49 outputs))
    (cons "R48" (ALU54A_Outputs-R48 outputs))
    (cons "R47" (ALU54A_Outputs-R47 outputs))
    (cons "R46" (ALU54A_Outputs-R46 outputs))
    (cons "R45" (ALU54A_Outputs-R45 outputs))
    (cons "R44" (ALU54A_Outputs-R44 outputs))
    (cons "R43" (ALU54A_Outputs-R43 outputs))
    (cons "R42" (ALU54A_Outputs-R42 outputs))
    (cons "R41" (ALU54A_Outputs-R41 outputs))
    (cons "R40" (ALU54A_Outputs-R40 outputs))
    (cons "R4" (ALU54A_Outputs-R4 outputs))
    (cons "R39" (ALU54A_Outputs-R39 outputs))
    (cons "R38" (ALU54A_Outputs-R38 outputs))
    (cons "R37" (ALU54A_Outputs-R37 outputs))
    (cons "R36" (ALU54A_Outputs-R36 outputs))
    (cons "R35" (ALU54A_Outputs-R35 outputs))
    (cons "R34" (ALU54A_Outputs-R34 outputs))
    (cons "R33" (ALU54A_Outputs-R33 outputs))
    (cons "R32" (ALU54A_Outputs-R32 outputs))
    (cons "R31" (ALU54A_Outputs-R31 outputs))
    (cons "R30" (ALU54A_Outputs-R30 outputs))
    (cons "R3" (ALU54A_Outputs-R3 outputs))
    (cons "R29" (ALU54A_Outputs-R29 outputs))
    (cons "R28" (ALU54A_Outputs-R28 outputs))
    (cons "R27" (ALU54A_Outputs-R27 outputs))
    (cons "R26" (ALU54A_Outputs-R26 outputs))
    (cons "R25" (ALU54A_Outputs-R25 outputs))
    (cons "R24" (ALU54A_Outputs-R24 outputs))
    (cons "R23" (ALU54A_Outputs-R23 outputs))
    (cons "R22" (ALU54A_Outputs-R22 outputs))
    (cons "R21" (ALU54A_Outputs-R21 outputs))
    (cons "R20" (ALU54A_Outputs-R20 outputs))
    (cons "R2" (ALU54A_Outputs-R2 outputs))
    (cons "R19" (ALU54A_Outputs-R19 outputs))
    (cons "R18" (ALU54A_Outputs-R18 outputs))
    (cons "R17" (ALU54A_Outputs-R17 outputs))
    (cons "R16" (ALU54A_Outputs-R16 outputs))
    (cons "R15" (ALU54A_Outputs-R15 outputs))
    (cons "R14" (ALU54A_Outputs-R14 outputs))
    (cons "R13" (ALU54A_Outputs-R13 outputs))
    (cons "R12" (ALU54A_Outputs-R12 outputs))
    (cons "R11" (ALU54A_Outputs-R11 outputs))
    (cons "R10" (ALU54A_Outputs-R10 outputs))
    (cons "R1" (ALU54A_Outputs-R1 outputs))
    (cons "R0" (ALU54A_Outputs-R0 outputs))
    (cons "OVERUNDER" (ALU54A_Outputs-OVERUNDER outputs))
    (cons "OVER" (ALU54A_Outputs-OVER outputs))
    (cons "EQZM" (ALU54A_Outputs-EQZM outputs))
    (cons "EQZ" (ALU54A_Outputs-EQZ outputs))
    (cons "EQPATB" (ALU54A_Outputs-EQPATB outputs))
    (cons "EQPAT" (ALU54A_Outputs-EQPAT outputs))
    (cons "EQOM" (ALU54A_Outputs-EQOM outputs))))
(define (ALU54A inputs state)
  (let ((CLK0 (ALU54A_Inputs-CLK0 inputs))) ; (bitvector 1)
  (let ((CLK3 (ALU54A_Inputs-CLK3 inputs))) ; (bitvector 1)
  (let ((REG_OPCODEIN_0_CLK (ALU54A_Inputs-REG_OPCODEIN_0_CLK inputs))) ; (bitvector 5)
  (let ((n4 (zero-extend (bv #b1110 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1085$82$_Y
      (bool->bitvector (bveq REG_OPCODEIN_0_CLK n4)))) ; (bitvector 1)
  (let
    (($procmux$1033$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1085$82$_Y)
        CLK3
        CLK0))) ; (bitvector 1)
  (let ((CLK2 (ALU54A_Inputs-CLK2 inputs))) ; (bitvector 1)
  (let ((n9 (zero-extend (bv #b1101 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1084$81$_Y
      (bool->bitvector (bveq REG_OPCODEIN_0_CLK n9)))) ; (bitvector 1)
  (let
    (($procmux$1045$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1084$81$_Y)
        CLK2
        $procmux$1033$_Y))) ; (bitvector 1)
  (let ((CLK1 (ALU54A_Inputs-CLK1 inputs))) ; (bitvector 1)
  (let ((n14 (zero-extend (bv #b1100 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1083$80$_Y
      (bool->bitvector (bveq REG_OPCODEIN_0_CLK n14)))) ; (bitvector 1)
  (let
    (($procmux$1054$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1083$80$_Y)
        CLK1
        $procmux$1045$_Y))) ; (bitvector 1)
  (let ((n18 (zero-extend (bv #b1011 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1082$79$_Y
      (bool->bitvector (bveq REG_OPCODEIN_0_CLK n18)))) ; (bitvector 1)
  (let
    ((opcodein_0_clk_sig
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1082$79$_Y)
        CLK0
        $procmux$1054$_Y))) ; (bitvector 1)
  (let ((REG_OPCODEIN_1_CLK (ALU54A_Inputs-REG_OPCODEIN_1_CLK inputs))) ; (bitvector 5)
  (let ((n22 (zero-extend (bv #b1110 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1165$117$_Y
      (bool->bitvector (bveq REG_OPCODEIN_1_CLK n22)))) ; (bitvector 1)
  (let
    (($procmux$823$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1165$117$_Y)
        CLK3
        CLK0))) ; (bitvector 1)
  (let ((n25 (zero-extend (bv #b1101 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1164$116$_Y
      (bool->bitvector (bveq REG_OPCODEIN_1_CLK n25)))) ; (bitvector 1)
  (let
    (($procmux$835$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1164$116$_Y)
        CLK2
        $procmux$823$_Y))) ; (bitvector 1)
  (let ((n28 (zero-extend (bv #b1100 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1163$115$_Y
      (bool->bitvector (bveq REG_OPCODEIN_1_CLK n28)))) ; (bitvector 1)
  (let
    (($procmux$844$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1163$115$_Y)
        CLK1
        $procmux$835$_Y))) ; (bitvector 1)
  (let ((n31 (zero-extend (bv #b1011 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1162$114$_Y
      (bool->bitvector (bveq REG_OPCODEIN_1_CLK n31)))) ; (bitvector 1)
  (let
    ((opcodein_1_clk_sig
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1162$114$_Y)
        CLK0
        $procmux$844$_Y))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$1735$_Q
      (ALU54A_State-$auto$clk2fflogic.cc_102_sample_data$1735 state))) ; (bitvector 7)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$1737$_Q
      (ALU54A_State-$auto$clk2fflogic.cc_102_sample_data$1737 state))) ; (bitvector 7)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_opcodein_0_clk_sig_sampled$1738
      (ALU54A_State-$auto$clk2fflogic.cc_86_sample_control_edge$1739 state))) ; (bitvector 1)
  (let
    ((n37
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_opcodein_0_clk_sig_sampled$1738
        opcodein_0_clk_sig))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$1740$_Y
      (bool->bitvector (bveq n37 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((opin_sig_0_sync
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$1740$_Y)
        $auto$clk2fflogic.cc_102_sample_data$1737$_Q
        $auto$clk2fflogic.cc_102_sample_data$1735$_Q))) ; (bitvector 7)
  (let ((OP0 (ALU54A_Inputs-OP0 inputs))) ; (bitvector 1)
  (let ((OP1 (ALU54A_Inputs-OP1 inputs))) ; (bitvector 1)
  (let ((n43 (concat OP1 OP0))) ; (bitvector 2)
  (let ((OP2 (ALU54A_Inputs-OP2 inputs))) ; (bitvector 1)
  (let ((n45 (concat OP2 n43))) ; (bitvector 3)
  (let ((OP3 (ALU54A_Inputs-OP3 inputs))) ; (bitvector 1)
  (let ((n47 (concat OP3 n45))) ; (bitvector 4)
  (let ((OP4 (ALU54A_Inputs-OP4 inputs))) ; (bitvector 1)
  (let ((n49 (concat OP4 n47))) ; (bitvector 5)
  (let ((OP5 (ALU54A_Inputs-OP5 inputs))) ; (bitvector 1)
  (let ((n51 (concat OP5 n49))) ; (bitvector 6)
  (let ((OP6 (ALU54A_Inputs-OP6 inputs))) ; (bitvector 1)
  (let ((n53 (concat OP6 n51))) ; (bitvector 7)
  (let ((CE0 (ALU54A_Inputs-CE0 inputs))) ; (bitvector 1)
  (let ((CE3 (ALU54A_Inputs-CE3 inputs))) ; (bitvector 1)
  (let ((REG_OPCODEIN_0_CE (ALU54A_Inputs-REG_OPCODEIN_0_CE inputs))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1093$87$_Y
      (bool->bitvector (bveq REG_OPCODEIN_0_CE (bv #b10001 5))))) ; (bitvector 1)
  (let
    (($procmux$1003$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1093$87$_Y)
        CE3
        CE0))) ; (bitvector 1)
  (let ((CE2 (ALU54A_Inputs-CE2 inputs))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1092$86$_Y
      (bool->bitvector (bveq REG_OPCODEIN_0_CE (bv #b10000 5))))) ; (bitvector 1)
  (let
    (($procmux$1015$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1092$86$_Y)
        CE2
        $procmux$1003$_Y))) ; (bitvector 1)
  (let ((CE1 (ALU54A_Inputs-CE1 inputs))) ; (bitvector 1)
  (let ((n66 (zero-extend (bv #b1111 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1091$85$_Y
      (bool->bitvector (bveq REG_OPCODEIN_0_CE n66)))) ; (bitvector 1)
  (let
    (($procmux$1024$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1091$85$_Y)
        CE1
        $procmux$1015$_Y))) ; (bitvector 1)
  (let ((n70 (zero-extend (bv #b1 1) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1090$84$_Y
      (bool->bitvector (bveq REG_OPCODEIN_0_CE n70)))) ; (bitvector 1)
  (let
    (($procmux$1030$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1090$84$_Y)
        CE0
        $procmux$1024$_Y))) ; (bitvector 1)
  (let
    (($procmux$621$_Y
      (if (bitvector->bool $procmux$1030$_Y) n53 opin_sig_0_sync))) ; (bitvector 7)
  (let ((RST0 (ALU54A_Inputs-RST0 inputs))) ; (bitvector 1)
  (let ((RST3 (ALU54A_Inputs-RST3 inputs))) ; (bitvector 1)
  (let ((REG_OPCODEIN_0_RST (ALU54A_Inputs-REG_OPCODEIN_0_RST inputs))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1101$92$_Y
      (bool->bitvector (bveq REG_OPCODEIN_0_RST (bv #b10100 5))))) ; (bitvector 1)
  (let
    (($procmux$973$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1101$92$_Y)
        RST3
        RST0))) ; (bitvector 1)
  (let ((RST2 (ALU54A_Inputs-RST2 inputs))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1100$91$_Y
      (bool->bitvector (bveq REG_OPCODEIN_0_RST (bv #b10011 5))))) ; (bitvector 1)
  (let
    (($procmux$985$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1100$91$_Y)
        RST2
        $procmux$973$_Y))) ; (bitvector 1)
  (let ((RST1 (ALU54A_Inputs-RST1 inputs))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1099$90$_Y
      (bool->bitvector (bveq REG_OPCODEIN_0_RST (bv #b10010 5))))) ; (bitvector 1)
  (let
    (($2_opcodein_0_rst_sig_0_0_
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1099$90$_Y)
        RST1
        $procmux$985$_Y))) ; (bitvector 1)
  (let ((n90 (zero-extend (bv #b10 2) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1098$89$_Y
      (bool->bitvector (bveq REG_OPCODEIN_0_RST n90)))) ; (bitvector 1)
  (let
    (($procmux$1000$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1098$89$_Y)
        RST0
        $2_opcodein_0_rst_sig_0_0_))) ; (bitvector 1)
  (let
    (($0_opin_sig_0_sync_6_0_
      (if (bitvector->bool $procmux$1000$_Y) (bv #b0000000 7) $procmux$621$_Y))) ; (bitvector 7)
  (let ((REG_OPCODEOP1_0_CLK (ALU54A_Inputs-REG_OPCODEOP1_0_CLK inputs))) ; (bitvector 5)
  (let ((n95 (zero-extend (bv #b1110 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1133$112$_Y
      (bool->bitvector (bveq REG_OPCODEOP1_0_CLK n95)))) ; (bitvector 1)
  (let
    (($procmux$853$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1133$112$_Y)
        CLK3
        CLK0))) ; (bitvector 1)
  (let ((n98 (zero-extend (bv #b1101 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1132$111$_Y
      (bool->bitvector (bveq REG_OPCODEOP1_0_CLK n98)))) ; (bitvector 1)
  (let
    (($procmux$865$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1132$111$_Y)
        CLK2
        $procmux$853$_Y))) ; (bitvector 1)
  (let ((n101 (zero-extend (bv #b1100 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1131$110$_Y
      (bool->bitvector (bveq REG_OPCODEOP1_0_CLK n101)))) ; (bitvector 1)
  (let
    (($procmux$874$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1131$110$_Y)
        CLK1
        $procmux$865$_Y))) ; (bitvector 1)
  (let ((n104 (zero-extend (bv #b1011 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1130$109$_Y
      (bool->bitvector (bveq REG_OPCODEOP1_0_CLK n104)))) ; (bitvector 1)
  (let
    ((opcodeop1_0_clk_sig
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1130$109$_Y)
        CLK0
        $procmux$874$_Y))) ; (bitvector 1)
  (let ((REG_OPCODEOP0_0_CLK (ALU54A_Inputs-REG_OPCODEOP0_0_CLK inputs))) ; (bitvector 5)
  (let ((n108 (zero-extend (bv #b1110 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1109$97$_Y
      (bool->bitvector (bveq REG_OPCODEOP0_0_CLK n108)))) ; (bitvector 1)
  (let
    (($procmux$943$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1109$97$_Y)
        CLK3
        CLK0))) ; (bitvector 1)
  (let ((n111 (zero-extend (bv #b1101 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1108$96$_Y
      (bool->bitvector (bveq REG_OPCODEOP0_0_CLK n111)))) ; (bitvector 1)
  (let
    (($procmux$955$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1108$96$_Y)
        CLK2
        $procmux$943$_Y))) ; (bitvector 1)
  (let ((n114 (zero-extend (bv #b1100 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1107$95$_Y
      (bool->bitvector (bveq REG_OPCODEOP0_0_CLK n114)))) ; (bitvector 1)
  (let
    (($procmux$964$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1107$95$_Y)
        CLK1
        $procmux$955$_Y))) ; (bitvector 1)
  (let ((n117 (zero-extend (bv #b1011 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1106$94$_Y
      (bool->bitvector (bveq REG_OPCODEOP0_0_CLK n117)))) ; (bitvector 1)
  (let
    ((opcodeop0_0_clk_sig
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1106$94$_Y)
        CLK0
        $procmux$964$_Y))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$1705$_Q
      (ALU54A_State-$auto$clk2fflogic.cc_102_sample_data$1705 state))) ; (bitvector 7)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$1707$_Q
      (ALU54A_State-$auto$clk2fflogic.cc_102_sample_data$1707 state))) ; (bitvector 7)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_opcodein_1_clk_sig_sampled$1708
      (ALU54A_State-$auto$clk2fflogic.cc_86_sample_control_edge$1709 state))) ; (bitvector 1)
  (let
    ((n123
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_opcodein_1_clk_sig_sampled$1708
        opcodein_1_clk_sig))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$1710$_Y
      (bool->bitvector (bveq n123 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((opin_sig_1_sync
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$1710$_Y)
        $auto$clk2fflogic.cc_102_sample_data$1707$_Q
        $auto$clk2fflogic.cc_102_sample_data$1705$_Q))) ; (bitvector 7)
  (let ((n126 (apply bvor (bitvector->bits REG_OPCODEIN_0_CLK)))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1382$180$_Y
      (bvnot n126))) ; (bitvector 1)
  (let
    ((opin_sig_gen_0
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1382$180$_Y)
        n53
        opin_sig_0_sync))) ; (bitvector 7)
  (let ((REG_OPCODEIN_1_CE (ALU54A_Inputs-REG_OPCODEIN_1_CE inputs))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1173$122$_Y
      (bool->bitvector (bveq REG_OPCODEIN_1_CE (bv #b10001 5))))) ; (bitvector 1)
  (let
    (($procmux$793$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1173$122$_Y)
        CE3
        CE0))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1172$121$_Y
      (bool->bitvector (bveq REG_OPCODEIN_1_CE (bv #b10000 5))))) ; (bitvector 1)
  (let
    (($procmux$805$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1172$121$_Y)
        CE2
        $procmux$793$_Y))) ; (bitvector 1)
  (let ((n134 (zero-extend (bv #b1111 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1171$120$_Y
      (bool->bitvector (bveq REG_OPCODEIN_1_CE n134)))) ; (bitvector 1)
  (let
    (($procmux$814$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1171$120$_Y)
        CE1
        $procmux$805$_Y))) ; (bitvector 1)
  (let ((n137 (zero-extend (bv #b1 1) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1170$119$_Y
      (bool->bitvector (bveq REG_OPCODEIN_1_CE n137)))) ; (bitvector 1)
  (let
    ((opcodein_1_ce_sig
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1170$119$_Y)
        CE0
        $procmux$814$_Y))) ; (bitvector 1)
  (let
    (($procmux$591$_Y
      (if (bitvector->bool opcodein_1_ce_sig) opin_sig_gen_0 opin_sig_1_sync))) ; (bitvector 7)
  (let ((REG_OPCODEIN_1_RST (ALU54A_Inputs-REG_OPCODEIN_1_RST inputs))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1181$127$_Y
      (bool->bitvector (bveq REG_OPCODEIN_1_RST (bv #b10100 5))))) ; (bitvector 1)
  (let
    (($procmux$763$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1181$127$_Y)
        RST3
        RST0))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1180$126$_Y
      (bool->bitvector (bveq REG_OPCODEIN_1_RST (bv #b10011 5))))) ; (bitvector 1)
  (let
    (($procmux$775$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1180$126$_Y)
        RST2
        $procmux$763$_Y))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1179$125$_Y
      (bool->bitvector (bveq REG_OPCODEIN_1_RST (bv #b10010 5))))) ; (bitvector 1)
  (let
    (($procmux$784$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1179$125$_Y)
        RST1
        $procmux$775$_Y))) ; (bitvector 1)
  (let ((n148 (zero-extend (bv #b10 2) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1178$124$_Y
      (bool->bitvector (bveq REG_OPCODEIN_1_RST n148)))) ; (bitvector 1)
  (let
    ((opcodein_1_rst_sig
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1178$124$_Y)
        RST0
        $procmux$784$_Y))) ; (bitvector 1)
  (let
    (($0_opin_sig_1_sync_6_0_
      (if (bitvector->bool opcodein_1_rst_sig) (bv #b0000000 7) $procmux$591$_Y))) ; (bitvector 7)
  (let ((REG_INPUTC0_CLK (ALU54A_Inputs-REG_INPUTC0_CLK inputs))) ; (bitvector 5)
  (let ((n153 (zero-extend (bv #b1110 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_965$7$_Y
      (bool->bitvector (bveq REG_INPUTC0_CLK n153)))) ; (bitvector 1)
  (let
    (($procmux$1483$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_965$7$_Y)
        CLK3
        CLK0))) ; (bitvector 1)
  (let ((n156 (zero-extend (bv #b1101 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_964$6$_Y
      (bool->bitvector (bveq REG_INPUTC0_CLK n156)))) ; (bitvector 1)
  (let
    (($procmux$1495$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_964$6$_Y)
        CLK2
        $procmux$1483$_Y))) ; (bitvector 1)
  (let ((n159 (zero-extend (bv #b1100 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_963$5$_Y
      (bool->bitvector (bveq REG_INPUTC0_CLK n159)))) ; (bitvector 1)
  (let
    (($procmux$1504$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_963$5$_Y)
        CLK1
        $procmux$1495$_Y))) ; (bitvector 1)
  (let ((n162 (zero-extend (bv #b1011 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_962$4$_Y
      (bool->bitvector (bveq REG_INPUTC0_CLK n162)))) ; (bitvector 1)
  (let
    ((input_c_clk_sig0
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_962$4$_Y)
        CLK0
        $procmux$1504$_Y))) ; (bitvector 1)
  (let ((REG_INPUTC1_CLK (ALU54A_Inputs-REG_INPUTC1_CLK inputs))) ; (bitvector 5)
  (let ((n166 (zero-extend (bv #b1110 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_989$22$_Y
      (bool->bitvector (bveq REG_INPUTC1_CLK n166)))) ; (bitvector 1)
  (let
    (($procmux$1393$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_989$22$_Y)
        CLK3
        CLK0))) ; (bitvector 1)
  (let ((n169 (zero-extend (bv #b1101 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_988$21$_Y
      (bool->bitvector (bveq REG_INPUTC1_CLK n169)))) ; (bitvector 1)
  (let
    (($procmux$1405$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_988$21$_Y)
        CLK2
        $procmux$1393$_Y))) ; (bitvector 1)
  (let ((n172 (zero-extend (bv #b1100 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_987$20$_Y
      (bool->bitvector (bveq REG_INPUTC1_CLK n172)))) ; (bitvector 1)
  (let
    (($procmux$1414$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_987$20$_Y)
        CLK1
        $procmux$1405$_Y))) ; (bitvector 1)
  (let ((n175 (zero-extend (bv #b1011 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_986$19$_Y
      (bool->bitvector (bveq REG_INPUTC1_CLK n175)))) ; (bitvector 1)
  (let
    ((input_c_clk_sig1
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_986$19$_Y)
        CLK0
        $procmux$1414$_Y))) ; (bitvector 1)
  (let ((REG_OPCODEOP1_1_CLK (ALU54A_Inputs-REG_OPCODEOP1_1_CLK inputs))) ; (bitvector 5)
  (let ((n179 (zero-extend (bv #b1110 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1213$147$_Y
      (bool->bitvector (bveq REG_OPCODEOP1_1_CLK n179)))) ; (bitvector 1)
  (let
    (($procmux$643$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1213$147$_Y)
        CLK3
        CLK0))) ; (bitvector 1)
  (let ((n182 (zero-extend (bv #b1101 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1212$146$_Y
      (bool->bitvector (bveq REG_OPCODEOP1_1_CLK n182)))) ; (bitvector 1)
  (let
    (($procmux$655$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1212$146$_Y)
        CLK2
        $procmux$643$_Y))) ; (bitvector 1)
  (let ((n185 (zero-extend (bv #b1100 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1211$145$_Y
      (bool->bitvector (bveq REG_OPCODEOP1_1_CLK n185)))) ; (bitvector 1)
  (let
    (($procmux$664$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1211$145$_Y)
        CLK1
        $procmux$655$_Y))) ; (bitvector 1)
  (let ((n188 (zero-extend (bv #b1011 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1210$144$_Y
      (bool->bitvector (bveq REG_OPCODEOP1_1_CLK n188)))) ; (bitvector 1)
  (let
    ((opcodeop1_1_clk_sig
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1210$144$_Y)
        CLK0
        $procmux$664$_Y))) ; (bitvector 1)
  (let ((REG_OPCODEOP0_1_CLK (ALU54A_Inputs-REG_OPCODEOP0_1_CLK inputs))) ; (bitvector 5)
  (let ((n192 (zero-extend (bv #b1110 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1189$132$_Y
      (bool->bitvector (bveq REG_OPCODEOP0_1_CLK n192)))) ; (bitvector 1)
  (let
    (($procmux$733$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1189$132$_Y)
        CLK3
        CLK0))) ; (bitvector 1)
  (let ((n195 (zero-extend (bv #b1101 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1188$131$_Y
      (bool->bitvector (bveq REG_OPCODEOP0_1_CLK n195)))) ; (bitvector 1)
  (let
    (($procmux$745$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1188$131$_Y)
        CLK2
        $procmux$733$_Y))) ; (bitvector 1)
  (let ((n198 (zero-extend (bv #b1100 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1187$130$_Y
      (bool->bitvector (bveq REG_OPCODEOP0_1_CLK n198)))) ; (bitvector 1)
  (let
    (($procmux$754$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1187$130$_Y)
        CLK1
        $procmux$745$_Y))) ; (bitvector 1)
  (let ((n201 (zero-extend (bv #b1011 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1186$129$_Y
      (bool->bitvector (bveq REG_OPCODEOP0_1_CLK n201)))) ; (bitvector 1)
  (let
    ((opcodeop0_1_clk_sig
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1186$129$_Y)
        CLK0
        $procmux$754$_Y))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$1715$_Q
      (ALU54A_State-$auto$clk2fflogic.cc_102_sample_data$1715 state))) ; (bitvector 3)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$1717$_Q
      (ALU54A_State-$auto$clk2fflogic.cc_102_sample_data$1717 state))) ; (bitvector 3)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_opcodeop1_0_clk_sig_sampled$1718
      (ALU54A_State-$auto$clk2fflogic.cc_86_sample_control_edge$1719 state))) ; (bitvector 1)
  (let
    ((n207
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_opcodeop1_0_clk_sig_sampled$1718
        opcodeop1_0_clk_sig))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$1720$_Y
      (bool->bitvector (bveq n207 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((op10_sig_0_sync
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$1720$_Y)
        $auto$clk2fflogic.cc_102_sample_data$1717$_Q
        $auto$clk2fflogic.cc_102_sample_data$1715$_Q))) ; (bitvector 3)
  (let ((OP8 (ALU54A_Inputs-OP8 inputs))) ; (bitvector 1)
  (let ((OP9 (ALU54A_Inputs-OP9 inputs))) ; (bitvector 1)
  (let ((n212 (concat OP9 OP8))) ; (bitvector 2)
  (let ((OP10 (ALU54A_Inputs-OP10 inputs))) ; (bitvector 1)
  (let ((n214 (concat OP10 n212))) ; (bitvector 3)
  (let ((REG_OPCODEOP0_0_CE (ALU54A_Inputs-REG_OPCODEOP0_0_CE inputs))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1117$102$_Y
      (bool->bitvector (bveq REG_OPCODEOP0_0_CE (bv #b10001 5))))) ; (bitvector 1)
  (let
    (($procmux$913$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1117$102$_Y)
        CE3
        CE0))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1116$101$_Y
      (bool->bitvector (bveq REG_OPCODEOP0_0_CE (bv #b10000 5))))) ; (bitvector 1)
  (let
    (($procmux$925$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1116$101$_Y)
        CE2
        $procmux$913$_Y))) ; (bitvector 1)
  (let ((n220 (zero-extend (bv #b1111 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1115$100$_Y
      (bool->bitvector (bveq REG_OPCODEOP0_0_CE n220)))) ; (bitvector 1)
  (let
    (($procmux$934$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1115$100$_Y)
        CE1
        $procmux$925$_Y))) ; (bitvector 1)
  (let ((n223 (zero-extend (bv #b1 1) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1114$99$_Y
      (bool->bitvector (bveq REG_OPCODEOP0_0_CE n223)))) ; (bitvector 1)
  (let
    ((opcodeop0_0_ce_sig
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1114$99$_Y)
        CE0
        $procmux$934$_Y))) ; (bitvector 1)
  (let
    (($procmux$607$_Y
      (if (bitvector->bool opcodeop0_0_ce_sig) n214 op10_sig_0_sync))) ; (bitvector 3)
  (let ((REG_OPCODEOP0_0_RST (ALU54A_Inputs-REG_OPCODEOP0_0_RST inputs))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1125$107$_Y
      (bool->bitvector (bveq REG_OPCODEOP0_0_RST (bv #b10100 5))))) ; (bitvector 1)
  (let
    (($procmux$883$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1125$107$_Y)
        RST3
        RST0))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1124$106$_Y
      (bool->bitvector (bveq REG_OPCODEOP0_0_RST (bv #b10011 5))))) ; (bitvector 1)
  (let
    (($procmux$895$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1124$106$_Y)
        RST2
        $procmux$883$_Y))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1123$105$_Y
      (bool->bitvector (bveq REG_OPCODEOP0_0_RST (bv #b10010 5))))) ; (bitvector 1)
  (let
    (($procmux$904$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1123$105$_Y)
        RST1
        $procmux$895$_Y))) ; (bitvector 1)
  (let ((n235 (zero-extend (bv #b10 2) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1122$104$_Y
      (bool->bitvector (bveq REG_OPCODEOP0_0_RST n235)))) ; (bitvector 1)
  (let
    ((opcodeop0_0_rst_sig
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1122$104$_Y)
        RST0
        $procmux$904$_Y))) ; (bitvector 1)
  (let
    (($0_op10_sig_0_sync_2_0_
      (if (bitvector->bool opcodeop0_0_rst_sig) (bv #b000 3) $procmux$607$_Y))) ; (bitvector 3)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$1725$_Q
      (ALU54A_State-$auto$clk2fflogic.cc_102_sample_data$1725 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$1727$_Q
      (ALU54A_State-$auto$clk2fflogic.cc_102_sample_data$1727 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_opcodeop0_0_clk_sig_sampled$1728
      (ALU54A_State-$auto$clk2fflogic.cc_86_sample_control_edge$1729 state))) ; (bitvector 1)
  (let
    ((n242
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_opcodeop0_0_clk_sig_sampled$1728
        opcodeop0_0_clk_sig))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$1730$_Y
      (bool->bitvector (bveq n242 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((op7_sig_0_sync
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$1730$_Y)
        $auto$clk2fflogic.cc_102_sample_data$1727$_Q
        $auto$clk2fflogic.cc_102_sample_data$1725$_Q))) ; (bitvector 1)
  (let ((OP7 (ALU54A_Inputs-OP7 inputs))) ; (bitvector 1)
  (let
    (($procmux$614$_Y
      (if (bitvector->bool opcodeop0_0_ce_sig) OP7 op7_sig_0_sync))) ; (bitvector 1)
  (let
    (($0_op7_sig_0_sync_0_0_
      (if (bitvector->bool opcodeop0_0_rst_sig) (bv #b0 1) $procmux$614$_Y))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_95_sample_data$_c_sig_sync0_sampled$1754
      (ALU54A_State-$auto$clk2fflogic.cc_102_sample_data$1755 state))) ; (bitvector 27)
  (let
    (($auto$clk2fflogic.cc_95_sample_data$$0_c_sig_sync0_26_0__sampled$1756
      (ALU54A_State-$auto$clk2fflogic.cc_102_sample_data$1757 state))) ; (bitvector 27)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_input_c_clk_sig0_sampled$1758
      (ALU54A_State-$auto$clk2fflogic.cc_86_sample_control_edge$1759 state))) ; (bitvector 1)
  (let
    ((n252
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_input_c_clk_sig0_sampled$1758
        input_c_clk_sig0))) ; (bitvector 2)
  (let
    (($auto$rtlil.cc_2974_Eqx$1761 (bool->bitvector (bveq n252 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((c_sig_sync0
      (if
        (bitvector->bool $auto$rtlil.cc_2974_Eqx$1761)
        $auto$clk2fflogic.cc_95_sample_data$$0_c_sig_sync0_26_0__sampled$1756
        $auto$clk2fflogic.cc_95_sample_data$_c_sig_sync0_sampled$1754))) ; (bitvector 27)
  (let ((C0 (ALU54A_Inputs-C0 inputs))) ; (bitvector 1)
  (let ((C1 (ALU54A_Inputs-C1 inputs))) ; (bitvector 1)
  (let ((n257 (concat C1 C0))) ; (bitvector 2)
  (let ((C2 (ALU54A_Inputs-C2 inputs))) ; (bitvector 1)
  (let ((n259 (concat C2 n257))) ; (bitvector 3)
  (let ((C3 (ALU54A_Inputs-C3 inputs))) ; (bitvector 1)
  (let ((n261 (concat C3 n259))) ; (bitvector 4)
  (let ((C4 (ALU54A_Inputs-C4 inputs))) ; (bitvector 1)
  (let ((n263 (concat C4 n261))) ; (bitvector 5)
  (let ((C5 (ALU54A_Inputs-C5 inputs))) ; (bitvector 1)
  (let ((n265 (concat C5 n263))) ; (bitvector 6)
  (let ((C6 (ALU54A_Inputs-C6 inputs))) ; (bitvector 1)
  (let ((n267 (concat C6 n265))) ; (bitvector 7)
  (let ((C7 (ALU54A_Inputs-C7 inputs))) ; (bitvector 1)
  (let ((n269 (concat C7 n267))) ; (bitvector 8)
  (let ((C8 (ALU54A_Inputs-C8 inputs))) ; (bitvector 1)
  (let ((n271 (concat C8 n269))) ; (bitvector 9)
  (let ((C9 (ALU54A_Inputs-C9 inputs))) ; (bitvector 1)
  (let ((n273 (concat C9 n271))) ; (bitvector 10)
  (let ((C10 (ALU54A_Inputs-C10 inputs))) ; (bitvector 1)
  (let ((n275 (concat C10 n273))) ; (bitvector 11)
  (let ((C11 (ALU54A_Inputs-C11 inputs))) ; (bitvector 1)
  (let ((n277 (concat C11 n275))) ; (bitvector 12)
  (let ((C12 (ALU54A_Inputs-C12 inputs))) ; (bitvector 1)
  (let ((n279 (concat C12 n277))) ; (bitvector 13)
  (let ((C13 (ALU54A_Inputs-C13 inputs))) ; (bitvector 1)
  (let ((n281 (concat C13 n279))) ; (bitvector 14)
  (let ((C14 (ALU54A_Inputs-C14 inputs))) ; (bitvector 1)
  (let ((n283 (concat C14 n281))) ; (bitvector 15)
  (let ((C15 (ALU54A_Inputs-C15 inputs))) ; (bitvector 1)
  (let ((n285 (concat C15 n283))) ; (bitvector 16)
  (let ((C16 (ALU54A_Inputs-C16 inputs))) ; (bitvector 1)
  (let ((n287 (concat C16 n285))) ; (bitvector 17)
  (let ((C17 (ALU54A_Inputs-C17 inputs))) ; (bitvector 1)
  (let ((n289 (concat C17 n287))) ; (bitvector 18)
  (let ((C18 (ALU54A_Inputs-C18 inputs))) ; (bitvector 1)
  (let ((n291 (concat C18 n289))) ; (bitvector 19)
  (let ((C19 (ALU54A_Inputs-C19 inputs))) ; (bitvector 1)
  (let ((n293 (concat C19 n291))) ; (bitvector 20)
  (let ((C20 (ALU54A_Inputs-C20 inputs))) ; (bitvector 1)
  (let ((n295 (concat C20 n293))) ; (bitvector 21)
  (let ((C21 (ALU54A_Inputs-C21 inputs))) ; (bitvector 1)
  (let ((n297 (concat C21 n295))) ; (bitvector 22)
  (let ((C22 (ALU54A_Inputs-C22 inputs))) ; (bitvector 1)
  (let ((n299 (concat C22 n297))) ; (bitvector 23)
  (let ((C23 (ALU54A_Inputs-C23 inputs))) ; (bitvector 1)
  (let ((n301 (concat C23 n299))) ; (bitvector 24)
  (let ((C24 (ALU54A_Inputs-C24 inputs))) ; (bitvector 1)
  (let ((n303 (concat C24 n301))) ; (bitvector 25)
  (let ((C25 (ALU54A_Inputs-C25 inputs))) ; (bitvector 1)
  (let ((n305 (concat C25 n303))) ; (bitvector 26)
  (let ((C26 (ALU54A_Inputs-C26 inputs))) ; (bitvector 1)
  (let ((n307 (concat C26 n305))) ; (bitvector 27)
  (let ((REG_INPUTC0_CE (ALU54A_Inputs-REG_INPUTC0_CE inputs))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_973$12$_Y
      (bool->bitvector (bveq REG_INPUTC0_CE (bv #b10001 5))))) ; (bitvector 1)
  (let
    (($procmux$1453$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_973$12$_Y)
        CE3
        CE0))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_972$11$_Y
      (bool->bitvector (bveq REG_INPUTC0_CE (bv #b10000 5))))) ; (bitvector 1)
  (let
    (($procmux$1465$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_972$11$_Y)
        CE2
        $procmux$1453$_Y))) ; (bitvector 1)
  (let ((n313 (zero-extend (bv #b1111 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_971$10$_Y
      (bool->bitvector (bveq REG_INPUTC0_CE n313)))) ; (bitvector 1)
  (let
    (($procmux$1474$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_971$10$_Y)
        CE1
        $procmux$1465$_Y))) ; (bitvector 1)
  (let ((n316 (zero-extend (bv #b1 1) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_970$9$_Y
      (bool->bitvector (bveq REG_INPUTC0_CE n316)))) ; (bitvector 1)
  (let
    (($procmux$1480$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_970$9$_Y)
        CE0
        $procmux$1474$_Y))) ; (bitvector 1)
  (let
    (($procmux$635$_Y (if (bitvector->bool $procmux$1480$_Y) n307 c_sig_sync0))) ; (bitvector 27)
  (let ((REG_INPUTC0_RST (ALU54A_Inputs-REG_INPUTC0_RST inputs))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_981$17$_Y
      (bool->bitvector (bveq REG_INPUTC0_RST (bv #b10100 5))))) ; (bitvector 1)
  (let
    (($procmux$1423$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_981$17$_Y)
        RST3
        RST0))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_980$16$_Y
      (bool->bitvector (bveq REG_INPUTC0_RST (bv #b10011 5))))) ; (bitvector 1)
  (let
    (($procmux$1435$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_980$16$_Y)
        RST2
        $procmux$1423$_Y))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_979$15$_Y
      (bool->bitvector (bveq REG_INPUTC0_RST (bv #b10010 5))))) ; (bitvector 1)
  (let
    (($procmux$1444$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_979$15$_Y)
        RST1
        $procmux$1435$_Y))) ; (bitvector 1)
  (let ((n328 (zero-extend (bv #b10 2) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_978$14$_Y
      (bool->bitvector (bveq REG_INPUTC0_RST n328)))) ; (bitvector 1)
  (let
    (($procmux$1450$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_978$14$_Y)
        RST0
        $procmux$1444$_Y))) ; (bitvector 1)
  (let
    (($0_c_sig_sync0_26_0_
      (if
        (bitvector->bool $procmux$1450$_Y)
        (bv #b000000000000000000000000000 27)
        $procmux$635$_Y))) ; (bitvector 27)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$1745$_Q
      (ALU54A_State-$auto$clk2fflogic.cc_102_sample_data$1745 state))) ; (bitvector 27)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$1747$_Q
      (ALU54A_State-$auto$clk2fflogic.cc_102_sample_data$1747 state))) ; (bitvector 27)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_input_c_clk_sig1_sampled$1748
      (ALU54A_State-$auto$clk2fflogic.cc_86_sample_control_edge$1749 state))) ; (bitvector 1)
  (let
    ((n335
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_input_c_clk_sig1_sampled$1748
        input_c_clk_sig1))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$1750$_Y
      (bool->bitvector (bveq n335 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((c_sig_sync1
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$1750$_Y)
        $auto$clk2fflogic.cc_102_sample_data$1747$_Q
        $auto$clk2fflogic.cc_102_sample_data$1745$_Q))) ; (bitvector 27)
  (let ((C27 (ALU54A_Inputs-C27 inputs))) ; (bitvector 1)
  (let ((C28 (ALU54A_Inputs-C28 inputs))) ; (bitvector 1)
  (let ((n340 (concat C28 C27))) ; (bitvector 2)
  (let ((C29 (ALU54A_Inputs-C29 inputs))) ; (bitvector 1)
  (let ((n342 (concat C29 n340))) ; (bitvector 3)
  (let ((C30 (ALU54A_Inputs-C30 inputs))) ; (bitvector 1)
  (let ((n344 (concat C30 n342))) ; (bitvector 4)
  (let ((C31 (ALU54A_Inputs-C31 inputs))) ; (bitvector 1)
  (let ((n346 (concat C31 n344))) ; (bitvector 5)
  (let ((C32 (ALU54A_Inputs-C32 inputs))) ; (bitvector 1)
  (let ((n348 (concat C32 n346))) ; (bitvector 6)
  (let ((C33 (ALU54A_Inputs-C33 inputs))) ; (bitvector 1)
  (let ((n350 (concat C33 n348))) ; (bitvector 7)
  (let ((C34 (ALU54A_Inputs-C34 inputs))) ; (bitvector 1)
  (let ((n352 (concat C34 n350))) ; (bitvector 8)
  (let ((C35 (ALU54A_Inputs-C35 inputs))) ; (bitvector 1)
  (let ((n354 (concat C35 n352))) ; (bitvector 9)
  (let ((C36 (ALU54A_Inputs-C36 inputs))) ; (bitvector 1)
  (let ((n356 (concat C36 n354))) ; (bitvector 10)
  (let ((C37 (ALU54A_Inputs-C37 inputs))) ; (bitvector 1)
  (let ((n358 (concat C37 n356))) ; (bitvector 11)
  (let ((C38 (ALU54A_Inputs-C38 inputs))) ; (bitvector 1)
  (let ((n360 (concat C38 n358))) ; (bitvector 12)
  (let ((C39 (ALU54A_Inputs-C39 inputs))) ; (bitvector 1)
  (let ((n362 (concat C39 n360))) ; (bitvector 13)
  (let ((C40 (ALU54A_Inputs-C40 inputs))) ; (bitvector 1)
  (let ((n364 (concat C40 n362))) ; (bitvector 14)
  (let ((C41 (ALU54A_Inputs-C41 inputs))) ; (bitvector 1)
  (let ((n366 (concat C41 n364))) ; (bitvector 15)
  (let ((C42 (ALU54A_Inputs-C42 inputs))) ; (bitvector 1)
  (let ((n368 (concat C42 n366))) ; (bitvector 16)
  (let ((C43 (ALU54A_Inputs-C43 inputs))) ; (bitvector 1)
  (let ((n370 (concat C43 n368))) ; (bitvector 17)
  (let ((C44 (ALU54A_Inputs-C44 inputs))) ; (bitvector 1)
  (let ((n372 (concat C44 n370))) ; (bitvector 18)
  (let ((C45 (ALU54A_Inputs-C45 inputs))) ; (bitvector 1)
  (let ((n374 (concat C45 n372))) ; (bitvector 19)
  (let ((C46 (ALU54A_Inputs-C46 inputs))) ; (bitvector 1)
  (let ((n376 (concat C46 n374))) ; (bitvector 20)
  (let ((C47 (ALU54A_Inputs-C47 inputs))) ; (bitvector 1)
  (let ((n378 (concat C47 n376))) ; (bitvector 21)
  (let ((C48 (ALU54A_Inputs-C48 inputs))) ; (bitvector 1)
  (let ((n380 (concat C48 n378))) ; (bitvector 22)
  (let ((C49 (ALU54A_Inputs-C49 inputs))) ; (bitvector 1)
  (let ((n382 (concat C49 n380))) ; (bitvector 23)
  (let ((C50 (ALU54A_Inputs-C50 inputs))) ; (bitvector 1)
  (let ((n384 (concat C50 n382))) ; (bitvector 24)
  (let ((C51 (ALU54A_Inputs-C51 inputs))) ; (bitvector 1)
  (let ((n386 (concat C51 n384))) ; (bitvector 25)
  (let ((C52 (ALU54A_Inputs-C52 inputs))) ; (bitvector 1)
  (let ((n388 (concat C52 n386))) ; (bitvector 26)
  (let ((C53 (ALU54A_Inputs-C53 inputs))) ; (bitvector 1)
  (let ((n390 (concat C53 n388))) ; (bitvector 27)
  (let ((REG_INPUTC1_CE (ALU54A_Inputs-REG_INPUTC1_CE inputs))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_997$27$_Y
      (bool->bitvector (bveq REG_INPUTC1_CE (bv #b10001 5))))) ; (bitvector 1)
  (let
    (($procmux$1363$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_997$27$_Y)
        CE3
        CE0))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_996$26$_Y
      (bool->bitvector (bveq REG_INPUTC1_CE (bv #b10000 5))))) ; (bitvector 1)
  (let
    (($procmux$1375$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_996$26$_Y)
        CE2
        $procmux$1363$_Y))) ; (bitvector 1)
  (let ((n396 (zero-extend (bv #b1111 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_995$25$_Y
      (bool->bitvector (bveq REG_INPUTC1_CE n396)))) ; (bitvector 1)
  (let
    (($procmux$1384$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_995$25$_Y)
        CE1
        $procmux$1375$_Y))) ; (bitvector 1)
  (let ((n399 (zero-extend (bv #b1 1) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_994$24$_Y
      (bool->bitvector (bveq REG_INPUTC1_CE n399)))) ; (bitvector 1)
  (let
    (($procmux$1390$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_994$24$_Y)
        CE0
        $procmux$1384$_Y))) ; (bitvector 1)
  (let
    (($procmux$628$_Y (if (bitvector->bool $procmux$1390$_Y) n390 c_sig_sync1))) ; (bitvector 27)
  (let ((REG_INPUTC1_RST (ALU54A_Inputs-REG_INPUTC1_RST inputs))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1005$32$_Y
      (bool->bitvector (bveq REG_INPUTC1_RST (bv #b10100 5))))) ; (bitvector 1)
  (let
    (($procmux$1333$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1005$32$_Y)
        RST3
        RST0))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1004$31$_Y
      (bool->bitvector (bveq REG_INPUTC1_RST (bv #b10011 5))))) ; (bitvector 1)
  (let
    (($procmux$1345$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1004$31$_Y)
        RST2
        $procmux$1333$_Y))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1003$30$_Y
      (bool->bitvector (bveq REG_INPUTC1_RST (bv #b10010 5))))) ; (bitvector 1)
  (let
    (($procmux$1354$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1003$30$_Y)
        RST1
        $procmux$1345$_Y))) ; (bitvector 1)
  (let ((n410 (zero-extend (bv #b10 2) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1002$29$_Y
      (bool->bitvector (bveq REG_INPUTC1_RST n410)))) ; (bitvector 1)
  (let
    (($procmux$1360$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1002$29$_Y)
        RST0
        $procmux$1354$_Y))) ; (bitvector 1)
  (let
    (($0_c_sig_sync1_26_0_
      (if
        (bitvector->bool $procmux$1360$_Y)
        (bv #b000000000000000000000000000 27)
        $procmux$628$_Y))) ; (bitvector 27)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$1685$_Q
      (ALU54A_State-$auto$clk2fflogic.cc_102_sample_data$1685 state))) ; (bitvector 3)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$1687$_Q
      (ALU54A_State-$auto$clk2fflogic.cc_102_sample_data$1687 state))) ; (bitvector 3)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_opcodeop1_1_clk_sig_sampled$1688
      (ALU54A_State-$auto$clk2fflogic.cc_86_sample_control_edge$1689 state))) ; (bitvector 1)
  (let
    ((n417
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_opcodeop1_1_clk_sig_sampled$1688
        opcodeop1_1_clk_sig))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$1690$_Y
      (bool->bitvector (bveq n417 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((op10_sig_1_sync
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$1690$_Y)
        $auto$clk2fflogic.cc_102_sample_data$1687$_Q
        $auto$clk2fflogic.cc_102_sample_data$1685$_Q))) ; (bitvector 3)
  (let ((n420 (apply bvor (bitvector->bits REG_OPCODEOP1_0_CLK)))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1398$184$_Y
      (bvnot n420))) ; (bitvector 1)
  (let
    ((op10_sig_gen_0
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1398$184$_Y)
        n214
        op10_sig_0_sync))) ; (bitvector 3)
  (let ((REG_OPCODEOP0_1_CE (ALU54A_Inputs-REG_OPCODEOP0_1_CE inputs))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1197$137$_Y
      (bool->bitvector (bveq REG_OPCODEOP0_1_CE (bv #b10001 5))))) ; (bitvector 1)
  (let
    (($procmux$703$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1197$137$_Y)
        CE3
        CE0))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1196$136$_Y
      (bool->bitvector (bveq REG_OPCODEOP0_1_CE (bv #b10000 5))))) ; (bitvector 1)
  (let
    (($procmux$715$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1196$136$_Y)
        CE2
        $procmux$703$_Y))) ; (bitvector 1)
  (let ((n428 (zero-extend (bv #b1111 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1195$135$_Y
      (bool->bitvector (bveq REG_OPCODEOP0_1_CE n428)))) ; (bitvector 1)
  (let
    (($procmux$724$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1195$135$_Y)
        CE1
        $procmux$715$_Y))) ; (bitvector 1)
  (let ((n431 (zero-extend (bv #b1 1) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1194$134$_Y
      (bool->bitvector (bveq REG_OPCODEOP0_1_CE n431)))) ; (bitvector 1)
  (let
    ((opcodeop0_1_ce_sig
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1194$134$_Y)
        CE0
        $procmux$724$_Y))) ; (bitvector 1)
  (let
    (($procmux$577$_Y
      (if (bitvector->bool opcodeop0_1_ce_sig) op10_sig_gen_0 op10_sig_1_sync))) ; (bitvector 3)
  (let ((REG_OPCODEOP0_1_RST (ALU54A_Inputs-REG_OPCODEOP0_1_RST inputs))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1205$142$_Y
      (bool->bitvector (bveq REG_OPCODEOP0_1_RST (bv #b10100 5))))) ; (bitvector 1)
  (let
    (($procmux$673$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1205$142$_Y)
        RST3
        RST0))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1204$141$_Y
      (bool->bitvector (bveq REG_OPCODEOP0_1_RST (bv #b10011 5))))) ; (bitvector 1)
  (let
    (($procmux$685$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1204$141$_Y)
        RST2
        $procmux$673$_Y))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1203$140$_Y
      (bool->bitvector (bveq REG_OPCODEOP0_1_RST (bv #b10010 5))))) ; (bitvector 1)
  (let
    (($procmux$694$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1203$140$_Y)
        RST1
        $procmux$685$_Y))) ; (bitvector 1)
  (let ((n442 (zero-extend (bv #b10 2) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1202$139$_Y
      (bool->bitvector (bveq REG_OPCODEOP0_1_RST n442)))) ; (bitvector 1)
  (let
    ((opcodeop0_1_rst_sig
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1202$139$_Y)
        RST0
        $procmux$694$_Y))) ; (bitvector 1)
  (let
    (($0_op10_sig_1_sync_2_0_
      (if (bitvector->bool opcodeop0_1_rst_sig) (bv #b000 3) $procmux$577$_Y))) ; (bitvector 3)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$1695$_Q
      (ALU54A_State-$auto$clk2fflogic.cc_102_sample_data$1695 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$1697$_Q
      (ALU54A_State-$auto$clk2fflogic.cc_102_sample_data$1697 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_opcodeop0_1_clk_sig_sampled$1698
      (ALU54A_State-$auto$clk2fflogic.cc_86_sample_control_edge$1699 state))) ; (bitvector 1)
  (let
    ((n449
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_opcodeop0_1_clk_sig_sampled$1698
        opcodeop0_1_clk_sig))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$1700$_Y
      (bool->bitvector (bveq n449 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((op7_sig_1_sync
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$1700$_Y)
        $auto$clk2fflogic.cc_102_sample_data$1697$_Q
        $auto$clk2fflogic.cc_102_sample_data$1695$_Q))) ; (bitvector 1)
  (let ((n452 (apply bvor (bitvector->bits REG_OPCODEOP0_0_CLK)))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1390$182$_Y
      (bvnot n452))) ; (bitvector 1)
  (let
    ((op7_sig_gen_0
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1390$182$_Y)
        OP7
        op7_sig_0_sync))) ; (bitvector 1)
  (let
    (($procmux$584$_Y
      (if (bitvector->bool opcodeop0_1_ce_sig) op7_sig_gen_0 op7_sig_1_sync))) ; (bitvector 1)
  (let
    (($0_op7_sig_1_sync_0_0_
      (if (bitvector->bool opcodeop0_1_rst_sig) (bv #b0 1) $procmux$584$_Y))) ; (bitvector 1)
  (let ((REG_OUTPUT1_CLK (ALU54A_Inputs-REG_OUTPUT1_CLK inputs))) ; (bitvector 5)
  (let ((n458 (zero-extend (bv #b1110 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1037$52$_Y
      (bool->bitvector (bveq REG_OUTPUT1_CLK n458)))) ; (bitvector 1)
  (let
    (($procmux$1213$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1037$52$_Y)
        CLK3
        CLK0))) ; (bitvector 1)
  (let ((n461 (zero-extend (bv #b1101 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1036$51$_Y
      (bool->bitvector (bveq REG_OUTPUT1_CLK n461)))) ; (bitvector 1)
  (let
    (($procmux$1225$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1036$51$_Y)
        CLK2
        $procmux$1213$_Y))) ; (bitvector 1)
  (let ((n464 (zero-extend (bv #b1100 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1035$50$_Y
      (bool->bitvector (bveq REG_OUTPUT1_CLK n464)))) ; (bitvector 1)
  (let
    (($procmux$1234$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1035$50$_Y)
        CLK1
        $procmux$1225$_Y))) ; (bitvector 1)
  (let ((n467 (zero-extend (bv #b1011 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1034$49$_Y
      (bool->bitvector (bveq REG_OUTPUT1_CLK n467)))) ; (bitvector 1)
  (let
    ((output1_clk_sig
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1034$49$_Y)
        CLK0
        $procmux$1234$_Y))) ; (bitvector 1)
  (let ((REG_OUTPUT0_CLK (ALU54A_Inputs-REG_OUTPUT0_CLK inputs))) ; (bitvector 5)
  (let ((n471 (zero-extend (bv #b1110 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1013$37$_Y
      (bool->bitvector (bveq REG_OUTPUT0_CLK n471)))) ; (bitvector 1)
  (let
    (($procmux$1303$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1013$37$_Y)
        CLK3
        CLK0))) ; (bitvector 1)
  (let ((n474 (zero-extend (bv #b1101 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1012$36$_Y
      (bool->bitvector (bveq REG_OUTPUT0_CLK n474)))) ; (bitvector 1)
  (let
    (($procmux$1315$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1012$36$_Y)
        CLK2
        $procmux$1303$_Y))) ; (bitvector 1)
  (let ((n477 (zero-extend (bv #b1100 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1011$35$_Y
      (bool->bitvector (bveq REG_OUTPUT0_CLK n477)))) ; (bitvector 1)
  (let
    (($procmux$1324$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1011$35$_Y)
        CLK1
        $procmux$1315$_Y))) ; (bitvector 1)
  (let ((n480 (zero-extend (bv #b1011 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1010$34$_Y
      (bool->bitvector (bveq REG_OUTPUT0_CLK n480)))) ; (bitvector 1)
  (let
    ((output0_clk_sig
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1010$34$_Y)
        CLK0
        $procmux$1324$_Y))) ; (bitvector 1)
  (let ((REG_FLAG_CLK (ALU54A_Inputs-REG_FLAG_CLK inputs))) ; (bitvector 5)
  (let ((n484 (zero-extend (bv #b1110 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1061$67$_Y
      (bool->bitvector (bveq REG_FLAG_CLK n484)))) ; (bitvector 1)
  (let
    (($procmux$1123$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1061$67$_Y)
        CLK3
        CLK0))) ; (bitvector 1)
  (let ((n487 (zero-extend (bv #b1101 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1060$66$_Y
      (bool->bitvector (bveq REG_FLAG_CLK n487)))) ; (bitvector 1)
  (let
    (($procmux$1135$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1060$66$_Y)
        CLK2
        $procmux$1123$_Y))) ; (bitvector 1)
  (let ((n490 (zero-extend (bv #b1100 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1059$65$_Y
      (bool->bitvector (bveq REG_FLAG_CLK n490)))) ; (bitvector 1)
  (let
    (($procmux$1144$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1059$65$_Y)
        CLK1
        $procmux$1135$_Y))) ; (bitvector 1)
  (let ((n493 (zero-extend (bv #b1011 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1058$64$_Y
      (bool->bitvector (bveq REG_FLAG_CLK n493)))) ; (bitvector 1)
  (let
    ((flag_clk_sig
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1058$64$_Y)
        CLK0
        $procmux$1144$_Y))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$1665$_Q
      (ALU54A_State-$auto$clk2fflogic.cc_102_sample_data$1665 state))) ; (bitvector 36)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$1667$_Q
      (ALU54A_State-$auto$clk2fflogic.cc_102_sample_data$1667 state))) ; (bitvector 36)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_output1_clk_sig_sampled$1668
      (ALU54A_State-$auto$clk2fflogic.cc_86_sample_control_edge$1669 state))) ; (bitvector 1)
  (let
    ((n499
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_output1_clk_sig_sampled$1668
        output1_clk_sig))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$1670$_Y
      (bool->bitvector (bveq n499 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((r_out_msb_sync
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$1670$_Y)
        $auto$clk2fflogic.cc_102_sample_data$1667$_Q
        $auto$clk2fflogic.cc_102_sample_data$1665$_Q))) ; (bitvector 36)
  (let ((B0 (ALU54A_Inputs-B0 inputs))) ; (bitvector 1)
  (let
    ((n505
      (concat
        B0
        (bv #b000000000000000000000000000000000000000000000000000000 54)))) ; (bitvector 55)
  (let ((B1 (ALU54A_Inputs-B1 inputs))) ; (bitvector 1)
  (let ((n507 (concat B1 n505))) ; (bitvector 56)
  (let ((B2 (ALU54A_Inputs-B2 inputs))) ; (bitvector 1)
  (let ((n509 (concat B2 n507))) ; (bitvector 57)
  (let ((B3 (ALU54A_Inputs-B3 inputs))) ; (bitvector 1)
  (let ((n511 (concat B3 n509))) ; (bitvector 58)
  (let ((B4 (ALU54A_Inputs-B4 inputs))) ; (bitvector 1)
  (let ((n513 (concat B4 n511))) ; (bitvector 59)
  (let ((B5 (ALU54A_Inputs-B5 inputs))) ; (bitvector 1)
  (let ((n515 (concat B5 n513))) ; (bitvector 60)
  (let ((B6 (ALU54A_Inputs-B6 inputs))) ; (bitvector 1)
  (let ((n517 (concat B6 n515))) ; (bitvector 61)
  (let ((B7 (ALU54A_Inputs-B7 inputs))) ; (bitvector 1)
  (let ((n519 (concat B7 n517))) ; (bitvector 62)
  (let ((B8 (ALU54A_Inputs-B8 inputs))) ; (bitvector 1)
  (let ((n521 (concat B8 n519))) ; (bitvector 63)
  (let ((B9 (ALU54A_Inputs-B9 inputs))) ; (bitvector 1)
  (let ((n523 (concat B9 n521))) ; (bitvector 64)
  (let ((B10 (ALU54A_Inputs-B10 inputs))) ; (bitvector 1)
  (let ((n525 (concat B10 n523))) ; (bitvector 65)
  (let ((B11 (ALU54A_Inputs-B11 inputs))) ; (bitvector 1)
  (let ((n527 (concat B11 n525))) ; (bitvector 66)
  (let ((B12 (ALU54A_Inputs-B12 inputs))) ; (bitvector 1)
  (let ((n529 (concat B12 n527))) ; (bitvector 67)
  (let ((B13 (ALU54A_Inputs-B13 inputs))) ; (bitvector 1)
  (let ((n531 (concat B13 n529))) ; (bitvector 68)
  (let ((B14 (ALU54A_Inputs-B14 inputs))) ; (bitvector 1)
  (let ((n533 (concat B14 n531))) ; (bitvector 69)
  (let ((B15 (ALU54A_Inputs-B15 inputs))) ; (bitvector 1)
  (let ((n535 (concat B15 n533))) ; (bitvector 70)
  (let ((B16 (ALU54A_Inputs-B16 inputs))) ; (bitvector 1)
  (let ((n537 (concat B16 n535))) ; (bitvector 71)
  (let ((B17 (ALU54A_Inputs-B17 inputs))) ; (bitvector 1)
  (let ((n539 (concat B17 n537))) ; (bitvector 72)
  (let ((B18 (ALU54A_Inputs-B18 inputs))) ; (bitvector 1)
  (let ((n541 (concat B18 n539))) ; (bitvector 73)
  (let ((B19 (ALU54A_Inputs-B19 inputs))) ; (bitvector 1)
  (let ((n543 (concat B19 n541))) ; (bitvector 74)
  (let ((B20 (ALU54A_Inputs-B20 inputs))) ; (bitvector 1)
  (let ((n545 (concat B20 n543))) ; (bitvector 75)
  (let ((B21 (ALU54A_Inputs-B21 inputs))) ; (bitvector 1)
  (let ((n547 (concat B21 n545))) ; (bitvector 76)
  (let ((B22 (ALU54A_Inputs-B22 inputs))) ; (bitvector 1)
  (let ((n549 (concat B22 n547))) ; (bitvector 77)
  (let ((B23 (ALU54A_Inputs-B23 inputs))) ; (bitvector 1)
  (let ((n551 (concat B23 n549))) ; (bitvector 78)
  (let ((B24 (ALU54A_Inputs-B24 inputs))) ; (bitvector 1)
  (let ((n553 (concat B24 n551))) ; (bitvector 79)
  (let ((B25 (ALU54A_Inputs-B25 inputs))) ; (bitvector 1)
  (let ((n555 (concat B25 n553))) ; (bitvector 80)
  (let ((B26 (ALU54A_Inputs-B26 inputs))) ; (bitvector 1)
  (let ((n557 (concat B26 n555))) ; (bitvector 81)
  (let ((B27 (ALU54A_Inputs-B27 inputs))) ; (bitvector 1)
  (let ((n559 (concat B27 n557))) ; (bitvector 82)
  (let ((B28 (ALU54A_Inputs-B28 inputs))) ; (bitvector 1)
  (let ((n561 (concat B28 n559))) ; (bitvector 83)
  (let ((B29 (ALU54A_Inputs-B29 inputs))) ; (bitvector 1)
  (let ((n563 (concat B29 n561))) ; (bitvector 84)
  (let ((B30 (ALU54A_Inputs-B30 inputs))) ; (bitvector 1)
  (let ((n565 (concat B30 n563))) ; (bitvector 85)
  (let ((B31 (ALU54A_Inputs-B31 inputs))) ; (bitvector 1)
  (let ((n567 (concat B31 n565))) ; (bitvector 86)
  (let ((B32 (ALU54A_Inputs-B32 inputs))) ; (bitvector 1)
  (let ((n569 (concat B32 n567))) ; (bitvector 87)
  (let ((B33 (ALU54A_Inputs-B33 inputs))) ; (bitvector 1)
  (let ((n571 (concat B33 n569))) ; (bitvector 88)
  (let ((B34 (ALU54A_Inputs-B34 inputs))) ; (bitvector 1)
  (let ((n573 (concat B34 n571))) ; (bitvector 89)
  (let ((B35 (ALU54A_Inputs-B35 inputs))) ; (bitvector 1)
  (let ((n575 (concat B35 n573))) ; (bitvector 90)
  (let ((n576 (apply bvor (bitvector->bits REG_INPUTC1_CLK)))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1488$212$_Y
      (bvnot n576))) ; (bitvector 1)
  (let
    ((c_sig_gen1
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1488$212$_Y)
        n390
        c_sig_sync1))) ; (bitvector 27)
  (let ((n579 (extract 17 0 c_sig_gen1))) ; (bitvector 18)
  (let ((n580 (concat n579 n575))) ; (bitvector 108)
  (let ((MB0 (ALU54A_Inputs-MB0 inputs))) ; (bitvector 1)
  (let ((MB1 (ALU54A_Inputs-MB1 inputs))) ; (bitvector 1)
  (let ((n583 (concat MB1 MB0))) ; (bitvector 2)
  (let ((MB2 (ALU54A_Inputs-MB2 inputs))) ; (bitvector 1)
  (let ((n585 (concat MB2 n583))) ; (bitvector 3)
  (let ((MB3 (ALU54A_Inputs-MB3 inputs))) ; (bitvector 1)
  (let ((n587 (concat MB3 n585))) ; (bitvector 4)
  (let ((MB4 (ALU54A_Inputs-MB4 inputs))) ; (bitvector 1)
  (let ((n589 (concat MB4 n587))) ; (bitvector 5)
  (let ((MB5 (ALU54A_Inputs-MB5 inputs))) ; (bitvector 1)
  (let ((n591 (concat MB5 n589))) ; (bitvector 6)
  (let ((MB6 (ALU54A_Inputs-MB6 inputs))) ; (bitvector 1)
  (let ((n593 (concat MB6 n591))) ; (bitvector 7)
  (let ((MB7 (ALU54A_Inputs-MB7 inputs))) ; (bitvector 1)
  (let ((n595 (concat MB7 n593))) ; (bitvector 8)
  (let ((MB8 (ALU54A_Inputs-MB8 inputs))) ; (bitvector 1)
  (let ((n597 (concat MB8 n595))) ; (bitvector 9)
  (let ((MB9 (ALU54A_Inputs-MB9 inputs))) ; (bitvector 1)
  (let ((n599 (concat MB9 n597))) ; (bitvector 10)
  (let ((MB10 (ALU54A_Inputs-MB10 inputs))) ; (bitvector 1)
  (let ((n601 (concat MB10 n599))) ; (bitvector 11)
  (let ((MB11 (ALU54A_Inputs-MB11 inputs))) ; (bitvector 1)
  (let ((n603 (concat MB11 n601))) ; (bitvector 12)
  (let ((MB12 (ALU54A_Inputs-MB12 inputs))) ; (bitvector 1)
  (let ((n605 (concat MB12 n603))) ; (bitvector 13)
  (let ((MB13 (ALU54A_Inputs-MB13 inputs))) ; (bitvector 1)
  (let ((n607 (concat MB13 n605))) ; (bitvector 14)
  (let ((MB14 (ALU54A_Inputs-MB14 inputs))) ; (bitvector 1)
  (let ((n609 (concat MB14 n607))) ; (bitvector 15)
  (let ((MB15 (ALU54A_Inputs-MB15 inputs))) ; (bitvector 1)
  (let ((n611 (concat MB15 n609))) ; (bitvector 16)
  (let ((MB16 (ALU54A_Inputs-MB16 inputs))) ; (bitvector 1)
  (let ((n613 (concat MB16 n611))) ; (bitvector 17)
  (let ((MB17 (ALU54A_Inputs-MB17 inputs))) ; (bitvector 1)
  (let ((n615 (concat MB17 n613))) ; (bitvector 18)
  (let ((MB18 (ALU54A_Inputs-MB18 inputs))) ; (bitvector 1)
  (let ((n617 (concat MB18 n615))) ; (bitvector 19)
  (let ((MB19 (ALU54A_Inputs-MB19 inputs))) ; (bitvector 1)
  (let ((n619 (concat MB19 n617))) ; (bitvector 20)
  (let ((MB20 (ALU54A_Inputs-MB20 inputs))) ; (bitvector 1)
  (let ((n621 (concat MB20 n619))) ; (bitvector 21)
  (let ((MB21 (ALU54A_Inputs-MB21 inputs))) ; (bitvector 1)
  (let ((n623 (concat MB21 n621))) ; (bitvector 22)
  (let ((MB22 (ALU54A_Inputs-MB22 inputs))) ; (bitvector 1)
  (let ((n625 (concat MB22 n623))) ; (bitvector 23)
  (let ((MB23 (ALU54A_Inputs-MB23 inputs))) ; (bitvector 1)
  (let ((n627 (concat MB23 n625))) ; (bitvector 24)
  (let ((MB24 (ALU54A_Inputs-MB24 inputs))) ; (bitvector 1)
  (let ((n629 (concat MB24 n627))) ; (bitvector 25)
  (let ((MB25 (ALU54A_Inputs-MB25 inputs))) ; (bitvector 1)
  (let ((n631 (concat MB25 n629))) ; (bitvector 26)
  (let ((MB26 (ALU54A_Inputs-MB26 inputs))) ; (bitvector 1)
  (let ((n633 (concat MB26 n631))) ; (bitvector 27)
  (let ((MB27 (ALU54A_Inputs-MB27 inputs))) ; (bitvector 1)
  (let ((n635 (concat MB27 n633))) ; (bitvector 28)
  (let ((MB28 (ALU54A_Inputs-MB28 inputs))) ; (bitvector 1)
  (let ((n637 (concat MB28 n635))) ; (bitvector 29)
  (let ((MB29 (ALU54A_Inputs-MB29 inputs))) ; (bitvector 1)
  (let ((n639 (concat MB29 n637))) ; (bitvector 30)
  (let ((MB30 (ALU54A_Inputs-MB30 inputs))) ; (bitvector 1)
  (let ((n641 (concat MB30 n639))) ; (bitvector 31)
  (let ((MB31 (ALU54A_Inputs-MB31 inputs))) ; (bitvector 1)
  (let ((n643 (concat MB31 n641))) ; (bitvector 32)
  (let ((MB32 (ALU54A_Inputs-MB32 inputs))) ; (bitvector 1)
  (let ((n645 (concat MB32 n643))) ; (bitvector 33)
  (let ((MB33 (ALU54A_Inputs-MB33 inputs))) ; (bitvector 1)
  (let ((n647 (concat MB33 n645))) ; (bitvector 34)
  (let ((MB34 (ALU54A_Inputs-MB34 inputs))) ; (bitvector 1)
  (let ((n649 (concat MB34 n647))) ; (bitvector 35)
  (let ((MB35 (ALU54A_Inputs-MB35 inputs))) ; (bitvector 1)
  (let ((n651 (concat MB35 n649))) ; (bitvector 36)
  (let ((n653 (concat MB35 MB35))) ; (bitvector 2)
  (let ((n654 (concat MB35 n653))) ; (bitvector 3)
  (let ((n655 (concat MB35 n654))) ; (bitvector 4)
  (let ((n656 (concat MB35 n655))) ; (bitvector 5)
  (let ((n657 (concat MB35 n656))) ; (bitvector 6)
  (let ((n658 (concat MB35 n657))) ; (bitvector 7)
  (let ((n659 (concat MB35 n658))) ; (bitvector 8)
  (let ((n660 (concat MB35 n659))) ; (bitvector 9)
  (let ((n661 (concat MB35 n660))) ; (bitvector 10)
  (let ((n662 (concat MB35 n661))) ; (bitvector 11)
  (let ((n663 (concat MB35 n662))) ; (bitvector 12)
  (let ((n664 (concat MB35 n663))) ; (bitvector 13)
  (let ((n665 (concat MB35 n664))) ; (bitvector 14)
  (let ((n666 (concat MB35 n665))) ; (bitvector 15)
  (let ((n667 (concat MB35 n666))) ; (bitvector 16)
  (let ((n668 (concat MB35 n667))) ; (bitvector 17)
  (let ((n669 (concat MB35 n668))) ; (bitvector 18)
  (let ((SIGNEDIB (ALU54A_Inputs-SIGNEDIB inputs))) ; (bitvector 1)
  (let
    (($procmux$471$_Y
      (if (bitvector->bool SIGNEDIB) n669 (bv #b000000000000000000 18)))) ; (bitvector 18)
  (let ((n672 (concat $procmux$471$_Y n651))) ; (bitvector 54)
  (let ((n673 (concat MB1 MB0))) ; (bitvector 2)
  (let ((n674 (concat MB2 n673))) ; (bitvector 3)
  (let ((n675 (concat MB3 n674))) ; (bitvector 4)
  (let ((n676 (concat MB4 n675))) ; (bitvector 5)
  (let ((n677 (concat MB5 n676))) ; (bitvector 6)
  (let ((n678 (concat MB6 n677))) ; (bitvector 7)
  (let ((n679 (concat MB7 n678))) ; (bitvector 8)
  (let ((n680 (concat MB8 n679))) ; (bitvector 9)
  (let ((n681 (concat MB9 n680))) ; (bitvector 10)
  (let ((n682 (concat MB10 n681))) ; (bitvector 11)
  (let ((n683 (concat MB11 n682))) ; (bitvector 12)
  (let ((n684 (concat MB12 n683))) ; (bitvector 13)
  (let ((n685 (concat MB13 n684))) ; (bitvector 14)
  (let ((n686 (concat MB14 n685))) ; (bitvector 15)
  (let ((n687 (concat MB15 n686))) ; (bitvector 16)
  (let ((n688 (concat MB16 n687))) ; (bitvector 17)
  (let ((n689 (concat MB17 n688))) ; (bitvector 18)
  (let ((n690 (concat MB17 MB17))) ; (bitvector 2)
  (let ((n691 (concat MB17 n690))) ; (bitvector 3)
  (let ((n692 (concat MB17 n691))) ; (bitvector 4)
  (let ((n693 (concat MB17 n692))) ; (bitvector 5)
  (let ((n694 (concat MB17 n693))) ; (bitvector 6)
  (let ((n695 (concat MB17 n694))) ; (bitvector 7)
  (let
    (($procmux$504$_Y (if (bitvector->bool SIGNEDIB) n695 (bv #b0000000 7)))) ; (bitvector 7)
  (let ((n697 (concat $procmux$504$_Y n689))) ; (bitvector 25)
  (let ((n698 (apply bvor (bitvector->bits REG_OPCODEOP0_1_CLK)))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1462$206$_Y
      (bvnot n698))) ; (bitvector 1)
  (let
    ((op7_sig_gen_1
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1462$206$_Y)
        op7_sig_gen_0
        op7_sig_1_sync))) ; (bitvector 1)
  (let ((n701 (concat op7_sig_gen_1 n697))) ; (bitvector 26)
  (let ((n702 (concat op7_sig_gen_1 n701))) ; (bitvector 27)
  (let ((n703 (concat (bv #b0 1) n702))) ; (bitvector 28)
  (let ((n704 (concat MB18 n703))) ; (bitvector 29)
  (let ((n705 (concat MB19 n704))) ; (bitvector 30)
  (let ((n706 (concat MB20 n705))) ; (bitvector 31)
  (let ((n707 (concat MB21 n706))) ; (bitvector 32)
  (let ((n708 (concat MB22 n707))) ; (bitvector 33)
  (let ((n709 (concat MB23 n708))) ; (bitvector 34)
  (let ((n710 (concat MB24 n709))) ; (bitvector 35)
  (let ((n711 (concat MB25 n710))) ; (bitvector 36)
  (let ((n712 (concat MB26 n711))) ; (bitvector 37)
  (let ((n713 (concat MB27 n712))) ; (bitvector 38)
  (let ((n714 (concat MB28 n713))) ; (bitvector 39)
  (let ((n715 (concat MB29 n714))) ; (bitvector 40)
  (let ((n716 (concat MB30 n715))) ; (bitvector 41)
  (let ((n717 (concat MB31 n716))) ; (bitvector 42)
  (let ((n718 (concat MB32 n717))) ; (bitvector 43)
  (let ((n719 (concat MB33 n718))) ; (bitvector 44)
  (let ((n720 (concat MB34 n719))) ; (bitvector 45)
  (let ((n721 (concat MB35 n720))) ; (bitvector 46)
  (let ((n723 (concat MB35 MB35))) ; (bitvector 2)
  (let ((n724 (concat MB35 n723))) ; (bitvector 3)
  (let ((n725 (concat MB35 n724))) ; (bitvector 4)
  (let ((n726 (concat MB35 n725))) ; (bitvector 5)
  (let ((n727 (concat MB35 n726))) ; (bitvector 6)
  (let ((n728 (concat MB35 n727))) ; (bitvector 7)
  (let ((n729 (concat MB35 n728))) ; (bitvector 8)
  (let
    (($procmux$483$_Y (if (bitvector->bool SIGNEDIB) n729 (bv #b00000000 8)))) ; (bitvector 8)
  (let ((n731 (concat $procmux$483$_Y n721))) ; (bitvector 54)
  (let ((MULT9_MODE (ALU54A_Inputs-MULT9_MODE inputs))) ; (bitvector 5)
  (let ((n734 (zero-extend (bv #b11 2) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1498$214$_Y
      (bool->bitvector (bveq MULT9_MODE n734)))) ; (bitvector 1)
  (let
    ((mb_sig_m
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1498$214$_Y)
        n731
        n672))) ; (bitvector 54)
  (let ((n737 (concat mb_sig_m n580))) ; (bitvector 162)
  (let ((n738 (concat (bv #b000000000000000000 18) n737))) ; (bitvector 180)
  (let ((n739 (concat MB0 n738))) ; (bitvector 181)
  (let ((n740 (concat MB1 n739))) ; (bitvector 182)
  (let ((n741 (concat MB2 n740))) ; (bitvector 183)
  (let ((n742 (concat MB3 n741))) ; (bitvector 184)
  (let ((n743 (concat MB4 n742))) ; (bitvector 185)
  (let ((n744 (concat MB5 n743))) ; (bitvector 186)
  (let ((n745 (concat MB6 n744))) ; (bitvector 187)
  (let ((n746 (concat MB7 n745))) ; (bitvector 188)
  (let ((n747 (concat MB8 n746))) ; (bitvector 189)
  (let ((n748 (concat MB9 n747))) ; (bitvector 190)
  (let ((n749 (concat MB10 n748))) ; (bitvector 191)
  (let ((n750 (concat MB11 n749))) ; (bitvector 192)
  (let ((n751 (concat MB12 n750))) ; (bitvector 193)
  (let ((n752 (concat MB13 n751))) ; (bitvector 194)
  (let ((n753 (concat MB14 n752))) ; (bitvector 195)
  (let ((n754 (concat MB15 n753))) ; (bitvector 196)
  (let ((n755 (concat MB16 n754))) ; (bitvector 197)
  (let ((n756 (concat MB17 n755))) ; (bitvector 198)
  (let ((n757 (concat MB18 n756))) ; (bitvector 199)
  (let ((n758 (concat MB19 n757))) ; (bitvector 200)
  (let ((n759 (concat MB20 n758))) ; (bitvector 201)
  (let ((n760 (concat MB21 n759))) ; (bitvector 202)
  (let ((n761 (concat MB22 n760))) ; (bitvector 203)
  (let ((n762 (concat MB23 n761))) ; (bitvector 204)
  (let ((n763 (concat MB24 n762))) ; (bitvector 205)
  (let ((n764 (concat MB25 n763))) ; (bitvector 206)
  (let ((n765 (concat MB26 n764))) ; (bitvector 207)
  (let ((n766 (concat MB27 n765))) ; (bitvector 208)
  (let ((n767 (concat MB28 n766))) ; (bitvector 209)
  (let ((n768 (concat MB29 n767))) ; (bitvector 210)
  (let ((n769 (concat MB30 n768))) ; (bitvector 211)
  (let ((n770 (concat MB31 n769))) ; (bitvector 212)
  (let ((n771 (concat MB32 n770))) ; (bitvector 213)
  (let ((n772 (concat MB33 n771))) ; (bitvector 214)
  (let ((n773 (concat MB34 n772))) ; (bitvector 215)
  (let ((n774 (concat MB35 n773))) ; (bitvector 216)
  (let ((n775 (extract 53 0 n774))) ; (bitvector 54)
  (let ((n776 (apply bvor (bitvector->bits REG_OPCODEIN_1_CLK)))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1454$204$_Y
      (bvnot n776))) ; (bitvector 1)
  (let
    ((opin_sig_gen_1
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1454$204$_Y)
        opin_sig_gen_0
        opin_sig_1_sync))) ; (bitvector 7)
  (let ((n779 (extract 3 2 opin_sig_gen_1))) ; (bitvector 2)
  (let (($procmux$461_CMP (bool->bitvector (bveq n779 (bv #b11 2))))) ; (bitvector 1)
  (let (($procmux$462_CMP (bool->bitvector (bveq n779 (bv #b10 2))))) ; (bitvector 1)
  (let ((n782 (concat $procmux$462_CMP $procmux$461_CMP))) ; (bitvector 2)
  (let ((n783 (zero-extend (bv #b1 1) (bitvector 2)))) ; (bitvector 2)
  (let (($procmux$463_CMP (bool->bitvector (bveq n779 n783)))) ; (bitvector 1)
  (let ((n785 (concat $procmux$463_CMP n782))) ; (bitvector 3)
  (let ((n786 (apply bvor (bitvector->bits n779)))) ; (bitvector 1)
  (let (($procmux$464_CMP (bvnot n786))) ; (bitvector 1)
  (let ((n788 (concat $procmux$464_CMP n785))) ; (bitvector 4)
  (let ((n789 (extract 0 0 n788))) ; (bitvector 1)
  (let
    ((n790
      (if
        (bitvector->bool n789)
        n775
        (bv #b000000000000000000000000000000000000000000000000000000 54)))) ; (bitvector 54)
  (let ((n791 (extract 107 54 n774))) ; (bitvector 54)
  (let ((n792 (extract 1 1 n788))) ; (bitvector 1)
  (let ((n793 (if (bitvector->bool n792) n791 n790))) ; (bitvector 54)
  (let ((n794 (extract 161 108 n774))) ; (bitvector 54)
  (let ((n795 (extract 2 2 n788))) ; (bitvector 1)
  (let ((n796 (if (bitvector->bool n795) n794 n793))) ; (bitvector 54)
  (let ((n797 (extract 215 162 n774))) ; (bitvector 54)
  (let ((n798 (extract 3 3 n788))) ; (bitvector 1)
  (let ((b_mux (if (bitvector->bool n798) n797 n796))) ; (bitvector 54)
  (let ((RNDPAT (ALU54A_Inputs-RNDPAT inputs))) ; (bitvector 56)
  (let ((n801 (extract 53 0 RNDPAT))) ; (bitvector 54)
  (let ((n802 (zero-extend (bv #b1 1) (bitvector 54)))) ; (bitvector 54)
  (let ((rnd_pattern_m1 (bvsub n801 n802))) ; (bitvector 54)
  (let ((n804 (concat n801 rnd_pattern_m1))) ; (bitvector 108)
  (let ((A0 (ALU54A_Inputs-A0 inputs))) ; (bitvector 1)
  (let ((n806 (concat A0 n804))) ; (bitvector 109)
  (let ((A1 (ALU54A_Inputs-A1 inputs))) ; (bitvector 1)
  (let ((n808 (concat A1 n806))) ; (bitvector 110)
  (let ((A2 (ALU54A_Inputs-A2 inputs))) ; (bitvector 1)
  (let ((n810 (concat A2 n808))) ; (bitvector 111)
  (let ((A3 (ALU54A_Inputs-A3 inputs))) ; (bitvector 1)
  (let ((n812 (concat A3 n810))) ; (bitvector 112)
  (let ((A4 (ALU54A_Inputs-A4 inputs))) ; (bitvector 1)
  (let ((n814 (concat A4 n812))) ; (bitvector 113)
  (let ((A5 (ALU54A_Inputs-A5 inputs))) ; (bitvector 1)
  (let ((n816 (concat A5 n814))) ; (bitvector 114)
  (let ((A6 (ALU54A_Inputs-A6 inputs))) ; (bitvector 1)
  (let ((n818 (concat A6 n816))) ; (bitvector 115)
  (let ((A7 (ALU54A_Inputs-A7 inputs))) ; (bitvector 1)
  (let ((n820 (concat A7 n818))) ; (bitvector 116)
  (let ((A8 (ALU54A_Inputs-A8 inputs))) ; (bitvector 1)
  (let ((n822 (concat A8 n820))) ; (bitvector 117)
  (let ((A9 (ALU54A_Inputs-A9 inputs))) ; (bitvector 1)
  (let ((n824 (concat A9 n822))) ; (bitvector 118)
  (let ((A10 (ALU54A_Inputs-A10 inputs))) ; (bitvector 1)
  (let ((n826 (concat A10 n824))) ; (bitvector 119)
  (let ((A11 (ALU54A_Inputs-A11 inputs))) ; (bitvector 1)
  (let ((n828 (concat A11 n826))) ; (bitvector 120)
  (let ((A12 (ALU54A_Inputs-A12 inputs))) ; (bitvector 1)
  (let ((n830 (concat A12 n828))) ; (bitvector 121)
  (let ((A13 (ALU54A_Inputs-A13 inputs))) ; (bitvector 1)
  (let ((n832 (concat A13 n830))) ; (bitvector 122)
  (let ((A14 (ALU54A_Inputs-A14 inputs))) ; (bitvector 1)
  (let ((n834 (concat A14 n832))) ; (bitvector 123)
  (let ((A15 (ALU54A_Inputs-A15 inputs))) ; (bitvector 1)
  (let ((n836 (concat A15 n834))) ; (bitvector 124)
  (let ((A16 (ALU54A_Inputs-A16 inputs))) ; (bitvector 1)
  (let ((n838 (concat A16 n836))) ; (bitvector 125)
  (let ((A17 (ALU54A_Inputs-A17 inputs))) ; (bitvector 1)
  (let ((n840 (concat A17 n838))) ; (bitvector 126)
  (let ((A18 (ALU54A_Inputs-A18 inputs))) ; (bitvector 1)
  (let ((n842 (concat A18 n840))) ; (bitvector 127)
  (let ((A19 (ALU54A_Inputs-A19 inputs))) ; (bitvector 1)
  (let ((n844 (concat A19 n842))) ; (bitvector 128)
  (let ((A20 (ALU54A_Inputs-A20 inputs))) ; (bitvector 1)
  (let ((n846 (concat A20 n844))) ; (bitvector 129)
  (let ((A21 (ALU54A_Inputs-A21 inputs))) ; (bitvector 1)
  (let ((n848 (concat A21 n846))) ; (bitvector 130)
  (let ((A22 (ALU54A_Inputs-A22 inputs))) ; (bitvector 1)
  (let ((n850 (concat A22 n848))) ; (bitvector 131)
  (let ((A23 (ALU54A_Inputs-A23 inputs))) ; (bitvector 1)
  (let ((n852 (concat A23 n850))) ; (bitvector 132)
  (let ((A24 (ALU54A_Inputs-A24 inputs))) ; (bitvector 1)
  (let ((n854 (concat A24 n852))) ; (bitvector 133)
  (let ((A25 (ALU54A_Inputs-A25 inputs))) ; (bitvector 1)
  (let ((n856 (concat A25 n854))) ; (bitvector 134)
  (let ((A26 (ALU54A_Inputs-A26 inputs))) ; (bitvector 1)
  (let ((n858 (concat A26 n856))) ; (bitvector 135)
  (let ((A27 (ALU54A_Inputs-A27 inputs))) ; (bitvector 1)
  (let ((n860 (concat A27 n858))) ; (bitvector 136)
  (let ((A28 (ALU54A_Inputs-A28 inputs))) ; (bitvector 1)
  (let ((n862 (concat A28 n860))) ; (bitvector 137)
  (let ((A29 (ALU54A_Inputs-A29 inputs))) ; (bitvector 1)
  (let ((n864 (concat A29 n862))) ; (bitvector 138)
  (let ((A30 (ALU54A_Inputs-A30 inputs))) ; (bitvector 1)
  (let ((n866 (concat A30 n864))) ; (bitvector 139)
  (let ((A31 (ALU54A_Inputs-A31 inputs))) ; (bitvector 1)
  (let ((n868 (concat A31 n866))) ; (bitvector 140)
  (let ((A32 (ALU54A_Inputs-A32 inputs))) ; (bitvector 1)
  (let ((n870 (concat A32 n868))) ; (bitvector 141)
  (let ((A33 (ALU54A_Inputs-A33 inputs))) ; (bitvector 1)
  (let ((n872 (concat A33 n870))) ; (bitvector 142)
  (let ((A34 (ALU54A_Inputs-A34 inputs))) ; (bitvector 1)
  (let ((n874 (concat A34 n872))) ; (bitvector 143)
  (let ((A35 (ALU54A_Inputs-A35 inputs))) ; (bitvector 1)
  (let ((n876 (concat A35 n874))) ; (bitvector 144)
  (let ((n877 (apply bvor (bitvector->bits REG_INPUTC0_CLK)))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1480$210$_Y
      (bvnot n877))) ; (bitvector 1)
  (let
    ((c_sig_gen0
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1480$210$_Y)
        n307
        c_sig_sync0))) ; (bitvector 27)
  (let ((n880 (extract 17 0 c_sig_gen0))) ; (bitvector 18)
  (let ((n881 (concat n880 n876))) ; (bitvector 162)
  (let ((n882 (concat c_sig_gen0 n881))) ; (bitvector 189)
  (let ((n883 (concat c_sig_gen1 n882))) ; (bitvector 216)
  (let ((CIN0 (ALU54A_Inputs-CIN0 inputs))) ; (bitvector 1)
  (let ((n885 (concat CIN0 n883))) ; (bitvector 217)
  (let ((CIN1 (ALU54A_Inputs-CIN1 inputs))) ; (bitvector 1)
  (let ((n887 (concat CIN1 n885))) ; (bitvector 218)
  (let ((CIN2 (ALU54A_Inputs-CIN2 inputs))) ; (bitvector 1)
  (let ((n889 (concat CIN2 n887))) ; (bitvector 219)
  (let ((CIN3 (ALU54A_Inputs-CIN3 inputs))) ; (bitvector 1)
  (let ((n891 (concat CIN3 n889))) ; (bitvector 220)
  (let ((CIN4 (ALU54A_Inputs-CIN4 inputs))) ; (bitvector 1)
  (let ((n893 (concat CIN4 n891))) ; (bitvector 221)
  (let ((CIN5 (ALU54A_Inputs-CIN5 inputs))) ; (bitvector 1)
  (let ((n895 (concat CIN5 n893))) ; (bitvector 222)
  (let ((CIN6 (ALU54A_Inputs-CIN6 inputs))) ; (bitvector 1)
  (let ((n897 (concat CIN6 n895))) ; (bitvector 223)
  (let ((CIN7 (ALU54A_Inputs-CIN7 inputs))) ; (bitvector 1)
  (let ((n899 (concat CIN7 n897))) ; (bitvector 224)
  (let ((CIN8 (ALU54A_Inputs-CIN8 inputs))) ; (bitvector 1)
  (let ((n901 (concat CIN8 n899))) ; (bitvector 225)
  (let ((CIN9 (ALU54A_Inputs-CIN9 inputs))) ; (bitvector 1)
  (let ((n903 (concat CIN9 n901))) ; (bitvector 226)
  (let ((CIN10 (ALU54A_Inputs-CIN10 inputs))) ; (bitvector 1)
  (let ((n905 (concat CIN10 n903))) ; (bitvector 227)
  (let ((CIN11 (ALU54A_Inputs-CIN11 inputs))) ; (bitvector 1)
  (let ((n907 (concat CIN11 n905))) ; (bitvector 228)
  (let ((CIN12 (ALU54A_Inputs-CIN12 inputs))) ; (bitvector 1)
  (let ((n909 (concat CIN12 n907))) ; (bitvector 229)
  (let ((CIN13 (ALU54A_Inputs-CIN13 inputs))) ; (bitvector 1)
  (let ((n911 (concat CIN13 n909))) ; (bitvector 230)
  (let ((CIN14 (ALU54A_Inputs-CIN14 inputs))) ; (bitvector 1)
  (let ((n913 (concat CIN14 n911))) ; (bitvector 231)
  (let ((CIN15 (ALU54A_Inputs-CIN15 inputs))) ; (bitvector 1)
  (let ((n915 (concat CIN15 n913))) ; (bitvector 232)
  (let ((CIN16 (ALU54A_Inputs-CIN16 inputs))) ; (bitvector 1)
  (let ((n917 (concat CIN16 n915))) ; (bitvector 233)
  (let ((CIN17 (ALU54A_Inputs-CIN17 inputs))) ; (bitvector 1)
  (let ((n919 (concat CIN17 n917))) ; (bitvector 234)
  (let ((CIN18 (ALU54A_Inputs-CIN18 inputs))) ; (bitvector 1)
  (let ((n921 (concat CIN18 n919))) ; (bitvector 235)
  (let ((CIN19 (ALU54A_Inputs-CIN19 inputs))) ; (bitvector 1)
  (let ((n923 (concat CIN19 n921))) ; (bitvector 236)
  (let ((CIN20 (ALU54A_Inputs-CIN20 inputs))) ; (bitvector 1)
  (let ((n925 (concat CIN20 n923))) ; (bitvector 237)
  (let ((CIN21 (ALU54A_Inputs-CIN21 inputs))) ; (bitvector 1)
  (let ((n927 (concat CIN21 n925))) ; (bitvector 238)
  (let ((CIN22 (ALU54A_Inputs-CIN22 inputs))) ; (bitvector 1)
  (let ((n929 (concat CIN22 n927))) ; (bitvector 239)
  (let ((CIN23 (ALU54A_Inputs-CIN23 inputs))) ; (bitvector 1)
  (let ((n931 (concat CIN23 n929))) ; (bitvector 240)
  (let ((CIN24 (ALU54A_Inputs-CIN24 inputs))) ; (bitvector 1)
  (let ((n933 (concat CIN24 n931))) ; (bitvector 241)
  (let ((CIN25 (ALU54A_Inputs-CIN25 inputs))) ; (bitvector 1)
  (let ((n935 (concat CIN25 n933))) ; (bitvector 242)
  (let ((CIN26 (ALU54A_Inputs-CIN26 inputs))) ; (bitvector 1)
  (let ((n937 (concat CIN26 n935))) ; (bitvector 243)
  (let ((CIN27 (ALU54A_Inputs-CIN27 inputs))) ; (bitvector 1)
  (let ((n939 (concat CIN27 n937))) ; (bitvector 244)
  (let ((CIN28 (ALU54A_Inputs-CIN28 inputs))) ; (bitvector 1)
  (let ((n941 (concat CIN28 n939))) ; (bitvector 245)
  (let ((CIN29 (ALU54A_Inputs-CIN29 inputs))) ; (bitvector 1)
  (let ((n943 (concat CIN29 n941))) ; (bitvector 246)
  (let ((CIN30 (ALU54A_Inputs-CIN30 inputs))) ; (bitvector 1)
  (let ((n945 (concat CIN30 n943))) ; (bitvector 247)
  (let ((CIN31 (ALU54A_Inputs-CIN31 inputs))) ; (bitvector 1)
  (let ((n947 (concat CIN31 n945))) ; (bitvector 248)
  (let ((CIN32 (ALU54A_Inputs-CIN32 inputs))) ; (bitvector 1)
  (let ((n949 (concat CIN32 n947))) ; (bitvector 249)
  (let ((CIN33 (ALU54A_Inputs-CIN33 inputs))) ; (bitvector 1)
  (let ((n951 (concat CIN33 n949))) ; (bitvector 250)
  (let ((CIN34 (ALU54A_Inputs-CIN34 inputs))) ; (bitvector 1)
  (let ((n953 (concat CIN34 n951))) ; (bitvector 251)
  (let ((CIN35 (ALU54A_Inputs-CIN35 inputs))) ; (bitvector 1)
  (let ((n955 (concat CIN35 n953))) ; (bitvector 252)
  (let ((CIN36 (ALU54A_Inputs-CIN36 inputs))) ; (bitvector 1)
  (let ((n957 (concat CIN36 n955))) ; (bitvector 253)
  (let ((CIN37 (ALU54A_Inputs-CIN37 inputs))) ; (bitvector 1)
  (let ((n959 (concat CIN37 n957))) ; (bitvector 254)
  (let ((CIN38 (ALU54A_Inputs-CIN38 inputs))) ; (bitvector 1)
  (let ((n961 (concat CIN38 n959))) ; (bitvector 255)
  (let ((CIN39 (ALU54A_Inputs-CIN39 inputs))) ; (bitvector 1)
  (let ((n963 (concat CIN39 n961))) ; (bitvector 256)
  (let ((CIN40 (ALU54A_Inputs-CIN40 inputs))) ; (bitvector 1)
  (let ((n965 (concat CIN40 n963))) ; (bitvector 257)
  (let ((CIN41 (ALU54A_Inputs-CIN41 inputs))) ; (bitvector 1)
  (let ((n967 (concat CIN41 n965))) ; (bitvector 258)
  (let ((CIN42 (ALU54A_Inputs-CIN42 inputs))) ; (bitvector 1)
  (let ((n969 (concat CIN42 n967))) ; (bitvector 259)
  (let ((CIN43 (ALU54A_Inputs-CIN43 inputs))) ; (bitvector 1)
  (let ((n971 (concat CIN43 n969))) ; (bitvector 260)
  (let ((CIN44 (ALU54A_Inputs-CIN44 inputs))) ; (bitvector 1)
  (let ((n973 (concat CIN44 n971))) ; (bitvector 261)
  (let ((CIN45 (ALU54A_Inputs-CIN45 inputs))) ; (bitvector 1)
  (let ((n975 (concat CIN45 n973))) ; (bitvector 262)
  (let ((CIN46 (ALU54A_Inputs-CIN46 inputs))) ; (bitvector 1)
  (let ((n977 (concat CIN46 n975))) ; (bitvector 263)
  (let ((CIN47 (ALU54A_Inputs-CIN47 inputs))) ; (bitvector 1)
  (let ((n979 (concat CIN47 n977))) ; (bitvector 264)
  (let ((CIN48 (ALU54A_Inputs-CIN48 inputs))) ; (bitvector 1)
  (let ((n981 (concat CIN48 n979))) ; (bitvector 265)
  (let ((CIN49 (ALU54A_Inputs-CIN49 inputs))) ; (bitvector 1)
  (let ((n983 (concat CIN49 n981))) ; (bitvector 266)
  (let ((CIN50 (ALU54A_Inputs-CIN50 inputs))) ; (bitvector 1)
  (let ((n985 (concat CIN50 n983))) ; (bitvector 267)
  (let ((CIN51 (ALU54A_Inputs-CIN51 inputs))) ; (bitvector 1)
  (let ((n987 (concat CIN51 n985))) ; (bitvector 268)
  (let ((CIN52 (ALU54A_Inputs-CIN52 inputs))) ; (bitvector 1)
  (let ((n989 (concat CIN52 n987))) ; (bitvector 269)
  (let ((CIN53 (ALU54A_Inputs-CIN53 inputs))) ; (bitvector 1)
  (let ((n991 (concat CIN53 n989))) ; (bitvector 270)
  (let ((n992 (concat CIN18 n991))) ; (bitvector 271)
  (let ((n993 (concat CIN19 n992))) ; (bitvector 272)
  (let ((n994 (concat CIN20 n993))) ; (bitvector 273)
  (let ((n995 (concat CIN21 n994))) ; (bitvector 274)
  (let ((n996 (concat CIN22 n995))) ; (bitvector 275)
  (let ((n997 (concat CIN23 n996))) ; (bitvector 276)
  (let ((n998 (concat CIN24 n997))) ; (bitvector 277)
  (let ((n999 (concat CIN25 n998))) ; (bitvector 278)
  (let ((n1000 (concat CIN26 n999))) ; (bitvector 279)
  (let ((n1001 (concat CIN27 n1000))) ; (bitvector 280)
  (let ((n1002 (concat CIN28 n1001))) ; (bitvector 281)
  (let ((n1003 (concat CIN29 n1002))) ; (bitvector 282)
  (let ((n1004 (concat CIN30 n1003))) ; (bitvector 283)
  (let ((n1005 (concat CIN31 n1004))) ; (bitvector 284)
  (let ((n1006 (concat CIN32 n1005))) ; (bitvector 285)
  (let ((n1007 (concat CIN33 n1006))) ; (bitvector 286)
  (let ((n1008 (concat CIN34 n1007))) ; (bitvector 287)
  (let ((n1009 (concat CIN35 n1008))) ; (bitvector 288)
  (let ((n1010 (concat CIN36 n1009))) ; (bitvector 289)
  (let ((n1011 (concat CIN37 n1010))) ; (bitvector 290)
  (let ((n1012 (concat CIN38 n1011))) ; (bitvector 291)
  (let ((n1013 (concat CIN39 n1012))) ; (bitvector 292)
  (let ((n1014 (concat CIN40 n1013))) ; (bitvector 293)
  (let ((n1015 (concat CIN41 n1014))) ; (bitvector 294)
  (let ((n1016 (concat CIN42 n1015))) ; (bitvector 295)
  (let ((n1017 (concat CIN43 n1016))) ; (bitvector 296)
  (let ((n1018 (concat CIN44 n1017))) ; (bitvector 297)
  (let ((n1019 (concat CIN45 n1018))) ; (bitvector 298)
  (let ((n1020 (concat CIN46 n1019))) ; (bitvector 299)
  (let ((n1021 (concat CIN47 n1020))) ; (bitvector 300)
  (let ((n1022 (concat CIN48 n1021))) ; (bitvector 301)
  (let ((n1023 (concat CIN49 n1022))) ; (bitvector 302)
  (let ((n1024 (concat CIN50 n1023))) ; (bitvector 303)
  (let ((n1025 (concat CIN51 n1024))) ; (bitvector 304)
  (let ((n1026 (concat CIN52 n1025))) ; (bitvector 305)
  (let ((n1027 (concat CIN53 n1026))) ; (bitvector 306)
  (let ((n1028 (concat CIN19 CIN18))) ; (bitvector 2)
  (let ((n1029 (concat CIN20 n1028))) ; (bitvector 3)
  (let ((n1030 (concat CIN21 n1029))) ; (bitvector 4)
  (let ((n1031 (concat CIN22 n1030))) ; (bitvector 5)
  (let ((n1032 (concat CIN23 n1031))) ; (bitvector 6)
  (let ((n1033 (concat CIN24 n1032))) ; (bitvector 7)
  (let ((n1034 (concat CIN25 n1033))) ; (bitvector 8)
  (let ((n1035 (concat CIN26 n1034))) ; (bitvector 9)
  (let ((n1036 (concat CIN27 n1035))) ; (bitvector 10)
  (let ((n1037 (concat CIN28 n1036))) ; (bitvector 11)
  (let ((n1038 (concat CIN29 n1037))) ; (bitvector 12)
  (let ((n1039 (concat CIN30 n1038))) ; (bitvector 13)
  (let ((n1040 (concat CIN31 n1039))) ; (bitvector 14)
  (let ((n1041 (concat CIN32 n1040))) ; (bitvector 15)
  (let ((n1042 (concat CIN33 n1041))) ; (bitvector 16)
  (let ((n1043 (concat CIN34 n1042))) ; (bitvector 17)
  (let ((n1044 (concat CIN35 n1043))) ; (bitvector 18)
  (let ((n1045 (concat CIN36 n1044))) ; (bitvector 19)
  (let ((n1046 (concat CIN37 n1045))) ; (bitvector 20)
  (let ((n1047 (concat CIN38 n1046))) ; (bitvector 21)
  (let ((n1048 (concat CIN39 n1047))) ; (bitvector 22)
  (let ((n1049 (concat CIN40 n1048))) ; (bitvector 23)
  (let ((n1050 (concat CIN41 n1049))) ; (bitvector 24)
  (let ((n1051 (concat CIN42 n1050))) ; (bitvector 25)
  (let ((n1052 (concat CIN43 n1051))) ; (bitvector 26)
  (let ((n1053 (concat CIN44 n1052))) ; (bitvector 27)
  (let ((n1054 (concat CIN45 n1053))) ; (bitvector 28)
  (let ((n1055 (concat CIN46 n1054))) ; (bitvector 29)
  (let ((n1056 (concat CIN47 n1055))) ; (bitvector 30)
  (let ((n1057 (concat CIN48 n1056))) ; (bitvector 31)
  (let ((n1058 (concat CIN49 n1057))) ; (bitvector 32)
  (let ((n1059 (concat CIN50 n1058))) ; (bitvector 33)
  (let ((n1060 (concat CIN51 n1059))) ; (bitvector 34)
  (let ((n1061 (concat CIN52 n1060))) ; (bitvector 35)
  (let ((n1062 (concat CIN53 n1061))) ; (bitvector 36)
  (let ((n1063 (concat CIN53 CIN53))) ; (bitvector 2)
  (let ((n1064 (concat CIN53 n1063))) ; (bitvector 3)
  (let ((n1065 (concat CIN53 n1064))) ; (bitvector 4)
  (let ((n1066 (concat CIN53 n1065))) ; (bitvector 5)
  (let ((n1067 (concat CIN53 n1066))) ; (bitvector 6)
  (let ((n1068 (concat CIN53 n1067))) ; (bitvector 7)
  (let ((n1069 (concat CIN53 n1068))) ; (bitvector 8)
  (let ((n1070 (concat CIN53 n1069))) ; (bitvector 9)
  (let ((n1071 (concat CIN53 n1070))) ; (bitvector 10)
  (let ((n1072 (concat CIN53 n1071))) ; (bitvector 11)
  (let ((n1073 (concat CIN53 n1072))) ; (bitvector 12)
  (let ((n1074 (concat CIN53 n1073))) ; (bitvector 13)
  (let ((n1075 (concat CIN53 n1074))) ; (bitvector 14)
  (let ((n1076 (concat CIN53 n1075))) ; (bitvector 15)
  (let ((n1077 (concat CIN53 n1076))) ; (bitvector 16)
  (let ((n1078 (concat CIN53 n1077))) ; (bitvector 17)
  (let ((n1079 (concat CIN53 n1078))) ; (bitvector 18)
  (let ((SIGNEDCIN (ALU54A_Inputs-SIGNEDCIN inputs))) ; (bitvector 1)
  (let
    (($procmux$456$_Y
      (if (bitvector->bool SIGNEDCIN) n1079 (bv #b000000000000000000 18)))) ; (bitvector 18)
  (let ((cin_shift_sig (concat $procmux$456$_Y n1062))) ; (bitvector 54)
  (let ((n1083 (extract 53 36 cin_shift_sig))) ; (bitvector 18)
  (let ((n1084 (concat n1083 n1027))) ; (bitvector 324)
  (let ((n1085 (extract 53 0 n1084))) ; (bitvector 54)
  (let ((n1086 (extract 6 4 opin_sig_gen_1))) ; (bitvector 3)
  (let (($procmux$449_CMP (bool->bitvector (bveq n1086 (bv #b111 3))))) ; (bitvector 1)
  (let (($procmux$450_CMP (bool->bitvector (bveq n1086 (bv #b110 3))))) ; (bitvector 1)
  (let ((n1091 (concat $procmux$450_CMP $procmux$449_CMP))) ; (bitvector 2)
  (let (($procmux$451_CMP (bool->bitvector (bveq n1086 (bv #b100 3))))) ; (bitvector 1)
  (let ((n1094 (concat $procmux$451_CMP n1091))) ; (bitvector 3)
  (let ((n1095 (zero-extend (bv #b11 2) (bitvector 3)))) ; (bitvector 3)
  (let (($procmux$452_CMP (bool->bitvector (bveq n1086 n1095)))) ; (bitvector 1)
  (let ((n1097 (concat $procmux$452_CMP n1094))) ; (bitvector 4)
  (let ((n1098 (zero-extend (bv #b10 2) (bitvector 3)))) ; (bitvector 3)
  (let (($procmux$453_CMP (bool->bitvector (bveq n1086 n1098)))) ; (bitvector 1)
  (let ((n1100 (concat $procmux$453_CMP n1097))) ; (bitvector 5)
  (let ((n1101 (zero-extend (bv #b1 1) (bitvector 3)))) ; (bitvector 3)
  (let (($procmux$454_CMP (bool->bitvector (bveq n1086 n1101)))) ; (bitvector 1)
  (let ((n1103 (concat $procmux$454_CMP n1100))) ; (bitvector 6)
  (let ((n1104 (extract 0 0 n1103))) ; (bitvector 1)
  (let
    ((n1105
      (if
        (bitvector->bool n1104)
        n1085
        (bv #b000000000000000000000000000000000000000000000000000000 54)))) ; (bitvector 54)
  (let ((n1106 (extract 107 54 n1084))) ; (bitvector 54)
  (let ((n1107 (extract 1 1 n1103))) ; (bitvector 1)
  (let ((n1108 (if (bitvector->bool n1107) n1106 n1105))) ; (bitvector 54)
  (let ((n1109 (extract 161 108 n1084))) ; (bitvector 54)
  (let ((n1110 (extract 2 2 n1103))) ; (bitvector 1)
  (let ((n1111 (if (bitvector->bool n1110) n1109 n1108))) ; (bitvector 54)
  (let ((n1112 (extract 215 162 n1084))) ; (bitvector 54)
  (let ((n1113 (extract 3 3 n1103))) ; (bitvector 1)
  (let ((n1114 (if (bitvector->bool n1113) n1112 n1111))) ; (bitvector 54)
  (let ((n1115 (extract 269 216 n1084))) ; (bitvector 54)
  (let ((n1116 (extract 4 4 n1103))) ; (bitvector 1)
  (let ((n1117 (if (bitvector->bool n1116) n1115 n1114))) ; (bitvector 54)
  (let ((n1118 (extract 323 270 n1084))) ; (bitvector 54)
  (let ((n1119 (extract 5 5 n1103))) ; (bitvector 1)
  (let ((c_mux (if (bitvector->bool n1119) n1118 n1117))) ; (bitvector 54)
  (let
    (($or$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1731$250_Y
      (bvor b_mux c_mux))) ; (bitvector 54)
  (let
    (($not$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1735$252$_Y
      (bvnot
        $or$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1731$250_Y))) ; (bitvector 54)
  (let
    ((n1123
      (concat
        $or$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1731$250_Y
        $not$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1735$252$_Y))) ; (bitvector 108)
  (let
    (($and$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1699$229$_Y
      (bvand b_mux c_mux))) ; (bitvector 54)
  (let
    ((n1125
      (concat
        $and$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1699$229$_Y
        n1123))) ; (bitvector 162)
  (let
    (($xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1723$248_Y
      (bvxor b_mux c_mux))) ; (bitvector 54)
  (let
    ((n1127
      (concat
        $xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1723$248_Y
        n1125))) ; (bitvector 216)
  (let ((n1128 (bvxor b_mux c_mux))) ; (bitvector 54)
  (let
    (($xnor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1719$247_Y
      (bvnot n1128))) ; (bitvector 54)
  (let
    ((n1130
      (concat
        $xnor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1719$247_Y
        n1127))) ; (bitvector 270)
  (let ((n1131 (concat A1 A0))) ; (bitvector 2)
  (let ((n1132 (concat A2 n1131))) ; (bitvector 3)
  (let ((n1133 (concat A3 n1132))) ; (bitvector 4)
  (let ((n1134 (concat A4 n1133))) ; (bitvector 5)
  (let ((n1135 (concat A5 n1134))) ; (bitvector 6)
  (let ((n1136 (concat A6 n1135))) ; (bitvector 7)
  (let ((n1137 (concat A7 n1136))) ; (bitvector 8)
  (let ((n1138 (concat A8 n1137))) ; (bitvector 9)
  (let ((n1139 (concat A9 n1138))) ; (bitvector 10)
  (let ((n1140 (concat A10 n1139))) ; (bitvector 11)
  (let ((n1141 (concat A11 n1140))) ; (bitvector 12)
  (let ((n1142 (concat A12 n1141))) ; (bitvector 13)
  (let ((n1143 (concat A13 n1142))) ; (bitvector 14)
  (let ((n1144 (concat A14 n1143))) ; (bitvector 15)
  (let ((n1145 (concat A15 n1144))) ; (bitvector 16)
  (let ((n1146 (concat A16 n1145))) ; (bitvector 17)
  (let ((n1147 (concat A17 n1146))) ; (bitvector 18)
  (let ((n1148 (concat A18 n1147))) ; (bitvector 19)
  (let ((n1149 (concat A19 n1148))) ; (bitvector 20)
  (let ((n1150 (concat A20 n1149))) ; (bitvector 21)
  (let ((n1151 (concat A21 n1150))) ; (bitvector 22)
  (let ((n1152 (concat A22 n1151))) ; (bitvector 23)
  (let ((n1153 (concat A23 n1152))) ; (bitvector 24)
  (let ((n1154 (concat A24 n1153))) ; (bitvector 25)
  (let ((n1155 (concat A25 n1154))) ; (bitvector 26)
  (let ((n1156 (concat A26 n1155))) ; (bitvector 27)
  (let ((n1157 (concat A27 n1156))) ; (bitvector 28)
  (let ((n1158 (concat A28 n1157))) ; (bitvector 29)
  (let ((n1159 (concat A29 n1158))) ; (bitvector 30)
  (let ((n1160 (concat A30 n1159))) ; (bitvector 31)
  (let ((n1161 (concat A31 n1160))) ; (bitvector 32)
  (let ((n1162 (concat A32 n1161))) ; (bitvector 33)
  (let ((n1163 (concat A33 n1162))) ; (bitvector 34)
  (let ((n1164 (concat A34 n1163))) ; (bitvector 35)
  (let ((n1165 (concat A35 n1164))) ; (bitvector 36)
  (let ((n1166 (concat n880 n1165))) ; (bitvector 54)
  (let ((MA0 (ALU54A_Inputs-MA0 inputs))) ; (bitvector 1)
  (let ((MA1 (ALU54A_Inputs-MA1 inputs))) ; (bitvector 1)
  (let ((n1169 (concat MA1 MA0))) ; (bitvector 2)
  (let ((MA2 (ALU54A_Inputs-MA2 inputs))) ; (bitvector 1)
  (let ((n1171 (concat MA2 n1169))) ; (bitvector 3)
  (let ((MA3 (ALU54A_Inputs-MA3 inputs))) ; (bitvector 1)
  (let ((n1173 (concat MA3 n1171))) ; (bitvector 4)
  (let ((MA4 (ALU54A_Inputs-MA4 inputs))) ; (bitvector 1)
  (let ((n1175 (concat MA4 n1173))) ; (bitvector 5)
  (let ((MA5 (ALU54A_Inputs-MA5 inputs))) ; (bitvector 1)
  (let ((n1177 (concat MA5 n1175))) ; (bitvector 6)
  (let ((MA6 (ALU54A_Inputs-MA6 inputs))) ; (bitvector 1)
  (let ((n1179 (concat MA6 n1177))) ; (bitvector 7)
  (let ((MA7 (ALU54A_Inputs-MA7 inputs))) ; (bitvector 1)
  (let ((n1181 (concat MA7 n1179))) ; (bitvector 8)
  (let ((MA8 (ALU54A_Inputs-MA8 inputs))) ; (bitvector 1)
  (let ((n1183 (concat MA8 n1181))) ; (bitvector 9)
  (let ((MA9 (ALU54A_Inputs-MA9 inputs))) ; (bitvector 1)
  (let ((n1185 (concat MA9 n1183))) ; (bitvector 10)
  (let ((MA10 (ALU54A_Inputs-MA10 inputs))) ; (bitvector 1)
  (let ((n1187 (concat MA10 n1185))) ; (bitvector 11)
  (let ((MA11 (ALU54A_Inputs-MA11 inputs))) ; (bitvector 1)
  (let ((n1189 (concat MA11 n1187))) ; (bitvector 12)
  (let ((MA12 (ALU54A_Inputs-MA12 inputs))) ; (bitvector 1)
  (let ((n1191 (concat MA12 n1189))) ; (bitvector 13)
  (let ((MA13 (ALU54A_Inputs-MA13 inputs))) ; (bitvector 1)
  (let ((n1193 (concat MA13 n1191))) ; (bitvector 14)
  (let ((MA14 (ALU54A_Inputs-MA14 inputs))) ; (bitvector 1)
  (let ((n1195 (concat MA14 n1193))) ; (bitvector 15)
  (let ((MA15 (ALU54A_Inputs-MA15 inputs))) ; (bitvector 1)
  (let ((n1197 (concat MA15 n1195))) ; (bitvector 16)
  (let ((MA16 (ALU54A_Inputs-MA16 inputs))) ; (bitvector 1)
  (let ((n1199 (concat MA16 n1197))) ; (bitvector 17)
  (let ((MA17 (ALU54A_Inputs-MA17 inputs))) ; (bitvector 1)
  (let ((n1201 (concat MA17 n1199))) ; (bitvector 18)
  (let ((MA18 (ALU54A_Inputs-MA18 inputs))) ; (bitvector 1)
  (let ((n1203 (concat MA18 n1201))) ; (bitvector 19)
  (let ((MA19 (ALU54A_Inputs-MA19 inputs))) ; (bitvector 1)
  (let ((n1205 (concat MA19 n1203))) ; (bitvector 20)
  (let ((MA20 (ALU54A_Inputs-MA20 inputs))) ; (bitvector 1)
  (let ((n1207 (concat MA20 n1205))) ; (bitvector 21)
  (let ((MA21 (ALU54A_Inputs-MA21 inputs))) ; (bitvector 1)
  (let ((n1209 (concat MA21 n1207))) ; (bitvector 22)
  (let ((MA22 (ALU54A_Inputs-MA22 inputs))) ; (bitvector 1)
  (let ((n1211 (concat MA22 n1209))) ; (bitvector 23)
  (let ((MA23 (ALU54A_Inputs-MA23 inputs))) ; (bitvector 1)
  (let ((n1213 (concat MA23 n1211))) ; (bitvector 24)
  (let ((MA24 (ALU54A_Inputs-MA24 inputs))) ; (bitvector 1)
  (let ((n1215 (concat MA24 n1213))) ; (bitvector 25)
  (let ((MA25 (ALU54A_Inputs-MA25 inputs))) ; (bitvector 1)
  (let ((n1217 (concat MA25 n1215))) ; (bitvector 26)
  (let ((MA26 (ALU54A_Inputs-MA26 inputs))) ; (bitvector 1)
  (let ((n1219 (concat MA26 n1217))) ; (bitvector 27)
  (let ((MA27 (ALU54A_Inputs-MA27 inputs))) ; (bitvector 1)
  (let ((n1221 (concat MA27 n1219))) ; (bitvector 28)
  (let ((MA28 (ALU54A_Inputs-MA28 inputs))) ; (bitvector 1)
  (let ((n1223 (concat MA28 n1221))) ; (bitvector 29)
  (let ((MA29 (ALU54A_Inputs-MA29 inputs))) ; (bitvector 1)
  (let ((n1225 (concat MA29 n1223))) ; (bitvector 30)
  (let ((MA30 (ALU54A_Inputs-MA30 inputs))) ; (bitvector 1)
  (let ((n1227 (concat MA30 n1225))) ; (bitvector 31)
  (let ((MA31 (ALU54A_Inputs-MA31 inputs))) ; (bitvector 1)
  (let ((n1229 (concat MA31 n1227))) ; (bitvector 32)
  (let ((MA32 (ALU54A_Inputs-MA32 inputs))) ; (bitvector 1)
  (let ((n1231 (concat MA32 n1229))) ; (bitvector 33)
  (let ((MA33 (ALU54A_Inputs-MA33 inputs))) ; (bitvector 1)
  (let ((n1233 (concat MA33 n1231))) ; (bitvector 34)
  (let ((MA34 (ALU54A_Inputs-MA34 inputs))) ; (bitvector 1)
  (let ((n1235 (concat MA34 n1233))) ; (bitvector 35)
  (let ((MA35 (ALU54A_Inputs-MA35 inputs))) ; (bitvector 1)
  (let ((n1237 (concat MA35 n1235))) ; (bitvector 36)
  (let ((n1238 (concat MA35 MA35))) ; (bitvector 2)
  (let ((n1239 (concat MA35 n1238))) ; (bitvector 3)
  (let ((n1240 (concat MA35 n1239))) ; (bitvector 4)
  (let ((n1241 (concat MA35 n1240))) ; (bitvector 5)
  (let ((n1242 (concat MA35 n1241))) ; (bitvector 6)
  (let ((n1243 (concat MA35 n1242))) ; (bitvector 7)
  (let ((n1244 (concat MA35 n1243))) ; (bitvector 8)
  (let ((n1245 (concat MA35 n1244))) ; (bitvector 9)
  (let ((n1246 (concat MA35 n1245))) ; (bitvector 10)
  (let ((n1247 (concat MA35 n1246))) ; (bitvector 11)
  (let ((n1248 (concat MA35 n1247))) ; (bitvector 12)
  (let ((n1249 (concat MA35 n1248))) ; (bitvector 13)
  (let ((n1250 (concat MA35 n1249))) ; (bitvector 14)
  (let ((n1251 (concat MA35 n1250))) ; (bitvector 15)
  (let ((n1252 (concat MA35 n1251))) ; (bitvector 16)
  (let ((n1253 (concat MA35 n1252))) ; (bitvector 17)
  (let ((n1254 (concat MA35 n1253))) ; (bitvector 18)
  (let ((SIGNEDIA (ALU54A_Inputs-SIGNEDIA inputs))) ; (bitvector 1)
  (let
    (($procmux$517$_Y
      (if (bitvector->bool SIGNEDIA) n1254 (bv #b000000000000000000 18)))) ; (bitvector 18)
  (let ((n1257 (concat $procmux$517$_Y n1237))) ; (bitvector 54)
  (let ((n1258 (concat MA1 MA0))) ; (bitvector 2)
  (let ((n1259 (concat MA2 n1258))) ; (bitvector 3)
  (let ((n1260 (concat MA3 n1259))) ; (bitvector 4)
  (let ((n1261 (concat MA4 n1260))) ; (bitvector 5)
  (let ((n1262 (concat MA5 n1261))) ; (bitvector 6)
  (let ((n1263 (concat MA6 n1262))) ; (bitvector 7)
  (let ((n1264 (concat MA7 n1263))) ; (bitvector 8)
  (let ((n1265 (concat MA8 n1264))) ; (bitvector 9)
  (let ((n1266 (concat MA9 n1265))) ; (bitvector 10)
  (let ((n1267 (concat MA10 n1266))) ; (bitvector 11)
  (let ((n1268 (concat MA11 n1267))) ; (bitvector 12)
  (let ((n1269 (concat MA12 n1268))) ; (bitvector 13)
  (let ((n1270 (concat MA13 n1269))) ; (bitvector 14)
  (let ((n1271 (concat MA14 n1270))) ; (bitvector 15)
  (let ((n1272 (concat MA15 n1271))) ; (bitvector 16)
  (let ((n1273 (concat MA16 n1272))) ; (bitvector 17)
  (let ((n1274 (concat MA17 n1273))) ; (bitvector 18)
  (let ((n1275 (concat MA17 MA17))) ; (bitvector 2)
  (let ((n1276 (concat MA17 n1275))) ; (bitvector 3)
  (let ((n1277 (concat MA17 n1276))) ; (bitvector 4)
  (let ((n1278 (concat MA17 n1277))) ; (bitvector 5)
  (let ((n1279 (concat MA17 n1278))) ; (bitvector 6)
  (let ((n1280 (concat MA17 n1279))) ; (bitvector 7)
  (let
    (($procmux$544$_Y (if (bitvector->bool SIGNEDIA) n1280 (bv #b0000000 7)))) ; (bitvector 7)
  (let ((n1282 (concat $procmux$544$_Y n1274))) ; (bitvector 25)
  (let ((n1284 (concat (bv #b00 2) n1282))) ; (bitvector 27)
  (let ((n1285 (concat op7_sig_gen_1 n1284))) ; (bitvector 28)
  (let ((n1286 (concat MA18 n1285))) ; (bitvector 29)
  (let ((n1287 (concat MA19 n1286))) ; (bitvector 30)
  (let ((n1288 (concat MA20 n1287))) ; (bitvector 31)
  (let ((n1289 (concat MA21 n1288))) ; (bitvector 32)
  (let ((n1290 (concat MA22 n1289))) ; (bitvector 33)
  (let ((n1291 (concat MA23 n1290))) ; (bitvector 34)
  (let ((n1292 (concat MA24 n1291))) ; (bitvector 35)
  (let ((n1293 (concat MA25 n1292))) ; (bitvector 36)
  (let ((n1294 (concat MA26 n1293))) ; (bitvector 37)
  (let ((n1295 (concat MA27 n1294))) ; (bitvector 38)
  (let ((n1296 (concat MA28 n1295))) ; (bitvector 39)
  (let ((n1297 (concat MA29 n1296))) ; (bitvector 40)
  (let ((n1298 (concat MA30 n1297))) ; (bitvector 41)
  (let ((n1299 (concat MA31 n1298))) ; (bitvector 42)
  (let ((n1300 (concat MA32 n1299))) ; (bitvector 43)
  (let ((n1301 (concat MA33 n1300))) ; (bitvector 44)
  (let ((n1302 (concat MA34 n1301))) ; (bitvector 45)
  (let ((n1303 (concat MA35 n1302))) ; (bitvector 46)
  (let ((n1304 (concat MA35 MA35))) ; (bitvector 2)
  (let ((n1305 (concat MA35 n1304))) ; (bitvector 3)
  (let ((n1306 (concat MA35 n1305))) ; (bitvector 4)
  (let ((n1307 (concat MA35 n1306))) ; (bitvector 5)
  (let ((n1308 (concat MA35 n1307))) ; (bitvector 6)
  (let ((n1309 (concat MA35 n1308))) ; (bitvector 7)
  (let ((n1310 (concat MA35 n1309))) ; (bitvector 8)
  (let
    (($procmux$550$_Y (if (bitvector->bool SIGNEDIA) n1310 (bv #b00000000 8)))) ; (bitvector 8)
  (let ((n1312 (concat $procmux$550$_Y n1303))) ; (bitvector 54)
  (let
    ((ma_sig_m
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1498$214$_Y)
        n1312
        n1257))) ; (bitvector 54)
  (let ((n1314 (concat ma_sig_m n1166))) ; (bitvector 108)
  (let ((n1315 (extract 53 0 n1314))) ; (bitvector 54)
  (let ((n1316 (extract 1 0 opin_sig_gen_1))) ; (bitvector 2)
  (let (($procmux$468_CMP (bool->bitvector (bveq n1316 (bv #b10 2))))) ; (bitvector 1)
  (let ((n1318 (zero-extend (bv #b1 1) (bitvector 2)))) ; (bitvector 2)
  (let (($procmux$469_CMP (bool->bitvector (bveq n1316 n1318)))) ; (bitvector 1)
  (let ((n1320 (concat $procmux$469_CMP $procmux$468_CMP))) ; (bitvector 2)
  (let ((n1321 (extract 0 0 n1320))) ; (bitvector 1)
  (let
    ((n1322
      (if
        (bitvector->bool n1321)
        n1315
        (bv #b000000000000000000000000000000000000000000000000000000 54)))) ; (bitvector 54)
  (let ((n1323 (extract 107 54 n1314))) ; (bitvector 54)
  (let ((n1324 (extract 1 1 n1320))) ; (bitvector 1)
  (let ((a_mux (if (bitvector->bool n1324) n1323 n1322))) ; (bitvector 54)
  (let
    (($sub$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1707$235_Y
      (bvsub a_mux b_mux))) ; (bitvector 54)
  (let
    (($sub$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1715$244_Y
      (bvsub
        $sub$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1707$235_Y
        c_mux))) ; (bitvector 54)
  (let
    ((n1328
      (concat
        $sub$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1715$244_Y
        n1130))) ; (bitvector 324)
  (let
    (($add$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1703$231_Y
      (bvadd a_mux b_mux))) ; (bitvector 54)
  (let
    (($sub$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1711$240_Y
      (bvsub
        $add$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1703$231_Y
        c_mux))) ; (bitvector 54)
  (let
    ((n1331
      (concat
        $sub$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1711$240_Y
        n1328))) ; (bitvector 378)
  (let
    (($add$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1707$236$_Y
      (bvadd
        $sub$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1707$235_Y
        c_mux))) ; (bitvector 54)
  (let
    ((n1333
      (concat
        $add$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1707$236$_Y
        n1331))) ; (bitvector 432)
  (let
    (($add$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1703$232$_Y
      (bvadd
        $add$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1703$231_Y
        c_mux))) ; (bitvector 54)
  (let
    ((n1335
      (concat
        $add$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1703$232$_Y
        n1333))) ; (bitvector 486)
  (let
    (($not$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1699$230$_Y
      (bvnot
        $and$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1699$229$_Y))) ; (bitvector 54)
  (let
    ((n1337
      (concat
        $not$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1699$230$_Y
        n1335))) ; (bitvector 540)
  (let ((n1338 (extract 53 0 n1337))) ; (bitvector 54)
  (let ((n1339 (apply bvor (bitvector->bits REG_OPCODEOP1_1_CLK)))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1470$208$_Y
      (bvnot n1339))) ; (bitvector 1)
  (let
    ((op10_sig_gen_1
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1470$208$_Y)
        op10_sig_gen_0
        op10_sig_1_sync))) ; (bitvector 3)
  (let ((n1342 (concat op10_sig_gen_1 op7_sig_gen_1))) ; (bitvector 4)
  (let (($procmux$437_CMP (bool->bitvector (bveq n1342 (bv #b1011 4))))) ; (bitvector 1)
  (let ((n1344 (zero-extend (bv #b11 2) (bitvector 4)))) ; (bitvector 4)
  (let (($procmux$438_CMP (bool->bitvector (bveq n1342 n1344)))) ; (bitvector 1)
  (let ((n1346 (concat $procmux$438_CMP $procmux$437_CMP))) ; (bitvector 2)
  (let (($procmux$439_CMP (bool->bitvector (bveq n1342 (bv #b1000 4))))) ; (bitvector 1)
  (let ((n1349 (concat $procmux$439_CMP n1346))) ; (bitvector 3)
  (let (($procmux$440_CMP (bool->bitvector (bveq n1342 (bv #b1110 4))))) ; (bitvector 1)
  (let ((n1351 (concat $procmux$440_CMP n1349))) ; (bitvector 4)
  (let (($procmux$441_CMP (bool->bitvector (bveq n1342 (bv #b1100 4))))) ; (bitvector 1)
  (let ((n1353 (concat $procmux$441_CMP n1351))) ; (bitvector 5)
  (let ((n1354 (zero-extend (bv #b111 3) (bitvector 4)))) ; (bitvector 4)
  (let (($procmux$431_CMP (bool->bitvector (bveq n1342 n1354)))) ; (bitvector 1)
  (let ((n1356 (concat $procmux$431_CMP n1353))) ; (bitvector 6)
  (let ((n1357 (zero-extend (bv #b110 3) (bitvector 4)))) ; (bitvector 4)
  (let (($procmux$432_CMP (bool->bitvector (bveq n1342 n1357)))) ; (bitvector 1)
  (let ((n1359 (concat $procmux$432_CMP n1356))) ; (bitvector 7)
  (let ((n1361 (zero-extend (bv #b101 3) (bitvector 4)))) ; (bitvector 4)
  (let (($procmux$433_CMP (bool->bitvector (bveq n1342 n1361)))) ; (bitvector 1)
  (let ((n1363 (concat $procmux$433_CMP n1359))) ; (bitvector 8)
  (let ((n1364 (zero-extend (bv #b100 3) (bitvector 4)))) ; (bitvector 4)
  (let (($procmux$434_CMP (bool->bitvector (bveq n1342 n1364)))) ; (bitvector 1)
  (let ((n1366 (concat $procmux$434_CMP n1363))) ; (bitvector 9)
  (let ((n1367 (apply bvor (bitvector->bits n1342)))) ; (bitvector 1)
  (let (($procmux$446_CMP (bvnot n1367))) ; (bitvector 1)
  (let ((n1369 (concat $procmux$446_CMP n1366))) ; (bitvector 10)
  (let ((n1370 (extract 0 0 n1369))) ; (bitvector 1)
  (let
    ((n1371
      (if
        (bitvector->bool n1370)
        n1338
        (bv #b000000000000000000000000000000000000000000000000000000 54)))) ; (bitvector 54)
  (let ((n1372 (extract 107 54 n1337))) ; (bitvector 54)
  (let ((n1373 (extract 1 1 n1369))) ; (bitvector 1)
  (let ((n1374 (if (bitvector->bool n1373) n1372 n1371))) ; (bitvector 54)
  (let ((n1375 (extract 161 108 n1337))) ; (bitvector 54)
  (let ((n1376 (extract 2 2 n1369))) ; (bitvector 1)
  (let ((n1377 (if (bitvector->bool n1376) n1375 n1374))) ; (bitvector 54)
  (let ((n1378 (extract 215 162 n1337))) ; (bitvector 54)
  (let ((n1379 (extract 3 3 n1369))) ; (bitvector 1)
  (let ((n1380 (if (bitvector->bool n1379) n1378 n1377))) ; (bitvector 54)
  (let ((n1381 (extract 269 216 n1337))) ; (bitvector 54)
  (let ((n1382 (extract 4 4 n1369))) ; (bitvector 1)
  (let ((n1383 (if (bitvector->bool n1382) n1381 n1380))) ; (bitvector 54)
  (let ((n1384 (extract 323 270 n1337))) ; (bitvector 54)
  (let ((n1385 (extract 5 5 n1369))) ; (bitvector 1)
  (let ((n1386 (if (bitvector->bool n1385) n1384 n1383))) ; (bitvector 54)
  (let ((n1387 (extract 377 324 n1337))) ; (bitvector 54)
  (let ((n1388 (extract 6 6 n1369))) ; (bitvector 1)
  (let ((n1389 (if (bitvector->bool n1388) n1387 n1386))) ; (bitvector 54)
  (let ((n1390 (extract 431 378 n1337))) ; (bitvector 54)
  (let ((n1391 (extract 7 7 n1369))) ; (bitvector 1)
  (let ((n1392 (if (bitvector->bool n1391) n1390 n1389))) ; (bitvector 54)
  (let ((n1393 (extract 485 432 n1337))) ; (bitvector 54)
  (let ((n1394 (extract 8 8 n1369))) ; (bitvector 1)
  (let ((n1395 (if (bitvector->bool n1394) n1393 n1392))) ; (bitvector 54)
  (let ((n1396 (extract 539 486 n1337))) ; (bitvector 54)
  (let ((n1397 (extract 9 9 n1369))) ; (bitvector 1)
  (let ((r_out (if (bitvector->bool n1397) n1396 n1395))) ; (bitvector 54)
  (let ((n1399 (extract 53 18 r_out))) ; (bitvector 36)
  (let ((REG_OUTPUT1_CE (ALU54A_Inputs-REG_OUTPUT1_CE inputs))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1045$57$_Y
      (bool->bitvector (bveq REG_OUTPUT1_CE (bv #b10001 5))))) ; (bitvector 1)
  (let
    (($procmux$1183$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1045$57$_Y)
        CE3
        CE0))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1044$56$_Y
      (bool->bitvector (bveq REG_OUTPUT1_CE (bv #b10000 5))))) ; (bitvector 1)
  (let
    (($procmux$1195$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1044$56$_Y)
        CE2
        $procmux$1183$_Y))) ; (bitvector 1)
  (let ((n1405 (zero-extend (bv #b1111 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1043$55$_Y
      (bool->bitvector (bveq REG_OUTPUT1_CE n1405)))) ; (bitvector 1)
  (let
    (($procmux$1204$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1043$55$_Y)
        CE1
        $procmux$1195$_Y))) ; (bitvector 1)
  (let ((n1408 (zero-extend (bv #b1 1) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1042$54$_Y
      (bool->bitvector (bveq REG_OUTPUT1_CE n1408)))) ; (bitvector 1)
  (let
    (($procmux$1210$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1042$54$_Y)
        CE0
        $procmux$1204$_Y))) ; (bitvector 1)
  (let
    (($procmux$407$_Y
      (if (bitvector->bool $procmux$1210$_Y) n1399 r_out_msb_sync))) ; (bitvector 36)
  (let ((REG_OUTPUT1_RST (ALU54A_Inputs-REG_OUTPUT1_RST inputs))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1053$62$_Y
      (bool->bitvector (bveq REG_OUTPUT1_RST (bv #b10100 5))))) ; (bitvector 1)
  (let
    (($procmux$1153$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1053$62$_Y)
        RST3
        RST0))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1052$61$_Y
      (bool->bitvector (bveq REG_OUTPUT1_RST (bv #b10011 5))))) ; (bitvector 1)
  (let
    (($procmux$1165$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1052$61$_Y)
        RST2
        $procmux$1153$_Y))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1051$60$_Y
      (bool->bitvector (bveq REG_OUTPUT1_RST (bv #b10010 5))))) ; (bitvector 1)
  (let
    (($procmux$1174$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1051$60$_Y)
        RST1
        $procmux$1165$_Y))) ; (bitvector 1)
  (let ((n1420 (zero-extend (bv #b10 2) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1050$59$_Y
      (bool->bitvector (bveq REG_OUTPUT1_RST n1420)))) ; (bitvector 1)
  (let
    (($procmux$1180$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1050$59$_Y)
        RST0
        $procmux$1174$_Y))) ; (bitvector 1)
  (let
    (($0_r_out_msb_sync_35_0_
      (if
        (bitvector->bool $procmux$1180$_Y)
        (bv #b000000000000000000000000000000000000 36)
        $procmux$407$_Y))) ; (bitvector 36)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$1675$_Q
      (ALU54A_State-$auto$clk2fflogic.cc_102_sample_data$1675 state))) ; (bitvector 18)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$1677$_Q
      (ALU54A_State-$auto$clk2fflogic.cc_102_sample_data$1677 state))) ; (bitvector 18)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_output0_clk_sig_sampled$1678
      (ALU54A_State-$auto$clk2fflogic.cc_86_sample_control_edge$1679 state))) ; (bitvector 1)
  (let
    ((n1427
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_output0_clk_sig_sampled$1678
        output0_clk_sig))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$1680$_Y
      (bool->bitvector (bveq n1427 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((r_out_lsb_sync
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$1680$_Y)
        $auto$clk2fflogic.cc_102_sample_data$1677$_Q
        $auto$clk2fflogic.cc_102_sample_data$1675$_Q))) ; (bitvector 18)
  (let ((n1430 (extract 17 0 r_out))) ; (bitvector 18)
  (let ((REG_OUTPUT0_CE (ALU54A_Inputs-REG_OUTPUT0_CE inputs))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1021$42$_Y
      (bool->bitvector (bveq REG_OUTPUT0_CE (bv #b10001 5))))) ; (bitvector 1)
  (let
    (($procmux$1273$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1021$42$_Y)
        CE3
        CE0))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1020$41$_Y
      (bool->bitvector (bveq REG_OUTPUT0_CE (bv #b10000 5))))) ; (bitvector 1)
  (let
    (($procmux$1285$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1020$41$_Y)
        CE2
        $procmux$1273$_Y))) ; (bitvector 1)
  (let ((n1436 (zero-extend (bv #b1111 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1019$40$_Y
      (bool->bitvector (bveq REG_OUTPUT0_CE n1436)))) ; (bitvector 1)
  (let
    (($procmux$1294$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1019$40$_Y)
        CE1
        $procmux$1285$_Y))) ; (bitvector 1)
  (let ((n1439 (zero-extend (bv #b1 1) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1018$39$_Y
      (bool->bitvector (bveq REG_OUTPUT0_CE n1439)))) ; (bitvector 1)
  (let
    (($procmux$1300$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1018$39$_Y)
        CE0
        $procmux$1294$_Y))) ; (bitvector 1)
  (let
    (($procmux$417$_Y
      (if (bitvector->bool $procmux$1300$_Y) n1430 r_out_lsb_sync))) ; (bitvector 18)
  (let ((REG_OUTPUT0_RST (ALU54A_Inputs-REG_OUTPUT0_RST inputs))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1029$47$_Y
      (bool->bitvector (bveq REG_OUTPUT0_RST (bv #b10100 5))))) ; (bitvector 1)
  (let
    (($procmux$1243$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1029$47$_Y)
        RST3
        RST0))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1028$46$_Y
      (bool->bitvector (bveq REG_OUTPUT0_RST (bv #b10011 5))))) ; (bitvector 1)
  (let
    (($procmux$1255$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1028$46$_Y)
        RST2
        $procmux$1243$_Y))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1027$45$_Y
      (bool->bitvector (bveq REG_OUTPUT0_RST (bv #b10010 5))))) ; (bitvector 1)
  (let
    (($procmux$1264$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1027$45$_Y)
        RST1
        $procmux$1255$_Y))) ; (bitvector 1)
  (let ((n1450 (zero-extend (bv #b10 2) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1026$44$_Y
      (bool->bitvector (bveq REG_OUTPUT0_RST n1450)))) ; (bitvector 1)
  (let
    (($procmux$1270$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1026$44$_Y)
        RST0
        $procmux$1264$_Y))) ; (bitvector 1)
  (let
    (($0_r_out_lsb_sync_17_0_
      (if
        (bitvector->bool $procmux$1270$_Y)
        (bv #b000000000000000000 18)
        $procmux$417$_Y))) ; (bitvector 18)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$1645$_Q
      (ALU54A_State-$auto$clk2fflogic.cc_102_sample_data$1645 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$1647$_Q
      (ALU54A_State-$auto$clk2fflogic.cc_102_sample_data$1647 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_flag_clk_sig_sampled$1648
      (ALU54A_State-$auto$clk2fflogic.cc_86_sample_control_edge$1649 state))) ; (bitvector 1)
  (let
    ((n1457
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_flag_clk_sig_sampled$1648
        flag_clk_sig))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$1650$_Y
      (bool->bitvector (bveq n1457 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((under_sync
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$1650$_Y)
        $auto$clk2fflogic.cc_102_sample_data$1647$_Q
        $auto$clk2fflogic.cc_102_sample_data$1645$_Q))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$1605$_Q
      (ALU54A_State-$auto$clk2fflogic.cc_102_sample_data$1605 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$1607$_Q
      (ALU54A_State-$auto$clk2fflogic.cc_102_sample_data$1607 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_flag_clk_sig_sampled$1608
      (ALU54A_State-$auto$clk2fflogic.cc_86_sample_control_edge$1609 state))) ; (bitvector 1)
  (let
    ((n1463
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_flag_clk_sig_sampled$1608
        flag_clk_sig))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$1610$_Y
      (bool->bitvector (bveq n1463 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((eqom_sync
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$1610$_Y)
        $auto$clk2fflogic.cc_102_sample_data$1607$_Q
        $auto$clk2fflogic.cc_102_sample_data$1605$_Q))) ; (bitvector 1)
  (let ((MASK01 (ALU54A_Inputs-MASK01 inputs))) ; (bitvector 56)
  (let ((n1467 (extract 53 0 MASK01))) ; (bitvector 54)
  (let
    (($or$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1803$278$_Y
      (bvor r_out n1467))) ; (bitvector 54)
  (let
    ((eqom_sig
      (apply
        bvand
        (bitvector->bits
          $or$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1803$278$_Y)))) ; (bitvector 1)
  (let ((n1470 (apply bvor (bitvector->bits REG_OUTPUT1_CLK)))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1786$268$_Y
      (bvnot n1470))) ; (bitvector 1)
  (let
    ((eqom_gen
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1786$268$_Y)
        eqom_sig
        eqom_sync))) ; (bitvector 1)
  (let
    (($not$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1800$272$_Y
      (bvnot r_out))) ; (bitvector 54)
  (let
    (($or$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1800$273$_Y
      (bvor
        $not$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1800$272$_Y
        n1467))) ; (bitvector 54)
  (let
    ((eqzm_sig
      (apply
        bvand
        (bitvector->bits
          $or$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1800$273$_Y)))) ; (bitvector 1)
  (let
    (($or$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1824$291_Y
      (bvor eqzm_sig eqom_sig))) ; (bitvector 1)
  (let
    ((eqnor_sig
      (bvnot
        $or$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1824$291_Y))) ; (bitvector 1)
  (let
    (($and$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1826$294$_Y
      (bvand eqom_gen eqnor_sig))) ; (bitvector 1)
  (let ((REG_FLAG_CE (ALU54A_Inputs-REG_FLAG_CE inputs))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1069$72$_Y
      (bool->bitvector (bveq REG_FLAG_CE (bv #b10001 5))))) ; (bitvector 1)
  (let
    (($procmux$1093$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1069$72$_Y)
        CE3
        CE0))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1068$71$_Y
      (bool->bitvector (bveq REG_FLAG_CE (bv #b10000 5))))) ; (bitvector 1)
  (let
    (($procmux$1105$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1068$71$_Y)
        CE2
        $procmux$1093$_Y))) ; (bitvector 1)
  (let ((n1484 (zero-extend (bv #b1111 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1067$70$_Y
      (bool->bitvector (bveq REG_FLAG_CE n1484)))) ; (bitvector 1)
  (let
    (($procmux$1114$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1067$70$_Y)
        CE1
        $procmux$1105$_Y))) ; (bitvector 1)
  (let ((n1487 (zero-extend (bv #b1 1) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1066$69$_Y
      (bool->bitvector (bveq REG_FLAG_CE n1487)))) ; (bitvector 1)
  (let
    (($procmux$1120$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1066$69$_Y)
        CE0
        $procmux$1114$_Y))) ; (bitvector 1)
  (let
    (($procmux$341$_Y
      (if
        (bitvector->bool $procmux$1120$_Y)
        $and$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1826$294$_Y
        under_sync))) ; (bitvector 1)
  (let ((REG_FLAG_RST (ALU54A_Inputs-REG_FLAG_RST inputs))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1077$77$_Y
      (bool->bitvector (bveq REG_FLAG_RST (bv #b10100 5))))) ; (bitvector 1)
  (let
    (($procmux$1063$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1077$77$_Y)
        RST3
        RST0))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1076$76$_Y
      (bool->bitvector (bveq REG_FLAG_RST (bv #b10011 5))))) ; (bitvector 1)
  (let
    (($procmux$1075$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1076$76$_Y)
        RST2
        $procmux$1063$_Y))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1075$75$_Y
      (bool->bitvector (bveq REG_FLAG_RST (bv #b10010 5))))) ; (bitvector 1)
  (let
    (($procmux$1084$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1075$75$_Y)
        RST1
        $procmux$1075$_Y))) ; (bitvector 1)
  (let ((n1498 (zero-extend (bv #b10 2) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1074$74$_Y
      (bool->bitvector (bveq REG_FLAG_RST n1498)))) ; (bitvector 1)
  (let
    (($procmux$1090$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1074$74$_Y)
        RST0
        $procmux$1084$_Y))) ; (bitvector 1)
  (let
    (($0_under_sync_0_0_
      (if (bitvector->bool $procmux$1090$_Y) (bv #b0 1) $procmux$341$_Y))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$1655$_Q
      (ALU54A_State-$auto$clk2fflogic.cc_102_sample_data$1655 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$1657$_Q
      (ALU54A_State-$auto$clk2fflogic.cc_102_sample_data$1657 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_flag_clk_sig_sampled$1658
      (ALU54A_State-$auto$clk2fflogic.cc_86_sample_control_edge$1659 state))) ; (bitvector 1)
  (let
    ((n1505
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_flag_clk_sig_sampled$1658
        flag_clk_sig))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$1660$_Y
      (bool->bitvector (bveq n1505 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((overunder_sync
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$1660$_Y)
        $auto$clk2fflogic.cc_102_sample_data$1657$_Q
        $auto$clk2fflogic.cc_102_sample_data$1655$_Q))) ; (bitvector 1)
  (let ((n1509 (extract 51 0 a_mux))) ; (bitvector 52)
  (let ((n1510 (zero-extend n1509 (bitvector 53)))) ; (bitvector 53)
  (let ((n1511 (extract 51 0 b_mux))) ; (bitvector 52)
  (let ((n1512 (zero-extend n1511 (bitvector 53)))) ; (bitvector 53)
  (let
    (($sub$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1708$237_Y
      (bvsub n1510 n1512))) ; (bitvector 53)
  (let ((n1514 (extract 51 0 c_mux))) ; (bitvector 52)
  (let ((n1515 (zero-extend n1514 (bitvector 53)))) ; (bitvector 53)
  (let
    (($sub$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1716$246_Y
      (bvsub
        $sub$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1708$237_Y
        n1515))) ; (bitvector 53)
  (let ((n1517 (extract 51 0 a_mux))) ; (bitvector 52)
  (let ((n1518 (zero-extend n1517 (bitvector 53)))) ; (bitvector 53)
  (let ((n1519 (extract 51 0 b_mux))) ; (bitvector 52)
  (let ((n1520 (zero-extend n1519 (bitvector 53)))) ; (bitvector 53)
  (let
    (($add$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1704$233$_Y
      (bvadd n1518 n1520))) ; (bitvector 53)
  (let ((n1522 (zero-extend n1514 (bitvector 53)))) ; (bitvector 53)
  (let
    (($sub$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1712$242_Y
      (bvsub
        $add$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1704$233$_Y
        n1522))) ; (bitvector 53)
  (let
    ((n1524
      (concat
        $sub$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1712$242_Y
        $sub$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1716$246_Y))) ; (bitvector 106)
  (let ((n1525 (extract 51 0 c_mux))) ; (bitvector 52)
  (let ((n1526 (zero-extend n1525 (bitvector 53)))) ; (bitvector 53)
  (let
    (($add$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1708$238$_Y
      (bvadd
        $sub$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1708$237_Y
        n1526))) ; (bitvector 53)
  (let
    ((n1528
      (concat
        $add$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1708$238$_Y
        n1524))) ; (bitvector 159)
  (let ((n1529 (zero-extend n1525 (bitvector 53)))) ; (bitvector 53)
  (let
    (($add$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1704$234$_Y
      (bvadd
        $add$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1704$233$_Y
        n1529))) ; (bitvector 53)
  (let
    ((n1531
      (concat
        $add$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1704$234$_Y
        n1528))) ; (bitvector 212)
  (let ((n1532 (extract 52 0 n1531))) ; (bitvector 53)
  (let ((n1533 (concat $procmux$432_CMP $procmux$431_CMP))) ; (bitvector 2)
  (let ((n1534 (concat $procmux$433_CMP n1533))) ; (bitvector 3)
  (let ((n1535 (concat $procmux$434_CMP n1534))) ; (bitvector 4)
  (let ((n1536 (extract 0 0 n1535))) ; (bitvector 1)
  (let
    ((n1537
      (if
        (bitvector->bool n1536)
        n1532
        (bv #b00000000000000000000000000000000000000000000000000000 53)))) ; (bitvector 53)
  (let ((n1538 (extract 105 53 n1531))) ; (bitvector 53)
  (let ((n1539 (extract 1 1 n1535))) ; (bitvector 1)
  (let ((n1540 (if (bitvector->bool n1539) n1538 n1537))) ; (bitvector 53)
  (let ((n1541 (extract 158 106 n1531))) ; (bitvector 53)
  (let ((n1542 (extract 2 2 n1535))) ; (bitvector 1)
  (let ((n1543 (if (bitvector->bool n1542) n1541 n1540))) ; (bitvector 53)
  (let ((n1544 (extract 211 159 n1531))) ; (bitvector 53)
  (let ((n1545 (extract 3 3 n1535))) ; (bitvector 1)
  (let ((r_out1 (if (bitvector->bool n1545) n1544 n1543))) ; (bitvector 53)
  (let ((n1547 (extract 52 52 r_out1))) ; (bitvector 1)
  (let
    (($and$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1827$295$_Y
      (bvand SIGNEDIA SIGNEDIB))) ; (bitvector 1)
  (let
    (($not$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1827$296$_Y
      (bvnot
        $and$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1827$295$_Y))) ; (bitvector 1)
  (let ((LEGACY (ALU54A_Inputs-LEGACY inputs))) ; (bitvector 5)
  (let ((n1551 (zero-extend (bv #b101 3) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1831$299$_Y
      (bool->bitvector (bveq LEGACY n1551)))) ; (bitvector 1)
  (let
    ((over_under_sel
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1831$299$_Y)
        (bv #b0 1)
        $not$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1827$296$_Y))) ; (bitvector 1)
  (let ((overunder_sig (if (bitvector->bool over_under_sel) n1547 eqnor_sig))) ; (bitvector 1)
  (let
    (($procmux$336$_Y
      (if (bitvector->bool $procmux$1120$_Y) overunder_sig overunder_sync))) ; (bitvector 1)
  (let
    (($0_overunder_sync_0_0_
      (if (bitvector->bool $procmux$1090$_Y) (bv #b0 1) $procmux$336$_Y))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$1635$_Q
      (ALU54A_State-$auto$clk2fflogic.cc_102_sample_data$1635 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$1637$_Q
      (ALU54A_State-$auto$clk2fflogic.cc_102_sample_data$1637 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_flag_clk_sig_sampled$1638
      (ALU54A_State-$auto$clk2fflogic.cc_86_sample_control_edge$1639 state))) ; (bitvector 1)
  (let
    ((n1560
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_flag_clk_sig_sampled$1638
        flag_clk_sig))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$1640$_Y
      (bool->bitvector (bveq n1560 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((over_sync
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$1640$_Y)
        $auto$clk2fflogic.cc_102_sample_data$1637$_Q
        $auto$clk2fflogic.cc_102_sample_data$1635$_Q))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$1595$_Q
      (ALU54A_State-$auto$clk2fflogic.cc_102_sample_data$1595 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$1597$_Q
      (ALU54A_State-$auto$clk2fflogic.cc_102_sample_data$1597 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_flag_clk_sig_sampled$1598
      (ALU54A_State-$auto$clk2fflogic.cc_86_sample_control_edge$1599 state))) ; (bitvector 1)
  (let
    ((n1566
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_flag_clk_sig_sampled$1598
        flag_clk_sig))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$1600$_Y
      (bool->bitvector (bveq n1566 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((eqzm_sync
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$1600$_Y)
        $auto$clk2fflogic.cc_102_sample_data$1597$_Q
        $auto$clk2fflogic.cc_102_sample_data$1595$_Q))) ; (bitvector 1)
  (let
    ((eqzm_gen
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1786$268$_Y)
        eqzm_sig
        eqzm_sync))) ; (bitvector 1)
  (let
    (($and$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1825$293$_Y
      (bvand eqzm_gen eqnor_sig))) ; (bitvector 1)
  (let
    (($procmux$346$_Y
      (if
        (bitvector->bool $procmux$1120$_Y)
        $and$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1825$293$_Y
        over_sync))) ; (bitvector 1)
  (let
    (($0_over_sync_0_0_
      (if (bitvector->bool $procmux$1090$_Y) (bv #b0 1) $procmux$346$_Y))) ; (bitvector 1)
  (let
    (($procmux$366$_Y
      (if (bitvector->bool $procmux$1120$_Y) eqzm_sig eqzm_sync))) ; (bitvector 1)
  (let
    (($0_eqzm_sync_0_0_
      (if (bitvector->bool $procmux$1090$_Y) (bv #b0 1) $procmux$366$_Y))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$1585$_Q
      (ALU54A_State-$auto$clk2fflogic.cc_102_sample_data$1585 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$1587$_Q
      (ALU54A_State-$auto$clk2fflogic.cc_102_sample_data$1587 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_flag_clk_sig_sampled$1588
      (ALU54A_State-$auto$clk2fflogic.cc_86_sample_control_edge$1589 state))) ; (bitvector 1)
  (let
    ((n1578
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_flag_clk_sig_sampled$1588
        flag_clk_sig))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$1590$_Y
      (bool->bitvector (bveq n1578 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((eqz_sync
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$1590$_Y)
        $auto$clk2fflogic.cc_102_sample_data$1587$_Q
        $auto$clk2fflogic.cc_102_sample_data$1585$_Q))) ; (bitvector 1)
  (let
    (($reduce_or$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1799$270_Y
      (apply bvor (bitvector->bits r_out)))) ; (bitvector 1)
  (let
    (($logic_not$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1799$271$_Y
      (bvnot
        $reduce_or$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1799$270_Y))) ; (bitvector 1)
  (let
    (($procmux$371$_Y
      (if
        (bitvector->bool $procmux$1120$_Y)
        $logic_not$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1799$271$_Y
        eqz_sync))) ; (bitvector 1)
  (let
    (($0_eqz_sync_0_0_
      (if (bitvector->bool $procmux$1090$_Y) (bv #b0 1) $procmux$371$_Y))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$1615$_Q
      (ALU54A_State-$auto$clk2fflogic.cc_102_sample_data$1615 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$1617$_Q
      (ALU54A_State-$auto$clk2fflogic.cc_102_sample_data$1617 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_flag_clk_sig_sampled$1618
      (ALU54A_State-$auto$clk2fflogic.cc_86_sample_control_edge$1619 state))) ; (bitvector 1)
  (let
    ((n1588
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_flag_clk_sig_sampled$1618
        flag_clk_sig))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$1620$_Y
      (bool->bitvector (bveq n1588 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((eqpatb_sync
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$1620$_Y)
        $auto$clk2fflogic.cc_102_sample_data$1617$_Q
        $auto$clk2fflogic.cc_102_sample_data$1615$_Q))) ; (bitvector 1)
  (let ((n1591 (concat c_sig_gen1 c_sig_gen0))) ; (bitvector 54)
  (let ((MCPAT (ALU54A_Inputs-MCPAT inputs))) ; (bitvector 56)
  (let ((n1593 (extract 53 0 MCPAT))) ; (bitvector 54)
  (let ((MCPAT_SOURCE (ALU54A_Inputs-MCPAT_SOURCE inputs))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1806$281$_Y
      (bool->bitvector (bveq MCPAT_SOURCE (bv #b10111 5))))) ; (bitvector 1)
  (let
    (($procmux$402$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1806$281$_Y)
        n1593
        n1591))) ; (bitvector 54)
  (let
    (($xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1821$284_Y
      (bvxor r_out $procmux$402$_Y))) ; (bitvector 54)
  (let ((MASKPAT (ALU54A_Inputs-MASKPAT inputs))) ; (bitvector 56)
  (let ((n1600 (extract 53 0 MASKPAT))) ; (bitvector 54)
  (let ((MASKPAT_SOURCE (ALU54A_Inputs-MASKPAT_SOURCE inputs))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1814$283$_Y
      (bool->bitvector (bveq MASKPAT_SOURCE (bv #b10111 5))))) ; (bitvector 1)
  (let
    ((maskpat_sel
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1814$283$_Y)
        n1600
        n1591))) ; (bitvector 54)
  (let
    (($or$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1821$285$_Y
      (bvor
        $xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1821$284_Y
        maskpat_sel))) ; (bitvector 54)
  (let
    ((eqpatb_sig
      (apply
        bvand
        (bitvector->bits
          $or$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1821$285$_Y)))) ; (bitvector 1)
  (let
    (($procmux$356$_Y
      (if (bitvector->bool $procmux$1120$_Y) eqpatb_sig eqpatb_sync))) ; (bitvector 1)
  (let
    (($0_eqpatb_sync_0_0_
      (if (bitvector->bool $procmux$1090$_Y) (bv #b0 1) $procmux$356$_Y))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$1625$_Q
      (ALU54A_State-$auto$clk2fflogic.cc_102_sample_data$1625 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$1627$_Q
      (ALU54A_State-$auto$clk2fflogic.cc_102_sample_data$1627 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_flag_clk_sig_sampled$1628
      (ALU54A_State-$auto$clk2fflogic.cc_86_sample_control_edge$1629 state))) ; (bitvector 1)
  (let
    ((n1611
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_flag_clk_sig_sampled$1628
        flag_clk_sig))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$1630$_Y
      (bool->bitvector (bveq n1611 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((eqpat_sync
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$1630$_Y)
        $auto$clk2fflogic.cc_102_sample_data$1627$_Q
        $auto$clk2fflogic.cc_102_sample_data$1625$_Q))) ; (bitvector 1)
  (let
    (($not$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1822$288$_Y
      (bvnot
        $xor$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1821$284_Y))) ; (bitvector 54)
  (let
    (($or$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1822$289$_Y
      (bvor
        $not$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1822$288$_Y
        maskpat_sel))) ; (bitvector 54)
  (let
    ((eqpat_sig
      (apply
        bvand
        (bitvector->bits
          $or$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1822$289$_Y)))) ; (bitvector 1)
  (let
    (($procmux$351$_Y
      (if (bitvector->bool $procmux$1120$_Y) eqpat_sig eqpat_sync))) ; (bitvector 1)
  (let
    (($0_eqpat_sync_0_0_
      (if (bitvector->bool $procmux$1090$_Y) (bv #b0 1) $procmux$351$_Y))) ; (bitvector 1)
  (let
    (($procmux$361$_Y
      (if (bitvector->bool $procmux$1120$_Y) eqom_sig eqom_sync))) ; (bitvector 1)
  (let
    (($0_eqom_sync_0_0_
      (if (bitvector->bool $procmux$1090$_Y) (bv #b0 1) $procmux$361$_Y))) ; (bitvector 1)
  (let
    ((UNDER
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1786$268$_Y)
        $and$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1826$294$_Y
        under_sync))) ; (bitvector 1)
  (let ((SIGNEDR (bvor SIGNEDIA SIGNEDIB))) ; (bitvector 1)
  (let ((n1623 (apply bvor (bitvector->bits REG_OUTPUT0_CLK)))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1762$260$_Y
      (bvnot n1623))) ; (bitvector 1)
  (let
    (($procmux$415$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1762$260$_Y)
        n1430
        r_out_lsb_sync))) ; (bitvector 18)
  (let ((R9 (extract 9 9 $procmux$415$_Y))) ; (bitvector 1)
  (let ((R8 (extract 8 8 $procmux$415$_Y))) ; (bitvector 1)
  (let ((R7 (extract 7 7 $procmux$415$_Y))) ; (bitvector 1)
  (let ((R6 (extract 6 6 $procmux$415$_Y))) ; (bitvector 1)
  (let
    (($procmux$405$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1786$268$_Y)
        n1399
        r_out_msb_sync))) ; (bitvector 36)
  (let ((R53 (extract 35 35 $procmux$405$_Y))) ; (bitvector 1)
  (let ((R52 (extract 34 34 $procmux$405$_Y))) ; (bitvector 1)
  (let ((R51 (extract 33 33 $procmux$405$_Y))) ; (bitvector 1)
  (let ((R50 (extract 32 32 $procmux$405$_Y))) ; (bitvector 1)
  (let ((R5 (extract 5 5 $procmux$415$_Y))) ; (bitvector 1)
  (let ((R49 (extract 31 31 $procmux$405$_Y))) ; (bitvector 1)
  (let ((R48 (extract 30 30 $procmux$405$_Y))) ; (bitvector 1)
  (let ((R47 (extract 29 29 $procmux$405$_Y))) ; (bitvector 1)
  (let ((R46 (extract 28 28 $procmux$405$_Y))) ; (bitvector 1)
  (let ((R45 (extract 27 27 $procmux$405$_Y))) ; (bitvector 1)
  (let ((R44 (extract 26 26 $procmux$405$_Y))) ; (bitvector 1)
  (let ((R43 (extract 25 25 $procmux$405$_Y))) ; (bitvector 1)
  (let ((R42 (extract 24 24 $procmux$405$_Y))) ; (bitvector 1)
  (let ((R41 (extract 23 23 $procmux$405$_Y))) ; (bitvector 1)
  (let ((R40 (extract 22 22 $procmux$405$_Y))) ; (bitvector 1)
  (let ((R4 (extract 4 4 $procmux$415$_Y))) ; (bitvector 1)
  (let ((R39 (extract 21 21 $procmux$405$_Y))) ; (bitvector 1)
  (let ((R38 (extract 20 20 $procmux$405$_Y))) ; (bitvector 1)
  (let ((R37 (extract 19 19 $procmux$405$_Y))) ; (bitvector 1)
  (let ((R36 (extract 18 18 $procmux$405$_Y))) ; (bitvector 1)
  (let ((R35 (extract 17 17 $procmux$405$_Y))) ; (bitvector 1)
  (let ((R34 (extract 16 16 $procmux$405$_Y))) ; (bitvector 1)
  (let ((R33 (extract 15 15 $procmux$405$_Y))) ; (bitvector 1)
  (let ((R32 (extract 14 14 $procmux$405$_Y))) ; (bitvector 1)
  (let ((R31 (extract 13 13 $procmux$405$_Y))) ; (bitvector 1)
  (let ((R30 (extract 12 12 $procmux$405$_Y))) ; (bitvector 1)
  (let ((R3 (extract 3 3 $procmux$415$_Y))) ; (bitvector 1)
  (let ((R29 (extract 11 11 $procmux$405$_Y))) ; (bitvector 1)
  (let ((R28 (extract 10 10 $procmux$405$_Y))) ; (bitvector 1)
  (let ((R27 (extract 9 9 $procmux$405$_Y))) ; (bitvector 1)
  (let ((R26 (extract 8 8 $procmux$405$_Y))) ; (bitvector 1)
  (let ((R25 (extract 7 7 $procmux$405$_Y))) ; (bitvector 1)
  (let ((R24 (extract 6 6 $procmux$405$_Y))) ; (bitvector 1)
  (let ((R23 (extract 5 5 $procmux$405$_Y))) ; (bitvector 1)
  (let ((R22 (extract 4 4 $procmux$405$_Y))) ; (bitvector 1)
  (let ((R21 (extract 3 3 $procmux$405$_Y))) ; (bitvector 1)
  (let ((R20 (extract 2 2 $procmux$405$_Y))) ; (bitvector 1)
  (let ((R2 (extract 2 2 $procmux$415$_Y))) ; (bitvector 1)
  (let ((R19 (extract 1 1 $procmux$405$_Y))) ; (bitvector 1)
  (let ((R18 (extract 0 0 $procmux$405$_Y))) ; (bitvector 1)
  (let ((R17 (extract 17 17 $procmux$415$_Y))) ; (bitvector 1)
  (let ((R16 (extract 16 16 $procmux$415$_Y))) ; (bitvector 1)
  (let ((R15 (extract 15 15 $procmux$415$_Y))) ; (bitvector 1)
  (let ((R14 (extract 14 14 $procmux$415$_Y))) ; (bitvector 1)
  (let ((R13 (extract 13 13 $procmux$415$_Y))) ; (bitvector 1)
  (let ((R12 (extract 12 12 $procmux$415$_Y))) ; (bitvector 1)
  (let ((R11 (extract 11 11 $procmux$415$_Y))) ; (bitvector 1)
  (let ((R10 (extract 10 10 $procmux$415$_Y))) ; (bitvector 1)
  (let ((R1 (extract 1 1 $procmux$415$_Y))) ; (bitvector 1)
  (let ((R0 (extract 0 0 $procmux$415$_Y))) ; (bitvector 1)
  (let
    ((OVERUNDER
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1786$268$_Y)
        overunder_sig
        overunder_sync))) ; (bitvector 1)
  (let
    ((OVER
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1786$268$_Y)
        $and$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1825$293$_Y
        over_sync))) ; (bitvector 1)
  (let
    ((EQZ
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1786$268$_Y)
        $logic_not$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1799$271$_Y
        eqz_sync))) ; (bitvector 1)
  (let
    ((EQPATB
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1786$268$_Y)
        eqpatb_sig
        eqpatb_sync))) ; (bitvector 1)
  (let
    ((EQPAT
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_ALU54A_modified_for_racket_import.v_1786$268$_Y)
        eqpat_sig
        eqpat_sync))) ; (bitvector 1)
  (cons
    (ALU54A_Outputs
      UNDER ; UNDER
      SIGNEDR ; SIGNEDR
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
    )
    (ALU54A_State
      opcodein_0_clk_sig ; $auto$clk2fflogic.cc:86:sample_control_edge$1739
      opcodein_1_clk_sig ; $auto$clk2fflogic.cc:86:sample_control_edge$1709
      opin_sig_0_sync ; $auto$clk2fflogic.cc:102:sample_data$1735
      $0_opin_sig_0_sync_6_0_ ; $auto$clk2fflogic.cc:102:sample_data$1737
      opcodeop1_0_clk_sig ; $auto$clk2fflogic.cc:86:sample_control_edge$1719
      opcodeop0_0_clk_sig ; $auto$clk2fflogic.cc:86:sample_control_edge$1729
      opin_sig_1_sync ; $auto$clk2fflogic.cc:102:sample_data$1705
      $0_opin_sig_1_sync_6_0_ ; $auto$clk2fflogic.cc:102:sample_data$1707
      input_c_clk_sig0 ; $auto$clk2fflogic.cc:86:sample_control_edge$1759
      input_c_clk_sig1 ; $auto$clk2fflogic.cc:86:sample_control_edge$1749
      opcodeop1_1_clk_sig ; $auto$clk2fflogic.cc:86:sample_control_edge$1689
      opcodeop0_1_clk_sig ; $auto$clk2fflogic.cc:86:sample_control_edge$1699
      op10_sig_0_sync ; $auto$clk2fflogic.cc:102:sample_data$1715
      $0_op10_sig_0_sync_2_0_ ; $auto$clk2fflogic.cc:102:sample_data$1717
      op7_sig_0_sync ; $auto$clk2fflogic.cc:102:sample_data$1725
      $0_op7_sig_0_sync_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$1727
      c_sig_sync0 ; $auto$clk2fflogic.cc:102:sample_data$1755
      $0_c_sig_sync0_26_0_ ; $auto$clk2fflogic.cc:102:sample_data$1757
      c_sig_sync1 ; $auto$clk2fflogic.cc:102:sample_data$1745
      $0_c_sig_sync1_26_0_ ; $auto$clk2fflogic.cc:102:sample_data$1747
      op10_sig_1_sync ; $auto$clk2fflogic.cc:102:sample_data$1685
      $0_op10_sig_1_sync_2_0_ ; $auto$clk2fflogic.cc:102:sample_data$1687
      op7_sig_1_sync ; $auto$clk2fflogic.cc:102:sample_data$1695
      $0_op7_sig_1_sync_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$1697
      output1_clk_sig ; $auto$clk2fflogic.cc:86:sample_control_edge$1669
      output0_clk_sig ; $auto$clk2fflogic.cc:86:sample_control_edge$1679
      flag_clk_sig ; $auto$clk2fflogic.cc:86:sample_control_edge$1649
      flag_clk_sig ; $auto$clk2fflogic.cc:86:sample_control_edge$1659
      flag_clk_sig ; $auto$clk2fflogic.cc:86:sample_control_edge$1639
      flag_clk_sig ; $auto$clk2fflogic.cc:86:sample_control_edge$1599
      flag_clk_sig ; $auto$clk2fflogic.cc:86:sample_control_edge$1589
      flag_clk_sig ; $auto$clk2fflogic.cc:86:sample_control_edge$1619
      flag_clk_sig ; $auto$clk2fflogic.cc:86:sample_control_edge$1629
      flag_clk_sig ; $auto$clk2fflogic.cc:86:sample_control_edge$1609
      r_out_msb_sync ; $auto$clk2fflogic.cc:102:sample_data$1665
      $0_r_out_msb_sync_35_0_ ; $auto$clk2fflogic.cc:102:sample_data$1667
      r_out_lsb_sync ; $auto$clk2fflogic.cc:102:sample_data$1675
      $0_r_out_lsb_sync_17_0_ ; $auto$clk2fflogic.cc:102:sample_data$1677
      under_sync ; $auto$clk2fflogic.cc:102:sample_data$1645
      $0_under_sync_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$1647
      overunder_sync ; $auto$clk2fflogic.cc:102:sample_data$1655
      $0_overunder_sync_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$1657
      over_sync ; $auto$clk2fflogic.cc:102:sample_data$1635
      $0_over_sync_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$1637
      eqzm_sync ; $auto$clk2fflogic.cc:102:sample_data$1595
      $0_eqzm_sync_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$1597
      eqz_sync ; $auto$clk2fflogic.cc:102:sample_data$1585
      $0_eqz_sync_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$1587
      eqpatb_sync ; $auto$clk2fflogic.cc:102:sample_data$1615
      $0_eqpatb_sync_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$1617
      eqpat_sync ; $auto$clk2fflogic.cc:102:sample_data$1625
      $0_eqpat_sync_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$1627
      eqom_sync ; $auto$clk2fflogic.cc:102:sample_data$1605
      $0_eqom_sync_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$1607
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
  ))))))))))))))))))))))
(define ALU54A_initial
  (ALU54A_State
    (bv #b1 1)
    (bv #b1 1)
    (bv #b0000000 7)
    (bv #b0000000 7)
    (bv #b1 1)
    (bv #b1 1)
    (bv #b0000000 7)
    (bv #b0000000 7)
    (bv #b1 1)
    (bv #b1 1)
    (bv #b1 1)
    (bv #b1 1)
    (bv #b000 3)
    (bv #b000 3)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b000000000000000000000000000 27)
    (bv #b000000000000000000000000000 27)
    (bv #b000000000000000000000000000 27)
    (bv #b000000000000000000000000000 27)
    (bv #b000 3)
    (bv #b000 3)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b1 1)
    (bv #b1 1)
    (bv #b1 1)
    (bv #b1 1)
    (bv #b1 1)
    (bv #b1 1)
    (bv #b1 1)
    (bv #b1 1)
    (bv #b1 1)
    (bv #b1 1)
    (bv #b000000000000000000000000000000000000 36)
    (bv #b000000000000000000000000000000000000 36)
    (bv #b000000000000000000 18)
    (bv #b000000000000000000 18)
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
    (bv #b0 1)))
