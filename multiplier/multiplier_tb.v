module multiplier_tb();
reg [3:0] a, b;
wire [7:0] results;

multiplier uut(.a(a), .b(b), .result(result));

initial begin
  $dumpfile("multiplier_tb.vcd");
  $dumpvars(0, multiplier_tb);

    $monitor("%ba\t%bb\t%bresult", a,b,result);
    a = 4'b0100; b = 4'b0101; #10;
    $finish;
end


endmodule