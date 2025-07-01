`timescale 1ns/1ps
module Testbench();
//define
	reg clk, Start;
	reg [7:0] Input1, Input2;
	wire [7:0] Result;
	SRA_Behavior Inst (.Input1(Input1),.Input2(Input2),.clk(clk),.Start(Start),.Result(Result));
//body
	always begin
		#10 clk <= ~clk;
	end
	
	initial begin
		#0;
		clk = 0;
		Start = 0 ;
		Input1 = 3;
		Input2 = 4;
		#20;
		Start=1;
		#20;
		Start =0;
	end 
	
endmodule
