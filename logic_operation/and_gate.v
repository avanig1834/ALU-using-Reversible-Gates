`include "reversible_gates/toffoli_gate.v"

module and_op(a,b,out);
input [3:0] a,b;
output [3:0] out;

wire [3:0] s;
toffoli_gate t0(.a_t(a[0]), .b_t(b[0]), .c_t(1'b0), .p_t(), .q_t(), .r_t(s[0]));
toffoli_gate t1(.a_t(a[1]), .b_t(b[1]), .c_t(1'b0), .p_t(), .q_t(), .r_t(s[1]));
toffoli_gate t2(.a_t(a[2]), .b_t(b[2]), .c_t(1'b0), .p_t(), .q_t(), .r_t(s[2]));
toffoli_gate t3(.a_t(a[3]), .b_t(b[3]), .c_t(1'b0), .p_t(), .q_t(), .r_t(s[3]));

assign out = {s[3], s[2], s[1], s[0]};

endmodule

// module and_tb;
// reg [3:0] a,b;
// wire [3:0] out;

// and_op uut(.a(a), .b(b), .out(out));
// initial begin
//     $dumpfile("and_tb.vcd");
//     $dumpvars(0, and_tb);
// end

// initial begin
//   $monitor("%b\t%b\t%b", a, b, out);
//     a = 4'b0000; b = 4'b1111; #10;
//     a = 4'b0101; b = 4'b1010; #10;
//     $finish;
// end

// endmodule
// // FA HA FS HS AND OR XOR XNOR