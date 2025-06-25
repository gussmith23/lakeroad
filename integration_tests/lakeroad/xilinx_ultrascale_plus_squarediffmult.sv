// Squarer support for DSP block (DSP48E2) with pre-adder configured as
// subtractor

// RUN: racket $LAKEROAD_DIR/bin/main.rkt \
// RUN:  --solver cvc5 \
// RUN:  --verilog-module-filepath %s \
// RUN:  --architecture xilinx-ultrascale-plus \
// RUN:  --template dsp \
// RUN:  --out-format verilog \
// RUN:  --top-module-name squarediffmult \
// RUN:  --pipeline-depth 3 \
// RUN:  --clock-name clk \
// RUN:  --module-name squarediffmult_lakeroad \
// RUN:  --input-signal 'd:(port a 16):16' \
// RUN:  --input-signal 'a:(port b 16):16' \
// RUN:  --verilog-module-out-signal square_out:34 \
// RUN:  --timeout 120 \
// RUN:  --extra-cycles 1 \
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

module squarediffmult # (parameter SIZEIN = 16)
(
    input clk,
    input signed [SIZEIN-1:0] a, b,
    output signed [2*SIZEIN+1:0] square_out
);

// Declare registers for intermediate values
reg signed [SIZEIN-1:0] a_reg, b_reg;
reg signed [SIZEIN:0] diff_reg;
reg signed [2*SIZEIN+1:0] m_reg;

always @(posedge clk) begin
    a_reg <= a;
    b_reg <= b;
    diff_reg <= a_reg - b_reg;
    m_reg <= diff_reg * diff_reg;
end

// Output result
assign square_out = m_reg;

endmodule // squarediffmult

// CHECK: module squarediffmult_lakeroad(a, b, clk, square_out);
// CHECK:   DSP48E2 #(
// CHECK: endmodule
