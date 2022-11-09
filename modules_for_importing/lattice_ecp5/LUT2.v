// Originally from https://github.com/uwsampl/f4pga-arch-defs/blob/d65a0ac5af639626d752dfccf58abea253dfba15/ecp5/primitives/slice/LUT2.v
// 
// Notes on conversion:
// - Converted init from parameter to port.
`default_nettype none
module LUT2(input A, B, output Z, input [3:0] init);
    wire [1:0] s1 = B ?     init[ 3:2] :     init[1:0];
    assign Z =      A ?          s1[1] :         s1[0];
endmodule
