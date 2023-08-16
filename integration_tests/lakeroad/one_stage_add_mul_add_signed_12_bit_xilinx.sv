// RUN: racket $LAKEROAD_DIR/bin/main.rkt \
// RUN:  --solver bitwuzla \
// RUN:  --verilog-module-filepath %s \
// RUN:  --architecture xilinx-ultrascale-plus \
// RUN:  --template dsp \
// RUN:  --out-format verilog \
// RUN:  --top-module-name top \
// RUN:  --verilog-module-out-signal out:12 \
// RUN:  --initiation-interval 1 \
// RUN:  --clock-name clk \
// RUN:  --module-name out \
// RUN:  --input-signal a:12 \
// RUN:  --input-signal b:12 \
// RUN:  --input-signal c:12 \
// RUN:  --input-signal d:12 \
// RUN: | FileCheck %s

(* use_dsp = "yes" *) module top (
	input signed [11:0] a,
	input signed [11:0] b,
	input signed [11:0] c,
	input signed [11:0] d,
	output [11:0] out,
	input clk);

	logic signed [23:0] stage0;

	always @(posedge clk) begin
	stage0 <= ((d + a) * b) + c;

	end

	assign out = stage0;
endmodule

// CHECK: module out(a, b, c, clk, d, out);
// CHECK:   DSP48E2 #(
// CHECK: endmodule
