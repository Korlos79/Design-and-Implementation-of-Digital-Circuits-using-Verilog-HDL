module BCD_Final_With_Clock_Design(Clock_50, reset_n, O);
input Clock_50, reset_n;
output [6:0]O;
wire clk_1s;
wire [3:0] n;
Clock_Divider(Clock_50, clk_1s);
CounterBCD(clk_1s, reset_n, n);
BCD_Decoder(n, O);
endmodule 
