module D_FF_6b(Q, D, CLK);
//define_IO
	input [5:0] D;
	input CLK;
	output [5:0] Q;
	
//define_wire/reg
	
//body
	D_FF inst (Q[0], D[0], CLK);
	D_FF inst1 (Q[1], D[1], CLK);
	D_FF inst2 (Q[2], D[2], CLK);
	D_FF inst3 (Q[3], D[3], CLK);
	D_FF inst4 (Q[4], D[4], CLK);
	D_FF inst5 (Q[5], D[5], CLK);
endmodule
