`timescale 1ns/1ps
`include "alu_intermediate.v"
module alu_tb;

    // Inputs
    reg [3:0] a, b;
    reg [2:0] opcode;

    // Outputs
    wire [7:0] out;
    wire carry_borrow, zero, parity, sign, overflow;

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
        .overflow(overflow)
    );
    initial begin
        $dumpfile("alu_tb.vcd");
        $dumpvars(0, alu_tb);
    end

    initial begin
        // Display header
        $display("Time\tOpcode\tA\tB\tOut\tCarry/Borrow\tZero\tParity\tSign\tOverflow");

        // Monitor changes
        $monitor("%0t\t%b\t%0d\t%0d\t%0d\t%b\t\t%b\t%b\t%b\t%b",
                 $time, opcode, a, b, out, carry_borrow, zero, parity, sign, overflow);

        // Test Addition
        a = 4'd7; b = 4'd5; opcode = 3'b000; #10;

        // Test Subtraction
        a = 4'd7; b = 4'd5; opcode = 3'b001; #10;

        // Test Zero result
        a = 4'd4; b = 4'd4; opcode = 3'b001; #10;

        // Test default case
        a = 4'd3; b = 4'd3; opcode = 3'b111; #10;

        // Finish simulation
        $finish;
    end

endmodule
