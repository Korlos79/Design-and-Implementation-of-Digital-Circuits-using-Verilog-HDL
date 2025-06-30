module Hello_Scrolling_Display_Design(KEY1, KEY0, H0, H1, H2, H3, H4, H5, H6, H7);
input KEY1, KEY0;
output [6:0] H0;
output [6:0] H1;
output [6:0] H2;
output [6:0] H3;
output [6:0] H4;
output [6:0] H5;
output [6:0] H6;
output [6:0] H7;
function [6:0] char_to_segment;
	input [7:0] char;
	case (char)
		"H" : char_to_segment = 7'b0001001;
		"E" : char_to_segment = 7'b0000110;
		"L" : char_to_segment = 7'b1000111;
		"O" : char_to_segment = 7'b1000000;
		default: char_to_segment = 7'b0000000;
	endcase
endfunction
reg [7:0] Q [7:0];
initial begin 
	Q[7] = " ";
	Q[6] = " ";
	Q[5] = " ";
	Q[4] = "H";
	Q[3] = "E";
	Q[2] = "L";
	Q[1] = "L";
	Q[0] = "O";
end 
always @ (posedge KEY0 or posedge KEY1) begin 
	if(KEY1) begin
		Q[7] <= " ";
		Q[6] <= " ";
		Q[5] <= " ";
		Q[4] <= "H";
		Q[3] <= "E";
		Q[2] <= "L";
		Q[1] <= "L";
		Q[0] <= "O";
	end else begin
		Q[0] <= Q[7];
		Q[1] <= Q[0];
		Q[2] <= Q[1];
		Q[3] <= Q[2];
		Q[4] <= Q[3];
		Q[5] <= Q[4];
		Q[6] <= Q[5];
		Q[7] <= Q[6];
	end
end
assign H0 = char_to_segment(Q[0]);
assign H1 = char_to_segment(Q[1]);
assign H2 = char_to_segment(Q[2]);
assign H3 = char_to_segment(Q[3]);
assign H4 = char_to_segment(Q[4]);
assign H5 = char_to_segment(Q[5]);
assign H6 = char_to_segment(Q[6]);
assign H7 = char_to_segment(Q[7]);
endmodule 