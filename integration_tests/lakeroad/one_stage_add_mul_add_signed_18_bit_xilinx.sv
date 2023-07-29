// RUN: racket $LAKEROAD_DIR/bin/main.rkt \
// RUN:  --verilog-module-filepath %s \
// RUN:  --architecture xilinx-ultrascale-plus \
// RUN:  --template dsp \
// RUN:  --out-format verilog \
// RUN:  --top-module-name top \
// RUN:  --verilog-module-out-signal out:18 \
// RUN:  --initiation-interval 1 \
// RUN:  --clock-name clk \
// RUN:  --module-name out \
// RUN:  --input-signal a:18 \
// RUN:  --input-signal b:18 \
// RUN:  --input-signal c:18 \
// RUN:  --input-signal d:18 \
// RUN: | FileCheck %s

(* use_dsp = "yes" *) module top(
	input signed [17:0] a,
	input signed [17:0] b,
	input signed [17:0] c,
	input signed [17:0] d,
	output [17:0] out,
	input clk);

	logic signed [35:0] stage0;

	always @(posedge clk) begin
	stage0 <= ((d + a) * b) + c;

	end

	assign out = stage0;
endmodule