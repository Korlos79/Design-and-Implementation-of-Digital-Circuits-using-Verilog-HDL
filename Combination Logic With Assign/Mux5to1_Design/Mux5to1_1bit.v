module Mux5to1_1bit(s2, s1, s0, u, v, w, x, y, m);
input s2, s1, s0, u, v, w, x, y;
output m;
wire uv, wx, uvwx;
Mux2to1_1bit(uv, u, v, s0);
Mux2to1_1bit(wx, w, x, s0);
Mux2to1_1bit(uvwx, uv, wx, s1);
Mux2to1_1bit(m, uvwx, y, s2);
endmodule 