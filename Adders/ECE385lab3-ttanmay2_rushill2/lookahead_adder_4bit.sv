module lookahead_adder_4bit (
	input  [3:0] A, B,
	input         cin,
	output [3:0] S,
	output        cout,
	output GP,
	output GG
);
	  // 4-bit Lookahead adder implemented to use for the 16-bit case
	  // Initialization of variables used.
	  
	  logic c;
	  logic [3:0] sum;
	  logic P0;
	  logic P1;
	  logic P2;
	  logic P3;
	  logic G0;
	  logic G1;
	  logic G2;
	  logic G3;
	  
//	  always_comb begin
//		for (int i = 1; i<4; i++) begin
//			if (i==0) begin
//				sum[i] = A[i] ^ B[i] ^ c;
//				end
//			else begin
//				sum = A[i] ^ B[i] ^ c;
//				P = A[i] ^ B[i];
//				G = A[i] & B[i];
//				c = c & P;
//				c = c | G;
//				end
//			end
//	  end
		
	always_comb begin	
	   sum[0] = A[0] ^ B[0] ^ cin;
		
		
		P0 = A[0] ^ B[0];
		G0 = A[0] & B[0];
		c = cin & P0;
		c = c | G0;
		sum[1] = A[1] ^ B[1] ^ c;
		
		P1 = A[1] ^ B[1];
		G1 = A[1] & B[1];
		c = c & P1;
		c = c | G1;
		sum[2] = A[2] ^ B[2] ^ c;
	
		P2 = A[2] ^ B[2];
		G2 = A[2] & B[2];
		c = c & P2;
		c = c | G2;
		sum[3] = A[3] ^ B[3] ^ c;
		
		P3 = A[3] ^ B[3];
		G3 = A[3] & B[3];
		c = c & P3;
		c = c | G3;
	end
	  assign GG = G3 | (G2 & P3) | (G1 & P3 & P2) | (G0 & P3 & P2 & P1);
	  assign GP = P0 & P1 & P2 & P3;
	  assign cout = c;
	  assign S[3:0] = sum[3:0];

endmodule
