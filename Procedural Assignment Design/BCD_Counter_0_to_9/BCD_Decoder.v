module BCD_Decoder(Q, O);
input wire [3:0] Q;
output reg [6:0] O;
	always @ (*) begin
		case (Q)
			4'd0 : O = 7'b1000000;
			4'd1 : O = 7'b1111001;
			4'd2 : O = 7'b0100100;
			4'd3 : O = 7'b0110000;
			4'd4 : O = 7'b0011001;
			4'd5 : O = 7'b0010010;
			4'd6 : O = 7'b0000010;
			4'd7 : O = 7'b1111000;
			4'd8 : O = 7'b0000000;
			4'd9 : O = 7'b0010000;
			default: O = 7'b0000000;
		endcase
	end
endmodule 