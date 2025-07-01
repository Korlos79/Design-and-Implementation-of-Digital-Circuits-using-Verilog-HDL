module REG_Load(clk, in, select , out );
input [7:0]in;
input clk,select;
wire  [7:0]I;
output reg[7:0]out;

assign I = select? in : out ;
always @(posedge clk)
	begin
		out<=I;
	end
endmodule
