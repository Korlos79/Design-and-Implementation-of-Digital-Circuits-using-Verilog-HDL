module D_Latch(Q, D, E);
//define_IO
	input D, E;
	output Q;
	
//define_wire/reg
	wire A1, A2, Q_not;
	
//body
	and inst1 (A1, ~D, E);
	and inst2 (A2, D, E);
	nor inst3 (Q_not, A2, Q);
	nor inst4 (Q, A1, Q_not);
endmodule
