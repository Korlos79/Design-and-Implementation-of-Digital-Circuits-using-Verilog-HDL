module counter_7to77 (
	input clock,
	input reset,
	output reg [6:0] counter
);
	always @(negedge clock or posedge reset) begin
		if(reset)
			counter <= 7;
		else if(counter== 77)
			counter <= 7; 
		else
			counter <= counter +1;
	end
endmodule
module tbcounter_7_to_77;
    reg clk;
    reg rst;
    wire [6:0] count;
    counter_7to77 countertb( clk, rst, count);

    always #5 clk = ~clk;
    
    initial begin
        $dumpfile("counter.vcd");
        $dumpvars(0, tb_counter_7_to_77);
        
        clk = 0;
        rst = 1;
        #10 rst = 0; 
        #1000; 
        $finish;
    end
endmodule
