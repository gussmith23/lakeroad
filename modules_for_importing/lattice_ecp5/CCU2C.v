// Originally from https://github.com/uwsampl/f4pga-arch-defs/blob/d65a0ac5af639626d752dfccf58abea253dfba15/ecp5/primitives/slice/CCU2C.v
//
// Notes on conversion:
// - Converted INIT0, INIT1, INJECT1_0, INJECT1_1 to ports.
// - Converted INJECT1_0 and INJECT1_1 from strings to bits. 1 == "YES".
`include "LUT2.v"
`include "LUT4.v"
`default_nettype none
module CCU2C (
    input CIN,
    A0,
    B0,
    C0,
    D0,
    A1,
    B1,
    C1,
    D1,
    output S0,
    S1,
    COUT,
    input [15:0] INIT0,
    input [15:0] INIT1,
    input INJECT1_0,
    input INJECT1_1
);


  // First half
  wire LUT4_0, LUT2_0;
  LUT4 lut4_0 (
      .A(A0),
      .B(B0),
      .C(C0),
      .D(D0),
      .Z(LUT4_0),
      .INIT(INIT0)
  );
  LUT2 lut2_0 (
      .A(A0),
      .B(B0),
      .Z(LUT2_0),
      .INIT(INIT0[3:0])
  );

  wire gated_cin_0 = (INJECT1_0 == 1'b1) ? 1'b0 : CIN;
  assign S0 = LUT4_0 ^ gated_cin_0;

  wire gated_lut2_0 = (INJECT1_0 == 1'b1) ? 1'b0 : LUT2_0;
  wire cout_0 = (~LUT4_0 & gated_lut2_0) | (LUT4_0 & CIN);

  // Second half
  wire LUT4_1, LUT2_1;
  LUT4 lut4_1 (
      .A(A1),
      .B(B1),
      .C(C1),
      .D(D1),
      .Z(LUT4_1),
      .INIT(INIT1)
  );
  LUT2 lut2_1 (
      .A(A1),
      .B(B1),
      .Z(LUT2_1),
      .INIT(INIT1[3:0])
  );

  wire gated_cin_1 = (INJECT1_1 == 1'b1) ? 1'b0 : cout_0;
  assign S1 = LUT4_1 ^ gated_cin_1;

  wire gated_lut2_1 = (INJECT1_1 == 1'b1) ? 1'b0 : LUT2_1;
  assign COUT = (~LUT4_1 & gated_lut2_1) | (LUT4_1 & cout_0);

endmodule
