module Hello_Display_Design(s2, s1, s0, u, v, w, x, y, m);
input s2, s1, s0;
input [2:0] u; 
input [2:0] v; 
input [2:0] w; 
input [2:0] x; 
input [2:0] y; 
wire [2:0] c;
output [6:0] m;
Mux5to1_3bit(s2, s1, s0, u, v, w, x, y, c);
BCDto7SegmentDecoder(c, m);
endmodule 