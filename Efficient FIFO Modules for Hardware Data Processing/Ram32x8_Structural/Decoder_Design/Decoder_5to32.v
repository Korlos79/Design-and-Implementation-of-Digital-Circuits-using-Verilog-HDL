module Decoder_5to32(Select, D);
//define_IO
	input [4:0] Select;
	output [31:0] D;
	
//define_wire/reg
	wire [3:0] D24;
	
//body
	Decoder_2to4 inst0 (Select[4:3], 1, D24[3:0]);
	Decoder_3to8 inst1 (Select[2:0], D24[0], D[7:0]);
	Decoder_3to8 inst2 (Select[2:0], D24[1], D[15:8]);
	Decoder_3to8 inst3 (Select[2:0], D24[2], D[23:16]);
	Decoder_3to8 inst4 (Select[2:0], D24[3], D[31:24]);
	
endmodule
