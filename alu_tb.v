`timescale 1ns/1ps
`include "alu_intermediate.v"
module alu_tb;

    // Inputs
    reg [3:0] a, b;
    reg [2:0] opcode;

    // Outputs
    wire [7:0] out;
    wire carry_borrow, zero, parity, sign, overflow;
    wire [3:0] and_out, xor_out, or_out, xnor_out;

    // Instantiate the ALU
    alu uut (
        .a(a),
        .b(b),
        .opcode(opcode),
        .out(out),
        .carry_borrow(carry_borrow),
        .zero(zero),
        .parity(parity),
        .sign(sign),
        .overflow(overflow),
        .and_out(and_out),
        .xor_out(xor_out),
        .or_out(or_out),
        .xnor_out(xnor_out)
    );
    initial begin
        $dumpfile("alu_tb.vcd");
        $dumpvars(0, alu_tb);
    end

    initial begin
        // Display header
        $display("Time\tOpcode\tA\tB\tOut\tCarry/Borrow\tZero\tParity\tSign\tOverflow\tand\txor\tor\txnor");

        // Monitor changes
        $monitor("%0t\t%b\t%0d\t%0d\t%0d\t%b\t\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b",
                 $time, opcode, a, b, out, carry_borrow, zero, parity, sign, overflow, and_out, xor_out, or_out, xnor_out);

        // Test Addition
        a = 4'd7; b = 4'd5; opcode = 3'b000; #10;

        // Test Subtraction
        a = 4'd7; b = 4'd5; opcode = 3'b001; #10;

        // Test Zero result
        a = 4'd4; b = 4'd4; opcode = 3'b001; #10;

        // Test and operation
        a = 4'b1111; b = 4'b0010; opcode = 3'b100; #10;
        // $display("A\tB\tand_op");
        // $monitor("%b\t%b\t%b", a, b, and_out);

        // Test xor operation
        a = 4'b0101; b = 4'b1000; opcode = 3'b110; #10;
        // $display("Opcode\tA\tB\txor_op");
        // $monitor("%b\t%b\t%b", a, b, xor_out);

        // Test or operation
        a = 4'b0101; b = 4'b1000; opcode = 3'b101; #10;

        // Test xnor operation
        a = 4'b0101; b = 4'b1100; opcode = 3'b101; #10;

        // Test default case
        a = 4'd3; b = 4'd3; opcode = 3'b111; #10;


        // Finish simulation
        $finish;
    end

endmodule
