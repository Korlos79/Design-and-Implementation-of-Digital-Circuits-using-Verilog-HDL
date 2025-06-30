module CircuitA(c,m);
input [2:0] c;
output [2:0] m; 
assign m[2] = c[2] & c[1];
assign m[1] = c[2] & ~c[1];
assign m[0] = c[0];
endmodule 