module Mux2to1_8bit(x, y, s, m);
input [7:0] x;
input [7:0] y;
input s;
output [7:0] m;
Mux2to1_1bit (m[7], x[7], y[7], s);
Mux2to1_1bit (m[6], x[6], y[6], s);
Mux2to1_1bit (m[5], x[5], y[5], s);
Mux2to1_1bit (m[4], x[4], y[4], s);
Mux2to1_1bit (m[3], x[3], y[3], s);
Mux2to1_1bit (m[2], x[2], y[2], s);
Mux2to1_1bit (m[1], x[1], y[1], s);
Mux2to1_1bit (m[0], x[0], y[0], s);
endmodule 