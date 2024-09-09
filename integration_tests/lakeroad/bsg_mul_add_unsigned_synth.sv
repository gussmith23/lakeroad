// RUN: outfile=$(mktemp)
// RUN: yosys -m "$LAKEROAD_DIR/yosys-plugin/lakeroad.so" -p " \
// RUN:  read_verilog %s; \
// RUN:  hierarchy -top in_module; \
// RUN:  lakeroad in_module; \
// RUN:  rename in_module out_module; \
// RUN:  write_verilog $outfile"
// RUN: FileCheck %s < $outfile


`include "bsg_dff_chain.sv"
`include "bsg_defines.sv"

(* template = "dsp" *) 
(* architecture = "xilinx-ultrascale-plus" *) 
(* pipeline_depth = 1 *)
module in_module #(
    parameter  width_a_p = 13
    ,parameter width_b_p = 13
    ,parameter width_c_p = 26
    ,parameter width_o_p = 27
    ,parameter pipeline_p = 1
  ) (
    (* data *)
    input [width_a_p-1 : 0] a_i,

    (* data *)
    input [width_b_p-1 : 0] b_i,

    (* data *)
    input [width_c_p-1 : 0] c_i,

    input clk_i,

    (* out *)
    output [width_o_p-1 : 0] o);

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

// CHECK: module out_module(a_i, b_i, c_i, clk_i, o);

