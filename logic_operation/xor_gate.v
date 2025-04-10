// `include "../reversible_gates/feynman_gate.v"
module xor_op(a,b,out);
input [3:0] a, b;
output [3:0] out;

wire [3:0] s;

feynman_gate f0(.a_y(a[0]), .b_y(b[0]), .p_y(), .q_y(s[0]));
feynman_gate f1(.a_y(a[1]), .b_y(b[1]), .p_y(), .q_y(s[1]));
feynman_gate f2(.a_y(a[2]), .b_y(b[2]), .p_y(), .q_y(s[2]));
feynman_gate f3(.a_y(a[3]), .b_y(b[3]), .p_y(), .q_y(s[3]));

assign out = {s[3], s[2], s[1], s[0]};

endmodule


// module xor_tb;
// reg [3:0] a,b;
// wire [3:0] out;

// xor_op uut(.a(a), .b(b), .out(out));
// initial begin
//     $dumpfile("xor_tb.vcd");
//     $dumpvars(0, xor_tb);
// end

// initial begin
//   $monitor("%b\t%b\t%b", a, b, out);
//     a = 4'b0000; b = 4'b1111; #10;
//     a = 4'b0101; b = 4'b1010; #10;
//     $finish;
// end

// endmodule
