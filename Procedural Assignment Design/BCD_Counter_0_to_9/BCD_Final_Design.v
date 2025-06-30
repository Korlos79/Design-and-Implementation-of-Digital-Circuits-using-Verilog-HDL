module BCD_Final_Design(Clk, reset_n, O);
input wire Clk, reset_n;
output wire [6:0] O;
wire [3:0] n;
CounterBCD(Clk, reset_n, n);
BCD_Decoder(n, O);
endmodule 