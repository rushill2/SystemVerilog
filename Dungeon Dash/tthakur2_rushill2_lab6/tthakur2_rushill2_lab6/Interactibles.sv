// torches and ditches.

// torches increase the player 

module torches(input logic [9:0] DrawX, DrawY, BallX, BallY,
                input logic Clk, Reset, 
               output logic torch0_on, torch1_on, torch2_on, torch3_on, 
               output logic [9:0] diffx0, diffx1, diffx2, diffx3, diffx4, diffx5, 
               output logic [9:0] diffy0, diffy1, diffy2, diffy3, diffy4, diffy5, 
					output logic [9:0] centrex0, centrex1, centrex2, centrex3, centrex4, centrex5, centrey0, centrey1, centrey2, centrey3, centrey4, centrey5,
                    output logic [2:0] torch_sum
);

    logic torch0_used, torch1_used, torch2_used, torch3_used;

    assign diffx0 = DrawX - centrex0 + 4;
    assign diffx1 = DrawX - centrex1 + 4;
    assign diffx2 = DrawX - centrex2 + 4;
    assign diffx3 = DrawX - centrex3 + 4;

    assign diffy0 = DrawY - centrey0 + 4;
    assign diffy1 = DrawY - centrey1 + 4;
    assign diffy2 = DrawY - centrey2 + 4;
    assign diffy3 = DrawY - centrey3 + 4;



    // setting centre points for all torches so that they can be drawn 

    assign centrex0 = 10'd126;
    assign centrex1 = 10'd390;
    assign centrex2 = 10'd78;
    assign centrex3 = 10'd296;


    assign centrey0 = 10'd47;
    assign centrey1 = 10'd74;
    assign centrey2 = 10'd405;
    assign centrey3 = 10'd222;




    // setting torch on for the color mapper
    always_comb begin
        if((DrawX >= centrex0 - 4 && DrawX <= centrex0 + 4) && (DrawY >= centrey0 - 4 && DrawY <= centrey0 + 4) && (!used0)) begin
            torch0_on = 1'b1;
             torch1_on = 1'b0;
              torch2_on = 1'b0;
               torch3_on = 1'b0;
        end

        else if ((DrawX >= centrex1 - 4 && DrawX <= centrex1 + 4) && (DrawY >= centrey1 - 4 && DrawY <= centrey1 + 4)&& (!used1)) begin
             torch0_on = 1'b0;
             torch1_on = 1'b1;
              torch2_on = 1'b0;
               torch3_on = 1'b0;
        end

        else if ((DrawX >= centrex2 - 4 && DrawX <= centrex2 + 4) && (DrawY >= centrey2 - 4 && DrawY <= centrey2 + 4)&& (!used2)) begin
             torch0_on = 1'b0;
             torch1_on = 1'b0;
              torch2_on = 1'b1;
               torch3_on = 1'b0;
        end

        else if ((DrawX >= centrex3 - 4 && DrawX <= centrex3 + 4) && (DrawY >= centrey3 - 4 && DrawY <= centrey3 + 4)&& (!used3)) begin
             torch0_on = 1'b0;
             torch1_on = 1'b0;
              torch2_on = 1'b0;
               torch3_on = 1'b1;
        end

        else begin
             torch0_on = 1'b0;
             torch1_on = 1'b0;
              torch2_on = 1'b0;
               torch3_on = 1'b0;
        end
    end

    logic [2:0] torch_count_in;
    logic load_count;
    // check if player overlap
    always_comb begin
	 
//	 torch_count_in = 1'b0;
	 load_count = 1'b0;
    torch0_used = 1'b0;
    torch1_used = 1'b0;
    torch2_used = 1'b0;
    torch3_used = 1'b0;
	 ld_torch0 = 1'b0;
	 ld_torch1 = 1'b0;
	 ld_torch2 = 1'b0;
	 holder_ld = 1'b0;
	 ld_torch3 = 1'b0;
	 

	 
        if((BallX >= centrex0 - 2 && BallX <= centrex0 + 2) && (BallY >= centrey0 - 2 && BallY <= centrey0 + 2) ) begin
            torch0_used = 1'b1;
            load_count = '1;
				ld_torch0 = '1;
//				if(holder_out > 3'd3 || holder_out < 3'd0) begin
//					 torch_count_in = holder_out + '1;
//				end
            holder_ld = 1'b1;
        end

        else if((BallX >= centrex1 - 2 && BallX <= centrex1 + 2) && (BallY >= centrey1 - 2 && BallY <= centrey1 + 2) ) begin
            torch1_used = 1'b1;
            load_count = '1;
				ld_torch1 = '1;
                            holder_ld = 1'b1;

//            torch_count_in = holder_out + '1;
        end

        else if ((BallX >= centrex2 - 2 && BallX <= centrex2 + 2) && (BallY >= centrey2 - 2 && BallY <= centrey2 + 2) ) begin
            torch2_used = 1'b1;
            load_count = '1;
				ld_torch2 = '1;
                            holder_ld = 1'b1;

//            if(holder_out > 3'd3 || holder_out < 3'd0) begin
//					 torch_count_in = holder_out + '1;
//				end
        end

        else if ((BallX >= centrex3 - 2 && BallX <= centrex3 + 2) && (BallY >= centrey3 - 2 && BallY <= centrey3 + 2) ) begin
            torch3_used = 1'b1;
            load_count = '1;
                        holder_ld = 1'b1;

				ld_torch3 = '1;
//            if(holder_out > 3'd3 || holder_out < 3'd0) begin
//					 torch_count_in = holder_out + '1;
//				end
        end
		  
		  else begin
				 torch0_used = torch0_used;
				 torch1_used = torch1_used;
				 torch2_used = torch2_used;
				 torch3_used = torch3_used;
				 ld_torch0 = 1'b0;
				 ld_torch1 = 1'b0;
				 ld_torch2 = 1'b0;
				 ld_torch3 = 1'b0;
                 holder_ld = 1'b0;

		  end
    end
		
	logic used0, used1, used2, used3;
	logic ld_torch0, ld_torch1, ld_torch2, ld_torch3;
	
	flipflop ff0(.Clk(Clk),
        .Load(ld_torch0),
        .Reset(Reset),
	    .din(torch0_used),
	    .dout(used0));	
		 
	flipflop ff1(.Clk(Clk),
        .Load(ld_torch1),
        .Reset(Reset),
	    .din(torch1_used),
	    .dout(used1));
		 
	flipflop ff2(.Clk(Clk),
        .Load(ld_torch2),
        .Reset(Reset),
	    .din(torch2_used),
	    .dout(used2));
		 
	flipflop ff3(.Clk(Clk),
        .Load(ld_torch3),
        .Reset(Reset),
	    .din(torch3_used),
	    .dout(used3));
		
    register reg_count (
        .Clk(Clk),
        .Load(load_count),
        .Reset(Reset),
	    .din(torch_count_in),
	    .dout(torch_count_out)
    );

    logic holder_ld;
    logic [2:0] holder_out;
//    register holder (
//        .Clk(Clk),
//        .Load(holder_ld),
//        .Reset(Reset),
//	    .din(torch_count_out),
//	    .dout(holder_out)
//        );
		  
	logic [2:0] torch_sum_;
	assign torch_sum_ = used0 + used1+ used2+ used3;
assign torch_sum = torch_sum_;
//	always_comb begin
//		if(used0)
//			
//	end

endmodule



module flipflop
(	input logic Clk, Load, Reset,
	input logic din,
	output logic dout
);							
		
	always_ff @ (posedge Clk )
	begin	
		if (Reset)				
			dout <= '0;
		else if (Load)			
			dout <= din;
		else
			dout <= dout;
end
endmodule



// keys that appear as chests on screen
module keys(input logic [9:0] DrawX, DrawY, BallX, BallY,
                input logic Clk, Reset, 
            output logic key1_on, key2_on, key0_on, key3_on,
				output logic [2:0] keycnt,
            output logic [9:0] diffkeyY0, diffkeyX0, diffkeyY1, diffkeyX1, diffkeyY2, diffkeyX2, diffkeyY3, diffkeyX3);

            logic [9:0] middlex0, middley0, middlex1, middley1, middlex3, middley3;
            assign middlex0 = 10'd163;
            assign middley0 = 10'd60;
            assign middlex1 = 10'd559;
            assign middley1 = 10'd59;
            assign middlex2 = 10'd31;
            assign middley2 = 10'd17;
			assign middlex3 = 10'd561;
            assign middley3 = 10'd447;
            assign diffkeyX0 = DrawX - middlex0 + 4;
            assign diffkeyY0 = DrawY - middley0 + 4;
            assign diffkeyX1 = DrawX - middlex1 + 4;
            assign diffkeyY1 = DrawY - middley1 + 4;
            assign diffkeyX2 = DrawX - middlex2 + 4;
            assign diffkeyY2 = DrawY - middley2 + 4;
				assign diffkeyX3 = DrawX - middlex3 + 4;
            assign diffkeyY3 = DrawY - middley3 + 4;
				
				//default logic for position of chest
            always_comb begin
                if((DrawX >= middlex0 - 4 && DrawX <= middlex0 + 4) && (DrawY >= middley0 - 4 && DrawY <= middley0 + 4) && (!usedkey0))
                    key0_on = 1'b1;
                else 
                    key0_on = 1'b0;
            end

            always_comb begin
                if((DrawX >= middlex1 - 4 && DrawX <= middlex1 + 4) && (DrawY >= middley1 - 4 && DrawY <= middley1 + 4) && (!usedkey1))
                    key1_on = 1'b1;
                else 
                    key1_on = 1'b0;
            end

            always_comb begin
                if((DrawX >= middlex2 - 4 && DrawX <= middlex2 + 4) && (DrawY >= middley2 - 4 && DrawY <= middley2 + 4) && (!usedkey2))
                    key2_on = 1'b1;
                else 
                    key2_on = 1'b0;
            end
				
				always_comb begin
                if((DrawX >= middlex3 - 4 && DrawX <= middlex3 + 4) && (DrawY >= middley3 - 4 && DrawY <= middley3 + 4) && (!usedkey3))
                    key3_on = 1'b1;
                else 
                    key3_on = 1'b0;
            end

    logic key_used0, key_used1, key_used2, ld_key0, ld_key1, ld_key2, ld_key3, key_used3;
    // determines whether chest used or not, using latches.
    always_comb begin
			 key_used1 = 1'b0;
          ld_key1 = 1'b0;
			 key_used0 = 1'b0;
          ld_key0 = 1'b0;
			 key_used2 = 1'b0;
          ld_key2 = 1'b0;
			 key_used3 = 1'b0;
          ld_key3 = 1'b0;
			 
        if((BallX >= middlex0 - 2 && BallX <= middlex0 + 2) && (BallY >= middley0 - 2 && BallY <= middley0 + 2) ) begin
            key_used0 = 1'b1;
            ld_key0 = 1'b1;
        end
		  
		  else if((BallX >= middlex1 - 2 && BallX <= middlex1 + 2) && (BallY >= middley1 - 2 && BallY <= middley1 + 2) ) begin
            key_used1 = 1'b1;
            ld_key1 = 1'b1;
        end
		  
		  else if((BallX >= middlex2 - 2 && BallX <= middlex2 + 2) && (BallY >= middley2 - 2 && BallY <= middley2 + 2) ) begin
            key_used2 = 1'b1;
            ld_key2 = 1'b1;
        end
		  
		  else if((BallX >= middlex3 - 2 && BallX <= middlex3 + 2) && (BallY >= middley3 - 2 && BallY <= middley3 + 2) ) begin
            key_used3 = 1'b1;
            ld_key3 = 1'b1;
        end
		  
		  else begin
			 key_used1 = 1'b0;
          ld_key1 = 1'b0;
			 key_used0 = 1'b0;
          ld_key0 = 1'b0;
			 key_used2 = 1'b0;
          ld_key2 = 1'b0;
			 key_used3 = 1'b0;
          ld_key3 = 1'b0;
		  end
    end

    logic usedkey0, usedkey1, usedkey2, usedkey3;
    assign keycnt = usedkey0 + usedkey1 + usedkey2 + usedkey3;
	 
	 // latched chest used value
    flipflop ffkey0(.Clk(Clk),
        .Load(ld_key0),
        .Reset(Reset),
	    .din(key_used0),
	    .dout(usedkey0));
		 
	flipflop ffkey1(.Clk(Clk),
        .Load(ld_key1),
        .Reset(Reset),
	    .din(key_used1),
	    .dout(usedkey1));
		 
	flipflop ffkey2(.Clk(Clk),
        .Load(ld_key2),
        .Reset(Reset),
	    .din(key_used2),
	    .dout(usedkey2));
		 
		flipflop ffkey3(.Clk(Clk),
        .Load(ld_key3),
        .Reset(Reset),
	    .din(key_used3),
	    .dout(usedkey3));

endmodule




//--------------------------------------------------------------------------------------------------------------


module ditches1 (input logic [9:0] Enemy_X_Center, Enemy_Y_Center, Vert, Horiz, DrawX, DrawY, BallX, BallY,
                 input Reset, frame_clk,
                 output logic [9:0] Enemy_X, Enemy_Y, EnemyS, diffenemyX, diffenemyY,
                 output enemy_on);


    parameter [9:0] Enemy_X_Min=0;       // Leftmost point on the X axis
    parameter [9:0] Enemy_X_Max=639;     // Rightmost point on the X axis
    parameter [9:0] Enemy_Y_Min=0;       // Topmost point on the Y axis
    parameter [9:0] Enemy_Y_Max=479;     // Bottommost point on the Y axis
    parameter [9:0] Enemy_X_Step=1;      // Step size on the X axis
    parameter [9:0] Enemy_Y_Step=1;      // Step size on the Y axis
    assign diffenemyX = DrawX - Enemy_X + 4;
    assign diffenemyY = DrawY - Enemy_Y + 4;
	 

    logic [9:0] Enemy_X_Pos, Enemy_X_Motion, Enemy_Y_Pos, Enemy_Y_Motion, Enemy_Size;
	 assign Enemy_Size = 10'd4;

    always_comb begin
        if((DrawX >= Enemy_X_Pos - 4 && DrawX <= Enemy_X_Pos + 4) && (DrawY >= Enemy_Y_Pos - 4 && DrawY <= Enemy_Y_Pos + 4))
            enemy_on = 1'b1;
        else 
            enemy_on = 1'b0;
            end

	always_ff @ (posedge Reset or posedge frame_clk )
    begin: Move_Enemy
        if (Reset)  // Asynchronous Reset
        begin 
            Enemy_Y_Motion <= Vert; //Enemy_Y_Step;
				Enemy_X_Motion <= Horiz; //Enemy_X_Step;
				Enemy_Y_Pos <= Enemy_Y_Center;
				Enemy_X_Pos <= Enemy_X_Center;
        end

        else 
        begin 
				 if((wall_left)) begin
						Enemy_X_Motion <= 1;
						Enemy_Y_Motion <= 0;
				 end
				 
				 else if (wall_right) begin
						Enemy_X_Motion <= -1;
						Enemy_Y_Motion <= 0;
				 end
				 
				 else if (wall_up) begin
						Enemy_X_Motion <= 0;
						Enemy_Y_Motion <= -1;
				 end
				 
				 else if (wall_down) begin
						Enemy_X_Motion <= 0;
						Enemy_Y_Motion <= 1;
				 end
				 else begin
					  Enemy_Y_Motion <= Enemy_Y_Motion;  // Ball is somewhere in the middle, don't bounce, just keep moving
					  Enemy_X_Motion <= Enemy_X_Motion;
				end

             Enemy_Y_Pos <= (Enemy_Y_Pos + Enemy_Y_Motion);  // Update ball position
				 Enemy_X_Pos <= (Enemy_X_Pos + Enemy_X_Motion);
			
			end
		end
    
	

	
	assign hitsum = hit1flop;
	
	logic ld_hit1, ld_hit2, ld_hit3, ld_hit4, hit1flop, hit2flop, hit3flop, hit4flop;
	logic wall_right, wall_left, wall_up, wall_down;
	mazewalls UpperXRangeEnem(.DrawX(Enemy_X_Pos+Enemy_Size), .DrawY(Enemy_Y_Pos), .is_wall(wall_right));
	mazewalls LowerXRangeEnem(.DrawX(Enemy_X_Pos-Enemy_Size), .DrawY(Enemy_Y_Pos), .is_wall(wall_left));
	mazewalls LowerYRangeEnem(.DrawX(Enemy_X_Pos),.DrawY(Enemy_Y_Pos+Enemy_Size),.is_wall(wall_down));
	mazewalls UpperYRangeEnem(.DrawX(Enemy_X_Pos),.DrawY(Enemy_Y_Pos-Enemy_Size),.is_wall(wall_up));
	
	flipflop ffhit1(.Clk(Clk),
        .Load(ld_hit1),
        .Reset(Reset),
	    .din(hit1),
	    .dout(hit1flop));
		 
	flipflop ffhit2(.Clk(Clk),
        .Load(ld_hit2),
        .Reset(Reset),
	    .din(hit2),
	    .dout(hit2flop));
		 
	flipflop ffhit3(.Clk(Clk),
        .Load(ld_hit3),
        .Reset(Reset),
	    .din(hit3),
	    .dout(hit3flop));
	flipflop ffhit4(.Clk(Clk),
        .Load(ld_hit4),
        .Reset(Reset),
	    .din(hit4),
	    .dout(hit4flop));
	
	assign Enemy_X = Enemy_X_Pos;
	assign Enemy_Y = Enemy_Y_Pos;
	

		
endmodule


module ditches2 (input logic [9:0] Enemy_X_Center, Enemy_Y_Center, Vert, Horiz, DrawX, DrawY, BallX, BallY,
                 input Reset, frame_clk,
                 output logic [9:0] Enemy_X, Enemy_Y, EnemyS, diffenemyX, diffenemyY,
                 output enemy_on);


    parameter [9:0] Enemy_X_Min=0;       // Leftmost point on the X axis
    parameter [9:0] Enemy_X_Max=639;     // Rightmost point on the X axis
    parameter [9:0] Enemy_Y_Min=0;       // Topmost point on the Y axis
    parameter [9:0] Enemy_Y_Max=479;     // Bottommost point on the Y axis
    parameter [9:0] Enemy_X_Step=1;      // Step size on the X axis
    parameter [9:0] Enemy_Y_Step=1;      // Step size on the Y axis
    assign diffenemyX = DrawX - Enemy_X + 4;
    assign diffenemyY = DrawY - Enemy_Y + 4;
	 

    logic [9:0] Enemy_X_Pos, Enemy_X_Motion, Enemy_Y_Pos, Enemy_Y_Motion, Enemy_Size;
	 assign Enemy_Size = 10'd4;

    always_comb begin
        if((DrawX >= Enemy_X_Pos - 4 && DrawX <= Enemy_X_Pos + 4) && (DrawY >= Enemy_Y_Pos - 4 && DrawY <= Enemy_Y_Pos + 4))
            enemy_on = 1'b1;
        else 
            enemy_on = 1'b0;
            end

	always_ff @ (posedge Reset or posedge frame_clk )
    begin: Move_Enemy
        if (Reset)  // Asynchronous Reset
        begin 
            Enemy_Y_Motion <= Vert; //Enemy_Y_Step;
				Enemy_X_Motion <= Horiz; //Enemy_X_Step;
				Enemy_Y_Pos <= Enemy_Y_Center;
				Enemy_X_Pos <= Enemy_X_Center;
        end

        else 
        begin 
				 if((wall_left)) begin
						Enemy_X_Motion <= 1;
						Enemy_Y_Motion <= 0;
				 end
				 
				 else if (wall_right) begin
						Enemy_X_Motion <= -1;
						Enemy_Y_Motion <= 0;
				 end
				 
				 else if (wall_up) begin
						Enemy_X_Motion <= 0;
						Enemy_Y_Motion <= -1;
				 end
				 
				 else if (wall_down) begin
						Enemy_X_Motion <= 0;
						Enemy_Y_Motion <= 1;
				 end
				 else begin
					  Enemy_Y_Motion <= Enemy_Y_Motion;  // Ball is somewhere in the middle, don't bounce, just keep moving
					  Enemy_X_Motion <= Enemy_X_Motion;
				end

             Enemy_Y_Pos <= (Enemy_Y_Pos + Enemy_Y_Motion);  // Update ball position
				 Enemy_X_Pos <= (Enemy_X_Pos + Enemy_X_Motion);
			
			end
		end
    
	

	

	
	assign hitsum = hit1flop;
	
	logic ld_hit1, ld_hit2, ld_hit3, ld_hit4, hit1flop, hit2flop, hit3flop, hit4flop;
	logic wall_right, wall_left, wall_up, wall_down;
	mazewalls UpperXRangeEnem(.DrawX(Enemy_X_Pos+Enemy_Size), .DrawY(Enemy_Y_Pos), .is_wall(wall_right));
	mazewalls LowerXRangeEnem(.DrawX(Enemy_X_Pos-Enemy_Size), .DrawY(Enemy_Y_Pos), .is_wall(wall_left));
	mazewalls LowerYRangeEnem(.DrawX(Enemy_X_Pos),.DrawY(Enemy_Y_Pos+Enemy_Size),.is_wall(wall_down));
	mazewalls UpperYRangeEnem(.DrawX(Enemy_X_Pos),.DrawY(Enemy_Y_Pos-Enemy_Size),.is_wall(wall_up));
	
	flipflop ffhit1(.Clk(Clk),
        .Load(ld_hit1),
        .Reset(Reset),
	    .din(hit1),
	    .dout(hit1flop));
		 
	flipflop ffhit2(.Clk(Clk),
        .Load(ld_hit2),
        .Reset(Reset),
	    .din(hit2),
	    .dout(hit2flop));
		 
	flipflop ffhit3(.Clk(Clk),
        .Load(ld_hit3),
        .Reset(Reset),
	    .din(hit3),
	    .dout(hit3flop));
	flipflop ffhit4(.Clk(Clk),
        .Load(ld_hit4),
        .Reset(Reset),
	    .din(hit4),
	    .dout(hit4flop));
	
	assign Enemy_X = Enemy_X_Pos;
	assign Enemy_Y = Enemy_Y_Pos;
	

		
endmodule

module ditches3 (input logic [9:0] Enemy_X_Center, Enemy_Y_Center, Vert, Horiz, DrawX, DrawY, BallX, BallY,
                 input Reset, frame_clk,
                 output logic [9:0] Enemy_X, Enemy_Y, EnemyS, diffenemyX, diffenemyY,
                 output enemy_on);


    parameter [9:0] Enemy_X_Min=0;       // Leftmost point on the X axis
    parameter [9:0] Enemy_X_Max=639;     // Rightmost point on the X axis
    parameter [9:0] Enemy_Y_Min=0;       // Topmost point on the Y axis
    parameter [9:0] Enemy_Y_Max=479;     // Bottommost point on the Y axis
    parameter [9:0] Enemy_X_Step=1;      // Step size on the X axis
    parameter [9:0] Enemy_Y_Step=1;      // Step size on the Y axis
    assign diffenemyX = DrawX - Enemy_X + 4;
    assign diffenemyY = DrawY - Enemy_Y + 4;
	 

    logic [9:0] Enemy_X_Pos, Enemy_X_Motion, Enemy_Y_Pos, Enemy_Y_Motion, Enemy_Size;
	 assign Enemy_Size = 10'd4;

    always_comb begin
        if((DrawX >= Enemy_X_Pos - 4 && DrawX <= Enemy_X_Pos + 4) && (DrawY >= Enemy_Y_Pos - 4 && DrawY <= Enemy_Y_Pos + 4))
            enemy_on = 1'b1;
        else 
            enemy_on = 1'b0;
            end

	always_ff @ (posedge Reset or posedge frame_clk )
    begin: Move_Enemy
        if (Reset)  // Asynchronous Reset
        begin 
            Enemy_Y_Motion <= Vert; //Enemy_Y_Step;
				Enemy_X_Motion <= Horiz; //Enemy_X_Step;
				Enemy_Y_Pos <= Enemy_Y_Center;
				Enemy_X_Pos <= Enemy_X_Center;
        end

        else 
        begin 
				 if((wall_left)) begin
						Enemy_X_Motion <= 1;
						Enemy_Y_Motion <= 0;
				 end
				 
				 else if (wall_right) begin
						Enemy_X_Motion <= -1;
						Enemy_Y_Motion <= 0;
				 end
				 
				 else if (wall_up) begin
						Enemy_X_Motion <= 0;
						Enemy_Y_Motion <= -1;
				 end
				 
				 else if (wall_down) begin
						Enemy_X_Motion <= 0;
						Enemy_Y_Motion <= 1;
				 end
				 else begin
					  Enemy_Y_Motion <= Enemy_Y_Motion;  // Ball is somewhere in the middle, don't bounce, just keep moving
					  Enemy_X_Motion <= Enemy_X_Motion;
				end

             Enemy_Y_Pos <= (Enemy_Y_Pos + Enemy_Y_Motion);  // Update ball position
				 Enemy_X_Pos <= (Enemy_X_Pos + Enemy_X_Motion);
			
			end
		end
    
	

	
	assign hitsum = hit1flop;
	
	logic ld_hit1, ld_hit2, ld_hit3, ld_hit4, hit1flop, hit2flop, hit3flop, hit4flop;
	logic wall_right, wall_left, wall_up, wall_down;
	mazewalls UpperXRangeEnem(.DrawX(Enemy_X_Pos+Enemy_Size), .DrawY(Enemy_Y_Pos), .is_wall(wall_right));
	mazewalls LowerXRangeEnem(.DrawX(Enemy_X_Pos-Enemy_Size), .DrawY(Enemy_Y_Pos), .is_wall(wall_left));
	mazewalls LowerYRangeEnem(.DrawX(Enemy_X_Pos),.DrawY(Enemy_Y_Pos+Enemy_Size),.is_wall(wall_down));
	mazewalls UpperYRangeEnem(.DrawX(Enemy_X_Pos),.DrawY(Enemy_Y_Pos-Enemy_Size),.is_wall(wall_up));
	
	flipflop ffhit1(.Clk(Clk),
        .Load(ld_hit1),
        .Reset(Reset),
	    .din(hit1),
	    .dout(hit1flop));
		 
	flipflop ffhit2(.Clk(Clk),
        .Load(ld_hit2),
        .Reset(Reset),
	    .din(hit2),
	    .dout(hit2flop));
		 
	flipflop ffhit3(.Clk(Clk),
        .Load(ld_hit3),
        .Reset(Reset),
	    .din(hit3),
	    .dout(hit3flop));
	flipflop ffhit4(.Clk(Clk),
        .Load(ld_hit4),
        .Reset(Reset),
	    .din(hit4),
	    .dout(hit4flop));
	
	assign Enemy_X = Enemy_X_Pos;
	assign Enemy_Y = Enemy_Y_Pos;
	

		
endmodule



module ditches4 (input logic [9:0] Enemy_X_Center, Enemy_Y_Center, Vert, Horiz, DrawX, DrawY, BallX, BallY,
                 input Reset, frame_clk,
                 output logic [9:0] Enemy_X, Enemy_Y, EnemyS, diffenemyX, diffenemyY,
                 output enemy_on);


    parameter [9:0] Enemy_X_Min=0;       // Leftmost point on the X axis
    parameter [9:0] Enemy_X_Max=639;     // Rightmost point on the X axis
    parameter [9:0] Enemy_Y_Min=0;       // Topmost point on the Y axis
    parameter [9:0] Enemy_Y_Max=479;     // Bottommost point on the Y axis
    parameter [9:0] Enemy_X_Step=1;      // Step size on the X axis
    parameter [9:0] Enemy_Y_Step=1;      // Step size on the Y axis
    assign diffenemyX = DrawX - Enemy_X + 4;
    assign diffenemyY = DrawY - Enemy_Y + 4;
	 

    logic [9:0] Enemy_X_Pos, Enemy_X_Motion, Enemy_Y_Pos, Enemy_Y_Motion, Enemy_Size;
	 assign Enemy_Size = 10'd4;

    always_comb begin
        if((DrawX >= Enemy_X_Pos - 4 && DrawX <= Enemy_X_Pos + 4) && (DrawY >= Enemy_Y_Pos - 4 && DrawY <= Enemy_Y_Pos + 4))
            enemy_on = 1'b1;
        else 
            enemy_on = 1'b0;
            end

	always_ff @ (posedge Reset or posedge frame_clk )
    begin: Move_Enemy
        if (Reset)  // Asynchronous Reset
        begin 
            Enemy_Y_Motion <= Vert; //Enemy_Y_Step;
				Enemy_X_Motion <= Horiz; //Enemy_X_Step;
				Enemy_Y_Pos <= Enemy_Y_Center;
				Enemy_X_Pos <= Enemy_X_Center;
        end

        else 
        begin 
				 if((wall_left)) begin
						Enemy_X_Motion <= 1;
						Enemy_Y_Motion <= 0;
				 end
				 
				 else if (wall_right) begin
						Enemy_X_Motion <= -1;
						Enemy_Y_Motion <= 0;
				 end
				 
				 else if (wall_up) begin
						Enemy_X_Motion <= 0;
						Enemy_Y_Motion <= -1;
				 end
				 
				 else if (wall_down) begin
						Enemy_X_Motion <= 0;
						Enemy_Y_Motion <= 1;
				 end
				 else begin
					  Enemy_Y_Motion <= Enemy_Y_Motion;  // Ball is somewhere in the middle, don't bounce, just keep moving
					  Enemy_X_Motion <= Enemy_X_Motion;
				end

             Enemy_Y_Pos <= (Enemy_Y_Pos + Enemy_Y_Motion);  // Update ball position
				 Enemy_X_Pos <= (Enemy_X_Pos + Enemy_X_Motion);
			
			end
		end
    
	

    
	

	
	assign hitsum = hit1flop;
	
	logic ld_hit1, ld_hit2, ld_hit3, ld_hit4, hit1flop, hit2flop, hit3flop, hit4flop;
	logic wall_right, wall_left, wall_up, wall_down;
	mazewalls UpperXRangeEnem(.DrawX(Enemy_X_Pos+Enemy_Size), .DrawY(Enemy_Y_Pos), .is_wall(wall_right));
	mazewalls LowerXRangeEnem(.DrawX(Enemy_X_Pos-Enemy_Size), .DrawY(Enemy_Y_Pos), .is_wall(wall_left));
	mazewalls LowerYRangeEnem(.DrawX(Enemy_X_Pos),.DrawY(Enemy_Y_Pos+Enemy_Size),.is_wall(wall_down));
	mazewalls UpperYRangeEnem(.DrawX(Enemy_X_Pos),.DrawY(Enemy_Y_Pos-Enemy_Size),.is_wall(wall_up));
	
	flipflop ffhit1(.Clk(Clk),
        .Load(ld_hit1),
        .Reset(Reset),
	    .din(hit1),
	    .dout(hit1flop));
		 
	flipflop ffhit2(.Clk(Clk),
        .Load(ld_hit2),
        .Reset(Reset),
	    .din(hit2),
	    .dout(hit2flop));
		 
	flipflop ffhit3(.Clk(Clk),
        .Load(ld_hit3),
        .Reset(Reset),
	    .din(hit3),
	    .dout(hit3flop));
	flipflop ffhit4(.Clk(Clk),
        .Load(ld_hit4),
        .Reset(Reset),
	    .din(hit4),
	    .dout(hit4flop));
	
	assign Enemy_X = Enemy_X_Pos;
	assign Enemy_Y = Enemy_Y_Pos;
	

		
endmodule

module ditches5 (input logic [9:0] Enemy_X_Center, Enemy_Y_Center, Vert, Horiz, DrawX, DrawY, BallX, BallY,
                 input Reset, frame_clk,
                 output logic [9:0] Enemy_X, Enemy_Y, EnemyS, diffenemyX, diffenemyY,
                 output enemy_on);


    parameter [9:0] Enemy_X_Min=0;       // Leftmost point on the X axis
    parameter [9:0] Enemy_X_Max=639;     // Rightmost point on the X axis
    parameter [9:0] Enemy_Y_Min=0;       // Topmost point on the Y axis
    parameter [9:0] Enemy_Y_Max=479;     // Bottommost point on the Y axis
    parameter [9:0] Enemy_X_Step=1;      // Step size on the X axis
    parameter [9:0] Enemy_Y_Step=1;      // Step size on the Y axis
    assign diffenemyX = DrawX - Enemy_X + 4;
    assign diffenemyY = DrawY - Enemy_Y + 4;
	 

    logic [9:0] Enemy_X_Pos, Enemy_X_Motion, Enemy_Y_Pos, Enemy_Y_Motion, Enemy_Size;
	 assign Enemy_Size = 10'd4;

    always_comb begin
        if((DrawX >= Enemy_X_Pos - 4 && DrawX <= Enemy_X_Pos + 4) && (DrawY >= Enemy_Y_Pos - 4 && DrawY <= Enemy_Y_Pos + 4))
            enemy_on = 1'b1;
        else 
            enemy_on = 1'b0;
            end

	always_ff @ (posedge Reset or posedge frame_clk )
    begin: Move_Enemy
        if (Reset)  // Asynchronous Reset
        begin 
            Enemy_Y_Motion <= Vert; //Enemy_Y_Step;
				Enemy_X_Motion <= Horiz; //Enemy_X_Step;
				Enemy_Y_Pos <= Enemy_Y_Center;
				Enemy_X_Pos <= Enemy_X_Center;
        end

        else 
        begin 
				 if((wall_left)) begin
						Enemy_X_Motion <= 1;
						Enemy_Y_Motion <= 0;
				 end
				 
				 else if (wall_right) begin
						Enemy_X_Motion <= -1;
						Enemy_Y_Motion <= 0;
				 end
				 
				 else if (wall_up) begin
						Enemy_X_Motion <= 0;
						Enemy_Y_Motion <= -1;
				 end
				 
				 else if (wall_down) begin
						Enemy_X_Motion <= 0;
						Enemy_Y_Motion <= 1;
				 end
				 else begin
					  Enemy_Y_Motion <= Enemy_Y_Motion;  // Ball is somewhere in the middle, don't bounce, just keep moving
					  Enemy_X_Motion <= Enemy_X_Motion;
				end

             Enemy_Y_Pos <= (Enemy_Y_Pos + Enemy_Y_Motion);  // Update ball position
				 Enemy_X_Pos <= (Enemy_X_Pos + Enemy_X_Motion);
			
			end
		end
    
	

    
	

	
	assign hitsum = hit1flop;
	
	logic ld_hit1, ld_hit2, ld_hit3, ld_hit4, hit1flop, hit2flop, hit3flop, hit4flop;
	logic wall_right, wall_left, wall_up, wall_down;
	mazewalls UpperXRangeEnem(.DrawX(Enemy_X_Pos+Enemy_Size), .DrawY(Enemy_Y_Pos), .is_wall(wall_right));
	mazewalls LowerXRangeEnem(.DrawX(Enemy_X_Pos-Enemy_Size), .DrawY(Enemy_Y_Pos), .is_wall(wall_left));
	mazewalls LowerYRangeEnem(.DrawX(Enemy_X_Pos),.DrawY(Enemy_Y_Pos+Enemy_Size),.is_wall(wall_down));
	mazewalls UpperYRangeEnem(.DrawX(Enemy_X_Pos),.DrawY(Enemy_Y_Pos-Enemy_Size),.is_wall(wall_up));
	
	flipflop ffhit1(.Clk(Clk),
        .Load(ld_hit1),
        .Reset(Reset),
	    .din(hit1),
	    .dout(hit1flop));
		 
	flipflop ffhit2(.Clk(Clk),
        .Load(ld_hit2),
        .Reset(Reset),
	    .din(hit2),
	    .dout(hit2flop));
		 
	flipflop ffhit3(.Clk(Clk),
        .Load(ld_hit3),
        .Reset(Reset),
	    .din(hit3),
	    .dout(hit3flop));
	flipflop ffhit4(.Clk(Clk),
        .Load(ld_hit4),
        .Reset(Reset),
	    .din(hit4),
	    .dout(hit4flop));
	
	assign Enemy_X = Enemy_X_Pos;
	assign Enemy_Y = Enemy_Y_Pos;
	

		
endmodule

module ditches6 (input logic [9:0] Enemy_X_Center, Enemy_Y_Center, Vert, Horiz, DrawX, DrawY, BallX, BallY,
                 input Reset, frame_clk,
                 output logic [9:0] Enemy_X, Enemy_Y, EnemyS, diffenemyX, diffenemyY,
                 output enemy_on);


    parameter [9:0] Enemy_X_Min=0;       // Leftmost point on the X axis
    parameter [9:0] Enemy_X_Max=639;     // Rightmost point on the X axis
    parameter [9:0] Enemy_Y_Min=0;       // Topmost point on the Y axis
    parameter [9:0] Enemy_Y_Max=479;     // Bottommost point on the Y axis
    parameter [9:0] Enemy_X_Step=1;      // Step size on the X axis
    parameter [9:0] Enemy_Y_Step=1;      // Step size on the Y axis
    assign diffenemyX = DrawX - Enemy_X + 4;
    assign diffenemyY = DrawY - Enemy_Y + 4;
	 

    logic [9:0] Enemy_X_Pos, Enemy_X_Motion, Enemy_Y_Pos, Enemy_Y_Motion, Enemy_Size;
	 assign Enemy_Size = 10'd4;

    always_comb begin
        if((DrawX >= Enemy_X_Pos - 4 && DrawX <= Enemy_X_Pos + 4) && (DrawY >= Enemy_Y_Pos - 4 && DrawY <= Enemy_Y_Pos + 4))
            enemy_on = 1'b1;
        else 
            enemy_on = 1'b0;
            end

	always_ff @ (posedge Reset or posedge frame_clk )
    begin: Move_Enemy
        if (Reset)  // Asynchronous Reset
        begin 
            Enemy_Y_Motion <= Vert; //Enemy_Y_Step;
				Enemy_X_Motion <= Horiz; //Enemy_X_Step;
				Enemy_Y_Pos <= Enemy_Y_Center;
				Enemy_X_Pos <= Enemy_X_Center;
        end

        else 
        begin 
				 if((wall_left)) begin
						Enemy_X_Motion <= 1;
						Enemy_Y_Motion <= 0;
				 end
				 
				 else if (wall_right) begin
						Enemy_X_Motion <= -1;
						Enemy_Y_Motion <= 0;
				 end
				 
				 else if (wall_up) begin
						Enemy_X_Motion <= 0;
						Enemy_Y_Motion <= -1;
				 end
				 
				 else if (wall_down) begin
						Enemy_X_Motion <= 0;
						Enemy_Y_Motion <= 1;
				 end
				 else begin
					  Enemy_Y_Motion <= Enemy_Y_Motion;  // Ball is somewhere in the middle, don't bounce, just keep moving
					  Enemy_X_Motion <= Enemy_X_Motion;
				end

             Enemy_Y_Pos <= (Enemy_Y_Pos + Enemy_Y_Motion);  // Update ball position
				 Enemy_X_Pos <= (Enemy_X_Pos + Enemy_X_Motion);
			
			end
		end
    
	

    
	

	
	assign hitsum = hit1flop;
	
	logic ld_hit1, ld_hit2, ld_hit3, ld_hit4, hit1flop, hit2flop, hit3flop, hit4flop;
	logic wall_right, wall_left, wall_up, wall_down;
	mazewalls UpperXRangeEnem(.DrawX(Enemy_X_Pos+Enemy_Size), .DrawY(Enemy_Y_Pos), .is_wall(wall_right));
	mazewalls LowerXRangeEnem(.DrawX(Enemy_X_Pos-Enemy_Size), .DrawY(Enemy_Y_Pos), .is_wall(wall_left));
	mazewalls LowerYRangeEnem(.DrawX(Enemy_X_Pos),.DrawY(Enemy_Y_Pos+Enemy_Size),.is_wall(wall_down));
	mazewalls UpperYRangeEnem(.DrawX(Enemy_X_Pos),.DrawY(Enemy_Y_Pos-Enemy_Size),.is_wall(wall_up));
	
	flipflop ffhit1(.Clk(Clk),
        .Load(ld_hit1),
        .Reset(Reset),
	    .din(hit1),
	    .dout(hit1flop));
		 
	flipflop ffhit2(.Clk(Clk),
        .Load(ld_hit2),
        .Reset(Reset),
	    .din(hit2),
	    .dout(hit2flop));
		 
	flipflop ffhit3(.Clk(Clk),
        .Load(ld_hit3),
        .Reset(Reset),
	    .din(hit3),
	    .dout(hit3flop));
	flipflop ffhit4(.Clk(Clk),
        .Load(ld_hit4),
        .Reset(Reset),
	    .din(hit4),
	    .dout(hit4flop));
	
	assign Enemy_X = Enemy_X_Pos;
	assign Enemy_Y = Enemy_Y_Pos;
	

		
endmodule



