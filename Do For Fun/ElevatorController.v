module ElevatorController (
    input clk,
    input reset_n,
    input [3:0] floor_request,   // One-hot yêu cầu tầng (tầng 0–3)
    output reg door_open,
    output reg moving_up,
    output reg moving_down,
    output reg [6:0] HEX0        // 7-segment hiển thị tầng hiện tại
);

    // Định nghĩa trạng thái bằng parameter
    parameter IDLE        = 3'd0,
              MOVING_UP   = 3'd1,
              MOVING_DOWN = 3'd2,
              OPEN_DOOR   = 3'd3,
              WAIT_CLOSE  = 3'd4;

    reg [2:0] state;
    reg [1:0] current_floor;
    reg [1:0] target_floor;
    reg [23:0] timer;

    // Logic chọn tầng gần nhất
    integer i;
    reg [1:0] closest_floor;
    reg [2:0] min_distance;

    always @(*) begin
        closest_floor = current_floor;
        min_distance = 3'd4; // Khoảng cách tối đa là 3

        for (i = 0; i < 4; i = i + 1) begin
            if (floor_request[i] && (i != current_floor)) begin
                if ((i > current_floor && (i - current_floor) < min_distance) ||
                    (i < current_floor && (current_floor - i) < min_distance)) begin
                    closest_floor = i[1:0];
                    min_distance = (i > current_floor) ? (i - current_floor) : (current_floor - i);
                end
            end
        end

        target_floor = closest_floor;
    end

    // FSM điều khiển thang máy
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            state <= IDLE;
            current_floor <= 2'd0;
            timer <= 0;
            door_open <= 0;
            moving_up <= 0;
            moving_down <= 0;
        end else begin
            case (state)
                IDLE: begin
                    door_open <= 0;
                    moving_up <= 0;
                    moving_down <= 0;
                    timer <= 0;

                    if (target_floor > current_floor)
                        state <= MOVING_UP;
                    else if (target_floor < current_floor)
                        state <= MOVING_DOWN;
                    else if (floor_request[current_floor])
                        state <= OPEN_DOOR;
                end

                MOVING_UP: begin
                    moving_up <= 1;
                    timer <= timer + 1;
                    if (timer > 24'd5_000_000) begin
                        current_floor <= current_floor + 1;
                        timer <= 0;
                        if (current_floor + 1 == target_floor)
                            state <= OPEN_DOOR;
                    end
                end

                MOVING_DOWN: begin
                    moving_down <= 1;
                    timer <= timer + 1;
                    if (timer > 24'd5_000_000) begin
                        current_floor <= current_floor - 1;
                        timer <= 0;
                        if (current_floor - 1 == target_floor)
                            state <= OPEN_DOOR;
                    end
                end

                OPEN_DOOR: begin
                    door_open <= 1;
                    timer <= timer + 1;
                    if (timer > 24'd10_000_000) begin
                        state <= WAIT_CLOSE;
                        timer <= 0;
                    end
                end

                WAIT_CLOSE: begin
                    door_open <= 0;
                    timer <= timer + 1;
                    if (timer > 24'd5_000_000) begin
                        state <= IDLE;
                        timer <= 0;
                    end
                end
            endcase
        end
    end

    // Giải mã 7 đoạn để hiển thị tầng hiện tại
    always @(*) begin
        case (current_floor)
            2'd0: HEX0 = 7'b1000000; // 0
            2'd1: HEX0 = 7'b1111001; // 1
            2'd2: HEX0 = 7'b0100100; // 2
            2'd3: HEX0 = 7'b0110000; // 3
            default: HEX0 = 7'b1111111; // lỗi
        endcase
    end

endmodule
