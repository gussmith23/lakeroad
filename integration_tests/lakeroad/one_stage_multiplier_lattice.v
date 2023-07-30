// RUN: racket $LAKEROAD_DIR/bin/main.rkt \
// RUN:  --verilog-module-filepath %s \
// RUN:  --architecture lattice-ecp5 \
// RUN:  --template dsp \
// RUN:  --out-format verilog \
// RUN:  --top-module-name top \
// RUN:  --verilog-module-out-signal p:16 \
// RUN:  --initiation-interval 1 \
// RUN:  --clock-name clk \
// RUN:  --module-name out \
// RUN:  --input-signal a:16 \
// RUN:  --input-signal b:16 \
// RUN: | FileCheck %s

module top(input clk, input [15:0] a, b, output [15:0] p);

  reg [15:0] tmp0;

  always @ (posedge clk) begin
    tmp0 <= a * b;
  end

  assign p = tmp0;

endmodule

// CHECK: module out(a, b, clk, p);
// CHECK:   ALU54A #(
// CHECK:   MULT18X18C #(
// CHECK: endmodule