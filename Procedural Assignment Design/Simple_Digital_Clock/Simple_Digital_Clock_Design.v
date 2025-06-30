module Simple_Digital_Clock_Design(HEX2, HEX3, HEX4, HEX5, HEX6, HEX7, clk, reset, SW);
input clk, reset;
input [15:0] SW;
output [6:0] HEX2, HEX3, HEX4, HEX5, HEX6, HEX7;
reg [5:0] second;
reg [5:0] minute;
reg [4:0] hour;
reg [25:0] counter;
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
always @ (posedge clk or posedge reset) begin
	if(reset) begin
		second <= 0;
		minute <= 0;
		hour <= 0;
	end else begin
		counter <= counter + 26'd1;
		if(SW[15]) begin
			if(SW[10:6] < 24) 
				hour <= SW[10:6];
			else 
				hour <= 0;
		end if(SW[14]) begin
			if(SW[5:0] < 60) 
				minute <= SW[5:0];
			else 
				minute <= 0;
		end if (counter == 50_000_000 - 1) begin 
			counter <= 0;
			second <= second + 6'd1;
			if(second == 59) begin
				second <= 0;
				minute <= minute + 6'd1;
				if(minute == 59) begin
					minute <= 0;
					hour <= hour + 5'd1;
					if(hour == 23) begin 
						hour <= 0;
					end
				end
			end
		end
	end
end
assign HEX7 = bcd_7_segment(hour / 10);
assign HEX6 = bcd_7_segment(hour % 10);
assign HEX5 = bcd_7_segment(minute / 10);
assign HEX4 = bcd_7_segment(minute % 10);
assign HEX3 = bcd_7_segment(second / 10);
assign HEX2 = bcd_7_segment(second % 10);
endmodule
