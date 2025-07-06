// RUN: racket $LAKEROAD_DIR/bin/main.rkt \
// RUN:  --solver bitwuzla \
// RUN:  --verilog-module-filepath %s \
// RUN:  --architecture xilinx-ultrascale-plus \
// RUN:  --template experimental-two-dsp \
// RUN:  --out-format verilog \
// RUN:  --top-module-name mul \
// RUN:  --verilog-module-out-signal out:16 \
// RUN:  --pipeline-depth 0 \
// RUN:  --module-name top \
// RUN:  --input-signal 'a:(port b 8):8' \
// RUN:  --input-signal 'b:(port a 8):8' \
// RUN:  --timeout 90 \
// RUN:  --extra-cycles 3 \
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

module mul(input [7:0] a, input [7:0] b, output [15:0] out);
  assign out = a * b;
endmodule

// CHECK: module top(a, b, out);
// CHECK:   DSP48E2 #(
// CHECK:   DSP48E2 #(