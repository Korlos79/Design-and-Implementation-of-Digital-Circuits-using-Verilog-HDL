module control(Q,In,R1B2,R2B2,AU1B3,AU1B4,S3B7,R4B5,R5B5,AU2B7,LR,OP,DONE);
//define
	input wire [3:0] Q;
	output wire [3:0] OP;
	output wire In,R1B2,R2B2,AU1B3,AU1B4,S3B7,R4B5,R5B5,AU2B7,DONE;
	output wire [4:0] LR;
//doby	
	assign In = ~Q[3]&~Q[2]&~Q[1]&~Q[0] | Q[2]&Q[1]&Q[0];
	assign R1B2 = ~Q[3]&~Q[2]&~Q[1]&Q[0] | Q[3]&~Q[2]&~Q[1]&~Q[0];
	assign R2B2 = (~Q[3]&Q[2]&~Q[1])|(Q[2]&~Q[1]&~Q[0])|(Q[3]&~Q[2]&Q[0])|(~Q[3]&~Q[2]&Q[1]&~Q[0]);
	assign AU1B3 = ~Q[3]&~Q[2]&Q[1]&~Q[0] | Q[3]&~Q[2]&~Q[1]&Q[0];
	assign AU1B4 = Q[3]&Q[1]&~Q[0] | ~Q[3]&~Q[2]&Q[1]&Q[0];
	assign S3B7 = Q[2]&Q[1]&~Q[0] | Q[3]&Q[2]&Q[0];
	assign R4B5 = Q[3]&Q[1]&Q[0] | Q[2]&Q[1]&Q[0];
	assign R5B5 = Q[3]&~Q[2]&~Q[1]&Q[0];
	assign AU2B7 = Q[3]&~Q[0];
	assign LR[0] = ~Q[3]&~Q[2]&~Q[0] | Q[2]&Q[1]&Q[0] | Q[3]&~Q[2]&~Q[1]&Q[0];
	assign LR[1] = ~Q[3]&~Q[2]&~Q[1]&~Q[0] | ~Q[3]&Q[1]&Q[0] | Q[3]&Q[1]&~Q[0];
	assign LR[2] = Q[3]&Q[2] | Q[3]&~Q[0] | Q[2]&Q[1]&~Q[0];
	assign LR[3] = Q[3]&Q[2]&Q[0] | Q[2]&Q[1]&~Q[0];
	assign LR[4] = Q[3]&Q[2]&~Q[0] | ~Q[3]&Q[2]&~Q[1]&Q[0];
	assign OP[3] = Q[3]&Q[1];
	assign OP[2] = ~Q[3];
	assign OP[1] = ~Q[3]&~Q[1]&~Q[0] | Q[3]&Q[1]&Q[0];
	assign OP[0] = Q[2];
	assign DONE = Q[3]&Q[2]&~Q[1]&Q[0];
endmodule
