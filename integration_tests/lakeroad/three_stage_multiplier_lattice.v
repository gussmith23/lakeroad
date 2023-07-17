// RUN: racket $LAKEROAD_DIR/bin/main.rkt \
// RUN:  --verilog-module-filepath %s \
// RUN:  --architecture lattice-ecp5 \
// RUN:  --template dsp \
// RUN:  --out-format verilog \
// RUN:  --top-module-name three_stage_multiplier \
// RUN:  --verilog-module-out-signal p:16 \
// RUN:  --initiation-interval 3 \
// RUN:  --clock-name clk \
// RUN:  --module-name out \
// RUN:  --input-signal a:16 \
// RUN:  --input-signal b:16 \
// RUN: | FileCheck %s

module three_stage_multiplier(input clk, input [15:0] a, b, output [15:0] p);

  reg [15:0] tmp0, tmp1, out;

  always @ (posedge clk) begin
    tmp0 <= a * b;
    tmp1 <= tmp0;
    out <= tmp1;
  end

  assign p = out;

endmodule

// CHECK: module out(a, b, clk, p);
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
// CHECK:   input clk;
// CHECK:   wire clk;
// CHECK:   output [15:0] p;
// CHECK:   wire [15:0] p;
// CHECK:   MULT18X18C #(
// CHECK:     .CAS_MATCH_REG("FALSE"),
// CHECK:     .MULT_BYPASS("DISABLED"),
// CHECK:     .REG_INPUTA_CE("CE0"),
// CHECK:     .REG_INPUTA_CLK("CLK0"),
// CHECK:     .REG_INPUTA_RST("RST0"),
// CHECK:     .REG_INPUTB_CE("CE0"),
// CHECK:     .REG_INPUTB_CLK("CLK0"),
// CHECK:     .REG_INPUTB_RST("RST0"),
// CHECK:     .REG_OUTPUT_CE("CE0"),
// CHECK:     .REG_OUTPUT_CLK("CLK0"),
// CHECK:     .REG_OUTPUT_RST("RST0"),
// CHECK:     .REG_PIPELINE_CE("CE0"),
// CHECK:     .REG_PIPELINE_CLK("CLK0"),
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
// CHECK:     .A16(1'h0),
// CHECK:     .A17(1'h0),
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
// CHECK:     .B16(1'h0),
// CHECK:     .B17(1'h0),
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
// CHECK:     .CLK0(clk),
// CHECK:     .CLK1(clk),
// CHECK:     .CLK2(clk),
// CHECK:     .CLK3(clk),
// CHECK:     .P0(p[0]),
// CHECK:     .P1(p[1]),
// CHECK:     .P10(p[10]),
// CHECK:     .P11(p[11]),
// CHECK:     .P12(p[12]),
// CHECK:     .P13(p[13]),
// CHECK:     .P14(p[14]),
// CHECK:     .P15(p[15]),
// CHECK:     .P16(P16_88),
// CHECK:     .P17(P17_89),
// CHECK:     .P18(P18_90),
// CHECK:     .P19(P19_91),
// CHECK:     .P2(p[2]),
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
// CHECK:     .P3(p[3]),
// CHECK:     .P30(P30_102),
// CHECK:     .P31(P31_103),
// CHECK:     .P32(P32_104),
// CHECK:     .P33(P33_105),
// CHECK:     .P34(P34_106),
// CHECK:     .P35(P35_107),
// CHECK:     .P4(p[4]),
// CHECK:     .P5(p[5]),
// CHECK:     .P6(p[6]),
// CHECK:     .P7(p[7]),
// CHECK:     .P8(p[8]),
// CHECK:     .P9(p[9]),
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
// CHECK:   assign P0_72 = p[0];
// CHECK:   assign P10_82 = p[10];
// CHECK:   assign P11_83 = p[11];
// CHECK:   assign P12_84 = p[12];
// CHECK:   assign P13_85 = p[13];
// CHECK:   assign P14_86 = p[14];
// CHECK:   assign P15_87 = p[15];
// CHECK:   assign P1_73 = p[1];
// CHECK:   assign P2_74 = p[2];
// CHECK:   assign P3_75 = p[3];
// CHECK:   assign P4_76 = p[4];
// CHECK:   assign P5_77 = p[5];
// CHECK:   assign P6_78 = p[6];
// CHECK:   assign P7_79 = p[7];
// CHECK:   assign P8_80 = p[8];
// CHECK:   assign P9_81 = p[9];
// CHECK: endmodule
