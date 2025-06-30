module Clock_Divider (clk_50MHz, clk_1s, reset);
    input wire clk_50MHz;      
    output reg clk_1s;
		input reset;
    reg [25:0] counter;
    always @(posedge clk_50MHz or posedge reset) begin
		if(reset) begin
			counter <= 0;
			clk_1s <= 0;
		end else begin
        if (counter >= 25_000_000) begin 
            counter <= 0;
            clk_1s <= ~clk_1s;
        end else begin
            counter <= counter + 1;
        end
    end
	end
endmodule 