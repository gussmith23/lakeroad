// RUN: racket $LAKEROAD_DIR/bin/main.rkt \
// RUN:  --solver bitwuzla \
// RUN:  --verilog-module-filepath %s \
// RUN:  --architecture xilinx-ultrascale-plus \
// RUN:  --template dsp \
// RUN:  --out-format verilog \
// RUN:  --top-module-name simple \
// RUN:  --verilog-module-out-signal o:16 \
// RUN:  --pipeline-depth 0 \
// RUN:  --module-name out \
// RUN:  --input-signal i:16 \
// RUN:  --clock-name clk \
// RUN:  --timeout 90 \
// RUN: | FileCheck %s

module simple(input clk, input [15:0] i, output [15:0] o);
  assign o = a;
endmodule

// CHECK: module out(clk, i, o);