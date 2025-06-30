module Comparator(c, z);
input [3:0] c;
output z;
assign z = (c[3] & c[1]) | (c[3] & c[2]);
endmodule 