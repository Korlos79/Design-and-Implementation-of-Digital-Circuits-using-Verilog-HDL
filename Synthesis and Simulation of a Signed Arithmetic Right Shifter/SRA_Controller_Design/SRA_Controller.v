module SRA_Controller(Start,clk,In,Bus2,AU1B3,AU1B4,Bus5,Bus7,LR,OP,DONE);
//define
	input wire Start,clk;
	output wire In,AU1B3,AU1B4,DONE;
	output wire [4:0] LR;
	output wire [3:0] OP;
	output wire [1:0] Bus2,Bus5,Bus7;
	
	wire[3:0] Q, Q_next;
//body
	StateMachine Inst (clk, Start,Q,Q_next);
	control Inst1 (Q_next,In,Bus2[0],Bus2[1],AU1B3,AU1B4,Bus7[0],Bus5[0],Bus5[1],Bus7[1],LR,OP,DONE);
endmodule