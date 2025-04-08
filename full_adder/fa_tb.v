`timescale 1ns/1ps

module fa_tb;

    // Inputs
    reg [3:0] a, b;

    // Outputs
    wire [7:0] out;
    wire carry, zero, parity, sign, overflow;

    // Instantiate the Unit Under Test (UUT)
    full_adder uut (
        .a(a),
        .b(b),
        .out(out),
        .carry(carry),
        .zero(zero),
        .parity(parity),
        .sign(sign),
        .overflow(overflow)
    );

    initial begin
        // Dump waves
        $dumpfile("fa_tb.vcd");
        $dumpvars(0, fa_tb);

        $display("Time\tA\tB\tOut\tCarry\tZero\tParity\tSign\tOverflow");
        $monitor("%0t\t%b\t%b\t%0d\t%b\t%b\t%b\t%b\t%b", 
                  $time, a, b, out, carry, zero, parity, sign, overflow);

        // Test 1: Simple addition
        a = 4'b0011; b = 4'b0001; #10; // 3 + 1 = 4

        // Test 2: Carry generation
        a = 4'b1111; b = 4'b0001; #10; // 15 + 1 = 16, carry expected

        // Test 3: Overflow condition
        a = 4'b0111; b = 4'b0100; #10; // 7 + 4 = 11, no overflow
        a = 4'b0111; b = 4'b0111; #10; // 7 + 7 = 14, overflow for signed

        // Test 4: Zero result
        a = 4'b0000; b = 4'b0000; #10;

        // Test 5: Negative result (check sign)
        a = 4'b1000; b = 4'b1000; #10; // 8 + 8 = 16, sign = MSB

        // Done
        $finish;
    end

endmodule
