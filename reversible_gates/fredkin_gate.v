module fredkin_gate(a_f, b_f, c_f, p_f, q_f, r_f); // controlled swap gate
input a_f, b_f, c_f;
output p_f, q_f, r_f;

assign p_f = a_f;
assign q_f = ((~a_f) & b_f) ^ (a_f & c_f);
assign q_f = ((~a_f) & c_f) ^ (a_f & b_f);

// alternately can be written as
// assign Q = (a_f == 0) ? b_f : c_f;
// assign R = (a_f == 0) ? c_f : b_f;

// P = A
// Q, R depend on A:
// If A = 0, then Q = B, R = C (no swap)
// If A = 1, then Q = C, R = B (swap)
endmodule