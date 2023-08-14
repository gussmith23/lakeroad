// It's unclear why this test fails; see #289.
//
// RUN: ($LAKEROAD_DIR/bin/lakeroad-portfolio.py \
// RUN:  --cvc5 --bitwuzla \
// RUN:  --verilog-module-filepath %s \
// RUN:  --architecture xilinx-ultrascale-plus \
// RUN:  --template dsp \
// RUN:  --out-format verilog \
// RUN:  --top-module-name addmulor_3_stage_unsigned_9_bit \
// RUN:  --verilog-module-out-signal out:9 \
// RUN:  --initiation-interval 3 \
// RUN:  --clock-name clk \
// RUN:  --module-name out \
// RUN:  --input-signal a:9 \
// RUN:  --input-signal b:9 \
// RUN:  --input-signal c:9 \
// RUN:  --input-signal d:9 \
// RUN:  --timeout 90 \
// RUN: || true) \
// RUN: 2>&1 \
// RUN: | FileCheck %s

module addmulor_3_stage_unsigned_9_bit (
    input [8:0] a,
    input [8:0] b,
    input [8:0] c,
    input [8:0] d,
    output [8:0] out,
    input clk
);

  logic [17:0] stage0;
  logic [17:0] stage1;
  logic [17:0] stage2;

  always @(posedge clk) begin
    stage0 <= ((d + a) * b) | c;
    stage1 <= stage0;
    stage2 <= stage1;
  end

  assign out = stage2;
endmodule

// CHECK: Synthesis Timeout
