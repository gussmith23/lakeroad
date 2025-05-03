
(* solvers = "bitwuzla, stp, yices, cvc5" *)
(* architecture = "lattice-ecp5" *)
(* template = "dsp" *)
(* pipeline_depth = 2 *)
(* timeout = 90 *)
(* extra_cycles = 3 *)
module top(
  (* clk *)
  input clk, 
  (* data *)
  input [15:0] a, 
  (* data *)
  input [15:0] b, 
  (* data *)
  input [15:0] c, 
  (* out *)
  output [15:0] p
);

  reg [15:0] tmp0, tmp1;

  always @ (posedge clk) begin
    tmp0 <= (a * b) & c;
    tmp1 <= tmp0;
  end

  assign p = tmp1;

endmodule
