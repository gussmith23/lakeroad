// Note: We use a sed statement to filter out high impedance values 1'bz, so
// that we can import the result into Rosette more easily. This is not correct
// in general.
//
// RUN: tmpfile=$(mktemp)
// RUN: sed -E "s/bz/b1/" %s > $tmpfile
// RUN: python3 $LAKEROAD_DIR/utils/convert-module-to-btor.py \
// RUN:   --remove-lines-with '$finish' \
// RUN:   --define XIL_XECLIB --top DSP48E2 --infile $tmpfile 2>/dev/null \
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
// CHECK-NEXT: 100 neq 10 44 97
// CHECK-NEXT: 101 xor 10 44 54
// CHECK-NEXT: 102 and 10 100 101
// CHECK-NEXT: 103 sort bitvec 2
// CHECK-NEXT: 104 concat 103 102 98
// CHECK-NEXT: 105 const 103 10
// CHECK-NEXT: 106 eq 10 104 105
// CHECK-NEXT: 107 ite 1 106 96 95
// CHECK-NEXT: 108 slice 10 2 0 0
// CHECK-NEXT: 109 eq 10 108 97
// CHECK-NEXT: 110 or 10 109 108
// CHECK-NEXT: 111 slice 10 2 1 1
// CHECK-NEXT: 112 eq 10 111 97
// CHECK-NEXT: 113 or 10 112 111
// CHECK-NEXT: 114 slice 10 2 2 2
// CHECK-NEXT: 115 eq 10 114 97
// CHECK-NEXT: 116 or 10 115 114
// CHECK-NEXT: 117 slice 10 2 3 3
// CHECK-NEXT: 118 eq 10 117 97
// CHECK-NEXT: 119 or 10 118 117
// CHECK-NEXT: 120 slice 10 2 4 4
// CHECK-NEXT: 121 eq 10 120 97
// CHECK-NEXT: 122 or 10 121 120
// CHECK-NEXT: 123 slice 10 2 5 5
// CHECK-NEXT: 124 eq 10 123 97
// CHECK-NEXT: 125 or 10 124 123
// CHECK-NEXT: 126 slice 10 2 6 6
// CHECK-NEXT: 127 eq 10 126 97
// CHECK-NEXT: 128 or 10 127 126
// CHECK-NEXT: 129 slice 10 2 7 7
// CHECK-NEXT: 130 eq 10 129 97
// CHECK-NEXT: 131 or 10 130 129
// CHECK-NEXT: 132 slice 10 2 8 8
// CHECK-NEXT: 133 eq 10 132 97
// CHECK-NEXT: 134 or 10 133 132
// CHECK-NEXT: 135 slice 10 2 9 9
// CHECK-NEXT: 136 eq 10 135 97
// CHECK-NEXT: 137 or 10 136 135
// CHECK-NEXT: 138 slice 10 2 10 10
// CHECK-NEXT: 139 eq 10 138 97
// CHECK-NEXT: 140 or 10 139 138
// CHECK-NEXT: 141 slice 10 2 11 11
// CHECK-NEXT: 142 eq 10 141 97
// CHECK-NEXT: 143 or 10 142 141
// CHECK-NEXT: 144 slice 10 2 12 12
// CHECK-NEXT: 145 eq 10 144 97
// CHECK-NEXT: 146 or 10 145 144
// CHECK-NEXT: 147 slice 10 2 13 13
// CHECK-NEXT: 148 eq 10 147 97
// CHECK-NEXT: 149 or 10 148 147
// CHECK-NEXT: 150 slice 10 2 14 14
// CHECK-NEXT: 151 eq 10 150 97
// CHECK-NEXT: 152 or 10 151 150
// CHECK-NEXT: 153 slice 10 2 15 15
// CHECK-NEXT: 154 eq 10 153 97
// CHECK-NEXT: 155 or 10 154 153
// CHECK-NEXT: 156 slice 10 2 16 16
// CHECK-NEXT: 157 eq 10 156 97
// CHECK-NEXT: 158 or 10 157 156
// CHECK-NEXT: 159 slice 10 2 17 17
// CHECK-NEXT: 160 eq 10 159 97
// CHECK-NEXT: 161 or 10 160 159
// CHECK-NEXT: 162 slice 10 2 18 18
// CHECK-NEXT: 163 eq 10 162 97
// CHECK-NEXT: 164 or 10 163 162
// CHECK-NEXT: 165 slice 10 2 19 19
// CHECK-NEXT: 166 eq 10 165 97
// CHECK-NEXT: 167 or 10 166 165
// CHECK-NEXT: 168 slice 10 2 20 20
// CHECK-NEXT: 169 eq 10 168 97
// CHECK-NEXT: 170 or 10 169 168
// CHECK-NEXT: 171 slice 10 2 21 21
// CHECK-NEXT: 172 eq 10 171 97
// CHECK-NEXT: 173 or 10 172 171
// CHECK-NEXT: 174 slice 10 2 22 22
// CHECK-NEXT: 175 eq 10 174 97
// CHECK-NEXT: 176 or 10 175 174
// CHECK-NEXT: 177 slice 10 2 23 23
// CHECK-NEXT: 178 eq 10 177 97
// CHECK-NEXT: 179 or 10 178 177
// CHECK-NEXT: 180 slice 10 2 24 24
// CHECK-NEXT: 181 eq 10 180 97
// CHECK-NEXT: 182 or 10 181 180
// CHECK-NEXT: 183 slice 10 2 25 25
// CHECK-NEXT: 184 eq 10 183 97
// CHECK-NEXT: 185 or 10 184 183
// CHECK-NEXT: 186 slice 10 2 26 26
// CHECK-NEXT: 187 eq 10 186 97
// CHECK-NEXT: 188 or 10 187 186
// CHECK-NEXT: 189 slice 10 2 27 27
// CHECK-NEXT: 190 eq 10 189 97
// CHECK-NEXT: 191 or 10 190 189
// CHECK-NEXT: 192 slice 10 2 28 28
// CHECK-NEXT: 193 eq 10 192 97
// CHECK-NEXT: 194 or 10 193 192
// CHECK-NEXT: 195 slice 10 2 29 29
// CHECK-NEXT: 196 eq 10 195 97
// CHECK-NEXT: 197 or 10 196 195
// CHECK-NEXT: 198 concat 103 113 110
// CHECK-NEXT: 199 concat 28 116 198
// CHECK-NEXT: 200 concat 7 119 199
// CHECK-NEXT: 201 concat 49 122 200
// CHECK-NEXT: 202 sort bitvec 6
// CHECK-NEXT: 203 concat 202 125 201
// CHECK-NEXT: 204 sort bitvec 7
// CHECK-NEXT: 205 concat 204 128 203
// CHECK-NEXT: 206 sort bitvec 8
// CHECK-NEXT: 207 concat 206 131 205
// CHECK-NEXT: 208 concat 56 134 207
// CHECK-NEXT: 209 sort bitvec 10
// CHECK-NEXT: 210 concat 209 137 208
// CHECK-NEXT: 211 sort bitvec 11
// CHECK-NEXT: 212 concat 211 140 210
// CHECK-NEXT: 213 sort bitvec 12
// CHECK-NEXT: 214 concat 213 143 212
// CHECK-NEXT: 215 sort bitvec 13
// CHECK-NEXT: 216 concat 215 146 214
// CHECK-NEXT: 217 sort bitvec 14
// CHECK-NEXT: 218 concat 217 149 216
// CHECK-NEXT: 219 sort bitvec 15
// CHECK-NEXT: 220 concat 219 152 218
// CHECK-NEXT: 221 sort bitvec 16
// CHECK-NEXT: 222 concat 221 155 220
// CHECK-NEXT: 223 sort bitvec 17
// CHECK-NEXT: 224 concat 223 158 222
// CHECK-NEXT: 225 concat 16 161 224
// CHECK-NEXT: 226 sort bitvec 19
// CHECK-NEXT: 227 concat 226 164 225
// CHECK-NEXT: 228 sort bitvec 20
// CHECK-NEXT: 229 concat 228 167 227
// CHECK-NEXT: 230 sort bitvec 21
// CHECK-NEXT: 231 concat 230 170 229
// CHECK-NEXT: 232 sort bitvec 22
// CHECK-NEXT: 233 concat 232 173 231
// CHECK-NEXT: 234 sort bitvec 23
// CHECK-NEXT: 235 concat 234 176 233
// CHECK-NEXT: 236 sort bitvec 24
// CHECK-NEXT: 237 concat 236 179 235
// CHECK-NEXT: 238 sort bitvec 25
// CHECK-NEXT: 239 concat 238 182 237
// CHECK-NEXT: 240 sort bitvec 26
// CHECK-NEXT: 241 concat 240 185 239
// CHECK-NEXT: 242 concat 46 188 241
// CHECK-NEXT: 243 sort bitvec 28
// CHECK-NEXT: 244 concat 243 191 242
// CHECK-NEXT: 245 sort bitvec 29
// CHECK-NEXT: 246 concat 245 194 244
// CHECK-NEXT: 247 concat 1 197 246
// CHECK-NEXT: 248 state 1
// CHECK-NEXT: 249 state 1
// CHECK-NEXT: 250 state 10
// CHECK-NEXT: 251 init 10 250 97
// CHECK-NEXT: 252 concat 103 102 250
// CHECK-NEXT: 253 eq 10 252 105
// CHECK-NEXT: 254 ite 1 253 249 248
// CHECK-NEXT: 255 slice 103 12 1 0
// CHECK-NEXT: 256 redor 10 255
// CHECK-NEXT: 257 ite 1 256 254 247
// CHECK-NEXT: 258 slice 103 4 1 0
// CHECK-NEXT: 259 eq 10 258 255
// CHECK-NEXT: 260 ite 1 259 257 107
// CHECK-NEXT: 261 output 260 ACOUT 
// CHECK-NEXT: 262 state 16
// CHECK-NEXT: 263 state 16
// CHECK-NEXT: 264 state 10
// CHECK-NEXT: 265 init 10 264 97
// CHECK-NEXT: 266 concat 103 102 264
// CHECK-NEXT: 267 eq 10 266 105
// CHECK-NEXT: 268 ite 16 267 263 262
// CHECK-NEXT: 269 slice 10 17 0 0
// CHECK-NEXT: 270 eq 10 269 97
// CHECK-NEXT: 271 or 10 270 269
// CHECK-NEXT: 272 slice 10 17 1 1
// CHECK-NEXT: 273 eq 10 272 97
// CHECK-NEXT: 274 or 10 273 272
// CHECK-NEXT: 275 slice 10 17 2 2
// CHECK-NEXT: 276 eq 10 275 97
// CHECK-NEXT: 277 or 10 276 275
// CHECK-NEXT: 278 slice 10 17 3 3
// CHECK-NEXT: 279 eq 10 278 97
// CHECK-NEXT: 280 or 10 279 278
// CHECK-NEXT: 281 slice 10 17 4 4
// CHECK-NEXT: 282 eq 10 281 97
// CHECK-NEXT: 283 or 10 282 281
// CHECK-NEXT: 284 slice 10 17 5 5
// CHECK-NEXT: 285 eq 10 284 97
// CHECK-NEXT: 286 or 10 285 284
// CHECK-NEXT: 287 slice 10 17 6 6
// CHECK-NEXT: 288 eq 10 287 97
// CHECK-NEXT: 289 or 10 288 287
// CHECK-NEXT: 290 slice 10 17 7 7
// CHECK-NEXT: 291 eq 10 290 97
// CHECK-NEXT: 292 or 10 291 290
// CHECK-NEXT: 293 slice 10 17 8 8
// CHECK-NEXT: 294 eq 10 293 97
// CHECK-NEXT: 295 or 10 294 293
// CHECK-NEXT: 296 slice 10 17 9 9
// CHECK-NEXT: 297 eq 10 296 97
// CHECK-NEXT: 298 or 10 297 296
// CHECK-NEXT: 299 slice 10 17 10 10
// CHECK-NEXT: 300 eq 10 299 97
// CHECK-NEXT: 301 or 10 300 299
// CHECK-NEXT: 302 slice 10 17 11 11
// CHECK-NEXT: 303 eq 10 302 97
// CHECK-NEXT: 304 or 10 303 302
// CHECK-NEXT: 305 slice 10 17 12 12
// CHECK-NEXT: 306 eq 10 305 97
// CHECK-NEXT: 307 or 10 306 305
// CHECK-NEXT: 308 slice 10 17 13 13
// CHECK-NEXT: 309 eq 10 308 97
// CHECK-NEXT: 310 or 10 309 308
// CHECK-NEXT: 311 slice 10 17 14 14
// CHECK-NEXT: 312 eq 10 311 97
// CHECK-NEXT: 313 or 10 312 311
// CHECK-NEXT: 314 slice 10 17 15 15
// CHECK-NEXT: 315 eq 10 314 97
// CHECK-NEXT: 316 or 10 315 314
// CHECK-NEXT: 317 slice 10 17 16 16
// CHECK-NEXT: 318 eq 10 317 97
// CHECK-NEXT: 319 or 10 318 317
// CHECK-NEXT: 320 slice 10 17 17 17
// CHECK-NEXT: 321 eq 10 320 97
// CHECK-NEXT: 322 or 10 321 320
// CHECK-NEXT: 323 concat 103 274 271
// CHECK-NEXT: 324 concat 28 277 323
// CHECK-NEXT: 325 concat 7 280 324
// CHECK-NEXT: 326 concat 49 283 325
// CHECK-NEXT: 327 concat 202 286 326
// CHECK-NEXT: 328 concat 204 289 327
// CHECK-NEXT: 329 concat 206 292 328
// CHECK-NEXT: 330 concat 56 295 329
// CHECK-NEXT: 331 concat 209 298 330
// CHECK-NEXT: 332 concat 211 301 331
// CHECK-NEXT: 333 concat 213 304 332
// CHECK-NEXT: 334 concat 215 307 333
// CHECK-NEXT: 335 concat 217 310 334
// CHECK-NEXT: 336 concat 219 313 335
// CHECK-NEXT: 337 concat 221 316 336
// CHECK-NEXT: 338 concat 223 319 337
// CHECK-NEXT: 339 concat 16 322 338
// CHECK-NEXT: 340 state 16
// CHECK-NEXT: 341 state 16
// CHECK-NEXT: 342 state 10
// CHECK-NEXT: 343 init 10 342 97
// CHECK-NEXT: 344 concat 103 102 342
// CHECK-NEXT: 345 eq 10 344 105
// CHECK-NEXT: 346 ite 16 345 341 340
// CHECK-NEXT: 347 slice 103 21 1 0
// CHECK-NEXT: 348 redor 10 347
// CHECK-NEXT: 349 ite 16 348 346 339
// CHECK-NEXT: 350 slice 103 18 1 0
// CHECK-NEXT: 351 eq 10 350 347
// CHECK-NEXT: 352 ite 16 351 349 268
// CHECK-NEXT: 353 output 352 BCOUT 
// CHECK-NEXT: 354 slice 10 8 0 0
// CHECK-NEXT: 355 neq 10 354 97
// CHECK-NEXT: 356 slice 10 52 0 0
// CHECK-NEXT: 357 xor 10 354 356
// CHECK-NEXT: 358 and 10 355 357
// CHECK-NEXT: 359 slice 10 8 1 1
// CHECK-NEXT: 360 neq 10 359 97
// CHECK-NEXT: 361 slice 10 52 1 1
// CHECK-NEXT: 362 xor 10 359 361
// CHECK-NEXT: 363 and 10 360 362
// CHECK-NEXT: 364 slice 10 8 2 2
// CHECK-NEXT: 365 neq 10 364 97
// CHECK-NEXT: 366 slice 10 52 2 2
// CHECK-NEXT: 367 xor 10 364 366
// CHECK-NEXT: 368 and 10 365 367
// CHECK-NEXT: 369 slice 10 8 3 3
// CHECK-NEXT: 370 neq 10 369 97
// CHECK-NEXT: 371 slice 10 52 3 3
// CHECK-NEXT: 372 xor 10 369 371
// CHECK-NEXT: 373 and 10 370 372
// CHECK-NEXT: 374 concat 103 363 358
// CHECK-NEXT: 375 concat 28 368 374
// CHECK-NEXT: 376 concat 7 373 375
// CHECK-NEXT: 377 state 7
// CHECK-NEXT: 378 state 7
// CHECK-NEXT: 379 state 10
// CHECK-NEXT: 380 init 10 379 97
// CHECK-NEXT: 381 concat 103 102 379
// CHECK-NEXT: 382 eq 10 381 105
// CHECK-NEXT: 383 ite 7 382 378 377
// CHECK-NEXT: 384 slice 10 9 0 0
// CHECK-NEXT: 385 ite 7 384 383 376
// CHECK-NEXT: 386 slice 10 385 0 0
// CHECK-NEXT: 387 slice 10 385 1 1
// CHECK-NEXT: 388 and 10 386 387
// CHECK-NEXT: 389 slice 10 385 0 0
// CHECK-NEXT: 390 slice 10 385 0 0
// CHECK-NEXT: 391 concat 103 390 389
// CHECK-NEXT: 392 slice 10 385 0 0
// CHECK-NEXT: 393 concat 28 392 391
// CHECK-NEXT: 394 slice 10 385 0 0
// CHECK-NEXT: 395 concat 7 394 393
// CHECK-NEXT: 396 slice 10 385 0 0
// CHECK-NEXT: 397 concat 49 396 395
// CHECK-NEXT: 398 slice 10 385 0 0
// CHECK-NEXT: 399 concat 202 398 397
// CHECK-NEXT: 400 slice 10 385 0 0
// CHECK-NEXT: 401 concat 204 400 399
// CHECK-NEXT: 402 slice 10 385 0 0
// CHECK-NEXT: 403 concat 206 402 401
// CHECK-NEXT: 404 slice 10 385 0 0
// CHECK-NEXT: 405 concat 56 404 403
// CHECK-NEXT: 406 slice 10 385 0 0
// CHECK-NEXT: 407 concat 209 406 405
// CHECK-NEXT: 408 slice 10 385 0 0
// CHECK-NEXT: 409 concat 211 408 407
// CHECK-NEXT: 410 slice 10 385 0 0
// CHECK-NEXT: 411 concat 213 410 409
// CHECK-NEXT: 412 slice 10 385 0 0
// CHECK-NEXT: 413 concat 215 412 411
// CHECK-NEXT: 414 slice 10 385 0 0
// CHECK-NEXT: 415 concat 217 414 413
// CHECK-NEXT: 416 slice 10 385 0 0
// CHECK-NEXT: 417 concat 219 416 415
// CHECK-NEXT: 418 slice 10 385 0 0
// CHECK-NEXT: 419 concat 221 418 417
// CHECK-NEXT: 420 slice 10 385 0 0
// CHECK-NEXT: 421 concat 223 420 419
// CHECK-NEXT: 422 slice 10 385 0 0
// CHECK-NEXT: 423 concat 16 422 421
// CHECK-NEXT: 424 slice 10 385 0 0
// CHECK-NEXT: 425 concat 226 424 423
// CHECK-NEXT: 426 slice 10 385 0 0
// CHECK-NEXT: 427 concat 228 426 425
// CHECK-NEXT: 428 slice 10 385 0 0
// CHECK-NEXT: 429 concat 230 428 427
// CHECK-NEXT: 430 slice 10 385 0 0
// CHECK-NEXT: 431 concat 232 430 429
// CHECK-NEXT: 432 slice 10 385 0 0
// CHECK-NEXT: 433 concat 234 432 431
// CHECK-NEXT: 434 slice 10 385 0 0
// CHECK-NEXT: 435 concat 236 434 433
// CHECK-NEXT: 436 slice 10 385 0 0
// CHECK-NEXT: 437 concat 238 436 435
// CHECK-NEXT: 438 slice 10 385 0 0
// CHECK-NEXT: 439 concat 240 438 437
// CHECK-NEXT: 440 slice 10 385 0 0
// CHECK-NEXT: 441 concat 46 440 439
// CHECK-NEXT: 442 slice 10 385 0 0
// CHECK-NEXT: 443 concat 243 442 441
// CHECK-NEXT: 444 slice 10 385 0 0
// CHECK-NEXT: 445 concat 245 444 443
// CHECK-NEXT: 446 slice 10 385 0 0
// CHECK-NEXT: 447 concat 1 446 445
// CHECK-NEXT: 448 slice 10 385 0 0
// CHECK-NEXT: 449 sort bitvec 31
// CHECK-NEXT: 450 concat 449 448 447
// CHECK-NEXT: 451 slice 10 385 0 0
// CHECK-NEXT: 452 concat 3 451 450
// CHECK-NEXT: 453 slice 10 385 0 0
// CHECK-NEXT: 454 sort bitvec 33
// CHECK-NEXT: 455 concat 454 453 452
// CHECK-NEXT: 456 slice 10 385 0 0
// CHECK-NEXT: 457 sort bitvec 34
// CHECK-NEXT: 458 concat 457 456 455
// CHECK-NEXT: 459 slice 10 385 0 0
// CHECK-NEXT: 460 sort bitvec 35
// CHECK-NEXT: 461 concat 460 459 458
// CHECK-NEXT: 462 slice 10 385 0 0
// CHECK-NEXT: 463 sort bitvec 36
// CHECK-NEXT: 464 concat 463 462 461
// CHECK-NEXT: 465 slice 10 385 0 0
// CHECK-NEXT: 466 sort bitvec 37
// CHECK-NEXT: 467 concat 466 465 464
// CHECK-NEXT: 468 slice 10 385 0 0
// CHECK-NEXT: 469 sort bitvec 38
// CHECK-NEXT: 470 concat 469 468 467
// CHECK-NEXT: 471 slice 10 385 0 0
// CHECK-NEXT: 472 sort bitvec 39
// CHECK-NEXT: 473 concat 472 471 470
// CHECK-NEXT: 474 slice 10 385 0 0
// CHECK-NEXT: 475 sort bitvec 40
// CHECK-NEXT: 476 concat 475 474 473
// CHECK-NEXT: 477 slice 10 385 0 0
// CHECK-NEXT: 478 sort bitvec 41
// CHECK-NEXT: 479 concat 478 477 476
// CHECK-NEXT: 480 slice 10 385 0 0
// CHECK-NEXT: 481 sort bitvec 42
// CHECK-NEXT: 482 concat 481 480 479
// CHECK-NEXT: 483 slice 10 385 0 0
// CHECK-NEXT: 484 sort bitvec 43
// CHECK-NEXT: 485 concat 484 483 482
// CHECK-NEXT: 486 slice 10 385 0 0
// CHECK-NEXT: 487 sort bitvec 44
// CHECK-NEXT: 488 concat 487 486 485
// CHECK-NEXT: 489 slice 10 385 0 0
// CHECK-NEXT: 490 sort bitvec 45
// CHECK-NEXT: 491 concat 490 489 488
// CHECK-NEXT: 492 slice 10 385 0 0
// CHECK-NEXT: 493 sort bitvec 46
// CHECK-NEXT: 494 concat 493 492 491
// CHECK-NEXT: 495 slice 10 385 0 0
// CHECK-NEXT: 496 sort bitvec 47
// CHECK-NEXT: 497 concat 496 495 494
// CHECK-NEXT: 498 slice 10 385 0 0
// CHECK-NEXT: 499 concat 23 498 497
// CHECK-NEXT: 500 input 23
// CHECK-NEXT: 501 state 23
// CHECK-NEXT: 502 state 23
// CHECK-NEXT: 503 state 10
// CHECK-NEXT: 504 init 10 503 97
// CHECK-NEXT: 505 concat 103 102 503
// CHECK-NEXT: 506 eq 10 505 105
// CHECK-NEXT: 507 ite 23 506 502 501
// CHECK-NEXT: 508 slice 449 507 47 17
// CHECK-NEXT: 509 slice 10 507 47 47
// CHECK-NEXT: 510 concat 3 509 508
// CHECK-NEXT: 511 slice 10 507 47 47
// CHECK-NEXT: 512 concat 454 511 510
// CHECK-NEXT: 513 slice 10 507 47 47
// CHECK-NEXT: 514 concat 457 513 512
// CHECK-NEXT: 515 slice 10 507 47 47
// CHECK-NEXT: 516 concat 460 515 514
// CHECK-NEXT: 517 slice 10 507 47 47
// CHECK-NEXT: 518 concat 463 517 516
// CHECK-NEXT: 519 slice 10 507 47 47
// CHECK-NEXT: 520 concat 466 519 518
// CHECK-NEXT: 521 slice 10 507 47 47
// CHECK-NEXT: 522 concat 469 521 520
// CHECK-NEXT: 523 slice 10 507 47 47
// CHECK-NEXT: 524 concat 472 523 522
// CHECK-NEXT: 525 slice 10 507 47 47
// CHECK-NEXT: 526 concat 475 525 524
// CHECK-NEXT: 527 slice 10 507 47 47
// CHECK-NEXT: 528 concat 478 527 526
// CHECK-NEXT: 529 slice 10 507 47 47
// CHECK-NEXT: 530 concat 481 529 528
// CHECK-NEXT: 531 slice 10 507 47 47
// CHECK-NEXT: 532 concat 484 531 530
// CHECK-NEXT: 533 slice 10 507 47 47
// CHECK-NEXT: 534 concat 487 533 532
// CHECK-NEXT: 535 slice 10 507 47 47
// CHECK-NEXT: 536 concat 490 535 534
// CHECK-NEXT: 537 slice 10 507 47 47
// CHECK-NEXT: 538 concat 493 537 536
// CHECK-NEXT: 539 slice 10 507 47 47
// CHECK-NEXT: 540 concat 496 539 538
// CHECK-NEXT: 541 slice 10 507 47 47
// CHECK-NEXT: 542 concat 23 541 540
// CHECK-NEXT: 543 slice 10 71 0 0
// CHECK-NEXT: 544 neq 10 543 97
// CHECK-NEXT: 545 slice 10 57 0 0
// CHECK-NEXT: 546 xor 10 543 545
// CHECK-NEXT: 547 and 10 544 546
// CHECK-NEXT: 548 slice 10 71 1 1
// CHECK-NEXT: 549 neq 10 548 97
// CHECK-NEXT: 550 slice 10 57 1 1
// CHECK-NEXT: 551 xor 10 548 550
// CHECK-NEXT: 552 and 10 549 551
// CHECK-NEXT: 553 slice 10 71 2 2
// CHECK-NEXT: 554 neq 10 553 97
// CHECK-NEXT: 555 slice 10 57 2 2
// CHECK-NEXT: 556 xor 10 553 555
// CHECK-NEXT: 557 and 10 554 556
// CHECK-NEXT: 558 slice 10 71 3 3
// CHECK-NEXT: 559 neq 10 558 97
// CHECK-NEXT: 560 slice 10 57 3 3
// CHECK-NEXT: 561 xor 10 558 560
// CHECK-NEXT: 562 and 10 559 561
// CHECK-NEXT: 563 slice 10 71 4 4
// CHECK-NEXT: 564 neq 10 563 97
// CHECK-NEXT: 565 slice 10 57 4 4
// CHECK-NEXT: 566 xor 10 563 565
// CHECK-NEXT: 567 and 10 564 566
// CHECK-NEXT: 568 slice 10 71 5 5
// CHECK-NEXT: 569 neq 10 568 97
// CHECK-NEXT: 570 slice 10 57 5 5
// CHECK-NEXT: 571 xor 10 568 570
// CHECK-NEXT: 572 and 10 569 571
// CHECK-NEXT: 573 slice 10 71 6 6
// CHECK-NEXT: 574 neq 10 573 97
// CHECK-NEXT: 575 slice 10 57 6 6
// CHECK-NEXT: 576 xor 10 573 575
// CHECK-NEXT: 577 and 10 574 576
// CHECK-NEXT: 578 slice 10 71 7 7
// CHECK-NEXT: 579 neq 10 578 97
// CHECK-NEXT: 580 slice 10 57 7 7
// CHECK-NEXT: 581 xor 10 578 580
// CHECK-NEXT: 582 and 10 579 581
// CHECK-NEXT: 583 slice 10 71 8 8
// CHECK-NEXT: 584 neq 10 583 97
// CHECK-NEXT: 585 slice 10 57 8 8
// CHECK-NEXT: 586 xor 10 583 585
// CHECK-NEXT: 587 and 10 584 586
// CHECK-NEXT: 588 concat 103 552 547
// CHECK-NEXT: 589 concat 28 557 588
// CHECK-NEXT: 590 concat 7 562 589
// CHECK-NEXT: 591 concat 49 567 590
// CHECK-NEXT: 592 concat 202 572 591
// CHECK-NEXT: 593 concat 204 577 592
// CHECK-NEXT: 594 concat 206 582 593
// CHECK-NEXT: 595 concat 56 587 594
// CHECK-NEXT: 596 state 56
// CHECK-NEXT: 597 state 56
// CHECK-NEXT: 598 state 10
// CHECK-NEXT: 599 init 10 598 97
// CHECK-NEXT: 600 concat 103 102 598
// CHECK-NEXT: 601 eq 10 600 105
// CHECK-NEXT: 602 ite 56 601 597 596
// CHECK-NEXT: 603 slice 10 72 0 0
// CHECK-NEXT: 604 ite 56 603 602 595
// CHECK-NEXT: 605 slice 103 604 6 5
// CHECK-NEXT: 606 const 103 11
// CHECK-NEXT: 607 eq 10 605 606
// CHECK-NEXT: 608 ite 23 607 542 500
// CHECK-NEXT: 609 slice 449 74 47 17
// CHECK-NEXT: 610 slice 10 74 47 47
// CHECK-NEXT: 611 concat 3 610 609
// CHECK-NEXT: 612 slice 10 74 47 47
// CHECK-NEXT: 613 concat 454 612 611
// CHECK-NEXT: 614 slice 10 74 47 47
// CHECK-NEXT: 615 concat 457 614 613
// CHECK-NEXT: 616 slice 10 74 47 47
// CHECK-NEXT: 617 concat 460 616 615
// CHECK-NEXT: 618 slice 10 74 47 47
// CHECK-NEXT: 619 concat 463 618 617
// CHECK-NEXT: 620 slice 10 74 47 47
// CHECK-NEXT: 621 concat 466 620 619
// CHECK-NEXT: 622 slice 10 74 47 47
// CHECK-NEXT: 623 concat 469 622 621
// CHECK-NEXT: 624 slice 10 74 47 47
// CHECK-NEXT: 625 concat 472 624 623
// CHECK-NEXT: 626 slice 10 74 47 47
// CHECK-NEXT: 627 concat 475 626 625
// CHECK-NEXT: 628 slice 10 74 47 47
// CHECK-NEXT: 629 concat 478 628 627
// CHECK-NEXT: 630 slice 10 74 47 47
// CHECK-NEXT: 631 concat 481 630 629
// CHECK-NEXT: 632 slice 10 74 47 47
// CHECK-NEXT: 633 concat 484 632 631
// CHECK-NEXT: 634 slice 10 74 47 47
// CHECK-NEXT: 635 concat 487 634 633
// CHECK-NEXT: 636 slice 10 74 47 47
// CHECK-NEXT: 637 concat 490 636 635
// CHECK-NEXT: 638 slice 10 74 47 47
// CHECK-NEXT: 639 concat 493 638 637
// CHECK-NEXT: 640 slice 10 74 47 47
// CHECK-NEXT: 641 concat 496 640 639
// CHECK-NEXT: 642 slice 10 74 47 47
// CHECK-NEXT: 643 concat 23 642 641
// CHECK-NEXT: 644 slice 28 604 6 4
// CHECK-NEXT: 645 const 28 101
// CHECK-NEXT: 646 eq 10 644 645
// CHECK-NEXT: 647 ite 23 646 643 608
// CHECK-NEXT: 648 const 28 100
// CHECK-NEXT: 649 eq 10 644 648
// CHECK-NEXT: 650 uext 28 105 1
// CHECK-NEXT: 651 eq 10 644 650
// CHECK-NEXT: 652 concat 103 651 649
// CHECK-NEXT: 653 redor 10 652
// CHECK-NEXT: 654 ite 23 653 507 647
// CHECK-NEXT: 655 slice 10 24 0 0
// CHECK-NEXT: 656 eq 10 655 97
// CHECK-NEXT: 657 or 10 656 655
// CHECK-NEXT: 658 slice 10 24 1 1
// CHECK-NEXT: 659 eq 10 658 97
// CHECK-NEXT: 660 or 10 659 658
// CHECK-NEXT: 661 slice 10 24 2 2
// CHECK-NEXT: 662 eq 10 661 97
// CHECK-NEXT: 663 or 10 662 661
// CHECK-NEXT: 664 slice 10 24 3 3
// CHECK-NEXT: 665 eq 10 664 97
// CHECK-NEXT: 666 or 10 665 664
// CHECK-NEXT: 667 slice 10 24 4 4
// CHECK-NEXT: 668 eq 10 667 97
// CHECK-NEXT: 669 or 10 668 667
// CHECK-NEXT: 670 slice 10 24 5 5
// CHECK-NEXT: 671 eq 10 670 97
// CHECK-NEXT: 672 or 10 671 670
// CHECK-NEXT: 673 slice 10 24 6 6
// CHECK-NEXT: 674 eq 10 673 97
// CHECK-NEXT: 675 or 10 674 673
// CHECK-NEXT: 676 slice 10 24 7 7
// CHECK-NEXT: 677 eq 10 676 97
// CHECK-NEXT: 678 or 10 677 676
// CHECK-NEXT: 679 slice 10 24 8 8
// CHECK-NEXT: 680 eq 10 679 97
// CHECK-NEXT: 681 or 10 680 679
// CHECK-NEXT: 682 slice 10 24 9 9
// CHECK-NEXT: 683 eq 10 682 97
// CHECK-NEXT: 684 or 10 683 682
// CHECK-NEXT: 685 slice 10 24 10 10
// CHECK-NEXT: 686 eq 10 685 97
// CHECK-NEXT: 687 or 10 686 685
// CHECK-NEXT: 688 slice 10 24 11 11
// CHECK-NEXT: 689 eq 10 688 97
// CHECK-NEXT: 690 or 10 689 688
// CHECK-NEXT: 691 slice 10 24 12 12
// CHECK-NEXT: 692 eq 10 691 97
// CHECK-NEXT: 693 or 10 692 691
// CHECK-NEXT: 694 slice 10 24 13 13
// CHECK-NEXT: 695 eq 10 694 97
// CHECK-NEXT: 696 or 10 695 694
// CHECK-NEXT: 697 slice 10 24 14 14
// CHECK-NEXT: 698 eq 10 697 97
// CHECK-NEXT: 699 or 10 698 697
// CHECK-NEXT: 700 slice 10 24 15 15
// CHECK-NEXT: 701 eq 10 700 97
// CHECK-NEXT: 702 or 10 701 700
// CHECK-NEXT: 703 slice 10 24 16 16
// CHECK-NEXT: 704 eq 10 703 97
// CHECK-NEXT: 705 or 10 704 703
// CHECK-NEXT: 706 slice 10 24 17 17
// CHECK-NEXT: 707 eq 10 706 97
// CHECK-NEXT: 708 or 10 707 706
// CHECK-NEXT: 709 slice 10 24 18 18
// CHECK-NEXT: 710 eq 10 709 97
// CHECK-NEXT: 711 or 10 710 709
// CHECK-NEXT: 712 slice 10 24 19 19
// CHECK-NEXT: 713 eq 10 712 97
// CHECK-NEXT: 714 or 10 713 712
// CHECK-NEXT: 715 slice 10 24 20 20
// CHECK-NEXT: 716 eq 10 715 97
// CHECK-NEXT: 717 or 10 716 715
// CHECK-NEXT: 718 slice 10 24 21 21
// CHECK-NEXT: 719 eq 10 718 97
// CHECK-NEXT: 720 or 10 719 718
// CHECK-NEXT: 721 slice 10 24 22 22
// CHECK-NEXT: 722 eq 10 721 97
// CHECK-NEXT: 723 or 10 722 721
// CHECK-NEXT: 724 slice 10 24 23 23
// CHECK-NEXT: 725 eq 10 724 97
// CHECK-NEXT: 726 or 10 725 724
// CHECK-NEXT: 727 slice 10 24 24 24
// CHECK-NEXT: 728 eq 10 727 97
// CHECK-NEXT: 729 or 10 728 727
// CHECK-NEXT: 730 slice 10 24 25 25
// CHECK-NEXT: 731 eq 10 730 97
// CHECK-NEXT: 732 or 10 731 730
// CHECK-NEXT: 733 slice 10 24 26 26
// CHECK-NEXT: 734 eq 10 733 97
// CHECK-NEXT: 735 or 10 734 733
// CHECK-NEXT: 736 slice 10 24 27 27
// CHECK-NEXT: 737 eq 10 736 97
// CHECK-NEXT: 738 or 10 737 736
// CHECK-NEXT: 739 slice 10 24 28 28
// CHECK-NEXT: 740 eq 10 739 97
// CHECK-NEXT: 741 or 10 740 739
// CHECK-NEXT: 742 slice 10 24 29 29
// CHECK-NEXT: 743 eq 10 742 97
// CHECK-NEXT: 744 or 10 743 742
// CHECK-NEXT: 745 slice 10 24 30 30
// CHECK-NEXT: 746 eq 10 745 97
// CHECK-NEXT: 747 or 10 746 745
// CHECK-NEXT: 748 slice 10 24 31 31
// CHECK-NEXT: 749 eq 10 748 97
// CHECK-NEXT: 750 or 10 749 748
// CHECK-NEXT: 751 slice 10 24 32 32
// CHECK-NEXT: 752 eq 10 751 97
// CHECK-NEXT: 753 or 10 752 751
// CHECK-NEXT: 754 slice 10 24 33 33
// CHECK-NEXT: 755 eq 10 754 97
// CHECK-NEXT: 756 or 10 755 754
// CHECK-NEXT: 757 slice 10 24 34 34
// CHECK-NEXT: 758 eq 10 757 97
// CHECK-NEXT: 759 or 10 758 757
// CHECK-NEXT: 760 slice 10 24 35 35
// CHECK-NEXT: 761 eq 10 760 97
// CHECK-NEXT: 762 or 10 761 760
// CHECK-NEXT: 763 slice 10 24 36 36
// CHECK-NEXT: 764 eq 10 763 97
// CHECK-NEXT: 765 or 10 764 763
// CHECK-NEXT: 766 slice 10 24 37 37
// CHECK-NEXT: 767 eq 10 766 97
// CHECK-NEXT: 768 or 10 767 766
// CHECK-NEXT: 769 slice 10 24 38 38
// CHECK-NEXT: 770 eq 10 769 97
// CHECK-NEXT: 771 or 10 770 769
// CHECK-NEXT: 772 slice 10 24 39 39
// CHECK-NEXT: 773 eq 10 772 97
// CHECK-NEXT: 774 or 10 773 772
// CHECK-NEXT: 775 slice 10 24 40 40
// CHECK-NEXT: 776 eq 10 775 97
// CHECK-NEXT: 777 or 10 776 775
// CHECK-NEXT: 778 slice 10 24 41 41
// CHECK-NEXT: 779 eq 10 778 97
// CHECK-NEXT: 780 or 10 779 778
// CHECK-NEXT: 781 slice 10 24 42 42
// CHECK-NEXT: 782 eq 10 781 97
// CHECK-NEXT: 783 or 10 782 781
// CHECK-NEXT: 784 slice 10 24 43 43
// CHECK-NEXT: 785 eq 10 784 97
// CHECK-NEXT: 786 or 10 785 784
// CHECK-NEXT: 787 slice 10 24 44 44
// CHECK-NEXT: 788 eq 10 787 97
// CHECK-NEXT: 789 or 10 788 787
// CHECK-NEXT: 790 slice 10 24 45 45
// CHECK-NEXT: 791 eq 10 790 97
// CHECK-NEXT: 792 or 10 791 790
// CHECK-NEXT: 793 slice 10 24 46 46
// CHECK-NEXT: 794 eq 10 793 97
// CHECK-NEXT: 795 or 10 794 793
// CHECK-NEXT: 796 slice 10 24 47 47
// CHECK-NEXT: 797 eq 10 796 97
// CHECK-NEXT: 798 or 10 797 796
// CHECK-NEXT: 799 concat 103 660 657
// CHECK-NEXT: 800 concat 28 663 799
// CHECK-NEXT: 801 concat 7 666 800
// CHECK-NEXT: 802 concat 49 669 801
// CHECK-NEXT: 803 concat 202 672 802
// CHECK-NEXT: 804 concat 204 675 803
// CHECK-NEXT: 805 concat 206 678 804
// CHECK-NEXT: 806 concat 56 681 805
// CHECK-NEXT: 807 concat 209 684 806
// CHECK-NEXT: 808 concat 211 687 807
// CHECK-NEXT: 809 concat 213 690 808
// CHECK-NEXT: 810 concat 215 693 809
// CHECK-NEXT: 811 concat 217 696 810
// CHECK-NEXT: 812 concat 219 699 811
// CHECK-NEXT: 813 concat 221 702 812
// CHECK-NEXT: 814 concat 223 705 813
// CHECK-NEXT: 815 concat 16 708 814
// CHECK-NEXT: 816 concat 226 711 815
// CHECK-NEXT: 817 concat 228 714 816
// CHECK-NEXT: 818 concat 230 717 817
// CHECK-NEXT: 819 concat 232 720 818
// CHECK-NEXT: 820 concat 234 723 819
// CHECK-NEXT: 821 concat 236 726 820
// CHECK-NEXT: 822 concat 238 729 821
// CHECK-NEXT: 823 concat 240 732 822
// CHECK-NEXT: 824 concat 46 735 823
// CHECK-NEXT: 825 concat 243 738 824
// CHECK-NEXT: 826 concat 245 741 825
// CHECK-NEXT: 827 concat 1 744 826
// CHECK-NEXT: 828 concat 449 747 827
// CHECK-NEXT: 829 concat 3 750 828
// CHECK-NEXT: 830 concat 454 753 829
// CHECK-NEXT: 831 concat 457 756 830
// CHECK-NEXT: 832 concat 460 759 831
// CHECK-NEXT: 833 concat 463 762 832
// CHECK-NEXT: 834 concat 466 765 833
// CHECK-NEXT: 835 concat 469 768 834
// CHECK-NEXT: 836 concat 472 771 835
// CHECK-NEXT: 837 concat 475 774 836
// CHECK-NEXT: 838 concat 478 777 837
// CHECK-NEXT: 839 concat 481 780 838
// CHECK-NEXT: 840 concat 484 783 839
// CHECK-NEXT: 841 concat 487 786 840
// CHECK-NEXT: 842 concat 490 789 841
// CHECK-NEXT: 843 concat 493 792 842
// CHECK-NEXT: 844 concat 496 795 843
// CHECK-NEXT: 845 concat 23 798 844
// CHECK-NEXT: 846 state 23
// CHECK-NEXT: 847 state 23
// CHECK-NEXT: 848 state 10
// CHECK-NEXT: 849 init 10 848 97
// CHECK-NEXT: 850 concat 103 102 848
// CHECK-NEXT: 851 eq 10 850 105
// CHECK-NEXT: 852 ite 23 851 847 846
// CHECK-NEXT: 853 slice 10 45 0 0
// CHECK-NEXT: 854 ite 23 853 852 845
// CHECK-NEXT: 855 uext 28 606 1
// CHECK-NEXT: 856 eq 10 644 855
// CHECK-NEXT: 857 ite 23 856 854 654
// CHECK-NEXT: 858 uext 28 97 2
// CHECK-NEXT: 859 eq 10 644 858
// CHECK-NEXT: 860 ite 23 859 74 857
// CHECK-NEXT: 861 const 23 000000000000000000000000000000000000000000000000
// CHECK-NEXT: 862 redor 10 644
// CHECK-NEXT: 863 not 10 862
// CHECK-NEXT: 864 ite 23 863 861 860
// CHECK-NEXT: 865 xor 23 499 864
// CHECK-NEXT: 866 input 23
// CHECK-NEXT: 867 concat 23 257 349
// CHECK-NEXT: 868 slice 103 604 1 0
// CHECK-NEXT: 869 eq 10 868 606
// CHECK-NEXT: 870 ite 23 869 867 866
// CHECK-NEXT: 871 eq 10 868 105
// CHECK-NEXT: 872 ite 23 871 507 870
// CHECK-NEXT: 873 slice 46 257 26 0
// CHECK-NEXT: 874 slice 46 107 26 0
// CHECK-NEXT: 875 slice 10 50 0 0
// CHECK-NEXT: 876 neq 10 875 97
// CHECK-NEXT: 877 slice 10 55 0 0
// CHECK-NEXT: 878 xor 10 875 877
// CHECK-NEXT: 879 and 10 876 878
// CHECK-NEXT: 880 slice 10 50 1 1
// CHECK-NEXT: 881 neq 10 880 97
// CHECK-NEXT: 882 slice 10 55 1 1
// CHECK-NEXT: 883 xor 10 880 882
// CHECK-NEXT: 884 and 10 881 883
// CHECK-NEXT: 885 slice 10 50 2 2
// CHECK-NEXT: 886 neq 10 885 97
// CHECK-NEXT: 887 slice 10 55 2 2
// CHECK-NEXT: 888 xor 10 885 887
// CHECK-NEXT: 889 and 10 886 888
// CHECK-NEXT: 890 slice 10 50 3 3
// CHECK-NEXT: 891 neq 10 890 97
// CHECK-NEXT: 892 slice 10 55 3 3
// CHECK-NEXT: 893 xor 10 890 892
// CHECK-NEXT: 894 and 10 891 893
// CHECK-NEXT: 895 slice 10 50 4 4
// CHECK-NEXT: 896 neq 10 895 97
// CHECK-NEXT: 897 slice 10 55 4 4
// CHECK-NEXT: 898 xor 10 895 897
// CHECK-NEXT: 899 and 10 896 898
// CHECK-NEXT: 900 concat 103 884 879
// CHECK-NEXT: 901 concat 28 889 900
// CHECK-NEXT: 902 concat 7 894 901
// CHECK-NEXT: 903 concat 49 899 902
// CHECK-NEXT: 904 state 49
// CHECK-NEXT: 905 state 49
// CHECK-NEXT: 906 state 10
// CHECK-NEXT: 907 init 10 906 97
// CHECK-NEXT: 908 concat 103 102 906
// CHECK-NEXT: 909 eq 10 908 105
// CHECK-NEXT: 910 ite 49 909 905 904
// CHECK-NEXT: 911 slice 10 51 0 0
// CHECK-NEXT: 912 ite 49 911 910 903
// CHECK-NEXT: 913 slice 10 912 0 0
// CHECK-NEXT: 914 ite 46 913 874 873
// CHECK-NEXT: 915 const 46 000000000000000000000000000
// CHECK-NEXT: 916 slice 10 912 1 1
// CHECK-NEXT: 917 ite 46 916 915 914
// CHECK-NEXT: 918 slice 10 917 26 26
// CHECK-NEXT: 919 concat 243 918 917
// CHECK-NEXT: 920 slice 10 917 26 26
// CHECK-NEXT: 921 concat 245 920 919
// CHECK-NEXT: 922 slice 10 917 26 26
// CHECK-NEXT: 923 concat 1 922 921
// CHECK-NEXT: 924 slice 10 917 26 26
// CHECK-NEXT: 925 concat 449 924 923
// CHECK-NEXT: 926 slice 10 917 26 26
// CHECK-NEXT: 927 concat 3 926 925
// CHECK-NEXT: 928 slice 10 917 26 26
// CHECK-NEXT: 929 concat 454 928 927
// CHECK-NEXT: 930 slice 10 917 26 26
// CHECK-NEXT: 931 concat 457 930 929
// CHECK-NEXT: 932 slice 10 917 26 26
// CHECK-NEXT: 933 concat 460 932 931
// CHECK-NEXT: 934 slice 10 917 26 26
// CHECK-NEXT: 935 concat 463 934 933
// CHECK-NEXT: 936 slice 10 917 26 26
// CHECK-NEXT: 937 concat 466 936 935
// CHECK-NEXT: 938 slice 10 917 26 26
// CHECK-NEXT: 939 concat 469 938 937
// CHECK-NEXT: 940 slice 10 917 26 26
// CHECK-NEXT: 941 concat 472 940 939
// CHECK-NEXT: 942 slice 10 917 26 26
// CHECK-NEXT: 943 concat 475 942 941
// CHECK-NEXT: 944 slice 10 917 26 26
// CHECK-NEXT: 945 concat 478 944 943
// CHECK-NEXT: 946 slice 10 917 26 26
// CHECK-NEXT: 947 concat 481 946 945
// CHECK-NEXT: 948 slice 10 917 26 26
// CHECK-NEXT: 949 concat 484 948 947
// CHECK-NEXT: 950 slice 10 917 26 26
// CHECK-NEXT: 951 concat 487 950 949
// CHECK-NEXT: 952 slice 10 917 26 26
// CHECK-NEXT: 953 concat 490 952 951
// CHECK-NEXT: 954 slice 10 912 4 4
// CHECK-NEXT: 955 ite 16 954 268 349
// CHECK-NEXT: 956 slice 10 955 17 17
// CHECK-NEXT: 957 concat 226 956 955
// CHECK-NEXT: 958 slice 10 955 17 17
// CHECK-NEXT: 959 concat 228 958 957
// CHECK-NEXT: 960 slice 10 955 17 17
// CHECK-NEXT: 961 concat 230 960 959
// CHECK-NEXT: 962 slice 10 955 17 17
// CHECK-NEXT: 963 concat 232 962 961
// CHECK-NEXT: 964 slice 10 955 17 17
// CHECK-NEXT: 965 concat 234 964 963
// CHECK-NEXT: 966 slice 10 955 17 17
// CHECK-NEXT: 967 concat 236 966 965
// CHECK-NEXT: 968 slice 10 955 17 17
// CHECK-NEXT: 969 concat 238 968 967
// CHECK-NEXT: 970 slice 10 955 17 17
// CHECK-NEXT: 971 concat 240 970 969
// CHECK-NEXT: 972 slice 10 955 17 17
// CHECK-NEXT: 973 concat 46 972 971
// CHECK-NEXT: 974 slice 10 955 17 17
// CHECK-NEXT: 975 concat 243 974 973
// CHECK-NEXT: 976 slice 10 955 17 17
// CHECK-NEXT: 977 concat 245 976 975
// CHECK-NEXT: 978 slice 10 955 17 17
// CHECK-NEXT: 979 concat 1 978 977
// CHECK-NEXT: 980 slice 10 955 17 17
// CHECK-NEXT: 981 concat 449 980 979
// CHECK-NEXT: 982 slice 10 955 17 17
// CHECK-NEXT: 983 concat 3 982 981
// CHECK-NEXT: 984 slice 10 955 17 17
// CHECK-NEXT: 985 concat 454 984 983
// CHECK-NEXT: 986 slice 10 955 17 17
// CHECK-NEXT: 987 concat 457 986 985
// CHECK-NEXT: 988 slice 10 955 17 17
// CHECK-NEXT: 989 concat 460 988 987
// CHECK-NEXT: 990 slice 10 955 17 17
// CHECK-NEXT: 991 concat 463 990 989
// CHECK-NEXT: 992 slice 10 955 17 17
// CHECK-NEXT: 993 concat 466 992 991
// CHECK-NEXT: 994 slice 10 955 17 17
// CHECK-NEXT: 995 concat 469 994 993
// CHECK-NEXT: 996 slice 10 955 17 17
// CHECK-NEXT: 997 concat 472 996 995
// CHECK-NEXT: 998 slice 10 955 17 17
// CHECK-NEXT: 999 concat 475 998 997
// CHECK-NEXT: 1000 slice 10 955 17 17
// CHECK-NEXT: 1001 concat 478 1000 999
// CHECK-NEXT: 1002 slice 10 955 17 17
// CHECK-NEXT: 1003 concat 481 1002 1001
// CHECK-NEXT: 1004 slice 10 955 17 17
// CHECK-NEXT: 1005 concat 484 1004 1003
// CHECK-NEXT: 1006 slice 10 955 17 17
// CHECK-NEXT: 1007 concat 487 1006 1005
// CHECK-NEXT: 1008 slice 10 955 17 17
// CHECK-NEXT: 1009 concat 490 1008 1007
// CHECK-NEXT: 1010 mul 490 953 1009
// CHECK-NEXT: 1011 slice 487 1010 43 0
// CHECK-NEXT: 1012 input 487
// CHECK-NEXT: 1013 and 487 1011 1012
// CHECK-NEXT: 1014 concat 490 97 1013
// CHECK-NEXT: 1015 state 490
// CHECK-NEXT: 1016 state 490
// CHECK-NEXT: 1017 state 10
// CHECK-NEXT: 1018 init 10 1017 97
// CHECK-NEXT: 1019 concat 103 102 1017
// CHECK-NEXT: 1020 eq 10 1019 105
// CHECK-NEXT: 1021 ite 490 1020 1016 1015
// CHECK-NEXT: 1022 slice 10 69 0 0
// CHECK-NEXT: 1023 ite 490 1022 1021 1014
// CHECK-NEXT: 1024 slice 10 1023 44 44
// CHECK-NEXT: 1025 concat 493 1024 1023
// CHECK-NEXT: 1026 slice 10 1023 44 44
// CHECK-NEXT: 1027 concat 496 1026 1025
// CHECK-NEXT: 1028 slice 10 1023 44 44
// CHECK-NEXT: 1029 concat 23 1028 1027
// CHECK-NEXT: 1030 uext 103 97 1
// CHECK-NEXT: 1031 eq 10 868 1030
// CHECK-NEXT: 1032 ite 23 1031 1029 872
// CHECK-NEXT: 1033 const 103 00
// CHECK-NEXT: 1034 const 10 0
// CHECK-NEXT: 1035 concat 103 70 1034
// CHECK-NEXT: 1036 ite 103 649 1035 1033
// CHECK-NEXT: 1037 const 493 0000000000000000000000000000000000000000000000
// CHECK-NEXT: 1038 concat 23 1037 1036
// CHECK-NEXT: 1039 redor 10 868
// CHECK-NEXT: 1040 not 10 1039
// CHECK-NEXT: 1041 ite 23 1040 1038 1032
// CHECK-NEXT: 1042 xor 23 865 1041
// CHECK-NEXT: 1043 input 23
// CHECK-NEXT: 1044 slice 103 604 3 2
// CHECK-NEXT: 1045 eq 10 1044 606
// CHECK-NEXT: 1046 ite 23 1045 854 1043
// CHECK-NEXT: 1047 const 23 111111111111111111111111111111111111111111111111
// CHECK-NEXT: 1048 eq 10 1044 105
// CHECK-NEXT: 1049 ite 23 1048 1047 1046
// CHECK-NEXT: 1050 input 487
// CHECK-NEXT: 1051 and 487 1011 1050
// CHECK-NEXT: 1052 slice 10 1010 44 44
// CHECK-NEXT: 1053 not 10 1052
// CHECK-NEXT: 1054 concat 490 1053 1051
// CHECK-NEXT: 1055 state 490
// CHECK-NEXT: 1056 state 490
// CHECK-NEXT: 1057 state 10
// CHECK-NEXT: 1058 init 10 1057 97
// CHECK-NEXT: 1059 concat 103 102 1057
// CHECK-NEXT: 1060 eq 10 1059 105
// CHECK-NEXT: 1061 ite 490 1060 1056 1055
// CHECK-NEXT: 1062 ite 490 1022 1061 1054
// CHECK-NEXT: 1063 const 28 000
// CHECK-NEXT: 1064 concat 23 1063 1062
// CHECK-NEXT: 1065 uext 103 97 1
// CHECK-NEXT: 1066 eq 10 1044 1065
// CHECK-NEXT: 1067 ite 23 1066 1064 1049
// CHECK-NEXT: 1068 redor 10 1044
// CHECK-NEXT: 1069 not 10 1068
// CHECK-NEXT: 1070 ite 23 1069 861 1067
// CHECK-NEXT: 1071 xor 23 1042 1070
// CHECK-NEXT: 1072 and 23 1041 1070
// CHECK-NEXT: 1073 and 23 865 1070
// CHECK-NEXT: 1074 or 23 1072 1073
// CHECK-NEXT: 1075 and 23 1041 865
// CHECK-NEXT: 1076 or 23 1074 1075
// CHECK-NEXT: 1077 slice 10 385 3 3
// CHECK-NEXT: 1078 ite 23 1077 1076 1071
// CHECK-NEXT: 1079 slice 10 385 2 2
// CHECK-NEXT: 1080 ite 23 1079 861 1076
// CHECK-NEXT: 1081 slice 496 1080 46 0
// CHECK-NEXT: 1082 concat 23 1081 1034
// CHECK-NEXT: 1083 and 23 1078 1082
// CHECK-NEXT: 1084 input 23
// CHECK-NEXT: 1085 slice 103 604 8 7
// CHECK-NEXT: 1086 eq 10 1085 606
// CHECK-NEXT: 1087 ite 23 1086 854 1084
// CHECK-NEXT: 1088 eq 10 1085 105
// CHECK-NEXT: 1089 ite 23 1088 77 1087
// CHECK-NEXT: 1090 uext 103 97 1
// CHECK-NEXT: 1091 eq 10 1085 1090
// CHECK-NEXT: 1092 ite 23 1091 507 1089
// CHECK-NEXT: 1093 redor 10 1085
// CHECK-NEXT: 1094 not 10 1093
// CHECK-NEXT: 1095 ite 23 1094 861 1092
// CHECK-NEXT: 1096 and 23 1095 1082
// CHECK-NEXT: 1097 or 23 1083 1096
// CHECK-NEXT: 1098 and 23 1078 1095
// CHECK-NEXT: 1099 or 23 1097 1098
// CHECK-NEXT: 1100 slice 215 1099 47 35
// CHECK-NEXT: 1101 uext 217 1100 1
// CHECK-NEXT: 1102 xor 23 1078 1082
// CHECK-NEXT: 1103 xor 23 1102 1095
// CHECK-NEXT: 1104 slice 213 1103 47 36
// CHECK-NEXT: 1105 slice 10 1080 47 47
// CHECK-NEXT: 1106 concat 215 1105 1104
// CHECK-NEXT: 1107 uext 217 1106 1
// CHECK-NEXT: 1108 add 217 1101 1107
// CHECK-NEXT: 1109 slice 213 1099 34 23
// CHECK-NEXT: 1110 uext 215 1109 1
// CHECK-NEXT: 1111 slice 213 1103 35 24
// CHECK-NEXT: 1112 uext 215 1111 1
// CHECK-NEXT: 1113 add 215 1110 1112
// CHECK-NEXT: 1114 slice 213 1099 22 11
// CHECK-NEXT: 1115 uext 215 1114 1
// CHECK-NEXT: 1116 slice 213 1103 23 12
// CHECK-NEXT: 1117 uext 215 1116 1
// CHECK-NEXT: 1118 add 215 1115 1117
// CHECK-NEXT: 1119 input 10
// CHECK-NEXT: 1120 slice 10 507 47 47
// CHECK-NEXT: 1121 not 10 1120
// CHECK-NEXT: 1122 slice 10 29 0 0
// CHECK-NEXT: 1123 neq 10 1122 97
// CHECK-NEXT: 1124 and 10 1123 1122
// CHECK-NEXT: 1125 slice 10 29 1 1
// CHECK-NEXT: 1126 neq 10 1125 97
// CHECK-NEXT: 1127 and 10 1126 1125
// CHECK-NEXT: 1128 slice 10 29 2 2
// CHECK-NEXT: 1129 neq 10 1128 97
// CHECK-NEXT: 1130 and 10 1129 1128
// CHECK-NEXT: 1131 concat 103 1127 1124
// CHECK-NEXT: 1132 concat 28 1130 1131
// CHECK-NEXT: 1133 state 28
// CHECK-NEXT: 1134 state 28
// CHECK-NEXT: 1135 state 10
// CHECK-NEXT: 1136 init 10 1135 97
// CHECK-NEXT: 1137 concat 103 102 1135
// CHECK-NEXT: 1138 eq 10 1137 105
// CHECK-NEXT: 1139 ite 28 1138 1134 1133
// CHECK-NEXT: 1140 slice 10 30 0 0
// CHECK-NEXT: 1141 ite 28 1140 1139 1132
// CHECK-NEXT: 1142 const 28 111
// CHECK-NEXT: 1143 eq 10 1141 1142
// CHECK-NEXT: 1144 ite 10 1143 1121 1119
// CHECK-NEXT: 1145 slice 10 917 26 26
// CHECK-NEXT: 1146 slice 10 955 17 17
// CHECK-NEXT: 1147 xor 10 1145 1146
// CHECK-NEXT: 1148 not 10 1147
// CHECK-NEXT: 1149 state 10
// CHECK-NEXT: 1150 state 10
// CHECK-NEXT: 1151 state 10
// CHECK-NEXT: 1152 init 10 1151 97
// CHECK-NEXT: 1153 concat 103 102 1151
// CHECK-NEXT: 1154 eq 10 1153 105
// CHECK-NEXT: 1155 ite 10 1154 1150 1149
// CHECK-NEXT: 1156 ite 10 1022 1155 1148
// CHECK-NEXT: 1157 not 10 1156
// CHECK-NEXT: 1158 const 28 110
// CHECK-NEXT: 1159 eq 10 1141 1158
// CHECK-NEXT: 1160 ite 10 1159 1157 1144
// CHECK-NEXT: 1161 eq 10 1141 645
// CHECK-NEXT: 1162 ite 10 1161 1120 1160
// CHECK-NEXT: 1163 state 10
// CHECK-NEXT: 1164 state 10
// CHECK-NEXT: 1165 state 10
// CHECK-NEXT: 1166 init 10 1165 97
// CHECK-NEXT: 1167 concat 103 102 1165
// CHECK-NEXT: 1168 eq 10 1167 105
// CHECK-NEXT: 1169 ite 10 1168 1164 1163
// CHECK-NEXT: 1170 state 7
// CHECK-NEXT: 1171 state 7
// CHECK-NEXT: 1172 state 10
// CHECK-NEXT: 1173 init 10 1172 97
// CHECK-NEXT: 1174 concat 103 102 1172
// CHECK-NEXT: 1175 eq 10 1174 105
// CHECK-NEXT: 1176 ite 7 1175 1171 1170
// CHECK-NEXT: 1177 slice 10 1176 3 3
// CHECK-NEXT: 1178 xor 10 1169 1177
// CHECK-NEXT: 1179 not 10 1178
// CHECK-NEXT: 1180 eq 10 1141 648
// CHECK-NEXT: 1181 ite 10 1180 1179 1162
// CHECK-NEXT: 1182 slice 10 74 47 47
// CHECK-NEXT: 1183 not 10 1182
// CHECK-NEXT: 1184 uext 28 606 1
// CHECK-NEXT: 1185 eq 10 1141 1184
// CHECK-NEXT: 1186 ite 10 1185 1183 1181
// CHECK-NEXT: 1187 not 10 25
// CHECK-NEXT: 1188 uext 28 105 1
// CHECK-NEXT: 1189 eq 10 1141 1188
// CHECK-NEXT: 1190 ite 10 1189 1187 1186
// CHECK-NEXT: 1191 uext 28 97 2
// CHECK-NEXT: 1192 eq 10 1141 1191
// CHECK-NEXT: 1193 ite 10 1192 1182 1190
// CHECK-NEXT: 1194 neq 10 26 97
// CHECK-NEXT: 1195 xor 10 26 53
// CHECK-NEXT: 1196 and 10 1194 1195
// CHECK-NEXT: 1197 state 10
// CHECK-NEXT: 1198 state 10
// CHECK-NEXT: 1199 state 10
// CHECK-NEXT: 1200 init 10 1199 97
// CHECK-NEXT: 1201 concat 103 102 1199
// CHECK-NEXT: 1202 eq 10 1201 105
// CHECK-NEXT: 1203 ite 10 1202 1198 1197
// CHECK-NEXT: 1204 slice 10 27 0 0
// CHECK-NEXT: 1205 ite 10 1204 1203 1196
// CHECK-NEXT: 1206 not 10 1205
// CHECK-NEXT: 1207 redor 10 1141
// CHECK-NEXT: 1208 not 10 1207
// CHECK-NEXT: 1209 ite 10 1208 1206 1193
// CHECK-NEXT: 1210 not 10 1209
// CHECK-NEXT: 1211 or 10 1077 1079
// CHECK-NEXT: 1212 ite 10 1211 1034 1210
// CHECK-NEXT: 1213 slice 211 1099 10 0
// CHECK-NEXT: 1214 concat 213 1213 1212
// CHECK-NEXT: 1215 uext 215 1214 1
// CHECK-NEXT: 1216 slice 213 1103 11 0
// CHECK-NEXT: 1217 uext 215 1216 1
// CHECK-NEXT: 1218 add 215 1215 1217
// CHECK-NEXT: 1219 slice 10 1218 12 12
// CHECK-NEXT: 1220 uext 215 1219 12
// CHECK-NEXT: 1221 add 215 1118 1220
// CHECK-NEXT: 1222 slice 10 1221 12 12
// CHECK-NEXT: 1223 uext 215 1222 12
// CHECK-NEXT: 1224 add 215 1113 1223
// CHECK-NEXT: 1225 slice 10 1224 12 12
// CHECK-NEXT: 1226 uext 217 1225 13
// CHECK-NEXT: 1227 add 217 1108 1226
// CHECK-NEXT: 1228 slice 10 1227 12 12
// CHECK-NEXT: 1229 xor 10 388 1228
// CHECK-NEXT: 1230 xor 10 388 1229
// CHECK-NEXT: 1231 slice 10 76 0 0
// CHECK-NEXT: 1232 ite 10 1231 1178 1230
// CHECK-NEXT: 1233 output 1232 CARRYCASCOUT 
// CHECK-NEXT: 1234 input 7
// CHECK-NEXT: 1235 const 7 0111
// CHECK-NEXT: 1236 and 7 1234 1235
// CHECK-NEXT: 1237 concat 7 1229 1063
// CHECK-NEXT: 1238 or 7 1236 1237
// CHECK-NEXT: 1239 ite 7 1231 1176 1238
// CHECK-NEXT: 1240 output 1239 CARRYOUT 
// CHECK-NEXT: 1241 slice 10 1227 13 13
// CHECK-NEXT: 1242 state 10
// CHECK-NEXT: 1243 state 10
// CHECK-NEXT: 1244 state 10
// CHECK-NEXT: 1245 init 10 1244 97
// CHECK-NEXT: 1246 concat 103 102 1244
// CHECK-NEXT: 1247 eq 10 1246 105
// CHECK-NEXT: 1248 ite 10 1247 1243 1242
// CHECK-NEXT: 1249 ite 10 1231 1248 1241
// CHECK-NEXT: 1250 output 1249 MULTSIGNOUT 
// CHECK-NEXT: 1251 input 10
// CHECK-NEXT: 1252 output 1251 OVERFLOW 
// CHECK-NEXT: 1253 slice 10 385 1 1
// CHECK-NEXT: 1254 slice 10 385 1 1
// CHECK-NEXT: 1255 concat 103 1254 1253
// CHECK-NEXT: 1256 slice 10 385 1 1
// CHECK-NEXT: 1257 concat 28 1256 1255
// CHECK-NEXT: 1258 slice 10 385 1 1
// CHECK-NEXT: 1259 concat 7 1258 1257
// CHECK-NEXT: 1260 slice 10 385 1 1
// CHECK-NEXT: 1261 concat 49 1260 1259
// CHECK-NEXT: 1262 slice 10 385 1 1
// CHECK-NEXT: 1263 concat 202 1262 1261
// CHECK-NEXT: 1264 slice 10 385 1 1
// CHECK-NEXT: 1265 concat 204 1264 1263
// CHECK-NEXT: 1266 slice 10 385 1 1
// CHECK-NEXT: 1267 concat 206 1266 1265
// CHECK-NEXT: 1268 slice 10 385 1 1
// CHECK-NEXT: 1269 concat 56 1268 1267
// CHECK-NEXT: 1270 slice 10 385 1 1
// CHECK-NEXT: 1271 concat 209 1270 1269
// CHECK-NEXT: 1272 slice 10 385 1 1
// CHECK-NEXT: 1273 concat 211 1272 1271
// CHECK-NEXT: 1274 slice 10 385 1 1
// CHECK-NEXT: 1275 concat 213 1274 1273
// CHECK-NEXT: 1276 slice 10 385 1 1
// CHECK-NEXT: 1277 concat 215 1276 1275
// CHECK-NEXT: 1278 slice 10 385 1 1
// CHECK-NEXT: 1279 concat 217 1278 1277
// CHECK-NEXT: 1280 slice 10 385 1 1
// CHECK-NEXT: 1281 concat 219 1280 1279
// CHECK-NEXT: 1282 slice 10 385 1 1
// CHECK-NEXT: 1283 concat 221 1282 1281
// CHECK-NEXT: 1284 slice 10 385 1 1
// CHECK-NEXT: 1285 concat 223 1284 1283
// CHECK-NEXT: 1286 slice 10 385 1 1
// CHECK-NEXT: 1287 concat 16 1286 1285
// CHECK-NEXT: 1288 slice 10 385 1 1
// CHECK-NEXT: 1289 concat 226 1288 1287
// CHECK-NEXT: 1290 slice 10 385 1 1
// CHECK-NEXT: 1291 concat 228 1290 1289
// CHECK-NEXT: 1292 slice 10 385 1 1
// CHECK-NEXT: 1293 concat 230 1292 1291
// CHECK-NEXT: 1294 slice 10 385 1 1
// CHECK-NEXT: 1295 concat 232 1294 1293
// CHECK-NEXT: 1296 slice 10 385 1 1
// CHECK-NEXT: 1297 concat 234 1296 1295
// CHECK-NEXT: 1298 slice 10 385 1 1
// CHECK-NEXT: 1299 concat 236 1298 1297
// CHECK-NEXT: 1300 slice 10 385 1 1
// CHECK-NEXT: 1301 concat 238 1300 1299
// CHECK-NEXT: 1302 slice 10 385 1 1
// CHECK-NEXT: 1303 concat 240 1302 1301
// CHECK-NEXT: 1304 slice 10 385 1 1
// CHECK-NEXT: 1305 concat 46 1304 1303
// CHECK-NEXT: 1306 slice 10 385 1 1
// CHECK-NEXT: 1307 concat 243 1306 1305
// CHECK-NEXT: 1308 slice 10 385 1 1
// CHECK-NEXT: 1309 concat 245 1308 1307
// CHECK-NEXT: 1310 slice 10 385 1 1
// CHECK-NEXT: 1311 concat 1 1310 1309
// CHECK-NEXT: 1312 slice 10 385 1 1
// CHECK-NEXT: 1313 concat 449 1312 1311
// CHECK-NEXT: 1314 slice 10 385 1 1
// CHECK-NEXT: 1315 concat 3 1314 1313
// CHECK-NEXT: 1316 slice 10 385 1 1
// CHECK-NEXT: 1317 concat 454 1316 1315
// CHECK-NEXT: 1318 slice 10 385 1 1
// CHECK-NEXT: 1319 concat 457 1318 1317
// CHECK-NEXT: 1320 slice 10 385 1 1
// CHECK-NEXT: 1321 concat 460 1320 1319
// CHECK-NEXT: 1322 slice 10 385 1 1
// CHECK-NEXT: 1323 concat 463 1322 1321
// CHECK-NEXT: 1324 slice 10 385 1 1
// CHECK-NEXT: 1325 concat 466 1324 1323
// CHECK-NEXT: 1326 slice 10 385 1 1
// CHECK-NEXT: 1327 concat 469 1326 1325
// CHECK-NEXT: 1328 slice 10 385 1 1
// CHECK-NEXT: 1329 concat 472 1328 1327
// CHECK-NEXT: 1330 slice 10 385 1 1
// CHECK-NEXT: 1331 concat 475 1330 1329
// CHECK-NEXT: 1332 slice 10 385 1 1
// CHECK-NEXT: 1333 concat 478 1332 1331
// CHECK-NEXT: 1334 slice 10 385 1 1
// CHECK-NEXT: 1335 concat 481 1334 1333
// CHECK-NEXT: 1336 slice 10 385 1 1
// CHECK-NEXT: 1337 concat 484 1336 1335
// CHECK-NEXT: 1338 slice 10 385 1 1
// CHECK-NEXT: 1339 concat 487 1338 1337
// CHECK-NEXT: 1340 slice 10 385 1 1
// CHECK-NEXT: 1341 concat 490 1340 1339
// CHECK-NEXT: 1342 slice 10 385 1 1
// CHECK-NEXT: 1343 concat 493 1342 1341
// CHECK-NEXT: 1344 slice 10 385 1 1
// CHECK-NEXT: 1345 concat 496 1344 1343
// CHECK-NEXT: 1346 slice 10 385 1 1
// CHECK-NEXT: 1347 concat 23 1346 1345
// CHECK-NEXT: 1348 slice 213 1218 11 0
// CHECK-NEXT: 1349 slice 213 1221 11 0
// CHECK-NEXT: 1350 concat 236 1349 1348
// CHECK-NEXT: 1351 slice 213 1224 11 0
// CHECK-NEXT: 1352 concat 463 1351 1350
// CHECK-NEXT: 1353 slice 213 1227 11 0
// CHECK-NEXT: 1354 concat 23 1353 1352
// CHECK-NEXT: 1355 xor 23 1347 1354
// CHECK-NEXT: 1356 ite 23 1231 507 1355
// CHECK-NEXT: 1357 output 1356 P 
// CHECK-NEXT: 1358 xor 23 73 1355
// CHECK-NEXT: 1359 or 23 1358 1047
// CHECK-NEXT: 1360 redand 10 1359
// CHECK-NEXT: 1361 state 10
// CHECK-NEXT: 1362 state 10
// CHECK-NEXT: 1363 state 10
// CHECK-NEXT: 1364 init 10 1363 97
// CHECK-NEXT: 1365 concat 103 102 1363
// CHECK-NEXT: 1366 eq 10 1365 105
// CHECK-NEXT: 1367 ite 10 1366 1362 1361
// CHECK-NEXT: 1368 ite 10 1231 1367 1360
// CHECK-NEXT: 1369 output 1368 PATTERNBDETECT 
// CHECK-NEXT: 1370 not 23 1358
// CHECK-NEXT: 1371 or 23 1370 1047
// CHECK-NEXT: 1372 redand 10 1371
// CHECK-NEXT: 1373 state 10
// CHECK-NEXT: 1374 state 10
// CHECK-NEXT: 1375 state 10
// CHECK-NEXT: 1376 init 10 1375 97
// CHECK-NEXT: 1377 concat 103 102 1375
// CHECK-NEXT: 1378 eq 10 1377 105
// CHECK-NEXT: 1379 ite 10 1378 1374 1373
// CHECK-NEXT: 1380 ite 10 1231 1379 1372
// CHECK-NEXT: 1381 output 1380 PATTERNDETECT 
// CHECK-NEXT: 1382 output 1356 PCOUT 
// CHECK-NEXT: 1383 input 10
// CHECK-NEXT: 1384 output 1383 UNDERFLOW 
// CHECK-NEXT: 1385 const 206 00000000
// CHECK-NEXT: 1386 state 206
// CHECK-NEXT: 1387 state 206
// CHECK-NEXT: 1388 state 10
// CHECK-NEXT: 1389 init 10 1388 97
// CHECK-NEXT: 1390 concat 103 102 1388
// CHECK-NEXT: 1391 eq 10 1390 105
// CHECK-NEXT: 1392 ite 206 1391 1387 1386
// CHECK-NEXT: 1393 ite 206 1231 1392 1385
// CHECK-NEXT: 1394 output 1393 XOROUT 
// CHECK-NEXT: 1395 uext 1 107 0 A1_reg 
// CHECK-NEXT: 1396 uext 46 917 0 A2A1 
// CHECK-NEXT: 1397 uext 1 254 0 A2_reg 
// CHECK-NEXT: 1398 uext 103 258 0 ACASCREG_BIN 
// CHECK-NEXT: 1399 uext 3 4 0 ACASCREG_REG 
// CHECK-NEXT: 1400 uext 1 5 0 ACIN_in 
// CHECK-NEXT: 1401 slice 10 6 0 0
// CHECK-NEXT: 1402 uext 10 1401 0 ADREG_BIN 
// CHECK-NEXT: 1403 uext 10 1034 0 ADREG_INT 
// CHECK-NEXT: 1404 uext 3 6 0 ADREG_REG 
// CHECK-NEXT: 1405 uext 10 388 0 ALUMODE10_in 
// CHECK-NEXT: 1406 uext 10 1169 0 ALUMODE10_reg 
// CHECK-NEXT: 1407 uext 10 384 0 ALUMODEREG_BIN 
// CHECK-NEXT: 1408 uext 3 9 0 ALUMODEREG_REG 
// CHECK-NEXT: 1409 uext 7 385 0 ALUMODE_DATA 
// CHECK-NEXT: 1410 uext 7 376 0 ALUMODE_in 
// CHECK-NEXT: 1411 uext 7 383 0 ALUMODE_reg 
// CHECK-NEXT: 1412 uext 23 1355 0 ALU_OUT_in 
// CHECK-NEXT: 1413 uext 23 507 0 ALU_OUT_reg 
// CHECK-NEXT: 1414 uext 10 1145 0 AMULT26_in 
// CHECK-NEXT: 1415 uext 10 1034 0 AMULTSEL_BIN 
// CHECK-NEXT: 1416 const 219 000000000000000
// CHECK-NEXT: 1417 concat 221 1416 11
// CHECK-NEXT: 1418 uext 221 1417 0 AMULTSEL_REG 
// CHECK-NEXT: 1419 uext 103 255 0 AREG_BIN 
// CHECK-NEXT: 1420 uext 3 12 0 AREG_REG 
// CHECK-NEXT: 1421 uext 103 1033 0 AUTORESET_PATDET_BIN 
// CHECK-NEXT: 1422 sort bitvec 120
// CHECK-NEXT: 1423 sort bitvec 119
// CHECK-NEXT: 1424 const 1423 00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
// CHECK-NEXT: 1425 concat 1422 1424 13
// CHECK-NEXT: 1426 uext 1422 1425 0 AUTORESET_PATDET_REG 
// CHECK-NEXT: 1427 uext 10 1034 0 AUTORESET_PRIORITY_BIN 
// CHECK-NEXT: 1428 const 472 000000000000000000000000000000000000000
// CHECK-NEXT: 1429 concat 475 1428 14
// CHECK-NEXT: 1430 uext 475 1429 0 AUTORESET_PRIORITY_REG 
// CHECK-NEXT: 1431 uext 1 257 0 A_ALU 
// CHECK-NEXT: 1432 uext 10 1034 0 A_INPUT_BIN 
// CHECK-NEXT: 1433 sort bitvec 56
// CHECK-NEXT: 1434 sort bitvec 55
// CHECK-NEXT: 1435 const 1434 0000000000000000000000000000000000000000000000000000000
// CHECK-NEXT: 1436 concat 1433 1435 15
// CHECK-NEXT: 1437 uext 1433 1436 0 A_INPUT_REG 
// CHECK-NEXT: 1438 uext 1 247 0 A_in 
// CHECK-NEXT: 1439 uext 16 268 0 B1_DATA_out 
// CHECK-NEXT: 1440 uext 16 955 0 B2B1 
// CHECK-NEXT: 1441 uext 16 349 0 B2_DATA 
// CHECK-NEXT: 1442 uext 16 346 0 B2_reg 
// CHECK-NEXT: 1443 uext 103 350 0 BCASCREG_BIN 
// CHECK-NEXT: 1444 uext 3 18 0 BCASCREG_REG 
// CHECK-NEXT: 1445 uext 16 19 0 BCIN_in 
// CHECK-NEXT: 1446 uext 10 1146 0 BMULT17_in 
// CHECK-NEXT: 1447 uext 10 1034 0 BMULTSEL_BIN 
// CHECK-NEXT: 1448 concat 221 1416 20
// CHECK-NEXT: 1449 uext 221 1448 0 BMULTSEL_REG 
// CHECK-NEXT: 1450 uext 103 347 0 BREG_BIN 
// CHECK-NEXT: 1451 uext 3 21 0 BREG_REG 
// CHECK-NEXT: 1452 uext 16 349 0 B_ALU 
// CHECK-NEXT: 1453 uext 10 1034 0 B_INPUT_BIN 
// CHECK-NEXT: 1454 concat 1433 1435 22
// CHECK-NEXT: 1455 uext 1433 1454 0 B_INPUT_REG 
// CHECK-NEXT: 1456 uext 16 339 0 B_in 
// CHECK-NEXT: 1457 uext 10 25 0 CARRYCASCIN_in 
// CHECK-NEXT: 1458 uext 10 1204 0 CARRYINREG_BIN 
// CHECK-NEXT: 1459 uext 3 27 0 CARRYINREG_REG 
// CHECK-NEXT: 1460 uext 10 1140 0 CARRYINSELREG_BIN 
// CHECK-NEXT: 1461 uext 3 30 0 CARRYINSELREG_REG 
// CHECK-NEXT: 1462 uext 28 1132 0 CARRYINSEL_in 
// CHECK-NEXT: 1463 uext 28 1141 0 CARRYINSEL_mux 
// CHECK-NEXT: 1464 uext 28 1139 0 CARRYINSEL_reg 
// CHECK-NEXT: 1465 uext 10 1196 0 CARRYIN_in 
// CHECK-NEXT: 1466 uext 10 1205 0 CARRYIN_mux 
// CHECK-NEXT: 1467 uext 10 1203 0 CARRYIN_reg 
// CHECK-NEXT: 1468 uext 10 1178 0 CCOUT_in 
// CHECK-NEXT: 1469 neq 10 31 97
// CHECK-NEXT: 1470 and 10 1469 31
// CHECK-NEXT: 1471 uext 10 1470 0 CEA1_in 
// CHECK-NEXT: 1472 neq 10 32 97
// CHECK-NEXT: 1473 and 10 1472 32
// CHECK-NEXT: 1474 uext 10 1473 0 CEA2_in 
// CHECK-NEXT: 1475 neq 10 34 97
// CHECK-NEXT: 1476 and 10 1475 34
// CHECK-NEXT: 1477 uext 10 1476 0 CEALUMODE_in 
// CHECK-NEXT: 1478 neq 10 35 97
// CHECK-NEXT: 1479 and 10 1478 35
// CHECK-NEXT: 1480 uext 10 1479 0 CEB1_in 
// CHECK-NEXT: 1481 neq 10 36 97
// CHECK-NEXT: 1482 and 10 1481 36
// CHECK-NEXT: 1483 uext 10 1482 0 CEB2_in 
// CHECK-NEXT: 1484 neq 10 38 97
// CHECK-NEXT: 1485 and 10 1484 38
// CHECK-NEXT: 1486 uext 10 1485 0 CECARRYIN_in 
// CHECK-NEXT: 1487 neq 10 39 97
// CHECK-NEXT: 1488 and 10 1487 39
// CHECK-NEXT: 1489 uext 10 1488 0 CECTRL_in 
// CHECK-NEXT: 1490 neq 10 37 97
// CHECK-NEXT: 1491 and 10 1490 37
// CHECK-NEXT: 1492 uext 10 1491 0 CEC_in 
// CHECK-NEXT: 1493 uext 10 41 0 CEINMODE_in 
// CHECK-NEXT: 1494 neq 10 42 97
// CHECK-NEXT: 1495 and 10 1494 42
// CHECK-NEXT: 1496 uext 10 1495 0 CEM_in 
// CHECK-NEXT: 1497 neq 10 43 97
// CHECK-NEXT: 1498 and 10 1497 43
// CHECK-NEXT: 1499 uext 10 1498 0 CEP_in 
// CHECK-NEXT: 1500 uext 10 102 0 CLK_in 
// CHECK-NEXT: 1501 input 7
// CHECK-NEXT: 1502 and 7 1501 1235
// CHECK-NEXT: 1503 or 7 1502 1237
// CHECK-NEXT: 1504 uext 7 1503 0 COUT_in 
// CHECK-NEXT: 1505 uext 7 1176 0 COUT_reg 
// CHECK-NEXT: 1506 uext 10 853 0 CREG_BIN 
// CHECK-NEXT: 1507 uext 3 45 0 CREG_REG 
// CHECK-NEXT: 1508 uext 23 854 0 C_DATA_in 
// CHECK-NEXT: 1509 uext 23 845 0 C_in 
// CHECK-NEXT: 1510 uext 23 852 0 C_reg 
// CHECK-NEXT: 1511 slice 10 48 0 0
// CHECK-NEXT: 1512 uext 10 1511 0 DREG_BIN 
// CHECK-NEXT: 1513 uext 10 1034 0 DREG_INT 
// CHECK-NEXT: 1514 uext 3 48 0 DREG_REG 
// CHECK-NEXT: 1515 uext 10 911 0 INMODEREG_BIN 
// CHECK-NEXT: 1516 uext 3 51 0 INMODEREG_REG 
// CHECK-NEXT: 1517 uext 49 903 0 INMODE_in 
// CHECK-NEXT: 1518 uext 49 912 0 INMODE_mux 
// CHECK-NEXT: 1519 uext 49 910 0 INMODE_reg 
// CHECK-NEXT: 1520 uext 7 52 0 IS_ALUMODE_INVERTED_REG 
// CHECK-NEXT: 1521 uext 10 53 0 IS_CARRYIN_INVERTED_REG 
// CHECK-NEXT: 1522 uext 10 54 0 IS_CLK_INVERTED_REG 
// CHECK-NEXT: 1523 uext 49 55 0 IS_INMODE_INVERTED_REG 
// CHECK-NEXT: 1524 uext 56 57 0 IS_OPMODE_INVERTED_REG 
// CHECK-NEXT: 1525 uext 10 58 0 IS_RSTALLCARRYIN_INVERTED_REG 
// CHECK-NEXT: 1526 uext 10 59 0 IS_RSTALUMODE_INVERTED_REG 
// CHECK-NEXT: 1527 uext 10 60 0 IS_RSTA_INVERTED_REG 
// CHECK-NEXT: 1528 uext 10 61 0 IS_RSTB_INVERTED_REG 
// CHECK-NEXT: 1529 uext 10 62 0 IS_RSTCTRL_INVERTED_REG 
// CHECK-NEXT: 1530 uext 10 63 0 IS_RSTC_INVERTED_REG 
// CHECK-NEXT: 1531 uext 10 64 0 IS_RSTD_INVERTED_REG 
// CHECK-NEXT: 1532 uext 10 65 0 IS_RSTINMODE_INVERTED_REG 
// CHECK-NEXT: 1533 uext 10 66 0 IS_RSTM_INVERTED_REG 
// CHECK-NEXT: 1534 uext 10 67 0 IS_RSTP_INVERTED_REG 
// CHECK-NEXT: 1535 uext 23 68 0 MASK_REG 
// CHECK-NEXT: 1536 uext 10 1022 0 MREG_BIN 
// CHECK-NEXT: 1537 uext 3 69 0 MREG_REG 
// CHECK-NEXT: 1538 uext 10 70 0 MULTSIGNIN_in 
// CHECK-NEXT: 1539 uext 10 1241 0 MULTSIGN_ALU_in 
// CHECK-NEXT: 1540 uext 10 1248 0 MULTSIGN_ALU_reg 
// CHECK-NEXT: 1541 uext 10 603 0 OPMODEREG_BIN 
// CHECK-NEXT: 1542 uext 3 72 0 OPMODEREG_REG 
// CHECK-NEXT: 1543 uext 56 595 0 OPMODE_in 
// CHECK-NEXT: 1544 uext 56 604 0 OPMODE_mux 
// CHECK-NEXT: 1545 uext 56 602 0 OPMODE_reg 
// CHECK-NEXT: 1546 uext 23 73 0 PATTERN_REG 
// CHECK-NEXT: 1547 uext 23 74 0 PCIN_in 
// CHECK-NEXT: 1548 uext 10 1034 0 PREADDINSEL_BIN 
// CHECK-NEXT: 1549 const 204 0000000
// CHECK-NEXT: 1550 concat 206 1549 75
// CHECK-NEXT: 1551 uext 206 1550 0 PREADDINSEL_REG 
// CHECK-NEXT: 1552 uext 46 917 0 PREADD_AB 
// CHECK-NEXT: 1553 uext 10 1231 0 PREG_BIN 
// CHECK-NEXT: 1554 uext 3 76 0 PREG_REG 
// CHECK-NEXT: 1555 uext 10 1120 0 P_FDBK_47_in 
// CHECK-NEXT: 1556 uext 23 507 0 P_FDBK_in 
// CHECK-NEXT: 1557 uext 23 77 0 RND_REG 
// CHECK-NEXT: 1558 neq 10 79 97
// CHECK-NEXT: 1559 xor 10 79 58
// CHECK-NEXT: 1560 and 10 1558 1559
// CHECK-NEXT: 1561 uext 10 1560 0 RSTALLCARRYIN_in 
// CHECK-NEXT: 1562 neq 10 80 97
// CHECK-NEXT: 1563 xor 10 80 59
// CHECK-NEXT: 1564 and 10 1562 1563
// CHECK-NEXT: 1565 uext 10 1564 0 RSTALUMODE_in 
// CHECK-NEXT: 1566 neq 10 78 97
// CHECK-NEXT: 1567 xor 10 78 60
// CHECK-NEXT: 1568 and 10 1566 1567
// CHECK-NEXT: 1569 uext 10 1568 0 RSTA_in 
// CHECK-NEXT: 1570 neq 10 81 97
// CHECK-NEXT: 1571 xor 10 81 61
// CHECK-NEXT: 1572 and 10 1570 1571
// CHECK-NEXT: 1573 uext 10 1572 0 RSTB_in 
// CHECK-NEXT: 1574 neq 10 83 97
// CHECK-NEXT: 1575 xor 10 83 62
// CHECK-NEXT: 1576 and 10 1574 1575
// CHECK-NEXT: 1577 uext 10 1576 0 RSTCTRL_in 
// CHECK-NEXT: 1578 neq 10 82 97
// CHECK-NEXT: 1579 xor 10 82 63
// CHECK-NEXT: 1580 and 10 1578 1579
// CHECK-NEXT: 1581 uext 10 1580 0 RSTC_in 
// CHECK-NEXT: 1582 neq 10 85 97
// CHECK-NEXT: 1583 xor 10 85 65
// CHECK-NEXT: 1584 and 10 1582 1583
// CHECK-NEXT: 1585 uext 10 1584 0 RSTINMODE_in 
// CHECK-NEXT: 1586 neq 10 86 97
// CHECK-NEXT: 1587 xor 10 86 66
// CHECK-NEXT: 1588 and 10 1586 1587
// CHECK-NEXT: 1589 uext 10 1588 0 RSTM_in 
// CHECK-NEXT: 1590 neq 10 87 97
// CHECK-NEXT: 1591 xor 10 87 67
// CHECK-NEXT: 1592 and 10 1590 1591
// CHECK-NEXT: 1593 uext 10 1592 0 RSTP_in 
// CHECK-NEXT: 1594 uext 103 1033 0 SEL_MASK_BIN 
// CHECK-NEXT: 1595 sort bitvec 112
// CHECK-NEXT: 1596 sort bitvec 111
// CHECK-NEXT: 1597 const 1596 000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
// CHECK-NEXT: 1598 concat 1595 1597 88
// CHECK-NEXT: 1599 uext 1595 1598 0 SEL_MASK_REG 
// CHECK-NEXT: 1600 uext 10 1034 0 SEL_PATTERN_BIN 
// CHECK-NEXT: 1601 concat 1433 1435 89
// CHECK-NEXT: 1602 uext 1433 1601 0 SEL_PATTERN_REG 
// CHECK-NEXT: 1603 uext 103 1033 0 USE_MULT_BIN 
// CHECK-NEXT: 1604 sort bitvec 64
// CHECK-NEXT: 1605 sort bitvec 63
// CHECK-NEXT: 1606 const 1605 000000000000000000000000000000000000000000000000000000000000000
// CHECK-NEXT: 1607 concat 1604 1606 90
// CHECK-NEXT: 1608 uext 1604 1607 0 USE_MULT_REG 
// CHECK-NEXT: 1609 uext 10 1034 0 USE_PATTERN_DETECT_BIN 
// CHECK-NEXT: 1610 sort bitvec 72
// CHECK-NEXT: 1611 sort bitvec 71
// CHECK-NEXT: 1612 const 1611 00000000000000000000000000000000000000000000000000000000000000000000000
// CHECK-NEXT: 1613 concat 1610 1612 91
// CHECK-NEXT: 1614 uext 1610 1613 0 USE_PATTERN_DETECT_REG 
// CHECK-NEXT: 1615 uext 103 1033 0 USE_SIMD_BIN 
// CHECK-NEXT: 1616 const 496 00000000000000000000000000000000000000000000000
// CHECK-NEXT: 1617 concat 23 1616 92
// CHECK-NEXT: 1618 uext 23 1617 0 USE_SIMD_REG 
// CHECK-NEXT: 1619 uext 10 1034 0 USE_WIDEXOR_BIN 
// CHECK-NEXT: 1620 concat 475 1428 93
// CHECK-NEXT: 1621 uext 475 1620 0 USE_WIDEXOR_REG 
// CHECK-NEXT: 1622 uext 490 1023 0 U_DATA 
// CHECK-NEXT: 1623 uext 490 1023 0 U_DATA_in 
// CHECK-NEXT: 1624 uext 490 1021 0 U_DATA_reg 
// CHECK-NEXT: 1625 uext 487 1013 0 U_in
// CHECK-NEXT: 1626 uext 490 1062 0 V_DATA 
// CHECK-NEXT: 1627 uext 490 1062 0 V_DATA_in 
// CHECK-NEXT: 1628 uext 490 1061 0 V_DATA_reg 
// CHECK-NEXT: 1629 uext 490 1054 0 V_in 
// CHECK-NEXT: 1630 uext 10 1034 0 XORSIMD_BIN 
// CHECK-NEXT: 1631 sort bitvec 88
// CHECK-NEXT: 1632 sort bitvec 87
// CHECK-NEXT: 1633 const 1632 000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
// CHECK-NEXT: 1634 concat 1631 1633 94
// CHECK-NEXT: 1635 uext 1631 1634 0 XORSIMD_REG 
// CHECK-NEXT: 1636 uext 206 1385 0 XOR_MX_in 
// CHECK-NEXT: 1637 uext 206 1392 0 XOR_MX_reg 
// CHECK-NEXT: 1638 sort bitvec 49
// CHECK-NEXT: 1639 concat 1638 1099 1212
// CHECK-NEXT: 1640 uext 1638 1639 0 a_int 
// CHECK-NEXT: 1641 uext 46 917 0 a_mult_mux 
// CHECK-NEXT: 1642 uext 10 97 0 auto_reset_pri 
// CHECK-NEXT: 1643 uext 16 955 0 b_mult_mux 
// CHECK-NEXT: 1644 uext 10 1148 0 c_mult 
// CHECK-NEXT: 1645 uext 10 1495 0 ce_m_g 
// CHECK-NEXT: 1646 uext 10 1212 0 cin 
// CHECK-NEXT: 1647 uext 10 1209 0 cin_b 
// CHECK-NEXT: 1648 uext 23 1076 0 co 
// CHECK-NEXT: 1649 slice 10 1099 11 11
// CHECK-NEXT: 1650 uext 10 1649 0 co12_lsb 
// CHECK-NEXT: 1651 slice 10 1099 23 23
// CHECK-NEXT: 1652 uext 10 1651 0 co24_lsb 
// CHECK-NEXT: 1653 slice 10 1099 35 35
// CHECK-NEXT: 1654 uext 10 1653 0 co36_lsb 
// CHECK-NEXT: 1655 uext 23 1080 0 comux 
// CHECK-NEXT: 1656 uext 23 1080 0 comux4simd 
// CHECK-NEXT: 1657 uext 23 1099 0 comux_w 
// CHECK-NEXT: 1658 uext 10 1229 0 cout3 
// CHECK-NEXT: 1659 uext 10 1241 0 cout4 
// CHECK-NEXT: 1660 uext 10 1229 0 cout_3 
// CHECK-NEXT: 1661 ite 10 1495 1148 1155
// CHECK-NEXT: 1662 uext 10 1661 0 d_carryin_int 
// CHECK-NEXT: 1663 ite 10 1560 1034 1661
// CHECK-NEXT: 1664 uext 10 1663 0 dr_carryin_int 
// CHECK-NEXT: 1665 uext 10 1034 0 glblGSR 
// CHECK-NEXT: 1666 uext 10 1219 0 intc1 
// CHECK-NEXT: 1667 uext 10 1222 0 intc2 
// CHECK-NEXT: 1668 uext 10 1225 0 intc3 
// CHECK-NEXT: 1669 uext 490 1010 0 mult 
// CHECK-NEXT: 1670 uext 10 1156 0 multcarryin_data 
// CHECK-NEXT: 1671 uext 10 97 0 opmode_valid_flag_dou 
// CHECK-NEXT: 1672 uext 10 1372 0 pdet_o 
// CHECK-NEXT: 1673 uext 10 1380 0 pdet_o_mux 
// CHECK-NEXT: 1674 uext 10 1379 0 pdet_o_reg1 
// CHECK-NEXT: 1675 uext 10 1360 0 pdetb_o 
// CHECK-NEXT: 1676 uext 10 1368 0 pdetb_o_mux 
// CHECK-NEXT: 1677 uext 10 1367 0 pdetb_o_reg1 
// CHECK-NEXT: 1678 uext 487 1012 0 ps_u_mask 
// CHECK-NEXT: 1679 uext 487 1050 0 ps_v_mask 
// CHECK-NEXT: 1680 uext 10 1155 0 qmultcarryin 
// CHECK-NEXT: 1681 uext 10 1560 0 rst_carryin_g 
// CHECK-NEXT: 1682 uext 23 1071 0 s 
// CHECK-NEXT: 1683 uext 215 1218 0 s0 
// CHECK-NEXT: 1684 uext 215 1221 0 s1 
// CHECK-NEXT: 1685 uext 215 1224 0 s2 
// CHECK-NEXT: 1686 uext 217 1227 0 s3 
// CHECK-NEXT: 1687 uext 23 1078 0 smux 
// CHECK-NEXT: 1688 uext 23 1103 0 smux_w 
// CHECK-NEXT: 1689 uext 10 1034 0 the_auto_reset_patdet 
// CHECK-NEXT: 1690 uext 23 1047 0 the_mask 
// CHECK-NEXT: 1691 uext 23 73 0 the_pattern 
// CHECK-NEXT: 1692 uext 23 1095 0 wmux 
// CHECK-NEXT: 1693 uext 103 1036 0 x_mac_cascd
// CHECK-NEXT: 1694 uext 23 1041 0 xmux 
// CHECK-NEXT: 1695 uext 10 1034 0 xor_12a 
// CHECK-NEXT: 1696 uext 10 1034 0 xor_12b 
// CHECK-NEXT: 1697 uext 10 1034 0 xor_12c 
// CHECK-NEXT: 1698 uext 10 1034 0 xor_12d 
// CHECK-NEXT: 1699 uext 10 1034 0 xor_12e 
// CHECK-NEXT: 1700 uext 10 1034 0 xor_12f 
// CHECK-NEXT: 1701 uext 10 1034 0 xor_12g 
// CHECK-NEXT: 1702 uext 10 1034 0 xor_12h 
// CHECK-NEXT: 1703 uext 10 1034 0 xor_24a 
// CHECK-NEXT: 1704 uext 10 1034 0 xor_24b 
// CHECK-NEXT: 1705 uext 10 1034 0 xor_24c 
// CHECK-NEXT: 1706 uext 10 1034 0 xor_24d 
// CHECK-NEXT: 1707 uext 10 1034 0 xor_48a 
// CHECK-NEXT: 1708 uext 10 1034 0 xor_48b 
// CHECK-NEXT: 1709 uext 10 1034 0 xor_96 
// CHECK-NEXT: 1710 uext 23 1070 0 ymux 
// CHECK-NEXT: 1711 uext 23 865 0 z_optinv 
// CHECK-NEXT: 1712 uext 23 864 0 zmux 
// CHECK-NEXT: 1713 next 1 95 107
// CHECK-NEXT: 1714 ite 1 1470 247 107
// CHECK-NEXT: 1715 const 1 000000000000000000000000000000
// CHECK-NEXT: 1716 redor 10 255
// CHECK-NEXT: 1717 not 10 1716
// CHECK-NEXT: 1718 or 10 1568 1717
// CHECK-NEXT: 1719 ite 1 1718 1715 1714
// CHECK-NEXT: 1720 next 1 96 1719
// CHECK-NEXT: 1721 next 10 98 102
// CHECK-NEXT: 1722 next 1 248 254
// CHECK-NEXT: 1723 eq 10 255 105
// CHECK-NEXT: 1724 ite 1 1723 107 247
// CHECK-NEXT: 1725 ite 1 1473 1724 254
// CHECK-NEXT: 1726 ite 1 1718 1715 1725
// CHECK-NEXT: 1727 next 1 249 1726
// CHECK-NEXT: 1728 next 10 250 102
// CHECK-NEXT: 1729 next 16 262 268
// CHECK-NEXT: 1730 ite 16 1479 339 268
// CHECK-NEXT: 1731 const 16 000000000000000000
// CHECK-NEXT: 1732 redor 10 347
// CHECK-NEXT: 1733 not 10 1732
// CHECK-NEXT: 1734 or 10 1572 1733
// CHECK-NEXT: 1735 ite 16 1734 1731 1730
// CHECK-NEXT: 1736 next 16 263 1735
// CHECK-NEXT: 1737 next 10 264 102
// CHECK-NEXT: 1738 next 16 340 346
// CHECK-NEXT: 1739 eq 10 347 105
// CHECK-NEXT: 1740 ite 16 1739 268 339
// CHECK-NEXT: 1741 ite 16 1482 1740 346
// CHECK-NEXT: 1742 ite 16 1572 1731 1741
// CHECK-NEXT: 1743 next 16 341 1742
// CHECK-NEXT: 1744 next 10 342 102
// CHECK-NEXT: 1745 next 7 377 383
// CHECK-NEXT: 1746 ite 7 1476 376 383
// CHECK-NEXT: 1747 const 7 0000
// CHECK-NEXT: 1748 ite 7 1564 1747 1746
// CHECK-NEXT: 1749 next 7 378 1748
// CHECK-NEXT: 1750 next 10 379 102
// CHECK-NEXT: 1751 next 23 501 507
// CHECK-NEXT: 1752 and 10 1498 1231
// CHECK-NEXT: 1753 ite 23 1752 1355 507
// CHECK-NEXT: 1754 ite 23 1592 861 1753
// CHECK-NEXT: 1755 next 23 502 1754
// CHECK-NEXT: 1756 next 10 503 102
// CHECK-NEXT: 1757 next 56 596 602
// CHECK-NEXT: 1758 ite 56 1488 595 602
// CHECK-NEXT: 1759 const 56 000000000
// CHECK-NEXT: 1760 ite 56 1576 1759 1758
// CHECK-NEXT: 1761 next 56 597 1760
// CHECK-NEXT: 1762 next 10 598 102
// CHECK-NEXT: 1763 next 23 846 852
// CHECK-NEXT: 1764 ite 23 1491 845 852
// CHECK-NEXT: 1765 not 10 853
// CHECK-NEXT: 1766 or 10 1580 1765
// CHECK-NEXT: 1767 ite 23 1766 861 1764
// CHECK-NEXT: 1768 next 23 847 1767
// CHECK-NEXT: 1769 next 10 848 102
// CHECK-NEXT: 1770 next 49 904 910
// CHECK-NEXT: 1771 ite 49 41 903 910
// CHECK-NEXT: 1772 const 49 00000
// CHECK-NEXT: 1773 not 10 911
// CHECK-NEXT: 1774 or 10 1584 1773
// CHECK-NEXT: 1775 ite 49 1774 1772 1771
// CHECK-NEXT: 1776 next 49 905 1775
// CHECK-NEXT: 1777 next 10 906 102
// CHECK-NEXT: 1778 next 490 1015 1021
// CHECK-NEXT: 1779 ite 490 1495 1014 1021
// CHECK-NEXT: 1780 const 490 000000000000000000000000000000000000000000000
// CHECK-NEXT: 1781 not 10 1022
// CHECK-NEXT: 1782 or 10 1588 1781
// CHECK-NEXT: 1783 ite 490 1782 1780 1779
// CHECK-NEXT: 1784 next 490 1016 1783
// CHECK-NEXT: 1785 next 10 1017 102
// CHECK-NEXT: 1786 next 490 1055 1061
// CHECK-NEXT: 1787 ite 490 1495 1054 1061
// CHECK-NEXT: 1788 ite 490 1782 1780 1787
// CHECK-NEXT: 1789 next 490 1056 1788
// CHECK-NEXT: 1790 next 10 1057 102
// CHECK-NEXT: 1791 next 28 1133 1139
// CHECK-NEXT: 1792 ite 28 1488 1132 1139
// CHECK-NEXT: 1793 ite 28 1576 1063 1792
// CHECK-NEXT: 1794 next 28 1134 1793
// CHECK-NEXT: 1795 next 10 1135 102
// CHECK-NEXT: 1796 next 10 1149 1155
// CHECK-NEXT: 1797 next 10 1150 1663
// CHECK-NEXT: 1798 next 10 1151 102
// CHECK-NEXT: 1799 next 10 1163 1169
// CHECK-NEXT: 1800 ite 10 1752 388 1169
// CHECK-NEXT: 1801 ite 10 1592 1034 1800
// CHECK-NEXT: 1802 next 10 1164 1801
// CHECK-NEXT: 1803 next 10 1165 102
// CHECK-NEXT: 1804 next 7 1170 1176
// CHECK-NEXT: 1805 input 7
// CHECK-NEXT: 1806 and 7 1805 1235
// CHECK-NEXT: 1807 or 7 1806 1237
// CHECK-NEXT: 1808 ite 7 1752 1807 1176
// CHECK-NEXT: 1809 ite 7 1592 1747 1808
// CHECK-NEXT: 1810 next 7 1171 1809
// CHECK-NEXT: 1811 next 10 1172 102
// CHECK-NEXT: 1812 next 10 1197 1203
// CHECK-NEXT: 1813 ite 10 1485 1196 1203
// CHECK-NEXT: 1814 ite 10 1560 1034 1813
// CHECK-NEXT: 1815 next 10 1198 1814
// CHECK-NEXT: 1816 next 10 1199 102
// CHECK-NEXT: 1817 next 10 1242 1248
// CHECK-NEXT: 1818 ite 10 1752 1241 1248
// CHECK-NEXT: 1819 ite 10 1592 1034 1818
// CHECK-NEXT: 1820 next 10 1243 1819
// CHECK-NEXT: 1821 next 10 1244 102
// CHECK-NEXT: 1822 next 10 1361 1367
// CHECK-NEXT: 1823 ite 10 1752 1360 1367
// CHECK-NEXT: 1824 ite 10 1592 1034 1823
// CHECK-NEXT: 1825 next 10 1362 1824
// CHECK-NEXT: 1826 next 10 1363 102
// CHECK-NEXT: 1827 next 10 1373 1379
// CHECK-NEXT: 1828 ite 10 1752 1372 1379
// CHECK-NEXT: 1829 ite 10 1592 1034 1828
// CHECK-NEXT: 1830 next 10 1374 1829
// CHECK-NEXT: 1831 next 10 1375 102
// CHECK-NEXT: 1832 next 206 1386 1392
// CHECK-NEXT: 1833 ite 206 1752 1385 1392
// CHECK-NEXT: 1834 ite 206 1592 1385 1833
// CHECK-NEXT: 1835 next 206 1387 1834
// CHECK-NEXT: 1836 next 10 1388 102
// CHECK-NEXT: ; end of yosys output
