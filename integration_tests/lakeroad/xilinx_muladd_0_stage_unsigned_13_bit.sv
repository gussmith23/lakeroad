// RUN: outfile=$(mktemp)
// RUN: racket $LAKEROAD_DIR/bin/main.rkt \
// RUN:  --solver stp \
// RUN:  --verilog-module-filepath %s \
// RUN:  --architecture xilinx-ultrascale-plus \
// RUN:  --template dsp \
// RUN:  --out-format verilog \
// RUN:  --top-module-name top \
// RUN:  --verilog-module-out-signal out:13 \
// RUN:  --pipeline-depth 0 \
// RUN:  --module-name top \
// RUN:  --input-signal 'a:(port a 13):13' \
// RUN:  --input-signal 'b:(port b 13):13' \
// RUN:  --input-signal 'c:(port c 13):13' \
// RUN:  --timeout 90 \
// RUN:  > $outfile
// RUN: FileCheck %s < $outfile

(* use_dsp = "yes" *) module top(
	input  [12:0] a,
	input  [12:0] b,
	input  [12:0] c,
	output [12:0] out,
	input clk);

	assign out = (a * b) + c;
endmodule

// CHECK: module top(a, b, c, out);

