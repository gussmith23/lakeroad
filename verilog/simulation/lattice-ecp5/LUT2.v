`default_nettype none
module LUT2(input A, B, output Z);
    parameter [3:0] init = 4'h0;
    wire [1:0] s1 = B ?     init[ 3:2] :     init[1:0];
    assign Z =      A ?          s1[1] :         s1[0];
endmodule
