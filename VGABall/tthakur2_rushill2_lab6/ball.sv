//-------------------------------------------------------------------------
//    Ball.sv                                                            --
//    Viral Mehta                                                        --
//    Spring 2005                                                        --
//                                                                       --
//    Modified by Stephen Kempf 03-01-2006                               --
//                              03-12-2007                               --
//    Translated by Joe Meng    07-07-2013                               --
//    Fall 2014 Distribution                                             --
//                                                                       --
//    For use with ECE 298 Lab 7                                         --
//    UIUC ECE Department                                                --
//-------------------------------------------------------------------------


module  ball ( input Reset, frame_clk, ended,
					input [7:0] keycode, 
               output [9:0]  BallX, BallY, BallS );
    
    logic [9:0] Ball_X_Pos, Ball_X_Motion, Ball_Y_Pos, Ball_Y_Motion, Ball_Size;
	    logic wall_left, wall_right, wall_up, wall_down;

    parameter [9:0] Ball_X_Center=340;  // Center position on the X axis
    parameter [9:0] Ball_Y_Center=458;  // Center position on the Y axis
    parameter [9:0] Ball_X_Min=0;       // Leftmost point on the X axis
    parameter [9:0] Ball_X_Max=639;     // Rightmost point on the X axis
    parameter [9:0] Ball_Y_Min=0;       // Topmost point on the Y axis
    parameter [9:0] Ball_Y_Max=479;     // Bottommost point on the Y axis
    parameter [9:0] Ball_X_Step=1;      // Step size on the X axis
    parameter [9:0] Ball_Y_Step=1;      // Step size on the Y axis

    assign Ball_Size = 4;  // assigns the value 4 as a 10-digit binary number, ie "0000000100"
   
    always_ff @ (posedge Reset or posedge frame_clk )
    begin: Move_Ball
        if (Reset)  // Asynchronous Reset
        begin 
            Ball_Y_Motion <= 10'd0; //Ball_Y_Step;
				Ball_X_Motion <= 10'd0; //Ball_X_Step;
				Ball_Y_Pos <= Ball_Y_Center;
				Ball_X_Pos <= Ball_X_Center;
        end
		  
        else 
        begin 
				 if((wall_left || wall_right) && (wall_up || wall_down)) begin
						Ball_X_Motion <= 10'd0;
						Ball_Y_Motion <= 10'd0;
				 end

					  
				 else begin
					  Ball_Y_Motion <= 10'd0;  // Ball is somewhere in the middle, don't bounce, just keep moving
					  Ball_X_Motion <= 10'd0;
				end
				 
				 case (keycode)
					8'h04 : begin
							if (wall_left) begin
								Ball_X_Motion <= 0;
								Ball_Y_Motion <= 0;
							end
							
							else begin
								Ball_X_Motion <= -1;//A
								Ball_Y_Motion<= 0;
							end
							  end
					        
					8'h07 : begin
								
					        if (wall_right) begin
								Ball_X_Motion <= 0;
								Ball_Y_Motion <= 0;
							end
							
							else begin
								Ball_X_Motion <= 1;//A
								Ball_Y_Motion<= 0;
							end
							  end

							  
					8'h16 : begin

					        if (wall_down) begin
								Ball_X_Motion <= 0;
								Ball_Y_Motion <= 0;
							end
							
							else begin
								Ball_X_Motion <= 0;//A
								Ball_Y_Motion<= 1;
							end
							  end
							  
					8'h1A : begin
					        if (wall_up || gated) begin
								Ball_X_Motion <= 0;
								Ball_Y_Motion <= 0;
							end
							
							else begin
								Ball_X_Motion <= 0;//A
								Ball_Y_Motion<= -1;
							end
							  end	  
					default: ;
			   endcase
				 
				 Ball_Y_Pos <= (Ball_Y_Pos + Ball_Y_Motion);  // Update ball position
				 Ball_X_Pos <= (Ball_X_Pos + Ball_X_Motion);
			
			
	  /**************************************************************************************
	    ATTENTION! Please answer the following quesiton in your lab report! Points will be allocated for the answers!
		 Hidden Question #2/2:
          Note that Ball_Y_Motion in the above statement may have been changed at the same clock edge
          that is causing the assignment of Ball_Y_pos.  Will the new value of Ball_Y_Motion be used,
          or the old?  How will this impact behavior of the ball during a bounce, and how might that 
          interact with a response to a keypress?  Can you fix it?  Give an answer in your Post-Lab.
      **************************************************************************************/
      

		end  
    end
	mazewalls UpperXRange(.DrawX(Ball_X_Pos+Ball_Size), .DrawY(Ball_Y_Pos), .is_wall(wall_right));
	mazewalls LowerXRange(.DrawX(Ball_X_Pos-Ball_Size), .DrawY(Ball_Y_Pos), .is_wall(wall_left));
	mazewalls LowerYRange(.DrawX(Ball_X_Pos),.DrawY(Ball_Y_Pos+Ball_Size),.is_wall(wall_down));
	mazewalls UpperYRange(.DrawX(Ball_X_Pos),.DrawY(Ball_Y_Pos-Ball_Size),.is_wall(wall_up));


    assign BallX = Ball_X_Pos;
   
    assign BallY = Ball_Y_Pos;
		logic gated;
    assign BallS = Ball_Size;
	 
    always_comb begin
			if ((BallY - 4 <= GateY) && (BallX >= GateX1) && (BallX <= GateX2) && !ended)
				gated <= 1'd1;
			else
				gated <= 1'd0;
	 end
	 parameter [9:0] GateY = 10'd17;
	 parameter [9:0] GateX1 = 10'd277;
	 parameter [9:0] GateX2 = 10'd300;
	 
	 


endmodule

