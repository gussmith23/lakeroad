// RUN: racket $LAKEROAD_DIR/bin/main.rkt \
// RUN:  --solver bitwuzla \
// RUN:  --verilog-module-filepath %s \
// RUN:  --architecture xilinx-7-series \
// RUN:  --template dsp \
// RUN:  --out-format verilog \
// RUN:  --top-module-name top \
// RUN:  --verilog-module-out-signal out:9 \
// RUN:  --pipeline-depth 1 \
// RUN:  --clock-name clk \
// RUN:  --module-name out \
// RUN:  --input-signal 'a:(port a 9):9' \
// RUN:  --input-signal 'b:(port b 9):9' \
// RUN:  --input-signal 'c:(port c 9):9' \
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
    input [8:0] a,
    input [8:0] b,
    input [8:0] c,
    output [8:0] out,
    input clk
);

  logic [27:0] stage0;

  always @(posedge clk) begin
    stage0 <= (a * b) - c;

  end

  assign out = stage0;
endmodule

// CHECK: module out(a, b, c, clk, out);
