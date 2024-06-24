// RUN: outfile=$(mktemp)
// RUN: racket $LAKEROAD_DIR/bin/main.rkt \
// RUN:  --solver bitwuzla \
// RUN:  --verilog-module-filepath %s \
// RUN:  --architecture xilinx-ultrascale-plus \
// RUN:  --template dsp \
// RUN:  --out-format verilog \
// RUN:  --top-module-name top \
// RUN:  --verilog-module-out-signal out:27 \
// RUN:  --pipeline-depth 3 \
// RUN:  --clock-name clk \
// RUN:  --module-name test_module \
// RUN:  --input-signal a:13 \
// RUN:  --input-signal b:13 \
// RUN:  --input-signal c:26 \
// RUN:  --extra-cycles 3 \
// RUN:  --timeout 10000 \
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
// RUN:    --pipeline_depth 3 \
// RUN:    --output_signal out:27 \
// RUN:    --input_signal a:13 \
// RUN:    --input_signal b:13 \
// RUN:    --input_signal c:26 \
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
	input  [12:0] a,
	input  [12:0] b,
	input  [25:0] c,
	output [26:0] out,
    input clk);

    localparam pre_pipeline_lp = 2;
    localparam post_pipeline_lp = 1;
    localparam width_a_p = 13;
    localparam width_b_p = 13;
    localparam width_c_p = 26;
    localparam width_o_p = `BSG_SAFE_CLOG2( ((1 << width_a_p) - 1) * ((1 << width_b_p) - 1) + 
                                                    ((1 << width_c_p)-1) + 1 );
    localparam width_p = width_a_p + width_b_p + width_c_p;
    localparam num_stages_p = pre_pipeline_lp;


    logic [width_a_p-1:0] a_first_stage;
    logic [width_b_p-1:0] b_first_stage;
    logic [width_c_p-1:0] c_first_stage;
    logic [width_o_p-1:0] o_first_stage;

    logic [width_a_p-1:0] a_second_stage;
    logic [width_b_p-1:0] b_second_stage;
    logic [width_c_p-1:0] c_second_stage;
    logic [width_o_p-1:0] o_second_stage;

    logic [width_a_p-1:0] a_third_stage;
    logic [width_b_p-1:0] b_third_stage;
    logic [width_c_p-1:0] c_third_stage;
    logic [width_o_p-1:0] o_third_stage;

    wire [width_o_p-1:0] o_r;
    

    always @(posedge clk) begin 
        a_first_stage <= a;
        b_first_stage <= b;
        c_first_stage <= c;
        o_first_stage <= o_r;

        a_second_stage <= a_first_stage;
        b_second_stage <= b_first_stage;
        c_second_stage <= c_first_stage;
        o_second_stage <= o_first_stage;

        a_third_stage <= a_second_stage;
        b_third_stage <= b_second_stage;
        c_third_stage <= c_second_stage;
        o_third_stage <= o_second_stage;
    end

    case (pre_pipeline_lp)
        1: assign o_r = (a_first_stage  * b_first_stage)  + c_first_stage;
        2: assign o_r = (a_second_stage * b_second_stage) + c_second_stage;
        3: assign o_r = (a_third_stage  * b_third_stage)  + c_third_stage;
        default: assign o_r = (a * b) + c;
    endcase

    case (post_pipeline_lp)
        1: assign out = o_first_stage;
        2: assign out = o_second_stage;
        3: assign out = o_third_stage;
        default: assign out = o_r;
    endcase
    
endmodule

// CHECK: module test_module(a, b, c, clk, out);
// CHECK:   DSP48E2 #(
// CHECK: endmodule

