module Equal_5b (Output, Input1, Input2); //if Input1 = Input2 => Output = 1
//define_IO
	input [4:0] Input1, Input2;
	output Output;
	
//define_wire/reg
	wire [4:0] XOR;
	
//body
	xor inst (XOR[0], Input1[0], Input2[0]);
	xor inst1 (XOR[1], Input1[1], Input2[1]);
	xor inst2 (XOR[2], Input1[2], Input2[2]);
	xor inst3 (XOR[3], Input1[3], Input2[3]);
	xor inst4 (XOR[4], Input1[4], Input2[4]);
	
	nor inst5 (Output, XOR[0], XOR[1], XOR[2], XOR[3], XOR[4]);
endmodule
