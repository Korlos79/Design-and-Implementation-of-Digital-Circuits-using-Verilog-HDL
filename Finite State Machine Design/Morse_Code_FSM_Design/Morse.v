module Morse(
    input CLK, 
    input [2:0] SW, 
    input [1:0] KEY, 
    output reg [3:0] LEDR
);
    reg [27:0] timer;
    reg [3:0] morse_code;
    reg start;
    reg prev_key1;
    reg [27:0] max_time;

    // Phát hiện cạnh lên KEY[1]
    wire key1_rising = ~prev_key1 & KEY[1];

    // Bộ timer và điều khiển start
    always @(posedge CLK or negedge KEY[0]) begin
        if (!KEY[0]) begin
            timer <= 0;
            start <= 0;
            prev_key1 <= 0;
        end else begin
            prev_key1 <= KEY[1];

            if (key1_rising) begin
                start <= 1;
                timer <= 0;
            end else if (start) begin
                if (timer < max_time)
                    timer <= timer + 1;
                else
                    start <= 0;
            end
        end
    end

    // Gán max_time theo ký tự Morse
    always @(*) begin
        case (SW)
            3'b000: max_time = 100_000_000; // A
            3'b001: max_time = 150_000_000; // B
            3'b010: max_time = 200_000_000; // C
            3'b011: max_time = 125_000_000; // D
            3'b100: max_time = 25_000_000;  // E
            3'b101: max_time = 150_000_000; // F
            3'b110: max_time = 175_000_000; // G
            3'b111: max_time = 125_000_000; // H
            default: max_time = 0;
        endcase
    end

    // Gán mã Morse tương ứng
    always @(*) begin
        morse_code = 4'b0000;
        case (SW)
            3'b000: begin // A: .-
                if (timer < 25_000_000) morse_code = 4'b1000;
                else if (timer < 100_000_000) morse_code = 4'b0100;
            end
            3'b001: begin // B: -...
                if (timer < 75_000_000) morse_code = 4'b1000;
                else if (timer < 100_000_000) morse_code = 4'b0100;
                else if (timer < 125_000_000) morse_code = 4'b0010;
                else if (timer < 150_000_000) morse_code = 4'b0001;
            end
            3'b010: begin // C: -.-.
                if (timer < 75_000_000) morse_code = 4'b1000;
                else if (timer < 100_000_000) morse_code = 4'b0100;
                else if (timer < 175_000_000) morse_code = 4'b0010;
                else if (timer < 200_000_000) morse_code = 4'b0001;
            end
            3'b011: begin // D: -..
                if (timer < 75_000_000) morse_code = 4'b1000;
                else if (timer < 100_000_000) morse_code = 4'b0100;
                else if (timer < 125_000_000) morse_code = 4'b0010;
            end
            3'b100: begin // E: .
                if (timer < 25_000_000) morse_code = 4'b1000;
            end
            3'b101: begin // F: ..-.
                if (timer < 25_000_000) morse_code = 4'b1000;
                else if (timer < 50_000_000) morse_code = 4'b0100;
                else if (timer < 125_000_000) morse_code = 4'b0010;
                else if (timer < 150_000_000) morse_code = 4'b0001;
            end
            3'b110: begin // G: --.
                if (timer < 75_000_000) morse_code = 4'b1000;
                else if (timer < 150_000_000) morse_code = 4'b0100;
                else if (timer < 175_000_000) morse_code = 4'b0010;
            end
            3'b111: begin // H: ....
                if (timer < 25_000_000) morse_code = 4'b1000;
                else if (timer < 50_000_000) morse_code = 4'b0100;
                else if (timer < 75_000_000) morse_code = 4'b0010;
                else if (timer < 125_000_000) morse_code = 4'b0001;
            end
        endcase
    end

    // Cập nhật LED
    always @(posedge CLK or negedge KEY[0]) begin
        if (!KEY[0])
            LEDR <= 4'b0000;
        else if (start)
            LEDR <= morse_code;
        else
            LEDR <= 4'b0000;
    end

endmodule
