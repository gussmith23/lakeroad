module pipelined_add_multiply_accumulate(
  input clk,
  input [15:0] a,
  input [15:0] b,
  input [15:0] c,
  input [15:0] acc,
  output [15:0] out
);

  logic [15:0] sum0_result;
  logic [15:0] mult_result;
  logic [15:0] sum_result;

  always @ (posedge clk) begin
    sum0_result <= a + b;
    mult_result <= sum0_result * c;
    sum_result <= mult_result + acc;
  end 

  assign out = sum_result;

endmodule