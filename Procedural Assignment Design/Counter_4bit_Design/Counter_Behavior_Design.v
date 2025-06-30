module Counter_Behavior_Design.v(clk, rst, Q);
input wire clk;   
input wire rst;   
output reg [3:0] Q;
always @(posedge clk) begin
    if (!rst) 
        Q <= 4'b0000;  
    else
        Q <= Q + 1;    
end

endmodule
