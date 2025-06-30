module bai1(clk,reset, a, b0, b1, b2, b3, c); 
input [2:0] a; 
input reset, clk; 
input [3:0] b0, b1, b2, b3; 
output reg [3:0] c; 
always @(posedge reset or posedge clk) begin 
	if(reset == 1'b1) begin 
		c <= 4'b0000; 
	end 
	else begin 
		case(a) 
			3'b000: c <= b0; 
			3'b001: c <= b1; 
			3'b010: c <= b2; 
			3'b011: c <= b3; 
			3'b100: c <= 4'b0000; 
			default: c <= 4'b1111; 
		endcase 
	end 
end 
endmodule
