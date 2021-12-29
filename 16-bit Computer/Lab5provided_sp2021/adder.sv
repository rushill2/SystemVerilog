module adder(input logic ADDR1MUX, input logic [1:0] ADDR2MUX,  input logic [9:0] SW,
             input logic [15:0] IR, next_PC, SR1_OUT,
             output logic [15:0] Adder);
    // ADDR2MUX
    logic [5:0] addroff5;
    logic [8:0] addroff8;
    logic [10:0] addroff10;
    logic [15:0] addr2_out, addr2_5, addr2_8, addr2_10;

    assign addroff10 = IR[10:0];
    assign addroff8 = IR[8:0];
    assign addroff5 = IR[5:0];
    // Sign extending the bits
    sext_5 fivebits(.in(addroff5), .out(addr2_5));
    sext_8 eightbits(.in(addroff8), .out(addr2_8));
    sext_10 tenbits(.in(addroff10), .out(addr2_10));
    // ADDR1MUX 
    logic [15:0] addr1_out;

    // ADDR1MUX and ADDR2MUX
    always_comb begin
        case(ADDR2MUX) 
            2'b00: addr2_out = 16'd0;	
            2'b01: addr2_out = addr2_5;
            2'b10: addr2_out = addr2_8;
            2'b11: addr2_out = addr2_10;
        endcase
        case(ADDR1MUX) 
            1'b0: addr1_out = next_PC;	
            1'b1: addr1_out = SR1_OUT;
        endcase

        Adder =  addr1_out + addr2_out;
    end

endmodule