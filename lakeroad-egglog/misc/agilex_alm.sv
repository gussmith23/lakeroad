// Implemented off of lakeroad-egglog/misc/agilex_alm.png; there may be bugs.

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
    input  pin,
    output lut5out0,
    output lut5out1,
    output lut6out,
    output cout,
    output sumout0,
    output sumout1,
    output pout,

    // These currently need to be ports, though they should be parameters.
    input [15:0] lut4_0_mem,
    input [15:0] lut4_1_mem,
    input [15:0] lut4_2_mem,
    input [15:0] lut4_3_mem
);

endmodule
