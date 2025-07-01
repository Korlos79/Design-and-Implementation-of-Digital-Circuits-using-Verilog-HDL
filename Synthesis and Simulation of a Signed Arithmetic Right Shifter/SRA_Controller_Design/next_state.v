module next_state(Start,Q,Q_next);
//define
	input wire Start;
	input wire [3:0] Q;
	output wire [3:0] Q_next;
	
//body
	//always @(posedge clk) begin
		assign Q_next[3] = Q[3]&(~Q[2])|(Q[3]&~Q[0])|(Q[2]&Q[1]&Q[0]);
		assign Q_next[2] = (Q[2]|Q[1])&(Q[2]|Q[0])&~(Q[2]&Q[1]&Q[0]);
		assign Q_next[1] = (Q[1]|Q[0])&~(Q[1]&Q[0]);
		assign Q_next[0] = (Q[1]&~Q[0])|(~Q[3]&Q[2]&~Q[0])|(Q[3]&~Q[2]&~Q[0])|(Q[3]&Q[2]&Q[0])|(Start&~Q[3]&~Q[2]&~Q[1]&~Q[0]);
		//Q <=Q_next;
	//end
endmodule