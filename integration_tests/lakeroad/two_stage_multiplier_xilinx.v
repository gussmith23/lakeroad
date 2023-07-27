// RUN: (racket $LAKEROAD_DIR/bin/main.rkt \
// RUN:  --verilog-module-filepath %s \
// RUN:  --architecture xilinx-ultrascale-plus \
// RUN:  --template dsp \
// RUN:  --out-format verilog \
// RUN:  --top-module-name two_stage_multiplier \
// RUN:  --verilog-module-out-signal p:16 \
// RUN:  --initiation-interval 2 \
// RUN:  --clock-name clk \
// RUN:  --module-name out \
// RUN:  --input-signal a:16 \
// RUN:  --input-signal b:16 \
// RUN:  --timeout 120 || true) 2>&1 \
// RUN: | FileCheck %s

module two_stage_multiplier(input clk, input [15:0] a, b, output [15:0] p);

  reg [15:0] tmp, out;

  always @ (posedge clk) begin
    tmp <= a * b;
    out <= tmp;
  end

  assign p = out;

endmodule

// Check that the test times out.
// CHECK: with-limit: out of time

