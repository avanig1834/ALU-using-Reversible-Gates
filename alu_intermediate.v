`include "full_adder/full_adder.v"
`include "full_subtractor/full_subtractor.v"

module alu(
    input [3:0] a, b,
    input [2:0] opcode,
    output reg [7:0] out,
    output reg carry_borrow, zero, parity, sign, overflow
);

// Wires to connect submodules
wire [7:0] add_out, sub_out;
wire add_carry, add_zero, add_parity, add_sign, add_overflow;
wire sub_borrow, sub_zero, sub_parity, sub_sign, sub_overflow;

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
