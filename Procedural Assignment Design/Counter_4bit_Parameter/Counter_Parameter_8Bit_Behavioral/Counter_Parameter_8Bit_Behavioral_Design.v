module CounterParameter8New #(parameter WIDTH = 8) (
    input wire clk,    
    input wire clr,   
    output reg [WIDTH-1:0] Q
);

    always @(posedge clk) begin
        if (clr == 1'b0)  
            Q <= {WIDTH{1'b0}};  
        else
            Q <= Q + 1;  
    end

endmodule
