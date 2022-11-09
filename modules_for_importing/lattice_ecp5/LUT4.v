// Originally from https://github.com/uwsampl/f4pga-arch-defs/blob/d65a0ac5af639626d752dfccf58abea253dfba15/ecp5/primitives/slice/LUT4.v
// 
// Notes on conversion:
// - Converted init from parameter to port.
`default_nettype none
module LUT4(input A, B, C, D, output Z, input [15:0] init);
    wire [7:0] s3 = D ?     init[15:8] :     init[7:0];
    wire [3:0] s2 = C ?       s3[ 7:4] :       s3[3:0];
    wire [1:0] s1 = B ?       s2[ 3:2] :       s2[1:0];
    assign Z =      A ?          s1[1] :         s1[0];
endmodule
