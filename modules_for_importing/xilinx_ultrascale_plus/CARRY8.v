// Imported from https://github.com/fredrequin/verilator_xilinx/blob/352de831223a65e8eca3f6abe5c11217863a9dd3/CARRY8.v
//
// Conversion notes:
// - Converted CARRY_TYPE from parameter to port.
// - Converted type of CARRY_TYPE from string to enum.
`timescale  1 ps / 1 ps
//
// CARRY8 primitive for Xilinx FPGAs
// Compatible with Verilator tool (www.veripool.org)
// Copyright (c) 2019-2020 Frédéric REQUIN
// License : BSD
//

typedef enum bit { SINGLE_CY8 = 1'b0, DUAL_CY4 = 1'b1 } CARRY_TYPE_ENUM;

module CARRY8 (
    input CARRY_TYPE_ENUM CARRY_TYPE, // SINGLE_CY8, DUAL_CY4
    // Carry cascade input
    input  wire       CI,
    // Second carry input (in DUAL_CY4 mode)
    input  wire       CI_TOP,
    // Carry MUX data input
    input  wire [7:0] DI,
    // Carry MUX select line
    input  wire [7:0] S,
    // Carry out of each stage of the chain
    output wire [7:0] CO,
    // Carry chain XOR general data out
    output wire [7:0] O
);
    wire _w_CO0 = (S[0]) ?     CI : DI[0];
    wire _w_CO1 = (S[1]) ? _w_CO0 : DI[1];
    wire _w_CO2 = (S[2]) ? _w_CO1 : DI[2];
    wire _w_CO3 = (S[3]) ? _w_CO2 : DI[3];
    wire _w_CI  = (CARRY_TYPE == DUAL_CY4) ? CI_TOP : _w_CO3;
    wire _w_CO4 = (S[4]) ?  _w_CI : DI[4];
    wire _w_CO5 = (S[5]) ? _w_CO4 : DI[5];
    wire _w_CO6 = (S[6]) ? _w_CO5 : DI[6];
    wire _w_CO7 = (S[7]) ? _w_CO6 : DI[7];

    assign CO   = { _w_CO7, _w_CO6, _w_CO5, _w_CO4, _w_CO3, _w_CO2, _w_CO1, _w_CO0 };
    
    assign O    =  S ^ { _w_CO6, _w_CO5, _w_CO4, _w_CI, _w_CO2, _w_CO1, _w_CO0, CI };

endmodule
