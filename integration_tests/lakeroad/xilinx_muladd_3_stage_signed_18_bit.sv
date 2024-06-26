// RUN: outfile=$(mktemp)
// RUN: (racket $LAKEROAD_DIR/bin/main.rkt \
// RUN:  --solver stp \
// RUN:  --verilog-module-filepath %s \
// RUN:  --architecture xilinx-ultrascale-plus \
// RUN:  --template dsp \
// RUN:  --out-format verilog \
// RUN:  --top-module-name top \
// RUN:  --verilog-module-out-signal out:18 \
// RUN:  --pipeline-depth 3 \
// RUN:  --clock-name clk \
// RUN:  --module-name test_module \
// RUN:  --input-signal a:18 \
// RUN:  --input-signal b:18 \
// RUN:  --input-signal c:18 \
// RUN:  --timeout 90 \
// RUN:  --extra-cycles 2 \
// RUN:  || true) \
// RUN:  > $outfile \
// RUN:  2>&1
// RUN: FileCheck %s < $outfile

(* use_dsp = "yes" *) module top(
    input signed [17:0] a,
    input signed [17:0] b,
    input signed [17:0] c,
    output [17:0] out,
    input clk
);

  logic signed [35:0] stage0;
  logic signed [35:0] stage1;
  logic signed [35:0] stage2;

  always @(posedge clk) begin
    stage0 <= (a * b) + c;
    stage1 <= stage0;
    stage2 <= stage1;
  end

  assign out = stage2;
endmodule

// CHECK: Synthesis failed
