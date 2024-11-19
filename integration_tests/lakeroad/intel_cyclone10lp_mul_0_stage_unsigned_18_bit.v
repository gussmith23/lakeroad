// RUN: outfile=$(mktemp)
// RUN: racket $LAKEROAD_DIR/bin/main.rkt \
// RUN:  --solver yices \
// RUN:  --verilog-module-filepath %s \
// RUN:  --architecture intel-cyclone10lp \
// RUN:  --template dsp \
// RUN:  --out-format verilog \
// RUN:  --top-module-name top \
// RUN:  --verilog-module-out-signal p:18 \
// RUN:  --module-name test_module \
// RUN:  --input-signal 'a:(port a 18):18' \
// RUN:  --input-signal 'b:(port b 18):18' \
// RUN:  --timeout 120 \
// RUN:  --simulate-with-verilator \
// RUN:  --simulate-with-verilator-arg=--max_num_tests=10000 \
// RUN:  --simulate-with-verilator-arg="--verilator_include_dir=$LAKEROAD_PRIVATE_DIR/intel_cyclone10lp/" \
// RUN:  --simulate-with-verilator-arg="--verilator_extra_arg=-Wno-LATCH" \
// RUN:  --simulate-with-verilator-arg="--verilator_extra_arg=-Wno-INITIALDLY" \
// RUN:  --simulate-with-verilator-arg="--verilator_extra_arg=-Wno-COMBDLY" \
// RUN:  --simulate-with-verilator-arg="--verilator_extra_arg=-Wno-TIMESCALEMOD" \
// RUN:  --simulate-with-verilator-arg="--verilator_extra_arg=-Wno-WIDTH" \
// RUN: | FileCheck %s
 

module top(input [17:0] a, b, output [17:0] p);

  assign p = a * b;

endmodule

// CHECK: module test_module(a, b, p);
// CHECK:   cyclone10lp_mac_mult #(
// CHECK: endmodule
