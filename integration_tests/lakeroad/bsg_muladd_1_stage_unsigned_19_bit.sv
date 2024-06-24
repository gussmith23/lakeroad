// RUN: outfile=$(mktemp)
// RUN: racket $LAKEROAD_DIR/bin/main.rkt \
// RUN:  --solver bitwuzla \
// RUN:  --verilog-module-filepath %s \
// RUN:  --architecture xilinx-ultrascale-plus \
// RUN:  --template dsp \
// RUN:  --out-format verilog \
// RUN:  --top-module-name top \
// RUN:  --verilog-module-out-signal out:39 \
// RUN:  --pipeline-depth 1 \
// RUN:  --clock-name clk \
// RUN:  --module-name test_module \
// RUN:  --input-signal a:19 \
// RUN:  --input-signal b:19 \
// RUN:  --input-signal c:38 \
// RUN:  --extra-cycles 3 \
// RUN:  --timeout 2700 \
// RUN: > $outfile
// RUN: cat $outfile
// RUN: FileCheck %s < $outfile
// RUN: if [ -z ${LAKEROAD_PRIVATE_DIR+x} ]; then \
// RUN:   echo "Warning: LAKEROAD_PRIVATE_DIR is not set. Skipping simulation."; \
// RUN:   exit 0; \
// RUN: else \
// RUN:   python3 $LAKEROAD_DIR/bin/simulate_with_verilator.py \
// RUN:    --test_module_name test_module \
// RUN:    --ground_truth_module_name top \
// RUN:    --max_num_tests=10000 \
// RUN:    --verilog_filepath $outfile \
// RUN:    --verilog_filepath %s \
// RUN:    --clock_name clk \
// RUN:    --pipeline_depth 1 \
// RUN:    --output_signal out:39 \
// RUN:    --input_signal a:19 \
// RUN:    --input_signal b:10 \
// RUN:    --input_signal c:38 \
// RUN:    --verilator_include_dir "$LAKEROAD_PRIVATE_DIR/DSP48E2/" \
// RUN:    --verilator_extra_arg='-DXIL_XECLIB' \
// RUN:    --verilator_extra_arg='-Wno-UNOPTFLAT' \
// RUN:    --verilator_extra_arg='-Wno-LATCH' \
// RUN:    --verilator_extra_arg='-Wno-WIDTH' \
// RUN:    --verilator_extra_arg='-Wno-STMTDLY' \
// RUN:    --verilator_extra_arg='-Wno-CASEX' \
// RUN:    --verilator_extra_arg='-Wno-TIMESCALEMOD' \
// RUN:    --verilator_extra_arg='-Wno-PINMISSING'; \
// RUN: fi

`include "bsg_defines.sv"

(* use_dsp = "yes" *) module top(
	input  [18:0] a,
	input  [18:0] b,
	input  [35:0] c,
	output [36:0] out,
    input clk);

    localparam pre_pipeline_lp = 0;
    localparam post_pipeline_lp = 0;
    localparam width_a_p = 18;
    localparam width_b_p = 18;
    localparam width_c_p = 36;
    localparam width_o_p = 37;
    localparam width_p = width_a_p + width_b_p + width_c_p;
    localparam num_stages_p = pre_pipeline_lp;


    wire [width_a_p-1:0] a_r;
    wire [width_b_p-1:0] b_r;
    wire [width_c_p-1:0] c_r;

    if (num_stages_p == 0) begin:pass_through 
        wire unused = clk;
        assign a_r = a;
        assign b_r = b;
        assign c_r = c;
    end:pass_through

    wire [width_o_p-1:0] o_r = a_r * b_r + c_r;

	assign out = o_r;
endmodule

// CHECK: module test_module(a, b, c, clk, out);
// CHECK:   DSP48E2 #(
// CHECK: endmodule

