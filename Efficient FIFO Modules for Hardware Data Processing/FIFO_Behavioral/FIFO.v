module FIFO(Output, Empty, Full, Input, CLK, Enable, Read_Write, Reset);
//definr_IO
	input [7:0] Input;
	input CLK, Enable, Read_Write, Reset;
	
	output reg [7:0] Output;
	reg [5:0] Front, Back;
	output wire Empty, Full;
	
//define_wire/reg
	reg [7:0] Mem [0:31];
	
//body
	assign Empty = (Front == Back);
	assign Full = ((Back[5] != Front[5]) && (Back[4:0] == Front[4:0]));
	
	always @(posedge CLK or posedge Reset) begin
		if (Reset) begin
			Front <= 0;
			Back <= 0;
			Output <= 8'dZ;
		end
		else if (Enable) begin
			if (Read_Write) begin	//Write
				if(!Full) begin
					Mem[Back[4:0]] <= Input;
					Output <= 8'dZ;
					Back = Back + 5'd1;
				end
			end
			else if (!Read_Write) begin	//Read 
				if(!Empty) begin
					Output = Mem[Front[4:0]];
					Front = Front + 5'd1;
				end
			end
			else Output = 8'dZ;
		end
	end
endmodule
