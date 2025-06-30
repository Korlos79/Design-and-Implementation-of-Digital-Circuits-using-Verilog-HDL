module bai2(a, b0, b1, b2, c, d); 
input [2:0] a; 
input  b0, b1, b2; 
output  c, d; 
reg  c, d; 
always @(a or b0 or b1 or b2) begin 
	case(a) 
		3'b000: c = b0; 
		3'b001: c = b1; 
		3'b010: c = b2; 
		3'b011: c = 1'bz; 
		default: begin
			c = 1'bx; 
			d = 1'b1; 
		end
	endcase 
end 
endmodule 