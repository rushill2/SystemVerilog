module lookahead_adder (
	input  [15:0] A, B,
	input         cin,
	output [15:0] S,
	output        cout
);
    /* TODO
     *
     * Insert code here to implement a CLA adder.
     * Your code should be completly combinational (don't use always_ff or always_latch).
     * Feel free to create sub-modules or other files. */
	  logic cout0;
	  logic cout1;
	  logic cout2;
	  logic cout3;
	  logic cin4;
	  logic cin8;
	  logic cin12;
	  logic cin16;
	  logic GG0;
	  logic GP0;
	  logic GG1;
	  logic GP1;
	  logic GG2;
	  logic GP2;
	  logic GG3;
	  logic GP3;
	  
	  lookahead_adder_4bit cla0( .A(A[3:0]), .B(B[3:0]), .cin(cin), .S(S[3:0]), .cout(cout0), .GP(GP0), .GG(GG0));

	  assign cin4 = GG0 | cin & GP0;
	  
	  lookahead_adder_4bit cla1( .A(A[7:4]), .B(B[7:4]), .cin(cin4), .S(S[7:4]), .cout(cout1), .GP(GP1), .GG(GG1));
	  
	  assign cin8 = GG1 | (GG0 & GP1) | (cin & GP0 & GP1);
	  
	  lookahead_adder_4bit cla2( .A(A[11:8]), .B(B[11:8]), .cin(cin8), .S(S[11:8]), .cout(cout2), .GP(GP2), .GG(GG2));
	  
	  assign cin12 = GG2 | (GG1 & GP2) | (GG0 & GP2 & GP1) | (cin & GP2 & GP1 & GP0);

	  lookahead_adder_4bit cla3( .A(A[15:12]), .B(B[15:12]), .cin(cin12), .S(S[15:12]), .cout(cout3), .GP(GP3), .GG(GG3));
		
	  assign cin16 = GG3 | (GG2 & GP3) | (GG1 & GP2 & GP3) | (GG0 & GP2 & GP1 & GP3) | (cin & GP2 & GP1 & GP0 & GP3);

	
	  assign cout = cin16;
	  
	
endmodule
