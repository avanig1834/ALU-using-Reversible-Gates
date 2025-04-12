`include "reversible_gates/fredkin_gate.v"
module or_op(a,b,out);
input [3:0] a,b;
output [3:0] out;

wire [3:0] s;

// initialising fredkin gates by keeping c=1 n output fron Q
fredkin_gate fk0(.a_f(a[0]), .b_f(b[0]), .c_f(1'b1), .p_f(), .q_f(s[0]), .r_f());
fredkin_gate fk1(.a_f(a[1]), .b_f(b[1]), .c_f(1'b1), .p_f(), .q_f(s[1]), .r_f());
fredkin_gate fk2(.a_f(a[2]), .b_f(b[2]), .c_f(1'b1), .p_f(), .q_f(s[2]), .r_f());
fredkin_gate fk3(.a_f(a[3]), .b_f(b[3]), .c_f(1'b1), .p_f(), .q_f(s[3]), .r_f());

assign out = {s[3], s[2], s[1], s[0]};


endmodule


// module or_tb;
// reg [3:0] a,b;
// wire [3:0] out;

// or_op uut(.a(a), .b(b), .out(out));
// initial begin
//     $dumpfile("or_tb.vcd");
//     $dumpvars(0, or_tb);
// end

// initial begin
//   $monitor("%b\t%b\t%b", a, b, out);
//     a = 4'b0000; b = 4'b1111; #10;
//     a = 4'b0101; b = 4'b1010; #10;
//     $finish;
// end

// endmodule
