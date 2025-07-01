module Memory_Cell_8_bits(Output, Input, Row_Select, Write_Enable);
//define_IO
	input [7:0] Input;
	input Row_Select, Write_Enable;
	output [7:0] Output;
	
//define_wire/reg

//body
	Memory_Cell inst0 (Output[0], Input[0], Row_Select, Write_Enable);
	Memory_Cell inst1 (Output[1], Input[1], Row_Select, Write_Enable);
	Memory_Cell inst2 (Output[2], Input[2], Row_Select, Write_Enable);
	Memory_Cell inst3 (Output[3], Input[3], Row_Select, Write_Enable);
	Memory_Cell inst4 (Output[4], Input[4], Row_Select, Write_Enable);
	Memory_Cell inst5 (Output[5], Input[5], Row_Select, Write_Enable);
	Memory_Cell inst6 (Output[6], Input[6], Row_Select, Write_Enable);
	Memory_Cell inst7 (Output[7], Input[7], Row_Select, Write_Enable);
endmodule
