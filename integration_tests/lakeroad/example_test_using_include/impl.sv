
(* template = "dsp" *) 
(* architecture = "xilinx-ultrascale-plus" *) 
(* pipeline_depth = 0 *)
module impl(
  (* data *)
  input [15:0] a, 
  (* data *)
  input [15:0] b, 
  (* out *)
  output [15:0] o);
  
  assign o = a * b;
endmodule