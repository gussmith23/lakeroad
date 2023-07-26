// RUN: (racket $LAKEROAD_DIR/bin/main.rkt \
// RUN:  --verilog-module-filepath %s \
// RUN:  --architecture lattice-ecp5 \
// RUN:  --template dsp \
// RUN:  --out-format verilog \
// RUN:  --top-module-name top \
// RUN:  --verilog-module-out-signal p:16 \
// RUN:  --initiation-interval 3 \
// RUN:  --clock-name clk \
// RUN:  --module-name out \
// RUN:  --input-signal a:16 \
// RUN:  --input-signal b:16 \
// RUN:  --input-signal c:16 \
// RUN: || true) \
// RUN: 2>&1 \
// RUN: | FileCheck %s

module top(input clk, input [15:0] a, b, c, output [15:0] p);

  reg [15:0] tmp0, tmp1, tmp2;

  always @ (posedge clk) begin
    tmp0 <= (a * b) & c;
    tmp1 <= tmp0;
    tmp2 <= tmp1;
  end

  assign p = tmp2;

endmodule

// CHECK: Synthesis failed.
