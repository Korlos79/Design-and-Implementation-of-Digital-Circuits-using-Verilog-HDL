module Counter_Parameter_4Bit_Behavioral_Design #(parameter WIDTH = 4) (
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
