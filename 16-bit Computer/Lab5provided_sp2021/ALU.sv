// ALU for the SLC3

module ALU(input logic	Clk, Reset, Run, Continue,      									// State transition signals
	input logic [15:0] IR, 
	input logic SR2MUX, ADDR1MUX, MARMUX, DRMUX, SR1MUX, GateALU,										// MUXes																// Mem IO enable
	input logic [1:0] PCMUX, ADDR2MUX, ALUK,													// MUX selectors
	input logic [15:0] SR1_OUT, SR2val,															// MDR load val
	output logic [15:0] ALU_out);

logic [5:0] imm_5;
logic [15:0] imm_15;
sext_5 imm(.in(imm_5), .out(imm_15));

assign imm_5 = IR[4:0];
logic [15:0] SR2, DR_out;
logic selector;
assign selector = IR[5];

always_comb begin
	DR_out = 16'd0;
	case (ALUK)
		2'b11: begin 	// Add
			if(selector)
				DR_out = SR1_OUT + imm_15;
			else
				DR_out = SR1_OUT + SR2val;
		end

		2'b01: begin   // And
			if (selector)
				DR_out = SR1_OUT & imm_5;
			else
				DR_out = SR1_OUT & SR2val;
		end

		2'b10:  begin    // not
			DR_out = ~SR1_OUT;
		end
		
		2'b00: begin
			DR_out = SR1_OUT;
		end
		default: ;
		
	endcase
end

always_comb begin
	ALU_out <= DR_out;
end

endmodule