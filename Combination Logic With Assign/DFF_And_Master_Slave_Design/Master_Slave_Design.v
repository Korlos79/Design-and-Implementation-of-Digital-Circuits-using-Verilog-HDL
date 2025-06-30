module Master_Slave_Design(D, Clk, Q, nQ);
input D, Clk;
output Q, nQ;
wire Qm, Qn, nClk;
not (nClk, Clk);
D_Latch_Design(D, nClk, Qm, Qn);
D_Latch_Design(Qm, Clk, Q, nQ);
endmodule 