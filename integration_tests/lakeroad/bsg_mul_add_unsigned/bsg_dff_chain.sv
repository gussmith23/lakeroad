


`include "bsg_dff.sv"
`include "bsg_defines.sv"

(* template = "dsp" *) 
(* architecture = "xilinx-ultrascale-plus" *) 
(* pipeline_depth = 0 *)
module bsg_dff_chain #(
                 parameter width_p = 27
                ,parameter num_stages_p    =       1
        )
        (
                (* data *)
                input                           clk_i,

                (* data *)
                input [width_p-1:0]             data_i,

                (* out *)
                output[width_p-1:0]             data_o
        );

        logic [1:0] data_delayed [26:0];

        if( num_stages_p == 0) begin:pass_through
                wire unused = clk_i;
                assign data_o   = data_i;
        end:pass_through

        else begin:chained
                assign data_delayed[0]  = data_i                        ;
                assign data_o           = data_delayed[num_stages_p]    ;

                genvar i;
                for(i=1; i<= 1; i++) begin
                        bsg_dff #( .width_p ( width_p ) )
                                ch_reg (
                                        .clk_i        ( clk_i                 )
                                       ,.data_i         ( data_delayed[ i-1 ]   )
                                       ,.data_o         ( data_delayed[ i   ]   )
                                );
                end

        end:chained

endmodule
