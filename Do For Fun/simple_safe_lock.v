module simple_safe_lock (
    input wire clk,
    input wire reset_n,
    input wire A, B, C, D,
    output reg LOCK
);

    // Chỉ cần 3 trạng thái
    reg [1:0] state;
    parameter WAIT   = 2'd0;  // Chờ nhấn 4 nút
    parameter CHECK  = 2'd1;  // Kiểm tra có đúng không
    parameter OPEN   = 2'd2;  // Mở khóa 3 giây
    
    // Đếm số nút đã nhấn
    reg [2:0] count;
    
    // Lưu 4 nút đã nhấn
    reg btn1, btn2, btn3, btn4;
    
    // Đếm thời gian mở khóa (3 giây = 81 triệu xung)
    reg [26:0] timer;
    
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            state <= WAIT;
            LOCK <= 0;
            count <= 0;
            timer <= 0;
            btn1 <= 0; btn2 <= 0; btn3 <= 0; btn4 <= 0;
        end
        else begin
            case (state)
                WAIT: begin
                    LOCK <= 0;
                    
                    // Lưu từng nút khi được nhấn
                    if (A || B || C || D) begin
                        if (count == 0) begin
                            btn1 <= B;  // Nút 1: có phải B không?
                            count <= 1;
                        end
                        else if (count == 1) begin
                            btn2 <= D;  // Nút 2: có phải D không?
                            count <= 2;
                        end
                        else if (count == 2) begin
                            btn3 <= A;  // Nút 3: có phải A không?
                            count <= 3;
                        end
                        else if (count == 3) begin
                            btn4 <= C;  // Nút 4: có phải C không?
                            state <= CHECK;
                        end
                    end
                end
                
                CHECK: begin
                    // Kiểm tra có đúng B-D-A-C không
                    if (btn1 && btn2 && btn3 && btn4) begin
                        state <= OPEN;  // Đúng -> mở khóa
                        timer <= 0;
                    end
                    else begin
                        state <= WAIT;  // Sai -> về chờ
                        count <= 0;
                    end
                end
                
                OPEN: begin
                    LOCK <= 1;      // Mở khóa
                    timer <= timer + 1;
                    if (timer >= 81_000_000) begin  // Đếm 81 triệu (3 giây)
                        state <= WAIT;              // Về trạng thái chờ
                        count <= 0;
                        timer <= 0;
                    end
                end
            endcase
        end
    end
    
endmodule