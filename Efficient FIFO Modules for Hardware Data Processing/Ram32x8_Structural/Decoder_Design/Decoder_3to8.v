module Decoder_3to8(Select, Enable, D);
//define_IO
	input [2:0] Select;
	input Enable;
	output [7:0] D;
	
//define_wire/reg
	
//body
	and inst3 (D[0], ~Select[0], ~Select[1], ~Select[2], Enable);
	and inst4 (D[1], Select[0], ~Select[1], ~Select[2], Enable);
	and inst5 (D[2], ~Select[0], Select[1], ~Select[2], Enable);
	and inst6 (D[3], Select[0], Select[1], ~Select[2], Enable);
	and inst7 (D[4], ~Select[0], ~Select[1], Select[2], Enable);
	and inst8 (D[5], Select[0], ~Select[1], Select[2], Enable);
	and inst9 (D[6], ~Select[0], Select[1], Select[2], Enable);
	and inst10 (D[7], Select[0], Select[1], Select[2], Enable);
	
endmodule
