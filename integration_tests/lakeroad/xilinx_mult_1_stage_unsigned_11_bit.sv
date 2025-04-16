// RUN: outfile=$(mktemp)
// RUN: racket $LAKEROAD_DIR/bin/main.rkt \
// RUN:  --solver stp \
// RUN:  --verilog-module-filepath %s \
// RUN:  --architecture xilinx-ultrascale-plus \
// RUN:  --template dsp \
// RUN:  --out-format verilog \
// RUN:  --top-module-name top \
// RUN:  --verilog-module-out-signal out:11 \
// RUN:  --pipeline-depth 1 \
// RUN:  --clock-name clk \
// RUN:  --module-name test_module \
// RUN:  --input-signal 'a:(port a 11):11' \
// RUN:  --input-signal 'b:(port b 11):11' \
// RUN:  --extra-cycles 3 \
// RUN:  --timeout 120 \
// RUN:  --simulate-with-verilator \
// RUN:  --simulate-with-verilator-arg "--max_num_tests=10000" \
// RUN:  --simulate-with-verilator-arg "--verilator_include_dir=$LAKEROAD_PRIVATE_DIR/DSP48E2/" \
// RUN:  --simulate-with-verilator-arg "--verilator_extra_arg='-DXIL_XECLIB'" \
// RUN:  --simulate-with-verilator-arg "--verilator_extra_arg='-Wno-UNOPTFLAT'" \
// RUN:  --simulate-with-verilator-arg "--verilator_extra_arg='-Wno-LATCH'" \
// RUN:  --simulate-with-verilator-arg "--verilator_extra_arg='-Wno-WIDTH'" \
// RUN:  --simulate-with-verilator-arg "--verilator_extra_arg='-Wno-STMTDLY'" \
// RUN:  --simulate-with-verilator-arg "--verilator_extra_arg='-Wno-CASEX'" \
// RUN:  --simulate-with-verilator-arg "--verilator_extra_arg='-Wno-TIMESCALEMOD'" \
// RUN:  --simulate-with-verilator-arg "--verilator_extra_arg='-Wno-PINMISSING'" 

(* use_dsp = "yes" *) module top(
	input  [10:0] a,
	input  [10:0] b,
	output [10:0] out,
	input clk);

	logic  [21:0] stage0;

	always @(posedge clk) begin
	stage0 <= a * b;

	end

	assign out = stage0;
endmodule

// CHECK: module test_module(a, b, clk, out);
// CHECK:   DSP48E2 #(
// CHECK: endmodule
