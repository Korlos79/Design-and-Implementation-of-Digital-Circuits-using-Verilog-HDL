module Shift_bits(out,in,temp);
input [7:0]in;
input [1:0]temp;
output [7:0]out;
assign out = in >> temp;
endmodule