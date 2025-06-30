module Ram_lab5(
	input clk,
	input wr_e,
	input oe,
	input cs,
	input [6:0] addr,
	inout [7:0] data
);
	reg [7:0] mem [0:127];
	reg [7:0] data_out;
	reg drive;
always @(posedge clk) begin
	if(cs && wr_e) begin
		mem[addr] <= data;
	end
	if(cs && !wr_e && oe) begin
		data_out <= mem[addr];
		drive <= 1;
	end else begin
		drive <= 0;
		data_out <= 8'bz;
	end
end
assign data = (drive) ? data_out : 8'bz;
endmodule

