module heart_rom ( input [10:0]	addr,
						output [15:0]	data
					 );

	parameter ADDR_WIDTH = 11;
   parameter DATA_WIDTH =  16;
	logic [ADDR_WIDTH-1:0] addr_reg;
        parameter [0:2**ADDR_WIDTH-1][DATA_WIDTH-1:0] ROM = {	
        16'b0000000000000000, // 0
        16'b0000000000000000, // 1
        16'b0011111001111100, // 2
        16'b0111111111111110, // 3
        16'b0111111111111110, // 4
        16'b0111111111111110, // 5
        16'b0011111111111100, // 6
        16'b0001111111111000, // 7
        16'b0000111111110000, // 8
        16'b0000011111100000, // 9
        16'b0000001111000000, // a
        16'b0000000110000000, // b
        16'b0000000000000000, // c
		16'b0000000000000000, // d
        16'b0000000000000000, // e
        16'b0000000000000000, // f
        };

	assign data = ROM[addr];

endmodule  