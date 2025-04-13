`include "full_adder/full_adder.v"
`include "full_subtractor/full_subtractor.v"
`include "logic_operation/and_gate.v"
`include "logic_operation/xor_gate.v"
`include "logic_operation/or_gate.v"
`include "logic_operation/xnor_gate.v"

module alu(
    input [3:0] a, b,
    input [2:0] opcode,
    output reg [7:0] out,
    output reg carry_borrow, zero, parity, sign, overflow,
    output reg [3:0] and_out, xor_out, or_out, xnor_out
);

// Wires to connect submodules
wire [7:0] add_out, sub_out;
wire add_carry, add_zero, add_parity, add_sign, add_overflow;
wire sub_borrow, sub_zero, sub_parity, sub_sign, sub_overflow;
wire [3:0] and_op, xor_op, or_op, xnor_op;

// Instantiate adder
full_adder adder_inst (
    .a(a),
    .b(b),
    .out(add_out),
    .carry(add_carry),
    .zero(add_zero),
    .parity(add_parity),
    .sign(add_sign),
    .overflow(add_overflow)
);

// Instantiate subtractor
full_subtractor subtractor_inst (
    .a(a),
    .b(b),
    .out(sub_out),
    .borrow(sub_borrow),
    .zero(sub_zero),
    .parity(sub_parity),
    .sign(sub_sign),
    .overflow(sub_overflow)
);

// Instantiate and operator
and_op and_inst (
    .a(a),
    .b(b),
    .out(and_op)
);

//Instantiate xor operator
xor_op xor_inst (
    .a(a),
    .b(b),
    .out(xor_op)
);

//Instantiate or operator
or_op or_inst (
    .a(a),
    .b(b),
    .out(or_op)
);

// Instantiate xnor operator 
xnor_op xnor_inst (
    .a(a), 
    .b(b),
    .out(xnor_op)
);
// Main control logic based on opcode
always @(*) begin
    case(opcode)
        3'b000: begin // Addition
            out = add_out;
            carry_borrow = add_carry;
            zero = add_zero;
            parity = add_parity;
            sign = add_sign;
            overflow = add_overflow;
        end
        3'b001: begin // Subtraction
            out = sub_out;
            carry_borrow = sub_borrow;
            zero = sub_zero;
            parity = sub_parity;
            sign = sub_sign;
            overflow = sub_overflow;
        end
        3'b100: begin // logical and operator
            and_out = and_op;
        end
        3'b101: begin // Logical or operator
            or_out = or_op;
        end
        3'b110: begin // logical xor operator
            xor_out = xor_op;
        end
        3'b111: begin // Logical xnor operator
            xnor_out = xnor_op;
        end
        default: begin
            out = 8'b0;
            carry_borrow = 0;
            zero = 1;
            parity = 0;
            sign = 0;
            overflow = 0;
        end
    endcase
end

endmodule
