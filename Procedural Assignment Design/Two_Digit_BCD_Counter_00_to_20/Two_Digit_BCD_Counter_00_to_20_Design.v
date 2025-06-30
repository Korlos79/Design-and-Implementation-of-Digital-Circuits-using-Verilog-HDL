module Two_Digit_BCD_Counter_00_to_20_Design(CLOCK_50, HEX0, HEX1, KEY0);
input CLOCK_50, KEY0;
output [6:0] HEX0;
output [6:0] HEX1;
//wire clk_1Hz;
reg [5:0] count;
//reg [25:0] clk_div;
/*always @ (posedge CLOCK_50 or posedge KEY0) begin	
	if (KEY0) 
		clk_div <= 0;
	else if (CLOCK_50 == 50_000_000 - 1) 
		clk_div <= 0;
	else 
		clk_div <= clk_div + 1;
end 
assign clk_1Hz = (clk_div == 50_000_000 - 1) ? 1 : 0;
 */
always @ (posedge CLOCK_50 or posedge KEY0) begin
	if(KEY0)
		count <= 0;
	//else if (clk_1Hz) begin 
	else if(count == 20) begin
				count <= 0;
			end else begin
				count <= count + 1;
			end
		end
function [6:0] bcd_7_segment;
	input [3:0] bcd;
	case(bcd)
		4'd0: bcd_7_segment = 7'b1000000;
      4'd1: bcd_7_segment = 7'b1111001;
      4'd2: bcd_7_segment = 7'b0100100;
      4'd3: bcd_7_segment = 7'b0110000;
      4'd4: bcd_7_segment = 7'b0011001;
      4'd5: bcd_7_segment = 7'b0010010;
      4'd6: bcd_7_segment = 7'b0000010;
      4'd7: bcd_7_segment = 7'b1111000;
      4'd8: bcd_7_segment = 7'b0000000;
      4'd9: bcd_7_segment = 7'b0010000;
      default: bcd_7_segment = 7'b1111111; 
   endcase
endfunction
assign HEX0 = bcd_7_segment(count % 10);
assign HEX1 = bcd_7_segment(count / 10);
endmodule 		
