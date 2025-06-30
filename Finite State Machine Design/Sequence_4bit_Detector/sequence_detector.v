module sequence_detector (
    input clk,
    input x,
    output reg z
);
    // Định nghĩa các trạng thái dùng parameter
    parameter S0 = 4'd0,
              S1 = 4'd1,
              S2 = 4'd2,
              S3 = 4'd3,
              S4 = 4'd4,
              S5 = 4'd5,
              S6 = 4'd6,
              S7 = 4'd7,
              S8 = 4'd8;

    reg [3:0] current_state, next_state;

    always @(posedge clk) begin
        current_state <= next_state;
    end

    always @(*) begin
        z = 0; // mặc định
        case (current_state)
            S0: next_state = (x) ? S1 : S5;
            S1: next_state = (x) ? S2 : S5;
            S2: next_state = (x) ? S3 : S5;
            S3: next_state = (x) ? S4 : S5;
            S4: begin
                next_state = (x) ? S4 : S5;
                z = 1;
            end
            S5: next_state = (~x) ? S6 : S1;
            S6: next_state = (~x) ? S7 : S1;
            S7: next_state = (~x) ? S8 : S1;
            S8: begin
                next_state = (~x) ? S8 : S1;
                z = 1;
            end
            default: next_state = S0;
        endcase
    end
endmodule
