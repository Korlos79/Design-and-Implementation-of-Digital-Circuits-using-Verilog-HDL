module tb_Ram_lab5;
  reg clk;
  reg wr_e;
  reg oe;
  reg cs;
  reg [6:0] addr;
  reg [7:0] data_in;
  wire [7:0] data;
  wire [7:0] result;

  // ?i?u khi?n h??ng truy?n trên bus d? li?u
  assign data = (cs && wr_e && !oe) ? data_in : 8'bz;
  assign result = data;

  // Instantiate the Unit Under Test (UUT)
  Ram_lab5 uut (
    .clk(clk),
    .wr_e(wr_e),
    .oe(oe),
    .cs(cs),
    .addr(addr),
    .data(data)
  );

  // Clock generation
  always #5 clk = ~clk;

  // Test scenario
  initial begin
    clk = 0;
    wr_e = 0;
    oe = 0;
    cs = 0;
    addr = 7'b0;
    data_in = 8'b0;

    $monitor("T=%0t | clk=%b | addr=%h | cs=%b | wr_e=%b | oe=%b | data_in=%0d | result=%0d",
              $time, clk, addr, cs, wr_e, oe, data_in, result);

    // Write 7 to address 1
    #10 cs = 1; wr_e = 1; addr = 7'd1; data_in = 8'd7;

    // Write -9 to address 2
    #10 cs = 1; wr_e = 1; addr = 7'd2; data_in = -8'd9; 
    #10 wr_e = 0;

    // Read from address 1
    #10 oe = 1; addr = 7'd1; cs = 1;
    #10 oe = 0;

    // Read from address 2
    #10 oe = 1; addr = 7'd2; cs = 1;
    #10 oe = 0;

    // Done
    #10 $finish;
  end
endmodule
