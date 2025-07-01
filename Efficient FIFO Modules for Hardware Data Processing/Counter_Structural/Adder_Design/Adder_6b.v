module Adder_6b(Sum, Input1, Input2, C_in);
//define_IO
	input [5:0] Input1, Input2;
	input C_in;
	output [5:0] Sum;
	
//define_wire/reg
	wire [5:0] C;

//body	
	Adder_1b inst (Sum[0], C[0], Input1[0], Input2[0], C_in);
	Adder_1b inst1 (Sum[1], C[1], Input1[1], Input2[1], C[0]);
	Adder_1b inst2 (Sum[2], C[2], Input1[2], Input2[2], C[1]);
	Adder_1b inst3 (Sum[3], C[3], Input1[3], Input2[3], C[2]);
	Adder_1b inst4 (Sum[4], C[4], Input1[4], Input2[4], C[3]);
	Adder_1b inst5 (Sum[5], C[5], Input1[5], Input2[5], C[4]);
	
endmodule
