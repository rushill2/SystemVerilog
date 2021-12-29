// reg unit

module vram(
    input CLK, 
    input RESET,
    input READ, 
    input WRITE,
    input CS,
    input [31:0] Data_In,
    input [9:0] ADDR,
    output [31:0] Data_Out
    );

    logic [31:0] data [601];

    always_ff @ (posedge CLK) begin
        if(RESET)
            for (int i = 0; i < 601; i++)
                data[i] = '0;
        
        else if (READ)
            Data_Out = data[ADDR];

        else if (WRITE)
            data[ADDR] = Data_In;
    end



endmodule