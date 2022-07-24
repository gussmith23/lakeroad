// Note: We use a sed statement to filter out high impedance values 1'bz, so
// that we can import the result into Rosette more easily. This is not correct
// in general.
//
// We have also manually edited the Verilog to convert strings into logic
// arrays. Please see the edit history of this file for details.
//
// RUN: tmpfile=$(mktemp)
// RUN: sed -E "s/bz/b1/;s/bx/b0/" %s > $tmpfile
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

typedef enum logic [4:0] {
  A_ENUM_VAL = 0,
  B_ENUM_VAL = 1,
  AD_ENUM_VAL = 2,
  NO_RESET_ENUM_VAL = 3,
  RESET_MATCH_ENUM_VAL = 4,
  RESET_NOT_MATCH_ENUM_VAL = 5,
  RESET_ENUM_VAL = 6,
  DIRECT_ENUM_VAL = 7,
  MASK_ENUM_VAL = 8,
  PATTERN_ENUM_VAL = 9,
  MULTIPLY_ENUM_VAL = 10,
  NO_PATDET_ENUM_VAL = 11,
  ONE48_ENUM_VAL = 12,
  FALSE_ENUM_VAL = 13,
  XOR24_48_96_ENUM_VAL = 14,
  CASCADE_ENUM_VAL = 15,
  CEP_ENUM_VAL = 16,
  C_ENUM_VAL = 17,
  DYNAMIC_ENUM_VAL = 18,
  FOUR12_ENUM_VAL = 19,
  NONE_ENUM_VAL = 20,
  PATDET_ENUM_VAL = 21,
  ROUNDING_MODE1_ENUM_VAL = 22,
  ROUNDING_MODE2_ENUM_VAL = 23,
  TRUE_ENUM_VAL = 24,
  TWO24_ENUM_VAL = 25,
  XOR12_ENUM_VAL = 26
} CONSTANT_ENUM;

module DSP48E2 #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter integer ACASCREG = 1,
  parameter integer ADREG = 1,
  parameter integer ALUMODEREG = 1,
  parameter CONSTANT_ENUM AMULTSEL = A_ENUM_VAL,
  parameter integer AREG = 1,
  parameter CONSTANT_ENUM AUTORESET_PATDET = NO_RESET_ENUM_VAL,
  parameter CONSTANT_ENUM AUTORESET_PRIORITY = RESET_ENUM_VAL,
  parameter CONSTANT_ENUM A_INPUT = DIRECT_ENUM_VAL,
  parameter integer BCASCREG = 1,
  parameter CONSTANT_ENUM BMULTSEL = B_ENUM_VAL,
  parameter integer BREG = 1,
  parameter CONSTANT_ENUM B_INPUT = DIRECT_ENUM_VAL,
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
  parameter CONSTANT_ENUM PREADDINSEL = A_ENUM_VAL,
  parameter integer PREG = 1,
  parameter [47:0] RND = 48'h000000000000,
  parameter CONSTANT_ENUM SEL_MASK = MASK_ENUM_VAL,
  parameter CONSTANT_ENUM SEL_PATTERN = PATTERN_ENUM_VAL,
  parameter CONSTANT_ENUM USE_MULT = MULTIPLY_ENUM_VAL,
  parameter CONSTANT_ENUM USE_PATTERN_DETECT = NO_PATDET_ENUM_VAL,
  parameter CONSTANT_ENUM USE_SIMD = ONE48_ENUM_VAL,
  parameter CONSTANT_ENUM USE_WIDEXOR = FALSE_ENUM_VAL,
  parameter CONSTANT_ENUM XORSIMD = XOR24_48_96_ENUM_VAL
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
  reg [15:0] AMULTSEL_REG = AMULTSEL;
  reg [31:0] AREG_REG = AREG;
  reg [119:0] AUTORESET_PATDET_REG = AUTORESET_PATDET;
  reg [39:0] AUTORESET_PRIORITY_REG = AUTORESET_PRIORITY;
  reg [55:0] A_INPUT_REG = A_INPUT;
  reg [31:0] BCASCREG_REG = BCASCREG;
  reg [15:0] BMULTSEL_REG = BMULTSEL;
  reg [31:0] BREG_REG = BREG;
  reg [55:0] B_INPUT_REG = B_INPUT;
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
  reg [7:0] PREADDINSEL_REG = PREADDINSEL;
  reg [31:0] PREG_REG = PREG;
  reg [47:0] RND_REG = RND;
  reg [111:0] SEL_MASK_REG = SEL_MASK;
  reg [55:0] SEL_PATTERN_REG = SEL_PATTERN;
  reg [63:0] USE_MULT_REG = USE_MULT;
  reg [71:0] USE_PATTERN_DETECT_REG = USE_PATTERN_DETECT;
  reg [47:0] USE_SIMD_REG = USE_SIMD;
  reg [39:0] USE_WIDEXOR_REG = USE_WIDEXOR;
  reg [87:0] XORSIMD_REG = XORSIMD;
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
                (AMULTSEL_REG == A_ENUM_VAL) ? AMULTSEL_A :
                (AMULTSEL_REG == AD_ENUM_VAL) ? AMULTSEL_AD :
                    AMULTSEL_A;

  assign AREG_BIN = AREG_REG[1:0];

  assign AUTORESET_PATDET_BIN =
                (AUTORESET_PATDET_REG == NO_RESET_ENUM_VAL) ? AUTORESET_PATDET_NO_RESET :
                (AUTORESET_PATDET_REG == RESET_MATCH_ENUM_VAL) ? AUTORESET_PATDET_RESET_MATCH :
                (AUTORESET_PATDET_REG == RESET_NOT_MATCH_ENUM_VAL) ? AUTORESET_PATDET_RESET_NOT_MATCH :
                    AUTORESET_PATDET_NO_RESET;

  assign AUTORESET_PRIORITY_BIN =
                (AUTORESET_PRIORITY_REG == RESET_ENUM_VAL) ? AUTORESET_PRIORITY_RESET :
                (AUTORESET_PRIORITY_REG == CEP_ENUM_VAL) ? AUTORESET_PRIORITY_CEP :
                    AUTORESET_PRIORITY_RESET;

  assign A_INPUT_BIN =
                (A_INPUT_REG == DIRECT_ENUM_VAL) ? A_INPUT_DIRECT :
                (A_INPUT_REG == CASCADE_ENUM_VAL) ? A_INPUT_CASCADE :
                    A_INPUT_DIRECT;

  assign BCASCREG_BIN = BCASCREG_REG[1:0];

  assign BMULTSEL_BIN =
                (BMULTSEL_REG == B_ENUM_VAL) ? BMULTSEL_B :
                (BMULTSEL_REG == AD_ENUM_VAL) ? BMULTSEL_AD :
                    BMULTSEL_B;

  assign BREG_BIN = BREG_REG[1:0];

  assign B_INPUT_BIN =
                (B_INPUT_REG == DIRECT_ENUM_VAL) ? B_INPUT_DIRECT :
                (B_INPUT_REG == CASCADE_ENUM_VAL) ? B_INPUT_CASCADE :
                    B_INPUT_DIRECT;

  assign CARRYINREG_BIN = CARRYINREG_REG[0];

  assign CARRYINSELREG_BIN = CARRYINSELREG_REG[0];

  assign CREG_BIN = CREG_REG[0];

  assign DREG_BIN = DREG_REG[0];

  assign INMODEREG_BIN = INMODEREG_REG[0];

  assign MREG_BIN = MREG_REG[0];

  assign OPMODEREG_BIN = OPMODEREG_REG[0];

  assign PREADDINSEL_BIN =
                (PREADDINSEL_REG == A_ENUM_VAL) ? PREADDINSEL_A :
                (PREADDINSEL_REG == B_ENUM_VAL) ? PREADDINSEL_B :
                    PREADDINSEL_A;

  assign PREG_BIN = PREG_REG[0];

  assign SEL_MASK_BIN =
                (SEL_MASK_REG == MASK_ENUM_VAL) ? SEL_MASK_MASK :
                (SEL_MASK_REG == C_ENUM_VAL) ? SEL_MASK_C :
                (SEL_MASK_REG == ROUNDING_MODE1_ENUM_VAL) ? SEL_MASK_ROUNDING_MODE1 :
                (SEL_MASK_REG == ROUNDING_MODE2_ENUM_VAL) ? SEL_MASK_ROUNDING_MODE2 :
                    SEL_MASK_MASK;

  assign SEL_PATTERN_BIN =
                (SEL_PATTERN_REG == PATTERN_ENUM_VAL) ? SEL_PATTERN_PATTERN :
                (SEL_PATTERN_REG == C_ENUM_VAL) ? SEL_PATTERN_C :
                    SEL_PATTERN_PATTERN;

  assign USE_MULT_BIN =
                (USE_MULT_REG == MULTIPLY_ENUM_VAL) ? USE_MULT_MULTIPLY :
                (USE_MULT_REG == DYNAMIC_ENUM_VAL) ? USE_MULT_DYNAMIC :
                (USE_MULT_REG == NONE_ENUM_VAL) ? USE_MULT_NONE :
                    USE_MULT_MULTIPLY;

  assign USE_PATTERN_DETECT_BIN =
                (USE_PATTERN_DETECT_REG == NO_PATDET_ENUM_VAL) ? USE_PATTERN_DETECT_NO_PATDET :
                (USE_PATTERN_DETECT_REG == PATDET_ENUM_VAL) ? USE_PATTERN_DETECT_PATDET :
                    USE_PATTERN_DETECT_NO_PATDET;

  assign USE_SIMD_BIN =
                (USE_SIMD_REG == ONE48_ENUM_VAL) ? USE_SIMD_ONE48 :
                (USE_SIMD_REG == FOUR12_ENUM_VAL) ? USE_SIMD_FOUR12 :
                (USE_SIMD_REG == TWO24_ENUM_VAL) ? USE_SIMD_TWO24 :
                    USE_SIMD_ONE48;

  assign USE_WIDEXOR_BIN =
                (USE_WIDEXOR_REG == FALSE_ENUM_VAL) ? USE_WIDEXOR_FALSE :
                (USE_WIDEXOR_REG == TRUE_ENUM_VAL) ? USE_WIDEXOR_TRUE :
                    USE_WIDEXOR_FALSE;

  assign XORSIMD_BIN =
                (XORSIMD_REG == XOR24_48_96_ENUM_VAL) ? XORSIMD_XOR24_48_96 :
                (XORSIMD_REG == XOR12_ENUM_VAL) ? XORSIMD_XOR12 :
                    XORSIMD_XOR24_48_96;

`else
always @(trig_attr) begin
#1;
  ACASCREG_BIN = ACASCREG_REG[1:0];

  ADREG_BIN = ADREG_REG[0];

  ALUMODEREG_BIN = ALUMODEREG_REG[0];

  AMULTSEL_BIN =
                (AMULTSEL_REG == A_ENUM_VAL) ? AMULTSEL_A :
                (AMULTSEL_REG == AD_ENUM_VAL) ? AMULTSEL_AD :
                    AMULTSEL_A;

  AREG_BIN = AREG_REG[1:0];

  AUTORESET_PATDET_BIN =
                (AUTORESET_PATDET_REG == NO_RESET_ENUM_VAL) ? AUTORESET_PATDET_NO_RESET :
                (AUTORESET_PATDET_REG == RESET_MATCH_ENUM_VAL) ? AUTORESET_PATDET_RESET_MATCH :
                (AUTORESET_PATDET_REG == RESET_NOT_MATCH_ENUM_VAL) ? AUTORESET_PATDET_RESET_NOT_MATCH :
                    AUTORESET_PATDET_NO_RESET;

  AUTORESET_PRIORITY_BIN =
                (AUTORESET_PRIORITY_REG == RESET_ENUM_VAL) ? AUTORESET_PRIORITY_RESET :
                (AUTORESET_PRIORITY_REG == CEP_ENUM_VAL) ? AUTORESET_PRIORITY_CEP :
                    AUTORESET_PRIORITY_RESET;

  A_INPUT_BIN =
                (A_INPUT_REG == DIRECT_ENUM_VAL) ? A_INPUT_DIRECT :
                (A_INPUT_REG == CASCADE_ENUM_VAL) ? A_INPUT_CASCADE :
                    A_INPUT_DIRECT;

  BCASCREG_BIN = BCASCREG_REG[1:0];

  BMULTSEL_BIN =
                (BMULTSEL_REG == B_ENUM_VAL) ? BMULTSEL_B :
                (BMULTSEL_REG == AD_ENUM_VAL) ? BMULTSEL_AD :
                    BMULTSEL_B;

  BREG_BIN = BREG_REG[1:0];

  B_INPUT_BIN =
                (B_INPUT_REG == DIRECT_ENUM_VAL) ? B_INPUT_DIRECT :
                (B_INPUT_REG == CASCADE_ENUM_VAL) ? B_INPUT_CASCADE :
                    B_INPUT_DIRECT;

  CARRYINREG_BIN = CARRYINREG_REG[0];

  CARRYINSELREG_BIN = CARRYINSELREG_REG[0];

  CREG_BIN = CREG_REG[0];

  DREG_BIN = DREG_REG[0];

  INMODEREG_BIN = INMODEREG_REG[0];

  MREG_BIN = MREG_REG[0];

  OPMODEREG_BIN = OPMODEREG_REG[0];

  PREADDINSEL_BIN =
                (PREADDINSEL_REG == A_ENUM_VAL) ? PREADDINSEL_A :
                (PREADDINSEL_REG == B_ENUM_VAL) ? PREADDINSEL_B :
                    PREADDINSEL_A;

  PREG_BIN = PREG_REG[0];

  SEL_MASK_BIN =
                (SEL_MASK_REG == MASK_ENUM_VAL) ? SEL_MASK_MASK :
                (SEL_MASK_REG == C_ENUM_VAL) ? SEL_MASK_C :
                (SEL_MASK_REG == ROUNDING_MODE1_ENUM_VAL) ? SEL_MASK_ROUNDING_MODE1 :
                (SEL_MASK_REG == ROUNDING_MODE2_ENUM_VAL) ? SEL_MASK_ROUNDING_MODE2 :
                    SEL_MASK_MASK;

  SEL_PATTERN_BIN =
                (SEL_PATTERN_REG == PATTERN_ENUM_VAL) ? SEL_PATTERN_PATTERN :
                (SEL_PATTERN_REG == C_ENUM_VAL) ? SEL_PATTERN_C :
                    SEL_PATTERN_PATTERN;

  USE_MULT_BIN =
                (USE_MULT_REG == MULTIPLY_ENUM_VAL) ? USE_MULT_MULTIPLY :
                (USE_MULT_REG == DYNAMIC_ENUM_VAL) ? USE_MULT_DYNAMIC :
                (USE_MULT_REG == NONE_ENUM_VAL) ? USE_MULT_NONE :
                    USE_MULT_MULTIPLY;

  USE_PATTERN_DETECT_BIN =
                (USE_PATTERN_DETECT_REG == NO_PATDET_ENUM_VAL) ? USE_PATTERN_DETECT_NO_PATDET :
                (USE_PATTERN_DETECT_REG == PATDET_ENUM_VAL) ? USE_PATTERN_DETECT_PATDET :
                    USE_PATTERN_DETECT_NO_PATDET;

  USE_SIMD_BIN =
                (USE_SIMD_REG == ONE48_ENUM_VAL) ? USE_SIMD_ONE48 :
                (USE_SIMD_REG == FOUR12_ENUM_VAL) ? USE_SIMD_FOUR12 :
                (USE_SIMD_REG == TWO24_ENUM_VAL) ? USE_SIMD_TWO24 :
                    USE_SIMD_ONE48;

  USE_WIDEXOR_BIN =
                (USE_WIDEXOR_REG == FALSE_ENUM_VAL) ? USE_WIDEXOR_FALSE :
                (USE_WIDEXOR_REG == TRUE_ENUM_VAL) ? USE_WIDEXOR_TRUE :
                    USE_WIDEXOR_FALSE;

  XORSIMD_BIN =
                (XORSIMD_REG == XOR24_48_96_ENUM_VAL) ? XORSIMD_XOR24_48_96 :
                (XORSIMD_REG == XOR12_ENUM_VAL) ? XORSIMD_XOR12 :
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
        ((AMULTSEL_REG != A_ENUM_VAL) &&
         (AMULTSEL_REG != AD_ENUM_VAL))) begin
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
        ((AUTORESET_PATDET_REG != NO_RESET_ENUM_VAL) &&
         (AUTORESET_PATDET_REG != RESET_MATCH_ENUM_VAL) &&
         (AUTORESET_PATDET_REG != RESET_NOT_MATCH_ENUM_VAL))) begin
      $display("Error: [Unisim %s-106] AUTORESET_PATDET attribute is set to %s.  Legal values for this attribute are NO_RESET, RESET_MATCH or RESET_NOT_MATCH. Instance: %m", MODULE_NAME, AUTORESET_PATDET_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((AUTORESET_PRIORITY_REG != RESET_ENUM_VAL) &&
         (AUTORESET_PRIORITY_REG != CEP_ENUM_VAL))) begin
      $display("Error: [Unisim %s-107] AUTORESET_PRIORITY attribute is set to %s.  Legal values for this attribute are RESET or CEP. Instance: %m", MODULE_NAME, AUTORESET_PRIORITY_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((A_INPUT_REG != DIRECT_ENUM_VAL) &&
         (A_INPUT_REG != CASCADE_ENUM_VAL))) begin
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
        ((BMULTSEL_REG != B_ENUM_VAL) &&
         (BMULTSEL_REG != AD_ENUM_VAL))) begin
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
        ((B_INPUT_REG != DIRECT_ENUM_VAL) &&
         (B_INPUT_REG != CASCADE_ENUM_VAL))) begin
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
        ((PREADDINSEL_REG != A_ENUM_VAL) &&
         (PREADDINSEL_REG != B_ENUM_VAL))) begin
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
        ((SEL_MASK_REG != MASK_ENUM_VAL) &&
         (SEL_MASK_REG != C_ENUM_VAL) &&
         (SEL_MASK_REG != ROUNDING_MODE1_ENUM_VAL) &&
         (SEL_MASK_REG != ROUNDING_MODE2_ENUM_VAL))) begin
      $display("Error: [Unisim %s-140] SEL_MASK attribute is set to %s.  Legal values for this attribute are MASK, C, ROUNDING_MODE1 or ROUNDING_MODE2. Instance: %m", MODULE_NAME, SEL_MASK_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((SEL_PATTERN_REG != PATTERN_ENUM_VAL) &&
         (SEL_PATTERN_REG != C_ENUM_VAL))) begin
      $display("Error: [Unisim %s-141] SEL_PATTERN attribute is set to %s.  Legal values for this attribute are PATTERN or C. Instance: %m", MODULE_NAME, SEL_PATTERN_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((USE_MULT_REG != MULTIPLY_ENUM_VAL) &&
         (USE_MULT_REG != DYNAMIC_ENUM_VAL) &&
         (USE_MULT_REG != NONE_ENUM_VAL))) begin
      $display("Error: [Unisim %s-142] USE_MULT attribute is set to %s.  Legal values for this attribute are MULTIPLY, DYNAMIC or NONE. Instance: %m", MODULE_NAME, USE_MULT_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((USE_PATTERN_DETECT_REG != NO_PATDET_ENUM_VAL) &&
         (USE_PATTERN_DETECT_REG != PATDET_ENUM_VAL))) begin
      $display("Error: [Unisim %s-143] USE_PATTERN_DETECT attribute is set to %s.  Legal values for this attribute are NO_PATDET or PATDET. Instance: %m", MODULE_NAME, USE_PATTERN_DETECT_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((USE_SIMD_REG != ONE48_ENUM_VAL) &&
         (USE_SIMD_REG != FOUR12_ENUM_VAL) &&
         (USE_SIMD_REG != TWO24_ENUM_VAL))) begin
      $display("Error: [Unisim %s-144] USE_SIMD attribute is set to %s.  Legal values for this attribute are ONE48, FOUR12 or TWO24. Instance: %m", MODULE_NAME, USE_SIMD_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((USE_WIDEXOR_REG != FALSE_ENUM_VAL) &&
         (USE_WIDEXOR_REG != TRUE_ENUM_VAL))) begin
      $display("Error: [Unisim %s-145] USE_WIDEXOR attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, USE_WIDEXOR_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((XORSIMD_REG != XOR24_48_96_ENUM_VAL) &&
         (XORSIMD_REG != XOR12_ENUM_VAL))) begin
      $display("Error: [Unisim %s-146] XORSIMD attribute is set to %s.  Legal values for this attribute are XOR24_48_96 or XOR12. Instance: %m", MODULE_NAME, XORSIMD_REG);
      attr_err = 1'b1;
    end

    if (attr_err == 1'b1) #1 $finish;
  end
`endif

// begin behavioral model

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

  initial begin
    ps_u_mask = 44'h55555555555;
    ps_v_mask = 44'haaaaaaaaaaa;
  end

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
	        // $display("DRC warning : [Unisim %s-7] CARRYCASCIN can only be used in the current %s if the previous %s is performing a two input ADD or SUBRTACT operation or the current %s is configured in the MAC extend opmode 7'b1001000 at %.3f ns. Instance %m\n", MODULE_NAME, MODULE_NAME, MODULE_NAME, MODULE_NAME, $time/1000.0);
          // CR 619940 -- Enhanced DRC warning
          // $display("The simulation model does not know the placement of the %s slices used, so it cannot fully confirm the above warning. It is necessary to view the placement of the %s slices and ensure that these warnings are not being breached\n", MODULE_NAME, MODULE_NAME);
          cci_drc_msg = 1'b1;
        end  
        if (!((MULTSIGNIN_in === 1'bx) || (OPMODE_mux[3:0] != 4'b0101))) begin
          // $display("DRC warning : [Unisim %s-10] CARRYINSEL is set to 010 with OPMODE set to multiplication (xxx0101). This is an illegal mode and may show deviation between simulation results and hardware behavior. %s instance %m at %.3f ns.", MODULE_NAME, MODULE_NAME, $time/1000.0);
        end
        if (!((MULTSIGNIN_in === 1'bx) || (cis_drc_msg == 1'b1) ||
             (OPMODEREG_BIN == 1'b1))) begin
          // $display("DRC warning : [Unisim %s-11] CARRYINSEL is set to 010 with OPMODEREG set to 0. This causes unknown values after reset occurs. It is suggested to use OPMODEREG = 1 when cascading large adders. %s instance %m at %.3f ns.", MODULE_NAME, MODULE_NAME, $time/1000.0);
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
    //  if (((OPMODE_mux[1:0] == 2'b11) && (USE_MULT_BIN == USE_MULT_MULTIPLY)) &&
    //    ((AREG_BIN==2'b00 && BREG_BIN==2'b00 && MREG_BIN==1'b0) ||
    //     (AREG_BIN==2'b00 && BREG_BIN==2'b00 && PREG_BIN==1'b0) ||
    //     (MREG_BIN==1'b0 && PREG_BIN==1'b0)))
    //    $display("OPMODE Input Warning : [Unisim %s-8] The OPMODE[1:0] (%b) is invalid when using attributes USE_MULT = MULTIPLY and (A, B and M) or (A, B and P) or (M and P) are not REGISTERED at time %.3f ns. Please set USE_MULT to either NONE or DYNAMIC or REGISTER one of each group. (A or B) and (M or P) will satisfy the requirement. Instance %m", MODULE_NAME, OPMODE_mux[1:0], $time/1000.0);
    //  if ((OPMODE_mux[3:0] == 4'b0101) &&
    //    ((USE_MULT_BIN == USE_MULT_NONE) || (USE_SIMD_BIN != USE_SIMD_ONE48)))
    //    $display("OPMODE Input Warning : [Unisim %s-9] The OPMODE[3:0] (%b) is invalid when using attributes USE_MULT = NONE, or USE_SIMD = TWO24 or FOUR12 at %.3f ns. Instance %m", MODULE_NAME, OPMODE_mux[3:0], $time/1000.0);
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
// CHECK-NEXT: 10 sort bitvec 5
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
// CHECK-NEXT: 25 sort bitvec 1
// CHECK-NEXT: 26 input 25 CARRYCASCIN 
// CHECK-NEXT: 27 input 25 CARRYIN 
// CHECK-NEXT: 28 input 3 CARRYINREG 
// CHECK-NEXT: 29 sort bitvec 3
// CHECK-NEXT: 30 input 29 CARRYINSEL 
// CHECK-NEXT: 31 input 3 CARRYINSELREG 
// CHECK-NEXT: 32 input 25 CEA1 
// CHECK-NEXT: 33 input 25 CEA2 
// CHECK-NEXT: 34 input 25 CEAD 
// CHECK-NEXT: 35 input 25 CEALUMODE 
// CHECK-NEXT: 36 input 25 CEB1 
// CHECK-NEXT: 37 input 25 CEB2 
// CHECK-NEXT: 38 input 25 CEC 
// CHECK-NEXT: 39 input 25 CECARRYIN 
// CHECK-NEXT: 40 input 25 CECTRL 
// CHECK-NEXT: 41 input 25 CED 
// CHECK-NEXT: 42 input 25 CEINMODE 
// CHECK-NEXT: 43 input 25 CEM 
// CHECK-NEXT: 44 input 25 CEP 
// CHECK-NEXT: 45 input 25 CLK 
// CHECK-NEXT: 46 input 3 CREG 
// CHECK-NEXT: 47 sort bitvec 27
// CHECK-NEXT: 48 input 47 D 
// CHECK-NEXT: 49 input 3 DREG 
// CHECK-NEXT: 50 input 10 INMODE 
// CHECK-NEXT: 51 input 3 INMODEREG 
// CHECK-NEXT: 52 input 7 IS_ALUMODE_INVERTED 
// CHECK-NEXT: 53 input 25 IS_CARRYIN_INVERTED 
// CHECK-NEXT: 54 input 25 IS_CLK_INVERTED 
// CHECK-NEXT: 55 input 10 IS_INMODE_INVERTED 
// CHECK-NEXT: 56 sort bitvec 9
// CHECK-NEXT: 57 input 56 IS_OPMODE_INVERTED 
// CHECK-NEXT: 58 input 25 IS_RSTALLCARRYIN_INVERTED 
// CHECK-NEXT: 59 input 25 IS_RSTALUMODE_INVERTED 
// CHECK-NEXT: 60 input 25 IS_RSTA_INVERTED 
// CHECK-NEXT: 61 input 25 IS_RSTB_INVERTED 
// CHECK-NEXT: 62 input 25 IS_RSTCTRL_INVERTED 
// CHECK-NEXT: 63 input 25 IS_RSTC_INVERTED 
// CHECK-NEXT: 64 input 25 IS_RSTD_INVERTED 
// CHECK-NEXT: 65 input 25 IS_RSTINMODE_INVERTED 
// CHECK-NEXT: 66 input 25 IS_RSTM_INVERTED 
// CHECK-NEXT: 67 input 25 IS_RSTP_INVERTED 
// CHECK-NEXT: 68 input 23 MASK 
// CHECK-NEXT: 69 input 3 MREG 
// CHECK-NEXT: 70 input 25 MULTSIGNIN 
// CHECK-NEXT: 71 input 56 OPMODE 
// CHECK-NEXT: 72 input 3 OPMODEREG 
// CHECK-NEXT: 73 input 23 PATTERN 
// CHECK-NEXT: 74 input 23 PCIN 
// CHECK-NEXT: 75 input 10 PREADDINSEL 
// CHECK-NEXT: 76 input 3 PREG 
// CHECK-NEXT: 77 input 23 RND 
// CHECK-NEXT: 78 input 25 RSTA 
// CHECK-NEXT: 79 input 25 RSTALLCARRYIN 
// CHECK-NEXT: 80 input 25 RSTALUMODE 
// CHECK-NEXT: 81 input 25 RSTB 
// CHECK-NEXT: 82 input 25 RSTC 
// CHECK-NEXT: 83 input 25 RSTCTRL 
// CHECK-NEXT: 84 input 25 RSTD 
// CHECK-NEXT: 85 input 25 RSTINMODE 
// CHECK-NEXT: 86 input 25 RSTM 
// CHECK-NEXT: 87 input 25 RSTP 
// CHECK-NEXT: 88 input 10 SEL_MASK 
// CHECK-NEXT: 89 input 10 SEL_PATTERN 
// CHECK-NEXT: 90 input 10 USE_MULT 
// CHECK-NEXT: 91 input 10 USE_PATTERN_DETECT 
// CHECK-NEXT: 92 input 10 USE_SIMD 
// CHECK-NEXT: 93 input 10 USE_WIDEXOR 
// CHECK-NEXT: 94 input 10 XORSIMD 
// CHECK-NEXT: 95 state 1
// CHECK-NEXT: 96 state 1
// CHECK-NEXT: 97 const 25 1
// CHECK-NEXT: 98 state 25
// CHECK-NEXT: 99 init 25 98 97
// CHECK-NEXT: 100 neq 25 45 97
// CHECK-NEXT: 101 xor 25 45 54
// CHECK-NEXT: 102 and 25 100 101
// CHECK-NEXT: 103 sort bitvec 2
// CHECK-NEXT: 104 concat 103 102 98
// CHECK-NEXT: 105 const 103 10
// CHECK-NEXT: 106 eq 25 104 105
// CHECK-NEXT: 107 ite 1 106 96 95
// CHECK-NEXT: 108 slice 25 2 0 0
// CHECK-NEXT: 109 eq 25 108 97
// CHECK-NEXT: 110 or 25 109 108
// CHECK-NEXT: 111 slice 25 2 1 1
// CHECK-NEXT: 112 eq 25 111 97
// CHECK-NEXT: 113 or 25 112 111
// CHECK-NEXT: 114 slice 25 2 2 2
// CHECK-NEXT: 115 eq 25 114 97
// CHECK-NEXT: 116 or 25 115 114
// CHECK-NEXT: 117 slice 25 2 3 3
// CHECK-NEXT: 118 eq 25 117 97
// CHECK-NEXT: 119 or 25 118 117
// CHECK-NEXT: 120 slice 25 2 4 4
// CHECK-NEXT: 121 eq 25 120 97
// CHECK-NEXT: 122 or 25 121 120
// CHECK-NEXT: 123 slice 25 2 5 5
// CHECK-NEXT: 124 eq 25 123 97
// CHECK-NEXT: 125 or 25 124 123
// CHECK-NEXT: 126 slice 25 2 6 6
// CHECK-NEXT: 127 eq 25 126 97
// CHECK-NEXT: 128 or 25 127 126
// CHECK-NEXT: 129 slice 25 2 7 7
// CHECK-NEXT: 130 eq 25 129 97
// CHECK-NEXT: 131 or 25 130 129
// CHECK-NEXT: 132 slice 25 2 8 8
// CHECK-NEXT: 133 eq 25 132 97
// CHECK-NEXT: 134 or 25 133 132
// CHECK-NEXT: 135 slice 25 2 9 9
// CHECK-NEXT: 136 eq 25 135 97
// CHECK-NEXT: 137 or 25 136 135
// CHECK-NEXT: 138 slice 25 2 10 10
// CHECK-NEXT: 139 eq 25 138 97
// CHECK-NEXT: 140 or 25 139 138
// CHECK-NEXT: 141 slice 25 2 11 11
// CHECK-NEXT: 142 eq 25 141 97
// CHECK-NEXT: 143 or 25 142 141
// CHECK-NEXT: 144 slice 25 2 12 12
// CHECK-NEXT: 145 eq 25 144 97
// CHECK-NEXT: 146 or 25 145 144
// CHECK-NEXT: 147 slice 25 2 13 13
// CHECK-NEXT: 148 eq 25 147 97
// CHECK-NEXT: 149 or 25 148 147
// CHECK-NEXT: 150 slice 25 2 14 14
// CHECK-NEXT: 151 eq 25 150 97
// CHECK-NEXT: 152 or 25 151 150
// CHECK-NEXT: 153 slice 25 2 15 15
// CHECK-NEXT: 154 eq 25 153 97
// CHECK-NEXT: 155 or 25 154 153
// CHECK-NEXT: 156 slice 25 2 16 16
// CHECK-NEXT: 157 eq 25 156 97
// CHECK-NEXT: 158 or 25 157 156
// CHECK-NEXT: 159 slice 25 2 17 17
// CHECK-NEXT: 160 eq 25 159 97
// CHECK-NEXT: 161 or 25 160 159
// CHECK-NEXT: 162 slice 25 2 18 18
// CHECK-NEXT: 163 eq 25 162 97
// CHECK-NEXT: 164 or 25 163 162
// CHECK-NEXT: 165 slice 25 2 19 19
// CHECK-NEXT: 166 eq 25 165 97
// CHECK-NEXT: 167 or 25 166 165
// CHECK-NEXT: 168 slice 25 2 20 20
// CHECK-NEXT: 169 eq 25 168 97
// CHECK-NEXT: 170 or 25 169 168
// CHECK-NEXT: 171 slice 25 2 21 21
// CHECK-NEXT: 172 eq 25 171 97
// CHECK-NEXT: 173 or 25 172 171
// CHECK-NEXT: 174 slice 25 2 22 22
// CHECK-NEXT: 175 eq 25 174 97
// CHECK-NEXT: 176 or 25 175 174
// CHECK-NEXT: 177 slice 25 2 23 23
// CHECK-NEXT: 178 eq 25 177 97
// CHECK-NEXT: 179 or 25 178 177
// CHECK-NEXT: 180 slice 25 2 24 24
// CHECK-NEXT: 181 eq 25 180 97
// CHECK-NEXT: 182 or 25 181 180
// CHECK-NEXT: 183 slice 25 2 25 25
// CHECK-NEXT: 184 eq 25 183 97
// CHECK-NEXT: 185 or 25 184 183
// CHECK-NEXT: 186 slice 25 2 26 26
// CHECK-NEXT: 187 eq 25 186 97
// CHECK-NEXT: 188 or 25 187 186
// CHECK-NEXT: 189 slice 25 2 27 27
// CHECK-NEXT: 190 eq 25 189 97
// CHECK-NEXT: 191 or 25 190 189
// CHECK-NEXT: 192 slice 25 2 28 28
// CHECK-NEXT: 193 eq 25 192 97
// CHECK-NEXT: 194 or 25 193 192
// CHECK-NEXT: 195 slice 25 2 29 29
// CHECK-NEXT: 196 eq 25 195 97
// CHECK-NEXT: 197 or 25 196 195
// CHECK-NEXT: 198 concat 103 113 110
// CHECK-NEXT: 199 concat 29 116 198
// CHECK-NEXT: 200 concat 7 119 199
// CHECK-NEXT: 201 concat 10 122 200
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
// CHECK-NEXT: 242 concat 47 188 241
// CHECK-NEXT: 243 sort bitvec 28
// CHECK-NEXT: 244 concat 243 191 242
// CHECK-NEXT: 245 sort bitvec 29
// CHECK-NEXT: 246 concat 245 194 244
// CHECK-NEXT: 247 concat 1 197 246
// CHECK-NEXT: 248 const 25 0
// CHECK-NEXT: 249 const 7 1111
// CHECK-NEXT: 250 uext 10 249 1
// CHECK-NEXT: 251 eq 25 15 250
// CHECK-NEXT: 252 ite 25 251 97 248
// CHECK-NEXT: 253 const 29 111
// CHECK-NEXT: 254 uext 10 253 2
// CHECK-NEXT: 255 eq 25 15 254
// CHECK-NEXT: 256 ite 25 255 248 252
// CHECK-NEXT: 257 ite 1 256 5 247
// CHECK-NEXT: 258 state 1
// CHECK-NEXT: 259 state 1
// CHECK-NEXT: 260 state 25
// CHECK-NEXT: 261 init 25 260 97
// CHECK-NEXT: 262 concat 103 102 260
// CHECK-NEXT: 263 eq 25 262 105
// CHECK-NEXT: 264 ite 1 263 259 258
// CHECK-NEXT: 265 slice 103 12 1 0
// CHECK-NEXT: 266 redor 25 265
// CHECK-NEXT: 267 ite 1 266 264 257
// CHECK-NEXT: 268 slice 103 4 1 0
// CHECK-NEXT: 269 eq 25 268 265
// CHECK-NEXT: 270 ite 1 269 267 107
// CHECK-NEXT: 271 output 270 ACOUT 
// CHECK-NEXT: 272 state 16
// CHECK-NEXT: 273 state 16
// CHECK-NEXT: 274 state 25
// CHECK-NEXT: 275 init 25 274 97
// CHECK-NEXT: 276 concat 103 102 274
// CHECK-NEXT: 277 eq 25 276 105
// CHECK-NEXT: 278 ite 16 277 273 272
// CHECK-NEXT: 279 slice 25 17 0 0
// CHECK-NEXT: 280 eq 25 279 97
// CHECK-NEXT: 281 or 25 280 279
// CHECK-NEXT: 282 slice 25 17 1 1
// CHECK-NEXT: 283 eq 25 282 97
// CHECK-NEXT: 284 or 25 283 282
// CHECK-NEXT: 285 slice 25 17 2 2
// CHECK-NEXT: 286 eq 25 285 97
// CHECK-NEXT: 287 or 25 286 285
// CHECK-NEXT: 288 slice 25 17 3 3
// CHECK-NEXT: 289 eq 25 288 97
// CHECK-NEXT: 290 or 25 289 288
// CHECK-NEXT: 291 slice 25 17 4 4
// CHECK-NEXT: 292 eq 25 291 97
// CHECK-NEXT: 293 or 25 292 291
// CHECK-NEXT: 294 slice 25 17 5 5
// CHECK-NEXT: 295 eq 25 294 97
// CHECK-NEXT: 296 or 25 295 294
// CHECK-NEXT: 297 slice 25 17 6 6
// CHECK-NEXT: 298 eq 25 297 97
// CHECK-NEXT: 299 or 25 298 297
// CHECK-NEXT: 300 slice 25 17 7 7
// CHECK-NEXT: 301 eq 25 300 97
// CHECK-NEXT: 302 or 25 301 300
// CHECK-NEXT: 303 slice 25 17 8 8
// CHECK-NEXT: 304 eq 25 303 97
// CHECK-NEXT: 305 or 25 304 303
// CHECK-NEXT: 306 slice 25 17 9 9
// CHECK-NEXT: 307 eq 25 306 97
// CHECK-NEXT: 308 or 25 307 306
// CHECK-NEXT: 309 slice 25 17 10 10
// CHECK-NEXT: 310 eq 25 309 97
// CHECK-NEXT: 311 or 25 310 309
// CHECK-NEXT: 312 slice 25 17 11 11
// CHECK-NEXT: 313 eq 25 312 97
// CHECK-NEXT: 314 or 25 313 312
// CHECK-NEXT: 315 slice 25 17 12 12
// CHECK-NEXT: 316 eq 25 315 97
// CHECK-NEXT: 317 or 25 316 315
// CHECK-NEXT: 318 slice 25 17 13 13
// CHECK-NEXT: 319 eq 25 318 97
// CHECK-NEXT: 320 or 25 319 318
// CHECK-NEXT: 321 slice 25 17 14 14
// CHECK-NEXT: 322 eq 25 321 97
// CHECK-NEXT: 323 or 25 322 321
// CHECK-NEXT: 324 slice 25 17 15 15
// CHECK-NEXT: 325 eq 25 324 97
// CHECK-NEXT: 326 or 25 325 324
// CHECK-NEXT: 327 slice 25 17 16 16
// CHECK-NEXT: 328 eq 25 327 97
// CHECK-NEXT: 329 or 25 328 327
// CHECK-NEXT: 330 slice 25 17 17 17
// CHECK-NEXT: 331 eq 25 330 97
// CHECK-NEXT: 332 or 25 331 330
// CHECK-NEXT: 333 concat 103 284 281
// CHECK-NEXT: 334 concat 29 287 333
// CHECK-NEXT: 335 concat 7 290 334
// CHECK-NEXT: 336 concat 10 293 335
// CHECK-NEXT: 337 concat 202 296 336
// CHECK-NEXT: 338 concat 204 299 337
// CHECK-NEXT: 339 concat 206 302 338
// CHECK-NEXT: 340 concat 56 305 339
// CHECK-NEXT: 341 concat 209 308 340
// CHECK-NEXT: 342 concat 211 311 341
// CHECK-NEXT: 343 concat 213 314 342
// CHECK-NEXT: 344 concat 215 317 343
// CHECK-NEXT: 345 concat 217 320 344
// CHECK-NEXT: 346 concat 219 323 345
// CHECK-NEXT: 347 concat 221 326 346
// CHECK-NEXT: 348 concat 223 329 347
// CHECK-NEXT: 349 concat 16 332 348
// CHECK-NEXT: 350 uext 10 249 1
// CHECK-NEXT: 351 eq 25 22 350
// CHECK-NEXT: 352 ite 25 351 97 248
// CHECK-NEXT: 353 uext 10 253 2
// CHECK-NEXT: 354 eq 25 22 353
// CHECK-NEXT: 355 ite 25 354 248 352
// CHECK-NEXT: 356 ite 16 355 19 349
// CHECK-NEXT: 357 state 16
// CHECK-NEXT: 358 state 16
// CHECK-NEXT: 359 state 25
// CHECK-NEXT: 360 init 25 359 97
// CHECK-NEXT: 361 concat 103 102 359
// CHECK-NEXT: 362 eq 25 361 105
// CHECK-NEXT: 363 ite 16 362 358 357
// CHECK-NEXT: 364 slice 103 21 1 0
// CHECK-NEXT: 365 redor 25 364
// CHECK-NEXT: 366 ite 16 365 363 356
// CHECK-NEXT: 367 slice 103 18 1 0
// CHECK-NEXT: 368 eq 25 367 364
// CHECK-NEXT: 369 ite 16 368 366 278
// CHECK-NEXT: 370 output 369 BCOUT 
// CHECK-NEXT: 371 slice 25 8 0 0
// CHECK-NEXT: 372 neq 25 371 97
// CHECK-NEXT: 373 slice 25 52 0 0
// CHECK-NEXT: 374 xor 25 371 373
// CHECK-NEXT: 375 and 25 372 374
// CHECK-NEXT: 376 slice 25 8 1 1
// CHECK-NEXT: 377 neq 25 376 97
// CHECK-NEXT: 378 slice 25 52 1 1
// CHECK-NEXT: 379 xor 25 376 378
// CHECK-NEXT: 380 and 25 377 379
// CHECK-NEXT: 381 slice 25 8 2 2
// CHECK-NEXT: 382 neq 25 381 97
// CHECK-NEXT: 383 slice 25 52 2 2
// CHECK-NEXT: 384 xor 25 381 383
// CHECK-NEXT: 385 and 25 382 384
// CHECK-NEXT: 386 slice 25 8 3 3
// CHECK-NEXT: 387 neq 25 386 97
// CHECK-NEXT: 388 slice 25 52 3 3
// CHECK-NEXT: 389 xor 25 386 388
// CHECK-NEXT: 390 and 25 387 389
// CHECK-NEXT: 391 concat 103 380 375
// CHECK-NEXT: 392 concat 29 385 391
// CHECK-NEXT: 393 concat 7 390 392
// CHECK-NEXT: 394 state 7
// CHECK-NEXT: 395 state 7
// CHECK-NEXT: 396 state 25
// CHECK-NEXT: 397 init 25 396 97
// CHECK-NEXT: 398 concat 103 102 396
// CHECK-NEXT: 399 eq 25 398 105
// CHECK-NEXT: 400 ite 7 399 395 394
// CHECK-NEXT: 401 slice 25 9 0 0
// CHECK-NEXT: 402 ite 7 401 400 393
// CHECK-NEXT: 403 slice 25 402 0 0
// CHECK-NEXT: 404 slice 25 402 1 1
// CHECK-NEXT: 405 and 25 403 404
// CHECK-NEXT: 406 const 103 00
// CHECK-NEXT: 407 const 10 11001
// CHECK-NEXT: 408 eq 25 92 407
// CHECK-NEXT: 409 ite 103 408 105 406
// CHECK-NEXT: 410 const 103 01
// CHECK-NEXT: 411 const 10 10011
// CHECK-NEXT: 412 eq 25 92 411
// CHECK-NEXT: 413 ite 103 412 410 409
// CHECK-NEXT: 414 const 7 1100
// CHECK-NEXT: 415 uext 10 414 1
// CHECK-NEXT: 416 eq 25 92 415
// CHECK-NEXT: 417 ite 103 416 406 413
// CHECK-NEXT: 418 uext 103 97 1
// CHECK-NEXT: 419 neq 25 417 418
// CHECK-NEXT: 420 slice 25 402 0 0
// CHECK-NEXT: 421 slice 25 402 0 0
// CHECK-NEXT: 422 concat 103 421 420
// CHECK-NEXT: 423 slice 25 402 0 0
// CHECK-NEXT: 424 concat 29 423 422
// CHECK-NEXT: 425 slice 25 402 0 0
// CHECK-NEXT: 426 concat 7 425 424
// CHECK-NEXT: 427 slice 25 402 0 0
// CHECK-NEXT: 428 concat 10 427 426
// CHECK-NEXT: 429 slice 25 402 0 0
// CHECK-NEXT: 430 concat 202 429 428
// CHECK-NEXT: 431 slice 25 402 0 0
// CHECK-NEXT: 432 concat 204 431 430
// CHECK-NEXT: 433 slice 25 402 0 0
// CHECK-NEXT: 434 concat 206 433 432
// CHECK-NEXT: 435 slice 25 402 0 0
// CHECK-NEXT: 436 concat 56 435 434
// CHECK-NEXT: 437 slice 25 402 0 0
// CHECK-NEXT: 438 concat 209 437 436
// CHECK-NEXT: 439 slice 25 402 0 0
// CHECK-NEXT: 440 concat 211 439 438
// CHECK-NEXT: 441 slice 25 402 0 0
// CHECK-NEXT: 442 concat 213 441 440
// CHECK-NEXT: 443 slice 25 402 0 0
// CHECK-NEXT: 444 concat 215 443 442
// CHECK-NEXT: 445 slice 25 402 0 0
// CHECK-NEXT: 446 concat 217 445 444
// CHECK-NEXT: 447 slice 25 402 0 0
// CHECK-NEXT: 448 concat 219 447 446
// CHECK-NEXT: 449 slice 25 402 0 0
// CHECK-NEXT: 450 concat 221 449 448
// CHECK-NEXT: 451 slice 25 402 0 0
// CHECK-NEXT: 452 concat 223 451 450
// CHECK-NEXT: 453 slice 25 402 0 0
// CHECK-NEXT: 454 concat 16 453 452
// CHECK-NEXT: 455 slice 25 402 0 0
// CHECK-NEXT: 456 concat 226 455 454
// CHECK-NEXT: 457 slice 25 402 0 0
// CHECK-NEXT: 458 concat 228 457 456
// CHECK-NEXT: 459 slice 25 402 0 0
// CHECK-NEXT: 460 concat 230 459 458
// CHECK-NEXT: 461 slice 25 402 0 0
// CHECK-NEXT: 462 concat 232 461 460
// CHECK-NEXT: 463 slice 25 402 0 0
// CHECK-NEXT: 464 concat 234 463 462
// CHECK-NEXT: 465 slice 25 402 0 0
// CHECK-NEXT: 466 concat 236 465 464
// CHECK-NEXT: 467 slice 25 402 0 0
// CHECK-NEXT: 468 concat 238 467 466
// CHECK-NEXT: 469 slice 25 402 0 0
// CHECK-NEXT: 470 concat 240 469 468
// CHECK-NEXT: 471 slice 25 402 0 0
// CHECK-NEXT: 472 concat 47 471 470
// CHECK-NEXT: 473 slice 25 402 0 0
// CHECK-NEXT: 474 concat 243 473 472
// CHECK-NEXT: 475 slice 25 402 0 0
// CHECK-NEXT: 476 concat 245 475 474
// CHECK-NEXT: 477 slice 25 402 0 0
// CHECK-NEXT: 478 concat 1 477 476
// CHECK-NEXT: 479 slice 25 402 0 0
// CHECK-NEXT: 480 sort bitvec 31
// CHECK-NEXT: 481 concat 480 479 478
// CHECK-NEXT: 482 slice 25 402 0 0
// CHECK-NEXT: 483 concat 3 482 481
// CHECK-NEXT: 484 slice 25 402 0 0
// CHECK-NEXT: 485 sort bitvec 33
// CHECK-NEXT: 486 concat 485 484 483
// CHECK-NEXT: 487 slice 25 402 0 0
// CHECK-NEXT: 488 sort bitvec 34
// CHECK-NEXT: 489 concat 488 487 486
// CHECK-NEXT: 490 slice 25 402 0 0
// CHECK-NEXT: 491 sort bitvec 35
// CHECK-NEXT: 492 concat 491 490 489
// CHECK-NEXT: 493 slice 25 402 0 0
// CHECK-NEXT: 494 sort bitvec 36
// CHECK-NEXT: 495 concat 494 493 492
// CHECK-NEXT: 496 slice 25 402 0 0
// CHECK-NEXT: 497 sort bitvec 37
// CHECK-NEXT: 498 concat 497 496 495
// CHECK-NEXT: 499 slice 25 402 0 0
// CHECK-NEXT: 500 sort bitvec 38
// CHECK-NEXT: 501 concat 500 499 498
// CHECK-NEXT: 502 slice 25 402 0 0
// CHECK-NEXT: 503 sort bitvec 39
// CHECK-NEXT: 504 concat 503 502 501
// CHECK-NEXT: 505 slice 25 402 0 0
// CHECK-NEXT: 506 sort bitvec 40
// CHECK-NEXT: 507 concat 506 505 504
// CHECK-NEXT: 508 slice 25 402 0 0
// CHECK-NEXT: 509 sort bitvec 41
// CHECK-NEXT: 510 concat 509 508 507
// CHECK-NEXT: 511 slice 25 402 0 0
// CHECK-NEXT: 512 sort bitvec 42
// CHECK-NEXT: 513 concat 512 511 510
// CHECK-NEXT: 514 slice 25 402 0 0
// CHECK-NEXT: 515 sort bitvec 43
// CHECK-NEXT: 516 concat 515 514 513
// CHECK-NEXT: 517 slice 25 402 0 0
// CHECK-NEXT: 518 sort bitvec 44
// CHECK-NEXT: 519 concat 518 517 516
// CHECK-NEXT: 520 slice 25 402 0 0
// CHECK-NEXT: 521 sort bitvec 45
// CHECK-NEXT: 522 concat 521 520 519
// CHECK-NEXT: 523 slice 25 402 0 0
// CHECK-NEXT: 524 sort bitvec 46
// CHECK-NEXT: 525 concat 524 523 522
// CHECK-NEXT: 526 slice 25 402 0 0
// CHECK-NEXT: 527 sort bitvec 47
// CHECK-NEXT: 528 concat 527 526 525
// CHECK-NEXT: 529 slice 25 402 0 0
// CHECK-NEXT: 530 concat 23 529 528
// CHECK-NEXT: 531 input 23
// CHECK-NEXT: 532 state 23
// CHECK-NEXT: 533 state 23
// CHECK-NEXT: 534 state 25
// CHECK-NEXT: 535 init 25 534 97
// CHECK-NEXT: 536 concat 103 102 534
// CHECK-NEXT: 537 eq 25 536 105
// CHECK-NEXT: 538 ite 23 537 533 532
// CHECK-NEXT: 539 slice 480 538 47 17
// CHECK-NEXT: 540 slice 25 538 47 47
// CHECK-NEXT: 541 concat 3 540 539
// CHECK-NEXT: 542 slice 25 538 47 47
// CHECK-NEXT: 543 concat 485 542 541
// CHECK-NEXT: 544 slice 25 538 47 47
// CHECK-NEXT: 545 concat 488 544 543
// CHECK-NEXT: 546 slice 25 538 47 47
// CHECK-NEXT: 547 concat 491 546 545
// CHECK-NEXT: 548 slice 25 538 47 47
// CHECK-NEXT: 549 concat 494 548 547
// CHECK-NEXT: 550 slice 25 538 47 47
// CHECK-NEXT: 551 concat 497 550 549
// CHECK-NEXT: 552 slice 25 538 47 47
// CHECK-NEXT: 553 concat 500 552 551
// CHECK-NEXT: 554 slice 25 538 47 47
// CHECK-NEXT: 555 concat 503 554 553
// CHECK-NEXT: 556 slice 25 538 47 47
// CHECK-NEXT: 557 concat 506 556 555
// CHECK-NEXT: 558 slice 25 538 47 47
// CHECK-NEXT: 559 concat 509 558 557
// CHECK-NEXT: 560 slice 25 538 47 47
// CHECK-NEXT: 561 concat 512 560 559
// CHECK-NEXT: 562 slice 25 538 47 47
// CHECK-NEXT: 563 concat 515 562 561
// CHECK-NEXT: 564 slice 25 538 47 47
// CHECK-NEXT: 565 concat 518 564 563
// CHECK-NEXT: 566 slice 25 538 47 47
// CHECK-NEXT: 567 concat 521 566 565
// CHECK-NEXT: 568 slice 25 538 47 47
// CHECK-NEXT: 569 concat 524 568 567
// CHECK-NEXT: 570 slice 25 538 47 47
// CHECK-NEXT: 571 concat 527 570 569
// CHECK-NEXT: 572 slice 25 538 47 47
// CHECK-NEXT: 573 concat 23 572 571
// CHECK-NEXT: 574 slice 25 71 0 0
// CHECK-NEXT: 575 neq 25 574 97
// CHECK-NEXT: 576 slice 25 57 0 0
// CHECK-NEXT: 577 xor 25 574 576
// CHECK-NEXT: 578 and 25 575 577
// CHECK-NEXT: 579 slice 25 71 1 1
// CHECK-NEXT: 580 neq 25 579 97
// CHECK-NEXT: 581 slice 25 57 1 1
// CHECK-NEXT: 582 xor 25 579 581
// CHECK-NEXT: 583 and 25 580 582
// CHECK-NEXT: 584 slice 25 71 2 2
// CHECK-NEXT: 585 neq 25 584 97
// CHECK-NEXT: 586 slice 25 57 2 2
// CHECK-NEXT: 587 xor 25 584 586
// CHECK-NEXT: 588 and 25 585 587
// CHECK-NEXT: 589 slice 25 71 3 3
// CHECK-NEXT: 590 neq 25 589 97
// CHECK-NEXT: 591 slice 25 57 3 3
// CHECK-NEXT: 592 xor 25 589 591
// CHECK-NEXT: 593 and 25 590 592
// CHECK-NEXT: 594 slice 25 71 4 4
// CHECK-NEXT: 595 neq 25 594 97
// CHECK-NEXT: 596 slice 25 57 4 4
// CHECK-NEXT: 597 xor 25 594 596
// CHECK-NEXT: 598 and 25 595 597
// CHECK-NEXT: 599 slice 25 71 5 5
// CHECK-NEXT: 600 neq 25 599 97
// CHECK-NEXT: 601 slice 25 57 5 5
// CHECK-NEXT: 602 xor 25 599 601
// CHECK-NEXT: 603 and 25 600 602
// CHECK-NEXT: 604 slice 25 71 6 6
// CHECK-NEXT: 605 neq 25 604 97
// CHECK-NEXT: 606 slice 25 57 6 6
// CHECK-NEXT: 607 xor 25 604 606
// CHECK-NEXT: 608 and 25 605 607
// CHECK-NEXT: 609 slice 25 71 7 7
// CHECK-NEXT: 610 neq 25 609 97
// CHECK-NEXT: 611 slice 25 57 7 7
// CHECK-NEXT: 612 xor 25 609 611
// CHECK-NEXT: 613 and 25 610 612
// CHECK-NEXT: 614 slice 25 71 8 8
// CHECK-NEXT: 615 neq 25 614 97
// CHECK-NEXT: 616 slice 25 57 8 8
// CHECK-NEXT: 617 xor 25 614 616
// CHECK-NEXT: 618 and 25 615 617
// CHECK-NEXT: 619 concat 103 583 578
// CHECK-NEXT: 620 concat 29 588 619
// CHECK-NEXT: 621 concat 7 593 620
// CHECK-NEXT: 622 concat 10 598 621
// CHECK-NEXT: 623 concat 202 603 622
// CHECK-NEXT: 624 concat 204 608 623
// CHECK-NEXT: 625 concat 206 613 624
// CHECK-NEXT: 626 concat 56 618 625
// CHECK-NEXT: 627 state 56
// CHECK-NEXT: 628 state 56
// CHECK-NEXT: 629 state 25
// CHECK-NEXT: 630 init 25 629 97
// CHECK-NEXT: 631 concat 103 102 629
// CHECK-NEXT: 632 eq 25 631 105
// CHECK-NEXT: 633 ite 56 632 628 627
// CHECK-NEXT: 634 slice 25 72 0 0
// CHECK-NEXT: 635 ite 56 634 633 626
// CHECK-NEXT: 636 slice 103 635 6 5
// CHECK-NEXT: 637 const 103 11
// CHECK-NEXT: 638 eq 25 636 637
// CHECK-NEXT: 639 ite 23 638 573 531
// CHECK-NEXT: 640 slice 480 74 47 17
// CHECK-NEXT: 641 slice 25 74 47 47
// CHECK-NEXT: 642 concat 3 641 640
// CHECK-NEXT: 643 slice 25 74 47 47
// CHECK-NEXT: 644 concat 485 643 642
// CHECK-NEXT: 645 slice 25 74 47 47
// CHECK-NEXT: 646 concat 488 645 644
// CHECK-NEXT: 647 slice 25 74 47 47
// CHECK-NEXT: 648 concat 491 647 646
// CHECK-NEXT: 649 slice 25 74 47 47
// CHECK-NEXT: 650 concat 494 649 648
// CHECK-NEXT: 651 slice 25 74 47 47
// CHECK-NEXT: 652 concat 497 651 650
// CHECK-NEXT: 653 slice 25 74 47 47
// CHECK-NEXT: 654 concat 500 653 652
// CHECK-NEXT: 655 slice 25 74 47 47
// CHECK-NEXT: 656 concat 503 655 654
// CHECK-NEXT: 657 slice 25 74 47 47
// CHECK-NEXT: 658 concat 506 657 656
// CHECK-NEXT: 659 slice 25 74 47 47
// CHECK-NEXT: 660 concat 509 659 658
// CHECK-NEXT: 661 slice 25 74 47 47
// CHECK-NEXT: 662 concat 512 661 660
// CHECK-NEXT: 663 slice 25 74 47 47
// CHECK-NEXT: 664 concat 515 663 662
// CHECK-NEXT: 665 slice 25 74 47 47
// CHECK-NEXT: 666 concat 518 665 664
// CHECK-NEXT: 667 slice 25 74 47 47
// CHECK-NEXT: 668 concat 521 667 666
// CHECK-NEXT: 669 slice 25 74 47 47
// CHECK-NEXT: 670 concat 524 669 668
// CHECK-NEXT: 671 slice 25 74 47 47
// CHECK-NEXT: 672 concat 527 671 670
// CHECK-NEXT: 673 slice 25 74 47 47
// CHECK-NEXT: 674 concat 23 673 672
// CHECK-NEXT: 675 slice 29 635 6 4
// CHECK-NEXT: 676 const 29 101
// CHECK-NEXT: 677 eq 25 675 676
// CHECK-NEXT: 678 ite 23 677 674 639
// CHECK-NEXT: 679 const 29 100
// CHECK-NEXT: 680 eq 25 675 679
// CHECK-NEXT: 681 uext 29 105 1
// CHECK-NEXT: 682 eq 25 675 681
// CHECK-NEXT: 683 concat 103 682 680
// CHECK-NEXT: 684 redor 25 683
// CHECK-NEXT: 685 ite 23 684 538 678
// CHECK-NEXT: 686 slice 25 24 0 0
// CHECK-NEXT: 687 eq 25 686 97
// CHECK-NEXT: 688 or 25 687 686
// CHECK-NEXT: 689 slice 25 24 1 1
// CHECK-NEXT: 690 eq 25 689 97
// CHECK-NEXT: 691 or 25 690 689
// CHECK-NEXT: 692 slice 25 24 2 2
// CHECK-NEXT: 693 eq 25 692 97
// CHECK-NEXT: 694 or 25 693 692
// CHECK-NEXT: 695 slice 25 24 3 3
// CHECK-NEXT: 696 eq 25 695 97
// CHECK-NEXT: 697 or 25 696 695
// CHECK-NEXT: 698 slice 25 24 4 4
// CHECK-NEXT: 699 eq 25 698 97
// CHECK-NEXT: 700 or 25 699 698
// CHECK-NEXT: 701 slice 25 24 5 5
// CHECK-NEXT: 702 eq 25 701 97
// CHECK-NEXT: 703 or 25 702 701
// CHECK-NEXT: 704 slice 25 24 6 6
// CHECK-NEXT: 705 eq 25 704 97
// CHECK-NEXT: 706 or 25 705 704
// CHECK-NEXT: 707 slice 25 24 7 7
// CHECK-NEXT: 708 eq 25 707 97
// CHECK-NEXT: 709 or 25 708 707
// CHECK-NEXT: 710 slice 25 24 8 8
// CHECK-NEXT: 711 eq 25 710 97
// CHECK-NEXT: 712 or 25 711 710
// CHECK-NEXT: 713 slice 25 24 9 9
// CHECK-NEXT: 714 eq 25 713 97
// CHECK-NEXT: 715 or 25 714 713
// CHECK-NEXT: 716 slice 25 24 10 10
// CHECK-NEXT: 717 eq 25 716 97
// CHECK-NEXT: 718 or 25 717 716
// CHECK-NEXT: 719 slice 25 24 11 11
// CHECK-NEXT: 720 eq 25 719 97
// CHECK-NEXT: 721 or 25 720 719
// CHECK-NEXT: 722 slice 25 24 12 12
// CHECK-NEXT: 723 eq 25 722 97
// CHECK-NEXT: 724 or 25 723 722
// CHECK-NEXT: 725 slice 25 24 13 13
// CHECK-NEXT: 726 eq 25 725 97
// CHECK-NEXT: 727 or 25 726 725
// CHECK-NEXT: 728 slice 25 24 14 14
// CHECK-NEXT: 729 eq 25 728 97
// CHECK-NEXT: 730 or 25 729 728
// CHECK-NEXT: 731 slice 25 24 15 15
// CHECK-NEXT: 732 eq 25 731 97
// CHECK-NEXT: 733 or 25 732 731
// CHECK-NEXT: 734 slice 25 24 16 16
// CHECK-NEXT: 735 eq 25 734 97
// CHECK-NEXT: 736 or 25 735 734
// CHECK-NEXT: 737 slice 25 24 17 17
// CHECK-NEXT: 738 eq 25 737 97
// CHECK-NEXT: 739 or 25 738 737
// CHECK-NEXT: 740 slice 25 24 18 18
// CHECK-NEXT: 741 eq 25 740 97
// CHECK-NEXT: 742 or 25 741 740
// CHECK-NEXT: 743 slice 25 24 19 19
// CHECK-NEXT: 744 eq 25 743 97
// CHECK-NEXT: 745 or 25 744 743
// CHECK-NEXT: 746 slice 25 24 20 20
// CHECK-NEXT: 747 eq 25 746 97
// CHECK-NEXT: 748 or 25 747 746
// CHECK-NEXT: 749 slice 25 24 21 21
// CHECK-NEXT: 750 eq 25 749 97
// CHECK-NEXT: 751 or 25 750 749
// CHECK-NEXT: 752 slice 25 24 22 22
// CHECK-NEXT: 753 eq 25 752 97
// CHECK-NEXT: 754 or 25 753 752
// CHECK-NEXT: 755 slice 25 24 23 23
// CHECK-NEXT: 756 eq 25 755 97
// CHECK-NEXT: 757 or 25 756 755
// CHECK-NEXT: 758 slice 25 24 24 24
// CHECK-NEXT: 759 eq 25 758 97
// CHECK-NEXT: 760 or 25 759 758
// CHECK-NEXT: 761 slice 25 24 25 25
// CHECK-NEXT: 762 eq 25 761 97
// CHECK-NEXT: 763 or 25 762 761
// CHECK-NEXT: 764 slice 25 24 26 26
// CHECK-NEXT: 765 eq 25 764 97
// CHECK-NEXT: 766 or 25 765 764
// CHECK-NEXT: 767 slice 25 24 27 27
// CHECK-NEXT: 768 eq 25 767 97
// CHECK-NEXT: 769 or 25 768 767
// CHECK-NEXT: 770 slice 25 24 28 28
// CHECK-NEXT: 771 eq 25 770 97
// CHECK-NEXT: 772 or 25 771 770
// CHECK-NEXT: 773 slice 25 24 29 29
// CHECK-NEXT: 774 eq 25 773 97
// CHECK-NEXT: 775 or 25 774 773
// CHECK-NEXT: 776 slice 25 24 30 30
// CHECK-NEXT: 777 eq 25 776 97
// CHECK-NEXT: 778 or 25 777 776
// CHECK-NEXT: 779 slice 25 24 31 31
// CHECK-NEXT: 780 eq 25 779 97
// CHECK-NEXT: 781 or 25 780 779
// CHECK-NEXT: 782 slice 25 24 32 32
// CHECK-NEXT: 783 eq 25 782 97
// CHECK-NEXT: 784 or 25 783 782
// CHECK-NEXT: 785 slice 25 24 33 33
// CHECK-NEXT: 786 eq 25 785 97
// CHECK-NEXT: 787 or 25 786 785
// CHECK-NEXT: 788 slice 25 24 34 34
// CHECK-NEXT: 789 eq 25 788 97
// CHECK-NEXT: 790 or 25 789 788
// CHECK-NEXT: 791 slice 25 24 35 35
// CHECK-NEXT: 792 eq 25 791 97
// CHECK-NEXT: 793 or 25 792 791
// CHECK-NEXT: 794 slice 25 24 36 36
// CHECK-NEXT: 795 eq 25 794 97
// CHECK-NEXT: 796 or 25 795 794
// CHECK-NEXT: 797 slice 25 24 37 37
// CHECK-NEXT: 798 eq 25 797 97
// CHECK-NEXT: 799 or 25 798 797
// CHECK-NEXT: 800 slice 25 24 38 38
// CHECK-NEXT: 801 eq 25 800 97
// CHECK-NEXT: 802 or 25 801 800
// CHECK-NEXT: 803 slice 25 24 39 39
// CHECK-NEXT: 804 eq 25 803 97
// CHECK-NEXT: 805 or 25 804 803
// CHECK-NEXT: 806 slice 25 24 40 40
// CHECK-NEXT: 807 eq 25 806 97
// CHECK-NEXT: 808 or 25 807 806
// CHECK-NEXT: 809 slice 25 24 41 41
// CHECK-NEXT: 810 eq 25 809 97
// CHECK-NEXT: 811 or 25 810 809
// CHECK-NEXT: 812 slice 25 24 42 42
// CHECK-NEXT: 813 eq 25 812 97
// CHECK-NEXT: 814 or 25 813 812
// CHECK-NEXT: 815 slice 25 24 43 43
// CHECK-NEXT: 816 eq 25 815 97
// CHECK-NEXT: 817 or 25 816 815
// CHECK-NEXT: 818 slice 25 24 44 44
// CHECK-NEXT: 819 eq 25 818 97
// CHECK-NEXT: 820 or 25 819 818
// CHECK-NEXT: 821 slice 25 24 45 45
// CHECK-NEXT: 822 eq 25 821 97
// CHECK-NEXT: 823 or 25 822 821
// CHECK-NEXT: 824 slice 25 24 46 46
// CHECK-NEXT: 825 eq 25 824 97
// CHECK-NEXT: 826 or 25 825 824
// CHECK-NEXT: 827 slice 25 24 47 47
// CHECK-NEXT: 828 eq 25 827 97
// CHECK-NEXT: 829 or 25 828 827
// CHECK-NEXT: 830 concat 103 691 688
// CHECK-NEXT: 831 concat 29 694 830
// CHECK-NEXT: 832 concat 7 697 831
// CHECK-NEXT: 833 concat 10 700 832
// CHECK-NEXT: 834 concat 202 703 833
// CHECK-NEXT: 835 concat 204 706 834
// CHECK-NEXT: 836 concat 206 709 835
// CHECK-NEXT: 837 concat 56 712 836
// CHECK-NEXT: 838 concat 209 715 837
// CHECK-NEXT: 839 concat 211 718 838
// CHECK-NEXT: 840 concat 213 721 839
// CHECK-NEXT: 841 concat 215 724 840
// CHECK-NEXT: 842 concat 217 727 841
// CHECK-NEXT: 843 concat 219 730 842
// CHECK-NEXT: 844 concat 221 733 843
// CHECK-NEXT: 845 concat 223 736 844
// CHECK-NEXT: 846 concat 16 739 845
// CHECK-NEXT: 847 concat 226 742 846
// CHECK-NEXT: 848 concat 228 745 847
// CHECK-NEXT: 849 concat 230 748 848
// CHECK-NEXT: 850 concat 232 751 849
// CHECK-NEXT: 851 concat 234 754 850
// CHECK-NEXT: 852 concat 236 757 851
// CHECK-NEXT: 853 concat 238 760 852
// CHECK-NEXT: 854 concat 240 763 853
// CHECK-NEXT: 855 concat 47 766 854
// CHECK-NEXT: 856 concat 243 769 855
// CHECK-NEXT: 857 concat 245 772 856
// CHECK-NEXT: 858 concat 1 775 857
// CHECK-NEXT: 859 concat 480 778 858
// CHECK-NEXT: 860 concat 3 781 859
// CHECK-NEXT: 861 concat 485 784 860
// CHECK-NEXT: 862 concat 488 787 861
// CHECK-NEXT: 863 concat 491 790 862
// CHECK-NEXT: 864 concat 494 793 863
// CHECK-NEXT: 865 concat 497 796 864
// CHECK-NEXT: 866 concat 500 799 865
// CHECK-NEXT: 867 concat 503 802 866
// CHECK-NEXT: 868 concat 506 805 867
// CHECK-NEXT: 869 concat 509 808 868
// CHECK-NEXT: 870 concat 512 811 869
// CHECK-NEXT: 871 concat 515 814 870
// CHECK-NEXT: 872 concat 518 817 871
// CHECK-NEXT: 873 concat 521 820 872
// CHECK-NEXT: 874 concat 524 823 873
// CHECK-NEXT: 875 concat 527 826 874
// CHECK-NEXT: 876 concat 23 829 875
// CHECK-NEXT: 877 state 23
// CHECK-NEXT: 878 state 23
// CHECK-NEXT: 879 state 25
// CHECK-NEXT: 880 init 25 879 97
// CHECK-NEXT: 881 concat 103 102 879
// CHECK-NEXT: 882 eq 25 881 105
// CHECK-NEXT: 883 ite 23 882 878 877
// CHECK-NEXT: 884 slice 25 46 0 0
// CHECK-NEXT: 885 ite 23 884 883 876
// CHECK-NEXT: 886 uext 29 637 1
// CHECK-NEXT: 887 eq 25 675 886
// CHECK-NEXT: 888 ite 23 887 885 685
// CHECK-NEXT: 889 uext 29 97 2
// CHECK-NEXT: 890 eq 25 675 889
// CHECK-NEXT: 891 ite 23 890 74 888
// CHECK-NEXT: 892 const 23 000000000000000000000000000000000000000000000000
// CHECK-NEXT: 893 redor 25 675
// CHECK-NEXT: 894 not 25 893
// CHECK-NEXT: 895 ite 23 894 892 891
// CHECK-NEXT: 896 xor 23 530 895
// CHECK-NEXT: 897 input 23
// CHECK-NEXT: 898 concat 23 267 366
// CHECK-NEXT: 899 slice 103 635 1 0
// CHECK-NEXT: 900 eq 25 899 637
// CHECK-NEXT: 901 ite 23 900 898 897
// CHECK-NEXT: 902 eq 25 899 105
// CHECK-NEXT: 903 ite 23 902 538 901
// CHECK-NEXT: 904 const 521 100000000000000000000000000000000000000000000
// CHECK-NEXT: 905 slice 47 267 26 0
// CHECK-NEXT: 906 slice 47 107 26 0
// CHECK-NEXT: 907 slice 25 50 0 0
// CHECK-NEXT: 908 neq 25 907 97
// CHECK-NEXT: 909 slice 25 55 0 0
// CHECK-NEXT: 910 xor 25 907 909
// CHECK-NEXT: 911 and 25 908 910
// CHECK-NEXT: 912 slice 25 50 1 1
// CHECK-NEXT: 913 neq 25 912 97
// CHECK-NEXT: 914 slice 25 55 1 1
// CHECK-NEXT: 915 xor 25 912 914
// CHECK-NEXT: 916 and 25 913 915
// CHECK-NEXT: 917 slice 25 50 2 2
// CHECK-NEXT: 918 neq 25 917 97
// CHECK-NEXT: 919 slice 25 55 2 2
// CHECK-NEXT: 920 xor 25 917 919
// CHECK-NEXT: 921 and 25 918 920
// CHECK-NEXT: 922 slice 25 50 3 3
// CHECK-NEXT: 923 neq 25 922 97
// CHECK-NEXT: 924 slice 25 55 3 3
// CHECK-NEXT: 925 xor 25 922 924
// CHECK-NEXT: 926 and 25 923 925
// CHECK-NEXT: 927 slice 25 50 4 4
// CHECK-NEXT: 928 neq 25 927 97
// CHECK-NEXT: 929 slice 25 55 4 4
// CHECK-NEXT: 930 xor 25 927 929
// CHECK-NEXT: 931 and 25 928 930
// CHECK-NEXT: 932 concat 103 916 911
// CHECK-NEXT: 933 concat 29 921 932
// CHECK-NEXT: 934 concat 7 926 933
// CHECK-NEXT: 935 concat 10 931 934
// CHECK-NEXT: 936 state 10
// CHECK-NEXT: 937 state 10
// CHECK-NEXT: 938 state 25
// CHECK-NEXT: 939 init 25 938 97
// CHECK-NEXT: 940 concat 103 102 938
// CHECK-NEXT: 941 eq 25 940 105
// CHECK-NEXT: 942 ite 10 941 937 936
// CHECK-NEXT: 943 slice 25 51 0 0
// CHECK-NEXT: 944 ite 10 943 942 935
// CHECK-NEXT: 945 slice 25 944 0 0
// CHECK-NEXT: 946 ite 47 945 906 905
// CHECK-NEXT: 947 const 47 000000000000000000000000000
// CHECK-NEXT: 948 uext 10 97 4
// CHECK-NEXT: 949 eq 25 75 948
// CHECK-NEXT: 950 ite 25 949 97 248
// CHECK-NEXT: 951 const 29 000
// CHECK-NEXT: 952 concat 206 951 75
// CHECK-NEXT: 953 redor 25 952
// CHECK-NEXT: 954 not 25 953
// CHECK-NEXT: 955 ite 25 954 248 950
// CHECK-NEXT: 956 not 25 955
// CHECK-NEXT: 957 slice 25 944 1 1
// CHECK-NEXT: 958 and 25 956 957
// CHECK-NEXT: 959 ite 47 958 947 946
// CHECK-NEXT: 960 slice 25 48 0 0
// CHECK-NEXT: 961 neq 25 960 97
// CHECK-NEXT: 962 and 25 961 960
// CHECK-NEXT: 963 slice 25 48 1 1
// CHECK-NEXT: 964 neq 25 963 97
// CHECK-NEXT: 965 and 25 964 963
// CHECK-NEXT: 966 slice 25 48 2 2
// CHECK-NEXT: 967 neq 25 966 97
// CHECK-NEXT: 968 and 25 967 966
// CHECK-NEXT: 969 slice 25 48 3 3
// CHECK-NEXT: 970 neq 25 969 97
// CHECK-NEXT: 971 and 25 970 969
// CHECK-NEXT: 972 slice 25 48 4 4
// CHECK-NEXT: 973 neq 25 972 97
// CHECK-NEXT: 974 and 25 973 972
// CHECK-NEXT: 975 slice 25 48 5 5
// CHECK-NEXT: 976 neq 25 975 97
// CHECK-NEXT: 977 and 25 976 975
// CHECK-NEXT: 978 slice 25 48 6 6
// CHECK-NEXT: 979 neq 25 978 97
// CHECK-NEXT: 980 and 25 979 978
// CHECK-NEXT: 981 slice 25 48 7 7
// CHECK-NEXT: 982 neq 25 981 97
// CHECK-NEXT: 983 and 25 982 981
// CHECK-NEXT: 984 slice 25 48 8 8
// CHECK-NEXT: 985 neq 25 984 97
// CHECK-NEXT: 986 and 25 985 984
// CHECK-NEXT: 987 slice 25 48 9 9
// CHECK-NEXT: 988 neq 25 987 97
// CHECK-NEXT: 989 and 25 988 987
// CHECK-NEXT: 990 slice 25 48 10 10
// CHECK-NEXT: 991 neq 25 990 97
// CHECK-NEXT: 992 and 25 991 990
// CHECK-NEXT: 993 slice 25 48 11 11
// CHECK-NEXT: 994 neq 25 993 97
// CHECK-NEXT: 995 and 25 994 993
// CHECK-NEXT: 996 slice 25 48 12 12
// CHECK-NEXT: 997 neq 25 996 97
// CHECK-NEXT: 998 and 25 997 996
// CHECK-NEXT: 999 slice 25 48 13 13
// CHECK-NEXT: 1000 neq 25 999 97
// CHECK-NEXT: 1001 and 25 1000 999
// CHECK-NEXT: 1002 slice 25 48 14 14
// CHECK-NEXT: 1003 neq 25 1002 97
// CHECK-NEXT: 1004 and 25 1003 1002
// CHECK-NEXT: 1005 slice 25 48 15 15
// CHECK-NEXT: 1006 neq 25 1005 97
// CHECK-NEXT: 1007 and 25 1006 1005
// CHECK-NEXT: 1008 slice 25 48 16 16
// CHECK-NEXT: 1009 neq 25 1008 97
// CHECK-NEXT: 1010 and 25 1009 1008
// CHECK-NEXT: 1011 slice 25 48 17 17
// CHECK-NEXT: 1012 neq 25 1011 97
// CHECK-NEXT: 1013 and 25 1012 1011
// CHECK-NEXT: 1014 slice 25 48 18 18
// CHECK-NEXT: 1015 neq 25 1014 97
// CHECK-NEXT: 1016 and 25 1015 1014
// CHECK-NEXT: 1017 slice 25 48 19 19
// CHECK-NEXT: 1018 neq 25 1017 97
// CHECK-NEXT: 1019 and 25 1018 1017
// CHECK-NEXT: 1020 slice 25 48 20 20
// CHECK-NEXT: 1021 neq 25 1020 97
// CHECK-NEXT: 1022 and 25 1021 1020
// CHECK-NEXT: 1023 slice 25 48 21 21
// CHECK-NEXT: 1024 neq 25 1023 97
// CHECK-NEXT: 1025 and 25 1024 1023
// CHECK-NEXT: 1026 slice 25 48 22 22
// CHECK-NEXT: 1027 neq 25 1026 97
// CHECK-NEXT: 1028 and 25 1027 1026
// CHECK-NEXT: 1029 slice 25 48 23 23
// CHECK-NEXT: 1030 neq 25 1029 97
// CHECK-NEXT: 1031 and 25 1030 1029
// CHECK-NEXT: 1032 slice 25 48 24 24
// CHECK-NEXT: 1033 neq 25 1032 97
// CHECK-NEXT: 1034 and 25 1033 1032
// CHECK-NEXT: 1035 slice 25 48 25 25
// CHECK-NEXT: 1036 neq 25 1035 97
// CHECK-NEXT: 1037 and 25 1036 1035
// CHECK-NEXT: 1038 slice 25 48 26 26
// CHECK-NEXT: 1039 neq 25 1038 97
// CHECK-NEXT: 1040 and 25 1039 1038
// CHECK-NEXT: 1041 concat 103 965 962
// CHECK-NEXT: 1042 concat 29 968 1041
// CHECK-NEXT: 1043 concat 7 971 1042
// CHECK-NEXT: 1044 concat 10 974 1043
// CHECK-NEXT: 1045 concat 202 977 1044
// CHECK-NEXT: 1046 concat 204 980 1045
// CHECK-NEXT: 1047 concat 206 983 1046
// CHECK-NEXT: 1048 concat 56 986 1047
// CHECK-NEXT: 1049 concat 209 989 1048
// CHECK-NEXT: 1050 concat 211 992 1049
// CHECK-NEXT: 1051 concat 213 995 1050
// CHECK-NEXT: 1052 concat 215 998 1051
// CHECK-NEXT: 1053 concat 217 1001 1052
// CHECK-NEXT: 1054 concat 219 1004 1053
// CHECK-NEXT: 1055 concat 221 1007 1054
// CHECK-NEXT: 1056 concat 223 1010 1055
// CHECK-NEXT: 1057 concat 16 1013 1056
// CHECK-NEXT: 1058 concat 226 1016 1057
// CHECK-NEXT: 1059 concat 228 1019 1058
// CHECK-NEXT: 1060 concat 230 1022 1059
// CHECK-NEXT: 1061 concat 232 1025 1060
// CHECK-NEXT: 1062 concat 234 1028 1061
// CHECK-NEXT: 1063 concat 236 1031 1062
// CHECK-NEXT: 1064 concat 238 1034 1063
// CHECK-NEXT: 1065 concat 240 1037 1064
// CHECK-NEXT: 1066 concat 47 1040 1065
// CHECK-NEXT: 1067 state 47
// CHECK-NEXT: 1068 state 47
// CHECK-NEXT: 1069 state 25
// CHECK-NEXT: 1070 init 25 1069 97
// CHECK-NEXT: 1071 concat 103 102 1069
// CHECK-NEXT: 1072 eq 25 1071 105
// CHECK-NEXT: 1073 ite 47 1072 1068 1067
// CHECK-NEXT: 1074 slice 25 49 0 0
// CHECK-NEXT: 1075 uext 10 105 3
// CHECK-NEXT: 1076 eq 25 11 1075
// CHECK-NEXT: 1077 ite 25 1076 97 248
// CHECK-NEXT: 1078 const 211 00000000000
// CHECK-NEXT: 1079 concat 221 1078 11
// CHECK-NEXT: 1080 redor 25 1079
// CHECK-NEXT: 1081 not 25 1080
// CHECK-NEXT: 1082 ite 25 1081 248 1077
// CHECK-NEXT: 1083 not 25 1082
// CHECK-NEXT: 1084 uext 10 105 3
// CHECK-NEXT: 1085 eq 25 20 1084
// CHECK-NEXT: 1086 ite 25 1085 97 248
// CHECK-NEXT: 1087 uext 10 97 4
// CHECK-NEXT: 1088 eq 25 20 1087
// CHECK-NEXT: 1089 ite 25 1088 248 1086
// CHECK-NEXT: 1090 not 25 1089
// CHECK-NEXT: 1091 and 25 1083 1090
// CHECK-NEXT: 1092 const 10 10100
// CHECK-NEXT: 1093 eq 25 90 1092
// CHECK-NEXT: 1094 ite 103 1093 105 406
// CHECK-NEXT: 1095 const 10 10010
// CHECK-NEXT: 1096 eq 25 90 1095
// CHECK-NEXT: 1097 ite 103 1096 410 1094
// CHECK-NEXT: 1098 const 7 1010
// CHECK-NEXT: 1099 uext 10 1098 1
// CHECK-NEXT: 1100 eq 25 90 1099
// CHECK-NEXT: 1101 ite 103 1100 406 1097
// CHECK-NEXT: 1102 eq 25 1101 105
// CHECK-NEXT: 1103 or 25 1091 1102
// CHECK-NEXT: 1104 ite 25 1103 248 1074
// CHECK-NEXT: 1105 ite 47 1104 1073 1066
// CHECK-NEXT: 1106 slice 25 944 2 2
// CHECK-NEXT: 1107 ite 47 1106 1105 947
// CHECK-NEXT: 1108 slice 25 944 4 4
// CHECK-NEXT: 1109 ite 16 1108 278 366
// CHECK-NEXT: 1110 const 16 000000000000000000
// CHECK-NEXT: 1111 and 25 955 957
// CHECK-NEXT: 1112 ite 16 1111 1110 1109
// CHECK-NEXT: 1113 slice 25 1112 17 17
// CHECK-NEXT: 1114 concat 226 1113 1112
// CHECK-NEXT: 1115 slice 25 1112 17 17
// CHECK-NEXT: 1116 concat 228 1115 1114
// CHECK-NEXT: 1117 slice 25 1112 17 17
// CHECK-NEXT: 1118 concat 230 1117 1116
// CHECK-NEXT: 1119 slice 25 1112 17 17
// CHECK-NEXT: 1120 concat 232 1119 1118
// CHECK-NEXT: 1121 slice 25 1112 17 17
// CHECK-NEXT: 1122 concat 234 1121 1120
// CHECK-NEXT: 1123 slice 25 1112 17 17
// CHECK-NEXT: 1124 concat 236 1123 1122
// CHECK-NEXT: 1125 slice 25 1112 17 17
// CHECK-NEXT: 1126 concat 238 1125 1124
// CHECK-NEXT: 1127 slice 25 1112 17 17
// CHECK-NEXT: 1128 concat 240 1127 1126
// CHECK-NEXT: 1129 slice 25 1112 17 17
// CHECK-NEXT: 1130 concat 47 1129 1128
// CHECK-NEXT: 1131 ite 47 955 1130 959
// CHECK-NEXT: 1132 add 47 1107 1131
// CHECK-NEXT: 1133 sub 47 1107 1131
// CHECK-NEXT: 1134 slice 25 944 3 3
// CHECK-NEXT: 1135 ite 47 1134 1133 1132
// CHECK-NEXT: 1136 state 47
// CHECK-NEXT: 1137 state 47
// CHECK-NEXT: 1138 state 25
// CHECK-NEXT: 1139 init 25 1138 97
// CHECK-NEXT: 1140 concat 103 102 1138
// CHECK-NEXT: 1141 eq 25 1140 105
// CHECK-NEXT: 1142 ite 47 1141 1137 1136
// CHECK-NEXT: 1143 slice 25 6 0 0
// CHECK-NEXT: 1144 ite 25 1103 248 1143
// CHECK-NEXT: 1145 ite 47 1144 1142 1135
// CHECK-NEXT: 1146 ite 47 1082 1145 959
// CHECK-NEXT: 1147 slice 25 1146 26 26
// CHECK-NEXT: 1148 concat 243 1147 1146
// CHECK-NEXT: 1149 slice 25 1146 26 26
// CHECK-NEXT: 1150 concat 245 1149 1148
// CHECK-NEXT: 1151 slice 25 1146 26 26
// CHECK-NEXT: 1152 concat 1 1151 1150
// CHECK-NEXT: 1153 slice 25 1146 26 26
// CHECK-NEXT: 1154 concat 480 1153 1152
// CHECK-NEXT: 1155 slice 25 1146 26 26
// CHECK-NEXT: 1156 concat 3 1155 1154
// CHECK-NEXT: 1157 slice 25 1146 26 26
// CHECK-NEXT: 1158 concat 485 1157 1156
// CHECK-NEXT: 1159 slice 25 1146 26 26
// CHECK-NEXT: 1160 concat 488 1159 1158
// CHECK-NEXT: 1161 slice 25 1146 26 26
// CHECK-NEXT: 1162 concat 491 1161 1160
// CHECK-NEXT: 1163 slice 25 1146 26 26
// CHECK-NEXT: 1164 concat 494 1163 1162
// CHECK-NEXT: 1165 slice 25 1146 26 26
// CHECK-NEXT: 1166 concat 497 1165 1164
// CHECK-NEXT: 1167 slice 25 1146 26 26
// CHECK-NEXT: 1168 concat 500 1167 1166
// CHECK-NEXT: 1169 slice 25 1146 26 26
// CHECK-NEXT: 1170 concat 503 1169 1168
// CHECK-NEXT: 1171 slice 25 1146 26 26
// CHECK-NEXT: 1172 concat 506 1171 1170
// CHECK-NEXT: 1173 slice 25 1146 26 26
// CHECK-NEXT: 1174 concat 509 1173 1172
// CHECK-NEXT: 1175 slice 25 1146 26 26
// CHECK-NEXT: 1176 concat 512 1175 1174
// CHECK-NEXT: 1177 slice 25 1146 26 26
// CHECK-NEXT: 1178 concat 515 1177 1176
// CHECK-NEXT: 1179 slice 25 1146 26 26
// CHECK-NEXT: 1180 concat 518 1179 1178
// CHECK-NEXT: 1181 slice 25 1146 26 26
// CHECK-NEXT: 1182 concat 521 1181 1180
// CHECK-NEXT: 1183 slice 16 1145 17 0
// CHECK-NEXT: 1184 ite 16 1089 1183 1112
// CHECK-NEXT: 1185 slice 25 1184 17 17
// CHECK-NEXT: 1186 concat 226 1185 1184
// CHECK-NEXT: 1187 slice 25 1184 17 17
// CHECK-NEXT: 1188 concat 228 1187 1186
// CHECK-NEXT: 1189 slice 25 1184 17 17
// CHECK-NEXT: 1190 concat 230 1189 1188
// CHECK-NEXT: 1191 slice 25 1184 17 17
// CHECK-NEXT: 1192 concat 232 1191 1190
// CHECK-NEXT: 1193 slice 25 1184 17 17
// CHECK-NEXT: 1194 concat 234 1193 1192
// CHECK-NEXT: 1195 slice 25 1184 17 17
// CHECK-NEXT: 1196 concat 236 1195 1194
// CHECK-NEXT: 1197 slice 25 1184 17 17
// CHECK-NEXT: 1198 concat 238 1197 1196
// CHECK-NEXT: 1199 slice 25 1184 17 17
// CHECK-NEXT: 1200 concat 240 1199 1198
// CHECK-NEXT: 1201 slice 25 1184 17 17
// CHECK-NEXT: 1202 concat 47 1201 1200
// CHECK-NEXT: 1203 slice 25 1184 17 17
// CHECK-NEXT: 1204 concat 243 1203 1202
// CHECK-NEXT: 1205 slice 25 1184 17 17
// CHECK-NEXT: 1206 concat 245 1205 1204
// CHECK-NEXT: 1207 slice 25 1184 17 17
// CHECK-NEXT: 1208 concat 1 1207 1206
// CHECK-NEXT: 1209 slice 25 1184 17 17
// CHECK-NEXT: 1210 concat 480 1209 1208
// CHECK-NEXT: 1211 slice 25 1184 17 17
// CHECK-NEXT: 1212 concat 3 1211 1210
// CHECK-NEXT: 1213 slice 25 1184 17 17
// CHECK-NEXT: 1214 concat 485 1213 1212
// CHECK-NEXT: 1215 slice 25 1184 17 17
// CHECK-NEXT: 1216 concat 488 1215 1214
// CHECK-NEXT: 1217 slice 25 1184 17 17
// CHECK-NEXT: 1218 concat 491 1217 1216
// CHECK-NEXT: 1219 slice 25 1184 17 17
// CHECK-NEXT: 1220 concat 494 1219 1218
// CHECK-NEXT: 1221 slice 25 1184 17 17
// CHECK-NEXT: 1222 concat 497 1221 1220
// CHECK-NEXT: 1223 slice 25 1184 17 17
// CHECK-NEXT: 1224 concat 500 1223 1222
// CHECK-NEXT: 1225 slice 25 1184 17 17
// CHECK-NEXT: 1226 concat 503 1225 1224
// CHECK-NEXT: 1227 slice 25 1184 17 17
// CHECK-NEXT: 1228 concat 506 1227 1226
// CHECK-NEXT: 1229 slice 25 1184 17 17
// CHECK-NEXT: 1230 concat 509 1229 1228
// CHECK-NEXT: 1231 slice 25 1184 17 17
// CHECK-NEXT: 1232 concat 512 1231 1230
// CHECK-NEXT: 1233 slice 25 1184 17 17
// CHECK-NEXT: 1234 concat 515 1233 1232
// CHECK-NEXT: 1235 slice 25 1184 17 17
// CHECK-NEXT: 1236 concat 518 1235 1234
// CHECK-NEXT: 1237 slice 25 1184 17 17
// CHECK-NEXT: 1238 concat 521 1237 1236
// CHECK-NEXT: 1239 mul 521 1182 1238
// CHECK-NEXT: 1240 const 521 000000000000000000000000000000000000000000000
// CHECK-NEXT: 1241 ite 521 1102 1240 1239
// CHECK-NEXT: 1242 slice 518 1241 43 0
// CHECK-NEXT: 1243 const 515 1010101010101010101010101010101010101010101
// CHECK-NEXT: 1244 uext 518 1243 1
// CHECK-NEXT: 1245 and 518 1242 1244
// CHECK-NEXT: 1246 concat 521 97 1245
// CHECK-NEXT: 1247 state 521
// CHECK-NEXT: 1248 state 521
// CHECK-NEXT: 1249 state 25
// CHECK-NEXT: 1250 init 25 1249 97
// CHECK-NEXT: 1251 concat 103 102 1249
// CHECK-NEXT: 1252 eq 25 1251 105
// CHECK-NEXT: 1253 ite 521 1252 1248 1247
// CHECK-NEXT: 1254 slice 25 69 0 0
// CHECK-NEXT: 1255 ite 521 1254 1253 1246
// CHECK-NEXT: 1256 redor 25 417
// CHECK-NEXT: 1257 not 25 1256
// CHECK-NEXT: 1258 ite 521 1257 1255 904
// CHECK-NEXT: 1259 slice 25 1258 44 44
// CHECK-NEXT: 1260 concat 524 1259 1258
// CHECK-NEXT: 1261 slice 25 1258 44 44
// CHECK-NEXT: 1262 concat 527 1261 1260
// CHECK-NEXT: 1263 slice 25 1258 44 44
// CHECK-NEXT: 1264 concat 23 1263 1262
// CHECK-NEXT: 1265 uext 103 97 1
// CHECK-NEXT: 1266 eq 25 899 1265
// CHECK-NEXT: 1267 ite 23 1266 1264 903
// CHECK-NEXT: 1268 concat 103 70 248
// CHECK-NEXT: 1269 ite 103 680 1268 406
// CHECK-NEXT: 1270 const 524 0000000000000000000000000000000000000000000000
// CHECK-NEXT: 1271 concat 23 1270 1269
// CHECK-NEXT: 1272 redor 25 899
// CHECK-NEXT: 1273 not 25 1272
// CHECK-NEXT: 1274 ite 23 1273 1271 1267
// CHECK-NEXT: 1275 xor 23 896 1274
// CHECK-NEXT: 1276 input 23
// CHECK-NEXT: 1277 slice 103 635 3 2
// CHECK-NEXT: 1278 eq 25 1277 637
// CHECK-NEXT: 1279 ite 23 1278 885 1276
// CHECK-NEXT: 1280 const 23 111111111111111111111111111111111111111111111111
// CHECK-NEXT: 1281 eq 25 1277 105
// CHECK-NEXT: 1282 ite 23 1281 1280 1279
// CHECK-NEXT: 1283 const 518 10101010101010101010101010101010101010101010
// CHECK-NEXT: 1284 and 518 1242 1283
// CHECK-NEXT: 1285 slice 25 1241 44 44
// CHECK-NEXT: 1286 not 25 1285
// CHECK-NEXT: 1287 concat 521 1286 1284
// CHECK-NEXT: 1288 state 521
// CHECK-NEXT: 1289 state 521
// CHECK-NEXT: 1290 state 25
// CHECK-NEXT: 1291 init 25 1290 97
// CHECK-NEXT: 1292 concat 103 102 1290
// CHECK-NEXT: 1293 eq 25 1292 105
// CHECK-NEXT: 1294 ite 521 1293 1289 1288
// CHECK-NEXT: 1295 ite 521 1254 1294 1287
// CHECK-NEXT: 1296 ite 521 1257 1295 904
// CHECK-NEXT: 1297 concat 23 951 1296
// CHECK-NEXT: 1298 uext 103 97 1
// CHECK-NEXT: 1299 eq 25 1277 1298
// CHECK-NEXT: 1300 ite 23 1299 1297 1282
// CHECK-NEXT: 1301 redor 25 1277
// CHECK-NEXT: 1302 not 25 1301
// CHECK-NEXT: 1303 ite 23 1302 892 1300
// CHECK-NEXT: 1304 xor 23 1275 1303
// CHECK-NEXT: 1305 and 23 1274 1303
// CHECK-NEXT: 1306 and 23 896 1303
// CHECK-NEXT: 1307 or 23 1305 1306
// CHECK-NEXT: 1308 and 23 1274 896
// CHECK-NEXT: 1309 or 23 1307 1308
// CHECK-NEXT: 1310 slice 25 402 3 3
// CHECK-NEXT: 1311 ite 23 1310 1309 1304
// CHECK-NEXT: 1312 slice 25 402 2 2
// CHECK-NEXT: 1313 ite 23 1312 892 1309
// CHECK-NEXT: 1314 slice 25 1313 11 11
// CHECK-NEXT: 1315 and 25 1314 419
// CHECK-NEXT: 1316 slice 25 1313 23 23
// CHECK-NEXT: 1317 and 25 1316 1257
// CHECK-NEXT: 1318 slice 25 1313 35 35
// CHECK-NEXT: 1319 and 25 1318 419
// CHECK-NEXT: 1320 slice 211 1313 10 0
// CHECK-NEXT: 1321 concat 213 1320 248
// CHECK-NEXT: 1322 concat 215 1315 1321
// CHECK-NEXT: 1323 slice 211 1313 22 12
// CHECK-NEXT: 1324 concat 236 1323 1322
// CHECK-NEXT: 1325 concat 238 1317 1324
// CHECK-NEXT: 1326 slice 211 1313 34 24
// CHECK-NEXT: 1327 concat 494 1326 1325
// CHECK-NEXT: 1328 concat 497 1319 1327
// CHECK-NEXT: 1329 slice 211 1313 46 36
// CHECK-NEXT: 1330 concat 23 1329 1328
// CHECK-NEXT: 1331 and 23 1311 1330
// CHECK-NEXT: 1332 input 23
// CHECK-NEXT: 1333 slice 103 635 8 7
// CHECK-NEXT: 1334 eq 25 1333 637
// CHECK-NEXT: 1335 ite 23 1334 885 1332
// CHECK-NEXT: 1336 eq 25 1333 105
// CHECK-NEXT: 1337 ite 23 1336 77 1335
// CHECK-NEXT: 1338 uext 103 97 1
// CHECK-NEXT: 1339 eq 25 1333 1338
// CHECK-NEXT: 1340 ite 23 1339 538 1337
// CHECK-NEXT: 1341 redor 25 1333
// CHECK-NEXT: 1342 not 25 1341
// CHECK-NEXT: 1343 ite 23 1342 892 1340
// CHECK-NEXT: 1344 and 23 1343 1330
// CHECK-NEXT: 1345 or 23 1331 1344
// CHECK-NEXT: 1346 and 23 1311 1343
// CHECK-NEXT: 1347 or 23 1345 1346
// CHECK-NEXT: 1348 slice 25 1347 35 35
// CHECK-NEXT: 1349 and 25 419 1348
// CHECK-NEXT: 1350 slice 213 1347 47 36
// CHECK-NEXT: 1351 concat 215 1350 1349
// CHECK-NEXT: 1352 uext 217 1351 1
// CHECK-NEXT: 1353 xor 23 1311 1330
// CHECK-NEXT: 1354 xor 23 1353 1343
// CHECK-NEXT: 1355 slice 213 1354 47 36
// CHECK-NEXT: 1356 slice 25 1313 47 47
// CHECK-NEXT: 1357 concat 215 1356 1355
// CHECK-NEXT: 1358 uext 217 1357 1
// CHECK-NEXT: 1359 add 217 1352 1358
// CHECK-NEXT: 1360 slice 25 1347 23 23
// CHECK-NEXT: 1361 and 25 1257 1360
// CHECK-NEXT: 1362 slice 211 1347 34 24
// CHECK-NEXT: 1363 concat 213 1362 1361
// CHECK-NEXT: 1364 uext 215 1363 1
// CHECK-NEXT: 1365 slice 213 1354 35 24
// CHECK-NEXT: 1366 uext 215 1365 1
// CHECK-NEXT: 1367 add 215 1364 1366
// CHECK-NEXT: 1368 slice 25 1347 11 11
// CHECK-NEXT: 1369 and 25 419 1368
// CHECK-NEXT: 1370 slice 211 1347 22 12
// CHECK-NEXT: 1371 concat 213 1370 1369
// CHECK-NEXT: 1372 uext 215 1371 1
// CHECK-NEXT: 1373 slice 213 1354 23 12
// CHECK-NEXT: 1374 uext 215 1373 1
// CHECK-NEXT: 1375 add 215 1372 1374
// CHECK-NEXT: 1376 input 25
// CHECK-NEXT: 1377 slice 25 538 47 47
// CHECK-NEXT: 1378 not 25 1377
// CHECK-NEXT: 1379 slice 25 30 0 0
// CHECK-NEXT: 1380 neq 25 1379 97
// CHECK-NEXT: 1381 and 25 1380 1379
// CHECK-NEXT: 1382 slice 25 30 1 1
// CHECK-NEXT: 1383 neq 25 1382 97
// CHECK-NEXT: 1384 and 25 1383 1382
// CHECK-NEXT: 1385 slice 25 30 2 2
// CHECK-NEXT: 1386 neq 25 1385 97
// CHECK-NEXT: 1387 and 25 1386 1385
// CHECK-NEXT: 1388 concat 103 1384 1381
// CHECK-NEXT: 1389 concat 29 1387 1388
// CHECK-NEXT: 1390 state 29
// CHECK-NEXT: 1391 state 29
// CHECK-NEXT: 1392 state 25
// CHECK-NEXT: 1393 init 25 1392 97
// CHECK-NEXT: 1394 concat 103 102 1392
// CHECK-NEXT: 1395 eq 25 1394 105
// CHECK-NEXT: 1396 ite 29 1395 1391 1390
// CHECK-NEXT: 1397 slice 25 31 0 0
// CHECK-NEXT: 1398 ite 29 1397 1396 1389
// CHECK-NEXT: 1399 eq 25 1398 253
// CHECK-NEXT: 1400 ite 25 1399 1378 1376
// CHECK-NEXT: 1401 slice 25 1146 26 26
// CHECK-NEXT: 1402 slice 25 1184 17 17
// CHECK-NEXT: 1403 xor 25 1401 1402
// CHECK-NEXT: 1404 not 25 1403
// CHECK-NEXT: 1405 state 25
// CHECK-NEXT: 1406 state 25
// CHECK-NEXT: 1407 state 25
// CHECK-NEXT: 1408 init 25 1407 97
// CHECK-NEXT: 1409 concat 103 102 1407
// CHECK-NEXT: 1410 eq 25 1409 105
// CHECK-NEXT: 1411 ite 25 1410 1406 1405
// CHECK-NEXT: 1412 ite 25 1254 1411 1404
// CHECK-NEXT: 1413 not 25 1412
// CHECK-NEXT: 1414 const 29 110
// CHECK-NEXT: 1415 eq 25 1398 1414
// CHECK-NEXT: 1416 ite 25 1415 1413 1400
// CHECK-NEXT: 1417 eq 25 1398 676
// CHECK-NEXT: 1418 ite 25 1417 1377 1416
// CHECK-NEXT: 1419 state 25
// CHECK-NEXT: 1420 state 25
// CHECK-NEXT: 1421 state 25
// CHECK-NEXT: 1422 init 25 1421 97
// CHECK-NEXT: 1423 concat 103 102 1421
// CHECK-NEXT: 1424 eq 25 1423 105
// CHECK-NEXT: 1425 ite 25 1424 1420 1419
// CHECK-NEXT: 1426 state 7
// CHECK-NEXT: 1427 state 7
// CHECK-NEXT: 1428 state 25
// CHECK-NEXT: 1429 init 25 1428 97
// CHECK-NEXT: 1430 concat 103 102 1428
// CHECK-NEXT: 1431 eq 25 1430 105
// CHECK-NEXT: 1432 ite 7 1431 1427 1426
// CHECK-NEXT: 1433 slice 25 1432 3 3
// CHECK-NEXT: 1434 xor 25 1425 1433
// CHECK-NEXT: 1435 not 25 1434
// CHECK-NEXT: 1436 eq 25 1398 679
// CHECK-NEXT: 1437 ite 25 1436 1435 1418
// CHECK-NEXT: 1438 slice 25 74 47 47
// CHECK-NEXT: 1439 not 25 1438
// CHECK-NEXT: 1440 uext 29 637 1
// CHECK-NEXT: 1441 eq 25 1398 1440
// CHECK-NEXT: 1442 ite 25 1441 1439 1437
// CHECK-NEXT: 1443 not 25 26
// CHECK-NEXT: 1444 uext 29 105 1
// CHECK-NEXT: 1445 eq 25 1398 1444
// CHECK-NEXT: 1446 ite 25 1445 1443 1442
// CHECK-NEXT: 1447 uext 29 97 2
// CHECK-NEXT: 1448 eq 25 1398 1447
// CHECK-NEXT: 1449 ite 25 1448 1438 1446
// CHECK-NEXT: 1450 neq 25 27 97
// CHECK-NEXT: 1451 xor 25 27 53
// CHECK-NEXT: 1452 and 25 1450 1451
// CHECK-NEXT: 1453 state 25
// CHECK-NEXT: 1454 state 25
// CHECK-NEXT: 1455 state 25
// CHECK-NEXT: 1456 init 25 1455 97
// CHECK-NEXT: 1457 concat 103 102 1455
// CHECK-NEXT: 1458 eq 25 1457 105
// CHECK-NEXT: 1459 ite 25 1458 1454 1453
// CHECK-NEXT: 1460 slice 25 28 0 0
// CHECK-NEXT: 1461 ite 25 1460 1459 1452
// CHECK-NEXT: 1462 not 25 1461
// CHECK-NEXT: 1463 redor 25 1398
// CHECK-NEXT: 1464 not 25 1463
// CHECK-NEXT: 1465 ite 25 1464 1462 1449
// CHECK-NEXT: 1466 not 25 1465
// CHECK-NEXT: 1467 or 25 1310 1312
// CHECK-NEXT: 1468 ite 25 1467 248 1466
// CHECK-NEXT: 1469 slice 211 1347 10 0
// CHECK-NEXT: 1470 concat 213 1469 1468
// CHECK-NEXT: 1471 uext 215 1470 1
// CHECK-NEXT: 1472 slice 213 1354 11 0
// CHECK-NEXT: 1473 uext 215 1472 1
// CHECK-NEXT: 1474 add 215 1471 1473
// CHECK-NEXT: 1475 slice 25 1474 12 12
// CHECK-NEXT: 1476 and 25 419 1475
// CHECK-NEXT: 1477 uext 215 1476 12
// CHECK-NEXT: 1478 add 215 1375 1477
// CHECK-NEXT: 1479 slice 25 1478 12 12
// CHECK-NEXT: 1480 and 25 1257 1479
// CHECK-NEXT: 1481 uext 215 1480 12
// CHECK-NEXT: 1482 add 215 1367 1481
// CHECK-NEXT: 1483 slice 25 1482 12 12
// CHECK-NEXT: 1484 and 25 419 1483
// CHECK-NEXT: 1485 uext 217 1484 13
// CHECK-NEXT: 1486 add 217 1359 1485
// CHECK-NEXT: 1487 slice 25 1486 12 12
// CHECK-NEXT: 1488 xor 25 405 1487
// CHECK-NEXT: 1489 xor 25 405 1488
// CHECK-NEXT: 1490 slice 25 76 0 0
// CHECK-NEXT: 1491 ite 25 1490 1434 1489
// CHECK-NEXT: 1492 output 1491 CARRYCASCOUT 
// CHECK-NEXT: 1493 xor 25 1368 1475
// CHECK-NEXT: 1494 xor 25 1493 1314
// CHECK-NEXT: 1495 xor 25 405 1494
// CHECK-NEXT: 1496 slice 7 635 3 0
// CHECK-NEXT: 1497 uext 7 676 1
// CHECK-NEXT: 1498 eq 25 1496 1497
// CHECK-NEXT: 1499 slice 103 402 3 2
// CHECK-NEXT: 1500 redor 25 1499
// CHECK-NEXT: 1501 or 25 1498 1500
// CHECK-NEXT: 1502 ite 25 1501 248 1495
// CHECK-NEXT: 1503 uext 103 97 1
// CHECK-NEXT: 1504 eq 25 417 1503
// CHECK-NEXT: 1505 ite 25 1504 1502 248
// CHECK-NEXT: 1506 xor 25 1360 1479
// CHECK-NEXT: 1507 xor 25 1506 1316
// CHECK-NEXT: 1508 xor 25 405 1507
// CHECK-NEXT: 1509 ite 25 1501 248 1508
// CHECK-NEXT: 1510 redor 25 417
// CHECK-NEXT: 1511 ite 25 1510 1509 248
// CHECK-NEXT: 1512 xor 25 1348 1483
// CHECK-NEXT: 1513 xor 25 1512 1318
// CHECK-NEXT: 1514 xor 25 405 1513
// CHECK-NEXT: 1515 ite 25 1501 248 1514
// CHECK-NEXT: 1516 ite 25 1504 1515 248
// CHECK-NEXT: 1517 concat 103 1511 1505
// CHECK-NEXT: 1518 concat 29 1516 1517
// CHECK-NEXT: 1519 concat 7 1488 1518
// CHECK-NEXT: 1520 ite 7 1490 1432 1519
// CHECK-NEXT: 1521 output 1520 CARRYOUT 
// CHECK-NEXT: 1522 slice 25 1486 13 13
// CHECK-NEXT: 1523 state 25
// CHECK-NEXT: 1524 state 25
// CHECK-NEXT: 1525 state 25
// CHECK-NEXT: 1526 init 25 1525 97
// CHECK-NEXT: 1527 concat 103 102 1525
// CHECK-NEXT: 1528 eq 25 1527 105
// CHECK-NEXT: 1529 ite 25 1528 1524 1523
// CHECK-NEXT: 1530 ite 25 1490 1529 1522
// CHECK-NEXT: 1531 output 1530 MULTSIGNOUT 
// CHECK-NEXT: 1532 const 10 10001
// CHECK-NEXT: 1533 eq 25 89 1532
// CHECK-NEXT: 1534 ite 25 1533 97 248
// CHECK-NEXT: 1535 const 7 1001
// CHECK-NEXT: 1536 uext 10 1535 1
// CHECK-NEXT: 1537 eq 25 89 1536
// CHECK-NEXT: 1538 ite 25 1537 248 1534
// CHECK-NEXT: 1539 ite 23 1538 885 73
// CHECK-NEXT: 1540 slice 25 402 1 1
// CHECK-NEXT: 1541 slice 25 402 1 1
// CHECK-NEXT: 1542 concat 103 1541 1540
// CHECK-NEXT: 1543 slice 25 402 1 1
// CHECK-NEXT: 1544 concat 29 1543 1542
// CHECK-NEXT: 1545 slice 25 402 1 1
// CHECK-NEXT: 1546 concat 7 1545 1544
// CHECK-NEXT: 1547 slice 25 402 1 1
// CHECK-NEXT: 1548 concat 10 1547 1546
// CHECK-NEXT: 1549 slice 25 402 1 1
// CHECK-NEXT: 1550 concat 202 1549 1548
// CHECK-NEXT: 1551 slice 25 402 1 1
// CHECK-NEXT: 1552 concat 204 1551 1550
// CHECK-NEXT: 1553 slice 25 402 1 1
// CHECK-NEXT: 1554 concat 206 1553 1552
// CHECK-NEXT: 1555 slice 25 402 1 1
// CHECK-NEXT: 1556 concat 56 1555 1554
// CHECK-NEXT: 1557 slice 25 402 1 1
// CHECK-NEXT: 1558 concat 209 1557 1556
// CHECK-NEXT: 1559 slice 25 402 1 1
// CHECK-NEXT: 1560 concat 211 1559 1558
// CHECK-NEXT: 1561 slice 25 402 1 1
// CHECK-NEXT: 1562 concat 213 1561 1560
// CHECK-NEXT: 1563 slice 25 402 1 1
// CHECK-NEXT: 1564 concat 215 1563 1562
// CHECK-NEXT: 1565 slice 25 402 1 1
// CHECK-NEXT: 1566 concat 217 1565 1564
// CHECK-NEXT: 1567 slice 25 402 1 1
// CHECK-NEXT: 1568 concat 219 1567 1566
// CHECK-NEXT: 1569 slice 25 402 1 1
// CHECK-NEXT: 1570 concat 221 1569 1568
// CHECK-NEXT: 1571 slice 25 402 1 1
// CHECK-NEXT: 1572 concat 223 1571 1570
// CHECK-NEXT: 1573 slice 25 402 1 1
// CHECK-NEXT: 1574 concat 16 1573 1572
// CHECK-NEXT: 1575 slice 25 402 1 1
// CHECK-NEXT: 1576 concat 226 1575 1574
// CHECK-NEXT: 1577 slice 25 402 1 1
// CHECK-NEXT: 1578 concat 228 1577 1576
// CHECK-NEXT: 1579 slice 25 402 1 1
// CHECK-NEXT: 1580 concat 230 1579 1578
// CHECK-NEXT: 1581 slice 25 402 1 1
// CHECK-NEXT: 1582 concat 232 1581 1580
// CHECK-NEXT: 1583 slice 25 402 1 1
// CHECK-NEXT: 1584 concat 234 1583 1582
// CHECK-NEXT: 1585 slice 25 402 1 1
// CHECK-NEXT: 1586 concat 236 1585 1584
// CHECK-NEXT: 1587 slice 25 402 1 1
// CHECK-NEXT: 1588 concat 238 1587 1586
// CHECK-NEXT: 1589 slice 25 402 1 1
// CHECK-NEXT: 1590 concat 240 1589 1588
// CHECK-NEXT: 1591 slice 25 402 1 1
// CHECK-NEXT: 1592 concat 47 1591 1590
// CHECK-NEXT: 1593 slice 25 402 1 1
// CHECK-NEXT: 1594 concat 243 1593 1592
// CHECK-NEXT: 1595 slice 25 402 1 1
// CHECK-NEXT: 1596 concat 245 1595 1594
// CHECK-NEXT: 1597 slice 25 402 1 1
// CHECK-NEXT: 1598 concat 1 1597 1596
// CHECK-NEXT: 1599 slice 25 402 1 1
// CHECK-NEXT: 1600 concat 480 1599 1598
// CHECK-NEXT: 1601 slice 25 402 1 1
// CHECK-NEXT: 1602 concat 3 1601 1600
// CHECK-NEXT: 1603 slice 25 402 1 1
// CHECK-NEXT: 1604 concat 485 1603 1602
// CHECK-NEXT: 1605 slice 25 402 1 1
// CHECK-NEXT: 1606 concat 488 1605 1604
// CHECK-NEXT: 1607 slice 25 402 1 1
// CHECK-NEXT: 1608 concat 491 1607 1606
// CHECK-NEXT: 1609 slice 25 402 1 1
// CHECK-NEXT: 1610 concat 494 1609 1608
// CHECK-NEXT: 1611 slice 25 402 1 1
// CHECK-NEXT: 1612 concat 497 1611 1610
// CHECK-NEXT: 1613 slice 25 402 1 1
// CHECK-NEXT: 1614 concat 500 1613 1612
// CHECK-NEXT: 1615 slice 25 402 1 1
// CHECK-NEXT: 1616 concat 503 1615 1614
// CHECK-NEXT: 1617 slice 25 402 1 1
// CHECK-NEXT: 1618 concat 506 1617 1616
// CHECK-NEXT: 1619 slice 25 402 1 1
// CHECK-NEXT: 1620 concat 509 1619 1618
// CHECK-NEXT: 1621 slice 25 402 1 1
// CHECK-NEXT: 1622 concat 512 1621 1620
// CHECK-NEXT: 1623 slice 25 402 1 1
// CHECK-NEXT: 1624 concat 515 1623 1622
// CHECK-NEXT: 1625 slice 25 402 1 1
// CHECK-NEXT: 1626 concat 518 1625 1624
// CHECK-NEXT: 1627 slice 25 402 1 1
// CHECK-NEXT: 1628 concat 521 1627 1626
// CHECK-NEXT: 1629 slice 25 402 1 1
// CHECK-NEXT: 1630 concat 524 1629 1628
// CHECK-NEXT: 1631 slice 25 402 1 1
// CHECK-NEXT: 1632 concat 527 1631 1630
// CHECK-NEXT: 1633 slice 25 402 1 1
// CHECK-NEXT: 1634 concat 23 1633 1632
// CHECK-NEXT: 1635 slice 213 1474 11 0
// CHECK-NEXT: 1636 slice 213 1478 11 0
// CHECK-NEXT: 1637 concat 236 1636 1635
// CHECK-NEXT: 1638 slice 213 1482 11 0
// CHECK-NEXT: 1639 concat 494 1638 1637
// CHECK-NEXT: 1640 slice 213 1486 11 0
// CHECK-NEXT: 1641 concat 23 1640 1639
// CHECK-NEXT: 1642 xor 23 1634 1641
// CHECK-NEXT: 1643 xor 23 1539 1642
// CHECK-NEXT: 1644 not 23 1643
// CHECK-NEXT: 1645 slice 524 885 45 0
// CHECK-NEXT: 1646 not 524 1645
// CHECK-NEXT: 1647 concat 23 1646 406
// CHECK-NEXT: 1648 const 10 10111
// CHECK-NEXT: 1649 eq 25 88 1648
// CHECK-NEXT: 1650 ite 103 1649 637 406
// CHECK-NEXT: 1651 const 10 10110
// CHECK-NEXT: 1652 eq 25 88 1651
// CHECK-NEXT: 1653 ite 103 1652 105 1650
// CHECK-NEXT: 1654 eq 25 88 1532
// CHECK-NEXT: 1655 ite 103 1654 410 1653
// CHECK-NEXT: 1656 const 7 1000
// CHECK-NEXT: 1657 uext 10 1656 1
// CHECK-NEXT: 1658 eq 25 88 1657
// CHECK-NEXT: 1659 ite 103 1658 406 1655
// CHECK-NEXT: 1660 eq 25 1659 637
// CHECK-NEXT: 1661 ite 23 1660 1647 68
// CHECK-NEXT: 1662 slice 527 885 46 0
// CHECK-NEXT: 1663 not 527 1662
// CHECK-NEXT: 1664 concat 23 1663 248
// CHECK-NEXT: 1665 eq 25 1659 105
// CHECK-NEXT: 1666 ite 23 1665 1664 1661
// CHECK-NEXT: 1667 uext 103 97 1
// CHECK-NEXT: 1668 eq 25 1659 1667
// CHECK-NEXT: 1669 ite 23 1668 885 1666
// CHECK-NEXT: 1670 const 10 10101
// CHECK-NEXT: 1671 eq 25 91 1670
// CHECK-NEXT: 1672 ite 25 1671 97 248
// CHECK-NEXT: 1673 const 7 1011
// CHECK-NEXT: 1674 uext 10 1673 1
// CHECK-NEXT: 1675 eq 25 91 1674
// CHECK-NEXT: 1676 ite 25 1675 248 1672
// CHECK-NEXT: 1677 ite 23 1676 1669 1280
// CHECK-NEXT: 1678 or 23 1644 1677
// CHECK-NEXT: 1679 redand 25 1678
// CHECK-NEXT: 1680 state 25
// CHECK-NEXT: 1681 state 25
// CHECK-NEXT: 1682 state 25
// CHECK-NEXT: 1683 init 25 1682 97
// CHECK-NEXT: 1684 concat 103 102 1682
// CHECK-NEXT: 1685 eq 25 1684 105
// CHECK-NEXT: 1686 ite 25 1685 1681 1680
// CHECK-NEXT: 1687 ite 25 1490 1686 1679
// CHECK-NEXT: 1688 not 25 1687
// CHECK-NEXT: 1689 or 23 1643 1677
// CHECK-NEXT: 1690 redand 25 1689
// CHECK-NEXT: 1691 state 25
// CHECK-NEXT: 1692 state 25
// CHECK-NEXT: 1693 state 25
// CHECK-NEXT: 1694 init 25 1693 97
// CHECK-NEXT: 1695 concat 103 102 1693
// CHECK-NEXT: 1696 eq 25 1695 105
// CHECK-NEXT: 1697 ite 25 1696 1692 1691
// CHECK-NEXT: 1698 ite 25 1490 1697 1690
// CHECK-NEXT: 1699 not 25 1698
// CHECK-NEXT: 1700 and 25 1688 1699
// CHECK-NEXT: 1701 state 25
// CHECK-NEXT: 1702 state 25
// CHECK-NEXT: 1703 state 25
// CHECK-NEXT: 1704 init 25 1703 97
// CHECK-NEXT: 1705 concat 103 102 1703
// CHECK-NEXT: 1706 eq 25 1705 105
// CHECK-NEXT: 1707 ite 25 1706 1702 1701
// CHECK-NEXT: 1708 ite 25 1490 1707 1679
// CHECK-NEXT: 1709 and 25 1700 1708
// CHECK-NEXT: 1710 ite 25 1676 1709 248
// CHECK-NEXT: 1711 output 1710 OVERFLOW 
// CHECK-NEXT: 1712 ite 23 1490 538 1642
// CHECK-NEXT: 1713 output 1712 P 
// CHECK-NEXT: 1714 output 1698 PATTERNBDETECT 
// CHECK-NEXT: 1715 output 1687 PATTERNDETECT 
// CHECK-NEXT: 1716 output 1712 PCOUT 
// CHECK-NEXT: 1717 state 25
// CHECK-NEXT: 1718 state 25
// CHECK-NEXT: 1719 state 25
// CHECK-NEXT: 1720 init 25 1719 97
// CHECK-NEXT: 1721 concat 103 102 1719
// CHECK-NEXT: 1722 eq 25 1721 105
// CHECK-NEXT: 1723 ite 25 1722 1718 1717
// CHECK-NEXT: 1724 ite 25 1490 1723 1690
// CHECK-NEXT: 1725 and 25 1700 1724
// CHECK-NEXT: 1726 ite 25 1676 1725 248
// CHECK-NEXT: 1727 output 1726 UNDERFLOW 
// CHECK-NEXT: 1728 slice 202 1304 5 0
// CHECK-NEXT: 1729 redxor 25 1728
// CHECK-NEXT: 1730 const 10 11000
// CHECK-NEXT: 1731 eq 25 93 1730
// CHECK-NEXT: 1732 ite 25 1731 97 248
// CHECK-NEXT: 1733 const 7 1101
// CHECK-NEXT: 1734 uext 10 1733 1
// CHECK-NEXT: 1735 eq 25 93 1734
// CHECK-NEXT: 1736 ite 25 1735 248 1732
// CHECK-NEXT: 1737 ite 25 1736 1729 248
// CHECK-NEXT: 1738 slice 202 1304 11 6
// CHECK-NEXT: 1739 redxor 25 1738
// CHECK-NEXT: 1740 ite 25 1736 1739 248
// CHECK-NEXT: 1741 xor 25 1737 1740
// CHECK-NEXT: 1742 const 10 11010
// CHECK-NEXT: 1743 eq 25 94 1742
// CHECK-NEXT: 1744 ite 25 1743 97 248
// CHECK-NEXT: 1745 const 7 1110
// CHECK-NEXT: 1746 uext 10 1745 1
// CHECK-NEXT: 1747 eq 25 94 1746
// CHECK-NEXT: 1748 ite 25 1747 248 1744
// CHECK-NEXT: 1749 ite 25 1748 1737 1741
// CHECK-NEXT: 1750 slice 202 1304 17 12
// CHECK-NEXT: 1751 redxor 25 1750
// CHECK-NEXT: 1752 ite 25 1736 1751 248
// CHECK-NEXT: 1753 slice 202 1304 23 18
// CHECK-NEXT: 1754 redxor 25 1753
// CHECK-NEXT: 1755 ite 25 1736 1754 248
// CHECK-NEXT: 1756 xor 25 1752 1755
// CHECK-NEXT: 1757 xor 25 1741 1756
// CHECK-NEXT: 1758 ite 25 1748 1740 1757
// CHECK-NEXT: 1759 ite 25 1748 1752 1756
// CHECK-NEXT: 1760 slice 202 1304 29 24
// CHECK-NEXT: 1761 redxor 25 1760
// CHECK-NEXT: 1762 ite 25 1736 1761 248
// CHECK-NEXT: 1763 slice 202 1304 35 30
// CHECK-NEXT: 1764 redxor 25 1763
// CHECK-NEXT: 1765 ite 25 1736 1764 248
// CHECK-NEXT: 1766 xor 25 1762 1765
// CHECK-NEXT: 1767 slice 202 1304 41 36
// CHECK-NEXT: 1768 redxor 25 1767
// CHECK-NEXT: 1769 ite 25 1736 1768 248
// CHECK-NEXT: 1770 slice 202 1304 47 42
// CHECK-NEXT: 1771 redxor 25 1770
// CHECK-NEXT: 1772 ite 25 1736 1771 248
// CHECK-NEXT: 1773 xor 25 1769 1772
// CHECK-NEXT: 1774 xor 25 1766 1773
// CHECK-NEXT: 1775 xor 25 1757 1774
// CHECK-NEXT: 1776 ite 25 1748 1755 1775
// CHECK-NEXT: 1777 ite 25 1748 1762 1766
// CHECK-NEXT: 1778 ite 25 1748 1765 1774
// CHECK-NEXT: 1779 ite 25 1748 1769 1773
// CHECK-NEXT: 1780 concat 103 1758 1749
// CHECK-NEXT: 1781 concat 29 1759 1780
// CHECK-NEXT: 1782 concat 7 1776 1781
// CHECK-NEXT: 1783 concat 10 1777 1782
// CHECK-NEXT: 1784 concat 202 1778 1783
// CHECK-NEXT: 1785 concat 204 1779 1784
// CHECK-NEXT: 1786 concat 206 1772 1785
// CHECK-NEXT: 1787 state 206
// CHECK-NEXT: 1788 state 206
// CHECK-NEXT: 1789 state 25
// CHECK-NEXT: 1790 init 25 1789 97
// CHECK-NEXT: 1791 concat 103 102 1789
// CHECK-NEXT: 1792 eq 25 1791 105
// CHECK-NEXT: 1793 ite 206 1792 1788 1787
// CHECK-NEXT: 1794 ite 206 1490 1793 1786
// CHECK-NEXT: 1795 output 1794 XOROUT 
// CHECK-NEXT: 1796 uext 1 107 0 A1_reg 
// CHECK-NEXT: 1797 uext 47 959 0 A2A1 
// CHECK-NEXT: 1798 uext 1 264 0 A2_reg 
// CHECK-NEXT: 1799 uext 103 268 0 ACASCREG_BIN 
// CHECK-NEXT: 1800 uext 3 4 0 ACASCREG_REG 
// CHECK-NEXT: 1801 uext 1 5 0 ACIN_in 
// CHECK-NEXT: 1802 uext 25 1143 0 ADREG_BIN 
// CHECK-NEXT: 1803 uext 25 1144 0 ADREG_INT 
// CHECK-NEXT: 1804 uext 3 6 0 ADREG_REG 
// CHECK-NEXT: 1805 uext 47 1145 0 AD_DATA 
// CHECK-NEXT: 1806 uext 47 1142 0 AD_DATA_reg 
// CHECK-NEXT: 1807 uext 47 1135 0 AD_in 
// CHECK-NEXT: 1808 uext 25 405 0 ALUMODE10_in 
// CHECK-NEXT: 1809 uext 25 1425 0 ALUMODE10_reg 
// CHECK-NEXT: 1810 uext 25 401 0 ALUMODEREG_BIN 
// CHECK-NEXT: 1811 uext 3 9 0 ALUMODEREG_REG 
// CHECK-NEXT: 1812 uext 7 402 0 ALUMODE_DATA 
// CHECK-NEXT: 1813 uext 7 393 0 ALUMODE_in 
// CHECK-NEXT: 1814 uext 7 400 0 ALUMODE_reg 
// CHECK-NEXT: 1815 uext 23 1642 0 ALU_OUT_in 
// CHECK-NEXT: 1816 uext 23 538 0 ALU_OUT_reg 
// CHECK-NEXT: 1817 uext 25 1401 0 AMULT26_in 
// CHECK-NEXT: 1818 uext 25 1082 0 AMULTSEL_BIN 
// CHECK-NEXT: 1819 uext 221 1079 0 AMULTSEL_REG 
// CHECK-NEXT: 1820 uext 103 265 0 AREG_BIN 
// CHECK-NEXT: 1821 uext 3 12 0 AREG_REG 
// CHECK-NEXT: 1822 uext 10 676 2
// CHECK-NEXT: 1823 eq 25 13 1822
// CHECK-NEXT: 1824 ite 103 1823 105 406
// CHECK-NEXT: 1825 uext 10 679 2
// CHECK-NEXT: 1826 eq 25 13 1825
// CHECK-NEXT: 1827 ite 103 1826 410 1824
// CHECK-NEXT: 1828 uext 10 637 3
// CHECK-NEXT: 1829 eq 25 13 1828
// CHECK-NEXT: 1830 ite 103 1829 406 1827
// CHECK-NEXT: 1831 uext 103 1830 0 AUTORESET_PATDET_BIN 
// CHECK-NEXT: 1832 sort bitvec 120
// CHECK-NEXT: 1833 sort bitvec 115
// CHECK-NEXT: 1834 const 1833 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
// CHECK-NEXT: 1835 concat 1832 1834 13
// CHECK-NEXT: 1836 uext 1832 1835 0 AUTORESET_PATDET_REG 
// CHECK-NEXT: 1837 const 10 10000
// CHECK-NEXT: 1838 eq 25 14 1837
// CHECK-NEXT: 1839 ite 25 1838 97 248
// CHECK-NEXT: 1840 uext 10 1414 2
// CHECK-NEXT: 1841 eq 25 14 1840
// CHECK-NEXT: 1842 ite 25 1841 248 1839
// CHECK-NEXT: 1843 uext 25 1842 0 AUTORESET_PRIORITY_BIN 
// CHECK-NEXT: 1844 const 491 00000000000000000000000000000000000
// CHECK-NEXT: 1845 concat 506 1844 14
// CHECK-NEXT: 1846 uext 506 1845 0 AUTORESET_PRIORITY_REG 
// CHECK-NEXT: 1847 uext 1 267 0 A_ALU 
// CHECK-NEXT: 1848 uext 25 256 0 A_INPUT_BIN 
// CHECK-NEXT: 1849 sort bitvec 56
// CHECK-NEXT: 1850 sort bitvec 51
// CHECK-NEXT: 1851 const 1850 000000000000000000000000000000000000000000000000000
// CHECK-NEXT: 1852 concat 1849 1851 15
// CHECK-NEXT: 1853 uext 1849 1852 0 A_INPUT_REG 
// CHECK-NEXT: 1854 uext 1 247 0 A_in 
// CHECK-NEXT: 1855 uext 16 278 0 B1_DATA_out 
// CHECK-NEXT: 1856 uext 16 1112 0 B2B1 
// CHECK-NEXT: 1857 uext 16 366 0 B2_DATA 
// CHECK-NEXT: 1858 uext 16 363 0 B2_reg 
// CHECK-NEXT: 1859 uext 103 367 0 BCASCREG_BIN 
// CHECK-NEXT: 1860 uext 3 18 0 BCASCREG_REG 
// CHECK-NEXT: 1861 uext 16 19 0 BCIN_in 
// CHECK-NEXT: 1862 uext 25 1402 0 BMULT17_in 
// CHECK-NEXT: 1863 uext 25 1089 0 BMULTSEL_BIN 
// CHECK-NEXT: 1864 concat 221 1078 20
// CHECK-NEXT: 1865 uext 221 1864 0 BMULTSEL_REG 
// CHECK-NEXT: 1866 uext 103 364 0 BREG_BIN 
// CHECK-NEXT: 1867 uext 3 21 0 BREG_REG 
// CHECK-NEXT: 1868 uext 16 366 0 B_ALU 
// CHECK-NEXT: 1869 uext 25 355 0 B_INPUT_BIN 
// CHECK-NEXT: 1870 concat 1849 1851 22
// CHECK-NEXT: 1871 uext 1849 1870 0 B_INPUT_REG 
// CHECK-NEXT: 1872 uext 16 349 0 B_in 
// CHECK-NEXT: 1873 uext 25 26 0 CARRYCASCIN_in 
// CHECK-NEXT: 1874 uext 25 1460 0 CARRYINREG_BIN 
// CHECK-NEXT: 1875 uext 3 28 0 CARRYINREG_REG 
// CHECK-NEXT: 1876 uext 25 1397 0 CARRYINSELREG_BIN 
// CHECK-NEXT: 1877 uext 3 31 0 CARRYINSELREG_REG 
// CHECK-NEXT: 1878 uext 29 1389 0 CARRYINSEL_in 
// CHECK-NEXT: 1879 uext 29 1398 0 CARRYINSEL_mux 
// CHECK-NEXT: 1880 uext 29 1396 0 CARRYINSEL_reg 
// CHECK-NEXT: 1881 uext 25 1452 0 CARRYIN_in 
// CHECK-NEXT: 1882 uext 25 1461 0 CARRYIN_mux 
// CHECK-NEXT: 1883 uext 25 1459 0 CARRYIN_reg 
// CHECK-NEXT: 1884 uext 25 1434 0 CCOUT_in 
// CHECK-NEXT: 1885 neq 25 32 97
// CHECK-NEXT: 1886 and 25 1885 32
// CHECK-NEXT: 1887 uext 25 1886 0 CEA1_in 
// CHECK-NEXT: 1888 neq 25 33 97
// CHECK-NEXT: 1889 and 25 1888 33
// CHECK-NEXT: 1890 uext 25 1889 0 CEA2_in 
// CHECK-NEXT: 1891 neq 25 34 97
// CHECK-NEXT: 1892 and 25 1891 34
// CHECK-NEXT: 1893 uext 25 1892 0 CEAD_in 
// CHECK-NEXT: 1894 neq 25 35 97
// CHECK-NEXT: 1895 and 25 1894 35
// CHECK-NEXT: 1896 uext 25 1895 0 CEALUMODE_in 
// CHECK-NEXT: 1897 neq 25 36 97
// CHECK-NEXT: 1898 and 25 1897 36
// CHECK-NEXT: 1899 uext 25 1898 0 CEB1_in 
// CHECK-NEXT: 1900 neq 25 37 97
// CHECK-NEXT: 1901 and 25 1900 37
// CHECK-NEXT: 1902 uext 25 1901 0 CEB2_in 
// CHECK-NEXT: 1903 neq 25 39 97
// CHECK-NEXT: 1904 and 25 1903 39
// CHECK-NEXT: 1905 uext 25 1904 0 CECARRYIN_in 
// CHECK-NEXT: 1906 neq 25 40 97
// CHECK-NEXT: 1907 and 25 1906 40
// CHECK-NEXT: 1908 uext 25 1907 0 CECTRL_in 
// CHECK-NEXT: 1909 neq 25 38 97
// CHECK-NEXT: 1910 and 25 1909 38
// CHECK-NEXT: 1911 uext 25 1910 0 CEC_in 
// CHECK-NEXT: 1912 neq 25 41 97
// CHECK-NEXT: 1913 and 25 1912 41
// CHECK-NEXT: 1914 uext 25 1913 0 CED_in 
// CHECK-NEXT: 1915 uext 25 42 0 CEINMODE_in 
// CHECK-NEXT: 1916 neq 25 43 97
// CHECK-NEXT: 1917 and 25 1916 43
// CHECK-NEXT: 1918 uext 25 1917 0 CEM_in 
// CHECK-NEXT: 1919 neq 25 44 97
// CHECK-NEXT: 1920 and 25 1919 44
// CHECK-NEXT: 1921 uext 25 1920 0 CEP_in 
// CHECK-NEXT: 1922 uext 25 102 0 CLK_in 
// CHECK-NEXT: 1923 uext 7 1519 0 COUT_in 
// CHECK-NEXT: 1924 uext 7 1432 0 COUT_reg 
// CHECK-NEXT: 1925 uext 25 884 0 CREG_BIN 
// CHECK-NEXT: 1926 uext 3 46 0 CREG_REG 
// CHECK-NEXT: 1927 uext 23 885 0 C_DATA_in 
// CHECK-NEXT: 1928 uext 23 876 0 C_in 
// CHECK-NEXT: 1929 uext 23 883 0 C_reg 
// CHECK-NEXT: 1930 uext 25 1074 0 DREG_BIN 
// CHECK-NEXT: 1931 uext 25 1104 0 DREG_INT 
// CHECK-NEXT: 1932 uext 3 49 0 DREG_REG 
// CHECK-NEXT: 1933 uext 47 1105 0 D_DATA 
// CHECK-NEXT: 1934 uext 47 1107 0 D_DATA_mux 
// CHECK-NEXT: 1935 uext 47 1073 0 D_DATA_reg 
// CHECK-NEXT: 1936 uext 47 1066 0 D_in 
// CHECK-NEXT: 1937 uext 25 943 0 INMODEREG_BIN 
// CHECK-NEXT: 1938 uext 3 51 0 INMODEREG_REG 
// CHECK-NEXT: 1939 uext 10 935 0 INMODE_in 
// CHECK-NEXT: 1940 uext 10 944 0 INMODE_mux 
// CHECK-NEXT: 1941 uext 10 942 0 INMODE_reg 
// CHECK-NEXT: 1942 uext 7 52 0 IS_ALUMODE_INVERTED_REG 
// CHECK-NEXT: 1943 uext 25 53 0 IS_CARRYIN_INVERTED_REG 
// CHECK-NEXT: 1944 uext 25 54 0 IS_CLK_INVERTED_REG 
// CHECK-NEXT: 1945 uext 10 55 0 IS_INMODE_INVERTED_REG 
// CHECK-NEXT: 1946 uext 56 57 0 IS_OPMODE_INVERTED_REG 
// CHECK-NEXT: 1947 uext 25 58 0 IS_RSTALLCARRYIN_INVERTED_REG 
// CHECK-NEXT: 1948 uext 25 59 0 IS_RSTALUMODE_INVERTED_REG 
// CHECK-NEXT: 1949 uext 25 60 0 IS_RSTA_INVERTED_REG 
// CHECK-NEXT: 1950 uext 25 61 0 IS_RSTB_INVERTED_REG 
// CHECK-NEXT: 1951 uext 25 62 0 IS_RSTCTRL_INVERTED_REG 
// CHECK-NEXT: 1952 uext 25 63 0 IS_RSTC_INVERTED_REG 
// CHECK-NEXT: 1953 uext 25 64 0 IS_RSTD_INVERTED_REG 
// CHECK-NEXT: 1954 uext 25 65 0 IS_RSTINMODE_INVERTED_REG 
// CHECK-NEXT: 1955 uext 25 66 0 IS_RSTM_INVERTED_REG 
// CHECK-NEXT: 1956 uext 25 67 0 IS_RSTP_INVERTED_REG 
// CHECK-NEXT: 1957 uext 23 68 0 MASK_REG 
// CHECK-NEXT: 1958 uext 25 1254 0 MREG_BIN 
// CHECK-NEXT: 1959 uext 3 69 0 MREG_REG 
// CHECK-NEXT: 1960 uext 25 70 0 MULTSIGNIN_in 
// CHECK-NEXT: 1961 uext 25 1522 0 MULTSIGN_ALU_in 
// CHECK-NEXT: 1962 uext 25 1529 0 MULTSIGN_ALU_reg 
// CHECK-NEXT: 1963 uext 25 634 0 OPMODEREG_BIN 
// CHECK-NEXT: 1964 uext 3 72 0 OPMODEREG_REG 
// CHECK-NEXT: 1965 uext 56 626 0 OPMODE_in 
// CHECK-NEXT: 1966 uext 56 635 0 OPMODE_mux 
// CHECK-NEXT: 1967 uext 56 633 0 OPMODE_reg 
// CHECK-NEXT: 1968 uext 23 73 0 PATTERN_REG 
// CHECK-NEXT: 1969 uext 23 74 0 PCIN_in 
// CHECK-NEXT: 1970 uext 25 955 0 PREADDINSEL_BIN 
// CHECK-NEXT: 1971 uext 206 952 0 PREADDINSEL_REG 
// CHECK-NEXT: 1972 uext 47 1131 0 PREADD_AB 
// CHECK-NEXT: 1973 uext 25 1490 0 PREG_BIN 
// CHECK-NEXT: 1974 uext 3 76 0 PREG_REG 
// CHECK-NEXT: 1975 uext 25 1377 0 P_FDBK_47_in 
// CHECK-NEXT: 1976 uext 23 538 0 P_FDBK_in 
// CHECK-NEXT: 1977 uext 23 77 0 RND_REG 
// CHECK-NEXT: 1978 neq 25 79 97
// CHECK-NEXT: 1979 xor 25 79 58
// CHECK-NEXT: 1980 and 25 1978 1979
// CHECK-NEXT: 1981 uext 25 1980 0 RSTALLCARRYIN_in 
// CHECK-NEXT: 1982 neq 25 80 97
// CHECK-NEXT: 1983 xor 25 80 59
// CHECK-NEXT: 1984 and 25 1982 1983
// CHECK-NEXT: 1985 uext 25 1984 0 RSTALUMODE_in 
// CHECK-NEXT: 1986 neq 25 78 97
// CHECK-NEXT: 1987 xor 25 78 60
// CHECK-NEXT: 1988 and 25 1986 1987
// CHECK-NEXT: 1989 uext 25 1988 0 RSTA_in 
// CHECK-NEXT: 1990 neq 25 81 97
// CHECK-NEXT: 1991 xor 25 81 61
// CHECK-NEXT: 1992 and 25 1990 1991
// CHECK-NEXT: 1993 uext 25 1992 0 RSTB_in 
// CHECK-NEXT: 1994 neq 25 83 97
// CHECK-NEXT: 1995 xor 25 83 62
// CHECK-NEXT: 1996 and 25 1994 1995
// CHECK-NEXT: 1997 uext 25 1996 0 RSTCTRL_in 
// CHECK-NEXT: 1998 neq 25 82 97
// CHECK-NEXT: 1999 xor 25 82 63
// CHECK-NEXT: 2000 and 25 1998 1999
// CHECK-NEXT: 2001 uext 25 2000 0 RSTC_in 
// CHECK-NEXT: 2002 neq 25 84 97
// CHECK-NEXT: 2003 xor 25 84 64
// CHECK-NEXT: 2004 and 25 2002 2003
// CHECK-NEXT: 2005 uext 25 2004 0 RSTD_in 
// CHECK-NEXT: 2006 neq 25 85 97
// CHECK-NEXT: 2007 xor 25 85 65
// CHECK-NEXT: 2008 and 25 2006 2007
// CHECK-NEXT: 2009 uext 25 2008 0 RSTINMODE_in 
// CHECK-NEXT: 2010 neq 25 86 97
// CHECK-NEXT: 2011 xor 25 86 66
// CHECK-NEXT: 2012 and 25 2010 2011
// CHECK-NEXT: 2013 uext 25 2012 0 RSTM_in 
// CHECK-NEXT: 2014 neq 25 87 97
// CHECK-NEXT: 2015 xor 25 87 67
// CHECK-NEXT: 2016 and 25 2014 2015
// CHECK-NEXT: 2017 uext 25 2016 0 RSTP_in 
// CHECK-NEXT: 2018 uext 103 1659 0 SEL_MASK_BIN 
// CHECK-NEXT: 2019 sort bitvec 112
// CHECK-NEXT: 2020 sort bitvec 107
// CHECK-NEXT: 2021 const 2020 00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
// CHECK-NEXT: 2022 concat 2019 2021 88
// CHECK-NEXT: 2023 uext 2019 2022 0 SEL_MASK_REG 
// CHECK-NEXT: 2024 uext 25 1538 0 SEL_PATTERN_BIN 
// CHECK-NEXT: 2025 concat 1849 1851 89
// CHECK-NEXT: 2026 uext 1849 2025 0 SEL_PATTERN_REG 
// CHECK-NEXT: 2027 uext 103 1101 0 USE_MULT_BIN 
// CHECK-NEXT: 2028 sort bitvec 64
// CHECK-NEXT: 2029 sort bitvec 59
// CHECK-NEXT: 2030 const 2029 00000000000000000000000000000000000000000000000000000000000
// CHECK-NEXT: 2031 concat 2028 2030 90
// CHECK-NEXT: 2032 uext 2028 2031 0 USE_MULT_REG 
// CHECK-NEXT: 2033 uext 25 1676 0 USE_PATTERN_DETECT_BIN 
// CHECK-NEXT: 2034 sort bitvec 72
// CHECK-NEXT: 2035 sort bitvec 67
// CHECK-NEXT: 2036 const 2035 0000000000000000000000000000000000000000000000000000000000000000000
// CHECK-NEXT: 2037 concat 2034 2036 91
// CHECK-NEXT: 2038 uext 2034 2037 0 USE_PATTERN_DETECT_REG 
// CHECK-NEXT: 2039 uext 103 417 0 USE_SIMD_BIN 
// CHECK-NEXT: 2040 const 515 0000000000000000000000000000000000000000000
// CHECK-NEXT: 2041 concat 23 2040 92
// CHECK-NEXT: 2042 uext 23 2041 0 USE_SIMD_REG 
// CHECK-NEXT: 2043 uext 25 1736 0 USE_WIDEXOR_BIN 
// CHECK-NEXT: 2044 concat 506 1844 93
// CHECK-NEXT: 2045 uext 506 2044 0 USE_WIDEXOR_REG 
// CHECK-NEXT: 2046 uext 521 1255 0 U_DATA 
// CHECK-NEXT: 2047 uext 521 1258 0 U_DATA_in 
// CHECK-NEXT: 2048 uext 521 1253 0 U_DATA_reg 
// CHECK-NEXT: 2049 uext 518 1245 0 U_in
// CHECK-NEXT: 2050 uext 521 1295 0 V_DATA 
// CHECK-NEXT: 2051 uext 521 1296 0 V_DATA_in 
// CHECK-NEXT: 2052 uext 521 1294 0 V_DATA_reg 
// CHECK-NEXT: 2053 uext 521 1287 0 V_in 
// CHECK-NEXT: 2054 uext 25 1748 0 XORSIMD_BIN 
// CHECK-NEXT: 2055 sort bitvec 88
// CHECK-NEXT: 2056 sort bitvec 83
// CHECK-NEXT: 2057 const 2056 00000000000000000000000000000000000000000000000000000000000000000000000000000000000
// CHECK-NEXT: 2058 concat 2055 2057 94
// CHECK-NEXT: 2059 uext 2055 2058 0 XORSIMD_REG 
// CHECK-NEXT: 2060 uext 206 1786 0 XOR_MX_in 
// CHECK-NEXT: 2061 uext 206 1793 0 XOR_MX_reg 
// CHECK-NEXT: 2062 sort bitvec 49
// CHECK-NEXT: 2063 concat 2062 1347 1468
// CHECK-NEXT: 2064 uext 2062 2063 0 a_int 
// CHECK-NEXT: 2065 uext 47 1146 0 a_mult_mux 
// CHECK-NEXT: 2066 not 25 1842
// CHECK-NEXT: 2067 or 25 2066 1920
// CHECK-NEXT: 2068 uext 25 2067 0 auto_reset_pri 
// CHECK-NEXT: 2069 uext 16 1184 0 b_mult_mux 
// CHECK-NEXT: 2070 uext 25 1404 0 c_mult 
// CHECK-NEXT: 2071 uext 25 1917 0 ce_m_g 
// CHECK-NEXT: 2072 uext 25 1468 0 cin 
// CHECK-NEXT: 2073 uext 25 1465 0 cin_b 
// CHECK-NEXT: 2074 uext 23 1309 0 co 
// CHECK-NEXT: 2075 uext 25 1369 0 co12_lsb 
// CHECK-NEXT: 2076 uext 25 1361 0 co24_lsb 
// CHECK-NEXT: 2077 uext 25 1349 0 co36_lsb 
// CHECK-NEXT: 2078 uext 23 1313 0 comux 
// CHECK-NEXT: 2079 slice 211 1313 10 0
// CHECK-NEXT: 2080 concat 213 1315 2079
// CHECK-NEXT: 2081 slice 211 1313 22 12
// CHECK-NEXT: 2082 concat 234 2081 2080
// CHECK-NEXT: 2083 concat 236 1317 2082
// CHECK-NEXT: 2084 slice 211 1313 34 24
// CHECK-NEXT: 2085 concat 491 2084 2083
// CHECK-NEXT: 2086 concat 494 1319 2085
// CHECK-NEXT: 2087 slice 213 1313 47 36
// CHECK-NEXT: 2088 concat 23 2087 2086
// CHECK-NEXT: 2089 uext 23 2088 0 comux4simd 
// CHECK-NEXT: 2090 uext 23 1347 0 comux_w 
// CHECK-NEXT: 2091 uext 25 1495 0 cout0 
// CHECK-NEXT: 2092 uext 25 1508 0 cout1 
// CHECK-NEXT: 2093 uext 25 1514 0 cout2 
// CHECK-NEXT: 2094 uext 25 1488 0 cout3 
// CHECK-NEXT: 2095 uext 25 1522 0 cout4 
// CHECK-NEXT: 2096 uext 25 1502 0 cout_0 
// CHECK-NEXT: 2097 uext 25 1509 0 cout_1 
// CHECK-NEXT: 2098 uext 25 1515 0 cout_2 
// CHECK-NEXT: 2099 uext 25 1488 0 cout_3 
// CHECK-NEXT: 2100 ite 25 1917 1404 1411
// CHECK-NEXT: 2101 uext 25 2100 0 d_carryin_int 
// CHECK-NEXT: 2102 ite 25 1980 248 2100
// CHECK-NEXT: 2103 uext 25 2102 0 dr_carryin_int 
// CHECK-NEXT: 2104 uext 25 248 0 glblGSR 
// CHECK-NEXT: 2105 uext 25 1476 0 intc1 
// CHECK-NEXT: 2106 uext 25 1480 0 intc2 
// CHECK-NEXT: 2107 uext 25 1484 0 intc3 
// CHECK-NEXT: 2108 uext 521 1241 0 mult 
// CHECK-NEXT: 2109 uext 25 1501 0 mult_or_logic 
// CHECK-NEXT: 2110 uext 25 1412 0 multcarryin_data 
// CHECK-NEXT: 2111 uext 25 97 0 opmode_valid_flag_dou 
// CHECK-NEXT: 2112 uext 25 1708 0 overflow_data 
// CHECK-NEXT: 2113 uext 25 1679 0 pdet_o 
// CHECK-NEXT: 2114 uext 25 1687 0 pdet_o_mux 
// CHECK-NEXT: 2115 uext 25 1686 0 pdet_o_reg1 
// CHECK-NEXT: 2116 uext 25 1707 0 pdet_o_reg2 
// CHECK-NEXT: 2117 uext 25 1690 0 pdetb_o 
// CHECK-NEXT: 2118 uext 25 1698 0 pdetb_o_mux 
// CHECK-NEXT: 2119 uext 25 1697 0 pdetb_o_reg1 
// CHECK-NEXT: 2120 uext 25 1723 0 pdetb_o_reg2 
// CHECK-NEXT: 2121 const 518 01010101010101010101010101010101010101010101
// CHECK-NEXT: 2122 uext 518 2121 0 ps_u_mask 
// CHECK-NEXT: 2123 uext 518 1283 0 ps_v_mask 
// CHECK-NEXT: 2124 uext 25 1411 0 qmultcarryin 
// CHECK-NEXT: 2125 uext 25 1980 0 rst_carryin_g 
// CHECK-NEXT: 2126 uext 23 1304 0 s 
// CHECK-NEXT: 2127 uext 215 1474 0 s0 
// CHECK-NEXT: 2128 uext 215 1478 0 s1 
// CHECK-NEXT: 2129 uext 215 1482 0 s2 
// CHECK-NEXT: 2130 uext 217 1486 0 s3 
// CHECK-NEXT: 2131 uext 23 1311 0 smux 
// CHECK-NEXT: 2132 uext 23 1354 0 smux_w 
// CHECK-NEXT: 2133 and 25 2067 1708
// CHECK-NEXT: 2134 and 25 2133 1688
// CHECK-NEXT: 2135 eq 25 1830 105
// CHECK-NEXT: 2136 ite 25 2135 2134 248
// CHECK-NEXT: 2137 and 25 2067 1687
// CHECK-NEXT: 2138 uext 103 97 1
// CHECK-NEXT: 2139 eq 25 1830 2138
// CHECK-NEXT: 2140 ite 25 2139 2137 2136
// CHECK-NEXT: 2141 uext 25 2140 0 the_auto_reset_patdet 
// CHECK-NEXT: 2142 uext 23 1677 0 the_mask 
// CHECK-NEXT: 2143 uext 23 1539 0 the_pattern 
// CHECK-NEXT: 2144 uext 25 1724 0 underflow_data 
// CHECK-NEXT: 2145 uext 23 1343 0 wmux 
// CHECK-NEXT: 2146 uext 103 1269 0 x_mac_cascd
// CHECK-NEXT: 2147 uext 23 1274 0 xmux 
// CHECK-NEXT: 2148 uext 25 1737 0 xor_12a 
// CHECK-NEXT: 2149 uext 25 1740 0 xor_12b 
// CHECK-NEXT: 2150 uext 25 1752 0 xor_12c 
// CHECK-NEXT: 2151 uext 25 1755 0 xor_12d 
// CHECK-NEXT: 2152 uext 25 1762 0 xor_12e 
// CHECK-NEXT: 2153 uext 25 1765 0 xor_12f 
// CHECK-NEXT: 2154 uext 25 1769 0 xor_12g 
// CHECK-NEXT: 2155 uext 25 1772 0 xor_12h 
// CHECK-NEXT: 2156 uext 25 1741 0 xor_24a 
// CHECK-NEXT: 2157 uext 25 1756 0 xor_24b 
// CHECK-NEXT: 2158 uext 25 1766 0 xor_24c 
// CHECK-NEXT: 2159 uext 25 1773 0 xor_24d 
// CHECK-NEXT: 2160 uext 25 1757 0 xor_48a 
// CHECK-NEXT: 2161 uext 25 1774 0 xor_48b 
// CHECK-NEXT: 2162 uext 25 1775 0 xor_96 
// CHECK-NEXT: 2163 uext 23 1303 0 ymux 
// CHECK-NEXT: 2164 uext 23 896 0 z_optinv 
// CHECK-NEXT: 2165 uext 23 895 0 zmux 
// CHECK-NEXT: 2166 next 1 95 107
// CHECK-NEXT: 2167 ite 1 1886 257 107
// CHECK-NEXT: 2168 const 1 000000000000000000000000000000
// CHECK-NEXT: 2169 redor 25 265
// CHECK-NEXT: 2170 not 25 2169
// CHECK-NEXT: 2171 or 25 1988 2170
// CHECK-NEXT: 2172 ite 1 2171 2168 2167
// CHECK-NEXT: 2173 next 1 96 2172
// CHECK-NEXT: 2174 next 25 98 102
// CHECK-NEXT: 2175 next 1 258 264
// CHECK-NEXT: 2176 eq 25 265 105
// CHECK-NEXT: 2177 ite 1 2176 107 257
// CHECK-NEXT: 2178 ite 1 1889 2177 264
// CHECK-NEXT: 2179 ite 1 2171 2168 2178
// CHECK-NEXT: 2180 next 1 259 2179
// CHECK-NEXT: 2181 next 25 260 102
// CHECK-NEXT: 2182 next 16 272 278
// CHECK-NEXT: 2183 ite 16 1898 356 278
// CHECK-NEXT: 2184 redor 25 364
// CHECK-NEXT: 2185 not 25 2184
// CHECK-NEXT: 2186 or 25 1992 2185
// CHECK-NEXT: 2187 ite 16 2186 1110 2183
// CHECK-NEXT: 2188 next 16 273 2187
// CHECK-NEXT: 2189 next 25 274 102
// CHECK-NEXT: 2190 next 16 357 363
// CHECK-NEXT: 2191 eq 25 364 105
// CHECK-NEXT: 2192 ite 16 2191 278 356
// CHECK-NEXT: 2193 ite 16 1901 2192 363
// CHECK-NEXT: 2194 ite 16 1992 1110 2193
// CHECK-NEXT: 2195 next 16 358 2194
// CHECK-NEXT: 2196 next 25 359 102
// CHECK-NEXT: 2197 next 7 394 400
// CHECK-NEXT: 2198 ite 7 1895 393 400
// CHECK-NEXT: 2199 const 7 0000
// CHECK-NEXT: 2200 ite 7 1984 2199 2198
// CHECK-NEXT: 2201 next 7 395 2200
// CHECK-NEXT: 2202 next 25 396 102
// CHECK-NEXT: 2203 next 23 532 538
// CHECK-NEXT: 2204 and 25 1920 1490
// CHECK-NEXT: 2205 ite 23 2204 1642 538
// CHECK-NEXT: 2206 or 25 2016 2140
// CHECK-NEXT: 2207 ite 23 2206 892 2205
// CHECK-NEXT: 2208 next 23 533 2207
// CHECK-NEXT: 2209 next 25 534 102
// CHECK-NEXT: 2210 next 56 627 633
// CHECK-NEXT: 2211 ite 56 1907 626 633
// CHECK-NEXT: 2212 const 56 000000000
// CHECK-NEXT: 2213 ite 56 1996 2212 2211
// CHECK-NEXT: 2214 next 56 628 2213
// CHECK-NEXT: 2215 next 25 629 102
// CHECK-NEXT: 2216 next 23 877 883
// CHECK-NEXT: 2217 ite 23 1910 876 883
// CHECK-NEXT: 2218 not 25 884
// CHECK-NEXT: 2219 or 25 2000 2218
// CHECK-NEXT: 2220 ite 23 2219 892 2217
// CHECK-NEXT: 2221 next 23 878 2220
// CHECK-NEXT: 2222 next 25 879 102
// CHECK-NEXT: 2223 next 10 936 942
// CHECK-NEXT: 2224 ite 10 42 935 942
// CHECK-NEXT: 2225 const 10 00000
// CHECK-NEXT: 2226 not 25 943
// CHECK-NEXT: 2227 or 25 2008 2226
// CHECK-NEXT: 2228 ite 10 2227 2225 2224
// CHECK-NEXT: 2229 next 10 937 2228
// CHECK-NEXT: 2230 next 25 938 102
// CHECK-NEXT: 2231 next 47 1067 1073
// CHECK-NEXT: 2232 ite 47 1913 1066 1073
// CHECK-NEXT: 2233 not 25 1104
// CHECK-NEXT: 2234 or 25 2004 2233
// CHECK-NEXT: 2235 ite 47 2234 947 2232
// CHECK-NEXT: 2236 next 47 1068 2235
// CHECK-NEXT: 2237 next 25 1069 102
// CHECK-NEXT: 2238 next 47 1136 1142
// CHECK-NEXT: 2239 ite 47 1892 1135 1142
// CHECK-NEXT: 2240 ite 47 2004 947 2239
// CHECK-NEXT: 2241 next 47 1137 2240
// CHECK-NEXT: 2242 next 25 1138 102
// CHECK-NEXT: 2243 next 521 1247 1253
// CHECK-NEXT: 2244 ite 521 1917 1246 1253
// CHECK-NEXT: 2245 not 25 1254
// CHECK-NEXT: 2246 or 25 2012 2245
// CHECK-NEXT: 2247 ite 521 2246 1240 2244
// CHECK-NEXT: 2248 next 521 1248 2247
// CHECK-NEXT: 2249 next 25 1249 102
// CHECK-NEXT: 2250 next 521 1288 1294
// CHECK-NEXT: 2251 ite 521 1917 1287 1294
// CHECK-NEXT: 2252 ite 521 2246 1240 2251
// CHECK-NEXT: 2253 next 521 1289 2252
// CHECK-NEXT: 2254 next 25 1290 102
// CHECK-NEXT: 2255 next 29 1390 1396
// CHECK-NEXT: 2256 ite 29 1907 1389 1396
// CHECK-NEXT: 2257 ite 29 1996 951 2256
// CHECK-NEXT: 2258 next 29 1391 2257
// CHECK-NEXT: 2259 next 25 1392 102
// CHECK-NEXT: 2260 next 25 1405 1411
// CHECK-NEXT: 2261 next 25 1406 2102
// CHECK-NEXT: 2262 next 25 1407 102
// CHECK-NEXT: 2263 next 25 1419 1425
// CHECK-NEXT: 2264 ite 25 2204 405 1425
// CHECK-NEXT: 2265 ite 25 2206 248 2264
// CHECK-NEXT: 2266 next 25 1420 2265
// CHECK-NEXT: 2267 next 25 1421 102
// CHECK-NEXT: 2268 next 7 1426 1432
// CHECK-NEXT: 2269 ite 7 2204 1519 1432
// CHECK-NEXT: 2270 ite 7 2206 2199 2269
// CHECK-NEXT: 2271 next 7 1427 2270
// CHECK-NEXT: 2272 next 25 1428 102
// CHECK-NEXT: 2273 next 25 1453 1459
// CHECK-NEXT: 2274 ite 25 1904 1452 1459
// CHECK-NEXT: 2275 ite 25 1980 248 2274
// CHECK-NEXT: 2276 next 25 1454 2275
// CHECK-NEXT: 2277 next 25 1455 102
// CHECK-NEXT: 2278 next 25 1523 1529
// CHECK-NEXT: 2279 ite 25 2204 1522 1529
// CHECK-NEXT: 2280 ite 25 2206 248 2279
// CHECK-NEXT: 2281 next 25 1524 2280
// CHECK-NEXT: 2282 next 25 1525 102
// CHECK-NEXT: 2283 next 25 1680 1686
// CHECK-NEXT: 2284 ite 25 2204 1679 1686
// CHECK-NEXT: 2285 ite 25 2206 248 2284
// CHECK-NEXT: 2286 next 25 1681 2285
// CHECK-NEXT: 2287 next 25 1682 102
// CHECK-NEXT: 2288 next 25 1691 1697
// CHECK-NEXT: 2289 ite 25 2204 1690 1697
// CHECK-NEXT: 2290 ite 25 2206 248 2289
// CHECK-NEXT: 2291 next 25 1692 2290
// CHECK-NEXT: 2292 next 25 1693 102
// CHECK-NEXT: 2293 next 25 1701 1707
// CHECK-NEXT: 2294 ite 25 2204 1686 1707
// CHECK-NEXT: 2295 ite 25 2206 248 2294
// CHECK-NEXT: 2296 next 25 1702 2295
// CHECK-NEXT: 2297 next 25 1703 102
// CHECK-NEXT: 2298 next 25 1717 1723
// CHECK-NEXT: 2299 ite 25 2204 1697 1723
// CHECK-NEXT: 2300 ite 25 2206 248 2299
// CHECK-NEXT: 2301 next 25 1718 2300
// CHECK-NEXT: 2302 next 25 1719 102
// CHECK-NEXT: 2303 next 206 1787 1793
// CHECK-NEXT: 2304 ite 206 2204 1786 1793
// CHECK-NEXT: 2305 const 206 00000000
// CHECK-NEXT: 2306 ite 206 2206 2305 2304
// CHECK-NEXT: 2307 next 206 1788 2306
// CHECK-NEXT: 2308 next 25 1789 102
// CHECK-NEXT: ; end of yosys output
