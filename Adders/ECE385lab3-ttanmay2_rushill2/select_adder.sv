module select_adder (
	input  [15:0] A, B,
	input         cin,
	output [15:0] S,
	output        cout
);


    /* TODO
     *
     * Insert code here to implement a CSA adder.
     * Your code should be completly combinational (don't use always_ff or always_latch).
     * Feel free to create sub-modules or other files. */
	  // Instantiating the 4 4bit RCAs, starting with the 4LSB and ending with 4 MSB
	  // Naming convention rcaAB where A is the slice number and B is the value of cin
	  logic [15:0] S1;
	  logic [15:0] S0;
	  logic cout10;
	  logic cout11;
	  logic cout20;
	  logic cout21;
	  logic cout30;
	  logic cout31;
	  logic cout40;
	  logic cout41;
	  logic c4;
	  logic c3;
	  logic c2;
	  logic c1;
	  logic [15:0] s_temp;
	  
	  
	  // Instantiations
	  
	  rca_4bit rca10(.A(A[3:0]), .B(B[3:0]), .cin(1'b0), .S(S0[3:0]), .cout(cout10));
//	  rca_4bit rca11(.A(A[3:0]), .B(B[3:0]), .cin(1'b1), .S(S1[3:0]), .cout(cout11));
	  
	  rca_4bit rca20(.A(A[7:4]), .B(B[7:4]), .cin(1'b0), .S(S0[7:4]), .cout(cout20));
	  rca_4bit rca21(.A(A[7:4]), .B(B[7:4]), .cin(1'b1), .S(S1[7:4]), .cout(cout21));

	  rca_4bit rca30(.A(A[11:8]), .B(B[11:8]), .cin(1'b0), .S(S0[11:8]), .cout(cout30));
	  rca_4bit rca31(.A(A[11:8]), .B(B[11:8]), .cin(1'b1), .S(S1[11:8]), .cout(cout31));

	  
	  rca_4bit rca40(.A(A[15:12]), .B(B[15:12]), .cin(1'b0), .S(S0[15:12]), .cout(cout40));
	  rca_4bit rca41(.A(A[15:12]), .B(B[15:12]), .cin(1'b1), .S(S1[15:12]), .cout(cout41));
			  
	  
	  // Making MUX selections out of the two instances generated, based off cin
	  always_comb
		begin
			s_temp[3:0] <= S0[3:0];
			c1 <= cout10;
		end
	
	  always_comb
		begin
			if (c1) begin
				s_temp[7:4] <= S1[7:4];
				c2 <= cout21;
			end
			else begin
				s_temp[7:4] <= S0[7:4];
				c2 <= cout20;
			end
		end
	
	  always_comb
		begin
			if (c2) begin
				s_temp[11:8] <= S1[11:8];
				c3 <= cout31;
			end
			else begin
				s_temp[11:8] <= S0[11:8];
				c3 <= cout30;
			end
		end
		
		always_comb
		begin
			if (c3) begin
				s_temp[15:12] <= S1[15:12];
				c4 <= cout41;
			end
			else begin
				s_temp[15:12] <= S0[15:12];
				c4 <= cout40;
			end
		end
		
	 assign S[15:0] = s_temp[15:0];
	 assign cout = c4;
	  

endmodule
