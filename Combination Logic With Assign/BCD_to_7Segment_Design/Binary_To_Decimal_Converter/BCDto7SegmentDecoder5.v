module BCDto7SegmentDecoder5(c,m);
input [3:0] c;
output [6:0] m;
assign m[6] = (~c[3] & ~c[2] & ~c[1]) | (c[2] & c[1] & c[0]);
assign m[5] = (~c[3] & ~c[2] & c[0]) | (~c[2] & c[1]) | (c[1] & c[0]);
assign m[4] = (c[2] & ~c[1]) | c[0];
assign m[3] = (~c[3] & ~c[2] & ~c[1] & c[0]) | (c[2] & ~c[1] & ~c[0]) | (c[2] & c[1] & c[0]);
assign m[2] = ~c[2] & c[1] & ~c[0];
assign m[1] = (c[2] & ~c[1] & c[0]) | (c[2] & c[1] & ~c[0]);
assign m[0] = (~c[3] & ~c[2] & ~c[1] & c[0]) | (c[2] & ~c[1] & ~c[0]);
endmodule 