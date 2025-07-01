module Memory_Cell(Output, Input, Row_Select, Write_Enable);
//define_IO
	input Input, Row_Select, Write_Enable;
	output Output;
	
//define_wire/reg	
	wire Q, ENA;
	
//body
	and inst (ENA, Row_Select, Write_Enable);
	D_Latch inst1 (Q, Input, ENA);
	bufif1 inst2 (Output, Q, Row_Select);
endmodule
