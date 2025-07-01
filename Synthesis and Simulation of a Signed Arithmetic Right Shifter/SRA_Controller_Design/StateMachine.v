module StateMachine (
  input wire clk,          // Tín hiệu xung đồng hồ
  input wire start,          // Tín hiệu reset
  output reg [3:0] Q,     // Dữ liệu đầu vào
  output reg [3:0] Q_next    // Dữ liệu đầu ra
);
	always @(posedge clk) begin
		case (Q)
			4'd0: begin
			  if (~start) Q_next = 4'd0;
			  else Q_next = 4'd1;
			end
			4'd1: Q_next = 4'd2;
			4'd2: Q_next = 4'd3;
			4'd3: Q_next = 4'd4;
			4'd4: Q_next = 4'd5;
			4'd5: Q_next = 4'd6;
			4'd6: Q_next = 4'd7;
			4'd7: Q_next = 4'd8;
			4'd8: Q_next = 4'd9;
			4'd9: Q_next = 4'd10;
			4'd10: Q_next = 4'd11;
			4'd11: Q_next = 4'd12;
			4'd12: Q_next = 4'd13;
			4'd13: Q_next = 4'd7;
			default: Q_next = 4'd0;
		endcase
		Q <= Q_next;
	end
endmodule