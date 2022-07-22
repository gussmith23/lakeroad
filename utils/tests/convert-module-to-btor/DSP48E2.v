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
// CHECK-NEXT: 75 sort bitvec 8
// CHECK-NEXT: 76 input 75 PREADDINSEL 
// CHECK-NEXT: 77 input 3 PREG 
// CHECK-NEXT: 78 input 23 RND 
// CHECK-NEXT: 79 input 25 RSTA 
// CHECK-NEXT: 80 input 25 RSTALLCARRYIN 
// CHECK-NEXT: 81 input 25 RSTALUMODE 
// CHECK-NEXT: 82 input 25 RSTB 
// CHECK-NEXT: 83 input 25 RSTC 
// CHECK-NEXT: 84 input 25 RSTCTRL 
// CHECK-NEXT: 85 input 25 RSTD 
// CHECK-NEXT: 86 input 25 RSTINMODE 
// CHECK-NEXT: 87 input 25 RSTM 
// CHECK-NEXT: 88 input 25 RSTP 
// CHECK-NEXT: 89 input 10 SEL_MASK 
// CHECK-NEXT: 90 input 10 SEL_PATTERN 
// CHECK-NEXT: 91 input 10 USE_MULT 
// CHECK-NEXT: 92 input 10 USE_PATTERN_DETECT 
// CHECK-NEXT: 93 input 10 USE_SIMD 
// CHECK-NEXT: 94 input 10 USE_WIDEXOR 
// CHECK-NEXT: 95 input 10 XORSIMD 
// CHECK-NEXT: 96 state 1
// CHECK-NEXT: 97 state 1
// CHECK-NEXT: 98 const 25 1
// CHECK-NEXT: 99 state 25
// CHECK-NEXT: 100 init 25 99 98
// CHECK-NEXT: 101 neq 25 45 98
// CHECK-NEXT: 102 xor 25 45 54
// CHECK-NEXT: 103 and 25 101 102
// CHECK-NEXT: 104 sort bitvec 2
// CHECK-NEXT: 105 concat 104 103 99
// CHECK-NEXT: 106 const 104 10
// CHECK-NEXT: 107 eq 25 105 106
// CHECK-NEXT: 108 ite 1 107 97 96
// CHECK-NEXT: 109 slice 25 2 0 0
// CHECK-NEXT: 110 eq 25 109 98
// CHECK-NEXT: 111 or 25 110 109
// CHECK-NEXT: 112 slice 25 2 1 1
// CHECK-NEXT: 113 eq 25 112 98
// CHECK-NEXT: 114 or 25 113 112
// CHECK-NEXT: 115 slice 25 2 2 2
// CHECK-NEXT: 116 eq 25 115 98
// CHECK-NEXT: 117 or 25 116 115
// CHECK-NEXT: 118 slice 25 2 3 3
// CHECK-NEXT: 119 eq 25 118 98
// CHECK-NEXT: 120 or 25 119 118
// CHECK-NEXT: 121 slice 25 2 4 4
// CHECK-NEXT: 122 eq 25 121 98
// CHECK-NEXT: 123 or 25 122 121
// CHECK-NEXT: 124 slice 25 2 5 5
// CHECK-NEXT: 125 eq 25 124 98
// CHECK-NEXT: 126 or 25 125 124
// CHECK-NEXT: 127 slice 25 2 6 6
// CHECK-NEXT: 128 eq 25 127 98
// CHECK-NEXT: 129 or 25 128 127
// CHECK-NEXT: 130 slice 25 2 7 7
// CHECK-NEXT: 131 eq 25 130 98
// CHECK-NEXT: 132 or 25 131 130
// CHECK-NEXT: 133 slice 25 2 8 8
// CHECK-NEXT: 134 eq 25 133 98
// CHECK-NEXT: 135 or 25 134 133
// CHECK-NEXT: 136 slice 25 2 9 9
// CHECK-NEXT: 137 eq 25 136 98
// CHECK-NEXT: 138 or 25 137 136
// CHECK-NEXT: 139 slice 25 2 10 10
// CHECK-NEXT: 140 eq 25 139 98
// CHECK-NEXT: 141 or 25 140 139
// CHECK-NEXT: 142 slice 25 2 11 11
// CHECK-NEXT: 143 eq 25 142 98
// CHECK-NEXT: 144 or 25 143 142
// CHECK-NEXT: 145 slice 25 2 12 12
// CHECK-NEXT: 146 eq 25 145 98
// CHECK-NEXT: 147 or 25 146 145
// CHECK-NEXT: 148 slice 25 2 13 13
// CHECK-NEXT: 149 eq 25 148 98
// CHECK-NEXT: 150 or 25 149 148
// CHECK-NEXT: 151 slice 25 2 14 14
// CHECK-NEXT: 152 eq 25 151 98
// CHECK-NEXT: 153 or 25 152 151
// CHECK-NEXT: 154 slice 25 2 15 15
// CHECK-NEXT: 155 eq 25 154 98
// CHECK-NEXT: 156 or 25 155 154
// CHECK-NEXT: 157 slice 25 2 16 16
// CHECK-NEXT: 158 eq 25 157 98
// CHECK-NEXT: 159 or 25 158 157
// CHECK-NEXT: 160 slice 25 2 17 17
// CHECK-NEXT: 161 eq 25 160 98
// CHECK-NEXT: 162 or 25 161 160
// CHECK-NEXT: 163 slice 25 2 18 18
// CHECK-NEXT: 164 eq 25 163 98
// CHECK-NEXT: 165 or 25 164 163
// CHECK-NEXT: 166 slice 25 2 19 19
// CHECK-NEXT: 167 eq 25 166 98
// CHECK-NEXT: 168 or 25 167 166
// CHECK-NEXT: 169 slice 25 2 20 20
// CHECK-NEXT: 170 eq 25 169 98
// CHECK-NEXT: 171 or 25 170 169
// CHECK-NEXT: 172 slice 25 2 21 21
// CHECK-NEXT: 173 eq 25 172 98
// CHECK-NEXT: 174 or 25 173 172
// CHECK-NEXT: 175 slice 25 2 22 22
// CHECK-NEXT: 176 eq 25 175 98
// CHECK-NEXT: 177 or 25 176 175
// CHECK-NEXT: 178 slice 25 2 23 23
// CHECK-NEXT: 179 eq 25 178 98
// CHECK-NEXT: 180 or 25 179 178
// CHECK-NEXT: 181 slice 25 2 24 24
// CHECK-NEXT: 182 eq 25 181 98
// CHECK-NEXT: 183 or 25 182 181
// CHECK-NEXT: 184 slice 25 2 25 25
// CHECK-NEXT: 185 eq 25 184 98
// CHECK-NEXT: 186 or 25 185 184
// CHECK-NEXT: 187 slice 25 2 26 26
// CHECK-NEXT: 188 eq 25 187 98
// CHECK-NEXT: 189 or 25 188 187
// CHECK-NEXT: 190 slice 25 2 27 27
// CHECK-NEXT: 191 eq 25 190 98
// CHECK-NEXT: 192 or 25 191 190
// CHECK-NEXT: 193 slice 25 2 28 28
// CHECK-NEXT: 194 eq 25 193 98
// CHECK-NEXT: 195 or 25 194 193
// CHECK-NEXT: 196 slice 25 2 29 29
// CHECK-NEXT: 197 eq 25 196 98
// CHECK-NEXT: 198 or 25 197 196
// CHECK-NEXT: 199 concat 104 114 111
// CHECK-NEXT: 200 concat 29 117 199
// CHECK-NEXT: 201 concat 7 120 200
// CHECK-NEXT: 202 concat 10 123 201
// CHECK-NEXT: 203 sort bitvec 6
// CHECK-NEXT: 204 concat 203 126 202
// CHECK-NEXT: 205 sort bitvec 7
// CHECK-NEXT: 206 concat 205 129 204
// CHECK-NEXT: 207 concat 75 132 206
// CHECK-NEXT: 208 concat 56 135 207
// CHECK-NEXT: 209 sort bitvec 10
// CHECK-NEXT: 210 concat 209 138 208
// CHECK-NEXT: 211 sort bitvec 11
// CHECK-NEXT: 212 concat 211 141 210
// CHECK-NEXT: 213 sort bitvec 12
// CHECK-NEXT: 214 concat 213 144 212
// CHECK-NEXT: 215 sort bitvec 13
// CHECK-NEXT: 216 concat 215 147 214
// CHECK-NEXT: 217 sort bitvec 14
// CHECK-NEXT: 218 concat 217 150 216
// CHECK-NEXT: 219 sort bitvec 15
// CHECK-NEXT: 220 concat 219 153 218
// CHECK-NEXT: 221 sort bitvec 16
// CHECK-NEXT: 222 concat 221 156 220
// CHECK-NEXT: 223 sort bitvec 17
// CHECK-NEXT: 224 concat 223 159 222
// CHECK-NEXT: 225 concat 16 162 224
// CHECK-NEXT: 226 sort bitvec 19
// CHECK-NEXT: 227 concat 226 165 225
// CHECK-NEXT: 228 sort bitvec 20
// CHECK-NEXT: 229 concat 228 168 227
// CHECK-NEXT: 230 sort bitvec 21
// CHECK-NEXT: 231 concat 230 171 229
// CHECK-NEXT: 232 sort bitvec 22
// CHECK-NEXT: 233 concat 232 174 231
// CHECK-NEXT: 234 sort bitvec 23
// CHECK-NEXT: 235 concat 234 177 233
// CHECK-NEXT: 236 sort bitvec 24
// CHECK-NEXT: 237 concat 236 180 235
// CHECK-NEXT: 238 sort bitvec 25
// CHECK-NEXT: 239 concat 238 183 237
// CHECK-NEXT: 240 sort bitvec 26
// CHECK-NEXT: 241 concat 240 186 239
// CHECK-NEXT: 242 concat 47 189 241
// CHECK-NEXT: 243 sort bitvec 28
// CHECK-NEXT: 244 concat 243 192 242
// CHECK-NEXT: 245 sort bitvec 29
// CHECK-NEXT: 246 concat 245 195 244
// CHECK-NEXT: 247 concat 1 198 246
// CHECK-NEXT: 248 const 25 0
// CHECK-NEXT: 249 const 7 1111
// CHECK-NEXT: 250 uext 10 249 1
// CHECK-NEXT: 251 eq 25 15 250
// CHECK-NEXT: 252 ite 25 251 98 248
// CHECK-NEXT: 253 const 29 111
// CHECK-NEXT: 254 uext 10 253 2
// CHECK-NEXT: 255 eq 25 15 254
// CHECK-NEXT: 256 ite 25 255 248 252
// CHECK-NEXT: 257 ite 1 256 5 247
// CHECK-NEXT: 258 state 1
// CHECK-NEXT: 259 state 1
// CHECK-NEXT: 260 state 25
// CHECK-NEXT: 261 init 25 260 98
// CHECK-NEXT: 262 concat 104 103 260
// CHECK-NEXT: 263 eq 25 262 106
// CHECK-NEXT: 264 ite 1 263 259 258
// CHECK-NEXT: 265 slice 104 12 1 0
// CHECK-NEXT: 266 redor 25 265
// CHECK-NEXT: 267 ite 1 266 264 257
// CHECK-NEXT: 268 slice 104 4 1 0
// CHECK-NEXT: 269 eq 25 268 265
// CHECK-NEXT: 270 ite 1 269 267 108
// CHECK-NEXT: 271 output 270 ACOUT 
// CHECK-NEXT: 272 state 16
// CHECK-NEXT: 273 state 16
// CHECK-NEXT: 274 state 25
// CHECK-NEXT: 275 init 25 274 98
// CHECK-NEXT: 276 concat 104 103 274
// CHECK-NEXT: 277 eq 25 276 106
// CHECK-NEXT: 278 ite 16 277 273 272
// CHECK-NEXT: 279 slice 25 17 0 0
// CHECK-NEXT: 280 eq 25 279 98
// CHECK-NEXT: 281 or 25 280 279
// CHECK-NEXT: 282 slice 25 17 1 1
// CHECK-NEXT: 283 eq 25 282 98
// CHECK-NEXT: 284 or 25 283 282
// CHECK-NEXT: 285 slice 25 17 2 2
// CHECK-NEXT: 286 eq 25 285 98
// CHECK-NEXT: 287 or 25 286 285
// CHECK-NEXT: 288 slice 25 17 3 3
// CHECK-NEXT: 289 eq 25 288 98
// CHECK-NEXT: 290 or 25 289 288
// CHECK-NEXT: 291 slice 25 17 4 4
// CHECK-NEXT: 292 eq 25 291 98
// CHECK-NEXT: 293 or 25 292 291
// CHECK-NEXT: 294 slice 25 17 5 5
// CHECK-NEXT: 295 eq 25 294 98
// CHECK-NEXT: 296 or 25 295 294
// CHECK-NEXT: 297 slice 25 17 6 6
// CHECK-NEXT: 298 eq 25 297 98
// CHECK-NEXT: 299 or 25 298 297
// CHECK-NEXT: 300 slice 25 17 7 7
// CHECK-NEXT: 301 eq 25 300 98
// CHECK-NEXT: 302 or 25 301 300
// CHECK-NEXT: 303 slice 25 17 8 8
// CHECK-NEXT: 304 eq 25 303 98
// CHECK-NEXT: 305 or 25 304 303
// CHECK-NEXT: 306 slice 25 17 9 9
// CHECK-NEXT: 307 eq 25 306 98
// CHECK-NEXT: 308 or 25 307 306
// CHECK-NEXT: 309 slice 25 17 10 10
// CHECK-NEXT: 310 eq 25 309 98
// CHECK-NEXT: 311 or 25 310 309
// CHECK-NEXT: 312 slice 25 17 11 11
// CHECK-NEXT: 313 eq 25 312 98
// CHECK-NEXT: 314 or 25 313 312
// CHECK-NEXT: 315 slice 25 17 12 12
// CHECK-NEXT: 316 eq 25 315 98
// CHECK-NEXT: 317 or 25 316 315
// CHECK-NEXT: 318 slice 25 17 13 13
// CHECK-NEXT: 319 eq 25 318 98
// CHECK-NEXT: 320 or 25 319 318
// CHECK-NEXT: 321 slice 25 17 14 14
// CHECK-NEXT: 322 eq 25 321 98
// CHECK-NEXT: 323 or 25 322 321
// CHECK-NEXT: 324 slice 25 17 15 15
// CHECK-NEXT: 325 eq 25 324 98
// CHECK-NEXT: 326 or 25 325 324
// CHECK-NEXT: 327 slice 25 17 16 16
// CHECK-NEXT: 328 eq 25 327 98
// CHECK-NEXT: 329 or 25 328 327
// CHECK-NEXT: 330 slice 25 17 17 17
// CHECK-NEXT: 331 eq 25 330 98
// CHECK-NEXT: 332 or 25 331 330
// CHECK-NEXT: 333 concat 104 284 281
// CHECK-NEXT: 334 concat 29 287 333
// CHECK-NEXT: 335 concat 7 290 334
// CHECK-NEXT: 336 concat 10 293 335
// CHECK-NEXT: 337 concat 203 296 336
// CHECK-NEXT: 338 concat 205 299 337
// CHECK-NEXT: 339 concat 75 302 338
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
// CHECK-NEXT: 352 ite 25 351 98 248
// CHECK-NEXT: 353 uext 10 253 2
// CHECK-NEXT: 354 eq 25 22 353
// CHECK-NEXT: 355 ite 25 354 248 352
// CHECK-NEXT: 356 ite 16 355 19 349
// CHECK-NEXT: 357 state 16
// CHECK-NEXT: 358 state 16
// CHECK-NEXT: 359 state 25
// CHECK-NEXT: 360 init 25 359 98
// CHECK-NEXT: 361 concat 104 103 359
// CHECK-NEXT: 362 eq 25 361 106
// CHECK-NEXT: 363 ite 16 362 358 357
// CHECK-NEXT: 364 slice 104 21 1 0
// CHECK-NEXT: 365 redor 25 364
// CHECK-NEXT: 366 ite 16 365 363 356
// CHECK-NEXT: 367 slice 104 18 1 0
// CHECK-NEXT: 368 eq 25 367 364
// CHECK-NEXT: 369 ite 16 368 366 278
// CHECK-NEXT: 370 output 369 BCOUT 
// CHECK-NEXT: 371 slice 25 8 0 0
// CHECK-NEXT: 372 neq 25 371 98
// CHECK-NEXT: 373 slice 25 52 0 0
// CHECK-NEXT: 374 xor 25 371 373
// CHECK-NEXT: 375 and 25 372 374
// CHECK-NEXT: 376 slice 25 8 1 1
// CHECK-NEXT: 377 neq 25 376 98
// CHECK-NEXT: 378 slice 25 52 1 1
// CHECK-NEXT: 379 xor 25 376 378
// CHECK-NEXT: 380 and 25 377 379
// CHECK-NEXT: 381 slice 25 8 2 2
// CHECK-NEXT: 382 neq 25 381 98
// CHECK-NEXT: 383 slice 25 52 2 2
// CHECK-NEXT: 384 xor 25 381 383
// CHECK-NEXT: 385 and 25 382 384
// CHECK-NEXT: 386 slice 25 8 3 3
// CHECK-NEXT: 387 neq 25 386 98
// CHECK-NEXT: 388 slice 25 52 3 3
// CHECK-NEXT: 389 xor 25 386 388
// CHECK-NEXT: 390 and 25 387 389
// CHECK-NEXT: 391 concat 104 380 375
// CHECK-NEXT: 392 concat 29 385 391
// CHECK-NEXT: 393 concat 7 390 392
// CHECK-NEXT: 394 state 7
// CHECK-NEXT: 395 state 7
// CHECK-NEXT: 396 state 25
// CHECK-NEXT: 397 init 25 396 98
// CHECK-NEXT: 398 concat 104 103 396
// CHECK-NEXT: 399 eq 25 398 106
// CHECK-NEXT: 400 ite 7 399 395 394
// CHECK-NEXT: 401 slice 25 9 0 0
// CHECK-NEXT: 402 ite 7 401 400 393
// CHECK-NEXT: 403 slice 25 402 0 0
// CHECK-NEXT: 404 slice 25 402 1 1
// CHECK-NEXT: 405 and 25 403 404
// CHECK-NEXT: 406 const 104 00
// CHECK-NEXT: 407 const 10 11001
// CHECK-NEXT: 408 eq 25 93 407
// CHECK-NEXT: 409 ite 104 408 106 406
// CHECK-NEXT: 410 const 104 01
// CHECK-NEXT: 411 const 10 10011
// CHECK-NEXT: 412 eq 25 93 411
// CHECK-NEXT: 413 ite 104 412 410 409
// CHECK-NEXT: 414 const 7 1100
// CHECK-NEXT: 415 uext 10 414 1
// CHECK-NEXT: 416 eq 25 93 415
// CHECK-NEXT: 417 ite 104 416 406 413
// CHECK-NEXT: 418 uext 104 98 1
// CHECK-NEXT: 419 neq 25 417 418
// CHECK-NEXT: 420 slice 25 402 0 0
// CHECK-NEXT: 421 slice 25 402 0 0
// CHECK-NEXT: 422 concat 104 421 420
// CHECK-NEXT: 423 slice 25 402 0 0
// CHECK-NEXT: 424 concat 29 423 422
// CHECK-NEXT: 425 slice 25 402 0 0
// CHECK-NEXT: 426 concat 7 425 424
// CHECK-NEXT: 427 slice 25 402 0 0
// CHECK-NEXT: 428 concat 10 427 426
// CHECK-NEXT: 429 slice 25 402 0 0
// CHECK-NEXT: 430 concat 203 429 428
// CHECK-NEXT: 431 slice 25 402 0 0
// CHECK-NEXT: 432 concat 205 431 430
// CHECK-NEXT: 433 slice 25 402 0 0
// CHECK-NEXT: 434 concat 75 433 432
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
// CHECK-NEXT: 535 init 25 534 98
// CHECK-NEXT: 536 concat 104 103 534
// CHECK-NEXT: 537 eq 25 536 106
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
// CHECK-NEXT: 575 neq 25 574 98
// CHECK-NEXT: 576 slice 25 57 0 0
// CHECK-NEXT: 577 xor 25 574 576
// CHECK-NEXT: 578 and 25 575 577
// CHECK-NEXT: 579 slice 25 71 1 1
// CHECK-NEXT: 580 neq 25 579 98
// CHECK-NEXT: 581 slice 25 57 1 1
// CHECK-NEXT: 582 xor 25 579 581
// CHECK-NEXT: 583 and 25 580 582
// CHECK-NEXT: 584 slice 25 71 2 2
// CHECK-NEXT: 585 neq 25 584 98
// CHECK-NEXT: 586 slice 25 57 2 2
// CHECK-NEXT: 587 xor 25 584 586
// CHECK-NEXT: 588 and 25 585 587
// CHECK-NEXT: 589 slice 25 71 3 3
// CHECK-NEXT: 590 neq 25 589 98
// CHECK-NEXT: 591 slice 25 57 3 3
// CHECK-NEXT: 592 xor 25 589 591
// CHECK-NEXT: 593 and 25 590 592
// CHECK-NEXT: 594 slice 25 71 4 4
// CHECK-NEXT: 595 neq 25 594 98
// CHECK-NEXT: 596 slice 25 57 4 4
// CHECK-NEXT: 597 xor 25 594 596
// CHECK-NEXT: 598 and 25 595 597
// CHECK-NEXT: 599 slice 25 71 5 5
// CHECK-NEXT: 600 neq 25 599 98
// CHECK-NEXT: 601 slice 25 57 5 5
// CHECK-NEXT: 602 xor 25 599 601
// CHECK-NEXT: 603 and 25 600 602
// CHECK-NEXT: 604 slice 25 71 6 6
// CHECK-NEXT: 605 neq 25 604 98
// CHECK-NEXT: 606 slice 25 57 6 6
// CHECK-NEXT: 607 xor 25 604 606
// CHECK-NEXT: 608 and 25 605 607
// CHECK-NEXT: 609 slice 25 71 7 7
// CHECK-NEXT: 610 neq 25 609 98
// CHECK-NEXT: 611 slice 25 57 7 7
// CHECK-NEXT: 612 xor 25 609 611
// CHECK-NEXT: 613 and 25 610 612
// CHECK-NEXT: 614 slice 25 71 8 8
// CHECK-NEXT: 615 neq 25 614 98
// CHECK-NEXT: 616 slice 25 57 8 8
// CHECK-NEXT: 617 xor 25 614 616
// CHECK-NEXT: 618 and 25 615 617
// CHECK-NEXT: 619 concat 104 583 578
// CHECK-NEXT: 620 concat 29 588 619
// CHECK-NEXT: 621 concat 7 593 620
// CHECK-NEXT: 622 concat 10 598 621
// CHECK-NEXT: 623 concat 203 603 622
// CHECK-NEXT: 624 concat 205 608 623
// CHECK-NEXT: 625 concat 75 613 624
// CHECK-NEXT: 626 concat 56 618 625
// CHECK-NEXT: 627 state 56
// CHECK-NEXT: 628 state 56
// CHECK-NEXT: 629 state 25
// CHECK-NEXT: 630 init 25 629 98
// CHECK-NEXT: 631 concat 104 103 629
// CHECK-NEXT: 632 eq 25 631 106
// CHECK-NEXT: 633 ite 56 632 628 627
// CHECK-NEXT: 634 slice 25 72 0 0
// CHECK-NEXT: 635 ite 56 634 633 626
// CHECK-NEXT: 636 slice 104 635 6 5
// CHECK-NEXT: 637 const 104 11
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
// CHECK-NEXT: 681 uext 29 106 1
// CHECK-NEXT: 682 eq 25 675 681
// CHECK-NEXT: 683 concat 104 682 680
// CHECK-NEXT: 684 redor 25 683
// CHECK-NEXT: 685 ite 23 684 538 678
// CHECK-NEXT: 686 slice 25 24 0 0
// CHECK-NEXT: 687 eq 25 686 98
// CHECK-NEXT: 688 or 25 687 686
// CHECK-NEXT: 689 slice 25 24 1 1
// CHECK-NEXT: 690 eq 25 689 98
// CHECK-NEXT: 691 or 25 690 689
// CHECK-NEXT: 692 slice 25 24 2 2
// CHECK-NEXT: 693 eq 25 692 98
// CHECK-NEXT: 694 or 25 693 692
// CHECK-NEXT: 695 slice 25 24 3 3
// CHECK-NEXT: 696 eq 25 695 98
// CHECK-NEXT: 697 or 25 696 695
// CHECK-NEXT: 698 slice 25 24 4 4
// CHECK-NEXT: 699 eq 25 698 98
// CHECK-NEXT: 700 or 25 699 698
// CHECK-NEXT: 701 slice 25 24 5 5
// CHECK-NEXT: 702 eq 25 701 98
// CHECK-NEXT: 703 or 25 702 701
// CHECK-NEXT: 704 slice 25 24 6 6
// CHECK-NEXT: 705 eq 25 704 98
// CHECK-NEXT: 706 or 25 705 704
// CHECK-NEXT: 707 slice 25 24 7 7
// CHECK-NEXT: 708 eq 25 707 98
// CHECK-NEXT: 709 or 25 708 707
// CHECK-NEXT: 710 slice 25 24 8 8
// CHECK-NEXT: 711 eq 25 710 98
// CHECK-NEXT: 712 or 25 711 710
// CHECK-NEXT: 713 slice 25 24 9 9
// CHECK-NEXT: 714 eq 25 713 98
// CHECK-NEXT: 715 or 25 714 713
// CHECK-NEXT: 716 slice 25 24 10 10
// CHECK-NEXT: 717 eq 25 716 98
// CHECK-NEXT: 718 or 25 717 716
// CHECK-NEXT: 719 slice 25 24 11 11
// CHECK-NEXT: 720 eq 25 719 98
// CHECK-NEXT: 721 or 25 720 719
// CHECK-NEXT: 722 slice 25 24 12 12
// CHECK-NEXT: 723 eq 25 722 98
// CHECK-NEXT: 724 or 25 723 722
// CHECK-NEXT: 725 slice 25 24 13 13
// CHECK-NEXT: 726 eq 25 725 98
// CHECK-NEXT: 727 or 25 726 725
// CHECK-NEXT: 728 slice 25 24 14 14
// CHECK-NEXT: 729 eq 25 728 98
// CHECK-NEXT: 730 or 25 729 728
// CHECK-NEXT: 731 slice 25 24 15 15
// CHECK-NEXT: 732 eq 25 731 98
// CHECK-NEXT: 733 or 25 732 731
// CHECK-NEXT: 734 slice 25 24 16 16
// CHECK-NEXT: 735 eq 25 734 98
// CHECK-NEXT: 736 or 25 735 734
// CHECK-NEXT: 737 slice 25 24 17 17
// CHECK-NEXT: 738 eq 25 737 98
// CHECK-NEXT: 739 or 25 738 737
// CHECK-NEXT: 740 slice 25 24 18 18
// CHECK-NEXT: 741 eq 25 740 98
// CHECK-NEXT: 742 or 25 741 740
// CHECK-NEXT: 743 slice 25 24 19 19
// CHECK-NEXT: 744 eq 25 743 98
// CHECK-NEXT: 745 or 25 744 743
// CHECK-NEXT: 746 slice 25 24 20 20
// CHECK-NEXT: 747 eq 25 746 98
// CHECK-NEXT: 748 or 25 747 746
// CHECK-NEXT: 749 slice 25 24 21 21
// CHECK-NEXT: 750 eq 25 749 98
// CHECK-NEXT: 751 or 25 750 749
// CHECK-NEXT: 752 slice 25 24 22 22
// CHECK-NEXT: 753 eq 25 752 98
// CHECK-NEXT: 754 or 25 753 752
// CHECK-NEXT: 755 slice 25 24 23 23
// CHECK-NEXT: 756 eq 25 755 98
// CHECK-NEXT: 757 or 25 756 755
// CHECK-NEXT: 758 slice 25 24 24 24
// CHECK-NEXT: 759 eq 25 758 98
// CHECK-NEXT: 760 or 25 759 758
// CHECK-NEXT: 761 slice 25 24 25 25
// CHECK-NEXT: 762 eq 25 761 98
// CHECK-NEXT: 763 or 25 762 761
// CHECK-NEXT: 764 slice 25 24 26 26
// CHECK-NEXT: 765 eq 25 764 98
// CHECK-NEXT: 766 or 25 765 764
// CHECK-NEXT: 767 slice 25 24 27 27
// CHECK-NEXT: 768 eq 25 767 98
// CHECK-NEXT: 769 or 25 768 767
// CHECK-NEXT: 770 slice 25 24 28 28
// CHECK-NEXT: 771 eq 25 770 98
// CHECK-NEXT: 772 or 25 771 770
// CHECK-NEXT: 773 slice 25 24 29 29
// CHECK-NEXT: 774 eq 25 773 98
// CHECK-NEXT: 775 or 25 774 773
// CHECK-NEXT: 776 slice 25 24 30 30
// CHECK-NEXT: 777 eq 25 776 98
// CHECK-NEXT: 778 or 25 777 776
// CHECK-NEXT: 779 slice 25 24 31 31
// CHECK-NEXT: 780 eq 25 779 98
// CHECK-NEXT: 781 or 25 780 779
// CHECK-NEXT: 782 slice 25 24 32 32
// CHECK-NEXT: 783 eq 25 782 98
// CHECK-NEXT: 784 or 25 783 782
// CHECK-NEXT: 785 slice 25 24 33 33
// CHECK-NEXT: 786 eq 25 785 98
// CHECK-NEXT: 787 or 25 786 785
// CHECK-NEXT: 788 slice 25 24 34 34
// CHECK-NEXT: 789 eq 25 788 98
// CHECK-NEXT: 790 or 25 789 788
// CHECK-NEXT: 791 slice 25 24 35 35
// CHECK-NEXT: 792 eq 25 791 98
// CHECK-NEXT: 793 or 25 792 791
// CHECK-NEXT: 794 slice 25 24 36 36
// CHECK-NEXT: 795 eq 25 794 98
// CHECK-NEXT: 796 or 25 795 794
// CHECK-NEXT: 797 slice 25 24 37 37
// CHECK-NEXT: 798 eq 25 797 98
// CHECK-NEXT: 799 or 25 798 797
// CHECK-NEXT: 800 slice 25 24 38 38
// CHECK-NEXT: 801 eq 25 800 98
// CHECK-NEXT: 802 or 25 801 800
// CHECK-NEXT: 803 slice 25 24 39 39
// CHECK-NEXT: 804 eq 25 803 98
// CHECK-NEXT: 805 or 25 804 803
// CHECK-NEXT: 806 slice 25 24 40 40
// CHECK-NEXT: 807 eq 25 806 98
// CHECK-NEXT: 808 or 25 807 806
// CHECK-NEXT: 809 slice 25 24 41 41
// CHECK-NEXT: 810 eq 25 809 98
// CHECK-NEXT: 811 or 25 810 809
// CHECK-NEXT: 812 slice 25 24 42 42
// CHECK-NEXT: 813 eq 25 812 98
// CHECK-NEXT: 814 or 25 813 812
// CHECK-NEXT: 815 slice 25 24 43 43
// CHECK-NEXT: 816 eq 25 815 98
// CHECK-NEXT: 817 or 25 816 815
// CHECK-NEXT: 818 slice 25 24 44 44
// CHECK-NEXT: 819 eq 25 818 98
// CHECK-NEXT: 820 or 25 819 818
// CHECK-NEXT: 821 slice 25 24 45 45
// CHECK-NEXT: 822 eq 25 821 98
// CHECK-NEXT: 823 or 25 822 821
// CHECK-NEXT: 824 slice 25 24 46 46
// CHECK-NEXT: 825 eq 25 824 98
// CHECK-NEXT: 826 or 25 825 824
// CHECK-NEXT: 827 slice 25 24 47 47
// CHECK-NEXT: 828 eq 25 827 98
// CHECK-NEXT: 829 or 25 828 827
// CHECK-NEXT: 830 concat 104 691 688
// CHECK-NEXT: 831 concat 29 694 830
// CHECK-NEXT: 832 concat 7 697 831
// CHECK-NEXT: 833 concat 10 700 832
// CHECK-NEXT: 834 concat 203 703 833
// CHECK-NEXT: 835 concat 205 706 834
// CHECK-NEXT: 836 concat 75 709 835
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
// CHECK-NEXT: 880 init 25 879 98
// CHECK-NEXT: 881 concat 104 103 879
// CHECK-NEXT: 882 eq 25 881 106
// CHECK-NEXT: 883 ite 23 882 878 877
// CHECK-NEXT: 884 slice 25 46 0 0
// CHECK-NEXT: 885 ite 23 884 883 876
// CHECK-NEXT: 886 uext 29 637 1
// CHECK-NEXT: 887 eq 25 675 886
// CHECK-NEXT: 888 ite 23 887 885 685
// CHECK-NEXT: 889 uext 29 98 2
// CHECK-NEXT: 890 eq 25 675 889
// CHECK-NEXT: 891 ite 23 890 74 888
// CHECK-NEXT: 892 const 23 000000000000000000000000000000000000000000000000
// CHECK-NEXT: 893 redor 25 675
// CHECK-NEXT: 894 not 25 893
// CHECK-NEXT: 895 ite 23 894 892 891
// CHECK-NEXT: 896 xor 23 530 895
// CHECK-NEXT: 897 input 23
// CHECK-NEXT: 898 concat 23 267 366
// CHECK-NEXT: 899 slice 104 635 1 0
// CHECK-NEXT: 900 eq 25 899 637
// CHECK-NEXT: 901 ite 23 900 898 897
// CHECK-NEXT: 902 eq 25 899 106
// CHECK-NEXT: 903 ite 23 902 538 901
// CHECK-NEXT: 904 const 521 100000000000000000000000000000000000000000000
// CHECK-NEXT: 905 slice 47 267 26 0
// CHECK-NEXT: 906 slice 47 108 26 0
// CHECK-NEXT: 907 slice 25 50 0 0
// CHECK-NEXT: 908 neq 25 907 98
// CHECK-NEXT: 909 slice 25 55 0 0
// CHECK-NEXT: 910 xor 25 907 909
// CHECK-NEXT: 911 and 25 908 910
// CHECK-NEXT: 912 slice 25 50 1 1
// CHECK-NEXT: 913 neq 25 912 98
// CHECK-NEXT: 914 slice 25 55 1 1
// CHECK-NEXT: 915 xor 25 912 914
// CHECK-NEXT: 916 and 25 913 915
// CHECK-NEXT: 917 slice 25 50 2 2
// CHECK-NEXT: 918 neq 25 917 98
// CHECK-NEXT: 919 slice 25 55 2 2
// CHECK-NEXT: 920 xor 25 917 919
// CHECK-NEXT: 921 and 25 918 920
// CHECK-NEXT: 922 slice 25 50 3 3
// CHECK-NEXT: 923 neq 25 922 98
// CHECK-NEXT: 924 slice 25 55 3 3
// CHECK-NEXT: 925 xor 25 922 924
// CHECK-NEXT: 926 and 25 923 925
// CHECK-NEXT: 927 slice 25 50 4 4
// CHECK-NEXT: 928 neq 25 927 98
// CHECK-NEXT: 929 slice 25 55 4 4
// CHECK-NEXT: 930 xor 25 927 929
// CHECK-NEXT: 931 and 25 928 930
// CHECK-NEXT: 932 concat 104 916 911
// CHECK-NEXT: 933 concat 29 921 932
// CHECK-NEXT: 934 concat 7 926 933
// CHECK-NEXT: 935 concat 10 931 934
// CHECK-NEXT: 936 state 10
// CHECK-NEXT: 937 state 10
// CHECK-NEXT: 938 state 25
// CHECK-NEXT: 939 init 25 938 98
// CHECK-NEXT: 940 concat 104 103 938
// CHECK-NEXT: 941 eq 25 940 106
// CHECK-NEXT: 942 ite 10 941 937 936
// CHECK-NEXT: 943 slice 25 51 0 0
// CHECK-NEXT: 944 ite 10 943 942 935
// CHECK-NEXT: 945 slice 25 944 0 0
// CHECK-NEXT: 946 ite 47 945 906 905
// CHECK-NEXT: 947 const 47 000000000000000000000000000
// CHECK-NEXT: 948 uext 75 98 7
// CHECK-NEXT: 949 eq 25 76 948
// CHECK-NEXT: 950 ite 25 949 98 248
// CHECK-NEXT: 951 redor 25 76
// CHECK-NEXT: 952 not 25 951
// CHECK-NEXT: 953 ite 25 952 248 950
// CHECK-NEXT: 954 not 25 953
// CHECK-NEXT: 955 slice 25 944 1 1
// CHECK-NEXT: 956 and 25 954 955
// CHECK-NEXT: 957 ite 47 956 947 946
// CHECK-NEXT: 958 slice 25 48 0 0
// CHECK-NEXT: 959 neq 25 958 98
// CHECK-NEXT: 960 and 25 959 958
// CHECK-NEXT: 961 slice 25 48 1 1
// CHECK-NEXT: 962 neq 25 961 98
// CHECK-NEXT: 963 and 25 962 961
// CHECK-NEXT: 964 slice 25 48 2 2
// CHECK-NEXT: 965 neq 25 964 98
// CHECK-NEXT: 966 and 25 965 964
// CHECK-NEXT: 967 slice 25 48 3 3
// CHECK-NEXT: 968 neq 25 967 98
// CHECK-NEXT: 969 and 25 968 967
// CHECK-NEXT: 970 slice 25 48 4 4
// CHECK-NEXT: 971 neq 25 970 98
// CHECK-NEXT: 972 and 25 971 970
// CHECK-NEXT: 973 slice 25 48 5 5
// CHECK-NEXT: 974 neq 25 973 98
// CHECK-NEXT: 975 and 25 974 973
// CHECK-NEXT: 976 slice 25 48 6 6
// CHECK-NEXT: 977 neq 25 976 98
// CHECK-NEXT: 978 and 25 977 976
// CHECK-NEXT: 979 slice 25 48 7 7
// CHECK-NEXT: 980 neq 25 979 98
// CHECK-NEXT: 981 and 25 980 979
// CHECK-NEXT: 982 slice 25 48 8 8
// CHECK-NEXT: 983 neq 25 982 98
// CHECK-NEXT: 984 and 25 983 982
// CHECK-NEXT: 985 slice 25 48 9 9
// CHECK-NEXT: 986 neq 25 985 98
// CHECK-NEXT: 987 and 25 986 985
// CHECK-NEXT: 988 slice 25 48 10 10
// CHECK-NEXT: 989 neq 25 988 98
// CHECK-NEXT: 990 and 25 989 988
// CHECK-NEXT: 991 slice 25 48 11 11
// CHECK-NEXT: 992 neq 25 991 98
// CHECK-NEXT: 993 and 25 992 991
// CHECK-NEXT: 994 slice 25 48 12 12
// CHECK-NEXT: 995 neq 25 994 98
// CHECK-NEXT: 996 and 25 995 994
// CHECK-NEXT: 997 slice 25 48 13 13
// CHECK-NEXT: 998 neq 25 997 98
// CHECK-NEXT: 999 and 25 998 997
// CHECK-NEXT: 1000 slice 25 48 14 14
// CHECK-NEXT: 1001 neq 25 1000 98
// CHECK-NEXT: 1002 and 25 1001 1000
// CHECK-NEXT: 1003 slice 25 48 15 15
// CHECK-NEXT: 1004 neq 25 1003 98
// CHECK-NEXT: 1005 and 25 1004 1003
// CHECK-NEXT: 1006 slice 25 48 16 16
// CHECK-NEXT: 1007 neq 25 1006 98
// CHECK-NEXT: 1008 and 25 1007 1006
// CHECK-NEXT: 1009 slice 25 48 17 17
// CHECK-NEXT: 1010 neq 25 1009 98
// CHECK-NEXT: 1011 and 25 1010 1009
// CHECK-NEXT: 1012 slice 25 48 18 18
// CHECK-NEXT: 1013 neq 25 1012 98
// CHECK-NEXT: 1014 and 25 1013 1012
// CHECK-NEXT: 1015 slice 25 48 19 19
// CHECK-NEXT: 1016 neq 25 1015 98
// CHECK-NEXT: 1017 and 25 1016 1015
// CHECK-NEXT: 1018 slice 25 48 20 20
// CHECK-NEXT: 1019 neq 25 1018 98
// CHECK-NEXT: 1020 and 25 1019 1018
// CHECK-NEXT: 1021 slice 25 48 21 21
// CHECK-NEXT: 1022 neq 25 1021 98
// CHECK-NEXT: 1023 and 25 1022 1021
// CHECK-NEXT: 1024 slice 25 48 22 22
// CHECK-NEXT: 1025 neq 25 1024 98
// CHECK-NEXT: 1026 and 25 1025 1024
// CHECK-NEXT: 1027 slice 25 48 23 23
// CHECK-NEXT: 1028 neq 25 1027 98
// CHECK-NEXT: 1029 and 25 1028 1027
// CHECK-NEXT: 1030 slice 25 48 24 24
// CHECK-NEXT: 1031 neq 25 1030 98
// CHECK-NEXT: 1032 and 25 1031 1030
// CHECK-NEXT: 1033 slice 25 48 25 25
// CHECK-NEXT: 1034 neq 25 1033 98
// CHECK-NEXT: 1035 and 25 1034 1033
// CHECK-NEXT: 1036 slice 25 48 26 26
// CHECK-NEXT: 1037 neq 25 1036 98
// CHECK-NEXT: 1038 and 25 1037 1036
// CHECK-NEXT: 1039 concat 104 963 960
// CHECK-NEXT: 1040 concat 29 966 1039
// CHECK-NEXT: 1041 concat 7 969 1040
// CHECK-NEXT: 1042 concat 10 972 1041
// CHECK-NEXT: 1043 concat 203 975 1042
// CHECK-NEXT: 1044 concat 205 978 1043
// CHECK-NEXT: 1045 concat 75 981 1044
// CHECK-NEXT: 1046 concat 56 984 1045
// CHECK-NEXT: 1047 concat 209 987 1046
// CHECK-NEXT: 1048 concat 211 990 1047
// CHECK-NEXT: 1049 concat 213 993 1048
// CHECK-NEXT: 1050 concat 215 996 1049
// CHECK-NEXT: 1051 concat 217 999 1050
// CHECK-NEXT: 1052 concat 219 1002 1051
// CHECK-NEXT: 1053 concat 221 1005 1052
// CHECK-NEXT: 1054 concat 223 1008 1053
// CHECK-NEXT: 1055 concat 16 1011 1054
// CHECK-NEXT: 1056 concat 226 1014 1055
// CHECK-NEXT: 1057 concat 228 1017 1056
// CHECK-NEXT: 1058 concat 230 1020 1057
// CHECK-NEXT: 1059 concat 232 1023 1058
// CHECK-NEXT: 1060 concat 234 1026 1059
// CHECK-NEXT: 1061 concat 236 1029 1060
// CHECK-NEXT: 1062 concat 238 1032 1061
// CHECK-NEXT: 1063 concat 240 1035 1062
// CHECK-NEXT: 1064 concat 47 1038 1063
// CHECK-NEXT: 1065 state 47
// CHECK-NEXT: 1066 state 47
// CHECK-NEXT: 1067 state 25
// CHECK-NEXT: 1068 init 25 1067 98
// CHECK-NEXT: 1069 concat 104 103 1067
// CHECK-NEXT: 1070 eq 25 1069 106
// CHECK-NEXT: 1071 ite 47 1070 1066 1065
// CHECK-NEXT: 1072 slice 25 49 0 0
// CHECK-NEXT: 1073 uext 10 106 3
// CHECK-NEXT: 1074 eq 25 11 1073
// CHECK-NEXT: 1075 ite 25 1074 98 248
// CHECK-NEXT: 1076 const 211 00000000000
// CHECK-NEXT: 1077 concat 221 1076 11
// CHECK-NEXT: 1078 redor 25 1077
// CHECK-NEXT: 1079 not 25 1078
// CHECK-NEXT: 1080 ite 25 1079 248 1075
// CHECK-NEXT: 1081 not 25 1080
// CHECK-NEXT: 1082 uext 10 106 3
// CHECK-NEXT: 1083 eq 25 20 1082
// CHECK-NEXT: 1084 ite 25 1083 98 248
// CHECK-NEXT: 1085 uext 10 98 4
// CHECK-NEXT: 1086 eq 25 20 1085
// CHECK-NEXT: 1087 ite 25 1086 248 1084
// CHECK-NEXT: 1088 not 25 1087
// CHECK-NEXT: 1089 and 25 1081 1088
// CHECK-NEXT: 1090 const 10 10100
// CHECK-NEXT: 1091 eq 25 91 1090
// CHECK-NEXT: 1092 ite 104 1091 106 406
// CHECK-NEXT: 1093 const 10 10010
// CHECK-NEXT: 1094 eq 25 91 1093
// CHECK-NEXT: 1095 ite 104 1094 410 1092
// CHECK-NEXT: 1096 const 7 1010
// CHECK-NEXT: 1097 uext 10 1096 1
// CHECK-NEXT: 1098 eq 25 91 1097
// CHECK-NEXT: 1099 ite 104 1098 406 1095
// CHECK-NEXT: 1100 eq 25 1099 106
// CHECK-NEXT: 1101 or 25 1089 1100
// CHECK-NEXT: 1102 ite 25 1101 248 1072
// CHECK-NEXT: 1103 ite 47 1102 1071 1064
// CHECK-NEXT: 1104 slice 25 944 2 2
// CHECK-NEXT: 1105 ite 47 1104 1103 947
// CHECK-NEXT: 1106 slice 25 944 4 4
// CHECK-NEXT: 1107 ite 16 1106 278 366
// CHECK-NEXT: 1108 const 16 000000000000000000
// CHECK-NEXT: 1109 and 25 953 955
// CHECK-NEXT: 1110 ite 16 1109 1108 1107
// CHECK-NEXT: 1111 slice 25 1110 17 17
// CHECK-NEXT: 1112 concat 226 1111 1110
// CHECK-NEXT: 1113 slice 25 1110 17 17
// CHECK-NEXT: 1114 concat 228 1113 1112
// CHECK-NEXT: 1115 slice 25 1110 17 17
// CHECK-NEXT: 1116 concat 230 1115 1114
// CHECK-NEXT: 1117 slice 25 1110 17 17
// CHECK-NEXT: 1118 concat 232 1117 1116
// CHECK-NEXT: 1119 slice 25 1110 17 17
// CHECK-NEXT: 1120 concat 234 1119 1118
// CHECK-NEXT: 1121 slice 25 1110 17 17
// CHECK-NEXT: 1122 concat 236 1121 1120
// CHECK-NEXT: 1123 slice 25 1110 17 17
// CHECK-NEXT: 1124 concat 238 1123 1122
// CHECK-NEXT: 1125 slice 25 1110 17 17
// CHECK-NEXT: 1126 concat 240 1125 1124
// CHECK-NEXT: 1127 slice 25 1110 17 17
// CHECK-NEXT: 1128 concat 47 1127 1126
// CHECK-NEXT: 1129 ite 47 953 1128 957
// CHECK-NEXT: 1130 add 47 1105 1129
// CHECK-NEXT: 1131 sub 47 1105 1129
// CHECK-NEXT: 1132 slice 25 944 3 3
// CHECK-NEXT: 1133 ite 47 1132 1131 1130
// CHECK-NEXT: 1134 state 47
// CHECK-NEXT: 1135 state 47
// CHECK-NEXT: 1136 state 25
// CHECK-NEXT: 1137 init 25 1136 98
// CHECK-NEXT: 1138 concat 104 103 1136
// CHECK-NEXT: 1139 eq 25 1138 106
// CHECK-NEXT: 1140 ite 47 1139 1135 1134
// CHECK-NEXT: 1141 slice 25 6 0 0
// CHECK-NEXT: 1142 ite 25 1101 248 1141
// CHECK-NEXT: 1143 ite 47 1142 1140 1133
// CHECK-NEXT: 1144 ite 47 1080 1143 957
// CHECK-NEXT: 1145 slice 25 1144 26 26
// CHECK-NEXT: 1146 concat 243 1145 1144
// CHECK-NEXT: 1147 slice 25 1144 26 26
// CHECK-NEXT: 1148 concat 245 1147 1146
// CHECK-NEXT: 1149 slice 25 1144 26 26
// CHECK-NEXT: 1150 concat 1 1149 1148
// CHECK-NEXT: 1151 slice 25 1144 26 26
// CHECK-NEXT: 1152 concat 480 1151 1150
// CHECK-NEXT: 1153 slice 25 1144 26 26
// CHECK-NEXT: 1154 concat 3 1153 1152
// CHECK-NEXT: 1155 slice 25 1144 26 26
// CHECK-NEXT: 1156 concat 485 1155 1154
// CHECK-NEXT: 1157 slice 25 1144 26 26
// CHECK-NEXT: 1158 concat 488 1157 1156
// CHECK-NEXT: 1159 slice 25 1144 26 26
// CHECK-NEXT: 1160 concat 491 1159 1158
// CHECK-NEXT: 1161 slice 25 1144 26 26
// CHECK-NEXT: 1162 concat 494 1161 1160
// CHECK-NEXT: 1163 slice 25 1144 26 26
// CHECK-NEXT: 1164 concat 497 1163 1162
// CHECK-NEXT: 1165 slice 25 1144 26 26
// CHECK-NEXT: 1166 concat 500 1165 1164
// CHECK-NEXT: 1167 slice 25 1144 26 26
// CHECK-NEXT: 1168 concat 503 1167 1166
// CHECK-NEXT: 1169 slice 25 1144 26 26
// CHECK-NEXT: 1170 concat 506 1169 1168
// CHECK-NEXT: 1171 slice 25 1144 26 26
// CHECK-NEXT: 1172 concat 509 1171 1170
// CHECK-NEXT: 1173 slice 25 1144 26 26
// CHECK-NEXT: 1174 concat 512 1173 1172
// CHECK-NEXT: 1175 slice 25 1144 26 26
// CHECK-NEXT: 1176 concat 515 1175 1174
// CHECK-NEXT: 1177 slice 25 1144 26 26
// CHECK-NEXT: 1178 concat 518 1177 1176
// CHECK-NEXT: 1179 slice 25 1144 26 26
// CHECK-NEXT: 1180 concat 521 1179 1178
// CHECK-NEXT: 1181 slice 16 1143 17 0
// CHECK-NEXT: 1182 ite 16 1087 1181 1110
// CHECK-NEXT: 1183 slice 25 1182 17 17
// CHECK-NEXT: 1184 concat 226 1183 1182
// CHECK-NEXT: 1185 slice 25 1182 17 17
// CHECK-NEXT: 1186 concat 228 1185 1184
// CHECK-NEXT: 1187 slice 25 1182 17 17
// CHECK-NEXT: 1188 concat 230 1187 1186
// CHECK-NEXT: 1189 slice 25 1182 17 17
// CHECK-NEXT: 1190 concat 232 1189 1188
// CHECK-NEXT: 1191 slice 25 1182 17 17
// CHECK-NEXT: 1192 concat 234 1191 1190
// CHECK-NEXT: 1193 slice 25 1182 17 17
// CHECK-NEXT: 1194 concat 236 1193 1192
// CHECK-NEXT: 1195 slice 25 1182 17 17
// CHECK-NEXT: 1196 concat 238 1195 1194
// CHECK-NEXT: 1197 slice 25 1182 17 17
// CHECK-NEXT: 1198 concat 240 1197 1196
// CHECK-NEXT: 1199 slice 25 1182 17 17
// CHECK-NEXT: 1200 concat 47 1199 1198
// CHECK-NEXT: 1201 slice 25 1182 17 17
// CHECK-NEXT: 1202 concat 243 1201 1200
// CHECK-NEXT: 1203 slice 25 1182 17 17
// CHECK-NEXT: 1204 concat 245 1203 1202
// CHECK-NEXT: 1205 slice 25 1182 17 17
// CHECK-NEXT: 1206 concat 1 1205 1204
// CHECK-NEXT: 1207 slice 25 1182 17 17
// CHECK-NEXT: 1208 concat 480 1207 1206
// CHECK-NEXT: 1209 slice 25 1182 17 17
// CHECK-NEXT: 1210 concat 3 1209 1208
// CHECK-NEXT: 1211 slice 25 1182 17 17
// CHECK-NEXT: 1212 concat 485 1211 1210
// CHECK-NEXT: 1213 slice 25 1182 17 17
// CHECK-NEXT: 1214 concat 488 1213 1212
// CHECK-NEXT: 1215 slice 25 1182 17 17
// CHECK-NEXT: 1216 concat 491 1215 1214
// CHECK-NEXT: 1217 slice 25 1182 17 17
// CHECK-NEXT: 1218 concat 494 1217 1216
// CHECK-NEXT: 1219 slice 25 1182 17 17
// CHECK-NEXT: 1220 concat 497 1219 1218
// CHECK-NEXT: 1221 slice 25 1182 17 17
// CHECK-NEXT: 1222 concat 500 1221 1220
// CHECK-NEXT: 1223 slice 25 1182 17 17
// CHECK-NEXT: 1224 concat 503 1223 1222
// CHECK-NEXT: 1225 slice 25 1182 17 17
// CHECK-NEXT: 1226 concat 506 1225 1224
// CHECK-NEXT: 1227 slice 25 1182 17 17
// CHECK-NEXT: 1228 concat 509 1227 1226
// CHECK-NEXT: 1229 slice 25 1182 17 17
// CHECK-NEXT: 1230 concat 512 1229 1228
// CHECK-NEXT: 1231 slice 25 1182 17 17
// CHECK-NEXT: 1232 concat 515 1231 1230
// CHECK-NEXT: 1233 slice 25 1182 17 17
// CHECK-NEXT: 1234 concat 518 1233 1232
// CHECK-NEXT: 1235 slice 25 1182 17 17
// CHECK-NEXT: 1236 concat 521 1235 1234
// CHECK-NEXT: 1237 mul 521 1180 1236
// CHECK-NEXT: 1238 const 521 000000000000000000000000000000000000000000000
// CHECK-NEXT: 1239 ite 521 1100 1238 1237
// CHECK-NEXT: 1240 slice 518 1239 43 0
// CHECK-NEXT: 1241 const 515 1010101010101010101010101010101010101010101
// CHECK-NEXT: 1242 uext 518 1241 1
// CHECK-NEXT: 1243 and 518 1240 1242
// CHECK-NEXT: 1244 concat 521 98 1243
// CHECK-NEXT: 1245 state 521
// CHECK-NEXT: 1246 state 521
// CHECK-NEXT: 1247 state 25
// CHECK-NEXT: 1248 init 25 1247 98
// CHECK-NEXT: 1249 concat 104 103 1247
// CHECK-NEXT: 1250 eq 25 1249 106
// CHECK-NEXT: 1251 ite 521 1250 1246 1245
// CHECK-NEXT: 1252 slice 25 69 0 0
// CHECK-NEXT: 1253 ite 521 1252 1251 1244
// CHECK-NEXT: 1254 redor 25 417
// CHECK-NEXT: 1255 not 25 1254
// CHECK-NEXT: 1256 ite 521 1255 1253 904
// CHECK-NEXT: 1257 slice 25 1256 44 44
// CHECK-NEXT: 1258 concat 524 1257 1256
// CHECK-NEXT: 1259 slice 25 1256 44 44
// CHECK-NEXT: 1260 concat 527 1259 1258
// CHECK-NEXT: 1261 slice 25 1256 44 44
// CHECK-NEXT: 1262 concat 23 1261 1260
// CHECK-NEXT: 1263 uext 104 98 1
// CHECK-NEXT: 1264 eq 25 899 1263
// CHECK-NEXT: 1265 ite 23 1264 1262 903
// CHECK-NEXT: 1266 concat 104 70 248
// CHECK-NEXT: 1267 ite 104 680 1266 406
// CHECK-NEXT: 1268 const 524 0000000000000000000000000000000000000000000000
// CHECK-NEXT: 1269 concat 23 1268 1267
// CHECK-NEXT: 1270 redor 25 899
// CHECK-NEXT: 1271 not 25 1270
// CHECK-NEXT: 1272 ite 23 1271 1269 1265
// CHECK-NEXT: 1273 xor 23 896 1272
// CHECK-NEXT: 1274 input 23
// CHECK-NEXT: 1275 slice 104 635 3 2
// CHECK-NEXT: 1276 eq 25 1275 637
// CHECK-NEXT: 1277 ite 23 1276 885 1274
// CHECK-NEXT: 1278 const 23 111111111111111111111111111111111111111111111111
// CHECK-NEXT: 1279 eq 25 1275 106
// CHECK-NEXT: 1280 ite 23 1279 1278 1277
// CHECK-NEXT: 1281 const 518 10101010101010101010101010101010101010101010
// CHECK-NEXT: 1282 and 518 1240 1281
// CHECK-NEXT: 1283 slice 25 1239 44 44
// CHECK-NEXT: 1284 not 25 1283
// CHECK-NEXT: 1285 concat 521 1284 1282
// CHECK-NEXT: 1286 state 521
// CHECK-NEXT: 1287 state 521
// CHECK-NEXT: 1288 state 25
// CHECK-NEXT: 1289 init 25 1288 98
// CHECK-NEXT: 1290 concat 104 103 1288
// CHECK-NEXT: 1291 eq 25 1290 106
// CHECK-NEXT: 1292 ite 521 1291 1287 1286
// CHECK-NEXT: 1293 ite 521 1252 1292 1285
// CHECK-NEXT: 1294 ite 521 1255 1293 904
// CHECK-NEXT: 1295 const 29 000
// CHECK-NEXT: 1296 concat 23 1295 1294
// CHECK-NEXT: 1297 uext 104 98 1
// CHECK-NEXT: 1298 eq 25 1275 1297
// CHECK-NEXT: 1299 ite 23 1298 1296 1280
// CHECK-NEXT: 1300 redor 25 1275
// CHECK-NEXT: 1301 not 25 1300
// CHECK-NEXT: 1302 ite 23 1301 892 1299
// CHECK-NEXT: 1303 xor 23 1273 1302
// CHECK-NEXT: 1304 and 23 1272 1302
// CHECK-NEXT: 1305 and 23 896 1302
// CHECK-NEXT: 1306 or 23 1304 1305
// CHECK-NEXT: 1307 and 23 1272 896
// CHECK-NEXT: 1308 or 23 1306 1307
// CHECK-NEXT: 1309 slice 25 402 3 3
// CHECK-NEXT: 1310 ite 23 1309 1308 1303
// CHECK-NEXT: 1311 slice 25 402 2 2
// CHECK-NEXT: 1312 ite 23 1311 892 1308
// CHECK-NEXT: 1313 slice 25 1312 11 11
// CHECK-NEXT: 1314 and 25 1313 419
// CHECK-NEXT: 1315 slice 25 1312 23 23
// CHECK-NEXT: 1316 and 25 1315 1255
// CHECK-NEXT: 1317 slice 25 1312 35 35
// CHECK-NEXT: 1318 and 25 1317 419
// CHECK-NEXT: 1319 slice 211 1312 10 0
// CHECK-NEXT: 1320 concat 213 1319 248
// CHECK-NEXT: 1321 concat 215 1314 1320
// CHECK-NEXT: 1322 slice 211 1312 22 12
// CHECK-NEXT: 1323 concat 236 1322 1321
// CHECK-NEXT: 1324 concat 238 1316 1323
// CHECK-NEXT: 1325 slice 211 1312 34 24
// CHECK-NEXT: 1326 concat 494 1325 1324
// CHECK-NEXT: 1327 concat 497 1318 1326
// CHECK-NEXT: 1328 slice 211 1312 46 36
// CHECK-NEXT: 1329 concat 23 1328 1327
// CHECK-NEXT: 1330 and 23 1310 1329
// CHECK-NEXT: 1331 input 23
// CHECK-NEXT: 1332 slice 104 635 8 7
// CHECK-NEXT: 1333 eq 25 1332 637
// CHECK-NEXT: 1334 ite 23 1333 885 1331
// CHECK-NEXT: 1335 eq 25 1332 106
// CHECK-NEXT: 1336 ite 23 1335 78 1334
// CHECK-NEXT: 1337 uext 104 98 1
// CHECK-NEXT: 1338 eq 25 1332 1337
// CHECK-NEXT: 1339 ite 23 1338 538 1336
// CHECK-NEXT: 1340 redor 25 1332
// CHECK-NEXT: 1341 not 25 1340
// CHECK-NEXT: 1342 ite 23 1341 892 1339
// CHECK-NEXT: 1343 and 23 1342 1329
// CHECK-NEXT: 1344 or 23 1330 1343
// CHECK-NEXT: 1345 and 23 1310 1342
// CHECK-NEXT: 1346 or 23 1344 1345
// CHECK-NEXT: 1347 slice 25 1346 35 35
// CHECK-NEXT: 1348 and 25 419 1347
// CHECK-NEXT: 1349 slice 213 1346 47 36
// CHECK-NEXT: 1350 concat 215 1349 1348
// CHECK-NEXT: 1351 uext 217 1350 1
// CHECK-NEXT: 1352 xor 23 1310 1329
// CHECK-NEXT: 1353 xor 23 1352 1342
// CHECK-NEXT: 1354 slice 213 1353 47 36
// CHECK-NEXT: 1355 slice 25 1312 47 47
// CHECK-NEXT: 1356 concat 215 1355 1354
// CHECK-NEXT: 1357 uext 217 1356 1
// CHECK-NEXT: 1358 add 217 1351 1357
// CHECK-NEXT: 1359 slice 25 1346 23 23
// CHECK-NEXT: 1360 and 25 1255 1359
// CHECK-NEXT: 1361 slice 211 1346 34 24
// CHECK-NEXT: 1362 concat 213 1361 1360
// CHECK-NEXT: 1363 uext 215 1362 1
// CHECK-NEXT: 1364 slice 213 1353 35 24
// CHECK-NEXT: 1365 uext 215 1364 1
// CHECK-NEXT: 1366 add 215 1363 1365
// CHECK-NEXT: 1367 slice 25 1346 11 11
// CHECK-NEXT: 1368 and 25 419 1367
// CHECK-NEXT: 1369 slice 211 1346 22 12
// CHECK-NEXT: 1370 concat 213 1369 1368
// CHECK-NEXT: 1371 uext 215 1370 1
// CHECK-NEXT: 1372 slice 213 1353 23 12
// CHECK-NEXT: 1373 uext 215 1372 1
// CHECK-NEXT: 1374 add 215 1371 1373
// CHECK-NEXT: 1375 input 25
// CHECK-NEXT: 1376 slice 25 538 47 47
// CHECK-NEXT: 1377 not 25 1376
// CHECK-NEXT: 1378 slice 25 30 0 0
// CHECK-NEXT: 1379 neq 25 1378 98
// CHECK-NEXT: 1380 and 25 1379 1378
// CHECK-NEXT: 1381 slice 25 30 1 1
// CHECK-NEXT: 1382 neq 25 1381 98
// CHECK-NEXT: 1383 and 25 1382 1381
// CHECK-NEXT: 1384 slice 25 30 2 2
// CHECK-NEXT: 1385 neq 25 1384 98
// CHECK-NEXT: 1386 and 25 1385 1384
// CHECK-NEXT: 1387 concat 104 1383 1380
// CHECK-NEXT: 1388 concat 29 1386 1387
// CHECK-NEXT: 1389 state 29
// CHECK-NEXT: 1390 state 29
// CHECK-NEXT: 1391 state 25
// CHECK-NEXT: 1392 init 25 1391 98
// CHECK-NEXT: 1393 concat 104 103 1391
// CHECK-NEXT: 1394 eq 25 1393 106
// CHECK-NEXT: 1395 ite 29 1394 1390 1389
// CHECK-NEXT: 1396 slice 25 31 0 0
// CHECK-NEXT: 1397 ite 29 1396 1395 1388
// CHECK-NEXT: 1398 eq 25 1397 253
// CHECK-NEXT: 1399 ite 25 1398 1377 1375
// CHECK-NEXT: 1400 slice 25 1144 26 26
// CHECK-NEXT: 1401 slice 25 1182 17 17
// CHECK-NEXT: 1402 xor 25 1400 1401
// CHECK-NEXT: 1403 not 25 1402
// CHECK-NEXT: 1404 state 25
// CHECK-NEXT: 1405 state 25
// CHECK-NEXT: 1406 state 25
// CHECK-NEXT: 1407 init 25 1406 98
// CHECK-NEXT: 1408 concat 104 103 1406
// CHECK-NEXT: 1409 eq 25 1408 106
// CHECK-NEXT: 1410 ite 25 1409 1405 1404
// CHECK-NEXT: 1411 ite 25 1252 1410 1403
// CHECK-NEXT: 1412 not 25 1411
// CHECK-NEXT: 1413 const 29 110
// CHECK-NEXT: 1414 eq 25 1397 1413
// CHECK-NEXT: 1415 ite 25 1414 1412 1399
// CHECK-NEXT: 1416 eq 25 1397 676
// CHECK-NEXT: 1417 ite 25 1416 1376 1415
// CHECK-NEXT: 1418 state 25
// CHECK-NEXT: 1419 state 25
// CHECK-NEXT: 1420 state 25
// CHECK-NEXT: 1421 init 25 1420 98
// CHECK-NEXT: 1422 concat 104 103 1420
// CHECK-NEXT: 1423 eq 25 1422 106
// CHECK-NEXT: 1424 ite 25 1423 1419 1418
// CHECK-NEXT: 1425 state 7
// CHECK-NEXT: 1426 state 7
// CHECK-NEXT: 1427 state 25
// CHECK-NEXT: 1428 init 25 1427 98
// CHECK-NEXT: 1429 concat 104 103 1427
// CHECK-NEXT: 1430 eq 25 1429 106
// CHECK-NEXT: 1431 ite 7 1430 1426 1425
// CHECK-NEXT: 1432 slice 25 1431 3 3
// CHECK-NEXT: 1433 xor 25 1424 1432
// CHECK-NEXT: 1434 not 25 1433
// CHECK-NEXT: 1435 eq 25 1397 679
// CHECK-NEXT: 1436 ite 25 1435 1434 1417
// CHECK-NEXT: 1437 slice 25 74 47 47
// CHECK-NEXT: 1438 not 25 1437
// CHECK-NEXT: 1439 uext 29 637 1
// CHECK-NEXT: 1440 eq 25 1397 1439
// CHECK-NEXT: 1441 ite 25 1440 1438 1436
// CHECK-NEXT: 1442 not 25 26
// CHECK-NEXT: 1443 uext 29 106 1
// CHECK-NEXT: 1444 eq 25 1397 1443
// CHECK-NEXT: 1445 ite 25 1444 1442 1441
// CHECK-NEXT: 1446 uext 29 98 2
// CHECK-NEXT: 1447 eq 25 1397 1446
// CHECK-NEXT: 1448 ite 25 1447 1437 1445
// CHECK-NEXT: 1449 neq 25 27 98
// CHECK-NEXT: 1450 xor 25 27 53
// CHECK-NEXT: 1451 and 25 1449 1450
// CHECK-NEXT: 1452 state 25
// CHECK-NEXT: 1453 state 25
// CHECK-NEXT: 1454 state 25
// CHECK-NEXT: 1455 init 25 1454 98
// CHECK-NEXT: 1456 concat 104 103 1454
// CHECK-NEXT: 1457 eq 25 1456 106
// CHECK-NEXT: 1458 ite 25 1457 1453 1452
// CHECK-NEXT: 1459 slice 25 28 0 0
// CHECK-NEXT: 1460 ite 25 1459 1458 1451
// CHECK-NEXT: 1461 not 25 1460
// CHECK-NEXT: 1462 redor 25 1397
// CHECK-NEXT: 1463 not 25 1462
// CHECK-NEXT: 1464 ite 25 1463 1461 1448
// CHECK-NEXT: 1465 not 25 1464
// CHECK-NEXT: 1466 or 25 1309 1311
// CHECK-NEXT: 1467 ite 25 1466 248 1465
// CHECK-NEXT: 1468 slice 211 1346 10 0
// CHECK-NEXT: 1469 concat 213 1468 1467
// CHECK-NEXT: 1470 uext 215 1469 1
// CHECK-NEXT: 1471 slice 213 1353 11 0
// CHECK-NEXT: 1472 uext 215 1471 1
// CHECK-NEXT: 1473 add 215 1470 1472
// CHECK-NEXT: 1474 slice 25 1473 12 12
// CHECK-NEXT: 1475 and 25 419 1474
// CHECK-NEXT: 1476 uext 215 1475 12
// CHECK-NEXT: 1477 add 215 1374 1476
// CHECK-NEXT: 1478 slice 25 1477 12 12
// CHECK-NEXT: 1479 and 25 1255 1478
// CHECK-NEXT: 1480 uext 215 1479 12
// CHECK-NEXT: 1481 add 215 1366 1480
// CHECK-NEXT: 1482 slice 25 1481 12 12
// CHECK-NEXT: 1483 and 25 419 1482
// CHECK-NEXT: 1484 uext 217 1483 13
// CHECK-NEXT: 1485 add 217 1358 1484
// CHECK-NEXT: 1486 slice 25 1485 12 12
// CHECK-NEXT: 1487 xor 25 405 1486
// CHECK-NEXT: 1488 xor 25 405 1487
// CHECK-NEXT: 1489 slice 25 77 0 0
// CHECK-NEXT: 1490 ite 25 1489 1433 1488
// CHECK-NEXT: 1491 output 1490 CARRYCASCOUT 
// CHECK-NEXT: 1492 xor 25 1367 1474
// CHECK-NEXT: 1493 xor 25 1492 1313
// CHECK-NEXT: 1494 xor 25 405 1493
// CHECK-NEXT: 1495 slice 7 635 3 0
// CHECK-NEXT: 1496 uext 7 676 1
// CHECK-NEXT: 1497 eq 25 1495 1496
// CHECK-NEXT: 1498 slice 104 402 3 2
// CHECK-NEXT: 1499 redor 25 1498
// CHECK-NEXT: 1500 or 25 1497 1499
// CHECK-NEXT: 1501 ite 25 1500 248 1494
// CHECK-NEXT: 1502 uext 104 98 1
// CHECK-NEXT: 1503 eq 25 417 1502
// CHECK-NEXT: 1504 ite 25 1503 1501 248
// CHECK-NEXT: 1505 xor 25 1359 1478
// CHECK-NEXT: 1506 xor 25 1505 1315
// CHECK-NEXT: 1507 xor 25 405 1506
// CHECK-NEXT: 1508 ite 25 1500 248 1507
// CHECK-NEXT: 1509 redor 25 417
// CHECK-NEXT: 1510 ite 25 1509 1508 248
// CHECK-NEXT: 1511 xor 25 1347 1482
// CHECK-NEXT: 1512 xor 25 1511 1317
// CHECK-NEXT: 1513 xor 25 405 1512
// CHECK-NEXT: 1514 ite 25 1500 248 1513
// CHECK-NEXT: 1515 ite 25 1503 1514 248
// CHECK-NEXT: 1516 concat 104 1510 1504
// CHECK-NEXT: 1517 concat 29 1515 1516
// CHECK-NEXT: 1518 concat 7 1487 1517
// CHECK-NEXT: 1519 ite 7 1489 1431 1518
// CHECK-NEXT: 1520 output 1519 CARRYOUT 
// CHECK-NEXT: 1521 slice 25 1485 13 13
// CHECK-NEXT: 1522 state 25
// CHECK-NEXT: 1523 state 25
// CHECK-NEXT: 1524 state 25
// CHECK-NEXT: 1525 init 25 1524 98
// CHECK-NEXT: 1526 concat 104 103 1524
// CHECK-NEXT: 1527 eq 25 1526 106
// CHECK-NEXT: 1528 ite 25 1527 1523 1522
// CHECK-NEXT: 1529 ite 25 1489 1528 1521
// CHECK-NEXT: 1530 output 1529 MULTSIGNOUT 
// CHECK-NEXT: 1531 const 10 10001
// CHECK-NEXT: 1532 eq 25 90 1531
// CHECK-NEXT: 1533 ite 25 1532 98 248
// CHECK-NEXT: 1534 const 7 1001
// CHECK-NEXT: 1535 uext 10 1534 1
// CHECK-NEXT: 1536 eq 25 90 1535
// CHECK-NEXT: 1537 ite 25 1536 248 1533
// CHECK-NEXT: 1538 ite 23 1537 885 73
// CHECK-NEXT: 1539 slice 25 402 1 1
// CHECK-NEXT: 1540 slice 25 402 1 1
// CHECK-NEXT: 1541 concat 104 1540 1539
// CHECK-NEXT: 1542 slice 25 402 1 1
// CHECK-NEXT: 1543 concat 29 1542 1541
// CHECK-NEXT: 1544 slice 25 402 1 1
// CHECK-NEXT: 1545 concat 7 1544 1543
// CHECK-NEXT: 1546 slice 25 402 1 1
// CHECK-NEXT: 1547 concat 10 1546 1545
// CHECK-NEXT: 1548 slice 25 402 1 1
// CHECK-NEXT: 1549 concat 203 1548 1547
// CHECK-NEXT: 1550 slice 25 402 1 1
// CHECK-NEXT: 1551 concat 205 1550 1549
// CHECK-NEXT: 1552 slice 25 402 1 1
// CHECK-NEXT: 1553 concat 75 1552 1551
// CHECK-NEXT: 1554 slice 25 402 1 1
// CHECK-NEXT: 1555 concat 56 1554 1553
// CHECK-NEXT: 1556 slice 25 402 1 1
// CHECK-NEXT: 1557 concat 209 1556 1555
// CHECK-NEXT: 1558 slice 25 402 1 1
// CHECK-NEXT: 1559 concat 211 1558 1557
// CHECK-NEXT: 1560 slice 25 402 1 1
// CHECK-NEXT: 1561 concat 213 1560 1559
// CHECK-NEXT: 1562 slice 25 402 1 1
// CHECK-NEXT: 1563 concat 215 1562 1561
// CHECK-NEXT: 1564 slice 25 402 1 1
// CHECK-NEXT: 1565 concat 217 1564 1563
// CHECK-NEXT: 1566 slice 25 402 1 1
// CHECK-NEXT: 1567 concat 219 1566 1565
// CHECK-NEXT: 1568 slice 25 402 1 1
// CHECK-NEXT: 1569 concat 221 1568 1567
// CHECK-NEXT: 1570 slice 25 402 1 1
// CHECK-NEXT: 1571 concat 223 1570 1569
// CHECK-NEXT: 1572 slice 25 402 1 1
// CHECK-NEXT: 1573 concat 16 1572 1571
// CHECK-NEXT: 1574 slice 25 402 1 1
// CHECK-NEXT: 1575 concat 226 1574 1573
// CHECK-NEXT: 1576 slice 25 402 1 1
// CHECK-NEXT: 1577 concat 228 1576 1575
// CHECK-NEXT: 1578 slice 25 402 1 1
// CHECK-NEXT: 1579 concat 230 1578 1577
// CHECK-NEXT: 1580 slice 25 402 1 1
// CHECK-NEXT: 1581 concat 232 1580 1579
// CHECK-NEXT: 1582 slice 25 402 1 1
// CHECK-NEXT: 1583 concat 234 1582 1581
// CHECK-NEXT: 1584 slice 25 402 1 1
// CHECK-NEXT: 1585 concat 236 1584 1583
// CHECK-NEXT: 1586 slice 25 402 1 1
// CHECK-NEXT: 1587 concat 238 1586 1585
// CHECK-NEXT: 1588 slice 25 402 1 1
// CHECK-NEXT: 1589 concat 240 1588 1587
// CHECK-NEXT: 1590 slice 25 402 1 1
// CHECK-NEXT: 1591 concat 47 1590 1589
// CHECK-NEXT: 1592 slice 25 402 1 1
// CHECK-NEXT: 1593 concat 243 1592 1591
// CHECK-NEXT: 1594 slice 25 402 1 1
// CHECK-NEXT: 1595 concat 245 1594 1593
// CHECK-NEXT: 1596 slice 25 402 1 1
// CHECK-NEXT: 1597 concat 1 1596 1595
// CHECK-NEXT: 1598 slice 25 402 1 1
// CHECK-NEXT: 1599 concat 480 1598 1597
// CHECK-NEXT: 1600 slice 25 402 1 1
// CHECK-NEXT: 1601 concat 3 1600 1599
// CHECK-NEXT: 1602 slice 25 402 1 1
// CHECK-NEXT: 1603 concat 485 1602 1601
// CHECK-NEXT: 1604 slice 25 402 1 1
// CHECK-NEXT: 1605 concat 488 1604 1603
// CHECK-NEXT: 1606 slice 25 402 1 1
// CHECK-NEXT: 1607 concat 491 1606 1605
// CHECK-NEXT: 1608 slice 25 402 1 1
// CHECK-NEXT: 1609 concat 494 1608 1607
// CHECK-NEXT: 1610 slice 25 402 1 1
// CHECK-NEXT: 1611 concat 497 1610 1609
// CHECK-NEXT: 1612 slice 25 402 1 1
// CHECK-NEXT: 1613 concat 500 1612 1611
// CHECK-NEXT: 1614 slice 25 402 1 1
// CHECK-NEXT: 1615 concat 503 1614 1613
// CHECK-NEXT: 1616 slice 25 402 1 1
// CHECK-NEXT: 1617 concat 506 1616 1615
// CHECK-NEXT: 1618 slice 25 402 1 1
// CHECK-NEXT: 1619 concat 509 1618 1617
// CHECK-NEXT: 1620 slice 25 402 1 1
// CHECK-NEXT: 1621 concat 512 1620 1619
// CHECK-NEXT: 1622 slice 25 402 1 1
// CHECK-NEXT: 1623 concat 515 1622 1621
// CHECK-NEXT: 1624 slice 25 402 1 1
// CHECK-NEXT: 1625 concat 518 1624 1623
// CHECK-NEXT: 1626 slice 25 402 1 1
// CHECK-NEXT: 1627 concat 521 1626 1625
// CHECK-NEXT: 1628 slice 25 402 1 1
// CHECK-NEXT: 1629 concat 524 1628 1627
// CHECK-NEXT: 1630 slice 25 402 1 1
// CHECK-NEXT: 1631 concat 527 1630 1629
// CHECK-NEXT: 1632 slice 25 402 1 1
// CHECK-NEXT: 1633 concat 23 1632 1631
// CHECK-NEXT: 1634 slice 213 1473 11 0
// CHECK-NEXT: 1635 slice 213 1477 11 0
// CHECK-NEXT: 1636 concat 236 1635 1634
// CHECK-NEXT: 1637 slice 213 1481 11 0
// CHECK-NEXT: 1638 concat 494 1637 1636
// CHECK-NEXT: 1639 slice 213 1485 11 0
// CHECK-NEXT: 1640 concat 23 1639 1638
// CHECK-NEXT: 1641 xor 23 1633 1640
// CHECK-NEXT: 1642 xor 23 1538 1641
// CHECK-NEXT: 1643 not 23 1642
// CHECK-NEXT: 1644 slice 524 885 45 0
// CHECK-NEXT: 1645 not 524 1644
// CHECK-NEXT: 1646 concat 23 1645 406
// CHECK-NEXT: 1647 const 10 10111
// CHECK-NEXT: 1648 eq 25 89 1647
// CHECK-NEXT: 1649 ite 104 1648 637 406
// CHECK-NEXT: 1650 const 10 10110
// CHECK-NEXT: 1651 eq 25 89 1650
// CHECK-NEXT: 1652 ite 104 1651 106 1649
// CHECK-NEXT: 1653 eq 25 89 1531
// CHECK-NEXT: 1654 ite 104 1653 410 1652
// CHECK-NEXT: 1655 const 7 1000
// CHECK-NEXT: 1656 uext 10 1655 1
// CHECK-NEXT: 1657 eq 25 89 1656
// CHECK-NEXT: 1658 ite 104 1657 406 1654
// CHECK-NEXT: 1659 eq 25 1658 637
// CHECK-NEXT: 1660 ite 23 1659 1646 68
// CHECK-NEXT: 1661 slice 527 885 46 0
// CHECK-NEXT: 1662 not 527 1661
// CHECK-NEXT: 1663 concat 23 1662 248
// CHECK-NEXT: 1664 eq 25 1658 106
// CHECK-NEXT: 1665 ite 23 1664 1663 1660
// CHECK-NEXT: 1666 uext 104 98 1
// CHECK-NEXT: 1667 eq 25 1658 1666
// CHECK-NEXT: 1668 ite 23 1667 885 1665
// CHECK-NEXT: 1669 const 10 10101
// CHECK-NEXT: 1670 eq 25 92 1669
// CHECK-NEXT: 1671 ite 25 1670 98 248
// CHECK-NEXT: 1672 const 7 1011
// CHECK-NEXT: 1673 uext 10 1672 1
// CHECK-NEXT: 1674 eq 25 92 1673
// CHECK-NEXT: 1675 ite 25 1674 248 1671
// CHECK-NEXT: 1676 ite 23 1675 1668 1278
// CHECK-NEXT: 1677 or 23 1643 1676
// CHECK-NEXT: 1678 redand 25 1677
// CHECK-NEXT: 1679 state 25
// CHECK-NEXT: 1680 state 25
// CHECK-NEXT: 1681 state 25
// CHECK-NEXT: 1682 init 25 1681 98
// CHECK-NEXT: 1683 concat 104 103 1681
// CHECK-NEXT: 1684 eq 25 1683 106
// CHECK-NEXT: 1685 ite 25 1684 1680 1679
// CHECK-NEXT: 1686 ite 25 1489 1685 1678
// CHECK-NEXT: 1687 not 25 1686
// CHECK-NEXT: 1688 or 23 1642 1676
// CHECK-NEXT: 1689 redand 25 1688
// CHECK-NEXT: 1690 state 25
// CHECK-NEXT: 1691 state 25
// CHECK-NEXT: 1692 state 25
// CHECK-NEXT: 1693 init 25 1692 98
// CHECK-NEXT: 1694 concat 104 103 1692
// CHECK-NEXT: 1695 eq 25 1694 106
// CHECK-NEXT: 1696 ite 25 1695 1691 1690
// CHECK-NEXT: 1697 ite 25 1489 1696 1689
// CHECK-NEXT: 1698 not 25 1697
// CHECK-NEXT: 1699 and 25 1687 1698
// CHECK-NEXT: 1700 state 25
// CHECK-NEXT: 1701 state 25
// CHECK-NEXT: 1702 state 25
// CHECK-NEXT: 1703 init 25 1702 98
// CHECK-NEXT: 1704 concat 104 103 1702
// CHECK-NEXT: 1705 eq 25 1704 106
// CHECK-NEXT: 1706 ite 25 1705 1701 1700
// CHECK-NEXT: 1707 ite 25 1489 1706 1678
// CHECK-NEXT: 1708 and 25 1699 1707
// CHECK-NEXT: 1709 ite 25 1675 1708 248
// CHECK-NEXT: 1710 output 1709 OVERFLOW 
// CHECK-NEXT: 1711 ite 23 1489 538 1641
// CHECK-NEXT: 1712 output 1711 P 
// CHECK-NEXT: 1713 output 1697 PATTERNBDETECT 
// CHECK-NEXT: 1714 output 1686 PATTERNDETECT 
// CHECK-NEXT: 1715 output 1711 PCOUT 
// CHECK-NEXT: 1716 state 25
// CHECK-NEXT: 1717 state 25
// CHECK-NEXT: 1718 state 25
// CHECK-NEXT: 1719 init 25 1718 98
// CHECK-NEXT: 1720 concat 104 103 1718
// CHECK-NEXT: 1721 eq 25 1720 106
// CHECK-NEXT: 1722 ite 25 1721 1717 1716
// CHECK-NEXT: 1723 ite 25 1489 1722 1689
// CHECK-NEXT: 1724 and 25 1699 1723
// CHECK-NEXT: 1725 ite 25 1675 1724 248
// CHECK-NEXT: 1726 output 1725 UNDERFLOW 
// CHECK-NEXT: 1727 slice 203 1303 5 0
// CHECK-NEXT: 1728 redxor 25 1727
// CHECK-NEXT: 1729 const 10 11000
// CHECK-NEXT: 1730 eq 25 94 1729
// CHECK-NEXT: 1731 ite 25 1730 98 248
// CHECK-NEXT: 1732 const 7 1101
// CHECK-NEXT: 1733 uext 10 1732 1
// CHECK-NEXT: 1734 eq 25 94 1733
// CHECK-NEXT: 1735 ite 25 1734 248 1731
// CHECK-NEXT: 1736 ite 25 1735 1728 248
// CHECK-NEXT: 1737 slice 203 1303 11 6
// CHECK-NEXT: 1738 redxor 25 1737
// CHECK-NEXT: 1739 ite 25 1735 1738 248
// CHECK-NEXT: 1740 xor 25 1736 1739
// CHECK-NEXT: 1741 const 10 11010
// CHECK-NEXT: 1742 eq 25 95 1741
// CHECK-NEXT: 1743 ite 25 1742 98 248
// CHECK-NEXT: 1744 const 7 1110
// CHECK-NEXT: 1745 uext 10 1744 1
// CHECK-NEXT: 1746 eq 25 95 1745
// CHECK-NEXT: 1747 ite 25 1746 248 1743
// CHECK-NEXT: 1748 ite 25 1747 1736 1740
// CHECK-NEXT: 1749 slice 203 1303 17 12
// CHECK-NEXT: 1750 redxor 25 1749
// CHECK-NEXT: 1751 ite 25 1735 1750 248
// CHECK-NEXT: 1752 slice 203 1303 23 18
// CHECK-NEXT: 1753 redxor 25 1752
// CHECK-NEXT: 1754 ite 25 1735 1753 248
// CHECK-NEXT: 1755 xor 25 1751 1754
// CHECK-NEXT: 1756 xor 25 1740 1755
// CHECK-NEXT: 1757 ite 25 1747 1739 1756
// CHECK-NEXT: 1758 ite 25 1747 1751 1755
// CHECK-NEXT: 1759 slice 203 1303 29 24
// CHECK-NEXT: 1760 redxor 25 1759
// CHECK-NEXT: 1761 ite 25 1735 1760 248
// CHECK-NEXT: 1762 slice 203 1303 35 30
// CHECK-NEXT: 1763 redxor 25 1762
// CHECK-NEXT: 1764 ite 25 1735 1763 248
// CHECK-NEXT: 1765 xor 25 1761 1764
// CHECK-NEXT: 1766 slice 203 1303 41 36
// CHECK-NEXT: 1767 redxor 25 1766
// CHECK-NEXT: 1768 ite 25 1735 1767 248
// CHECK-NEXT: 1769 slice 203 1303 47 42
// CHECK-NEXT: 1770 redxor 25 1769
// CHECK-NEXT: 1771 ite 25 1735 1770 248
// CHECK-NEXT: 1772 xor 25 1768 1771
// CHECK-NEXT: 1773 xor 25 1765 1772
// CHECK-NEXT: 1774 xor 25 1756 1773
// CHECK-NEXT: 1775 ite 25 1747 1754 1774
// CHECK-NEXT: 1776 ite 25 1747 1761 1765
// CHECK-NEXT: 1777 ite 25 1747 1764 1773
// CHECK-NEXT: 1778 ite 25 1747 1768 1772
// CHECK-NEXT: 1779 concat 104 1757 1748
// CHECK-NEXT: 1780 concat 29 1758 1779
// CHECK-NEXT: 1781 concat 7 1775 1780
// CHECK-NEXT: 1782 concat 10 1776 1781
// CHECK-NEXT: 1783 concat 203 1777 1782
// CHECK-NEXT: 1784 concat 205 1778 1783
// CHECK-NEXT: 1785 concat 75 1771 1784
// CHECK-NEXT: 1786 state 75
// CHECK-NEXT: 1787 state 75
// CHECK-NEXT: 1788 state 25
// CHECK-NEXT: 1789 init 25 1788 98
// CHECK-NEXT: 1790 concat 104 103 1788
// CHECK-NEXT: 1791 eq 25 1790 106
// CHECK-NEXT: 1792 ite 75 1791 1787 1786
// CHECK-NEXT: 1793 ite 75 1489 1792 1785
// CHECK-NEXT: 1794 output 1793 XOROUT 
// CHECK-NEXT: 1795 uext 1 108 0 A1_reg 
// CHECK-NEXT: 1796 uext 47 957 0 A2A1 
// CHECK-NEXT: 1797 uext 1 264 0 A2_reg 
// CHECK-NEXT: 1798 uext 104 268 0 ACASCREG_BIN 
// CHECK-NEXT: 1799 uext 3 4 0 ACASCREG_REG 
// CHECK-NEXT: 1800 uext 1 5 0 ACIN_in 
// CHECK-NEXT: 1801 uext 25 1141 0 ADREG_BIN 
// CHECK-NEXT: 1802 uext 25 1142 0 ADREG_INT 
// CHECK-NEXT: 1803 uext 3 6 0 ADREG_REG 
// CHECK-NEXT: 1804 uext 47 1143 0 AD_DATA 
// CHECK-NEXT: 1805 uext 47 1140 0 AD_DATA_reg 
// CHECK-NEXT: 1806 uext 47 1133 0 AD_in 
// CHECK-NEXT: 1807 uext 25 405 0 ALUMODE10_in 
// CHECK-NEXT: 1808 uext 25 1424 0 ALUMODE10_reg 
// CHECK-NEXT: 1809 uext 25 401 0 ALUMODEREG_BIN 
// CHECK-NEXT: 1810 uext 3 9 0 ALUMODEREG_REG 
// CHECK-NEXT: 1811 uext 7 402 0 ALUMODE_DATA 
// CHECK-NEXT: 1812 uext 7 393 0 ALUMODE_in 
// CHECK-NEXT: 1813 uext 7 400 0 ALUMODE_reg 
// CHECK-NEXT: 1814 uext 23 1641 0 ALU_OUT_in 
// CHECK-NEXT: 1815 uext 23 538 0 ALU_OUT_reg 
// CHECK-NEXT: 1816 uext 25 1400 0 AMULT26_in 
// CHECK-NEXT: 1817 uext 25 1080 0 AMULTSEL_BIN 
// CHECK-NEXT: 1818 uext 221 1077 0 AMULTSEL_REG 
// CHECK-NEXT: 1819 uext 104 265 0 AREG_BIN 
// CHECK-NEXT: 1820 uext 3 12 0 AREG_REG 
// CHECK-NEXT: 1821 uext 10 676 2
// CHECK-NEXT: 1822 eq 25 13 1821
// CHECK-NEXT: 1823 ite 104 1822 106 406
// CHECK-NEXT: 1824 uext 10 679 2
// CHECK-NEXT: 1825 eq 25 13 1824
// CHECK-NEXT: 1826 ite 104 1825 410 1823
// CHECK-NEXT: 1827 uext 10 637 3
// CHECK-NEXT: 1828 eq 25 13 1827
// CHECK-NEXT: 1829 ite 104 1828 406 1826
// CHECK-NEXT: 1830 uext 104 1829 0 AUTORESET_PATDET_BIN 
// CHECK-NEXT: 1831 sort bitvec 120
// CHECK-NEXT: 1832 sort bitvec 115
// CHECK-NEXT: 1833 const 1832 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
// CHECK-NEXT: 1834 concat 1831 1833 13
// CHECK-NEXT: 1835 uext 1831 1834 0 AUTORESET_PATDET_REG 
// CHECK-NEXT: 1836 const 10 10000
// CHECK-NEXT: 1837 eq 25 14 1836
// CHECK-NEXT: 1838 ite 25 1837 98 248
// CHECK-NEXT: 1839 uext 10 1413 2
// CHECK-NEXT: 1840 eq 25 14 1839
// CHECK-NEXT: 1841 ite 25 1840 248 1838
// CHECK-NEXT: 1842 uext 25 1841 0 AUTORESET_PRIORITY_BIN 
// CHECK-NEXT: 1843 const 491 00000000000000000000000000000000000
// CHECK-NEXT: 1844 concat 506 1843 14
// CHECK-NEXT: 1845 uext 506 1844 0 AUTORESET_PRIORITY_REG 
// CHECK-NEXT: 1846 uext 1 267 0 A_ALU 
// CHECK-NEXT: 1847 uext 25 256 0 A_INPUT_BIN 
// CHECK-NEXT: 1848 sort bitvec 56
// CHECK-NEXT: 1849 sort bitvec 51
// CHECK-NEXT: 1850 const 1849 000000000000000000000000000000000000000000000000000
// CHECK-NEXT: 1851 concat 1848 1850 15
// CHECK-NEXT: 1852 uext 1848 1851 0 A_INPUT_REG 
// CHECK-NEXT: 1853 uext 1 247 0 A_in 
// CHECK-NEXT: 1854 uext 16 278 0 B1_DATA_out 
// CHECK-NEXT: 1855 uext 16 1110 0 B2B1 
// CHECK-NEXT: 1856 uext 16 366 0 B2_DATA 
// CHECK-NEXT: 1857 uext 16 363 0 B2_reg 
// CHECK-NEXT: 1858 uext 104 367 0 BCASCREG_BIN 
// CHECK-NEXT: 1859 uext 3 18 0 BCASCREG_REG 
// CHECK-NEXT: 1860 uext 16 19 0 BCIN_in 
// CHECK-NEXT: 1861 uext 25 1401 0 BMULT17_in 
// CHECK-NEXT: 1862 uext 25 1087 0 BMULTSEL_BIN 
// CHECK-NEXT: 1863 concat 221 1076 20
// CHECK-NEXT: 1864 uext 221 1863 0 BMULTSEL_REG 
// CHECK-NEXT: 1865 uext 104 364 0 BREG_BIN 
// CHECK-NEXT: 1866 uext 3 21 0 BREG_REG 
// CHECK-NEXT: 1867 uext 16 366 0 B_ALU 
// CHECK-NEXT: 1868 uext 25 355 0 B_INPUT_BIN 
// CHECK-NEXT: 1869 concat 1848 1850 22
// CHECK-NEXT: 1870 uext 1848 1869 0 B_INPUT_REG 
// CHECK-NEXT: 1871 uext 16 349 0 B_in 
// CHECK-NEXT: 1872 uext 25 26 0 CARRYCASCIN_in 
// CHECK-NEXT: 1873 uext 25 1459 0 CARRYINREG_BIN 
// CHECK-NEXT: 1874 uext 3 28 0 CARRYINREG_REG 
// CHECK-NEXT: 1875 uext 25 1396 0 CARRYINSELREG_BIN 
// CHECK-NEXT: 1876 uext 3 31 0 CARRYINSELREG_REG 
// CHECK-NEXT: 1877 uext 29 1388 0 CARRYINSEL_in 
// CHECK-NEXT: 1878 uext 29 1397 0 CARRYINSEL_mux 
// CHECK-NEXT: 1879 uext 29 1395 0 CARRYINSEL_reg 
// CHECK-NEXT: 1880 uext 25 1451 0 CARRYIN_in 
// CHECK-NEXT: 1881 uext 25 1460 0 CARRYIN_mux 
// CHECK-NEXT: 1882 uext 25 1458 0 CARRYIN_reg 
// CHECK-NEXT: 1883 uext 25 1433 0 CCOUT_in 
// CHECK-NEXT: 1884 neq 25 32 98
// CHECK-NEXT: 1885 and 25 1884 32
// CHECK-NEXT: 1886 uext 25 1885 0 CEA1_in 
// CHECK-NEXT: 1887 neq 25 33 98
// CHECK-NEXT: 1888 and 25 1887 33
// CHECK-NEXT: 1889 uext 25 1888 0 CEA2_in 
// CHECK-NEXT: 1890 neq 25 34 98
// CHECK-NEXT: 1891 and 25 1890 34
// CHECK-NEXT: 1892 uext 25 1891 0 CEAD_in 
// CHECK-NEXT: 1893 neq 25 35 98
// CHECK-NEXT: 1894 and 25 1893 35
// CHECK-NEXT: 1895 uext 25 1894 0 CEALUMODE_in 
// CHECK-NEXT: 1896 neq 25 36 98
// CHECK-NEXT: 1897 and 25 1896 36
// CHECK-NEXT: 1898 uext 25 1897 0 CEB1_in 
// CHECK-NEXT: 1899 neq 25 37 98
// CHECK-NEXT: 1900 and 25 1899 37
// CHECK-NEXT: 1901 uext 25 1900 0 CEB2_in 
// CHECK-NEXT: 1902 neq 25 39 98
// CHECK-NEXT: 1903 and 25 1902 39
// CHECK-NEXT: 1904 uext 25 1903 0 CECARRYIN_in 
// CHECK-NEXT: 1905 neq 25 40 98
// CHECK-NEXT: 1906 and 25 1905 40
// CHECK-NEXT: 1907 uext 25 1906 0 CECTRL_in 
// CHECK-NEXT: 1908 neq 25 38 98
// CHECK-NEXT: 1909 and 25 1908 38
// CHECK-NEXT: 1910 uext 25 1909 0 CEC_in 
// CHECK-NEXT: 1911 neq 25 41 98
// CHECK-NEXT: 1912 and 25 1911 41
// CHECK-NEXT: 1913 uext 25 1912 0 CED_in 
// CHECK-NEXT: 1914 uext 25 42 0 CEINMODE_in 
// CHECK-NEXT: 1915 neq 25 43 98
// CHECK-NEXT: 1916 and 25 1915 43
// CHECK-NEXT: 1917 uext 25 1916 0 CEM_in 
// CHECK-NEXT: 1918 neq 25 44 98
// CHECK-NEXT: 1919 and 25 1918 44
// CHECK-NEXT: 1920 uext 25 1919 0 CEP_in 
// CHECK-NEXT: 1921 uext 25 103 0 CLK_in 
// CHECK-NEXT: 1922 uext 7 1518 0 COUT_in 
// CHECK-NEXT: 1923 uext 7 1431 0 COUT_reg 
// CHECK-NEXT: 1924 uext 25 884 0 CREG_BIN 
// CHECK-NEXT: 1925 uext 3 46 0 CREG_REG 
// CHECK-NEXT: 1926 uext 23 885 0 C_DATA_in 
// CHECK-NEXT: 1927 uext 23 876 0 C_in 
// CHECK-NEXT: 1928 uext 23 883 0 C_reg 
// CHECK-NEXT: 1929 uext 25 1072 0 DREG_BIN 
// CHECK-NEXT: 1930 uext 25 1102 0 DREG_INT 
// CHECK-NEXT: 1931 uext 3 49 0 DREG_REG 
// CHECK-NEXT: 1932 uext 47 1103 0 D_DATA 
// CHECK-NEXT: 1933 uext 47 1105 0 D_DATA_mux 
// CHECK-NEXT: 1934 uext 47 1071 0 D_DATA_reg 
// CHECK-NEXT: 1935 uext 47 1064 0 D_in 
// CHECK-NEXT: 1936 uext 25 943 0 INMODEREG_BIN 
// CHECK-NEXT: 1937 uext 3 51 0 INMODEREG_REG 
// CHECK-NEXT: 1938 uext 10 935 0 INMODE_in 
// CHECK-NEXT: 1939 uext 10 944 0 INMODE_mux 
// CHECK-NEXT: 1940 uext 10 942 0 INMODE_reg 
// CHECK-NEXT: 1941 uext 7 52 0 IS_ALUMODE_INVERTED_REG 
// CHECK-NEXT: 1942 uext 25 53 0 IS_CARRYIN_INVERTED_REG 
// CHECK-NEXT: 1943 uext 25 54 0 IS_CLK_INVERTED_REG 
// CHECK-NEXT: 1944 uext 10 55 0 IS_INMODE_INVERTED_REG 
// CHECK-NEXT: 1945 uext 56 57 0 IS_OPMODE_INVERTED_REG 
// CHECK-NEXT: 1946 uext 25 58 0 IS_RSTALLCARRYIN_INVERTED_REG 
// CHECK-NEXT: 1947 uext 25 59 0 IS_RSTALUMODE_INVERTED_REG 
// CHECK-NEXT: 1948 uext 25 60 0 IS_RSTA_INVERTED_REG 
// CHECK-NEXT: 1949 uext 25 61 0 IS_RSTB_INVERTED_REG 
// CHECK-NEXT: 1950 uext 25 62 0 IS_RSTCTRL_INVERTED_REG 
// CHECK-NEXT: 1951 uext 25 63 0 IS_RSTC_INVERTED_REG 
// CHECK-NEXT: 1952 uext 25 64 0 IS_RSTD_INVERTED_REG 
// CHECK-NEXT: 1953 uext 25 65 0 IS_RSTINMODE_INVERTED_REG 
// CHECK-NEXT: 1954 uext 25 66 0 IS_RSTM_INVERTED_REG 
// CHECK-NEXT: 1955 uext 25 67 0 IS_RSTP_INVERTED_REG 
// CHECK-NEXT: 1956 uext 23 68 0 MASK_REG 
// CHECK-NEXT: 1957 uext 25 1252 0 MREG_BIN 
// CHECK-NEXT: 1958 uext 3 69 0 MREG_REG 
// CHECK-NEXT: 1959 uext 25 70 0 MULTSIGNIN_in 
// CHECK-NEXT: 1960 uext 25 1521 0 MULTSIGN_ALU_in 
// CHECK-NEXT: 1961 uext 25 1528 0 MULTSIGN_ALU_reg 
// CHECK-NEXT: 1962 uext 25 634 0 OPMODEREG_BIN 
// CHECK-NEXT: 1963 uext 3 72 0 OPMODEREG_REG 
// CHECK-NEXT: 1964 uext 56 626 0 OPMODE_in 
// CHECK-NEXT: 1965 uext 56 635 0 OPMODE_mux 
// CHECK-NEXT: 1966 uext 56 633 0 OPMODE_reg 
// CHECK-NEXT: 1967 uext 23 73 0 PATTERN_REG 
// CHECK-NEXT: 1968 uext 23 74 0 PCIN_in 
// CHECK-NEXT: 1969 uext 25 953 0 PREADDINSEL_BIN 
// CHECK-NEXT: 1970 uext 75 76 0 PREADDINSEL_REG 
// CHECK-NEXT: 1971 uext 47 1129 0 PREADD_AB 
// CHECK-NEXT: 1972 uext 25 1489 0 PREG_BIN 
// CHECK-NEXT: 1973 uext 3 77 0 PREG_REG 
// CHECK-NEXT: 1974 uext 25 1376 0 P_FDBK_47_in 
// CHECK-NEXT: 1975 uext 23 538 0 P_FDBK_in 
// CHECK-NEXT: 1976 uext 23 78 0 RND_REG 
// CHECK-NEXT: 1977 neq 25 80 98
// CHECK-NEXT: 1978 xor 25 80 58
// CHECK-NEXT: 1979 and 25 1977 1978
// CHECK-NEXT: 1980 uext 25 1979 0 RSTALLCARRYIN_in 
// CHECK-NEXT: 1981 neq 25 81 98
// CHECK-NEXT: 1982 xor 25 81 59
// CHECK-NEXT: 1983 and 25 1981 1982
// CHECK-NEXT: 1984 uext 25 1983 0 RSTALUMODE_in 
// CHECK-NEXT: 1985 neq 25 79 98
// CHECK-NEXT: 1986 xor 25 79 60
// CHECK-NEXT: 1987 and 25 1985 1986
// CHECK-NEXT: 1988 uext 25 1987 0 RSTA_in 
// CHECK-NEXT: 1989 neq 25 82 98
// CHECK-NEXT: 1990 xor 25 82 61
// CHECK-NEXT: 1991 and 25 1989 1990
// CHECK-NEXT: 1992 uext 25 1991 0 RSTB_in 
// CHECK-NEXT: 1993 neq 25 84 98
// CHECK-NEXT: 1994 xor 25 84 62
// CHECK-NEXT: 1995 and 25 1993 1994
// CHECK-NEXT: 1996 uext 25 1995 0 RSTCTRL_in 
// CHECK-NEXT: 1997 neq 25 83 98
// CHECK-NEXT: 1998 xor 25 83 63
// CHECK-NEXT: 1999 and 25 1997 1998
// CHECK-NEXT: 2000 uext 25 1999 0 RSTC_in 
// CHECK-NEXT: 2001 neq 25 85 98
// CHECK-NEXT: 2002 xor 25 85 64
// CHECK-NEXT: 2003 and 25 2001 2002
// CHECK-NEXT: 2004 uext 25 2003 0 RSTD_in 
// CHECK-NEXT: 2005 neq 25 86 98
// CHECK-NEXT: 2006 xor 25 86 65
// CHECK-NEXT: 2007 and 25 2005 2006
// CHECK-NEXT: 2008 uext 25 2007 0 RSTINMODE_in 
// CHECK-NEXT: 2009 neq 25 87 98
// CHECK-NEXT: 2010 xor 25 87 66
// CHECK-NEXT: 2011 and 25 2009 2010
// CHECK-NEXT: 2012 uext 25 2011 0 RSTM_in 
// CHECK-NEXT: 2013 neq 25 88 98
// CHECK-NEXT: 2014 xor 25 88 67
// CHECK-NEXT: 2015 and 25 2013 2014
// CHECK-NEXT: 2016 uext 25 2015 0 RSTP_in 
// CHECK-NEXT: 2017 uext 104 1658 0 SEL_MASK_BIN 
// CHECK-NEXT: 2018 sort bitvec 112
// CHECK-NEXT: 2019 sort bitvec 107
// CHECK-NEXT: 2020 const 2019 00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
// CHECK-NEXT: 2021 concat 2018 2020 89
// CHECK-NEXT: 2022 uext 2018 2021 0 SEL_MASK_REG 
// CHECK-NEXT: 2023 uext 25 1537 0 SEL_PATTERN_BIN 
// CHECK-NEXT: 2024 concat 1848 1850 90
// CHECK-NEXT: 2025 uext 1848 2024 0 SEL_PATTERN_REG 
// CHECK-NEXT: 2026 uext 104 1099 0 USE_MULT_BIN 
// CHECK-NEXT: 2027 sort bitvec 64
// CHECK-NEXT: 2028 sort bitvec 59
// CHECK-NEXT: 2029 const 2028 00000000000000000000000000000000000000000000000000000000000
// CHECK-NEXT: 2030 concat 2027 2029 91
// CHECK-NEXT: 2031 uext 2027 2030 0 USE_MULT_REG 
// CHECK-NEXT: 2032 uext 25 1675 0 USE_PATTERN_DETECT_BIN 
// CHECK-NEXT: 2033 sort bitvec 72
// CHECK-NEXT: 2034 sort bitvec 67
// CHECK-NEXT: 2035 const 2034 0000000000000000000000000000000000000000000000000000000000000000000
// CHECK-NEXT: 2036 concat 2033 2035 92
// CHECK-NEXT: 2037 uext 2033 2036 0 USE_PATTERN_DETECT_REG 
// CHECK-NEXT: 2038 uext 104 417 0 USE_SIMD_BIN 
// CHECK-NEXT: 2039 const 515 0000000000000000000000000000000000000000000
// CHECK-NEXT: 2040 concat 23 2039 93
// CHECK-NEXT: 2041 uext 23 2040 0 USE_SIMD_REG 
// CHECK-NEXT: 2042 uext 25 1735 0 USE_WIDEXOR_BIN 
// CHECK-NEXT: 2043 concat 506 1843 94
// CHECK-NEXT: 2044 uext 506 2043 0 USE_WIDEXOR_REG 
// CHECK-NEXT: 2045 uext 521 1253 0 U_DATA 
// CHECK-NEXT: 2046 uext 521 1256 0 U_DATA_in 
// CHECK-NEXT: 2047 uext 521 1251 0 U_DATA_reg 
// CHECK-NEXT: 2048 uext 518 1243 0 U_in
// CHECK-NEXT: 2049 uext 521 1293 0 V_DATA 
// CHECK-NEXT: 2050 uext 521 1294 0 V_DATA_in 
// CHECK-NEXT: 2051 uext 521 1292 0 V_DATA_reg 
// CHECK-NEXT: 2052 uext 521 1285 0 V_in 
// CHECK-NEXT: 2053 uext 25 1747 0 XORSIMD_BIN 
// CHECK-NEXT: 2054 sort bitvec 88
// CHECK-NEXT: 2055 sort bitvec 83
// CHECK-NEXT: 2056 const 2055 00000000000000000000000000000000000000000000000000000000000000000000000000000000000
// CHECK-NEXT: 2057 concat 2054 2056 95
// CHECK-NEXT: 2058 uext 2054 2057 0 XORSIMD_REG 
// CHECK-NEXT: 2059 uext 75 1785 0 XOR_MX_in 
// CHECK-NEXT: 2060 uext 75 1792 0 XOR_MX_reg 
// CHECK-NEXT: 2061 sort bitvec 49
// CHECK-NEXT: 2062 concat 2061 1346 1467
// CHECK-NEXT: 2063 uext 2061 2062 0 a_int 
// CHECK-NEXT: 2064 uext 47 1144 0 a_mult_mux 
// CHECK-NEXT: 2065 not 25 1841
// CHECK-NEXT: 2066 or 25 2065 1919
// CHECK-NEXT: 2067 uext 25 2066 0 auto_reset_pri 
// CHECK-NEXT: 2068 uext 16 1182 0 b_mult_mux 
// CHECK-NEXT: 2069 uext 25 1403 0 c_mult 
// CHECK-NEXT: 2070 uext 25 1916 0 ce_m_g 
// CHECK-NEXT: 2071 uext 25 1467 0 cin 
// CHECK-NEXT: 2072 uext 25 1464 0 cin_b 
// CHECK-NEXT: 2073 uext 23 1308 0 co 
// CHECK-NEXT: 2074 uext 25 1368 0 co12_lsb 
// CHECK-NEXT: 2075 uext 25 1360 0 co24_lsb 
// CHECK-NEXT: 2076 uext 25 1348 0 co36_lsb 
// CHECK-NEXT: 2077 uext 23 1312 0 comux 
// CHECK-NEXT: 2078 slice 211 1312 10 0
// CHECK-NEXT: 2079 concat 213 1314 2078
// CHECK-NEXT: 2080 slice 211 1312 22 12
// CHECK-NEXT: 2081 concat 234 2080 2079
// CHECK-NEXT: 2082 concat 236 1316 2081
// CHECK-NEXT: 2083 slice 211 1312 34 24
// CHECK-NEXT: 2084 concat 491 2083 2082
// CHECK-NEXT: 2085 concat 494 1318 2084
// CHECK-NEXT: 2086 slice 213 1312 47 36
// CHECK-NEXT: 2087 concat 23 2086 2085
// CHECK-NEXT: 2088 uext 23 2087 0 comux4simd 
// CHECK-NEXT: 2089 uext 23 1346 0 comux_w 
// CHECK-NEXT: 2090 uext 25 1494 0 cout0 
// CHECK-NEXT: 2091 uext 25 1507 0 cout1 
// CHECK-NEXT: 2092 uext 25 1513 0 cout2 
// CHECK-NEXT: 2093 uext 25 1487 0 cout3 
// CHECK-NEXT: 2094 uext 25 1521 0 cout4 
// CHECK-NEXT: 2095 uext 25 1501 0 cout_0 
// CHECK-NEXT: 2096 uext 25 1508 0 cout_1 
// CHECK-NEXT: 2097 uext 25 1514 0 cout_2 
// CHECK-NEXT: 2098 uext 25 1487 0 cout_3 
// CHECK-NEXT: 2099 ite 25 1916 1403 1410
// CHECK-NEXT: 2100 uext 25 2099 0 d_carryin_int 
// CHECK-NEXT: 2101 ite 25 1979 248 2099
// CHECK-NEXT: 2102 uext 25 2101 0 dr_carryin_int 
// CHECK-NEXT: 2103 uext 25 248 0 glblGSR 
// CHECK-NEXT: 2104 uext 25 1475 0 intc1 
// CHECK-NEXT: 2105 uext 25 1479 0 intc2 
// CHECK-NEXT: 2106 uext 25 1483 0 intc3 
// CHECK-NEXT: 2107 uext 521 1239 0 mult 
// CHECK-NEXT: 2108 uext 25 1500 0 mult_or_logic 
// CHECK-NEXT: 2109 uext 25 1411 0 multcarryin_data 
// CHECK-NEXT: 2110 uext 25 98 0 opmode_valid_flag_dou 
// CHECK-NEXT: 2111 uext 25 1707 0 overflow_data 
// CHECK-NEXT: 2112 uext 25 1678 0 pdet_o 
// CHECK-NEXT: 2113 uext 25 1686 0 pdet_o_mux 
// CHECK-NEXT: 2114 uext 25 1685 0 pdet_o_reg1 
// CHECK-NEXT: 2115 uext 25 1706 0 pdet_o_reg2 
// CHECK-NEXT: 2116 uext 25 1689 0 pdetb_o 
// CHECK-NEXT: 2117 uext 25 1697 0 pdetb_o_mux 
// CHECK-NEXT: 2118 uext 25 1696 0 pdetb_o_reg1 
// CHECK-NEXT: 2119 uext 25 1722 0 pdetb_o_reg2 
// CHECK-NEXT: 2120 const 518 01010101010101010101010101010101010101010101
// CHECK-NEXT: 2121 uext 518 2120 0 ps_u_mask 
// CHECK-NEXT: 2122 uext 518 1281 0 ps_v_mask 
// CHECK-NEXT: 2123 uext 25 1410 0 qmultcarryin 
// CHECK-NEXT: 2124 uext 25 1979 0 rst_carryin_g 
// CHECK-NEXT: 2125 uext 23 1303 0 s 
// CHECK-NEXT: 2126 uext 215 1473 0 s0 
// CHECK-NEXT: 2127 uext 215 1477 0 s1 
// CHECK-NEXT: 2128 uext 215 1481 0 s2 
// CHECK-NEXT: 2129 uext 217 1485 0 s3 
// CHECK-NEXT: 2130 uext 23 1310 0 smux 
// CHECK-NEXT: 2131 uext 23 1353 0 smux_w 
// CHECK-NEXT: 2132 and 25 2066 1707
// CHECK-NEXT: 2133 and 25 2132 1687
// CHECK-NEXT: 2134 eq 25 1829 106
// CHECK-NEXT: 2135 ite 25 2134 2133 248
// CHECK-NEXT: 2136 and 25 2066 1686
// CHECK-NEXT: 2137 uext 104 98 1
// CHECK-NEXT: 2138 eq 25 1829 2137
// CHECK-NEXT: 2139 ite 25 2138 2136 2135
// CHECK-NEXT: 2140 uext 25 2139 0 the_auto_reset_patdet 
// CHECK-NEXT: 2141 uext 23 1676 0 the_mask 
// CHECK-NEXT: 2142 uext 23 1538 0 the_pattern 
// CHECK-NEXT: 2143 uext 25 1723 0 underflow_data 
// CHECK-NEXT: 2144 uext 23 1342 0 wmux 
// CHECK-NEXT: 2145 uext 104 1267 0 x_mac_cascd
// CHECK-NEXT: 2146 uext 23 1272 0 xmux 
// CHECK-NEXT: 2147 uext 25 1736 0 xor_12a 
// CHECK-NEXT: 2148 uext 25 1739 0 xor_12b 
// CHECK-NEXT: 2149 uext 25 1751 0 xor_12c 
// CHECK-NEXT: 2150 uext 25 1754 0 xor_12d 
// CHECK-NEXT: 2151 uext 25 1761 0 xor_12e 
// CHECK-NEXT: 2152 uext 25 1764 0 xor_12f 
// CHECK-NEXT: 2153 uext 25 1768 0 xor_12g 
// CHECK-NEXT: 2154 uext 25 1771 0 xor_12h 
// CHECK-NEXT: 2155 uext 25 1740 0 xor_24a 
// CHECK-NEXT: 2156 uext 25 1755 0 xor_24b 
// CHECK-NEXT: 2157 uext 25 1765 0 xor_24c 
// CHECK-NEXT: 2158 uext 25 1772 0 xor_24d 
// CHECK-NEXT: 2159 uext 25 1756 0 xor_48a 
// CHECK-NEXT: 2160 uext 25 1773 0 xor_48b 
// CHECK-NEXT: 2161 uext 25 1774 0 xor_96 
// CHECK-NEXT: 2162 uext 23 1302 0 ymux 
// CHECK-NEXT: 2163 uext 23 896 0 z_optinv 
// CHECK-NEXT: 2164 uext 23 895 0 zmux 
// CHECK-NEXT: 2165 next 1 96 108
// CHECK-NEXT: 2166 ite 1 1885 257 108
// CHECK-NEXT: 2167 const 1 000000000000000000000000000000
// CHECK-NEXT: 2168 redor 25 265
// CHECK-NEXT: 2169 not 25 2168
// CHECK-NEXT: 2170 or 25 1987 2169
// CHECK-NEXT: 2171 ite 1 2170 2167 2166
// CHECK-NEXT: 2172 next 1 97 2171
// CHECK-NEXT: 2173 next 25 99 103
// CHECK-NEXT: 2174 next 1 258 264
// CHECK-NEXT: 2175 eq 25 265 106
// CHECK-NEXT: 2176 ite 1 2175 108 257
// CHECK-NEXT: 2177 ite 1 1888 2176 264
// CHECK-NEXT: 2178 ite 1 2170 2167 2177
// CHECK-NEXT: 2179 next 1 259 2178
// CHECK-NEXT: 2180 next 25 260 103
// CHECK-NEXT: 2181 next 16 272 278
// CHECK-NEXT: 2182 ite 16 1897 356 278
// CHECK-NEXT: 2183 redor 25 364
// CHECK-NEXT: 2184 not 25 2183
// CHECK-NEXT: 2185 or 25 1991 2184
// CHECK-NEXT: 2186 ite 16 2185 1108 2182
// CHECK-NEXT: 2187 next 16 273 2186
// CHECK-NEXT: 2188 next 25 274 103
// CHECK-NEXT: 2189 next 16 357 363
// CHECK-NEXT: 2190 eq 25 364 106
// CHECK-NEXT: 2191 ite 16 2190 278 356
// CHECK-NEXT: 2192 ite 16 1900 2191 363
// CHECK-NEXT: 2193 ite 16 1991 1108 2192
// CHECK-NEXT: 2194 next 16 358 2193
// CHECK-NEXT: 2195 next 25 359 103
// CHECK-NEXT: 2196 next 7 394 400
// CHECK-NEXT: 2197 ite 7 1894 393 400
// CHECK-NEXT: 2198 const 7 0000
// CHECK-NEXT: 2199 ite 7 1983 2198 2197
// CHECK-NEXT: 2200 next 7 395 2199
// CHECK-NEXT: 2201 next 25 396 103
// CHECK-NEXT: 2202 next 23 532 538
// CHECK-NEXT: 2203 and 25 1919 1489
// CHECK-NEXT: 2204 ite 23 2203 1641 538
// CHECK-NEXT: 2205 or 25 2015 2139
// CHECK-NEXT: 2206 ite 23 2205 892 2204
// CHECK-NEXT: 2207 next 23 533 2206
// CHECK-NEXT: 2208 next 25 534 103
// CHECK-NEXT: 2209 next 56 627 633
// CHECK-NEXT: 2210 ite 56 1906 626 633
// CHECK-NEXT: 2211 const 56 000000000
// CHECK-NEXT: 2212 ite 56 1995 2211 2210
// CHECK-NEXT: 2213 next 56 628 2212
// CHECK-NEXT: 2214 next 25 629 103
// CHECK-NEXT: 2215 next 23 877 883
// CHECK-NEXT: 2216 ite 23 1909 876 883
// CHECK-NEXT: 2217 not 25 884
// CHECK-NEXT: 2218 or 25 1999 2217
// CHECK-NEXT: 2219 ite 23 2218 892 2216
// CHECK-NEXT: 2220 next 23 878 2219
// CHECK-NEXT: 2221 next 25 879 103
// CHECK-NEXT: 2222 next 10 936 942
// CHECK-NEXT: 2223 ite 10 42 935 942
// CHECK-NEXT: 2224 const 10 00000
// CHECK-NEXT: 2225 not 25 943
// CHECK-NEXT: 2226 or 25 2007 2225
// CHECK-NEXT: 2227 ite 10 2226 2224 2223
// CHECK-NEXT: 2228 next 10 937 2227
// CHECK-NEXT: 2229 next 25 938 103
// CHECK-NEXT: 2230 next 47 1065 1071
// CHECK-NEXT: 2231 ite 47 1912 1064 1071
// CHECK-NEXT: 2232 not 25 1102
// CHECK-NEXT: 2233 or 25 2003 2232
// CHECK-NEXT: 2234 ite 47 2233 947 2231
// CHECK-NEXT: 2235 next 47 1066 2234
// CHECK-NEXT: 2236 next 25 1067 103
// CHECK-NEXT: 2237 next 47 1134 1140
// CHECK-NEXT: 2238 ite 47 1891 1133 1140
// CHECK-NEXT: 2239 ite 47 2003 947 2238
// CHECK-NEXT: 2240 next 47 1135 2239
// CHECK-NEXT: 2241 next 25 1136 103
// CHECK-NEXT: 2242 next 521 1245 1251
// CHECK-NEXT: 2243 ite 521 1916 1244 1251
// CHECK-NEXT: 2244 not 25 1252
// CHECK-NEXT: 2245 or 25 2011 2244
// CHECK-NEXT: 2246 ite 521 2245 1238 2243
// CHECK-NEXT: 2247 next 521 1246 2246
// CHECK-NEXT: 2248 next 25 1247 103
// CHECK-NEXT: 2249 next 521 1286 1292
// CHECK-NEXT: 2250 ite 521 1916 1285 1292
// CHECK-NEXT: 2251 ite 521 2245 1238 2250
// CHECK-NEXT: 2252 next 521 1287 2251
// CHECK-NEXT: 2253 next 25 1288 103
// CHECK-NEXT: 2254 next 29 1389 1395
// CHECK-NEXT: 2255 ite 29 1906 1388 1395
// CHECK-NEXT: 2256 ite 29 1995 1295 2255
// CHECK-NEXT: 2257 next 29 1390 2256
// CHECK-NEXT: 2258 next 25 1391 103
// CHECK-NEXT: 2259 next 25 1404 1410
// CHECK-NEXT: 2260 next 25 1405 2101
// CHECK-NEXT: 2261 next 25 1406 103
// CHECK-NEXT: 2262 next 25 1418 1424
// CHECK-NEXT: 2263 ite 25 2203 405 1424
// CHECK-NEXT: 2264 ite 25 2205 248 2263
// CHECK-NEXT: 2265 next 25 1419 2264
// CHECK-NEXT: 2266 next 25 1420 103
// CHECK-NEXT: 2267 next 7 1425 1431
// CHECK-NEXT: 2268 ite 7 2203 1518 1431
// CHECK-NEXT: 2269 ite 7 2205 2198 2268
// CHECK-NEXT: 2270 next 7 1426 2269
// CHECK-NEXT: 2271 next 25 1427 103
// CHECK-NEXT: 2272 next 25 1452 1458
// CHECK-NEXT: 2273 ite 25 1903 1451 1458
// CHECK-NEXT: 2274 ite 25 1979 248 2273
// CHECK-NEXT: 2275 next 25 1453 2274
// CHECK-NEXT: 2276 next 25 1454 103
// CHECK-NEXT: 2277 next 25 1522 1528
// CHECK-NEXT: 2278 ite 25 2203 1521 1528
// CHECK-NEXT: 2279 ite 25 2205 248 2278
// CHECK-NEXT: 2280 next 25 1523 2279
// CHECK-NEXT: 2281 next 25 1524 103
// CHECK-NEXT: 2282 next 25 1679 1685
// CHECK-NEXT: 2283 ite 25 2203 1678 1685
// CHECK-NEXT: 2284 ite 25 2205 248 2283
// CHECK-NEXT: 2285 next 25 1680 2284
// CHECK-NEXT: 2286 next 25 1681 103
// CHECK-NEXT: 2287 next 25 1690 1696
// CHECK-NEXT: 2288 ite 25 2203 1689 1696
// CHECK-NEXT: 2289 ite 25 2205 248 2288
// CHECK-NEXT: 2290 next 25 1691 2289
// CHECK-NEXT: 2291 next 25 1692 103
// CHECK-NEXT: 2292 next 25 1700 1706
// CHECK-NEXT: 2293 ite 25 2203 1685 1706
// CHECK-NEXT: 2294 ite 25 2205 248 2293
// CHECK-NEXT: 2295 next 25 1701 2294
// CHECK-NEXT: 2296 next 25 1702 103
// CHECK-NEXT: 2297 next 25 1716 1722
// CHECK-NEXT: 2298 ite 25 2203 1696 1722
// CHECK-NEXT: 2299 ite 25 2205 248 2298
// CHECK-NEXT: 2300 next 25 1717 2299
// CHECK-NEXT: 2301 next 25 1718 103
// CHECK-NEXT: 2302 next 75 1786 1792
// CHECK-NEXT: 2303 ite 75 2203 1785 1792
// CHECK-NEXT: 2304 const 75 00000000
// CHECK-NEXT: 2305 ite 75 2205 2304 2303
// CHECK-NEXT: 2306 next 75 1787 2305
// CHECK-NEXT: 2307 next 25 1788 103
// CHECK-NEXT: ; end of yosys output