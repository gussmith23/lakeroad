// RUN: (racket $LAKEROAD_DIR/bin/main.rkt \
// RUN:  --solver bitwuzla \
// RUN:  --verilog-module-filepath %s \
// RUN:  --architecture xilinx-ultrascale-plus \
// RUN:  --template dsp \
// RUN:  --out-format verilog \
// RUN:  --top-module-name three_stage_multiplier \
// RUN:  --verilog-module-out-signal p:16 \
// RUN:  --initiation-interval 3 \
// RUN:  --clock-name clk \
// RUN:  --module-name out \
// RUN:  --input-signal a:16 \
// RUN:  --input-signal b:16 \
// RUN:  --timeout 90 \
// This one termiates with 2 extra cycles, but not 3.
// RUN:  --extra-cycles 2 \
// RUN: || true) \
// RUN: 2>&1 \
// RUN: | FileCheck %s

module three_stage_multiplier(input clk, input [15:0] a, b, output [15:0] p);

  reg [15:0] tmp0, tmp1, out;

  always @ (posedge clk) begin
    tmp0 <= a * b;
    tmp1 <= tmp0;
    out <= tmp1;
  end

  assign p = out;

endmodule

// CHECK: module out(a, b, clk, p);
