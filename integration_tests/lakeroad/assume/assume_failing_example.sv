// See assume_example.sv. This is the failing example; it fails without the use
// of `--assume` flags. If you diff the two tests, you should see that the only
// meaningful difference is the use of `--assume` flags in assume_example.sv.
//
// RUN: (racket $LAKEROAD_DIR/bin/main.rkt \
// RUN:  --solver bitwuzla \
// RUN:  --verilog-module-filepath %s \
// RUN:  --architecture xilinx-ultrascale-plus \
// RUN:  --template dsp \
// RUN:  --out-format verilog \
// RUN:  --top-module-name top \
// RUN:  --pipeline-depth 1 \
// RUN:  --clock-name clk \
// RUN:  --module-name test_module \
// RUN:  --input-signal 'a:(extract 15 0 (port a 32)):16' \
// RUN:  --input-signal 'b:(extract 15 0 (port b 32)):16' \
// RUN:  --verilog-module-out-signal out:32 \
// RUN:  --extra-cycles 3 \
// RUN:  --timeout 120 \
// RUN: || true) \
// RUN: 2>&1 \
// RUN: | FileCheck %s

(* use_dsp = "yes" *) module top(
		input  [31:0] a,
		input  [31:0] b,
		output [31:0] out,
		input clk);
		logic  [31:0] stage0;
	always @(posedge clk) begin
	  stage0 <= a * b;
	end
	assign out = stage0;
endmodule

// CHECK: Synthesis failed
