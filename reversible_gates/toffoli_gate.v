module toffoli_gate(a_t, b_t, c_t, p_t, q_t, r_t);
input a_t, b_t, c_t;
output p_t, q_t, r_t;

assign p_t = a_t;
assign q_t = b_t;
assign r_t = (a_t & b_t) ^ c_t; // can work as carry for half adder if c=0
endmodule