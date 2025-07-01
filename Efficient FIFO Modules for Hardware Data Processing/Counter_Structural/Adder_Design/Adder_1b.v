module Adder_1b (Sum, C_out, Input1, Input2, C_in);
//define_IO
	input Input1, Input2, C_in;
	output Sum, C_out;
	
//define_wire/reg
	wire A, B, C;
	
//body
	xor inst (A, Input1, Input2);
	xor inst1 (Sum, A, C_in);
	
	and inst2 (B, A, C_in);
	and inst3 (C, Input1, Input2);
	or inst4 (C_out, B, C);
	
endmodule
