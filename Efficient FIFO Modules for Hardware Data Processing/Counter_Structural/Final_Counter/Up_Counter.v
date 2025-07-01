module Up_Counter (Output, Reset, CLK, Enable);
//define_IO
	input CLK, Reset, Enable;
	output [5:0] Output;
	
//define_wire/reg
	wire [5:0] Count, A;
	
//body
	Adder_6b inst (Count, Output, 6'd0, Enable);
	Mux_2_1_6b inst1 (A, Count, 6'd0, Reset);
	D_FF_6b inst2 (Output, A, CLK);
	
endmodule
