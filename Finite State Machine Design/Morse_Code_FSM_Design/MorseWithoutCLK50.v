module MorseWithoutCLK50(
    input CLK, 
    input [2:0] SW, 
    input [1:0] KEY, 
    output reg [3:0] LEDR
);

    reg [2:0] timer;
    reg [2:0] max_time;
    reg [3:0] morse_code;
    reg start;
    reg prev_key1;

    wire key1_rising = ~prev_key1 & KEY[1];

    // Timer và phát hiện cạnh lên KEY[1]
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
                    start <= 0; // Dừng khi hết thời gian Morse
            end
        end
    end

    // Xác định mã Morse và thời gian hiển thị tối đa
    always @(*) begin
        morse_code = 4'b0000;
        case (SW)
            3'b000: begin max_time = 4;
                if (timer == 1) morse_code = 4'b1000;
                else if (timer == 2 || timer == 3) morse_code = 4'b0100;
            end
            3'b001: begin max_time = 6;
                if (timer == 1 || timer == 2) morse_code = 4'b1000;
                else if (timer == 3) morse_code = 4'b0100;
                else if (timer == 4) morse_code = 4'b0010;
                else if (timer == 5) morse_code = 4'b0001;
            end
            3'b010: begin max_time = 7;
                if (timer == 1 || timer == 2) morse_code = 4'b1000;
                else if (timer == 3) morse_code = 4'b0100;
                else if (timer == 4 || timer == 5) morse_code = 4'b0010;
                else if (timer == 6) morse_code = 4'b0001;
            end
            3'b011: begin max_time = 5;
                if (timer == 1 || timer == 2) morse_code = 4'b1000;
                else if (timer == 3) morse_code = 4'b0100;
                else if (timer == 4) morse_code = 4'b0010;
            end
            3'b100: begin max_time = 2;
                if (timer == 1) morse_code = 4'b1000;
            end
            3'b101: begin max_time = 6;
                if (timer == 1) morse_code = 4'b1000;
                else if (timer == 2) morse_code = 4'b0100;
                else if (timer == 3 || timer == 4) morse_code = 4'b0010;
                else if (timer == 5) morse_code = 4'b0001;
            end
            3'b110: begin max_time = 6;
                if (timer == 1 || timer == 2) morse_code = 4'b1000;
                else if (timer == 3 || timer == 4) morse_code = 4'b0100;
                else if (timer == 5) morse_code = 4'b0010;
            end
            3'b111: begin max_time = 5;
                if (timer == 1) morse_code = 4'b1000;
                else if (timer == 2) morse_code = 4'b0100;
                else if (timer == 3) morse_code = 4'b0010;
                else if (timer == 4) morse_code = 4'b0001;
            end
            default: begin max_time = 0; end
        endcase
    end

    // Hiển thị LED
    always @(posedge CLK or negedge KEY[0]) begin
        if (!KEY[0])
            LEDR <= 4'b0000;
        else if (start)
            LEDR <= morse_code;
        else
            LEDR <= 4'b0000;
    end

endmodule
