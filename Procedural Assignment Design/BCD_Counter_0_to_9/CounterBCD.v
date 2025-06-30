module CounterBCD(KEY3, KEY0, Q);
input wire KEY3, KEY0;
output reg [3:0] Q;
always @ (posedge KEY3 or negedge KEY0) begin 
	if (!KEY0)  
		Q <= 4'd0;
	else if (Q == 4'd9) 
		Q <= 4'd0;
	else 
		Q <= Q + 1;
	end
endmodule 
