module feynman_gate(a_y, b_y, p_y, q_y); // cnot gate
input a_y, b_y;
output p_y, q_y;

assign p_y = a_y;
assign q_y = a_y ^ b_y; 

endmodule
