module SRA_Behavior(Input1,Input2,clk,Start,Result);
//define
	input clk, Start;
	input [7:0] Input1, Input2;
	output [7:0] Result;
	wire [7:0]E,F,B5,B7,B2,AU1,AU2;
	wire In,AU1B3,AU1B4,Done;

	wire [4:0] LR;
	wire [3:0] OP;
	wire [1:0] Bus2,Bus5,Bus7;
//body
	SRA_Controller Controller (Start,clk,In,Bus2,AU1B3,AU1B4,Bus5,Bus7,LR,OP,Done);
	SRA_Datapath Datapath (Input1,Input2,clk,In,Bus2,AU1B3,AU1B4,Bus5,Bus7,LR,OP,Done,Result,AU1,AU2,E,F,B5,B7,B2);
endmodule
