// RUN: racket $LAKEROAD_DIR/bin/main.rkt \
// RUN:  --solver stp \
// RUN:  --verilog-module-filepath %s \
// RUN:  --architecture xilinx-7-series \
// RUN:  --template dsp \
// RUN:  --out-format verilog \
// RUN:  --top-module-name top \
// RUN:  --verilog-module-out-signal out:12 \
// RUN:  --pipeline-depth 0 \
// RUN:  --module-name out \
// RUN:  --input-signal 'a:(port a 12):12' \
// RUN:  --input-signal 'b:(port b 12):12' \
// RUN:  --timeout 120 \
// RUN:  --extra-cycles 3 \
// RUN:  --simulate-with-verilator \
// RUN:  --simulate-with-verilator-arg "--max_num_tests=10000" \
// RUN:  --simulate-with-verilator-arg "--verilator_include_dir="$LAKEROAD_PRIVATE_DIR/DSP48E1/"" \
// RUN:  --simulate-with-verilator-arg "--verilator_extra_arg='-DXIL_XECLIB'" \
// RUN:  --simulate-with-verilator-arg "--verilator_extra_arg='-Wno-UNOPTFLAT'" \
// RUN:  --simulate-with-verilator-arg "--verilator_extra_arg='-Wno-LATCH'" \
// RUN:  --simulate-with-verilator-arg "--verilator_extra_arg='-Wno-WIDTH'" \
// RUN:  --simulate-with-verilator-arg "--verilator_extra_arg='-Wno-STMTDLY'" \
// RUN:  --simulate-with-verilator-arg "--verilator_extra_arg='-Wno-CASEX'" \
// RUN:  --simulate-with-verilator-arg "--verilator_extra_arg='-Wno-TIMESCALEMOD'" \
// RUN:  --simulate-with-verilator-arg "--verilator_extra_arg='-Wno-PINMISSING'" \
// RUN:  --simulate-with-verilator-arg "--verilator_extra_arg='-Wno-COMBDLY'" \
// RUN:  --simulate-with-verilator-arg "--verilator_extra_arg='-Wno-INITIALDLY'" \
// RUN:  --simulate-with-verilator-arg "--verilator_extra_arg='-Wno-CASEINCOMPLETE'" \
// RUN: | FileCheck %s

(* use_dsp = "yes" *) module top(
	input signed [11:0] a,
	input signed [11:0] b,
	output [11:0] out
	);

	assign out = a * b;
endmodule

// CHECK: module out(a, b, out);
// CHECK:   DSP48E1 #(
// CHECK: endmodule
