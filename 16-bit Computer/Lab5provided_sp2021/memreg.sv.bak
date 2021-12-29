// regfile for ece385 LC3

module reg_unit(input logic [15:0] Din, Bus, 
				input logic Reset, Clk, LD_REG,
				input logic [2:0] DR, SR1, SR2,
				output logic [15:0] SR1_OUT, SR2_OUT);


logic ld_r0, ld_r1, ld_r2, ld_r3, ld_r4, ld_r5, ld_r6, ld_r7;
logic [15:0] out_r0, out_r1, out_r2, out_r3, out_r4, out_r5, out_r6, out_r7;

// assigning the load signal based off the register in use
	always_comb begin
		ld_r0 = 0;
		ld_r1 = 0;
		ld_r2 = 0;
		ld_r3 = 0;
		ld_r4 = 0;
		ld_r5 = 0;
		ld_r6 = 0;
		ld_r7 = 0;
		unique case(DR) 
			3'b000: ld_r0 = LD_REG;
			3'b001: ld_r1 = LD_REG;
			3'b010: ld_r2 = LD_REG;
			3'b011: ld_r3 = LD_REG;
			3'b100: ld_r4 = LD_REG;
			3'b101: ld_r5 = LD_REG;
			3'b110: ld_r6 = LD_REG;
			3'b111: ld_r7 = LD_REG;
			default: ;
		endcase
	end

// input based on SR1
	always_comb begin
		SR1_OUT = 16'd0;
		case(SR1) 
			3'b000: SR1_OUT <= out_r0;
			3'b001: SR1_OUT <= out_r1;
			3'b010: SR1_OUT <= out_r2;
			3'b011:	SR1_OUT <= out_r3;
			3'b100: SR1_OUT <= out_r4;
			3'b101:	SR1_OUT <= out_r5;
			3'b110: SR1_OUT <= out_r6;
			3'b111: SR1_OUT <= out_r7; 
		endcase
	end

// input based on 
	always_comb begin
		case(SR2) 
			3'b000: SR2_OUT <= out_r0;
			3'b001: SR2_OUT <= out_r1;
			3'b010: SR2_OUT <= out_r2;
			3'b011:	SR2_OUT <= out_r3;
			3'b100: SR2_OUT <= out_r4;
			3'b101:	SR2_OUT <= out_r5;
			3'b110: SR2_OUT <= out_r6;
			3'b111: SR2_OUT <= out_r7; 
		endcase
	end


// instantiating all GPRs
	register r0(.Clk(Clk), .Reset(Reset), .load(ld_r0), 
				.Din(Bus), .Dout(out_r0));
	
	register r1(.Clk(Clk), .Reset(Reset), .load(ld_r1), 
				.Din(Bus), .Dout(out_r1));

	register r2(.Clk(Clk), .Reset(Reset), .load(ld_r2), 
				.Din(Bus), .Dout(out_r2));

	register r3( .Clk(Clk), .Reset(Reset), .load(ld_r3), 
				.Din(Bus), .Dout(out_r3));

	register r4( .Clk(Clk), .Reset(Reset), .load(ld_r4), 
				.Din(Bus), .Dout(out_r4));

	register r5( .Clk(Clk), .Reset(Reset), .load(ld_r5), 
				.Din(Bus), .Dout(out_r5));

	register r6( .Clk(Clk), .Reset(Reset), .load(ld_r6), 
				.Din(Bus), .Dout(out_r6));

	register r7(.Clk(Clk), .Reset(Reset), .load(ld_r7), 
				.Din(Bus), .Dout(out_r7));

endmodule


module register(input logic Clk, Reset, load, 
				input logic [15:0] Din, 
				output logic [15:0] Dout);

always_ff @ (posedge Clk) begin
	if(Reset)
		Dout <= 16'd0;
	else if (load)
		Dout <= Din;
end

endmodule