module Mux5to1_3bit(s2, s1, s0, u, v, w, x, y, m);
input s2, s1, s0;
output [2:0] m;
input [2:0] u; 
input [2:0] v; 
input [2:0] w; 
input [2:0] x; 
input [2:0] y;
Mux5to1_1bit(s2, s1, s0, u[2], v[2], w[2], x[2], y[2], m[2]);
Mux5to1_1bit(s2, s1, s0, u[1], v[1], w[1], x[1], y[1], m[1]);
Mux5to1_1bit(s2, s1, s0, u[0], v[0], w[0], x[0], y[0], m[0]);
endmodule 