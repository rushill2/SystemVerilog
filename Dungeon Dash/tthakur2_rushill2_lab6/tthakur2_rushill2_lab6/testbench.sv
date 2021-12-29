module testbench();

bit MAX10_CLK1_50;
    bit [1:0] KEY;
    bit [9:0] SW, LEDR;

    bit [7:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;

lab62 lab(.*);


always begin : CLOCK_GENERATION
#1 MAX10_CLK1_50 = ~MAX10_CLK1_50;
end

initial begin: CLOCK_INITIALIZATION
    MAX10_CLK1_50 = 0;
end 

initial begin: TEST_VECTORS


end

endmodule