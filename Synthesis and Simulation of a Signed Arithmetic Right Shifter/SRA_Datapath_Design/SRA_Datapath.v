module SRA_Datapath(Input1,Input2,clk,In,Bus2,AU1_Bus3,AU1_Bus4,Bus5,Bus7,LR,Opcode,Done,Result,AU1,AU2,E,F,B5,B7,B2);
input [7:0]Input1,Input2;
input clk,In,AU1_Bus3,AU1_Bus4,Done;
input [1:0]Bus2,Bus5,Bus7;
input[4:0]LR;
input [3:0]Opcode;
wire [7:0] R1,R2,R3,R4,R5,Sh1,Sh3;//,AU1,AU2;
output wire [7:0] E,F,B5,B7,B2;
output [7:0]Result,AU1,AU2;

tri_8 inst_tri1(E,Input1,In);
tri_8 inst_tri2(F,Input2,In);

tri_8 inst_tri3(E,AU1,AU1_Bus3);
tri_8 inst_tri4(F,AU1,AU1_Bus4);
REG_Load inst_R1 (clk, E ,LR[0], R1);
REG_Load inst_R2 (clk, F ,LR[1], R2);

tri_8 inst_tri5(B2,R1,Bus2[0]);
tri_8 inst_tri6(B2,R2,Bus2[1]);

ABS_MAX_MIN inst_AU1(clk,Opcode[1:0],R1,B2,AU1);//abs_min_max inst_AU1(R1,B2,Opcode[1:0],clk,AU1);
Shift_bits inst_Sh1(Sh1,R1,1);//shift_bit inst_Shift1(R1,Sh1,1);
Shift_bits inst_Sh3(Sh3,R1,2'd2);//shift_bit3 inst_Shift2(R1,Sh3);

tri_8 inst_tri7(B7,Sh3,Bus7[0]);
tri_8 inst_tr8(B7,AU2,Bus7[1]);

tri_8 inst_tri9(B5,R4,Bus5[0]);
tri_8 inst_tri10(B5,R5,Bus5[1]);
REG_Load inst_R3 (clk, B7 ,LR[2], R3);
REG_Load inst_R4 (clk, AU1 ,LR[3], R4);
REG_Load inst_R5 (clk, Sh1 ,LR[4], R5);
ADD_SUB_MAX_SUB inst_AU2(clk,Opcode[3:2],B5,R3,AU2);//AU2 inst_AU2(B5,R3,Opcode[3:2],clk,AU2);
tri_8 inst_tri11(Result,R3,Done);
endmodule