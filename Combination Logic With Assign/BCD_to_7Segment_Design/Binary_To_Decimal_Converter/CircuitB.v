module CircuitB(c, m);
    input c;
    output reg [6:0] m;

    always @(*) begin
        m = (c == 0) ? 7'b1000000 : 7'b1111001;
    end
endmodule