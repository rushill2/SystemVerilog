// regfile for ece385 LC3

module memreg(input logic [15:0] Din, 
				input logic Reset, Clk, Load,
				output logic [15:0] Dout);
		
		always_ff @ (posedge Clk) begin
			if (Reset) begin
				Dout <= 16'd0;
			end
				
			else if (Load) begin
				Dout <= Din;
			end
		end
		
endmodule