module ABS_MAX_MIN(clk,select,A,B,result);
input clk;
input  [7:0]A,B;
input [1:0]select;
output reg [7:0]result;
wire [7:0]InputA,S;
reg [7:0]Q_A,Q_B,Q_S;
reg [1:0]Q_select;
wire [7:0]Q_A1,Q_B1,Q_S1;
assign InputA = (select[0]|select[1])? A: 8'd0;
assign S = (InputA - B);
always@(posedge clk)
	begin
		Q_A <= A;
		Q_B <= B;
		Q_S <= S;
		Q_select <= select;
	end
always @(*) 
	begin
		case(Q_select)
			2'b00: begin
				if(Q_S[7]==1) result = Q_B;
				else result =Q_S;
			end
			2'b01: begin
			if(Q_S[7]==1) result = Q_B;
				else result =Q_A;
			end
			2'b10: begin
				if(Q_S[7]==1) result = Q_A;
				else result =Q_B;
			end
			default: begin 
				if(Q_S[7]==1) result = Q_A;
				else result =Q_B;
			end	
		endcase
	end
endmodule