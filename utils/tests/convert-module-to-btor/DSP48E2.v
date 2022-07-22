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
  parameter [7:0] PREADDINSEL = A_ENUM_VAL,
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
// CHECK-NEXT: 10 sort bitvec 16
// CHECK-NEXT: 11 input 10 AMULTSEL 
// CHECK-NEXT: 12 input 3 AREG 
// CHECK-NEXT: 13 sort bitvec 120
// CHECK-NEXT: 14 input 13 AUTORESET_PATDET 
// CHECK-NEXT: 15 sort bitvec 40
// CHECK-NEXT: 16 input 15 AUTORESET_PRIORITY 
// CHECK-NEXT: 17 sort bitvec 56
// CHECK-NEXT: 18 input 17 A_INPUT 
// CHECK-NEXT: 19 sort bitvec 18
// CHECK-NEXT: 20 input 19 B 
// CHECK-NEXT: 21 input 3 BCASCREG 
// CHECK-NEXT: 22 input 19 BCIN 
// CHECK-NEXT: 23 input 10 BMULTSEL 
// CHECK-NEXT: 24 input 3 BREG 
// CHECK-NEXT: 25 input 17 B_INPUT 
// CHECK-NEXT: 26 sort bitvec 48
// CHECK-NEXT: 27 input 26 C 
// CHECK-NEXT: 28 sort bitvec 1
// CHECK-NEXT: 29 input 28 CARRYCASCIN 
// CHECK-NEXT: 30 input 28 CARRYIN 
// CHECK-NEXT: 31 input 3 CARRYINREG 
// CHECK-NEXT: 32 sort bitvec 3
// CHECK-NEXT: 33 input 32 CARRYINSEL 
// CHECK-NEXT: 34 input 3 CARRYINSELREG 
// CHECK-NEXT: 35 input 28 CEA1 
// CHECK-NEXT: 36 input 28 CEA2 
// CHECK-NEXT: 37 input 28 CEAD 
// CHECK-NEXT: 38 input 28 CEALUMODE 
// CHECK-NEXT: 39 input 28 CEB1 
// CHECK-NEXT: 40 input 28 CEB2 
// CHECK-NEXT: 41 input 28 CEC 
// CHECK-NEXT: 42 input 28 CECARRYIN 
// CHECK-NEXT: 43 input 28 CECTRL 
// CHECK-NEXT: 44 input 28 CED 
// CHECK-NEXT: 45 input 28 CEINMODE 
// CHECK-NEXT: 46 input 28 CEM 
// CHECK-NEXT: 47 input 28 CEP 
// CHECK-NEXT: 48 input 28 CLK 
// CHECK-NEXT: 49 input 3 CREG 
// CHECK-NEXT: 50 sort bitvec 27
// CHECK-NEXT: 51 input 50 D 
// CHECK-NEXT: 52 input 3 DREG 
// CHECK-NEXT: 53 sort bitvec 5
// CHECK-NEXT: 54 input 53 INMODE 
// CHECK-NEXT: 55 input 3 INMODEREG 
// CHECK-NEXT: 56 input 7 IS_ALUMODE_INVERTED 
// CHECK-NEXT: 57 input 28 IS_CARRYIN_INVERTED 
// CHECK-NEXT: 58 input 28 IS_CLK_INVERTED 
// CHECK-NEXT: 59 input 53 IS_INMODE_INVERTED 
// CHECK-NEXT: 60 sort bitvec 9
// CHECK-NEXT: 61 input 60 IS_OPMODE_INVERTED 
// CHECK-NEXT: 62 input 28 IS_RSTALLCARRYIN_INVERTED 
// CHECK-NEXT: 63 input 28 IS_RSTALUMODE_INVERTED 
// CHECK-NEXT: 64 input 28 IS_RSTA_INVERTED 
// CHECK-NEXT: 65 input 28 IS_RSTB_INVERTED 
// CHECK-NEXT: 66 input 28 IS_RSTCTRL_INVERTED 
// CHECK-NEXT: 67 input 28 IS_RSTC_INVERTED 
// CHECK-NEXT: 68 input 28 IS_RSTD_INVERTED 
// CHECK-NEXT: 69 input 28 IS_RSTINMODE_INVERTED 
// CHECK-NEXT: 70 input 28 IS_RSTM_INVERTED 
// CHECK-NEXT: 71 input 28 IS_RSTP_INVERTED 
// CHECK-NEXT: 72 input 26 MASK 
// CHECK-NEXT: 73 input 3 MREG 
// CHECK-NEXT: 74 input 28 MULTSIGNIN 
// CHECK-NEXT: 75 input 60 OPMODE 
// CHECK-NEXT: 76 input 3 OPMODEREG 
// CHECK-NEXT: 77 input 26 PATTERN 
// CHECK-NEXT: 78 input 26 PCIN 
// CHECK-NEXT: 79 sort bitvec 8
// CHECK-NEXT: 80 input 79 PREADDINSEL 
// CHECK-NEXT: 81 input 3 PREG 
// CHECK-NEXT: 82 input 26 RND 
// CHECK-NEXT: 83 input 28 RSTA 
// CHECK-NEXT: 84 input 28 RSTALLCARRYIN 
// CHECK-NEXT: 85 input 28 RSTALUMODE 
// CHECK-NEXT: 86 input 28 RSTB 
// CHECK-NEXT: 87 input 28 RSTC 
// CHECK-NEXT: 88 input 28 RSTCTRL 
// CHECK-NEXT: 89 input 28 RSTD 
// CHECK-NEXT: 90 input 28 RSTINMODE 
// CHECK-NEXT: 91 input 28 RSTM 
// CHECK-NEXT: 92 input 28 RSTP 
// CHECK-NEXT: 93 sort bitvec 112
// CHECK-NEXT: 94 input 93 SEL_MASK 
// CHECK-NEXT: 95 input 17 SEL_PATTERN 
// CHECK-NEXT: 96 sort bitvec 64
// CHECK-NEXT: 97 input 96 USE_MULT 
// CHECK-NEXT: 98 sort bitvec 72
// CHECK-NEXT: 99 input 98 USE_PATTERN_DETECT 
// CHECK-NEXT: 100 input 26 USE_SIMD 
// CHECK-NEXT: 101 input 15 USE_WIDEXOR 
// CHECK-NEXT: 102 sort bitvec 88
// CHECK-NEXT: 103 input 102 XORSIMD 
// CHECK-NEXT: 104 state 1
// CHECK-NEXT: 105 state 1
// CHECK-NEXT: 106 const 28 1
// CHECK-NEXT: 107 state 28
// CHECK-NEXT: 108 init 28 107 106
// CHECK-NEXT: 109 neq 28 48 106
// CHECK-NEXT: 110 xor 28 48 58
// CHECK-NEXT: 111 and 28 109 110
// CHECK-NEXT: 112 sort bitvec 2
// CHECK-NEXT: 113 concat 112 111 107
// CHECK-NEXT: 114 const 112 10
// CHECK-NEXT: 115 eq 28 113 114
// CHECK-NEXT: 116 ite 1 115 105 104
// CHECK-NEXT: 117 slice 28 2 0 0
// CHECK-NEXT: 118 eq 28 117 106
// CHECK-NEXT: 119 or 28 118 117
// CHECK-NEXT: 120 slice 28 2 1 1
// CHECK-NEXT: 121 eq 28 120 106
// CHECK-NEXT: 122 or 28 121 120
// CHECK-NEXT: 123 slice 28 2 2 2
// CHECK-NEXT: 124 eq 28 123 106
// CHECK-NEXT: 125 or 28 124 123
// CHECK-NEXT: 126 slice 28 2 3 3
// CHECK-NEXT: 127 eq 28 126 106
// CHECK-NEXT: 128 or 28 127 126
// CHECK-NEXT: 129 slice 28 2 4 4
// CHECK-NEXT: 130 eq 28 129 106
// CHECK-NEXT: 131 or 28 130 129
// CHECK-NEXT: 132 slice 28 2 5 5
// CHECK-NEXT: 133 eq 28 132 106
// CHECK-NEXT: 134 or 28 133 132
// CHECK-NEXT: 135 slice 28 2 6 6
// CHECK-NEXT: 136 eq 28 135 106
// CHECK-NEXT: 137 or 28 136 135
// CHECK-NEXT: 138 slice 28 2 7 7
// CHECK-NEXT: 139 eq 28 138 106
// CHECK-NEXT: 140 or 28 139 138
// CHECK-NEXT: 141 slice 28 2 8 8
// CHECK-NEXT: 142 eq 28 141 106
// CHECK-NEXT: 143 or 28 142 141
// CHECK-NEXT: 144 slice 28 2 9 9
// CHECK-NEXT: 145 eq 28 144 106
// CHECK-NEXT: 146 or 28 145 144
// CHECK-NEXT: 147 slice 28 2 10 10
// CHECK-NEXT: 148 eq 28 147 106
// CHECK-NEXT: 149 or 28 148 147
// CHECK-NEXT: 150 slice 28 2 11 11
// CHECK-NEXT: 151 eq 28 150 106
// CHECK-NEXT: 152 or 28 151 150
// CHECK-NEXT: 153 slice 28 2 12 12
// CHECK-NEXT: 154 eq 28 153 106
// CHECK-NEXT: 155 or 28 154 153
// CHECK-NEXT: 156 slice 28 2 13 13
// CHECK-NEXT: 157 eq 28 156 106
// CHECK-NEXT: 158 or 28 157 156
// CHECK-NEXT: 159 slice 28 2 14 14
// CHECK-NEXT: 160 eq 28 159 106
// CHECK-NEXT: 161 or 28 160 159
// CHECK-NEXT: 162 slice 28 2 15 15
// CHECK-NEXT: 163 eq 28 162 106
// CHECK-NEXT: 164 or 28 163 162
// CHECK-NEXT: 165 slice 28 2 16 16
// CHECK-NEXT: 166 eq 28 165 106
// CHECK-NEXT: 167 or 28 166 165
// CHECK-NEXT: 168 slice 28 2 17 17
// CHECK-NEXT: 169 eq 28 168 106
// CHECK-NEXT: 170 or 28 169 168
// CHECK-NEXT: 171 slice 28 2 18 18
// CHECK-NEXT: 172 eq 28 171 106
// CHECK-NEXT: 173 or 28 172 171
// CHECK-NEXT: 174 slice 28 2 19 19
// CHECK-NEXT: 175 eq 28 174 106
// CHECK-NEXT: 176 or 28 175 174
// CHECK-NEXT: 177 slice 28 2 20 20
// CHECK-NEXT: 178 eq 28 177 106
// CHECK-NEXT: 179 or 28 178 177
// CHECK-NEXT: 180 slice 28 2 21 21
// CHECK-NEXT: 181 eq 28 180 106
// CHECK-NEXT: 182 or 28 181 180
// CHECK-NEXT: 183 slice 28 2 22 22
// CHECK-NEXT: 184 eq 28 183 106
// CHECK-NEXT: 185 or 28 184 183
// CHECK-NEXT: 186 slice 28 2 23 23
// CHECK-NEXT: 187 eq 28 186 106
// CHECK-NEXT: 188 or 28 187 186
// CHECK-NEXT: 189 slice 28 2 24 24
// CHECK-NEXT: 190 eq 28 189 106
// CHECK-NEXT: 191 or 28 190 189
// CHECK-NEXT: 192 slice 28 2 25 25
// CHECK-NEXT: 193 eq 28 192 106
// CHECK-NEXT: 194 or 28 193 192
// CHECK-NEXT: 195 slice 28 2 26 26
// CHECK-NEXT: 196 eq 28 195 106
// CHECK-NEXT: 197 or 28 196 195
// CHECK-NEXT: 198 slice 28 2 27 27
// CHECK-NEXT: 199 eq 28 198 106
// CHECK-NEXT: 200 or 28 199 198
// CHECK-NEXT: 201 slice 28 2 28 28
// CHECK-NEXT: 202 eq 28 201 106
// CHECK-NEXT: 203 or 28 202 201
// CHECK-NEXT: 204 slice 28 2 29 29
// CHECK-NEXT: 205 eq 28 204 106
// CHECK-NEXT: 206 or 28 205 204
// CHECK-NEXT: 207 concat 112 122 119
// CHECK-NEXT: 208 concat 32 125 207
// CHECK-NEXT: 209 concat 7 128 208
// CHECK-NEXT: 210 concat 53 131 209
// CHECK-NEXT: 211 sort bitvec 6
// CHECK-NEXT: 212 concat 211 134 210
// CHECK-NEXT: 213 sort bitvec 7
// CHECK-NEXT: 214 concat 213 137 212
// CHECK-NEXT: 215 concat 79 140 214
// CHECK-NEXT: 216 concat 60 143 215
// CHECK-NEXT: 217 sort bitvec 10
// CHECK-NEXT: 218 concat 217 146 216
// CHECK-NEXT: 219 sort bitvec 11
// CHECK-NEXT: 220 concat 219 149 218
// CHECK-NEXT: 221 sort bitvec 12
// CHECK-NEXT: 222 concat 221 152 220
// CHECK-NEXT: 223 sort bitvec 13
// CHECK-NEXT: 224 concat 223 155 222
// CHECK-NEXT: 225 sort bitvec 14
// CHECK-NEXT: 226 concat 225 158 224
// CHECK-NEXT: 227 sort bitvec 15
// CHECK-NEXT: 228 concat 227 161 226
// CHECK-NEXT: 229 concat 10 164 228
// CHECK-NEXT: 230 sort bitvec 17
// CHECK-NEXT: 231 concat 230 167 229
// CHECK-NEXT: 232 concat 19 170 231
// CHECK-NEXT: 233 sort bitvec 19
// CHECK-NEXT: 234 concat 233 173 232
// CHECK-NEXT: 235 sort bitvec 20
// CHECK-NEXT: 236 concat 235 176 234
// CHECK-NEXT: 237 sort bitvec 21
// CHECK-NEXT: 238 concat 237 179 236
// CHECK-NEXT: 239 sort bitvec 22
// CHECK-NEXT: 240 concat 239 182 238
// CHECK-NEXT: 241 sort bitvec 23
// CHECK-NEXT: 242 concat 241 185 240
// CHECK-NEXT: 243 sort bitvec 24
// CHECK-NEXT: 244 concat 243 188 242
// CHECK-NEXT: 245 sort bitvec 25
// CHECK-NEXT: 246 concat 245 191 244
// CHECK-NEXT: 247 sort bitvec 26
// CHECK-NEXT: 248 concat 247 194 246
// CHECK-NEXT: 249 concat 50 197 248
// CHECK-NEXT: 250 sort bitvec 28
// CHECK-NEXT: 251 concat 250 200 249
// CHECK-NEXT: 252 sort bitvec 29
// CHECK-NEXT: 253 concat 252 203 251
// CHECK-NEXT: 254 concat 1 206 253
// CHECK-NEXT: 255 const 28 0
// CHECK-NEXT: 256 sort bitvec 55
// CHECK-NEXT: 257 const 256 1000011010000010101001101000011010000010100010001000101
// CHECK-NEXT: 258 uext 17 257 1
// CHECK-NEXT: 259 eq 28 18 258
// CHECK-NEXT: 260 ite 28 259 106 255
// CHECK-NEXT: 261 sort bitvec 47
// CHECK-NEXT: 262 const 261 10001000100100101010010010001010100001101010100
// CHECK-NEXT: 263 uext 17 262 9
// CHECK-NEXT: 264 eq 28 18 263
// CHECK-NEXT: 265 ite 28 264 255 260
// CHECK-NEXT: 266 ite 1 265 5 254
// CHECK-NEXT: 267 state 1
// CHECK-NEXT: 268 state 1
// CHECK-NEXT: 269 state 28
// CHECK-NEXT: 270 init 28 269 106
// CHECK-NEXT: 271 concat 112 111 269
// CHECK-NEXT: 272 eq 28 271 114
// CHECK-NEXT: 273 ite 1 272 268 267
// CHECK-NEXT: 274 slice 112 12 1 0
// CHECK-NEXT: 275 redor 28 274
// CHECK-NEXT: 276 ite 1 275 273 266
// CHECK-NEXT: 277 slice 112 4 1 0
// CHECK-NEXT: 278 eq 28 277 274
// CHECK-NEXT: 279 ite 1 278 276 116
// CHECK-NEXT: 280 output 279 ACOUT 
// CHECK-NEXT: 281 state 19
// CHECK-NEXT: 282 state 19
// CHECK-NEXT: 283 state 28
// CHECK-NEXT: 284 init 28 283 106
// CHECK-NEXT: 285 concat 112 111 283
// CHECK-NEXT: 286 eq 28 285 114
// CHECK-NEXT: 287 ite 19 286 282 281
// CHECK-NEXT: 288 slice 28 20 0 0
// CHECK-NEXT: 289 eq 28 288 106
// CHECK-NEXT: 290 or 28 289 288
// CHECK-NEXT: 291 slice 28 20 1 1
// CHECK-NEXT: 292 eq 28 291 106
// CHECK-NEXT: 293 or 28 292 291
// CHECK-NEXT: 294 slice 28 20 2 2
// CHECK-NEXT: 295 eq 28 294 106
// CHECK-NEXT: 296 or 28 295 294
// CHECK-NEXT: 297 slice 28 20 3 3
// CHECK-NEXT: 298 eq 28 297 106
// CHECK-NEXT: 299 or 28 298 297
// CHECK-NEXT: 300 slice 28 20 4 4
// CHECK-NEXT: 301 eq 28 300 106
// CHECK-NEXT: 302 or 28 301 300
// CHECK-NEXT: 303 slice 28 20 5 5
// CHECK-NEXT: 304 eq 28 303 106
// CHECK-NEXT: 305 or 28 304 303
// CHECK-NEXT: 306 slice 28 20 6 6
// CHECK-NEXT: 307 eq 28 306 106
// CHECK-NEXT: 308 or 28 307 306
// CHECK-NEXT: 309 slice 28 20 7 7
// CHECK-NEXT: 310 eq 28 309 106
// CHECK-NEXT: 311 or 28 310 309
// CHECK-NEXT: 312 slice 28 20 8 8
// CHECK-NEXT: 313 eq 28 312 106
// CHECK-NEXT: 314 or 28 313 312
// CHECK-NEXT: 315 slice 28 20 9 9
// CHECK-NEXT: 316 eq 28 315 106
// CHECK-NEXT: 317 or 28 316 315
// CHECK-NEXT: 318 slice 28 20 10 10
// CHECK-NEXT: 319 eq 28 318 106
// CHECK-NEXT: 320 or 28 319 318
// CHECK-NEXT: 321 slice 28 20 11 11
// CHECK-NEXT: 322 eq 28 321 106
// CHECK-NEXT: 323 or 28 322 321
// CHECK-NEXT: 324 slice 28 20 12 12
// CHECK-NEXT: 325 eq 28 324 106
// CHECK-NEXT: 326 or 28 325 324
// CHECK-NEXT: 327 slice 28 20 13 13
// CHECK-NEXT: 328 eq 28 327 106
// CHECK-NEXT: 329 or 28 328 327
// CHECK-NEXT: 330 slice 28 20 14 14
// CHECK-NEXT: 331 eq 28 330 106
// CHECK-NEXT: 332 or 28 331 330
// CHECK-NEXT: 333 slice 28 20 15 15
// CHECK-NEXT: 334 eq 28 333 106
// CHECK-NEXT: 335 or 28 334 333
// CHECK-NEXT: 336 slice 28 20 16 16
// CHECK-NEXT: 337 eq 28 336 106
// CHECK-NEXT: 338 or 28 337 336
// CHECK-NEXT: 339 slice 28 20 17 17
// CHECK-NEXT: 340 eq 28 339 106
// CHECK-NEXT: 341 or 28 340 339
// CHECK-NEXT: 342 concat 112 293 290
// CHECK-NEXT: 343 concat 32 296 342
// CHECK-NEXT: 344 concat 7 299 343
// CHECK-NEXT: 345 concat 53 302 344
// CHECK-NEXT: 346 concat 211 305 345
// CHECK-NEXT: 347 concat 213 308 346
// CHECK-NEXT: 348 concat 79 311 347
// CHECK-NEXT: 349 concat 60 314 348
// CHECK-NEXT: 350 concat 217 317 349
// CHECK-NEXT: 351 concat 219 320 350
// CHECK-NEXT: 352 concat 221 323 351
// CHECK-NEXT: 353 concat 223 326 352
// CHECK-NEXT: 354 concat 225 329 353
// CHECK-NEXT: 355 concat 227 332 354
// CHECK-NEXT: 356 concat 10 335 355
// CHECK-NEXT: 357 concat 230 338 356
// CHECK-NEXT: 358 concat 19 341 357
// CHECK-NEXT: 359 uext 17 257 1
// CHECK-NEXT: 360 eq 28 25 359
// CHECK-NEXT: 361 ite 28 360 106 255
// CHECK-NEXT: 362 uext 17 262 9
// CHECK-NEXT: 363 eq 28 25 362
// CHECK-NEXT: 364 ite 28 363 255 361
// CHECK-NEXT: 365 ite 19 364 22 358
// CHECK-NEXT: 366 state 19
// CHECK-NEXT: 367 state 19
// CHECK-NEXT: 368 state 28
// CHECK-NEXT: 369 init 28 368 106
// CHECK-NEXT: 370 concat 112 111 368
// CHECK-NEXT: 371 eq 28 370 114
// CHECK-NEXT: 372 ite 19 371 367 366
// CHECK-NEXT: 373 slice 112 24 1 0
// CHECK-NEXT: 374 redor 28 373
// CHECK-NEXT: 375 ite 19 374 372 365
// CHECK-NEXT: 376 slice 112 21 1 0
// CHECK-NEXT: 377 eq 28 376 373
// CHECK-NEXT: 378 ite 19 377 375 287
// CHECK-NEXT: 379 output 378 BCOUT 
// CHECK-NEXT: 380 slice 28 8 0 0
// CHECK-NEXT: 381 neq 28 380 106
// CHECK-NEXT: 382 slice 28 56 0 0
// CHECK-NEXT: 383 xor 28 380 382
// CHECK-NEXT: 384 and 28 381 383
// CHECK-NEXT: 385 slice 28 8 1 1
// CHECK-NEXT: 386 neq 28 385 106
// CHECK-NEXT: 387 slice 28 56 1 1
// CHECK-NEXT: 388 xor 28 385 387
// CHECK-NEXT: 389 and 28 386 388
// CHECK-NEXT: 390 slice 28 8 2 2
// CHECK-NEXT: 391 neq 28 390 106
// CHECK-NEXT: 392 slice 28 56 2 2
// CHECK-NEXT: 393 xor 28 390 392
// CHECK-NEXT: 394 and 28 391 393
// CHECK-NEXT: 395 slice 28 8 3 3
// CHECK-NEXT: 396 neq 28 395 106
// CHECK-NEXT: 397 slice 28 56 3 3
// CHECK-NEXT: 398 xor 28 395 397
// CHECK-NEXT: 399 and 28 396 398
// CHECK-NEXT: 400 concat 112 389 384
// CHECK-NEXT: 401 concat 32 394 400
// CHECK-NEXT: 402 concat 7 399 401
// CHECK-NEXT: 403 state 7
// CHECK-NEXT: 404 state 7
// CHECK-NEXT: 405 state 28
// CHECK-NEXT: 406 init 28 405 106
// CHECK-NEXT: 407 concat 112 111 405
// CHECK-NEXT: 408 eq 28 407 114
// CHECK-NEXT: 409 ite 7 408 404 403
// CHECK-NEXT: 410 slice 28 9 0 0
// CHECK-NEXT: 411 ite 7 410 409 402
// CHECK-NEXT: 412 slice 28 411 0 0
// CHECK-NEXT: 413 slice 28 411 1 1
// CHECK-NEXT: 414 and 28 412 413
// CHECK-NEXT: 415 const 112 00
// CHECK-NEXT: 416 sort bitvec 39
// CHECK-NEXT: 417 const 416 101010001010111010011110011001000110100
// CHECK-NEXT: 418 uext 26 417 9
// CHECK-NEXT: 419 eq 28 100 418
// CHECK-NEXT: 420 ite 112 419 114 415
// CHECK-NEXT: 421 const 112 01
// CHECK-NEXT: 422 const 261 10001100100111101010101010100100011000100110010
// CHECK-NEXT: 423 uext 26 422 1
// CHECK-NEXT: 424 eq 28 100 423
// CHECK-NEXT: 425 ite 112 424 421 420
// CHECK-NEXT: 426 const 416 100111101001110010001010011010000111000
// CHECK-NEXT: 427 uext 26 426 9
// CHECK-NEXT: 428 eq 28 100 427
// CHECK-NEXT: 429 ite 112 428 415 425
// CHECK-NEXT: 430 uext 112 106 1
// CHECK-NEXT: 431 neq 28 429 430
// CHECK-NEXT: 432 slice 28 411 0 0
// CHECK-NEXT: 433 slice 28 411 0 0
// CHECK-NEXT: 434 concat 112 433 432
// CHECK-NEXT: 435 slice 28 411 0 0
// CHECK-NEXT: 436 concat 32 435 434
// CHECK-NEXT: 437 slice 28 411 0 0
// CHECK-NEXT: 438 concat 7 437 436
// CHECK-NEXT: 439 slice 28 411 0 0
// CHECK-NEXT: 440 concat 53 439 438
// CHECK-NEXT: 441 slice 28 411 0 0
// CHECK-NEXT: 442 concat 211 441 440
// CHECK-NEXT: 443 slice 28 411 0 0
// CHECK-NEXT: 444 concat 213 443 442
// CHECK-NEXT: 445 slice 28 411 0 0
// CHECK-NEXT: 446 concat 79 445 444
// CHECK-NEXT: 447 slice 28 411 0 0
// CHECK-NEXT: 448 concat 60 447 446
// CHECK-NEXT: 449 slice 28 411 0 0
// CHECK-NEXT: 450 concat 217 449 448
// CHECK-NEXT: 451 slice 28 411 0 0
// CHECK-NEXT: 452 concat 219 451 450
// CHECK-NEXT: 453 slice 28 411 0 0
// CHECK-NEXT: 454 concat 221 453 452
// CHECK-NEXT: 455 slice 28 411 0 0
// CHECK-NEXT: 456 concat 223 455 454
// CHECK-NEXT: 457 slice 28 411 0 0
// CHECK-NEXT: 458 concat 225 457 456
// CHECK-NEXT: 459 slice 28 411 0 0
// CHECK-NEXT: 460 concat 227 459 458
// CHECK-NEXT: 461 slice 28 411 0 0
// CHECK-NEXT: 462 concat 10 461 460
// CHECK-NEXT: 463 slice 28 411 0 0
// CHECK-NEXT: 464 concat 230 463 462
// CHECK-NEXT: 465 slice 28 411 0 0
// CHECK-NEXT: 466 concat 19 465 464
// CHECK-NEXT: 467 slice 28 411 0 0
// CHECK-NEXT: 468 concat 233 467 466
// CHECK-NEXT: 469 slice 28 411 0 0
// CHECK-NEXT: 470 concat 235 469 468
// CHECK-NEXT: 471 slice 28 411 0 0
// CHECK-NEXT: 472 concat 237 471 470
// CHECK-NEXT: 473 slice 28 411 0 0
// CHECK-NEXT: 474 concat 239 473 472
// CHECK-NEXT: 475 slice 28 411 0 0
// CHECK-NEXT: 476 concat 241 475 474
// CHECK-NEXT: 477 slice 28 411 0 0
// CHECK-NEXT: 478 concat 243 477 476
// CHECK-NEXT: 479 slice 28 411 0 0
// CHECK-NEXT: 480 concat 245 479 478
// CHECK-NEXT: 481 slice 28 411 0 0
// CHECK-NEXT: 482 concat 247 481 480
// CHECK-NEXT: 483 slice 28 411 0 0
// CHECK-NEXT: 484 concat 50 483 482
// CHECK-NEXT: 485 slice 28 411 0 0
// CHECK-NEXT: 486 concat 250 485 484
// CHECK-NEXT: 487 slice 28 411 0 0
// CHECK-NEXT: 488 concat 252 487 486
// CHECK-NEXT: 489 slice 28 411 0 0
// CHECK-NEXT: 490 concat 1 489 488
// CHECK-NEXT: 491 slice 28 411 0 0
// CHECK-NEXT: 492 sort bitvec 31
// CHECK-NEXT: 493 concat 492 491 490
// CHECK-NEXT: 494 slice 28 411 0 0
// CHECK-NEXT: 495 concat 3 494 493
// CHECK-NEXT: 496 slice 28 411 0 0
// CHECK-NEXT: 497 sort bitvec 33
// CHECK-NEXT: 498 concat 497 496 495
// CHECK-NEXT: 499 slice 28 411 0 0
// CHECK-NEXT: 500 sort bitvec 34
// CHECK-NEXT: 501 concat 500 499 498
// CHECK-NEXT: 502 slice 28 411 0 0
// CHECK-NEXT: 503 sort bitvec 35
// CHECK-NEXT: 504 concat 503 502 501
// CHECK-NEXT: 505 slice 28 411 0 0
// CHECK-NEXT: 506 sort bitvec 36
// CHECK-NEXT: 507 concat 506 505 504
// CHECK-NEXT: 508 slice 28 411 0 0
// CHECK-NEXT: 509 sort bitvec 37
// CHECK-NEXT: 510 concat 509 508 507
// CHECK-NEXT: 511 slice 28 411 0 0
// CHECK-NEXT: 512 sort bitvec 38
// CHECK-NEXT: 513 concat 512 511 510
// CHECK-NEXT: 514 slice 28 411 0 0
// CHECK-NEXT: 515 concat 416 514 513
// CHECK-NEXT: 516 slice 28 411 0 0
// CHECK-NEXT: 517 concat 15 516 515
// CHECK-NEXT: 518 slice 28 411 0 0
// CHECK-NEXT: 519 sort bitvec 41
// CHECK-NEXT: 520 concat 519 518 517
// CHECK-NEXT: 521 slice 28 411 0 0
// CHECK-NEXT: 522 sort bitvec 42
// CHECK-NEXT: 523 concat 522 521 520
// CHECK-NEXT: 524 slice 28 411 0 0
// CHECK-NEXT: 525 sort bitvec 43
// CHECK-NEXT: 526 concat 525 524 523
// CHECK-NEXT: 527 slice 28 411 0 0
// CHECK-NEXT: 528 sort bitvec 44
// CHECK-NEXT: 529 concat 528 527 526
// CHECK-NEXT: 530 slice 28 411 0 0
// CHECK-NEXT: 531 sort bitvec 45
// CHECK-NEXT: 532 concat 531 530 529
// CHECK-NEXT: 533 slice 28 411 0 0
// CHECK-NEXT: 534 sort bitvec 46
// CHECK-NEXT: 535 concat 534 533 532
// CHECK-NEXT: 536 slice 28 411 0 0
// CHECK-NEXT: 537 concat 261 536 535
// CHECK-NEXT: 538 slice 28 411 0 0
// CHECK-NEXT: 539 concat 26 538 537
// CHECK-NEXT: 540 input 26
// CHECK-NEXT: 541 state 26
// CHECK-NEXT: 542 state 26
// CHECK-NEXT: 543 state 28
// CHECK-NEXT: 544 init 28 543 106
// CHECK-NEXT: 545 concat 112 111 543
// CHECK-NEXT: 546 eq 28 545 114
// CHECK-NEXT: 547 ite 26 546 542 541
// CHECK-NEXT: 548 slice 492 547 47 17
// CHECK-NEXT: 549 slice 28 547 47 47
// CHECK-NEXT: 550 concat 3 549 548
// CHECK-NEXT: 551 slice 28 547 47 47
// CHECK-NEXT: 552 concat 497 551 550
// CHECK-NEXT: 553 slice 28 547 47 47
// CHECK-NEXT: 554 concat 500 553 552
// CHECK-NEXT: 555 slice 28 547 47 47
// CHECK-NEXT: 556 concat 503 555 554
// CHECK-NEXT: 557 slice 28 547 47 47
// CHECK-NEXT: 558 concat 506 557 556
// CHECK-NEXT: 559 slice 28 547 47 47
// CHECK-NEXT: 560 concat 509 559 558
// CHECK-NEXT: 561 slice 28 547 47 47
// CHECK-NEXT: 562 concat 512 561 560
// CHECK-NEXT: 563 slice 28 547 47 47
// CHECK-NEXT: 564 concat 416 563 562
// CHECK-NEXT: 565 slice 28 547 47 47
// CHECK-NEXT: 566 concat 15 565 564
// CHECK-NEXT: 567 slice 28 547 47 47
// CHECK-NEXT: 568 concat 519 567 566
// CHECK-NEXT: 569 slice 28 547 47 47
// CHECK-NEXT: 570 concat 522 569 568
// CHECK-NEXT: 571 slice 28 547 47 47
// CHECK-NEXT: 572 concat 525 571 570
// CHECK-NEXT: 573 slice 28 547 47 47
// CHECK-NEXT: 574 concat 528 573 572
// CHECK-NEXT: 575 slice 28 547 47 47
// CHECK-NEXT: 576 concat 531 575 574
// CHECK-NEXT: 577 slice 28 547 47 47
// CHECK-NEXT: 578 concat 534 577 576
// CHECK-NEXT: 579 slice 28 547 47 47
// CHECK-NEXT: 580 concat 261 579 578
// CHECK-NEXT: 581 slice 28 547 47 47
// CHECK-NEXT: 582 concat 26 581 580
// CHECK-NEXT: 583 slice 28 75 0 0
// CHECK-NEXT: 584 neq 28 583 106
// CHECK-NEXT: 585 slice 28 61 0 0
// CHECK-NEXT: 586 xor 28 583 585
// CHECK-NEXT: 587 and 28 584 586
// CHECK-NEXT: 588 slice 28 75 1 1
// CHECK-NEXT: 589 neq 28 588 106
// CHECK-NEXT: 590 slice 28 61 1 1
// CHECK-NEXT: 591 xor 28 588 590
// CHECK-NEXT: 592 and 28 589 591
// CHECK-NEXT: 593 slice 28 75 2 2
// CHECK-NEXT: 594 neq 28 593 106
// CHECK-NEXT: 595 slice 28 61 2 2
// CHECK-NEXT: 596 xor 28 593 595
// CHECK-NEXT: 597 and 28 594 596
// CHECK-NEXT: 598 slice 28 75 3 3
// CHECK-NEXT: 599 neq 28 598 106
// CHECK-NEXT: 600 slice 28 61 3 3
// CHECK-NEXT: 601 xor 28 598 600
// CHECK-NEXT: 602 and 28 599 601
// CHECK-NEXT: 603 slice 28 75 4 4
// CHECK-NEXT: 604 neq 28 603 106
// CHECK-NEXT: 605 slice 28 61 4 4
// CHECK-NEXT: 606 xor 28 603 605
// CHECK-NEXT: 607 and 28 604 606
// CHECK-NEXT: 608 slice 28 75 5 5
// CHECK-NEXT: 609 neq 28 608 106
// CHECK-NEXT: 610 slice 28 61 5 5
// CHECK-NEXT: 611 xor 28 608 610
// CHECK-NEXT: 612 and 28 609 611
// CHECK-NEXT: 613 slice 28 75 6 6
// CHECK-NEXT: 614 neq 28 613 106
// CHECK-NEXT: 615 slice 28 61 6 6
// CHECK-NEXT: 616 xor 28 613 615
// CHECK-NEXT: 617 and 28 614 616
// CHECK-NEXT: 618 slice 28 75 7 7
// CHECK-NEXT: 619 neq 28 618 106
// CHECK-NEXT: 620 slice 28 61 7 7
// CHECK-NEXT: 621 xor 28 618 620
// CHECK-NEXT: 622 and 28 619 621
// CHECK-NEXT: 623 slice 28 75 8 8
// CHECK-NEXT: 624 neq 28 623 106
// CHECK-NEXT: 625 slice 28 61 8 8
// CHECK-NEXT: 626 xor 28 623 625
// CHECK-NEXT: 627 and 28 624 626
// CHECK-NEXT: 628 concat 112 592 587
// CHECK-NEXT: 629 concat 32 597 628
// CHECK-NEXT: 630 concat 7 602 629
// CHECK-NEXT: 631 concat 53 607 630
// CHECK-NEXT: 632 concat 211 612 631
// CHECK-NEXT: 633 concat 213 617 632
// CHECK-NEXT: 634 concat 79 622 633
// CHECK-NEXT: 635 concat 60 627 634
// CHECK-NEXT: 636 state 60
// CHECK-NEXT: 637 state 60
// CHECK-NEXT: 638 state 28
// CHECK-NEXT: 639 init 28 638 106
// CHECK-NEXT: 640 concat 112 111 638
// CHECK-NEXT: 641 eq 28 640 114
// CHECK-NEXT: 642 ite 60 641 637 636
// CHECK-NEXT: 643 slice 28 76 0 0
// CHECK-NEXT: 644 ite 60 643 642 635
// CHECK-NEXT: 645 slice 112 644 6 5
// CHECK-NEXT: 646 const 112 11
// CHECK-NEXT: 647 eq 28 645 646
// CHECK-NEXT: 648 ite 26 647 582 540
// CHECK-NEXT: 649 slice 492 78 47 17
// CHECK-NEXT: 650 slice 28 78 47 47
// CHECK-NEXT: 651 concat 3 650 649
// CHECK-NEXT: 652 slice 28 78 47 47
// CHECK-NEXT: 653 concat 497 652 651
// CHECK-NEXT: 654 slice 28 78 47 47
// CHECK-NEXT: 655 concat 500 654 653
// CHECK-NEXT: 656 slice 28 78 47 47
// CHECK-NEXT: 657 concat 503 656 655
// CHECK-NEXT: 658 slice 28 78 47 47
// CHECK-NEXT: 659 concat 506 658 657
// CHECK-NEXT: 660 slice 28 78 47 47
// CHECK-NEXT: 661 concat 509 660 659
// CHECK-NEXT: 662 slice 28 78 47 47
// CHECK-NEXT: 663 concat 512 662 661
// CHECK-NEXT: 664 slice 28 78 47 47
// CHECK-NEXT: 665 concat 416 664 663
// CHECK-NEXT: 666 slice 28 78 47 47
// CHECK-NEXT: 667 concat 15 666 665
// CHECK-NEXT: 668 slice 28 78 47 47
// CHECK-NEXT: 669 concat 519 668 667
// CHECK-NEXT: 670 slice 28 78 47 47
// CHECK-NEXT: 671 concat 522 670 669
// CHECK-NEXT: 672 slice 28 78 47 47
// CHECK-NEXT: 673 concat 525 672 671
// CHECK-NEXT: 674 slice 28 78 47 47
// CHECK-NEXT: 675 concat 528 674 673
// CHECK-NEXT: 676 slice 28 78 47 47
// CHECK-NEXT: 677 concat 531 676 675
// CHECK-NEXT: 678 slice 28 78 47 47
// CHECK-NEXT: 679 concat 534 678 677
// CHECK-NEXT: 680 slice 28 78 47 47
// CHECK-NEXT: 681 concat 261 680 679
// CHECK-NEXT: 682 slice 28 78 47 47
// CHECK-NEXT: 683 concat 26 682 681
// CHECK-NEXT: 684 slice 32 644 6 4
// CHECK-NEXT: 685 const 32 101
// CHECK-NEXT: 686 eq 28 684 685
// CHECK-NEXT: 687 ite 26 686 683 648
// CHECK-NEXT: 688 const 32 100
// CHECK-NEXT: 689 eq 28 684 688
// CHECK-NEXT: 690 uext 32 114 1
// CHECK-NEXT: 691 eq 28 684 690
// CHECK-NEXT: 692 concat 112 691 689
// CHECK-NEXT: 693 redor 28 692
// CHECK-NEXT: 694 ite 26 693 547 687
// CHECK-NEXT: 695 slice 28 27 0 0
// CHECK-NEXT: 696 eq 28 695 106
// CHECK-NEXT: 697 or 28 696 695
// CHECK-NEXT: 698 slice 28 27 1 1
// CHECK-NEXT: 699 eq 28 698 106
// CHECK-NEXT: 700 or 28 699 698
// CHECK-NEXT: 701 slice 28 27 2 2
// CHECK-NEXT: 702 eq 28 701 106
// CHECK-NEXT: 703 or 28 702 701
// CHECK-NEXT: 704 slice 28 27 3 3
// CHECK-NEXT: 705 eq 28 704 106
// CHECK-NEXT: 706 or 28 705 704
// CHECK-NEXT: 707 slice 28 27 4 4
// CHECK-NEXT: 708 eq 28 707 106
// CHECK-NEXT: 709 or 28 708 707
// CHECK-NEXT: 710 slice 28 27 5 5
// CHECK-NEXT: 711 eq 28 710 106
// CHECK-NEXT: 712 or 28 711 710
// CHECK-NEXT: 713 slice 28 27 6 6
// CHECK-NEXT: 714 eq 28 713 106
// CHECK-NEXT: 715 or 28 714 713
// CHECK-NEXT: 716 slice 28 27 7 7
// CHECK-NEXT: 717 eq 28 716 106
// CHECK-NEXT: 718 or 28 717 716
// CHECK-NEXT: 719 slice 28 27 8 8
// CHECK-NEXT: 720 eq 28 719 106
// CHECK-NEXT: 721 or 28 720 719
// CHECK-NEXT: 722 slice 28 27 9 9
// CHECK-NEXT: 723 eq 28 722 106
// CHECK-NEXT: 724 or 28 723 722
// CHECK-NEXT: 725 slice 28 27 10 10
// CHECK-NEXT: 726 eq 28 725 106
// CHECK-NEXT: 727 or 28 726 725
// CHECK-NEXT: 728 slice 28 27 11 11
// CHECK-NEXT: 729 eq 28 728 106
// CHECK-NEXT: 730 or 28 729 728
// CHECK-NEXT: 731 slice 28 27 12 12
// CHECK-NEXT: 732 eq 28 731 106
// CHECK-NEXT: 733 or 28 732 731
// CHECK-NEXT: 734 slice 28 27 13 13
// CHECK-NEXT: 735 eq 28 734 106
// CHECK-NEXT: 736 or 28 735 734
// CHECK-NEXT: 737 slice 28 27 14 14
// CHECK-NEXT: 738 eq 28 737 106
// CHECK-NEXT: 739 or 28 738 737
// CHECK-NEXT: 740 slice 28 27 15 15
// CHECK-NEXT: 741 eq 28 740 106
// CHECK-NEXT: 742 or 28 741 740
// CHECK-NEXT: 743 slice 28 27 16 16
// CHECK-NEXT: 744 eq 28 743 106
// CHECK-NEXT: 745 or 28 744 743
// CHECK-NEXT: 746 slice 28 27 17 17
// CHECK-NEXT: 747 eq 28 746 106
// CHECK-NEXT: 748 or 28 747 746
// CHECK-NEXT: 749 slice 28 27 18 18
// CHECK-NEXT: 750 eq 28 749 106
// CHECK-NEXT: 751 or 28 750 749
// CHECK-NEXT: 752 slice 28 27 19 19
// CHECK-NEXT: 753 eq 28 752 106
// CHECK-NEXT: 754 or 28 753 752
// CHECK-NEXT: 755 slice 28 27 20 20
// CHECK-NEXT: 756 eq 28 755 106
// CHECK-NEXT: 757 or 28 756 755
// CHECK-NEXT: 758 slice 28 27 21 21
// CHECK-NEXT: 759 eq 28 758 106
// CHECK-NEXT: 760 or 28 759 758
// CHECK-NEXT: 761 slice 28 27 22 22
// CHECK-NEXT: 762 eq 28 761 106
// CHECK-NEXT: 763 or 28 762 761
// CHECK-NEXT: 764 slice 28 27 23 23
// CHECK-NEXT: 765 eq 28 764 106
// CHECK-NEXT: 766 or 28 765 764
// CHECK-NEXT: 767 slice 28 27 24 24
// CHECK-NEXT: 768 eq 28 767 106
// CHECK-NEXT: 769 or 28 768 767
// CHECK-NEXT: 770 slice 28 27 25 25
// CHECK-NEXT: 771 eq 28 770 106
// CHECK-NEXT: 772 or 28 771 770
// CHECK-NEXT: 773 slice 28 27 26 26
// CHECK-NEXT: 774 eq 28 773 106
// CHECK-NEXT: 775 or 28 774 773
// CHECK-NEXT: 776 slice 28 27 27 27
// CHECK-NEXT: 777 eq 28 776 106
// CHECK-NEXT: 778 or 28 777 776
// CHECK-NEXT: 779 slice 28 27 28 28
// CHECK-NEXT: 780 eq 28 779 106
// CHECK-NEXT: 781 or 28 780 779
// CHECK-NEXT: 782 slice 28 27 29 29
// CHECK-NEXT: 783 eq 28 782 106
// CHECK-NEXT: 784 or 28 783 782
// CHECK-NEXT: 785 slice 28 27 30 30
// CHECK-NEXT: 786 eq 28 785 106
// CHECK-NEXT: 787 or 28 786 785
// CHECK-NEXT: 788 slice 28 27 31 31
// CHECK-NEXT: 789 eq 28 788 106
// CHECK-NEXT: 790 or 28 789 788
// CHECK-NEXT: 791 slice 28 27 32 32
// CHECK-NEXT: 792 eq 28 791 106
// CHECK-NEXT: 793 or 28 792 791
// CHECK-NEXT: 794 slice 28 27 33 33
// CHECK-NEXT: 795 eq 28 794 106
// CHECK-NEXT: 796 or 28 795 794
// CHECK-NEXT: 797 slice 28 27 34 34
// CHECK-NEXT: 798 eq 28 797 106
// CHECK-NEXT: 799 or 28 798 797
// CHECK-NEXT: 800 slice 28 27 35 35
// CHECK-NEXT: 801 eq 28 800 106
// CHECK-NEXT: 802 or 28 801 800
// CHECK-NEXT: 803 slice 28 27 36 36
// CHECK-NEXT: 804 eq 28 803 106
// CHECK-NEXT: 805 or 28 804 803
// CHECK-NEXT: 806 slice 28 27 37 37
// CHECK-NEXT: 807 eq 28 806 106
// CHECK-NEXT: 808 or 28 807 806
// CHECK-NEXT: 809 slice 28 27 38 38
// CHECK-NEXT: 810 eq 28 809 106
// CHECK-NEXT: 811 or 28 810 809
// CHECK-NEXT: 812 slice 28 27 39 39
// CHECK-NEXT: 813 eq 28 812 106
// CHECK-NEXT: 814 or 28 813 812
// CHECK-NEXT: 815 slice 28 27 40 40
// CHECK-NEXT: 816 eq 28 815 106
// CHECK-NEXT: 817 or 28 816 815
// CHECK-NEXT: 818 slice 28 27 41 41
// CHECK-NEXT: 819 eq 28 818 106
// CHECK-NEXT: 820 or 28 819 818
// CHECK-NEXT: 821 slice 28 27 42 42
// CHECK-NEXT: 822 eq 28 821 106
// CHECK-NEXT: 823 or 28 822 821
// CHECK-NEXT: 824 slice 28 27 43 43
// CHECK-NEXT: 825 eq 28 824 106
// CHECK-NEXT: 826 or 28 825 824
// CHECK-NEXT: 827 slice 28 27 44 44
// CHECK-NEXT: 828 eq 28 827 106
// CHECK-NEXT: 829 or 28 828 827
// CHECK-NEXT: 830 slice 28 27 45 45
// CHECK-NEXT: 831 eq 28 830 106
// CHECK-NEXT: 832 or 28 831 830
// CHECK-NEXT: 833 slice 28 27 46 46
// CHECK-NEXT: 834 eq 28 833 106
// CHECK-NEXT: 835 or 28 834 833
// CHECK-NEXT: 836 slice 28 27 47 47
// CHECK-NEXT: 837 eq 28 836 106
// CHECK-NEXT: 838 or 28 837 836
// CHECK-NEXT: 839 concat 112 700 697
// CHECK-NEXT: 840 concat 32 703 839
// CHECK-NEXT: 841 concat 7 706 840
// CHECK-NEXT: 842 concat 53 709 841
// CHECK-NEXT: 843 concat 211 712 842
// CHECK-NEXT: 844 concat 213 715 843
// CHECK-NEXT: 845 concat 79 718 844
// CHECK-NEXT: 846 concat 60 721 845
// CHECK-NEXT: 847 concat 217 724 846
// CHECK-NEXT: 848 concat 219 727 847
// CHECK-NEXT: 849 concat 221 730 848
// CHECK-NEXT: 850 concat 223 733 849
// CHECK-NEXT: 851 concat 225 736 850
// CHECK-NEXT: 852 concat 227 739 851
// CHECK-NEXT: 853 concat 10 742 852
// CHECK-NEXT: 854 concat 230 745 853
// CHECK-NEXT: 855 concat 19 748 854
// CHECK-NEXT: 856 concat 233 751 855
// CHECK-NEXT: 857 concat 235 754 856
// CHECK-NEXT: 858 concat 237 757 857
// CHECK-NEXT: 859 concat 239 760 858
// CHECK-NEXT: 860 concat 241 763 859
// CHECK-NEXT: 861 concat 243 766 860
// CHECK-NEXT: 862 concat 245 769 861
// CHECK-NEXT: 863 concat 247 772 862
// CHECK-NEXT: 864 concat 50 775 863
// CHECK-NEXT: 865 concat 250 778 864
// CHECK-NEXT: 866 concat 252 781 865
// CHECK-NEXT: 867 concat 1 784 866
// CHECK-NEXT: 868 concat 492 787 867
// CHECK-NEXT: 869 concat 3 790 868
// CHECK-NEXT: 870 concat 497 793 869
// CHECK-NEXT: 871 concat 500 796 870
// CHECK-NEXT: 872 concat 503 799 871
// CHECK-NEXT: 873 concat 506 802 872
// CHECK-NEXT: 874 concat 509 805 873
// CHECK-NEXT: 875 concat 512 808 874
// CHECK-NEXT: 876 concat 416 811 875
// CHECK-NEXT: 877 concat 15 814 876
// CHECK-NEXT: 878 concat 519 817 877
// CHECK-NEXT: 879 concat 522 820 878
// CHECK-NEXT: 880 concat 525 823 879
// CHECK-NEXT: 881 concat 528 826 880
// CHECK-NEXT: 882 concat 531 829 881
// CHECK-NEXT: 883 concat 534 832 882
// CHECK-NEXT: 884 concat 261 835 883
// CHECK-NEXT: 885 concat 26 838 884
// CHECK-NEXT: 886 state 26
// CHECK-NEXT: 887 state 26
// CHECK-NEXT: 888 state 28
// CHECK-NEXT: 889 init 28 888 106
// CHECK-NEXT: 890 concat 112 111 888
// CHECK-NEXT: 891 eq 28 890 114
// CHECK-NEXT: 892 ite 26 891 887 886
// CHECK-NEXT: 893 slice 28 49 0 0
// CHECK-NEXT: 894 ite 26 893 892 885
// CHECK-NEXT: 895 uext 32 646 1
// CHECK-NEXT: 896 eq 28 684 895
// CHECK-NEXT: 897 ite 26 896 894 694
// CHECK-NEXT: 898 uext 32 106 2
// CHECK-NEXT: 899 eq 28 684 898
// CHECK-NEXT: 900 ite 26 899 78 897
// CHECK-NEXT: 901 const 26 000000000000000000000000000000000000000000000000
// CHECK-NEXT: 902 redor 28 684
// CHECK-NEXT: 903 not 28 902
// CHECK-NEXT: 904 ite 26 903 901 900
// CHECK-NEXT: 905 xor 26 539 904
// CHECK-NEXT: 906 input 26
// CHECK-NEXT: 907 concat 26 276 375
// CHECK-NEXT: 908 slice 112 644 1 0
// CHECK-NEXT: 909 eq 28 908 646
// CHECK-NEXT: 910 ite 26 909 907 906
// CHECK-NEXT: 911 eq 28 908 114
// CHECK-NEXT: 912 ite 26 911 547 910
// CHECK-NEXT: 913 const 531 100000000000000000000000000000000000000000000
// CHECK-NEXT: 914 slice 50 276 26 0
// CHECK-NEXT: 915 slice 50 116 26 0
// CHECK-NEXT: 916 slice 28 54 0 0
// CHECK-NEXT: 917 neq 28 916 106
// CHECK-NEXT: 918 slice 28 59 0 0
// CHECK-NEXT: 919 xor 28 916 918
// CHECK-NEXT: 920 and 28 917 919
// CHECK-NEXT: 921 slice 28 54 1 1
// CHECK-NEXT: 922 neq 28 921 106
// CHECK-NEXT: 923 slice 28 59 1 1
// CHECK-NEXT: 924 xor 28 921 923
// CHECK-NEXT: 925 and 28 922 924
// CHECK-NEXT: 926 slice 28 54 2 2
// CHECK-NEXT: 927 neq 28 926 106
// CHECK-NEXT: 928 slice 28 59 2 2
// CHECK-NEXT: 929 xor 28 926 928
// CHECK-NEXT: 930 and 28 927 929
// CHECK-NEXT: 931 slice 28 54 3 3
// CHECK-NEXT: 932 neq 28 931 106
// CHECK-NEXT: 933 slice 28 59 3 3
// CHECK-NEXT: 934 xor 28 931 933
// CHECK-NEXT: 935 and 28 932 934
// CHECK-NEXT: 936 slice 28 54 4 4
// CHECK-NEXT: 937 neq 28 936 106
// CHECK-NEXT: 938 slice 28 59 4 4
// CHECK-NEXT: 939 xor 28 936 938
// CHECK-NEXT: 940 and 28 937 939
// CHECK-NEXT: 941 concat 112 925 920
// CHECK-NEXT: 942 concat 32 930 941
// CHECK-NEXT: 943 concat 7 935 942
// CHECK-NEXT: 944 concat 53 940 943
// CHECK-NEXT: 945 state 53
// CHECK-NEXT: 946 state 53
// CHECK-NEXT: 947 state 28
// CHECK-NEXT: 948 init 28 947 106
// CHECK-NEXT: 949 concat 112 111 947
// CHECK-NEXT: 950 eq 28 949 114
// CHECK-NEXT: 951 ite 53 950 946 945
// CHECK-NEXT: 952 slice 28 55 0 0
// CHECK-NEXT: 953 ite 53 952 951 944
// CHECK-NEXT: 954 slice 28 953 0 0
// CHECK-NEXT: 955 ite 50 954 915 914
// CHECK-NEXT: 956 const 50 000000000000000000000000000
// CHECK-NEXT: 957 const 213 1000010
// CHECK-NEXT: 958 uext 79 957 1
// CHECK-NEXT: 959 eq 28 80 958
// CHECK-NEXT: 960 ite 28 959 106 255
// CHECK-NEXT: 961 const 213 1000001
// CHECK-NEXT: 962 uext 79 961 1
// CHECK-NEXT: 963 eq 28 80 962
// CHECK-NEXT: 964 ite 28 963 255 960
// CHECK-NEXT: 965 not 28 964
// CHECK-NEXT: 966 slice 28 953 1 1
// CHECK-NEXT: 967 and 28 965 966
// CHECK-NEXT: 968 ite 50 967 956 955
// CHECK-NEXT: 969 slice 28 51 0 0
// CHECK-NEXT: 970 neq 28 969 106
// CHECK-NEXT: 971 and 28 970 969
// CHECK-NEXT: 972 slice 28 51 1 1
// CHECK-NEXT: 973 neq 28 972 106
// CHECK-NEXT: 974 and 28 973 972
// CHECK-NEXT: 975 slice 28 51 2 2
// CHECK-NEXT: 976 neq 28 975 106
// CHECK-NEXT: 977 and 28 976 975
// CHECK-NEXT: 978 slice 28 51 3 3
// CHECK-NEXT: 979 neq 28 978 106
// CHECK-NEXT: 980 and 28 979 978
// CHECK-NEXT: 981 slice 28 51 4 4
// CHECK-NEXT: 982 neq 28 981 106
// CHECK-NEXT: 983 and 28 982 981
// CHECK-NEXT: 984 slice 28 51 5 5
// CHECK-NEXT: 985 neq 28 984 106
// CHECK-NEXT: 986 and 28 985 984
// CHECK-NEXT: 987 slice 28 51 6 6
// CHECK-NEXT: 988 neq 28 987 106
// CHECK-NEXT: 989 and 28 988 987
// CHECK-NEXT: 990 slice 28 51 7 7
// CHECK-NEXT: 991 neq 28 990 106
// CHECK-NEXT: 992 and 28 991 990
// CHECK-NEXT: 993 slice 28 51 8 8
// CHECK-NEXT: 994 neq 28 993 106
// CHECK-NEXT: 995 and 28 994 993
// CHECK-NEXT: 996 slice 28 51 9 9
// CHECK-NEXT: 997 neq 28 996 106
// CHECK-NEXT: 998 and 28 997 996
// CHECK-NEXT: 999 slice 28 51 10 10
// CHECK-NEXT: 1000 neq 28 999 106
// CHECK-NEXT: 1001 and 28 1000 999
// CHECK-NEXT: 1002 slice 28 51 11 11
// CHECK-NEXT: 1003 neq 28 1002 106
// CHECK-NEXT: 1004 and 28 1003 1002
// CHECK-NEXT: 1005 slice 28 51 12 12
// CHECK-NEXT: 1006 neq 28 1005 106
// CHECK-NEXT: 1007 and 28 1006 1005
// CHECK-NEXT: 1008 slice 28 51 13 13
// CHECK-NEXT: 1009 neq 28 1008 106
// CHECK-NEXT: 1010 and 28 1009 1008
// CHECK-NEXT: 1011 slice 28 51 14 14
// CHECK-NEXT: 1012 neq 28 1011 106
// CHECK-NEXT: 1013 and 28 1012 1011
// CHECK-NEXT: 1014 slice 28 51 15 15
// CHECK-NEXT: 1015 neq 28 1014 106
// CHECK-NEXT: 1016 and 28 1015 1014
// CHECK-NEXT: 1017 slice 28 51 16 16
// CHECK-NEXT: 1018 neq 28 1017 106
// CHECK-NEXT: 1019 and 28 1018 1017
// CHECK-NEXT: 1020 slice 28 51 17 17
// CHECK-NEXT: 1021 neq 28 1020 106
// CHECK-NEXT: 1022 and 28 1021 1020
// CHECK-NEXT: 1023 slice 28 51 18 18
// CHECK-NEXT: 1024 neq 28 1023 106
// CHECK-NEXT: 1025 and 28 1024 1023
// CHECK-NEXT: 1026 slice 28 51 19 19
// CHECK-NEXT: 1027 neq 28 1026 106
// CHECK-NEXT: 1028 and 28 1027 1026
// CHECK-NEXT: 1029 slice 28 51 20 20
// CHECK-NEXT: 1030 neq 28 1029 106
// CHECK-NEXT: 1031 and 28 1030 1029
// CHECK-NEXT: 1032 slice 28 51 21 21
// CHECK-NEXT: 1033 neq 28 1032 106
// CHECK-NEXT: 1034 and 28 1033 1032
// CHECK-NEXT: 1035 slice 28 51 22 22
// CHECK-NEXT: 1036 neq 28 1035 106
// CHECK-NEXT: 1037 and 28 1036 1035
// CHECK-NEXT: 1038 slice 28 51 23 23
// CHECK-NEXT: 1039 neq 28 1038 106
// CHECK-NEXT: 1040 and 28 1039 1038
// CHECK-NEXT: 1041 slice 28 51 24 24
// CHECK-NEXT: 1042 neq 28 1041 106
// CHECK-NEXT: 1043 and 28 1042 1041
// CHECK-NEXT: 1044 slice 28 51 25 25
// CHECK-NEXT: 1045 neq 28 1044 106
// CHECK-NEXT: 1046 and 28 1045 1044
// CHECK-NEXT: 1047 slice 28 51 26 26
// CHECK-NEXT: 1048 neq 28 1047 106
// CHECK-NEXT: 1049 and 28 1048 1047
// CHECK-NEXT: 1050 concat 112 974 971
// CHECK-NEXT: 1051 concat 32 977 1050
// CHECK-NEXT: 1052 concat 7 980 1051
// CHECK-NEXT: 1053 concat 53 983 1052
// CHECK-NEXT: 1054 concat 211 986 1053
// CHECK-NEXT: 1055 concat 213 989 1054
// CHECK-NEXT: 1056 concat 79 992 1055
// CHECK-NEXT: 1057 concat 60 995 1056
// CHECK-NEXT: 1058 concat 217 998 1057
// CHECK-NEXT: 1059 concat 219 1001 1058
// CHECK-NEXT: 1060 concat 221 1004 1059
// CHECK-NEXT: 1061 concat 223 1007 1060
// CHECK-NEXT: 1062 concat 225 1010 1061
// CHECK-NEXT: 1063 concat 227 1013 1062
// CHECK-NEXT: 1064 concat 10 1016 1063
// CHECK-NEXT: 1065 concat 230 1019 1064
// CHECK-NEXT: 1066 concat 19 1022 1065
// CHECK-NEXT: 1067 concat 233 1025 1066
// CHECK-NEXT: 1068 concat 235 1028 1067
// CHECK-NEXT: 1069 concat 237 1031 1068
// CHECK-NEXT: 1070 concat 239 1034 1069
// CHECK-NEXT: 1071 concat 241 1037 1070
// CHECK-NEXT: 1072 concat 243 1040 1071
// CHECK-NEXT: 1073 concat 245 1043 1072
// CHECK-NEXT: 1074 concat 247 1046 1073
// CHECK-NEXT: 1075 concat 50 1049 1074
// CHECK-NEXT: 1076 state 50
// CHECK-NEXT: 1077 state 50
// CHECK-NEXT: 1078 state 28
// CHECK-NEXT: 1079 init 28 1078 106
// CHECK-NEXT: 1080 concat 112 111 1078
// CHECK-NEXT: 1081 eq 28 1080 114
// CHECK-NEXT: 1082 ite 50 1081 1077 1076
// CHECK-NEXT: 1083 slice 28 52 0 0
// CHECK-NEXT: 1084 const 227 100000101000100
// CHECK-NEXT: 1085 uext 10 1084 1
// CHECK-NEXT: 1086 eq 28 11 1085
// CHECK-NEXT: 1087 ite 28 1086 106 255
// CHECK-NEXT: 1088 uext 10 961 9
// CHECK-NEXT: 1089 eq 28 11 1088
// CHECK-NEXT: 1090 ite 28 1089 255 1087
// CHECK-NEXT: 1091 not 28 1090
// CHECK-NEXT: 1092 uext 10 1084 1
// CHECK-NEXT: 1093 eq 28 23 1092
// CHECK-NEXT: 1094 ite 28 1093 106 255
// CHECK-NEXT: 1095 uext 10 957 9
// CHECK-NEXT: 1096 eq 28 23 1095
// CHECK-NEXT: 1097 ite 28 1096 255 1094
// CHECK-NEXT: 1098 not 28 1097
// CHECK-NEXT: 1099 and 28 1091 1098
// CHECK-NEXT: 1100 const 492 1001110010011110100111001000101
// CHECK-NEXT: 1101 uext 96 1100 33
// CHECK-NEXT: 1102 eq 28 97 1101
// CHECK-NEXT: 1103 ite 112 1102 114 415
// CHECK-NEXT: 1104 const 256 1000100010110010100111001000001010011010100100101000011
// CHECK-NEXT: 1105 uext 96 1104 9
// CHECK-NEXT: 1106 eq 28 97 1105
// CHECK-NEXT: 1107 ite 112 1106 421 1103
// CHECK-NEXT: 1108 sort bitvec 63
// CHECK-NEXT: 1109 const 1108 100110101010101010011000101010001001001010100000100110001011001
// CHECK-NEXT: 1110 uext 96 1109 1
// CHECK-NEXT: 1111 eq 28 97 1110
// CHECK-NEXT: 1112 ite 112 1111 415 1107
// CHECK-NEXT: 1113 eq 28 1112 114
// CHECK-NEXT: 1114 or 28 1099 1113
// CHECK-NEXT: 1115 ite 28 1114 255 1083
// CHECK-NEXT: 1116 ite 50 1115 1082 1075
// CHECK-NEXT: 1117 slice 28 953 2 2
// CHECK-NEXT: 1118 ite 50 1117 1116 956
// CHECK-NEXT: 1119 slice 28 953 4 4
// CHECK-NEXT: 1120 ite 19 1119 287 375
// CHECK-NEXT: 1121 const 19 000000000000000000
// CHECK-NEXT: 1122 and 28 964 966
// CHECK-NEXT: 1123 ite 19 1122 1121 1120
// CHECK-NEXT: 1124 slice 28 1123 17 17
// CHECK-NEXT: 1125 concat 233 1124 1123
// CHECK-NEXT: 1126 slice 28 1123 17 17
// CHECK-NEXT: 1127 concat 235 1126 1125
// CHECK-NEXT: 1128 slice 28 1123 17 17
// CHECK-NEXT: 1129 concat 237 1128 1127
// CHECK-NEXT: 1130 slice 28 1123 17 17
// CHECK-NEXT: 1131 concat 239 1130 1129
// CHECK-NEXT: 1132 slice 28 1123 17 17
// CHECK-NEXT: 1133 concat 241 1132 1131
// CHECK-NEXT: 1134 slice 28 1123 17 17
// CHECK-NEXT: 1135 concat 243 1134 1133
// CHECK-NEXT: 1136 slice 28 1123 17 17
// CHECK-NEXT: 1137 concat 245 1136 1135
// CHECK-NEXT: 1138 slice 28 1123 17 17
// CHECK-NEXT: 1139 concat 247 1138 1137
// CHECK-NEXT: 1140 slice 28 1123 17 17
// CHECK-NEXT: 1141 concat 50 1140 1139
// CHECK-NEXT: 1142 ite 50 964 1141 968
// CHECK-NEXT: 1143 add 50 1118 1142
// CHECK-NEXT: 1144 sub 50 1118 1142
// CHECK-NEXT: 1145 slice 28 953 3 3
// CHECK-NEXT: 1146 ite 50 1145 1144 1143
// CHECK-NEXT: 1147 state 50
// CHECK-NEXT: 1148 state 50
// CHECK-NEXT: 1149 state 28
// CHECK-NEXT: 1150 init 28 1149 106
// CHECK-NEXT: 1151 concat 112 111 1149
// CHECK-NEXT: 1152 eq 28 1151 114
// CHECK-NEXT: 1153 ite 50 1152 1148 1147
// CHECK-NEXT: 1154 slice 28 6 0 0
// CHECK-NEXT: 1155 ite 28 1114 255 1154
// CHECK-NEXT: 1156 ite 50 1155 1153 1146
// CHECK-NEXT: 1157 ite 50 1090 1156 968
// CHECK-NEXT: 1158 slice 28 1157 26 26
// CHECK-NEXT: 1159 concat 250 1158 1157
// CHECK-NEXT: 1160 slice 28 1157 26 26
// CHECK-NEXT: 1161 concat 252 1160 1159
// CHECK-NEXT: 1162 slice 28 1157 26 26
// CHECK-NEXT: 1163 concat 1 1162 1161
// CHECK-NEXT: 1164 slice 28 1157 26 26
// CHECK-NEXT: 1165 concat 492 1164 1163
// CHECK-NEXT: 1166 slice 28 1157 26 26
// CHECK-NEXT: 1167 concat 3 1166 1165
// CHECK-NEXT: 1168 slice 28 1157 26 26
// CHECK-NEXT: 1169 concat 497 1168 1167
// CHECK-NEXT: 1170 slice 28 1157 26 26
// CHECK-NEXT: 1171 concat 500 1170 1169
// CHECK-NEXT: 1172 slice 28 1157 26 26
// CHECK-NEXT: 1173 concat 503 1172 1171
// CHECK-NEXT: 1174 slice 28 1157 26 26
// CHECK-NEXT: 1175 concat 506 1174 1173
// CHECK-NEXT: 1176 slice 28 1157 26 26
// CHECK-NEXT: 1177 concat 509 1176 1175
// CHECK-NEXT: 1178 slice 28 1157 26 26
// CHECK-NEXT: 1179 concat 512 1178 1177
// CHECK-NEXT: 1180 slice 28 1157 26 26
// CHECK-NEXT: 1181 concat 416 1180 1179
// CHECK-NEXT: 1182 slice 28 1157 26 26
// CHECK-NEXT: 1183 concat 15 1182 1181
// CHECK-NEXT: 1184 slice 28 1157 26 26
// CHECK-NEXT: 1185 concat 519 1184 1183
// CHECK-NEXT: 1186 slice 28 1157 26 26
// CHECK-NEXT: 1187 concat 522 1186 1185
// CHECK-NEXT: 1188 slice 28 1157 26 26
// CHECK-NEXT: 1189 concat 525 1188 1187
// CHECK-NEXT: 1190 slice 28 1157 26 26
// CHECK-NEXT: 1191 concat 528 1190 1189
// CHECK-NEXT: 1192 slice 28 1157 26 26
// CHECK-NEXT: 1193 concat 531 1192 1191
// CHECK-NEXT: 1194 slice 19 1156 17 0
// CHECK-NEXT: 1195 ite 19 1097 1194 1123
// CHECK-NEXT: 1196 slice 28 1195 17 17
// CHECK-NEXT: 1197 concat 233 1196 1195
// CHECK-NEXT: 1198 slice 28 1195 17 17
// CHECK-NEXT: 1199 concat 235 1198 1197
// CHECK-NEXT: 1200 slice 28 1195 17 17
// CHECK-NEXT: 1201 concat 237 1200 1199
// CHECK-NEXT: 1202 slice 28 1195 17 17
// CHECK-NEXT: 1203 concat 239 1202 1201
// CHECK-NEXT: 1204 slice 28 1195 17 17
// CHECK-NEXT: 1205 concat 241 1204 1203
// CHECK-NEXT: 1206 slice 28 1195 17 17
// CHECK-NEXT: 1207 concat 243 1206 1205
// CHECK-NEXT: 1208 slice 28 1195 17 17
// CHECK-NEXT: 1209 concat 245 1208 1207
// CHECK-NEXT: 1210 slice 28 1195 17 17
// CHECK-NEXT: 1211 concat 247 1210 1209
// CHECK-NEXT: 1212 slice 28 1195 17 17
// CHECK-NEXT: 1213 concat 50 1212 1211
// CHECK-NEXT: 1214 slice 28 1195 17 17
// CHECK-NEXT: 1215 concat 250 1214 1213
// CHECK-NEXT: 1216 slice 28 1195 17 17
// CHECK-NEXT: 1217 concat 252 1216 1215
// CHECK-NEXT: 1218 slice 28 1195 17 17
// CHECK-NEXT: 1219 concat 1 1218 1217
// CHECK-NEXT: 1220 slice 28 1195 17 17
// CHECK-NEXT: 1221 concat 492 1220 1219
// CHECK-NEXT: 1222 slice 28 1195 17 17
// CHECK-NEXT: 1223 concat 3 1222 1221
// CHECK-NEXT: 1224 slice 28 1195 17 17
// CHECK-NEXT: 1225 concat 497 1224 1223
// CHECK-NEXT: 1226 slice 28 1195 17 17
// CHECK-NEXT: 1227 concat 500 1226 1225
// CHECK-NEXT: 1228 slice 28 1195 17 17
// CHECK-NEXT: 1229 concat 503 1228 1227
// CHECK-NEXT: 1230 slice 28 1195 17 17
// CHECK-NEXT: 1231 concat 506 1230 1229
// CHECK-NEXT: 1232 slice 28 1195 17 17
// CHECK-NEXT: 1233 concat 509 1232 1231
// CHECK-NEXT: 1234 slice 28 1195 17 17
// CHECK-NEXT: 1235 concat 512 1234 1233
// CHECK-NEXT: 1236 slice 28 1195 17 17
// CHECK-NEXT: 1237 concat 416 1236 1235
// CHECK-NEXT: 1238 slice 28 1195 17 17
// CHECK-NEXT: 1239 concat 15 1238 1237
// CHECK-NEXT: 1240 slice 28 1195 17 17
// CHECK-NEXT: 1241 concat 519 1240 1239
// CHECK-NEXT: 1242 slice 28 1195 17 17
// CHECK-NEXT: 1243 concat 522 1242 1241
// CHECK-NEXT: 1244 slice 28 1195 17 17
// CHECK-NEXT: 1245 concat 525 1244 1243
// CHECK-NEXT: 1246 slice 28 1195 17 17
// CHECK-NEXT: 1247 concat 528 1246 1245
// CHECK-NEXT: 1248 slice 28 1195 17 17
// CHECK-NEXT: 1249 concat 531 1248 1247
// CHECK-NEXT: 1250 mul 531 1193 1249
// CHECK-NEXT: 1251 const 531 000000000000000000000000000000000000000000000
// CHECK-NEXT: 1252 ite 531 1113 1251 1250
// CHECK-NEXT: 1253 slice 528 1252 43 0
// CHECK-NEXT: 1254 input 528
// CHECK-NEXT: 1255 and 528 1253 1254
// CHECK-NEXT: 1256 concat 531 106 1255
// CHECK-NEXT: 1257 state 531
// CHECK-NEXT: 1258 state 531
// CHECK-NEXT: 1259 state 28
// CHECK-NEXT: 1260 init 28 1259 106
// CHECK-NEXT: 1261 concat 112 111 1259
// CHECK-NEXT: 1262 eq 28 1261 114
// CHECK-NEXT: 1263 ite 531 1262 1258 1257
// CHECK-NEXT: 1264 slice 28 73 0 0
// CHECK-NEXT: 1265 ite 531 1264 1263 1256
// CHECK-NEXT: 1266 redor 28 429
// CHECK-NEXT: 1267 not 28 1266
// CHECK-NEXT: 1268 ite 531 1267 1265 913
// CHECK-NEXT: 1269 slice 28 1268 44 44
// CHECK-NEXT: 1270 concat 534 1269 1268
// CHECK-NEXT: 1271 slice 28 1268 44 44
// CHECK-NEXT: 1272 concat 261 1271 1270
// CHECK-NEXT: 1273 slice 28 1268 44 44
// CHECK-NEXT: 1274 concat 26 1273 1272
// CHECK-NEXT: 1275 uext 112 106 1
// CHECK-NEXT: 1276 eq 28 908 1275
// CHECK-NEXT: 1277 ite 26 1276 1274 912
// CHECK-NEXT: 1278 concat 112 74 255
// CHECK-NEXT: 1279 ite 112 689 1278 415
// CHECK-NEXT: 1280 const 534 0000000000000000000000000000000000000000000000
// CHECK-NEXT: 1281 concat 26 1280 1279
// CHECK-NEXT: 1282 redor 28 908
// CHECK-NEXT: 1283 not 28 1282
// CHECK-NEXT: 1284 ite 26 1283 1281 1277
// CHECK-NEXT: 1285 xor 26 905 1284
// CHECK-NEXT: 1286 input 26
// CHECK-NEXT: 1287 slice 112 644 3 2
// CHECK-NEXT: 1288 eq 28 1287 646
// CHECK-NEXT: 1289 ite 26 1288 894 1286
// CHECK-NEXT: 1290 const 26 111111111111111111111111111111111111111111111111
// CHECK-NEXT: 1291 eq 28 1287 114
// CHECK-NEXT: 1292 ite 26 1291 1290 1289
// CHECK-NEXT: 1293 input 528
// CHECK-NEXT: 1294 and 528 1253 1293
// CHECK-NEXT: 1295 slice 28 1252 44 44
// CHECK-NEXT: 1296 not 28 1295
// CHECK-NEXT: 1297 concat 531 1296 1294
// CHECK-NEXT: 1298 state 531
// CHECK-NEXT: 1299 state 531
// CHECK-NEXT: 1300 state 28
// CHECK-NEXT: 1301 init 28 1300 106
// CHECK-NEXT: 1302 concat 112 111 1300
// CHECK-NEXT: 1303 eq 28 1302 114
// CHECK-NEXT: 1304 ite 531 1303 1299 1298
// CHECK-NEXT: 1305 ite 531 1264 1304 1297
// CHECK-NEXT: 1306 ite 531 1267 1305 913
// CHECK-NEXT: 1307 const 32 000
// CHECK-NEXT: 1308 concat 26 1307 1306
// CHECK-NEXT: 1309 uext 112 106 1
// CHECK-NEXT: 1310 eq 28 1287 1309
// CHECK-NEXT: 1311 ite 26 1310 1308 1292
// CHECK-NEXT: 1312 redor 28 1287
// CHECK-NEXT: 1313 not 28 1312
// CHECK-NEXT: 1314 ite 26 1313 901 1311
// CHECK-NEXT: 1315 xor 26 1285 1314
// CHECK-NEXT: 1316 and 26 1284 1314
// CHECK-NEXT: 1317 and 26 905 1314
// CHECK-NEXT: 1318 or 26 1316 1317
// CHECK-NEXT: 1319 and 26 1284 905
// CHECK-NEXT: 1320 or 26 1318 1319
// CHECK-NEXT: 1321 slice 28 411 3 3
// CHECK-NEXT: 1322 ite 26 1321 1320 1315
// CHECK-NEXT: 1323 slice 28 411 2 2
// CHECK-NEXT: 1324 ite 26 1323 901 1320
// CHECK-NEXT: 1325 slice 28 1324 11 11
// CHECK-NEXT: 1326 and 28 1325 431
// CHECK-NEXT: 1327 slice 28 1324 23 23
// CHECK-NEXT: 1328 and 28 1327 1267
// CHECK-NEXT: 1329 slice 28 1324 35 35
// CHECK-NEXT: 1330 and 28 1329 431
// CHECK-NEXT: 1331 slice 219 1324 10 0
// CHECK-NEXT: 1332 concat 221 1331 255
// CHECK-NEXT: 1333 concat 223 1326 1332
// CHECK-NEXT: 1334 slice 219 1324 22 12
// CHECK-NEXT: 1335 concat 243 1334 1333
// CHECK-NEXT: 1336 concat 245 1328 1335
// CHECK-NEXT: 1337 slice 219 1324 34 24
// CHECK-NEXT: 1338 concat 506 1337 1336
// CHECK-NEXT: 1339 concat 509 1330 1338
// CHECK-NEXT: 1340 slice 219 1324 46 36
// CHECK-NEXT: 1341 concat 26 1340 1339
// CHECK-NEXT: 1342 and 26 1322 1341
// CHECK-NEXT: 1343 input 26
// CHECK-NEXT: 1344 slice 112 644 8 7
// CHECK-NEXT: 1345 eq 28 1344 646
// CHECK-NEXT: 1346 ite 26 1345 894 1343
// CHECK-NEXT: 1347 eq 28 1344 114
// CHECK-NEXT: 1348 ite 26 1347 82 1346
// CHECK-NEXT: 1349 uext 112 106 1
// CHECK-NEXT: 1350 eq 28 1344 1349
// CHECK-NEXT: 1351 ite 26 1350 547 1348
// CHECK-NEXT: 1352 redor 28 1344
// CHECK-NEXT: 1353 not 28 1352
// CHECK-NEXT: 1354 ite 26 1353 901 1351
// CHECK-NEXT: 1355 and 26 1354 1341
// CHECK-NEXT: 1356 or 26 1342 1355
// CHECK-NEXT: 1357 and 26 1322 1354
// CHECK-NEXT: 1358 or 26 1356 1357
// CHECK-NEXT: 1359 slice 28 1358 35 35
// CHECK-NEXT: 1360 and 28 431 1359
// CHECK-NEXT: 1361 slice 221 1358 47 36
// CHECK-NEXT: 1362 concat 223 1361 1360
// CHECK-NEXT: 1363 uext 225 1362 1
// CHECK-NEXT: 1364 xor 26 1322 1341
// CHECK-NEXT: 1365 xor 26 1364 1354
// CHECK-NEXT: 1366 slice 221 1365 47 36
// CHECK-NEXT: 1367 slice 28 1324 47 47
// CHECK-NEXT: 1368 concat 223 1367 1366
// CHECK-NEXT: 1369 uext 225 1368 1
// CHECK-NEXT: 1370 add 225 1363 1369
// CHECK-NEXT: 1371 slice 28 1358 23 23
// CHECK-NEXT: 1372 and 28 1267 1371
// CHECK-NEXT: 1373 slice 219 1358 34 24
// CHECK-NEXT: 1374 concat 221 1373 1372
// CHECK-NEXT: 1375 uext 223 1374 1
// CHECK-NEXT: 1376 slice 221 1365 35 24
// CHECK-NEXT: 1377 uext 223 1376 1
// CHECK-NEXT: 1378 add 223 1375 1377
// CHECK-NEXT: 1379 slice 28 1358 11 11
// CHECK-NEXT: 1380 and 28 431 1379
// CHECK-NEXT: 1381 slice 219 1358 22 12
// CHECK-NEXT: 1382 concat 221 1381 1380
// CHECK-NEXT: 1383 uext 223 1382 1
// CHECK-NEXT: 1384 slice 221 1365 23 12
// CHECK-NEXT: 1385 uext 223 1384 1
// CHECK-NEXT: 1386 add 223 1383 1385
// CHECK-NEXT: 1387 input 28
// CHECK-NEXT: 1388 slice 28 547 47 47
// CHECK-NEXT: 1389 not 28 1388
// CHECK-NEXT: 1390 slice 28 33 0 0
// CHECK-NEXT: 1391 neq 28 1390 106
// CHECK-NEXT: 1392 and 28 1391 1390
// CHECK-NEXT: 1393 slice 28 33 1 1
// CHECK-NEXT: 1394 neq 28 1393 106
// CHECK-NEXT: 1395 and 28 1394 1393
// CHECK-NEXT: 1396 slice 28 33 2 2
// CHECK-NEXT: 1397 neq 28 1396 106
// CHECK-NEXT: 1398 and 28 1397 1396
// CHECK-NEXT: 1399 concat 112 1395 1392
// CHECK-NEXT: 1400 concat 32 1398 1399
// CHECK-NEXT: 1401 state 32
// CHECK-NEXT: 1402 state 32
// CHECK-NEXT: 1403 state 28
// CHECK-NEXT: 1404 init 28 1403 106
// CHECK-NEXT: 1405 concat 112 111 1403
// CHECK-NEXT: 1406 eq 28 1405 114
// CHECK-NEXT: 1407 ite 32 1406 1402 1401
// CHECK-NEXT: 1408 slice 28 34 0 0
// CHECK-NEXT: 1409 ite 32 1408 1407 1400
// CHECK-NEXT: 1410 const 32 111
// CHECK-NEXT: 1411 eq 28 1409 1410
// CHECK-NEXT: 1412 ite 28 1411 1389 1387
// CHECK-NEXT: 1413 slice 28 1157 26 26
// CHECK-NEXT: 1414 slice 28 1195 17 17
// CHECK-NEXT: 1415 xor 28 1413 1414
// CHECK-NEXT: 1416 not 28 1415
// CHECK-NEXT: 1417 state 28
// CHECK-NEXT: 1418 state 28
// CHECK-NEXT: 1419 state 28
// CHECK-NEXT: 1420 init 28 1419 106
// CHECK-NEXT: 1421 concat 112 111 1419
// CHECK-NEXT: 1422 eq 28 1421 114
// CHECK-NEXT: 1423 ite 28 1422 1418 1417
// CHECK-NEXT: 1424 ite 28 1264 1423 1416
// CHECK-NEXT: 1425 not 28 1424
// CHECK-NEXT: 1426 const 32 110
// CHECK-NEXT: 1427 eq 28 1409 1426
// CHECK-NEXT: 1428 ite 28 1427 1425 1412
// CHECK-NEXT: 1429 eq 28 1409 685
// CHECK-NEXT: 1430 ite 28 1429 1388 1428
// CHECK-NEXT: 1431 state 28
// CHECK-NEXT: 1432 state 28
// CHECK-NEXT: 1433 state 28
// CHECK-NEXT: 1434 init 28 1433 106
// CHECK-NEXT: 1435 concat 112 111 1433
// CHECK-NEXT: 1436 eq 28 1435 114
// CHECK-NEXT: 1437 ite 28 1436 1432 1431
// CHECK-NEXT: 1438 state 7
// CHECK-NEXT: 1439 state 7
// CHECK-NEXT: 1440 state 28
// CHECK-NEXT: 1441 init 28 1440 106
// CHECK-NEXT: 1442 concat 112 111 1440
// CHECK-NEXT: 1443 eq 28 1442 114
// CHECK-NEXT: 1444 ite 7 1443 1439 1438
// CHECK-NEXT: 1445 slice 28 1444 3 3
// CHECK-NEXT: 1446 xor 28 1437 1445
// CHECK-NEXT: 1447 not 28 1446
// CHECK-NEXT: 1448 eq 28 1409 688
// CHECK-NEXT: 1449 ite 28 1448 1447 1430
// CHECK-NEXT: 1450 slice 28 78 47 47
// CHECK-NEXT: 1451 not 28 1450
// CHECK-NEXT: 1452 uext 32 646 1
// CHECK-NEXT: 1453 eq 28 1409 1452
// CHECK-NEXT: 1454 ite 28 1453 1451 1449
// CHECK-NEXT: 1455 not 28 29
// CHECK-NEXT: 1456 uext 32 114 1
// CHECK-NEXT: 1457 eq 28 1409 1456
// CHECK-NEXT: 1458 ite 28 1457 1455 1454
// CHECK-NEXT: 1459 uext 32 106 2
// CHECK-NEXT: 1460 eq 28 1409 1459
// CHECK-NEXT: 1461 ite 28 1460 1450 1458
// CHECK-NEXT: 1462 neq 28 30 106
// CHECK-NEXT: 1463 xor 28 30 57
// CHECK-NEXT: 1464 and 28 1462 1463
// CHECK-NEXT: 1465 state 28
// CHECK-NEXT: 1466 state 28
// CHECK-NEXT: 1467 state 28
// CHECK-NEXT: 1468 init 28 1467 106
// CHECK-NEXT: 1469 concat 112 111 1467
// CHECK-NEXT: 1470 eq 28 1469 114
// CHECK-NEXT: 1471 ite 28 1470 1466 1465
// CHECK-NEXT: 1472 slice 28 31 0 0
// CHECK-NEXT: 1473 ite 28 1472 1471 1464
// CHECK-NEXT: 1474 not 28 1473
// CHECK-NEXT: 1475 redor 28 1409
// CHECK-NEXT: 1476 not 28 1475
// CHECK-NEXT: 1477 ite 28 1476 1474 1461
// CHECK-NEXT: 1478 not 28 1477
// CHECK-NEXT: 1479 or 28 1321 1323
// CHECK-NEXT: 1480 ite 28 1479 255 1478
// CHECK-NEXT: 1481 slice 219 1358 10 0
// CHECK-NEXT: 1482 concat 221 1481 1480
// CHECK-NEXT: 1483 uext 223 1482 1
// CHECK-NEXT: 1484 slice 221 1365 11 0
// CHECK-NEXT: 1485 uext 223 1484 1
// CHECK-NEXT: 1486 add 223 1483 1485
// CHECK-NEXT: 1487 slice 28 1486 12 12
// CHECK-NEXT: 1488 and 28 431 1487
// CHECK-NEXT: 1489 uext 223 1488 12
// CHECK-NEXT: 1490 add 223 1386 1489
// CHECK-NEXT: 1491 slice 28 1490 12 12
// CHECK-NEXT: 1492 and 28 1267 1491
// CHECK-NEXT: 1493 uext 223 1492 12
// CHECK-NEXT: 1494 add 223 1378 1493
// CHECK-NEXT: 1495 slice 28 1494 12 12
// CHECK-NEXT: 1496 and 28 431 1495
// CHECK-NEXT: 1497 uext 225 1496 13
// CHECK-NEXT: 1498 add 225 1370 1497
// CHECK-NEXT: 1499 slice 28 1498 12 12
// CHECK-NEXT: 1500 xor 28 414 1499
// CHECK-NEXT: 1501 xor 28 414 1500
// CHECK-NEXT: 1502 slice 28 81 0 0
// CHECK-NEXT: 1503 ite 28 1502 1446 1501
// CHECK-NEXT: 1504 output 1503 CARRYCASCOUT 
// CHECK-NEXT: 1505 input 28
// CHECK-NEXT: 1506 xor 28 1379 1487
// CHECK-NEXT: 1507 xor 28 1506 1325
// CHECK-NEXT: 1508 xor 28 414 1507
// CHECK-NEXT: 1509 input 28
// CHECK-NEXT: 1510 slice 7 644 3 0
// CHECK-NEXT: 1511 uext 7 685 1
// CHECK-NEXT: 1512 eq 28 1510 1511
// CHECK-NEXT: 1513 slice 112 411 3 2
// CHECK-NEXT: 1514 redor 28 1513
// CHECK-NEXT: 1515 or 28 1512 1514
// CHECK-NEXT: 1516 ite 28 1515 1509 1508
// CHECK-NEXT: 1517 uext 112 106 1
// CHECK-NEXT: 1518 eq 28 429 1517
// CHECK-NEXT: 1519 ite 28 1518 1516 1505
// CHECK-NEXT: 1520 input 28
// CHECK-NEXT: 1521 xor 28 1371 1491
// CHECK-NEXT: 1522 xor 28 1521 1327
// CHECK-NEXT: 1523 xor 28 414 1522
// CHECK-NEXT: 1524 input 28
// CHECK-NEXT: 1525 ite 28 1515 1524 1523
// CHECK-NEXT: 1526 redor 28 429
// CHECK-NEXT: 1527 ite 28 1526 1525 1520
// CHECK-NEXT: 1528 input 28
// CHECK-NEXT: 1529 xor 28 1359 1495
// CHECK-NEXT: 1530 xor 28 1529 1329
// CHECK-NEXT: 1531 xor 28 414 1530
// CHECK-NEXT: 1532 input 28
// CHECK-NEXT: 1533 ite 28 1515 1532 1531
// CHECK-NEXT: 1534 ite 28 1518 1533 1528
// CHECK-NEXT: 1535 concat 112 1527 1519
// CHECK-NEXT: 1536 concat 32 1534 1535
// CHECK-NEXT: 1537 concat 7 1500 1536
// CHECK-NEXT: 1538 ite 7 1502 1444 1537
// CHECK-NEXT: 1539 output 1538 CARRYOUT 
// CHECK-NEXT: 1540 slice 28 1498 13 13
// CHECK-NEXT: 1541 state 28
// CHECK-NEXT: 1542 state 28
// CHECK-NEXT: 1543 state 28
// CHECK-NEXT: 1544 init 28 1543 106
// CHECK-NEXT: 1545 concat 112 111 1543
// CHECK-NEXT: 1546 eq 28 1545 114
// CHECK-NEXT: 1547 ite 28 1546 1542 1541
// CHECK-NEXT: 1548 ite 28 1502 1547 1540
// CHECK-NEXT: 1549 output 1548 MULTSIGNOUT 
// CHECK-NEXT: 1550 input 28
// CHECK-NEXT: 1551 const 213 1000011
// CHECK-NEXT: 1552 uext 17 1551 49
// CHECK-NEXT: 1553 eq 28 95 1552
// CHECK-NEXT: 1554 ite 28 1553 106 255
// CHECK-NEXT: 1555 const 256 1010000010000010101010001010100010001010101001001001110
// CHECK-NEXT: 1556 uext 17 1555 1
// CHECK-NEXT: 1557 eq 28 95 1556
// CHECK-NEXT: 1558 ite 28 1557 255 1554
// CHECK-NEXT: 1559 ite 26 1558 894 77
// CHECK-NEXT: 1560 slice 28 411 1 1
// CHECK-NEXT: 1561 slice 28 411 1 1
// CHECK-NEXT: 1562 concat 112 1561 1560
// CHECK-NEXT: 1563 slice 28 411 1 1
// CHECK-NEXT: 1564 concat 32 1563 1562
// CHECK-NEXT: 1565 slice 28 411 1 1
// CHECK-NEXT: 1566 concat 7 1565 1564
// CHECK-NEXT: 1567 slice 28 411 1 1
// CHECK-NEXT: 1568 concat 53 1567 1566
// CHECK-NEXT: 1569 slice 28 411 1 1
// CHECK-NEXT: 1570 concat 211 1569 1568
// CHECK-NEXT: 1571 slice 28 411 1 1
// CHECK-NEXT: 1572 concat 213 1571 1570
// CHECK-NEXT: 1573 slice 28 411 1 1
// CHECK-NEXT: 1574 concat 79 1573 1572
// CHECK-NEXT: 1575 slice 28 411 1 1
// CHECK-NEXT: 1576 concat 60 1575 1574
// CHECK-NEXT: 1577 slice 28 411 1 1
// CHECK-NEXT: 1578 concat 217 1577 1576
// CHECK-NEXT: 1579 slice 28 411 1 1
// CHECK-NEXT: 1580 concat 219 1579 1578
// CHECK-NEXT: 1581 slice 28 411 1 1
// CHECK-NEXT: 1582 concat 221 1581 1580
// CHECK-NEXT: 1583 slice 28 411 1 1
// CHECK-NEXT: 1584 concat 223 1583 1582
// CHECK-NEXT: 1585 slice 28 411 1 1
// CHECK-NEXT: 1586 concat 225 1585 1584
// CHECK-NEXT: 1587 slice 28 411 1 1
// CHECK-NEXT: 1588 concat 227 1587 1586
// CHECK-NEXT: 1589 slice 28 411 1 1
// CHECK-NEXT: 1590 concat 10 1589 1588
// CHECK-NEXT: 1591 slice 28 411 1 1
// CHECK-NEXT: 1592 concat 230 1591 1590
// CHECK-NEXT: 1593 slice 28 411 1 1
// CHECK-NEXT: 1594 concat 19 1593 1592
// CHECK-NEXT: 1595 slice 28 411 1 1
// CHECK-NEXT: 1596 concat 233 1595 1594
// CHECK-NEXT: 1597 slice 28 411 1 1
// CHECK-NEXT: 1598 concat 235 1597 1596
// CHECK-NEXT: 1599 slice 28 411 1 1
// CHECK-NEXT: 1600 concat 237 1599 1598
// CHECK-NEXT: 1601 slice 28 411 1 1
// CHECK-NEXT: 1602 concat 239 1601 1600
// CHECK-NEXT: 1603 slice 28 411 1 1
// CHECK-NEXT: 1604 concat 241 1603 1602
// CHECK-NEXT: 1605 slice 28 411 1 1
// CHECK-NEXT: 1606 concat 243 1605 1604
// CHECK-NEXT: 1607 slice 28 411 1 1
// CHECK-NEXT: 1608 concat 245 1607 1606
// CHECK-NEXT: 1609 slice 28 411 1 1
// CHECK-NEXT: 1610 concat 247 1609 1608
// CHECK-NEXT: 1611 slice 28 411 1 1
// CHECK-NEXT: 1612 concat 50 1611 1610
// CHECK-NEXT: 1613 slice 28 411 1 1
// CHECK-NEXT: 1614 concat 250 1613 1612
// CHECK-NEXT: 1615 slice 28 411 1 1
// CHECK-NEXT: 1616 concat 252 1615 1614
// CHECK-NEXT: 1617 slice 28 411 1 1
// CHECK-NEXT: 1618 concat 1 1617 1616
// CHECK-NEXT: 1619 slice 28 411 1 1
// CHECK-NEXT: 1620 concat 492 1619 1618
// CHECK-NEXT: 1621 slice 28 411 1 1
// CHECK-NEXT: 1622 concat 3 1621 1620
// CHECK-NEXT: 1623 slice 28 411 1 1
// CHECK-NEXT: 1624 concat 497 1623 1622
// CHECK-NEXT: 1625 slice 28 411 1 1
// CHECK-NEXT: 1626 concat 500 1625 1624
// CHECK-NEXT: 1627 slice 28 411 1 1
// CHECK-NEXT: 1628 concat 503 1627 1626
// CHECK-NEXT: 1629 slice 28 411 1 1
// CHECK-NEXT: 1630 concat 506 1629 1628
// CHECK-NEXT: 1631 slice 28 411 1 1
// CHECK-NEXT: 1632 concat 509 1631 1630
// CHECK-NEXT: 1633 slice 28 411 1 1
// CHECK-NEXT: 1634 concat 512 1633 1632
// CHECK-NEXT: 1635 slice 28 411 1 1
// CHECK-NEXT: 1636 concat 416 1635 1634
// CHECK-NEXT: 1637 slice 28 411 1 1
// CHECK-NEXT: 1638 concat 15 1637 1636
// CHECK-NEXT: 1639 slice 28 411 1 1
// CHECK-NEXT: 1640 concat 519 1639 1638
// CHECK-NEXT: 1641 slice 28 411 1 1
// CHECK-NEXT: 1642 concat 522 1641 1640
// CHECK-NEXT: 1643 slice 28 411 1 1
// CHECK-NEXT: 1644 concat 525 1643 1642
// CHECK-NEXT: 1645 slice 28 411 1 1
// CHECK-NEXT: 1646 concat 528 1645 1644
// CHECK-NEXT: 1647 slice 28 411 1 1
// CHECK-NEXT: 1648 concat 531 1647 1646
// CHECK-NEXT: 1649 slice 28 411 1 1
// CHECK-NEXT: 1650 concat 534 1649 1648
// CHECK-NEXT: 1651 slice 28 411 1 1
// CHECK-NEXT: 1652 concat 261 1651 1650
// CHECK-NEXT: 1653 slice 28 411 1 1
// CHECK-NEXT: 1654 concat 26 1653 1652
// CHECK-NEXT: 1655 slice 221 1486 11 0
// CHECK-NEXT: 1656 slice 221 1490 11 0
// CHECK-NEXT: 1657 concat 243 1656 1655
// CHECK-NEXT: 1658 slice 221 1494 11 0
// CHECK-NEXT: 1659 concat 506 1658 1657
// CHECK-NEXT: 1660 slice 221 1498 11 0
// CHECK-NEXT: 1661 concat 26 1660 1659
// CHECK-NEXT: 1662 xor 26 1654 1661
// CHECK-NEXT: 1663 xor 26 1559 1662
// CHECK-NEXT: 1664 not 26 1663
// CHECK-NEXT: 1665 slice 534 894 45 0
// CHECK-NEXT: 1666 not 534 1665
// CHECK-NEXT: 1667 concat 26 1666 415
// CHECK-NEXT: 1668 sort bitvec 111
// CHECK-NEXT: 1669 const 1668 101001001001111010101010100111001000100010010010100111001000111010111110100110101001111010001000100010100110010
// CHECK-NEXT: 1670 uext 93 1669 1
// CHECK-NEXT: 1671 eq 28 94 1670
// CHECK-NEXT: 1672 ite 112 1671 646 415
// CHECK-NEXT: 1673 const 1668 101001001001111010101010100111001000100010010010100111001000111010111110100110101001111010001000100010100110001
// CHECK-NEXT: 1674 uext 93 1673 1
// CHECK-NEXT: 1675 eq 28 94 1674
// CHECK-NEXT: 1676 ite 112 1675 114 1672
// CHECK-NEXT: 1677 uext 93 1551 105
// CHECK-NEXT: 1678 eq 28 94 1677
// CHECK-NEXT: 1679 ite 112 1678 421 1676
// CHECK-NEXT: 1680 const 492 1001101010000010101001101001011
// CHECK-NEXT: 1681 uext 93 1680 81
// CHECK-NEXT: 1682 eq 28 94 1681
// CHECK-NEXT: 1683 ite 112 1682 415 1679
// CHECK-NEXT: 1684 eq 28 1683 646
// CHECK-NEXT: 1685 ite 26 1684 1667 72
// CHECK-NEXT: 1686 slice 261 894 46 0
// CHECK-NEXT: 1687 not 261 1686
// CHECK-NEXT: 1688 concat 26 1687 255
// CHECK-NEXT: 1689 eq 28 1683 114
// CHECK-NEXT: 1690 ite 26 1689 1688 1685
// CHECK-NEXT: 1691 uext 112 106 1
// CHECK-NEXT: 1692 eq 28 1683 1691
// CHECK-NEXT: 1693 ite 26 1692 894 1690
// CHECK-NEXT: 1694 const 261 10100000100000101010100010001000100010101010100
// CHECK-NEXT: 1695 uext 98 1694 25
// CHECK-NEXT: 1696 eq 28 99 1695
// CHECK-NEXT: 1697 ite 28 1696 106 255
// CHECK-NEXT: 1698 sort bitvec 71
// CHECK-NEXT: 1699 const 1698 10011100100111101011111010100000100000101010100010001000100010101010100
// CHECK-NEXT: 1700 uext 98 1699 1
// CHECK-NEXT: 1701 eq 28 99 1700
// CHECK-NEXT: 1702 ite 28 1701 255 1697
// CHECK-NEXT: 1703 ite 26 1702 1693 1290
// CHECK-NEXT: 1704 or 26 1664 1703
// CHECK-NEXT: 1705 redand 28 1704
// CHECK-NEXT: 1706 state 28
// CHECK-NEXT: 1707 state 28
// CHECK-NEXT: 1708 state 28
// CHECK-NEXT: 1709 init 28 1708 106
// CHECK-NEXT: 1710 concat 112 111 1708
// CHECK-NEXT: 1711 eq 28 1710 114
// CHECK-NEXT: 1712 ite 28 1711 1707 1706
// CHECK-NEXT: 1713 ite 28 1502 1712 1705
// CHECK-NEXT: 1714 not 28 1713
// CHECK-NEXT: 1715 or 26 1663 1703
// CHECK-NEXT: 1716 redand 28 1715
// CHECK-NEXT: 1717 state 28
// CHECK-NEXT: 1718 state 28
// CHECK-NEXT: 1719 state 28
// CHECK-NEXT: 1720 init 28 1719 106
// CHECK-NEXT: 1721 concat 112 111 1719
// CHECK-NEXT: 1722 eq 28 1721 114
// CHECK-NEXT: 1723 ite 28 1722 1718 1717
// CHECK-NEXT: 1724 ite 28 1502 1723 1716
// CHECK-NEXT: 1725 not 28 1724
// CHECK-NEXT: 1726 and 28 1714 1725
// CHECK-NEXT: 1727 state 28
// CHECK-NEXT: 1728 state 28
// CHECK-NEXT: 1729 state 28
// CHECK-NEXT: 1730 init 28 1729 106
// CHECK-NEXT: 1731 concat 112 111 1729
// CHECK-NEXT: 1732 eq 28 1731 114
// CHECK-NEXT: 1733 ite 28 1732 1728 1727
// CHECK-NEXT: 1734 ite 28 1502 1733 1705
// CHECK-NEXT: 1735 and 28 1726 1734
// CHECK-NEXT: 1736 ite 28 1702 1735 1550
// CHECK-NEXT: 1737 output 1736 OVERFLOW 
// CHECK-NEXT: 1738 ite 26 1502 547 1662
// CHECK-NEXT: 1739 output 1738 P 
// CHECK-NEXT: 1740 output 1724 PATTERNBDETECT 
// CHECK-NEXT: 1741 output 1713 PATTERNDETECT 
// CHECK-NEXT: 1742 output 1738 PCOUT 
// CHECK-NEXT: 1743 input 28
// CHECK-NEXT: 1744 state 28
// CHECK-NEXT: 1745 state 28
// CHECK-NEXT: 1746 state 28
// CHECK-NEXT: 1747 init 28 1746 106
// CHECK-NEXT: 1748 concat 112 111 1746
// CHECK-NEXT: 1749 eq 28 1748 114
// CHECK-NEXT: 1750 ite 28 1749 1745 1744
// CHECK-NEXT: 1751 ite 28 1502 1750 1716
// CHECK-NEXT: 1752 and 28 1726 1751
// CHECK-NEXT: 1753 ite 28 1702 1752 1743
// CHECK-NEXT: 1754 output 1753 UNDERFLOW 
// CHECK-NEXT: 1755 slice 211 1315 5 0
// CHECK-NEXT: 1756 redxor 28 1755
// CHECK-NEXT: 1757 const 492 1010100010100100101010101000101
// CHECK-NEXT: 1758 uext 15 1757 9
// CHECK-NEXT: 1759 eq 28 101 1758
// CHECK-NEXT: 1760 ite 28 1759 106 255
// CHECK-NEXT: 1761 const 416 100011001000001010011000101001101000101
// CHECK-NEXT: 1762 uext 15 1761 1
// CHECK-NEXT: 1763 eq 28 101 1762
// CHECK-NEXT: 1764 ite 28 1763 255 1760
// CHECK-NEXT: 1765 ite 28 1764 1756 255
// CHECK-NEXT: 1766 slice 211 1315 11 6
// CHECK-NEXT: 1767 redxor 28 1766
// CHECK-NEXT: 1768 ite 28 1764 1767 255
// CHECK-NEXT: 1769 xor 28 1765 1768
// CHECK-NEXT: 1770 const 416 101100001001111010100100011000100110010
// CHECK-NEXT: 1771 uext 102 1770 49
// CHECK-NEXT: 1772 eq 28 103 1771
// CHECK-NEXT: 1773 ite 28 1772 106 255
// CHECK-NEXT: 1774 sort bitvec 87
// CHECK-NEXT: 1775 const 1774 101100001001111010100100011001000110100010111110011010000111000010111110011100100110110
// CHECK-NEXT: 1776 uext 102 1775 1
// CHECK-NEXT: 1777 eq 28 103 1776
// CHECK-NEXT: 1778 ite 28 1777 255 1773
// CHECK-NEXT: 1779 ite 28 1778 1765 1769
// CHECK-NEXT: 1780 slice 211 1315 17 12
// CHECK-NEXT: 1781 redxor 28 1780
// CHECK-NEXT: 1782 ite 28 1764 1781 255
// CHECK-NEXT: 1783 slice 211 1315 23 18
// CHECK-NEXT: 1784 redxor 28 1783
// CHECK-NEXT: 1785 ite 28 1764 1784 255
// CHECK-NEXT: 1786 xor 28 1782 1785
// CHECK-NEXT: 1787 xor 28 1769 1786
// CHECK-NEXT: 1788 ite 28 1778 1768 1787
// CHECK-NEXT: 1789 ite 28 1778 1782 1786
// CHECK-NEXT: 1790 slice 211 1315 29 24
// CHECK-NEXT: 1791 redxor 28 1790
// CHECK-NEXT: 1792 ite 28 1764 1791 255
// CHECK-NEXT: 1793 slice 211 1315 35 30
// CHECK-NEXT: 1794 redxor 28 1793
// CHECK-NEXT: 1795 ite 28 1764 1794 255
// CHECK-NEXT: 1796 xor 28 1792 1795
// CHECK-NEXT: 1797 slice 211 1315 41 36
// CHECK-NEXT: 1798 redxor 28 1797
// CHECK-NEXT: 1799 ite 28 1764 1798 255
// CHECK-NEXT: 1800 slice 211 1315 47 42
// CHECK-NEXT: 1801 redxor 28 1800
// CHECK-NEXT: 1802 ite 28 1764 1801 255
// CHECK-NEXT: 1803 xor 28 1799 1802
// CHECK-NEXT: 1804 xor 28 1796 1803
// CHECK-NEXT: 1805 xor 28 1787 1804
// CHECK-NEXT: 1806 ite 28 1778 1785 1805
// CHECK-NEXT: 1807 ite 28 1778 1792 1796
// CHECK-NEXT: 1808 ite 28 1778 1795 1804
// CHECK-NEXT: 1809 ite 28 1778 1799 1803
// CHECK-NEXT: 1810 concat 112 1788 1779
// CHECK-NEXT: 1811 concat 32 1789 1810
// CHECK-NEXT: 1812 concat 7 1806 1811
// CHECK-NEXT: 1813 concat 53 1807 1812
// CHECK-NEXT: 1814 concat 211 1808 1813
// CHECK-NEXT: 1815 concat 213 1809 1814
// CHECK-NEXT: 1816 concat 79 1802 1815
// CHECK-NEXT: 1817 state 79
// CHECK-NEXT: 1818 state 79
// CHECK-NEXT: 1819 state 28
// CHECK-NEXT: 1820 init 28 1819 106
// CHECK-NEXT: 1821 concat 112 111 1819
// CHECK-NEXT: 1822 eq 28 1821 114
// CHECK-NEXT: 1823 ite 79 1822 1818 1817
// CHECK-NEXT: 1824 ite 79 1502 1823 1816
// CHECK-NEXT: 1825 output 1824 XOROUT 
// CHECK-NEXT: 1826 uext 1 116 0 A1_reg 
// CHECK-NEXT: 1827 uext 50 968 0 A2A1 
// CHECK-NEXT: 1828 uext 1 273 0 A2_reg 
// CHECK-NEXT: 1829 uext 112 277 0 ACASCREG_BIN 
// CHECK-NEXT: 1830 uext 3 4 0 ACASCREG_REG 
// CHECK-NEXT: 1831 uext 1 5 0 ACIN_in 
// CHECK-NEXT: 1832 uext 28 1154 0 ADREG_BIN 
// CHECK-NEXT: 1833 uext 28 1155 0 ADREG_INT 
// CHECK-NEXT: 1834 uext 3 6 0 ADREG_REG 
// CHECK-NEXT: 1835 uext 50 1156 0 AD_DATA 
// CHECK-NEXT: 1836 uext 50 1153 0 AD_DATA_reg 
// CHECK-NEXT: 1837 uext 50 1146 0 AD_in 
// CHECK-NEXT: 1838 uext 28 414 0 ALUMODE10_in 
// CHECK-NEXT: 1839 uext 28 1437 0 ALUMODE10_reg 
// CHECK-NEXT: 1840 uext 28 410 0 ALUMODEREG_BIN 
// CHECK-NEXT: 1841 uext 3 9 0 ALUMODEREG_REG 
// CHECK-NEXT: 1842 uext 7 411 0 ALUMODE_DATA 
// CHECK-NEXT: 1843 uext 7 402 0 ALUMODE_in 
// CHECK-NEXT: 1844 uext 7 409 0 ALUMODE_reg 
// CHECK-NEXT: 1845 uext 26 1662 0 ALU_OUT_in 
// CHECK-NEXT: 1846 uext 26 547 0 ALU_OUT_reg 
// CHECK-NEXT: 1847 uext 28 1413 0 AMULT26_in 
// CHECK-NEXT: 1848 uext 28 1090 0 AMULTSEL_BIN 
// CHECK-NEXT: 1849 uext 10 11 0 AMULTSEL_REG 
// CHECK-NEXT: 1850 uext 112 274 0 AREG_BIN 
// CHECK-NEXT: 1851 uext 3 12 0 AREG_REG 
// CHECK-NEXT: 1852 sort bitvec 119
// CHECK-NEXT: 1853 const 1852 10100100100010101010011010001010101010001011111010011100100111101010100010111110100110101000001010101000100001101001000
// CHECK-NEXT: 1854 uext 13 1853 1
// CHECK-NEXT: 1855 eq 28 14 1854
// CHECK-NEXT: 1856 ite 112 1855 114 415
// CHECK-NEXT: 1857 const 1774 101001001000101010100110100010101010100010111110100110101000001010101000100001101001000
// CHECK-NEXT: 1858 uext 13 1857 33
// CHECK-NEXT: 1859 eq 28 14 1858
// CHECK-NEXT: 1860 ite 112 1859 421 1856
// CHECK-NEXT: 1861 const 1108 100111001001111010111110101001001000101010100110100010101010100
// CHECK-NEXT: 1862 uext 13 1861 57
// CHECK-NEXT: 1863 eq 28 14 1862
// CHECK-NEXT: 1864 ite 112 1863 415 1860
// CHECK-NEXT: 1865 uext 112 1864 0 AUTORESET_PATDET_BIN 
// CHECK-NEXT: 1866 uext 13 14 0 AUTORESET_PATDET_REG 
// CHECK-NEXT: 1867 const 241 10000110100010101010000
// CHECK-NEXT: 1868 uext 15 1867 17
// CHECK-NEXT: 1869 eq 28 16 1868
// CHECK-NEXT: 1870 ite 28 1869 106 255
// CHECK-NEXT: 1871 const 416 101001001000101010100110100010101010100
// CHECK-NEXT: 1872 uext 15 1871 1
// CHECK-NEXT: 1873 eq 28 16 1872
// CHECK-NEXT: 1874 ite 28 1873 255 1870
// CHECK-NEXT: 1875 uext 28 1874 0 AUTORESET_PRIORITY_BIN 
// CHECK-NEXT: 1876 uext 15 16 0 AUTORESET_PRIORITY_REG 
// CHECK-NEXT: 1877 uext 1 276 0 A_ALU 
// CHECK-NEXT: 1878 uext 28 265 0 A_INPUT_BIN 
// CHECK-NEXT: 1879 uext 17 18 0 A_INPUT_REG 
// CHECK-NEXT: 1880 uext 1 254 0 A_in 
// CHECK-NEXT: 1881 uext 19 287 0 B1_DATA_out 
// CHECK-NEXT: 1882 uext 19 1123 0 B2B1 
// CHECK-NEXT: 1883 uext 19 375 0 B2_DATA 
// CHECK-NEXT: 1884 uext 19 372 0 B2_reg 
// CHECK-NEXT: 1885 uext 112 376 0 BCASCREG_BIN 
// CHECK-NEXT: 1886 uext 3 21 0 BCASCREG_REG 
// CHECK-NEXT: 1887 uext 19 22 0 BCIN_in 
// CHECK-NEXT: 1888 uext 28 1414 0 BMULT17_in 
// CHECK-NEXT: 1889 uext 28 1097 0 BMULTSEL_BIN 
// CHECK-NEXT: 1890 uext 10 23 0 BMULTSEL_REG 
// CHECK-NEXT: 1891 uext 112 373 0 BREG_BIN 
// CHECK-NEXT: 1892 uext 3 24 0 BREG_REG 
// CHECK-NEXT: 1893 uext 19 375 0 B_ALU 
// CHECK-NEXT: 1894 uext 28 364 0 B_INPUT_BIN 
// CHECK-NEXT: 1895 uext 17 25 0 B_INPUT_REG 
// CHECK-NEXT: 1896 uext 19 358 0 B_in 
// CHECK-NEXT: 1897 uext 28 29 0 CARRYCASCIN_in 
// CHECK-NEXT: 1898 uext 28 1472 0 CARRYINREG_BIN 
// CHECK-NEXT: 1899 uext 3 31 0 CARRYINREG_REG 
// CHECK-NEXT: 1900 uext 28 1408 0 CARRYINSELREG_BIN 
// CHECK-NEXT: 1901 uext 3 34 0 CARRYINSELREG_REG 
// CHECK-NEXT: 1902 uext 32 1400 0 CARRYINSEL_in 
// CHECK-NEXT: 1903 uext 32 1409 0 CARRYINSEL_mux 
// CHECK-NEXT: 1904 uext 32 1407 0 CARRYINSEL_reg 
// CHECK-NEXT: 1905 uext 28 1464 0 CARRYIN_in 
// CHECK-NEXT: 1906 uext 28 1473 0 CARRYIN_mux 
// CHECK-NEXT: 1907 uext 28 1471 0 CARRYIN_reg 
// CHECK-NEXT: 1908 uext 28 1446 0 CCOUT_in 
// CHECK-NEXT: 1909 neq 28 35 106
// CHECK-NEXT: 1910 and 28 1909 35
// CHECK-NEXT: 1911 uext 28 1910 0 CEA1_in 
// CHECK-NEXT: 1912 neq 28 36 106
// CHECK-NEXT: 1913 and 28 1912 36
// CHECK-NEXT: 1914 uext 28 1913 0 CEA2_in 
// CHECK-NEXT: 1915 neq 28 37 106
// CHECK-NEXT: 1916 and 28 1915 37
// CHECK-NEXT: 1917 uext 28 1916 0 CEAD_in 
// CHECK-NEXT: 1918 neq 28 38 106
// CHECK-NEXT: 1919 and 28 1918 38
// CHECK-NEXT: 1920 uext 28 1919 0 CEALUMODE_in 
// CHECK-NEXT: 1921 neq 28 39 106
// CHECK-NEXT: 1922 and 28 1921 39
// CHECK-NEXT: 1923 uext 28 1922 0 CEB1_in 
// CHECK-NEXT: 1924 neq 28 40 106
// CHECK-NEXT: 1925 and 28 1924 40
// CHECK-NEXT: 1926 uext 28 1925 0 CEB2_in 
// CHECK-NEXT: 1927 neq 28 42 106
// CHECK-NEXT: 1928 and 28 1927 42
// CHECK-NEXT: 1929 uext 28 1928 0 CECARRYIN_in 
// CHECK-NEXT: 1930 neq 28 43 106
// CHECK-NEXT: 1931 and 28 1930 43
// CHECK-NEXT: 1932 uext 28 1931 0 CECTRL_in 
// CHECK-NEXT: 1933 neq 28 41 106
// CHECK-NEXT: 1934 and 28 1933 41
// CHECK-NEXT: 1935 uext 28 1934 0 CEC_in 
// CHECK-NEXT: 1936 neq 28 44 106
// CHECK-NEXT: 1937 and 28 1936 44
// CHECK-NEXT: 1938 uext 28 1937 0 CED_in 
// CHECK-NEXT: 1939 uext 28 45 0 CEINMODE_in 
// CHECK-NEXT: 1940 neq 28 46 106
// CHECK-NEXT: 1941 and 28 1940 46
// CHECK-NEXT: 1942 uext 28 1941 0 CEM_in 
// CHECK-NEXT: 1943 neq 28 47 106
// CHECK-NEXT: 1944 and 28 1943 47
// CHECK-NEXT: 1945 uext 28 1944 0 CEP_in 
// CHECK-NEXT: 1946 uext 28 111 0 CLK_in 
// CHECK-NEXT: 1947 uext 7 1537 0 COUT_in 
// CHECK-NEXT: 1948 uext 7 1444 0 COUT_reg 
// CHECK-NEXT: 1949 uext 28 893 0 CREG_BIN 
// CHECK-NEXT: 1950 uext 3 49 0 CREG_REG 
// CHECK-NEXT: 1951 uext 26 894 0 C_DATA_in 
// CHECK-NEXT: 1952 uext 26 885 0 C_in 
// CHECK-NEXT: 1953 uext 26 892 0 C_reg 
// CHECK-NEXT: 1954 uext 28 1083 0 DREG_BIN 
// CHECK-NEXT: 1955 uext 28 1115 0 DREG_INT 
// CHECK-NEXT: 1956 uext 3 52 0 DREG_REG 
// CHECK-NEXT: 1957 uext 50 1116 0 D_DATA 
// CHECK-NEXT: 1958 uext 50 1118 0 D_DATA_mux 
// CHECK-NEXT: 1959 uext 50 1082 0 D_DATA_reg 
// CHECK-NEXT: 1960 uext 50 1075 0 D_in 
// CHECK-NEXT: 1961 uext 28 952 0 INMODEREG_BIN 
// CHECK-NEXT: 1962 uext 3 55 0 INMODEREG_REG 
// CHECK-NEXT: 1963 uext 53 944 0 INMODE_in 
// CHECK-NEXT: 1964 uext 53 953 0 INMODE_mux 
// CHECK-NEXT: 1965 uext 53 951 0 INMODE_reg 
// CHECK-NEXT: 1966 uext 7 56 0 IS_ALUMODE_INVERTED_REG 
// CHECK-NEXT: 1967 uext 28 57 0 IS_CARRYIN_INVERTED_REG 
// CHECK-NEXT: 1968 uext 28 58 0 IS_CLK_INVERTED_REG 
// CHECK-NEXT: 1969 uext 53 59 0 IS_INMODE_INVERTED_REG 
// CHECK-NEXT: 1970 uext 60 61 0 IS_OPMODE_INVERTED_REG 
// CHECK-NEXT: 1971 uext 28 62 0 IS_RSTALLCARRYIN_INVERTED_REG 
// CHECK-NEXT: 1972 uext 28 63 0 IS_RSTALUMODE_INVERTED_REG 
// CHECK-NEXT: 1973 uext 28 64 0 IS_RSTA_INVERTED_REG 
// CHECK-NEXT: 1974 uext 28 65 0 IS_RSTB_INVERTED_REG 
// CHECK-NEXT: 1975 uext 28 66 0 IS_RSTCTRL_INVERTED_REG 
// CHECK-NEXT: 1976 uext 28 67 0 IS_RSTC_INVERTED_REG 
// CHECK-NEXT: 1977 uext 28 68 0 IS_RSTD_INVERTED_REG 
// CHECK-NEXT: 1978 uext 28 69 0 IS_RSTINMODE_INVERTED_REG 
// CHECK-NEXT: 1979 uext 28 70 0 IS_RSTM_INVERTED_REG 
// CHECK-NEXT: 1980 uext 28 71 0 IS_RSTP_INVERTED_REG 
// CHECK-NEXT: 1981 uext 26 72 0 MASK_REG 
// CHECK-NEXT: 1982 uext 28 1264 0 MREG_BIN 
// CHECK-NEXT: 1983 uext 3 73 0 MREG_REG 
// CHECK-NEXT: 1984 uext 28 74 0 MULTSIGNIN_in 
// CHECK-NEXT: 1985 uext 28 1540 0 MULTSIGN_ALU_in 
// CHECK-NEXT: 1986 uext 28 1547 0 MULTSIGN_ALU_reg 
// CHECK-NEXT: 1987 uext 28 643 0 OPMODEREG_BIN 
// CHECK-NEXT: 1988 uext 3 76 0 OPMODEREG_REG 
// CHECK-NEXT: 1989 uext 60 635 0 OPMODE_in 
// CHECK-NEXT: 1990 uext 60 644 0 OPMODE_mux 
// CHECK-NEXT: 1991 uext 60 642 0 OPMODE_reg 
// CHECK-NEXT: 1992 uext 26 77 0 PATTERN_REG 
// CHECK-NEXT: 1993 uext 26 78 0 PCIN_in 
// CHECK-NEXT: 1994 uext 28 964 0 PREADDINSEL_BIN 
// CHECK-NEXT: 1995 uext 79 80 0 PREADDINSEL_REG 
// CHECK-NEXT: 1996 uext 50 1142 0 PREADD_AB 
// CHECK-NEXT: 1997 uext 28 1502 0 PREG_BIN 
// CHECK-NEXT: 1998 uext 3 81 0 PREG_REG 
// CHECK-NEXT: 1999 uext 28 1388 0 P_FDBK_47_in 
// CHECK-NEXT: 2000 uext 26 547 0 P_FDBK_in 
// CHECK-NEXT: 2001 uext 26 82 0 RND_REG 
// CHECK-NEXT: 2002 neq 28 84 106
// CHECK-NEXT: 2003 xor 28 84 62
// CHECK-NEXT: 2004 and 28 2002 2003
// CHECK-NEXT: 2005 uext 28 2004 0 RSTALLCARRYIN_in 
// CHECK-NEXT: 2006 neq 28 85 106
// CHECK-NEXT: 2007 xor 28 85 63
// CHECK-NEXT: 2008 and 28 2006 2007
// CHECK-NEXT: 2009 uext 28 2008 0 RSTALUMODE_in 
// CHECK-NEXT: 2010 neq 28 83 106
// CHECK-NEXT: 2011 xor 28 83 64
// CHECK-NEXT: 2012 and 28 2010 2011
// CHECK-NEXT: 2013 uext 28 2012 0 RSTA_in 
// CHECK-NEXT: 2014 neq 28 86 106
// CHECK-NEXT: 2015 xor 28 86 65
// CHECK-NEXT: 2016 and 28 2014 2015
// CHECK-NEXT: 2017 uext 28 2016 0 RSTB_in 
// CHECK-NEXT: 2018 neq 28 88 106
// CHECK-NEXT: 2019 xor 28 88 66
// CHECK-NEXT: 2020 and 28 2018 2019
// CHECK-NEXT: 2021 uext 28 2020 0 RSTCTRL_in 
// CHECK-NEXT: 2022 neq 28 87 106
// CHECK-NEXT: 2023 xor 28 87 67
// CHECK-NEXT: 2024 and 28 2022 2023
// CHECK-NEXT: 2025 uext 28 2024 0 RSTC_in 
// CHECK-NEXT: 2026 neq 28 89 106
// CHECK-NEXT: 2027 xor 28 89 68
// CHECK-NEXT: 2028 and 28 2026 2027
// CHECK-NEXT: 2029 uext 28 2028 0 RSTD_in 
// CHECK-NEXT: 2030 neq 28 90 106
// CHECK-NEXT: 2031 xor 28 90 69
// CHECK-NEXT: 2032 and 28 2030 2031
// CHECK-NEXT: 2033 uext 28 2032 0 RSTINMODE_in 
// CHECK-NEXT: 2034 neq 28 91 106
// CHECK-NEXT: 2035 xor 28 91 70
// CHECK-NEXT: 2036 and 28 2034 2035
// CHECK-NEXT: 2037 uext 28 2036 0 RSTM_in 
// CHECK-NEXT: 2038 neq 28 92 106
// CHECK-NEXT: 2039 xor 28 92 71
// CHECK-NEXT: 2040 and 28 2038 2039
// CHECK-NEXT: 2041 uext 28 2040 0 RSTP_in 
// CHECK-NEXT: 2042 uext 112 1683 0 SEL_MASK_BIN 
// CHECK-NEXT: 2043 uext 93 94 0 SEL_MASK_REG 
// CHECK-NEXT: 2044 uext 28 1558 0 SEL_PATTERN_BIN 
// CHECK-NEXT: 2045 uext 17 95 0 SEL_PATTERN_REG 
// CHECK-NEXT: 2046 uext 112 1112 0 USE_MULT_BIN 
// CHECK-NEXT: 2047 uext 96 97 0 USE_MULT_REG 
// CHECK-NEXT: 2048 uext 28 1702 0 USE_PATTERN_DETECT_BIN 
// CHECK-NEXT: 2049 uext 98 99 0 USE_PATTERN_DETECT_REG 
// CHECK-NEXT: 2050 uext 112 429 0 USE_SIMD_BIN 
// CHECK-NEXT: 2051 uext 26 100 0 USE_SIMD_REG 
// CHECK-NEXT: 2052 uext 28 1764 0 USE_WIDEXOR_BIN 
// CHECK-NEXT: 2053 uext 15 101 0 USE_WIDEXOR_REG 
// CHECK-NEXT: 2054 uext 531 1265 0 U_DATA 
// CHECK-NEXT: 2055 uext 531 1268 0 U_DATA_in 
// CHECK-NEXT: 2056 uext 531 1263 0 U_DATA_reg 
// CHECK-NEXT: 2057 uext 528 1255 0 U_in
// CHECK-NEXT: 2058 uext 531 1305 0 V_DATA 
// CHECK-NEXT: 2059 uext 531 1306 0 V_DATA_in 
// CHECK-NEXT: 2060 uext 531 1304 0 V_DATA_reg 
// CHECK-NEXT: 2061 uext 531 1297 0 V_in 
// CHECK-NEXT: 2062 uext 28 1778 0 XORSIMD_BIN 
// CHECK-NEXT: 2063 uext 102 103 0 XORSIMD_REG 
// CHECK-NEXT: 2064 uext 79 1816 0 XOR_MX_in 
// CHECK-NEXT: 2065 uext 79 1823 0 XOR_MX_reg 
// CHECK-NEXT: 2066 sort bitvec 49
// CHECK-NEXT: 2067 concat 2066 1358 1480
// CHECK-NEXT: 2068 uext 2066 2067 0 a_int 
// CHECK-NEXT: 2069 uext 50 1157 0 a_mult_mux 
// CHECK-NEXT: 2070 not 28 1874
// CHECK-NEXT: 2071 or 28 2070 1944
// CHECK-NEXT: 2072 uext 28 2071 0 auto_reset_pri 
// CHECK-NEXT: 2073 uext 19 1195 0 b_mult_mux 
// CHECK-NEXT: 2074 uext 28 1416 0 c_mult 
// CHECK-NEXT: 2075 uext 28 1941 0 ce_m_g 
// CHECK-NEXT: 2076 uext 28 1480 0 cin 
// CHECK-NEXT: 2077 uext 28 1477 0 cin_b 
// CHECK-NEXT: 2078 uext 26 1320 0 co 
// CHECK-NEXT: 2079 uext 28 1380 0 co12_lsb 
// CHECK-NEXT: 2080 uext 28 1372 0 co24_lsb 
// CHECK-NEXT: 2081 uext 28 1360 0 co36_lsb 
// CHECK-NEXT: 2082 uext 26 1324 0 comux 
// CHECK-NEXT: 2083 slice 219 1324 10 0
// CHECK-NEXT: 2084 concat 221 1326 2083
// CHECK-NEXT: 2085 slice 219 1324 22 12
// CHECK-NEXT: 2086 concat 241 2085 2084
// CHECK-NEXT: 2087 concat 243 1328 2086
// CHECK-NEXT: 2088 slice 219 1324 34 24
// CHECK-NEXT: 2089 concat 503 2088 2087
// CHECK-NEXT: 2090 concat 506 1330 2089
// CHECK-NEXT: 2091 slice 221 1324 47 36
// CHECK-NEXT: 2092 concat 26 2091 2090
// CHECK-NEXT: 2093 uext 26 2092 0 comux4simd 
// CHECK-NEXT: 2094 uext 26 1358 0 comux_w 
// CHECK-NEXT: 2095 uext 28 1508 0 cout0 
// CHECK-NEXT: 2096 uext 28 1523 0 cout1 
// CHECK-NEXT: 2097 uext 28 1531 0 cout2 
// CHECK-NEXT: 2098 uext 28 1500 0 cout3 
// CHECK-NEXT: 2099 uext 28 1540 0 cout4 
// CHECK-NEXT: 2100 uext 28 1516 0 cout_0 
// CHECK-NEXT: 2101 uext 28 1525 0 cout_1 
// CHECK-NEXT: 2102 uext 28 1533 0 cout_2 
// CHECK-NEXT: 2103 uext 28 1500 0 cout_3 
// CHECK-NEXT: 2104 ite 28 1941 1416 1423
// CHECK-NEXT: 2105 uext 28 2104 0 d_carryin_int 
// CHECK-NEXT: 2106 ite 28 2004 255 2104
// CHECK-NEXT: 2107 uext 28 2106 0 dr_carryin_int 
// CHECK-NEXT: 2108 uext 28 255 0 glblGSR 
// CHECK-NEXT: 2109 uext 28 1488 0 intc1 
// CHECK-NEXT: 2110 uext 28 1492 0 intc2 
// CHECK-NEXT: 2111 uext 28 1496 0 intc3 
// CHECK-NEXT: 2112 uext 531 1252 0 mult 
// CHECK-NEXT: 2113 uext 28 1515 0 mult_or_logic 
// CHECK-NEXT: 2114 uext 28 1424 0 multcarryin_data 
// CHECK-NEXT: 2115 uext 28 106 0 opmode_valid_flag_dou 
// CHECK-NEXT: 2116 uext 28 1734 0 overflow_data 
// CHECK-NEXT: 2117 uext 28 1705 0 pdet_o 
// CHECK-NEXT: 2118 uext 28 1713 0 pdet_o_mux 
// CHECK-NEXT: 2119 uext 28 1712 0 pdet_o_reg1 
// CHECK-NEXT: 2120 uext 28 1733 0 pdet_o_reg2 
// CHECK-NEXT: 2121 uext 28 1716 0 pdetb_o 
// CHECK-NEXT: 2122 uext 28 1724 0 pdetb_o_mux 
// CHECK-NEXT: 2123 uext 28 1723 0 pdetb_o_reg1 
// CHECK-NEXT: 2124 uext 28 1750 0 pdetb_o_reg2 
// CHECK-NEXT: 2125 uext 528 1254 0 ps_u_mask 
// CHECK-NEXT: 2126 uext 528 1293 0 ps_v_mask 
// CHECK-NEXT: 2127 uext 28 1423 0 qmultcarryin 
// CHECK-NEXT: 2128 uext 28 2004 0 rst_carryin_g 
// CHECK-NEXT: 2129 uext 26 1315 0 s 
// CHECK-NEXT: 2130 uext 223 1486 0 s0 
// CHECK-NEXT: 2131 uext 223 1490 0 s1 
// CHECK-NEXT: 2132 uext 223 1494 0 s2 
// CHECK-NEXT: 2133 uext 225 1498 0 s3 
// CHECK-NEXT: 2134 uext 26 1322 0 smux 
// CHECK-NEXT: 2135 uext 26 1365 0 smux_w 
// CHECK-NEXT: 2136 and 28 2071 1734
// CHECK-NEXT: 2137 and 28 2136 1714
// CHECK-NEXT: 2138 eq 28 1864 114
// CHECK-NEXT: 2139 ite 28 2138 2137 255
// CHECK-NEXT: 2140 and 28 2071 1713
// CHECK-NEXT: 2141 uext 112 106 1
// CHECK-NEXT: 2142 eq 28 1864 2141
// CHECK-NEXT: 2143 ite 28 2142 2140 2139
// CHECK-NEXT: 2144 uext 28 2143 0 the_auto_reset_patdet 
// CHECK-NEXT: 2145 uext 26 1703 0 the_mask 
// CHECK-NEXT: 2146 uext 26 1559 0 the_pattern 
// CHECK-NEXT: 2147 uext 28 1751 0 underflow_data 
// CHECK-NEXT: 2148 uext 26 1354 0 wmux 
// CHECK-NEXT: 2149 uext 112 1279 0 x_mac_cascd
// CHECK-NEXT: 2150 uext 26 1284 0 xmux 
// CHECK-NEXT: 2151 uext 28 1765 0 xor_12a 
// CHECK-NEXT: 2152 uext 28 1768 0 xor_12b 
// CHECK-NEXT: 2153 uext 28 1782 0 xor_12c 
// CHECK-NEXT: 2154 uext 28 1785 0 xor_12d 
// CHECK-NEXT: 2155 uext 28 1792 0 xor_12e 
// CHECK-NEXT: 2156 uext 28 1795 0 xor_12f 
// CHECK-NEXT: 2157 uext 28 1799 0 xor_12g 
// CHECK-NEXT: 2158 uext 28 1802 0 xor_12h 
// CHECK-NEXT: 2159 uext 28 1769 0 xor_24a 
// CHECK-NEXT: 2160 uext 28 1786 0 xor_24b 
// CHECK-NEXT: 2161 uext 28 1796 0 xor_24c 
// CHECK-NEXT: 2162 uext 28 1803 0 xor_24d 
// CHECK-NEXT: 2163 uext 28 1787 0 xor_48a 
// CHECK-NEXT: 2164 uext 28 1804 0 xor_48b 
// CHECK-NEXT: 2165 uext 28 1805 0 xor_96 
// CHECK-NEXT: 2166 uext 26 1314 0 ymux 
// CHECK-NEXT: 2167 uext 26 905 0 z_optinv 
// CHECK-NEXT: 2168 uext 26 904 0 zmux 
// CHECK-NEXT: 2169 next 1 104 116
// CHECK-NEXT: 2170 ite 1 1910 266 116
// CHECK-NEXT: 2171 const 1 000000000000000000000000000000
// CHECK-NEXT: 2172 redor 28 274
// CHECK-NEXT: 2173 not 28 2172
// CHECK-NEXT: 2174 or 28 2012 2173
// CHECK-NEXT: 2175 ite 1 2174 2171 2170
// CHECK-NEXT: 2176 next 1 105 2175
// CHECK-NEXT: 2177 next 28 107 111
// CHECK-NEXT: 2178 next 1 267 273
// CHECK-NEXT: 2179 eq 28 274 114
// CHECK-NEXT: 2180 ite 1 2179 116 266
// CHECK-NEXT: 2181 ite 1 1913 2180 273
// CHECK-NEXT: 2182 ite 1 2174 2171 2181
// CHECK-NEXT: 2183 next 1 268 2182
// CHECK-NEXT: 2184 next 28 269 111
// CHECK-NEXT: 2185 next 19 281 287
// CHECK-NEXT: 2186 ite 19 1922 365 287
// CHECK-NEXT: 2187 redor 28 373
// CHECK-NEXT: 2188 not 28 2187
// CHECK-NEXT: 2189 or 28 2016 2188
// CHECK-NEXT: 2190 ite 19 2189 1121 2186
// CHECK-NEXT: 2191 next 19 282 2190
// CHECK-NEXT: 2192 next 28 283 111
// CHECK-NEXT: 2193 next 19 366 372
// CHECK-NEXT: 2194 eq 28 373 114
// CHECK-NEXT: 2195 ite 19 2194 287 365
// CHECK-NEXT: 2196 ite 19 1925 2195 372
// CHECK-NEXT: 2197 ite 19 2016 1121 2196
// CHECK-NEXT: 2198 next 19 367 2197
// CHECK-NEXT: 2199 next 28 368 111
// CHECK-NEXT: 2200 next 7 403 409
// CHECK-NEXT: 2201 ite 7 1919 402 409
// CHECK-NEXT: 2202 const 7 0000
// CHECK-NEXT: 2203 ite 7 2008 2202 2201
// CHECK-NEXT: 2204 next 7 404 2203
// CHECK-NEXT: 2205 next 28 405 111
// CHECK-NEXT: 2206 next 26 541 547
// CHECK-NEXT: 2207 and 28 1944 1502
// CHECK-NEXT: 2208 ite 26 2207 1662 547
// CHECK-NEXT: 2209 or 28 2040 2143
// CHECK-NEXT: 2210 ite 26 2209 901 2208
// CHECK-NEXT: 2211 next 26 542 2210
// CHECK-NEXT: 2212 next 28 543 111
// CHECK-NEXT: 2213 next 60 636 642
// CHECK-NEXT: 2214 ite 60 1931 635 642
// CHECK-NEXT: 2215 const 60 000000000
// CHECK-NEXT: 2216 ite 60 2020 2215 2214
// CHECK-NEXT: 2217 next 60 637 2216
// CHECK-NEXT: 2218 next 28 638 111
// CHECK-NEXT: 2219 next 26 886 892
// CHECK-NEXT: 2220 ite 26 1934 885 892
// CHECK-NEXT: 2221 not 28 893
// CHECK-NEXT: 2222 or 28 2024 2221
// CHECK-NEXT: 2223 ite 26 2222 901 2220
// CHECK-NEXT: 2224 next 26 887 2223
// CHECK-NEXT: 2225 next 28 888 111
// CHECK-NEXT: 2226 next 53 945 951
// CHECK-NEXT: 2227 ite 53 45 944 951
// CHECK-NEXT: 2228 const 53 00000
// CHECK-NEXT: 2229 not 28 952
// CHECK-NEXT: 2230 or 28 2032 2229
// CHECK-NEXT: 2231 ite 53 2230 2228 2227
// CHECK-NEXT: 2232 next 53 946 2231
// CHECK-NEXT: 2233 next 28 947 111
// CHECK-NEXT: 2234 next 50 1076 1082
// CHECK-NEXT: 2235 ite 50 1937 1075 1082
// CHECK-NEXT: 2236 not 28 1115
// CHECK-NEXT: 2237 or 28 2028 2236
// CHECK-NEXT: 2238 ite 50 2237 956 2235
// CHECK-NEXT: 2239 next 50 1077 2238
// CHECK-NEXT: 2240 next 28 1078 111
// CHECK-NEXT: 2241 next 50 1147 1153
// CHECK-NEXT: 2242 ite 50 1916 1146 1153
// CHECK-NEXT: 2243 ite 50 2028 956 2242
// CHECK-NEXT: 2244 next 50 1148 2243
// CHECK-NEXT: 2245 next 28 1149 111
// CHECK-NEXT: 2246 next 531 1257 1263
// CHECK-NEXT: 2247 ite 531 1941 1256 1263
// CHECK-NEXT: 2248 not 28 1264
// CHECK-NEXT: 2249 or 28 2036 2248
// CHECK-NEXT: 2250 ite 531 2249 1251 2247
// CHECK-NEXT: 2251 next 531 1258 2250
// CHECK-NEXT: 2252 next 28 1259 111
// CHECK-NEXT: 2253 next 531 1298 1304
// CHECK-NEXT: 2254 ite 531 1941 1297 1304
// CHECK-NEXT: 2255 ite 531 2249 1251 2254
// CHECK-NEXT: 2256 next 531 1299 2255
// CHECK-NEXT: 2257 next 28 1300 111
// CHECK-NEXT: 2258 next 32 1401 1407
// CHECK-NEXT: 2259 ite 32 1931 1400 1407
// CHECK-NEXT: 2260 ite 32 2020 1307 2259
// CHECK-NEXT: 2261 next 32 1402 2260
// CHECK-NEXT: 2262 next 28 1403 111
// CHECK-NEXT: 2263 next 28 1417 1423
// CHECK-NEXT: 2264 next 28 1418 2106
// CHECK-NEXT: 2265 next 28 1419 111
// CHECK-NEXT: 2266 next 28 1431 1437
// CHECK-NEXT: 2267 ite 28 2207 414 1437
// CHECK-NEXT: 2268 ite 28 2209 255 2267
// CHECK-NEXT: 2269 next 28 1432 2268
// CHECK-NEXT: 2270 next 28 1433 111
// CHECK-NEXT: 2271 next 7 1438 1444
// CHECK-NEXT: 2272 ite 7 2207 1537 1444
// CHECK-NEXT: 2273 ite 7 2209 2202 2272
// CHECK-NEXT: 2274 next 7 1439 2273
// CHECK-NEXT: 2275 next 28 1440 111
// CHECK-NEXT: 2276 next 28 1465 1471
// CHECK-NEXT: 2277 ite 28 1928 1464 1471
// CHECK-NEXT: 2278 ite 28 2004 255 2277
// CHECK-NEXT: 2279 next 28 1466 2278
// CHECK-NEXT: 2280 next 28 1467 111
// CHECK-NEXT: 2281 next 28 1541 1547
// CHECK-NEXT: 2282 ite 28 2207 1540 1547
// CHECK-NEXT: 2283 ite 28 2209 255 2282
// CHECK-NEXT: 2284 next 28 1542 2283
// CHECK-NEXT: 2285 next 28 1543 111
// CHECK-NEXT: 2286 next 28 1706 1712
// CHECK-NEXT: 2287 ite 28 2207 1705 1712
// CHECK-NEXT: 2288 ite 28 2209 255 2287
// CHECK-NEXT: 2289 next 28 1707 2288
// CHECK-NEXT: 2290 next 28 1708 111
// CHECK-NEXT: 2291 next 28 1717 1723
// CHECK-NEXT: 2292 ite 28 2207 1716 1723
// CHECK-NEXT: 2293 ite 28 2209 255 2292
// CHECK-NEXT: 2294 next 28 1718 2293
// CHECK-NEXT: 2295 next 28 1719 111
// CHECK-NEXT: 2296 next 28 1727 1733
// CHECK-NEXT: 2297 ite 28 2207 1712 1733
// CHECK-NEXT: 2298 ite 28 2209 255 2297
// CHECK-NEXT: 2299 next 28 1728 2298
// CHECK-NEXT: 2300 next 28 1729 111
// CHECK-NEXT: 2301 next 28 1744 1750
// CHECK-NEXT: 2302 ite 28 2207 1723 1750
// CHECK-NEXT: 2303 ite 28 2209 255 2302
// CHECK-NEXT: 2304 next 28 1745 2303
// CHECK-NEXT: 2305 next 28 1746 111
// CHECK-NEXT: 2306 next 79 1817 1823
// CHECK-NEXT: 2307 ite 79 2207 1816 1823
// CHECK-NEXT: 2308 const 79 00000000
// CHECK-NEXT: 2309 ite 79 2209 2308 2307
// CHECK-NEXT: 2310 next 79 1818 2309
// CHECK-NEXT: 2311 next 28 1819 111
// CHECK-NEXT: ; end of yosys output
