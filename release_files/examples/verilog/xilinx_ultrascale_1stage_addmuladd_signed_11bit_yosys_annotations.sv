(* solvers = "bitwuzla, stp, yices, cvc5" *)
(* architecture = "xilinx-ultrascale-plus" *)
(* template = "dsp" *)
(* pipeline_depth = 1 *)
(* timeout = 90 *)
(* extra_cycles = 3 *)
module top(
	(* data *)
	input signed [10:0] a,
	(* data *)
	input signed [10:0] b,
	(* data *)
	input signed [10:0] c,
	(* data *)
	input signed [10:0] d,
	(* out *)
	output [10:0] out,
	(* clk *)
	input clk
);

	logic signed [21:0] stage0;

	always @(posedge clk) begin
	stage0 <= ((d + a) * b) + c;

	end

	assign out = stage0;
endmodule
