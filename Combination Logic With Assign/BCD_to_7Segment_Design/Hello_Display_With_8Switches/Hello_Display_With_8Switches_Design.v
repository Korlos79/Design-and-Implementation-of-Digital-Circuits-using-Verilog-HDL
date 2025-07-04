module Hello_Display_With_8Switches_Design(s2, s1, s0, u, v, w, x, y, z, p, t, m, n, l, q, k, h, i, o);
input s2, s1, s0;
input [2:0] u; 
input [2:0] v; 
input [2:0] w; 
input [2:0] x; 
input [2:0] y; 
input [2:0] z; 
input [2:0] p; 
input [2:0] t; 
wire [2:0] c;
output [6:0] m;
output [6:0] n;
output [6:0] l;
output [6:0] q;
output [6:0] k;
output [6:0] h;
output [6:0] i;
output [6:0] o;
Mux8to1_3bit(s2, s1, s0, u, v, w, x, y, z, p, t, c);
assign m[6] = (c[2] & c[0]) | (c[1] & ~c[0]);
assign m[5] = 0;
assign m[4] = 0;
assign m[3] = ~c[2];
assign m[2] = (~c[1] | ~c[0]);
assign m[1] = (~c[1] | ~c[0]);
assign m[0] = (c[1] & ~c[0]) | (~c[1] & c[0]) | ~c[2];
assign n[6] = c[2];
assign n[5] = 0;
assign n[4] = 0;
assign n[3] = ~c[2] & ~c[0];
assign n[2] = ~c[1] | c[0];
assign n[1] = ~c[1] | c[0];
assign n[0] = (~c[2] & ~c[0]) | ~c[1];
assign l[6] = (c[1] & c[0]) | c[2];
assign l[5] = 0;
assign l[4] = 0;
assign l[3] = ~c[2] & ~c[1];
assign l[2] = c[1] | ~c[0];
assign l[1] = c[1] | ~c[0];
assign l[0] = (~c[2] & c[0]) | (~c[1] & ~c[0]);
assign q[6] = c[2] | c[1];
assign q[5] = 0;
assign q[4] = 0;
assign q[3] = ~c[2] & ~c[1] & ~c[0];
assign q[2] = c[1] | c[0];
assign q[1] = c[1] | c[0];
assign q[0] = (~c[2] & ~c[0]) | c[1];
assign k[6] = (~c[2] & c[1]) | (~c[2] & c[0]);
assign k[5] = 0;
assign k[4] = 0;
assign k[3] = c[2];
assign k[2] = ~c[1] | ~c[0];
assign k[1] = ~c[1] | ~c[0];
assign k[0] = (~c[1] & c[0]) | (c[1] & ~c[0]) | c[2];
assign h[6] = ~c[2];
assign h[5] = 0;
assign h[4] = 0;
assign h[3] = c[2] & ~c[0];
assign h[2] = ~c[1] | c[0];
assign h[1] = ~c[1] | c[0];
assign h[0] = (c[2] & ~c[0]) | ~c[1];
assign i[6] = (c[1] & c[0]) | ~c[2];
assign i[5] = 0;
assign i[4] = 0;
assign i[3] = c[2] & ~c[1];
assign i[2] = c[1] | ~c[0];
assign i[1] = c[1] | ~c[0];
assign i[0] = (c[2] & c[0]) | (~c[2] & ~c[0]);
assign o[6] = ~c[2] | c[1];
assign o[5] = 0;
assign o[4] = 0;
assign o[3] = c[2] & ~c[1] & ~c[0];
assign o[2] = c[1] | c[0];
assign o[1] = c[1] | c[0];
assign o[0] = (c[2] & ~c[0]) | c[1];
endmodule 