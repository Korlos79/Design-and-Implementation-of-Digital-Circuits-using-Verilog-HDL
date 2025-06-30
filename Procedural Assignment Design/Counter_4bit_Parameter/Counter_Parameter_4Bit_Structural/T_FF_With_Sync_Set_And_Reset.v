module T_FF_With_Sync_Set_And_Reset(T, Q, Clock, Set, Clear);
    input T, Clock, Set, Clear;
    output reg Q;  
    always @(posedge Clock) begin
        if (!Clear) begin  
            Q <= 0;
        end else if (Set) begin  
            Q <= 1;
        end else if (T) begin  
            Q <= ~Q;
        end
    end
endmodule
