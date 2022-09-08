// RUN: python3 $LAKEROAD_DIR/bin/convert_module_to_btor.py \
// RUN:   --infile %s --top LUT6_2 --remove-lines-with '$finish' \
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
//  /   /                  6-Bit Look-Up Table with Two Outputs
// /___/   /\     Filename : LUT6_2.v
// \   \  /  \
//  \___\/\___\
//
///////////////////////////////////////////////////////////////////////////////
//  Revision:
//    08/08/06 - Initial version.
//    06/04/07 - Change timescale form 100ps/10ps to 1ps/1ps.
//               Add wire definition.
//    06/19/07 - 441956 - Add LOC Parameter
//    12/13/11 - 524859 - Added `celldefine and `endcelldefine
//    09/12/16 - ANSI ports, speed improvements
//  End Revision:
///////////////////////////////////////////////////////////////////////////////

`timescale 1 ps/1 ps

`celldefine

module LUT6_2 #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter [63:0] INIT = 64'h0000000000000000
)(
  output O5,
  output O6,

  input I0,
  input I1,
  input I2,
  input I3,
  input I4,
  input I5
);

// define constants
  localparam MODULE_NAME = "LUT6_2";

  reg trig_attr = 1'b0;
// include dynamic registers - XILINX test only
`ifdef XIL_DR
  `include "LUT6_2_dr.v"
`else
  reg [63:0] INIT_REG = INIT;
`endif

// begin behavioral model

  reg O5_out;
  reg O6_out;

  assign O5 = O5_out;
  assign O6 = O6_out;

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

  function lut_mux8_f;
  input [7:0] d;
  input [2:0] s;
  begin
    if (((s[2]^s[1]^s[0]) === 1'b1) || ((s[2]^s[1]^s[0]) === 1'b0))
      lut_mux8_f = d[s];
    else if ( ~(|d) || &d)
      lut_mux8_f = d[0];
    else if ((((s[1]^s[0]) === 1'b1) || ((s[1]^s[0]) === 1'b0)) &&
             (d[{1'b0,s[1:0]}] === d[{1'b1,s[1:0]}]))
      lut_mux8_f = d[{1'b0,s[1:0]}];
    else if ((((s[2]^s[0]) === 1'b1) || ((s[2]^s[0]) === 1'b0)) &&
             (d[{s[2],1'b0,s[0]}] === d[{s[2],1'b1,s[0]}]))
      lut_mux8_f = d[{s[2],1'b0,s[0]}];
    else if ((((s[2]^s[1]) === 1'b1) || ((s[2]^s[1]) === 1'b0)) &&
             (d[{s[2],s[1],1'b0}] === d[{s[2],s[1],1'b1}]))
      lut_mux8_f = d[{s[2:1],1'b0}];
    else if (((s[0] === 1'b1) || (s[0] === 1'b0)) &&
             (d[{1'b0,1'b0,s[0]}] === d[{1'b0,1'b1,s[0]}]) &&
             (d[{1'b0,1'b0,s[0]}] === d[{1'b1,1'b0,s[0]}]) &&
             (d[{1'b0,1'b0,s[0]}] === d[{1'b1,1'b1,s[0]}]))
      lut_mux8_f = d[{1'b0,1'b0,s[0]}];
    else if (((s[1] === 1'b1) || (s[1] === 1'b0)) &&
             (d[{1'b0,s[1],1'b0}] === d[{1'b0,s[1],1'b1}]) &&
             (d[{1'b0,s[1],1'b0}] === d[{1'b1,s[1],1'b0}]) &&
             (d[{1'b0,s[1],1'b0}] === d[{1'b1,s[1],1'b1}]))
      lut_mux8_f = d[{1'b0,s[1],1'b0}];
    else if (((s[2] === 1'b1) || (s[2] === 1'b0)) &&
             (d[{s[2],1'b0,1'b0}] === d[{s[2],1'b0,1'b1}]) &&
             (d[{s[2],1'b0,1'b0}] === d[{s[2],1'b1,1'b0}]) &&
             (d[{s[2],1'b0,1'b0}] === d[{s[2],1'b1,1'b1}]))
      lut_mux8_f = d[{s[2],1'b0,1'b0}];
    else
      lut_mux8_f = 1'bx;
  end
  endfunction

 always @(I0 or I1 or I2 or I3 or I4)  begin
   if ( (I0 ^ I1 ^ I2 ^ I3 ^ I4) === 1'b0 || (I0 ^ I1 ^ I2 ^ I3 ^ I4) === 1'b1)
     O5_out = INIT_REG[{I4, I3, I2, I1, I0}];
   else if ( ~(|INIT_REG[31:0]) || &INIT_REG[31:0] )
     O5_out = INIT_REG[0];
   else
     O5_out = lut_mux4_f ({lut_mux8_f (INIT_REG[31:24], {I2, I1, I0}),
                       lut_mux8_f (INIT_REG[23:16], {I2, I1, I0}),
                       lut_mux8_f ( INIT_REG[15:8], {I2, I1, I0}),
                       lut_mux8_f (  INIT_REG[7:0], {I2, I1, I0})}, {I4, I3});
 end

 always @(I0 or I1 or I2 or I3 or I4 or I5)  begin
   if ( (I0 ^ I1 ^ I2 ^ I3 ^ I4 ^ I5) === 1'b0 || (I0 ^ I1 ^ I2 ^ I3 ^ I4 ^ I5) === 1'b1)
     O6_out = INIT_REG[{I5, I4, I3, I2, I1, I0}];
   else if ( ~(|INIT_REG) || &INIT_REG )
     O6_out = INIT_REG[0];
   else
     O6_out = lut_mux8_f ({lut_mux8_f (INIT_REG[63:56], {I2, I1, I0}),
                       lut_mux8_f (INIT_REG[55:48], {I2, I1, I0}),
                       lut_mux8_f (INIT_REG[47:40], {I2, I1, I0}),
                       lut_mux8_f (INIT_REG[39:32], {I2, I1, I0}),
                       lut_mux8_f (INIT_REG[31:24], {I2, I1, I0}),
                       lut_mux8_f (INIT_REG[23:16], {I2, I1, I0}),
                       lut_mux8_f ( INIT_REG[15:8], {I2, I1, I0}),
                       lut_mux8_f (  INIT_REG[7:0], {I2, I1, I0})}, {I5, I4, I3});
 end

// end behavioral model

`ifdef XIL_TIMING
  specify
   (I0 => O5) = (0:0:0, 0:0:0);
   (I1 => O5) = (0:0:0, 0:0:0);
   (I2 => O5) = (0:0:0, 0:0:0);
   (I3 => O5) = (0:0:0, 0:0:0);
   (I4 => O5) = (0:0:0, 0:0:0);
   (I0 => O6) = (0:0:0, 0:0:0);
   (I1 => O6) = (0:0:0, 0:0:0);
   (I2 => O6) = (0:0:0, 0:0:0);
   (I3 => O6) = (0:0:0, 0:0:0);
   (I4 => O6) = (0:0:0, 0:0:0);
   (I5 => O6) = (0:0:0, 0:0:0);
	specparam PATHPULSE$ = 0;
  endspecify
`endif

endmodule

`endcelldefine

// CHECK: ; BTOR description generated by Yosys
// CHECK-NEXT: 1 sort bitvec 1
// CHECK-NEXT: 2 input 1 I0 
// CHECK-NEXT: 3 input 1 I1 
// CHECK-NEXT: 4 input 1 I2 
// CHECK-NEXT: 5 input 1 I3 
// CHECK-NEXT: 6 input 1 I4 
// CHECK-NEXT: 7 input 1 I5 
// CHECK-NEXT: 8 sort bitvec 64
// CHECK-NEXT: 9 input 8 INIT 
// CHECK-NEXT: 10 input 1
// CHECK-NEXT: 11 sort bitvec 4
// CHECK-NEXT: 12 input 1
// CHECK-NEXT: 13 sort bitvec 8
// CHECK-NEXT: 14 slice 13 9 7 0
// CHECK-NEXT: 15 sort bitvec 2
// CHECK-NEXT: 16 const 15 00
// CHECK-NEXT: 17 sort bitvec 3
// CHECK-NEXT: 18 concat 17 4 16
// CHECK-NEXT: 19 uext 13 18 5
// CHECK-NEXT: 20 srl 13 14 19
// CHECK-NEXT: 21 slice 1 20 0 0
// CHECK-NEXT: 22 const 1 1
// CHECK-NEXT: 23 eq 1 4 22
// CHECK-NEXT: 24 const 1 0
// CHECK-NEXT: 25 eq 1 4 24
// CHECK-NEXT: 26 or 1 23 25
// CHECK-NEXT: 27 const 15 01
// CHECK-NEXT: 28 concat 17 4 27
// CHECK-NEXT: 29 uext 13 28 5
// CHECK-NEXT: 30 srl 13 14 29
// CHECK-NEXT: 31 slice 1 30 0 0
// CHECK-NEXT: 32 eq 1 21 31
// CHECK-NEXT: 33 and 1 26 32
// CHECK-NEXT: 34 const 15 10
// CHECK-NEXT: 35 concat 17 4 34
// CHECK-NEXT: 36 uext 13 35 5
// CHECK-NEXT: 37 srl 13 14 36
// CHECK-NEXT: 38 slice 1 37 0 0
// CHECK-NEXT: 39 eq 1 21 38
// CHECK-NEXT: 40 and 1 33 39
// CHECK-NEXT: 41 const 15 11
// CHECK-NEXT: 42 concat 17 4 41
// CHECK-NEXT: 43 uext 13 42 5
// CHECK-NEXT: 44 srl 13 14 43
// CHECK-NEXT: 45 slice 1 44 0 0
// CHECK-NEXT: 46 eq 1 21 45
// CHECK-NEXT: 47 and 1 40 46
// CHECK-NEXT: 48 ite 1 47 21 12
// CHECK-NEXT: 49 concat 15 3 24
// CHECK-NEXT: 50 uext 13 49 6
// CHECK-NEXT: 51 srl 13 14 50
// CHECK-NEXT: 52 slice 1 51 0 0
// CHECK-NEXT: 53 eq 1 3 22
// CHECK-NEXT: 54 eq 1 3 24
// CHECK-NEXT: 55 or 1 53 54
// CHECK-NEXT: 56 concat 15 3 22
// CHECK-NEXT: 57 uext 13 56 6
// CHECK-NEXT: 58 srl 13 14 57
// CHECK-NEXT: 59 slice 1 58 0 0
// CHECK-NEXT: 60 eq 1 52 59
// CHECK-NEXT: 61 and 1 55 60
// CHECK-NEXT: 62 concat 15 3 24
// CHECK-NEXT: 63 concat 17 22 62
// CHECK-NEXT: 64 uext 13 63 5
// CHECK-NEXT: 65 srl 13 14 64
// CHECK-NEXT: 66 slice 1 65 0 0
// CHECK-NEXT: 67 eq 1 52 66
// CHECK-NEXT: 68 and 1 61 67
// CHECK-NEXT: 69 concat 15 3 22
// CHECK-NEXT: 70 concat 17 22 69
// CHECK-NEXT: 71 uext 13 70 5
// CHECK-NEXT: 72 srl 13 14 71
// CHECK-NEXT: 73 slice 1 72 0 0
// CHECK-NEXT: 74 eq 1 52 73
// CHECK-NEXT: 75 and 1 68 74
// CHECK-NEXT: 76 ite 1 75 52 48
// CHECK-NEXT: 77 uext 13 2 7
// CHECK-NEXT: 78 srl 13 14 77
// CHECK-NEXT: 79 slice 1 78 0 0
// CHECK-NEXT: 80 eq 1 2 22
// CHECK-NEXT: 81 eq 1 2 24
// CHECK-NEXT: 82 or 1 80 81
// CHECK-NEXT: 83 concat 15 22 2
// CHECK-NEXT: 84 uext 13 83 6
// CHECK-NEXT: 85 srl 13 14 84
// CHECK-NEXT: 86 slice 1 85 0 0
// CHECK-NEXT: 87 eq 1 79 86
// CHECK-NEXT: 88 and 1 82 87
// CHECK-NEXT: 89 concat 17 34 2
// CHECK-NEXT: 90 uext 13 89 5
// CHECK-NEXT: 91 srl 13 14 90
// CHECK-NEXT: 92 slice 1 91 0 0
// CHECK-NEXT: 93 eq 1 79 92
// CHECK-NEXT: 94 and 1 88 93
// CHECK-NEXT: 95 concat 17 41 2
// CHECK-NEXT: 96 uext 13 95 5
// CHECK-NEXT: 97 srl 13 14 96
// CHECK-NEXT: 98 slice 1 97 0 0
// CHECK-NEXT: 99 eq 1 79 98
// CHECK-NEXT: 100 and 1 94 99
// CHECK-NEXT: 101 ite 1 100 79 76
// CHECK-NEXT: 102 concat 15 3 24
// CHECK-NEXT: 103 concat 17 4 102
// CHECK-NEXT: 104 uext 13 103 5
// CHECK-NEXT: 105 srl 13 14 104
// CHECK-NEXT: 106 slice 1 105 0 0
// CHECK-NEXT: 107 xor 1 4 3
// CHECK-NEXT: 108 eq 1 107 22
// CHECK-NEXT: 109 eq 1 107 24
// CHECK-NEXT: 110 or 1 108 109
// CHECK-NEXT: 111 concat 15 3 22
// CHECK-NEXT: 112 concat 17 4 111
// CHECK-NEXT: 113 uext 13 112 5
// CHECK-NEXT: 114 srl 13 14 113
// CHECK-NEXT: 115 slice 1 114 0 0
// CHECK-NEXT: 116 eq 1 106 115
// CHECK-NEXT: 117 and 1 110 116
// CHECK-NEXT: 118 ite 1 117 106 101
// CHECK-NEXT: 119 concat 15 24 2
// CHECK-NEXT: 120 concat 17 4 119
// CHECK-NEXT: 121 uext 13 120 5
// CHECK-NEXT: 122 srl 13 14 121
// CHECK-NEXT: 123 slice 1 122 0 0
// CHECK-NEXT: 124 xor 1 4 2
// CHECK-NEXT: 125 eq 1 124 22
// CHECK-NEXT: 126 eq 1 124 24
// CHECK-NEXT: 127 or 1 125 126
// CHECK-NEXT: 128 concat 15 22 2
// CHECK-NEXT: 129 concat 17 4 128
// CHECK-NEXT: 130 uext 13 129 5
// CHECK-NEXT: 131 srl 13 14 130
// CHECK-NEXT: 132 slice 1 131 0 0
// CHECK-NEXT: 133 eq 1 123 132
// CHECK-NEXT: 134 and 1 127 133
// CHECK-NEXT: 135 ite 1 134 123 118
// CHECK-NEXT: 136 concat 15 3 2
// CHECK-NEXT: 137 uext 13 136 6
// CHECK-NEXT: 138 srl 13 14 137
// CHECK-NEXT: 139 slice 1 138 0 0
// CHECK-NEXT: 140 xor 1 2 3
// CHECK-NEXT: 141 eq 1 140 22
// CHECK-NEXT: 142 eq 1 140 24
// CHECK-NEXT: 143 or 1 141 142
// CHECK-NEXT: 144 concat 15 3 2
// CHECK-NEXT: 145 concat 17 22 144
// CHECK-NEXT: 146 uext 13 145 5
// CHECK-NEXT: 147 srl 13 14 146
// CHECK-NEXT: 148 slice 1 147 0 0
// CHECK-NEXT: 149 eq 1 139 148
// CHECK-NEXT: 150 and 1 143 149
// CHECK-NEXT: 151 ite 1 150 139 135
// CHECK-NEXT: 152 slice 1 9 0 0
// CHECK-NEXT: 153 redor 1 14
// CHECK-NEXT: 154 not 1 153
// CHECK-NEXT: 155 redand 1 14
// CHECK-NEXT: 156 or 1 154 155
// CHECK-NEXT: 157 ite 1 156 152 151
// CHECK-NEXT: 158 concat 15 3 2
// CHECK-NEXT: 159 concat 17 4 158
// CHECK-NEXT: 160 uext 13 159 5
// CHECK-NEXT: 161 srl 13 14 160
// CHECK-NEXT: 162 slice 1 161 0 0
// CHECK-NEXT: 163 xor 1 107 2
// CHECK-NEXT: 164 eq 1 163 22
// CHECK-NEXT: 165 eq 1 163 24
// CHECK-NEXT: 166 or 1 164 165
// CHECK-NEXT: 167 ite 1 166 162 157
// CHECK-NEXT: 168 input 1
// CHECK-NEXT: 169 sort bitvec 32
// CHECK-NEXT: 170 slice 169 9 31 0
// CHECK-NEXT: 171 redor 1 170
// CHECK-NEXT: 172 not 1 171
// CHECK-NEXT: 173 redand 1 170
// CHECK-NEXT: 174 or 1 172 173
// CHECK-NEXT: 175 ite 1 174 168 167
// CHECK-NEXT: 176 input 1
// CHECK-NEXT: 177 xor 1 140 4
// CHECK-NEXT: 178 xor 1 177 5
// CHECK-NEXT: 179 xor 1 178 6
// CHECK-NEXT: 180 eq 1 179 24
// CHECK-NEXT: 181 eq 1 179 22
// CHECK-NEXT: 182 or 1 180 181
// CHECK-NEXT: 183 ite 1 182 176 175
// CHECK-NEXT: 184 input 1
// CHECK-NEXT: 185 slice 13 9 15 8
// CHECK-NEXT: 186 uext 13 18 5
// CHECK-NEXT: 187 srl 13 185 186
// CHECK-NEXT: 188 slice 1 187 0 0
// CHECK-NEXT: 189 uext 13 28 5
// CHECK-NEXT: 190 srl 13 185 189
// CHECK-NEXT: 191 slice 1 190 0 0
// CHECK-NEXT: 192 eq 1 188 191
// CHECK-NEXT: 193 and 1 26 192
// CHECK-NEXT: 194 uext 13 35 5
// CHECK-NEXT: 195 srl 13 185 194
// CHECK-NEXT: 196 slice 1 195 0 0
// CHECK-NEXT: 197 eq 1 188 196
// CHECK-NEXT: 198 and 1 193 197
// CHECK-NEXT: 199 uext 13 42 5
// CHECK-NEXT: 200 srl 13 185 199
// CHECK-NEXT: 201 slice 1 200 0 0
// CHECK-NEXT: 202 eq 1 188 201
// CHECK-NEXT: 203 and 1 198 202
// CHECK-NEXT: 204 ite 1 203 188 184
// CHECK-NEXT: 205 uext 13 49 6
// CHECK-NEXT: 206 srl 13 185 205
// CHECK-NEXT: 207 slice 1 206 0 0
// CHECK-NEXT: 208 uext 13 56 6
// CHECK-NEXT: 209 srl 13 185 208
// CHECK-NEXT: 210 slice 1 209 0 0
// CHECK-NEXT: 211 eq 1 207 210
// CHECK-NEXT: 212 and 1 55 211
// CHECK-NEXT: 213 uext 13 63 5
// CHECK-NEXT: 214 srl 13 185 213
// CHECK-NEXT: 215 slice 1 214 0 0
// CHECK-NEXT: 216 eq 1 207 215
// CHECK-NEXT: 217 and 1 212 216
// CHECK-NEXT: 218 uext 13 70 5
// CHECK-NEXT: 219 srl 13 185 218
// CHECK-NEXT: 220 slice 1 219 0 0
// CHECK-NEXT: 221 eq 1 207 220
// CHECK-NEXT: 222 and 1 217 221
// CHECK-NEXT: 223 ite 1 222 207 204
// CHECK-NEXT: 224 uext 13 2 7
// CHECK-NEXT: 225 srl 13 185 224
// CHECK-NEXT: 226 slice 1 225 0 0
// CHECK-NEXT: 227 uext 13 83 6
// CHECK-NEXT: 228 srl 13 185 227
// CHECK-NEXT: 229 slice 1 228 0 0
// CHECK-NEXT: 230 eq 1 226 229
// CHECK-NEXT: 231 and 1 82 230
// CHECK-NEXT: 232 uext 13 89 5
// CHECK-NEXT: 233 srl 13 185 232
// CHECK-NEXT: 234 slice 1 233 0 0
// CHECK-NEXT: 235 eq 1 226 234
// CHECK-NEXT: 236 and 1 231 235
// CHECK-NEXT: 237 uext 13 95 5
// CHECK-NEXT: 238 srl 13 185 237
// CHECK-NEXT: 239 slice 1 238 0 0
// CHECK-NEXT: 240 eq 1 226 239
// CHECK-NEXT: 241 and 1 236 240
// CHECK-NEXT: 242 ite 1 241 226 223
// CHECK-NEXT: 243 uext 13 103 5
// CHECK-NEXT: 244 srl 13 185 243
// CHECK-NEXT: 245 slice 1 244 0 0
// CHECK-NEXT: 246 uext 13 112 5
// CHECK-NEXT: 247 srl 13 185 246
// CHECK-NEXT: 248 slice 1 247 0 0
// CHECK-NEXT: 249 eq 1 245 248
// CHECK-NEXT: 250 and 1 110 249
// CHECK-NEXT: 251 ite 1 250 245 242
// CHECK-NEXT: 252 uext 13 120 5
// CHECK-NEXT: 253 srl 13 185 252
// CHECK-NEXT: 254 slice 1 253 0 0
// CHECK-NEXT: 255 uext 13 129 5
// CHECK-NEXT: 256 srl 13 185 255
// CHECK-NEXT: 257 slice 1 256 0 0
// CHECK-NEXT: 258 eq 1 254 257
// CHECK-NEXT: 259 and 1 127 258
// CHECK-NEXT: 260 ite 1 259 254 251
// CHECK-NEXT: 261 uext 13 136 6
// CHECK-NEXT: 262 srl 13 185 261
// CHECK-NEXT: 263 slice 1 262 0 0
// CHECK-NEXT: 264 uext 13 145 5
// CHECK-NEXT: 265 srl 13 185 264
// CHECK-NEXT: 266 slice 1 265 0 0
// CHECK-NEXT: 267 eq 1 263 266
// CHECK-NEXT: 268 and 1 143 267
// CHECK-NEXT: 269 ite 1 268 263 260
// CHECK-NEXT: 270 slice 1 9 8 8
// CHECK-NEXT: 271 redor 1 185
// CHECK-NEXT: 272 not 1 271
// CHECK-NEXT: 273 redand 1 185
// CHECK-NEXT: 274 or 1 272 273
// CHECK-NEXT: 275 ite 1 274 270 269
// CHECK-NEXT: 276 uext 13 159 5
// CHECK-NEXT: 277 srl 13 185 276
// CHECK-NEXT: 278 slice 1 277 0 0
// CHECK-NEXT: 279 ite 1 166 278 275
// CHECK-NEXT: 280 input 1
// CHECK-NEXT: 281 ite 1 174 280 279
// CHECK-NEXT: 282 input 1
// CHECK-NEXT: 283 ite 1 182 282 281
// CHECK-NEXT: 284 input 1
// CHECK-NEXT: 285 slice 13 9 23 16
// CHECK-NEXT: 286 uext 13 18 5
// CHECK-NEXT: 287 srl 13 285 286
// CHECK-NEXT: 288 slice 1 287 0 0
// CHECK-NEXT: 289 uext 13 28 5
// CHECK-NEXT: 290 srl 13 285 289
// CHECK-NEXT: 291 slice 1 290 0 0
// CHECK-NEXT: 292 eq 1 288 291
// CHECK-NEXT: 293 and 1 26 292
// CHECK-NEXT: 294 uext 13 35 5
// CHECK-NEXT: 295 srl 13 285 294
// CHECK-NEXT: 296 slice 1 295 0 0
// CHECK-NEXT: 297 eq 1 288 296
// CHECK-NEXT: 298 and 1 293 297
// CHECK-NEXT: 299 uext 13 42 5
// CHECK-NEXT: 300 srl 13 285 299
// CHECK-NEXT: 301 slice 1 300 0 0
// CHECK-NEXT: 302 eq 1 288 301
// CHECK-NEXT: 303 and 1 298 302
// CHECK-NEXT: 304 ite 1 303 288 284
// CHECK-NEXT: 305 uext 13 49 6
// CHECK-NEXT: 306 srl 13 285 305
// CHECK-NEXT: 307 slice 1 306 0 0
// CHECK-NEXT: 308 uext 13 56 6
// CHECK-NEXT: 309 srl 13 285 308
// CHECK-NEXT: 310 slice 1 309 0 0
// CHECK-NEXT: 311 eq 1 307 310
// CHECK-NEXT: 312 and 1 55 311
// CHECK-NEXT: 313 uext 13 63 5
// CHECK-NEXT: 314 srl 13 285 313
// CHECK-NEXT: 315 slice 1 314 0 0
// CHECK-NEXT: 316 eq 1 307 315
// CHECK-NEXT: 317 and 1 312 316
// CHECK-NEXT: 318 uext 13 70 5
// CHECK-NEXT: 319 srl 13 285 318
// CHECK-NEXT: 320 slice 1 319 0 0
// CHECK-NEXT: 321 eq 1 307 320
// CHECK-NEXT: 322 and 1 317 321
// CHECK-NEXT: 323 ite 1 322 307 304
// CHECK-NEXT: 324 uext 13 2 7
// CHECK-NEXT: 325 srl 13 285 324
// CHECK-NEXT: 326 slice 1 325 0 0
// CHECK-NEXT: 327 uext 13 83 6
// CHECK-NEXT: 328 srl 13 285 327
// CHECK-NEXT: 329 slice 1 328 0 0
// CHECK-NEXT: 330 eq 1 326 329
// CHECK-NEXT: 331 and 1 82 330
// CHECK-NEXT: 332 uext 13 89 5
// CHECK-NEXT: 333 srl 13 285 332
// CHECK-NEXT: 334 slice 1 333 0 0
// CHECK-NEXT: 335 eq 1 326 334
// CHECK-NEXT: 336 and 1 331 335
// CHECK-NEXT: 337 uext 13 95 5
// CHECK-NEXT: 338 srl 13 285 337
// CHECK-NEXT: 339 slice 1 338 0 0
// CHECK-NEXT: 340 eq 1 326 339
// CHECK-NEXT: 341 and 1 336 340
// CHECK-NEXT: 342 ite 1 341 326 323
// CHECK-NEXT: 343 uext 13 103 5
// CHECK-NEXT: 344 srl 13 285 343
// CHECK-NEXT: 345 slice 1 344 0 0
// CHECK-NEXT: 346 uext 13 112 5
// CHECK-NEXT: 347 srl 13 285 346
// CHECK-NEXT: 348 slice 1 347 0 0
// CHECK-NEXT: 349 eq 1 345 348
// CHECK-NEXT: 350 and 1 110 349
// CHECK-NEXT: 351 ite 1 350 345 342
// CHECK-NEXT: 352 uext 13 120 5
// CHECK-NEXT: 353 srl 13 285 352
// CHECK-NEXT: 354 slice 1 353 0 0
// CHECK-NEXT: 355 uext 13 129 5
// CHECK-NEXT: 356 srl 13 285 355
// CHECK-NEXT: 357 slice 1 356 0 0
// CHECK-NEXT: 358 eq 1 354 357
// CHECK-NEXT: 359 and 1 127 358
// CHECK-NEXT: 360 ite 1 359 354 351
// CHECK-NEXT: 361 uext 13 136 6
// CHECK-NEXT: 362 srl 13 285 361
// CHECK-NEXT: 363 slice 1 362 0 0
// CHECK-NEXT: 364 uext 13 145 5
// CHECK-NEXT: 365 srl 13 285 364
// CHECK-NEXT: 366 slice 1 365 0 0
// CHECK-NEXT: 367 eq 1 363 366
// CHECK-NEXT: 368 and 1 143 367
// CHECK-NEXT: 369 ite 1 368 363 360
// CHECK-NEXT: 370 slice 1 9 16 16
// CHECK-NEXT: 371 redor 1 285
// CHECK-NEXT: 372 not 1 371
// CHECK-NEXT: 373 redand 1 285
// CHECK-NEXT: 374 or 1 372 373
// CHECK-NEXT: 375 ite 1 374 370 369
// CHECK-NEXT: 376 uext 13 159 5
// CHECK-NEXT: 377 srl 13 285 376
// CHECK-NEXT: 378 slice 1 377 0 0
// CHECK-NEXT: 379 ite 1 166 378 375
// CHECK-NEXT: 380 input 1
// CHECK-NEXT: 381 ite 1 174 380 379
// CHECK-NEXT: 382 input 1
// CHECK-NEXT: 383 ite 1 182 382 381
// CHECK-NEXT: 384 input 1
// CHECK-NEXT: 385 slice 13 9 31 24
// CHECK-NEXT: 386 uext 13 18 5
// CHECK-NEXT: 387 srl 13 385 386
// CHECK-NEXT: 388 slice 1 387 0 0
// CHECK-NEXT: 389 uext 13 28 5
// CHECK-NEXT: 390 srl 13 385 389
// CHECK-NEXT: 391 slice 1 390 0 0
// CHECK-NEXT: 392 eq 1 388 391
// CHECK-NEXT: 393 and 1 26 392
// CHECK-NEXT: 394 uext 13 35 5
// CHECK-NEXT: 395 srl 13 385 394
// CHECK-NEXT: 396 slice 1 395 0 0
// CHECK-NEXT: 397 eq 1 388 396
// CHECK-NEXT: 398 and 1 393 397
// CHECK-NEXT: 399 uext 13 42 5
// CHECK-NEXT: 400 srl 13 385 399
// CHECK-NEXT: 401 slice 1 400 0 0
// CHECK-NEXT: 402 eq 1 388 401
// CHECK-NEXT: 403 and 1 398 402
// CHECK-NEXT: 404 ite 1 403 388 384
// CHECK-NEXT: 405 uext 13 49 6
// CHECK-NEXT: 406 srl 13 385 405
// CHECK-NEXT: 407 slice 1 406 0 0
// CHECK-NEXT: 408 uext 13 56 6
// CHECK-NEXT: 409 srl 13 385 408
// CHECK-NEXT: 410 slice 1 409 0 0
// CHECK-NEXT: 411 eq 1 407 410
// CHECK-NEXT: 412 and 1 55 411
// CHECK-NEXT: 413 uext 13 63 5
// CHECK-NEXT: 414 srl 13 385 413
// CHECK-NEXT: 415 slice 1 414 0 0
// CHECK-NEXT: 416 eq 1 407 415
// CHECK-NEXT: 417 and 1 412 416
// CHECK-NEXT: 418 uext 13 70 5
// CHECK-NEXT: 419 srl 13 385 418
// CHECK-NEXT: 420 slice 1 419 0 0
// CHECK-NEXT: 421 eq 1 407 420
// CHECK-NEXT: 422 and 1 417 421
// CHECK-NEXT: 423 ite 1 422 407 404
// CHECK-NEXT: 424 uext 13 2 7
// CHECK-NEXT: 425 srl 13 385 424
// CHECK-NEXT: 426 slice 1 425 0 0
// CHECK-NEXT: 427 uext 13 83 6
// CHECK-NEXT: 428 srl 13 385 427
// CHECK-NEXT: 429 slice 1 428 0 0
// CHECK-NEXT: 430 eq 1 426 429
// CHECK-NEXT: 431 and 1 82 430
// CHECK-NEXT: 432 uext 13 89 5
// CHECK-NEXT: 433 srl 13 385 432
// CHECK-NEXT: 434 slice 1 433 0 0
// CHECK-NEXT: 435 eq 1 426 434
// CHECK-NEXT: 436 and 1 431 435
// CHECK-NEXT: 437 uext 13 95 5
// CHECK-NEXT: 438 srl 13 385 437
// CHECK-NEXT: 439 slice 1 438 0 0
// CHECK-NEXT: 440 eq 1 426 439
// CHECK-NEXT: 441 and 1 436 440
// CHECK-NEXT: 442 ite 1 441 426 423
// CHECK-NEXT: 443 uext 13 103 5
// CHECK-NEXT: 444 srl 13 385 443
// CHECK-NEXT: 445 slice 1 444 0 0
// CHECK-NEXT: 446 uext 13 112 5
// CHECK-NEXT: 447 srl 13 385 446
// CHECK-NEXT: 448 slice 1 447 0 0
// CHECK-NEXT: 449 eq 1 445 448
// CHECK-NEXT: 450 and 1 110 449
// CHECK-NEXT: 451 ite 1 450 445 442
// CHECK-NEXT: 452 uext 13 120 5
// CHECK-NEXT: 453 srl 13 385 452
// CHECK-NEXT: 454 slice 1 453 0 0
// CHECK-NEXT: 455 uext 13 129 5
// CHECK-NEXT: 456 srl 13 385 455
// CHECK-NEXT: 457 slice 1 456 0 0
// CHECK-NEXT: 458 eq 1 454 457
// CHECK-NEXT: 459 and 1 127 458
// CHECK-NEXT: 460 ite 1 459 454 451
// CHECK-NEXT: 461 uext 13 136 6
// CHECK-NEXT: 462 srl 13 385 461
// CHECK-NEXT: 463 slice 1 462 0 0
// CHECK-NEXT: 464 uext 13 145 5
// CHECK-NEXT: 465 srl 13 385 464
// CHECK-NEXT: 466 slice 1 465 0 0
// CHECK-NEXT: 467 eq 1 463 466
// CHECK-NEXT: 468 and 1 143 467
// CHECK-NEXT: 469 ite 1 468 463 460
// CHECK-NEXT: 470 slice 1 9 24 24
// CHECK-NEXT: 471 redor 1 385
// CHECK-NEXT: 472 not 1 471
// CHECK-NEXT: 473 redand 1 385
// CHECK-NEXT: 474 or 1 472 473
// CHECK-NEXT: 475 ite 1 474 470 469
// CHECK-NEXT: 476 uext 13 159 5
// CHECK-NEXT: 477 srl 13 385 476
// CHECK-NEXT: 478 slice 1 477 0 0
// CHECK-NEXT: 479 ite 1 166 478 475
// CHECK-NEXT: 480 input 1
// CHECK-NEXT: 481 ite 1 174 480 479
// CHECK-NEXT: 482 input 1
// CHECK-NEXT: 483 ite 1 182 482 481
// CHECK-NEXT: 484 concat 15 283 183
// CHECK-NEXT: 485 concat 17 383 484
// CHECK-NEXT: 486 concat 11 483 485
// CHECK-NEXT: 487 concat 15 6 24
// CHECK-NEXT: 488 uext 11 487 2
// CHECK-NEXT: 489 srl 11 486 488
// CHECK-NEXT: 490 slice 1 489 0 0
// CHECK-NEXT: 491 eq 1 6 22
// CHECK-NEXT: 492 eq 1 6 24
// CHECK-NEXT: 493 or 1 491 492
// CHECK-NEXT: 494 concat 15 6 22
// CHECK-NEXT: 495 uext 11 494 2
// CHECK-NEXT: 496 srl 11 486 495
// CHECK-NEXT: 497 slice 1 496 0 0
// CHECK-NEXT: 498 eq 1 490 497
// CHECK-NEXT: 499 and 1 493 498
// CHECK-NEXT: 500 ite 1 499 490 10
// CHECK-NEXT: 501 uext 11 5 3
// CHECK-NEXT: 502 srl 11 486 501
// CHECK-NEXT: 503 slice 1 502 0 0
// CHECK-NEXT: 504 eq 1 5 22
// CHECK-NEXT: 505 eq 1 5 24
// CHECK-NEXT: 506 or 1 504 505
// CHECK-NEXT: 507 concat 15 22 5
// CHECK-NEXT: 508 uext 11 507 2
// CHECK-NEXT: 509 srl 11 486 508
// CHECK-NEXT: 510 slice 1 509 0 0
// CHECK-NEXT: 511 eq 1 503 510
// CHECK-NEXT: 512 and 1 506 511
// CHECK-NEXT: 513 ite 1 512 503 500
// CHECK-NEXT: 514 redor 1 486
// CHECK-NEXT: 515 not 1 514
// CHECK-NEXT: 516 redand 1 486
// CHECK-NEXT: 517 or 1 515 516
// CHECK-NEXT: 518 ite 1 517 183 513
// CHECK-NEXT: 519 concat 15 6 5
// CHECK-NEXT: 520 uext 11 519 2
// CHECK-NEXT: 521 srl 11 486 520
// CHECK-NEXT: 522 slice 1 521 0 0
// CHECK-NEXT: 523 xor 1 6 5
// CHECK-NEXT: 524 eq 1 523 22
// CHECK-NEXT: 525 eq 1 523 24
// CHECK-NEXT: 526 or 1 524 525
// CHECK-NEXT: 527 ite 1 526 522 518
// CHECK-NEXT: 528 ite 1 174 152 527
// CHECK-NEXT: 529 concat 15 3 2
// CHECK-NEXT: 530 concat 17 4 529
// CHECK-NEXT: 531 concat 11 5 530
// CHECK-NEXT: 532 sort bitvec 5
// CHECK-NEXT: 533 concat 532 6 531
// CHECK-NEXT: 534 uext 8 533 59
// CHECK-NEXT: 535 srl 8 9 534
// CHECK-NEXT: 536 slice 1 535 0 0
// CHECK-NEXT: 537 ite 1 182 536 528
// CHECK-NEXT: 538 output 537 O5 
// CHECK-NEXT: 539 input 1
// CHECK-NEXT: 540 input 1
// CHECK-NEXT: 541 redor 1 9
// CHECK-NEXT: 542 not 1 541
// CHECK-NEXT: 543 redand 1 9
// CHECK-NEXT: 544 or 1 542 543
// CHECK-NEXT: 545 ite 1 544 540 167
// CHECK-NEXT: 546 input 1
// CHECK-NEXT: 547 xor 1 179 7
// CHECK-NEXT: 548 eq 1 547 24
// CHECK-NEXT: 549 eq 1 547 22
// CHECK-NEXT: 550 or 1 548 549
// CHECK-NEXT: 551 ite 1 550 546 545
// CHECK-NEXT: 552 input 1
// CHECK-NEXT: 553 ite 1 544 552 279
// CHECK-NEXT: 554 input 1
// CHECK-NEXT: 555 ite 1 550 554 553
// CHECK-NEXT: 556 input 1
// CHECK-NEXT: 557 ite 1 544 556 379
// CHECK-NEXT: 558 input 1
// CHECK-NEXT: 559 ite 1 550 558 557
// CHECK-NEXT: 560 input 1
// CHECK-NEXT: 561 ite 1 544 560 479
// CHECK-NEXT: 562 input 1
// CHECK-NEXT: 563 ite 1 550 562 561
// CHECK-NEXT: 564 input 1
// CHECK-NEXT: 565 slice 13 9 39 32
// CHECK-NEXT: 566 uext 13 18 5
// CHECK-NEXT: 567 srl 13 565 566
// CHECK-NEXT: 568 slice 1 567 0 0
// CHECK-NEXT: 569 uext 13 28 5
// CHECK-NEXT: 570 srl 13 565 569
// CHECK-NEXT: 571 slice 1 570 0 0
// CHECK-NEXT: 572 eq 1 568 571
// CHECK-NEXT: 573 and 1 26 572
// CHECK-NEXT: 574 uext 13 35 5
// CHECK-NEXT: 575 srl 13 565 574
// CHECK-NEXT: 576 slice 1 575 0 0
// CHECK-NEXT: 577 eq 1 568 576
// CHECK-NEXT: 578 and 1 573 577
// CHECK-NEXT: 579 uext 13 42 5
// CHECK-NEXT: 580 srl 13 565 579
// CHECK-NEXT: 581 slice 1 580 0 0
// CHECK-NEXT: 582 eq 1 568 581
// CHECK-NEXT: 583 and 1 578 582
// CHECK-NEXT: 584 ite 1 583 568 564
// CHECK-NEXT: 585 uext 13 49 6
// CHECK-NEXT: 586 srl 13 565 585
// CHECK-NEXT: 587 slice 1 586 0 0
// CHECK-NEXT: 588 uext 13 56 6
// CHECK-NEXT: 589 srl 13 565 588
// CHECK-NEXT: 590 slice 1 589 0 0
// CHECK-NEXT: 591 eq 1 587 590
// CHECK-NEXT: 592 and 1 55 591
// CHECK-NEXT: 593 uext 13 63 5
// CHECK-NEXT: 594 srl 13 565 593
// CHECK-NEXT: 595 slice 1 594 0 0
// CHECK-NEXT: 596 eq 1 587 595
// CHECK-NEXT: 597 and 1 592 596
// CHECK-NEXT: 598 uext 13 70 5
// CHECK-NEXT: 599 srl 13 565 598
// CHECK-NEXT: 600 slice 1 599 0 0
// CHECK-NEXT: 601 eq 1 587 600
// CHECK-NEXT: 602 and 1 597 601
// CHECK-NEXT: 603 ite 1 602 587 584
// CHECK-NEXT: 604 uext 13 2 7
// CHECK-NEXT: 605 srl 13 565 604
// CHECK-NEXT: 606 slice 1 605 0 0
// CHECK-NEXT: 607 uext 13 83 6
// CHECK-NEXT: 608 srl 13 565 607
// CHECK-NEXT: 609 slice 1 608 0 0
// CHECK-NEXT: 610 eq 1 606 609
// CHECK-NEXT: 611 and 1 82 610
// CHECK-NEXT: 612 uext 13 89 5
// CHECK-NEXT: 613 srl 13 565 612
// CHECK-NEXT: 614 slice 1 613 0 0
// CHECK-NEXT: 615 eq 1 606 614
// CHECK-NEXT: 616 and 1 611 615
// CHECK-NEXT: 617 uext 13 95 5
// CHECK-NEXT: 618 srl 13 565 617
// CHECK-NEXT: 619 slice 1 618 0 0
// CHECK-NEXT: 620 eq 1 606 619
// CHECK-NEXT: 621 and 1 616 620
// CHECK-NEXT: 622 ite 1 621 606 603
// CHECK-NEXT: 623 uext 13 103 5
// CHECK-NEXT: 624 srl 13 565 623
// CHECK-NEXT: 625 slice 1 624 0 0
// CHECK-NEXT: 626 uext 13 112 5
// CHECK-NEXT: 627 srl 13 565 626
// CHECK-NEXT: 628 slice 1 627 0 0
// CHECK-NEXT: 629 eq 1 625 628
// CHECK-NEXT: 630 and 1 110 629
// CHECK-NEXT: 631 ite 1 630 625 622
// CHECK-NEXT: 632 uext 13 120 5
// CHECK-NEXT: 633 srl 13 565 632
// CHECK-NEXT: 634 slice 1 633 0 0
// CHECK-NEXT: 635 uext 13 129 5
// CHECK-NEXT: 636 srl 13 565 635
// CHECK-NEXT: 637 slice 1 636 0 0
// CHECK-NEXT: 638 eq 1 634 637
// CHECK-NEXT: 639 and 1 127 638
// CHECK-NEXT: 640 ite 1 639 634 631
// CHECK-NEXT: 641 uext 13 136 6
// CHECK-NEXT: 642 srl 13 565 641
// CHECK-NEXT: 643 slice 1 642 0 0
// CHECK-NEXT: 644 uext 13 145 5
// CHECK-NEXT: 645 srl 13 565 644
// CHECK-NEXT: 646 slice 1 645 0 0
// CHECK-NEXT: 647 eq 1 643 646
// CHECK-NEXT: 648 and 1 143 647
// CHECK-NEXT: 649 ite 1 648 643 640
// CHECK-NEXT: 650 slice 1 9 32 32
// CHECK-NEXT: 651 redor 1 565
// CHECK-NEXT: 652 not 1 651
// CHECK-NEXT: 653 redand 1 565
// CHECK-NEXT: 654 or 1 652 653
// CHECK-NEXT: 655 ite 1 654 650 649
// CHECK-NEXT: 656 uext 13 159 5
// CHECK-NEXT: 657 srl 13 565 656
// CHECK-NEXT: 658 slice 1 657 0 0
// CHECK-NEXT: 659 ite 1 166 658 655
// CHECK-NEXT: 660 input 1
// CHECK-NEXT: 661 ite 1 544 660 659
// CHECK-NEXT: 662 input 1
// CHECK-NEXT: 663 ite 1 550 662 661
// CHECK-NEXT: 664 input 1
// CHECK-NEXT: 665 slice 13 9 47 40
// CHECK-NEXT: 666 uext 13 18 5
// CHECK-NEXT: 667 srl 13 665 666
// CHECK-NEXT: 668 slice 1 667 0 0
// CHECK-NEXT: 669 uext 13 28 5
// CHECK-NEXT: 670 srl 13 665 669
// CHECK-NEXT: 671 slice 1 670 0 0
// CHECK-NEXT: 672 eq 1 668 671
// CHECK-NEXT: 673 and 1 26 672
// CHECK-NEXT: 674 uext 13 35 5
// CHECK-NEXT: 675 srl 13 665 674
// CHECK-NEXT: 676 slice 1 675 0 0
// CHECK-NEXT: 677 eq 1 668 676
// CHECK-NEXT: 678 and 1 673 677
// CHECK-NEXT: 679 uext 13 42 5
// CHECK-NEXT: 680 srl 13 665 679
// CHECK-NEXT: 681 slice 1 680 0 0
// CHECK-NEXT: 682 eq 1 668 681
// CHECK-NEXT: 683 and 1 678 682
// CHECK-NEXT: 684 ite 1 683 668 664
// CHECK-NEXT: 685 uext 13 49 6
// CHECK-NEXT: 686 srl 13 665 685
// CHECK-NEXT: 687 slice 1 686 0 0
// CHECK-NEXT: 688 uext 13 56 6
// CHECK-NEXT: 689 srl 13 665 688
// CHECK-NEXT: 690 slice 1 689 0 0
// CHECK-NEXT: 691 eq 1 687 690
// CHECK-NEXT: 692 and 1 55 691
// CHECK-NEXT: 693 uext 13 63 5
// CHECK-NEXT: 694 srl 13 665 693
// CHECK-NEXT: 695 slice 1 694 0 0
// CHECK-NEXT: 696 eq 1 687 695
// CHECK-NEXT: 697 and 1 692 696
// CHECK-NEXT: 698 uext 13 70 5
// CHECK-NEXT: 699 srl 13 665 698
// CHECK-NEXT: 700 slice 1 699 0 0
// CHECK-NEXT: 701 eq 1 687 700
// CHECK-NEXT: 702 and 1 697 701
// CHECK-NEXT: 703 ite 1 702 687 684
// CHECK-NEXT: 704 uext 13 2 7
// CHECK-NEXT: 705 srl 13 665 704
// CHECK-NEXT: 706 slice 1 705 0 0
// CHECK-NEXT: 707 uext 13 83 6
// CHECK-NEXT: 708 srl 13 665 707
// CHECK-NEXT: 709 slice 1 708 0 0
// CHECK-NEXT: 710 eq 1 706 709
// CHECK-NEXT: 711 and 1 82 710
// CHECK-NEXT: 712 uext 13 89 5
// CHECK-NEXT: 713 srl 13 665 712
// CHECK-NEXT: 714 slice 1 713 0 0
// CHECK-NEXT: 715 eq 1 706 714
// CHECK-NEXT: 716 and 1 711 715
// CHECK-NEXT: 717 uext 13 95 5
// CHECK-NEXT: 718 srl 13 665 717
// CHECK-NEXT: 719 slice 1 718 0 0
// CHECK-NEXT: 720 eq 1 706 719
// CHECK-NEXT: 721 and 1 716 720
// CHECK-NEXT: 722 ite 1 721 706 703
// CHECK-NEXT: 723 uext 13 103 5
// CHECK-NEXT: 724 srl 13 665 723
// CHECK-NEXT: 725 slice 1 724 0 0
// CHECK-NEXT: 726 uext 13 112 5
// CHECK-NEXT: 727 srl 13 665 726
// CHECK-NEXT: 728 slice 1 727 0 0
// CHECK-NEXT: 729 eq 1 725 728
// CHECK-NEXT: 730 and 1 110 729
// CHECK-NEXT: 731 ite 1 730 725 722
// CHECK-NEXT: 732 uext 13 120 5
// CHECK-NEXT: 733 srl 13 665 732
// CHECK-NEXT: 734 slice 1 733 0 0
// CHECK-NEXT: 735 uext 13 129 5
// CHECK-NEXT: 736 srl 13 665 735
// CHECK-NEXT: 737 slice 1 736 0 0
// CHECK-NEXT: 738 eq 1 734 737
// CHECK-NEXT: 739 and 1 127 738
// CHECK-NEXT: 740 ite 1 739 734 731
// CHECK-NEXT: 741 uext 13 136 6
// CHECK-NEXT: 742 srl 13 665 741
// CHECK-NEXT: 743 slice 1 742 0 0
// CHECK-NEXT: 744 uext 13 145 5
// CHECK-NEXT: 745 srl 13 665 744
// CHECK-NEXT: 746 slice 1 745 0 0
// CHECK-NEXT: 747 eq 1 743 746
// CHECK-NEXT: 748 and 1 143 747
// CHECK-NEXT: 749 ite 1 748 743 740
// CHECK-NEXT: 750 slice 1 9 40 40
// CHECK-NEXT: 751 redor 1 665
// CHECK-NEXT: 752 not 1 751
// CHECK-NEXT: 753 redand 1 665
// CHECK-NEXT: 754 or 1 752 753
// CHECK-NEXT: 755 ite 1 754 750 749
// CHECK-NEXT: 756 uext 13 159 5
// CHECK-NEXT: 757 srl 13 665 756
// CHECK-NEXT: 758 slice 1 757 0 0
// CHECK-NEXT: 759 ite 1 166 758 755
// CHECK-NEXT: 760 input 1
// CHECK-NEXT: 761 ite 1 544 760 759
// CHECK-NEXT: 762 input 1
// CHECK-NEXT: 763 ite 1 550 762 761
// CHECK-NEXT: 764 input 1
// CHECK-NEXT: 765 slice 13 9 55 48
// CHECK-NEXT: 766 uext 13 18 5
// CHECK-NEXT: 767 srl 13 765 766
// CHECK-NEXT: 768 slice 1 767 0 0
// CHECK-NEXT: 769 uext 13 28 5
// CHECK-NEXT: 770 srl 13 765 769
// CHECK-NEXT: 771 slice 1 770 0 0
// CHECK-NEXT: 772 eq 1 768 771
// CHECK-NEXT: 773 and 1 26 772
// CHECK-NEXT: 774 uext 13 35 5
// CHECK-NEXT: 775 srl 13 765 774
// CHECK-NEXT: 776 slice 1 775 0 0
// CHECK-NEXT: 777 eq 1 768 776
// CHECK-NEXT: 778 and 1 773 777
// CHECK-NEXT: 779 uext 13 42 5
// CHECK-NEXT: 780 srl 13 765 779
// CHECK-NEXT: 781 slice 1 780 0 0
// CHECK-NEXT: 782 eq 1 768 781
// CHECK-NEXT: 783 and 1 778 782
// CHECK-NEXT: 784 ite 1 783 768 764
// CHECK-NEXT: 785 uext 13 49 6
// CHECK-NEXT: 786 srl 13 765 785
// CHECK-NEXT: 787 slice 1 786 0 0
// CHECK-NEXT: 788 uext 13 56 6
// CHECK-NEXT: 789 srl 13 765 788
// CHECK-NEXT: 790 slice 1 789 0 0
// CHECK-NEXT: 791 eq 1 787 790
// CHECK-NEXT: 792 and 1 55 791
// CHECK-NEXT: 793 uext 13 63 5
// CHECK-NEXT: 794 srl 13 765 793
// CHECK-NEXT: 795 slice 1 794 0 0
// CHECK-NEXT: 796 eq 1 787 795
// CHECK-NEXT: 797 and 1 792 796
// CHECK-NEXT: 798 uext 13 70 5
// CHECK-NEXT: 799 srl 13 765 798
// CHECK-NEXT: 800 slice 1 799 0 0
// CHECK-NEXT: 801 eq 1 787 800
// CHECK-NEXT: 802 and 1 797 801
// CHECK-NEXT: 803 ite 1 802 787 784
// CHECK-NEXT: 804 uext 13 2 7
// CHECK-NEXT: 805 srl 13 765 804
// CHECK-NEXT: 806 slice 1 805 0 0
// CHECK-NEXT: 807 uext 13 83 6
// CHECK-NEXT: 808 srl 13 765 807
// CHECK-NEXT: 809 slice 1 808 0 0
// CHECK-NEXT: 810 eq 1 806 809
// CHECK-NEXT: 811 and 1 82 810
// CHECK-NEXT: 812 uext 13 89 5
// CHECK-NEXT: 813 srl 13 765 812
// CHECK-NEXT: 814 slice 1 813 0 0
// CHECK-NEXT: 815 eq 1 806 814
// CHECK-NEXT: 816 and 1 811 815
// CHECK-NEXT: 817 uext 13 95 5
// CHECK-NEXT: 818 srl 13 765 817
// CHECK-NEXT: 819 slice 1 818 0 0
// CHECK-NEXT: 820 eq 1 806 819
// CHECK-NEXT: 821 and 1 816 820
// CHECK-NEXT: 822 ite 1 821 806 803
// CHECK-NEXT: 823 uext 13 103 5
// CHECK-NEXT: 824 srl 13 765 823
// CHECK-NEXT: 825 slice 1 824 0 0
// CHECK-NEXT: 826 uext 13 112 5
// CHECK-NEXT: 827 srl 13 765 826
// CHECK-NEXT: 828 slice 1 827 0 0
// CHECK-NEXT: 829 eq 1 825 828
// CHECK-NEXT: 830 and 1 110 829
// CHECK-NEXT: 831 ite 1 830 825 822
// CHECK-NEXT: 832 uext 13 120 5
// CHECK-NEXT: 833 srl 13 765 832
// CHECK-NEXT: 834 slice 1 833 0 0
// CHECK-NEXT: 835 uext 13 129 5
// CHECK-NEXT: 836 srl 13 765 835
// CHECK-NEXT: 837 slice 1 836 0 0
// CHECK-NEXT: 838 eq 1 834 837
// CHECK-NEXT: 839 and 1 127 838
// CHECK-NEXT: 840 ite 1 839 834 831
// CHECK-NEXT: 841 uext 13 136 6
// CHECK-NEXT: 842 srl 13 765 841
// CHECK-NEXT: 843 slice 1 842 0 0
// CHECK-NEXT: 844 uext 13 145 5
// CHECK-NEXT: 845 srl 13 765 844
// CHECK-NEXT: 846 slice 1 845 0 0
// CHECK-NEXT: 847 eq 1 843 846
// CHECK-NEXT: 848 and 1 143 847
// CHECK-NEXT: 849 ite 1 848 843 840
// CHECK-NEXT: 850 slice 1 9 48 48
// CHECK-NEXT: 851 redor 1 765
// CHECK-NEXT: 852 not 1 851
// CHECK-NEXT: 853 redand 1 765
// CHECK-NEXT: 854 or 1 852 853
// CHECK-NEXT: 855 ite 1 854 850 849
// CHECK-NEXT: 856 uext 13 159 5
// CHECK-NEXT: 857 srl 13 765 856
// CHECK-NEXT: 858 slice 1 857 0 0
// CHECK-NEXT: 859 ite 1 166 858 855
// CHECK-NEXT: 860 input 1
// CHECK-NEXT: 861 ite 1 544 860 859
// CHECK-NEXT: 862 input 1
// CHECK-NEXT: 863 ite 1 550 862 861
// CHECK-NEXT: 864 input 1
// CHECK-NEXT: 865 slice 13 9 63 56
// CHECK-NEXT: 866 uext 13 18 5
// CHECK-NEXT: 867 srl 13 865 866
// CHECK-NEXT: 868 slice 1 867 0 0
// CHECK-NEXT: 869 uext 13 28 5
// CHECK-NEXT: 870 srl 13 865 869
// CHECK-NEXT: 871 slice 1 870 0 0
// CHECK-NEXT: 872 eq 1 868 871
// CHECK-NEXT: 873 and 1 26 872
// CHECK-NEXT: 874 uext 13 35 5
// CHECK-NEXT: 875 srl 13 865 874
// CHECK-NEXT: 876 slice 1 875 0 0
// CHECK-NEXT: 877 eq 1 868 876
// CHECK-NEXT: 878 and 1 873 877
// CHECK-NEXT: 879 uext 13 42 5
// CHECK-NEXT: 880 srl 13 865 879
// CHECK-NEXT: 881 slice 1 880 0 0
// CHECK-NEXT: 882 eq 1 868 881
// CHECK-NEXT: 883 and 1 878 882
// CHECK-NEXT: 884 ite 1 883 868 864
// CHECK-NEXT: 885 uext 13 49 6
// CHECK-NEXT: 886 srl 13 865 885
// CHECK-NEXT: 887 slice 1 886 0 0
// CHECK-NEXT: 888 uext 13 56 6
// CHECK-NEXT: 889 srl 13 865 888
// CHECK-NEXT: 890 slice 1 889 0 0
// CHECK-NEXT: 891 eq 1 887 890
// CHECK-NEXT: 892 and 1 55 891
// CHECK-NEXT: 893 uext 13 63 5
// CHECK-NEXT: 894 srl 13 865 893
// CHECK-NEXT: 895 slice 1 894 0 0
// CHECK-NEXT: 896 eq 1 887 895
// CHECK-NEXT: 897 and 1 892 896
// CHECK-NEXT: 898 uext 13 70 5
// CHECK-NEXT: 899 srl 13 865 898
// CHECK-NEXT: 900 slice 1 899 0 0
// CHECK-NEXT: 901 eq 1 887 900
// CHECK-NEXT: 902 and 1 897 901
// CHECK-NEXT: 903 ite 1 902 887 884
// CHECK-NEXT: 904 uext 13 2 7
// CHECK-NEXT: 905 srl 13 865 904
// CHECK-NEXT: 906 slice 1 905 0 0
// CHECK-NEXT: 907 uext 13 83 6
// CHECK-NEXT: 908 srl 13 865 907
// CHECK-NEXT: 909 slice 1 908 0 0
// CHECK-NEXT: 910 eq 1 906 909
// CHECK-NEXT: 911 and 1 82 910
// CHECK-NEXT: 912 uext 13 89 5
// CHECK-NEXT: 913 srl 13 865 912
// CHECK-NEXT: 914 slice 1 913 0 0
// CHECK-NEXT: 915 eq 1 906 914
// CHECK-NEXT: 916 and 1 911 915
// CHECK-NEXT: 917 uext 13 95 5
// CHECK-NEXT: 918 srl 13 865 917
// CHECK-NEXT: 919 slice 1 918 0 0
// CHECK-NEXT: 920 eq 1 906 919
// CHECK-NEXT: 921 and 1 916 920
// CHECK-NEXT: 922 ite 1 921 906 903
// CHECK-NEXT: 923 uext 13 103 5
// CHECK-NEXT: 924 srl 13 865 923
// CHECK-NEXT: 925 slice 1 924 0 0
// CHECK-NEXT: 926 uext 13 112 5
// CHECK-NEXT: 927 srl 13 865 926
// CHECK-NEXT: 928 slice 1 927 0 0
// CHECK-NEXT: 929 eq 1 925 928
// CHECK-NEXT: 930 and 1 110 929
// CHECK-NEXT: 931 ite 1 930 925 922
// CHECK-NEXT: 932 uext 13 120 5
// CHECK-NEXT: 933 srl 13 865 932
// CHECK-NEXT: 934 slice 1 933 0 0
// CHECK-NEXT: 935 uext 13 129 5
// CHECK-NEXT: 936 srl 13 865 935
// CHECK-NEXT: 937 slice 1 936 0 0
// CHECK-NEXT: 938 eq 1 934 937
// CHECK-NEXT: 939 and 1 127 938
// CHECK-NEXT: 940 ite 1 939 934 931
// CHECK-NEXT: 941 uext 13 136 6
// CHECK-NEXT: 942 srl 13 865 941
// CHECK-NEXT: 943 slice 1 942 0 0
// CHECK-NEXT: 944 uext 13 145 5
// CHECK-NEXT: 945 srl 13 865 944
// CHECK-NEXT: 946 slice 1 945 0 0
// CHECK-NEXT: 947 eq 1 943 946
// CHECK-NEXT: 948 and 1 143 947
// CHECK-NEXT: 949 ite 1 948 943 940
// CHECK-NEXT: 950 slice 1 9 56 56
// CHECK-NEXT: 951 redor 1 865
// CHECK-NEXT: 952 not 1 951
// CHECK-NEXT: 953 redand 1 865
// CHECK-NEXT: 954 or 1 952 953
// CHECK-NEXT: 955 ite 1 954 950 949
// CHECK-NEXT: 956 uext 13 159 5
// CHECK-NEXT: 957 srl 13 865 956
// CHECK-NEXT: 958 slice 1 957 0 0
// CHECK-NEXT: 959 ite 1 166 958 955
// CHECK-NEXT: 960 input 1
// CHECK-NEXT: 961 ite 1 544 960 959
// CHECK-NEXT: 962 input 1
// CHECK-NEXT: 963 ite 1 550 962 961
// CHECK-NEXT: 964 concat 15 555 551
// CHECK-NEXT: 965 concat 17 559 964
// CHECK-NEXT: 966 concat 11 563 965
// CHECK-NEXT: 967 concat 532 663 966
// CHECK-NEXT: 968 sort bitvec 6
// CHECK-NEXT: 969 concat 968 763 967
// CHECK-NEXT: 970 sort bitvec 7
// CHECK-NEXT: 971 concat 970 863 969
// CHECK-NEXT: 972 concat 13 963 971
// CHECK-NEXT: 973 concat 17 7 16
// CHECK-NEXT: 974 uext 13 973 5
// CHECK-NEXT: 975 srl 13 972 974
// CHECK-NEXT: 976 slice 1 975 0 0
// CHECK-NEXT: 977 eq 1 7 22
// CHECK-NEXT: 978 eq 1 7 24
// CHECK-NEXT: 979 or 1 977 978
// CHECK-NEXT: 980 concat 17 7 27
// CHECK-NEXT: 981 uext 13 980 5
// CHECK-NEXT: 982 srl 13 972 981
// CHECK-NEXT: 983 slice 1 982 0 0
// CHECK-NEXT: 984 eq 1 976 983
// CHECK-NEXT: 985 and 1 979 984
// CHECK-NEXT: 986 concat 17 7 34
// CHECK-NEXT: 987 uext 13 986 5
// CHECK-NEXT: 988 srl 13 972 987
// CHECK-NEXT: 989 slice 1 988 0 0
// CHECK-NEXT: 990 eq 1 976 989
// CHECK-NEXT: 991 and 1 985 990
// CHECK-NEXT: 992 concat 17 7 41
// CHECK-NEXT: 993 uext 13 992 5
// CHECK-NEXT: 994 srl 13 972 993
// CHECK-NEXT: 995 slice 1 994 0 0
// CHECK-NEXT: 996 eq 1 976 995
// CHECK-NEXT: 997 and 1 991 996
// CHECK-NEXT: 998 ite 1 997 976 539
// CHECK-NEXT: 999 uext 13 487 6
// CHECK-NEXT: 1000 srl 13 972 999
// CHECK-NEXT: 1001 slice 1 1000 0 0
// CHECK-NEXT: 1002 uext 13 494 6
// CHECK-NEXT: 1003 srl 13 972 1002
// CHECK-NEXT: 1004 slice 1 1003 0 0
// CHECK-NEXT: 1005 eq 1 1001 1004
// CHECK-NEXT: 1006 and 1 493 1005
// CHECK-NEXT: 1007 concat 15 6 24
// CHECK-NEXT: 1008 concat 17 22 1007
// CHECK-NEXT: 1009 uext 13 1008 5
// CHECK-NEXT: 1010 srl 13 972 1009
// CHECK-NEXT: 1011 slice 1 1010 0 0
// CHECK-NEXT: 1012 eq 1 1001 1011
// CHECK-NEXT: 1013 and 1 1006 1012
// CHECK-NEXT: 1014 concat 15 6 22
// CHECK-NEXT: 1015 concat 17 22 1014
// CHECK-NEXT: 1016 uext 13 1015 5
// CHECK-NEXT: 1017 srl 13 972 1016
// CHECK-NEXT: 1018 slice 1 1017 0 0
// CHECK-NEXT: 1019 eq 1 1001 1018
// CHECK-NEXT: 1020 and 1 1013 1019
// CHECK-NEXT: 1021 ite 1 1020 1001 998
// CHECK-NEXT: 1022 uext 13 5 7
// CHECK-NEXT: 1023 srl 13 972 1022
// CHECK-NEXT: 1024 slice 1 1023 0 0
// CHECK-NEXT: 1025 uext 13 507 6
// CHECK-NEXT: 1026 srl 13 972 1025
// CHECK-NEXT: 1027 slice 1 1026 0 0
// CHECK-NEXT: 1028 eq 1 1024 1027
// CHECK-NEXT: 1029 and 1 506 1028
// CHECK-NEXT: 1030 concat 17 34 5
// CHECK-NEXT: 1031 uext 13 1030 5
// CHECK-NEXT: 1032 srl 13 972 1031
// CHECK-NEXT: 1033 slice 1 1032 0 0
// CHECK-NEXT: 1034 eq 1 1024 1033
// CHECK-NEXT: 1035 and 1 1029 1034
// CHECK-NEXT: 1036 concat 17 41 5
// CHECK-NEXT: 1037 uext 13 1036 5
// CHECK-NEXT: 1038 srl 13 972 1037
// CHECK-NEXT: 1039 slice 1 1038 0 0
// CHECK-NEXT: 1040 eq 1 1024 1039
// CHECK-NEXT: 1041 and 1 1035 1040
// CHECK-NEXT: 1042 ite 1 1041 1024 1021
// CHECK-NEXT: 1043 concat 15 6 24
// CHECK-NEXT: 1044 concat 17 7 1043
// CHECK-NEXT: 1045 uext 13 1044 5
// CHECK-NEXT: 1046 srl 13 972 1045
// CHECK-NEXT: 1047 slice 1 1046 0 0
// CHECK-NEXT: 1048 xor 1 7 6
// CHECK-NEXT: 1049 eq 1 1048 22
// CHECK-NEXT: 1050 eq 1 1048 24
// CHECK-NEXT: 1051 or 1 1049 1050
// CHECK-NEXT: 1052 concat 15 6 22
// CHECK-NEXT: 1053 concat 17 7 1052
// CHECK-NEXT: 1054 uext 13 1053 5
// CHECK-NEXT: 1055 srl 13 972 1054
// CHECK-NEXT: 1056 slice 1 1055 0 0
// CHECK-NEXT: 1057 eq 1 1047 1056
// CHECK-NEXT: 1058 and 1 1051 1057
// CHECK-NEXT: 1059 ite 1 1058 1047 1042
// CHECK-NEXT: 1060 concat 15 24 5
// CHECK-NEXT: 1061 concat 17 7 1060
// CHECK-NEXT: 1062 uext 13 1061 5
// CHECK-NEXT: 1063 srl 13 972 1062
// CHECK-NEXT: 1064 slice 1 1063 0 0
// CHECK-NEXT: 1065 xor 1 7 5
// CHECK-NEXT: 1066 eq 1 1065 22
// CHECK-NEXT: 1067 eq 1 1065 24
// CHECK-NEXT: 1068 or 1 1066 1067
// CHECK-NEXT: 1069 concat 15 22 5
// CHECK-NEXT: 1070 concat 17 7 1069
// CHECK-NEXT: 1071 uext 13 1070 5
// CHECK-NEXT: 1072 srl 13 972 1071
// CHECK-NEXT: 1073 slice 1 1072 0 0
// CHECK-NEXT: 1074 eq 1 1064 1073
// CHECK-NEXT: 1075 and 1 1068 1074
// CHECK-NEXT: 1076 ite 1 1075 1064 1059
// CHECK-NEXT: 1077 uext 13 519 6
// CHECK-NEXT: 1078 srl 13 972 1077
// CHECK-NEXT: 1079 slice 1 1078 0 0
// CHECK-NEXT: 1080 concat 15 6 5
// CHECK-NEXT: 1081 concat 17 22 1080
// CHECK-NEXT: 1082 uext 13 1081 5
// CHECK-NEXT: 1083 srl 13 972 1082
// CHECK-NEXT: 1084 slice 1 1083 0 0
// CHECK-NEXT: 1085 eq 1 1079 1084
// CHECK-NEXT: 1086 and 1 526 1085
// CHECK-NEXT: 1087 ite 1 1086 1079 1076
// CHECK-NEXT: 1088 redor 1 972
// CHECK-NEXT: 1089 not 1 1088
// CHECK-NEXT: 1090 redand 1 972
// CHECK-NEXT: 1091 or 1 1089 1090
// CHECK-NEXT: 1092 ite 1 1091 551 1087
// CHECK-NEXT: 1093 concat 15 6 5
// CHECK-NEXT: 1094 concat 17 7 1093
// CHECK-NEXT: 1095 uext 13 1094 5
// CHECK-NEXT: 1096 srl 13 972 1095
// CHECK-NEXT: 1097 slice 1 1096 0 0
// CHECK-NEXT: 1098 xor 1 1048 5
// CHECK-NEXT: 1099 eq 1 1098 22
// CHECK-NEXT: 1100 eq 1 1098 24
// CHECK-NEXT: 1101 or 1 1099 1100
// CHECK-NEXT: 1102 ite 1 1101 1097 1092
// CHECK-NEXT: 1103 ite 1 544 152 1102
// CHECK-NEXT: 1104 concat 15 3 2
// CHECK-NEXT: 1105 concat 17 4 1104
// CHECK-NEXT: 1106 concat 11 5 1105
// CHECK-NEXT: 1107 concat 532 6 1106
// CHECK-NEXT: 1108 concat 968 7 1107
// CHECK-NEXT: 1109 uext 8 1108 58
// CHECK-NEXT: 1110 srl 8 9 1109
// CHECK-NEXT: 1111 slice 1 1110 0 0
// CHECK-NEXT: 1112 ite 1 550 1111 1103
// CHECK-NEXT: 1113 output 1112 O6 