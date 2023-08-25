`timescale  1 ps / 1 ps
//
// LUT2 primitive for Xilinx FPGAs
// Compatible with Verilator tool (www.veripool.org)
// Copyright (c) 2019-2020 Frédéric REQUIN
// License : BSD
//

module LUT2
#(
    parameter [3:0] INIT = 4'b0000
)
(
    input  wire I0, I1,
    output wire O
);
    wire [1:0] _w_idx = { I1, I0 };

    assign O = INIT[_w_idx];

endmodule
