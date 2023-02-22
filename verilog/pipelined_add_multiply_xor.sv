module pipelined_add_multiply_xor(
  input clk,
  input [15:0] a,
  input [15:0] b,
  input [15:0] c,
  input [15:0] d,
  output [15:0] out
);

  logic [15:0] sum0_result;
  logic [15:0] mult_result;
  logic [15:0] xor_result;

  always @ (posedge clk) begin
    sum0_result <= a + b;
    mult_result <= sum0_result * c;
    xor_result <= mult_result ^ d;
  end 

  assign out = xor_result;

endmodule