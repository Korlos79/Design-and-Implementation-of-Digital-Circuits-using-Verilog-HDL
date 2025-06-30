module decoder_2to4 (
	input enable,
	input [1:0] select,
	output reg [3:0] Y
);

always @(*) begin
	if (enable) Y <= 4'b0000;
	else case (select)
		2'b00 : Y <= 4'b0001;
		2'b01 : Y <= 4'b0010;
		2'b10 : Y <= 4'b0100;
		2'b11 : Y <= 4'b1000;
		endcase
	end
endmodule
module decoder (
	input enable,
	input [1:0] select,
	output [3:0] Y
);

	assign Y = (enable != 1 && select == 0) ? 4'b0001 :
	(enable != 1 && select == 1) ? 4'b0010 :
	(enable != 1 && select == 2) ? 4'b0100 :
	(enable != 1 && select == 3) ? 4'b1000 : 4'b0000;
	
endmodule
