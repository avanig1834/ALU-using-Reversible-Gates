// `include "reversible_gates/feynman_gate.v"
// `include "logic_operation/xor_gate.v"

module xnor_op(a,b,out);
input [3:0] a,b;
output [3:0] out;

wire [3:0] xor_op;
// initialising xor gate and saving output in xor_op
xor_op x0(.a(a), .b(b), .out(xor_op));

wire [3:0] s;
// initialising feynman gate as not gate to inver output of xor operation
feynman_gate f0(.a_y(1'b1), .b_y(xor_op[0]), .p_y(), .q_y(s[0]));
feynman_gate f1(.a_y(1'b1), .b_y(xor_op[1]), .p_y(), .q_y(s[1]));
feynman_gate f2(.a_y(1'b1), .b_y(xor_op[2]), .p_y(), .q_y(s[2]));
feynman_gate f3(.a_y(1'b1), .b_y(xor_op[3]), .p_y(), .q_y(s[3]));

assign out = {s[3], s[2], s[1], s[0]}; // xnor output

endmodule


// module xnor_tb;
// reg [3:0] a,b;
// wire [3:0] out;

// xnor_op uut(.a(a), .b(b), .out(out));
// initial begin
//     $dumpfile("xnor_tb.vcd");
//     $dumpvars(0, xnor_tb);
// end

// initial begin
//   $monitor("%b\t%b\t%b", a, b, out);
//     a = 4'b0000; b = 4'b1111; #10;
//     a = 4'b0111; b = 4'b1010; #10;
//     $finish;
// end

// endmodule




