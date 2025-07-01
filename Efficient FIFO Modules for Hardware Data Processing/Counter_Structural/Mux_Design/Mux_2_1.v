module Mux_2_1(Output, Input1, Input2, Select);
//define_IO
	input Input1, Input2, Select;
	output Output;
	
//define_wire/reg
	wire A1, A2;
	
//body
	and inst1 (A1, ~Select, Input1);
	and inst2 (A2, Select, Input2);
	
	or inst3 (Output, A1, A2);
	
endmodule
