module CounterBT(data, counter, clock, reset);
input data, clock, reset;
output reg [15:0] counter;
reg [15:0] shift_register;
reg [9:0] clock_counter;
always @ (posedge clock) begin
	if(reset) begin
		counter <= 16'b0;
		clock_counter <= 10'b0;
		shift_register <= 16'b0;
	end else begin 
		shift_register <= {shift_register[14:0],data};
		if(shift_register == 16'hAFAF) begin
			counter <= counter + 1;
		end if(clock_counter < 999) begin
			clock_counter <= clock_counter + 1;
		end else begin
			shift_register <= 0;
			counter <= 0;
			clock_counter <= 0;
		end
	end
end
endmodule
	