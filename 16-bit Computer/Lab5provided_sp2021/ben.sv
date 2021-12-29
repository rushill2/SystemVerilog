// regfile for ece385 LC3

module benfinder(input logic [15:0] Bus, IR, 
				input logic Reset, Clk, LD_CC,
				output logic BEN);
		
	logic [2:0] nzp_curr;
	logic [2:0] nzp_calc;
	logic ben_val;
	always_ff @ (posedge Clk) begin
	 BEN = ben_val;
	end
	
	always_comb begin
		if (Bus[15:0] == 16'd0) 				// all bits are zeroes
			nzp_calc = 3'b010;
		else if (Bus[15]) 
			nzp_calc = 3'b100;		// negative
		else 
			nzp_calc = 3'b001;		// pos
	end
	always_ff @(posedge Clk) begin
		if (LD_CC)
			nzp_curr <= nzp_calc; 
		else if (Reset)
			nzp_curr <= 3'b010;
	end

	logic [2:0] nzp_bits; 
	assign nzp_bits = IR[11:9];

	always_comb begin
		ben_val = nzp_bits[2] & nzp_curr[2] | nzp_bits[1] & nzp_curr[1] | nzp_bits[0] & nzp_curr[0];
	end

	

endmodule