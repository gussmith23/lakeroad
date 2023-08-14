// RUN: $LAKEROAD_DIR/bin/lakeroad-portfolio.py \
// RUN:  --cvc5 --bitwuzla \
// RUN:  --verilog-module-filepath %s \
// RUN:  --architecture lattice-ecp5 \
// RUN:  --template dsp \
// RUN:  --out-format verilog \
// RUN:  --top-module-name top \
// RUN:  --verilog-module-out-signal p:16 \
// RUN:  --module-name out \
// RUN:  --input-signal a:16 \
// RUN:  --input-signal b:16 \
// RUN: | FileCheck %s

module top(input [15:0] a, b, output [15:0] p);

  assign p = a * b;

endmodule

// CHECK: module out(a, b, p);
// CHECK:   ALU54A #(
// CHECK:   MULT18X18C #(
// CHECK: endmodule
