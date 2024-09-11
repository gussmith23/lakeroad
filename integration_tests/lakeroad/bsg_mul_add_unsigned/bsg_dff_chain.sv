 //====================================================================
// bsg_dff_chain.sv
// 04/01/2018, shawnless.xie@gmail.com
//====================================================================
//
// Pass the input singal to a chainded  DFF registers

`include "bsg_defines.sv"
`include "bsg_dff.sv"

module bsg_dff_chain #(
                 //the width of the input signal
                 parameter width_p = 27

                 //the stages of the chained DFF register
                 //can be 0
                ,parameter       num_stages_p    =       1
        )
        (
                 input                           clk_i
                ,input [width_p-1:0]             data_i
                ,output[width_p-1:0]             data_o
        );

        reg [width_p-1:0] data_delayed [1:0];
        //logic [1:0][width_p-1:0] data_delayed;

        if( num_stages_p == 0) begin:pass_through
                wire unused = clk_i;
                assign data_o   = data_i;
        end:pass_through

        else begin:chained
                // data_i -- delayed[0]
                //
                // data_o -- delayed[num_stages_p]

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