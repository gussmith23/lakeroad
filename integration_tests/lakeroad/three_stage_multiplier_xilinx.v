// RUN: racket $LAKEROAD_DIR/bin/main.rkt \
// RUN:  --solver bitwuzla \
// RUN:  --verilog-module-filepath %s \
// RUN:  --architecture xilinx-ultrascale-plus \
// RUN:  --template dsp \
// RUN:  --out-format verilog \
// RUN:  --top-module-name three_stage_multiplier \
// RUN:  --verilog-module-out-signal p:16 \
// RUN:  --pipeline-depth 3 \
// RUN:  --clock-name clk \
// RUN:  --module-name out \
// RUN:  --input-signal 'a:(port a 16):16' \
// RUN:  --input-signal 'b:(port b 16):16' \
// RUN:  --timeout 90 \
// RUN:  --extra-cycles 2 \
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

module three_stage_multiplier(input clk, input [15:0] a, b, output [15:0] p);

  reg [15:0] tmp0, tmp1, out;

  always @ (posedge clk) begin
    tmp0 <= a * b;
    tmp1 <= tmp0;
    out <= tmp1;
  end

  assign p = out;

endmodule

// CHECK: module out(a, b, clk, p);
