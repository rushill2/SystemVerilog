module muxmodule(input logic [15:0] IR, SR2_OUT, input logic SR2MUX, SR1MUX, DRMUX, 
                output logic [2:0] DR, SR1, SR2,
                output logic [15:0] SR2val);

    logic [4:0] operand_5;
	 logic [15:0] imm;
    assign operand_5 = IR[4:0];
    assign SR2 = IR[2:0];
    sext_4 fivebits(.in(operand_5), .out(imm));

    // MUXes
    always_comb begin
        case(SR2MUX) 
            1'b0: SR2val = imm;	
            1'b1: SR2val = SR2_OUT;
        endcase
        case(SR1MUX) 
            1'b0: SR1 = IR[8:6];	
            1'b1: SR1 = IR[11:9];
        endcase
        case(DRMUX) 
            1'b0: DR = IR[11:9];	
            1'b1: DR = 3'b111;
        endcase
    end
endmodule
