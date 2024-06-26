module top(input clk, input [15:0] a, b, c, output [15:0] p);

  reg [15:0] tmp0, tmp1;

  always @ (posedge clk) begin
    tmp0 <= (a * b) & c;
    tmp1 <= tmp0;
  end

  assign p = tmp1;

endmodule
