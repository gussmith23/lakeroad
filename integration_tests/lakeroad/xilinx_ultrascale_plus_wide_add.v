// Demonstrating more advanced usage of input-signal for a more complex DSP
// usage. In this case, we are trying to implement a wide addition using
// DSP48E2. We know that the DSP48E2 can handle two 48-bit inputs: one on the
// 48-bit C port, and the other split between the A and B ports. Here, we
// demonstrate how to communicate this to Lakeroad using the input-signal flags.

// RUN: racket $LAKEROAD_DIR/bin/main.rkt \
// RUN:  --solver cvc5 \
// RUN:  --verilog-module-filepath %s \
// RUN:  --architecture xilinx-ultrascale-plus \
// RUN:  --template dsp \
// RUN:  --out-format verilog \
// RUN:  --top-module-name top \
// RUN:  --verilog-module-out-signal out:48 \
// RUN:  --pipeline-depth 0 \
// RUN:  --module-name out \
// RUN:  --input-signal 'a:(extract 47 18 (port a 48)):30' \
// RUN:  --input-signal 'b:(extract 17 0 (port a 48)):18' \
// RUN:  --input-signal 'c:(port b 48):48' \
// RUN:  --timeout 90 \
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
// RUN:  --simulate-with-verilator-arg "--verilator_extra_arg='-Wno-PINMISSING'" \
// RUN: | FileCheck %s

module top(input [47:0] a, input [47:0] b, output [47:0] out);
  assign out = a + b;
endmodule

// CHECK: module out(a, b, out);
// CHECK:   DSP48E2 #(
// CHECK: endmodule
