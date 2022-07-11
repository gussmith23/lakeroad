// RUN: python3 $LAKEROAD_DIR/utils/convert-module-to-btor.py \
// RUN:   --remove-lines-with '$finish' \
// RUN:   --define XIL_XECLIB --top DSP48E2 --infile %s 2>/dev/null \
// RUN:   | FileCheck %s

///////////////////////////////////////////////////////////////////////////////
//     Copyright (c) 1995/2018 Xilinx, Inc.
// 
//    Licensed under the Apache License, Version 2.0 (the "License");
//    you may not use this file except in compliance with the License.
//    You may obtain a copy of the License at
// 
//        http://www.apache.org/licenses/LICENSE-2.0
// 
//    Unless required by applicable law or agreed to in writing, software
//    distributed under the License is distributed on an "AS IS" BASIS,
//    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//    See the License for the specific language governing permissions and
//    limitations under the License.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2018.3
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        48-bit Multi-Functional Arithmetic Block
// /___/   /\      Filename    : DSP48E2.v
// \   \  /  \
//  \___\/\___\
//
///////////////////////////////////////////////////////////////////////////////
//  Revision:
//  07/15/12 - Migrate from E1.
//  12/10/12 - Add dynamic registers
//  01/10/13 - 694456 - DIN_in/D_in connectivity issue
//  01/11/13 - DIN, D_DATA data width change (26/24) sync4 yml
//  02/13/13 - PCIN_47A change from internal feedback to PCIN(47) pin
//  03/06/13 - 701316 - A_B_reg no clk when REG=0
//  04/03/13 - yaml update
//  04/08/13 - 710304 - AREG, BREG, ACASCREG and BCASCREG dynamic registers mis sized.
//  04/22/13 - 714213 - ACOUT, BCOUT wrong logic
//  04/22/13 - 713695 - Zero mult result on USE_SIMD
//  04/22/13 - 713617 - CARRYCASCOUT behaviour
//  04/23/13 - 714772 - remove sensitivity to negedge GSR
//  04/23/13 - 713706 - change P_PDBK connection
//  05/07/13 - 716896 - AREG, BREG, ACASCREG and BCASCREG localparams mis sized.
//  05/07/13 - 716896 - ALUMODE/OPMODE_INV_REG mis sized
//  05/07/13 - 716896 - INMODE_INV_REG mis sized
//  05/07/13 - x_mac_cascd missing for sensitivity list.
//  10/22/14 - 808642 - Added #1 to $finish
//  End Revision:
///////////////////////////////////////////////////////////////////////////////

`timescale 1 ps / 1 ps

`celldefine

module DSP48E2 #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter integer ACASCREG = 1,
  parameter integer ADREG = 1,
  parameter integer ALUMODEREG = 1,
  parameter AMULTSEL = "A",
  parameter integer AREG = 1,
  parameter AUTORESET_PATDET = "NO_RESET",
  parameter AUTORESET_PRIORITY = "RESET",
  parameter A_INPUT = "DIRECT",
  parameter integer BCASCREG = 1,
  parameter BMULTSEL = "B",
  parameter integer BREG = 1,
  parameter B_INPUT = "DIRECT",
  parameter integer CARRYINREG = 1,
  parameter integer CARRYINSELREG = 1,
  parameter integer CREG = 1,
  parameter integer DREG = 1,
  parameter integer INMODEREG = 1,
  parameter [3:0] IS_ALUMODE_INVERTED = 4'b0000,
  parameter [0:0] IS_CARRYIN_INVERTED = 1'b0,
  parameter [0:0] IS_CLK_INVERTED = 1'b0,
  parameter [4:0] IS_INMODE_INVERTED = 5'b00000,
  parameter [8:0] IS_OPMODE_INVERTED = 9'b000000000,
  parameter [0:0] IS_RSTALLCARRYIN_INVERTED = 1'b0,
  parameter [0:0] IS_RSTALUMODE_INVERTED = 1'b0,
  parameter [0:0] IS_RSTA_INVERTED = 1'b0,
  parameter [0:0] IS_RSTB_INVERTED = 1'b0,
  parameter [0:0] IS_RSTCTRL_INVERTED = 1'b0,
  parameter [0:0] IS_RSTC_INVERTED = 1'b0,
  parameter [0:0] IS_RSTD_INVERTED = 1'b0,
  parameter [0:0] IS_RSTINMODE_INVERTED = 1'b0,
  parameter [0:0] IS_RSTM_INVERTED = 1'b0,
  parameter [0:0] IS_RSTP_INVERTED = 1'b0,
  parameter [47:0] MASK = 48'h3FFFFFFFFFFF,
  parameter integer MREG = 1,
  parameter integer OPMODEREG = 1,
  parameter [47:0] PATTERN = 48'h000000000000,
  parameter PREADDINSEL = "A",
  parameter integer PREG = 1,
  parameter [47:0] RND = 48'h000000000000,
  parameter SEL_MASK = "MASK",
  parameter SEL_PATTERN = "PATTERN",
  parameter USE_MULT = "MULTIPLY",
  parameter USE_PATTERN_DETECT = "NO_PATDET",
  parameter USE_SIMD = "ONE48",
  parameter USE_WIDEXOR = "FALSE",
  parameter XORSIMD = "XOR24_48_96"
)(
  output [29:0] ACOUT,
  output [17:0] BCOUT,
  output CARRYCASCOUT,
  output [3:0] CARRYOUT,
  output MULTSIGNOUT,
  output OVERFLOW,
  output [47:0] P,
  output PATTERNBDETECT,
  output PATTERNDETECT,
  output [47:0] PCOUT,
  output UNDERFLOW,
  output [7:0] XOROUT,

  input [29:0] A,
  input [29:0] ACIN,
  input [3:0] ALUMODE,
  input [17:0] B,
  input [17:0] BCIN,
  input [47:0] C,
  input CARRYCASCIN,
  input CARRYIN,
  input [2:0] CARRYINSEL,
  input CEA1,
  input CEA2,
  input CEAD,
  input CEALUMODE,
  input CEB1,
  input CEB2,
  input CEC,
  input CECARRYIN,
  input CECTRL,
  input CED,
  input CEINMODE,
  input CEM,
  input CEP,
  input CLK,
  input [26:0] D,
  input [4:0] INMODE,
  input MULTSIGNIN,
  input [8:0] OPMODE,
  input [47:0] PCIN,
  input RSTA,
  input RSTALLCARRYIN,
  input RSTALUMODE,
  input RSTB,
  input RSTC,
  input RSTCTRL,
  input RSTD,
  input RSTINMODE,
  input RSTM,
  input RSTP
);
  
// define constants
  localparam MODULE_NAME = "DSP48E2";

// Parameter encodings and registers
  localparam AMULTSEL_A = 0;
  localparam AMULTSEL_AD = 1;
  localparam AUTORESET_PATDET_NO_RESET = 0;
  localparam AUTORESET_PATDET_RESET_MATCH = 1;
  localparam AUTORESET_PATDET_RESET_NOT_MATCH = 2;
  localparam AUTORESET_PRIORITY_CEP = 1;
  localparam AUTORESET_PRIORITY_RESET = 0;
  localparam A_INPUT_CASCADE = 1;
  localparam A_INPUT_DIRECT = 0;
  localparam BMULTSEL_AD = 1;
  localparam BMULTSEL_B = 0;
  localparam B_INPUT_CASCADE = 1;
  localparam B_INPUT_DIRECT = 0;
  localparam PREADDINSEL_A = 0;
  localparam PREADDINSEL_B = 1;
  localparam SEL_MASK_C = 1;
  localparam SEL_MASK_MASK = 0;
  localparam SEL_MASK_ROUNDING_MODE1 = 2;
  localparam SEL_MASK_ROUNDING_MODE2 = 3;
  localparam SEL_PATTERN_C = 1;
  localparam SEL_PATTERN_PATTERN = 0;
  localparam USE_MULT_DYNAMIC = 1;
  localparam USE_MULT_MULTIPLY = 0;
  localparam USE_MULT_NONE = 2;
  localparam USE_PATTERN_DETECT_NO_PATDET = 0;
  localparam USE_PATTERN_DETECT_PATDET = 1;
  localparam USE_SIMD_FOUR12 = 1;
  localparam USE_SIMD_ONE48 = 0;
  localparam USE_SIMD_TWO24 = 2;
  localparam USE_WIDEXOR_FALSE = 0;
  localparam USE_WIDEXOR_TRUE = 1;
  localparam XORSIMD_XOR12 = 1;
  localparam XORSIMD_XOR24_48_96 = 0;

  reg trig_attr;
// include dynamic registers - XILINX test only
`ifdef XIL_DR
  `include "DSP48E2_dr.v"
`else
  reg [31:0] ACASCREG_REG = ACASCREG;
  reg [31:0] ADREG_REG = ADREG;
  reg [31:0] ALUMODEREG_REG = ALUMODEREG;
  reg [16:1] AMULTSEL_REG = AMULTSEL;
  reg [31:0] AREG_REG = AREG;
  reg [120:1] AUTORESET_PATDET_REG = AUTORESET_PATDET;
  reg [40:1] AUTORESET_PRIORITY_REG = AUTORESET_PRIORITY;
  reg [56:1] A_INPUT_REG = A_INPUT;
  reg [31:0] BCASCREG_REG = BCASCREG;
  reg [16:1] BMULTSEL_REG = BMULTSEL;
  reg [31:0] BREG_REG = BREG;
  reg [56:1] B_INPUT_REG = B_INPUT;
  reg [31:0] CARRYINREG_REG = CARRYINREG;
  reg [31:0] CARRYINSELREG_REG = CARRYINSELREG;
  reg [31:0] CREG_REG = CREG;
  reg [31:0] DREG_REG = DREG;
  reg [31:0] INMODEREG_REG = INMODEREG;
  reg [3:0] IS_ALUMODE_INVERTED_REG = IS_ALUMODE_INVERTED;
  reg [0:0] IS_CARRYIN_INVERTED_REG = IS_CARRYIN_INVERTED;
  reg [0:0] IS_CLK_INVERTED_REG = IS_CLK_INVERTED;
  reg [4:0] IS_INMODE_INVERTED_REG = IS_INMODE_INVERTED;
  reg [8:0] IS_OPMODE_INVERTED_REG = IS_OPMODE_INVERTED;
  reg [0:0] IS_RSTALLCARRYIN_INVERTED_REG = IS_RSTALLCARRYIN_INVERTED;
  reg [0:0] IS_RSTALUMODE_INVERTED_REG = IS_RSTALUMODE_INVERTED;
  reg [0:0] IS_RSTA_INVERTED_REG = IS_RSTA_INVERTED;
  reg [0:0] IS_RSTB_INVERTED_REG = IS_RSTB_INVERTED;
  reg [0:0] IS_RSTCTRL_INVERTED_REG = IS_RSTCTRL_INVERTED;
  reg [0:0] IS_RSTC_INVERTED_REG = IS_RSTC_INVERTED;
  reg [0:0] IS_RSTD_INVERTED_REG = IS_RSTD_INVERTED;
  reg [0:0] IS_RSTINMODE_INVERTED_REG = IS_RSTINMODE_INVERTED;
  reg [0:0] IS_RSTM_INVERTED_REG = IS_RSTM_INVERTED;
  reg [0:0] IS_RSTP_INVERTED_REG = IS_RSTP_INVERTED;
  reg [47:0] MASK_REG = MASK;
  reg [31:0] MREG_REG = MREG;
  reg [31:0] OPMODEREG_REG = OPMODEREG;
  reg [47:0] PATTERN_REG = PATTERN;
  reg [8:1] PREADDINSEL_REG = PREADDINSEL;
  reg [31:0] PREG_REG = PREG;
  reg [47:0] RND_REG = RND;
  reg [112:1] SEL_MASK_REG = SEL_MASK;
  reg [56:1] SEL_PATTERN_REG = SEL_PATTERN;
  reg [64:1] USE_MULT_REG = USE_MULT;
  reg [72:1] USE_PATTERN_DETECT_REG = USE_PATTERN_DETECT;
  reg [48:1] USE_SIMD_REG = USE_SIMD;
  reg [40:1] USE_WIDEXOR_REG = USE_WIDEXOR;
  reg [88:1] XORSIMD_REG = XORSIMD;
`endif

`ifdef XIL_XECLIB
  wire [1:0] ACASCREG_BIN;
  wire ADREG_BIN;
  wire ALUMODEREG_BIN;
  wire AMULTSEL_BIN;
  wire [1:0] AREG_BIN;
  wire [1:0] AUTORESET_PATDET_BIN;
  wire AUTORESET_PRIORITY_BIN;
  wire A_INPUT_BIN;
  wire [1:0] BCASCREG_BIN;
  wire BMULTSEL_BIN;
  wire [1:0] BREG_BIN;
  wire B_INPUT_BIN;
  wire CARRYINREG_BIN;
  wire CARRYINSELREG_BIN;
  wire CREG_BIN;
  wire DREG_BIN;
  wire INMODEREG_BIN;
  wire MREG_BIN;
  wire OPMODEREG_BIN;
  wire PREADDINSEL_BIN;
  wire PREG_BIN;
  wire [1:0] SEL_MASK_BIN;
  wire SEL_PATTERN_BIN;
  wire [1:0] USE_MULT_BIN;
  wire USE_PATTERN_DETECT_BIN;
  wire [1:0] USE_SIMD_BIN;
  wire USE_WIDEXOR_BIN;
  wire XORSIMD_BIN;
`else
  reg [1:0] ACASCREG_BIN;
  reg ADREG_BIN;
  reg ALUMODEREG_BIN;
  reg AMULTSEL_BIN;
  reg [1:0] AREG_BIN;
  reg [1:0] AUTORESET_PATDET_BIN;
  reg AUTORESET_PRIORITY_BIN;
  reg A_INPUT_BIN;
  reg [1:0] BCASCREG_BIN;
  reg BMULTSEL_BIN;
  reg [1:0] BREG_BIN;
  reg B_INPUT_BIN;
  reg CARRYINREG_BIN;
  reg CARRYINSELREG_BIN;
  reg CREG_BIN;
  reg DREG_BIN;
  reg INMODEREG_BIN;
  reg MREG_BIN;
  reg OPMODEREG_BIN;
  reg PREADDINSEL_BIN;
  reg PREG_BIN;
  reg [1:0] SEL_MASK_BIN;
  reg SEL_PATTERN_BIN;
  reg [1:0] USE_MULT_BIN;
  reg USE_PATTERN_DETECT_BIN;
  reg [1:0] USE_SIMD_BIN;
  reg USE_WIDEXOR_BIN;
  reg XORSIMD_BIN;
`endif

`ifdef XIL_XECLIB
  reg glblGSR = 1'b0;
`else
  tri0 glblGSR = glbl.GSR;
`endif

  wire CARRYCASCIN_in;
  wire CARRYIN_in;
  wire CEA1_in;
  wire CEA2_in;
  wire CEAD_in;
  wire CEALUMODE_in;
  wire CEB1_in;
  wire CEB2_in;
  wire CECARRYIN_in;
  wire CECTRL_in;
  wire CEC_in;
  wire CED_in;
  wire CEINMODE_in;
  wire CEM_in;
  wire CEP_in;
  wire CLK_in;
  wire MULTSIGNIN_in;
  wire RSTALLCARRYIN_in;
  wire RSTALUMODE_in;
  wire RSTA_in;
  wire RSTB_in;
  wire RSTCTRL_in;
  wire RSTC_in;
  wire RSTD_in;
  wire RSTINMODE_in;
  wire RSTM_in;
  wire RSTP_in;
  wire [17:0] BCIN_in;
  wire [17:0] B_in;
  wire [26:0] D_in;
  wire [29:0] ACIN_in;
  wire [29:0] A_in;
  wire [2:0] CARRYINSEL_in;
  wire [3:0] ALUMODE_in;
  wire [47:0] C_in;
  wire [47:0] PCIN_in;
  wire [4:0] INMODE_in;
  wire [8:0] OPMODE_in;

  assign ACIN_in = ACIN;
  assign ALUMODE_in[0] = (ALUMODE[0] !== 1'bz) && (ALUMODE[0] ^ IS_ALUMODE_INVERTED_REG[0]); // rv 0
  assign ALUMODE_in[1] = (ALUMODE[1] !== 1'bz) && (ALUMODE[1] ^ IS_ALUMODE_INVERTED_REG[1]); // rv 0
  assign ALUMODE_in[2] = (ALUMODE[2] !== 1'bz) && (ALUMODE[2] ^ IS_ALUMODE_INVERTED_REG[2]); // rv 0
  assign ALUMODE_in[3] = (ALUMODE[3] !== 1'bz) && (ALUMODE[3] ^ IS_ALUMODE_INVERTED_REG[3]); // rv 0
  assign A_in[0] = (A[0] === 1'bz) || A[0]; // rv 1
  assign A_in[10] = (A[10] === 1'bz) || A[10]; // rv 1
  assign A_in[11] = (A[11] === 1'bz) || A[11]; // rv 1
  assign A_in[12] = (A[12] === 1'bz) || A[12]; // rv 1
  assign A_in[13] = (A[13] === 1'bz) || A[13]; // rv 1
  assign A_in[14] = (A[14] === 1'bz) || A[14]; // rv 1
  assign A_in[15] = (A[15] === 1'bz) || A[15]; // rv 1
  assign A_in[16] = (A[16] === 1'bz) || A[16]; // rv 1
  assign A_in[17] = (A[17] === 1'bz) || A[17]; // rv 1
  assign A_in[18] = (A[18] === 1'bz) || A[18]; // rv 1
  assign A_in[19] = (A[19] === 1'bz) || A[19]; // rv 1
  assign A_in[1] = (A[1] === 1'bz) || A[1]; // rv 1
  assign A_in[20] = (A[20] === 1'bz) || A[20]; // rv 1
  assign A_in[21] = (A[21] === 1'bz) || A[21]; // rv 1
  assign A_in[22] = (A[22] === 1'bz) || A[22]; // rv 1
  assign A_in[23] = (A[23] === 1'bz) || A[23]; // rv 1
  assign A_in[24] = (A[24] === 1'bz) || A[24]; // rv 1
  assign A_in[25] = (A[25] === 1'bz) || A[25]; // rv 1
  assign A_in[26] = (A[26] === 1'bz) || A[26]; // rv 1
  assign A_in[27] = (A[27] === 1'bz) || A[27]; // rv 1
  assign A_in[28] = (A[28] === 1'bz) || A[28]; // rv 1
  assign A_in[29] = (A[29] === 1'bz) || A[29]; // rv 1
  assign A_in[2] = (A[2] === 1'bz) || A[2]; // rv 1
  assign A_in[3] = (A[3] === 1'bz) || A[3]; // rv 1
  assign A_in[4] = (A[4] === 1'bz) || A[4]; // rv 1
  assign A_in[5] = (A[5] === 1'bz) || A[5]; // rv 1
  assign A_in[6] = (A[6] === 1'bz) || A[6]; // rv 1
  assign A_in[7] = (A[7] === 1'bz) || A[7]; // rv 1
  assign A_in[8] = (A[8] === 1'bz) || A[8]; // rv 1
  assign A_in[9] = (A[9] === 1'bz) || A[9]; // rv 1
  assign BCIN_in = BCIN;
  assign B_in[0] = (B[0] === 1'bz) || B[0]; // rv 1
  assign B_in[10] = (B[10] === 1'bz) || B[10]; // rv 1
  assign B_in[11] = (B[11] === 1'bz) || B[11]; // rv 1
  assign B_in[12] = (B[12] === 1'bz) || B[12]; // rv 1
  assign B_in[13] = (B[13] === 1'bz) || B[13]; // rv 1
  assign B_in[14] = (B[14] === 1'bz) || B[14]; // rv 1
  assign B_in[15] = (B[15] === 1'bz) || B[15]; // rv 1
  assign B_in[16] = (B[16] === 1'bz) || B[16]; // rv 1
  assign B_in[17] = (B[17] === 1'bz) || B[17]; // rv 1
  assign B_in[1] = (B[1] === 1'bz) || B[1]; // rv 1
  assign B_in[2] = (B[2] === 1'bz) || B[2]; // rv 1
  assign B_in[3] = (B[3] === 1'bz) || B[3]; // rv 1
  assign B_in[4] = (B[4] === 1'bz) || B[4]; // rv 1
  assign B_in[5] = (B[5] === 1'bz) || B[5]; // rv 1
  assign B_in[6] = (B[6] === 1'bz) || B[6]; // rv 1
  assign B_in[7] = (B[7] === 1'bz) || B[7]; // rv 1
  assign B_in[8] = (B[8] === 1'bz) || B[8]; // rv 1
  assign B_in[9] = (B[9] === 1'bz) || B[9]; // rv 1
  assign CARRYCASCIN_in = CARRYCASCIN;
  assign CARRYINSEL_in[0] = (CARRYINSEL[0] !== 1'bz) && CARRYINSEL[0]; // rv 0
  assign CARRYINSEL_in[1] = (CARRYINSEL[1] !== 1'bz) && CARRYINSEL[1]; // rv 0
  assign CARRYINSEL_in[2] = (CARRYINSEL[2] !== 1'bz) && CARRYINSEL[2]; // rv 0
  assign CARRYIN_in = (CARRYIN !== 1'bz) && (CARRYIN ^ IS_CARRYIN_INVERTED_REG); // rv 0
  assign CEA1_in = (CEA1 !== 1'bz) && CEA1; // rv 0
  assign CEA2_in = (CEA2 !== 1'bz) && CEA2; // rv 0
  assign CEAD_in = (CEAD !== 1'bz) && CEAD; // rv 0
  assign CEALUMODE_in = (CEALUMODE !== 1'bz) && CEALUMODE; // rv 0
  assign CEB1_in = (CEB1 !== 1'bz) && CEB1; // rv 0
  assign CEB2_in = (CEB2 !== 1'bz) && CEB2; // rv 0
  assign CECARRYIN_in = (CECARRYIN !== 1'bz) && CECARRYIN; // rv 0
  assign CECTRL_in = (CECTRL !== 1'bz) && CECTRL; // rv 0
  assign CEC_in = (CEC !== 1'bz) && CEC; // rv 0
  assign CED_in = (CED !== 1'bz) && CED; // rv 0
  assign CEINMODE_in = CEINMODE;
  assign CEM_in = (CEM !== 1'bz) && CEM; // rv 0
  assign CEP_in = (CEP !== 1'bz) && CEP; // rv 0
  assign CLK_in = (CLK !== 1'bz) && (CLK ^ IS_CLK_INVERTED_REG); // rv 0
  assign C_in[0] = (C[0] === 1'bz) || C[0]; // rv 1
  assign C_in[10] = (C[10] === 1'bz) || C[10]; // rv 1
  assign C_in[11] = (C[11] === 1'bz) || C[11]; // rv 1
  assign C_in[12] = (C[12] === 1'bz) || C[12]; // rv 1
  assign C_in[13] = (C[13] === 1'bz) || C[13]; // rv 1
  assign C_in[14] = (C[14] === 1'bz) || C[14]; // rv 1
  assign C_in[15] = (C[15] === 1'bz) || C[15]; // rv 1
  assign C_in[16] = (C[16] === 1'bz) || C[16]; // rv 1
  assign C_in[17] = (C[17] === 1'bz) || C[17]; // rv 1
  assign C_in[18] = (C[18] === 1'bz) || C[18]; // rv 1
  assign C_in[19] = (C[19] === 1'bz) || C[19]; // rv 1
  assign C_in[1] = (C[1] === 1'bz) || C[1]; // rv 1
  assign C_in[20] = (C[20] === 1'bz) || C[20]; // rv 1
  assign C_in[21] = (C[21] === 1'bz) || C[21]; // rv 1
  assign C_in[22] = (C[22] === 1'bz) || C[22]; // rv 1
  assign C_in[23] = (C[23] === 1'bz) || C[23]; // rv 1
  assign C_in[24] = (C[24] === 1'bz) || C[24]; // rv 1
  assign C_in[25] = (C[25] === 1'bz) || C[25]; // rv 1
  assign C_in[26] = (C[26] === 1'bz) || C[26]; // rv 1
  assign C_in[27] = (C[27] === 1'bz) || C[27]; // rv 1
  assign C_in[28] = (C[28] === 1'bz) || C[28]; // rv 1
  assign C_in[29] = (C[29] === 1'bz) || C[29]; // rv 1
  assign C_in[2] = (C[2] === 1'bz) || C[2]; // rv 1
  assign C_in[30] = (C[30] === 1'bz) || C[30]; // rv 1
  assign C_in[31] = (C[31] === 1'bz) || C[31]; // rv 1
  assign C_in[32] = (C[32] === 1'bz) || C[32]; // rv 1
  assign C_in[33] = (C[33] === 1'bz) || C[33]; // rv 1
  assign C_in[34] = (C[34] === 1'bz) || C[34]; // rv 1
  assign C_in[35] = (C[35] === 1'bz) || C[35]; // rv 1
  assign C_in[36] = (C[36] === 1'bz) || C[36]; // rv 1
  assign C_in[37] = (C[37] === 1'bz) || C[37]; // rv 1
  assign C_in[38] = (C[38] === 1'bz) || C[38]; // rv 1
  assign C_in[39] = (C[39] === 1'bz) || C[39]; // rv 1
  assign C_in[3] = (C[3] === 1'bz) || C[3]; // rv 1
  assign C_in[40] = (C[40] === 1'bz) || C[40]; // rv 1
  assign C_in[41] = (C[41] === 1'bz) || C[41]; // rv 1
  assign C_in[42] = (C[42] === 1'bz) || C[42]; // rv 1
  assign C_in[43] = (C[43] === 1'bz) || C[43]; // rv 1
  assign C_in[44] = (C[44] === 1'bz) || C[44]; // rv 1
  assign C_in[45] = (C[45] === 1'bz) || C[45]; // rv 1
  assign C_in[46] = (C[46] === 1'bz) || C[46]; // rv 1
  assign C_in[47] = (C[47] === 1'bz) || C[47]; // rv 1
  assign C_in[4] = (C[4] === 1'bz) || C[4]; // rv 1
  assign C_in[5] = (C[5] === 1'bz) || C[5]; // rv 1
  assign C_in[6] = (C[6] === 1'bz) || C[6]; // rv 1
  assign C_in[7] = (C[7] === 1'bz) || C[7]; // rv 1
  assign C_in[8] = (C[8] === 1'bz) || C[8]; // rv 1
  assign C_in[9] = (C[9] === 1'bz) || C[9]; // rv 1
  assign D_in[0] = (D[0] !== 1'bz) && D[0]; // rv 0
  assign D_in[10] = (D[10] !== 1'bz) && D[10]; // rv 0
  assign D_in[11] = (D[11] !== 1'bz) && D[11]; // rv 0
  assign D_in[12] = (D[12] !== 1'bz) && D[12]; // rv 0
  assign D_in[13] = (D[13] !== 1'bz) && D[13]; // rv 0
  assign D_in[14] = (D[14] !== 1'bz) && D[14]; // rv 0
  assign D_in[15] = (D[15] !== 1'bz) && D[15]; // rv 0
  assign D_in[16] = (D[16] !== 1'bz) && D[16]; // rv 0
  assign D_in[17] = (D[17] !== 1'bz) && D[17]; // rv 0
  assign D_in[18] = (D[18] !== 1'bz) && D[18]; // rv 0
  assign D_in[19] = (D[19] !== 1'bz) && D[19]; // rv 0
  assign D_in[1] = (D[1] !== 1'bz) && D[1]; // rv 0
  assign D_in[20] = (D[20] !== 1'bz) && D[20]; // rv 0
  assign D_in[21] = (D[21] !== 1'bz) && D[21]; // rv 0
  assign D_in[22] = (D[22] !== 1'bz) && D[22]; // rv 0
  assign D_in[23] = (D[23] !== 1'bz) && D[23]; // rv 0
  assign D_in[24] = (D[24] !== 1'bz) && D[24]; // rv 0
  assign D_in[25] = (D[25] !== 1'bz) && D[25]; // rv 0
  assign D_in[26] = (D[26] !== 1'bz) && D[26]; // rv 0
  assign D_in[2] = (D[2] !== 1'bz) && D[2]; // rv 0
  assign D_in[3] = (D[3] !== 1'bz) && D[3]; // rv 0
  assign D_in[4] = (D[4] !== 1'bz) && D[4]; // rv 0
  assign D_in[5] = (D[5] !== 1'bz) && D[5]; // rv 0
  assign D_in[6] = (D[6] !== 1'bz) && D[6]; // rv 0
  assign D_in[7] = (D[7] !== 1'bz) && D[7]; // rv 0
  assign D_in[8] = (D[8] !== 1'bz) && D[8]; // rv 0
  assign D_in[9] = (D[9] !== 1'bz) && D[9]; // rv 0
  assign INMODE_in[0] = (INMODE[0] !== 1'bz) && (INMODE[0] ^ IS_INMODE_INVERTED_REG[0]); // rv 0
  assign INMODE_in[1] = (INMODE[1] !== 1'bz) && (INMODE[1] ^ IS_INMODE_INVERTED_REG[1]); // rv 0
  assign INMODE_in[2] = (INMODE[2] !== 1'bz) && (INMODE[2] ^ IS_INMODE_INVERTED_REG[2]); // rv 0
  assign INMODE_in[3] = (INMODE[3] !== 1'bz) && (INMODE[3] ^ IS_INMODE_INVERTED_REG[3]); // rv 0
  assign INMODE_in[4] = (INMODE[4] !== 1'bz) && (INMODE[4] ^ IS_INMODE_INVERTED_REG[4]); // rv 0
  assign MULTSIGNIN_in = MULTSIGNIN;
  assign OPMODE_in[0] = (OPMODE[0] !== 1'bz) && (OPMODE[0] ^ IS_OPMODE_INVERTED_REG[0]); // rv 0
  assign OPMODE_in[1] = (OPMODE[1] !== 1'bz) && (OPMODE[1] ^ IS_OPMODE_INVERTED_REG[1]); // rv 0
  assign OPMODE_in[2] = (OPMODE[2] !== 1'bz) && (OPMODE[2] ^ IS_OPMODE_INVERTED_REG[2]); // rv 0
  assign OPMODE_in[3] = (OPMODE[3] !== 1'bz) && (OPMODE[3] ^ IS_OPMODE_INVERTED_REG[3]); // rv 0
  assign OPMODE_in[4] = (OPMODE[4] !== 1'bz) && (OPMODE[4] ^ IS_OPMODE_INVERTED_REG[4]); // rv 0
  assign OPMODE_in[5] = (OPMODE[5] !== 1'bz) && (OPMODE[5] ^ IS_OPMODE_INVERTED_REG[5]); // rv 0
  assign OPMODE_in[6] = (OPMODE[6] !== 1'bz) && (OPMODE[6] ^ IS_OPMODE_INVERTED_REG[6]); // rv 0
  assign OPMODE_in[7] = (OPMODE[7] !== 1'bz) && (OPMODE[7] ^ IS_OPMODE_INVERTED_REG[7]); // rv 0
  assign OPMODE_in[8] = (OPMODE[8] !== 1'bz) && (OPMODE[8] ^ IS_OPMODE_INVERTED_REG[8]); // rv 0
  assign PCIN_in = PCIN;
  assign RSTALLCARRYIN_in = (RSTALLCARRYIN !== 1'bz) && (RSTALLCARRYIN ^ IS_RSTALLCARRYIN_INVERTED_REG); // rv 0
  assign RSTALUMODE_in = (RSTALUMODE !== 1'bz) && (RSTALUMODE ^ IS_RSTALUMODE_INVERTED_REG); // rv 0
  assign RSTA_in = (RSTA !== 1'bz) && (RSTA ^ IS_RSTA_INVERTED_REG); // rv 0
  assign RSTB_in = (RSTB !== 1'bz) && (RSTB ^ IS_RSTB_INVERTED_REG); // rv 0
  assign RSTCTRL_in = (RSTCTRL !== 1'bz) && (RSTCTRL ^ IS_RSTCTRL_INVERTED_REG); // rv 0
  assign RSTC_in = (RSTC !== 1'bz) && (RSTC ^ IS_RSTC_INVERTED_REG); // rv 0
  assign RSTD_in = (RSTD !== 1'bz) && (RSTD ^ IS_RSTD_INVERTED_REG); // rv 0
  assign RSTINMODE_in = (RSTINMODE !== 1'bz) && (RSTINMODE ^ IS_RSTINMODE_INVERTED_REG); // rv 0
  assign RSTM_in = (RSTM !== 1'bz) && (RSTM ^ IS_RSTM_INVERTED_REG); // rv 0
  assign RSTP_in = (RSTP !== 1'bz) && (RSTP ^ IS_RSTP_INVERTED_REG); // rv 0

`ifndef XIL_XECLIB
  reg attr_test;
  reg attr_err;

initial begin
  trig_attr = 1'b0;
`ifdef XIL_ATTR_TEST
  attr_test = 1'b1;
`else
  attr_test = 1'b0;
`endif
  attr_err = 1'b0;
  #1;
  trig_attr = ~trig_attr;
end
`endif

`ifdef XIL_XECLIB
  assign ACASCREG_BIN = ACASCREG_REG[1:0];

  assign ADREG_BIN = ADREG_REG[0];

  assign ALUMODEREG_BIN = ALUMODEREG_REG[0];

  assign AMULTSEL_BIN =
    (AMULTSEL_REG == "A") ? AMULTSEL_A :
    (AMULTSEL_REG == "AD") ? AMULTSEL_AD :
     AMULTSEL_A;

  assign AREG_BIN = AREG_REG[1:0];

  assign AUTORESET_PATDET_BIN =
    (AUTORESET_PATDET_REG == "NO_RESET") ? AUTORESET_PATDET_NO_RESET :
    (AUTORESET_PATDET_REG == "RESET_MATCH") ? AUTORESET_PATDET_RESET_MATCH :
    (AUTORESET_PATDET_REG == "RESET_NOT_MATCH") ? AUTORESET_PATDET_RESET_NOT_MATCH :
     AUTORESET_PATDET_NO_RESET;

  assign AUTORESET_PRIORITY_BIN =
    (AUTORESET_PRIORITY_REG == "RESET") ? AUTORESET_PRIORITY_RESET :
    (AUTORESET_PRIORITY_REG == "CEP") ? AUTORESET_PRIORITY_CEP :
     AUTORESET_PRIORITY_RESET;

  assign A_INPUT_BIN =
    (A_INPUT_REG == "DIRECT") ? A_INPUT_DIRECT :
    (A_INPUT_REG == "CASCADE") ? A_INPUT_CASCADE :
     A_INPUT_DIRECT;

  assign BCASCREG_BIN = BCASCREG_REG[1:0];

  assign BMULTSEL_BIN =
    (BMULTSEL_REG == "B") ? BMULTSEL_B :
    (BMULTSEL_REG == "AD") ? BMULTSEL_AD :
     BMULTSEL_B;

  assign BREG_BIN = BREG_REG[1:0];

  assign B_INPUT_BIN =
    (B_INPUT_REG == "DIRECT") ? B_INPUT_DIRECT :
    (B_INPUT_REG == "CASCADE") ? B_INPUT_CASCADE :
     B_INPUT_DIRECT;

  assign CARRYINREG_BIN = CARRYINREG_REG[0];

  assign CARRYINSELREG_BIN = CARRYINSELREG_REG[0];

  assign CREG_BIN = CREG_REG[0];

  assign DREG_BIN = DREG_REG[0];

  assign INMODEREG_BIN = INMODEREG_REG[0];

  assign MREG_BIN = MREG_REG[0];

  assign OPMODEREG_BIN = OPMODEREG_REG[0];

  assign PREADDINSEL_BIN =
    (PREADDINSEL_REG == "A") ? PREADDINSEL_A :
    (PREADDINSEL_REG == "B") ? PREADDINSEL_B :
     PREADDINSEL_A;

  assign PREG_BIN = PREG_REG[0];

  assign SEL_MASK_BIN =
    (SEL_MASK_REG == "MASK") ? SEL_MASK_MASK :
    (SEL_MASK_REG == "C") ? SEL_MASK_C :
    (SEL_MASK_REG == "ROUNDING_MODE1") ? SEL_MASK_ROUNDING_MODE1 :
    (SEL_MASK_REG == "ROUNDING_MODE2") ? SEL_MASK_ROUNDING_MODE2 :
     SEL_MASK_MASK;

  assign SEL_PATTERN_BIN =
    (SEL_PATTERN_REG == "PATTERN") ? SEL_PATTERN_PATTERN :
    (SEL_PATTERN_REG == "C") ? SEL_PATTERN_C :
     SEL_PATTERN_PATTERN;

  assign USE_MULT_BIN =
    (USE_MULT_REG == "MULTIPLY") ? USE_MULT_MULTIPLY :
    (USE_MULT_REG == "DYNAMIC") ? USE_MULT_DYNAMIC :
    (USE_MULT_REG == "NONE") ? USE_MULT_NONE :
     USE_MULT_MULTIPLY;

  assign USE_PATTERN_DETECT_BIN =
    (USE_PATTERN_DETECT_REG == "NO_PATDET") ? USE_PATTERN_DETECT_NO_PATDET :
    (USE_PATTERN_DETECT_REG == "PATDET") ? USE_PATTERN_DETECT_PATDET :
     USE_PATTERN_DETECT_NO_PATDET;

  assign USE_SIMD_BIN =
    (USE_SIMD_REG == "ONE48") ? USE_SIMD_ONE48 :
    (USE_SIMD_REG == "FOUR12") ? USE_SIMD_FOUR12 :
    (USE_SIMD_REG == "TWO24") ? USE_SIMD_TWO24 :
     USE_SIMD_ONE48;

  assign USE_WIDEXOR_BIN =
    (USE_WIDEXOR_REG == "FALSE") ? USE_WIDEXOR_FALSE :
    (USE_WIDEXOR_REG == "TRUE") ? USE_WIDEXOR_TRUE :
     USE_WIDEXOR_FALSE;

  assign XORSIMD_BIN =
    (XORSIMD_REG == "XOR24_48_96") ? XORSIMD_XOR24_48_96 :
    (XORSIMD_REG == "XOR12") ? XORSIMD_XOR12 :
     XORSIMD_XOR24_48_96;

`else
always @(trig_attr) begin
#1;
  ACASCREG_BIN = ACASCREG_REG[1:0];

  ADREG_BIN = ADREG_REG[0];

  ALUMODEREG_BIN = ALUMODEREG_REG[0];

  AMULTSEL_BIN =
    (AMULTSEL_REG == "A") ? AMULTSEL_A :
    (AMULTSEL_REG == "AD") ? AMULTSEL_AD :
     AMULTSEL_A;

  AREG_BIN = AREG_REG[1:0];

  AUTORESET_PATDET_BIN =
    (AUTORESET_PATDET_REG == "NO_RESET") ? AUTORESET_PATDET_NO_RESET :
    (AUTORESET_PATDET_REG == "RESET_MATCH") ? AUTORESET_PATDET_RESET_MATCH :
    (AUTORESET_PATDET_REG == "RESET_NOT_MATCH") ? AUTORESET_PATDET_RESET_NOT_MATCH :
     AUTORESET_PATDET_NO_RESET;

  AUTORESET_PRIORITY_BIN =
    (AUTORESET_PRIORITY_REG == "RESET") ? AUTORESET_PRIORITY_RESET :
    (AUTORESET_PRIORITY_REG == "CEP") ? AUTORESET_PRIORITY_CEP :
     AUTORESET_PRIORITY_RESET;

  A_INPUT_BIN =
    (A_INPUT_REG == "DIRECT") ? A_INPUT_DIRECT :
    (A_INPUT_REG == "CASCADE") ? A_INPUT_CASCADE :
     A_INPUT_DIRECT;

  BCASCREG_BIN = BCASCREG_REG[1:0];

  BMULTSEL_BIN =
    (BMULTSEL_REG == "B") ? BMULTSEL_B :
    (BMULTSEL_REG == "AD") ? BMULTSEL_AD :
     BMULTSEL_B;

  BREG_BIN = BREG_REG[1:0];

  B_INPUT_BIN =
    (B_INPUT_REG == "DIRECT") ? B_INPUT_DIRECT :
    (B_INPUT_REG == "CASCADE") ? B_INPUT_CASCADE :
     B_INPUT_DIRECT;

  CARRYINREG_BIN = CARRYINREG_REG[0];

  CARRYINSELREG_BIN = CARRYINSELREG_REG[0];

  CREG_BIN = CREG_REG[0];

  DREG_BIN = DREG_REG[0];

  INMODEREG_BIN = INMODEREG_REG[0];

  MREG_BIN = MREG_REG[0];

  OPMODEREG_BIN = OPMODEREG_REG[0];

  PREADDINSEL_BIN =
    (PREADDINSEL_REG == "A") ? PREADDINSEL_A :
    (PREADDINSEL_REG == "B") ? PREADDINSEL_B :
     PREADDINSEL_A;

  PREG_BIN = PREG_REG[0];

  SEL_MASK_BIN =
    (SEL_MASK_REG == "MASK") ? SEL_MASK_MASK :
    (SEL_MASK_REG == "C") ? SEL_MASK_C :
    (SEL_MASK_REG == "ROUNDING_MODE1") ? SEL_MASK_ROUNDING_MODE1 :
    (SEL_MASK_REG == "ROUNDING_MODE2") ? SEL_MASK_ROUNDING_MODE2 :
     SEL_MASK_MASK;

  SEL_PATTERN_BIN =
    (SEL_PATTERN_REG == "PATTERN") ? SEL_PATTERN_PATTERN :
    (SEL_PATTERN_REG == "C") ? SEL_PATTERN_C :
     SEL_PATTERN_PATTERN;

  USE_MULT_BIN =
    (USE_MULT_REG == "MULTIPLY") ? USE_MULT_MULTIPLY :
    (USE_MULT_REG == "DYNAMIC") ? USE_MULT_DYNAMIC :
    (USE_MULT_REG == "NONE") ? USE_MULT_NONE :
     USE_MULT_MULTIPLY;

  USE_PATTERN_DETECT_BIN =
    (USE_PATTERN_DETECT_REG == "NO_PATDET") ? USE_PATTERN_DETECT_NO_PATDET :
    (USE_PATTERN_DETECT_REG == "PATDET") ? USE_PATTERN_DETECT_PATDET :
     USE_PATTERN_DETECT_NO_PATDET;

  USE_SIMD_BIN =
    (USE_SIMD_REG == "ONE48") ? USE_SIMD_ONE48 :
    (USE_SIMD_REG == "FOUR12") ? USE_SIMD_FOUR12 :
    (USE_SIMD_REG == "TWO24") ? USE_SIMD_TWO24 :
     USE_SIMD_ONE48;

  USE_WIDEXOR_BIN =
    (USE_WIDEXOR_REG == "FALSE") ? USE_WIDEXOR_FALSE :
    (USE_WIDEXOR_REG == "TRUE") ? USE_WIDEXOR_TRUE :
     USE_WIDEXOR_FALSE;

  XORSIMD_BIN =
    (XORSIMD_REG == "XOR24_48_96") ? XORSIMD_XOR24_48_96 :
    (XORSIMD_REG == "XOR12") ? XORSIMD_XOR12 :
     XORSIMD_XOR24_48_96;

end
`endif

`ifndef XIL_XECLIB
  always @(trig_attr) begin
  #1;
    if ((attr_test == 1'b1) ||
        ((ACASCREG_REG != 1) &&
         (ACASCREG_REG != 0) &&
         (ACASCREG_REG != 2))) begin
      $display("Error: [Unisim %s-101] ACASCREG attribute is set to %d.  Legal values for this attribute are 1, 0 or 2. Instance: %m", MODULE_NAME, ACASCREG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((ADREG_REG != 1) &&
         (ADREG_REG != 0))) begin
      $display("Error: [Unisim %s-102] ADREG attribute is set to %d.  Legal values for this attribute are 1 or 0. Instance: %m", MODULE_NAME, ADREG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((ALUMODEREG_REG != 1) &&
         (ALUMODEREG_REG != 0))) begin
      $display("Error: [Unisim %s-103] ALUMODEREG attribute is set to %d.  Legal values for this attribute are 1 or 0. Instance: %m", MODULE_NAME, ALUMODEREG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((AMULTSEL_REG != "A") &&
         (AMULTSEL_REG != "AD"))) begin
      $display("Error: [Unisim %s-104] AMULTSEL attribute is set to %s.  Legal values for this attribute are A or AD. Instance: %m", MODULE_NAME, AMULTSEL_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((AREG_REG != 1) &&
         (AREG_REG != 0) &&
         (AREG_REG != 2))) begin
      $display("Error: [Unisim %s-105] AREG attribute is set to %d.  Legal values for this attribute are 1, 0 or 2. Instance: %m", MODULE_NAME, AREG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((AUTORESET_PATDET_REG != "NO_RESET") &&
         (AUTORESET_PATDET_REG != "RESET_MATCH") &&
         (AUTORESET_PATDET_REG != "RESET_NOT_MATCH"))) begin
      $display("Error: [Unisim %s-106] AUTORESET_PATDET attribute is set to %s.  Legal values for this attribute are NO_RESET, RESET_MATCH or RESET_NOT_MATCH. Instance: %m", MODULE_NAME, AUTORESET_PATDET_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((AUTORESET_PRIORITY_REG != "RESET") &&
         (AUTORESET_PRIORITY_REG != "CEP"))) begin
      $display("Error: [Unisim %s-107] AUTORESET_PRIORITY attribute is set to %s.  Legal values for this attribute are RESET or CEP. Instance: %m", MODULE_NAME, AUTORESET_PRIORITY_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((A_INPUT_REG != "DIRECT") &&
         (A_INPUT_REG != "CASCADE"))) begin
      $display("Error: [Unisim %s-108] A_INPUT attribute is set to %s.  Legal values for this attribute are DIRECT or CASCADE. Instance: %m", MODULE_NAME, A_INPUT_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((BCASCREG_REG != 1) &&
         (BCASCREG_REG != 0) &&
         (BCASCREG_REG != 2))) begin
      $display("Error: [Unisim %s-109] BCASCREG attribute is set to %d.  Legal values for this attribute are 1, 0 or 2. Instance: %m", MODULE_NAME, BCASCREG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((BMULTSEL_REG != "B") &&
         (BMULTSEL_REG != "AD"))) begin
      $display("Error: [Unisim %s-110] BMULTSEL attribute is set to %s.  Legal values for this attribute are B or AD. Instance: %m", MODULE_NAME, BMULTSEL_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((BREG_REG != 1) &&
         (BREG_REG != 0) &&
         (BREG_REG != 2))) begin
      $display("Error: [Unisim %s-111] BREG attribute is set to %d.  Legal values for this attribute are 1, 0 or 2. Instance: %m", MODULE_NAME, BREG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((B_INPUT_REG != "DIRECT") &&
         (B_INPUT_REG != "CASCADE"))) begin
      $display("Error: [Unisim %s-112] B_INPUT attribute is set to %s.  Legal values for this attribute are DIRECT or CASCADE. Instance: %m", MODULE_NAME, B_INPUT_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((CARRYINREG_REG != 1) &&
         (CARRYINREG_REG != 0))) begin
      $display("Error: [Unisim %s-113] CARRYINREG attribute is set to %d.  Legal values for this attribute are 1 or 0. Instance: %m", MODULE_NAME, CARRYINREG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((CARRYINSELREG_REG != 1) &&
         (CARRYINSELREG_REG != 0))) begin
      $display("Error: [Unisim %s-114] CARRYINSELREG attribute is set to %d.  Legal values for this attribute are 1 or 0. Instance: %m", MODULE_NAME, CARRYINSELREG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((CREG_REG != 1) &&
         (CREG_REG != 0))) begin
      $display("Error: [Unisim %s-115] CREG attribute is set to %d.  Legal values for this attribute are 1 or 0. Instance: %m", MODULE_NAME, CREG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((DREG_REG != 1) &&
         (DREG_REG != 0))) begin
      $display("Error: [Unisim %s-116] DREG attribute is set to %d.  Legal values for this attribute are 1 or 0. Instance: %m", MODULE_NAME, DREG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INMODEREG_REG != 1) &&
         (INMODEREG_REG != 0))) begin
      $display("Error: [Unisim %s-117] INMODEREG attribute is set to %d.  Legal values for this attribute are 1 or 0. Instance: %m", MODULE_NAME, INMODEREG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((MREG_REG != 1) &&
         (MREG_REG != 0))) begin
      $display("Error: [Unisim %s-134] MREG attribute is set to %d.  Legal values for this attribute are 1 or 0. Instance: %m", MODULE_NAME, MREG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((OPMODEREG_REG != 1) &&
         (OPMODEREG_REG != 0))) begin
      $display("Error: [Unisim %s-135] OPMODEREG attribute is set to %d.  Legal values for this attribute are 1 or 0. Instance: %m", MODULE_NAME, OPMODEREG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((PREADDINSEL_REG != "A") &&
         (PREADDINSEL_REG != "B"))) begin
      $display("Error: [Unisim %s-137] PREADDINSEL attribute is set to %s.  Legal values for this attribute are A or B. Instance: %m", MODULE_NAME, PREADDINSEL_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((PREG_REG != 1) &&
         (PREG_REG != 0))) begin
      $display("Error: [Unisim %s-138] PREG attribute is set to %d.  Legal values for this attribute are 1 or 0. Instance: %m", MODULE_NAME, PREG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((SEL_MASK_REG != "MASK") &&
         (SEL_MASK_REG != "C") &&
         (SEL_MASK_REG != "ROUNDING_MODE1") &&
         (SEL_MASK_REG != "ROUNDING_MODE2"))) begin
      $display("Error: [Unisim %s-140] SEL_MASK attribute is set to %s.  Legal values for this attribute are MASK, C, ROUNDING_MODE1 or ROUNDING_MODE2. Instance: %m", MODULE_NAME, SEL_MASK_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((SEL_PATTERN_REG != "PATTERN") &&
         (SEL_PATTERN_REG != "C"))) begin
      $display("Error: [Unisim %s-141] SEL_PATTERN attribute is set to %s.  Legal values for this attribute are PATTERN or C. Instance: %m", MODULE_NAME, SEL_PATTERN_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((USE_MULT_REG != "MULTIPLY") &&
         (USE_MULT_REG != "DYNAMIC") &&
         (USE_MULT_REG != "NONE"))) begin
      $display("Error: [Unisim %s-142] USE_MULT attribute is set to %s.  Legal values for this attribute are MULTIPLY, DYNAMIC or NONE. Instance: %m", MODULE_NAME, USE_MULT_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((USE_PATTERN_DETECT_REG != "NO_PATDET") &&
         (USE_PATTERN_DETECT_REG != "PATDET"))) begin
      $display("Error: [Unisim %s-143] USE_PATTERN_DETECT attribute is set to %s.  Legal values for this attribute are NO_PATDET or PATDET. Instance: %m", MODULE_NAME, USE_PATTERN_DETECT_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((USE_SIMD_REG != "ONE48") &&
         (USE_SIMD_REG != "FOUR12") &&
         (USE_SIMD_REG != "TWO24"))) begin
      $display("Error: [Unisim %s-144] USE_SIMD attribute is set to %s.  Legal values for this attribute are ONE48, FOUR12 or TWO24. Instance: %m", MODULE_NAME, USE_SIMD_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((USE_WIDEXOR_REG != "FALSE") &&
         (USE_WIDEXOR_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-145] USE_WIDEXOR attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, USE_WIDEXOR_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((XORSIMD_REG != "XOR24_48_96") &&
         (XORSIMD_REG != "XOR12"))) begin
      $display("Error: [Unisim %s-146] XORSIMD attribute is set to %s.  Legal values for this attribute are XOR24_48_96 or XOR12. Instance: %m", MODULE_NAME, XORSIMD_REG);
      attr_err = 1'b1;
    end

    if (attr_err == 1'b1) #1 $finish;
  end
`endif

// begin behavioral model

  always @(trig_attr) begin
    #1;
    case (AREG_REG)
      0, 1 : if (AREG_REG != ACASCREG_REG) begin
      $display("Error: [Unisim %s-2] AREG attribute is set to %0d and ACASCREG attribute is set to %0d. When AREG is 0 or 1, ACASCREG must be set to the same value. Instance: %m", MODULE_NAME, AREG_REG, ACASCREG_REG);
        attr_err = 1'b1;
        end
      2 : if (ACASCREG_REG == 0) begin
      $display("Error: [Unisim %s-3] AREG attribute is set to %0d and ACASCREG attribute is set to %0d. When AREG is 2, ACASCREG must be set to 1 or 2. Instance: %m", MODULE_NAME, AREG_REG, ACASCREG_REG);
        attr_err = 1'b1;
        end
    endcase

    case (BREG_REG)
      0, 1 : if (BREG_REG != BCASCREG_REG) begin
      $display("Error: [Unisim %s-4] BREG attribute is set to %0d and BCASCREG attribute is set to %0d. When BREG is 0 or 1, BCASCREG must be set to the same value. Instance: %m", MODULE_NAME, BREG_REG, BCASCREG_REG);
        attr_err = 1'b1;
        end
      2 : if (BCASCREG_REG == 0) begin
      $display("Error: [Unisim %s-5] BREG attribute is set to %0d and BCASCREG attribute is set to %0d. When BREG is 2, BCASCREG must be set to 1 or 2. Instance: %m", MODULE_NAME, BREG_REG, BCASCREG_REG);
        attr_err = 1'b1;
        end
    endcase

    if (attr_err == 1'b1) #1 $finish;
  end

  always @(trig_attr) begin
    #1;
    if ((USE_MULT_REG == "NONE") && (MREG_REG !== 0)) begin
        $display("Error : [Unisim %s-6] : Attribute USE_MULT is set to \"NONE\" and MREG is set to %d. MREG must be set to 0 when the multiplier is not used. Instance %m", MODULE_NAME, MREG_REG);
        attr_err = 1'b1;
    end

  if (attr_err == 1'b1) #1 $finish;
  end

// Connections between atoms
  wire [44:0] U_DATA;
  wire [44:0] V_DATA;
  reg [26:0] A2A1;
  reg [17:0] B2B1;
  wire AMULT26_in;
  wire BMULT17_in;
  wire ALUMODE10_in;
  wire CCOUT_in;
  wire MULTSIGN_ALU_in;
  wire P_FDBK_47_in;
  wire [26:0] AD_DATA;
  wire [26:0] AD_in;
  wire [26:0] D_DATA;
  wire [26:0] PREADD_AB;
  wire [3:0] COUT_in;
  wire [44:0] U_in;
  wire [44:0] V_in;
  wire [44:0] U_DATA_in;
  wire [44:0] V_DATA_in;
  wire [47:0] ALU_OUT_in;
  wire [47:0] C_DATA_in;
  wire [47:0] P_FDBK_in;
  wire [7:0] XOR_MX_in;

// DSP_ALU wires
  localparam MAX_ALU_FULL   = 48;
  localparam MAX_CARRYOUT   = 4;
  localparam A_WIDTH   = 30;
  localparam B_WIDTH   = 18;
  localparam C_WIDTH   = 48;
  localparam D_WIDTH   = 27;
  localparam M_WIDTH   = 45;
  localparam P_WIDTH   = 48;
  reg cci_drc_msg;
  reg cis_drc_msg;


  wire CARRYIN_mux;
  reg CARRYIN_reg;
  reg [3:0] ALUMODE_reg;
  reg [2:0] CARRYINSEL_mux;
  reg [2:0] CARRYINSEL_reg;
  reg [8:0] OPMODE_mux;
  reg [8:0] OPMODE_reg;

  wire [47:0] x_mac_cascd;
  
  reg [47:0] wmux;
  reg [47:0] xmux;
  reg [47:0] ymux;
  reg [47:0] zmux;
  wire [47:0] z_optinv;
  
  wire cin;
  reg cin_b;
  wire rst_carryin_g;
  reg qmultcarryin;

  wire c_mult;
  wire ce_m_g;
  wire d_carryin_int;
  wire dr_carryin_int;
  wire multcarryin_data;

  reg invalid_opmode;
  reg opmode_valid_flag_dal; // used in OPMODE DRC
  reg ping_opmode_drc_check;

  wire [MAX_ALU_FULL-1:0] co;
  wire [MAX_ALU_FULL-1:0] s;
  wire [MAX_ALU_FULL-1:0] comux;
  wire [MAX_ALU_FULL-1:0] comux_w;
  wire [MAX_ALU_FULL-1:0] comux4simd;
  wire [MAX_ALU_FULL-1:0] smux;
  wire [MAX_ALU_FULL-1:0] smux_w;
  wire [MAX_ALU_FULL:0] a_int;
  wire [12:0] s0;
  wire cout0;
  wire intc1;
  wire co12_lsb;
  wire [12:0] s1;
  wire cout1;
  wire intc2;
  wire co24_lsb;
  wire [12:0] s2;
  wire cout2;
  wire intc3;
  wire co36_lsb;
  wire [13:0] s3;
  wire cout3;
  wire cout4;
  wire xor_12a;
  wire xor_12b;
  wire xor_12c;
  wire xor_12d;
  wire xor_12e;
  wire xor_12f;
  wire xor_12g;
  wire xor_12h;
  wire xor_24a;
  wire xor_24b;
  wire xor_24c;
  wire xor_24d;
  wire xor_48a;
  wire xor_48b;
  wire xor_96;
  wire cout_0;
  wire cout_1;
  wire cout_2;
  wire cout_3;
  wire mult_or_logic;

// DSP_A_B_DATA wires
  reg [29:0] A1_reg;
  reg [29:0] A2_reg;
  wire [A_WIDTH-1:0] A_ALU;
  reg [17:0] B2_reg;
  reg [B_WIDTH-1:0] B1_DATA_out;
  wire [B_WIDTH-1:0] B2_DATA;
  wire [B_WIDTH-1:0] B_ALU;

// DSP_C_DATA wires
  reg [C_WIDTH-1:0] C_reg;

// DSP_MULTIPLIER wires
  reg [17:0] b_mult_mux;
  reg [26:0] a_mult_mux;
  reg [M_WIDTH-1:0] mult;
  reg [M_WIDTH-2:0] ps_u_mask;
  reg [M_WIDTH-2:0] ps_v_mask;

// DSP_M_DATA wires
  reg [M_WIDTH-1:0] U_DATA_reg;
  reg [M_WIDTH-1:0] V_DATA_reg;

// DSP_OUTPUT wires
  wire the_auto_reset_patdet;
  wire auto_reset_pri;
  wire [47:0] the_mask;
  wire [47:0] the_pattern;
  reg opmode_valid_flag_dou = 1'b1; // TODO

  reg [3:0] COUT_reg;
  reg ALUMODE10_reg;
  wire ALUMODE10_mux;
  reg MULTSIGN_ALU_reg;
  reg [47:0] ALU_OUT_reg;
  reg [7:0] XOR_MX_reg;

  wire pdet_o;
  wire pdetb_o;
  wire pdet_o_mux;
  wire pdetb_o_mux;
  wire overflow_data;
  wire underflow_data;
  reg  pdet_o_reg1;
  reg  pdet_o_reg2;
  reg  pdetb_o_reg1;
  reg  pdetb_o_reg2;

// DSP_PREADD wires
  wire [26:0] D_DATA_mux;

// DSP_PREADD_DATA wires
  wire [4:0] INMODE_mux;
  reg [4:0]  INMODE_reg;
  reg [D_WIDTH-1:0] AD_DATA_reg;
  reg [D_WIDTH-1:0] D_DATA_reg;

// atom interconnect
  assign U_DATA_in = (USE_SIMD_BIN == USE_SIMD_ONE48) ? U_DATA : 45'h100000000000;
  assign V_DATA_in = (USE_SIMD_BIN == USE_SIMD_ONE48) ? V_DATA : 45'h100000000000;
  reg [3:0] ALUMODE_DATA;
  reg DREG_INT;
  reg ADREG_INT;


// initialize regs
`ifndef XIL_XECLIB
initial begin
  cci_drc_msg = 1'b0;
  cis_drc_msg = 1'b0;
  CARRYIN_reg = 1'b0;
  ALUMODE_reg = 4'b0;
  CARRYINSEL_mux = 3'b0;
  CARRYINSEL_reg = 3'b0;
  OPMODE_mux = 9'b0;
  OPMODE_reg = 9'b0;
  wmux = 48'b0;
  xmux = 48'b0;
  ymux = 48'b0;
  zmux = 48'b0;
  cin_b = 1'b0;
  qmultcarryin = 1'b0;
  invalid_opmode = 1'b1;
  opmode_valid_flag_dal = 1'b1;
  ping_opmode_drc_check = 1'b0;
  A1_reg = 30'b0;
  A2_reg = 30'b0;
  B2_reg = 18'b0;
  B1_DATA_out = {B_WIDTH{1'b0}};
  C_reg = {C_WIDTH{1'b0}};
  ps_u_mask = 44'h55555555555;
  ps_v_mask = 44'haaaaaaaaaaa;
  U_DATA_reg = {1'b0, {M_WIDTH-1{1'b0}}};
  V_DATA_reg = {1'b0, {M_WIDTH-1{1'b0}}};
  COUT_reg = 4'b0000;
  ALUMODE10_reg = 1'b0;
  MULTSIGN_ALU_reg = 1'b0;
  ALU_OUT_reg = 48'b0;
  XOR_MX_reg = 8'b0;
  pdet_o_reg1 = 1'b0;
  pdet_o_reg2 = 1'b0;
  pdetb_o_reg1 = 1'b0;
  pdetb_o_reg2 = 1'b0;
  INMODE_reg = 5'b0;
  AD_DATA_reg = {D_WIDTH{1'b0}};
  D_DATA_reg = {D_WIDTH{1'b0}};
end
`endif

// DSP_ALU
//*** W mux NB
  always @(OPMODE_mux[8:7] or P_FDBK_in or RND_REG or C_DATA_in)
     case (OPMODE_mux[8:7])
          2'b00 : wmux = 48'b0;
          2'b01 : wmux = P_FDBK_in;
          2'b10 : wmux = RND_REG;
          2'b11 : wmux = C_DATA_in;
        default : wmux = {48{1'bx}};
    endcase

// To support MAC-cascade add multsignin to bit 1 of X
  assign x_mac_cascd = (OPMODE_mux[6:4] == 3'b100) ? {{46{1'b0}},MULTSIGNIN_in,1'b0} : {48{1'b0}};

//*** X mux NB
  always @(U_DATA_in or P_FDBK_in or A_ALU or B_ALU or OPMODE_mux[1:0] or x_mac_cascd)
	  case (OPMODE_mux[1:0])
          2'b00 : xmux = x_mac_cascd;
          2'b01 : xmux = {{3{U_DATA_in[44]}}, U_DATA_in};
          2'b10 : xmux = P_FDBK_in;
          2'b11 : xmux = {A_ALU, B_ALU};
        default : xmux = {48{1'bx}};
	  endcase

//*** Y mux NB
  always @(OPMODE_mux[3:2] or V_DATA_in or C_DATA_in)
	  case (OPMODE_mux[3:2])
          2'b00 : ymux = 48'b0;
          2'b01 : ymux = {{3{1'b0}}, V_DATA_in};
          2'b10 : ymux = {48{1'b1}};
          2'b11 : ymux = C_DATA_in;
        default : ymux = {48{1'bx}};
     endcase

//*** Z mux NB
  always @(OPMODE_mux[6:4] or PCIN_in or P_FDBK_in or C_DATA_in or P_FDBK_47_in)
	  casex (OPMODE_mux[6:4])
         3'b000 : zmux = 48'b0;
         3'b001 : zmux = PCIN_in;
         3'b010 : zmux = P_FDBK_in;
         3'b011 : zmux = C_DATA_in;
         3'b100 : zmux = P_FDBK_in;
         3'b101 : zmux = {{9{PCIN_in[47]}},  {8{PCIN_in[47]}},   PCIN_in[47:17]};
         3'b11x : zmux = {{9{P_FDBK_47_in}}, {8{P_FDBK_in[47]}}, P_FDBK_in[47:17]};
        default : zmux = {48{1'bx}};
     endcase

//*********************************************************
//*** CARRYINSEL and OPMODE with 1 level of register
//*********************************************************
    always @(posedge CLK_in) begin
	   if (RSTCTRL_in || glblGSR) begin
         OPMODE_reg <= 9'b0;
	   end  
	   else if (CECTRL_in) begin
         OPMODE_reg <= OPMODE_in;
	   end
    end

    always @(posedge CLK_in) begin
	   if (RSTCTRL_in || glblGSR) begin
         CARRYINSEL_reg <= 3'b0;
	   end  
	   else if (CECTRL_in) begin
         CARRYINSEL_reg <= CARRYINSEL_in;
	   end
    end

    always @(*) CARRYINSEL_mux = (CARRYINSELREG_BIN == 1'b1) ?  CARRYINSEL_reg : CARRYINSEL_in;

    always @(*) begin
      if (OPMODEREG_BIN == 1'b1) OPMODE_mux = OPMODE_reg;
      else OPMODE_mux = OPMODE_in;
    end

    always @(CARRYINSEL_mux or CARRYCASCIN_in or MULTSIGNIN_in or OPMODE_mux) begin
      if (CARRYINSEL_mux == 3'b010) begin 
        if (!((MULTSIGNIN_in === 1'bx) || (cci_drc_msg == 1'b1) ||
             ((OPMODE_mux == 9'b001001000) && !(MULTSIGNIN_in === 1'bx)) ||
             ((MULTSIGNIN_in == 1'b0) && (CARRYCASCIN_in == 1'b0)))) begin
	       $display("DRC warning : [Unisim %s-7] CARRYCASCIN can only be used in the current %s if the previous %s is performing a two input ADD or SUBRTACT operation or the current %s is configured in the MAC extend opmode 7'b1001000 at %.3f ns. Instance %m\n", MODULE_NAME, MODULE_NAME, MODULE_NAME, MODULE_NAME, $time/1000.0);
// CR 619940 -- Enhanced DRC warning
          $display("The simulation model does not know the placement of the %s slices used, so it cannot fully confirm the above warning. It is necessary to view the placement of the %s slices and ensure that these warnings are not being breached\n", MODULE_NAME, MODULE_NAME);
          cci_drc_msg = 1'b1;
        end  
        if (!((MULTSIGNIN_in === 1'bx) || (OPMODE_mux[3:0] != 4'b0101))) begin
          $display("DRC warning : [Unisim %s-10] CARRYINSEL is set to 010 with OPMODE set to multiplication (xxx0101). This is an illegal mode and may show deviation between simulation results and hardware behavior. %s instance %m at %.3f ns.", MODULE_NAME, MODULE_NAME, $time/1000.0);
        end
        if (!((MULTSIGNIN_in === 1'bx) || (cis_drc_msg == 1'b1) ||
             (OPMODEREG_BIN == 1'b1))) begin
          $display("DRC warning : [Unisim %s-11] CARRYINSEL is set to 010 with OPMODEREG set to 0. This causes unknown values after reset occurs. It is suggested to use OPMODEREG = 1 when cascading large adders. %s instance %m at %.3f ns.", MODULE_NAME, MODULE_NAME, $time/1000.0);
          cis_drc_msg = 1'b1;
        end
      end  
    end 

//*********************************************************
//*** ALUMODE with 1 level of register
//*********************************************************
    always @(posedge CLK_in) begin
	    if (RSTALUMODE_in || glblGSR)
          ALUMODE_reg <= 4'b0;
	    else if (CEALUMODE_in)
          ALUMODE_reg <= ALUMODE_in;
       end

    always @(*) ALUMODE_DATA = (ALUMODEREG_BIN == 1'b1) ? ALUMODE_reg : ALUMODE_in;

//------------------------------------------------------------------
//*** DRC for OPMODE
//------------------------------------------------------------------

// needs PREG from output block
// ~2000 lines code - skip for now - copy/rework from DSP48E1.

//--####################################################################
//--#####                         ALU                              #####
//--####################################################################

// ADDSUB block - first stage of ALU develops sums and carries for Final Adder
// Invert Z for subtract operation using alumode<0>
  assign z_optinv = {48{ALUMODE_DATA[0]}} ^ zmux;

// Add W, X, Y, Z carry-save style; basically full adder logic below
  assign co = ((xmux & ymux)|(z_optinv & ymux)|(xmux & z_optinv));
// s has a fan-out of 2 (1) FA with W (2) second leg of XOR tree
  assign s  = (z_optinv^xmux^ymux);

// Mux S and CO to do 2 operands logic operations
// S = produce XOR/XNOR, NOT functions
// CO = produce AND/NAND, OR/NOR functions
  assign comux = ALUMODE_DATA[2] ? 0  : co;
  assign smux =  ALUMODE_DATA[3] ? co : s;

// Carry mux to handle SIMD mode 
// SIMD must be used here since addition of W requires carry propogation
  assign comux4simd = {
              comux[47:36],
              comux[35]&&(USE_SIMD_BIN != USE_SIMD_FOUR12),
              comux[34:24],
              comux[23]&&(USE_SIMD_BIN == USE_SIMD_ONE48),
              comux[22:12],
              comux[11]&&(USE_SIMD_BIN != USE_SIMD_FOUR12),
              comux[10:0]
            };

// FA to combine W-mux with s and co
// comux must be shifted to properly reflect carry operation
  assign smux_w  =   smux ^ {comux4simd[46:0],1'b0} ^ wmux;
  assign comux_w = ((smux & {comux4simd[46:0],1'b0}) |
                    (wmux & {comux4simd[46:0],1'b0}) |
                    (smux & wmux));

// alumode10 indicates a subtraction, used to correct carryout polarity
  assign ALUMODE10_in  = (ALUMODE_DATA[0] & ALUMODE_DATA[1]);

// prepare data for Final Adder
// a[0] is in fact the cin bit, adder inputs: a[48:1], b[47:0], cin= a[0]
  assign a_int = {comux_w, cin};
//  assign b_int = smux_w;

// FINAL ADDER - second stage develops final sums and carries 
  assign s0        = a_int[11:0] + smux_w[11:0];
  // invert if alumode10
  assign cout0     = ALUMODE10_in  ^ (a_int[12] ^ s0[12] ^ comux[11]);

  // internal carry is zero'd out on mc_simd == 1
  assign intc1     = (USE_SIMD_BIN != USE_SIMD_FOUR12) && s0[12];
  // next lsb is zero'd out on mc_simd == 1
  assign co12_lsb  = (USE_SIMD_BIN != USE_SIMD_FOUR12) && a_int[12];
  //
  assign s1        = {a_int[23:13],co12_lsb} + smux_w[23:12] + intc1;
  assign cout1     = ALUMODE10_in  ^ (a_int[24] ^ s1[12] ^ comux[23]);
  assign intc2     = (USE_SIMD_BIN == USE_SIMD_ONE48) && s1[12];
  assign co24_lsb  = (USE_SIMD_BIN == USE_SIMD_ONE48) && a_int[24];
  //
  assign s2        = {a_int[35:25],co24_lsb} + smux_w[35:24] + intc2;
  assign cout2     = ALUMODE10_in  ^ (a_int[36] ^ s2[12] ^ comux[35]);
  assign intc3     = (USE_SIMD_BIN != USE_SIMD_FOUR12) && s2[12];
  assign co36_lsb  = (USE_SIMD_BIN != USE_SIMD_FOUR12) && a_int[36];
  //
  assign s3        = {a_int[48:37],co36_lsb} + {comux4simd[47],smux_w[47:36]} + intc3;
  assign cout3     = ALUMODE10_in  ^ s3[12];

// Not gated with alumode10 since used to propogate carry in wide multiply
  assign cout4     = s3[13];

// Wide XOR
  assign xor_12a = USE_WIDEXOR_BIN ? ^s[5:0] : 0;
  assign xor_12b = USE_WIDEXOR_BIN ? ^s[11:6] : 0;
  assign xor_12c = USE_WIDEXOR_BIN ? ^s[17:12] : 0;
  assign xor_12d = USE_WIDEXOR_BIN ? ^s[23:18] : 0;
  assign xor_12e = USE_WIDEXOR_BIN ? ^s[29:24] : 0;
  assign xor_12f = USE_WIDEXOR_BIN ? ^s[35:30] : 0;
  assign xor_12g = USE_WIDEXOR_BIN ? ^s[41:36] : 0;
  assign xor_12h = USE_WIDEXOR_BIN ? ^s[47:42] : 0;

  assign xor_24a = xor_12a ^ xor_12b;
  assign xor_24b = xor_12c ^ xor_12d;
  assign xor_24c = xor_12e ^ xor_12f;
  assign xor_24d = xor_12g ^ xor_12h;

  assign xor_48a = xor_24a ^ xor_24b;
  assign xor_48b = xor_24c ^ xor_24d;

  assign xor_96 = xor_48a ^ xor_48b;

//  "X" carryout for multiply and logic operations
  assign mult_or_logic = ((OPMODE_mux[3:0] == 4'b0101) ||
                          (ALUMODE_DATA[3:2] != 2'b00));
// allow carrycascout to not X in output atom
//  assign cout_3 = mult_or_logic ? 1'bx : cout3;
  assign cout_3 =                        cout3;
  assign cout_2 = mult_or_logic ? 1'bx : cout2;
  assign cout_1 = mult_or_logic ? 1'bx : cout1;
  assign cout_0 = mult_or_logic ? 1'bx : cout0;
// drive signals to Output Atom
  assign COUT_in[3] =                                     cout_3;
  assign COUT_in[2] = (USE_SIMD_BIN == USE_SIMD_FOUR12) ? cout_2 : 1'bx;
  assign COUT_in[1] = (USE_SIMD_BIN != USE_SIMD_ONE48 ) ? cout_1 : 1'bx;
  assign COUT_in[0] = (USE_SIMD_BIN == USE_SIMD_FOUR12) ? cout_0 : 1'bx;
  assign MULTSIGN_ALU_in  = s3[13]; // from alu rtl but doesn't seem right
  assign #1 ALU_OUT_in = {48{ALUMODE_DATA[1]}} ^ {s3[11:0],s2[11:0],s1[11:0],s0[11:0]}; // break 0 delay feedback
  assign XOR_MX_in[0] = XORSIMD_BIN ? xor_12a : xor_24a;
  assign XOR_MX_in[1] = XORSIMD_BIN ? xor_12b : xor_48a;
  assign XOR_MX_in[2] = XORSIMD_BIN ? xor_12c : xor_24b;
  assign XOR_MX_in[3] = XORSIMD_BIN ? xor_12d : xor_96;
  assign XOR_MX_in[4] = XORSIMD_BIN ? xor_12e : xor_24c;
  assign XOR_MX_in[5] = XORSIMD_BIN ? xor_12f : xor_48b;
  assign XOR_MX_in[6] = XORSIMD_BIN ? xor_12g : xor_24d;
  assign XOR_MX_in[7] = xor_12h;


//--########################### END ALU ################################
 
    
//*** CarryIn Mux and Register

//-------  input 0
    always @(posedge CLK_in) begin
	    if (RSTALLCARRYIN_in || glblGSR)
          CARRYIN_reg <= 1'b0;
	    else if (CECARRYIN_in)
          CARRYIN_reg <= CARRYIN_in;
       end

       assign CARRYIN_mux = (CARRYINREG_BIN == 1'b1) ? CARRYIN_reg : CARRYIN_in;

// INTERNAL CARRYIN REGISTER
  assign c_mult = !(AMULT26_in^BMULT17_in);
  assign ce_m_g   = CEM_in & ~glblGSR; // & gwe
  assign rst_carryin_g = RSTALLCARRYIN_in & ~glblGSR; // & gwe
  assign d_carryin_int  = ce_m_g ? c_mult : qmultcarryin;

// rstallcarryin is injected through data path
  assign dr_carryin_int = rst_carryin_g ? 0 : d_carryin_int;

  always @(posedge CLK_in) begin
    if (glblGSR)
       qmultcarryin <= 1'b0;
    else
       qmultcarryin <= dr_carryin_int;
  end

  // bypass register mux
  assign multcarryin_data = (MREG_BIN == 1'b1) ? qmultcarryin : c_mult;

//NB
  always @(CARRYINSEL_mux or CARRYIN_mux or PCIN_in[47] or CARRYCASCIN_in or CCOUT_in or P_FDBK_in[47] or multcarryin_data) begin
	case (CARRYINSEL_mux)
     3'b000  : cin_b = ~CARRYIN_mux;
     3'b001  : cin_b = PCIN_in[47];
     3'b010  : cin_b = ~CARRYCASCIN_in;
     3'b011  : cin_b = ~PCIN_in[47];
     3'b100  : cin_b = ~CCOUT_in;
     3'b101  : cin_b = P_FDBK_in[47];
     3'b110  : cin_b = ~multcarryin_data;
     3'b111  : cin_b = ~P_FDBK_in[47];
     default : cin_b = 1'bx;
	endcase
   end
// disable carryin when performing logic operation
   assign cin = (ALUMODE_DATA[3] || ALUMODE_DATA[2]) ? 1'b0 : ~cin_b;

// DSP_A_B_DATA
//*********************************************************
//*** Input register A with 2 level deep of registers
//*********************************************************

    always @(posedge CLK_in) begin
       if (RSTA_in || (AREG_BIN == 2'b00) || glblGSR) begin
          A1_reg <= {A_WIDTH{1'b0}};
       end else if (CEA1_in) begin
          if (A_INPUT_BIN == A_INPUT_CASCADE) begin
             A1_reg <= ACIN_in;
          end else begin
             A1_reg <= A_in;
          end
       end
    end

    always @(posedge CLK_in) begin
       if (RSTA_in || (AREG_BIN == 2'b00) || glblGSR) begin
          A2_reg <= {A_WIDTH{1'b0}};
       end else if (CEA2_in) begin
          if (AREG_BIN == 2'b10) begin
             A2_reg <= A1_reg;
          end else if (A_INPUT_BIN == A_INPUT_CASCADE) begin
             A2_reg <= ACIN_in;
          end else begin
             A2_reg <= A_in;
          end
       end
    end

    assign A_ALU = (AREG_BIN != 2'b00) ? A2_reg :
                   (A_INPUT_BIN == A_INPUT_CASCADE) ? ACIN_in :
                   A_in;

// assumes encoding the same for ACASCREG and AREG
    assign ACOUT = (ACASCREG_BIN == AREG_BIN) ? A_ALU : A1_reg;

//*********************************************************
//*** Input register B with 2 level deep of registers
//*********************************************************

    always @(posedge CLK_in) begin
       if (RSTB_in || (BREG_BIN == 2'b00) || glblGSR) begin
          B1_DATA_out <= 18'b0;
       end else if (CEB1_in) begin
          if (B_INPUT_BIN == B_INPUT_CASCADE) B1_DATA_out <= BCIN_in;
          else B1_DATA_out <= B_in;
       end
    end

    always @(posedge CLK_in) begin
       if (RSTB_in || glblGSR) B2_reg <= 18'b0;
       else if (CEB2_in) begin
         if (BREG_BIN == 2'b10) B2_reg <= B1_DATA_out;
         else if (B_INPUT_BIN == B_INPUT_CASCADE) B2_reg <= BCIN_in;
         else B2_reg <= B_in;
       end
    end

    assign B_ALU = (BREG_BIN != 2'b00) ? B2_reg :
                   (B_INPUT_BIN == B_INPUT_CASCADE) ?  BCIN_in :
                    B_in;

    assign B2_DATA = (BREG_BIN != 2'b00) ? B2_reg :
                     (B_INPUT_BIN == B_INPUT_CASCADE) ?  BCIN_in :
                      B_in;

// assumes encoding the same for BCASCREG and BREG
    assign BCOUT = (BCASCREG_BIN == BREG_BIN) ? B2_DATA : B1_DATA_out;

// DSP_C_DATA
//*********************************************************
//*** Input register C with 1 level deep of register
//*********************************************************

   always @(posedge CLK_in) begin
      if (RSTC_in || (CREG_BIN == 1'b0) || glblGSR) begin
         C_reg <= 48'b0;
      end else if (CEC_in) begin
         C_reg <= C_in;
      end
   end

   assign C_DATA_in = (CREG_BIN == 1'b1) ? C_reg : C_in;

// DSP_MULTIPLIER
always @(*) begin
  if (AMULTSEL_BIN == AMULTSEL_A) a_mult_mux = A2A1;
  else a_mult_mux = AD_DATA;
end
always @(*) begin
  if (BMULTSEL_BIN == BMULTSEL_B) b_mult_mux = B2B1;
  else b_mult_mux = AD_DATA;
end

  assign AMULT26_in = a_mult_mux[26];
  assign BMULT17_in = b_mult_mux[17];
// U[44],V[44]  11 when mult[44]=0,  10 when mult[44]=1
  assign U_in = {1'b1,      mult[43:0] & ps_u_mask};
  assign V_in = {~mult[44], mult[43:0] & ps_v_mask};

always @(*) begin
  if (USE_MULT_BIN == USE_MULT_NONE) mult = 45'b0;
  else mult = ({{18{a_mult_mux[26]}},a_mult_mux} * {{27{b_mult_mux[17]}},b_mult_mux});
end

// DSP_M_DATA
//*********************************************************
//*** Multiplier outputs U, V  with 1 level deep of register
//*********************************************************

   always @(posedge CLK_in) begin
      if  (RSTM_in || (MREG_BIN == 1'b0) || glblGSR) begin
         U_DATA_reg <= {1'b0, {M_WIDTH-1{1'b0}}};
         V_DATA_reg <= {1'b0, {M_WIDTH-1{1'b0}}};
      end else if (CEM_in)  begin
         U_DATA_reg <= U_in;
         V_DATA_reg <= V_in;
      end
   end

   assign U_DATA = (MREG_BIN == 1'b1) ? U_DATA_reg    : U_in;
   assign V_DATA = (MREG_BIN == 1'b1) ? V_DATA_reg    : V_in;

// DSP_OUTPUT
//--####################################################################
//--#####                    Pattern Detector                      #####
//--####################################################################

    // select pattern
    assign the_pattern = (SEL_PATTERN_BIN == SEL_PATTERN_PATTERN) ? PATTERN_REG : C_DATA_in;

    // select mask
    assign the_mask = (USE_PATTERN_DETECT_BIN == USE_PATTERN_DETECT_NO_PATDET) ? {C_WIDTH{1'b1}} :
                      (SEL_MASK_BIN == SEL_MASK_C)              ?    C_DATA_in       :
                      (SEL_MASK_BIN == SEL_MASK_ROUNDING_MODE1) ? {~(C_DATA_in[C_WIDTH-2:0]),1'b0} :
                      (SEL_MASK_BIN == SEL_MASK_ROUNDING_MODE2) ? {~(C_DATA_in[C_WIDTH-3:0]),2'b0} :
                      MASK_REG; // default or (SEL_MASK_BIN == SEL_MASK_MASK)

    //--  now do the pattern detection

   assign pdet_o  = &(~(the_pattern ^ ALU_OUT_in) | the_mask);
   assign pdetb_o = &( (the_pattern ^ ALU_OUT_in) | the_mask);

   assign PATTERNDETECT  = opmode_valid_flag_dou ? pdet_o_mux  : 1'bx;
   assign PATTERNBDETECT = opmode_valid_flag_dou ? pdetb_o_mux : 1'bx;

//*** Output register PATTERN DETECT and UNDERFLOW / OVERFLOW 

   always @(posedge CLK_in) begin
     if (RSTP_in || glblGSR || the_auto_reset_patdet) begin
         pdet_o_reg1  <= 1'b0;
         pdet_o_reg2  <= 1'b0;
         pdetb_o_reg1 <= 1'b0;
         pdetb_o_reg2 <= 1'b0;
     end else if (CEP_in && PREG_BIN) begin
       //-- the previous values are used in Underflow/Overflow
         pdet_o_reg2  <= pdet_o_reg1;
         pdetb_o_reg2 <= pdetb_o_reg1;
         pdet_o_reg1  <= pdet_o;
         pdetb_o_reg1 <= pdetb_o;
     end
   end

    assign pdet_o_mux     = (PREG_BIN == 1'b1) ? pdet_o_reg1  : pdet_o;
    assign pdetb_o_mux    = (PREG_BIN == 1'b1) ? pdetb_o_reg1 : pdetb_o;
    assign overflow_data  = (PREG_BIN == 1'b1) ? pdet_o_reg2  : pdet_o;
    assign underflow_data = (PREG_BIN == 1'b1) ? pdetb_o_reg2 : pdetb_o;

//--####################################################################
//--#####                     AUTORESET_PATDET                     #####
//--####################################################################
    assign auto_reset_pri = (AUTORESET_PRIORITY_BIN == AUTORESET_PRIORITY_RESET) || CEP_in;

    assign the_auto_reset_patdet =
         (AUTORESET_PATDET_BIN == AUTORESET_PATDET_RESET_MATCH) ?
                     auto_reset_pri && pdet_o_mux :
         (AUTORESET_PATDET_BIN == AUTORESET_PATDET_RESET_NOT_MATCH) ?
                     auto_reset_pri && overflow_data && ~pdet_o_mux : 1'b0; // NO_RESET

//--####################################################################
//--#### CARRYOUT, CARRYCASCOUT. MULTSIGNOUT, PCOUT and XOROUT reg ##### 
//--####################################################################
//*** register with 1 level of register
   always @(posedge CLK_in) begin
     if (RSTP_in || glblGSR || the_auto_reset_patdet) begin
       COUT_reg         <= 4'b0000;
       ALUMODE10_reg    <= 1'b0;
       MULTSIGN_ALU_reg <= 1'b0;
       ALU_OUT_reg      <= 48'b0;
       XOR_MX_reg       <= 8'b0;
     end else if (CEP_in && PREG_BIN) begin
       COUT_reg         <= COUT_in;
       ALUMODE10_reg    <= ALUMODE10_in;
       MULTSIGN_ALU_reg <= MULTSIGN_ALU_in;
       ALU_OUT_reg      <= ALU_OUT_in;
       XOR_MX_reg       <= XOR_MX_in;
     end
   end

    assign ALUMODE10_mux    = (PREG_BIN == 1'b1) ? ALUMODE10_reg    : ALUMODE10_in;
    assign CARRYOUT     = (PREG_BIN == 1'b1) ? COUT_reg         : COUT_in;
    assign MULTSIGNOUT  = (PREG_BIN == 1'b1) ? MULTSIGN_ALU_reg : MULTSIGN_ALU_in;
    assign P            = (PREG_BIN == 1'b1) ? ALU_OUT_reg      : ALU_OUT_in;
    assign XOROUT       = (PREG_BIN == 1'b1) ? XOR_MX_reg      : XOR_MX_in;
    assign CCOUT_in      = ALUMODE10_reg ^ COUT_reg[3];
    assign CARRYCASCOUT  = (PREG_BIN == 1'b1) ? ALUMODE10_reg ^ COUT_reg[3]:
                                                ALUMODE10_in  ^ COUT_in[3];
    assign P_FDBK_in     = ALU_OUT_reg;
    assign P_FDBK_47_in  = ALU_OUT_reg[47];
    assign PCOUT = (PREG_BIN == 1'b1) ? ALU_OUT_reg : ALU_OUT_in;

//--####################################################################
//--#####                    Underflow / Overflow                  #####
//--####################################################################
    assign OVERFLOW  = (USE_PATTERN_DETECT_BIN == USE_PATTERN_DETECT_PATDET) ?
                            ~pdet_o_mux && ~pdetb_o_mux && overflow_data : 1'bx;
    assign UNDERFLOW = (USE_PATTERN_DETECT_BIN == USE_PATTERN_DETECT_PATDET) ?
                            ~pdet_o_mux && ~pdetb_o_mux && underflow_data : 1'bx;
// DSP_PREADD
//*********************************************************
//*** Preaddsub AD
//*********************************************************
  assign D_DATA_mux = INMODE_mux[2] ? D_DATA    : 27'b0;
  assign AD_in  = INMODE_mux[3] ? (D_DATA_mux - PREADD_AB) : (D_DATA_mux + PREADD_AB);

// DSP_PREADD_DATA
  always @ (*) begin
    if (((AMULTSEL_BIN == AMULTSEL_A) &&
         (BMULTSEL_BIN == BMULTSEL_B)) ||
        (USE_MULT_BIN == USE_MULT_NONE)) begin
      DREG_INT = 1'b0;
    end else begin
      DREG_INT = DREG_BIN;
    end
  end

  always @ (*) begin
    if (((AMULTSEL_BIN == AMULTSEL_A) && (BMULTSEL_BIN == BMULTSEL_B)) ||
        (USE_MULT_BIN == USE_MULT_NONE)) begin
      ADREG_INT = 1'b0;
    end else begin
      ADREG_INT = ADREG_BIN;
    end
  end

   always @(*) begin
     if ((PREADDINSEL_BIN==PREADDINSEL_A) && INMODE_mux[1]) A2A1 = 27'b0;
     else if (INMODE_mux[0]==1'b1) A2A1 = A1_reg[26:0];
     else A2A1 = A_ALU[26:0];
   end
   always @(*) begin
     if ((PREADDINSEL_BIN==PREADDINSEL_B) && INMODE_mux[1]) B2B1 = 18'b0;
     else if (INMODE_mux[4]==1'b1) B2B1 = B1_DATA_out;
     else B2B1 = B2_DATA;
   end
   assign PREADD_AB    = (PREADDINSEL_BIN==PREADDINSEL_B) ? {{9{B2B1[17]}}, B2B1} : A2A1;

//*********************************************************
//**********  INMODE signal registering        ************
//*********************************************************
// new 

   always @(posedge CLK_in) begin
      if (RSTINMODE_in || (INMODEREG_BIN == 1'b0) || glblGSR) begin
         INMODE_reg <= 5'b0;
      end else if (CEINMODE_in) begin
         INMODE_reg <= INMODE_in;
      end
   end

   assign INMODE_mux = (INMODEREG_BIN == 1'b1) ? INMODE_reg : INMODE_in;

//*********************************************************
//*** Input register D with 1 level deep of register
//*********************************************************

   always @(posedge CLK_in) begin
      if (RSTD_in || (DREG_INT == 1'b0) || glblGSR) begin
         D_DATA_reg <= {D_WIDTH{1'b0}};
      end else if (CED_in) begin
         D_DATA_reg <= D_in;
      end
   end

   assign D_DATA    = (DREG_INT == 1'b1) ? D_DATA_reg : D_in;

//*********************************************************
//*** Input register AD with 1 level deep of register
//*********************************************************

   always @(posedge CLK_in) begin
      if      (RSTD_in || glblGSR)  begin
         AD_DATA_reg <= 27'b0;
      end else if (CEAD_in) AD_DATA_reg <= AD_in;
   end

   assign AD_DATA    = (ADREG_INT == 1'b1) ? AD_DATA_reg : AD_in;

   always @(OPMODE_mux) begin
     if (((OPMODE_mux[1:0] == 2'b11) && (USE_MULT_BIN == USE_MULT_MULTIPLY)) &&
       ((AREG_BIN==2'b00 && BREG_BIN==2'b00 && MREG_BIN==1'b0) ||
        (AREG_BIN==2'b00 && BREG_BIN==2'b00 && PREG_BIN==1'b0) ||
        (MREG_BIN==1'b0 && PREG_BIN==1'b0)))
       $display("OPMODE Input Warning : [Unisim %s-8] The OPMODE[1:0] (%b) is invalid when using attributes USE_MULT = MULTIPLY and (A, B and M) or (A, B and P) or (M and P) are not REGISTERED at time %.3f ns. Please set USE_MULT to either NONE or DYNAMIC or REGISTER one of each group. (A or B) and (M or P) will satisfy the requirement. Instance %m", MODULE_NAME, OPMODE_mux[1:0], $time/1000.0);
     if ((OPMODE_mux[3:0] == 4'b0101) &&
       ((USE_MULT_BIN == USE_MULT_NONE) || (USE_SIMD_BIN != USE_SIMD_ONE48)))
       $display("OPMODE Input Warning : [Unisim %s-9] The OPMODE[3:0] (%b) is invalid when using attributes USE_MULT = NONE, or USE_SIMD = TWO24 or FOUR12 at %.3f ns. Instance %m", MODULE_NAME, OPMODE_mux[3:0], $time/1000.0);
    end

// end behavioral model

endmodule

`endcelldefine

// CHECK: ; BTOR description generated by Yosys
// CHECK-NEXT: 1 sort bitvec 30
// CHECK-NEXT: 2 input 1 A
// CHECK-NEXT: 3 sort bitvec 32
// CHECK-NEXT: 4 input 3 ACASCREG 
// CHECK-NEXT: 5 input 1 ACIN 
// CHECK-NEXT: 6 input 3 ADREG 
// CHECK-NEXT: 7 sort bitvec 4
// CHECK-NEXT: 8 input 7 ALUMODE 
// CHECK-NEXT: 9 input 3 ALUMODEREG 
// CHECK-NEXT: 10 sort bitvec 1
// CHECK-NEXT: 11 input 10 AMULTSEL 
// CHECK-NEXT: 12 input 3 AREG 
// CHECK-NEXT: 13 input 10 AUTORESET_PATDET 
// CHECK-NEXT: 14 input 10 AUTORESET_PRIORITY 
// CHECK-NEXT: 15 input 10 A_INPUT 
// CHECK-NEXT: 16 sort bitvec 18
// CHECK-NEXT: 17 input 16 B 
// CHECK-NEXT: 18 input 3 BCASCREG 
// CHECK-NEXT: 19 input 16 BCIN 
// CHECK-NEXT: 20 input 10 BMULTSEL 
// CHECK-NEXT: 21 input 3 BREG 
// CHECK-NEXT: 22 input 10 B_INPUT 
// CHECK-NEXT: 23 sort bitvec 48
// CHECK-NEXT: 24 input 23 C 
// CHECK-NEXT: 25 input 10 CARRYCASCIN 
// CHECK-NEXT: 26 input 10 CARRYIN 
// CHECK-NEXT: 27 input 3 CARRYINREG 
// CHECK-NEXT: 28 sort bitvec 3
// CHECK-NEXT: 29 input 28 CARRYINSEL 
// CHECK-NEXT: 30 input 3 CARRYINSELREG 
// CHECK-NEXT: 31 input 10 CEA1 
// CHECK-NEXT: 32 input 10 CEA2 
// CHECK-NEXT: 33 input 10 CEAD 
// CHECK-NEXT: 34 input 10 CEALUMODE 
// CHECK-NEXT: 35 input 10 CEB1 
// CHECK-NEXT: 36 input 10 CEB2 
// CHECK-NEXT: 37 input 10 CEC 
// CHECK-NEXT: 38 input 10 CECARRYIN 
// CHECK-NEXT: 39 input 10 CECTRL 
// CHECK-NEXT: 40 input 10 CED 
// CHECK-NEXT: 41 input 10 CEINMODE 
// CHECK-NEXT: 42 input 10 CEM 
// CHECK-NEXT: 43 input 10 CEP 
// CHECK-NEXT: 44 input 10 CLK 
// CHECK-NEXT: 45 input 3 CREG 
// CHECK-NEXT: 46 sort bitvec 27
// CHECK-NEXT: 47 input 46 D 
// CHECK-NEXT: 48 input 3 DREG 
// CHECK-NEXT: 49 sort bitvec 5
// CHECK-NEXT: 50 input 49 INMODE 
// CHECK-NEXT: 51 input 3 INMODEREG 
// CHECK-NEXT: 52 input 7 IS_ALUMODE_INVERTED 
// CHECK-NEXT: 53 input 10 IS_CARRYIN_INVERTED 
// CHECK-NEXT: 54 input 10 IS_CLK_INVERTED 
// CHECK-NEXT: 55 input 49 IS_INMODE_INVERTED 
// CHECK-NEXT: 56 sort bitvec 9
// CHECK-NEXT: 57 input 56 IS_OPMODE_INVERTED 
// CHECK-NEXT: 58 input 10 IS_RSTALLCARRYIN_INVERTED 
// CHECK-NEXT: 59 input 10 IS_RSTALUMODE_INVERTED 
// CHECK-NEXT: 60 input 10 IS_RSTA_INVERTED 
// CHECK-NEXT: 61 input 10 IS_RSTB_INVERTED 
// CHECK-NEXT: 62 input 10 IS_RSTCTRL_INVERTED 
// CHECK-NEXT: 63 input 10 IS_RSTC_INVERTED 
// CHECK-NEXT: 64 input 10 IS_RSTD_INVERTED 
// CHECK-NEXT: 65 input 10 IS_RSTINMODE_INVERTED 
// CHECK-NEXT: 66 input 10 IS_RSTM_INVERTED 
// CHECK-NEXT: 67 input 10 IS_RSTP_INVERTED 
// CHECK-NEXT: 68 input 23 MASK 
// CHECK-NEXT: 69 input 3 MREG 
// CHECK-NEXT: 70 input 10 MULTSIGNIN 
// CHECK-NEXT: 71 input 56 OPMODE 
// CHECK-NEXT: 72 input 3 OPMODEREG 
// CHECK-NEXT: 73 input 23 PATTERN 
// CHECK-NEXT: 74 input 23 PCIN 
// CHECK-NEXT: 75 input 10 PREADDINSEL 
// CHECK-NEXT: 76 input 3 PREG 
// CHECK-NEXT: 77 input 23 RND 
// CHECK-NEXT: 78 input 10 RSTA 
// CHECK-NEXT: 79 input 10 RSTALLCARRYIN 
// CHECK-NEXT: 80 input 10 RSTALUMODE 
// CHECK-NEXT: 81 input 10 RSTB 
// CHECK-NEXT: 82 input 10 RSTC 
// CHECK-NEXT: 83 input 10 RSTCTRL 
// CHECK-NEXT: 84 input 10 RSTD 
// CHECK-NEXT: 85 input 10 RSTINMODE 
// CHECK-NEXT: 86 input 10 RSTM 
// CHECK-NEXT: 87 input 10 RSTP 
// CHECK-NEXT: 88 input 10 SEL_MASK 
// CHECK-NEXT: 89 input 10 SEL_PATTERN 
// CHECK-NEXT: 90 input 10 USE_MULT 
// CHECK-NEXT: 91 input 10 USE_PATTERN_DETECT 
// CHECK-NEXT: 92 input 10 USE_SIMD 
// CHECK-NEXT: 93 input 10 USE_WIDEXOR 
// CHECK-NEXT: 94 input 10 XORSIMD 
// CHECK-NEXT: 95 state 1
// CHECK-NEXT: 96 state 1
// CHECK-NEXT: 97 const 10 1
// CHECK-NEXT: 98 state 10
// CHECK-NEXT: 99 init 10 98 97
// CHECK-NEXT: 100 const 10 z
// CHECK-NEXT: 101 neq 10 44 100
// CHECK-NEXT: 102 xor 10 44 54
// CHECK-NEXT: 103 and 10 101 102
// CHECK-NEXT: 104 sort bitvec 2
// CHECK-NEXT: 105 concat 104 103 98
// CHECK-NEXT: 106 const 104 10
// CHECK-NEXT: 107 eq 10 105 106
// CHECK-NEXT: 108 ite 1 107 96 95
// CHECK-NEXT: 109 slice 10 2 0 0
// CHECK-NEXT: 110 eq 10 109 100
// CHECK-NEXT: 111 or 10 110 109
// CHECK-NEXT: 112 slice 10 2 1 1
// CHECK-NEXT: 113 eq 10 112 100
// CHECK-NEXT: 114 or 10 113 112
// CHECK-NEXT: 115 slice 10 2 2 2
// CHECK-NEXT: 116 eq 10 115 100
// CHECK-NEXT: 117 or 10 116 115
// CHECK-NEXT: 118 slice 10 2 3 3
// CHECK-NEXT: 119 eq 10 118 100
// CHECK-NEXT: 120 or 10 119 118
// CHECK-NEXT: 121 slice 10 2 4 4
// CHECK-NEXT: 122 eq 10 121 100
// CHECK-NEXT: 123 or 10 122 121
// CHECK-NEXT: 124 slice 10 2 5 5
// CHECK-NEXT: 125 eq 10 124 100
// CHECK-NEXT: 126 or 10 125 124
// CHECK-NEXT: 127 slice 10 2 6 6
// CHECK-NEXT: 128 eq 10 127 100
// CHECK-NEXT: 129 or 10 128 127
// CHECK-NEXT: 130 slice 10 2 7 7
// CHECK-NEXT: 131 eq 10 130 100
// CHECK-NEXT: 132 or 10 131 130
// CHECK-NEXT: 133 slice 10 2 8 8
// CHECK-NEXT: 134 eq 10 133 100
// CHECK-NEXT: 135 or 10 134 133
// CHECK-NEXT: 136 slice 10 2 9 9
// CHECK-NEXT: 137 eq 10 136 100
// CHECK-NEXT: 138 or 10 137 136
// CHECK-NEXT: 139 slice 10 2 10 10
// CHECK-NEXT: 140 eq 10 139 100
// CHECK-NEXT: 141 or 10 140 139
// CHECK-NEXT: 142 slice 10 2 11 11
// CHECK-NEXT: 143 eq 10 142 100
// CHECK-NEXT: 144 or 10 143 142
// CHECK-NEXT: 145 slice 10 2 12 12
// CHECK-NEXT: 146 eq 10 145 100
// CHECK-NEXT: 147 or 10 146 145
// CHECK-NEXT: 148 slice 10 2 13 13
// CHECK-NEXT: 149 eq 10 148 100
// CHECK-NEXT: 150 or 10 149 148
// CHECK-NEXT: 151 slice 10 2 14 14
// CHECK-NEXT: 152 eq 10 151 100
// CHECK-NEXT: 153 or 10 152 151
// CHECK-NEXT: 154 slice 10 2 15 15
// CHECK-NEXT: 155 eq 10 154 100
// CHECK-NEXT: 156 or 10 155 154
// CHECK-NEXT: 157 slice 10 2 16 16
// CHECK-NEXT: 158 eq 10 157 100
// CHECK-NEXT: 159 or 10 158 157
// CHECK-NEXT: 160 slice 10 2 17 17
// CHECK-NEXT: 161 eq 10 160 100
// CHECK-NEXT: 162 or 10 161 160
// CHECK-NEXT: 163 slice 10 2 18 18
// CHECK-NEXT: 164 eq 10 163 100
// CHECK-NEXT: 165 or 10 164 163
// CHECK-NEXT: 166 slice 10 2 19 19
// CHECK-NEXT: 167 eq 10 166 100
// CHECK-NEXT: 168 or 10 167 166
// CHECK-NEXT: 169 slice 10 2 20 20
// CHECK-NEXT: 170 eq 10 169 100
// CHECK-NEXT: 171 or 10 170 169
// CHECK-NEXT: 172 slice 10 2 21 21
// CHECK-NEXT: 173 eq 10 172 100
// CHECK-NEXT: 174 or 10 173 172
// CHECK-NEXT: 175 slice 10 2 22 22
// CHECK-NEXT: 176 eq 10 175 100
// CHECK-NEXT: 177 or 10 176 175
// CHECK-NEXT: 178 slice 10 2 23 23
// CHECK-NEXT: 179 eq 10 178 100
// CHECK-NEXT: 180 or 10 179 178
// CHECK-NEXT: 181 slice 10 2 24 24
// CHECK-NEXT: 182 eq 10 181 100
// CHECK-NEXT: 183 or 10 182 181
// CHECK-NEXT: 184 slice 10 2 25 25
// CHECK-NEXT: 185 eq 10 184 100
// CHECK-NEXT: 186 or 10 185 184
// CHECK-NEXT: 187 slice 10 2 26 26
// CHECK-NEXT: 188 eq 10 187 100
// CHECK-NEXT: 189 or 10 188 187
// CHECK-NEXT: 190 slice 10 2 27 27
// CHECK-NEXT: 191 eq 10 190 100
// CHECK-NEXT: 192 or 10 191 190
// CHECK-NEXT: 193 slice 10 2 28 28
// CHECK-NEXT: 194 eq 10 193 100
// CHECK-NEXT: 195 or 10 194 193
// CHECK-NEXT: 196 slice 10 2 29 29
// CHECK-NEXT: 197 eq 10 196 100
// CHECK-NEXT: 198 or 10 197 196
// CHECK-NEXT: 199 concat 104 114 111
// CHECK-NEXT: 200 concat 28 117 199
// CHECK-NEXT: 201 concat 7 120 200
// CHECK-NEXT: 202 concat 49 123 201
// CHECK-NEXT: 203 sort bitvec 6
// CHECK-NEXT: 204 concat 203 126 202
// CHECK-NEXT: 205 sort bitvec 7
// CHECK-NEXT: 206 concat 205 129 204
// CHECK-NEXT: 207 sort bitvec 8
// CHECK-NEXT: 208 concat 207 132 206
// CHECK-NEXT: 209 concat 56 135 208
// CHECK-NEXT: 210 sort bitvec 10
// CHECK-NEXT: 211 concat 210 138 209
// CHECK-NEXT: 212 sort bitvec 11
// CHECK-NEXT: 213 concat 212 141 211
// CHECK-NEXT: 214 sort bitvec 12
// CHECK-NEXT: 215 concat 214 144 213
// CHECK-NEXT: 216 sort bitvec 13
// CHECK-NEXT: 217 concat 216 147 215
// CHECK-NEXT: 218 sort bitvec 14
// CHECK-NEXT: 219 concat 218 150 217
// CHECK-NEXT: 220 sort bitvec 15
// CHECK-NEXT: 221 concat 220 153 219
// CHECK-NEXT: 222 sort bitvec 16
// CHECK-NEXT: 223 concat 222 156 221
// CHECK-NEXT: 224 sort bitvec 17
// CHECK-NEXT: 225 concat 224 159 223
// CHECK-NEXT: 226 concat 16 162 225
// CHECK-NEXT: 227 sort bitvec 19
// CHECK-NEXT: 228 concat 227 165 226
// CHECK-NEXT: 229 sort bitvec 20
// CHECK-NEXT: 230 concat 229 168 228
// CHECK-NEXT: 231 sort bitvec 21
// CHECK-NEXT: 232 concat 231 171 230
// CHECK-NEXT: 233 sort bitvec 22
// CHECK-NEXT: 234 concat 233 174 232
// CHECK-NEXT: 235 sort bitvec 23
// CHECK-NEXT: 236 concat 235 177 234
// CHECK-NEXT: 237 sort bitvec 24
// CHECK-NEXT: 238 concat 237 180 236
// CHECK-NEXT: 239 sort bitvec 25
// CHECK-NEXT: 240 concat 239 183 238
// CHECK-NEXT: 241 sort bitvec 26
// CHECK-NEXT: 242 concat 241 186 240
// CHECK-NEXT: 243 concat 46 189 242
// CHECK-NEXT: 244 sort bitvec 28
// CHECK-NEXT: 245 concat 244 192 243
// CHECK-NEXT: 246 sort bitvec 29
// CHECK-NEXT: 247 concat 246 195 245
// CHECK-NEXT: 248 concat 1 198 247
// CHECK-NEXT: 249 state 1
// CHECK-NEXT: 250 state 1
// CHECK-NEXT: 251 state 10
// CHECK-NEXT: 252 init 10 251 97
// CHECK-NEXT: 253 concat 104 103 251
// CHECK-NEXT: 254 eq 10 253 106
// CHECK-NEXT: 255 ite 1 254 250 249
// CHECK-NEXT: 256 slice 104 12 1 0
// CHECK-NEXT: 257 redor 10 256
// CHECK-NEXT: 258 ite 1 257 255 248
// CHECK-NEXT: 259 slice 104 4 1 0
// CHECK-NEXT: 260 eq 10 259 256
// CHECK-NEXT: 261 ite 1 260 258 108
// CHECK-NEXT: 262 output 261 ACOUT 
// CHECK-NEXT: 263 state 16
// CHECK-NEXT: 264 state 16
// CHECK-NEXT: 265 state 10
// CHECK-NEXT: 266 init 10 265 97
// CHECK-NEXT: 267 concat 104 103 265
// CHECK-NEXT: 268 eq 10 267 106
// CHECK-NEXT: 269 ite 16 268 264 263
// CHECK-NEXT: 270 slice 10 17 0 0
// CHECK-NEXT: 271 eq 10 270 100
// CHECK-NEXT: 272 or 10 271 270
// CHECK-NEXT: 273 slice 10 17 1 1
// CHECK-NEXT: 274 eq 10 273 100
// CHECK-NEXT: 275 or 10 274 273
// CHECK-NEXT: 276 slice 10 17 2 2
// CHECK-NEXT: 277 eq 10 276 100
// CHECK-NEXT: 278 or 10 277 276
// CHECK-NEXT: 279 slice 10 17 3 3
// CHECK-NEXT: 280 eq 10 279 100
// CHECK-NEXT: 281 or 10 280 279
// CHECK-NEXT: 282 slice 10 17 4 4
// CHECK-NEXT: 283 eq 10 282 100
// CHECK-NEXT: 284 or 10 283 282
// CHECK-NEXT: 285 slice 10 17 5 5
// CHECK-NEXT: 286 eq 10 285 100
// CHECK-NEXT: 287 or 10 286 285
// CHECK-NEXT: 288 slice 10 17 6 6
// CHECK-NEXT: 289 eq 10 288 100
// CHECK-NEXT: 290 or 10 289 288
// CHECK-NEXT: 291 slice 10 17 7 7
// CHECK-NEXT: 292 eq 10 291 100
// CHECK-NEXT: 293 or 10 292 291
// CHECK-NEXT: 294 slice 10 17 8 8
// CHECK-NEXT: 295 eq 10 294 100
// CHECK-NEXT: 296 or 10 295 294
// CHECK-NEXT: 297 slice 10 17 9 9
// CHECK-NEXT: 298 eq 10 297 100
// CHECK-NEXT: 299 or 10 298 297
// CHECK-NEXT: 300 slice 10 17 10 10
// CHECK-NEXT: 301 eq 10 300 100
// CHECK-NEXT: 302 or 10 301 300
// CHECK-NEXT: 303 slice 10 17 11 11
// CHECK-NEXT: 304 eq 10 303 100
// CHECK-NEXT: 305 or 10 304 303
// CHECK-NEXT: 306 slice 10 17 12 12
// CHECK-NEXT: 307 eq 10 306 100
// CHECK-NEXT: 308 or 10 307 306
// CHECK-NEXT: 309 slice 10 17 13 13
// CHECK-NEXT: 310 eq 10 309 100
// CHECK-NEXT: 311 or 10 310 309
// CHECK-NEXT: 312 slice 10 17 14 14
// CHECK-NEXT: 313 eq 10 312 100
// CHECK-NEXT: 314 or 10 313 312
// CHECK-NEXT: 315 slice 10 17 15 15
// CHECK-NEXT: 316 eq 10 315 100
// CHECK-NEXT: 317 or 10 316 315
// CHECK-NEXT: 318 slice 10 17 16 16
// CHECK-NEXT: 319 eq 10 318 100
// CHECK-NEXT: 320 or 10 319 318
// CHECK-NEXT: 321 slice 10 17 17 17
// CHECK-NEXT: 322 eq 10 321 100
// CHECK-NEXT: 323 or 10 322 321
// CHECK-NEXT: 324 concat 104 275 272
// CHECK-NEXT: 325 concat 28 278 324
// CHECK-NEXT: 326 concat 7 281 325
// CHECK-NEXT: 327 concat 49 284 326
// CHECK-NEXT: 328 concat 203 287 327
// CHECK-NEXT: 329 concat 205 290 328
// CHECK-NEXT: 330 concat 207 293 329
// CHECK-NEXT: 331 concat 56 296 330
// CHECK-NEXT: 332 concat 210 299 331
// CHECK-NEXT: 333 concat 212 302 332
// CHECK-NEXT: 334 concat 214 305 333
// CHECK-NEXT: 335 concat 216 308 334
// CHECK-NEXT: 336 concat 218 311 335
// CHECK-NEXT: 337 concat 220 314 336
// CHECK-NEXT: 338 concat 222 317 337
// CHECK-NEXT: 339 concat 224 320 338
// CHECK-NEXT: 340 concat 16 323 339
// CHECK-NEXT: 341 state 16
// CHECK-NEXT: 342 state 16
// CHECK-NEXT: 343 state 10
// CHECK-NEXT: 344 init 10 343 97
// CHECK-NEXT: 345 concat 104 103 343
// CHECK-NEXT: 346 eq 10 345 106
// CHECK-NEXT: 347 ite 16 346 342 341
// CHECK-NEXT: 348 slice 104 21 1 0
// CHECK-NEXT: 349 redor 10 348
// CHECK-NEXT: 350 ite 16 349 347 340
// CHECK-NEXT: 351 slice 104 18 1 0
// CHECK-NEXT: 352 eq 10 351 348
// CHECK-NEXT: 353 ite 16 352 350 269
// CHECK-NEXT: 354 output 353 BCOUT 
// CHECK-NEXT: 355 slice 10 8 0 0
// CHECK-NEXT: 356 neq 10 355 100
// CHECK-NEXT: 357 slice 10 52 0 0
// CHECK-NEXT: 358 xor 10 355 357
// CHECK-NEXT: 359 and 10 356 358
// CHECK-NEXT: 360 slice 10 8 1 1
// CHECK-NEXT: 361 neq 10 360 100
// CHECK-NEXT: 362 slice 10 52 1 1
// CHECK-NEXT: 363 xor 10 360 362
// CHECK-NEXT: 364 and 10 361 363
// CHECK-NEXT: 365 slice 10 8 2 2
// CHECK-NEXT: 366 neq 10 365 100
// CHECK-NEXT: 367 slice 10 52 2 2
// CHECK-NEXT: 368 xor 10 365 367
// CHECK-NEXT: 369 and 10 366 368
// CHECK-NEXT: 370 slice 10 8 3 3
// CHECK-NEXT: 371 neq 10 370 100
// CHECK-NEXT: 372 slice 10 52 3 3
// CHECK-NEXT: 373 xor 10 370 372
// CHECK-NEXT: 374 and 10 371 373
// CHECK-NEXT: 375 concat 104 364 359
// CHECK-NEXT: 376 concat 28 369 375
// CHECK-NEXT: 377 concat 7 374 376
// CHECK-NEXT: 378 state 7
// CHECK-NEXT: 379 state 7
// CHECK-NEXT: 380 state 10
// CHECK-NEXT: 381 init 10 380 97
// CHECK-NEXT: 382 concat 104 103 380
// CHECK-NEXT: 383 eq 10 382 106
// CHECK-NEXT: 384 ite 7 383 379 378
// CHECK-NEXT: 385 slice 10 9 0 0
// CHECK-NEXT: 386 ite 7 385 384 377
// CHECK-NEXT: 387 slice 10 386 0 0
// CHECK-NEXT: 388 slice 10 386 1 1
// CHECK-NEXT: 389 and 10 387 388
// CHECK-NEXT: 390 slice 10 386 0 0
// CHECK-NEXT: 391 slice 10 386 0 0
// CHECK-NEXT: 392 concat 104 391 390
// CHECK-NEXT: 393 slice 10 386 0 0
// CHECK-NEXT: 394 concat 28 393 392
// CHECK-NEXT: 395 slice 10 386 0 0
// CHECK-NEXT: 396 concat 7 395 394
// CHECK-NEXT: 397 slice 10 386 0 0
// CHECK-NEXT: 398 concat 49 397 396
// CHECK-NEXT: 399 slice 10 386 0 0
// CHECK-NEXT: 400 concat 203 399 398
// CHECK-NEXT: 401 slice 10 386 0 0
// CHECK-NEXT: 402 concat 205 401 400
// CHECK-NEXT: 403 slice 10 386 0 0
// CHECK-NEXT: 404 concat 207 403 402
// CHECK-NEXT: 405 slice 10 386 0 0
// CHECK-NEXT: 406 concat 56 405 404
// CHECK-NEXT: 407 slice 10 386 0 0
// CHECK-NEXT: 408 concat 210 407 406
// CHECK-NEXT: 409 slice 10 386 0 0
// CHECK-NEXT: 410 concat 212 409 408
// CHECK-NEXT: 411 slice 10 386 0 0
// CHECK-NEXT: 412 concat 214 411 410
// CHECK-NEXT: 413 slice 10 386 0 0
// CHECK-NEXT: 414 concat 216 413 412
// CHECK-NEXT: 415 slice 10 386 0 0
// CHECK-NEXT: 416 concat 218 415 414
// CHECK-NEXT: 417 slice 10 386 0 0
// CHECK-NEXT: 418 concat 220 417 416
// CHECK-NEXT: 419 slice 10 386 0 0
// CHECK-NEXT: 420 concat 222 419 418
// CHECK-NEXT: 421 slice 10 386 0 0
// CHECK-NEXT: 422 concat 224 421 420
// CHECK-NEXT: 423 slice 10 386 0 0
// CHECK-NEXT: 424 concat 16 423 422
// CHECK-NEXT: 425 slice 10 386 0 0
// CHECK-NEXT: 426 concat 227 425 424
// CHECK-NEXT: 427 slice 10 386 0 0
// CHECK-NEXT: 428 concat 229 427 426
// CHECK-NEXT: 429 slice 10 386 0 0
// CHECK-NEXT: 430 concat 231 429 428
// CHECK-NEXT: 431 slice 10 386 0 0
// CHECK-NEXT: 432 concat 233 431 430
// CHECK-NEXT: 433 slice 10 386 0 0
// CHECK-NEXT: 434 concat 235 433 432
// CHECK-NEXT: 435 slice 10 386 0 0
// CHECK-NEXT: 436 concat 237 435 434
// CHECK-NEXT: 437 slice 10 386 0 0
// CHECK-NEXT: 438 concat 239 437 436
// CHECK-NEXT: 439 slice 10 386 0 0
// CHECK-NEXT: 440 concat 241 439 438
// CHECK-NEXT: 441 slice 10 386 0 0
// CHECK-NEXT: 442 concat 46 441 440
// CHECK-NEXT: 443 slice 10 386 0 0
// CHECK-NEXT: 444 concat 244 443 442
// CHECK-NEXT: 445 slice 10 386 0 0
// CHECK-NEXT: 446 concat 246 445 444
// CHECK-NEXT: 447 slice 10 386 0 0
// CHECK-NEXT: 448 concat 1 447 446
// CHECK-NEXT: 449 slice 10 386 0 0
// CHECK-NEXT: 450 sort bitvec 31
// CHECK-NEXT: 451 concat 450 449 448
// CHECK-NEXT: 452 slice 10 386 0 0
// CHECK-NEXT: 453 concat 3 452 451
// CHECK-NEXT: 454 slice 10 386 0 0
// CHECK-NEXT: 455 sort bitvec 33
// CHECK-NEXT: 456 concat 455 454 453
// CHECK-NEXT: 457 slice 10 386 0 0
// CHECK-NEXT: 458 sort bitvec 34
// CHECK-NEXT: 459 concat 458 457 456
// CHECK-NEXT: 460 slice 10 386 0 0
// CHECK-NEXT: 461 sort bitvec 35
// CHECK-NEXT: 462 concat 461 460 459
// CHECK-NEXT: 463 slice 10 386 0 0
// CHECK-NEXT: 464 sort bitvec 36
// CHECK-NEXT: 465 concat 464 463 462
// CHECK-NEXT: 466 slice 10 386 0 0
// CHECK-NEXT: 467 sort bitvec 37
// CHECK-NEXT: 468 concat 467 466 465
// CHECK-NEXT: 469 slice 10 386 0 0
// CHECK-NEXT: 470 sort bitvec 38
// CHECK-NEXT: 471 concat 470 469 468
// CHECK-NEXT: 472 slice 10 386 0 0
// CHECK-NEXT: 473 sort bitvec 39
// CHECK-NEXT: 474 concat 473 472 471
// CHECK-NEXT: 475 slice 10 386 0 0
// CHECK-NEXT: 476 sort bitvec 40
// CHECK-NEXT: 477 concat 476 475 474
// CHECK-NEXT: 478 slice 10 386 0 0
// CHECK-NEXT: 479 sort bitvec 41
// CHECK-NEXT: 480 concat 479 478 477
// CHECK-NEXT: 481 slice 10 386 0 0
// CHECK-NEXT: 482 sort bitvec 42
// CHECK-NEXT: 483 concat 482 481 480
// CHECK-NEXT: 484 slice 10 386 0 0
// CHECK-NEXT: 485 sort bitvec 43
// CHECK-NEXT: 486 concat 485 484 483
// CHECK-NEXT: 487 slice 10 386 0 0
// CHECK-NEXT: 488 sort bitvec 44
// CHECK-NEXT: 489 concat 488 487 486
// CHECK-NEXT: 490 slice 10 386 0 0
// CHECK-NEXT: 491 sort bitvec 45
// CHECK-NEXT: 492 concat 491 490 489
// CHECK-NEXT: 493 slice 10 386 0 0
// CHECK-NEXT: 494 sort bitvec 46
// CHECK-NEXT: 495 concat 494 493 492
// CHECK-NEXT: 496 slice 10 386 0 0
// CHECK-NEXT: 497 sort bitvec 47
// CHECK-NEXT: 498 concat 497 496 495
// CHECK-NEXT: 499 slice 10 386 0 0
// CHECK-NEXT: 500 concat 23 499 498
// CHECK-NEXT: 501 input 23
// CHECK-NEXT: 502 state 23
// CHECK-NEXT: 503 state 23
// CHECK-NEXT: 504 state 10
// CHECK-NEXT: 505 init 10 504 97
// CHECK-NEXT: 506 concat 104 103 504
// CHECK-NEXT: 507 eq 10 506 106
// CHECK-NEXT: 508 ite 23 507 503 502
// CHECK-NEXT: 509 slice 450 508 47 17
// CHECK-NEXT: 510 slice 10 508 47 47
// CHECK-NEXT: 511 concat 3 510 509
// CHECK-NEXT: 512 slice 10 508 47 47
// CHECK-NEXT: 513 concat 455 512 511
// CHECK-NEXT: 514 slice 10 508 47 47
// CHECK-NEXT: 515 concat 458 514 513
// CHECK-NEXT: 516 slice 10 508 47 47
// CHECK-NEXT: 517 concat 461 516 515
// CHECK-NEXT: 518 slice 10 508 47 47
// CHECK-NEXT: 519 concat 464 518 517
// CHECK-NEXT: 520 slice 10 508 47 47
// CHECK-NEXT: 521 concat 467 520 519
// CHECK-NEXT: 522 slice 10 508 47 47
// CHECK-NEXT: 523 concat 470 522 521
// CHECK-NEXT: 524 slice 10 508 47 47
// CHECK-NEXT: 525 concat 473 524 523
// CHECK-NEXT: 526 slice 10 508 47 47
// CHECK-NEXT: 527 concat 476 526 525
// CHECK-NEXT: 528 slice 10 508 47 47
// CHECK-NEXT: 529 concat 479 528 527
// CHECK-NEXT: 530 slice 10 508 47 47
// CHECK-NEXT: 531 concat 482 530 529
// CHECK-NEXT: 532 slice 10 508 47 47
// CHECK-NEXT: 533 concat 485 532 531
// CHECK-NEXT: 534 slice 10 508 47 47
// CHECK-NEXT: 535 concat 488 534 533
// CHECK-NEXT: 536 slice 10 508 47 47
// CHECK-NEXT: 537 concat 491 536 535
// CHECK-NEXT: 538 slice 10 508 47 47
// CHECK-NEXT: 539 concat 494 538 537
// CHECK-NEXT: 540 slice 10 508 47 47
// CHECK-NEXT: 541 concat 497 540 539
// CHECK-NEXT: 542 slice 10 508 47 47
// CHECK-NEXT: 543 concat 23 542 541
// CHECK-NEXT: 544 slice 10 71 0 0
// CHECK-NEXT: 545 neq 10 544 100
// CHECK-NEXT: 546 slice 10 57 0 0
// CHECK-NEXT: 547 xor 10 544 546
// CHECK-NEXT: 548 and 10 545 547
// CHECK-NEXT: 549 slice 10 71 1 1
// CHECK-NEXT: 550 neq 10 549 100
// CHECK-NEXT: 551 slice 10 57 1 1
// CHECK-NEXT: 552 xor 10 549 551
// CHECK-NEXT: 553 and 10 550 552
// CHECK-NEXT: 554 slice 10 71 2 2
// CHECK-NEXT: 555 neq 10 554 100
// CHECK-NEXT: 556 slice 10 57 2 2
// CHECK-NEXT: 557 xor 10 554 556
// CHECK-NEXT: 558 and 10 555 557
// CHECK-NEXT: 559 slice 10 71 3 3
// CHECK-NEXT: 560 neq 10 559 100
// CHECK-NEXT: 561 slice 10 57 3 3
// CHECK-NEXT: 562 xor 10 559 561
// CHECK-NEXT: 563 and 10 560 562
// CHECK-NEXT: 564 slice 10 71 4 4
// CHECK-NEXT: 565 neq 10 564 100
// CHECK-NEXT: 566 slice 10 57 4 4
// CHECK-NEXT: 567 xor 10 564 566
// CHECK-NEXT: 568 and 10 565 567
// CHECK-NEXT: 569 slice 10 71 5 5
// CHECK-NEXT: 570 neq 10 569 100
// CHECK-NEXT: 571 slice 10 57 5 5
// CHECK-NEXT: 572 xor 10 569 571
// CHECK-NEXT: 573 and 10 570 572
// CHECK-NEXT: 574 slice 10 71 6 6
// CHECK-NEXT: 575 neq 10 574 100
// CHECK-NEXT: 576 slice 10 57 6 6
// CHECK-NEXT: 577 xor 10 574 576
// CHECK-NEXT: 578 and 10 575 577
// CHECK-NEXT: 579 slice 10 71 7 7
// CHECK-NEXT: 580 neq 10 579 100
// CHECK-NEXT: 581 slice 10 57 7 7
// CHECK-NEXT: 582 xor 10 579 581
// CHECK-NEXT: 583 and 10 580 582
// CHECK-NEXT: 584 slice 10 71 8 8
// CHECK-NEXT: 585 neq 10 584 100
// CHECK-NEXT: 586 slice 10 57 8 8
// CHECK-NEXT: 587 xor 10 584 586
// CHECK-NEXT: 588 and 10 585 587
// CHECK-NEXT: 589 concat 104 553 548
// CHECK-NEXT: 590 concat 28 558 589
// CHECK-NEXT: 591 concat 7 563 590
// CHECK-NEXT: 592 concat 49 568 591
// CHECK-NEXT: 593 concat 203 573 592
// CHECK-NEXT: 594 concat 205 578 593
// CHECK-NEXT: 595 concat 207 583 594
// CHECK-NEXT: 596 concat 56 588 595
// CHECK-NEXT: 597 state 56
// CHECK-NEXT: 598 state 56
// CHECK-NEXT: 599 state 10
// CHECK-NEXT: 600 init 10 599 97
// CHECK-NEXT: 601 concat 104 103 599
// CHECK-NEXT: 602 eq 10 601 106
// CHECK-NEXT: 603 ite 56 602 598 597
// CHECK-NEXT: 604 slice 10 72 0 0
// CHECK-NEXT: 605 ite 56 604 603 596
// CHECK-NEXT: 606 slice 104 605 6 5
// CHECK-NEXT: 607 const 104 11
// CHECK-NEXT: 608 eq 10 606 607
// CHECK-NEXT: 609 ite 23 608 543 501
// CHECK-NEXT: 610 slice 450 74 47 17
// CHECK-NEXT: 611 slice 10 74 47 47
// CHECK-NEXT: 612 concat 3 611 610
// CHECK-NEXT: 613 slice 10 74 47 47
// CHECK-NEXT: 614 concat 455 613 612
// CHECK-NEXT: 615 slice 10 74 47 47
// CHECK-NEXT: 616 concat 458 615 614
// CHECK-NEXT: 617 slice 10 74 47 47
// CHECK-NEXT: 618 concat 461 617 616
// CHECK-NEXT: 619 slice 10 74 47 47
// CHECK-NEXT: 620 concat 464 619 618
// CHECK-NEXT: 621 slice 10 74 47 47
// CHECK-NEXT: 622 concat 467 621 620
// CHECK-NEXT: 623 slice 10 74 47 47
// CHECK-NEXT: 624 concat 470 623 622
// CHECK-NEXT: 625 slice 10 74 47 47
// CHECK-NEXT: 626 concat 473 625 624
// CHECK-NEXT: 627 slice 10 74 47 47
// CHECK-NEXT: 628 concat 476 627 626
// CHECK-NEXT: 629 slice 10 74 47 47
// CHECK-NEXT: 630 concat 479 629 628
// CHECK-NEXT: 631 slice 10 74 47 47
// CHECK-NEXT: 632 concat 482 631 630
// CHECK-NEXT: 633 slice 10 74 47 47
// CHECK-NEXT: 634 concat 485 633 632
// CHECK-NEXT: 635 slice 10 74 47 47
// CHECK-NEXT: 636 concat 488 635 634
// CHECK-NEXT: 637 slice 10 74 47 47
// CHECK-NEXT: 638 concat 491 637 636
// CHECK-NEXT: 639 slice 10 74 47 47
// CHECK-NEXT: 640 concat 494 639 638
// CHECK-NEXT: 641 slice 10 74 47 47
// CHECK-NEXT: 642 concat 497 641 640
// CHECK-NEXT: 643 slice 10 74 47 47
// CHECK-NEXT: 644 concat 23 643 642
// CHECK-NEXT: 645 slice 28 605 6 4
// CHECK-NEXT: 646 const 28 101
// CHECK-NEXT: 647 eq 10 645 646
// CHECK-NEXT: 648 ite 23 647 644 609
// CHECK-NEXT: 649 const 28 100
// CHECK-NEXT: 650 eq 10 645 649
// CHECK-NEXT: 651 uext 28 106 1
// CHECK-NEXT: 652 eq 10 645 651
// CHECK-NEXT: 653 concat 104 652 650
// CHECK-NEXT: 654 redor 10 653
// CHECK-NEXT: 655 ite 23 654 508 648
// CHECK-NEXT: 656 slice 10 24 0 0
// CHECK-NEXT: 657 eq 10 656 100
// CHECK-NEXT: 658 or 10 657 656
// CHECK-NEXT: 659 slice 10 24 1 1
// CHECK-NEXT: 660 eq 10 659 100
// CHECK-NEXT: 661 or 10 660 659
// CHECK-NEXT: 662 slice 10 24 2 2
// CHECK-NEXT: 663 eq 10 662 100
// CHECK-NEXT: 664 or 10 663 662
// CHECK-NEXT: 665 slice 10 24 3 3
// CHECK-NEXT: 666 eq 10 665 100
// CHECK-NEXT: 667 or 10 666 665
// CHECK-NEXT: 668 slice 10 24 4 4
// CHECK-NEXT: 669 eq 10 668 100
// CHECK-NEXT: 670 or 10 669 668
// CHECK-NEXT: 671 slice 10 24 5 5
// CHECK-NEXT: 672 eq 10 671 100
// CHECK-NEXT: 673 or 10 672 671
// CHECK-NEXT: 674 slice 10 24 6 6
// CHECK-NEXT: 675 eq 10 674 100
// CHECK-NEXT: 676 or 10 675 674
// CHECK-NEXT: 677 slice 10 24 7 7
// CHECK-NEXT: 678 eq 10 677 100
// CHECK-NEXT: 679 or 10 678 677
// CHECK-NEXT: 680 slice 10 24 8 8
// CHECK-NEXT: 681 eq 10 680 100
// CHECK-NEXT: 682 or 10 681 680
// CHECK-NEXT: 683 slice 10 24 9 9
// CHECK-NEXT: 684 eq 10 683 100
// CHECK-NEXT: 685 or 10 684 683
// CHECK-NEXT: 686 slice 10 24 10 10
// CHECK-NEXT: 687 eq 10 686 100
// CHECK-NEXT: 688 or 10 687 686
// CHECK-NEXT: 689 slice 10 24 11 11
// CHECK-NEXT: 690 eq 10 689 100
// CHECK-NEXT: 691 or 10 690 689
// CHECK-NEXT: 692 slice 10 24 12 12
// CHECK-NEXT: 693 eq 10 692 100
// CHECK-NEXT: 694 or 10 693 692
// CHECK-NEXT: 695 slice 10 24 13 13
// CHECK-NEXT: 696 eq 10 695 100
// CHECK-NEXT: 697 or 10 696 695
// CHECK-NEXT: 698 slice 10 24 14 14
// CHECK-NEXT: 699 eq 10 698 100
// CHECK-NEXT: 700 or 10 699 698
// CHECK-NEXT: 701 slice 10 24 15 15
// CHECK-NEXT: 702 eq 10 701 100
// CHECK-NEXT: 703 or 10 702 701
// CHECK-NEXT: 704 slice 10 24 16 16
// CHECK-NEXT: 705 eq 10 704 100
// CHECK-NEXT: 706 or 10 705 704
// CHECK-NEXT: 707 slice 10 24 17 17
// CHECK-NEXT: 708 eq 10 707 100
// CHECK-NEXT: 709 or 10 708 707
// CHECK-NEXT: 710 slice 10 24 18 18
// CHECK-NEXT: 711 eq 10 710 100
// CHECK-NEXT: 712 or 10 711 710
// CHECK-NEXT: 713 slice 10 24 19 19
// CHECK-NEXT: 714 eq 10 713 100
// CHECK-NEXT: 715 or 10 714 713
// CHECK-NEXT: 716 slice 10 24 20 20
// CHECK-NEXT: 717 eq 10 716 100
// CHECK-NEXT: 718 or 10 717 716
// CHECK-NEXT: 719 slice 10 24 21 21
// CHECK-NEXT: 720 eq 10 719 100
// CHECK-NEXT: 721 or 10 720 719
// CHECK-NEXT: 722 slice 10 24 22 22
// CHECK-NEXT: 723 eq 10 722 100
// CHECK-NEXT: 724 or 10 723 722
// CHECK-NEXT: 725 slice 10 24 23 23
// CHECK-NEXT: 726 eq 10 725 100
// CHECK-NEXT: 727 or 10 726 725
// CHECK-NEXT: 728 slice 10 24 24 24
// CHECK-NEXT: 729 eq 10 728 100
// CHECK-NEXT: 730 or 10 729 728
// CHECK-NEXT: 731 slice 10 24 25 25
// CHECK-NEXT: 732 eq 10 731 100
// CHECK-NEXT: 733 or 10 732 731
// CHECK-NEXT: 734 slice 10 24 26 26
// CHECK-NEXT: 735 eq 10 734 100
// CHECK-NEXT: 736 or 10 735 734
// CHECK-NEXT: 737 slice 10 24 27 27
// CHECK-NEXT: 738 eq 10 737 100
// CHECK-NEXT: 739 or 10 738 737
// CHECK-NEXT: 740 slice 10 24 28 28
// CHECK-NEXT: 741 eq 10 740 100
// CHECK-NEXT: 742 or 10 741 740
// CHECK-NEXT: 743 slice 10 24 29 29
// CHECK-NEXT: 744 eq 10 743 100
// CHECK-NEXT: 745 or 10 744 743
// CHECK-NEXT: 746 slice 10 24 30 30
// CHECK-NEXT: 747 eq 10 746 100
// CHECK-NEXT: 748 or 10 747 746
// CHECK-NEXT: 749 slice 10 24 31 31
// CHECK-NEXT: 750 eq 10 749 100
// CHECK-NEXT: 751 or 10 750 749
// CHECK-NEXT: 752 slice 10 24 32 32
// CHECK-NEXT: 753 eq 10 752 100
// CHECK-NEXT: 754 or 10 753 752
// CHECK-NEXT: 755 slice 10 24 33 33
// CHECK-NEXT: 756 eq 10 755 100
// CHECK-NEXT: 757 or 10 756 755
// CHECK-NEXT: 758 slice 10 24 34 34
// CHECK-NEXT: 759 eq 10 758 100
// CHECK-NEXT: 760 or 10 759 758
// CHECK-NEXT: 761 slice 10 24 35 35
// CHECK-NEXT: 762 eq 10 761 100
// CHECK-NEXT: 763 or 10 762 761
// CHECK-NEXT: 764 slice 10 24 36 36
// CHECK-NEXT: 765 eq 10 764 100
// CHECK-NEXT: 766 or 10 765 764
// CHECK-NEXT: 767 slice 10 24 37 37
// CHECK-NEXT: 768 eq 10 767 100
// CHECK-NEXT: 769 or 10 768 767
// CHECK-NEXT: 770 slice 10 24 38 38
// CHECK-NEXT: 771 eq 10 770 100
// CHECK-NEXT: 772 or 10 771 770
// CHECK-NEXT: 773 slice 10 24 39 39
// CHECK-NEXT: 774 eq 10 773 100
// CHECK-NEXT: 775 or 10 774 773
// CHECK-NEXT: 776 slice 10 24 40 40
// CHECK-NEXT: 777 eq 10 776 100
// CHECK-NEXT: 778 or 10 777 776
// CHECK-NEXT: 779 slice 10 24 41 41
// CHECK-NEXT: 780 eq 10 779 100
// CHECK-NEXT: 781 or 10 780 779
// CHECK-NEXT: 782 slice 10 24 42 42
// CHECK-NEXT: 783 eq 10 782 100
// CHECK-NEXT: 784 or 10 783 782
// CHECK-NEXT: 785 slice 10 24 43 43
// CHECK-NEXT: 786 eq 10 785 100
// CHECK-NEXT: 787 or 10 786 785
// CHECK-NEXT: 788 slice 10 24 44 44
// CHECK-NEXT: 789 eq 10 788 100
// CHECK-NEXT: 790 or 10 789 788
// CHECK-NEXT: 791 slice 10 24 45 45
// CHECK-NEXT: 792 eq 10 791 100
// CHECK-NEXT: 793 or 10 792 791
// CHECK-NEXT: 794 slice 10 24 46 46
// CHECK-NEXT: 795 eq 10 794 100
// CHECK-NEXT: 796 or 10 795 794
// CHECK-NEXT: 797 slice 10 24 47 47
// CHECK-NEXT: 798 eq 10 797 100
// CHECK-NEXT: 799 or 10 798 797
// CHECK-NEXT: 800 concat 104 661 658
// CHECK-NEXT: 801 concat 28 664 800
// CHECK-NEXT: 802 concat 7 667 801
// CHECK-NEXT: 803 concat 49 670 802
// CHECK-NEXT: 804 concat 203 673 803
// CHECK-NEXT: 805 concat 205 676 804
// CHECK-NEXT: 806 concat 207 679 805
// CHECK-NEXT: 807 concat 56 682 806
// CHECK-NEXT: 808 concat 210 685 807
// CHECK-NEXT: 809 concat 212 688 808
// CHECK-NEXT: 810 concat 214 691 809
// CHECK-NEXT: 811 concat 216 694 810
// CHECK-NEXT: 812 concat 218 697 811
// CHECK-NEXT: 813 concat 220 700 812
// CHECK-NEXT: 814 concat 222 703 813
// CHECK-NEXT: 815 concat 224 706 814
// CHECK-NEXT: 816 concat 16 709 815
// CHECK-NEXT: 817 concat 227 712 816
// CHECK-NEXT: 818 concat 229 715 817
// CHECK-NEXT: 819 concat 231 718 818
// CHECK-NEXT: 820 concat 233 721 819
// CHECK-NEXT: 821 concat 235 724 820
// CHECK-NEXT: 822 concat 237 727 821
// CHECK-NEXT: 823 concat 239 730 822
// CHECK-NEXT: 824 concat 241 733 823
// CHECK-NEXT: 825 concat 46 736 824
// CHECK-NEXT: 826 concat 244 739 825
// CHECK-NEXT: 827 concat 246 742 826
// CHECK-NEXT: 828 concat 1 745 827
// CHECK-NEXT: 829 concat 450 748 828
// CHECK-NEXT: 830 concat 3 751 829
// CHECK-NEXT: 831 concat 455 754 830
// CHECK-NEXT: 832 concat 458 757 831
// CHECK-NEXT: 833 concat 461 760 832
// CHECK-NEXT: 834 concat 464 763 833
// CHECK-NEXT: 835 concat 467 766 834
// CHECK-NEXT: 836 concat 470 769 835
// CHECK-NEXT: 837 concat 473 772 836
// CHECK-NEXT: 838 concat 476 775 837
// CHECK-NEXT: 839 concat 479 778 838
// CHECK-NEXT: 840 concat 482 781 839
// CHECK-NEXT: 841 concat 485 784 840
// CHECK-NEXT: 842 concat 488 787 841
// CHECK-NEXT: 843 concat 491 790 842
// CHECK-NEXT: 844 concat 494 793 843
// CHECK-NEXT: 845 concat 497 796 844
// CHECK-NEXT: 846 concat 23 799 845
// CHECK-NEXT: 847 state 23
// CHECK-NEXT: 848 state 23
// CHECK-NEXT: 849 state 10
// CHECK-NEXT: 850 init 10 849 97
// CHECK-NEXT: 851 concat 104 103 849
// CHECK-NEXT: 852 eq 10 851 106
// CHECK-NEXT: 853 ite 23 852 848 847
// CHECK-NEXT: 854 slice 10 45 0 0
// CHECK-NEXT: 855 ite 23 854 853 846
// CHECK-NEXT: 856 uext 28 607 1
// CHECK-NEXT: 857 eq 10 645 856
// CHECK-NEXT: 858 ite 23 857 855 655
// CHECK-NEXT: 859 uext 28 97 2
// CHECK-NEXT: 860 eq 10 645 859
// CHECK-NEXT: 861 ite 23 860 74 858
// CHECK-NEXT: 862 const 23 000000000000000000000000000000000000000000000000
// CHECK-NEXT: 863 redor 10 645
// CHECK-NEXT: 864 not 10 863
// CHECK-NEXT: 865 ite 23 864 862 861
// CHECK-NEXT: 866 xor 23 500 865
// CHECK-NEXT: 867 input 23
// CHECK-NEXT: 868 concat 23 258 350
// CHECK-NEXT: 869 slice 104 605 1 0
// CHECK-NEXT: 870 eq 10 869 607
// CHECK-NEXT: 871 ite 23 870 868 867
// CHECK-NEXT: 872 eq 10 869 106
// CHECK-NEXT: 873 ite 23 872 508 871
// CHECK-NEXT: 874 slice 46 258 26 0
// CHECK-NEXT: 875 slice 46 108 26 0
// CHECK-NEXT: 876 slice 10 50 0 0
// CHECK-NEXT: 877 neq 10 876 100
// CHECK-NEXT: 878 slice 10 55 0 0
// CHECK-NEXT: 879 xor 10 876 878
// CHECK-NEXT: 880 and 10 877 879
// CHECK-NEXT: 881 slice 10 50 1 1
// CHECK-NEXT: 882 neq 10 881 100
// CHECK-NEXT: 883 slice 10 55 1 1
// CHECK-NEXT: 884 xor 10 881 883
// CHECK-NEXT: 885 and 10 882 884
// CHECK-NEXT: 886 slice 10 50 2 2
// CHECK-NEXT: 887 neq 10 886 100
// CHECK-NEXT: 888 slice 10 55 2 2
// CHECK-NEXT: 889 xor 10 886 888
// CHECK-NEXT: 890 and 10 887 889
// CHECK-NEXT: 891 slice 10 50 3 3
// CHECK-NEXT: 892 neq 10 891 100
// CHECK-NEXT: 893 slice 10 55 3 3
// CHECK-NEXT: 894 xor 10 891 893
// CHECK-NEXT: 895 and 10 892 894
// CHECK-NEXT: 896 slice 10 50 4 4
// CHECK-NEXT: 897 neq 10 896 100
// CHECK-NEXT: 898 slice 10 55 4 4
// CHECK-NEXT: 899 xor 10 896 898
// CHECK-NEXT: 900 and 10 897 899
// CHECK-NEXT: 901 concat 104 885 880
// CHECK-NEXT: 902 concat 28 890 901
// CHECK-NEXT: 903 concat 7 895 902
// CHECK-NEXT: 904 concat 49 900 903
// CHECK-NEXT: 905 state 49
// CHECK-NEXT: 906 state 49
// CHECK-NEXT: 907 state 10
// CHECK-NEXT: 908 init 10 907 97
// CHECK-NEXT: 909 concat 104 103 907
// CHECK-NEXT: 910 eq 10 909 106
// CHECK-NEXT: 911 ite 49 910 906 905
// CHECK-NEXT: 912 slice 10 51 0 0
// CHECK-NEXT: 913 ite 49 912 911 904
// CHECK-NEXT: 914 slice 10 913 0 0
// CHECK-NEXT: 915 ite 46 914 875 874
// CHECK-NEXT: 916 const 46 000000000000000000000000000
// CHECK-NEXT: 917 slice 10 913 1 1
// CHECK-NEXT: 918 ite 46 917 916 915
// CHECK-NEXT: 919 slice 10 918 26 26
// CHECK-NEXT: 920 concat 244 919 918
// CHECK-NEXT: 921 slice 10 918 26 26
// CHECK-NEXT: 922 concat 246 921 920
// CHECK-NEXT: 923 slice 10 918 26 26
// CHECK-NEXT: 924 concat 1 923 922
// CHECK-NEXT: 925 slice 10 918 26 26
// CHECK-NEXT: 926 concat 450 925 924
// CHECK-NEXT: 927 slice 10 918 26 26
// CHECK-NEXT: 928 concat 3 927 926
// CHECK-NEXT: 929 slice 10 918 26 26
// CHECK-NEXT: 930 concat 455 929 928
// CHECK-NEXT: 931 slice 10 918 26 26
// CHECK-NEXT: 932 concat 458 931 930
// CHECK-NEXT: 933 slice 10 918 26 26
// CHECK-NEXT: 934 concat 461 933 932
// CHECK-NEXT: 935 slice 10 918 26 26
// CHECK-NEXT: 936 concat 464 935 934
// CHECK-NEXT: 937 slice 10 918 26 26
// CHECK-NEXT: 938 concat 467 937 936
// CHECK-NEXT: 939 slice 10 918 26 26
// CHECK-NEXT: 940 concat 470 939 938
// CHECK-NEXT: 941 slice 10 918 26 26
// CHECK-NEXT: 942 concat 473 941 940
// CHECK-NEXT: 943 slice 10 918 26 26
// CHECK-NEXT: 944 concat 476 943 942
// CHECK-NEXT: 945 slice 10 918 26 26
// CHECK-NEXT: 946 concat 479 945 944
// CHECK-NEXT: 947 slice 10 918 26 26
// CHECK-NEXT: 948 concat 482 947 946
// CHECK-NEXT: 949 slice 10 918 26 26
// CHECK-NEXT: 950 concat 485 949 948
// CHECK-NEXT: 951 slice 10 918 26 26
// CHECK-NEXT: 952 concat 488 951 950
// CHECK-NEXT: 953 slice 10 918 26 26
// CHECK-NEXT: 954 concat 491 953 952
// CHECK-NEXT: 955 slice 10 913 4 4
// CHECK-NEXT: 956 ite 16 955 269 350
// CHECK-NEXT: 957 slice 10 956 17 17
// CHECK-NEXT: 958 concat 227 957 956
// CHECK-NEXT: 959 slice 10 956 17 17
// CHECK-NEXT: 960 concat 229 959 958
// CHECK-NEXT: 961 slice 10 956 17 17
// CHECK-NEXT: 962 concat 231 961 960
// CHECK-NEXT: 963 slice 10 956 17 17
// CHECK-NEXT: 964 concat 233 963 962
// CHECK-NEXT: 965 slice 10 956 17 17
// CHECK-NEXT: 966 concat 235 965 964
// CHECK-NEXT: 967 slice 10 956 17 17
// CHECK-NEXT: 968 concat 237 967 966
// CHECK-NEXT: 969 slice 10 956 17 17
// CHECK-NEXT: 970 concat 239 969 968
// CHECK-NEXT: 971 slice 10 956 17 17
// CHECK-NEXT: 972 concat 241 971 970
// CHECK-NEXT: 973 slice 10 956 17 17
// CHECK-NEXT: 974 concat 46 973 972
// CHECK-NEXT: 975 slice 10 956 17 17
// CHECK-NEXT: 976 concat 244 975 974
// CHECK-NEXT: 977 slice 10 956 17 17
// CHECK-NEXT: 978 concat 246 977 976
// CHECK-NEXT: 979 slice 10 956 17 17
// CHECK-NEXT: 980 concat 1 979 978
// CHECK-NEXT: 981 slice 10 956 17 17
// CHECK-NEXT: 982 concat 450 981 980
// CHECK-NEXT: 983 slice 10 956 17 17
// CHECK-NEXT: 984 concat 3 983 982
// CHECK-NEXT: 985 slice 10 956 17 17
// CHECK-NEXT: 986 concat 455 985 984
// CHECK-NEXT: 987 slice 10 956 17 17
// CHECK-NEXT: 988 concat 458 987 986
// CHECK-NEXT: 989 slice 10 956 17 17
// CHECK-NEXT: 990 concat 461 989 988
// CHECK-NEXT: 991 slice 10 956 17 17
// CHECK-NEXT: 992 concat 464 991 990
// CHECK-NEXT: 993 slice 10 956 17 17
// CHECK-NEXT: 994 concat 467 993 992
// CHECK-NEXT: 995 slice 10 956 17 17
// CHECK-NEXT: 996 concat 470 995 994
// CHECK-NEXT: 997 slice 10 956 17 17
// CHECK-NEXT: 998 concat 473 997 996
// CHECK-NEXT: 999 slice 10 956 17 17
// CHECK-NEXT: 1000 concat 476 999 998
// CHECK-NEXT: 1001 slice 10 956 17 17
// CHECK-NEXT: 1002 concat 479 1001 1000
// CHECK-NEXT: 1003 slice 10 956 17 17
// CHECK-NEXT: 1004 concat 482 1003 1002
// CHECK-NEXT: 1005 slice 10 956 17 17
// CHECK-NEXT: 1006 concat 485 1005 1004
// CHECK-NEXT: 1007 slice 10 956 17 17
// CHECK-NEXT: 1008 concat 488 1007 1006
// CHECK-NEXT: 1009 slice 10 956 17 17
// CHECK-NEXT: 1010 concat 491 1009 1008
// CHECK-NEXT: 1011 mul 491 954 1010
// CHECK-NEXT: 1012 slice 488 1011 43 0
// CHECK-NEXT: 1013 input 488
// CHECK-NEXT: 1014 and 488 1012 1013
// CHECK-NEXT: 1015 concat 491 97 1014
// CHECK-NEXT: 1016 state 491
// CHECK-NEXT: 1017 state 491
// CHECK-NEXT: 1018 state 10
// CHECK-NEXT: 1019 init 10 1018 97
// CHECK-NEXT: 1020 concat 104 103 1018
// CHECK-NEXT: 1021 eq 10 1020 106
// CHECK-NEXT: 1022 ite 491 1021 1017 1016
// CHECK-NEXT: 1023 slice 10 69 0 0
// CHECK-NEXT: 1024 ite 491 1023 1022 1015
// CHECK-NEXT: 1025 slice 10 1024 44 44
// CHECK-NEXT: 1026 concat 494 1025 1024
// CHECK-NEXT: 1027 slice 10 1024 44 44
// CHECK-NEXT: 1028 concat 497 1027 1026
// CHECK-NEXT: 1029 slice 10 1024 44 44
// CHECK-NEXT: 1030 concat 23 1029 1028
// CHECK-NEXT: 1031 uext 104 97 1
// CHECK-NEXT: 1032 eq 10 869 1031
// CHECK-NEXT: 1033 ite 23 1032 1030 873
// CHECK-NEXT: 1034 const 104 00
// CHECK-NEXT: 1035 const 10 0
// CHECK-NEXT: 1036 concat 104 70 1035
// CHECK-NEXT: 1037 ite 104 650 1036 1034
// CHECK-NEXT: 1038 const 494 0000000000000000000000000000000000000000000000
// CHECK-NEXT: 1039 concat 23 1038 1037
// CHECK-NEXT: 1040 redor 10 869
// CHECK-NEXT: 1041 not 10 1040
// CHECK-NEXT: 1042 ite 23 1041 1039 1033
// CHECK-NEXT: 1043 xor 23 866 1042
// CHECK-NEXT: 1044 input 23
// CHECK-NEXT: 1045 slice 104 605 3 2
// CHECK-NEXT: 1046 eq 10 1045 607
// CHECK-NEXT: 1047 ite 23 1046 855 1044
// CHECK-NEXT: 1048 const 23 111111111111111111111111111111111111111111111111
// CHECK-NEXT: 1049 eq 10 1045 106
// CHECK-NEXT: 1050 ite 23 1049 1048 1047
// CHECK-NEXT: 1051 input 488
// CHECK-NEXT: 1052 and 488 1012 1051
// CHECK-NEXT: 1053 slice 10 1011 44 44
// CHECK-NEXT: 1054 not 10 1053
// CHECK-NEXT: 1055 concat 491 1054 1052
// CHECK-NEXT: 1056 state 491
// CHECK-NEXT: 1057 state 491
// CHECK-NEXT: 1058 state 10
// CHECK-NEXT: 1059 init 10 1058 97
// CHECK-NEXT: 1060 concat 104 103 1058
// CHECK-NEXT: 1061 eq 10 1060 106
// CHECK-NEXT: 1062 ite 491 1061 1057 1056
// CHECK-NEXT: 1063 ite 491 1023 1062 1055
// CHECK-NEXT: 1064 const 28 000
// CHECK-NEXT: 1065 concat 23 1064 1063
// CHECK-NEXT: 1066 uext 104 97 1
// CHECK-NEXT: 1067 eq 10 1045 1066
// CHECK-NEXT: 1068 ite 23 1067 1065 1050
// CHECK-NEXT: 1069 redor 10 1045
// CHECK-NEXT: 1070 not 10 1069
// CHECK-NEXT: 1071 ite 23 1070 862 1068
// CHECK-NEXT: 1072 xor 23 1043 1071
// CHECK-NEXT: 1073 and 23 1042 1071
// CHECK-NEXT: 1074 and 23 866 1071
// CHECK-NEXT: 1075 or 23 1073 1074
// CHECK-NEXT: 1076 and 23 1042 866
// CHECK-NEXT: 1077 or 23 1075 1076
// CHECK-NEXT: 1078 slice 10 386 3 3
// CHECK-NEXT: 1079 ite 23 1078 1077 1072
// CHECK-NEXT: 1080 slice 10 386 2 2
// CHECK-NEXT: 1081 ite 23 1080 862 1077
// CHECK-NEXT: 1082 slice 497 1081 46 0
// CHECK-NEXT: 1083 concat 23 1082 1035
// CHECK-NEXT: 1084 and 23 1079 1083
// CHECK-NEXT: 1085 input 23
// CHECK-NEXT: 1086 slice 104 605 8 7
// CHECK-NEXT: 1087 eq 10 1086 607
// CHECK-NEXT: 1088 ite 23 1087 855 1085
// CHECK-NEXT: 1089 eq 10 1086 106
// CHECK-NEXT: 1090 ite 23 1089 77 1088
// CHECK-NEXT: 1091 uext 104 97 1
// CHECK-NEXT: 1092 eq 10 1086 1091
// CHECK-NEXT: 1093 ite 23 1092 508 1090
// CHECK-NEXT: 1094 redor 10 1086
// CHECK-NEXT: 1095 not 10 1094
// CHECK-NEXT: 1096 ite 23 1095 862 1093
// CHECK-NEXT: 1097 and 23 1096 1083
// CHECK-NEXT: 1098 or 23 1084 1097
// CHECK-NEXT: 1099 and 23 1079 1096
// CHECK-NEXT: 1100 or 23 1098 1099
// CHECK-NEXT: 1101 slice 216 1100 47 35
// CHECK-NEXT: 1102 uext 218 1101 1
// CHECK-NEXT: 1103 xor 23 1079 1083
// CHECK-NEXT: 1104 xor 23 1103 1096
// CHECK-NEXT: 1105 slice 214 1104 47 36
// CHECK-NEXT: 1106 slice 10 1081 47 47
// CHECK-NEXT: 1107 concat 216 1106 1105
// CHECK-NEXT: 1108 uext 218 1107 1
// CHECK-NEXT: 1109 add 218 1102 1108
// CHECK-NEXT: 1110 slice 214 1100 34 23
// CHECK-NEXT: 1111 uext 216 1110 1
// CHECK-NEXT: 1112 slice 214 1104 35 24
// CHECK-NEXT: 1113 uext 216 1112 1
// CHECK-NEXT: 1114 add 216 1111 1113
// CHECK-NEXT: 1115 slice 214 1100 22 11
// CHECK-NEXT: 1116 uext 216 1115 1
// CHECK-NEXT: 1117 slice 214 1104 23 12
// CHECK-NEXT: 1118 uext 216 1117 1
// CHECK-NEXT: 1119 add 216 1116 1118
// CHECK-NEXT: 1120 input 10
// CHECK-NEXT: 1121 slice 10 508 47 47
// CHECK-NEXT: 1122 not 10 1121
// CHECK-NEXT: 1123 slice 10 29 0 0
// CHECK-NEXT: 1124 neq 10 1123 100
// CHECK-NEXT: 1125 and 10 1124 1123
// CHECK-NEXT: 1126 slice 10 29 1 1
// CHECK-NEXT: 1127 neq 10 1126 100
// CHECK-NEXT: 1128 and 10 1127 1126
// CHECK-NEXT: 1129 slice 10 29 2 2
// CHECK-NEXT: 1130 neq 10 1129 100
// CHECK-NEXT: 1131 and 10 1130 1129
// CHECK-NEXT: 1132 concat 104 1128 1125
// CHECK-NEXT: 1133 concat 28 1131 1132
// CHECK-NEXT: 1134 state 28
// CHECK-NEXT: 1135 state 28
// CHECK-NEXT: 1136 state 10
// CHECK-NEXT: 1137 init 10 1136 97
// CHECK-NEXT: 1138 concat 104 103 1136
// CHECK-NEXT: 1139 eq 10 1138 106
// CHECK-NEXT: 1140 ite 28 1139 1135 1134
// CHECK-NEXT: 1141 slice 10 30 0 0
// CHECK-NEXT: 1142 ite 28 1141 1140 1133
// CHECK-NEXT: 1143 const 28 111
// CHECK-NEXT: 1144 eq 10 1142 1143
// CHECK-NEXT: 1145 ite 10 1144 1122 1120
// CHECK-NEXT: 1146 slice 10 918 26 26
// CHECK-NEXT: 1147 slice 10 956 17 17
// CHECK-NEXT: 1148 xor 10 1146 1147
// CHECK-NEXT: 1149 not 10 1148
// CHECK-NEXT: 1150 state 10
// CHECK-NEXT: 1151 state 10
// CHECK-NEXT: 1152 state 10
// CHECK-NEXT: 1153 init 10 1152 97
// CHECK-NEXT: 1154 concat 104 103 1152
// CHECK-NEXT: 1155 eq 10 1154 106
// CHECK-NEXT: 1156 ite 10 1155 1151 1150
// CHECK-NEXT: 1157 ite 10 1023 1156 1149
// CHECK-NEXT: 1158 not 10 1157
// CHECK-NEXT: 1159 const 28 110
// CHECK-NEXT: 1160 eq 10 1142 1159
// CHECK-NEXT: 1161 ite 10 1160 1158 1145
// CHECK-NEXT: 1162 eq 10 1142 646
// CHECK-NEXT: 1163 ite 10 1162 1121 1161
// CHECK-NEXT: 1164 state 10
// CHECK-NEXT: 1165 state 10
// CHECK-NEXT: 1166 state 10
// CHECK-NEXT: 1167 init 10 1166 97
// CHECK-NEXT: 1168 concat 104 103 1166
// CHECK-NEXT: 1169 eq 10 1168 106
// CHECK-NEXT: 1170 ite 10 1169 1165 1164
// CHECK-NEXT: 1171 state 7
// CHECK-NEXT: 1172 state 7
// CHECK-NEXT: 1173 state 10
// CHECK-NEXT: 1174 init 10 1173 97
// CHECK-NEXT: 1175 concat 104 103 1173
// CHECK-NEXT: 1176 eq 10 1175 106
// CHECK-NEXT: 1177 ite 7 1176 1172 1171
// CHECK-NEXT: 1178 slice 10 1177 3 3
// CHECK-NEXT: 1179 xor 10 1170 1178
// CHECK-NEXT: 1180 not 10 1179
// CHECK-NEXT: 1181 eq 10 1142 649
// CHECK-NEXT: 1182 ite 10 1181 1180 1163
// CHECK-NEXT: 1183 slice 10 74 47 47
// CHECK-NEXT: 1184 not 10 1183
// CHECK-NEXT: 1185 uext 28 607 1
// CHECK-NEXT: 1186 eq 10 1142 1185
// CHECK-NEXT: 1187 ite 10 1186 1184 1182
// CHECK-NEXT: 1188 not 10 25
// CHECK-NEXT: 1189 uext 28 106 1
// CHECK-NEXT: 1190 eq 10 1142 1189
// CHECK-NEXT: 1191 ite 10 1190 1188 1187
// CHECK-NEXT: 1192 uext 28 97 2
// CHECK-NEXT: 1193 eq 10 1142 1192
// CHECK-NEXT: 1194 ite 10 1193 1183 1191
// CHECK-NEXT: 1195 neq 10 26 100
// CHECK-NEXT: 1196 xor 10 26 53
// CHECK-NEXT: 1197 and 10 1195 1196
// CHECK-NEXT: 1198 state 10
// CHECK-NEXT: 1199 state 10
// CHECK-NEXT: 1200 state 10
// CHECK-NEXT: 1201 init 10 1200 97
// CHECK-NEXT: 1202 concat 104 103 1200
// CHECK-NEXT: 1203 eq 10 1202 106
// CHECK-NEXT: 1204 ite 10 1203 1199 1198
// CHECK-NEXT: 1205 slice 10 27 0 0
// CHECK-NEXT: 1206 ite 10 1205 1204 1197
// CHECK-NEXT: 1207 not 10 1206
// CHECK-NEXT: 1208 redor 10 1142
// CHECK-NEXT: 1209 not 10 1208
// CHECK-NEXT: 1210 ite 10 1209 1207 1194
// CHECK-NEXT: 1211 not 10 1210
// CHECK-NEXT: 1212 or 10 1078 1080
// CHECK-NEXT: 1213 ite 10 1212 1035 1211
// CHECK-NEXT: 1214 slice 212 1100 10 0
// CHECK-NEXT: 1215 concat 214 1214 1213
// CHECK-NEXT: 1216 uext 216 1215 1
// CHECK-NEXT: 1217 slice 214 1104 11 0
// CHECK-NEXT: 1218 uext 216 1217 1
// CHECK-NEXT: 1219 add 216 1216 1218
// CHECK-NEXT: 1220 slice 10 1219 12 12
// CHECK-NEXT: 1221 uext 216 1220 12
// CHECK-NEXT: 1222 add 216 1119 1221
// CHECK-NEXT: 1223 slice 10 1222 12 12
// CHECK-NEXT: 1224 uext 216 1223 12
// CHECK-NEXT: 1225 add 216 1114 1224
// CHECK-NEXT: 1226 slice 10 1225 12 12
// CHECK-NEXT: 1227 uext 218 1226 13
// CHECK-NEXT: 1228 add 218 1109 1227
// CHECK-NEXT: 1229 slice 10 1228 12 12
// CHECK-NEXT: 1230 xor 10 389 1229
// CHECK-NEXT: 1231 xor 10 389 1230
// CHECK-NEXT: 1232 slice 10 76 0 0
// CHECK-NEXT: 1233 ite 10 1232 1179 1231
// CHECK-NEXT: 1234 output 1233 CARRYCASCOUT 
// CHECK-NEXT: 1235 input 7
// CHECK-NEXT: 1236 const 7 0111
// CHECK-NEXT: 1237 and 7 1235 1236
// CHECK-NEXT: 1238 concat 7 1230 1064
// CHECK-NEXT: 1239 or 7 1237 1238
// CHECK-NEXT: 1240 ite 7 1232 1177 1239
// CHECK-NEXT: 1241 output 1240 CARRYOUT 
// CHECK-NEXT: 1242 slice 10 1228 13 13
// CHECK-NEXT: 1243 state 10
// CHECK-NEXT: 1244 state 10
// CHECK-NEXT: 1245 state 10
// CHECK-NEXT: 1246 init 10 1245 97
// CHECK-NEXT: 1247 concat 104 103 1245
// CHECK-NEXT: 1248 eq 10 1247 106
// CHECK-NEXT: 1249 ite 10 1248 1244 1243
// CHECK-NEXT: 1250 ite 10 1232 1249 1242
// CHECK-NEXT: 1251 output 1250 MULTSIGNOUT 
// CHECK-NEXT: 1252 input 10
// CHECK-NEXT: 1253 output 1252 OVERFLOW 
// CHECK-NEXT: 1254 slice 10 386 1 1
// CHECK-NEXT: 1255 slice 10 386 1 1
// CHECK-NEXT: 1256 concat 104 1255 1254
// CHECK-NEXT: 1257 slice 10 386 1 1
// CHECK-NEXT: 1258 concat 28 1257 1256
// CHECK-NEXT: 1259 slice 10 386 1 1
// CHECK-NEXT: 1260 concat 7 1259 1258
// CHECK-NEXT: 1261 slice 10 386 1 1
// CHECK-NEXT: 1262 concat 49 1261 1260
// CHECK-NEXT: 1263 slice 10 386 1 1
// CHECK-NEXT: 1264 concat 203 1263 1262
// CHECK-NEXT: 1265 slice 10 386 1 1
// CHECK-NEXT: 1266 concat 205 1265 1264
// CHECK-NEXT: 1267 slice 10 386 1 1
// CHECK-NEXT: 1268 concat 207 1267 1266
// CHECK-NEXT: 1269 slice 10 386 1 1
// CHECK-NEXT: 1270 concat 56 1269 1268
// CHECK-NEXT: 1271 slice 10 386 1 1
// CHECK-NEXT: 1272 concat 210 1271 1270
// CHECK-NEXT: 1273 slice 10 386 1 1
// CHECK-NEXT: 1274 concat 212 1273 1272
// CHECK-NEXT: 1275 slice 10 386 1 1
// CHECK-NEXT: 1276 concat 214 1275 1274
// CHECK-NEXT: 1277 slice 10 386 1 1
// CHECK-NEXT: 1278 concat 216 1277 1276
// CHECK-NEXT: 1279 slice 10 386 1 1
// CHECK-NEXT: 1280 concat 218 1279 1278
// CHECK-NEXT: 1281 slice 10 386 1 1
// CHECK-NEXT: 1282 concat 220 1281 1280
// CHECK-NEXT: 1283 slice 10 386 1 1
// CHECK-NEXT: 1284 concat 222 1283 1282
// CHECK-NEXT: 1285 slice 10 386 1 1
// CHECK-NEXT: 1286 concat 224 1285 1284
// CHECK-NEXT: 1287 slice 10 386 1 1
// CHECK-NEXT: 1288 concat 16 1287 1286
// CHECK-NEXT: 1289 slice 10 386 1 1
// CHECK-NEXT: 1290 concat 227 1289 1288
// CHECK-NEXT: 1291 slice 10 386 1 1
// CHECK-NEXT: 1292 concat 229 1291 1290
// CHECK-NEXT: 1293 slice 10 386 1 1
// CHECK-NEXT: 1294 concat 231 1293 1292
// CHECK-NEXT: 1295 slice 10 386 1 1
// CHECK-NEXT: 1296 concat 233 1295 1294
// CHECK-NEXT: 1297 slice 10 386 1 1
// CHECK-NEXT: 1298 concat 235 1297 1296
// CHECK-NEXT: 1299 slice 10 386 1 1
// CHECK-NEXT: 1300 concat 237 1299 1298
// CHECK-NEXT: 1301 slice 10 386 1 1
// CHECK-NEXT: 1302 concat 239 1301 1300
// CHECK-NEXT: 1303 slice 10 386 1 1
// CHECK-NEXT: 1304 concat 241 1303 1302
// CHECK-NEXT: 1305 slice 10 386 1 1
// CHECK-NEXT: 1306 concat 46 1305 1304
// CHECK-NEXT: 1307 slice 10 386 1 1
// CHECK-NEXT: 1308 concat 244 1307 1306
// CHECK-NEXT: 1309 slice 10 386 1 1
// CHECK-NEXT: 1310 concat 246 1309 1308
// CHECK-NEXT: 1311 slice 10 386 1 1
// CHECK-NEXT: 1312 concat 1 1311 1310
// CHECK-NEXT: 1313 slice 10 386 1 1
// CHECK-NEXT: 1314 concat 450 1313 1312
// CHECK-NEXT: 1315 slice 10 386 1 1
// CHECK-NEXT: 1316 concat 3 1315 1314
// CHECK-NEXT: 1317 slice 10 386 1 1
// CHECK-NEXT: 1318 concat 455 1317 1316
// CHECK-NEXT: 1319 slice 10 386 1 1
// CHECK-NEXT: 1320 concat 458 1319 1318
// CHECK-NEXT: 1321 slice 10 386 1 1
// CHECK-NEXT: 1322 concat 461 1321 1320
// CHECK-NEXT: 1323 slice 10 386 1 1
// CHECK-NEXT: 1324 concat 464 1323 1322
// CHECK-NEXT: 1325 slice 10 386 1 1
// CHECK-NEXT: 1326 concat 467 1325 1324
// CHECK-NEXT: 1327 slice 10 386 1 1
// CHECK-NEXT: 1328 concat 470 1327 1326
// CHECK-NEXT: 1329 slice 10 386 1 1
// CHECK-NEXT: 1330 concat 473 1329 1328
// CHECK-NEXT: 1331 slice 10 386 1 1
// CHECK-NEXT: 1332 concat 476 1331 1330
// CHECK-NEXT: 1333 slice 10 386 1 1
// CHECK-NEXT: 1334 concat 479 1333 1332
// CHECK-NEXT: 1335 slice 10 386 1 1
// CHECK-NEXT: 1336 concat 482 1335 1334
// CHECK-NEXT: 1337 slice 10 386 1 1
// CHECK-NEXT: 1338 concat 485 1337 1336
// CHECK-NEXT: 1339 slice 10 386 1 1
// CHECK-NEXT: 1340 concat 488 1339 1338
// CHECK-NEXT: 1341 slice 10 386 1 1
// CHECK-NEXT: 1342 concat 491 1341 1340
// CHECK-NEXT: 1343 slice 10 386 1 1
// CHECK-NEXT: 1344 concat 494 1343 1342
// CHECK-NEXT: 1345 slice 10 386 1 1
// CHECK-NEXT: 1346 concat 497 1345 1344
// CHECK-NEXT: 1347 slice 10 386 1 1
// CHECK-NEXT: 1348 concat 23 1347 1346
// CHECK-NEXT: 1349 slice 214 1219 11 0
// CHECK-NEXT: 1350 slice 214 1222 11 0
// CHECK-NEXT: 1351 concat 237 1350 1349
// CHECK-NEXT: 1352 slice 214 1225 11 0
// CHECK-NEXT: 1353 concat 464 1352 1351
// CHECK-NEXT: 1354 slice 214 1228 11 0
// CHECK-NEXT: 1355 concat 23 1354 1353
// CHECK-NEXT: 1356 xor 23 1348 1355
// CHECK-NEXT: 1357 ite 23 1232 508 1356
// CHECK-NEXT: 1358 output 1357 P 
// CHECK-NEXT: 1359 xor 23 73 1356
// CHECK-NEXT: 1360 or 23 1359 1048
// CHECK-NEXT: 1361 redand 10 1360
// CHECK-NEXT: 1362 state 10
// CHECK-NEXT: 1363 state 10
// CHECK-NEXT: 1364 state 10
// CHECK-NEXT: 1365 init 10 1364 97
// CHECK-NEXT: 1366 concat 104 103 1364
// CHECK-NEXT: 1367 eq 10 1366 106
// CHECK-NEXT: 1368 ite 10 1367 1363 1362
// CHECK-NEXT: 1369 ite 10 1232 1368 1361
// CHECK-NEXT: 1370 output 1369 PATTERNBDETECT 
// CHECK-NEXT: 1371 not 23 1359
// CHECK-NEXT: 1372 or 23 1371 1048
// CHECK-NEXT: 1373 redand 10 1372
// CHECK-NEXT: 1374 state 10
// CHECK-NEXT: 1375 state 10
// CHECK-NEXT: 1376 state 10
// CHECK-NEXT: 1377 init 10 1376 97
// CHECK-NEXT: 1378 concat 104 103 1376
// CHECK-NEXT: 1379 eq 10 1378 106
// CHECK-NEXT: 1380 ite 10 1379 1375 1374
// CHECK-NEXT: 1381 ite 10 1232 1380 1373
// CHECK-NEXT: 1382 output 1381 PATTERNDETECT 
// CHECK-NEXT: 1383 output 1357 PCOUT 
// CHECK-NEXT: 1384 input 10
// CHECK-NEXT: 1385 output 1384 UNDERFLOW 
// CHECK-NEXT: 1386 const 207 00000000
// CHECK-NEXT: 1387 state 207
// CHECK-NEXT: 1388 state 207
// CHECK-NEXT: 1389 state 10
// CHECK-NEXT: 1390 init 10 1389 97
// CHECK-NEXT: 1391 concat 104 103 1389
// CHECK-NEXT: 1392 eq 10 1391 106
// CHECK-NEXT: 1393 ite 207 1392 1388 1387
// CHECK-NEXT: 1394 ite 207 1232 1393 1386
// CHECK-NEXT: 1395 output 1394 XOROUT 
// CHECK-NEXT: 1396 uext 1 108 0 A1_reg 
// CHECK-NEXT: 1397 uext 46 918 0 A2A1 
// CHECK-NEXT: 1398 uext 1 255 0 A2_reg 
// CHECK-NEXT: 1399 uext 104 259 0 ACASCREG_BIN 
// CHECK-NEXT: 1400 uext 3 4 0 ACASCREG_REG 
// CHECK-NEXT: 1401 uext 1 5 0 ACIN_in 
// CHECK-NEXT: 1402 slice 10 6 0 0
// CHECK-NEXT: 1403 uext 10 1402 0 ADREG_BIN 
// CHECK-NEXT: 1404 uext 10 1035 0 ADREG_INT 
// CHECK-NEXT: 1405 uext 3 6 0 ADREG_REG 
// CHECK-NEXT: 1406 uext 10 389 0 ALUMODE10_in 
// CHECK-NEXT: 1407 uext 10 1170 0 ALUMODE10_reg 
// CHECK-NEXT: 1408 uext 10 385 0 ALUMODEREG_BIN 
// CHECK-NEXT: 1409 uext 3 9 0 ALUMODEREG_REG 
// CHECK-NEXT: 1410 uext 7 386 0 ALUMODE_DATA 
// CHECK-NEXT: 1411 uext 7 377 0 ALUMODE_in 
// CHECK-NEXT: 1412 uext 7 384 0 ALUMODE_reg 
// CHECK-NEXT: 1413 uext 23 1356 0 ALU_OUT_in 
// CHECK-NEXT: 1414 uext 23 508 0 ALU_OUT_reg 
// CHECK-NEXT: 1415 uext 10 1146 0 AMULT26_in 
// CHECK-NEXT: 1416 uext 10 1035 0 AMULTSEL_BIN 
// CHECK-NEXT: 1417 const 220 000000000000000
// CHECK-NEXT: 1418 concat 222 1417 11
// CHECK-NEXT: 1419 uext 222 1418 0 AMULTSEL_REG 
// CHECK-NEXT: 1420 uext 104 256 0 AREG_BIN 
// CHECK-NEXT: 1421 uext 3 12 0 AREG_REG 
// CHECK-NEXT: 1422 uext 104 1034 0 AUTORESET_PATDET_BIN 
// CHECK-NEXT: 1423 sort bitvec 120
// CHECK-NEXT: 1424 sort bitvec 119
// CHECK-NEXT: 1425 const 1424 00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
// CHECK-NEXT: 1426 concat 1423 1425 13
// CHECK-NEXT: 1427 uext 1423 1426 0 AUTORESET_PATDET_REG 
// CHECK-NEXT: 1428 uext 10 1035 0 AUTORESET_PRIORITY_BIN 
// CHECK-NEXT: 1429 const 473 000000000000000000000000000000000000000
// CHECK-NEXT: 1430 concat 476 1429 14
// CHECK-NEXT: 1431 uext 476 1430 0 AUTORESET_PRIORITY_REG 
// CHECK-NEXT: 1432 uext 1 258 0 A_ALU 
// CHECK-NEXT: 1433 uext 10 1035 0 A_INPUT_BIN 
// CHECK-NEXT: 1434 sort bitvec 56
// CHECK-NEXT: 1435 sort bitvec 55
// CHECK-NEXT: 1436 const 1435 0000000000000000000000000000000000000000000000000000000
// CHECK-NEXT: 1437 concat 1434 1436 15
// CHECK-NEXT: 1438 uext 1434 1437 0 A_INPUT_REG 
// CHECK-NEXT: 1439 uext 1 248 0 A_in 
// CHECK-NEXT: 1440 uext 16 269 0 B1_DATA_out 
// CHECK-NEXT: 1441 uext 16 956 0 B2B1 
// CHECK-NEXT: 1442 uext 16 350 0 B2_DATA 
// CHECK-NEXT: 1443 uext 16 347 0 B2_reg 
// CHECK-NEXT: 1444 uext 104 351 0 BCASCREG_BIN 
// CHECK-NEXT: 1445 uext 3 18 0 BCASCREG_REG 
// CHECK-NEXT: 1446 uext 16 19 0 BCIN_in 
// CHECK-NEXT: 1447 uext 10 1147 0 BMULT17_in 
// CHECK-NEXT: 1448 uext 10 1035 0 BMULTSEL_BIN 
// CHECK-NEXT: 1449 concat 222 1417 20
// CHECK-NEXT: 1450 uext 222 1449 0 BMULTSEL_REG 
// CHECK-NEXT: 1451 uext 104 348 0 BREG_BIN 
// CHECK-NEXT: 1452 uext 3 21 0 BREG_REG 
// CHECK-NEXT: 1453 uext 16 350 0 B_ALU 
// CHECK-NEXT: 1454 uext 10 1035 0 B_INPUT_BIN 
// CHECK-NEXT: 1455 concat 1434 1436 22
// CHECK-NEXT: 1456 uext 1434 1455 0 B_INPUT_REG 
// CHECK-NEXT: 1457 uext 16 340 0 B_in 
// CHECK-NEXT: 1458 uext 10 25 0 CARRYCASCIN_in 
// CHECK-NEXT: 1459 uext 10 1205 0 CARRYINREG_BIN 
// CHECK-NEXT: 1460 uext 3 27 0 CARRYINREG_REG 
// CHECK-NEXT: 1461 uext 10 1141 0 CARRYINSELREG_BIN 
// CHECK-NEXT: 1462 uext 3 30 0 CARRYINSELREG_REG 
// CHECK-NEXT: 1463 uext 28 1133 0 CARRYINSEL_in 
// CHECK-NEXT: 1464 uext 28 1142 0 CARRYINSEL_mux 
// CHECK-NEXT: 1465 uext 28 1140 0 CARRYINSEL_reg 
// CHECK-NEXT: 1466 uext 10 1197 0 CARRYIN_in 
// CHECK-NEXT: 1467 uext 10 1206 0 CARRYIN_mux 
// CHECK-NEXT: 1468 uext 10 1204 0 CARRYIN_reg 
// CHECK-NEXT: 1469 uext 10 1179 0 CCOUT_in 
// CHECK-NEXT: 1470 neq 10 31 100
// CHECK-NEXT: 1471 and 10 1470 31
// CHECK-NEXT: 1472 uext 10 1471 0 CEA1_in 
// CHECK-NEXT: 1473 neq 10 32 100
// CHECK-NEXT: 1474 and 10 1473 32
// CHECK-NEXT: 1475 uext 10 1474 0 CEA2_in 
// CHECK-NEXT: 1476 neq 10 34 100
// CHECK-NEXT: 1477 and 10 1476 34
// CHECK-NEXT: 1478 uext 10 1477 0 CEALUMODE_in 
// CHECK-NEXT: 1479 neq 10 35 100
// CHECK-NEXT: 1480 and 10 1479 35
// CHECK-NEXT: 1481 uext 10 1480 0 CEB1_in 
// CHECK-NEXT: 1482 neq 10 36 100
// CHECK-NEXT: 1483 and 10 1482 36
// CHECK-NEXT: 1484 uext 10 1483 0 CEB2_in 
// CHECK-NEXT: 1485 neq 10 38 100
// CHECK-NEXT: 1486 and 10 1485 38
// CHECK-NEXT: 1487 uext 10 1486 0 CECARRYIN_in 
// CHECK-NEXT: 1488 neq 10 39 100
// CHECK-NEXT: 1489 and 10 1488 39
// CHECK-NEXT: 1490 uext 10 1489 0 CECTRL_in 
// CHECK-NEXT: 1491 neq 10 37 100
// CHECK-NEXT: 1492 and 10 1491 37
// CHECK-NEXT: 1493 uext 10 1492 0 CEC_in 
// CHECK-NEXT: 1494 uext 10 41 0 CEINMODE_in 
// CHECK-NEXT: 1495 neq 10 42 100
// CHECK-NEXT: 1496 and 10 1495 42
// CHECK-NEXT: 1497 uext 10 1496 0 CEM_in 
// CHECK-NEXT: 1498 neq 10 43 100
// CHECK-NEXT: 1499 and 10 1498 43
// CHECK-NEXT: 1500 uext 10 1499 0 CEP_in 
// CHECK-NEXT: 1501 uext 10 103 0 CLK_in 
// CHECK-NEXT: 1502 input 7
// CHECK-NEXT: 1503 and 7 1502 1236
// CHECK-NEXT: 1504 or 7 1503 1238
// CHECK-NEXT: 1505 uext 7 1504 0 COUT_in 
// CHECK-NEXT: 1506 uext 7 1177 0 COUT_reg 
// CHECK-NEXT: 1507 uext 10 854 0 CREG_BIN 
// CHECK-NEXT: 1508 uext 3 45 0 CREG_REG 
// CHECK-NEXT: 1509 uext 23 855 0 C_DATA_in 
// CHECK-NEXT: 1510 uext 23 846 0 C_in 
// CHECK-NEXT: 1511 uext 23 853 0 C_reg 
// CHECK-NEXT: 1512 slice 10 48 0 0
// CHECK-NEXT: 1513 uext 10 1512 0 DREG_BIN 
// CHECK-NEXT: 1514 uext 10 1035 0 DREG_INT 
// CHECK-NEXT: 1515 uext 3 48 0 DREG_REG 
// CHECK-NEXT: 1516 uext 10 912 0 INMODEREG_BIN 
// CHECK-NEXT: 1517 uext 3 51 0 INMODEREG_REG 
// CHECK-NEXT: 1518 uext 49 904 0 INMODE_in 
// CHECK-NEXT: 1519 uext 49 913 0 INMODE_mux 
// CHECK-NEXT: 1520 uext 49 911 0 INMODE_reg 
// CHECK-NEXT: 1521 uext 7 52 0 IS_ALUMODE_INVERTED_REG 
// CHECK-NEXT: 1522 uext 10 53 0 IS_CARRYIN_INVERTED_REG 
// CHECK-NEXT: 1523 uext 10 54 0 IS_CLK_INVERTED_REG 
// CHECK-NEXT: 1524 uext 49 55 0 IS_INMODE_INVERTED_REG 
// CHECK-NEXT: 1525 uext 56 57 0 IS_OPMODE_INVERTED_REG 
// CHECK-NEXT: 1526 uext 10 58 0 IS_RSTALLCARRYIN_INVERTED_REG 
// CHECK-NEXT: 1527 uext 10 59 0 IS_RSTALUMODE_INVERTED_REG 
// CHECK-NEXT: 1528 uext 10 60 0 IS_RSTA_INVERTED_REG 
// CHECK-NEXT: 1529 uext 10 61 0 IS_RSTB_INVERTED_REG 
// CHECK-NEXT: 1530 uext 10 62 0 IS_RSTCTRL_INVERTED_REG 
// CHECK-NEXT: 1531 uext 10 63 0 IS_RSTC_INVERTED_REG 
// CHECK-NEXT: 1532 uext 10 64 0 IS_RSTD_INVERTED_REG 
// CHECK-NEXT: 1533 uext 10 65 0 IS_RSTINMODE_INVERTED_REG 
// CHECK-NEXT: 1534 uext 10 66 0 IS_RSTM_INVERTED_REG 
// CHECK-NEXT: 1535 uext 10 67 0 IS_RSTP_INVERTED_REG 
// CHECK-NEXT: 1536 uext 23 68 0 MASK_REG 
// CHECK-NEXT: 1537 uext 10 1023 0 MREG_BIN 
// CHECK-NEXT: 1538 uext 3 69 0 MREG_REG 
// CHECK-NEXT: 1539 uext 10 70 0 MULTSIGNIN_in 
// CHECK-NEXT: 1540 uext 10 1242 0 MULTSIGN_ALU_in 
// CHECK-NEXT: 1541 uext 10 1249 0 MULTSIGN_ALU_reg 
// CHECK-NEXT: 1542 uext 10 604 0 OPMODEREG_BIN 
// CHECK-NEXT: 1543 uext 3 72 0 OPMODEREG_REG 
// CHECK-NEXT: 1544 uext 56 596 0 OPMODE_in 
// CHECK-NEXT: 1545 uext 56 605 0 OPMODE_mux 
// CHECK-NEXT: 1546 uext 56 603 0 OPMODE_reg 
// CHECK-NEXT: 1547 uext 23 73 0 PATTERN_REG 
// CHECK-NEXT: 1548 uext 23 74 0 PCIN_in 
// CHECK-NEXT: 1549 uext 10 1035 0 PREADDINSEL_BIN 
// CHECK-NEXT: 1550 const 205 0000000
// CHECK-NEXT: 1551 concat 207 1550 75
// CHECK-NEXT: 1552 uext 207 1551 0 PREADDINSEL_REG 
// CHECK-NEXT: 1553 uext 46 918 0 PREADD_AB 
// CHECK-NEXT: 1554 uext 10 1232 0 PREG_BIN 
// CHECK-NEXT: 1555 uext 3 76 0 PREG_REG 
// CHECK-NEXT: 1556 uext 10 1121 0 P_FDBK_47_in 
// CHECK-NEXT: 1557 uext 23 508 0 P_FDBK_in 
// CHECK-NEXT: 1558 uext 23 77 0 RND_REG 
// CHECK-NEXT: 1559 neq 10 79 100
// CHECK-NEXT: 1560 xor 10 79 58
// CHECK-NEXT: 1561 and 10 1559 1560
// CHECK-NEXT: 1562 uext 10 1561 0 RSTALLCARRYIN_in 
// CHECK-NEXT: 1563 neq 10 80 100
// CHECK-NEXT: 1564 xor 10 80 59
// CHECK-NEXT: 1565 and 10 1563 1564
// CHECK-NEXT: 1566 uext 10 1565 0 RSTALUMODE_in 
// CHECK-NEXT: 1567 neq 10 78 100
// CHECK-NEXT: 1568 xor 10 78 60
// CHECK-NEXT: 1569 and 10 1567 1568
// CHECK-NEXT: 1570 uext 10 1569 0 RSTA_in 
// CHECK-NEXT: 1571 neq 10 81 100
// CHECK-NEXT: 1572 xor 10 81 61
// CHECK-NEXT: 1573 and 10 1571 1572
// CHECK-NEXT: 1574 uext 10 1573 0 RSTB_in 
// CHECK-NEXT: 1575 neq 10 83 100
// CHECK-NEXT: 1576 xor 10 83 62
// CHECK-NEXT: 1577 and 10 1575 1576
// CHECK-NEXT: 1578 uext 10 1577 0 RSTCTRL_in 
// CHECK-NEXT: 1579 neq 10 82 100
// CHECK-NEXT: 1580 xor 10 82 63
// CHECK-NEXT: 1581 and 10 1579 1580
// CHECK-NEXT: 1582 uext 10 1581 0 RSTC_in 
// CHECK-NEXT: 1583 neq 10 85 100
// CHECK-NEXT: 1584 xor 10 85 65
// CHECK-NEXT: 1585 and 10 1583 1584
// CHECK-NEXT: 1586 uext 10 1585 0 RSTINMODE_in 
// CHECK-NEXT: 1587 neq 10 86 100
// CHECK-NEXT: 1588 xor 10 86 66
// CHECK-NEXT: 1589 and 10 1587 1588
// CHECK-NEXT: 1590 uext 10 1589 0 RSTM_in 
// CHECK-NEXT: 1591 neq 10 87 100
// CHECK-NEXT: 1592 xor 10 87 67
// CHECK-NEXT: 1593 and 10 1591 1592
// CHECK-NEXT: 1594 uext 10 1593 0 RSTP_in 
// CHECK-NEXT: 1595 uext 104 1034 0 SEL_MASK_BIN 
// CHECK-NEXT: 1596 sort bitvec 112
// CHECK-NEXT: 1597 sort bitvec 111
// CHECK-NEXT: 1598 const 1597 000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
// CHECK-NEXT: 1599 concat 1596 1598 88
// CHECK-NEXT: 1600 uext 1596 1599 0 SEL_MASK_REG 
// CHECK-NEXT: 1601 uext 10 1035 0 SEL_PATTERN_BIN 
// CHECK-NEXT: 1602 concat 1434 1436 89
// CHECK-NEXT: 1603 uext 1434 1602 0 SEL_PATTERN_REG 
// CHECK-NEXT: 1604 uext 104 1034 0 USE_MULT_BIN 
// CHECK-NEXT: 1605 sort bitvec 64
// CHECK-NEXT: 1606 sort bitvec 63
// CHECK-NEXT: 1607 const 1606 000000000000000000000000000000000000000000000000000000000000000
// CHECK-NEXT: 1608 concat 1605 1607 90
// CHECK-NEXT: 1609 uext 1605 1608 0 USE_MULT_REG 
// CHECK-NEXT: 1610 uext 10 1035 0 USE_PATTERN_DETECT_BIN 
// CHECK-NEXT: 1611 sort bitvec 72
// CHECK-NEXT: 1612 sort bitvec 71
// CHECK-NEXT: 1613 const 1612 00000000000000000000000000000000000000000000000000000000000000000000000
// CHECK-NEXT: 1614 concat 1611 1613 91
// CHECK-NEXT: 1615 uext 1611 1614 0 USE_PATTERN_DETECT_REG 
// CHECK-NEXT: 1616 uext 104 1034 0 USE_SIMD_BIN 
// CHECK-NEXT: 1617 const 497 00000000000000000000000000000000000000000000000
// CHECK-NEXT: 1618 concat 23 1617 92
// CHECK-NEXT: 1619 uext 23 1618 0 USE_SIMD_REG 
// CHECK-NEXT: 1620 uext 10 1035 0 USE_WIDEXOR_BIN 
// CHECK-NEXT: 1621 concat 476 1429 93
// CHECK-NEXT: 1622 uext 476 1621 0 USE_WIDEXOR_REG 
// CHECK-NEXT: 1623 uext 491 1024 0 U_DATA 
// CHECK-NEXT: 1624 uext 491 1024 0 U_DATA_in 
// CHECK-NEXT: 1625 uext 491 1022 0 U_DATA_reg 
// CHECK-NEXT: 1626 uext 488 1014 0 U_in
// CHECK-NEXT: 1627 uext 491 1063 0 V_DATA 
// CHECK-NEXT: 1628 uext 491 1063 0 V_DATA_in 
// CHECK-NEXT: 1629 uext 491 1062 0 V_DATA_reg 
// CHECK-NEXT: 1630 uext 491 1055 0 V_in 
// CHECK-NEXT: 1631 uext 10 1035 0 XORSIMD_BIN 
// CHECK-NEXT: 1632 sort bitvec 88
// CHECK-NEXT: 1633 sort bitvec 87
// CHECK-NEXT: 1634 const 1633 000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
// CHECK-NEXT: 1635 concat 1632 1634 94
// CHECK-NEXT: 1636 uext 1632 1635 0 XORSIMD_REG 
// CHECK-NEXT: 1637 uext 207 1386 0 XOR_MX_in 
// CHECK-NEXT: 1638 uext 207 1393 0 XOR_MX_reg 
// CHECK-NEXT: 1639 sort bitvec 49
// CHECK-NEXT: 1640 concat 1639 1100 1213
// CHECK-NEXT: 1641 uext 1639 1640 0 a_int 
// CHECK-NEXT: 1642 uext 46 918 0 a_mult_mux 
// CHECK-NEXT: 1643 uext 10 97 0 auto_reset_pri 
// CHECK-NEXT: 1644 uext 16 956 0 b_mult_mux 
// CHECK-NEXT: 1645 uext 10 1149 0 c_mult 
// CHECK-NEXT: 1646 uext 10 1496 0 ce_m_g 
// CHECK-NEXT: 1647 uext 10 1213 0 cin 
// CHECK-NEXT: 1648 uext 10 1210 0 cin_b 
// CHECK-NEXT: 1649 uext 23 1077 0 co 
// CHECK-NEXT: 1650 slice 10 1100 11 11
// CHECK-NEXT: 1651 uext 10 1650 0 co12_lsb 
// CHECK-NEXT: 1652 slice 10 1100 23 23
// CHECK-NEXT: 1653 uext 10 1652 0 co24_lsb 
// CHECK-NEXT: 1654 slice 10 1100 35 35
// CHECK-NEXT: 1655 uext 10 1654 0 co36_lsb 
// CHECK-NEXT: 1656 uext 23 1081 0 comux 
// CHECK-NEXT: 1657 uext 23 1081 0 comux4simd 
// CHECK-NEXT: 1658 uext 23 1100 0 comux_w 
// CHECK-NEXT: 1659 uext 10 1230 0 cout3 
// CHECK-NEXT: 1660 uext 10 1242 0 cout4 
// CHECK-NEXT: 1661 uext 10 1230 0 cout_3 
// CHECK-NEXT: 1662 ite 10 1496 1149 1156
// CHECK-NEXT: 1663 uext 10 1662 0 d_carryin_int 
// CHECK-NEXT: 1664 ite 10 1561 1035 1662
// CHECK-NEXT: 1665 uext 10 1664 0 dr_carryin_int 
// CHECK-NEXT: 1666 uext 10 1035 0 glblGSR 
// CHECK-NEXT: 1667 uext 10 1220 0 intc1 
// CHECK-NEXT: 1668 uext 10 1223 0 intc2 
// CHECK-NEXT: 1669 uext 10 1226 0 intc3 
// CHECK-NEXT: 1670 uext 491 1011 0 mult 
// CHECK-NEXT: 1671 uext 10 1157 0 multcarryin_data 
// CHECK-NEXT: 1672 uext 10 97 0 opmode_valid_flag_dou 
// CHECK-NEXT: 1673 uext 10 1373 0 pdet_o 
// CHECK-NEXT: 1674 uext 10 1381 0 pdet_o_mux 
// CHECK-NEXT: 1675 uext 10 1380 0 pdet_o_reg1 
// CHECK-NEXT: 1676 uext 10 1361 0 pdetb_o 
// CHECK-NEXT: 1677 uext 10 1369 0 pdetb_o_mux 
// CHECK-NEXT: 1678 uext 10 1368 0 pdetb_o_reg1 
// CHECK-NEXT: 1679 uext 488 1013 0 ps_u_mask 
// CHECK-NEXT: 1680 uext 488 1051 0 ps_v_mask 
// CHECK-NEXT: 1681 uext 10 1156 0 qmultcarryin 
// CHECK-NEXT: 1682 uext 10 1561 0 rst_carryin_g 
// CHECK-NEXT: 1683 uext 23 1072 0 s 
// CHECK-NEXT: 1684 uext 216 1219 0 s0 
// CHECK-NEXT: 1685 uext 216 1222 0 s1 
// CHECK-NEXT: 1686 uext 216 1225 0 s2 
// CHECK-NEXT: 1687 uext 218 1228 0 s3 
// CHECK-NEXT: 1688 uext 23 1079 0 smux 
// CHECK-NEXT: 1689 uext 23 1104 0 smux_w 
// CHECK-NEXT: 1690 uext 10 1035 0 the_auto_reset_patdet 
// CHECK-NEXT: 1691 uext 23 1048 0 the_mask 
// CHECK-NEXT: 1692 uext 23 73 0 the_pattern 
// CHECK-NEXT: 1693 uext 23 1096 0 wmux 
// CHECK-NEXT: 1694 uext 104 1037 0 x_mac_cascd
// CHECK-NEXT: 1695 uext 23 1042 0 xmux 
// CHECK-NEXT: 1696 uext 10 1035 0 xor_12a 
// CHECK-NEXT: 1697 uext 10 1035 0 xor_12b 
// CHECK-NEXT: 1698 uext 10 1035 0 xor_12c 
// CHECK-NEXT: 1699 uext 10 1035 0 xor_12d 
// CHECK-NEXT: 1700 uext 10 1035 0 xor_12e 
// CHECK-NEXT: 1701 uext 10 1035 0 xor_12f 
// CHECK-NEXT: 1702 uext 10 1035 0 xor_12g 
// CHECK-NEXT: 1703 uext 10 1035 0 xor_12h 
// CHECK-NEXT: 1704 uext 10 1035 0 xor_24a 
// CHECK-NEXT: 1705 uext 10 1035 0 xor_24b 
// CHECK-NEXT: 1706 uext 10 1035 0 xor_24c 
// CHECK-NEXT: 1707 uext 10 1035 0 xor_24d 
// CHECK-NEXT: 1708 uext 10 1035 0 xor_48a 
// CHECK-NEXT: 1709 uext 10 1035 0 xor_48b 
// CHECK-NEXT: 1710 uext 10 1035 0 xor_96 
// CHECK-NEXT: 1711 uext 23 1071 0 ymux 
// CHECK-NEXT: 1712 uext 23 866 0 z_optinv 
// CHECK-NEXT: 1713 uext 23 865 0 zmux 
// CHECK-NEXT: 1714 next 1 95 108
// CHECK-NEXT: 1715 ite 1 1471 248 108
// CHECK-NEXT: 1716 const 1 000000000000000000000000000000
// CHECK-NEXT: 1717 redor 10 256
// CHECK-NEXT: 1718 not 10 1717
// CHECK-NEXT: 1719 or 10 1569 1718
// CHECK-NEXT: 1720 ite 1 1719 1716 1715
// CHECK-NEXT: 1721 next 1 96 1720
// CHECK-NEXT: 1722 next 10 98 103
// CHECK-NEXT: 1723 next 1 249 255
// CHECK-NEXT: 1724 eq 10 256 106
// CHECK-NEXT: 1725 ite 1 1724 108 248
// CHECK-NEXT: 1726 ite 1 1474 1725 255
// CHECK-NEXT: 1727 ite 1 1719 1716 1726
// CHECK-NEXT: 1728 next 1 250 1727
// CHECK-NEXT: 1729 next 10 251 103
// CHECK-NEXT: 1730 next 16 263 269
// CHECK-NEXT: 1731 ite 16 1480 340 269
// CHECK-NEXT: 1732 const 16 000000000000000000
// CHECK-NEXT: 1733 redor 10 348
// CHECK-NEXT: 1734 not 10 1733
// CHECK-NEXT: 1735 or 10 1573 1734
// CHECK-NEXT: 1736 ite 16 1735 1732 1731
// CHECK-NEXT: 1737 next 16 264 1736
// CHECK-NEXT: 1738 next 10 265 103
// CHECK-NEXT: 1739 next 16 341 347
// CHECK-NEXT: 1740 eq 10 348 106
// CHECK-NEXT: 1741 ite 16 1740 269 340
// CHECK-NEXT: 1742 ite 16 1483 1741 347
// CHECK-NEXT: 1743 ite 16 1573 1732 1742
// CHECK-NEXT: 1744 next 16 342 1743
// CHECK-NEXT: 1745 next 10 343 103
// CHECK-NEXT: 1746 next 7 378 384
// CHECK-NEXT: 1747 ite 7 1477 377 384
// CHECK-NEXT: 1748 const 7 0000
// CHECK-NEXT: 1749 ite 7 1565 1748 1747
// CHECK-NEXT: 1750 next 7 379 1749
// CHECK-NEXT: 1751 next 10 380 103
// CHECK-NEXT: 1752 next 23 502 508
// CHECK-NEXT: 1753 and 10 1499 1232
// CHECK-NEXT: 1754 ite 23 1753 1356 508
// CHECK-NEXT: 1755 ite 23 1593 862 1754
// CHECK-NEXT: 1756 next 23 503 1755
// CHECK-NEXT: 1757 next 10 504 103
// CHECK-NEXT: 1758 next 56 597 603
// CHECK-NEXT: 1759 ite 56 1489 596 603
// CHECK-NEXT: 1760 const 56 000000000
// CHECK-NEXT: 1761 ite 56 1577 1760 1759
// CHECK-NEXT: 1762 next 56 598 1761
// CHECK-NEXT: 1763 next 10 599 103
// CHECK-NEXT: 1764 next 23 847 853
// CHECK-NEXT: 1765 ite 23 1492 846 853
// CHECK-NEXT: 1766 not 10 854
// CHECK-NEXT: 1767 or 10 1581 1766
// CHECK-NEXT: 1768 ite 23 1767 862 1765
// CHECK-NEXT: 1769 next 23 848 1768
// CHECK-NEXT: 1770 next 10 849 103
// CHECK-NEXT: 1771 next 49 905 911
// CHECK-NEXT: 1772 ite 49 41 904 911
// CHECK-NEXT: 1773 const 49 00000
// CHECK-NEXT: 1774 not 10 912
// CHECK-NEXT: 1775 or 10 1585 1774
// CHECK-NEXT: 1776 ite 49 1775 1773 1772
// CHECK-NEXT: 1777 next 49 906 1776
// CHECK-NEXT: 1778 next 10 907 103
// CHECK-NEXT: 1779 next 491 1016 1022
// CHECK-NEXT: 1780 ite 491 1496 1015 1022
// CHECK-NEXT: 1781 const 491 000000000000000000000000000000000000000000000
// CHECK-NEXT: 1782 not 10 1023
// CHECK-NEXT: 1783 or 10 1589 1782
// CHECK-NEXT: 1784 ite 491 1783 1781 1780
// CHECK-NEXT: 1785 next 491 1017 1784
// CHECK-NEXT: 1786 next 10 1018 103
// CHECK-NEXT: 1787 next 491 1056 1062
// CHECK-NEXT: 1788 ite 491 1496 1055 1062
// CHECK-NEXT: 1789 ite 491 1783 1781 1788
// CHECK-NEXT: 1790 next 491 1057 1789
// CHECK-NEXT: 1791 next 10 1058 103
// CHECK-NEXT: 1792 next 28 1134 1140
// CHECK-NEXT: 1793 ite 28 1489 1133 1140
// CHECK-NEXT: 1794 ite 28 1577 1064 1793
// CHECK-NEXT: 1795 next 28 1135 1794
// CHECK-NEXT: 1796 next 10 1136 103
// CHECK-NEXT: 1797 next 10 1150 1156
// CHECK-NEXT: 1798 next 10 1151 1664
// CHECK-NEXT: 1799 next 10 1152 103
// CHECK-NEXT: 1800 next 10 1164 1170
// CHECK-NEXT: 1801 ite 10 1753 389 1170
// CHECK-NEXT: 1802 ite 10 1593 1035 1801
// CHECK-NEXT: 1803 next 10 1165 1802
// CHECK-NEXT: 1804 next 10 1166 103
// CHECK-NEXT: 1805 next 7 1171 1177
// CHECK-NEXT: 1806 input 7
// CHECK-NEXT: 1807 and 7 1806 1236
// CHECK-NEXT: 1808 or 7 1807 1238
// CHECK-NEXT: 1809 ite 7 1753 1808 1177
// CHECK-NEXT: 1810 ite 7 1593 1748 1809
// CHECK-NEXT: 1811 next 7 1172 1810
// CHECK-NEXT: 1812 next 10 1173 103
// CHECK-NEXT: 1813 next 10 1198 1204
// CHECK-NEXT: 1814 ite 10 1486 1197 1204
// CHECK-NEXT: 1815 ite 10 1561 1035 1814
// CHECK-NEXT: 1816 next 10 1199 1815
// CHECK-NEXT: 1817 next 10 1200 103
// CHECK-NEXT: 1818 next 10 1243 1249
// CHECK-NEXT: 1819 ite 10 1753 1242 1249
// CHECK-NEXT: 1820 ite 10 1593 1035 1819
// CHECK-NEXT: 1821 next 10 1244 1820
// CHECK-NEXT: 1822 next 10 1245 103
// CHECK-NEXT: 1823 next 10 1362 1368
// CHECK-NEXT: 1824 ite 10 1753 1361 1368
// CHECK-NEXT: 1825 ite 10 1593 1035 1824
// CHECK-NEXT: 1826 next 10 1363 1825
// CHECK-NEXT: 1827 next 10 1364 103
// CHECK-NEXT: 1828 next 10 1374 1380
// CHECK-NEXT: 1829 ite 10 1753 1373 1380
// CHECK-NEXT: 1830 ite 10 1593 1035 1829
// CHECK-NEXT: 1831 next 10 1375 1830
// CHECK-NEXT: 1832 next 10 1376 103
// CHECK-NEXT: 1833 next 207 1387 1393
// CHECK-NEXT: 1834 ite 207 1753 1386 1393
// CHECK-NEXT: 1835 ite 207 1593 1386 1834
// CHECK-NEXT: 1836 next 207 1388 1835
// CHECK-NEXT: 1837 next 10 1389 103
