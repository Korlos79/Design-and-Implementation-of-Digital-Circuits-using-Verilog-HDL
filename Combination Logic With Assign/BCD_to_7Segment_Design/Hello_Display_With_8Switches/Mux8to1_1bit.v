module Mux8to1_1bit(s2, s1, s0, u, v, w, x, y, z, p, t, m);
input s2, s1, s0, u, v, w, x, y, z, p, t;
output m;
wire uv, wx, yz, pt, uvwx, yzpt;
Mux2to1_1bit(uv, u, v, s0);
Mux2to1_1bit(wx, w, x, s0);
Mux2to1_1bit(yz, y, z, s0);
Mux2to1_1bit(pt, p, t, s0);
Mux2to1_1bit(uvwx, uv, wx, s1);
Mux2to1_1bit(yzpt, yz, pt, s1);
Mux2to1_1bit(m, uvwx, yzpt, s2);
endmodule 