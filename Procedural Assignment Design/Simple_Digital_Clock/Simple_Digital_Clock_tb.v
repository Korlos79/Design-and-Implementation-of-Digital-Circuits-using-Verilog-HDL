`timescale 1ns/1ps

module Simple_Digital_Clock_tb;
    reg clk, reset;
    reg [15:0] SW;
    wire [6:0] HEX2, HEX3, HEX4, HEX5, HEX6, HEX7;

    // Instantiate DUT
    digital_clock uut (
        .clk(clk),
        .reset(reset),
        .SW(SW),
        .HEX2(HEX2),
        .HEX3(HEX3),
        .HEX4(HEX4),
        .HEX5(HEX5),
        .HEX6(HEX6),
        .HEX7(HEX7)
    );

    // Clock generator (50 MHz = 20 ns period)
    always #10 clk = ~clk;

    // Monitor thời gian qua HEX (định dạng BCD) — test chức năng
    task print_time;
        begin
            $display("Time: %d%d:%d%d:%d%d",
                uut.HEX7, uut.HEX6, uut.HEX5, uut.HEX4, uut.HEX3, uut.HEX2);
        end
    endtask

    // Mô phỏng
    initial begin
        clk = 0;
        reset = 1;
        SW = 16'b0;

        #30 reset = 0; // release reset

        // Thiết lập giờ = 10 (SW[15] = 1, SW[10:6] = 5'b01010)
        SW[15] = 1;
        SW[10:6] = 5'd10;
        #20 SW[15] = 0;

        // Thiết lập phút = 45 (SW[14] = 1, SW[5:0] = 6'd45)
        SW[14] = 1;
        SW[5:0] = 6'd45;
        #20 SW[14] = 0;

        // Đợi vài chu kỳ để thời gian tăng
        repeat (3) begin
            #1_000_000;  // mô phỏng khoảng 1ms = 50,000 xung
            print_time(); // hiển thị thời gian (giả lập)
        end

        $finish;
    end
endmodule
