// RUN: racket $LAKEROAD_DIR/bin/main.rkt \
// RUN:  --verilog-module-filepath %s \
// RUN:  --architecture lattice-ecp5 \
// RUN:  --template dsp \
// RUN:  --out-format verilog \
// RUN:  --top-module-name top \
// RUN:  --verilog-module-out-signal p:16 \
// RUN:  --module-name out \
// RUN:  --input-signal a:16 \
// RUN:  --input-signal b:16 \
// RUN: | FileCheck %s

module top(input [15:0] a, b, output [15:0] p);

  assign p = a * b;

endmodule

// CHECK: module out(a, b, p);
// CHECK:   wire P0_72;
// CHECK:   wire P10_82;
// CHECK:   wire P11_83;
// CHECK:   wire P12_84;
// CHECK:   wire P13_85;
// CHECK:   wire P14_86;
// CHECK:   wire P15_87;
// CHECK:   wire P16_88;
// CHECK:   wire P17_89;
// CHECK:   wire P18_90;
// CHECK:   wire P19_91;
// CHECK:   wire P1_73;
// CHECK:   wire P20_92;
// CHECK:   wire P21_93;
// CHECK:   wire P22_94;
// CHECK:   wire P23_95;
// CHECK:   wire P24_96;
// CHECK:   wire P25_97;
// CHECK:   wire P26_98;
// CHECK:   wire P27_99;
// CHECK:   wire P28_100;
// CHECK:   wire P29_101;
// CHECK:   wire P2_74;
// CHECK:   wire P30_102;
// CHECK:   wire P31_103;
// CHECK:   wire P32_104;
// CHECK:   wire P33_105;
// CHECK:   wire P34_106;
// CHECK:   wire P35_107;
// CHECK:   wire P3_75;
// CHECK:   wire P4_76;
// CHECK:   wire P5_77;
// CHECK:   wire P6_78;
// CHECK:   wire P7_79;
// CHECK:   wire P8_80;
// CHECK:   wire P9_81;
// CHECK:   wire R0_109;
// CHECK:   wire R10_119;
// CHECK:   wire R11_120;
// CHECK:   wire R12_121;
// CHECK:   wire R13_122;
// CHECK:   wire R14_123;
// CHECK:   wire R15_124;
// CHECK:   wire R16_125;
// CHECK:   wire R17_126;
// CHECK:   wire R18_127;
// CHECK:   wire R19_128;
// CHECK:   wire R1_110;
// CHECK:   wire R20_129;
// CHECK:   wire R21_130;
// CHECK:   wire R22_131;
// CHECK:   wire R23_132;
// CHECK:   wire R24_133;
// CHECK:   wire R25_134;
// CHECK:   wire R26_135;
// CHECK:   wire R27_136;
// CHECK:   wire R28_137;
// CHECK:   wire R29_138;
// CHECK:   wire R2_111;
// CHECK:   wire R30_139;
// CHECK:   wire R31_140;
// CHECK:   wire R32_141;
// CHECK:   wire R33_142;
// CHECK:   wire R34_143;
// CHECK:   wire R35_144;
// CHECK:   wire R36_145;
// CHECK:   wire R37_146;
// CHECK:   wire R38_147;
// CHECK:   wire R39_148;
// CHECK:   wire R3_112;
// CHECK:   wire R40_149;
// CHECK:   wire R41_150;
// CHECK:   wire R42_151;
// CHECK:   wire R43_152;
// CHECK:   wire R44_153;
// CHECK:   wire R45_154;
// CHECK:   wire R46_155;
// CHECK:   wire R47_156;
// CHECK:   wire R48_157;
// CHECK:   wire R49_158;
// CHECK:   wire R4_113;
// CHECK:   wire R50_159;
// CHECK:   wire R51_160;
// CHECK:   wire R52_161;
// CHECK:   wire R53_162;
// CHECK:   wire R5_114;
// CHECK:   wire R6_115;
// CHECK:   wire R7_116;
// CHECK:   wire R8_117;
// CHECK:   wire R9_118;
// CHECK:   wire ROA0_36;
// CHECK:   wire ROA10_46;
// CHECK:   wire ROA11_47;
// CHECK:   wire ROA12_48;
// CHECK:   wire ROA13_49;
// CHECK:   wire ROA14_50;
// CHECK:   wire ROA15_51;
// CHECK:   wire ROA16_52;
// CHECK:   wire ROA17_53;
// CHECK:   wire ROA1_37;
// CHECK:   wire ROA2_38;
// CHECK:   wire ROA3_39;
// CHECK:   wire ROA4_40;
// CHECK:   wire ROA5_41;
// CHECK:   wire ROA6_42;
// CHECK:   wire ROA7_43;
// CHECK:   wire ROA8_44;
// CHECK:   wire ROA9_45;
// CHECK:   wire ROB0_54;
// CHECK:   wire ROB10_64;
// CHECK:   wire ROB11_65;
// CHECK:   wire ROB12_66;
// CHECK:   wire ROB13_67;
// CHECK:   wire ROB14_68;
// CHECK:   wire ROB15_69;
// CHECK:   wire ROB16_70;
// CHECK:   wire ROB17_71;
// CHECK:   wire ROB1_55;
// CHECK:   wire ROB2_56;
// CHECK:   wire ROB3_57;
// CHECK:   wire ROB4_58;
// CHECK:   wire ROB5_59;
// CHECK:   wire ROB6_60;
// CHECK:   wire ROB7_61;
// CHECK:   wire ROB8_62;
// CHECK:   wire ROB9_63;
// CHECK:   wire SIGNEDP_108;
// CHECK:   wire SROA0_0;
// CHECK:   wire SROA10_10;
// CHECK:   wire SROA11_11;
// CHECK:   wire SROA12_12;
// CHECK:   wire SROA13_13;
// CHECK:   wire SROA14_14;
// CHECK:   wire SROA15_15;
// CHECK:   wire SROA16_16;
// CHECK:   wire SROA17_17;
// CHECK:   wire SROA1_1;
// CHECK:   wire SROA2_2;
// CHECK:   wire SROA3_3;
// CHECK:   wire SROA4_4;
// CHECK:   wire SROA5_5;
// CHECK:   wire SROA6_6;
// CHECK:   wire SROA7_7;
// CHECK:   wire SROA8_8;
// CHECK:   wire SROA9_9;
// CHECK:   wire SROB0_18;
// CHECK:   wire SROB10_28;
// CHECK:   wire SROB11_29;
// CHECK:   wire SROB12_30;
// CHECK:   wire SROB13_31;
// CHECK:   wire SROB14_32;
// CHECK:   wire SROB15_33;
// CHECK:   wire SROB16_34;
// CHECK:   wire SROB17_35;
// CHECK:   wire SROB1_19;
// CHECK:   wire SROB2_20;
// CHECK:   wire SROB3_21;
// CHECK:   wire SROB4_22;
// CHECK:   wire SROB5_23;
// CHECK:   wire SROB6_24;
// CHECK:   wire SROB7_25;
// CHECK:   wire SROB8_26;
// CHECK:   wire SROB9_27;
// CHECK:   input [15:0] a;
// CHECK:   wire [15:0] a;
// CHECK:   input [15:0] b;
// CHECK:   wire [15:0] b;
// CHECK:   output [15:0] p;
// CHECK:   wire [15:0] p;
// CHECK:   ALU54A #(
// CHECK:     .LEGACY(5'h05),
// CHECK:     .MASK01(56'h00000000000000),
// CHECK:     .MASKPAT(56'h00000000000000),
// CHECK:     .MASKPAT_SOURCE(5'h17),
// CHECK:     .MCPAT(56'h00000000000000),
// CHECK:     .MCPAT_SOURCE(5'h17),
// CHECK:     .MULT9_MODE(5'h05),
// CHECK:     .REG_FLAG_CE(5'h01),
// CHECK:     .REG_FLAG_CLK(5'h0b),
// CHECK:     .REG_FLAG_RST(5'h02),
// CHECK:     .REG_INPUTC0_CE(5'h01),
// CHECK:     .REG_INPUTC0_CLK(5'h0b),
// CHECK:     .REG_INPUTC0_RST(5'h02),
// CHECK:     .REG_INPUTC1_CE(5'h01),
// CHECK:     .REG_INPUTC1_CLK(5'h0b),
// CHECK:     .REG_INPUTC1_RST(5'h02),
// CHECK:     .REG_OPCODEIN_0_CE(5'h01),
// CHECK:     .REG_OPCODEIN_0_CLK(5'h00),
// CHECK:     .REG_OPCODEIN_0_RST(5'h02),
// CHECK:     .REG_OPCODEIN_1_CE(5'h01),
// CHECK:     .REG_OPCODEIN_1_CLK(5'h00),
// CHECK:     .REG_OPCODEIN_1_RST(5'h02),
// CHECK:     .REG_OPCODEOP0_0_CE(5'h01),
// CHECK:     .REG_OPCODEOP0_0_CLK(5'h00),
// CHECK:     .REG_OPCODEOP0_0_RST(5'h02),
// CHECK:     .REG_OPCODEOP0_1_CE(5'h01),
// CHECK:     .REG_OPCODEOP0_1_CLK(5'h0b),
// CHECK:     .REG_OPCODEOP0_1_RST(5'h02),
// CHECK:     .REG_OPCODEOP1_0_CLK(5'h00),
// CHECK:     .REG_OPCODEOP1_1_CLK(5'h00),
// CHECK:     .REG_OUTPUT0_CE(5'h01),
// CHECK:     .REG_OUTPUT0_CLK(5'h00),
// CHECK:     .REG_OUTPUT0_RST(5'h02),
// CHECK:     .REG_OUTPUT1_CE(5'h01),
// CHECK:     .REG_OUTPUT1_CLK(5'h0b),
// CHECK:     .REG_OUTPUT1_RST(5'h02),
// CHECK:     .RNDPAT(56'h00000000000000)
// CHECK:   ) ALU54A_1 (
// CHECK:     .A0(1'h0),
// CHECK:     .A1(1'h0),
// CHECK:     .A10(1'h0),
// CHECK:     .A11(1'h0),
// CHECK:     .A12(1'h0),
// CHECK:     .A13(1'h0),
// CHECK:     .A14(1'h0),
// CHECK:     .A15(1'h0),
// CHECK:     .A16(1'h0),
// CHECK:     .A17(1'h0),
// CHECK:     .A18(1'h0),
// CHECK:     .A19(1'h0),
// CHECK:     .A2(1'h0),
// CHECK:     .A20(1'h0),
// CHECK:     .A21(1'h0),
// CHECK:     .A22(1'h0),
// CHECK:     .A23(1'h0),
// CHECK:     .A24(1'h0),
// CHECK:     .A25(1'h0),
// CHECK:     .A26(1'h0),
// CHECK:     .A27(1'h0),
// CHECK:     .A28(1'h0),
// CHECK:     .A29(1'h0),
// CHECK:     .A3(1'h0),
// CHECK:     .A30(1'h0),
// CHECK:     .A31(1'h0),
// CHECK:     .A32(1'h0),
// CHECK:     .A33(1'h0),
// CHECK:     .A34(1'h0),
// CHECK:     .A35(1'h0),
// CHECK:     .A4(1'h0),
// CHECK:     .A5(1'h0),
// CHECK:     .A6(1'h0),
// CHECK:     .A7(1'h0),
// CHECK:     .A8(1'h0),
// CHECK:     .A9(1'h0),
// CHECK:     .B0(1'h0),
// CHECK:     .B1(1'h0),
// CHECK:     .B10(1'h0),
// CHECK:     .B11(1'h0),
// CHECK:     .B12(1'h0),
// CHECK:     .B13(1'h0),
// CHECK:     .B14(1'h0),
// CHECK:     .B15(1'h0),
// CHECK:     .B16(1'h0),
// CHECK:     .B17(1'h0),
// CHECK:     .B18(1'h0),
// CHECK:     .B19(1'h0),
// CHECK:     .B2(1'h0),
// CHECK:     .B20(1'h0),
// CHECK:     .B21(1'h0),
// CHECK:     .B22(1'h0),
// CHECK:     .B23(1'h0),
// CHECK:     .B24(1'h0),
// CHECK:     .B25(1'h0),
// CHECK:     .B26(1'h0),
// CHECK:     .B27(1'h0),
// CHECK:     .B28(1'h0),
// CHECK:     .B29(1'h0),
// CHECK:     .B3(1'h0),
// CHECK:     .B30(1'h0),
// CHECK:     .B31(1'h0),
// CHECK:     .B32(1'h0),
// CHECK:     .B33(1'h0),
// CHECK:     .B34(1'h0),
// CHECK:     .B35(1'h0),
// CHECK:     .B4(1'h0),
// CHECK:     .B5(1'h0),
// CHECK:     .B6(1'h0),
// CHECK:     .B7(1'h0),
// CHECK:     .B8(1'h0),
// CHECK:     .B9(1'h0),
// CHECK:     .C0(1'h0),
// CHECK:     .C1(1'h0),
// CHECK:     .C10(1'h0),
// CHECK:     .C11(1'h0),
// CHECK:     .C12(1'h0),
// CHECK:     .C13(1'h0),
// CHECK:     .C14(1'h0),
// CHECK:     .C15(1'h0),
// CHECK:     .C16(1'h0),
// CHECK:     .C17(1'h0),
// CHECK:     .C18(1'h0),
// CHECK:     .C19(1'h0),
// CHECK:     .C2(1'h0),
// CHECK:     .C20(1'h0),
// CHECK:     .C21(1'h0),
// CHECK:     .C22(1'h0),
// CHECK:     .C23(1'h0),
// CHECK:     .C24(1'h0),
// CHECK:     .C25(1'h0),
// CHECK:     .C26(1'h0),
// CHECK:     .C27(1'h0),
// CHECK:     .C28(1'h0),
// CHECK:     .C29(1'h0),
// CHECK:     .C3(1'h0),
// CHECK:     .C30(1'h0),
// CHECK:     .C31(1'h0),
// CHECK:     .C32(1'h0),
// CHECK:     .C33(1'h0),
// CHECK:     .C34(1'h0),
// CHECK:     .C35(1'h0),
// CHECK:     .C36(1'h0),
// CHECK:     .C37(1'h0),
// CHECK:     .C38(1'h0),
// CHECK:     .C39(1'h0),
// CHECK:     .C4(1'h0),
// CHECK:     .C40(1'h0),
// CHECK:     .C41(1'h0),
// CHECK:     .C42(1'h0),
// CHECK:     .C43(1'h0),
// CHECK:     .C44(1'h0),
// CHECK:     .C45(1'h0),
// CHECK:     .C46(1'h0),
// CHECK:     .C47(1'h0),
// CHECK:     .C48(1'h0),
// CHECK:     .C49(1'h0),
// CHECK:     .C5(1'h0),
// CHECK:     .C50(1'h0),
// CHECK:     .C51(1'h0),
// CHECK:     .C52(1'h0),
// CHECK:     .C53(1'h0),
// CHECK:     .C6(1'h0),
// CHECK:     .C7(1'h0),
// CHECK:     .C8(1'h0),
// CHECK:     .C9(1'h0),
// CHECK:     .CE0(1'h1),
// CHECK:     .CE1(1'h1),
// CHECK:     .CE2(1'h1),
// CHECK:     .CE3(1'h1),
// CHECK:     .CIN0(1'h0),
// CHECK:     .CIN1(1'h0),
// CHECK:     .CIN10(1'h0),
// CHECK:     .CIN11(1'h0),
// CHECK:     .CIN12(1'h0),
// CHECK:     .CIN13(1'h0),
// CHECK:     .CIN14(1'h0),
// CHECK:     .CIN15(1'h0),
// CHECK:     .CIN16(1'h0),
// CHECK:     .CIN17(1'h0),
// CHECK:     .CIN18(1'h0),
// CHECK:     .CIN19(1'h0),
// CHECK:     .CIN2(1'h0),
// CHECK:     .CIN20(1'h0),
// CHECK:     .CIN21(1'h0),
// CHECK:     .CIN22(1'h0),
// CHECK:     .CIN23(1'h0),
// CHECK:     .CIN24(1'h0),
// CHECK:     .CIN25(1'h0),
// CHECK:     .CIN26(1'h0),
// CHECK:     .CIN27(1'h0),
// CHECK:     .CIN28(1'h0),
// CHECK:     .CIN29(1'h0),
// CHECK:     .CIN3(1'h0),
// CHECK:     .CIN30(1'h0),
// CHECK:     .CIN31(1'h0),
// CHECK:     .CIN32(1'h0),
// CHECK:     .CIN33(1'h0),
// CHECK:     .CIN34(1'h0),
// CHECK:     .CIN35(1'h0),
// CHECK:     .CIN36(1'h0),
// CHECK:     .CIN37(1'h0),
// CHECK:     .CIN38(1'h0),
// CHECK:     .CIN39(1'h0),
// CHECK:     .CIN4(1'h0),
// CHECK:     .CIN40(1'h0),
// CHECK:     .CIN41(1'h0),
// CHECK:     .CIN42(1'h0),
// CHECK:     .CIN43(1'h0),
// CHECK:     .CIN44(1'h0),
// CHECK:     .CIN45(1'h0),
// CHECK:     .CIN46(1'h0),
// CHECK:     .CIN47(1'h0),
// CHECK:     .CIN48(1'h0),
// CHECK:     .CIN49(1'h0),
// CHECK:     .CIN5(1'h0),
// CHECK:     .CIN50(1'h0),
// CHECK:     .CIN51(1'h0),
// CHECK:     .CIN52(1'h0),
// CHECK:     .CIN53(1'h0),
// CHECK:     .CIN6(1'h0),
// CHECK:     .CIN7(1'h0),
// CHECK:     .CIN8(1'h0),
// CHECK:     .CIN9(1'h0),
// CHECK:     .CLK0(1'h0),
// CHECK:     .CLK1(1'h0),
// CHECK:     .CLK2(1'h0),
// CHECK:     .CLK3(1'h0),
// CHECK:     .MA0(P0_72),
// CHECK:     .MA1(P1_73),
// CHECK:     .MA10(P10_82),
// CHECK:     .MA11(P11_83),
// CHECK:     .MA12(P12_84),
// CHECK:     .MA13(P13_85),
// CHECK:     .MA14(P14_86),
// CHECK:     .MA15(P15_87),
// CHECK:     .MA16(P16_88),
// CHECK:     .MA17(P17_89),
// CHECK:     .MA18(P18_90),
// CHECK:     .MA19(P19_91),
// CHECK:     .MA2(P2_74),
// CHECK:     .MA20(P20_92),
// CHECK:     .MA21(P21_93),
// CHECK:     .MA22(P22_94),
// CHECK:     .MA23(P23_95),
// CHECK:     .MA24(P24_96),
// CHECK:     .MA25(P25_97),
// CHECK:     .MA26(P26_98),
// CHECK:     .MA27(P27_99),
// CHECK:     .MA28(P28_100),
// CHECK:     .MA29(P29_101),
// CHECK:     .MA3(P3_75),
// CHECK:     .MA30(P30_102),
// CHECK:     .MA31(P31_103),
// CHECK:     .MA32(P32_104),
// CHECK:     .MA33(P33_105),
// CHECK:     .MA34(P34_106),
// CHECK:     .MA35(P35_107),
// CHECK:     .MA4(P4_76),
// CHECK:     .MA5(P5_77),
// CHECK:     .MA6(P6_78),
// CHECK:     .MA7(P7_79),
// CHECK:     .MA8(P8_80),
// CHECK:     .MA9(P9_81),
// CHECK:     .MB0(1'h0),
// CHECK:     .MB1(1'h0),
// CHECK:     .MB10(1'h0),
// CHECK:     .MB11(1'h0),
// CHECK:     .MB12(1'h0),
// CHECK:     .MB13(1'h0),
// CHECK:     .MB14(1'h0),
// CHECK:     .MB15(1'h0),
// CHECK:     .MB16(1'h0),
// CHECK:     .MB17(1'h0),
// CHECK:     .MB18(1'h0),
// CHECK:     .MB19(1'h0),
// CHECK:     .MB2(1'h0),
// CHECK:     .MB20(1'h0),
// CHECK:     .MB21(1'h0),
// CHECK:     .MB22(1'h0),
// CHECK:     .MB23(1'h0),
// CHECK:     .MB24(1'h0),
// CHECK:     .MB25(1'h0),
// CHECK:     .MB26(1'h0),
// CHECK:     .MB27(1'h0),
// CHECK:     .MB28(1'h0),
// CHECK:     .MB29(1'h0),
// CHECK:     .MB3(1'h0),
// CHECK:     .MB30(1'h0),
// CHECK:     .MB31(1'h0),
// CHECK:     .MB32(1'h0),
// CHECK:     .MB33(1'h0),
// CHECK:     .MB34(1'h0),
// CHECK:     .MB35(1'h0),
// CHECK:     .MB4(1'h0),
// CHECK:     .MB5(1'h0),
// CHECK:     .MB6(1'h0),
// CHECK:     .MB7(1'h0),
// CHECK:     .MB8(1'h0),
// CHECK:     .MB9(1'h0),
// CHECK:     .OP0(1'h1),
// CHECK:     .OP1(1'h0),
// CHECK:     .OP10(1'h0),
// CHECK:     .OP2(1'h0),
// CHECK:     .OP3(1'h0),
// CHECK:     .OP4(1'h0),
// CHECK:     .OP5(1'h1),
// CHECK:     .OP6(1'h0),
// CHECK:     .OP7(1'h1),
// CHECK:     .OP8(1'h1),
// CHECK:     .OP9(1'h1),
// CHECK:     .R0(p[0]),
// CHECK:     .R1(p[1]),
// CHECK:     .R10(p[10]),
// CHECK:     .R11(p[11]),
// CHECK:     .R12(p[12]),
// CHECK:     .R13(p[13]),
// CHECK:     .R14(p[14]),
// CHECK:     .R15(p[15]),
// CHECK:     .R16(R16_125),
// CHECK:     .R17(R17_126),
// CHECK:     .R18(R18_127),
// CHECK:     .R19(R19_128),
// CHECK:     .R2(p[2]),
// CHECK:     .R20(R20_129),
// CHECK:     .R21(R21_130),
// CHECK:     .R22(R22_131),
// CHECK:     .R23(R23_132),
// CHECK:     .R24(R24_133),
// CHECK:     .R25(R25_134),
// CHECK:     .R26(R26_135),
// CHECK:     .R27(R27_136),
// CHECK:     .R28(R28_137),
// CHECK:     .R29(R29_138),
// CHECK:     .R3(p[3]),
// CHECK:     .R30(R30_139),
// CHECK:     .R31(R31_140),
// CHECK:     .R32(R32_141),
// CHECK:     .R33(R33_142),
// CHECK:     .R34(R34_143),
// CHECK:     .R35(R35_144),
// CHECK:     .R36(R36_145),
// CHECK:     .R37(R37_146),
// CHECK:     .R38(R38_147),
// CHECK:     .R39(R39_148),
// CHECK:     .R4(p[4]),
// CHECK:     .R40(R40_149),
// CHECK:     .R41(R41_150),
// CHECK:     .R42(R42_151),
// CHECK:     .R43(R43_152),
// CHECK:     .R44(R44_153),
// CHECK:     .R45(R45_154),
// CHECK:     .R46(R46_155),
// CHECK:     .R47(R47_156),
// CHECK:     .R48(R48_157),
// CHECK:     .R49(R49_158),
// CHECK:     .R5(p[5]),
// CHECK:     .R50(R50_159),
// CHECK:     .R51(R51_160),
// CHECK:     .R52(R52_161),
// CHECK:     .R53(R53_162),
// CHECK:     .R6(p[6]),
// CHECK:     .R7(p[7]),
// CHECK:     .R8(p[8]),
// CHECK:     .R9(p[9]),
// CHECK:     .RST0(1'h0),
// CHECK:     .RST1(1'h0),
// CHECK:     .RST2(1'h0),
// CHECK:     .RST3(1'h0),
// CHECK:     .SIGNEDCIN(1'h0),
// CHECK:     .SIGNEDIA(1'h0),
// CHECK:     .SIGNEDIB(1'h0)
// CHECK:   );
// CHECK:   MULT18X18C #(
// CHECK:     .CAS_MATCH_REG("FALSE"),
// CHECK:     .MULT_BYPASS("DISABLED"),
// CHECK:     .REG_INPUTA_CE("CE0"),
// CHECK:     .REG_INPUTA_CLK("NONE"),
// CHECK:     .REG_INPUTA_RST("RST0"),
// CHECK:     .REG_INPUTB_CE("CE0"),
// CHECK:     .REG_INPUTB_CLK("NONE"),
// CHECK:     .REG_INPUTB_RST("RST0"),
// CHECK:     .REG_OUTPUT_CE("CE0"),
// CHECK:     .REG_OUTPUT_CLK("NONE"),
// CHECK:     .REG_OUTPUT_RST("RST0"),
// CHECK:     .REG_PIPELINE_CE("CE0"),
// CHECK:     .REG_PIPELINE_CLK("NONE"),
// CHECK:     .REG_PIPELINE_RST("RST0")
// CHECK:   ) MULT18X18C_0 (
// CHECK:     .A0(a[0]),
// CHECK:     .A1(a[1]),
// CHECK:     .A10(a[10]),
// CHECK:     .A11(a[11]),
// CHECK:     .A12(a[12]),
// CHECK:     .A13(a[13]),
// CHECK:     .A14(a[14]),
// CHECK:     .A15(a[15]),
// CHECK:     .A16(a[15]),
// CHECK:     .A17(a[15]),
// CHECK:     .A2(a[2]),
// CHECK:     .A3(a[3]),
// CHECK:     .A4(a[4]),
// CHECK:     .A5(a[5]),
// CHECK:     .A6(a[6]),
// CHECK:     .A7(a[7]),
// CHECK:     .A8(a[8]),
// CHECK:     .A9(a[9]),
// CHECK:     .B0(b[0]),
// CHECK:     .B1(b[1]),
// CHECK:     .B10(b[10]),
// CHECK:     .B11(b[11]),
// CHECK:     .B12(b[12]),
// CHECK:     .B13(b[13]),
// CHECK:     .B14(b[14]),
// CHECK:     .B15(b[15]),
// CHECK:     .B16(b[15]),
// CHECK:     .B17(b[15]),
// CHECK:     .B2(b[2]),
// CHECK:     .B3(b[3]),
// CHECK:     .B4(b[4]),
// CHECK:     .B5(b[5]),
// CHECK:     .B6(b[6]),
// CHECK:     .B7(b[7]),
// CHECK:     .B8(b[8]),
// CHECK:     .B9(b[9]),
// CHECK:     .CE0(1'h1),
// CHECK:     .CE1(1'h1),
// CHECK:     .CE2(1'h1),
// CHECK:     .CE3(1'h1),
// CHECK:     .CLK0(1'h0),
// CHECK:     .CLK1(1'h0),
// CHECK:     .CLK2(1'h0),
// CHECK:     .CLK3(1'h0),
// CHECK:     .P0(P0_72),
// CHECK:     .P1(P1_73),
// CHECK:     .P10(P10_82),
// CHECK:     .P11(P11_83),
// CHECK:     .P12(P12_84),
// CHECK:     .P13(P13_85),
// CHECK:     .P14(P14_86),
// CHECK:     .P15(P15_87),
// CHECK:     .P16(P16_88),
// CHECK:     .P17(P17_89),
// CHECK:     .P18(P18_90),
// CHECK:     .P19(P19_91),
// CHECK:     .P2(P2_74),
// CHECK:     .P20(P20_92),
// CHECK:     .P21(P21_93),
// CHECK:     .P22(P22_94),
// CHECK:     .P23(P23_95),
// CHECK:     .P24(P24_96),
// CHECK:     .P25(P25_97),
// CHECK:     .P26(P26_98),
// CHECK:     .P27(P27_99),
// CHECK:     .P28(P28_100),
// CHECK:     .P29(P29_101),
// CHECK:     .P3(P3_75),
// CHECK:     .P30(P30_102),
// CHECK:     .P31(P31_103),
// CHECK:     .P32(P32_104),
// CHECK:     .P33(P33_105),
// CHECK:     .P34(P34_106),
// CHECK:     .P35(P35_107),
// CHECK:     .P4(P4_76),
// CHECK:     .P5(P5_77),
// CHECK:     .P6(P6_78),
// CHECK:     .P7(P7_79),
// CHECK:     .P8(P8_80),
// CHECK:     .P9(P9_81),
// CHECK:     .ROA0(ROA0_36),
// CHECK:     .ROA1(ROA1_37),
// CHECK:     .ROA10(ROA10_46),
// CHECK:     .ROA11(ROA11_47),
// CHECK:     .ROA12(ROA12_48),
// CHECK:     .ROA13(ROA13_49),
// CHECK:     .ROA14(ROA14_50),
// CHECK:     .ROA15(ROA15_51),
// CHECK:     .ROA16(ROA16_52),
// CHECK:     .ROA17(ROA17_53),
// CHECK:     .ROA2(ROA2_38),
// CHECK:     .ROA3(ROA3_39),
// CHECK:     .ROA4(ROA4_40),
// CHECK:     .ROA5(ROA5_41),
// CHECK:     .ROA6(ROA6_42),
// CHECK:     .ROA7(ROA7_43),
// CHECK:     .ROA8(ROA8_44),
// CHECK:     .ROA9(ROA9_45),
// CHECK:     .ROB0(ROB0_54),
// CHECK:     .ROB1(ROB1_55),
// CHECK:     .ROB10(ROB10_64),
// CHECK:     .ROB11(ROB11_65),
// CHECK:     .ROB12(ROB12_66),
// CHECK:     .ROB13(ROB13_67),
// CHECK:     .ROB14(ROB14_68),
// CHECK:     .ROB15(ROB15_69),
// CHECK:     .ROB16(ROB16_70),
// CHECK:     .ROB17(ROB17_71),
// CHECK:     .ROB2(ROB2_56),
// CHECK:     .ROB3(ROB3_57),
// CHECK:     .ROB4(ROB4_58),
// CHECK:     .ROB5(ROB5_59),
// CHECK:     .ROB6(ROB6_60),
// CHECK:     .ROB7(ROB7_61),
// CHECK:     .ROB8(ROB8_62),
// CHECK:     .ROB9(ROB9_63),
// CHECK:     .RST0(1'h0),
// CHECK:     .RST1(1'h0),
// CHECK:     .RST2(1'h0),
// CHECK:     .RST3(1'h0),
// CHECK:     .SIGNEDA(1'h1),
// CHECK:     .SIGNEDB(1'h1),
// CHECK:     .SIGNEDP(SIGNEDP_108),
// CHECK:     .SOURCEA(1'h0),
// CHECK:     .SOURCEB(1'h0),
// CHECK:     .SRIA0(1'h0),
// CHECK:     .SRIA1(1'h0),
// CHECK:     .SRIA10(1'h0),
// CHECK:     .SRIA11(1'h0),
// CHECK:     .SRIA12(1'h0),
// CHECK:     .SRIA13(1'h0),
// CHECK:     .SRIA14(1'h0),
// CHECK:     .SRIA15(1'h0),
// CHECK:     .SRIA16(1'h0),
// CHECK:     .SRIA17(1'h0),
// CHECK:     .SRIA2(1'h0),
// CHECK:     .SRIA3(1'h0),
// CHECK:     .SRIA4(1'h0),
// CHECK:     .SRIA5(1'h0),
// CHECK:     .SRIA6(1'h0),
// CHECK:     .SRIA7(1'h0),
// CHECK:     .SRIA8(1'h0),
// CHECK:     .SRIA9(1'h0),
// CHECK:     .SRIB0(1'h0),
// CHECK:     .SRIB1(1'h0),
// CHECK:     .SRIB10(1'h0),
// CHECK:     .SRIB11(1'h0),
// CHECK:     .SRIB12(1'h0),
// CHECK:     .SRIB13(1'h0),
// CHECK:     .SRIB14(1'h0),
// CHECK:     .SRIB15(1'h0),
// CHECK:     .SRIB16(1'h0),
// CHECK:     .SRIB17(1'h0),
// CHECK:     .SRIB2(1'h0),
// CHECK:     .SRIB3(1'h0),
// CHECK:     .SRIB4(1'h0),
// CHECK:     .SRIB5(1'h0),
// CHECK:     .SRIB6(1'h0),
// CHECK:     .SRIB7(1'h0),
// CHECK:     .SRIB8(1'h0),
// CHECK:     .SRIB9(1'h0),
// CHECK:     .SROA0(SROA0_0),
// CHECK:     .SROA1(SROA1_1),
// CHECK:     .SROA10(SROA10_10),
// CHECK:     .SROA11(SROA11_11),
// CHECK:     .SROA12(SROA12_12),
// CHECK:     .SROA13(SROA13_13),
// CHECK:     .SROA14(SROA14_14),
// CHECK:     .SROA15(SROA15_15),
// CHECK:     .SROA16(SROA16_16),
// CHECK:     .SROA17(SROA17_17),
// CHECK:     .SROA2(SROA2_2),
// CHECK:     .SROA3(SROA3_3),
// CHECK:     .SROA4(SROA4_4),
// CHECK:     .SROA5(SROA5_5),
// CHECK:     .SROA6(SROA6_6),
// CHECK:     .SROA7(SROA7_7),
// CHECK:     .SROA8(SROA8_8),
// CHECK:     .SROA9(SROA9_9),
// CHECK:     .SROB0(SROB0_18),
// CHECK:     .SROB1(SROB1_19),
// CHECK:     .SROB10(SROB10_28),
// CHECK:     .SROB11(SROB11_29),
// CHECK:     .SROB12(SROB12_30),
// CHECK:     .SROB13(SROB13_31),
// CHECK:     .SROB14(SROB14_32),
// CHECK:     .SROB15(SROB15_33),
// CHECK:     .SROB16(SROB16_34),
// CHECK:     .SROB17(SROB17_35),
// CHECK:     .SROB2(SROB2_20),
// CHECK:     .SROB3(SROB3_21),
// CHECK:     .SROB4(SROB4_22),
// CHECK:     .SROB5(SROB5_23),
// CHECK:     .SROB6(SROB6_24),
// CHECK:     .SROB7(SROB7_25),
// CHECK:     .SROB8(SROB8_26),
// CHECK:     .SROB9(SROB9_27)
// CHECK:   );
// CHECK:   assign R0_109 = p[0];
// CHECK:   assign R10_119 = p[10];
// CHECK:   assign R11_120 = p[11];
// CHECK:   assign R12_121 = p[12];
// CHECK:   assign R13_122 = p[13];
// CHECK:   assign R14_123 = p[14];
// CHECK:   assign R15_124 = p[15];
// CHECK:   assign R1_110 = p[1];
// CHECK:   assign R2_111 = p[2];
// CHECK:   assign R3_112 = p[3];
// CHECK:   assign R4_113 = p[4];
// CHECK:   assign R5_114 = p[5];
// CHECK:   assign R6_115 = p[6];
// CHECK:   assign R7_116 = p[7];
// CHECK:   assign R8_117 = p[8];
// CHECK:   assign R9_118 = p[9];
// CHECK: endmodule
