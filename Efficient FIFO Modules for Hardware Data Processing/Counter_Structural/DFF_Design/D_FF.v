module D_FF(Q, D, CLK);
//define_IO
	input D, CLK;
	output reg Q;
	
//define_wire/reg
	
//body
	always @(posedge CLK)
		Q <= D;
	
endmodule
