// // peres gate
`include "reversible_gates/peres_gate.v"

// //feynman gate
`include "reversible_gates/feynman_gate.v"

module full_subtractor(
    input [3:0] a, b,
    output reg [7:0] out,
    output reg borrow, zero, parity, sign, overflow
);

// inverting b 
wire [3:0] binv;
wire [3:0] tmp;

feynman_gate u0(.a_y(1'b1), .b_y(b[0]), .p_y(), .q_y(binv[0]));
feynman_gate u1(.a_y(1'b1), .b_y(b[1]), .p_y(), .q_y(binv[1]));
feynman_gate u2(.a_y(1'b1), .b_y(b[2]), .p_y(), .q_y(binv[2]));
feynman_gate u3(.a_y(1'b1), .b_y(b[3]), .p_y(), .q_y(binv[3]));

// Now add A + ~B + 1 using Peres gates
wire [3:0] q, r, s;
wire [3:0] diff;
wire [4:0] carry_chain;

assign carry_chain[0] = 1'b1; // Start with carry-in 1 for 2's complement

// Bit 0
peres_gate pg0_1(.a_p(a[0]), .b_p(binv[0]), .c_p(1'b0), .p_p(), .q_p(q[0]), .r_p(r[0]));
peres_gate pg0_2(.a_p(q[0]), .b_p(carry_chain[0]), .c_p(1'b0), .p_p(), .q_p(diff[0]), .r_p(s[0]));
assign carry_chain[1] = r[0] ^ s[0];

// Bit 1
peres_gate pg1_1(.a_p(a[1]), .b_p(binv[1]), .c_p(1'b0), .p_p(), .q_p(q[1]), .r_p(r[1]));
peres_gate pg1_2(.a_p(q[1]), .b_p(carry_chain[1]), .c_p(1'b0), .p_p(), .q_p(diff[1]), .r_p(s[1]));
assign carry_chain[2] = r[1] ^ s[1];

// Bit 2
peres_gate pg2_1(.a_p(a[2]), .b_p(binv[2]), .c_p(1'b0), .p_p(), .q_p(q[2]), .r_p(r[2]));
peres_gate pg2_2(.a_p(q[2]), .b_p(carry_chain[2]), .c_p(1'b0), .p_p(), .q_p(diff[2]), .r_p(s[2]));
assign carry_chain[3] = r[2] ^ s[2];

// Bit 3
peres_gate pg3_1(.a_p(a[3]), .b_p(binv[3]), .c_p(1'b0), .p_p(), .q_p(q[3]), .r_p(r[3]));
peres_gate pg3_2(.a_p(q[3]), .b_p(carry_chain[3]), .c_p(1'b0), .p_p(), .q_p(diff[3]), .r_p(s[3]));
assign carry_chain[4] = r[3] ^ s[3]; // Final carry/borrow

// Output logic
always @(*) begin
    out = {4'b0000, diff};
    borrow = ~carry_chain[4]; // borrow is inverse of final carry
    zero = (diff == 4'b0000);
    parity = ^diff;
    sign = diff[3];
    overflow = (a[3] ^ b[3]) & (a[3] ^ diff[3]);
end

endmodule
