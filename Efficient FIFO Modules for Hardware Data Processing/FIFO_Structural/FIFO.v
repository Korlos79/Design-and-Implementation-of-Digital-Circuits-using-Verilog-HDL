module FIFO (Output, Empty, Full, Input, Reset, Read_Write, Enable, CLK);
//define_IO
	input [7:0] Input;
	input Reset, Read_Write, Enable, CLK;
	output [7:0] Output;
	output Empty, Full;
	
//define_wire/reg
	wire Front_E, Back_E, A, Equal;
	wire [5:0] Front, Back;
	wire [4:0] Address;
//body
	and inst1 (Front_E, ~Read_Write, Enable);
	and inst2 (Back_E, Read_Write, Enable);
	
	Up_Counter inst3 (Front, Reset, CLK, Front_E);
	Up_Counter inst4 (Back, Reset, CLK, Back_E);
	
	Equal_5b inst5 (Equal, Front[4:0], Back[4:0]);
	Mux_2_1_5b inst6 (Address, Front[4:0], Back[4:0], Back_E);
	Ram_32x8 inst7 (Output, Input, Address, Back_E, Enable);
	
	xor inst8 (A, Front[5], Back[5]);
	and inst9 (Empty, Equal, ~A);
	and inst10 (Full, Equal, A);
	
endmodule
