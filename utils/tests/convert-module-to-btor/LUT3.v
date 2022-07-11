// We can't handle LUT3s because of the user-defined `primitive`. We still
// include a test to check that it fails in the expected way.
//
// Fix syntax issue in the file (is this a Verilog version issue, or does Xilinx
// just have buggy Verilog...?)
// RUN: tmpfile=$(mktemp)
// RUN: sed -E 's/^[[:space:]]*x_lut3_mux8/x_lut3_mux8 inst/' %s > $tmpfile
// Run through our tool.
// RUN: python3 $LAKEROAD_DIR/utils/convert-module-to-btor.py \
// RUN:   --infile $tmpfile --top LUT3 2>&1 | FileCheck %s
// Remove tmpfile.
// RUN: rm $tmpfile

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
//  /   /                  3-Bit Look-Up Table
// /___/   /\     Filename : LUT3.v
// \   \  /  \
//  \___\/\___\
//
///////////////////////////////////////////////////////////////////////////////
//  Revision:
//    03/23/04 - Initial version.
//    03/11/05 - Add LOC Parameter
//    12/13/11 - 524859 - Added `celldefine and `endcelldefine
//    09/12/16 - ANSI ports, speed improvements
//  End Revision:
///////////////////////////////////////////////////////////////////////////////

`timescale 1 ps/1 ps

`celldefine

module LUT3 #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter [7:0] INIT = 8'h00
)(
  output O,

  input I0,
  input I1,
  input I2
);

// define constants
  localparam MODULE_NAME = "LUT3";

  reg trig_attr = 1'b0;
// include dynamic registers - XILINX test only
`ifdef XIL_DR
  `include "LUT3_dr.v"
`else
  reg [7:0] INIT_REG = INIT;
`endif

  x_lut3_mux8 (O, INIT_REG[7], INIT_REG[6], INIT_REG[5], INIT_REG[4], INIT_REG[3], INIT_REG[2], INIT_REG[1], INIT_REG[0], I2, I1, I0);

`ifdef XIL_TIMING
  specify
	(I0 => O) = (0:0:0, 0:0:0);
	(I1 => O) = (0:0:0, 0:0:0);
	(I2 => O) = (0:0:0, 0:0:0);
	specparam PATHPULSE$ = 0;
  endspecify
`endif

endmodule

`endcelldefine

primitive x_lut3_mux8 (o, d7, d6, d5, d4, d3, d2, d1, d0, s2, s1, s0);

  output o;
  input d7, d6, d5, d4, d3, d2, d1, d0;
  input s2, s1, s0;

  table

    // d7  d6  d5  d4  d3  d2  d1  d0  s2  s1  s0 : o;

       ?   ?   ?   ?   ?   ?   ?   1   0   0   0  : 1;
       ?   ?   ?   ?   ?   ?   ?   0   0   0   0  : 0;
       ?   ?   ?   ?   ?   ?   1   ?   0   0   1  : 1;
       ?   ?   ?   ?   ?   ?   0   ?   0   0   1  : 0;
       ?   ?   ?   ?   ?   1   ?   ?   0   1   0  : 1;
       ?   ?   ?   ?   ?   0   ?   ?   0   1   0  : 0;
       ?   ?   ?   ?   1   ?   ?   ?   0   1   1  : 1;
       ?   ?   ?   ?   0   ?   ?   ?   0   1   1  : 0;
       ?   ?   ?   1   ?   ?   ?   ?   1   0   0  : 1;
       ?   ?   ?   0   ?   ?   ?   ?   1   0   0  : 0;
       ?   ?   1   ?   ?   ?   ?   ?   1   0   1  : 1;
       ?   ?   0   ?   ?   ?   ?   ?   1   0   1  : 0;
       ?   1   ?   ?   ?   ?   ?   ?   1   1   0  : 1;
       ?   0   ?   ?   ?   ?   ?   ?   1   1   0  : 0;
       1   ?   ?   ?   ?   ?   ?   ?   1   1   1  : 1;
       0   ?   ?   ?   ?   ?   ?   ?   1   1   1  : 0;

       ?   ?   ?   ?   ?   ?   0   0   0   0   x  : 0;
       ?   ?   ?   ?   ?   ?   1   1   0   0   x  : 1;
       ?   ?   ?   ?   0   0   ?   ?   0   1   x  : 0;
       ?   ?   ?   ?   1   1   ?   ?   0   1   x  : 1;
       ?   ?   0   0   ?   ?   ?   ?   1   0   x  : 0;
       ?   ?   1   1   ?   ?   ?   ?   1   0   x  : 1;
       0   0   ?   ?   ?   ?   ?   ?   1   1   x  : 0;
       1   1   ?   ?   ?   ?   ?   ?   1   1   x  : 1;

       ?   ?   ?   ?   ?   0   ?   0   0   x   0  : 0;
       ?   ?   ?   ?   ?   1   ?   1   0   x   0  : 1;
       ?   ?   ?   ?   0   ?   0   ?   0   x   1  : 0;
       ?   ?   ?   ?   1   ?   1   ?   0   x   1  : 1;
       ?   0   ?   0   ?   ?   ?   ?   1   x   0  : 0;
       ?   1   ?   1   ?   ?   ?   ?   1   x   0  : 1;
       0   ?   0   ?   ?   ?   ?   ?   1   x   1  : 0;
       1   ?   1   ?   ?   ?   ?   ?   1   x   1  : 1;

       ?   ?   ?   0   ?   ?   ?   0   x   0   0  : 0;
       ?   ?   ?   1   ?   ?   ?   1   x   0   0  : 1;
       ?   ?   0   ?   ?   ?   0   ?   x   0   1  : 0;
       ?   ?   1   ?   ?   ?   1   ?   x   0   1  : 1;
       ?   0   ?   ?   ?   0   ?   ?   x   1   0  : 0;
       ?   1   ?   ?   ?   1   ?   ?   x   1   0  : 1;
       0   ?   ?   ?   0   ?   ?   ?   x   1   1  : 0;
       1   ?   ?   ?   1   ?   ?   ?   x   1   1  : 1;

       ?   ?   ?   ?   0   0   0   0   0   x   x  : 0;
       ?   ?   ?   ?   1   1   1   1   0   x   x  : 1;
       0   0   0   0   ?   ?   ?   ?   1   x   x  : 0;
       1   1   1   1   ?   ?   ?   ?   1   x   x  : 1;

       ?   ?   0   0   ?   ?   0   0   x   0   x  : 0;
       ?   ?   1   1   ?   ?   1   1   x   0   x  : 1;
       0   0   ?   ?   0   0   ?   ?   x   1   x  : 0;
       1   1   ?   ?   1   1   ?   ?   x   1   x  : 1;

       ?   0   ?   0   ?   0   ?   0   x   x   0  : 0;
       ?   1   ?   1   ?   1   ?   1   x   x   0  : 1;
       0   ?   0   ?   0   ?   0   ?   x   x   1  : 0;
       1   ?   1   ?   1   ?   1   ?   x   x   1  : 1;

       0   0   0   0   0   0   0   0   x   x   x  : 0;
       1   1   1   1   1   1   1   1   x   x   x  : 1;

  endtable

endprimitive

// CHECK: -- Running command `
// CHECK: read -sv {{.*}}
// CHECK: hierarchy -top LUT3
// CHECK: prep
// CHECK: proc
// CHECK: flatten
// CHECK: clk2fflogic
// CHECK: write_verilog /dev/null
// CHECK: hierarchy -top LUT3
// CHECK: write_btor
// CHECK: 1. Executing Verilog-2005 frontend: {{.*}}
// CHECK: {{.*}}: ERROR: syntax error, unexpected TOK_ID
