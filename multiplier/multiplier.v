module multiplier(
input [3:0] a, b,
output reg [7:0] result
);

always @(*) begin
  result = a * b;
end

endmodule
