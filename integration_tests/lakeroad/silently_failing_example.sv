// This example silently fails. Specifically, when we get down to `(assert (bveq
// ... ...))` in synthesize.rkt, synthesis simply fails without any error. I
// think it's because the assertion is immediately false, because the bitwidths
// of the output signal indicated by the flag doesn't match the output bitwidth
// of the module in the file.
//
// RUN: racket $LAKEROAD_DIR/bin/main.rkt \
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
// RUN:  --output-smt-path 'tmp' \
// RUN:  --verilog-module-out-signal out:16 \
// RUN:  --extra-cycles 3 \
// RUN:  --timeout 120 \
// RUN:  --simulate-with-verilator \
// RUN:  --simulate-with-verilator-arg "--testbench_stdout_log_filepath=tmp.txt"
// \
// RUN:  --simulate-with-verilator-arg "--max_num_tests=10000" \
// RUN:  --simulate-with-verilator-arg
// "--verilator_include_dir=$LAKEROAD_PRIVATE_DIR/DSP48E2/" \
// RUN:  --simulate-with-verilator-arg "--verilator_extra_arg='-DXIL_XECLIB'" \
// RUN:  --simulate-with-verilator-arg "--verilator_extra_arg='-Wno-UNOPTFLAT'"
// \
// RUN:  --simulate-with-verilator-arg "--verilator_extra_arg='-Wno-LATCH'" \
// RUN:  --simulate-with-verilator-arg "--verilator_extra_arg='-Wno-WIDTH'" \
// RUN:  --simulate-with-verilator-arg "--verilator_extra_arg='-Wno-STMTDLY'" \
// RUN:  --simulate-with-verilator-arg "--verilator_extra_arg='-Wno-CASEX'" \
// RUN:  --simulate-with-verilator-arg
// "--verilator_extra_arg='-Wno-TIMESCALEMOD'" \
// RUN:  --simulate-with-verilator-arg "--verilator_extra_arg='-Wno-PINMISSING'"
// \
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

// CHECK: module test_module(a, b, clk, out);
// CHECK:   DSP48E2 #(
// CHECK: endmodule
