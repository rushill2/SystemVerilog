module sext_4(input signed [4:0] in, output signed [15:0] out);

	logic MSB;
	logic [15:0] outholder;
	assign MSB = in[4];
	always_comb begin
	if (MSB)
		outholder = {11'b11111111111, in};
	else 
     outholder = {11'd0, in};
	 end
	
	assign out = outholder;

endmodule


module sext_5(input signed [5:0] in, output signed [15:0] out);
	logic [15:0] outholder;
	logic MSB;
	assign MSB = in[5];
   always_comb begin
	if (MSB)
		outholder = {10'b1111111111, in};
	else 
     outholder = {10'd0, in};
	 end
	assign out = outholder;
endmodule


module sext_8(input signed [8:0] in, output signed [15:0] out);
	logic [15:0] outholder;
	logic MSB;
	assign MSB = in[8];
   always_comb begin
	if (MSB)
		outholder = {7'b1111111, in};
	else 
     outholder = {7'd0, in};
	 end
	
	assign out = outholder;

endmodule

module sext_10(input signed [10:0] in, output signed [15:0] out);
	logic [15:0] outholder;
   logic MSB;
	assign MSB = in[10];
	   always_comb begin
	if (MSB)
		outholder = {5'b11111, in};
	else 
     outholder = {5'd0, in};
	 end
	 
	assign out =  outholder;

endmodule
