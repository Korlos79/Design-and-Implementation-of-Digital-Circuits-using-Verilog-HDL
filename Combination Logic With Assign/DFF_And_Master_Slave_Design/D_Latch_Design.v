module D_Latch_Design(D, Clk, Qa, Qb);
input D, Clk;
output Qa, Qb;
wire nD;
not g1(nD, D);
wire f1, f2;
nand S_g(f1, D, Clk);
nand R_g(f2, nD, Clk);
nand Out1(Qa, f1, Qb);
nand Out2(Qb, f2, Qa);
endmodule 
