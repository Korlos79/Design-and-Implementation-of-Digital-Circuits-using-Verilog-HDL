`timescale 1ns/1ps

module Two_Digit_BCD_Counter_00_to_20_tb;
    reg CLOCK_50, KEY0;
    wire [6:0] HEX0, HEX1;

    // Instantiate the DUT
    TwoDigitBCDCounter uut (
        .CLOCK_50(CLOCK_50),
        .KEY0(KEY0),
        .HEX0(HEX0),
        .HEX1(HEX1)
    );

    // Clock generation: 20ns period (50MHz)
    always #10 CLOCK_50 = ~CLOCK_50;

    // Helper to decode 7-segment to digit
    function [3:0] decode_7seg;
        input [6:0] seg;
        case (seg)
            7'b1000000: decode_7seg = 0;
            7'b1111001: decode_7seg = 1;
            7'b0100100: decode_7seg = 2;
            7'b0110000: decode_7seg = 3;
            7'b0011001: decode_7seg = 4;
            7'b0010010: decode_7seg = 5;
            7'b0000010: decode_7seg = 6;
            7'b1111000: decode_7seg = 7;
            7'b0000000: decode_7seg = 8;
            7'b0010000: decode_7seg = 9;
            default:    decode_7seg = 15; // invalid
        endcase
    endfunction

    // Monitor
    always @(posedge CLOCK_50) begin
        $display("Time: %4t | Count: %d%d | HEX1: %b HEX0: %b", 
                 $time,
                 decode_7seg(HEX1), decode_7seg(HEX0),
                 HEX1, HEX0);
    end

    // Test scenario
    initial begin
        CLOCK_50 = 0;
        KEY0 = 1; // Apply reset

        // Hold reset for a few cycles
        #50;
        KEY0 = 0; // Release reset

        // Let it count normally up to some value
        repeat (10) #20;

        // Apply reset again mid-way
        $display("--- Reset in the middle ---");
        KEY0 = 1; #40;
        KEY0 = 0;

        // Let it continue counting
        repeat (15) #20;

        // End simulation
        $display("--- Simulation End ---");
        $finish;
    end
endmodule
