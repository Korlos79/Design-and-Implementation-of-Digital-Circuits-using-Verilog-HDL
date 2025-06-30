module Binary_To_Decimal_Converter(c,m,n);
input [3:0] c;
output [6:0] m;
output [6:0] n;
wire z;
Comparator(c,z);
CircuitB(z,n);
wire [2:0] q;
CircuitA(c[2:0], q);
wire [3:0] l;
Mux2to1_1bit(l[3], c[3], 0, z);
Mux2to1_1bit(l[2], c[2], q[2], z);
Mux2to1_1bit(l[1], c[1], q[1], z);
Mux2to1_1bit(l[0], c[0], q[0], z);
BCDto7SegmentDecoder5(l,m);
endmodule 