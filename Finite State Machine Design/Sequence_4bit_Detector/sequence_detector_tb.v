`timescale 1ns/1ps

module sequence_detector_tb;
    reg clk;
    reg x;
    wire z;

    // Instantiate DUT
    sequence_detector uut (
        .clk(clk),
        .x(x),
        .z(z)
    );

    // Clock generator: 10ns chu kỳ (toggle mỗi 5ns)
    always #5 clk = ~clk;

    // Monitor để theo dõi diễn tiến
    initial begin
        $display("Time\tclk\tx\tz");
        $monitor("%4t\t%b\t%b\t%b", $time, clk, x, z);
    end

    // Chuỗi kiểm thử
    initial begin
        clk = 0;
        x = 0;

        // Đợi một chút rồi gửi chuỗi 1111 → phát hiện
        #7  x = 1;   // 1
        #10 x = 1;   // 2
        #10 x = 1;   // 3
        #10 x = 1;   // 4 → z = 1
        #10 x = 0;   // reset chuỗi

        // Gửi chuỗi 0000 → phát hiện
        #10 x = 0;   // 1
        #10 x = 0;   // 2
        #10 x = 0;   // 3
        #10 x = 0;   // 4 → z = 1
        #10 x = 1;   // reset chuỗi

        // Gửi chuỗi nhiễu: 101010 → không phát hiện
        #10 x = 1;
        #10 x = 0;
        #10 x = 1;
        #10 x = 0;
        #10 x = 1;
        #10 x = 0;

        #20 $finish;
    end
endmodule
