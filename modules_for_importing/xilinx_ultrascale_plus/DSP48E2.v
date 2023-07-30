// We made a number of changes to make this file importable with our tools.
// - We manually removed usages of X and Z values.
// - We converted string values to an enum at the top of the file.
// - Commented out line with $finish.
//
// We have also manually edited the Verilog to convert strings into logic
// arrays. Please see the edit history of this file for details.
//
// RUN: tmpfile=$(mktemp) 
// RUN: sed -E "s/b0/b0/" %s > $tmpfile 
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

module DSP48E2 (
    input integer ACASCREG = 1,
    input integer ADREG = 1,
    input integer ALUMODEREG = 1,
    input CONSTANT_ENUM AMULTSEL = A_ENUM_VAL,
    input integer AREG = 1,
    input CONSTANT_ENUM AUTORESET_PATDET = NO_RESET_ENUM_VAL,
    input CONSTANT_ENUM AUTORESET_PRIORITY = RESET_ENUM_VAL,
    input CONSTANT_ENUM A_INPUT = DIRECT_ENUM_VAL,
    input integer BCASCREG = 1,
    input CONSTANT_ENUM BMULTSEL = B_ENUM_VAL,
    input integer BREG = 1,
    input CONSTANT_ENUM B_INPUT = DIRECT_ENUM_VAL,
    input integer CARRYINREG = 1,
    input integer CARRYINSELREG = 1,
    input integer CREG = 1,
    input integer DREG = 1,
    input integer INMODEREG = 1,
    input [3:0] IS_ALUMODE_INVERTED = 4'b0000,
    input [0:0] IS_CARRYIN_INVERTED = 1'b0,
    input [0:0] IS_CLK_INVERTED = 1'b0,
    input [4:0] IS_INMODE_INVERTED = 5'b00000,
    input [8:0] IS_OPMODE_INVERTED = 9'b000000000,
    input [0:0] IS_RSTALLCARRYIN_INVERTED = 1'b0,
    input [0:0] IS_RSTALUMODE_INVERTED = 1'b0,
    input [0:0] IS_RSTA_INVERTED = 1'b0,
    input [0:0] IS_RSTB_INVERTED = 1'b0,
    input [0:0] IS_RSTCTRL_INVERTED = 1'b0,
    input [0:0] IS_RSTC_INVERTED = 1'b0,
    input [0:0] IS_RSTD_INVERTED = 1'b0,
    input [0:0] IS_RSTINMODE_INVERTED = 1'b0,
    input [0:0] IS_RSTM_INVERTED = 1'b0,
    input [0:0] IS_RSTP_INVERTED = 1'b0,
    input [47:0] MASK = 48'h3FFFFFFFFFFF,
    input integer MREG = 1,
    input integer OPMODEREG = 1,
    input [47:0] PATTERN = 48'h000000000000,
    input CONSTANT_ENUM PREADDINSEL = A_ENUM_VAL,
    input integer PREG = 1,
    input [47:0] RND = 48'h000000000000,
    input CONSTANT_ENUM SEL_MASK = MASK_ENUM_VAL,
    input CONSTANT_ENUM SEL_PATTERN = PATTERN_ENUM_VAL,
    input CONSTANT_ENUM USE_MULT = MULTIPLY_ENUM_VAL,
    input CONSTANT_ENUM USE_PATTERN_DETECT = NO_PATDET_ENUM_VAL,
    input CONSTANT_ENUM USE_SIMD = ONE48_ENUM_VAL,
    input CONSTANT_ENUM USE_WIDEXOR = FALSE_ENUM_VAL,
    input CONSTANT_ENUM XORSIMD = XOR24_48_96_ENUM_VAL,
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
  reg [ 31:0] ACASCREG_REG = ACASCREG;
  reg [ 31:0] ADREG_REG = ADREG;
  reg [ 31:0] ALUMODEREG_REG = ALUMODEREG;
  reg [ 15:0] AMULTSEL_REG = AMULTSEL;
  reg [ 31:0] AREG_REG = AREG;
  reg [119:0] AUTORESET_PATDET_REG = AUTORESET_PATDET;
  reg [ 39:0] AUTORESET_PRIORITY_REG = AUTORESET_PRIORITY;
  reg [ 55:0] A_INPUT_REG = A_INPUT;
  reg [ 31:0] BCASCREG_REG = BCASCREG;
  reg [ 15:0] BMULTSEL_REG = BMULTSEL;
  reg [ 31:0] BREG_REG = BREG;
  reg [ 55:0] B_INPUT_REG = B_INPUT;
  reg [ 31:0] CARRYINREG_REG = CARRYINREG;
  reg [ 31:0] CARRYINSELREG_REG = CARRYINSELREG;
  reg [ 31:0] CREG_REG = CREG;
  reg [ 31:0] DREG_REG = DREG;
  reg [ 31:0] INMODEREG_REG = INMODEREG;
  reg [  3:0] IS_ALUMODE_INVERTED_REG = IS_ALUMODE_INVERTED;
  reg [  0:0] IS_CARRYIN_INVERTED_REG = IS_CARRYIN_INVERTED;
  reg [  0:0] IS_CLK_INVERTED_REG = IS_CLK_INVERTED;
  reg [  4:0] IS_INMODE_INVERTED_REG = IS_INMODE_INVERTED;
  reg [  8:0] IS_OPMODE_INVERTED_REG = IS_OPMODE_INVERTED;
  reg [  0:0] IS_RSTALLCARRYIN_INVERTED_REG = IS_RSTALLCARRYIN_INVERTED;
  reg [  0:0] IS_RSTALUMODE_INVERTED_REG = IS_RSTALUMODE_INVERTED;
  reg [  0:0] IS_RSTA_INVERTED_REG = IS_RSTA_INVERTED;
  reg [  0:0] IS_RSTB_INVERTED_REG = IS_RSTB_INVERTED;
  reg [  0:0] IS_RSTCTRL_INVERTED_REG = IS_RSTCTRL_INVERTED;
  reg [  0:0] IS_RSTC_INVERTED_REG = IS_RSTC_INVERTED;
  reg [  0:0] IS_RSTD_INVERTED_REG = IS_RSTD_INVERTED;
  reg [  0:0] IS_RSTINMODE_INVERTED_REG = IS_RSTINMODE_INVERTED;
  reg [  0:0] IS_RSTM_INVERTED_REG = IS_RSTM_INVERTED;
  reg [  0:0] IS_RSTP_INVERTED_REG = IS_RSTP_INVERTED;
  reg [ 47:0] MASK_REG = MASK;
  reg [ 31:0] MREG_REG = MREG;
  reg [ 31:0] OPMODEREG_REG = OPMODEREG;
  reg [ 47:0] PATTERN_REG = PATTERN;
  reg [  7:0] PREADDINSEL_REG = PREADDINSEL;
  reg [ 31:0] PREG_REG = PREG;
  reg [ 47:0] RND_REG = RND;
  reg [111:0] SEL_MASK_REG = SEL_MASK;
  reg [ 55:0] SEL_PATTERN_REG = SEL_PATTERN;
  reg [ 63:0] USE_MULT_REG = USE_MULT;
  reg [ 71:0] USE_PATTERN_DETECT_REG = USE_PATTERN_DETECT;
  reg [ 47:0] USE_SIMD_REG = USE_SIMD;
  reg [ 39:0] USE_WIDEXOR_REG = USE_WIDEXOR;
  reg [ 87:0] XORSIMD_REG = XORSIMD;

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

  // reg glblGSR = 1'b0;

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
  assign ALUMODE_in = ALUMODE ^ IS_ALUMODE_INVERTED_REG;
  assign A_in = A;
  assign BCIN_in = BCIN;
  assign B_in = B;
  assign CARRYCASCIN_in = CARRYCASCIN;
  assign CARRYINSEL_in = CARRYINSEL;
  assign CARRYIN_in = (CARRYIN ^ IS_CARRYIN_INVERTED_REG);  // rv 0
  assign CEA1_in = CEA1;  // rv 0
  assign CEA2_in = CEA2;  // rv 0
  assign CEAD_in = CEAD;  // rv 0
  assign CEALUMODE_in = CEALUMODE;  // rv 0
  assign CEB1_in = CEB1;  // rv 0
  assign CEB2_in = CEB2;  // rv 0
  assign CECARRYIN_in = CECARRYIN;  // rv 0
  assign CECTRL_in = CECTRL;  // rv 0
  assign CEC_in = CEC;  // rv 0
  assign CED_in = CED;  // rv 0
  assign CEINMODE_in = CEINMODE;
  assign CEM_in = CEM;  // rv 0
  assign CEP_in = CEP;  // rv 0
  assign CLK_in = (CLK ^ IS_CLK_INVERTED_REG);  // rv 0
  assign C_in = C;
  assign D_in = D;  // rv 0
  assign INMODE_in = (INMODE ^ IS_INMODE_INVERTED_REG);
  assign MULTSIGNIN_in = MULTSIGNIN;
  assign OPMODE_in = (OPMODE ^ IS_OPMODE_INVERTED_REG);
  assign PCIN_in = PCIN;
  assign RSTALLCARRYIN_in = (RSTALLCARRYIN ^ IS_RSTALLCARRYIN_INVERTED_REG);  // rv 0
  assign RSTALUMODE_in = (RSTALUMODE ^ IS_RSTALUMODE_INVERTED_REG);  // rv 0
  assign RSTA_in = (RSTA ^ IS_RSTA_INVERTED_REG);  // rv 0
  assign RSTB_in = (RSTB ^ IS_RSTB_INVERTED_REG);  // rv 0
  assign RSTCTRL_in = (RSTCTRL ^ IS_RSTCTRL_INVERTED_REG);  // rv 0
  assign RSTC_in = (RSTC ^ IS_RSTC_INVERTED_REG);  // rv 0
  assign RSTD_in = (RSTD ^ IS_RSTD_INVERTED_REG);  // rv 0
  assign RSTINMODE_in = (RSTINMODE ^ IS_RSTINMODE_INVERTED_REG);  // rv 0
  assign RSTM_in = (RSTM ^ IS_RSTM_INVERTED_REG);  // rv 0
  assign RSTP_in = (RSTP ^ IS_RSTP_INVERTED_REG);  // rv 0

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
  localparam MAX_ALU_FULL = 48;
  localparam MAX_CARRYOUT = 4;
  localparam A_WIDTH = 30;
  localparam B_WIDTH = 18;
  localparam C_WIDTH = 48;
  localparam D_WIDTH = 27;
  localparam M_WIDTH = 45;
  localparam P_WIDTH = 48;
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
  reg opmode_valid_flag_dal;  // used in OPMODE DRC
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
  reg opmode_valid_flag_dou = 1'b1;  // TODO

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
  reg pdet_o_reg1;
  reg pdet_o_reg2;
  reg pdetb_o_reg1;
  reg pdetb_o_reg2;

  // DSP_PREADD wires
  wire [26:0] D_DATA_mux;

  // DSP_PREADD_DATA wires
  wire [4:0] INMODE_mux;
  reg [4:0] INMODE_reg;
  reg [D_WIDTH-1:0] AD_DATA_reg;
  reg [D_WIDTH-1:0] D_DATA_reg;

  // atom interconnect
  assign U_DATA_in = (USE_SIMD_BIN == USE_SIMD_ONE48) ? U_DATA : 45'h100000000000;
  assign V_DATA_in = (USE_SIMD_BIN == USE_SIMD_ONE48) ? V_DATA : 45'h100000000000;
  reg [3:0] ALUMODE_DATA;
  reg DREG_INT;
  reg ADREG_INT;

  // DSP_ALU
  //*** W mux NB
  always_comb
    case (OPMODE_mux[8:7])
      2'b00:   wmux = 48'b0;
      2'b01:   wmux = P_FDBK_in;
      2'b10:   wmux = RND_REG;
      2'b11:   wmux = C_DATA_in;
      default: wmux = {48{1'b0}};
    endcase

  // To support MAC-cascade add multsignin to bit 1 of X
  assign x_mac_cascd = (OPMODE_mux[6:4] == 3'b100) ? {{46{1'b0}}, MULTSIGNIN_in, 1'b0} : {48{1'b0}};

  //*** X mux NB
  always_comb
    case (OPMODE_mux[1:0])
      2'b00:   xmux = x_mac_cascd;
      2'b01:   xmux = {{3{U_DATA_in[44]}}, U_DATA_in};
      2'b10:   xmux = P_FDBK_in;
      2'b11:   xmux = {A_ALU, B_ALU};
      default: xmux = {48{1'b0}};
    endcase

  //*** Y mux NB
  always_comb
    case (OPMODE_mux[3:2])
      2'b00:   ymux = 48'b0;
      2'b01:   ymux = {{3{1'b0}}, V_DATA_in};
      2'b10:   ymux = {48{1'b1}};
      2'b11:   ymux = C_DATA_in;
      default: ymux = {48{1'b0}};
    endcase

  //*** Z mux NB
  always_comb
    casex (OPMODE_mux[6:4])
      3'b000:  zmux = 48'b0;
      3'b001:  zmux = PCIN_in;
      3'b010:  zmux = P_FDBK_in;
      3'b011:  zmux = C_DATA_in;
      3'b100:  zmux = P_FDBK_in;
      3'b101:  zmux = {{9{PCIN_in[47]}}, {8{PCIN_in[47]}}, PCIN_in[47:17]};
      3'b11x:  zmux = {{9{P_FDBK_47_in}}, {8{P_FDBK_in[47]}}, P_FDBK_in[47:17]};
      default: zmux = {48{1'b0}};
    endcase

  //*********************************************************
  //*** CARRYINSEL and OPMODE with 1 level of register
  //*********************************************************
  always @(posedge CLK_in) begin
    if (RSTCTRL_in) begin
      OPMODE_reg <= 9'b0;
    end else if (CECTRL_in) begin
      OPMODE_reg <= OPMODE_in;
    end
  end

  always @(posedge CLK_in) begin
    if (RSTCTRL_in) begin
      CARRYINSEL_reg <= 3'b0;
    end else if (CECTRL_in) begin
      CARRYINSEL_reg <= CARRYINSEL_in;
    end
  end

  always @(*) CARRYINSEL_mux = (CARRYINSELREG_BIN == 1'b1) ? CARRYINSEL_reg : CARRYINSEL_in;

  always @(*) begin
    if (OPMODEREG_BIN == 1'b1) OPMODE_mux = OPMODE_reg;
    else OPMODE_mux = OPMODE_in;
  end

  //*********************************************************
  //*** ALUMODE with 1 level of register
  //*********************************************************
  always @(posedge CLK_in) begin
    if (RSTALUMODE_in) ALUMODE_reg <= 4'b0;
    else if (CEALUMODE_in) ALUMODE_reg <= ALUMODE_in;
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
  assign co = ((xmux & ymux) | (z_optinv & ymux) | (xmux & z_optinv));
  // s has a fan-out of 2 (1) FA with W (2) second leg of XOR tree
  assign s = (z_optinv ^ xmux ^ ymux);

  // Mux S and CO to do 2 operands logic operations
  // S = produce XOR/XNOR, NOT functions
  // CO = produce AND/NAND, OR/NOR functions
  assign comux = ALUMODE_DATA[2] ? 0 : co;
  assign smux = ALUMODE_DATA[3] ? co : s;

  // Carry mux to handle SIMD mode 
  // SIMD must be used here since addition of W requires carry propogation
  assign comux4simd = {
    comux[47:36],
    comux[35] && (USE_SIMD_BIN != USE_SIMD_FOUR12),
    comux[34:24],
    comux[23] && (USE_SIMD_BIN == USE_SIMD_ONE48),
    comux[22:12],
    comux[11] && (USE_SIMD_BIN != USE_SIMD_FOUR12),
    comux[10:0]
  };

  // FA to combine W-mux with s and co
  // comux must be shifted to properly reflect carry operation
  assign smux_w = smux ^ {comux4simd[46:0], 1'b0} ^ wmux;
  assign comux_w = ((smux & {comux4simd[46:0],1'b0}) |
                                                                                (wmux & {comux4simd[46:0],1'b0}) |
                                                                                (smux & wmux));

  // alumode10 indicates a subtraction, used to correct carryout polarity
  assign ALUMODE10_in = (ALUMODE_DATA[0] & ALUMODE_DATA[1]);

  // prepare data for Final Adder
  // a[0] is in fact the cin bit, adder inputs: a[48:1], b[47:0], cin= a[0]
  assign a_int = {comux_w, cin};
  //  assign b_int = smux_w;

  // FINAL ADDER - second stage develops final sums and carries 
  assign s0 = a_int[11:0] + smux_w[11:0];
  // invert if alumode10
  assign cout0 = ALUMODE10_in ^ (a_int[12] ^ s0[12] ^ comux[11]);

  // internal carry is zero'd out on mc_simd == 1
  assign intc1 = (USE_SIMD_BIN != USE_SIMD_FOUR12) && s0[12];
  // next lsb is zero'd out on mc_simd == 1
  assign co12_lsb = (USE_SIMD_BIN != USE_SIMD_FOUR12) && a_int[12];
  //
  assign s1 = {a_int[23:13], co12_lsb} + smux_w[23:12] + intc1;
  assign cout1 = ALUMODE10_in ^ (a_int[24] ^ s1[12] ^ comux[23]);
  assign intc2 = (USE_SIMD_BIN == USE_SIMD_ONE48) && s1[12];
  assign co24_lsb = (USE_SIMD_BIN == USE_SIMD_ONE48) && a_int[24];
  //
  assign s2 = {a_int[35:25], co24_lsb} + smux_w[35:24] + intc2;
  assign cout2 = ALUMODE10_in ^ (a_int[36] ^ s2[12] ^ comux[35]);
  assign intc3 = (USE_SIMD_BIN != USE_SIMD_FOUR12) && s2[12];
  assign co36_lsb = (USE_SIMD_BIN != USE_SIMD_FOUR12) && a_int[36];
  //
  assign s3 = {a_int[48:37], co36_lsb} + {comux4simd[47], smux_w[47:36]} + intc3;
  assign cout3 = ALUMODE10_in ^ s3[12];

  // Not gated with alumode10 since used to propogate carry in wide multiply
  assign cout4 = s3[13];

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
  assign mult_or_logic = ((OPMODE_mux[3:0] == 4'b0101) || (ALUMODE_DATA[3:2] != 2'b00));
  // allow carrycascout to not X in output atom
  //  assign cout_3 = mult_or_logic ? 1'b0 : cout3;
  assign cout_3 = cout3;
  assign cout_2 = mult_or_logic ? 1'b0 : cout2;
  assign cout_1 = mult_or_logic ? 1'b0 : cout1;
  assign cout_0 = mult_or_logic ? 1'b0 : cout0;
  // drive signals to Output Atom
  assign COUT_in[3] = cout_3;
  assign COUT_in[2] = (USE_SIMD_BIN == USE_SIMD_FOUR12) ? cout_2 : 1'b0;
  assign COUT_in[1] = (USE_SIMD_BIN != USE_SIMD_ONE48) ? cout_1 : 1'b0;
  assign COUT_in[0] = (USE_SIMD_BIN == USE_SIMD_FOUR12) ? cout_0 : 1'b0;
  assign MULTSIGN_ALU_in = s3[13];  // from alu rtl but doesn't seem right
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
    if (RSTALLCARRYIN_in) CARRYIN_reg <= 1'b0;
    else if (CECARRYIN_in) CARRYIN_reg <= CARRYIN_in;
  end

  assign CARRYIN_mux = (CARRYINREG_BIN == 1'b1) ? CARRYIN_reg : CARRYIN_in;

  // INTERNAL CARRYIN REGISTER
  assign c_mult = !(AMULT26_in ^ BMULT17_in);
  assign ce_m_g = CEM_in; // & ~glblGSR;  // & gwe
  assign rst_carryin_g = RSTALLCARRYIN_in; // & ~glblGSR;  // & gwe
  assign d_carryin_int = ce_m_g ? c_mult : qmultcarryin;

  // rstallcarryin is injected through data path
  assign dr_carryin_int = rst_carryin_g ? 0 : d_carryin_int;

  always @(posedge CLK_in) begin
    // if (glblGSR) qmultcarryin <= 1'b0;
    // else qmultcarryin <= dr_carryin_int;
    qmultcarryin <= dr_carryin_int;
  end

  // bypass register mux
  assign multcarryin_data = (MREG_BIN == 1'b1) ? qmultcarryin : c_mult;

  //NB
  always @(CARRYINSEL_mux or CARRYIN_mux or PCIN_in[47] or CARRYCASCIN_in or CCOUT_in or P_FDBK_in[47] or multcarryin_data) begin
    case (CARRYINSEL_mux)
      3'b000:  cin_b = ~CARRYIN_mux;
      3'b001:  cin_b = PCIN_in[47];
      3'b010:  cin_b = ~CARRYCASCIN_in;
      3'b011:  cin_b = ~PCIN_in[47];
      3'b100:  cin_b = ~CCOUT_in;
      3'b101:  cin_b = P_FDBK_in[47];
      3'b110:  cin_b = ~multcarryin_data;
      3'b111:  cin_b = ~P_FDBK_in[47];
      default: cin_b = 1'b0;
    endcase
  end
  // disable carryin when performing logic operation
  assign cin = (ALUMODE_DATA[3] || ALUMODE_DATA[2]) ? 1'b0 : ~cin_b;

  // DSP_A_B_DATA
  //*********************************************************
  //*** Input register A with 2 level deep of registers
  //*********************************************************

  always @(posedge CLK_in) begin
    if (RSTA_in || (AREG_BIN == 2'b00)) begin
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
    if (RSTA_in || (AREG_BIN == 2'b00)) begin
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

  assign A_ALU = (AREG_BIN != 2'b00) ? A2_reg : (A_INPUT_BIN == A_INPUT_CASCADE) ? ACIN_in : A_in;

  // assumes encoding the same for ACASCREG and AREG
  assign ACOUT = (ACASCREG_BIN == AREG_BIN) ? A_ALU : A1_reg;

  //*********************************************************
  //*** Input register B with 2 level deep of registers
  //*********************************************************

  always @(posedge CLK_in) begin
    if (RSTB_in || (BREG_BIN == 2'b00)) begin
      B1_DATA_out <= 18'b0;
    end else if (CEB1_in) begin
      if (B_INPUT_BIN == B_INPUT_CASCADE) B1_DATA_out <= BCIN_in;
      else B1_DATA_out <= B_in;
    end
  end

  always @(posedge CLK_in) begin
    if (RSTB_in) B2_reg <= 18'b0;
    else if (CEB2_in) begin
      if (BREG_BIN == 2'b10) B2_reg <= B1_DATA_out;
      else if (B_INPUT_BIN == B_INPUT_CASCADE) B2_reg <= BCIN_in;
      else B2_reg <= B_in;
    end
  end

  assign B_ALU = (BREG_BIN != 2'b00) ? B2_reg : (B_INPUT_BIN == B_INPUT_CASCADE) ? BCIN_in : B_in;

  assign B2_DATA = (BREG_BIN != 2'b00) ? B2_reg : (B_INPUT_BIN == B_INPUT_CASCADE) ? BCIN_in : B_in;

  // assumes encoding the same for BCASCREG and BREG
  assign BCOUT = (BCASCREG_BIN == BREG_BIN) ? B2_DATA : B1_DATA_out;

  // DSP_C_DATA
  //*********************************************************
  //*** Input register C with 1 level deep of register
  //*********************************************************

  always @(posedge CLK_in) begin
    if (RSTC_in || (CREG_BIN == 1'b0)) begin
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
  assign U_in       = {1'b1, mult[43:0] & ps_u_mask};
  assign V_in       = {~mult[44], mult[43:0] & ps_v_mask};

  always @(*) begin
    if (USE_MULT_BIN == USE_MULT_NONE) mult = 45'b0;
    else mult = ({{18{a_mult_mux[26]}}, a_mult_mux} * {{27{b_mult_mux[17]}}, b_mult_mux});
  end

  // DSP_M_DATA
  //*********************************************************
  //*** Multiplier outputs U, V  with 1 level deep of register
  //*********************************************************

  always @(posedge CLK_in) begin
    if (RSTM_in || (MREG_BIN == 1'b0)) begin
      U_DATA_reg <= {1'b0, {M_WIDTH - 1{1'b0}}};
      V_DATA_reg <= {1'b0, {M_WIDTH - 1{1'b0}}};
    end else if (CEM_in) begin
      U_DATA_reg <= U_in;
      V_DATA_reg <= V_in;
    end
  end

  assign U_DATA = (MREG_BIN == 1'b1) ? U_DATA_reg : U_in;
  assign V_DATA = (MREG_BIN == 1'b1) ? V_DATA_reg : V_in;

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

  assign pdet_o = &(~(the_pattern ^ ALU_OUT_in) | the_mask);
  assign pdetb_o = &((the_pattern ^ ALU_OUT_in) | the_mask);

  assign PATTERNDETECT = opmode_valid_flag_dou ? pdet_o_mux : 1'b0;
  assign PATTERNBDETECT = opmode_valid_flag_dou ? pdetb_o_mux : 1'b0;

  //*** Output register PATTERN DETECT and UNDERFLOW / OVERFLOW 

  always @(posedge CLK_in) begin
    if (RSTP_in || the_auto_reset_patdet) begin
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

  assign pdet_o_mux = (PREG_BIN == 1'b1) ? pdet_o_reg1 : pdet_o;
  assign pdetb_o_mux = (PREG_BIN == 1'b1) ? pdetb_o_reg1 : pdetb_o;
  assign overflow_data = (PREG_BIN == 1'b1) ? pdet_o_reg2 : pdet_o;
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
    if (RSTP_in || the_auto_reset_patdet) begin
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

  assign ALUMODE10_mux = (PREG_BIN == 1'b1) ? ALUMODE10_reg : ALUMODE10_in;
  assign CARRYOUT = (PREG_BIN == 1'b1) ? COUT_reg : COUT_in;
  assign MULTSIGNOUT = (PREG_BIN == 1'b1) ? MULTSIGN_ALU_reg : MULTSIGN_ALU_in;
  assign P = (PREG_BIN == 1'b1) ? ALU_OUT_reg : ALU_OUT_in;
  assign XOROUT = (PREG_BIN == 1'b1) ? XOR_MX_reg : XOR_MX_in;
  assign CCOUT_in = ALUMODE10_reg ^ COUT_reg[3];
  assign CARRYCASCOUT  = (PREG_BIN == 1'b1) ? ALUMODE10_reg ^ COUT_reg[3]:
                                                ALUMODE10_in  ^ COUT_in[3];
  assign P_FDBK_in = ALU_OUT_reg;
  assign P_FDBK_47_in = ALU_OUT_reg[47];
  assign PCOUT = (PREG_BIN == 1'b1) ? ALU_OUT_reg : ALU_OUT_in;

  //--####################################################################
  //--#####                    Underflow / Overflow                  #####
  //--####################################################################
  assign OVERFLOW  = (USE_PATTERN_DETECT_BIN == USE_PATTERN_DETECT_PATDET) ?
                            ~pdet_o_mux && ~pdetb_o_mux && overflow_data : 1'b0;
  assign UNDERFLOW = (USE_PATTERN_DETECT_BIN == USE_PATTERN_DETECT_PATDET) ?
                            ~pdet_o_mux && ~pdetb_o_mux && underflow_data : 1'b0;
  // DSP_PREADD
  //*********************************************************
  //*** Preaddsub AD
  //*********************************************************
  assign D_DATA_mux = INMODE_mux[2] ? D_DATA : 27'b0;
  assign AD_in = INMODE_mux[3] ? (D_DATA_mux - PREADD_AB) : (D_DATA_mux + PREADD_AB);

  // DSP_PREADD_DATA
  always @(*) begin
    if (((AMULTSEL_BIN == AMULTSEL_A) &&
         (BMULTSEL_BIN == BMULTSEL_B)) ||
        (USE_MULT_BIN == USE_MULT_NONE)) begin
      DREG_INT = 1'b0;
    end else begin
      DREG_INT = DREG_BIN;
    end
  end

  always @(*) begin
    if (((AMULTSEL_BIN == AMULTSEL_A) && (BMULTSEL_BIN == BMULTSEL_B)) ||
        (USE_MULT_BIN == USE_MULT_NONE)) begin
      ADREG_INT = 1'b0;
    end else begin
      ADREG_INT = ADREG_BIN;
    end
  end

  always @(*) begin
    if ((PREADDINSEL_BIN == PREADDINSEL_A) && INMODE_mux[1]) A2A1 = 27'b0;
    else if (INMODE_mux[0] == 1'b1) A2A1 = A1_reg[26:0];
    else A2A1 = A_ALU[26:0];
  end
  always @(*) begin
    if ((PREADDINSEL_BIN == PREADDINSEL_B) && INMODE_mux[1]) B2B1 = 18'b0;
    else if (INMODE_mux[4] == 1'b1) B2B1 = B1_DATA_out;
    else B2B1 = B2_DATA;
  end
  assign PREADD_AB = (PREADDINSEL_BIN == PREADDINSEL_B) ? {{9{B2B1[17]}}, B2B1} : A2A1;

  //*********************************************************
  //**********  INMODE signal registering        ************
  //*********************************************************
  // new 

  always @(posedge CLK_in) begin
    if (RSTINMODE_in || (INMODEREG_BIN == 1'b0)) begin
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
    if (RSTD_in || (DREG_INT == 1'b0)) begin
      D_DATA_reg <= {D_WIDTH{1'b0}};
    end else if (CED_in) begin
      D_DATA_reg <= D_in;
    end
  end

  assign D_DATA = (DREG_INT == 1'b1) ? D_DATA_reg : D_in;

  //*********************************************************
  //*** Input register AD with 1 level deep of register
  //*********************************************************

  always @(posedge CLK_in) begin
    if (RSTD_in) begin
      AD_DATA_reg <= 27'b0;
    end else if (CEAD_in) AD_DATA_reg <= AD_in;
  end

  assign AD_DATA = (ADREG_INT == 1'b1) ? AD_DATA_reg : AD_in;

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
// CHECK-NEXT: 100 xor 25 45 54
// CHECK-NEXT: 101 sort bitvec 2
// CHECK-NEXT: 102 concat 101 100 98
// CHECK-NEXT: 103 const 101 10
// CHECK-NEXT: 104 eq 25 102 103
// CHECK-NEXT: 105 ite 1 104 96 95
// CHECK-NEXT: 106 const 25 0
// CHECK-NEXT: 107 const 7 1111
// CHECK-NEXT: 108 uext 10 107 1
// CHECK-NEXT: 109 eq 25 15 108
// CHECK-NEXT: 110 ite 25 109 97 106
// CHECK-NEXT: 111 const 29 111
// CHECK-NEXT: 112 uext 10 111 2
// CHECK-NEXT: 113 eq 25 15 112
// CHECK-NEXT: 114 ite 25 113 106 110
// CHECK-NEXT: 115 ite 1 114 5 2
// CHECK-NEXT: 116 state 1
// CHECK-NEXT: 117 state 1
// CHECK-NEXT: 118 state 25
// CHECK-NEXT: 119 init 25 118 97
// CHECK-NEXT: 120 concat 101 100 118
// CHECK-NEXT: 121 eq 25 120 103
// CHECK-NEXT: 122 ite 1 121 117 116
// CHECK-NEXT: 123 slice 101 12 1 0
// CHECK-NEXT: 124 redor 25 123
// CHECK-NEXT: 125 ite 1 124 122 115
// CHECK-NEXT: 126 slice 101 4 1 0
// CHECK-NEXT: 127 eq 25 126 123
// CHECK-NEXT: 128 ite 1 127 125 105
// CHECK-NEXT: 129 output 128 ACOUT 
// CHECK-NEXT: 130 state 16
// CHECK-NEXT: 131 state 16
// CHECK-NEXT: 132 state 25
// CHECK-NEXT: 133 init 25 132 97
// CHECK-NEXT: 134 concat 101 100 132
// CHECK-NEXT: 135 eq 25 134 103
// CHECK-NEXT: 136 ite 16 135 131 130
// CHECK-NEXT: 137 uext 10 107 1
// CHECK-NEXT: 138 eq 25 22 137
// CHECK-NEXT: 139 ite 25 138 97 106
// CHECK-NEXT: 140 uext 10 111 2
// CHECK-NEXT: 141 eq 25 22 140
// CHECK-NEXT: 142 ite 25 141 106 139
// CHECK-NEXT: 143 ite 16 142 19 17
// CHECK-NEXT: 144 state 16
// CHECK-NEXT: 145 state 16
// CHECK-NEXT: 146 state 25
// CHECK-NEXT: 147 init 25 146 97
// CHECK-NEXT: 148 concat 101 100 146
// CHECK-NEXT: 149 eq 25 148 103
// CHECK-NEXT: 150 ite 16 149 145 144
// CHECK-NEXT: 151 slice 101 21 1 0
// CHECK-NEXT: 152 redor 25 151
// CHECK-NEXT: 153 ite 16 152 150 143
// CHECK-NEXT: 154 slice 101 18 1 0
// CHECK-NEXT: 155 eq 25 154 151
// CHECK-NEXT: 156 ite 16 155 153 136
// CHECK-NEXT: 157 output 156 BCOUT 
// CHECK-NEXT: 158 slice 25 8 0 0
// CHECK-NEXT: 159 slice 25 52 0 0
// CHECK-NEXT: 160 xor 25 158 159
// CHECK-NEXT: 161 slice 25 8 1 1
// CHECK-NEXT: 162 slice 25 52 1 1
// CHECK-NEXT: 163 xor 25 161 162
// CHECK-NEXT: 164 slice 25 8 2 2
// CHECK-NEXT: 165 slice 25 52 2 2
// CHECK-NEXT: 166 xor 25 164 165
// CHECK-NEXT: 167 slice 25 8 3 3
// CHECK-NEXT: 168 slice 25 52 3 3
// CHECK-NEXT: 169 xor 25 167 168
// CHECK-NEXT: 170 concat 101 163 160
// CHECK-NEXT: 171 concat 29 166 170
// CHECK-NEXT: 172 concat 7 169 171
// CHECK-NEXT: 173 state 7
// CHECK-NEXT: 174 state 7
// CHECK-NEXT: 175 state 25
// CHECK-NEXT: 176 init 25 175 97
// CHECK-NEXT: 177 concat 101 100 175
// CHECK-NEXT: 178 eq 25 177 103
// CHECK-NEXT: 179 ite 7 178 174 173
// CHECK-NEXT: 180 slice 25 9 0 0
// CHECK-NEXT: 181 ite 7 180 179 172
// CHECK-NEXT: 182 slice 25 181 0 0
// CHECK-NEXT: 183 slice 25 181 1 1
// CHECK-NEXT: 184 and 25 182 183
// CHECK-NEXT: 185 sort bitvec 14
// CHECK-NEXT: 186 const 101 00
// CHECK-NEXT: 187 const 10 11001
// CHECK-NEXT: 188 eq 25 92 187
// CHECK-NEXT: 189 ite 101 188 103 186
// CHECK-NEXT: 190 const 101 01
// CHECK-NEXT: 191 const 10 10011
// CHECK-NEXT: 192 eq 25 92 191
// CHECK-NEXT: 193 ite 101 192 190 189
// CHECK-NEXT: 194 const 7 1100
// CHECK-NEXT: 195 uext 10 194 1
// CHECK-NEXT: 196 eq 25 92 195
// CHECK-NEXT: 197 ite 101 196 186 193
// CHECK-NEXT: 198 uext 101 97 1
// CHECK-NEXT: 199 neq 25 197 198
// CHECK-NEXT: 200 slice 25 181 0 0
// CHECK-NEXT: 201 slice 25 181 0 0
// CHECK-NEXT: 202 concat 101 201 200
// CHECK-NEXT: 203 slice 25 181 0 0
// CHECK-NEXT: 204 concat 29 203 202
// CHECK-NEXT: 205 slice 25 181 0 0
// CHECK-NEXT: 206 concat 7 205 204
// CHECK-NEXT: 207 slice 25 181 0 0
// CHECK-NEXT: 208 concat 10 207 206
// CHECK-NEXT: 209 slice 25 181 0 0
// CHECK-NEXT: 210 sort bitvec 6
// CHECK-NEXT: 211 concat 210 209 208
// CHECK-NEXT: 212 slice 25 181 0 0
// CHECK-NEXT: 213 sort bitvec 7
// CHECK-NEXT: 214 concat 213 212 211
// CHECK-NEXT: 215 slice 25 181 0 0
// CHECK-NEXT: 216 sort bitvec 8
// CHECK-NEXT: 217 concat 216 215 214
// CHECK-NEXT: 218 slice 25 181 0 0
// CHECK-NEXT: 219 concat 56 218 217
// CHECK-NEXT: 220 slice 25 181 0 0
// CHECK-NEXT: 221 sort bitvec 10
// CHECK-NEXT: 222 concat 221 220 219
// CHECK-NEXT: 223 slice 25 181 0 0
// CHECK-NEXT: 224 sort bitvec 11
// CHECK-NEXT: 225 concat 224 223 222
// CHECK-NEXT: 226 slice 25 181 0 0
// CHECK-NEXT: 227 sort bitvec 12
// CHECK-NEXT: 228 concat 227 226 225
// CHECK-NEXT: 229 slice 25 181 0 0
// CHECK-NEXT: 230 sort bitvec 13
// CHECK-NEXT: 231 concat 230 229 228
// CHECK-NEXT: 232 slice 25 181 0 0
// CHECK-NEXT: 233 concat 185 232 231
// CHECK-NEXT: 234 slice 25 181 0 0
// CHECK-NEXT: 235 sort bitvec 15
// CHECK-NEXT: 236 concat 235 234 233
// CHECK-NEXT: 237 slice 25 181 0 0
// CHECK-NEXT: 238 sort bitvec 16
// CHECK-NEXT: 239 concat 238 237 236
// CHECK-NEXT: 240 slice 25 181 0 0
// CHECK-NEXT: 241 sort bitvec 17
// CHECK-NEXT: 242 concat 241 240 239
// CHECK-NEXT: 243 slice 25 181 0 0
// CHECK-NEXT: 244 concat 16 243 242
// CHECK-NEXT: 245 slice 25 181 0 0
// CHECK-NEXT: 246 sort bitvec 19
// CHECK-NEXT: 247 concat 246 245 244
// CHECK-NEXT: 248 slice 25 181 0 0
// CHECK-NEXT: 249 sort bitvec 20
// CHECK-NEXT: 250 concat 249 248 247
// CHECK-NEXT: 251 slice 25 181 0 0
// CHECK-NEXT: 252 sort bitvec 21
// CHECK-NEXT: 253 concat 252 251 250
// CHECK-NEXT: 254 slice 25 181 0 0
// CHECK-NEXT: 255 sort bitvec 22
// CHECK-NEXT: 256 concat 255 254 253
// CHECK-NEXT: 257 slice 25 181 0 0
// CHECK-NEXT: 258 sort bitvec 23
// CHECK-NEXT: 259 concat 258 257 256
// CHECK-NEXT: 260 slice 25 181 0 0
// CHECK-NEXT: 261 sort bitvec 24
// CHECK-NEXT: 262 concat 261 260 259
// CHECK-NEXT: 263 slice 25 181 0 0
// CHECK-NEXT: 264 sort bitvec 25
// CHECK-NEXT: 265 concat 264 263 262
// CHECK-NEXT: 266 slice 25 181 0 0
// CHECK-NEXT: 267 sort bitvec 26
// CHECK-NEXT: 268 concat 267 266 265
// CHECK-NEXT: 269 slice 25 181 0 0
// CHECK-NEXT: 270 concat 47 269 268
// CHECK-NEXT: 271 slice 25 181 0 0
// CHECK-NEXT: 272 sort bitvec 28
// CHECK-NEXT: 273 concat 272 271 270
// CHECK-NEXT: 274 slice 25 181 0 0
// CHECK-NEXT: 275 sort bitvec 29
// CHECK-NEXT: 276 concat 275 274 273
// CHECK-NEXT: 277 slice 25 181 0 0
// CHECK-NEXT: 278 concat 1 277 276
// CHECK-NEXT: 279 slice 25 181 0 0
// CHECK-NEXT: 280 sort bitvec 31
// CHECK-NEXT: 281 concat 280 279 278
// CHECK-NEXT: 282 slice 25 181 0 0
// CHECK-NEXT: 283 concat 3 282 281
// CHECK-NEXT: 284 slice 25 181 0 0
// CHECK-NEXT: 285 sort bitvec 33
// CHECK-NEXT: 286 concat 285 284 283
// CHECK-NEXT: 287 slice 25 181 0 0
// CHECK-NEXT: 288 sort bitvec 34
// CHECK-NEXT: 289 concat 288 287 286
// CHECK-NEXT: 290 slice 25 181 0 0
// CHECK-NEXT: 291 sort bitvec 35
// CHECK-NEXT: 292 concat 291 290 289
// CHECK-NEXT: 293 slice 25 181 0 0
// CHECK-NEXT: 294 sort bitvec 36
// CHECK-NEXT: 295 concat 294 293 292
// CHECK-NEXT: 296 slice 25 181 0 0
// CHECK-NEXT: 297 sort bitvec 37
// CHECK-NEXT: 298 concat 297 296 295
// CHECK-NEXT: 299 slice 25 181 0 0
// CHECK-NEXT: 300 sort bitvec 38
// CHECK-NEXT: 301 concat 300 299 298
// CHECK-NEXT: 302 slice 25 181 0 0
// CHECK-NEXT: 303 sort bitvec 39
// CHECK-NEXT: 304 concat 303 302 301
// CHECK-NEXT: 305 slice 25 181 0 0
// CHECK-NEXT: 306 sort bitvec 40
// CHECK-NEXT: 307 concat 306 305 304
// CHECK-NEXT: 308 slice 25 181 0 0
// CHECK-NEXT: 309 sort bitvec 41
// CHECK-NEXT: 310 concat 309 308 307
// CHECK-NEXT: 311 slice 25 181 0 0
// CHECK-NEXT: 312 sort bitvec 42
// CHECK-NEXT: 313 concat 312 311 310
// CHECK-NEXT: 314 slice 25 181 0 0
// CHECK-NEXT: 315 sort bitvec 43
// CHECK-NEXT: 316 concat 315 314 313
// CHECK-NEXT: 317 slice 25 181 0 0
// CHECK-NEXT: 318 sort bitvec 44
// CHECK-NEXT: 319 concat 318 317 316
// CHECK-NEXT: 320 slice 25 181 0 0
// CHECK-NEXT: 321 sort bitvec 45
// CHECK-NEXT: 322 concat 321 320 319
// CHECK-NEXT: 323 slice 25 181 0 0
// CHECK-NEXT: 324 sort bitvec 46
// CHECK-NEXT: 325 concat 324 323 322
// CHECK-NEXT: 326 slice 25 181 0 0
// CHECK-NEXT: 327 sort bitvec 47
// CHECK-NEXT: 328 concat 327 326 325
// CHECK-NEXT: 329 slice 25 181 0 0
// CHECK-NEXT: 330 concat 23 329 328
// CHECK-NEXT: 331 input 23
// CHECK-NEXT: 332 state 23
// CHECK-NEXT: 333 state 23
// CHECK-NEXT: 334 state 25
// CHECK-NEXT: 335 init 25 334 97
// CHECK-NEXT: 336 concat 101 100 334
// CHECK-NEXT: 337 eq 25 336 103
// CHECK-NEXT: 338 ite 23 337 333 332
// CHECK-NEXT: 339 slice 280 338 47 17
// CHECK-NEXT: 340 slice 25 338 47 47
// CHECK-NEXT: 341 concat 3 340 339
// CHECK-NEXT: 342 slice 25 338 47 47
// CHECK-NEXT: 343 concat 285 342 341
// CHECK-NEXT: 344 slice 25 338 47 47
// CHECK-NEXT: 345 concat 288 344 343
// CHECK-NEXT: 346 slice 25 338 47 47
// CHECK-NEXT: 347 concat 291 346 345
// CHECK-NEXT: 348 slice 25 338 47 47
// CHECK-NEXT: 349 concat 294 348 347
// CHECK-NEXT: 350 slice 25 338 47 47
// CHECK-NEXT: 351 concat 297 350 349
// CHECK-NEXT: 352 slice 25 338 47 47
// CHECK-NEXT: 353 concat 300 352 351
// CHECK-NEXT: 354 slice 25 338 47 47
// CHECK-NEXT: 355 concat 303 354 353
// CHECK-NEXT: 356 slice 25 338 47 47
// CHECK-NEXT: 357 concat 306 356 355
// CHECK-NEXT: 358 slice 25 338 47 47
// CHECK-NEXT: 359 concat 309 358 357
// CHECK-NEXT: 360 slice 25 338 47 47
// CHECK-NEXT: 361 concat 312 360 359
// CHECK-NEXT: 362 slice 25 338 47 47
// CHECK-NEXT: 363 concat 315 362 361
// CHECK-NEXT: 364 slice 25 338 47 47
// CHECK-NEXT: 365 concat 318 364 363
// CHECK-NEXT: 366 slice 25 338 47 47
// CHECK-NEXT: 367 concat 321 366 365
// CHECK-NEXT: 368 slice 25 338 47 47
// CHECK-NEXT: 369 concat 324 368 367
// CHECK-NEXT: 370 slice 25 338 47 47
// CHECK-NEXT: 371 concat 327 370 369
// CHECK-NEXT: 372 slice 25 338 47 47
// CHECK-NEXT: 373 concat 23 372 371
// CHECK-NEXT: 374 slice 25 71 0 0
// CHECK-NEXT: 375 slice 25 57 0 0
// CHECK-NEXT: 376 xor 25 374 375
// CHECK-NEXT: 377 slice 25 71 1 1
// CHECK-NEXT: 378 slice 25 57 1 1
// CHECK-NEXT: 379 xor 25 377 378
// CHECK-NEXT: 380 slice 25 71 2 2
// CHECK-NEXT: 381 slice 25 57 2 2
// CHECK-NEXT: 382 xor 25 380 381
// CHECK-NEXT: 383 slice 25 71 3 3
// CHECK-NEXT: 384 slice 25 57 3 3
// CHECK-NEXT: 385 xor 25 383 384
// CHECK-NEXT: 386 slice 25 71 4 4
// CHECK-NEXT: 387 slice 25 57 4 4
// CHECK-NEXT: 388 xor 25 386 387
// CHECK-NEXT: 389 slice 25 71 5 5
// CHECK-NEXT: 390 slice 25 57 5 5
// CHECK-NEXT: 391 xor 25 389 390
// CHECK-NEXT: 392 slice 25 71 6 6
// CHECK-NEXT: 393 slice 25 57 6 6
// CHECK-NEXT: 394 xor 25 392 393
// CHECK-NEXT: 395 slice 25 71 7 7
// CHECK-NEXT: 396 slice 25 57 7 7
// CHECK-NEXT: 397 xor 25 395 396
// CHECK-NEXT: 398 slice 25 71 8 8
// CHECK-NEXT: 399 slice 25 57 8 8
// CHECK-NEXT: 400 xor 25 398 399
// CHECK-NEXT: 401 concat 101 379 376
// CHECK-NEXT: 402 concat 29 382 401
// CHECK-NEXT: 403 concat 7 385 402
// CHECK-NEXT: 404 concat 10 388 403
// CHECK-NEXT: 405 concat 210 391 404
// CHECK-NEXT: 406 concat 213 394 405
// CHECK-NEXT: 407 concat 216 397 406
// CHECK-NEXT: 408 concat 56 400 407
// CHECK-NEXT: 409 state 56
// CHECK-NEXT: 410 state 56
// CHECK-NEXT: 411 state 25
// CHECK-NEXT: 412 init 25 411 97
// CHECK-NEXT: 413 concat 101 100 411
// CHECK-NEXT: 414 eq 25 413 103
// CHECK-NEXT: 415 ite 56 414 410 409
// CHECK-NEXT: 416 slice 25 72 0 0
// CHECK-NEXT: 417 ite 56 416 415 408
// CHECK-NEXT: 418 slice 101 417 6 5
// CHECK-NEXT: 419 const 101 11
// CHECK-NEXT: 420 eq 25 418 419
// CHECK-NEXT: 421 ite 23 420 373 331
// CHECK-NEXT: 422 slice 280 74 47 17
// CHECK-NEXT: 423 slice 25 74 47 47
// CHECK-NEXT: 424 concat 3 423 422
// CHECK-NEXT: 425 slice 25 74 47 47
// CHECK-NEXT: 426 concat 285 425 424
// CHECK-NEXT: 427 slice 25 74 47 47
// CHECK-NEXT: 428 concat 288 427 426
// CHECK-NEXT: 429 slice 25 74 47 47
// CHECK-NEXT: 430 concat 291 429 428
// CHECK-NEXT: 431 slice 25 74 47 47
// CHECK-NEXT: 432 concat 294 431 430
// CHECK-NEXT: 433 slice 25 74 47 47
// CHECK-NEXT: 434 concat 297 433 432
// CHECK-NEXT: 435 slice 25 74 47 47
// CHECK-NEXT: 436 concat 300 435 434
// CHECK-NEXT: 437 slice 25 74 47 47
// CHECK-NEXT: 438 concat 303 437 436
// CHECK-NEXT: 439 slice 25 74 47 47
// CHECK-NEXT: 440 concat 306 439 438
// CHECK-NEXT: 441 slice 25 74 47 47
// CHECK-NEXT: 442 concat 309 441 440
// CHECK-NEXT: 443 slice 25 74 47 47
// CHECK-NEXT: 444 concat 312 443 442
// CHECK-NEXT: 445 slice 25 74 47 47
// CHECK-NEXT: 446 concat 315 445 444
// CHECK-NEXT: 447 slice 25 74 47 47
// CHECK-NEXT: 448 concat 318 447 446
// CHECK-NEXT: 449 slice 25 74 47 47
// CHECK-NEXT: 450 concat 321 449 448
// CHECK-NEXT: 451 slice 25 74 47 47
// CHECK-NEXT: 452 concat 324 451 450
// CHECK-NEXT: 453 slice 25 74 47 47
// CHECK-NEXT: 454 concat 327 453 452
// CHECK-NEXT: 455 slice 25 74 47 47
// CHECK-NEXT: 456 concat 23 455 454
// CHECK-NEXT: 457 slice 29 417 6 4
// CHECK-NEXT: 458 const 29 101
// CHECK-NEXT: 459 eq 25 457 458
// CHECK-NEXT: 460 ite 23 459 456 421
// CHECK-NEXT: 461 const 29 100
// CHECK-NEXT: 462 eq 25 457 461
// CHECK-NEXT: 463 uext 29 103 1
// CHECK-NEXT: 464 eq 25 457 463
// CHECK-NEXT: 465 concat 101 464 462
// CHECK-NEXT: 466 redor 25 465
// CHECK-NEXT: 467 ite 23 466 338 460
// CHECK-NEXT: 468 state 23
// CHECK-NEXT: 469 state 23
// CHECK-NEXT: 470 state 25
// CHECK-NEXT: 471 init 25 470 97
// CHECK-NEXT: 472 concat 101 100 470
// CHECK-NEXT: 473 eq 25 472 103
// CHECK-NEXT: 474 ite 23 473 469 468
// CHECK-NEXT: 475 slice 25 46 0 0
// CHECK-NEXT: 476 ite 23 475 474 24
// CHECK-NEXT: 477 uext 29 419 1
// CHECK-NEXT: 478 eq 25 457 477
// CHECK-NEXT: 479 ite 23 478 476 467
// CHECK-NEXT: 480 uext 29 97 2
// CHECK-NEXT: 481 eq 25 457 480
// CHECK-NEXT: 482 ite 23 481 74 479
// CHECK-NEXT: 483 const 23 000000000000000000000000000000000000000000000000
// CHECK-NEXT: 484 redor 25 457
// CHECK-NEXT: 485 not 25 484
// CHECK-NEXT: 486 ite 23 485 483 482
// CHECK-NEXT: 487 xor 23 330 486
// CHECK-NEXT: 488 input 23
// CHECK-NEXT: 489 concat 23 125 153
// CHECK-NEXT: 490 slice 101 417 1 0
// CHECK-NEXT: 491 eq 25 490 419
// CHECK-NEXT: 492 ite 23 491 489 488
// CHECK-NEXT: 493 eq 25 490 103
// CHECK-NEXT: 494 ite 23 493 338 492
// CHECK-NEXT: 495 const 321 100000000000000000000000000000000000000000000
// CHECK-NEXT: 496 slice 47 125 26 0
// CHECK-NEXT: 497 slice 47 105 26 0
// CHECK-NEXT: 498 slice 25 50 0 0
// CHECK-NEXT: 499 slice 25 55 0 0
// CHECK-NEXT: 500 xor 25 498 499
// CHECK-NEXT: 501 slice 25 50 1 1
// CHECK-NEXT: 502 slice 25 55 1 1
// CHECK-NEXT: 503 xor 25 501 502
// CHECK-NEXT: 504 slice 25 50 2 2
// CHECK-NEXT: 505 slice 25 55 2 2
// CHECK-NEXT: 506 xor 25 504 505
// CHECK-NEXT: 507 slice 25 50 3 3
// CHECK-NEXT: 508 slice 25 55 3 3
// CHECK-NEXT: 509 xor 25 507 508
// CHECK-NEXT: 510 slice 25 50 4 4
// CHECK-NEXT: 511 slice 25 55 4 4
// CHECK-NEXT: 512 xor 25 510 511
// CHECK-NEXT: 513 concat 101 503 500
// CHECK-NEXT: 514 concat 29 506 513
// CHECK-NEXT: 515 concat 7 509 514
// CHECK-NEXT: 516 concat 10 512 515
// CHECK-NEXT: 517 state 10
// CHECK-NEXT: 518 state 10
// CHECK-NEXT: 519 state 25
// CHECK-NEXT: 520 init 25 519 97
// CHECK-NEXT: 521 concat 101 100 519
// CHECK-NEXT: 522 eq 25 521 103
// CHECK-NEXT: 523 ite 10 522 518 517
// CHECK-NEXT: 524 slice 25 51 0 0
// CHECK-NEXT: 525 ite 10 524 523 516
// CHECK-NEXT: 526 slice 25 525 0 0
// CHECK-NEXT: 527 ite 47 526 497 496
// CHECK-NEXT: 528 const 47 000000000000000000000000000
// CHECK-NEXT: 529 uext 10 97 4
// CHECK-NEXT: 530 eq 25 75 529
// CHECK-NEXT: 531 ite 25 530 97 106
// CHECK-NEXT: 532 const 29 000
// CHECK-NEXT: 533 concat 216 532 75
// CHECK-NEXT: 534 redor 25 533
// CHECK-NEXT: 535 not 25 534
// CHECK-NEXT: 536 ite 25 535 106 531
// CHECK-NEXT: 537 not 25 536
// CHECK-NEXT: 538 slice 25 525 1 1
// CHECK-NEXT: 539 and 25 537 538
// CHECK-NEXT: 540 ite 47 539 528 527
// CHECK-NEXT: 541 state 47
// CHECK-NEXT: 542 state 47
// CHECK-NEXT: 543 state 25
// CHECK-NEXT: 544 init 25 543 97
// CHECK-NEXT: 545 concat 101 100 543
// CHECK-NEXT: 546 eq 25 545 103
// CHECK-NEXT: 547 ite 47 546 542 541
// CHECK-NEXT: 548 slice 25 49 0 0
// CHECK-NEXT: 549 uext 10 103 3
// CHECK-NEXT: 550 eq 25 11 549
// CHECK-NEXT: 551 ite 25 550 97 106
// CHECK-NEXT: 552 const 224 00000000000
// CHECK-NEXT: 553 concat 238 552 11
// CHECK-NEXT: 554 redor 25 553
// CHECK-NEXT: 555 not 25 554
// CHECK-NEXT: 556 ite 25 555 106 551
// CHECK-NEXT: 557 not 25 556
// CHECK-NEXT: 558 uext 10 103 3
// CHECK-NEXT: 559 eq 25 20 558
// CHECK-NEXT: 560 ite 25 559 97 106
// CHECK-NEXT: 561 uext 10 97 4
// CHECK-NEXT: 562 eq 25 20 561
// CHECK-NEXT: 563 ite 25 562 106 560
// CHECK-NEXT: 564 not 25 563
// CHECK-NEXT: 565 and 25 557 564
// CHECK-NEXT: 566 const 10 10100
// CHECK-NEXT: 567 eq 25 90 566
// CHECK-NEXT: 568 ite 101 567 103 186
// CHECK-NEXT: 569 const 10 10010
// CHECK-NEXT: 570 eq 25 90 569
// CHECK-NEXT: 571 ite 101 570 190 568
// CHECK-NEXT: 572 const 7 1010
// CHECK-NEXT: 573 uext 10 572 1
// CHECK-NEXT: 574 eq 25 90 573
// CHECK-NEXT: 575 ite 101 574 186 571
// CHECK-NEXT: 576 eq 25 575 103
// CHECK-NEXT: 577 or 25 565 576
// CHECK-NEXT: 578 ite 25 577 106 548
// CHECK-NEXT: 579 ite 47 578 547 48
// CHECK-NEXT: 580 slice 25 525 2 2
// CHECK-NEXT: 581 ite 47 580 579 528
// CHECK-NEXT: 582 slice 25 525 4 4
// CHECK-NEXT: 583 ite 16 582 136 153
// CHECK-NEXT: 584 const 16 000000000000000000
// CHECK-NEXT: 585 and 25 536 538
// CHECK-NEXT: 586 ite 16 585 584 583
// CHECK-NEXT: 587 slice 25 586 17 17
// CHECK-NEXT: 588 concat 246 587 586
// CHECK-NEXT: 589 slice 25 586 17 17
// CHECK-NEXT: 590 concat 249 589 588
// CHECK-NEXT: 591 slice 25 586 17 17
// CHECK-NEXT: 592 concat 252 591 590
// CHECK-NEXT: 593 slice 25 586 17 17
// CHECK-NEXT: 594 concat 255 593 592
// CHECK-NEXT: 595 slice 25 586 17 17
// CHECK-NEXT: 596 concat 258 595 594
// CHECK-NEXT: 597 slice 25 586 17 17
// CHECK-NEXT: 598 concat 261 597 596
// CHECK-NEXT: 599 slice 25 586 17 17
// CHECK-NEXT: 600 concat 264 599 598
// CHECK-NEXT: 601 slice 25 586 17 17
// CHECK-NEXT: 602 concat 267 601 600
// CHECK-NEXT: 603 slice 25 586 17 17
// CHECK-NEXT: 604 concat 47 603 602
// CHECK-NEXT: 605 ite 47 536 604 540
// CHECK-NEXT: 606 add 47 581 605
// CHECK-NEXT: 607 sub 47 581 605
// CHECK-NEXT: 608 slice 25 525 3 3
// CHECK-NEXT: 609 ite 47 608 607 606
// CHECK-NEXT: 610 state 47
// CHECK-NEXT: 611 state 47
// CHECK-NEXT: 612 state 25
// CHECK-NEXT: 613 init 25 612 97
// CHECK-NEXT: 614 concat 101 100 612
// CHECK-NEXT: 615 eq 25 614 103
// CHECK-NEXT: 616 ite 47 615 611 610
// CHECK-NEXT: 617 slice 25 6 0 0
// CHECK-NEXT: 618 ite 25 577 106 617
// CHECK-NEXT: 619 ite 47 618 616 609
// CHECK-NEXT: 620 ite 47 556 619 540
// CHECK-NEXT: 621 slice 25 620 26 26
// CHECK-NEXT: 622 concat 272 621 620
// CHECK-NEXT: 623 slice 25 620 26 26
// CHECK-NEXT: 624 concat 275 623 622
// CHECK-NEXT: 625 slice 25 620 26 26
// CHECK-NEXT: 626 concat 1 625 624
// CHECK-NEXT: 627 slice 25 620 26 26
// CHECK-NEXT: 628 concat 280 627 626
// CHECK-NEXT: 629 slice 25 620 26 26
// CHECK-NEXT: 630 concat 3 629 628
// CHECK-NEXT: 631 slice 25 620 26 26
// CHECK-NEXT: 632 concat 285 631 630
// CHECK-NEXT: 633 slice 25 620 26 26
// CHECK-NEXT: 634 concat 288 633 632
// CHECK-NEXT: 635 slice 25 620 26 26
// CHECK-NEXT: 636 concat 291 635 634
// CHECK-NEXT: 637 slice 25 620 26 26
// CHECK-NEXT: 638 concat 294 637 636
// CHECK-NEXT: 639 slice 25 620 26 26
// CHECK-NEXT: 640 concat 297 639 638
// CHECK-NEXT: 641 slice 25 620 26 26
// CHECK-NEXT: 642 concat 300 641 640
// CHECK-NEXT: 643 slice 25 620 26 26
// CHECK-NEXT: 644 concat 303 643 642
// CHECK-NEXT: 645 slice 25 620 26 26
// CHECK-NEXT: 646 concat 306 645 644
// CHECK-NEXT: 647 slice 25 620 26 26
// CHECK-NEXT: 648 concat 309 647 646
// CHECK-NEXT: 649 slice 25 620 26 26
// CHECK-NEXT: 650 concat 312 649 648
// CHECK-NEXT: 651 slice 25 620 26 26
// CHECK-NEXT: 652 concat 315 651 650
// CHECK-NEXT: 653 slice 25 620 26 26
// CHECK-NEXT: 654 concat 318 653 652
// CHECK-NEXT: 655 slice 25 620 26 26
// CHECK-NEXT: 656 concat 321 655 654
// CHECK-NEXT: 657 slice 16 619 17 0
// CHECK-NEXT: 658 ite 16 563 657 586
// CHECK-NEXT: 659 slice 25 658 17 17
// CHECK-NEXT: 660 concat 246 659 658
// CHECK-NEXT: 661 slice 25 658 17 17
// CHECK-NEXT: 662 concat 249 661 660
// CHECK-NEXT: 663 slice 25 658 17 17
// CHECK-NEXT: 664 concat 252 663 662
// CHECK-NEXT: 665 slice 25 658 17 17
// CHECK-NEXT: 666 concat 255 665 664
// CHECK-NEXT: 667 slice 25 658 17 17
// CHECK-NEXT: 668 concat 258 667 666
// CHECK-NEXT: 669 slice 25 658 17 17
// CHECK-NEXT: 670 concat 261 669 668
// CHECK-NEXT: 671 slice 25 658 17 17
// CHECK-NEXT: 672 concat 264 671 670
// CHECK-NEXT: 673 slice 25 658 17 17
// CHECK-NEXT: 674 concat 267 673 672
// CHECK-NEXT: 675 slice 25 658 17 17
// CHECK-NEXT: 676 concat 47 675 674
// CHECK-NEXT: 677 slice 25 658 17 17
// CHECK-NEXT: 678 concat 272 677 676
// CHECK-NEXT: 679 slice 25 658 17 17
// CHECK-NEXT: 680 concat 275 679 678
// CHECK-NEXT: 681 slice 25 658 17 17
// CHECK-NEXT: 682 concat 1 681 680
// CHECK-NEXT: 683 slice 25 658 17 17
// CHECK-NEXT: 684 concat 280 683 682
// CHECK-NEXT: 685 slice 25 658 17 17
// CHECK-NEXT: 686 concat 3 685 684
// CHECK-NEXT: 687 slice 25 658 17 17
// CHECK-NEXT: 688 concat 285 687 686
// CHECK-NEXT: 689 slice 25 658 17 17
// CHECK-NEXT: 690 concat 288 689 688
// CHECK-NEXT: 691 slice 25 658 17 17
// CHECK-NEXT: 692 concat 291 691 690
// CHECK-NEXT: 693 slice 25 658 17 17
// CHECK-NEXT: 694 concat 294 693 692
// CHECK-NEXT: 695 slice 25 658 17 17
// CHECK-NEXT: 696 concat 297 695 694
// CHECK-NEXT: 697 slice 25 658 17 17
// CHECK-NEXT: 698 concat 300 697 696
// CHECK-NEXT: 699 slice 25 658 17 17
// CHECK-NEXT: 700 concat 303 699 698
// CHECK-NEXT: 701 slice 25 658 17 17
// CHECK-NEXT: 702 concat 306 701 700
// CHECK-NEXT: 703 slice 25 658 17 17
// CHECK-NEXT: 704 concat 309 703 702
// CHECK-NEXT: 705 slice 25 658 17 17
// CHECK-NEXT: 706 concat 312 705 704
// CHECK-NEXT: 707 slice 25 658 17 17
// CHECK-NEXT: 708 concat 315 707 706
// CHECK-NEXT: 709 slice 25 658 17 17
// CHECK-NEXT: 710 concat 318 709 708
// CHECK-NEXT: 711 slice 25 658 17 17
// CHECK-NEXT: 712 concat 321 711 710
// CHECK-NEXT: 713 mul 321 656 712
// CHECK-NEXT: 714 const 321 000000000000000000000000000000000000000000000
// CHECK-NEXT: 715 ite 321 576 714 713
// CHECK-NEXT: 716 slice 318 715 43 0
// CHECK-NEXT: 717 const 315 1010101010101010101010101010101010101010101
// CHECK-NEXT: 718 uext 318 717 1
// CHECK-NEXT: 719 and 318 716 718
// CHECK-NEXT: 720 concat 321 97 719
// CHECK-NEXT: 721 state 321
// CHECK-NEXT: 722 state 321
// CHECK-NEXT: 723 state 25
// CHECK-NEXT: 724 init 25 723 97
// CHECK-NEXT: 725 concat 101 100 723
// CHECK-NEXT: 726 eq 25 725 103
// CHECK-NEXT: 727 ite 321 726 722 721
// CHECK-NEXT: 728 slice 25 69 0 0
// CHECK-NEXT: 729 ite 321 728 727 720
// CHECK-NEXT: 730 redor 25 197
// CHECK-NEXT: 731 not 25 730
// CHECK-NEXT: 732 ite 321 731 729 495
// CHECK-NEXT: 733 slice 25 732 44 44
// CHECK-NEXT: 734 concat 324 733 732
// CHECK-NEXT: 735 slice 25 732 44 44
// CHECK-NEXT: 736 concat 327 735 734
// CHECK-NEXT: 737 slice 25 732 44 44
// CHECK-NEXT: 738 concat 23 737 736
// CHECK-NEXT: 739 uext 101 97 1
// CHECK-NEXT: 740 eq 25 490 739
// CHECK-NEXT: 741 ite 23 740 738 494
// CHECK-NEXT: 742 concat 101 70 106
// CHECK-NEXT: 743 ite 101 462 742 186
// CHECK-NEXT: 744 const 324 0000000000000000000000000000000000000000000000
// CHECK-NEXT: 745 concat 23 744 743
// CHECK-NEXT: 746 redor 25 490
// CHECK-NEXT: 747 not 25 746
// CHECK-NEXT: 748 ite 23 747 745 741
// CHECK-NEXT: 749 xor 23 487 748
// CHECK-NEXT: 750 input 23
// CHECK-NEXT: 751 slice 101 417 3 2
// CHECK-NEXT: 752 eq 25 751 419
// CHECK-NEXT: 753 ite 23 752 476 750
// CHECK-NEXT: 754 const 23 111111111111111111111111111111111111111111111111
// CHECK-NEXT: 755 eq 25 751 103
// CHECK-NEXT: 756 ite 23 755 754 753
// CHECK-NEXT: 757 const 318 10101010101010101010101010101010101010101010
// CHECK-NEXT: 758 and 318 716 757
// CHECK-NEXT: 759 slice 25 715 44 44
// CHECK-NEXT: 760 not 25 759
// CHECK-NEXT: 761 concat 321 760 758
// CHECK-NEXT: 762 state 321
// CHECK-NEXT: 763 state 321
// CHECK-NEXT: 764 state 25
// CHECK-NEXT: 765 init 25 764 97
// CHECK-NEXT: 766 concat 101 100 764
// CHECK-NEXT: 767 eq 25 766 103
// CHECK-NEXT: 768 ite 321 767 763 762
// CHECK-NEXT: 769 ite 321 728 768 761
// CHECK-NEXT: 770 ite 321 731 769 495
// CHECK-NEXT: 771 concat 23 532 770
// CHECK-NEXT: 772 uext 101 97 1
// CHECK-NEXT: 773 eq 25 751 772
// CHECK-NEXT: 774 ite 23 773 771 756
// CHECK-NEXT: 775 redor 25 751
// CHECK-NEXT: 776 not 25 775
// CHECK-NEXT: 777 ite 23 776 483 774
// CHECK-NEXT: 778 xor 23 749 777
// CHECK-NEXT: 779 and 23 748 777
// CHECK-NEXT: 780 and 23 487 777
// CHECK-NEXT: 781 or 23 779 780
// CHECK-NEXT: 782 and 23 748 487
// CHECK-NEXT: 783 or 23 781 782
// CHECK-NEXT: 784 slice 25 181 3 3
// CHECK-NEXT: 785 ite 23 784 783 778
// CHECK-NEXT: 786 slice 25 181 2 2
// CHECK-NEXT: 787 ite 23 786 483 783
// CHECK-NEXT: 788 slice 25 787 11 11
// CHECK-NEXT: 789 and 25 788 199
// CHECK-NEXT: 790 slice 25 787 23 23
// CHECK-NEXT: 791 and 25 790 731
// CHECK-NEXT: 792 slice 25 787 35 35
// CHECK-NEXT: 793 and 25 792 199
// CHECK-NEXT: 794 slice 224 787 10 0
// CHECK-NEXT: 795 concat 227 794 106
// CHECK-NEXT: 796 concat 230 789 795
// CHECK-NEXT: 797 slice 224 787 22 12
// CHECK-NEXT: 798 concat 261 797 796
// CHECK-NEXT: 799 concat 264 791 798
// CHECK-NEXT: 800 slice 224 787 34 24
// CHECK-NEXT: 801 concat 294 800 799
// CHECK-NEXT: 802 concat 297 793 801
// CHECK-NEXT: 803 slice 224 787 46 36
// CHECK-NEXT: 804 concat 23 803 802
// CHECK-NEXT: 805 and 23 785 804
// CHECK-NEXT: 806 input 23
// CHECK-NEXT: 807 slice 101 417 8 7
// CHECK-NEXT: 808 eq 25 807 419
// CHECK-NEXT: 809 ite 23 808 476 806
// CHECK-NEXT: 810 eq 25 807 103
// CHECK-NEXT: 811 ite 23 810 77 809
// CHECK-NEXT: 812 uext 101 97 1
// CHECK-NEXT: 813 eq 25 807 812
// CHECK-NEXT: 814 ite 23 813 338 811
// CHECK-NEXT: 815 redor 25 807
// CHECK-NEXT: 816 not 25 815
// CHECK-NEXT: 817 ite 23 816 483 814
// CHECK-NEXT: 818 and 23 817 804
// CHECK-NEXT: 819 or 23 805 818
// CHECK-NEXT: 820 and 23 785 817
// CHECK-NEXT: 821 or 23 819 820
// CHECK-NEXT: 822 slice 25 821 35 35
// CHECK-NEXT: 823 and 25 199 822
// CHECK-NEXT: 824 slice 227 821 47 36
// CHECK-NEXT: 825 concat 230 824 823
// CHECK-NEXT: 826 uext 185 825 1
// CHECK-NEXT: 827 xor 23 785 804
// CHECK-NEXT: 828 xor 23 827 817
// CHECK-NEXT: 829 slice 227 828 47 36
// CHECK-NEXT: 830 slice 25 787 47 47
// CHECK-NEXT: 831 concat 230 830 829
// CHECK-NEXT: 832 uext 185 831 1
// CHECK-NEXT: 833 add 185 826 832
// CHECK-NEXT: 834 slice 25 821 23 23
// CHECK-NEXT: 835 and 25 731 834
// CHECK-NEXT: 836 slice 224 821 34 24
// CHECK-NEXT: 837 concat 227 836 835
// CHECK-NEXT: 838 uext 230 837 1
// CHECK-NEXT: 839 slice 227 828 35 24
// CHECK-NEXT: 840 uext 230 839 1
// CHECK-NEXT: 841 add 230 838 840
// CHECK-NEXT: 842 slice 25 821 11 11
// CHECK-NEXT: 843 and 25 199 842
// CHECK-NEXT: 844 slice 224 821 22 12
// CHECK-NEXT: 845 concat 227 844 843
// CHECK-NEXT: 846 uext 230 845 1
// CHECK-NEXT: 847 slice 227 828 23 12
// CHECK-NEXT: 848 uext 230 847 1
// CHECK-NEXT: 849 add 230 846 848
// CHECK-NEXT: 850 input 25
// CHECK-NEXT: 851 slice 25 338 47 47
// CHECK-NEXT: 852 not 25 851
// CHECK-NEXT: 853 state 29
// CHECK-NEXT: 854 state 29
// CHECK-NEXT: 855 state 25
// CHECK-NEXT: 856 init 25 855 97
// CHECK-NEXT: 857 concat 101 100 855
// CHECK-NEXT: 858 eq 25 857 103
// CHECK-NEXT: 859 ite 29 858 854 853
// CHECK-NEXT: 860 slice 25 31 0 0
// CHECK-NEXT: 861 ite 29 860 859 30
// CHECK-NEXT: 862 eq 25 861 111
// CHECK-NEXT: 863 ite 25 862 852 850
// CHECK-NEXT: 864 slice 25 620 26 26
// CHECK-NEXT: 865 slice 25 658 17 17
// CHECK-NEXT: 866 xor 25 864 865
// CHECK-NEXT: 867 not 25 866
// CHECK-NEXT: 868 state 25
// CHECK-NEXT: 869 state 25
// CHECK-NEXT: 870 state 25
// CHECK-NEXT: 871 init 25 870 97
// CHECK-NEXT: 872 concat 101 100 870
// CHECK-NEXT: 873 eq 25 872 103
// CHECK-NEXT: 874 ite 25 873 869 868
// CHECK-NEXT: 875 ite 25 728 874 867
// CHECK-NEXT: 876 not 25 875
// CHECK-NEXT: 877 const 29 110
// CHECK-NEXT: 878 eq 25 861 877
// CHECK-NEXT: 879 ite 25 878 876 863
// CHECK-NEXT: 880 eq 25 861 458
// CHECK-NEXT: 881 ite 25 880 851 879
// CHECK-NEXT: 882 state 25
// CHECK-NEXT: 883 state 25
// CHECK-NEXT: 884 state 25
// CHECK-NEXT: 885 init 25 884 97
// CHECK-NEXT: 886 concat 101 100 884
// CHECK-NEXT: 887 eq 25 886 103
// CHECK-NEXT: 888 ite 25 887 883 882
// CHECK-NEXT: 889 state 7
// CHECK-NEXT: 890 state 7
// CHECK-NEXT: 891 state 25
// CHECK-NEXT: 892 init 25 891 97
// CHECK-NEXT: 893 concat 101 100 891
// CHECK-NEXT: 894 eq 25 893 103
// CHECK-NEXT: 895 ite 7 894 890 889
// CHECK-NEXT: 896 slice 25 895 3 3
// CHECK-NEXT: 897 xor 25 888 896
// CHECK-NEXT: 898 not 25 897
// CHECK-NEXT: 899 eq 25 861 461
// CHECK-NEXT: 900 ite 25 899 898 881
// CHECK-NEXT: 901 slice 25 74 47 47
// CHECK-NEXT: 902 not 25 901
// CHECK-NEXT: 903 uext 29 419 1
// CHECK-NEXT: 904 eq 25 861 903
// CHECK-NEXT: 905 ite 25 904 902 900
// CHECK-NEXT: 906 not 25 26
// CHECK-NEXT: 907 uext 29 103 1
// CHECK-NEXT: 908 eq 25 861 907
// CHECK-NEXT: 909 ite 25 908 906 905
// CHECK-NEXT: 910 uext 29 97 2
// CHECK-NEXT: 911 eq 25 861 910
// CHECK-NEXT: 912 ite 25 911 901 909
// CHECK-NEXT: 913 xor 25 27 53
// CHECK-NEXT: 914 state 25
// CHECK-NEXT: 915 state 25
// CHECK-NEXT: 916 state 25
// CHECK-NEXT: 917 init 25 916 97
// CHECK-NEXT: 918 concat 101 100 916
// CHECK-NEXT: 919 eq 25 918 103
// CHECK-NEXT: 920 ite 25 919 915 914
// CHECK-NEXT: 921 slice 25 28 0 0
// CHECK-NEXT: 922 ite 25 921 920 913
// CHECK-NEXT: 923 not 25 922
// CHECK-NEXT: 924 redor 25 861
// CHECK-NEXT: 925 not 25 924
// CHECK-NEXT: 926 ite 25 925 923 912
// CHECK-NEXT: 927 not 25 926
// CHECK-NEXT: 928 or 25 784 786
// CHECK-NEXT: 929 ite 25 928 106 927
// CHECK-NEXT: 930 slice 224 821 10 0
// CHECK-NEXT: 931 concat 227 930 929
// CHECK-NEXT: 932 uext 230 931 1
// CHECK-NEXT: 933 slice 227 828 11 0
// CHECK-NEXT: 934 uext 230 933 1
// CHECK-NEXT: 935 add 230 932 934
// CHECK-NEXT: 936 slice 25 935 12 12
// CHECK-NEXT: 937 and 25 199 936
// CHECK-NEXT: 938 uext 230 937 12
// CHECK-NEXT: 939 add 230 849 938
// CHECK-NEXT: 940 slice 25 939 12 12
// CHECK-NEXT: 941 and 25 731 940
// CHECK-NEXT: 942 uext 230 941 12
// CHECK-NEXT: 943 add 230 841 942
// CHECK-NEXT: 944 slice 25 943 12 12
// CHECK-NEXT: 945 and 25 199 944
// CHECK-NEXT: 946 uext 185 945 13
// CHECK-NEXT: 947 add 185 833 946
// CHECK-NEXT: 948 slice 25 947 12 12
// CHECK-NEXT: 949 xor 25 184 948
// CHECK-NEXT: 950 xor 25 184 949
// CHECK-NEXT: 951 slice 25 76 0 0
// CHECK-NEXT: 952 ite 25 951 897 950
// CHECK-NEXT: 953 output 952 CARRYCASCOUT 
// CHECK-NEXT: 954 xor 25 842 936
// CHECK-NEXT: 955 xor 25 954 788
// CHECK-NEXT: 956 xor 25 184 955
// CHECK-NEXT: 957 slice 7 417 3 0
// CHECK-NEXT: 958 uext 7 458 1
// CHECK-NEXT: 959 eq 25 957 958
// CHECK-NEXT: 960 slice 101 181 3 2
// CHECK-NEXT: 961 redor 25 960
// CHECK-NEXT: 962 or 25 959 961
// CHECK-NEXT: 963 ite 25 962 106 956
// CHECK-NEXT: 964 uext 101 97 1
// CHECK-NEXT: 965 eq 25 197 964
// CHECK-NEXT: 966 ite 25 965 963 106
// CHECK-NEXT: 967 xor 25 834 940
// CHECK-NEXT: 968 xor 25 967 790
// CHECK-NEXT: 969 xor 25 184 968
// CHECK-NEXT: 970 ite 25 962 106 969
// CHECK-NEXT: 971 redor 25 197
// CHECK-NEXT: 972 ite 25 971 970 106
// CHECK-NEXT: 973 xor 25 822 944
// CHECK-NEXT: 974 xor 25 973 792
// CHECK-NEXT: 975 xor 25 184 974
// CHECK-NEXT: 976 ite 25 962 106 975
// CHECK-NEXT: 977 ite 25 965 976 106
// CHECK-NEXT: 978 concat 101 972 966
// CHECK-NEXT: 979 concat 29 977 978
// CHECK-NEXT: 980 concat 7 949 979
// CHECK-NEXT: 981 ite 7 951 895 980
// CHECK-NEXT: 982 output 981 CARRYOUT 
// CHECK-NEXT: 983 slice 25 947 13 13
// CHECK-NEXT: 984 state 25
// CHECK-NEXT: 985 state 25
// CHECK-NEXT: 986 state 25
// CHECK-NEXT: 987 init 25 986 97
// CHECK-NEXT: 988 concat 101 100 986
// CHECK-NEXT: 989 eq 25 988 103
// CHECK-NEXT: 990 ite 25 989 985 984
// CHECK-NEXT: 991 ite 25 951 990 983
// CHECK-NEXT: 992 output 991 MULTSIGNOUT 
// CHECK-NEXT: 993 const 10 10001
// CHECK-NEXT: 994 eq 25 89 993
// CHECK-NEXT: 995 ite 25 994 97 106
// CHECK-NEXT: 996 const 7 1001
// CHECK-NEXT: 997 uext 10 996 1
// CHECK-NEXT: 998 eq 25 89 997
// CHECK-NEXT: 999 ite 25 998 106 995
// CHECK-NEXT: 1000 ite 23 999 476 73
// CHECK-NEXT: 1001 slice 25 181 1 1
// CHECK-NEXT: 1002 slice 25 181 1 1
// CHECK-NEXT: 1003 concat 101 1002 1001
// CHECK-NEXT: 1004 slice 25 181 1 1
// CHECK-NEXT: 1005 concat 29 1004 1003
// CHECK-NEXT: 1006 slice 25 181 1 1
// CHECK-NEXT: 1007 concat 7 1006 1005
// CHECK-NEXT: 1008 slice 25 181 1 1
// CHECK-NEXT: 1009 concat 10 1008 1007
// CHECK-NEXT: 1010 slice 25 181 1 1
// CHECK-NEXT: 1011 concat 210 1010 1009
// CHECK-NEXT: 1012 slice 25 181 1 1
// CHECK-NEXT: 1013 concat 213 1012 1011
// CHECK-NEXT: 1014 slice 25 181 1 1
// CHECK-NEXT: 1015 concat 216 1014 1013
// CHECK-NEXT: 1016 slice 25 181 1 1
// CHECK-NEXT: 1017 concat 56 1016 1015
// CHECK-NEXT: 1018 slice 25 181 1 1
// CHECK-NEXT: 1019 concat 221 1018 1017
// CHECK-NEXT: 1020 slice 25 181 1 1
// CHECK-NEXT: 1021 concat 224 1020 1019
// CHECK-NEXT: 1022 slice 25 181 1 1
// CHECK-NEXT: 1023 concat 227 1022 1021
// CHECK-NEXT: 1024 slice 25 181 1 1
// CHECK-NEXT: 1025 concat 230 1024 1023
// CHECK-NEXT: 1026 slice 25 181 1 1
// CHECK-NEXT: 1027 concat 185 1026 1025
// CHECK-NEXT: 1028 slice 25 181 1 1
// CHECK-NEXT: 1029 concat 235 1028 1027
// CHECK-NEXT: 1030 slice 25 181 1 1
// CHECK-NEXT: 1031 concat 238 1030 1029
// CHECK-NEXT: 1032 slice 25 181 1 1
// CHECK-NEXT: 1033 concat 241 1032 1031
// CHECK-NEXT: 1034 slice 25 181 1 1
// CHECK-NEXT: 1035 concat 16 1034 1033
// CHECK-NEXT: 1036 slice 25 181 1 1
// CHECK-NEXT: 1037 concat 246 1036 1035
// CHECK-NEXT: 1038 slice 25 181 1 1
// CHECK-NEXT: 1039 concat 249 1038 1037
// CHECK-NEXT: 1040 slice 25 181 1 1
// CHECK-NEXT: 1041 concat 252 1040 1039
// CHECK-NEXT: 1042 slice 25 181 1 1
// CHECK-NEXT: 1043 concat 255 1042 1041
// CHECK-NEXT: 1044 slice 25 181 1 1
// CHECK-NEXT: 1045 concat 258 1044 1043
// CHECK-NEXT: 1046 slice 25 181 1 1
// CHECK-NEXT: 1047 concat 261 1046 1045
// CHECK-NEXT: 1048 slice 25 181 1 1
// CHECK-NEXT: 1049 concat 264 1048 1047
// CHECK-NEXT: 1050 slice 25 181 1 1
// CHECK-NEXT: 1051 concat 267 1050 1049
// CHECK-NEXT: 1052 slice 25 181 1 1
// CHECK-NEXT: 1053 concat 47 1052 1051
// CHECK-NEXT: 1054 slice 25 181 1 1
// CHECK-NEXT: 1055 concat 272 1054 1053
// CHECK-NEXT: 1056 slice 25 181 1 1
// CHECK-NEXT: 1057 concat 275 1056 1055
// CHECK-NEXT: 1058 slice 25 181 1 1
// CHECK-NEXT: 1059 concat 1 1058 1057
// CHECK-NEXT: 1060 slice 25 181 1 1
// CHECK-NEXT: 1061 concat 280 1060 1059
// CHECK-NEXT: 1062 slice 25 181 1 1
// CHECK-NEXT: 1063 concat 3 1062 1061
// CHECK-NEXT: 1064 slice 25 181 1 1
// CHECK-NEXT: 1065 concat 285 1064 1063
// CHECK-NEXT: 1066 slice 25 181 1 1
// CHECK-NEXT: 1067 concat 288 1066 1065
// CHECK-NEXT: 1068 slice 25 181 1 1
// CHECK-NEXT: 1069 concat 291 1068 1067
// CHECK-NEXT: 1070 slice 25 181 1 1
// CHECK-NEXT: 1071 concat 294 1070 1069
// CHECK-NEXT: 1072 slice 25 181 1 1
// CHECK-NEXT: 1073 concat 297 1072 1071
// CHECK-NEXT: 1074 slice 25 181 1 1
// CHECK-NEXT: 1075 concat 300 1074 1073
// CHECK-NEXT: 1076 slice 25 181 1 1
// CHECK-NEXT: 1077 concat 303 1076 1075
// CHECK-NEXT: 1078 slice 25 181 1 1
// CHECK-NEXT: 1079 concat 306 1078 1077
// CHECK-NEXT: 1080 slice 25 181 1 1
// CHECK-NEXT: 1081 concat 309 1080 1079
// CHECK-NEXT: 1082 slice 25 181 1 1
// CHECK-NEXT: 1083 concat 312 1082 1081
// CHECK-NEXT: 1084 slice 25 181 1 1
// CHECK-NEXT: 1085 concat 315 1084 1083
// CHECK-NEXT: 1086 slice 25 181 1 1
// CHECK-NEXT: 1087 concat 318 1086 1085
// CHECK-NEXT: 1088 slice 25 181 1 1
// CHECK-NEXT: 1089 concat 321 1088 1087
// CHECK-NEXT: 1090 slice 25 181 1 1
// CHECK-NEXT: 1091 concat 324 1090 1089
// CHECK-NEXT: 1092 slice 25 181 1 1
// CHECK-NEXT: 1093 concat 327 1092 1091
// CHECK-NEXT: 1094 slice 25 181 1 1
// CHECK-NEXT: 1095 concat 23 1094 1093
// CHECK-NEXT: 1096 slice 227 935 11 0
// CHECK-NEXT: 1097 slice 227 939 11 0
// CHECK-NEXT: 1098 concat 261 1097 1096
// CHECK-NEXT: 1099 slice 227 943 11 0
// CHECK-NEXT: 1100 concat 294 1099 1098
// CHECK-NEXT: 1101 slice 227 947 11 0
// CHECK-NEXT: 1102 concat 23 1101 1100
// CHECK-NEXT: 1103 xor 23 1095 1102
// CHECK-NEXT: 1104 xor 23 1000 1103
// CHECK-NEXT: 1105 not 23 1104
// CHECK-NEXT: 1106 slice 324 476 45 0
// CHECK-NEXT: 1107 not 324 1106
// CHECK-NEXT: 1108 concat 23 1107 186
// CHECK-NEXT: 1109 const 10 10111
// CHECK-NEXT: 1110 eq 25 88 1109
// CHECK-NEXT: 1111 ite 101 1110 419 186
// CHECK-NEXT: 1112 const 10 10110
// CHECK-NEXT: 1113 eq 25 88 1112
// CHECK-NEXT: 1114 ite 101 1113 103 1111
// CHECK-NEXT: 1115 eq 25 88 993
// CHECK-NEXT: 1116 ite 101 1115 190 1114
// CHECK-NEXT: 1117 const 7 1000
// CHECK-NEXT: 1118 uext 10 1117 1
// CHECK-NEXT: 1119 eq 25 88 1118
// CHECK-NEXT: 1120 ite 101 1119 186 1116
// CHECK-NEXT: 1121 eq 25 1120 419
// CHECK-NEXT: 1122 ite 23 1121 1108 68
// CHECK-NEXT: 1123 slice 327 476 46 0
// CHECK-NEXT: 1124 not 327 1123
// CHECK-NEXT: 1125 concat 23 1124 106
// CHECK-NEXT: 1126 eq 25 1120 103
// CHECK-NEXT: 1127 ite 23 1126 1125 1122
// CHECK-NEXT: 1128 uext 101 97 1
// CHECK-NEXT: 1129 eq 25 1120 1128
// CHECK-NEXT: 1130 ite 23 1129 476 1127
// CHECK-NEXT: 1131 const 10 10101
// CHECK-NEXT: 1132 eq 25 91 1131
// CHECK-NEXT: 1133 ite 25 1132 97 106
// CHECK-NEXT: 1134 const 7 1011
// CHECK-NEXT: 1135 uext 10 1134 1
// CHECK-NEXT: 1136 eq 25 91 1135
// CHECK-NEXT: 1137 ite 25 1136 106 1133
// CHECK-NEXT: 1138 ite 23 1137 1130 754
// CHECK-NEXT: 1139 or 23 1105 1138
// CHECK-NEXT: 1140 redand 25 1139
// CHECK-NEXT: 1141 state 25
// CHECK-NEXT: 1142 state 25
// CHECK-NEXT: 1143 state 25
// CHECK-NEXT: 1144 init 25 1143 97
// CHECK-NEXT: 1145 concat 101 100 1143
// CHECK-NEXT: 1146 eq 25 1145 103
// CHECK-NEXT: 1147 ite 25 1146 1142 1141
// CHECK-NEXT: 1148 ite 25 951 1147 1140
// CHECK-NEXT: 1149 not 25 1148
// CHECK-NEXT: 1150 or 23 1104 1138
// CHECK-NEXT: 1151 redand 25 1150
// CHECK-NEXT: 1152 state 25
// CHECK-NEXT: 1153 state 25
// CHECK-NEXT: 1154 state 25
// CHECK-NEXT: 1155 init 25 1154 97
// CHECK-NEXT: 1156 concat 101 100 1154
// CHECK-NEXT: 1157 eq 25 1156 103
// CHECK-NEXT: 1158 ite 25 1157 1153 1152
// CHECK-NEXT: 1159 ite 25 951 1158 1151
// CHECK-NEXT: 1160 not 25 1159
// CHECK-NEXT: 1161 and 25 1149 1160
// CHECK-NEXT: 1162 state 25
// CHECK-NEXT: 1163 state 25
// CHECK-NEXT: 1164 state 25
// CHECK-NEXT: 1165 init 25 1164 97
// CHECK-NEXT: 1166 concat 101 100 1164
// CHECK-NEXT: 1167 eq 25 1166 103
// CHECK-NEXT: 1168 ite 25 1167 1163 1162
// CHECK-NEXT: 1169 ite 25 951 1168 1140
// CHECK-NEXT: 1170 and 25 1161 1169
// CHECK-NEXT: 1171 ite 25 1137 1170 106
// CHECK-NEXT: 1172 output 1171 OVERFLOW 
// CHECK-NEXT: 1173 ite 23 951 338 1103
// CHECK-NEXT: 1174 output 1173 P 
// CHECK-NEXT: 1175 output 1159 PATTERNBDETECT 
// CHECK-NEXT: 1176 output 1148 PATTERNDETECT 
// CHECK-NEXT: 1177 output 1173 PCOUT 
// CHECK-NEXT: 1178 state 25
// CHECK-NEXT: 1179 state 25
// CHECK-NEXT: 1180 state 25
// CHECK-NEXT: 1181 init 25 1180 97
// CHECK-NEXT: 1182 concat 101 100 1180
// CHECK-NEXT: 1183 eq 25 1182 103
// CHECK-NEXT: 1184 ite 25 1183 1179 1178
// CHECK-NEXT: 1185 ite 25 951 1184 1151
// CHECK-NEXT: 1186 and 25 1161 1185
// CHECK-NEXT: 1187 ite 25 1137 1186 106
// CHECK-NEXT: 1188 output 1187 UNDERFLOW 
// CHECK-NEXT: 1189 slice 210 778 5 0
// CHECK-NEXT: 1190 redxor 25 1189
// CHECK-NEXT: 1191 const 10 11000
// CHECK-NEXT: 1192 eq 25 93 1191
// CHECK-NEXT: 1193 ite 25 1192 97 106
// CHECK-NEXT: 1194 const 7 1101
// CHECK-NEXT: 1195 uext 10 1194 1
// CHECK-NEXT: 1196 eq 25 93 1195
// CHECK-NEXT: 1197 ite 25 1196 106 1193
// CHECK-NEXT: 1198 ite 25 1197 1190 106
// CHECK-NEXT: 1199 slice 210 778 11 6
// CHECK-NEXT: 1200 redxor 25 1199
// CHECK-NEXT: 1201 ite 25 1197 1200 106
// CHECK-NEXT: 1202 xor 25 1198 1201
// CHECK-NEXT: 1203 const 10 11010
// CHECK-NEXT: 1204 eq 25 94 1203
// CHECK-NEXT: 1205 ite 25 1204 97 106
// CHECK-NEXT: 1206 const 7 1110
// CHECK-NEXT: 1207 uext 10 1206 1
// CHECK-NEXT: 1208 eq 25 94 1207
// CHECK-NEXT: 1209 ite 25 1208 106 1205
// CHECK-NEXT: 1210 ite 25 1209 1198 1202
// CHECK-NEXT: 1211 slice 210 778 17 12
// CHECK-NEXT: 1212 redxor 25 1211
// CHECK-NEXT: 1213 ite 25 1197 1212 106
// CHECK-NEXT: 1214 slice 210 778 23 18
// CHECK-NEXT: 1215 redxor 25 1214
// CHECK-NEXT: 1216 ite 25 1197 1215 106
// CHECK-NEXT: 1217 xor 25 1213 1216
// CHECK-NEXT: 1218 xor 25 1202 1217
// CHECK-NEXT: 1219 ite 25 1209 1201 1218
// CHECK-NEXT: 1220 ite 25 1209 1213 1217
// CHECK-NEXT: 1221 slice 210 778 29 24
// CHECK-NEXT: 1222 redxor 25 1221
// CHECK-NEXT: 1223 ite 25 1197 1222 106
// CHECK-NEXT: 1224 slice 210 778 35 30
// CHECK-NEXT: 1225 redxor 25 1224
// CHECK-NEXT: 1226 ite 25 1197 1225 106
// CHECK-NEXT: 1227 xor 25 1223 1226
// CHECK-NEXT: 1228 slice 210 778 41 36
// CHECK-NEXT: 1229 redxor 25 1228
// CHECK-NEXT: 1230 ite 25 1197 1229 106
// CHECK-NEXT: 1231 slice 210 778 47 42
// CHECK-NEXT: 1232 redxor 25 1231
// CHECK-NEXT: 1233 ite 25 1197 1232 106
// CHECK-NEXT: 1234 xor 25 1230 1233
// CHECK-NEXT: 1235 xor 25 1227 1234
// CHECK-NEXT: 1236 xor 25 1218 1235
// CHECK-NEXT: 1237 ite 25 1209 1216 1236
// CHECK-NEXT: 1238 ite 25 1209 1223 1227
// CHECK-NEXT: 1239 ite 25 1209 1226 1235
// CHECK-NEXT: 1240 ite 25 1209 1230 1234
// CHECK-NEXT: 1241 concat 101 1219 1210
// CHECK-NEXT: 1242 concat 29 1220 1241
// CHECK-NEXT: 1243 concat 7 1237 1242
// CHECK-NEXT: 1244 concat 10 1238 1243
// CHECK-NEXT: 1245 concat 210 1239 1244
// CHECK-NEXT: 1246 concat 213 1240 1245
// CHECK-NEXT: 1247 concat 216 1233 1246
// CHECK-NEXT: 1248 state 216
// CHECK-NEXT: 1249 state 216
// CHECK-NEXT: 1250 state 25
// CHECK-NEXT: 1251 init 25 1250 97
// CHECK-NEXT: 1252 concat 101 100 1250
// CHECK-NEXT: 1253 eq 25 1252 103
// CHECK-NEXT: 1254 ite 216 1253 1249 1248
// CHECK-NEXT: 1255 ite 216 951 1254 1247
// CHECK-NEXT: 1256 output 1255 XOROUT 
// CHECK-NEXT: 1257 uext 1 105 0 A1_reg 
// CHECK-NEXT: 1258 uext 47 540 0 A2A1 
// CHECK-NEXT: 1259 uext 1 122 0 A2_reg 
// CHECK-NEXT: 1260 uext 101 126 0 ACASCREG_BIN 
// CHECK-NEXT: 1261 uext 3 4 0 ACASCREG_REG 
// CHECK-NEXT: 1262 uext 1 5 0 ACIN_in 
// CHECK-NEXT: 1263 uext 25 617 0 ADREG_BIN 
// CHECK-NEXT: 1264 uext 25 618 0 ADREG_INT 
// CHECK-NEXT: 1265 uext 3 6 0 ADREG_REG 
// CHECK-NEXT: 1266 uext 47 619 0 AD_DATA 
// CHECK-NEXT: 1267 uext 47 616 0 AD_DATA_reg 
// CHECK-NEXT: 1268 uext 47 609 0 AD_in 
// CHECK-NEXT: 1269 uext 25 184 0 ALUMODE10_in 
// CHECK-NEXT: 1270 uext 25 888 0 ALUMODE10_reg 
// CHECK-NEXT: 1271 uext 25 180 0 ALUMODEREG_BIN 
// CHECK-NEXT: 1272 uext 3 9 0 ALUMODEREG_REG 
// CHECK-NEXT: 1273 uext 7 181 0 ALUMODE_DATA 
// CHECK-NEXT: 1274 uext 7 172 0 ALUMODE_in 
// CHECK-NEXT: 1275 uext 7 179 0 ALUMODE_reg 
// CHECK-NEXT: 1276 uext 23 1103 0 ALU_OUT_in 
// CHECK-NEXT: 1277 uext 23 338 0 ALU_OUT_reg 
// CHECK-NEXT: 1278 uext 25 864 0 AMULT26_in 
// CHECK-NEXT: 1279 uext 25 556 0 AMULTSEL_BIN 
// CHECK-NEXT: 1280 uext 238 553 0 AMULTSEL_REG 
// CHECK-NEXT: 1281 uext 101 123 0 AREG_BIN 
// CHECK-NEXT: 1282 uext 3 12 0 AREG_REG 
// CHECK-NEXT: 1283 uext 10 458 2
// CHECK-NEXT: 1284 eq 25 13 1283
// CHECK-NEXT: 1285 ite 101 1284 103 186
// CHECK-NEXT: 1286 uext 10 461 2
// CHECK-NEXT: 1287 eq 25 13 1286
// CHECK-NEXT: 1288 ite 101 1287 190 1285
// CHECK-NEXT: 1289 uext 10 419 3
// CHECK-NEXT: 1290 eq 25 13 1289
// CHECK-NEXT: 1291 ite 101 1290 186 1288
// CHECK-NEXT: 1292 uext 101 1291 0 AUTORESET_PATDET_BIN 
// CHECK-NEXT: 1293 sort bitvec 120
// CHECK-NEXT: 1294 sort bitvec 115
// CHECK-NEXT: 1295 const 1294 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
// CHECK-NEXT: 1296 concat 1293 1295 13
// CHECK-NEXT: 1297 uext 1293 1296 0 AUTORESET_PATDET_REG 
// CHECK-NEXT: 1298 const 10 10000
// CHECK-NEXT: 1299 eq 25 14 1298
// CHECK-NEXT: 1300 ite 25 1299 97 106
// CHECK-NEXT: 1301 uext 10 877 2
// CHECK-NEXT: 1302 eq 25 14 1301
// CHECK-NEXT: 1303 ite 25 1302 106 1300
// CHECK-NEXT: 1304 uext 25 1303 0 AUTORESET_PRIORITY_BIN 
// CHECK-NEXT: 1305 const 291 00000000000000000000000000000000000
// CHECK-NEXT: 1306 concat 306 1305 14
// CHECK-NEXT: 1307 uext 306 1306 0 AUTORESET_PRIORITY_REG 
// CHECK-NEXT: 1308 uext 1 125 0 A_ALU 
// CHECK-NEXT: 1309 uext 25 114 0 A_INPUT_BIN 
// CHECK-NEXT: 1310 sort bitvec 56
// CHECK-NEXT: 1311 sort bitvec 51
// CHECK-NEXT: 1312 const 1311 000000000000000000000000000000000000000000000000000
// CHECK-NEXT: 1313 concat 1310 1312 15
// CHECK-NEXT: 1314 uext 1310 1313 0 A_INPUT_REG 
// CHECK-NEXT: 1315 uext 1 2 0 A_in 
// CHECK-NEXT: 1316 uext 16 136 0 B1_DATA_out 
// CHECK-NEXT: 1317 uext 16 586 0 B2B1 
// CHECK-NEXT: 1318 uext 16 153 0 B2_DATA 
// CHECK-NEXT: 1319 uext 16 150 0 B2_reg 
// CHECK-NEXT: 1320 uext 101 154 0 BCASCREG_BIN 
// CHECK-NEXT: 1321 uext 3 18 0 BCASCREG_REG 
// CHECK-NEXT: 1322 uext 16 19 0 BCIN_in 
// CHECK-NEXT: 1323 uext 25 865 0 BMULT17_in 
// CHECK-NEXT: 1324 uext 25 563 0 BMULTSEL_BIN 
// CHECK-NEXT: 1325 concat 238 552 20
// CHECK-NEXT: 1326 uext 238 1325 0 BMULTSEL_REG 
// CHECK-NEXT: 1327 uext 101 151 0 BREG_BIN 
// CHECK-NEXT: 1328 uext 3 21 0 BREG_REG 
// CHECK-NEXT: 1329 uext 16 153 0 B_ALU 
// CHECK-NEXT: 1330 uext 25 142 0 B_INPUT_BIN 
// CHECK-NEXT: 1331 concat 1310 1312 22
// CHECK-NEXT: 1332 uext 1310 1331 0 B_INPUT_REG 
// CHECK-NEXT: 1333 uext 16 17 0 B_in 
// CHECK-NEXT: 1334 uext 25 26 0 CARRYCASCIN_in 
// CHECK-NEXT: 1335 uext 25 921 0 CARRYINREG_BIN 
// CHECK-NEXT: 1336 uext 3 28 0 CARRYINREG_REG 
// CHECK-NEXT: 1337 uext 25 860 0 CARRYINSELREG_BIN 
// CHECK-NEXT: 1338 uext 3 31 0 CARRYINSELREG_REG 
// CHECK-NEXT: 1339 uext 29 30 0 CARRYINSEL_in 
// CHECK-NEXT: 1340 uext 29 861 0 CARRYINSEL_mux 
// CHECK-NEXT: 1341 uext 29 859 0 CARRYINSEL_reg 
// CHECK-NEXT: 1342 uext 25 913 0 CARRYIN_in 
// CHECK-NEXT: 1343 uext 25 922 0 CARRYIN_mux 
// CHECK-NEXT: 1344 uext 25 920 0 CARRYIN_reg 
// CHECK-NEXT: 1345 uext 25 897 0 CCOUT_in 
// CHECK-NEXT: 1346 uext 25 32 0 CEA1_in 
// CHECK-NEXT: 1347 uext 25 33 0 CEA2_in 
// CHECK-NEXT: 1348 uext 25 34 0 CEAD_in 
// CHECK-NEXT: 1349 uext 25 35 0 CEALUMODE_in 
// CHECK-NEXT: 1350 uext 25 36 0 CEB1_in 
// CHECK-NEXT: 1351 uext 25 37 0 CEB2_in 
// CHECK-NEXT: 1352 uext 25 39 0 CECARRYIN_in 
// CHECK-NEXT: 1353 uext 25 40 0 CECTRL_in 
// CHECK-NEXT: 1354 uext 25 38 0 CEC_in 
// CHECK-NEXT: 1355 uext 25 41 0 CED_in 
// CHECK-NEXT: 1356 uext 25 42 0 CEINMODE_in 
// CHECK-NEXT: 1357 uext 25 43 0 CEM_in 
// CHECK-NEXT: 1358 uext 25 44 0 CEP_in 
// CHECK-NEXT: 1359 uext 25 100 0 CLK_in 
// CHECK-NEXT: 1360 uext 7 980 0 COUT_in 
// CHECK-NEXT: 1361 uext 7 895 0 COUT_reg 
// CHECK-NEXT: 1362 uext 25 475 0 CREG_BIN 
// CHECK-NEXT: 1363 uext 3 46 0 CREG_REG 
// CHECK-NEXT: 1364 uext 23 476 0 C_DATA_in 
// CHECK-NEXT: 1365 uext 23 24 0 C_in 
// CHECK-NEXT: 1366 uext 23 474 0 C_reg 
// CHECK-NEXT: 1367 uext 25 548 0 DREG_BIN 
// CHECK-NEXT: 1368 uext 25 578 0 DREG_INT 
// CHECK-NEXT: 1369 uext 3 49 0 DREG_REG 
// CHECK-NEXT: 1370 uext 47 579 0 D_DATA 
// CHECK-NEXT: 1371 uext 47 581 0 D_DATA_mux 
// CHECK-NEXT: 1372 uext 47 547 0 D_DATA_reg 
// CHECK-NEXT: 1373 uext 47 48 0 D_in 
// CHECK-NEXT: 1374 uext 25 524 0 INMODEREG_BIN 
// CHECK-NEXT: 1375 uext 3 51 0 INMODEREG_REG 
// CHECK-NEXT: 1376 uext 10 516 0 INMODE_in 
// CHECK-NEXT: 1377 uext 10 525 0 INMODE_mux 
// CHECK-NEXT: 1378 uext 10 523 0 INMODE_reg 
// CHECK-NEXT: 1379 uext 7 52 0 IS_ALUMODE_INVERTED_REG 
// CHECK-NEXT: 1380 uext 25 53 0 IS_CARRYIN_INVERTED_REG 
// CHECK-NEXT: 1381 uext 25 54 0 IS_CLK_INVERTED_REG 
// CHECK-NEXT: 1382 uext 10 55 0 IS_INMODE_INVERTED_REG 
// CHECK-NEXT: 1383 uext 56 57 0 IS_OPMODE_INVERTED_REG 
// CHECK-NEXT: 1384 uext 25 58 0 IS_RSTALLCARRYIN_INVERTED_REG 
// CHECK-NEXT: 1385 uext 25 59 0 IS_RSTALUMODE_INVERTED_REG 
// CHECK-NEXT: 1386 uext 25 60 0 IS_RSTA_INVERTED_REG 
// CHECK-NEXT: 1387 uext 25 61 0 IS_RSTB_INVERTED_REG 
// CHECK-NEXT: 1388 uext 25 62 0 IS_RSTCTRL_INVERTED_REG 
// CHECK-NEXT: 1389 uext 25 63 0 IS_RSTC_INVERTED_REG 
// CHECK-NEXT: 1390 uext 25 64 0 IS_RSTD_INVERTED_REG 
// CHECK-NEXT: 1391 uext 25 65 0 IS_RSTINMODE_INVERTED_REG 
// CHECK-NEXT: 1392 uext 25 66 0 IS_RSTM_INVERTED_REG 
// CHECK-NEXT: 1393 uext 25 67 0 IS_RSTP_INVERTED_REG 
// CHECK-NEXT: 1394 uext 23 68 0 MASK_REG 
// CHECK-NEXT: 1395 uext 25 728 0 MREG_BIN 
// CHECK-NEXT: 1396 uext 3 69 0 MREG_REG 
// CHECK-NEXT: 1397 uext 25 70 0 MULTSIGNIN_in 
// CHECK-NEXT: 1398 uext 25 983 0 MULTSIGN_ALU_in 
// CHECK-NEXT: 1399 uext 25 990 0 MULTSIGN_ALU_reg 
// CHECK-NEXT: 1400 uext 25 416 0 OPMODEREG_BIN 
// CHECK-NEXT: 1401 uext 3 72 0 OPMODEREG_REG 
// CHECK-NEXT: 1402 uext 56 408 0 OPMODE_in 
// CHECK-NEXT: 1403 uext 56 417 0 OPMODE_mux 
// CHECK-NEXT: 1404 uext 56 415 0 OPMODE_reg 
// CHECK-NEXT: 1405 uext 23 73 0 PATTERN_REG 
// CHECK-NEXT: 1406 uext 23 74 0 PCIN_in 
// CHECK-NEXT: 1407 uext 25 536 0 PREADDINSEL_BIN 
// CHECK-NEXT: 1408 uext 216 533 0 PREADDINSEL_REG 
// CHECK-NEXT: 1409 uext 47 605 0 PREADD_AB 
// CHECK-NEXT: 1410 uext 25 951 0 PREG_BIN 
// CHECK-NEXT: 1411 uext 3 76 0 PREG_REG 
// CHECK-NEXT: 1412 uext 25 851 0 P_FDBK_47_in 
// CHECK-NEXT: 1413 uext 23 338 0 P_FDBK_in 
// CHECK-NEXT: 1414 uext 23 77 0 RND_REG 
// CHECK-NEXT: 1415 xor 25 79 58
// CHECK-NEXT: 1416 uext 25 1415 0 RSTALLCARRYIN_in 
// CHECK-NEXT: 1417 xor 25 80 59
// CHECK-NEXT: 1418 uext 25 1417 0 RSTALUMODE_in 
// CHECK-NEXT: 1419 xor 25 78 60
// CHECK-NEXT: 1420 uext 25 1419 0 RSTA_in 
// CHECK-NEXT: 1421 xor 25 81 61
// CHECK-NEXT: 1422 uext 25 1421 0 RSTB_in 
// CHECK-NEXT: 1423 xor 25 83 62
// CHECK-NEXT: 1424 uext 25 1423 0 RSTCTRL_in 
// CHECK-NEXT: 1425 xor 25 82 63
// CHECK-NEXT: 1426 uext 25 1425 0 RSTC_in 
// CHECK-NEXT: 1427 xor 25 84 64
// CHECK-NEXT: 1428 uext 25 1427 0 RSTD_in 
// CHECK-NEXT: 1429 xor 25 85 65
// CHECK-NEXT: 1430 uext 25 1429 0 RSTINMODE_in 
// CHECK-NEXT: 1431 xor 25 86 66
// CHECK-NEXT: 1432 uext 25 1431 0 RSTM_in 
// CHECK-NEXT: 1433 xor 25 87 67
// CHECK-NEXT: 1434 uext 25 1433 0 RSTP_in 
// CHECK-NEXT: 1435 uext 101 1120 0 SEL_MASK_BIN 
// CHECK-NEXT: 1436 sort bitvec 112
// CHECK-NEXT: 1437 sort bitvec 107
// CHECK-NEXT: 1438 const 1437 00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
// CHECK-NEXT: 1439 concat 1436 1438 88
// CHECK-NEXT: 1440 uext 1436 1439 0 SEL_MASK_REG 
// CHECK-NEXT: 1441 uext 25 999 0 SEL_PATTERN_BIN 
// CHECK-NEXT: 1442 concat 1310 1312 89
// CHECK-NEXT: 1443 uext 1310 1442 0 SEL_PATTERN_REG 
// CHECK-NEXT: 1444 uext 101 575 0 USE_MULT_BIN 
// CHECK-NEXT: 1445 sort bitvec 64
// CHECK-NEXT: 1446 sort bitvec 59
// CHECK-NEXT: 1447 const 1446 00000000000000000000000000000000000000000000000000000000000
// CHECK-NEXT: 1448 concat 1445 1447 90
// CHECK-NEXT: 1449 uext 1445 1448 0 USE_MULT_REG 
// CHECK-NEXT: 1450 uext 25 1137 0 USE_PATTERN_DETECT_BIN 
// CHECK-NEXT: 1451 sort bitvec 72
// CHECK-NEXT: 1452 sort bitvec 67
// CHECK-NEXT: 1453 const 1452 0000000000000000000000000000000000000000000000000000000000000000000
// CHECK-NEXT: 1454 concat 1451 1453 91
// CHECK-NEXT: 1455 uext 1451 1454 0 USE_PATTERN_DETECT_REG 
// CHECK-NEXT: 1456 uext 101 197 0 USE_SIMD_BIN 
// CHECK-NEXT: 1457 const 315 0000000000000000000000000000000000000000000
// CHECK-NEXT: 1458 concat 23 1457 92
// CHECK-NEXT: 1459 uext 23 1458 0 USE_SIMD_REG 
// CHECK-NEXT: 1460 uext 25 1197 0 USE_WIDEXOR_BIN 
// CHECK-NEXT: 1461 concat 306 1305 93
// CHECK-NEXT: 1462 uext 306 1461 0 USE_WIDEXOR_REG 
// CHECK-NEXT: 1463 uext 321 729 0 U_DATA 
// CHECK-NEXT: 1464 uext 321 732 0 U_DATA_in 
// CHECK-NEXT: 1465 uext 321 727 0 U_DATA_reg 
// CHECK-NEXT: 1466 uext 318 719 0 U_in
// CHECK-NEXT: 1467 uext 321 769 0 V_DATA 
// CHECK-NEXT: 1468 uext 321 770 0 V_DATA_in 
// CHECK-NEXT: 1469 uext 321 768 0 V_DATA_reg 
// CHECK-NEXT: 1470 uext 321 761 0 V_in 
// CHECK-NEXT: 1471 uext 25 1209 0 XORSIMD_BIN 
// CHECK-NEXT: 1472 sort bitvec 88
// CHECK-NEXT: 1473 sort bitvec 83
// CHECK-NEXT: 1474 const 1473 00000000000000000000000000000000000000000000000000000000000000000000000000000000000
// CHECK-NEXT: 1475 concat 1472 1474 94
// CHECK-NEXT: 1476 uext 1472 1475 0 XORSIMD_REG 
// CHECK-NEXT: 1477 uext 216 1247 0 XOR_MX_in 
// CHECK-NEXT: 1478 uext 216 1254 0 XOR_MX_reg 
// CHECK-NEXT: 1479 sort bitvec 49
// CHECK-NEXT: 1480 concat 1479 821 929
// CHECK-NEXT: 1481 uext 1479 1480 0 a_int 
// CHECK-NEXT: 1482 uext 47 620 0 a_mult_mux 
// CHECK-NEXT: 1483 not 25 1303
// CHECK-NEXT: 1484 or 25 1483 44
// CHECK-NEXT: 1485 uext 25 1484 0 auto_reset_pri 
// CHECK-NEXT: 1486 uext 16 658 0 b_mult_mux 
// CHECK-NEXT: 1487 uext 25 867 0 c_mult 
// CHECK-NEXT: 1488 uext 25 43 0 ce_m_g 
// CHECK-NEXT: 1489 uext 25 929 0 cin 
// CHECK-NEXT: 1490 uext 25 926 0 cin_b 
// CHECK-NEXT: 1491 uext 23 783 0 co 
// CHECK-NEXT: 1492 uext 25 843 0 co12_lsb 
// CHECK-NEXT: 1493 uext 25 835 0 co24_lsb 
// CHECK-NEXT: 1494 uext 25 823 0 co36_lsb 
// CHECK-NEXT: 1495 uext 23 787 0 comux 
// CHECK-NEXT: 1496 slice 224 787 10 0
// CHECK-NEXT: 1497 concat 227 789 1496
// CHECK-NEXT: 1498 slice 224 787 22 12
// CHECK-NEXT: 1499 concat 258 1498 1497
// CHECK-NEXT: 1500 concat 261 791 1499
// CHECK-NEXT: 1501 slice 224 787 34 24
// CHECK-NEXT: 1502 concat 291 1501 1500
// CHECK-NEXT: 1503 concat 294 793 1502
// CHECK-NEXT: 1504 slice 227 787 47 36
// CHECK-NEXT: 1505 concat 23 1504 1503
// CHECK-NEXT: 1506 uext 23 1505 0 comux4simd 
// CHECK-NEXT: 1507 uext 23 821 0 comux_w 
// CHECK-NEXT: 1508 uext 25 956 0 cout0 
// CHECK-NEXT: 1509 uext 25 969 0 cout1 
// CHECK-NEXT: 1510 uext 25 975 0 cout2 
// CHECK-NEXT: 1511 uext 25 949 0 cout3 
// CHECK-NEXT: 1512 uext 25 983 0 cout4 
// CHECK-NEXT: 1513 uext 25 963 0 cout_0 
// CHECK-NEXT: 1514 uext 25 970 0 cout_1 
// CHECK-NEXT: 1515 uext 25 976 0 cout_2 
// CHECK-NEXT: 1516 uext 25 949 0 cout_3 
// CHECK-NEXT: 1517 ite 25 43 867 874
// CHECK-NEXT: 1518 uext 25 1517 0 d_carryin_int 
// CHECK-NEXT: 1519 ite 25 1415 106 1517
// CHECK-NEXT: 1520 uext 25 1519 0 dr_carryin_int 
// CHECK-NEXT: 1521 uext 25 106 0 glblGSR 
// CHECK-NEXT: 1522 uext 25 937 0 intc1 
// CHECK-NEXT: 1523 uext 25 941 0 intc2 
// CHECK-NEXT: 1524 uext 25 945 0 intc3 
// CHECK-NEXT: 1525 uext 321 715 0 mult 
// CHECK-NEXT: 1526 uext 25 962 0 mult_or_logic 
// CHECK-NEXT: 1527 uext 25 875 0 multcarryin_data 
// CHECK-NEXT: 1528 uext 25 97 0 opmode_valid_flag_dou 
// CHECK-NEXT: 1529 uext 25 1169 0 overflow_data 
// CHECK-NEXT: 1530 uext 25 1140 0 pdet_o 
// CHECK-NEXT: 1531 uext 25 1148 0 pdet_o_mux 
// CHECK-NEXT: 1532 uext 25 1147 0 pdet_o_reg1 
// CHECK-NEXT: 1533 uext 25 1168 0 pdet_o_reg2 
// CHECK-NEXT: 1534 uext 25 1151 0 pdetb_o 
// CHECK-NEXT: 1535 uext 25 1159 0 pdetb_o_mux 
// CHECK-NEXT: 1536 uext 25 1158 0 pdetb_o_reg1 
// CHECK-NEXT: 1537 uext 25 1184 0 pdetb_o_reg2 
// CHECK-NEXT: 1538 const 318 01010101010101010101010101010101010101010101
// CHECK-NEXT: 1539 uext 318 1538 0 ps_u_mask 
// CHECK-NEXT: 1540 uext 318 757 0 ps_v_mask 
// CHECK-NEXT: 1541 uext 25 874 0 qmultcarryin 
// CHECK-NEXT: 1542 uext 25 1415 0 rst_carryin_g 
// CHECK-NEXT: 1543 uext 23 778 0 s 
// CHECK-NEXT: 1544 uext 230 935 0 s0 
// CHECK-NEXT: 1545 uext 230 939 0 s1 
// CHECK-NEXT: 1546 uext 230 943 0 s2 
// CHECK-NEXT: 1547 uext 185 947 0 s3 
// CHECK-NEXT: 1548 uext 23 785 0 smux 
// CHECK-NEXT: 1549 uext 23 828 0 smux_w 
// CHECK-NEXT: 1550 and 25 1484 1169
// CHECK-NEXT: 1551 and 25 1550 1149
// CHECK-NEXT: 1552 eq 25 1291 103
// CHECK-NEXT: 1553 ite 25 1552 1551 106
// CHECK-NEXT: 1554 and 25 1484 1148
// CHECK-NEXT: 1555 uext 101 97 1
// CHECK-NEXT: 1556 eq 25 1291 1555
// CHECK-NEXT: 1557 ite 25 1556 1554 1553
// CHECK-NEXT: 1558 uext 25 1557 0 the_auto_reset_patdet 
// CHECK-NEXT: 1559 uext 23 1138 0 the_mask 
// CHECK-NEXT: 1560 uext 23 1000 0 the_pattern 
// CHECK-NEXT: 1561 uext 25 1185 0 underflow_data 
// CHECK-NEXT: 1562 uext 23 817 0 wmux 
// CHECK-NEXT: 1563 uext 101 743 0 x_mac_cascd
// CHECK-NEXT: 1564 uext 23 748 0 xmux 
// CHECK-NEXT: 1565 uext 25 1198 0 xor_12a 
// CHECK-NEXT: 1566 uext 25 1201 0 xor_12b 
// CHECK-NEXT: 1567 uext 25 1213 0 xor_12c 
// CHECK-NEXT: 1568 uext 25 1216 0 xor_12d 
// CHECK-NEXT: 1569 uext 25 1223 0 xor_12e 
// CHECK-NEXT: 1570 uext 25 1226 0 xor_12f 
// CHECK-NEXT: 1571 uext 25 1230 0 xor_12g 
// CHECK-NEXT: 1572 uext 25 1233 0 xor_12h 
// CHECK-NEXT: 1573 uext 25 1202 0 xor_24a 
// CHECK-NEXT: 1574 uext 25 1217 0 xor_24b 
// CHECK-NEXT: 1575 uext 25 1227 0 xor_24c 
// CHECK-NEXT: 1576 uext 25 1234 0 xor_24d 
// CHECK-NEXT: 1577 uext 25 1218 0 xor_48a 
// CHECK-NEXT: 1578 uext 25 1235 0 xor_48b 
// CHECK-NEXT: 1579 uext 25 1236 0 xor_96 
// CHECK-NEXT: 1580 uext 23 777 0 ymux 
// CHECK-NEXT: 1581 uext 23 487 0 z_optinv 
// CHECK-NEXT: 1582 uext 23 486 0 zmux 
// CHECK-NEXT: 1583 next 1 95 105
// CHECK-NEXT: 1584 ite 1 32 115 105
// CHECK-NEXT: 1585 const 1 000000000000000000000000000000
// CHECK-NEXT: 1586 redor 25 123
// CHECK-NEXT: 1587 not 25 1586
// CHECK-NEXT: 1588 or 25 1419 1587
// CHECK-NEXT: 1589 ite 1 1588 1585 1584
// CHECK-NEXT: 1590 next 1 96 1589
// CHECK-NEXT: 1591 next 25 98 100
// CHECK-NEXT: 1592 next 1 116 122
// CHECK-NEXT: 1593 eq 25 123 103
// CHECK-NEXT: 1594 ite 1 1593 105 115
// CHECK-NEXT: 1595 ite 1 33 1594 122
// CHECK-NEXT: 1596 ite 1 1588 1585 1595
// CHECK-NEXT: 1597 next 1 117 1596
// CHECK-NEXT: 1598 next 25 118 100
// CHECK-NEXT: 1599 next 16 130 136
// CHECK-NEXT: 1600 ite 16 36 143 136
// CHECK-NEXT: 1601 redor 25 151
// CHECK-NEXT: 1602 not 25 1601
// CHECK-NEXT: 1603 or 25 1421 1602
// CHECK-NEXT: 1604 ite 16 1603 584 1600
// CHECK-NEXT: 1605 next 16 131 1604
// CHECK-NEXT: 1606 next 25 132 100
// CHECK-NEXT: 1607 next 16 144 150
// CHECK-NEXT: 1608 eq 25 151 103
// CHECK-NEXT: 1609 ite 16 1608 136 143
// CHECK-NEXT: 1610 ite 16 37 1609 150
// CHECK-NEXT: 1611 ite 16 1421 584 1610
// CHECK-NEXT: 1612 next 16 145 1611
// CHECK-NEXT: 1613 next 25 146 100
// CHECK-NEXT: 1614 next 7 173 179
// CHECK-NEXT: 1615 ite 7 35 172 179
// CHECK-NEXT: 1616 const 7 0000
// CHECK-NEXT: 1617 ite 7 1417 1616 1615
// CHECK-NEXT: 1618 next 7 174 1617
// CHECK-NEXT: 1619 next 25 175 100
// CHECK-NEXT: 1620 next 23 332 338
// CHECK-NEXT: 1621 and 25 44 951
// CHECK-NEXT: 1622 ite 23 1621 1103 338
// CHECK-NEXT: 1623 or 25 1433 1557
// CHECK-NEXT: 1624 ite 23 1623 483 1622
// CHECK-NEXT: 1625 next 23 333 1624
// CHECK-NEXT: 1626 next 25 334 100
// CHECK-NEXT: 1627 next 56 409 415
// CHECK-NEXT: 1628 ite 56 40 408 415
// CHECK-NEXT: 1629 const 56 000000000
// CHECK-NEXT: 1630 ite 56 1423 1629 1628
// CHECK-NEXT: 1631 next 56 410 1630
// CHECK-NEXT: 1632 next 25 411 100
// CHECK-NEXT: 1633 next 23 468 474
// CHECK-NEXT: 1634 ite 23 38 24 474
// CHECK-NEXT: 1635 not 25 475
// CHECK-NEXT: 1636 or 25 1425 1635
// CHECK-NEXT: 1637 ite 23 1636 483 1634
// CHECK-NEXT: 1638 next 23 469 1637
// CHECK-NEXT: 1639 next 25 470 100
// CHECK-NEXT: 1640 next 10 517 523
// CHECK-NEXT: 1641 ite 10 42 516 523
// CHECK-NEXT: 1642 const 10 00000
// CHECK-NEXT: 1643 not 25 524
// CHECK-NEXT: 1644 or 25 1429 1643
// CHECK-NEXT: 1645 ite 10 1644 1642 1641
// CHECK-NEXT: 1646 next 10 518 1645
// CHECK-NEXT: 1647 next 25 519 100
// CHECK-NEXT: 1648 next 47 541 547
// CHECK-NEXT: 1649 ite 47 41 48 547
// CHECK-NEXT: 1650 not 25 578
// CHECK-NEXT: 1651 or 25 1427 1650
// CHECK-NEXT: 1652 ite 47 1651 528 1649
// CHECK-NEXT: 1653 next 47 542 1652
// CHECK-NEXT: 1654 next 25 543 100
// CHECK-NEXT: 1655 next 47 610 616
// CHECK-NEXT: 1656 ite 47 34 609 616
// CHECK-NEXT: 1657 ite 47 1427 528 1656
// CHECK-NEXT: 1658 next 47 611 1657
// CHECK-NEXT: 1659 next 25 612 100
// CHECK-NEXT: 1660 next 321 721 727
// CHECK-NEXT: 1661 ite 321 43 720 727
// CHECK-NEXT: 1662 not 25 728
// CHECK-NEXT: 1663 or 25 1431 1662
// CHECK-NEXT: 1664 ite 321 1663 714 1661
// CHECK-NEXT: 1665 next 321 722 1664
// CHECK-NEXT: 1666 next 25 723 100
// CHECK-NEXT: 1667 next 321 762 768
// CHECK-NEXT: 1668 ite 321 43 761 768
// CHECK-NEXT: 1669 ite 321 1663 714 1668
// CHECK-NEXT: 1670 next 321 763 1669
// CHECK-NEXT: 1671 next 25 764 100
// CHECK-NEXT: 1672 next 29 853 859
// CHECK-NEXT: 1673 ite 29 40 30 859
// CHECK-NEXT: 1674 ite 29 1423 532 1673
// CHECK-NEXT: 1675 next 29 854 1674
// CHECK-NEXT: 1676 next 25 855 100
// CHECK-NEXT: 1677 next 25 868 874
// CHECK-NEXT: 1678 next 25 869 1519
// CHECK-NEXT: 1679 next 25 870 100
// CHECK-NEXT: 1680 next 25 882 888
// CHECK-NEXT: 1681 ite 25 1621 184 888
// CHECK-NEXT: 1682 ite 25 1623 106 1681
// CHECK-NEXT: 1683 next 25 883 1682
// CHECK-NEXT: 1684 next 25 884 100
// CHECK-NEXT: 1685 next 7 889 895
// CHECK-NEXT: 1686 ite 7 1621 980 895
// CHECK-NEXT: 1687 ite 7 1623 1616 1686
// CHECK-NEXT: 1688 next 7 890 1687
// CHECK-NEXT: 1689 next 25 891 100
// CHECK-NEXT: 1690 next 25 914 920
// CHECK-NEXT: 1691 ite 25 39 913 920
// CHECK-NEXT: 1692 ite 25 1415 106 1691
// CHECK-NEXT: 1693 next 25 915 1692
// CHECK-NEXT: 1694 next 25 916 100
// CHECK-NEXT: 1695 next 25 984 990
// CHECK-NEXT: 1696 ite 25 1621 983 990
// CHECK-NEXT: 1697 ite 25 1623 106 1696
// CHECK-NEXT: 1698 next 25 985 1697
// CHECK-NEXT: 1699 next 25 986 100
// CHECK-NEXT: 1700 next 25 1141 1147
// CHECK-NEXT: 1701 ite 25 1621 1140 1147
// CHECK-NEXT: 1702 ite 25 1623 106 1701
// CHECK-NEXT: 1703 next 25 1142 1702
// CHECK-NEXT: 1704 next 25 1143 100
// CHECK-NEXT: 1705 next 25 1152 1158
// CHECK-NEXT: 1706 ite 25 1621 1151 1158
// CHECK-NEXT: 1707 ite 25 1623 106 1706
// CHECK-NEXT: 1708 next 25 1153 1707
// CHECK-NEXT: 1709 next 25 1154 100
// CHECK-NEXT: 1710 next 25 1162 1168
// CHECK-NEXT: 1711 ite 25 1621 1147 1168
// CHECK-NEXT: 1712 ite 25 1623 106 1711
// CHECK-NEXT: 1713 next 25 1163 1712
// CHECK-NEXT: 1714 next 25 1164 100
// CHECK-NEXT: 1715 next 25 1178 1184
// CHECK-NEXT: 1716 ite 25 1621 1158 1184
// CHECK-NEXT: 1717 ite 25 1623 106 1716
// CHECK-NEXT: 1718 next 25 1179 1717
// CHECK-NEXT: 1719 next 25 1180 100
// CHECK-NEXT: 1720 next 216 1248 1254
// CHECK-NEXT: 1721 ite 216 1621 1247 1254
// CHECK-NEXT: 1722 const 216 00000000
// CHECK-NEXT: 1723 ite 216 1623 1722 1721
// CHECK-NEXT: 1724 next 216 1249 1723
// CHECK-NEXT: 1725 next 25 1250 100
// CHECK-NEXT: ; end of yosys output
