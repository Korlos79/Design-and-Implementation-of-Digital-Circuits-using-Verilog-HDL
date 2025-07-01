module tri_8(o,i,c);
input [7:0] i;
input c;
output[7:0]o;

assign o[0] = c? i[0]:1'bZ;
assign o[1] = c? i[1]:1'bZ;
assign o[2] = c? i[2]:1'bZ;
assign o[3] = c? i[3]:1'bZ;
assign o[4] = c? i[4]:1'bZ;
assign o[5] = c? i[5]:1'bZ;
assign o[6] = c? i[6]:1'bZ;
assign o[7] = c? i[7]:1'bZ;

endmodule