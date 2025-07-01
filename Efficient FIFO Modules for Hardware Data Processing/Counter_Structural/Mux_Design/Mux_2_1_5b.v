module Mux_2_1_5b(Output, Input1, Input2, Select);
//define_IO
	input [4:0] Input1, Input2;
	input Select;
	output [4:0] Output;
	
//define_wire/reg
	
//body
	Mux_2_1 inst (Output[0], Input1[0], Input2[0], Select);
	Mux_2_1 inst1 (Output[1], Input1[1], Input2[1], Select);
	Mux_2_1 inst2 (Output[2], Input1[2], Input2[2], Select);
	Mux_2_1 inst3 (Output[3], Input1[3], Input2[3], Select);
	Mux_2_1 inst4 (Output[4], Input1[4], Input2[4], Select);

endmodule
