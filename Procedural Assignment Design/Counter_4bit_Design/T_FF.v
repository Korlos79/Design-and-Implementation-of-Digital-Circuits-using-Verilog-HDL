module T_FF(T, Q, Clock, Clear);
    input T, Clock, Clear; 
    output reg Q; 
    always @(posedge Clock or negedge Clear) begin 
        if (Clear == 1'b0) begin 
            Q <= 1'b0; 
        end else begin
            if (T) begin
                Q <= ~Q; 
            end
        end
    end
endmodule
