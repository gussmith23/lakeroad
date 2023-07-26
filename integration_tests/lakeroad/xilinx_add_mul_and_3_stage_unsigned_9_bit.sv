// RUN: racket $LAKEROAD_DIR/bin/main.rkt \
// RUN:  --verilog-module-filepath %s \
// RUN:  --architecture xilinx-ultrascale-plus \
// RUN:  --template dsp \
// RUN:  --out-format verilog \
// RUN:  --top-module-name test \
// RUN:  --verilog-module-out-signal out:9 \
// RUN:  --initiation-interval 3 \
// RUN:  --clock-name clk \
// RUN:  --module-name out \
// RUN:  --input-signal a:9 \
// RUN:  --input-signal b:9 \
// RUN:  --input-signal c:9 \
// RUN:  --input-signal d:9 \
// RUN: | FileCheck %s

module test (
    input [8:0] a,
    input [8:0] b,
    input [8:0] c,
    input [8:0] d,
    output [8:0] out,
    input clk
);

  logic [8:0] stage0;
  logic [8:0] stage1;
  logic [8:0] stage2;

  always @(posedge clk) begin
    stage0 <= ((d + a) * b) & c;
    stage1 <= stage0;
    stage2 <= stage1;
  end

  assign out = stage2;
endmodule

// CHECK: module out(a, b, c, clk, d, out);
// CHECK:   DSP48E2 #(
// CHECK: endmodule
