module Counter_Parameter_8Bit_Structural_Design.v(x, T, In, Clock, Q);
input T, Clock, In;
input [7:0]x;
output [7:0]Q;
CounterParameter(x[3:0], T, Clock, Q[3:0], In);
wire E2, E1;
nand(E1, Q[0], Q[1], Q[2], Q[3]);
Mux2to1_1bit(E2, E1, Clock, In);
CounterParameter(x[7:4], T, E2, Q[7:4], In);
endmodule 
