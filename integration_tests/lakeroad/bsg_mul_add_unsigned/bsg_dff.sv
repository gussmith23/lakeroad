
(* template = "dsp" *) 
(* architecture = "xilinx-ultrascale-plus" *) 
(* pipeline_depth = 0 *)
module bsg_dff #(
      parameter width_p = 27
		 ,harden_p=0
		 ,strength_p=1   // set drive strength
		 )
   (
    (* data *)
    input   clk_i,

    (* data *)
    input  [width_p-1:0] data_i,

    (* out *)
    output [width_p-1:0] data_o
    );

   reg [width_p-1:0] data_r;

   assign data_o = data_r;

   always @(posedge clk_i)
     data_r <= data_i;

endmodule
