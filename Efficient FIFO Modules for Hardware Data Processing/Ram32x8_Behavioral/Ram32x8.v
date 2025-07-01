module Ram32x8(Out, Address, Data, Write_Enable, Read_Enable);
//define IO
	input wire [4:0] Address;
	input wire [7:0] Data;
	input wire Write_Enable;
	input wire Read_Enable;
	output reg [7:0] Out;
	reg [7:0] Memory [0:31];
//body
	always @(posedge Write_Enable or posedge Read_Enable) begin
		if (Write_Enable)
			Memory[Address] <= Data;
		else if (Read_Enable)
			Out <= Memory[Address];
	end
endmodule
