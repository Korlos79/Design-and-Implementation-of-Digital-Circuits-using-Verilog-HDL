module Decoder_2to4(Select, Enable, D);
//define_IO
	input [1:0] Select;
	input Enable;
	output [3:0] D;
	
//define_wire/reg
	
//body
	and inst2 (D[0], ~Select[0], ~Select[1], Enable);
	and inst3 (D[1], Select[0], ~Select[1], Enable);
	and inst4 (D[2], ~Select[0], Select[1], Enable);
	and inst5 (D[3], Select[0], Select[1], Enable);
	
endmodule
