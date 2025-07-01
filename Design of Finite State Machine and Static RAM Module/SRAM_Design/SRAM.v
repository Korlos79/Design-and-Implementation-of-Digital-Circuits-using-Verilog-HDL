module SRAM (Address, WriteData, ReadData, WriteEn, ReadEn);
//define_IO
	input [31:0] Address, WriteData;
	output reg [31:0] ReadData;
	input WriteEn, ReadEn;

//define_wire/reg
   reg [31:0] memory [255:0]; // Khai báo một mảng 2D 255x32

//body
   always begin
        if (WriteEn) begin
            memory[Address] <= WriteData; // Ghi dữ liệu vào địa chỉ chỉ định khi WriteEn được kích hoạt
				ReadData <= 32'dZ;
        end
		  else if (ReadEn) begin
            ReadData <= memory[Address]; // Đọc dữ liệu từ địa chỉ chỉ định khi ReadEn được kích hoạt
        end
   end
	 
endmodule


