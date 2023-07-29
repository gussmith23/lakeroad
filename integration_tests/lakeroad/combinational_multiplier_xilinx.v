// RUN: racket $LAKEROAD_DIR/bin/main.rkt \
// RUN:  --solver bitwuzla \
// RUN:  --verilog-module-filepath %s \
// RUN:  --architecture xilinx-ultrascale-plus \
// RUN:  --template dsp \
// RUN:  --out-format verilog \
// RUN:  --top-module-name combinational_multiplier \
// RUN:  --verilog-module-out-signal p:16 \
// RUN:  --initiation-interval 0 \
// RUN:  --clock-name clk \
// RUN:  --module-name out \
// RUN:  --input-signal a:16 \
// RUN:  --input-signal b:16 \
// RUN: | FileCheck %s

module combinational_multiplier(input clk, input [15:0] a, b, output [15:0] p);

  assign p = a * b;

endmodule

// CHECK: module out(a, b, p);
// CHECK:   DSP48E2 #(
// CHECK: endmodule
