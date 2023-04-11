// RUN: racket $LAKEROAD_DIR/bin/main.rkt \
// RUN:  --verilog-module-filepath %s \
// RUN:  --architecture xilinx-ultrascale-plus \
// RUN:  --template dsp \
// RUN:  --out-format verilog \
// RUN:  --top-module-name two_stage_multiplier \
// RUN:  --verilog-module-out-signal p \
// RUN:  --initiation-interval 2 \
// RUN:  --clock-name clk \
// RUN:  --module-name out \
// RUN:  --input-signal a:16 \
// RUN:  --input-signal b:16 \
// RUN: | FileCheck %s

module two_stage_multiplier(input clk, input [15:0] a, b, output [15:0] p);

  reg [15:0] tmp, out;

  always @ (posedge clk) begin
    tmp <= a * b;
    out <= tmp;
  end

  assign p = out;

endmodule

// CHECK: module out(a, b, p);
// CHECK:   wire [47:0] P_0;
// CHECK:   input [15:0] a;
// CHECK:   wire [15:0] a;
// CHECK:   input [15:0] b;
// CHECK:   wire [15:0] b;
// CHECK:   output [15:0] p;
// CHECK:   wire [15:0] p;
// CHECK:   DSP48E2 #(
// CHECK:     .ACASCREG(32'd0),
// CHECK:     .ADREG(32'd0),
// CHECK:     .ALUMODEREG(32'd0),
// CHECK:     .AMULTSEL(5'h00),
// CHECK:     .AREG(32'd0),
// CHECK:     .AUTORESET_PATDET(5'h03),
// CHECK:     .AUTORESET_PRIORITY(5'h06),
// CHECK:     .A_INPUT(5'h07),
// CHECK:     .BCASCREG(32'd0),
// CHECK:     .BMULTSEL(5'h01),
// CHECK:     .BREG(32'd0),
// CHECK:     .B_INPUT(5'h07),
// CHECK:     .CARRYINREG(32'd0),
// CHECK:     .CARRYINSELREG(32'd0),
// CHECK:     .CREG(32'd0),
// CHECK:     .DREG(32'd0),
// CHECK:     .INMODEREG(32'd0),
// CHECK:     .IS_ALUMODE_INVERTED(4'h0),
// CHECK:     .IS_CARRYIN_INVERTED(1'h0),
// CHECK:     .IS_CLK_INVERTED(1'h0),
// CHECK:     .IS_INMODE_INVERTED(5'h00),
// CHECK:     .IS_OPMODE_INVERTED(9'h005),
// CHECK:     .IS_RSTALLCARRYIN_INVERTED(1'h0),
// CHECK:     .IS_RSTALUMODE_INVERTED(1'h0),
// CHECK:     .IS_RSTA_INVERTED(1'h0),
// CHECK:     .IS_RSTB_INVERTED(1'h0),
// CHECK:     .IS_RSTCTRL_INVERTED(1'h0),
// CHECK:     .IS_RSTC_INVERTED(1'h0),
// CHECK:     .IS_RSTD_INVERTED(1'h0),
// CHECK:     .IS_RSTINMODE_INVERTED(1'h0),
// CHECK:     .IS_RSTM_INVERTED(1'h0),
// CHECK:     .IS_RSTP_INVERTED(1'h0),
// CHECK:     .MASK(48'h000000000000),
// CHECK:     .MREG(32'd0),
// CHECK:     .OPMODEREG(32'd0),
// CHECK:     .PATTERN(48'h000000000000),
// CHECK:     .PREADDINSEL(5'h00),
// CHECK:     .PREG(32'd0),
// CHECK:     .RND(48'h000000000000),
// CHECK:     .SEL_MASK(5'h08),
// CHECK:     .SEL_PATTERN(5'h09),
// CHECK:     .USE_MULT(5'h0a),
// CHECK:     .USE_PATTERN_DETECT(5'h0b),
// CHECK:     .USE_SIMD(5'h0c),
// CHECK:     .USE_WIDEXOR(5'h0d),
// CHECK:     .XORSIMD(5'h0e)
// CHECK:   ) DSP48E2_0 (
// CHECK:     .A({ 14'h0000, b }),
// CHECK:     .ACIN(30'h00000000),
// CHECK:     .ALUMODE(4'h0),
// CHECK:     .B({ 2'h0, a }),
// CHECK:     .BCIN(18'h00000),
// CHECK:     .C(48'h000000000000),
// CHECK:     .CARRYCASCIN(1'h0),
// CHECK:     .CARRYIN(1'h0),
// CHECK:     .CARRYINSEL(3'h0),
// CHECK:     .CEA1(1'h1),
// CHECK:     .CEA2(1'h1),
// CHECK:     .CEAD(1'h1),
// CHECK:     .CEALUMODE(1'h1),
// CHECK:     .CEB1(1'h1),
// CHECK:     .CEB2(1'h1),
// CHECK:     .CEC(1'h1),
// CHECK:     .CECARRYIN(1'h1),
// CHECK:     .CECTRL(1'h1),
// CHECK:     .CED(1'h1),
// CHECK:     .CEINMODE(1'h1),
// CHECK:     .CEM(1'h1),
// CHECK:     .CEP(1'h1),
// CHECK:     .CLK(1'h0),
// CHECK:     .D(27'h0000000),
// CHECK:     .INMODE(5'h00),
// CHECK:     .MULTSIGNIN(1'h0),
// CHECK:     .OPMODE(9'h000),
// CHECK:     .P({ P_0[47:16], p }),
// CHECK:     .PCIN(48'h000000000000),
// CHECK:     .RSTA(1'h0),
// CHECK:     .RSTALLCARRYIN(1'h0),
// CHECK:     .RSTALUMODE(1'h0),
// CHECK:     .RSTB(1'h0),
// CHECK:     .RSTC(1'h0),
// CHECK:     .RSTCTRL(1'h0),
// CHECK:     .RSTD(1'h0),
// CHECK:     .RSTINMODE(1'h0),
// CHECK:     .RSTM(1'h0),
// CHECK:     .RSTP(1'h0)
// CHECK:   );
// CHECK:   assign P_0[15] = p[15];
// CHECK:   assign P_0[14] = p[14];
// CHECK:   assign P_0[13] = p[13];
// CHECK:   assign P_0[12] = p[12];
// CHECK:   assign P_0[11] = p[11];
// CHECK:   assign P_0[10] = p[10];
// CHECK:   assign P_0[9] = p[9];
// CHECK:   assign P_0[8] = p[8];
// CHECK:   assign P_0[7] = p[7];
// CHECK:   assign P_0[6] = p[6];
// CHECK:   assign P_0[5] = p[5];
// CHECK:   assign P_0[4] = p[4];
// CHECK:   assign P_0[3] = p[3];
// CHECK:   assign P_0[2] = p[2];
// CHECK:   assign P_0[1] = p[1];
// CHECK:   assign P_0[0] = p[0];
// CHECK: endmodule
