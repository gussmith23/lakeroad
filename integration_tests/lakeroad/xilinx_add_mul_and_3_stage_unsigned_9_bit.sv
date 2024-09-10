// RUN: (racket $LAKEROAD_DIR/bin/main.rkt \
// RUN:  --solver bitwuzla \
// RUN:  --verilog-module-filepath %s \
// RUN:  --architecture xilinx-ultrascale-plus \
// RUN:  --template dsp \
// RUN:  --out-format verilog \
// RUN:  --top-module-name test \
// RUN:  --verilog-module-out-signal out:9 \
// RUN:  --pipeline-depth 3 \
// RUN:  --clock-name clk \
// RUN:  --module-name out \
// RUN:  --input-signal 'a:(port a 9):9' \
// RUN:  --input-signal 'b:(port b 9):9' \
// RUN:  --input-signal 'c:(port c 9):9' \
// RUN:  --input-signal 'd:(port d 9):9' \
// RUN:  --extra-cycles 3 \
// RUN:  --timeout 120 \
// RUN: || true ) \
// RUN: 2>&1 \
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

// CHECK: Synthesis failed
