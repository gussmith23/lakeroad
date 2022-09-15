// RUN: python3 $LAKEROAD_DIR/bin/convert_module_to_btor.py \
// RUN:   --infile %s --top LUT4 --remove-lines-with '$finish' \
// RUN:   --define XIL_XECLIB | FileCheck %s

///////////////////////////////////////////////////////////////////////////////
//    Copyright (c) 1995/2016 Xilinx, Inc.
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
// /___/  \  /    Vendor      : Xilinx
// \   \   \/     Version     : 2017.1
//  \   \         Description : Xilinx Unified Simulation Library Component
//  /   /                  4-Bit Look-Up Table
// /___/   /\     Filename : LUT4.v
// \   \  /  \
//  \___\/\___\
//
///////////////////////////////////////////////////////////////////////////////
//  Revision:
//    03/23/04 - Initial version.
//    02/04/05 - Replace primitive with function; Remove buf.
//    03/11/05 - Add LOC Parameter
//    06/04/07 - Add wire declaration to internal signal.
//    12/13/11 - 524859 - Added `celldefine and `endcelldefine
//    09/12/16 - ANSI ports, speed improvements
//  End Revision:
///////////////////////////////////////////////////////////////////////////////

`timescale 1 ps/1 ps

`celldefine

module LUT4 #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter [15:0] INIT = 16'h0000
)(
  output O,

  input I0,
  input I1,
  input I2,
  input I3
);

// define constants
  localparam MODULE_NAME = "LUT4";

  reg trig_attr = 1'b0;
// include dynamic registers - XILINX test only
`ifdef XIL_DR
  `include "LUT4_dr.v"
`else
  reg [15:0] INIT_REG = INIT;
`endif

// begin behavioral model

  reg O_out;

  assign O = O_out;

  function lut_mux4_f;
  input [3:0] d;
  input [1:0] s;
  begin
    if (((s[1]^s[0]) === 1'b1) || ((s[1]^s[0]) === 1'b0))
      lut_mux4_f = d[s];
    else if ( ~(|d) || &d)
      lut_mux4_f = d[0];
    else if (((s[0] === 1'b1) || (s[0] === 1'b0)) && (d[{1'b0,s[0]}] === d[{1'b1,s[0]}]))
      lut_mux4_f = d[{1'b0,s[0]}];
    else if (((s[1] === 1'b1) || (s[1] === 1'b0)) && (d[{s[1],1'b0}] === d[{s[1],1'b1}]))
      lut_mux4_f = d[{s[1],1'b0}];
    else
      lut_mux4_f = 1'bx;
  end
  endfunction

 always @(I0 or I1 or I2 or I3)  begin
   if ( (I0 ^ I1  ^ I2 ^ I3) === 1'b0 || (I0 ^ I1  ^ I2 ^ I3) === 1'b1)
    O_out = INIT_REG[{I3, I2, I1, I0}];
   else if ( ~(|INIT_REG) || &INIT_REG )
    O_out = INIT_REG[0];
   else
    O_out = lut_mux4_f ({lut_mux4_f (INIT_REG[15:12], {I1, I0}),
                     lut_mux4_f ( INIT_REG[11:8], {I1, I0}),
                     lut_mux4_f (  INIT_REG[7:4], {I1, I0}),
                     lut_mux4_f (  INIT_REG[3:0], {I1, I0})}, {I3, I2});
  end

// end behavioral model

`ifdef XIL_TIMING
  specify
	(I0 => O) = (0:0:0, 0:0:0);
	(I1 => O) = (0:0:0, 0:0:0);
	(I2 => O) = (0:0:0, 0:0:0);
	(I3 => O) = (0:0:0, 0:0:0);
	specparam PATHPULSE$ = 0;
  endspecify
`endif

endmodule

`endcelldefine

// CHECK: 1 sort bitvec 1
// CHECK: 2 input 1 I0 
// CHECK: 3 input 1 I1 
// CHECK: 4 input 1 I2 
// CHECK: 5 input 1 I3 
// CHECK: 6 sort bitvec 16
// CHECK: 7 input 6 INIT 
// CHECK: 8 input 1
// CHECK: 9 sort bitvec 4
// CHECK: 10 input 1
// CHECK: 11 slice 9 7 3 0
// CHECK: 12 const 1 0
// CHECK: 13 sort bitvec 2
// CHECK: 14 concat 13 3 12
// CHECK: 15 uext 9 14 2
// CHECK: 16 srl 9 11 15
// CHECK: 17 slice 1 16 0 0
// CHECK: 18 const 1 1
// CHECK: 19 eq 1 3 18
// CHECK: 20 eq 1 3 12
// CHECK: 21 or 1 19 20
// CHECK: 22 concat 13 3 18
// CHECK: 23 uext 9 22 2
// CHECK: 24 srl 9 11 23
// CHECK: 25 slice 1 24 0 0
// CHECK: 26 eq 1 17 25
// CHECK: 27 and 1 21 26
// CHECK: 28 ite 1 27 17 10
// CHECK: 29 uext 9 2 3
// CHECK: 30 srl 9 11 29
// CHECK: 31 slice 1 30 0 0
// CHECK: 32 eq 1 2 18
// CHECK: 33 eq 1 2 12
// CHECK: 34 or 1 32 33
// CHECK: 35 concat 13 18 2
// CHECK: 36 uext 9 35 2
// CHECK: 37 srl 9 11 36
// CHECK: 38 slice 1 37 0 0
// CHECK: 39 eq 1 31 38
// CHECK: 40 and 1 34 39
// CHECK: 41 ite 1 40 31 28
// CHECK: 42 slice 1 7 0 0
// CHECK: 43 redor 1 11
// CHECK: 44 not 1 43
// CHECK: 45 redand 1 11
// CHECK: 46 or 1 44 45
// CHECK: 47 ite 1 46 42 41
// CHECK: 48 concat 13 3 2
// CHECK: 49 uext 9 48 2
// CHECK: 50 srl 9 11 49
// CHECK: 51 slice 1 50 0 0
// CHECK: 52 xor 1 3 2
// CHECK: 53 eq 1 52 18
// CHECK: 54 eq 1 52 12
// CHECK: 55 or 1 53 54
// CHECK: 56 ite 1 55 51 47
// CHECK: 57 input 1
// CHECK: 58 redor 1 7
// CHECK: 59 not 1 58
// CHECK: 60 redand 1 7
// CHECK: 61 or 1 59 60
// CHECK: 62 ite 1 61 57 56
// CHECK: 63 input 1
// CHECK: 64 xor 1 52 4
// CHECK: 65 xor 1 64 5
// CHECK: 66 eq 1 65 12
// CHECK: 67 eq 1 65 18
// CHECK: 68 or 1 66 67
// CHECK: 69 ite 1 68 63 62
// CHECK: 70 input 1
// CHECK: 71 slice 9 7 7 4
// CHECK: 72 uext 9 14 2
// CHECK: 73 srl 9 71 72
// CHECK: 74 slice 1 73 0 0
// CHECK: 75 uext 9 22 2
// CHECK: 76 srl 9 71 75
// CHECK: 77 slice 1 76 0 0
// CHECK: 78 eq 1 74 77
// CHECK: 79 and 1 21 78
// CHECK: 80 ite 1 79 74 70
// CHECK: 81 uext 9 2 3
// CHECK: 82 srl 9 71 81
// CHECK: 83 slice 1 82 0 0
// CHECK: 84 uext 9 35 2
// CHECK: 85 srl 9 71 84
// CHECK: 86 slice 1 85 0 0
// CHECK: 87 eq 1 83 86
// CHECK: 88 and 1 34 87
// CHECK: 89 ite 1 88 83 80
// CHECK: 90 slice 1 7 4 4
// CHECK: 91 redor 1 71
// CHECK: 92 not 1 91
// CHECK: 93 redand 1 71
// CHECK: 94 or 1 92 93
// CHECK: 95 ite 1 94 90 89
// CHECK: 96 uext 9 48 2
// CHECK: 97 srl 9 71 96
// CHECK: 98 slice 1 97 0 0
// CHECK: 99 ite 1 55 98 95
// CHECK: 100 input 1
// CHECK: 101 ite 1 61 100 99
// CHECK: 102 input 1
// CHECK: 103 ite 1 68 102 101
// CHECK: 104 input 1
// CHECK: 105 slice 9 7 11 8
// CHECK: 106 uext 9 14 2
// CHECK: 107 srl 9 105 106
// CHECK: 108 slice 1 107 0 0
// CHECK: 109 uext 9 22 2
// CHECK: 110 srl 9 105 109
// CHECK: 111 slice 1 110 0 0
// CHECK: 112 eq 1 108 111
// CHECK: 113 and 1 21 112
// CHECK: 114 ite 1 113 108 104
// CHECK: 115 uext 9 2 3
// CHECK: 116 srl 9 105 115
// CHECK: 117 slice 1 116 0 0
// CHECK: 118 uext 9 35 2
// CHECK: 119 srl 9 105 118
// CHECK: 120 slice 1 119 0 0
// CHECK: 121 eq 1 117 120
// CHECK: 122 and 1 34 121
// CHECK: 123 ite 1 122 117 114
// CHECK: 124 slice 1 7 8 8
// CHECK: 125 redor 1 105
// CHECK: 126 not 1 125
// CHECK: 127 redand 1 105
// CHECK: 128 or 1 126 127
// CHECK: 129 ite 1 128 124 123
// CHECK: 130 uext 9 48 2
// CHECK: 131 srl 9 105 130
// CHECK: 132 slice 1 131 0 0
// CHECK: 133 ite 1 55 132 129
// CHECK: 134 input 1
// CHECK: 135 ite 1 61 134 133
// CHECK: 136 input 1
// CHECK: 137 ite 1 68 136 135
// CHECK: 138 input 1
// CHECK: 139 slice 9 7 15 12
// CHECK: 140 uext 9 14 2
// CHECK: 141 srl 9 139 140
// CHECK: 142 slice 1 141 0 0
// CHECK: 143 uext 9 22 2
// CHECK: 144 srl 9 139 143
// CHECK: 145 slice 1 144 0 0
// CHECK: 146 eq 1 142 145
// CHECK: 147 and 1 21 146
// CHECK: 148 ite 1 147 142 138
// CHECK: 149 uext 9 2 3
// CHECK: 150 srl 9 139 149
// CHECK: 151 slice 1 150 0 0
// CHECK: 152 uext 9 35 2
// CHECK: 153 srl 9 139 152
// CHECK: 154 slice 1 153 0 0
// CHECK: 155 eq 1 151 154
// CHECK: 156 and 1 34 155
// CHECK: 157 ite 1 156 151 148
// CHECK: 158 slice 1 7 12 12
// CHECK: 159 redor 1 139
// CHECK: 160 not 1 159
// CHECK: 161 redand 1 139
// CHECK: 162 or 1 160 161
// CHECK: 163 ite 1 162 158 157
// CHECK: 164 uext 9 48 2
// CHECK: 165 srl 9 139 164
// CHECK: 166 slice 1 165 0 0
// CHECK: 167 ite 1 55 166 163
// CHECK: 168 input 1
// CHECK: 169 ite 1 61 168 167
// CHECK: 170 input 1
// CHECK: 171 ite 1 68 170 169
// CHECK: 172 concat 13 103 69
// CHECK: 173 sort bitvec 3
// CHECK: 174 concat 173 137 172
// CHECK: 175 concat 9 171 174
// CHECK: 176 concat 13 5 12
// CHECK: 177 uext 9 176 2
// CHECK: 178 srl 9 175 177
// CHECK: 179 slice 1 178 0 0
// CHECK: 180 eq 1 5 18
// CHECK: 181 eq 1 5 12
// CHECK: 182 or 1 180 181
// CHECK: 183 concat 13 5 18
// CHECK: 184 uext 9 183 2
// CHECK: 185 srl 9 175 184
// CHECK: 186 slice 1 185 0 0
// CHECK: 187 eq 1 179 186
// CHECK: 188 and 1 182 187
// CHECK: 189 ite 1 188 179 8
// CHECK: 190 uext 9 4 3
// CHECK: 191 srl 9 175 190
// CHECK: 192 slice 1 191 0 0
// CHECK: 193 eq 1 4 18
// CHECK: 194 eq 1 4 12
// CHECK: 195 or 1 193 194
// CHECK: 196 concat 13 18 4
// CHECK: 197 uext 9 196 2
// CHECK: 198 srl 9 175 197
// CHECK: 199 slice 1 198 0 0
// CHECK: 200 eq 1 192 199
// CHECK: 201 and 1 195 200
// CHECK: 202 ite 1 201 192 189
// CHECK: 203 redor 1 175
// CHECK: 204 not 1 203
// CHECK: 205 redand 1 175
// CHECK: 206 or 1 204 205
// CHECK: 207 ite 1 206 69 202
// CHECK: 208 concat 13 5 4
// CHECK: 209 uext 9 208 2
// CHECK: 210 srl 9 175 209
// CHECK: 211 slice 1 210 0 0
// CHECK: 212 xor 1 5 4
// CHECK: 213 eq 1 212 18
// CHECK: 214 eq 1 212 12
// CHECK: 215 or 1 213 214
// CHECK: 216 ite 1 215 211 207
// CHECK: 217 ite 1 61 42 216
// CHECK: 218 concat 13 3 2
// CHECK: 219 concat 173 4 218
// CHECK: 220 concat 9 5 219
// CHECK: 221 uext 6 220 12
// CHECK: 222 srl 6 7 221
// CHECK: 223 slice 1 222 0 0
// CHECK: 224 ite 1 68 223 217
// CHECK: 225 output 224 O 
