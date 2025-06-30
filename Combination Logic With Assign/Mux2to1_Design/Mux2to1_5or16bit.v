module Mux2to1_5or16bit(
	input [4:0] a,
	input [15:0] b,
	output [4:0] out,
	input sel
);
	assign out = (sel) ? (b) : (a);
endmodule