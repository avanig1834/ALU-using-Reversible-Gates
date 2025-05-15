module divider(
  input  [3:0] a, b,
  output reg [3:0] quotient,
  output reg [3:0] remainder,
  output reg error
);

always @* begin
  if (b == 4'b0000) begin
    error     = 1'b1;
    quotient  = 4'b0000;
    remainder = 4'b0000;
  end else begin
    error     = 1'b0;
    quotient  = a / b;
    remainder = a % b;
  end
end

endmodule
