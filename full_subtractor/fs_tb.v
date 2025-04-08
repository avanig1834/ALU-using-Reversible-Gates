`timescale 1ns/1ps
`include "full_subtractor.v"
module fs_tb;

    reg [3:0] a, b;
    wire [7:0] out;
    wire borrow, zero, parity, sign, overflow;

    // Instantiate the full_subtractor module
    full_subtractor uut (
        .a(a),
        .b(b),
        .borrow(borrow),
        .out(out),
        .zero(zero),
        .parity(parity),
        .sign(sign),
        .overflow(overflow)
    );

    initial begin
        $dumpfile("fs_tb.vcd");
        $dumpvars(0, fs_tb);
        $display("Time\tA\tB\tDiff\tBorrow\tZero\tParity\tSign\tOverflow");
        $monitor("%0dns\t%0d\t%0d\t%0d\t%b\t%b\t%b\t%b\t%b", 
                  $time, a, b, out[3:0], borrow, zero, parity, sign, overflow);

        // Test cases
        a = 4'd3;  b = 4'd1;  #10;  // 3 - 1 = 2
        a = 4'd7;  b = 4'd2;  #10;  // 7 - 2 = 5
        a = 4'd5;  b = 4'd5;  #10;  // 5 - 5 = 0
        a = 4'd2;  b = 4'd5;  #10;  // 2 - 5 = -3 (two's complement)
        a = 4'd0;  b = 4'd1;  #10;  // 0 - 1 = -1
        a = 4'd8;  b = 4'd4;  #10;  // 8 - 4 = 4
        a = 4'd15; b = 4'd15; #10;  // 15 - 15 = 0
        a = 4'd10; b = 4'd3;  #10;  // 10 - 3 = 7
        a = 4'd4;  b = 4'd8;  #10;  // 4 - 8 = -4

        $finish;
    end

endmodule
