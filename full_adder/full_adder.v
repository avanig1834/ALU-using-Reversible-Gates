// `include "reversible_gates/peres_gate.v"
module full_adder(
    input [3:0] a, b,
    output reg [7:0] out,
    output reg carry, zero, parity, sign, overflow
);

// Internal wires for intermediate Peres gate outputs
wire [3:0] q, r, s;
wire [3:0] sum;
wire [4:0] carry_chain;

assign carry_chain[0] = 1'b0; // Initial carry-in

// Bit 0
peres_gate pg0_1(.a_p(a[0]), .b_p(b[0]), .c_p(1'b0), .p_p(), .q_p(q[0]), .r_p(r[0]));
peres_gate pg0_2(.a_p(q[0]), .b_p(carry_chain[0]), .c_p(1'b0), .p_p(), .q_p(sum[0]), .r_p(s[0]));
assign carry_chain[1] = r[0] ^ s[0];

// Bit 1
peres_gate pg1_1(.a_p(a[1]), .b_p(b[1]), .c_p(1'b0), .p_p(), .q_p(q[1]), .r_p(r[1]));
peres_gate pg1_2(.a_p(q[1]), .b_p(carry_chain[1]), .c_p(1'b0), .p_p(), .q_p(sum[1]), .r_p(s[1]));
assign carry_chain[2] = r[1] ^ s[1];

// Bit 2
peres_gate pg2_1(.a_p(a[2]), .b_p(b[2]), .c_p(1'b0), .p_p(), .q_p(q[2]), .r_p(r[2]));
peres_gate pg2_2(.a_p(q[2]), .b_p(carry_chain[2]), .c_p(1'b0), .p_p(), .q_p(sum[2]), .r_p(s[2]));
assign carry_chain[3] = r[2] ^ s[2];

// Bit 3
peres_gate pg3_1(.a_p(a[3]), .b_p(b[3]), .c_p(1'b0), .p_p(), .q_p(q[3]), .r_p(r[3]));
peres_gate pg3_2(.a_p(q[3]), .b_p(carry_chain[3]), .c_p(1'b0), .p_p(), .q_p(sum[3]), .r_p(s[3]));
assign carry_chain[4] = r[3] ^ s[3]; // Final carry-out

// Output logic
always @(*) begin
    out = {4'b0000, sum};              // Extend to 8-bit output
    carry = carry_chain[4];           // Final carry-out
    zero = (sum == 4'b0000);          // Zero flag
    sign = sum[3];                    // MSB indicates sign in signed addition
    parity = ^sum;                    // Parity flag (XOR of all bits)
    overflow = (a[3] & b[3] & ~sum[3]) | (~a[3] & ~b[3] & sum[3]); // Signed overflow detection
end

endmodule



// // peres gate
// // `include "peres_gate.v"

// module full_adder(a,b,carry,out,zero,parity,sign,overflow);
// input [3:0]a,b;
// output reg [7:0]out; //in case multiplication results in larger bits
// output reg carry,zero,parity,sign,overflow;

// // full adder using peres gate 
// wire p0,p1,p2,p3;
// wire q0,q1,q2,q3;
// wire r0,r1,r2,r3;

// wire [3:0]sum;

// // instantiating peres gate to get the XOR output ie sum
// peres_gate u0(.a_p(a[0]), .b_p(b[0]), .c_p(1'b0), .p_p(p0), .q_p(q0), .r_p(r0));
// peres_gate u1(.a_p(a[1]), .b_p(b[1]), .c_p(r0), .p_p(p1), .q_p(q1), .r_p(r1));
// peres_gate u2(.a_p(a[2]), .b_p(b[2]), .c_p(r1), .p_p(p2), .q_p(q2), .r_p(r2));
// peres_gate u3(.a_p(a[3]), .b_p(b[3]), .c_p(r2), .p_p(p3), .q_p(q3), .r_p(r3));

// assign sum = {q3,q2,q1,q0};

// // output logic
// always @(*) begin
//     out = {4'b0000, sum};
//     carry = r3;
//     zero = (sum == 4'b0000);
//     sign = sum[3];
//     parity = ^sum; // bitwise XOR
//     overflow = (a[3] & b[3] & ~(sum[3]) | ~(a[3]) & ~(b[3]) & sum[3]);

// end
// endmodule

// // 000: Addition (uses reversible Peres gates)

// // 001: Subtraction

// // 010: Multiplication

// // 011: Division

