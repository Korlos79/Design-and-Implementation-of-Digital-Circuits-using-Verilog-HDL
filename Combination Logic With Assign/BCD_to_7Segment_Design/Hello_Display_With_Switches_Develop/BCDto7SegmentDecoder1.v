module BCDto7SegmentDecoder1(c, m);
input [2:0] c;
output [6:0] m;
assign m[6] = c[1] | c[0];
assign m[5] = 0;
assign m[4] = 0;
assign m[3] = c[2];
assign m[2] = (~c[2] & ~c[0]) | (~c[2] & ~c[1]);
assign m[1] = (~c[2] & ~c[0]) | (~c[2] & ~c[1]);
assign m[0] = (~c[1] & c[0]) | (c[1] & ~c[0]) | c[2];
endmodule 