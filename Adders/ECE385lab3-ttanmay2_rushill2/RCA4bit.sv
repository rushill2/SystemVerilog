module rca_4bit
(
	input  [3:0] A, B,
	input         cin,
	output logic [3:0] S,
	output logic cout
);

    /* TODO
     *
     * Insert code here to implement a ripple adder.
     * Your code should be completly combinational (don't use always_ff or always_latch).
     * Feel free to create sub-modules or other files. */
	  logic cout0;
	  logic cout1;
	  logic cout2;
	  logic cout3;
	  
	  always_comb
		begin
			cout0 <= cin;
			S[0] <= (A[0] ^ B[0]) ^ cout0;
			cout1 <=  (B[0] & cout0) | (A[0] & cout0) | (A[0] & B[0]);
		end
     
	  always_comb
		begin
			S[1] <= (A[1] ^ B[1]) ^ cout1;
			cout2 <=  (B[1] & cout1) | (A[1] & cout1) | (A[1] & B[1]);
		end
     
	  always_comb
		begin
			S[2] <= (A[2] ^ B[2]) ^ cout2;
			cout3 <=  (B[2] & cout2) | (A[2] & cout2) | (A[2] & B[2]);
		end
     
	  always_comb
		begin
			S[3] <= (A[3] ^ B[3]) ^ cout3;
			cout <=  (B[3] & cout3) | (A[3] & cout3) | (A[3] & B[3]);
		end
		
endmodule
