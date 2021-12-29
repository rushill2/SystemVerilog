module twoonemux ( 	input	logic				cin,
						input logic [3:0]				In_1,
						input logic [3:0]				 In_0,
						output logic [3:0]		 Selected);
						
//	always_comb
//		begin
//			unique case (cin)
//				1'b0: Selected = In_0;
//				1'b1: Selected = In_1;
//			endcase
//		end
endmodule