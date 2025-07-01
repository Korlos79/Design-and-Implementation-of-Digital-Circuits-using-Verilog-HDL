module Ram_32x8(Output, Data, Address, Write_Enable, Chip_Select);
//define_IO
	input [4:0] Address;
	input [7:0] Data;
	input Write_Enable, Chip_Select;
	output [7:0] Output;
	
//define_wire/reg
	wire WE, CS;
	wire [32:0] RS;
	wire [7:0] Out;
	
//body
	and inst1 (WE, Write_Enable, Chip_Select);
	and inst2 (CS, ~Write_Enable, Chip_Select);

	Decoder_5to32 inst3 (Address, RS);
	Memory_8x8 inst4 (Out, Data, RS[7:0], WE);
	Memory_8x8 inst5 (Out, Data, RS[15:8], WE);
	Memory_8x8 inst6 (Out, Data, RS[23:16], WE);
	Memory_8x8 inst7 (Out, Data, RS[31:24], WE);
	
	bufif1 inst8 (Output[0], Out[0], CS);
	bufif1 inst9 (Output[1], Out[1], CS);
	bufif1 inst10 (Output[2], Out[2], CS);
	bufif1 inst11 (Output[3], Out[3], CS);
	bufif1 inst12 (Output[4], Out[4], CS);
	bufif1 inst13 (Output[5], Out[5], CS);
	bufif1 inst14 (Output[6], Out[6], CS);
	bufif1 inst15 (Output[7], Out[7], CS);

endmodule
