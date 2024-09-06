// RUN: outfile=$(mktemp)
// RUN: racket $LAKEROAD_DIR/bin/main.rkt \
// RUN:  --solver bitwuzla \
// RUN:  --verilog-module-filepath %s \
// RUN:  --architecture xilinx-ultrascale-plus \
// RUN:  --template dsp \
// RUN:  --out-format verilog \
// RUN:  --top-module-name top \
// RUN:  --verilog-module-out-signal o:27 \
// RUN:  --pipeline-depth 1 \
// RUN:  --clock-name clk_i \
// RUN:  --module-name test_module \
// RUN:  --input-signal a_i:13 \
// RUN:  --input-signal b_i:13 \
// RUN:  --input-signal c_i:26 \
// RUN:  --timeout 270 \
// RUN: > $outfile
// RUN: cat $outfile
// RUN: FileCheck %s < $outfile

`include "bsg_mul_add_unsigned/bsg_defines.sv"
`include "bsg_mul_add_unsigned/bsg_dff_chain.sv"
  
(* use_dsp = "yes" *) module top #(
    parameter  width_a_p = 13
    ,parameter width_b_p = 13
    ,parameter width_c_p = 26
    ,parameter width_o_p = 27
    ,parameter pipeline_p = 1
  ) (
     input [width_a_p-1 : 0] a_i
    ,input [width_b_p-1 : 0] b_i
    ,input [width_c_p-1 : 0] c_i
    ,input clk_i
    ,output [width_o_p-1 : 0] o
    );

    localparam pre_pipeline_lp = pipeline_p > 2 ? 1 : 0;
    localparam post_pipeline_lp = pipeline_p > 2 ? pipeline_p -1 : pipeline_p; 

    wire [width_a_p-1:0] a_r;
    wire [width_b_p-1:0] b_r;
    wire [width_c_p-1:0] c_r;

    bsg_dff_chain #(width_a_p + width_b_p + width_c_p, pre_pipeline_lp)
        pre_mul_add (
            .clk_i(clk_i)
            ,.data_i({a_i, b_i, c_i})
            ,.data_o({a_r, b_r, c_r})
        );

    wire [width_o_p-1:0] o_r = a_r * b_r + c_r;

    bsg_dff_chain #(width_o_p, post_pipeline_lp)
        post_mul_add (
            .clk_i(clk_i)
            ,.data_i(o_r)
            ,.data_o(o)
        );
endmodule

// CHECK: module test_module(a_i, b_i, c_i, clk_i, o);
// CHECK:   DSP48E2 #(
// CHECK: endmodule

