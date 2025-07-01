module Memory_8x8(Output, Input, Row_Select, Write_Enable);
//define_IO
	input [7:0] Input, Row_Select;
	input Write_Enable;
	output [7:0] Output;
	
//define_wire/reg

//body
	Memory_Cell_8_bits inst0 (Output, Input, Row_Select[0], Write_Enable);
	Memory_Cell_8_bits inst1 (Output, Input, Row_Select[1], Write_Enable);
	Memory_Cell_8_bits inst2 (Output, Input, Row_Select[2], Write_Enable);
	Memory_Cell_8_bits inst3 (Output, Input, Row_Select[3], Write_Enable);
	Memory_Cell_8_bits inst4 (Output, Input, Row_Select[4], Write_Enable);
	Memory_Cell_8_bits inst5 (Output, Input, Row_Select[5], Write_Enable);
	Memory_Cell_8_bits inst6 (Output, Input, Row_Select[6], Write_Enable);
	Memory_Cell_8_bits inst7 (Output, Input, Row_Select[7], Write_Enable);
endmodule
