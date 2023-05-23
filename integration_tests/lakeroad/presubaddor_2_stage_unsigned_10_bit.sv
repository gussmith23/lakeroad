// RUN: racket $LAKEROAD_DIR/bin/main.rkt \
// RUN:  --verilog-module-filepath %s \
// RUN:  --architecture xilinx-ultrascale-plus \
// RUN:  --template dsp \
// RUN:  --out-format verilog \
// RUN:  --top-module-name presubaddor_2_stage_unsigned_10_bit \
// RUN:  --verilog-module-out-signal out:10 \
// RUN:  --initiation-interval 2 \
// RUN:  --clock-name clk \
// RUN:  --module-name out \
// RUN:  --input-signal a:10 \
// RUN:  --input-signal b:10 \
// RUN:  --input-signal c:10 \
// RUN:  --input-signal d:10 \
// RUN: | FileCheck %s

module presubaddor_2_stage_unsigned_10_bit(
	input  [9:0] a,
	input  [9:0] b,
	input  [9:0] c,
	input  [9:0] d,
	output [9:0] out,
	input clk);

	logic  [19:0] stage0;
	logic  [19:0] stage1;

	always @(posedge clk) begin
	stage0 <= ((d - a) * b) + c;
	stage1 <= stage0;
	end

	assign out = stage1;
endmodule


// CHECK: module out(a, b, clk, p);
// CHECK:   wire P0_90;
// CHECK:   wire P10_100;
// CHECK:   wire P11_101;
// CHECK:   wire P12_102;
// CHECK:   wire P13_103;
// CHECK:   wire P14_104;
// CHECK:   wire P15_105;
// CHECK:   wire P16_106;
// CHECK:   wire P17_107;
// CHECK:   wire P18_108;
// CHECK:   wire P19_109;
// CHECK:   wire P1_91;
// CHECK:   wire P20_110;
// CHECK:   wire P21_111;
// CHECK:   wire P22_112;
// CHECK:   wire P23_113;
// CHECK:   wire P24_114;
// CHECK:   wire P25_115;
// CHECK:   wire P26_116;
// CHECK:   wire P27_117;
// CHECK:   wire P28_118;
// CHECK:   wire P29_119;
// CHECK:   wire P2_92;
// CHECK:   wire P30_120;
// CHECK:   wire P31_121;
// CHECK:   wire P32_122;
// CHECK:   wire P33_123;
// CHECK:   wire P34_124;
// CHECK:   wire P35_125;
// CHECK:   wire P3_93;
// CHECK:   wire P4_94;
// CHECK:   wire P5_95;
// CHECK:   wire P6_96;
// CHECK:   wire P7_97;
// CHECK:   wire P8_98;
// CHECK:   wire P9_99;
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
// CHECK:   wire ROC0_72;
// CHECK:   wire ROC10_82;
// CHECK:   wire ROC11_83;
// CHECK:   wire ROC12_84;
// CHECK:   wire ROC13_85;
// CHECK:   wire ROC14_86;
// CHECK:   wire ROC15_87;
// CHECK:   wire ROC16_88;
// CHECK:   wire ROC17_89;
// CHECK:   wire ROC1_73;
// CHECK:   wire ROC2_74;
// CHECK:   wire ROC3_75;
// CHECK:   wire ROC4_76;
// CHECK:   wire ROC5_77;
// CHECK:   wire ROC6_78;
// CHECK:   wire ROC7_79;
// CHECK:   wire ROC8_80;
// CHECK:   wire ROC9_81;
// CHECK:   wire SIGNEDP_126;
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
// CHECK:   MULT18X18D #(
// CHECK:     .CAS_MATCH_REG("FALSE"),
// CHECK:     .CLK0_DIV("DISABLED"),
// CHECK:     .CLK1_DIV("DISABLED"),
// CHECK:     .CLK2_DIV("DISABLED"),
// CHECK:     .CLK3_DIV("DISABLED"),
// CHECK:     .GSR("DISABLED"),
// CHECK:     .HIGHSPEED_CLK("NONE"),
// CHECK:     .MULT_BYPASS("DISABLED"),
// CHECK:     .REG_INPUTA_CE("CE3"),
// CHECK:     .REG_INPUTA_CLK("CLK1"),
// CHECK:     .REG_INPUTA_RST("RST3"),
// CHECK:     .REG_INPUTB_CE("CE3"),
// CHECK:     .REG_INPUTB_CLK("CLK0"),
// CHECK:     .REG_INPUTB_RST("RST3"),
// CHECK:     .REG_INPUTC_CE("CE3"),
// CHECK:     .REG_INPUTC_CLK("CLK1"),
// CHECK:     .REG_INPUTC_RST("RST3"),
// CHECK:     .REG_OUTPUT_CE("CE3"),
// CHECK:     .REG_OUTPUT_CLK("CLK0"),
// CHECK:     .REG_OUTPUT_RST("RST3"),
// CHECK:     .REG_PIPELINE_CE("CE3"),
// CHECK:     .REG_PIPELINE_CLK("CLK0"),
// CHECK:     .REG_PIPELINE_RST("RST3"),
// CHECK:     .SOURCEB_MODE("B_SHIFT")
// CHECK:   ) MULT18X18D_0 (
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
// CHECK:     .C0(1'h1),
// CHECK:     .C1(1'h1),
// CHECK:     .C10(1'h1),
// CHECK:     .C11(1'h1),
// CHECK:     .C12(1'h1),
// CHECK:     .C13(1'h1),
// CHECK:     .C14(1'h1),
// CHECK:     .C15(1'h1),
// CHECK:     .C16(1'h1),
// CHECK:     .C17(1'h1),
// CHECK:     .C2(1'h1),
// CHECK:     .C3(1'h1),
// CHECK:     .C4(1'h1),
// CHECK:     .C5(1'h1),
// CHECK:     .C6(1'h1),
// CHECK:     .C7(1'h1),
// CHECK:     .C8(1'h1),
// CHECK:     .C9(1'h1),
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
// CHECK:     .P16(P16_106),
// CHECK:     .P17(P17_107),
// CHECK:     .P18(P18_108),
// CHECK:     .P19(P19_109),
// CHECK:     .P2(p[2]),
// CHECK:     .P20(P20_110),
// CHECK:     .P21(P21_111),
// CHECK:     .P22(P22_112),
// CHECK:     .P23(P23_113),
// CHECK:     .P24(P24_114),
// CHECK:     .P25(P25_115),
// CHECK:     .P26(P26_116),
// CHECK:     .P27(P27_117),
// CHECK:     .P28(P28_118),
// CHECK:     .P29(P29_119),
// CHECK:     .P3(p[3]),
// CHECK:     .P30(P30_120),
// CHECK:     .P31(P31_121),
// CHECK:     .P32(P32_122),
// CHECK:     .P33(P33_123),
// CHECK:     .P34(P34_124),
// CHECK:     .P35(P35_125),
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
// CHECK:     .ROC0(ROC0_72),
// CHECK:     .ROC1(ROC1_73),
// CHECK:     .ROC10(ROC10_82),
// CHECK:     .ROC11(ROC11_83),
// CHECK:     .ROC12(ROC12_84),
// CHECK:     .ROC13(ROC13_85),
// CHECK:     .ROC14(ROC14_86),
// CHECK:     .ROC15(ROC15_87),
// CHECK:     .ROC16(ROC16_88),
// CHECK:     .ROC17(ROC17_89),
// CHECK:     .ROC2(ROC2_74),
// CHECK:     .ROC3(ROC3_75),
// CHECK:     .ROC4(ROC4_76),
// CHECK:     .ROC5(ROC5_77),
// CHECK:     .ROC6(ROC6_78),
// CHECK:     .ROC7(ROC7_79),
// CHECK:     .ROC8(ROC8_80),
// CHECK:     .ROC9(ROC9_81),
// CHECK:     .RST0(1'h0),
// CHECK:     .RST1(1'h0),
// CHECK:     .RST2(1'h0),
// CHECK:     .RST3(1'h0),
// CHECK:     .SIGNEDA(1'h1),
// CHECK:     .SIGNEDB(1'h1),
// CHECK:     .SIGNEDP(SIGNEDP_126),
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
// CHECK:   assign P0_90 = p[0];
// CHECK:   assign P10_100 = p[10];
// CHECK:   assign P11_101 = p[11];
// CHECK:   assign P12_102 = p[12];
// CHECK:   assign P13_103 = p[13];
// CHECK:   assign P14_104 = p[14];
// CHECK:   assign P15_105 = p[15];
// CHECK:   assign P1_91 = p[1];
// CHECK:   assign P2_92 = p[2];
// CHECK:   assign P3_93 = p[3];
// CHECK:   assign P4_94 = p[4];
// CHECK:   assign P5_95 = p[5];
// CHECK:   assign P6_96 = p[6];
// CHECK:   assign P7_97 = p[7];
// CHECK:   assign P8_98 = p[8];
// CHECK:   assign P9_99 = p[9];
// CHECK: endmodule
