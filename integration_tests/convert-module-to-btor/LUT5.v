// RUN: python3 $LAKEROAD_DIR/bin/convert_module_to_btor.py \
// RUN:   --infile %s --top LUT5 --remove-lines-with '$finish' \
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
//  /   /                  5-Bit Look-Up Table
// /___/   /\     Filename : LUT5.v
// \   \  /  \
//  \___\/\___\
//
///////////////////////////////////////////////////////////////////////////////
//  Revision:
//    03/23/04 - Initial version.
//    02/04/05 - Replace primitive with function; Remove buf.
//    01/07/06 - 222733 - Add LOC Parameter
//    06/04/07 - Add wire declaration to internal signal.
//    12/13/11 - 524859 - Added `celldefine and `endcelldefine
//    09/12/16 - ANSI ports, speed improvements
//  End Revision:
///////////////////////////////////////////////////////////////////////////////

`timescale 1 ps/1 ps

`celldefine

module LUT5 #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter [31:0] INIT = 32'h00000000
)(
  output O,

  input I0,
  input I1,
  input I2,
  input I3,
  input I4
);

// define constants
  localparam MODULE_NAME = "LUT5";

  reg trig_attr = 1'b0;
// include dynamic registers - XILINX test only
`ifdef XIL_DR
  `include "LUT5_dr.v"
`else
  reg [31:0] INIT_REG = INIT;
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
   if ( (I0 ^ I1  ^ I2 ^ I3 ^ I4) === 1'b0 || (I0 ^ I1  ^ I2 ^ I3 ^ I4) === 1'b1)
     O_out = INIT_REG[{I4, I3, I2, I1, I0}];
   else if ( ~(|INIT_REG) || &INIT_REG )
     O_out = INIT_REG[0];
   else
     O_out = lut_mux4_f ({lut_mux8_f (INIT_REG[31:24], {I2, I1, I0}),
                      lut_mux8_f (INIT_REG[23:16], {I2, I1, I0}),
                      lut_mux8_f ( INIT_REG[15:8], {I2, I1, I0}),
                      lut_mux8_f (  INIT_REG[7:0], {I2, I1, I0})}, {I4, I3});
  end

// end behavioral model

`ifdef XIL_TIMING
  specify
	(I0 => O) = (0:0:0, 0:0:0);
	(I1 => O) = (0:0:0, 0:0:0);
	(I2 => O) = (0:0:0, 0:0:0);
	(I3 => O) = (0:0:0, 0:0:0);
	(I4 => O) = (0:0:0, 0:0:0);
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
// CHECK: 6 input 1 I4 
// CHECK: 7 sort bitvec 32
// CHECK: 8 input 7 INIT 
// CHECK: 9 input 1
// CHECK: 10 sort bitvec 4
// CHECK: 11 input 1
// CHECK: 12 sort bitvec 8
// CHECK: 13 slice 12 8 7 0
// CHECK: 14 sort bitvec 2
// CHECK: 15 const 14 00
// CHECK: 16 sort bitvec 3
// CHECK: 17 concat 16 4 15
// CHECK: 18 uext 12 17 5
// CHECK: 19 srl 12 13 18
// CHECK: 20 slice 1 19 0 0
// CHECK: 21 const 1 1
// CHECK: 22 eq 1 4 21
// CHECK: 23 const 1 0
// CHECK: 24 eq 1 4 23
// CHECK: 25 or 1 22 24
// CHECK: 26 const 14 01
// CHECK: 27 concat 16 4 26
// CHECK: 28 uext 12 27 5
// CHECK: 29 srl 12 13 28
// CHECK: 30 slice 1 29 0 0
// CHECK: 31 eq 1 20 30
// CHECK: 32 and 1 25 31
// CHECK: 33 const 14 10
// CHECK: 34 concat 16 4 33
// CHECK: 35 uext 12 34 5
// CHECK: 36 srl 12 13 35
// CHECK: 37 slice 1 36 0 0
// CHECK: 38 eq 1 20 37
// CHECK: 39 and 1 32 38
// CHECK: 40 const 14 11
// CHECK: 41 concat 16 4 40
// CHECK: 42 uext 12 41 5
// CHECK: 43 srl 12 13 42
// CHECK: 44 slice 1 43 0 0
// CHECK: 45 eq 1 20 44
// CHECK: 46 and 1 39 45
// CHECK: 47 ite 1 46 20 11
// CHECK: 48 concat 14 3 23
// CHECK: 49 uext 12 48 6
// CHECK: 50 srl 12 13 49
// CHECK: 51 slice 1 50 0 0
// CHECK: 52 eq 1 3 21
// CHECK: 53 eq 1 3 23
// CHECK: 54 or 1 52 53
// CHECK: 55 concat 14 3 21
// CHECK: 56 uext 12 55 6
// CHECK: 57 srl 12 13 56
// CHECK: 58 slice 1 57 0 0
// CHECK: 59 eq 1 51 58
// CHECK: 60 and 1 54 59
// CHECK: 61 concat 14 3 23
// CHECK: 62 concat 16 21 61
// CHECK: 63 uext 12 62 5
// CHECK: 64 srl 12 13 63
// CHECK: 65 slice 1 64 0 0
// CHECK: 66 eq 1 51 65
// CHECK: 67 and 1 60 66
// CHECK: 68 concat 14 3 21
// CHECK: 69 concat 16 21 68
// CHECK: 70 uext 12 69 5
// CHECK: 71 srl 12 13 70
// CHECK: 72 slice 1 71 0 0
// CHECK: 73 eq 1 51 72
// CHECK: 74 and 1 67 73
// CHECK: 75 ite 1 74 51 47
// CHECK: 76 uext 12 2 7
// CHECK: 77 srl 12 13 76
// CHECK: 78 slice 1 77 0 0
// CHECK: 79 eq 1 2 21
// CHECK: 80 eq 1 2 23
// CHECK: 81 or 1 79 80
// CHECK: 82 concat 14 21 2
// CHECK: 83 uext 12 82 6
// CHECK: 84 srl 12 13 83
// CHECK: 85 slice 1 84 0 0
// CHECK: 86 eq 1 78 85
// CHECK: 87 and 1 81 86
// CHECK: 88 concat 16 33 2
// CHECK: 89 uext 12 88 5
// CHECK: 90 srl 12 13 89
// CHECK: 91 slice 1 90 0 0
// CHECK: 92 eq 1 78 91
// CHECK: 93 and 1 87 92
// CHECK: 94 concat 16 40 2
// CHECK: 95 uext 12 94 5
// CHECK: 96 srl 12 13 95
// CHECK: 97 slice 1 96 0 0
// CHECK: 98 eq 1 78 97
// CHECK: 99 and 1 93 98
// CHECK: 100 ite 1 99 78 75
// CHECK: 101 concat 14 3 23
// CHECK: 102 concat 16 4 101
// CHECK: 103 uext 12 102 5
// CHECK: 104 srl 12 13 103
// CHECK: 105 slice 1 104 0 0
// CHECK: 106 xor 1 4 3
// CHECK: 107 eq 1 106 21
// CHECK: 108 eq 1 106 23
// CHECK: 109 or 1 107 108
// CHECK: 110 concat 14 3 21
// CHECK: 111 concat 16 4 110
// CHECK: 112 uext 12 111 5
// CHECK: 113 srl 12 13 112
// CHECK: 114 slice 1 113 0 0
// CHECK: 115 eq 1 105 114
// CHECK: 116 and 1 109 115
// CHECK: 117 ite 1 116 105 100
// CHECK: 118 concat 14 23 2
// CHECK: 119 concat 16 4 118
// CHECK: 120 uext 12 119 5
// CHECK: 121 srl 12 13 120
// CHECK: 122 slice 1 121 0 0
// CHECK: 123 xor 1 4 2
// CHECK: 124 eq 1 123 21
// CHECK: 125 eq 1 123 23
// CHECK: 126 or 1 124 125
// CHECK: 127 concat 14 21 2
// CHECK: 128 concat 16 4 127
// CHECK: 129 uext 12 128 5
// CHECK: 130 srl 12 13 129
// CHECK: 131 slice 1 130 0 0
// CHECK: 132 eq 1 122 131
// CHECK: 133 and 1 126 132
// CHECK: 134 ite 1 133 122 117
// CHECK: 135 concat 14 3 2
// CHECK: 136 uext 12 135 6
// CHECK: 137 srl 12 13 136
// CHECK: 138 slice 1 137 0 0
// CHECK: 139 xor 1 2 3
// CHECK: 140 eq 1 139 21
// CHECK: 141 eq 1 139 23
// CHECK: 142 or 1 140 141
// CHECK: 143 concat 14 3 2
// CHECK: 144 concat 16 21 143
// CHECK: 145 uext 12 144 5
// CHECK: 146 srl 12 13 145
// CHECK: 147 slice 1 146 0 0
// CHECK: 148 eq 1 138 147
// CHECK: 149 and 1 142 148
// CHECK: 150 ite 1 149 138 134
// CHECK: 151 slice 1 8 0 0
// CHECK: 152 redor 1 13
// CHECK: 153 not 1 152
// CHECK: 154 redand 1 13
// CHECK: 155 or 1 153 154
// CHECK: 156 ite 1 155 151 150
// CHECK: 157 concat 14 3 2
// CHECK: 158 concat 16 4 157
// CHECK: 159 uext 12 158 5
// CHECK: 160 srl 12 13 159
// CHECK: 161 slice 1 160 0 0
// CHECK: 162 xor 1 106 2
// CHECK: 163 eq 1 162 21
// CHECK: 164 eq 1 162 23
// CHECK: 165 or 1 163 164
// CHECK: 166 ite 1 165 161 156
// CHECK: 167 input 1
// CHECK: 168 redor 1 8
// CHECK: 169 not 1 168
// CHECK: 170 redand 1 8
// CHECK: 171 or 1 169 170
// CHECK: 172 ite 1 171 167 166
// CHECK: 173 input 1
// CHECK: 174 xor 1 139 4
// CHECK: 175 xor 1 174 5
// CHECK: 176 xor 1 175 6
// CHECK: 177 eq 1 176 23
// CHECK: 178 eq 1 176 21
// CHECK: 179 or 1 177 178
// CHECK: 180 ite 1 179 173 172
// CHECK: 181 input 1
// CHECK: 182 slice 12 8 15 8
// CHECK: 183 uext 12 17 5
// CHECK: 184 srl 12 182 183
// CHECK: 185 slice 1 184 0 0
// CHECK: 186 uext 12 27 5
// CHECK: 187 srl 12 182 186
// CHECK: 188 slice 1 187 0 0
// CHECK: 189 eq 1 185 188
// CHECK: 190 and 1 25 189
// CHECK: 191 uext 12 34 5
// CHECK: 192 srl 12 182 191
// CHECK: 193 slice 1 192 0 0
// CHECK: 194 eq 1 185 193
// CHECK: 195 and 1 190 194
// CHECK: 196 uext 12 41 5
// CHECK: 197 srl 12 182 196
// CHECK: 198 slice 1 197 0 0
// CHECK: 199 eq 1 185 198
// CHECK: 200 and 1 195 199
// CHECK: 201 ite 1 200 185 181
// CHECK: 202 uext 12 48 6
// CHECK: 203 srl 12 182 202
// CHECK: 204 slice 1 203 0 0
// CHECK: 205 uext 12 55 6
// CHECK: 206 srl 12 182 205
// CHECK: 207 slice 1 206 0 0
// CHECK: 208 eq 1 204 207
// CHECK: 209 and 1 54 208
// CHECK: 210 uext 12 62 5
// CHECK: 211 srl 12 182 210
// CHECK: 212 slice 1 211 0 0
// CHECK: 213 eq 1 204 212
// CHECK: 214 and 1 209 213
// CHECK: 215 uext 12 69 5
// CHECK: 216 srl 12 182 215
// CHECK: 217 slice 1 216 0 0
// CHECK: 218 eq 1 204 217
// CHECK: 219 and 1 214 218
// CHECK: 220 ite 1 219 204 201
// CHECK: 221 uext 12 2 7
// CHECK: 222 srl 12 182 221
// CHECK: 223 slice 1 222 0 0
// CHECK: 224 uext 12 82 6
// CHECK: 225 srl 12 182 224
// CHECK: 226 slice 1 225 0 0
// CHECK: 227 eq 1 223 226
// CHECK: 228 and 1 81 227
// CHECK: 229 uext 12 88 5
// CHECK: 230 srl 12 182 229
// CHECK: 231 slice 1 230 0 0
// CHECK: 232 eq 1 223 231
// CHECK: 233 and 1 228 232
// CHECK: 234 uext 12 94 5
// CHECK: 235 srl 12 182 234
// CHECK: 236 slice 1 235 0 0
// CHECK: 237 eq 1 223 236
// CHECK: 238 and 1 233 237
// CHECK: 239 ite 1 238 223 220
// CHECK: 240 uext 12 102 5
// CHECK: 241 srl 12 182 240
// CHECK: 242 slice 1 241 0 0
// CHECK: 243 uext 12 111 5
// CHECK: 244 srl 12 182 243
// CHECK: 245 slice 1 244 0 0
// CHECK: 246 eq 1 242 245
// CHECK: 247 and 1 109 246
// CHECK: 248 ite 1 247 242 239
// CHECK: 249 uext 12 119 5
// CHECK: 250 srl 12 182 249
// CHECK: 251 slice 1 250 0 0
// CHECK: 252 uext 12 128 5
// CHECK: 253 srl 12 182 252
// CHECK: 254 slice 1 253 0 0
// CHECK: 255 eq 1 251 254
// CHECK: 256 and 1 126 255
// CHECK: 257 ite 1 256 251 248
// CHECK: 258 uext 12 135 6
// CHECK: 259 srl 12 182 258
// CHECK: 260 slice 1 259 0 0
// CHECK: 261 uext 12 144 5
// CHECK: 262 srl 12 182 261
// CHECK: 263 slice 1 262 0 0
// CHECK: 264 eq 1 260 263
// CHECK: 265 and 1 142 264
// CHECK: 266 ite 1 265 260 257
// CHECK: 267 slice 1 8 8 8
// CHECK: 268 redor 1 182
// CHECK: 269 not 1 268
// CHECK: 270 redand 1 182
// CHECK: 271 or 1 269 270
// CHECK: 272 ite 1 271 267 266
// CHECK: 273 uext 12 158 5
// CHECK: 274 srl 12 182 273
// CHECK: 275 slice 1 274 0 0
// CHECK: 276 ite 1 165 275 272
// CHECK: 277 input 1
// CHECK: 278 ite 1 171 277 276
// CHECK: 279 input 1
// CHECK: 280 ite 1 179 279 278
// CHECK: 281 input 1
// CHECK: 282 slice 12 8 23 16
// CHECK: 283 uext 12 17 5
// CHECK: 284 srl 12 282 283
// CHECK: 285 slice 1 284 0 0
// CHECK: 286 uext 12 27 5
// CHECK: 287 srl 12 282 286
// CHECK: 288 slice 1 287 0 0
// CHECK: 289 eq 1 285 288
// CHECK: 290 and 1 25 289
// CHECK: 291 uext 12 34 5
// CHECK: 292 srl 12 282 291
// CHECK: 293 slice 1 292 0 0
// CHECK: 294 eq 1 285 293
// CHECK: 295 and 1 290 294
// CHECK: 296 uext 12 41 5
// CHECK: 297 srl 12 282 296
// CHECK: 298 slice 1 297 0 0
// CHECK: 299 eq 1 285 298
// CHECK: 300 and 1 295 299
// CHECK: 301 ite 1 300 285 281
// CHECK: 302 uext 12 48 6
// CHECK: 303 srl 12 282 302
// CHECK: 304 slice 1 303 0 0
// CHECK: 305 uext 12 55 6
// CHECK: 306 srl 12 282 305
// CHECK: 307 slice 1 306 0 0
// CHECK: 308 eq 1 304 307
// CHECK: 309 and 1 54 308
// CHECK: 310 uext 12 62 5
// CHECK: 311 srl 12 282 310
// CHECK: 312 slice 1 311 0 0
// CHECK: 313 eq 1 304 312
// CHECK: 314 and 1 309 313
// CHECK: 315 uext 12 69 5
// CHECK: 316 srl 12 282 315
// CHECK: 317 slice 1 316 0 0
// CHECK: 318 eq 1 304 317
// CHECK: 319 and 1 314 318
// CHECK: 320 ite 1 319 304 301
// CHECK: 321 uext 12 2 7
// CHECK: 322 srl 12 282 321
// CHECK: 323 slice 1 322 0 0
// CHECK: 324 uext 12 82 6
// CHECK: 325 srl 12 282 324
// CHECK: 326 slice 1 325 0 0
// CHECK: 327 eq 1 323 326
// CHECK: 328 and 1 81 327
// CHECK: 329 uext 12 88 5
// CHECK: 330 srl 12 282 329
// CHECK: 331 slice 1 330 0 0
// CHECK: 332 eq 1 323 331
// CHECK: 333 and 1 328 332
// CHECK: 334 uext 12 94 5
// CHECK: 335 srl 12 282 334
// CHECK: 336 slice 1 335 0 0
// CHECK: 337 eq 1 323 336
// CHECK: 338 and 1 333 337
// CHECK: 339 ite 1 338 323 320
// CHECK: 340 uext 12 102 5
// CHECK: 341 srl 12 282 340
// CHECK: 342 slice 1 341 0 0
// CHECK: 343 uext 12 111 5
// CHECK: 344 srl 12 282 343
// CHECK: 345 slice 1 344 0 0
// CHECK: 346 eq 1 342 345
// CHECK: 347 and 1 109 346
// CHECK: 348 ite 1 347 342 339
// CHECK: 349 uext 12 119 5
// CHECK: 350 srl 12 282 349
// CHECK: 351 slice 1 350 0 0
// CHECK: 352 uext 12 128 5
// CHECK: 353 srl 12 282 352
// CHECK: 354 slice 1 353 0 0
// CHECK: 355 eq 1 351 354
// CHECK: 356 and 1 126 355
// CHECK: 357 ite 1 356 351 348
// CHECK: 358 uext 12 135 6
// CHECK: 359 srl 12 282 358
// CHECK: 360 slice 1 359 0 0
// CHECK: 361 uext 12 144 5
// CHECK: 362 srl 12 282 361
// CHECK: 363 slice 1 362 0 0
// CHECK: 364 eq 1 360 363
// CHECK: 365 and 1 142 364
// CHECK: 366 ite 1 365 360 357
// CHECK: 367 slice 1 8 16 16
// CHECK: 368 redor 1 282
// CHECK: 369 not 1 368
// CHECK: 370 redand 1 282
// CHECK: 371 or 1 369 370
// CHECK: 372 ite 1 371 367 366
// CHECK: 373 uext 12 158 5
// CHECK: 374 srl 12 282 373
// CHECK: 375 slice 1 374 0 0
// CHECK: 376 ite 1 165 375 372
// CHECK: 377 input 1
// CHECK: 378 ite 1 171 377 376
// CHECK: 379 input 1
// CHECK: 380 ite 1 179 379 378
// CHECK: 381 input 1
// CHECK: 382 slice 12 8 31 24
// CHECK: 383 uext 12 17 5
// CHECK: 384 srl 12 382 383
// CHECK: 385 slice 1 384 0 0
// CHECK: 386 uext 12 27 5
// CHECK: 387 srl 12 382 386
// CHECK: 388 slice 1 387 0 0
// CHECK: 389 eq 1 385 388
// CHECK: 390 and 1 25 389
// CHECK: 391 uext 12 34 5
// CHECK: 392 srl 12 382 391
// CHECK: 393 slice 1 392 0 0
// CHECK: 394 eq 1 385 393
// CHECK: 395 and 1 390 394
// CHECK: 396 uext 12 41 5
// CHECK: 397 srl 12 382 396
// CHECK: 398 slice 1 397 0 0
// CHECK: 399 eq 1 385 398
// CHECK: 400 and 1 395 399
// CHECK: 401 ite 1 400 385 381
// CHECK: 402 uext 12 48 6
// CHECK: 403 srl 12 382 402
// CHECK: 404 slice 1 403 0 0
// CHECK: 405 uext 12 55 6
// CHECK: 406 srl 12 382 405
// CHECK: 407 slice 1 406 0 0
// CHECK: 408 eq 1 404 407
// CHECK: 409 and 1 54 408
// CHECK: 410 uext 12 62 5
// CHECK: 411 srl 12 382 410
// CHECK: 412 slice 1 411 0 0
// CHECK: 413 eq 1 404 412
// CHECK: 414 and 1 409 413
// CHECK: 415 uext 12 69 5
// CHECK: 416 srl 12 382 415
// CHECK: 417 slice 1 416 0 0
// CHECK: 418 eq 1 404 417
// CHECK: 419 and 1 414 418
// CHECK: 420 ite 1 419 404 401
// CHECK: 421 uext 12 2 7
// CHECK: 422 srl 12 382 421
// CHECK: 423 slice 1 422 0 0
// CHECK: 424 uext 12 82 6
// CHECK: 425 srl 12 382 424
// CHECK: 426 slice 1 425 0 0
// CHECK: 427 eq 1 423 426
// CHECK: 428 and 1 81 427
// CHECK: 429 uext 12 88 5
// CHECK: 430 srl 12 382 429
// CHECK: 431 slice 1 430 0 0
// CHECK: 432 eq 1 423 431
// CHECK: 433 and 1 428 432
// CHECK: 434 uext 12 94 5
// CHECK: 435 srl 12 382 434
// CHECK: 436 slice 1 435 0 0
// CHECK: 437 eq 1 423 436
// CHECK: 438 and 1 433 437
// CHECK: 439 ite 1 438 423 420
// CHECK: 440 uext 12 102 5
// CHECK: 441 srl 12 382 440
// CHECK: 442 slice 1 441 0 0
// CHECK: 443 uext 12 111 5
// CHECK: 444 srl 12 382 443
// CHECK: 445 slice 1 444 0 0
// CHECK: 446 eq 1 442 445
// CHECK: 447 and 1 109 446
// CHECK: 448 ite 1 447 442 439
// CHECK: 449 uext 12 119 5
// CHECK: 450 srl 12 382 449
// CHECK: 451 slice 1 450 0 0
// CHECK: 452 uext 12 128 5
// CHECK: 453 srl 12 382 452
// CHECK: 454 slice 1 453 0 0
// CHECK: 455 eq 1 451 454
// CHECK: 456 and 1 126 455
// CHECK: 457 ite 1 456 451 448
// CHECK: 458 uext 12 135 6
// CHECK: 459 srl 12 382 458
// CHECK: 460 slice 1 459 0 0
// CHECK: 461 uext 12 144 5
// CHECK: 462 srl 12 382 461
// CHECK: 463 slice 1 462 0 0
// CHECK: 464 eq 1 460 463
// CHECK: 465 and 1 142 464
// CHECK: 466 ite 1 465 460 457
// CHECK: 467 slice 1 8 24 24
// CHECK: 468 redor 1 382
// CHECK: 469 not 1 468
// CHECK: 470 redand 1 382
// CHECK: 471 or 1 469 470
// CHECK: 472 ite 1 471 467 466
// CHECK: 473 uext 12 158 5
// CHECK: 474 srl 12 382 473
// CHECK: 475 slice 1 474 0 0
// CHECK: 476 ite 1 165 475 472
// CHECK: 477 input 1
// CHECK: 478 ite 1 171 477 476
// CHECK: 479 input 1
// CHECK: 480 ite 1 179 479 478
// CHECK: 481 concat 14 280 180
// CHECK: 482 concat 16 380 481
// CHECK: 483 concat 10 480 482
// CHECK: 484 concat 14 6 23
// CHECK: 485 uext 10 484 2
// CHECK: 486 srl 10 483 485
// CHECK: 487 slice 1 486 0 0
// CHECK: 488 eq 1 6 21
// CHECK: 489 eq 1 6 23
// CHECK: 490 or 1 488 489
// CHECK: 491 concat 14 6 21
// CHECK: 492 uext 10 491 2
// CHECK: 493 srl 10 483 492
// CHECK: 494 slice 1 493 0 0
// CHECK: 495 eq 1 487 494
// CHECK: 496 and 1 490 495
// CHECK: 497 ite 1 496 487 9
// CHECK: 498 uext 10 5 3
// CHECK: 499 srl 10 483 498
// CHECK: 500 slice 1 499 0 0
// CHECK: 501 eq 1 5 21
// CHECK: 502 eq 1 5 23
// CHECK: 503 or 1 501 502
// CHECK: 504 concat 14 21 5
// CHECK: 505 uext 10 504 2
// CHECK: 506 srl 10 483 505
// CHECK: 507 slice 1 506 0 0
// CHECK: 508 eq 1 500 507
// CHECK: 509 and 1 503 508
// CHECK: 510 ite 1 509 500 497
// CHECK: 511 redor 1 483
// CHECK: 512 not 1 511
// CHECK: 513 redand 1 483
// CHECK: 514 or 1 512 513
// CHECK: 515 ite 1 514 180 510
// CHECK: 516 concat 14 6 5
// CHECK: 517 uext 10 516 2
// CHECK: 518 srl 10 483 517
// CHECK: 519 slice 1 518 0 0
// CHECK: 520 xor 1 6 5
// CHECK: 521 eq 1 520 21
// CHECK: 522 eq 1 520 23
// CHECK: 523 or 1 521 522
// CHECK: 524 ite 1 523 519 515
// CHECK: 525 ite 1 171 151 524
// CHECK: 526 concat 14 3 2
// CHECK: 527 concat 16 4 526
// CHECK: 528 concat 10 5 527
// CHECK: 529 sort bitvec 5
// CHECK: 530 concat 529 6 528
// CHECK: 531 uext 7 530 27
// CHECK: 532 srl 7 8 531
// CHECK: 533 slice 1 532 0 0
// CHECK: 534 ite 1 179 533 525
// CHECK: 535 output 534 O 
