module DFF3_Design(D, Clk, Q, P);
input D, Clk;
output [2:0] Q;
output [2:0] P;
wire nClk;
not (nClk, Clk);
D_Latch_Design(D, Clk, Q[2], P[2]);
D_Latch_Design(D, Clk, Q[1], P[1]);
D_Latch_Design(D, nClk, Q[0], P[0]);
endmodule 