//-------------------------------------------------------------------------
//    Color_Mapper.sv                                                    --
//    Stephen Kempf                                                      --
//    3-1-06                                                             --
//                                                                       --
//    Modified by David Kesler  07-16-2008                               --
//    Translated by Joe Meng    07-07-2013                               --
//                                                                       --
//    Fall 2014 Distribution                                             --
//                                                                       --
//    For use with ECE 385 Lab 7                                         --
//    University of Illinois ECE Department                              --
//-------------------------------------------------------------------------


module  color_mapper ( input        [9:0] BallX, BallY, DrawX, DrawY, Ball_size,
                              input logic wallon, blank, Clk, Reset, GameEnable, StartEnable, EndState, frame_clk,
                       output logic [7:0]  Red, Green, Blue,
                       output logic ended );
    
    logic ball_on;
     
 /* Old Ball: Generated square box by checking if the current pixel is within a square of length
    2*Ball_Size, centered at (BallX, BallY).  Note that this requires unsigned comparisons.
     
    if ((DrawX >= BallX - Ball_size) &&
       (DrawX <= BallX + Ball_size) &&
       (DrawY >= BallY - Ball_size) &&
       (DrawY <= BallY + Ball_size))

     New Ball: Generates (pixelated) circle by using the standard circle formula.  Note that while 
     this single line is quite powerful descriptively, it causes the synthesis tool to use up three
     of the 12 available multipliers on the chip!  Since the multiplicants are required to be signed,
      we have to first cast them from logic to int (signed by default) before they are multiplied). */
      
    int DistX, DistY, Size;
     assign DistX = DrawX - BallX;
    assign DistY = DrawY - BallY;
    assign Size = Ball_size;
     logic [9:0] diffX, diffY, diffkeyX0, diffkeyY0, diffkeyX1, diffkeyY1, diffkeyX2, diffkeyY2, diffkeyX3, diffkeyY3, Enemy_X1, Enemy_Y1, Enemy_X2, Enemy_Y2, diffStartY, diffStartX;
     assign diffX = DrawX - BallX + 4;
     assign diffY = DrawY - BallY + 4;
	  assign diffStartY = DrawY - 10'd378 + 4;
	  assign diffStartX = DrawX - 10'd356 + 4;
     logic light_on;
     logic [9:0] x_idx, x_ref, x_ref2;
     assign x_idx = DrawX/8;
    
     assign x_ref = 10'd32;
     assign x_ref2 = 10'd37;

     logic [6:0] win;
    
     assign x_ref = 10'd32;
     assign x_ref2 = 10'd37;
     

     always_comb begin : Win_or_Lose_decider
         if (keycnt == 3) 
            win = 7'h63;
        else begin
            win = 7'h6b;
        end
     end
     
     

      
    always_comb
    begin:Ball_on_proc
        if ((DrawX >= BallX - 4 && DrawX <= BallX + 4) && (DrawY >= BallY - 4 && DrawY <= BallY + 4)) begin
            ball_on = 1'b1;
            end
        else 
            ball_on = 1'b0;
     end 

    always_comb
    begin:Light_on_proc
        if (( DistX*DistX + DistY*DistY) <= (radius * radius) ) begin
            light_on = 1'b1;
            end
        else 
            light_on = 1'b0;
     end 
	  
always_comb
    begin:RGB_Display
    Red <= 8'h00;
    Green <=8'h00;
    Blue <= 8'h00;
     font_addr[10:4] <= 7'h00;
    font_addr[3:0] <= '0;
        if(!blank==0) begin 
            if(GameEnable) begin
                if(DrawY>=10'd0 && DrawY <= 10'd16 && DrawX>=10'd0 && DrawX <10'd48) begin
                                if(DrawX >= 10'd0 && DrawX < 10'd8) begin
                                    font_addr[10:4] <= 7'd0;
                                    font_addr[3:0] <= DrawY%16;
                                    if(font_data[flipped]==1'b1) begin
                                        Red <= 8'hff;
                                        Green <=8'hff;
                                        Blue <= 8'hff;
                                    end
                                    else begin 
                                        Red <= 8'h00;
											Green <=8'h00;
								  		  Blue <= 8'h00;
                                    end
                                end
                                else if (DrawX >= 10'd8 && DrawX < 10'd16) begin
                                    font_addr[10:4] <= 7'd1;
                                    font_addr[3:0] <= DrawY%16;
                                    if(font_data[flipped]==1'b1) begin
                                        Red <= 8'hff;
                                        Green <=8'hff;
                                        Blue <= 8'hff;
                                    end
                                    else begin 
                                        Red <= 8'h00;
											Green <=8'h00;
								  		  Blue <= 8'h00;
                                end
                                end
                                
                                else if (DrawX >= 10'd16 && DrawX < 10'd24) begin
                                    font_addr[10:4] <= 7'd2;
                                    font_addr[3:0] <= DrawY%16;
                                    if(font_data[flipped]==1'b1) begin
                                       Red <= 8'hff;
                                        Green <=8'hff;
                                        Blue <= 8'hff;
                                    end
                                    else begin 
                                        Red <= 8'h00;
											Green <=8'h00;
								  		  Blue <= 8'h00;
                                end
                                end
                                
                                else if (DrawX >= 10'd24 && DrawX < 10'd32) begin
                                    font_addr[10:4] <= 7'd3;
                                    font_addr[3:0] <= DrawY%16;
                                    if(font_data[flipped]==1'b1) begin
                                        Red <= 8'hff;
                                        Green <=8'hff;
                                        Blue <= 8'hff;
                                    end
                                    else begin 
                                        Red <= 8'h00;
											Green <=8'h00;
								  		  Blue <= 8'h00;
                                end
                                end
                                
                                else if (DrawX >= 10'd32 && DrawX < 10'd40) begin
                                    font_addr[10:4] <= 7'd4;
                                    font_addr[3:0] <= DrawY%16;
                                    if(font_data[flipped]==1'b1) begin
                                        Red <= 8'hff;
                                        Green <=8'hff;
                                        Blue <= 8'hff;
                                    end
                                    else begin 
                                        Red <= 8'h00;
											Green <=8'h00;
								  		  Blue <= 8'h00;
                                end
                                end

								else if (DrawX >= 10'd40 && DrawX < 10'd48) begin
                                    font_addr[10:4] <= 7'h59 + keycnt;
                                    font_addr[3:0] <= DrawY%16;
                                    if(font_data[flipped]==1'b1) begin
                                        Red <= 8'hff;
                                        Green <=8'hff;
                                        Blue <= 8'hff;
                                    end
                                    else begin 
                                        Red <= 8'h00;
											Green <=8'h00;
								  		  Blue <= 8'h00;
                                end
                            end
                        end
//----------------------------------------------------------------------------------------------------------------
// make hearts									
						else if(DrawY>=10'd0 && DrawY <= 10'd16 && DrawX>=10'd56 && DrawX <10'd88) begin
                                if(DrawX >= 10'd56 && DrawX < 10'd64) begin
                                    font_addr[10:4] <= 7'h5;
                                    font_addr[3:0] <= DrawY%16;
                                    if(font_data[flipped]==1'b1) begin
                                        if(hitsum > 2) begin
												Red <= 8'h00;
									     		 Green <=8'h00;
												 Blue <= 8'h00;
													end
										else begin
												Red <= 8'hff;
											    Green <=8'h00;
												Blue <= 8'h00;
										end	
                                    end
                                    else begin 
														 Red <= 8'h00;
												Green <=8'h00;
											  Blue <= 8'h00;
                                    end
                                end
                                else if (DrawX >= 10'd64 && DrawX < 10'd72) begin
                                    font_addr[10:4] <= 7'h5;
                                    font_addr[3:0] <= DrawY%16;
                                    if(font_data[flipped]==1'b1) begin
                                        if(hitsum > 1) begin
												Red <= 8'h00;
									     		 Green <=8'h00;
												 Blue <= 8'h00;
													end
											else begin
													Red <= 8'hff;
													 Green <=8'h00;
													Blue <= 8'h00;
											end	
                                    end
                                    else begin 
                                        Red <= 8'h00;
											Green <=8'h00;
								  		  Blue <= 8'h00;
                                end
                            end

                            else if (DrawX >= 10'd72 && DrawX < 10'd80) begin
                                    font_addr[10:4] <= 7'h5;
                                    font_addr[3:0] <= DrawY%16;
                                    if(font_data[flipped]==1'b1) begin
                                        if(hitsum > 0) begin
												Red <= 8'h00;
									     		 Green <=8'h00;
												 Blue <= 8'h00;
													end
											else begin
													Red <= 8'hff;
													 Green <=8'h00;
													Blue <= 8'h00;
											end	
                                    end
                                    else begin 
                                        Red <= 8'h00;
											Green <=8'h00;
								  		  Blue <= 8'h00;
                                end
                            end
						end

                else if(light_on) begin
//---------------------------------------------------------------------------------------------------------------
	
                    if (enemy_on2 && !over_enemy2) begin
                     font_addr[10:4] <= 7'h7f;
                        font_addr[3:0] <= DrawY%16;
                        if(font_data[flipped]==1'b1) begin
								Red <= 8'hff;
			     	     		 Green <=8'h00;
								 Blue <= 8'h00;
            					end

                            else begin 
                                Red <= 8'h00;
								Green <=8'hff;
								Blue <= 8'h00;
                                end
                            end

                else if (wallon) begin 
					Red <= 8'h77;
					Green <=8'h77;
					Blue <= 8'h77;
              
            end
                else if (ball_on) begin
                    if ((diffX == 10'd2 || diffX == 10'd3 || diffX == 10'd4) && (diffY ==10'd0 || diffY == 10'd1)) begin
                        Red <= 8'h55;
                        Green <=8'hff;
                        Blue <= 8'hff;
                    end
                    else if ((diffX == 10'd3 || diffX == 10'd4) && diffY == 10'd2) begin
                        Red <= 8'hff;
                        Green <=8'h55;
                        Blue <= 8'hff;
                    end
                    else if ((diffX == 10'd2 || diffX == 10'd3 || diffX == 10'd4 || diffX == 10'd5) && diffY == 10'd3) begin
                        Red <= 8'hff;
                        Green <=8'h00;
                        Blue <= 8'hff;
                    end
                    else if (diffY == 10'd4 && (diffX == 10'd1 || diffX == 10'd3 || diffX == 10'd4 || diffX == 10'd6)) begin
                        Red <= 8'h00;
                        Green <=8'hff;
                        Blue <= 8'hff;
                    end
                    else if (diffY == 10'd5 &&  (diffX == 10'd2 || diffX == 10'd3 || diffX == 10'd4)) begin
                        Red <= 8'hff;
                        Green <=8'h00;
                        Blue <= 8'h00;
                    end
                    else if (diffY == 10'd6 &&  (diffX == 10'd1 || diffX == 10'd2 || diffX == 10'd4 || diffX == 10'd5)) begin
                        Red <= 8'h00;
                        Green <=8'hff;
                        Blue <= 8'h00;
                    end
                    else if (diffY == 10'd7 &&  (diffX == 10'd1 || diffX == 10'd0 || diffX == 10'd6 || diffX == 10'd5)) begin
                        Red <= 8'hff;
                        Green <=8'h55;
                        Blue <= 8'hff;
                    end
                    else begin 
                        Red <= 8'h00;
                        Green <=8'h00;
                        Blue <= 8'h00;
                    end
                end
    //------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    // map all torches to screen            

                else if (torch0_on) begin
                    if ((diffx0 == 10'd3 || diffX == 10'd5 || diffX == 10'd4) && (diffy0 ==10'd1 || diffy0 == 10'd2)) begin
                        Red <= 8'hff;
                        Green <=8'h99;
                        Blue <= 8'h00;
                    end

                    else if ((diffx0 == 10'd4)) begin
                        Red <= 8'h33;
                        Green <=8'h11;
                        Blue <= 8'h00;
                    end

                    else begin 
                        Red <= 8'h00;
                        Green <=8'h00;
                        Blue <= 8'h00;
                    end
                end

                else if (torch1_on) begin
                    if ((diffx1 == 10'd3 || diffx1 == 10'd5 || diffx1 == 10'd4) && (diffy1 ==10'd1 || diffy1 == 10'd2)) begin
                        Red <= 8'hff;
                        Green <=8'h99;
                        Blue <= 8'h00;
                    end

                    else if ((diffx1 == 10'd4)) begin
                        Red <= 8'h33;
                        Green <=8'h11;
                        Blue <= 8'h00;
                    end

                    else begin 
                        Red <= 8'h00;
                        Green <=8'h00;
                        Blue <= 8'h00;
                    end
                end

                else if (torch2_on) begin
                    if ((diffx2 == 10'd3 || diffx2 == 10'd5 || diffx2 == 10'd4) && (diffy2 ==10'd1 || diffy2 == 10'd2)) begin
                        Red <= 8'hff;
                        Green <=8'h99;
                        Blue <= 8'h00;
                    end

                    else if ((diffx2 == 10'd4)) begin
                        Red <= 8'h33;
                        Green <=8'h11;
                        Blue <= 8'h00;
                    end

                    else begin 
                        Red <= 8'h00;
                        Green <=8'h00;
                        Blue <= 8'h00;
                    end
                end

                else if (torch3_on) begin
                    if ((diffx3 == 10'd3 || diffx3 == 10'd5 || diffx3 == 10'd4) && (diffy3 ==10'd1 || diffy3 == 10'd2)) begin
                        Red <= 8'hff;
                        Green <=8'h99;
                        Blue <= 8'h00;
                    end

                    else if ((diffx3 == 10'd4)) begin
                        Red <= 8'h33;
                        Green <=8'h11;
                        Blue <= 8'h00;
                    end

                    else begin 
                        Red <= 8'h00;
                        Green <=8'h00;
                        Blue <= 8'h00;
                    end
                end
//--------------------------------------------------------------------------------------------------------------

// create keys
                else if(key0_on) begin
                    if((diffkeyY0 == 10'd7 || diffkeyY0 == 10'd6) && (diffkeyX0 >=1 && diffkeyX0 <=5)) begin
                        Red <= 8'h33;
                        Green <=8'h11;
                        Blue <= 8'h00;
                    end

                    else if((diffkeyY0 == 10'd5) && (diffkeyX0 ==10'd1 || diffkeyX0 ==10'd2 || diffkeyX0 == 10'd4 || diffkeyX0 == 10'd5)) begin
                        Red <= 8'h33;
                        Green <=8'h11;
                        Blue <= 8'h00;
                    end

                    else if((diffkeyY0 == 10'd5) && (diffkeyX0 ==10'd3)) begin
                        Red <= 8'hff;
                        Green <=8'h99;
                        Blue <= 8'h00;
                    end

                    else if((diffkeyY0 == 10'd4) && (diffkeyX0 <=10'd5 && diffkeyX0 >= 10'd1)) begin
                        Red <= 8'hff;
                        Green <=8'h99;
                        Blue <= 8'h00;
                    end

                    else if((diffkeyY0 == 10'd3 || diffkeyY0 == 10'd2) &&(diffkeyX0 <=10'd5 && diffkeyX0 >= 10'd1)) begin
                        Red <= 8'h33;
                        Green <=8'h11;
                        Blue <= 8'h00;
                    end

                    else begin 
                        Red <= 8'h00;
                        Green <=8'h00;
                        Blue <= 8'h00;
                    end
                end

                 else if(key1_on) begin
                    if((diffkeyY1 == 10'd7 || diffkeyY1 == 10'd6) && (diffkeyX1 >=1 && diffkeyX1 <=5)) begin
                        Red <= 8'h33;
                        Green <=8'h11;
                        Blue <= 8'h00;
                    end

                    else if((diffkeyY1 == 10'd5) && (diffkeyX1 ==10'd1 || diffkeyX1 ==10'd2 || diffkeyX1 == 10'd4 || diffkeyX1 == 10'd5)) begin
                        Red <= 8'h33;
                        Green <=8'h11;
                        Blue <= 8'h00;
                    end

                    else if((diffkeyY1 == 10'd5) && (diffkeyX1 ==10'd3)) begin
                        Red <= 8'hff;
                        Green <=8'h99;
                        Blue <= 8'h00;
                    end

                    else if((diffkeyY1 == 10'd4) && (diffkeyX1 <=10'd5 && diffkeyX1 >= 10'd1)) begin
                        Red <= 8'hff;
                        Green <=8'h99;
                        Blue <= 8'h00;
                    end

                    else if((diffkeyY1 == 10'd3 || diffkeyY1 == 10'd2) &&(diffkeyX1 <=10'd5 && diffkeyX1 >= 10'd1)) begin
                        Red <= 8'h33;
                        Green <=8'h11;
                        Blue <= 8'h00;
                    end

                    else begin 
                        Red <= 8'h00;
                        Green <=8'h00;
                        Blue <= 8'h00;
                    end
                end

                 else if(key2_on) begin
                    if((diffkeyY2 == 10'd7 || diffkeyY2 == 10'd6) && (diffkeyX2 >=1 && diffkeyX2 <=5)) begin
                        Red <= 8'h33;
                        Green <=8'h11;
                        Blue <= 8'h00;
                    end

                    else if((diffkeyY2 == 10'd5) && (diffkeyX2 ==10'd1 || diffkeyX2 ==10'd2 || diffkeyX2 == 10'd4 || diffkeyX2 == 10'd5)) begin
                        Red <= 8'h33;
                        Green <=8'h11;
                        Blue <= 8'h00;
                    end

                    else if((diffkeyY2 == 10'd5) && (diffkeyX2 ==10'd3)) begin
                        Red <= 8'hff;
                        Green <=8'h99;
                        Blue <= 8'h00;
                    end

                    else if((diffkeyY2 == 10'd4) && (diffkeyX2 <=10'd5 && diffkeyX2 >= 10'd1)) begin
                        Red <= 8'hff;
                        Green <=8'h99;
                        Blue <= 8'h00;
                    end

                    else if((diffkeyY2 == 10'd3 || diffkeyY2 == 10'd2) &&(diffkeyX2 <=10'd5 && diffkeyX2 >= 10'd1)) begin
                        Red <= 8'h33;
                        Green <=8'h11;
                        Blue <= 8'h00;
                    end

                    else begin 
                        Red <= 8'h00;
                        Green <=8'h00;
                        Blue <= 8'h00;
                    end
                end
                     
                     else if(key3_on) begin
                    if((diffkeyY3 == 10'd7 || diffkeyY3 == 10'd6) && (diffkeyX3 >=1 && diffkeyX3 <=5)) begin
                        Red <= 8'h33;
                        Green <=8'h11;
                        Blue <= 8'h00;
                    end

                    else if((diffkeyY3 == 10'd5) && (diffkeyX3 ==10'd1 || diffkeyX3 ==10'd2 || diffkeyX3 == 10'd4 || diffkeyX3 == 10'd5)) begin
                        Red <= 8'h33;
                        Green <=8'h11;
                        Blue <= 8'h00;
                    end

                    else if((diffkeyY3 == 10'd5) && (diffkeyX3 ==10'd3)) begin
                        Red <= 8'hff;
                        Green <=8'h99;
                        Blue <= 8'h00;
                    end

                    else if((diffkeyY3 == 10'd4) && (diffkeyX3 <=10'd5 && diffkeyX3 >= 10'd1)) begin
                        Red <= 8'hff;
                        Green <=8'h99;
                        Blue <= 8'h00;
                    end

                    else if((diffkeyY3 == 10'd3 || diffkeyY3 == 10'd2) &&(diffkeyX3 <=10'd5 && diffkeyX3 >= 10'd1)) begin
                        Red <= 8'h33;
                        Green <=8'h11;
                        Blue <= 8'h00;
                    end

                    else begin 
                        Red <= 8'h00;
                        Green <=8'h00;
                        Blue <= 8'h00;
                    end
                end

                else if (enemy_on3 & !over_enemy3) begin
                    font_addr[10:4] <= 7'h7f;
                        font_addr[3:0] <= DrawY%16;
                        if(font_data[flipped]==1'b1) begin
								Red <= 8'hff;
			     	     		 Green <=8'h00;
								 Blue <= 8'h00;
            					end

                            else begin 
                                Red <= 8'h00;
								Green <=8'hff;
								Blue <= 8'h00;
                                end
                end
//-----------------------------------------------------------------------------------------------------------------
// create the cell door
                else if ((keycnt < 3'd3) && DrawX<=10'd300 && DrawX >=10'd277 && DrawY<= 10'd17 && DrawY>=10'd6) begin
                    if(DrawX % 4 == 0) begin
                        Red <= 8'h70;
                        Green <=8'h77;
                        Blue <= 8'h77;
                    end
                    else begin 
                        Red <= 8'h00;
                        Green <=8'h00;
                        Blue <= 8'h00;
                    end
                end
					 
//-------------------------------------------------------------------------------------------------------------
// create moving enemies

                else if (enemy_on4 && !over_enemy4) begin
                     if((diffenemyX4 == 10'd4) && (diffenemyY4>=10'd0 && diffenemyY4 <=10'd6 && diffenemyY4 != 10'd3)) begin
                        Red <= 8'hff;
                        Green <=8'h00;
                        Blue <= 8'h00;
                end
					 
						else if((diffenemyY4 == 10'd3) && (diffenemyX4>=10'd1 && diffenemyX4 <=10'd7 && diffenemyX4 != 10'd4)) begin
								Red <= 8'hff;
                        Green <=8'h00;
                        Blue <= 8'h00;
						end
						
						else if((diffenemyX4 == 10'd3) && (diffenemyY4>=10'd1 && diffenemyY4 <=10'd5 && diffenemyY4 != 10'd3)) begin
								Red <= 8'h00;
                        Green <=8'hff;
                        Blue <= 8'h00;
						end
						
						else if((diffenemyX4 == 10'd2) && (diffenemyY4==10'd2 || diffenemyY4 ==10'd5)) begin
								Red <= 8'h00;
                        Green <=8'hff;
                        Blue <= 8'h00;
						end
						
						else if((diffenemyX4 == 10'd5) && (diffenemyY4>=10'd1 && diffenemyY4 <=10'd5 && diffenemyY4 != 10'd3)) begin
								Red <= 8'h00;
                        Green <=8'hff;
                        Blue <= 8'h00;
						end
						
						else if((diffenemyX4 == 10'd6) && (diffenemyY4==10'd2 || diffenemyY4 ==10'd5)) begin
								Red <= 8'h00;
                        Green <=8'hff;
                        Blue <= 8'h00;
						end
						
						else if((diffenemyX4 == 10'd4) && (diffenemyY4 ==10'd3)) begin
								Red <= 8'h00;
                        Green <=8'hff;
                        Blue <= 8'h00;
						end

                        else begin 
                            Red <= 8'h00;
                            Green <=8'h00;
                            Blue <= 8'h00;
                    end
                end

                else if (enemy_on5 && !over_enemy5) begin
                        if((diffenemyX5 == 10'd4) && (diffenemyY5>=10'd0 && diffenemyY5 <=10'd6 && diffenemyY5 != 10'd3)) begin
                        Red <= 8'hff;
                        Green <=8'h00;
                        Blue <= 8'h00;
                end
					 
						else if((diffenemyY5 == 10'd3) && (diffenemyX5>=10'd1 && diffenemyX5 <=10'd7 && diffenemyX4 != 10'd4)) begin
								Red <= 8'hff;
                        Green <=8'h00;
                        Blue <= 8'h00;
						end
						
						else if((diffenemyX5 == 10'd3) && (diffenemyY5>=10'd1 && diffenemyY5 <=10'd5 && diffenemyY5 != 10'd3)) begin
								Red <= 8'h00;
                        Green <=8'hff;
                        Blue <= 8'h00;
						end
						
						else if((diffenemyX5 == 10'd2) && (diffenemyY5==10'd2 || diffenemyY5 ==10'd5)) begin
								Red <= 8'h00;
                        Green <=8'hff;
                        Blue <= 8'h00;
						end
						
						else if((diffenemyX5 == 10'd5) && (diffenemyY5>=10'd1 && diffenemyY5 <=10'd5 && diffenemyY5 != 10'd3)) begin
								Red <= 8'h00;
                        Green <=8'hff;
                        Blue <= 8'h00;
						end
						
						else if((diffenemyX5 == 10'd6) && (diffenemyY5==10'd2 || diffenemyY5 ==10'd5)) begin
								Red <= 8'h00;
                        Green <=8'hff;
                        Blue <= 8'h00;
						end
						
						else if((diffenemyX5 == 10'd4) && (diffenemyY5 ==10'd3)) begin
								Red <= 8'h00;
                        Green <=8'hff;
                        Blue <= 8'h00;
						end

                        else begin 
                            Red <= 8'h00;
                            Green <=8'h00;
                            Blue <= 8'h00;
                    end
                end

                else if(enemy_on1 & !over_enemy1) begin
						if((diffenemyX1 == 10'd4) && (diffenemyY1>=10'd0 && diffenemyY1 <=10'd6 && diffenemyY1 != 10'd3)) begin
                        Red <= 8'hff;
                        Green <=8'h00;
                        Blue <= 8'h00;
                end
					 
						else if((diffenemyY1 == 10'd3) && (diffenemyX1>=10'd1 && diffenemyX1 <=10'd7 && diffenemyX1 != 10'd4)) begin
								Red <= 8'hff;
                        Green <=8'h00;
                        Blue <= 8'h00;
						end
						
						else if((diffenemyX1 == 10'd3) && (diffenemyY1>=10'd1 && diffenemyY1 <=10'd5 && diffenemyY1 != 10'd3)) begin
								Red <= 8'h00;
                        Green <=8'hff;
                        Blue <= 8'h00;
						end
						
						else if((diffenemyX1 == 10'd2) && (diffenemyY1==10'd2 || diffenemyY1 ==10'd5)) begin
								Red <= 8'h00;
                        Green <=8'hff;
                        Blue <= 8'h00;
						end
						
						else if((diffenemyX1 == 10'd5) && (diffenemyY1>=10'd1 && diffenemyY1 <=10'd5 && diffenemyY1 != 10'd3)) begin
								Red <= 8'h00;
                        Green <=8'hff;
                        Blue <= 8'h00;
						end
						
						else if((diffenemyX1 == 10'd6) && (diffenemyY1==10'd2 || diffenemyY1 ==10'd5)) begin
								Red <= 8'h00;
                        Green <=8'hff;
                        Blue <= 8'h00;
						end
						
						else if((diffenemyX1 == 10'd4) && (diffenemyY1 ==10'd3)) begin
								Red <= 8'h00;
                        Green <=8'hff;
                        Blue <= 8'h00;
						end

                        else begin 
                            Red <= 8'h00;
                            Green <=8'h00;
                            Blue <= 8'h00;
                    end
				end

                else if(enemy_on6 && !over_enemy6) begin
						if((diffenemyX6 == 10'd4) && (diffenemyY6>=10'd0 && diffenemyY6 <=10'd6 && diffenemyY6 != 10'd3)) begin
                        Red <= 8'hff;
                        Green <=8'h00;
                        Blue <= 8'h00;
                end
					 
						else if((diffenemyY6 == 10'd3) && (diffenemyX6>=10'd1 && diffenemyX6 <=10'd7 && diffenemyX6 != 10'd4)) begin
								Red <= 8'hff;
                        Green <=8'h00;
                        Blue <= 8'h00;
						end
						
						else if((diffenemyX6 == 10'd3) && (diffenemyY6>=10'd1 && diffenemyY6 <=10'd5 && diffenemyY6 != 10'd3)) begin
								Red <= 8'h00;
                        Green <=8'hff;
                        Blue <= 8'h00;
						end
						
						else if((diffenemyX6 == 10'd2) && (diffenemyY6==10'd2 || diffenemyY6 ==10'd5)) begin
								Red <= 8'h00;
                        Green <=8'hff;
                        Blue <= 8'h00;
						end
						
						else if((diffenemyX6 == 10'd5) && (diffenemyY6>=10'd1 && diffenemyY6 <=10'd5 && diffenemyY6 != 10'd3)) begin
								Red <= 8'h00;
                        Green <=8'hff;
                        Blue <= 8'h00;
						end
						
						else if((diffenemyX6 == 10'd6) && (diffenemyY6==10'd2 || diffenemyY6 ==10'd5)) begin
								Red <= 8'h00;
                        Green <=8'hff;
                        Blue <= 8'h00;
						end
						
						else if((diffenemyX6 == 10'd4) && (diffenemyY6 ==10'd3)) begin
								Red <= 8'h00;
                        Green <=8'hff;
                        Blue <= 8'h00;
						end

                        else begin 
                            Red <= 8'h00;
                            Green <=8'h00;
                            Blue <= 8'h00;
                    end
				end

                end
            end

            else if (StartEnable) begin
                                if(DrawX >= 10'd256 && DrawX < 10'd408 && DrawY >= 10'd370 && DrawY < 10'd386) begin
						font_addr[10:4] <= (x_idx - x_ref) + 7'h11;
                         font_addr[3:0] <= (DrawY - 370)%16; 
                         if(font_data[flipped]==1'b1) begin
								Red <= 8'hff;
								Green <=8'hff;
								Blue <= 8'hff;
													
                            end
                        else begin 
                                Red <= 8'h00;
								Green <=8'h00;
								Blue <= 8'h00;
						end	
					 
					end
					
                      

                      else if(DrawX >= 10'd264 && DrawX < 10'd400 && DrawY >= 10'd48 && DrawY < 64) begin
                         
                                font_addr[10:4] <= (x_idx - 10'd33) + 7'h24;
                                font_addr[3:0] <= (DrawY - 48)%16; 
                                if(font_data[flipped]==1'b1) begin
                                    Red <= 8'hcc;
                                    Green <=8'h00;
                                    Blue <= 8'h00;
													
                                end
                                else begin 
                                    Red <= 8'h00;
                                    Green <=8'h00;
                                    Blue <= 8'h00;
						    end 
                        end

                       else if(DrawX >= 10'd240 && DrawX < 10'd424 && DrawY >= 10'd72 && DrawY < 88) begin
                         
                                font_addr[10:4] <= (x_idx - 10'd30) + 7'h35;
                                font_addr[3:0] <= (DrawY - 72)%16; 
                                if(font_data[flipped]==1'b1) begin
                                    Red <= 8'h00;
                                    Green <=8'hff;
                                    Blue <= 8'hff;
													
                                end
                                else begin 
                                    Red <= 8'h00;
                                    Green <=8'h00;
                                    Blue <= 8'h00;
						    end 
                        end

                        else if(DrawX >= 10'd280 && DrawX < 10'd384 && DrawY >= 10'd96 && DrawY < 112) begin
                         
                                font_addr[10:4] <= (x_idx - 10'd35) + 7'h4c;
                                font_addr[3:0] <= (DrawY - 96)%16; 
                                if(font_data[flipped]==1'b1) begin
                                    Red <= 8'hff;
                                    Green <=8'hff;
                                    Blue <= 8'h00;
													
                                end
                                else begin 
                                    Red <= 8'h00;
                                    Green <=8'h00;
                                    Blue <= 8'h00;
						    end 
                        end


					  else begin
						if(DrawX % 25 > 0 && DrawX%25 < 7 && DrawY >= 120 && DrawY < 360) begin
							Red <= 8'h77;
							Green <=8'h77;
							Blue <= 8'h77;
						end
						else begin
							Red <= 8'h00;
							Green <=8'h00;
			  	  		  Blue <= 8'h00;
						end
					 end
            end

            else if (EndState) begin
                if(DrawX >= 296 && DrawX < 360 && DrawY >= 232 && DrawY < 248 ) begin
                    font_addr[10:4] <= (x_idx - 10'd37) + win;
                                font_addr[3:0] <= (DrawY - 232)%16; 
                                if(font_data[flipped]==1'b1) begin
                                    Red <= 8'hff;
                                    Green <=8'hff;
                                    Blue <= 8'hff;
													
                                end
                                else begin 
                                    Red <= 8'h00;
                                    Green <=8'h00;
                                    Blue <= 8'h00;
						    end  
                end
                else begin
                Red <= 8'h00;
                Green <=8'h00;
                Blue <= 8'h00;
                end
            end

//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// else for inside blank
            else begin 
                Red <= 8'h00;
                Green <=8'h00;
                Blue <= 8'h00;
            end
        end
        

// else for blank   
        else
        begin 
                Red <= 8'h00;
                Green <=8'h00;
                Blue <= 8'h00;
          end    
        end
      
      
      
      
//----------------------------------------------------------------------------------------------------------------
// torch setup

    logic torch0_on, torch1_on, torch2_on, torch3_on, load_count;
    logic [2:0] torch_count_in, torch_sum;
    int factor;
    assign factor = 30;
    int radius;

    // register reg_count (
    // .Clk (Clk),
    //     .Load(load_count),
    //     .Reset(Reset),
    //     .din(torch_count_in),
    //     .dout(torch_count_out)
    // );

    assign radius = factor + torch_sum*40;
    logic [9:0] centrex0, centrex1, centrex2, centrex3, centrex4, centrex5;
   logic [9:0] centrey0, centrey1, centrey2, centrey3, centrey4, centrey5;
    logic [9:0] diffx0, diffx1, diffx2, diffx3, diffx4, diffx5, diffy0, diffy1, diffy2, diffy3, diffy4, diffy5;
    
    logic [7:0] font_data;
    logic [10:0] font_addr;
    font_rom sprites (.addr(font_addr), .data(font_data));
    
    logic [9:0] flipped;
    assign flipped = ~(DrawX%8);

    torches torch(.DrawX(DrawX), .DrawY(DrawY), .BallX(BallX), .BallY(BallY), .*);
    
    // increment torch count
    // always_comb begin
    //  torch_count_in = 0;
    //     if((BallX >= centrex0 - 2 && BallX <= centrex0 + 2) && (BallY >= centrey0 - 2 && BallY <= centrey0 + 2) ) begin
    //         load_count = '1;
    //         torch_count_in = torch_count_in + 1;
    //     end

    //     else if((BallX >= centrex1 - 2 && BallX <= centrex1 + 2) && (BallY >= centrey1 - 2 && BallY <= centrey1 + 2) ) begin
    //         load_count = '1;
    //         torch_count_in = torch_count_in + 1;
    //     end

    //     else if ((BallX >= centrex2 - 2 && BallX <= centrex2 + 2) && (BallY >= centrey2 - 2 && BallY <= centrey2 + 2) ) begin
    //         load_count = '1;
    //         torch_count_in = torch_count_in + 1;
    //     end

    //     else if ((BallX >= centrex3 - 2 && BallX <= centrex3 + 2) && (BallY >= centrey3 - 2 && BallY <= centrey3 + 2) ) begin
    //         load_count = '1;
    //         torch_count_in = torch_count_in + 1;
    //     end
    //  else begin
    //         load_count = '0;
    //         torch_count_in = 0;
    //     end
    // end


    // logic [2:0] torchcnt;

    // always_comb begin
    //     if ()
    // end
    logic enemy_on3;
    EndGame endlogic( .DrawX(DrawX), .DrawY(DrawY),
               .ended(ended), .*);
     logic [2:0] keycnt;
    logic key0_on, key1_on, key2_on, key3_on;
    keys keys(.DrawX(DrawX), .DrawY(DrawY), .*);
    logic [9:0] diffenemyY1, diffenemyX1, EnemyS;
    logic enemy_on1, enemy_on2;
	 logic hitsum1, hitsum2;

    ditches1 enemy1(.DrawX(DrawX), .DrawY(DrawY), .Vert(1'b0), .Horiz(1'b1), .Enemy_X_Center(10'd430), .Enemy_Y_Center(10'd68),
     .enemy_on(enemy_on1), .diffenemyX(diffenemyX1), .diffenemyY(diffenemyY1), .Enemy_X(Enemy_X1), .Enemy_Y(Enemy_Y1),.*);   

    ditches2 enemy2(.DrawX(DrawX), .DrawY(DrawY), .Vert(1'b0), .Horiz(1'b1), 
  .Enemy_X_Center(10'd150), .Enemy_Y_Center(10'd200), .enemy_on(enemy_on2),
   .diffenemyX(diffenemyX2), .diffenemyY(diffenemyY2),
   .Enemy_X(Enemy_X2), .Enemy_Y(Enemy_Y2), .*);        

    ditches3 enemy3(.DrawX(DrawX), .DrawY(DrawY), .Vert(1'b0), .Horiz(1'b1), 
  .Enemy_X_Center(10'd500), .Enemy_Y_Center(10'd200), .enemy_on(enemy_on3),
   .diffenemyX(diffenemyX3), .diffenemyY(diffenemyY3),
   .Enemy_X(Enemy_X3), .Enemy_Y(Enemy_Y3), .*);     

   ditches4 enemy4(.DrawX(DrawX), .DrawY(DrawY), .Vert(1'b0), .Horiz(1'b1), 
  .Enemy_X_Center(10'd207), .Enemy_Y_Center(10'd62), .enemy_on(enemy_on4),
   .diffenemyX(diffenemyX4), .diffenemyY(diffenemyY4),
   .Enemy_X(Enemy_X4), .Enemy_Y(Enemy_Y4), .*);   

   ditches5 enemy5(.DrawX(DrawX), .DrawY(DrawY), .Vert(1'b0), .Horiz(1'b1), 
  .Enemy_X_Center(10'd168), .Enemy_Y_Center(10'd335), .enemy_on(enemy_on5),
   .diffenemyX(diffenemyX5), .diffenemyY(diffenemyY5),
   .Enemy_X(Enemy_X5), .Enemy_Y(Enemy_Y5), .*); 

      ditches6 enemy6(.DrawX(DrawX), .DrawY(DrawY), .Vert(1'b0), .Horiz(1'b1), 
  .Enemy_X_Center(10'd565), .Enemy_Y_Center(10'd410), .enemy_on(enemy_on6),
   .diffenemyX(diffenemyX6), .diffenemyY(diffenemyY6),
   .Enemy_X(Enemy_X6), .Enemy_Y(Enemy_Y6), .*); 

	 logic [9:0] Enemy_X3, Enemy_Y3, Enemy_Y4, Enemy_X4, Enemy_X5, Enemy_Y5, diffenemyX4, diffenemyY4, diffenemyX5, diffenemyY5, diffenemyX6, diffenemyY6, Enemy_X6, Enemy_Y6;
	 
	 logic torch_intro, over_enemy3, over_enemy4, enemy_on4, enemy_on5, enemy_on6;

    logic damage1, damageff1, ld_damage1, damage2, damageff2, ld_damage2, damage3, damageff3, ld_damage3, ld_damage4, ld_damage5, ld_damage6, damage5, damage6, damageff5, damageff6, damage4, damageff4, over4, over5, ld_over4, ld_over5, over_enemy5, ld_damage, over1, over2, over3, over6, over_enemy6, ld_over6, ld_over1;

    always_comb begin
        if(BallX>=Enemy_X1-4 && BallX <Enemy_X1+4 && BallY >= Enemy_Y1-4 && BallY < Enemy_Y1+4  && !over_enemy1) begin
            over1 = 1'b1;
            ld_over1 = 1'b1;
            damage1 = 1'b1;
            ld_damage1 = 1'b1;
        end
        else begin
            over1 = 1'b0;
            ld_over1 = 1'b0;
            damage1 = 1'b0;
            ld_damage1 = 1'b0;
        end
    end

    logic [2:0] hitsum;
    assign hitsum = over_enemy3 + over_enemy1 + over_enemy2 + over_enemy4 + over_enemy5 + over_enemy6;

    logic ld_over3;

    always_comb begin
        if(BallX>=Enemy_X3-4 && BallX <Enemy_X3+4 && BallY >= Enemy_Y3-4 && BallY < Enemy_Y3+4  && !over_enemy3) begin
            over3 = 1'b1;
            ld_over3 = 1'b1;
            damage3 = 1'b1;
            ld_damage3 = 1'b1;
        end
        else begin
            over3 = 1'b0;
            ld_over3 = 1'b0;
            damage3 = 1'b0;
            ld_damage3 = 1'b0;
        end
	end

    always_comb begin
        if(BallX>=Enemy_X2-4 && BallX <Enemy_X2+4 && BallY >= Enemy_Y2-4 && BallY < Enemy_Y2+4  && !over_enemy2) begin
            over2 = 1'b1;
            ld_over2 = 1'b1;
            damage2 = 1'b1;
            ld_damage2 = 1'b1;
        end
        else begin
            over2 = 1'b0;
            ld_over2 = 1'b0;
            damage2 = 1'b0;
            ld_damage2 = 1'b0;
        end
	end


always_comb begin
        if(BallX>=Enemy_X4-4 && BallX <Enemy_X4+4 && BallY >= Enemy_Y4-4 && BallY < Enemy_Y4+4  && !over_enemy4) begin
            over4 = 1'b1;
            ld_over4 = 1'b1;
            damage4 = 1'b1;
            ld_damage4 = 1'b1;
        end
        else begin
            over4 = 1'b0;
            ld_over4 = 1'b0;
            damage4 = 1'b0;
            ld_damage4 = 1'b0;
        end
	end


always_comb begin
        if(BallX>=Enemy_X5-4 && BallX <Enemy_X5+4 && BallY >= Enemy_Y5-4 && BallY < Enemy_Y5+4  && !over_enemy5) begin
            over5 = 1'b1;
            ld_over5 = 1'b1;
            damage5 = 1'b1;
            ld_damage5 = 1'b1;
        end
        else begin
            over5 = 1'b0;
            ld_over5 = 1'b0;
            damage5 = 1'b0;
            ld_damage5 = 1'b0;
        end
	end


always_comb begin
        if(BallX>=Enemy_X6-4 && BallX <Enemy_X6+4 && BallY >= Enemy_Y6-4 && BallY < Enemy_Y6+4  && !over_enemy6) begin
            over6 = 1'b1;
            ld_over6 = 1'b1;
            damage6 = 1'b1;
            ld_damage6 = 1'b1;
        end
        else begin
            over6 = 1'b0;
            ld_over6 = 1'b0;
            damage6 = 1'b0;
            ld_damage6 = 1'b0;
        end
	end



    logic over_enemy1;
    flipflop ffdamage1(.Clk(Clk),
        .Load(ld_damage1),
        .Reset(Reset),
	    .din(damage1),
	    .dout(damageff1));

    flipflop ffdamage3(.Clk(Clk),
        .Load(ld_damage3),
        .Reset(Reset),
	    .din(damage3),
	    .dout(damageff3));

    flipflop ffover1(.Clk(Clk),
        .Load(ld_over1),
        .Reset(Reset),
	    .din(over1),
	    .dout(over_enemy1));

    
    flipflop ffover3(.Clk(Clk),
        .Load(ld_over3),
        .Reset(Reset),
	    .din(over3),
	    .dout(over_enemy3));

    flipflop ffover2(.Clk(Clk),
        .Load(ld_over2),
        .Reset(Reset),
	    .din(over2),
	    .dout(over_enemy2));

    
    flipflop ffover4(.Clk(Clk),
        .Load(ld_over4),
        .Reset(Reset),
	    .din(over4),
	    .dout(over_enemy4));

flipflop ffover5(.Clk(Clk),
        .Load(ld_over5),
        .Reset(Reset),
	    .din(over5),
	    .dout(over_enemy5));

    
    flipflop ffover6(.Clk(Clk),
        .Load(ld_over6),
        .Reset(Reset),
	    .din(over6),
	    .dout(over_enemy6));

//     flipflop ffdamage3(.Clk(Clk),
//         .Load(ld_damage3),
//         .Reset(Reset),
// 	    .din(damage3),
// 	    .dout(damageff3));

// flipflop ffdamage4(.Clk(Clk),
//         .Load(ld_damage4),
//         .Reset(Reset),
// 	    .din(damage4),
// 	    .dout(damageff4));





endmodule


module register
(   input logic Clk, Load, Reset,
    input logic [2: 0] din, 
    output logic [2:0] dout
);                          
        
    always_ff @ (posedge Clk )
    begin   
        if (Reset)              
            dout <= '0;
        else if (Load)          
            dout <= din;    
end
endmodule


module EndGame(input logic [9:0] BallX, BallY, DrawX, DrawY,
                    input logic [2:0] keycnt, hitsum,

               output logic ended);
    
    always_comb begin
        if (keycnt == 3'd3) begin
            if(BallX<=10'd300 && BallX >=10'd277 && BallY<= 10'd20 && BallY>=10'd6 ) begin
                ended = 1'b1;
				end
				else begin
				ended = 1'b0;
				end
        end
        else if (hitsum>=3) begin
            ended = 1'b1;
        end
        else begin
            ended = 1'b0;
          end
    end

endmodule