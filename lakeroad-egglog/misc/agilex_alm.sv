// TODO(@gussmith23): Check this implementation.
//
// Implemented off of lakeroad-egglog/misc/agilex_alm.png; there may be bugs.
// Ignoring pin and pout for now; not sure what they do.

module agilex_alm (
    input  a,
    input  b,
    input  c0,
    input  c1,
    input  d0,
    input  d1,
    input  e,
    input  f,
    input  cin,
    // input  pin,
    output lut5out0,
    output lut5out1,
    output lut6out,
    output cout,
    output sumout0,
    output sumout1,
    // output pout,

    // These currently need to be ports, though they should be parameters.
    input [15:0] lut4_p0_mem,
    input [15:0] lut4_g0_mem,
    input [15:0] lut4_p1_mem,
    input [15:0] lut4_g1_mem

);


  wire lut4_p0_out;
  lut4 lut4_p0 (
      .a  (a),
      .b  (b),
      .c  (c0),
      .d  (d0),
      .out(lut4_p0_out),
      .mem(lut4_p0_mem)
  );


  wire lut4_g0_out;
  lut4 lut4_g0 (
      .a  (a),
      .b  (b),
      .c  (c0),
      .d  (d0),
      .out(lut4_g0_out),
      .mem(lut4_g0_mem)
  );

  wire lut4_p1_out;
  lut4 lut4_p1 (
      .a  (a),
      .b  (b),
      .c  (c1),
      .d  (d1),
      .out(lut4_p1_out),
      .mem(lut4_p1_mem)
  );

  wire lut4_g1_out;
  lut4 lut4_g1 (
      .a  (a),
      .b  (b),
      .c  (c1),
      .d  (d1),
      .out(lut4_g1_out),
      .mem(lut4_g1_mem)
  );

  assign lut5out0 = e ? lut4_g0_out : lut4_p0_out;
  assign lut6out = f ? lut5out0 : (e ? lut4_g1_out : lut4_p1_out);
  assign lut5out1 = f ? lut4_g1_out : lut4_p1_out;

  assign sumout0 = lut4_p0_out ^ cin;

  assign sumout1 = (lut4_p0_out ? lut4_g0_out : cin) ^ lut4_p1_out;

  assign cout = (lut4_p0_out & lut4_p1_out) ? cin : ((lut4_p1_out & lut4_g0_out) | lut4_g1_out);

endmodule

module lut4 (
    input  a,
    input  b,
    input  c,
    input  d,
    output out,

    // This should be a parameter, not a port. Required
    input [15:0] mem
);

  // We may need to swap the order of the index bits.
  // This implementation (instead of mem[{a, b, c, d}]) avoids $shiftx.
  assign out = 1'(mem >> {a, b, c, d});

endmodule
