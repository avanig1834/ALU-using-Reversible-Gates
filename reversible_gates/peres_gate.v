module peres_gate(a_p, b_p, c_p, p_p, q_p, r_p);
input a_p, b_p, c_p;
output p_p, q_p, r_p;

assign p_p = a_p;
assign q_p = a_p ^ b_p; // can work as sum for half adder
assign r_p = (a_p & b_p) ^ c_p; // can work as carry for half adder if c=0
endmodule