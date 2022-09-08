// RUN: python3 $LAKEROAD_DIR/bin/convert_module_to_btor.py \
// RUN:   --infile %s --top LUT6 --remove-lines-with '$finish' \
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
//  /   /                  6-Bit Look-Up Table
// /___/   /\     Filename : LUT6.v
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

module LUT6 #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter [63:0] INIT = 64'h0000000000000000
)(
  output O,

  input I0,
  input I1,
  input I2,
  input I3,
  input I4,
  input I5
);

// define constants
  localparam MODULE_NAME = "LUT6";

  reg trig_attr = 1'b0;
// include dynamic registers - XILINX test only
`ifdef XIL_DR
  `include "LUT6_dr.v"
`else
  reg [63:0] INIT_REG = INIT;
`endif

// begin behavioral model

  reg O_out;

  assign O = O_out;

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

 always @(I0 or I1 or I2 or I3 or I4 or I5)  begin
   if ( (I0 ^ I1  ^ I2 ^ I3 ^ I4 ^ I5) === 1'b0 || (I0 ^ I1  ^ I2 ^ I3 ^ I4 ^ I5) === 1'b1)
     O_out = INIT_REG[{I5, I4, I3, I2, I1, I0}];
   else if ( ~(|INIT_REG) || &INIT_REG )
     O_out = INIT_REG[0];
   else
     O_out = lut_mux8_f ({lut_mux8_f (INIT_REG[63:56], {I2, I1, I0}),
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
	(I0 => O) = (0:0:0, 0:0:0);
	(I1 => O) = (0:0:0, 0:0:0);
	(I2 => O) = (0:0:0, 0:0:0);
	(I3 => O) = (0:0:0, 0:0:0);
	(I4 => O) = (0:0:0, 0:0:0);
	(I5 => O) = (0:0:0, 0:0:0);
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
// CHECK: 7 input 1 I5 
// CHECK: 8 sort bitvec 64
// CHECK: 9 input 8 INIT 
// CHECK: 10 input 1
// CHECK: 11 sort bitvec 8
// CHECK: 12 input 1
// CHECK: 13 slice 11 9 7 0
// CHECK: 14 sort bitvec 2
// CHECK: 15 const 14 00
// CHECK: 16 sort bitvec 3
// CHECK: 17 concat 16 4 15
// CHECK: 18 uext 11 17 5
// CHECK: 19 srl 11 13 18
// CHECK: 20 slice 1 19 0 0
// CHECK: 21 const 1 1
// CHECK: 22 eq 1 4 21
// CHECK: 23 const 1 0
// CHECK: 24 eq 1 4 23
// CHECK: 25 or 1 22 24
// CHECK: 26 const 14 01
// CHECK: 27 concat 16 4 26
// CHECK: 28 uext 11 27 5
// CHECK: 29 srl 11 13 28
// CHECK: 30 slice 1 29 0 0
// CHECK: 31 eq 1 20 30
// CHECK: 32 and 1 25 31
// CHECK: 33 const 14 10
// CHECK: 34 concat 16 4 33
// CHECK: 35 uext 11 34 5
// CHECK: 36 srl 11 13 35
// CHECK: 37 slice 1 36 0 0
// CHECK: 38 eq 1 20 37
// CHECK: 39 and 1 32 38
// CHECK: 40 const 14 11
// CHECK: 41 concat 16 4 40
// CHECK: 42 uext 11 41 5
// CHECK: 43 srl 11 13 42
// CHECK: 44 slice 1 43 0 0
// CHECK: 45 eq 1 20 44
// CHECK: 46 and 1 39 45
// CHECK: 47 ite 1 46 20 12
// CHECK: 48 concat 14 3 23
// CHECK: 49 uext 11 48 6
// CHECK: 50 srl 11 13 49
// CHECK: 51 slice 1 50 0 0
// CHECK: 52 eq 1 3 21
// CHECK: 53 eq 1 3 23
// CHECK: 54 or 1 52 53
// CHECK: 55 concat 14 3 21
// CHECK: 56 uext 11 55 6
// CHECK: 57 srl 11 13 56
// CHECK: 58 slice 1 57 0 0
// CHECK: 59 eq 1 51 58
// CHECK: 60 and 1 54 59
// CHECK: 61 concat 14 3 23
// CHECK: 62 concat 16 21 61
// CHECK: 63 uext 11 62 5
// CHECK: 64 srl 11 13 63
// CHECK: 65 slice 1 64 0 0
// CHECK: 66 eq 1 51 65
// CHECK: 67 and 1 60 66
// CHECK: 68 concat 14 3 21
// CHECK: 69 concat 16 21 68
// CHECK: 70 uext 11 69 5
// CHECK: 71 srl 11 13 70
// CHECK: 72 slice 1 71 0 0
// CHECK: 73 eq 1 51 72
// CHECK: 74 and 1 67 73
// CHECK: 75 ite 1 74 51 47
// CHECK: 76 uext 11 2 7
// CHECK: 77 srl 11 13 76
// CHECK: 78 slice 1 77 0 0
// CHECK: 79 eq 1 2 21
// CHECK: 80 eq 1 2 23
// CHECK: 81 or 1 79 80
// CHECK: 82 concat 14 21 2
// CHECK: 83 uext 11 82 6
// CHECK: 84 srl 11 13 83
// CHECK: 85 slice 1 84 0 0
// CHECK: 86 eq 1 78 85
// CHECK: 87 and 1 81 86
// CHECK: 88 concat 16 33 2
// CHECK: 89 uext 11 88 5
// CHECK: 90 srl 11 13 89
// CHECK: 91 slice 1 90 0 0
// CHECK: 92 eq 1 78 91
// CHECK: 93 and 1 87 92
// CHECK: 94 concat 16 40 2
// CHECK: 95 uext 11 94 5
// CHECK: 96 srl 11 13 95
// CHECK: 97 slice 1 96 0 0
// CHECK: 98 eq 1 78 97
// CHECK: 99 and 1 93 98
// CHECK: 100 ite 1 99 78 75
// CHECK: 101 concat 14 3 23
// CHECK: 102 concat 16 4 101
// CHECK: 103 uext 11 102 5
// CHECK: 104 srl 11 13 103
// CHECK: 105 slice 1 104 0 0
// CHECK: 106 xor 1 4 3
// CHECK: 107 eq 1 106 21
// CHECK: 108 eq 1 106 23
// CHECK: 109 or 1 107 108
// CHECK: 110 concat 14 3 21
// CHECK: 111 concat 16 4 110
// CHECK: 112 uext 11 111 5
// CHECK: 113 srl 11 13 112
// CHECK: 114 slice 1 113 0 0
// CHECK: 115 eq 1 105 114
// CHECK: 116 and 1 109 115
// CHECK: 117 ite 1 116 105 100
// CHECK: 118 concat 14 23 2
// CHECK: 119 concat 16 4 118
// CHECK: 120 uext 11 119 5
// CHECK: 121 srl 11 13 120
// CHECK: 122 slice 1 121 0 0
// CHECK: 123 xor 1 4 2
// CHECK: 124 eq 1 123 21
// CHECK: 125 eq 1 123 23
// CHECK: 126 or 1 124 125
// CHECK: 127 concat 14 21 2
// CHECK: 128 concat 16 4 127
// CHECK: 129 uext 11 128 5
// CHECK: 130 srl 11 13 129
// CHECK: 131 slice 1 130 0 0
// CHECK: 132 eq 1 122 131
// CHECK: 133 and 1 126 132
// CHECK: 134 ite 1 133 122 117
// CHECK: 135 concat 14 3 2
// CHECK: 136 uext 11 135 6
// CHECK: 137 srl 11 13 136
// CHECK: 138 slice 1 137 0 0
// CHECK: 139 xor 1 2 3
// CHECK: 140 eq 1 139 21
// CHECK: 141 eq 1 139 23
// CHECK: 142 or 1 140 141
// CHECK: 143 concat 14 3 2
// CHECK: 144 concat 16 21 143
// CHECK: 145 uext 11 144 5
// CHECK: 146 srl 11 13 145
// CHECK: 147 slice 1 146 0 0
// CHECK: 148 eq 1 138 147
// CHECK: 149 and 1 142 148
// CHECK: 150 ite 1 149 138 134
// CHECK: 151 slice 1 9 0 0
// CHECK: 152 redor 1 13
// CHECK: 153 not 1 152
// CHECK: 154 redand 1 13
// CHECK: 155 or 1 153 154
// CHECK: 156 ite 1 155 151 150
// CHECK: 157 concat 14 3 2
// CHECK: 158 concat 16 4 157
// CHECK: 159 uext 11 158 5
// CHECK: 160 srl 11 13 159
// CHECK: 161 slice 1 160 0 0
// CHECK: 162 xor 1 106 2
// CHECK: 163 eq 1 162 21
// CHECK: 164 eq 1 162 23
// CHECK: 165 or 1 163 164
// CHECK: 166 ite 1 165 161 156
// CHECK: 167 input 1
// CHECK: 168 redor 1 9
// CHECK: 169 not 1 168
// CHECK: 170 redand 1 9
// CHECK: 171 or 1 169 170
// CHECK: 172 ite 1 171 167 166
// CHECK: 173 input 1
// CHECK: 174 xor 1 139 4
// CHECK: 175 xor 1 174 5
// CHECK: 176 xor 1 175 6
// CHECK: 177 xor 1 176 7
// CHECK: 178 eq 1 177 23
// CHECK: 179 eq 1 177 21
// CHECK: 180 or 1 178 179
// CHECK: 181 ite 1 180 173 172
// CHECK: 182 input 1
// CHECK: 183 slice 11 9 15 8
// CHECK: 184 uext 11 17 5
// CHECK: 185 srl 11 183 184
// CHECK: 186 slice 1 185 0 0
// CHECK: 187 uext 11 27 5
// CHECK: 188 srl 11 183 187
// CHECK: 189 slice 1 188 0 0
// CHECK: 190 eq 1 186 189
// CHECK: 191 and 1 25 190
// CHECK: 192 uext 11 34 5
// CHECK: 193 srl 11 183 192
// CHECK: 194 slice 1 193 0 0
// CHECK: 195 eq 1 186 194
// CHECK: 196 and 1 191 195
// CHECK: 197 uext 11 41 5
// CHECK: 198 srl 11 183 197
// CHECK: 199 slice 1 198 0 0
// CHECK: 200 eq 1 186 199
// CHECK: 201 and 1 196 200
// CHECK: 202 ite 1 201 186 182
// CHECK: 203 uext 11 48 6
// CHECK: 204 srl 11 183 203
// CHECK: 205 slice 1 204 0 0
// CHECK: 206 uext 11 55 6
// CHECK: 207 srl 11 183 206
// CHECK: 208 slice 1 207 0 0
// CHECK: 209 eq 1 205 208
// CHECK: 210 and 1 54 209
// CHECK: 211 uext 11 62 5
// CHECK: 212 srl 11 183 211
// CHECK: 213 slice 1 212 0 0
// CHECK: 214 eq 1 205 213
// CHECK: 215 and 1 210 214
// CHECK: 216 uext 11 69 5
// CHECK: 217 srl 11 183 216
// CHECK: 218 slice 1 217 0 0
// CHECK: 219 eq 1 205 218
// CHECK: 220 and 1 215 219
// CHECK: 221 ite 1 220 205 202
// CHECK: 222 uext 11 2 7
// CHECK: 223 srl 11 183 222
// CHECK: 224 slice 1 223 0 0
// CHECK: 225 uext 11 82 6
// CHECK: 226 srl 11 183 225
// CHECK: 227 slice 1 226 0 0
// CHECK: 228 eq 1 224 227
// CHECK: 229 and 1 81 228
// CHECK: 230 uext 11 88 5
// CHECK: 231 srl 11 183 230
// CHECK: 232 slice 1 231 0 0
// CHECK: 233 eq 1 224 232
// CHECK: 234 and 1 229 233
// CHECK: 235 uext 11 94 5
// CHECK: 236 srl 11 183 235
// CHECK: 237 slice 1 236 0 0
// CHECK: 238 eq 1 224 237
// CHECK: 239 and 1 234 238
// CHECK: 240 ite 1 239 224 221
// CHECK: 241 uext 11 102 5
// CHECK: 242 srl 11 183 241
// CHECK: 243 slice 1 242 0 0
// CHECK: 244 uext 11 111 5
// CHECK: 245 srl 11 183 244
// CHECK: 246 slice 1 245 0 0
// CHECK: 247 eq 1 243 246
// CHECK: 248 and 1 109 247
// CHECK: 249 ite 1 248 243 240
// CHECK: 250 uext 11 119 5
// CHECK: 251 srl 11 183 250
// CHECK: 252 slice 1 251 0 0
// CHECK: 253 uext 11 128 5
// CHECK: 254 srl 11 183 253
// CHECK: 255 slice 1 254 0 0
// CHECK: 256 eq 1 252 255
// CHECK: 257 and 1 126 256
// CHECK: 258 ite 1 257 252 249
// CHECK: 259 uext 11 135 6
// CHECK: 260 srl 11 183 259
// CHECK: 261 slice 1 260 0 0
// CHECK: 262 uext 11 144 5
// CHECK: 263 srl 11 183 262
// CHECK: 264 slice 1 263 0 0
// CHECK: 265 eq 1 261 264
// CHECK: 266 and 1 142 265
// CHECK: 267 ite 1 266 261 258
// CHECK: 268 slice 1 9 8 8
// CHECK: 269 redor 1 183
// CHECK: 270 not 1 269
// CHECK: 271 redand 1 183
// CHECK: 272 or 1 270 271
// CHECK: 273 ite 1 272 268 267
// CHECK: 274 uext 11 158 5
// CHECK: 275 srl 11 183 274
// CHECK: 276 slice 1 275 0 0
// CHECK: 277 ite 1 165 276 273
// CHECK: 278 input 1
// CHECK: 279 ite 1 171 278 277
// CHECK: 280 input 1
// CHECK: 281 ite 1 180 280 279
// CHECK: 282 input 1
// CHECK: 283 slice 11 9 23 16
// CHECK: 284 uext 11 17 5
// CHECK: 285 srl 11 283 284
// CHECK: 286 slice 1 285 0 0
// CHECK: 287 uext 11 27 5
// CHECK: 288 srl 11 283 287
// CHECK: 289 slice 1 288 0 0
// CHECK: 290 eq 1 286 289
// CHECK: 291 and 1 25 290
// CHECK: 292 uext 11 34 5
// CHECK: 293 srl 11 283 292
// CHECK: 294 slice 1 293 0 0
// CHECK: 295 eq 1 286 294
// CHECK: 296 and 1 291 295
// CHECK: 297 uext 11 41 5
// CHECK: 298 srl 11 283 297
// CHECK: 299 slice 1 298 0 0
// CHECK: 300 eq 1 286 299
// CHECK: 301 and 1 296 300
// CHECK: 302 ite 1 301 286 282
// CHECK: 303 uext 11 48 6
// CHECK: 304 srl 11 283 303
// CHECK: 305 slice 1 304 0 0
// CHECK: 306 uext 11 55 6
// CHECK: 307 srl 11 283 306
// CHECK: 308 slice 1 307 0 0
// CHECK: 309 eq 1 305 308
// CHECK: 310 and 1 54 309
// CHECK: 311 uext 11 62 5
// CHECK: 312 srl 11 283 311
// CHECK: 313 slice 1 312 0 0
// CHECK: 314 eq 1 305 313
// CHECK: 315 and 1 310 314
// CHECK: 316 uext 11 69 5
// CHECK: 317 srl 11 283 316
// CHECK: 318 slice 1 317 0 0
// CHECK: 319 eq 1 305 318
// CHECK: 320 and 1 315 319
// CHECK: 321 ite 1 320 305 302
// CHECK: 322 uext 11 2 7
// CHECK: 323 srl 11 283 322
// CHECK: 324 slice 1 323 0 0
// CHECK: 325 uext 11 82 6
// CHECK: 326 srl 11 283 325
// CHECK: 327 slice 1 326 0 0
// CHECK: 328 eq 1 324 327
// CHECK: 329 and 1 81 328
// CHECK: 330 uext 11 88 5
// CHECK: 331 srl 11 283 330
// CHECK: 332 slice 1 331 0 0
// CHECK: 333 eq 1 324 332
// CHECK: 334 and 1 329 333
// CHECK: 335 uext 11 94 5
// CHECK: 336 srl 11 283 335
// CHECK: 337 slice 1 336 0 0
// CHECK: 338 eq 1 324 337
// CHECK: 339 and 1 334 338
// CHECK: 340 ite 1 339 324 321
// CHECK: 341 uext 11 102 5
// CHECK: 342 srl 11 283 341
// CHECK: 343 slice 1 342 0 0
// CHECK: 344 uext 11 111 5
// CHECK: 345 srl 11 283 344
// CHECK: 346 slice 1 345 0 0
// CHECK: 347 eq 1 343 346
// CHECK: 348 and 1 109 347
// CHECK: 349 ite 1 348 343 340
// CHECK: 350 uext 11 119 5
// CHECK: 351 srl 11 283 350
// CHECK: 352 slice 1 351 0 0
// CHECK: 353 uext 11 128 5
// CHECK: 354 srl 11 283 353
// CHECK: 355 slice 1 354 0 0
// CHECK: 356 eq 1 352 355
// CHECK: 357 and 1 126 356
// CHECK: 358 ite 1 357 352 349
// CHECK: 359 uext 11 135 6
// CHECK: 360 srl 11 283 359
// CHECK: 361 slice 1 360 0 0
// CHECK: 362 uext 11 144 5
// CHECK: 363 srl 11 283 362
// CHECK: 364 slice 1 363 0 0
// CHECK: 365 eq 1 361 364
// CHECK: 366 and 1 142 365
// CHECK: 367 ite 1 366 361 358
// CHECK: 368 slice 1 9 16 16
// CHECK: 369 redor 1 283
// CHECK: 370 not 1 369
// CHECK: 371 redand 1 283
// CHECK: 372 or 1 370 371
// CHECK: 373 ite 1 372 368 367
// CHECK: 374 uext 11 158 5
// CHECK: 375 srl 11 283 374
// CHECK: 376 slice 1 375 0 0
// CHECK: 377 ite 1 165 376 373
// CHECK: 378 input 1
// CHECK: 379 ite 1 171 378 377
// CHECK: 380 input 1
// CHECK: 381 ite 1 180 380 379
// CHECK: 382 input 1
// CHECK: 383 slice 11 9 31 24
// CHECK: 384 uext 11 17 5
// CHECK: 385 srl 11 383 384
// CHECK: 386 slice 1 385 0 0
// CHECK: 387 uext 11 27 5
// CHECK: 388 srl 11 383 387
// CHECK: 389 slice 1 388 0 0
// CHECK: 390 eq 1 386 389
// CHECK: 391 and 1 25 390
// CHECK: 392 uext 11 34 5
// CHECK: 393 srl 11 383 392
// CHECK: 394 slice 1 393 0 0
// CHECK: 395 eq 1 386 394
// CHECK: 396 and 1 391 395
// CHECK: 397 uext 11 41 5
// CHECK: 398 srl 11 383 397
// CHECK: 399 slice 1 398 0 0
// CHECK: 400 eq 1 386 399
// CHECK: 401 and 1 396 400
// CHECK: 402 ite 1 401 386 382
// CHECK: 403 uext 11 48 6
// CHECK: 404 srl 11 383 403
// CHECK: 405 slice 1 404 0 0
// CHECK: 406 uext 11 55 6
// CHECK: 407 srl 11 383 406
// CHECK: 408 slice 1 407 0 0
// CHECK: 409 eq 1 405 408
// CHECK: 410 and 1 54 409
// CHECK: 411 uext 11 62 5
// CHECK: 412 srl 11 383 411
// CHECK: 413 slice 1 412 0 0
// CHECK: 414 eq 1 405 413
// CHECK: 415 and 1 410 414
// CHECK: 416 uext 11 69 5
// CHECK: 417 srl 11 383 416
// CHECK: 418 slice 1 417 0 0
// CHECK: 419 eq 1 405 418
// CHECK: 420 and 1 415 419
// CHECK: 421 ite 1 420 405 402
// CHECK: 422 uext 11 2 7
// CHECK: 423 srl 11 383 422
// CHECK: 424 slice 1 423 0 0
// CHECK: 425 uext 11 82 6
// CHECK: 426 srl 11 383 425
// CHECK: 427 slice 1 426 0 0
// CHECK: 428 eq 1 424 427
// CHECK: 429 and 1 81 428
// CHECK: 430 uext 11 88 5
// CHECK: 431 srl 11 383 430
// CHECK: 432 slice 1 431 0 0
// CHECK: 433 eq 1 424 432
// CHECK: 434 and 1 429 433
// CHECK: 435 uext 11 94 5
// CHECK: 436 srl 11 383 435
// CHECK: 437 slice 1 436 0 0
// CHECK: 438 eq 1 424 437
// CHECK: 439 and 1 434 438
// CHECK: 440 ite 1 439 424 421
// CHECK: 441 uext 11 102 5
// CHECK: 442 srl 11 383 441
// CHECK: 443 slice 1 442 0 0
// CHECK: 444 uext 11 111 5
// CHECK: 445 srl 11 383 444
// CHECK: 446 slice 1 445 0 0
// CHECK: 447 eq 1 443 446
// CHECK: 448 and 1 109 447
// CHECK: 449 ite 1 448 443 440
// CHECK: 450 uext 11 119 5
// CHECK: 451 srl 11 383 450
// CHECK: 452 slice 1 451 0 0
// CHECK: 453 uext 11 128 5
// CHECK: 454 srl 11 383 453
// CHECK: 455 slice 1 454 0 0
// CHECK: 456 eq 1 452 455
// CHECK: 457 and 1 126 456
// CHECK: 458 ite 1 457 452 449
// CHECK: 459 uext 11 135 6
// CHECK: 460 srl 11 383 459
// CHECK: 461 slice 1 460 0 0
// CHECK: 462 uext 11 144 5
// CHECK: 463 srl 11 383 462
// CHECK: 464 slice 1 463 0 0
// CHECK: 465 eq 1 461 464
// CHECK: 466 and 1 142 465
// CHECK: 467 ite 1 466 461 458
// CHECK: 468 slice 1 9 24 24
// CHECK: 469 redor 1 383
// CHECK: 470 not 1 469
// CHECK: 471 redand 1 383
// CHECK: 472 or 1 470 471
// CHECK: 473 ite 1 472 468 467
// CHECK: 474 uext 11 158 5
// CHECK: 475 srl 11 383 474
// CHECK: 476 slice 1 475 0 0
// CHECK: 477 ite 1 165 476 473
// CHECK: 478 input 1
// CHECK: 479 ite 1 171 478 477
// CHECK: 480 input 1
// CHECK: 481 ite 1 180 480 479
// CHECK: 482 input 1
// CHECK: 483 slice 11 9 39 32
// CHECK: 484 uext 11 17 5
// CHECK: 485 srl 11 483 484
// CHECK: 486 slice 1 485 0 0
// CHECK: 487 uext 11 27 5
// CHECK: 488 srl 11 483 487
// CHECK: 489 slice 1 488 0 0
// CHECK: 490 eq 1 486 489
// CHECK: 491 and 1 25 490
// CHECK: 492 uext 11 34 5
// CHECK: 493 srl 11 483 492
// CHECK: 494 slice 1 493 0 0
// CHECK: 495 eq 1 486 494
// CHECK: 496 and 1 491 495
// CHECK: 497 uext 11 41 5
// CHECK: 498 srl 11 483 497
// CHECK: 499 slice 1 498 0 0
// CHECK: 500 eq 1 486 499
// CHECK: 501 and 1 496 500
// CHECK: 502 ite 1 501 486 482
// CHECK: 503 uext 11 48 6
// CHECK: 504 srl 11 483 503
// CHECK: 505 slice 1 504 0 0
// CHECK: 506 uext 11 55 6
// CHECK: 507 srl 11 483 506
// CHECK: 508 slice 1 507 0 0
// CHECK: 509 eq 1 505 508
// CHECK: 510 and 1 54 509
// CHECK: 511 uext 11 62 5
// CHECK: 512 srl 11 483 511
// CHECK: 513 slice 1 512 0 0
// CHECK: 514 eq 1 505 513
// CHECK: 515 and 1 510 514
// CHECK: 516 uext 11 69 5
// CHECK: 517 srl 11 483 516
// CHECK: 518 slice 1 517 0 0
// CHECK: 519 eq 1 505 518
// CHECK: 520 and 1 515 519
// CHECK: 521 ite 1 520 505 502
// CHECK: 522 uext 11 2 7
// CHECK: 523 srl 11 483 522
// CHECK: 524 slice 1 523 0 0
// CHECK: 525 uext 11 82 6
// CHECK: 526 srl 11 483 525
// CHECK: 527 slice 1 526 0 0
// CHECK: 528 eq 1 524 527
// CHECK: 529 and 1 81 528
// CHECK: 530 uext 11 88 5
// CHECK: 531 srl 11 483 530
// CHECK: 532 slice 1 531 0 0
// CHECK: 533 eq 1 524 532
// CHECK: 534 and 1 529 533
// CHECK: 535 uext 11 94 5
// CHECK: 536 srl 11 483 535
// CHECK: 537 slice 1 536 0 0
// CHECK: 538 eq 1 524 537
// CHECK: 539 and 1 534 538
// CHECK: 540 ite 1 539 524 521
// CHECK: 541 uext 11 102 5
// CHECK: 542 srl 11 483 541
// CHECK: 543 slice 1 542 0 0
// CHECK: 544 uext 11 111 5
// CHECK: 545 srl 11 483 544
// CHECK: 546 slice 1 545 0 0
// CHECK: 547 eq 1 543 546
// CHECK: 548 and 1 109 547
// CHECK: 549 ite 1 548 543 540
// CHECK: 550 uext 11 119 5
// CHECK: 551 srl 11 483 550
// CHECK: 552 slice 1 551 0 0
// CHECK: 553 uext 11 128 5
// CHECK: 554 srl 11 483 553
// CHECK: 555 slice 1 554 0 0
// CHECK: 556 eq 1 552 555
// CHECK: 557 and 1 126 556
// CHECK: 558 ite 1 557 552 549
// CHECK: 559 uext 11 135 6
// CHECK: 560 srl 11 483 559
// CHECK: 561 slice 1 560 0 0
// CHECK: 562 uext 11 144 5
// CHECK: 563 srl 11 483 562
// CHECK: 564 slice 1 563 0 0
// CHECK: 565 eq 1 561 564
// CHECK: 566 and 1 142 565
// CHECK: 567 ite 1 566 561 558
// CHECK: 568 slice 1 9 32 32
// CHECK: 569 redor 1 483
// CHECK: 570 not 1 569
// CHECK: 571 redand 1 483
// CHECK: 572 or 1 570 571
// CHECK: 573 ite 1 572 568 567
// CHECK: 574 uext 11 158 5
// CHECK: 575 srl 11 483 574
// CHECK: 576 slice 1 575 0 0
// CHECK: 577 ite 1 165 576 573
// CHECK: 578 input 1
// CHECK: 579 ite 1 171 578 577
// CHECK: 580 input 1
// CHECK: 581 ite 1 180 580 579
// CHECK: 582 input 1
// CHECK: 583 slice 11 9 47 40
// CHECK: 584 uext 11 17 5
// CHECK: 585 srl 11 583 584
// CHECK: 586 slice 1 585 0 0
// CHECK: 587 uext 11 27 5
// CHECK: 588 srl 11 583 587
// CHECK: 589 slice 1 588 0 0
// CHECK: 590 eq 1 586 589
// CHECK: 591 and 1 25 590
// CHECK: 592 uext 11 34 5
// CHECK: 593 srl 11 583 592
// CHECK: 594 slice 1 593 0 0
// CHECK: 595 eq 1 586 594
// CHECK: 596 and 1 591 595
// CHECK: 597 uext 11 41 5
// CHECK: 598 srl 11 583 597
// CHECK: 599 slice 1 598 0 0
// CHECK: 600 eq 1 586 599
// CHECK: 601 and 1 596 600
// CHECK: 602 ite 1 601 586 582
// CHECK: 603 uext 11 48 6
// CHECK: 604 srl 11 583 603
// CHECK: 605 slice 1 604 0 0
// CHECK: 606 uext 11 55 6
// CHECK: 607 srl 11 583 606
// CHECK: 608 slice 1 607 0 0
// CHECK: 609 eq 1 605 608
// CHECK: 610 and 1 54 609
// CHECK: 611 uext 11 62 5
// CHECK: 612 srl 11 583 611
// CHECK: 613 slice 1 612 0 0
// CHECK: 614 eq 1 605 613
// CHECK: 615 and 1 610 614
// CHECK: 616 uext 11 69 5
// CHECK: 617 srl 11 583 616
// CHECK: 618 slice 1 617 0 0
// CHECK: 619 eq 1 605 618
// CHECK: 620 and 1 615 619
// CHECK: 621 ite 1 620 605 602
// CHECK: 622 uext 11 2 7
// CHECK: 623 srl 11 583 622
// CHECK: 624 slice 1 623 0 0
// CHECK: 625 uext 11 82 6
// CHECK: 626 srl 11 583 625
// CHECK: 627 slice 1 626 0 0
// CHECK: 628 eq 1 624 627
// CHECK: 629 and 1 81 628
// CHECK: 630 uext 11 88 5
// CHECK: 631 srl 11 583 630
// CHECK: 632 slice 1 631 0 0
// CHECK: 633 eq 1 624 632
// CHECK: 634 and 1 629 633
// CHECK: 635 uext 11 94 5
// CHECK: 636 srl 11 583 635
// CHECK: 637 slice 1 636 0 0
// CHECK: 638 eq 1 624 637
// CHECK: 639 and 1 634 638
// CHECK: 640 ite 1 639 624 621
// CHECK: 641 uext 11 102 5
// CHECK: 642 srl 11 583 641
// CHECK: 643 slice 1 642 0 0
// CHECK: 644 uext 11 111 5
// CHECK: 645 srl 11 583 644
// CHECK: 646 slice 1 645 0 0
// CHECK: 647 eq 1 643 646
// CHECK: 648 and 1 109 647
// CHECK: 649 ite 1 648 643 640
// CHECK: 650 uext 11 119 5
// CHECK: 651 srl 11 583 650
// CHECK: 652 slice 1 651 0 0
// CHECK: 653 uext 11 128 5
// CHECK: 654 srl 11 583 653
// CHECK: 655 slice 1 654 0 0
// CHECK: 656 eq 1 652 655
// CHECK: 657 and 1 126 656
// CHECK: 658 ite 1 657 652 649
// CHECK: 659 uext 11 135 6
// CHECK: 660 srl 11 583 659
// CHECK: 661 slice 1 660 0 0
// CHECK: 662 uext 11 144 5
// CHECK: 663 srl 11 583 662
// CHECK: 664 slice 1 663 0 0
// CHECK: 665 eq 1 661 664
// CHECK: 666 and 1 142 665
// CHECK: 667 ite 1 666 661 658
// CHECK: 668 slice 1 9 40 40
// CHECK: 669 redor 1 583
// CHECK: 670 not 1 669
// CHECK: 671 redand 1 583
// CHECK: 672 or 1 670 671
// CHECK: 673 ite 1 672 668 667
// CHECK: 674 uext 11 158 5
// CHECK: 675 srl 11 583 674
// CHECK: 676 slice 1 675 0 0
// CHECK: 677 ite 1 165 676 673
// CHECK: 678 input 1
// CHECK: 679 ite 1 171 678 677
// CHECK: 680 input 1
// CHECK: 681 ite 1 180 680 679
// CHECK: 682 input 1
// CHECK: 683 slice 11 9 55 48
// CHECK: 684 uext 11 17 5
// CHECK: 685 srl 11 683 684
// CHECK: 686 slice 1 685 0 0
// CHECK: 687 uext 11 27 5
// CHECK: 688 srl 11 683 687
// CHECK: 689 slice 1 688 0 0
// CHECK: 690 eq 1 686 689
// CHECK: 691 and 1 25 690
// CHECK: 692 uext 11 34 5
// CHECK: 693 srl 11 683 692
// CHECK: 694 slice 1 693 0 0
// CHECK: 695 eq 1 686 694
// CHECK: 696 and 1 691 695
// CHECK: 697 uext 11 41 5
// CHECK: 698 srl 11 683 697
// CHECK: 699 slice 1 698 0 0
// CHECK: 700 eq 1 686 699
// CHECK: 701 and 1 696 700
// CHECK: 702 ite 1 701 686 682
// CHECK: 703 uext 11 48 6
// CHECK: 704 srl 11 683 703
// CHECK: 705 slice 1 704 0 0
// CHECK: 706 uext 11 55 6
// CHECK: 707 srl 11 683 706
// CHECK: 708 slice 1 707 0 0
// CHECK: 709 eq 1 705 708
// CHECK: 710 and 1 54 709
// CHECK: 711 uext 11 62 5
// CHECK: 712 srl 11 683 711
// CHECK: 713 slice 1 712 0 0
// CHECK: 714 eq 1 705 713
// CHECK: 715 and 1 710 714
// CHECK: 716 uext 11 69 5
// CHECK: 717 srl 11 683 716
// CHECK: 718 slice 1 717 0 0
// CHECK: 719 eq 1 705 718
// CHECK: 720 and 1 715 719
// CHECK: 721 ite 1 720 705 702
// CHECK: 722 uext 11 2 7
// CHECK: 723 srl 11 683 722
// CHECK: 724 slice 1 723 0 0
// CHECK: 725 uext 11 82 6
// CHECK: 726 srl 11 683 725
// CHECK: 727 slice 1 726 0 0
// CHECK: 728 eq 1 724 727
// CHECK: 729 and 1 81 728
// CHECK: 730 uext 11 88 5
// CHECK: 731 srl 11 683 730
// CHECK: 732 slice 1 731 0 0
// CHECK: 733 eq 1 724 732
// CHECK: 734 and 1 729 733
// CHECK: 735 uext 11 94 5
// CHECK: 736 srl 11 683 735
// CHECK: 737 slice 1 736 0 0
// CHECK: 738 eq 1 724 737
// CHECK: 739 and 1 734 738
// CHECK: 740 ite 1 739 724 721
// CHECK: 741 uext 11 102 5
// CHECK: 742 srl 11 683 741
// CHECK: 743 slice 1 742 0 0
// CHECK: 744 uext 11 111 5
// CHECK: 745 srl 11 683 744
// CHECK: 746 slice 1 745 0 0
// CHECK: 747 eq 1 743 746
// CHECK: 748 and 1 109 747
// CHECK: 749 ite 1 748 743 740
// CHECK: 750 uext 11 119 5
// CHECK: 751 srl 11 683 750
// CHECK: 752 slice 1 751 0 0
// CHECK: 753 uext 11 128 5
// CHECK: 754 srl 11 683 753
// CHECK: 755 slice 1 754 0 0
// CHECK: 756 eq 1 752 755
// CHECK: 757 and 1 126 756
// CHECK: 758 ite 1 757 752 749
// CHECK: 759 uext 11 135 6
// CHECK: 760 srl 11 683 759
// CHECK: 761 slice 1 760 0 0
// CHECK: 762 uext 11 144 5
// CHECK: 763 srl 11 683 762
// CHECK: 764 slice 1 763 0 0
// CHECK: 765 eq 1 761 764
// CHECK: 766 and 1 142 765
// CHECK: 767 ite 1 766 761 758
// CHECK: 768 slice 1 9 48 48
// CHECK: 769 redor 1 683
// CHECK: 770 not 1 769
// CHECK: 771 redand 1 683
// CHECK: 772 or 1 770 771
// CHECK: 773 ite 1 772 768 767
// CHECK: 774 uext 11 158 5
// CHECK: 775 srl 11 683 774
// CHECK: 776 slice 1 775 0 0
// CHECK: 777 ite 1 165 776 773
// CHECK: 778 input 1
// CHECK: 779 ite 1 171 778 777
// CHECK: 780 input 1
// CHECK: 781 ite 1 180 780 779
// CHECK: 782 input 1
// CHECK: 783 slice 11 9 63 56
// CHECK: 784 uext 11 17 5
// CHECK: 785 srl 11 783 784
// CHECK: 786 slice 1 785 0 0
// CHECK: 787 uext 11 27 5
// CHECK: 788 srl 11 783 787
// CHECK: 789 slice 1 788 0 0
// CHECK: 790 eq 1 786 789
// CHECK: 791 and 1 25 790
// CHECK: 792 uext 11 34 5
// CHECK: 793 srl 11 783 792
// CHECK: 794 slice 1 793 0 0
// CHECK: 795 eq 1 786 794
// CHECK: 796 and 1 791 795
// CHECK: 797 uext 11 41 5
// CHECK: 798 srl 11 783 797
// CHECK: 799 slice 1 798 0 0
// CHECK: 800 eq 1 786 799
// CHECK: 801 and 1 796 800
// CHECK: 802 ite 1 801 786 782
// CHECK: 803 uext 11 48 6
// CHECK: 804 srl 11 783 803
// CHECK: 805 slice 1 804 0 0
// CHECK: 806 uext 11 55 6
// CHECK: 807 srl 11 783 806
// CHECK: 808 slice 1 807 0 0
// CHECK: 809 eq 1 805 808
// CHECK: 810 and 1 54 809
// CHECK: 811 uext 11 62 5
// CHECK: 812 srl 11 783 811
// CHECK: 813 slice 1 812 0 0
// CHECK: 814 eq 1 805 813
// CHECK: 815 and 1 810 814
// CHECK: 816 uext 11 69 5
// CHECK: 817 srl 11 783 816
// CHECK: 818 slice 1 817 0 0
// CHECK: 819 eq 1 805 818
// CHECK: 820 and 1 815 819
// CHECK: 821 ite 1 820 805 802
// CHECK: 822 uext 11 2 7
// CHECK: 823 srl 11 783 822
// CHECK: 824 slice 1 823 0 0
// CHECK: 825 uext 11 82 6
// CHECK: 826 srl 11 783 825
// CHECK: 827 slice 1 826 0 0
// CHECK: 828 eq 1 824 827
// CHECK: 829 and 1 81 828
// CHECK: 830 uext 11 88 5
// CHECK: 831 srl 11 783 830
// CHECK: 832 slice 1 831 0 0
// CHECK: 833 eq 1 824 832
// CHECK: 834 and 1 829 833
// CHECK: 835 uext 11 94 5
// CHECK: 836 srl 11 783 835
// CHECK: 837 slice 1 836 0 0
// CHECK: 838 eq 1 824 837
// CHECK: 839 and 1 834 838
// CHECK: 840 ite 1 839 824 821
// CHECK: 841 uext 11 102 5
// CHECK: 842 srl 11 783 841
// CHECK: 843 slice 1 842 0 0
// CHECK: 844 uext 11 111 5
// CHECK: 845 srl 11 783 844
// CHECK: 846 slice 1 845 0 0
// CHECK: 847 eq 1 843 846
// CHECK: 848 and 1 109 847
// CHECK: 849 ite 1 848 843 840
// CHECK: 850 uext 11 119 5
// CHECK: 851 srl 11 783 850
// CHECK: 852 slice 1 851 0 0
// CHECK: 853 uext 11 128 5
// CHECK: 854 srl 11 783 853
// CHECK: 855 slice 1 854 0 0
// CHECK: 856 eq 1 852 855
// CHECK: 857 and 1 126 856
// CHECK: 858 ite 1 857 852 849
// CHECK: 859 uext 11 135 6
// CHECK: 860 srl 11 783 859
// CHECK: 861 slice 1 860 0 0
// CHECK: 862 uext 11 144 5
// CHECK: 863 srl 11 783 862
// CHECK: 864 slice 1 863 0 0
// CHECK: 865 eq 1 861 864
// CHECK: 866 and 1 142 865
// CHECK: 867 ite 1 866 861 858
// CHECK: 868 slice 1 9 56 56
// CHECK: 869 redor 1 783
// CHECK: 870 not 1 869
// CHECK: 871 redand 1 783
// CHECK: 872 or 1 870 871
// CHECK: 873 ite 1 872 868 867
// CHECK: 874 uext 11 158 5
// CHECK: 875 srl 11 783 874
// CHECK: 876 slice 1 875 0 0
// CHECK: 877 ite 1 165 876 873
// CHECK: 878 input 1
// CHECK: 879 ite 1 171 878 877
// CHECK: 880 input 1
// CHECK: 881 ite 1 180 880 879
// CHECK: 882 concat 14 281 181
// CHECK: 883 concat 16 381 882
// CHECK: 884 sort bitvec 4
// CHECK: 885 concat 884 481 883
// CHECK: 886 sort bitvec 5
// CHECK: 887 concat 886 581 885
// CHECK: 888 sort bitvec 6
// CHECK: 889 concat 888 681 887
// CHECK: 890 sort bitvec 7
// CHECK: 891 concat 890 781 889
// CHECK: 892 concat 11 881 891
// CHECK: 893 concat 16 7 15
// CHECK: 894 uext 11 893 5
// CHECK: 895 srl 11 892 894
// CHECK: 896 slice 1 895 0 0
// CHECK: 897 eq 1 7 21
// CHECK: 898 eq 1 7 23
// CHECK: 899 or 1 897 898
// CHECK: 900 concat 16 7 26
// CHECK: 901 uext 11 900 5
// CHECK: 902 srl 11 892 901
// CHECK: 903 slice 1 902 0 0
// CHECK: 904 eq 1 896 903
// CHECK: 905 and 1 899 904
// CHECK: 906 concat 16 7 33
// CHECK: 907 uext 11 906 5
// CHECK: 908 srl 11 892 907
// CHECK: 909 slice 1 908 0 0
// CHECK: 910 eq 1 896 909
// CHECK: 911 and 1 905 910
// CHECK: 912 concat 16 7 40
// CHECK: 913 uext 11 912 5
// CHECK: 914 srl 11 892 913
// CHECK: 915 slice 1 914 0 0
// CHECK: 916 eq 1 896 915
// CHECK: 917 and 1 911 916
// CHECK: 918 ite 1 917 896 10
// CHECK: 919 concat 14 6 23
// CHECK: 920 uext 11 919 6
// CHECK: 921 srl 11 892 920
// CHECK: 922 slice 1 921 0 0
// CHECK: 923 eq 1 6 21
// CHECK: 924 eq 1 6 23
// CHECK: 925 or 1 923 924
// CHECK: 926 concat 14 6 21
// CHECK: 927 uext 11 926 6
// CHECK: 928 srl 11 892 927
// CHECK: 929 slice 1 928 0 0
// CHECK: 930 eq 1 922 929
// CHECK: 931 and 1 925 930
// CHECK: 932 concat 14 6 23
// CHECK: 933 concat 16 21 932
// CHECK: 934 uext 11 933 5
// CHECK: 935 srl 11 892 934
// CHECK: 936 slice 1 935 0 0
// CHECK: 937 eq 1 922 936
// CHECK: 938 and 1 931 937
// CHECK: 939 concat 14 6 21
// CHECK: 940 concat 16 21 939
// CHECK: 941 uext 11 940 5
// CHECK: 942 srl 11 892 941
// CHECK: 943 slice 1 942 0 0
// CHECK: 944 eq 1 922 943
// CHECK: 945 and 1 938 944
// CHECK: 946 ite 1 945 922 918
// CHECK: 947 uext 11 5 7
// CHECK: 948 srl 11 892 947
// CHECK: 949 slice 1 948 0 0
// CHECK: 950 eq 1 5 21
// CHECK: 951 eq 1 5 23
// CHECK: 952 or 1 950 951
// CHECK: 953 concat 14 21 5
// CHECK: 954 uext 11 953 6
// CHECK: 955 srl 11 892 954
// CHECK: 956 slice 1 955 0 0
// CHECK: 957 eq 1 949 956
// CHECK: 958 and 1 952 957
// CHECK: 959 concat 16 33 5
// CHECK: 960 uext 11 959 5
// CHECK: 961 srl 11 892 960
// CHECK: 962 slice 1 961 0 0
// CHECK: 963 eq 1 949 962
// CHECK: 964 and 1 958 963
// CHECK: 965 concat 16 40 5
// CHECK: 966 uext 11 965 5
// CHECK: 967 srl 11 892 966
// CHECK: 968 slice 1 967 0 0
// CHECK: 969 eq 1 949 968
// CHECK: 970 and 1 964 969
// CHECK: 971 ite 1 970 949 946
// CHECK: 972 concat 14 6 23
// CHECK: 973 concat 16 7 972
// CHECK: 974 uext 11 973 5
// CHECK: 975 srl 11 892 974
// CHECK: 976 slice 1 975 0 0
// CHECK: 977 xor 1 7 6
// CHECK: 978 eq 1 977 21
// CHECK: 979 eq 1 977 23
// CHECK: 980 or 1 978 979
// CHECK: 981 concat 14 6 21
// CHECK: 982 concat 16 7 981
// CHECK: 983 uext 11 982 5
// CHECK: 984 srl 11 892 983
// CHECK: 985 slice 1 984 0 0
// CHECK: 986 eq 1 976 985
// CHECK: 987 and 1 980 986
// CHECK: 988 ite 1 987 976 971
// CHECK: 989 concat 14 23 5
// CHECK: 990 concat 16 7 989
// CHECK: 991 uext 11 990 5
// CHECK: 992 srl 11 892 991
// CHECK: 993 slice 1 992 0 0
// CHECK: 994 xor 1 7 5
// CHECK: 995 eq 1 994 21
// CHECK: 996 eq 1 994 23
// CHECK: 997 or 1 995 996
// CHECK: 998 concat 14 21 5
// CHECK: 999 concat 16 7 998
// CHECK: 1000 uext 11 999 5
// CHECK: 1001 srl 11 892 1000
// CHECK: 1002 slice 1 1001 0 0
// CHECK: 1003 eq 1 993 1002
// CHECK: 1004 and 1 997 1003
// CHECK: 1005 ite 1 1004 993 988
// CHECK: 1006 concat 14 6 5
// CHECK: 1007 uext 11 1006 6
// CHECK: 1008 srl 11 892 1007
// CHECK: 1009 slice 1 1008 0 0
// CHECK: 1010 xor 1 6 5
// CHECK: 1011 eq 1 1010 21
// CHECK: 1012 eq 1 1010 23
// CHECK: 1013 or 1 1011 1012
// CHECK: 1014 concat 14 6 5
// CHECK: 1015 concat 16 21 1014
// CHECK: 1016 uext 11 1015 5
// CHECK: 1017 srl 11 892 1016
// CHECK: 1018 slice 1 1017 0 0
// CHECK: 1019 eq 1 1009 1018
// CHECK: 1020 and 1 1013 1019
// CHECK: 1021 ite 1 1020 1009 1005
// CHECK: 1022 redor 1 892
// CHECK: 1023 not 1 1022
// CHECK: 1024 redand 1 892
// CHECK: 1025 or 1 1023 1024
// CHECK: 1026 ite 1 1025 181 1021
// CHECK: 1027 concat 14 6 5
// CHECK: 1028 concat 16 7 1027
// CHECK: 1029 uext 11 1028 5
// CHECK: 1030 srl 11 892 1029
// CHECK: 1031 slice 1 1030 0 0
// CHECK: 1032 xor 1 977 5
// CHECK: 1033 eq 1 1032 21
// CHECK: 1034 eq 1 1032 23
// CHECK: 1035 or 1 1033 1034
// CHECK: 1036 ite 1 1035 1031 1026
// CHECK: 1037 ite 1 171 151 1036
// CHECK: 1038 concat 14 3 2
// CHECK: 1039 concat 16 4 1038
// CHECK: 1040 concat 884 5 1039
// CHECK: 1041 concat 886 6 1040
// CHECK: 1042 concat 888 7 1041
// CHECK: 1043 uext 8 1042 58
// CHECK: 1044 srl 8 9 1043
// CHECK: 1045 slice 1 1044 0 0
// CHECK: 1046 ite 1 180 1045 1037
// CHECK: 1047 output 1046 O 
