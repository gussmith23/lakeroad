// RUN: (racket $LAKEROAD_DIR/bin/main.rkt \
// RUN:  --solver stp \
// RUN:  --verilog-module-filepath %s \
// RUN:  --architecture xilinx-7-series \
// RUN:  --template dsp \
// RUN:  --out-format verilog \
// RUN:  --top-module-name top \
// RUN:  --verilog-module-out-signal out:18 \
// RUN:  --pipeline-depth 2 \
// RUN:  --clock-name clk \
// RUN:  --module-name out \
// RUN:  --input-signal 'a:(port a 18):18' \
// RUN:  --input-signal 'b:(port b 18):18' \
// RUN:  --input-signal 'c:(port c 18):18' \
// RUN:  --input-signal 'd:(port d 18):18' \
// RUN:  --timeout 120 \
// RUN:  --extra-cycles 3 \
// RUN: || true) \
// RUN: 2>&1 \
// RUN: | FileCheck %s 

(* use_dsp = "yes" *) module top(
	input  [17:0] a,
	input  [17:0] b,
	input  [17:0] c,
	input  [17:0] d,
	output [17:0] out,
	input clk);

	logic  [35:0] stage0;
	logic  [35:0] stage1;

	always @(posedge clk) begin
	stage0 <= ((d - a) * b) - c;
	stage1 <= stage0;
	end

	assign out = stage1;
endmodule

// CHECK: Synthesis Timeout
