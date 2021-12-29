module testbench_8();

timeunit 10ns;	// Half clock cycle at 50 MHz
			// This is the amount of time represented by #1 
timeprecision 1ns;

// These signals are internal because the processor will be 
// instantiated as a submodule in testbench.
logic Clk = 0;
logic Reset, Load;
logic [15:0] A;
logic [15:0] B;
logic cin; 
logic [15:0] S;
logic cout;
logic Run_acc;
logic [9:0] LED;
logic [6:0] HEX0;
logic [6:0] HEX1;
logic [6:0] HEX2;
logic [6:0] HEX3;
logic [6:0] HEX4;
logic [6:0] HEX5;


//logic [7:0] Din;
//logic [2:0] F;
//logic [1:0] R;
//logic [3:0] LED;
//logic [7:0] Aval,
//		 Bval;
//logic [6:0] AhexL,
//		 AhexU,
//		 BhexL,
//		 BhexU; 

// To store expected results
logic [7:0] ans_1a, ans_2b;
logic [15:0] temp;
logic cout1;
logic [9:0] SW;
				
// A counter to count the instances where simulation results
// do no match with expected results
integer ErrorCnt = 0;
		
// All possible adders for testing purposes
//ripple_adder ripple_adder0(.A(A[15:0]), .B(B[15:0]), .cin(cin), .S(S[15:0]), .cout(cout));
//select_adder select_adder0(.A(A[15:0]), .B(B[15:0]), .cin(cin), .S(S[15:0]), .cout(cout));	
//lookahead_adder lookahead0(.A(A[15:0]), .B(B[15:0]), .cin(cin), .S(S[15:0]), .cout(cout));	

	adder2 adder_2( .Clk(Clk), .Reset_Clear(Reset), .Run_Accumulate(Run_acc), .SW(SW[9:0]), .LED(LED[9:0]), .HEX0(HEX0[6:0]), .HEX1(HEX1[6:0]), .HEX2(HEX2[6:0]), .HEX3(HEX3[6:0]), .HEX4(HEX4[6:0]), .HEX5(HEX5[6:0])
										 );

// Toggle the clock
// #1 means wait for a delay of 1 timeunit
always begin : CLOCK_GENERATION
#1 Clk = ~Clk;
end

initial begin: CLOCK_INITIALIZATION
    Clk = 0;
end 

// Testing begins here
// The initial block is not synthesizable
// Everything happens sequentially inside an initial block
// as in a software program
initial begin: TEST_VECTORS
Reset = 0;		// Toggle Rest
#1
Reset = 1;

#1

SW = 10'b0000001111;
#1

Run_acc =1;

#1
Run_acc=0;

#5

SW = 10'b0000000001;

#1

Run_acc =1;

#1
Run_acc=0;

//#5


//A = 16'b0000000000000001;
//cin = 0;
//
//#2 B = 16'b0000000000001111;

//Execute = 1;
//Din = 8'h33;	// Specify Din, F, and R
//F = 3'b010;
//R = 2'b10;
//
//#2 Reset = 1;
//
//#2 LoadA = 1;	// Toggle LoadA
//#2 LoadA = 0;
//
//#2 LoadB = 1;	// Toggle LoadB
//   Din = 8'h55;	// Change Din
//#2 LoadB = 0;
//   Din = 8'h00;	// Change Din again
//
//#2 Execute = 0;	// Toggle Execute
//   
//#22 Execute = 1;
//    ans_1a = (8'h33 ^ 8'h55); // Expected result of 1st cycle
//    // Aval is expected to be 8’h33 XOR 8’h55
//    // Bval is expected to be the original 8’h55
//    if (Aval != ans_1a)
//	 ErrorCnt++;
//    if (Bval != 8'h55)
//	 ErrorCnt++;
//    F = 3'b110;	// Change F and R
//    R = 2'b01;
//
//#2 Execute = 0;	// Toggle Execute
//#2 Execute = 1;
//
//#22 Execute = 0;
//    // Aval is expected to stay the same
//    // Bval is expected to be the answer of 1st cycle XNOR 8’h55
//	 $display(Aval);
//    if (Aval != ans_1a)	
//	 ErrorCnt++;
//    ans_2b = ~(ans_1a ^ 8'h55); // Expected result of 2nd  cycle
//    if (Bval != ans_2b)
//	 ErrorCnt++;
//    R = 2'b11;
//#2 Execute = 1;
//
//// Aval and Bval are expected to swap
//#22 if (Aval != ans_2b)
//	 ErrorCnt++;
//    if (Bval != ans_1a)
//	 ErrorCnt++;
//#2 if (S != 16'b000000000000000)
//	ErrorCnt++;



//if (ErrorCnt == 0)
//	$display("Success!");  // Command line output in ModelSim
//else
//	$display("%d error(s) detected. Try again!", ErrorCnt);
//end
end
endmodule
